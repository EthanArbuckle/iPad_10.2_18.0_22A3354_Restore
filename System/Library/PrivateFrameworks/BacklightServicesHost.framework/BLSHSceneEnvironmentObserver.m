@implementation BLSHSceneEnvironmentObserver

+ (id)observerWithObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObserver:", v4);

  return v5;
}

- (BLSHSceneEnvironmentObserver)initWithObserver:(id)a3
{
  id v5;
  BLSHSceneEnvironmentObserver *v6;
  BLSHSceneEnvironmentObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHSceneEnvironmentObserver;
  v6 = -[BLSHSceneEnvironmentObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observer, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHSceneEnvironmentObserver *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __43__BLSHSceneEnvironmentObserver_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __43__BLSHSceneEnvironmentObserver_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("observer"));
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "identityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backlightSceneHostEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHSceneEnvironmentObserving sceneDidInvalidate:environment:](self->_observer, "sceneDidInvalidate:environment:", v5, v6);
  objc_msgSend(v4, "removeObserver:", self);

  bls_assertions_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BLSHSceneEnvironmentObserver sceneDidInvalidate:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)sceneDidInvalidate:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "OSIP:%p sceneDidInvalidate:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

@end
