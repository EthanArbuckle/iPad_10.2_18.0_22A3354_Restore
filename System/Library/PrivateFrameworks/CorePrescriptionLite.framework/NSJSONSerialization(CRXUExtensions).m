@implementation NSJSONSerialization(CRXUExtensions)

+ (id)crxu_stringWithJSONObject:()CRXUExtensions error:
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (v6)
    *a4 = objc_retainAutorelease(v6);
LABEL_7:

  return v7;
}

+ (id)crxu_JSONObjectWithString:()CRXUExtensions error:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 1, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v7;
    if (a4 && v7)
      *a4 = objc_retainAutorelease(v7);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
