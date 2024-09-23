@implementation HK_TPSDiscoverabilitySignal

- (HK_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  id v4;
  HK_TPSDiscoverabilitySignal *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HK_TPSDiscoverabilitySignal;
  v5 = -[HK_TPSDiscoverabilitySignal init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)donateSignalWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HK_TPSDiscoverabilitySignal identifier](self, "identifier", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Discoverability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Signals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FF0]), "initWithContentIdentifier:context:osBuild:userInfo:", v8, 0, 0, 0);
  objc_msgSend(v6, "sendEvent:", v7);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
