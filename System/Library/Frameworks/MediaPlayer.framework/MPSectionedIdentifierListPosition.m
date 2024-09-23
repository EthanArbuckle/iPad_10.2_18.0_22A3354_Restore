@implementation MPSectionedIdentifierListPosition

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

+ (id)positionForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = -[MPSectionedIdentifierListPosition _init]([MPSectionedIdentifierListPosition alloc], "_init");
  v7[3] = 3;
  v8 = (void *)v7[1];
  v7[1] = v6;
  v9 = v6;

  v10 = (void *)v7[2];
  v7[2] = v5;

  return v7;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPSectionedIdentifierListPosition;
  return -[MPSectionedIdentifierListPosition init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  MPSectionedIdentifierListPosition *v4;
  MPSectionedIdentifierListPosition *v5;
  MPSectionedIdentifierListPosition *v6;
  NSString *sectionIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  NSString *itemIdentifier;
  NSString *v14;
  NSString *v15;
  NSString *v16;

  v4 = (MPSectionedIdentifierListPosition *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_entryType == v5->_entryType)
      {
        sectionIdentifier = self->_sectionIdentifier;
        v8 = v5->_sectionIdentifier;
        if (sectionIdentifier == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = sectionIdentifier;
          v11 = -[NSString isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_6;
        }
        itemIdentifier = self->_itemIdentifier;
        v14 = v6->_itemIdentifier;
        v15 = itemIdentifier;
        v16 = v15;
        if (v15 == v14)
          v12 = 1;
        else
          v12 = -[NSString isEqual:](v15, "isEqual:", v14);

        goto LABEL_14;
      }
LABEL_6:
      v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t entryType;
  void *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  entryType = self->_entryType;
  switch(entryType)
  {
    case 2:
      objc_msgSend(v3, "appendFormat:", CFSTR("Head: %@"), self->_sectionIdentifier, v8);
      break;
    case 4:
      objc_msgSend(v3, "appendFormat:", CFSTR("Tail: %@"), self->_sectionIdentifier, v8);
      break;
    case 3:
      objc_msgSend(v3, "appendFormat:", CFSTR("Item: %@ - %@"), self->_sectionIdentifier, self->_itemIdentifier);
      break;
  }
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (unint64_t)hash
{
  int64_t entryType;
  NSUInteger v4;

  entryType = self->_entryType;
  v4 = -[NSString hash](self->_sectionIdentifier, "hash") ^ entryType;
  return v4 ^ -[NSString hash](self->_itemIdentifier, "hash");
}

- (MPSectionedIdentifierListPosition)initWithCoder:(id)a3
{
  id v4;
  MPSectionedIdentifierListPosition *v5;
  uint64_t v6;
  NSString *sectionIdentifier;
  uint64_t v8;
  NSString *itemIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSectionedIdentifierListPosition;
  v5 = -[MPSectionedIdentifierListPosition init](&v11, sel_init);
  if (v5)
  {
    v5->_entryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iid"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t entryType;
  id v5;

  entryType = self->_entryType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", entryType, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionIdentifier, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("iid"));

}

+ (id)positionForHeadOfSection:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = -[MPSectionedIdentifierListPosition _init]([MPSectionedIdentifierListPosition alloc], "_init");
  v4[3] = 2;
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)positionForTailOfSection:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = -[MPSectionedIdentifierListPosition _init]([MPSectionedIdentifierListPosition alloc], "_init");
  v4[3] = 4;
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
