@implementation NSString(Path)

- (id)mk_validatePath
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "mk_isValidPath"))
  {
    v3 = 1;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKFileURLError"), v3, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if ((objc_msgSend(a1, "mk_isValidFilename") & 1) == 0)
  {
    v3 = 2;
    goto LABEL_6;
  }
  v2 = 0;
  return v2;
}

- (BOOL)mk_isValidPath
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "length") < 0x401;

  return v2;
}

- (BOOL)mk_isValidFilename
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "length") < 0x100;

  return v3;
}

@end
