@implementation NSDictionary

void __48__NSDictionary_IAMSubset__isSubsetOfDictionary___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;

  v12 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isNSDictionary") && objc_msgSend(v8, "isNSDictionary"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isSubsetOfDictionary:", v9);
LABEL_4:
    v11 = v10;

    if ((v11 & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "isNSNumber"))
    goto LABEL_12;
  if (objc_msgSend(v7, "isNSString"))
  {
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v7, "isNSNumber") & 1) == 0)
      {

        goto LABEL_16;
      }
      v10 = objc_msgSend(v7, "isEqual:", v8);
      goto LABEL_4;
    }

LABEL_15:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_16;
  }
  if ((objc_msgSend(v7, "isNSNumber") & 1) != 0)
  {
LABEL_12:
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_16:

}

@end
