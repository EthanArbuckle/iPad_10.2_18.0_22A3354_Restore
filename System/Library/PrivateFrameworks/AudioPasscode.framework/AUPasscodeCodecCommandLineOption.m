@implementation AUPasscodeCodecCommandLineOption

+ (id)optionWithSyntax:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  AUPasscodeCodecCommandLineOption *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AUPasscodeCodecCommandLineOption initWithSyntax:description:]([AUPasscodeCodecCommandLineOption alloc], "initWithSyntax:description:", v6, v5);

  return v7;
}

- (AUPasscodeCodecCommandLineOption)initWithSyntax:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  AUPasscodeCodecCommandLineOption *v9;
  AUPasscodeCodecCommandLineOption *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AUPasscodeCodecCommandLineOption;
  v9 = -[AUPasscodeCodecCommandLineOption init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_optionSyntax, a3);
    objc_storeStrong((id *)&v10->_optionDescription, a4);
  }

  return v10;
}

- (NSString)optionSyntax
{
  return self->_optionSyntax;
}

- (NSString)optionDescription
{
  return self->_optionDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionDescription, 0);
  objc_storeStrong((id *)&self->_optionSyntax, 0);
}

@end
