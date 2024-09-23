@implementation NSMutableData

- (void)appendType:(unsigned __int16)a3 length:(uint64_t)a4 value:
{
  void *v5;
  unsigned __int16 v6;
  char v7;

  v7 = a2;
  v6 = a3;
  if (result)
  {
    v5 = result;
    objc_msgSend(result, "appendBytes:length:", &v7, 1);
    objc_msgSend(v5, "appendBytes:length:", &v6, 2);
    return (void *)objc_msgSend(v5, "appendBytes:length:", a4, v6);
  }
  return result;
}

- (void)enumerateTLVsUsingBlock:(void *)a1
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t (**v11)(id, uint64_t, uint64_t, uint64_t);

  v11 = a2;
  if (a1)
  {
    v3 = 0;
    do
    {
      if (v3 + 3 > (unint64_t)objc_msgSend(a1, "length"))
        break;
      v4 = objc_retainAutorelease(a1);
      v5 = *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3);
      v6 = objc_retainAutorelease(v4);
      v7 = *(unsigned __int16 *)(objc_msgSend(v6, "bytes") + v3 + 1);
      v8 = objc_retainAutorelease(v6);
      v9 = objc_msgSend(v8, "bytes");
      if (v3 + 3 + v7 > (unint64_t)objc_msgSend(v8, "length"))
        break;
      v10 = v11[2](v11, v5, v7, v9 + v3 + 3);
      v3 += 3 + v7;
    }
    while ((v10 & 1) != 0);
  }

}

@end
