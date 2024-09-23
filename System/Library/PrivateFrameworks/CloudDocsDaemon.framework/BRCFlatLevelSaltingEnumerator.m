@implementation BRCFlatLevelSaltingEnumerator

+ (id)newEnumeratorForItemID:(id)a3 clientZone:(id)a4
{
  id v5;
  id v6;
  BRCFlatLevelSaltingEnumerator *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BRCFlatLevelSaltingEnumerator initWithItemID:clientZone:]([BRCFlatLevelSaltingEnumerator alloc], "initWithItemID:clientZone:", v6, v5);

  return v7;
}

- (BRCFlatLevelSaltingEnumerator)initWithItemID:(id)a3 clientZone:(id)a4
{
  id v7;
  id v8;
  BRCFlatLevelSaltingEnumerator *v9;
  BRCFlatLevelSaltingEnumerator *v10;
  uint64_t v11;
  PQLEnumeration *enumerator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCFlatLevelSaltingEnumerator;
  v9 = -[BRCFlatLevelSaltingEnumerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemID, a3);
    objc_msgSend(v8, "directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    enumerator = v10->_enumerator;
    v10->_enumerator = (PQLEnumeration *)v11;

  }
  return v10;
}

- (id)nextObject
{
  void *v3;
  PQLEnumeration *enumerator;

  -[PQLEnumeration nextObject](self->_enumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PQLEnumeration close](self->_enumerator, "close");
    enumerator = self->_enumerator;
    self->_enumerator = 0;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PQLEnumeration close](self->_enumerator, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCFlatLevelSaltingEnumerator;
  -[BRCFlatLevelSaltingEnumerator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
