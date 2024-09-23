@implementation CRPBSerialization

+ (id)cardForData:(id)a3 messageName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("searchfoundation.Card")))
  {
    objc_msgSend(MEMORY[0x24BE84F20], "cardWithProto2Data:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCardId:", v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)originalDataForCard:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE850A0]), "initWithFacade:", v3);
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
