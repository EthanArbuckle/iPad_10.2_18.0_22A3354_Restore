@implementation PHASEMetaParameterDefinition

- (PHASEMetaParameterDefinition)init
{
  -[PHASEMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMetaParameterDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal
{
  -[PHASEMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PHASEMetaParameterDefinition)initWithValue:(id)a3
{
  id v5;
  id *v6;
  PHASEMetaParameterDefinition *v7;
  PHASEMetaParameterDefinition *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASEMetaParameterDefinition;
  v6 = -[PHASEDefinition initInternal](&v10, sel_initInternal);
  v7 = (PHASEMetaParameterDefinition *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 2, a3);
    v8 = v7;
  }

  return v7;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
