@implementation MAKGDomainConversion

+ (id)kgLabelForMADomain:(unsigned __int16)a3
{
  void *v3;

  if ((unsigned __int16)(a3 + 1) >= 2u)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s%d"), "domain_", a3);
  else
    v3 = 0;
  return v3;
}

+ (unsigned)maDomainForKGLabel:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int16 v5;
  const char *v6;
  int v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
  if ((unint64_t)(v4 - 33) >= 0xFFFFFFFFFFFFFFE7)
  {
    v6 = (char *)v9 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0);
    if (objc_msgSend(v3, "getCString:maxLength:encoding:", v6, v4 + 1, 4)
      && !strncmp(v6, "domain_", 7uLL))
    {
      v8 = atoi(v6 + 7);
      if ((v8 - 0x10000) < 0xFFFF0001)
        v5 = -1;
      else
        v5 = v8;
    }
    else
    {
      v5 = -1;
    }
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

@end
