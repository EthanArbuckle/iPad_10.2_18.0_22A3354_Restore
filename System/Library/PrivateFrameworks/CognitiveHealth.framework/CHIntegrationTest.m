@implementation CHIntegrationTest

- (CHIntegrationTest)init
{
  CHIntegrationTest *v2;
  CHIntegrationTestClient *v3;
  CHIntegrationTestProtocol *xpcClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHIntegrationTest;
  v2 = -[CHIntegrationTest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CHIntegrationTestClient);
    xpcClient = v2->_xpcClient;
    v2->_xpcClient = (CHIntegrationTestProtocol *)v3;

  }
  return v2;
}

- (void)populateSampleAppLaunchEmbeddingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  ch_test_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_238250000, v5, OS_LOG_TYPE_DEFAULT, "CHIntegrationTest populateSampleAppLaunchEmbedding api called", v6, 2u);
  }

  -[CHIntegrationTestProtocol populateSampleAppLaunchEmbeddingWithCompletion:](self->_xpcClient, "populateSampleAppLaunchEmbeddingWithCompletion:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end
