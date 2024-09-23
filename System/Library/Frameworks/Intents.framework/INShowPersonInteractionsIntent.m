@implementation INShowPersonInteractionsIntent

- (INShowPersonInteractionsIntent)initWithPerson:(id)a3 focusItemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  INShowPersonInteractionsIntent *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)INShowPersonInteractionsIntent;
  v10 = -[INIntent initWithIdentifier:backingStore:](&v12, sel_initWithIdentifier_backingStore_, v9, 0);

  if (v10)
  {
    -[INShowPersonInteractionsIntent setPerson:](v10, "setPerson:", v6);
    -[INShowPersonInteractionsIntent setFocusItemIdentifier:](v10, "setFocusItemIdentifier:", v7);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INShowPersonInteractionsIntent;
  v4 = -[INIntent copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INShowPersonInteractionsIntent person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerson:", v5);

  -[INShowPersonInteractionsIntent focusItemIdentifier](self, "focusItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFocusItemIdentifier:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INShowPersonInteractionsIntent;
  v4 = a3;
  -[INIntent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_person, CFSTR("person"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusItemIdentifier, CFSTR("focusItemIdentifier"));

}

- (INShowPersonInteractionsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INShowPersonInteractionsIntent *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("person"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusItemIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INShowPersonInteractionsIntent initWithPerson:focusItemIdentifier:](self, "initWithPerson:focusItemIdentifier:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent setIdentifier:](v7, "setIdentifier:", v8);

  }
  return v7;
}

- (INPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)focusItemIdentifier
{
  return self->_focusItemIdentifier;
}

- (void)setFocusItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusItemIdentifier, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
