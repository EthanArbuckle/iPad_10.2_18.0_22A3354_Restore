@implementation WFProcessedContacts

- (WFProcessedContacts)initWithEntries:(id)a3
{
  return -[WFProcessedContacts initWithEntries:attributionSet:communicationMethod:](self, "initWithEntries:attributionSet:communicationMethod:", a3, 0, 0);
}

- (WFProcessedContacts)initWithEntries:(id)a3 attributionSet:(id)a4 communicationMethod:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFProcessedContacts *v12;
  void *v13;
  uint64_t v14;
  NSArray *entries;
  WFProcessedContacts *v16;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFProcessedContacts.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entries"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFProcessedContacts;
  v12 = -[WFProcessedContacts init](&v19, sel_init);
  if (v12)
  {
    if (!v10)
    {
      objc_msgSend(v9, "if_compactMap:", &__block_literal_global_1658);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v13);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    v14 = objc_msgSend(v9, "copy");
    entries = v12->_entries;
    v12->_entries = (NSArray *)v14;

    objc_storeStrong((id *)&v12->_attributionSet, v10);
    objc_storeStrong((id *)&v12->_communicationMethod, a5);
    v16 = v12;
  }

  return v12;
}

- (WFProcessedContacts)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFProcessedContacts *v11;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("entries"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("communicationMethod"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFProcessedContacts initWithEntries:attributionSet:communicationMethod:](self, "initWithEntries:attributionSet:communicationMethod:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFProcessedContacts entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entries"));

  -[WFProcessedContacts attributionSet](self, "attributionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("attributionSet"));

  -[WFProcessedContacts communicationMethod](self, "communicationMethod");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("communicationMethod"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFProcessedContacts entries](self, "entries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFProcessedContacts attributionSet](self, "attributionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFProcessedContacts communicationMethod](self, "communicationMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFProcessedContacts *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (WFProcessedContacts *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFProcessedContacts entries](v4, "entries");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProcessedContacts entries](self, "entries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqualToArray:", v6))
      {
        LOBYTE(v12) = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[WFProcessedContacts attributionSet](v4, "attributionSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProcessedContacts attributionSet](self, "attributionSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        LOBYTE(v12) = 0;
        v13 = v10;
        v14 = v9;
        if (!v9 || !v10)
        {
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if (!v12)
          goto LABEL_20;
      }
      -[WFProcessedContacts communicationMethod](v4, "communicationMethod");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFProcessedContacts communicationMethod](self, "communicationMethod");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      v17 = v16;
      v13 = v17;
      if (v14 == v17)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        LOBYTE(v12) = 0;
        if (v14 && v17)
          LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
      }

      goto LABEL_19;
    }
    LOBYTE(v12) = 0;
  }
LABEL_22:

  return v12;
}

- (NSArray)entries
{
  return self->_entries;
}

- (WFContentAttributionSet)attributionSet
{
  return self->_attributionSet;
}

- (WFCommunicationMethod)communicationMethod
{
  return self->_communicationMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationMethod, 0);
  objc_storeStrong((id *)&self->_attributionSet, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

id __74__WFProcessedContacts_initWithEntries_attributionSet_communicationMethod___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionSetWithCachingIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)contentCollection
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFProcessedContacts entries](self, "entries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__WFProcessedContacts_ContentCollection__contentCollection__block_invoke;
  v7[3] = &unk_24C4DC0A8;
  v7[4] = self;
  objc_msgSend(v3, "if_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__WFProcessedContacts_ContentCollection__contentCollection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attributionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "attributionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "attributionSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(*(id *)(a1 + 32), "attributionSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAttributionSet:", v9);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "attributionSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAttributionSet:", v10);

    }
  }
  return v3;
}

@end
