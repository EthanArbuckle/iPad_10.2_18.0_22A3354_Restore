@implementation ARObjectAnchor

- (ARObjectAnchor)initWithReferenceObject:(double)a3 transform:(double)a4
{
  id v9;
  void *v10;
  ARObjectAnchor *v11;
  objc_super v17;

  v9 = a7;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = a1;
  v17.super_class = (Class)ARObjectAnchor;
  v11 = -[ARAnchor initWithIdentifier:transform:](&v17, sel_initWithIdentifier_transform_, v10, a2, a3, a4, a5);

  if (v11)
    objc_storeStrong((id *)&v11->_referenceObject, a7);

  return v11;
}

- (id)name
{
  void *v2;
  void *v3;

  -[ARObjectAnchor referenceObject](self, "referenceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARObjectAnchor;
  -[ARAnchor description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithString:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[ARObjectAnchor referenceObject](self, "referenceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" reference object= %@"), v8);

    objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (ARObjectAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARObjectAnchor *v5;
  uint64_t v6;
  ARReferenceObject *referenceObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARObjectAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v9, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "referenceObject");
    v6 = objc_claimAutoreleasedReturnValue();
    referenceObject = v5->_referenceObject;
    v5->_referenceObject = (ARReferenceObject *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARObjectAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ARObjectAnchor referenceObject](self, "referenceObject", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referenceObject"));

}

- (ARObjectAnchor)initWithCoder:(id)a3
{
  id v4;
  ARObjectAnchor *v5;
  uint64_t v6;
  ARReferenceObject *referenceObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARObjectAnchor;
  v5 = -[ARAnchor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceObject = v5->_referenceObject;
    v5->_referenceObject = (ARReferenceObject *)v6;

  }
  return v5;
}

- (ARReferenceObject)referenceObject
{
  return self->_referenceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceObject, 0);
}

@end
