@implementation MSIdleAutosaveItem

+ (id)withAutosaveIdentifier:(id)a3 subject:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAutosaveIdentifier:subject:", v6, v7);

  return v8;
}

- (MSIdleAutosaveItem)initWithAutosaveIdentifier:(id)a3 subject:(id)a4
{
  id v7;
  id v8;
  MSIdleAutosaveItem *v9;
  MSIdleAutosaveItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSIdleAutosaveItem;
  v9 = -[MSIdleAutosaveItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autosaveIdentifier, a3);
    objc_storeStrong((id *)&v10->_subject, a4);
  }

  return v10;
}

- (MSIdleAutosaveItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MSIdleAutosaveItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autosaveID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MSIdleAutosaveItem initWithAutosaveIdentifier:subject:](self, "initWithAutosaveIdentifier:subject:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_autosaveIdentifier, CFSTR("autosaveID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("subject"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

@end
