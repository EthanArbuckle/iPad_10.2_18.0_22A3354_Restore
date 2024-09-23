@implementation DMFControlGroupIdentifier(CRKASMAdditions)

+ (id)crk_identifierWithOpaqueString:()CRKASMAdditions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "crk_UUIDWithOpaqueString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "crk_groupIDWithOpaqueString:", v5);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOrganizationUUID:groupID:", v6, v7);
  return v8;
}

+ (uint64_t)crk_groupIDWithOpaqueString:()CRKASMAdditions
{
  id v3;
  unint64_t v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    v5 = 0;
    do
      v5 += objc_msgSend(v3, "characterAtIndex:", v4++);
    while (v4 < objc_msgSend(v3, "length"));
  }
  else
  {
    LOWORD(v5) = 0;
  }

  return (unsigned __int16)v5;
}

@end
