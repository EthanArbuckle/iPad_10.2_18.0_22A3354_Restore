@implementation HMDManagedObjectCodingChangeDetails

- (id)changedAttributeKeys
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  if (v1)
    return v1;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)changedRelationshipKeys
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
    return v1;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addChangedRelationshipCodingKey:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (v4)
    {
      objc_msgSend(v4, "addObject:", v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

    }
    v3 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedRelationshipKeys, 0);
  objc_storeStrong((id *)&self->_changedAttributeKeys, 0);
}

@end
