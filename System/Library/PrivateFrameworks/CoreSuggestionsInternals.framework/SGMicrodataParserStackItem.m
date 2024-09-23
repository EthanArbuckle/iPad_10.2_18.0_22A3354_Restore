@implementation SGMicrodataParserStackItem

- (SGMicrodataParserStackItem)initWithDocument:(id)a3
{
  id v5;
  SGMicrodataParserStackItem *v6;
  SGMicrodataParserStackItem *v7;
  SGMicrodataParserStackItem *parent;
  NSArray *textConsumers;
  NSArray *v10;
  NSArray *itemScopes;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGMicrodataParserStackItem;
  v6 = -[SGMicrodataParserStackItem init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    parent = v7->_parent;
    v7->_parent = 0;

    textConsumers = v7->_textConsumers;
    v10 = (NSArray *)MEMORY[0x1E0C9AA60];
    v7->_textConsumers = (NSArray *)MEMORY[0x1E0C9AA60];

    itemScopes = v7->_itemScopes;
    v7->_itemScopes = v10;

  }
  return v7;
}

- (SGMicrodataParserStackItem)initWithParent:(id)a3 item:(id)a4 htmlId:(id)a5 textConsumer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SGMicrodataParserStackItem *v15;
  uint64_t v16;
  SGMicrodataDocument *document;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  NSArray *v24;
  NSArray *itemScopes;
  uint64_t v26;
  NSArray *v27;
  uint64_t v28;
  NSArray *v29;
  NSArray *v30;
  uint64_t v31;
  NSArray *textConsumers;
  NSArray *v33;
  NSArray *v35;
  objc_super v36;
  id v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)SGMicrodataParserStackItem;
  v15 = -[SGMicrodataParserStackItem init](&v36, sel_init);
  if (!v15)
    goto LABEL_16;
  objc_msgSend(v11, "document");
  v16 = objc_claimAutoreleasedReturnValue();
  document = v15->_document;
  v15->_document = (SGMicrodataDocument *)v16;

  objc_storeStrong((id *)&v15->_parent, a3);
  if (v13
    && (-[SGMicrodataDocument htmlIds](v15->_document, "htmlIds"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "objectForKeyedSubscript:", v13),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    v20 = (void *)objc_opt_new();
    -[SGMicrodataDocument setHtmlIdItemScope:forHtmlId:](v15->_document, "setHtmlIdItemScope:forHtmlId:", v20, v13);
    if (v12)
      goto LABEL_5;
  }
  else
  {
    v20 = 0;
    if (v12)
    {
LABEL_5:
      if (v20)
      {
        v38[0] = v12;
        v38[1] = v20;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = (id *)v38;
        v23 = 2;
      }
      else
      {
        v37 = v12;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = &v37;
        v23 = 1;
      }
      objc_msgSend(v21, "arrayWithObjects:count:", v22, v23);
      v28 = objc_claimAutoreleasedReturnValue();
      itemScopes = v15->_itemScopes;
      v15->_itemScopes = (NSArray *)v28;
      goto LABEL_12;
    }
  }
  objc_msgSend(v11, "itemScopes");
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  itemScopes = v24;
  if (v20)
  {
    -[NSArray arrayByAddingObject:](v24, "arrayByAddingObject:", v20);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v15->_itemScopes;
    v15->_itemScopes = (NSArray *)v26;

  }
  else
  {
    v35 = v15->_itemScopes;
    v15->_itemScopes = v24;
    itemScopes = v35;
  }
LABEL_12:

  objc_msgSend(v11, "textConsumers");
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v14)
  {
    -[NSArray arrayByAddingObject:](v29, "arrayByAddingObject:", v14);
    v31 = objc_claimAutoreleasedReturnValue();
    textConsumers = v15->_textConsumers;
    v15->_textConsumers = (NSArray *)v31;

  }
  else
  {
    v33 = v15->_textConsumers;
    v15->_textConsumers = v29;
    v30 = v33;
  }

LABEL_16:
  return v15;
}

- (SGMicrodataDocument)document
{
  return (SGMicrodataDocument *)objc_getProperty(self, a2, 8, 1);
}

- (SGMicrodataParserStackItem)parent
{
  return (SGMicrodataParserStackItem *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)textConsumers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)itemScopes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemScopes, 0);
  objc_storeStrong((id *)&self->_textConsumers, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
