@implementation BRLTLoopbackTranslationService

- (BRLTLoopbackTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4 loopbackService:(id)a5
{
  id v9;
  BRLTLoopbackTranslationService *v10;
  BRLTLoopbackTranslationService *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BRLTLoopbackTranslationService;
  v10 = -[BRLTTranslationService initWithServiceIdentifier:connection:](&v13, sel_initWithServiceIdentifier_connection_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_loopbackService, a5);

  return v11;
}

- (BOOL)isLoopback
{
  return 1;
}

- (BRLTSLoopbackTranslationService)loopbackService
{
  return self->_loopbackService;
}

- (void)setLoopbackService:(id)a3
{
  objc_storeStrong((id *)&self->_loopbackService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopbackService, 0);
}

@end
