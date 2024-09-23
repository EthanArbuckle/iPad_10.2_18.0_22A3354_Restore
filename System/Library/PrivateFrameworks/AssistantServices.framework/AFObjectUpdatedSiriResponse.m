@implementation AFObjectUpdatedSiriResponse

- (id)_initWithRequest:(id)a3 objectIdentifier:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFObjectUpdatedSiriResponse;
  v7 = -[AFSiriResponse _initWithRequest:](&v11, sel__initWithRequest_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[2];
    v7[2] = v8;

  }
  return v7;
}

- (id)_objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFObjectUpdatedSiriResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectIdentifier, CFSTR("ObjectUpdatedResponseObjectIdentifier"), v5.receiver, v5.super_class);

}

- (AFObjectUpdatedSiriResponse)initWithCoder:(id)a3
{
  id v4;
  AFObjectUpdatedSiriResponse *v5;
  void *v6;
  uint64_t v7;
  NSURL *objectIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFObjectUpdatedSiriResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObjectUpdatedResponseObjectIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSURL *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
