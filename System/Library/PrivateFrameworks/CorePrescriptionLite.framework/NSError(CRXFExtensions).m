@implementation NSError(CRXFExtensions)

- (const)crxf_errorToken
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "code");
  if (v1 > 0x30)
    return CFSTR("UnknownError");
  else
    return off_250B03E28[v1];
}

+ (id)crxf_errorWithCode:()CRXFExtensions file:line:userInfo:
{
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  objc_super v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crxf_descriptionForErrorCode:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0BA0]);
  v12 = strrchr(a4, 47);
  if (v12)
    v13 = v12 + 1;
  else
    v13 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("sourceLocation"));
  v17.receiver = a1;
  v17.super_class = (Class)off_2569421F8;
  v15 = (void *)objc_msgSend(objc_msgSendSuper2(&v17, sel_alloc), "initWithDomain:code:userInfo:", CFSTR("com.apple.CorePrescription"), a3, v10);

  return v15;
}

+ (const)crxf_descriptionForErrorCode:()CRXFExtensions
{
  if (a3 > 0x30)
    return CFSTR("Unknown error");
  else
    return off_250B03FB0[a3];
}

@end
