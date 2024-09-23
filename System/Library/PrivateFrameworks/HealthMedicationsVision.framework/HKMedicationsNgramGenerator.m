@implementation HKMedicationsNgramGenerator

+ (id)tokensFrom:(id)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5
{
  id v9;
  void *v10;
  id v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  void *v18;
  void *v20;

  v9 = a3;
  if (a5 < a4 || a4 < 1 || a5 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicationsNgramGenerator.m"), 22, CFSTR("invalid inputs: %ld < %ld"), a5, a4);

  }
  objc_msgSend(v9, "normalizeForType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (a5 >= a4)
  {
    v12 = 1 - a4;
    do
    {
      v13 = objc_msgSend(v10, "length");
      if (v13 >= a4)
      {
        v14 = 0;
        v15 = v13 + v12;
        do
        {
          objc_msgSend(v10, "substringWithRange:", v14, a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v16);

          ++v14;
        }
        while (v15 != v14);
      }
      --v12;
    }
    while (a4++ != a5);
  }
  objc_msgSend(v11, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
