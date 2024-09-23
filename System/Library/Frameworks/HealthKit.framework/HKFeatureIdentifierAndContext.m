@implementation HKFeatureIdentifierAndContext

- (HKFeatureIdentifierAndContext)initWithFeatureIdentifier:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  HKFeatureIdentifierAndContext *v9;
  HKFeatureIdentifierAndContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureIdentifierAndContext;
  v9 = -[HKFeatureIdentifierAndContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", v5[1]))
      v6 = -[NSString isEqualToString:](self->_context, "isEqualToString:", v5[2]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_featureIdentifier, "hash");
  return -[NSString hash](self->_context, "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@, %@)"), self->_featureIdentifier, self->_context);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
