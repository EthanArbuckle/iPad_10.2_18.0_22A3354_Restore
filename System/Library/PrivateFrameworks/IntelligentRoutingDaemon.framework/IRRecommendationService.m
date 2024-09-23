@implementation IRRecommendationService

- (IRRecommendationService)initWithQueue:(id)a3
{
  id v5;
  IRRecommendationService *v6;
  IRRecommendationService *v7;
  IRSessionServer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRRecommendationService;
  v6 = -[IRRecommendationService init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[IRSessionServer initWithQueue:]([IRSessionServer alloc], "initWithQueue:", v5);
    -[IRRecommendationService setXpcServer:](v7, "setXpcServer:", v8);

  }
  return v7;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3;
  IRRecommendationService *v4;

  v3 = a3;
  v4 = -[IRRecommendationService initWithQueue:]([IRRecommendationService alloc], "initWithQueue:", v3);

  return v4;
}

- (NSArray)machServicesNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.intelligentroutingd.xpc.media");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IRRecommendationService xpcServer](self, "xpcServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAcceptNewConnection:", v4);

  return v6;
}

- (IRSessionServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->machServicesNames, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
