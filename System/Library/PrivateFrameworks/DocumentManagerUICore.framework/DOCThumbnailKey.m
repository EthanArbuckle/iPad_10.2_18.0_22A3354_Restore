@implementation DOCThumbnailKey

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[DOCNodeThumbnailIdentifier hash](self->_primaryKey, "hash");
  return -[DOCThumbnailDescriptor hash](self->_descriptor, "hash") + v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_primaryKey, 0);
}

- (BOOL)isEqual:(id)a3
{
  DOCThumbnailKey *v4;
  DOCNodeThumbnailIdentifier *primaryKey;
  DOCThumbnailDescriptor *descriptor;
  char v7;

  v4 = (DOCThumbnailKey *)a3;
  if (self == v4)
    goto LABEL_7;
  if (!-[DOCThumbnailKey isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (primaryKey = self->_primaryKey, primaryKey != v4->_primaryKey)
    && !-[DOCNodeThumbnailIdentifier isEqual:](primaryKey, "isEqual:"))
  {
    v7 = 0;
    goto LABEL_9;
  }
  descriptor = self->_descriptor;
  if (descriptor == v4->_descriptor)
LABEL_7:
    v7 = 1;
  else
    v7 = -[DOCThumbnailDescriptor isEqual:](descriptor, "isEqual:");
LABEL_9:

  return v7;
}

- (DOCThumbnailKey)initWithPrimaryKey:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  DOCThumbnailKey *v9;
  DOCThumbnailKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailKey;
  v9 = -[DOCThumbnailKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primaryKey, a3);
    objc_storeStrong((id *)&v10->_descriptor, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCThumbnailKey *v5;
  void *v6;
  void *v7;
  DOCThumbnailKey *v8;

  v5 = +[DOCThumbnailKey allocWithZone:](DOCThumbnailKey, "allocWithZone:");
  -[DOCThumbnailKey primaryKey](self, "primaryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[DOCThumbnailKey initWithPrimaryKey:descriptor:](v5, "initWithPrimaryKey:descriptor:", v7, self->_descriptor);

  return v8;
}

- (DOCNodeThumbnailIdentifier)primaryKey
{
  return self->_primaryKey;
}

- (DOCThumbnailDescriptor)descriptor
{
  return self->_descriptor;
}

@end
