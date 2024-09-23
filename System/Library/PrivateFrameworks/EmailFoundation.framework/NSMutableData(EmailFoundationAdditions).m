@implementation NSMutableData(EmailFoundationAdditions)

- (uint64_t)ef_deleteBytesInRange:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", a3, a4, 0, 0);
}

- (void)ef_deleteBytesInData:()EmailFoundationAdditions beforeOccurrencesOfData:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (v7)
  {
    v8 = 0;
    v9 = v7 - 1;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "subdataWithRange:", v9, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "ef_containsData:", v11) & 1) != 0)
        {
          ++v8;
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(a1, "ef_deleteBytesInRange:", v9 + 1, v8);

        v8 = 0;
      }
      v12 = objc_msgSend(v6, "length");
      if (v9 + v12 <= (unint64_t)objc_msgSend(a1, "length"))
      {
        objc_msgSend(a1, "subdataWithRange:", v9, objc_msgSend(v6, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToData:", v6))
          v10 = v9;
        else
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
      v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
      --v9;
    }
    while (v9 != -1);
  }

}

- (void)ef_replaceContiguousSequencesOfBytesInData:()EmailFoundationAdditions withData:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = v7 - 1;
      objc_msgSend(a1, "subdataWithRange:", v7 - 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "ef_containsData:", v10))
      {
        ++v8;
        if (v7 == 1)
        {
          v12 = objc_retainAutorelease(v6);
          objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", 0, v8, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));

          break;
        }
      }
      else if (v8)
      {
        v11 = objc_retainAutorelease(v6);
        objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", v7, v8, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
        v8 = 0;
      }

      --v7;
    }
    while (v9);
  }

}

@end
