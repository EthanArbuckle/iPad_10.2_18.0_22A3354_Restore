@implementation INCustomObject

- (id)_initWithCodableDescription:(id)a3
{
  id v4;
  INCustomObject *v5;
  INCodable *v6;
  INCodable *backingStore;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCustomObject;
  v5 = -[INObject initWithIdentifier:displayString:](&v9, sel_initWithIdentifier_displayString_, 0, &stru_1E2295770);
  if (v5)
  {
    v6 = -[INCodable initWithCodableDescription:data:]([INCodable alloc], "initWithCodableDescription:data:", v4, 0);
    backingStore = v5->_backingStore;
    v5->_backingStore = v6;

  }
  return v5;
}

- (INCustomObject)initWithObject:(id)a3 codableDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  INCustomObject *v11;
  INCodable *v12;
  INCodable *backingStore;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pronunciationHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)INCustomObject;
  v11 = -[INObject initWithIdentifier:displayString:pronunciationHint:](&v17, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  if (v11)
  {
    v12 = -[INCodable initWithCodableDescription:data:]([INCodable alloc], "initWithCodableDescription:data:", v7, 0);
    backingStore = v11->_backingStore;
    v11->_backingStore = v12;

    objc_msgSend(v6, "subtitleString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INObject setSubtitleString:](v11, "setSubtitleString:", v14);

    objc_msgSend(v6, "displayImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INObject setDisplayImage:](v11, "setDisplayImage:", v15);

  }
  return v11;
}

- (INCustomObject)initWithIntent:(id)a3 parameterName:(id)a4 reference:(id)a5
{
  id v7;
  id v8;
  INObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  INCustomObject *v15;

  v7 = a4;
  v8 = a3;
  v9 = -[INObject initWithIdentifier:displayString:]([INObject alloc], "initWithIdentifier:displayString:", 0, &stru_1E2295770);
  objc_msgSend(v8, "_codableDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributeByName:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "codableDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INCustomObject initWithObject:codableDescription:](self, "initWithObject:codableDescription:", v9, v14);
  return v15;
}

- (INCodableDescription)codableDescription
{
  return -[INCodable _objectDescription](self->_backingStore, "_objectDescription");
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  -[INCodable setValue:forPropertyNamed:](self->_backingStore, "setValue:forPropertyNamed:", a3, a4);
  return 1;
}

- (id)valueForProperty:(id)a3
{
  return -[INCodable valueForPropertyNamed:](self->_backingStore, "valueForPropertyNamed:", a3);
}

- (BOOL)_isValidKey:(id)a3
{
  return -[INCodable isValidKey:](self->_backingStore, "isValidKey:", a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCustomObject;
  v3 = -[INObject hash](&v5, sel_hash);
  return -[INCodable hash](self->_backingStore, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  INCodable *backingStore;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCustomObject;
  if (-[INObject isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    backingStore = self->_backingStore;
    if (!backingStore)
    {
      objc_msgSend(v4, "_backingStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v8 = 1;
        goto LABEL_8;
      }
      backingStore = self->_backingStore;
    }
    objc_msgSend(v4, "_backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[INCodable isEqual:](backingStore, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (INCustomObject)initWithCoder:(id)a3
{
  id v4;
  INCustomObject *v5;
  uint64_t v6;
  INCodable *backingStore;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCustomObject;
  v5 = -[INObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
    v6 = objc_claimAutoreleasedReturnValue();
    backingStore = v5->_backingStore;
    v5->_backingStore = (INCodable *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCustomObject;
  v4 = a3;
  -[INObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_backingStore, CFSTR("_backingStore"), v5.receiver, v5.super_class);

}

- (INCodable)_backingStore
{
  return self->_backingStore;
}

- (void)_setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
