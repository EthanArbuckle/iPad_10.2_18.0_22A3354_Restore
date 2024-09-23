@implementation LNPhotoItemCollection

- (LNPhotoItemCollection)initWithItems:(id)a3
{
  id v6;
  LNPhotoItemCollection *v7;
  LNPhotoItemCollection *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPhotoItemCollection.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  }
  v11.receiver = self;
  v11.super_class = (Class)LNPhotoItemCollection;
  v7 = -[LNPhotoItemCollection init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_items, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNPhotoItemCollection *v4;
  LNPhotoItemCollection *v5;
  LNPhotoItemCollection *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNPhotoItemCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNPhotoItemCollection items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNPhotoItemCollection items](v6, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToArray:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (LNPhotoItemCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNPhotoItemCollection *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNPhotoItemCollection initWithItems:](self, "initWithItems:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNPhotoItemCollection items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("items"));

}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
