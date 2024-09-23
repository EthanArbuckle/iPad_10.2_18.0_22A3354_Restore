@implementation ASFAsn1OSToken

- (_QWORD)stringValue
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  id v6;
  void *v7;
  id Property;

  if (a1)
  {
    v1 = a1;
    v2 = a1[4];
    if (!v2)
      goto LABEL_7;
    v3 = *(_QWORD *)(v2 + 16);
    switch(v3)
    {
      case 22:
        v4 = 1;
        break;
      case 12:
        v4 = 4;
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), *(_QWORD *)(v2 + 32));
        a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        return a1;
      default:
LABEL_7:
        a1 = 0;
        return a1;
    }
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    v7 = (void *)v1[4];
    if (v7)
      Property = objc_getProperty(v7, v5, 24, 1);
    else
      Property = 0;
    a1 = (_QWORD *)objc_msgSend(v6, "initWithData:encoding:", Property, v4);
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mValue, 0);
}

@end
