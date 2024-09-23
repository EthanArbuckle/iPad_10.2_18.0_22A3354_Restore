@implementation CNUnifiedComposeRecipient

- (CNUnifiedComposeRecipient)initWithChildren:(id)a3 defaultChild:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  CNUnifiedComposeRecipient *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v9, "inputAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)CNUnifiedComposeRecipient;
  v13 = -[CNComposeRecipient initWithContact:address:kind:](&v25, sel_initWithContact_address_kind_, 0, v12, objc_msgSend(v9, "kind"));

  if (v13)
  {
    objc_msgSend(v11, "autocompleteResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setAutocompleteResult:](v13, "setAutocompleteResult:", v14);
    objc_msgSend(v11, "displayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setDisplayString:](v13, "setDisplayString:", v15);

    objc_msgSend(v11, "nameComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setNameComponents:](v13, "setNameComponents:", v16);

    objc_msgSend(v14, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setValueIdentifier:](v13, "setValueIdentifier:", v18);

    objc_msgSend(v14, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setUnlocalizedLabel:](v13, "setUnlocalizedLabel:", v20);

    objc_msgSend(v14, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v14, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient setContactIdentifier:](v13, "setContactIdentifier:", v22);

    }
    objc_msgSend(v11, "originContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient setOriginContext:](v13, "setOriginContext:", v23);

    objc_storeStrong((id *)&v13->_children, a3);
    -[CNComposeRecipient setIsMemberOfGroup:](v13, "setIsMemberOfGroup:", objc_msgSend(v11, "isMemberOfGroup"));

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUnifiedComposeRecipient children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToArray:", v7))
    {
      v10.receiver = self;
      v10.super_class = (Class)CNUnifiedComposeRecipient;
      v8 = -[CNComposeRecipient isEqual:](&v10, sel_isEqual_, v5);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)children
{
  return self->_children;
}

- (BOOL)showsChevronButton
{
  void *v2;
  BOOL v3;

  -[CNUnifiedComposeRecipient children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
