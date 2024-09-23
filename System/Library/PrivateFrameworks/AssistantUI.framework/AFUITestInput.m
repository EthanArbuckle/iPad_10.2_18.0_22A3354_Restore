@implementation AFUITestInput

+ (id)_baseRequestOptions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE907F0]), "initWithRequestSource:uiPresentationIdentifier:", 15, CFSTR("com.apple.siri.Compact"));
}

- (id)_initWithRequestOptions:(id)a3
{
  id v5;
  AFUITestInput *v6;
  AFUITestInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUITestInput;
  v6 = -[AFUITestInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestOptions, a3);

  return v7;
}

- (AFUITestInput)initWithText:(id)a3
{
  id v4;
  void *v5;
  AFUITestInput *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  v6 = -[AFUITestInput _initWithRequestOptions:](self, "_initWithRequestOptions:", v5);
  return v6;
}

- (AFUITestInput)initWithRecordedSpeechURL:(id)a3
{
  id v4;
  void *v5;
  AFUITestInput *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpeechFileURL:", v4);

  v6 = -[AFUITestInput _initWithRequestOptions:](self, "_initWithRequestOptions:", v5);
  return v6;
}

- (SASRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOptions, 0);
}

@end
