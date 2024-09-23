@implementation MGGroupIdentifier(MGRemoteQueryCoding)

- (id)rq_coded
{
  void *v1;
  void *v2;
  void *v3;

  MGGroupIdentifierCopyApplyingHashing(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "normalized");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rq_coded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "rq_instanceFromCoded:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1
      && (objc_msgSend(v1, "scheme"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "length"),
          v3,
          v4))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64B98]), "initWithURLComponents:", v2);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
