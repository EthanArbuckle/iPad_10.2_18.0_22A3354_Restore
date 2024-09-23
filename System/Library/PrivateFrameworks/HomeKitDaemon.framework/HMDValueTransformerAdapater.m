@implementation HMDValueTransformerAdapater

- (HMDValueTransformerAdapater)initWithTransformer:(id)a3
{
  id v5;
  HMDValueTransformerAdapater *v6;
  HMDValueTransformerAdapater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDValueTransformerAdapater;
  v6 = -[HMDValueTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transformer, a3);

  return v7;
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  char isKindOfClass;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDValueTransformerAdapater;
  if (-[HMDValueTransformer isKindOfTransformer:](&v5, sel_isKindOfTransformer_))
    isKindOfClass = 1;
  else
    isKindOfClass = objc_opt_isKindOfClass();
  return isKindOfClass & 1;
}

- (id)transformedValue:(id)a3
{
  return -[NSValueTransformer transformedValue:](self->_transformer, "transformedValue:", a3);
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[HMDValueTransformerAdapater transformedValue:](self, "transformedValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  return -[NSValueTransformer reverseTransformedValue:](self->_transformer, "reverseTransformedValue:", a3);
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[HMDValueTransformerAdapater reverseTransformedValue:](self, "reverseTransformedValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
}

+ (Class)valueClass
{
  classMethodNotAvailable();
}

+ (Class)transformedValueClass
{
  classMethodNotAvailable();
}

+ (BOOL)allowsReverseTransformation
{
  classMethodNotAvailable();
}

@end
