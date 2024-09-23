@implementation _HKObjectTypeAnchor

- (_HKObjectTypeAnchor)initWithAnchors:(id)a3 databaseIdentifier:(id)a4
{
  id v6;
  id v7;
  _HKObjectTypeAnchor *v8;
  uint64_t v9;
  NSUUID *databaseIdentifier;
  uint64_t v11;
  NSDictionary *anchors;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKObjectTypeAnchor;
  v8 = -[_HKObjectTypeAnchor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    databaseIdentifier = v8->_databaseIdentifier;
    v8->_databaseIdentifier = (NSUUID *)v9;

    v11 = objc_msgSend(v6, "copy");
    anchors = v8->_anchors;
    v8->_anchors = (NSDictionary *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *anchors;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSUUID isEqual:](self->_databaseIdentifier, "isEqual:", v4[1]))
  {
    anchors = self->_anchors;
    objc_msgSend(v4, "anchors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSDictionary isEqualToDictionary:](anchors, "isEqualToDictionary:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_databaseIdentifier, "hash");
  return -[NSDictionary hash](self->_anchors, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKObjectTypeAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _HKObjectTypeAnchor *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("anchors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[_HKObjectTypeAnchor initWithAnchors:databaseIdentifier:](self, "initWithAnchors:databaseIdentifier:", v9, v5);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *databaseIdentifier;
  id v5;

  databaseIdentifier = self->_databaseIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", databaseIdentifier, CFSTR("dbi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchors, CFSTR("anchors"));

}

- (NSDictionary)anchors
{
  return self->_anchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

@end
