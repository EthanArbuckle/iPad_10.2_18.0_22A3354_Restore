@implementation _EARTokenizer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARTokenizer)initWithNcsRoot:(id)a3
{
  id v4;
  _EARSdapiTokenizer *v5;

  v4 = a3;
  v5 = -[_EARQuasarTokenizer initWithNcsRoot:]([_EARSdapiTokenizer alloc], "initWithNcsRoot:", v4);

  return &v5->super.super;
}

- (id)tokenize:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

@end
