@implementation _EXHostViewControllerConfiguration

- (_EXHostViewControllerConfiguration)init
{
  uint64_t v2;
  _EXHostViewControllerConfiguration *v3;
  _EXHostViewControllerConfiguration *v4;
  _EXExtensionIdentity *extensionIdentity;
  _EXExtensionInstanceIdentifier *instanceIdentifier;
  void *v7;
  objc_super v9;

  v2 = *MEMORY[0x24BDC7A30];
  v9.receiver = self;
  v9.super_class = (Class)_EXHostViewControllerConfiguration;
  v3 = -[_EXHostViewControllerSessionConfiguration initWithSceneIdentifier:](&v9, sel_initWithSceneIdentifier_, v2);
  v4 = v3;
  if (v3)
  {
    extensionIdentity = v3->_extensionIdentity;
    v3->_extensionIdentity = 0;

    instanceIdentifier = v4->_instanceIdentifier;
    v4->_instanceIdentifier = 0;

    objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_beginHostingImmediately = objc_msgSend(v7, "startUIHostingSessionImmediately");

    v4->_sizeBridgingOptions = -1;
    v4->_retryOnHostingFailure = 0;
  }
  return v4;
}

- (_EXHostViewControllerConfiguration)initWithExtensionIdentity:(id)a3
{
  id v5;
  uint64_t v6;
  _EXHostViewControllerConfiguration *v7;
  NSObject *v8;
  _EXExtensionInstanceIdentifier *instanceIdentifier;
  void *v10;
  objc_super v12;

  v5 = a3;
  v6 = *MEMORY[0x24BDC7A30];
  v12.receiver = self;
  v12.super_class = (Class)_EXHostViewControllerConfiguration;
  v7 = -[_EXHostViewControllerSessionConfiguration initWithSceneIdentifier:](&v12, sel_initWithSceneIdentifier_, v6);
  if (v7)
  {
    if ((objc_msgSend(v5, "presentsUserInterface") & 1) == 0)
    {
      _EXDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[_EXHostViewControllerConfiguration initWithExtensionIdentity:].cold.1();

    }
    objc_storeStrong((id *)&v7->_extensionIdentity, a3);
    instanceIdentifier = v7->_instanceIdentifier;
    v7->_instanceIdentifier = 0;

    objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_beginHostingImmediately = objc_msgSend(v10, "startUIHostingSessionImmediately");

    v7->_sizeBridgingOptions = -1;
    v7->_retryOnHostingFailure = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_EXHostViewControllerConfiguration;
  v4 = -[_EXHostViewControllerSessionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setExtensionIdentity:", self->_extensionIdentity);
  objc_msgSend(v4, "setInstanceIdentifier:", self->_instanceIdentifier);
  objc_msgSend(v4, "setBeginHostingImmediately:", self->_beginHostingImmediately);
  objc_msgSend(v4, "setSizeBridgingOptions:", self->_sizeBridgingOptions);
  objc_msgSend(v4, "setRetryOnHostingFailure:", self->_retryOnHostingFailure);
  return v4;
}

- (void)setExtensionIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  _EXExtensionIdentity *extensionIdentity;

  v4 = a3;
  if ((objc_msgSend(v4, "presentsUserInterface") & 1) == 0)
  {
    _EXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_EXHostViewControllerConfiguration setExtensionIdentity:].cold.1();

  }
  extensionIdentity = self->_extensionIdentity;
  self->_extensionIdentity = (_EXExtensionIdentity *)v4;

}

- (NSString)sceneIdentifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewControllerConfiguration;
  -[_EXHostViewControllerSessionConfiguration sceneIdentifier](&v3, sel_sceneIdentifier);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSceneIdentifier:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewControllerConfiguration;
  -[_EXHostViewControllerSessionConfiguration setSceneIdentifier:](&v3, sel_setSceneIdentifier_, a3);
}

- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3
{
  id v4;
  _EXHostViewControllerConfiguration *v5;
  _EXHostViewControllerConfiguration *result;
  NSObject *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[_EXHostViewControllerConfiguration initWithExtensionIdentity:](self, "initWithExtensionIdentity:", v4);

    return v5;
  }
  else
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_EXHostViewControllerConfiguration initWithExtension:].cold.1();

    __break(1u);
  }
  return result;
}

- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3 role:(id)a4
{
  id v6;
  id v7;
  _EXHostViewControllerConfiguration *v8;
  _EXHostViewControllerConfiguration *v9;
  _EXHostViewControllerConfiguration *result;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[_EXHostViewControllerConfiguration initWithExtensionIdentity:](self, "initWithExtensionIdentity:", v6);
    v9 = v8;
    if (v8)
      -[_EXHostViewControllerConfiguration setSceneIdentifier:](v8, "setSceneIdentifier:", v7);

    return v9;
  }
  else
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_EXHostViewControllerConfiguration initWithExtension:role:].cold.1();

    __break(1u);
  }
  return result;
}

- (void)setExtension:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_EXHostViewControllerConfiguration setExtensionIdentity:](self, "setExtensionIdentity:", v5);

  }
  else
  {
    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[_EXHostViewControllerConfiguration setExtension:].cold.1();

    __break(1u);
  }
}

- (_EXExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instanceIdentifier, a3);
}

- (BOOL)beginHostingImmediately
{
  return self->_beginHostingImmediately;
}

- (void)setBeginHostingImmediately:(BOOL)a3
{
  self->_beginHostingImmediately = a3;
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (BOOL)retryOnHostingFailure
{
  return self->_retryOnHostingFailure;
}

- (void)setRetryOnHostingFailure:(BOOL)a3
{
  self->_retryOnHostingFailure = a3;
}

- (_EXExtensionRepresenting)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

- (void)initWithExtensionIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v0, v1, "%s - %s:%d: Extension point does not support user interface", v2, v3, v4, v5, 2u);
}

- (void)setExtensionIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v0, v1, "%s - %s:%d: Extension point does not support user interface", v2, v3, v4, v5, 2u);
}

- (void)initWithExtension:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithExtension:role:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setExtension:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
