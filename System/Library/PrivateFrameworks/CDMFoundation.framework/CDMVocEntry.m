@implementation CDMVocEntry

- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDMVocEntry *v12;
  CDMVocEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMVocEntry;
  v12 = -[CDMVocEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_semantic, a5);
  }

  return v13;
}

- (CDMVocEntry)initWithText:(id)a3 label:(id)a4 semantic:(id)a5 usoGraph:(id)a6 nodeIndex:(int)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CDMVocEntry *v17;
  CDMVocEntry *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CDMVocEntry;
  v17 = -[CDMVocEntry init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_text, a3);
    objc_storeStrong((id *)&v18->_label, a4);
    objc_storeStrong((id *)&v18->_semantic, a5);
    objc_storeStrong((id *)&v18->_usoGraph, a6);
    v18->_nodeIndex = a7;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Voc Entry text: %@, label: %@, semantic: %@"), self->_text, self->_label, self->_semantic);
}

- (BOOL)isEqual:(id)a3
{
  CDMVocEntry *v4;
  CDMVocEntry *v5;
  CDMVocEntry *v6;
  NSString *text;
  void *v8;
  NSString *label;
  void *v10;
  NSString *semantic;
  void *v12;
  char v13;

  v4 = (CDMVocEntry *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    text = self->_text;
    -[CDMVocEntry text](v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](text, "isEqual:", v8))
    {
      label = self->_label;
      -[CDMVocEntry label](v6, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](label, "isEqual:", v10))
      {
        semantic = self->_semantic;
        -[CDMVocEntry semantic](v6, "semantic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NSString isEqual:](semantic, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)semantic
{
  return self->_semantic;
}

- (SIRINLUEXTERNALUsoGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setUsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraph, a3);
}

- (int)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setNodeIndex:(int)a3
{
  self->_nodeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_semantic, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
