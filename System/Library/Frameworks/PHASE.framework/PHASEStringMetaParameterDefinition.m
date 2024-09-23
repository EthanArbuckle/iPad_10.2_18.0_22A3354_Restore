@implementation PHASEStringMetaParameterDefinition

- (PHASEStringMetaParameterDefinition)init
{
  -[PHASEStringMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEStringMetaParameterDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEStringMetaParameterDefinition)initWithValue:(NSString *)value identifier:(NSString *)identifier
{
  NSString *v6;
  NSString *v7;
  PHASEStringMetaParameterDefinition *v8;
  PHASEStringMetaParameterDefinition *v9;
  PHASEStringMetaParameterDefinition *v10;

  v6 = value;
  v7 = identifier;
  v8 = -[PHASEStringMetaParameterDefinition initWithValue:](self, "initWithValue:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASEStringMetaParameterDefinition)initWithValue:(NSString *)value
{
  PHASEStringMetaParameterDefinition *v3;
  PHASEStringMetaParameterDefinition *v4;
  PHASEStringMetaParameterDefinition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASEStringMetaParameterDefinition;
  v3 = -[PHASEMetaParameterDefinition initWithValue:](&v7, sel_initWithValue_, value);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
