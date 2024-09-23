@implementation PHASEStringMetaParameter

- (PHASEStringMetaParameter)init
{
  -[PHASEStringMetaParameter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEStringMetaParameter)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEStringMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  -[PHASEStringMetaParameter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (PHASEStringMetaParameter)initWithUID:(id)a3 value:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHASEStringMetaParameter *v11;
  PHASEStringMetaParameter *v12;
  PHASEStringMetaParameter *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHASEStringMetaParameter;
  v11 = -[PHASEMetaParameter initWithUID:delegate:](&v15, sel_initWithUID_delegate_, v8, v10);
  v12 = v11;
  if (v11)
  {
    -[PHASEMetaParameter setValue:](v11, "setValue:", v9);
    v13 = v12;
  }

  return v12;
}

@end
