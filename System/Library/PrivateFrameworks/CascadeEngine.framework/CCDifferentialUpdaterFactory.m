@implementation CCDifferentialUpdaterFactory

- (id)updaterForSet:(id)a3 withRequest:(id)a4
{
  id v6;
  id v7;
  CCDataResourceWriteAccess *writeAccess;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  writeAccess = self->_writeAccess;
  objc_msgSend(v7, "accessAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDataResourceWriteAccess setWriterForSet:accessAssertion:](writeAccess, "setWriterForSet:accessAssertion:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CCDifferentialUpdater updaterForSet:withRequest:setWriter:changeNotifier:timeout:](CCDifferentialUpdater, "updaterForSet:withRequest:setWriter:changeNotifier:timeout:", v6, v7, v10, self->_changeNotifier, self->_timeout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CCDifferentialUpdaterFactory updaterForSet:withRequest:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (CCDifferentialUpdaterFactory)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 timeout:(double)a5
{
  id v9;
  id v10;
  CCDifferentialUpdaterFactory *v11;
  CCDifferentialUpdaterFactory *v12;
  CCDifferentialUpdaterFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CCDifferentialUpdaterFactory;
  v11 = -[CCDifferentialUpdaterFactory init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_writeAccess, a3);
    if (!v12->_writeAccess)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_changeNotifier, a4);
    v12->_timeout = a5;
  }
  v13 = v12;
LABEL_6:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
}

- (void)updaterForSet:withRequest:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v0, (uint64_t)v0, "Failed to obtain data resource writer for set: %@, request: %@", v1);
  OUTLINED_FUNCTION_8();
}

@end
