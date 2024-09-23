@implementation GDKnosisServer

- (GDKnosisServer)initWithEntitySubgraphView
{
  const char *v2;
  uint64_t v3;
  GDKnosisServer *v4;
  uint64_t v5;
  _TtC20IntelligencePlatform12KnosisServer *knosisServer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GDKnosisServer;
  v4 = -[GDKnosisServer init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_initWithEntitySubgraphView(_TtC20IntelligencePlatform12KnosisServer, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    knosisServer = v4->_knosisServer;
    v4->_knosisServer = (_TtC20IntelligencePlatform12KnosisServer *)v5;

  }
  return v4;
}

- (void)executeIntent:(id)a3 completionHandler:(id)a4
{
  _TtC20IntelligencePlatform12KnosisServer *knosisServer;
  id v7;
  const char *v8;
  id v9;

  knosisServer = self->_knosisServer;
  v7 = a4;
  objc_msgSend_executeIntentsWithRequest_(knosisServer, v8, (uint64_t)a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v9);

}

- (void)executeKGQ:(id)a3 completionHandler:(id)a4
{
  _TtC20IntelligencePlatform12KnosisServer *knosisServer;
  id v7;
  const char *v8;
  id v9;

  knosisServer = self->_knosisServer;
  v7 = a4;
  objc_msgSend_executeKGQWithRequest_(knosisServer, v8, (uint64_t)a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v9);

}

- (void)executeIntent:(id)a3 completionHandlerWithGraphObjectContext:(id)a4
{
  _TtC20IntelligencePlatform12KnosisServer *knosisServer;
  id v7;
  const char *v8;
  id v9;

  knosisServer = self->_knosisServer;
  v7 = a4;
  objc_msgSend_executeIntentsWithGraphObjectContextWithRequest_(knosisServer, v8, (uint64_t)a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v9);

}

- (void)executeKGQ:(id)a3 completionHandlerWithGraphObjectContext:(id)a4
{
  _TtC20IntelligencePlatform12KnosisServer *knosisServer;
  id v7;
  const char *v8;
  id v9;

  knosisServer = self->_knosisServer;
  v7 = a4;
  objc_msgSend_executeKGQWithGraphObjectContextWithRequest_(knosisServer, v8, (uint64_t)a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knosisServer, 0);
}

@end
