@implementation _EXDecoderHack

- (_EXDecoderHack)initWithContextFactory:(id)a3
{
  id v4;
  _EXDecoderHack *v5;
  void *v6;
  id contextFactory;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXDecoderHack;
  v5 = -[_EXDecoderHack init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    contextFactory = v5->_contextFactory;
    v5->_contextFactory = v6;

  }
  return v5;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id result;
  NSObject *v9;

  v6 = a4;
  if (EXGetExtensionContextInternalClass() == a3)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("self.internalExtensionContext")) & 1) != 0)
    {
      (*((void (**)(void))self->_contextFactory + 2))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXDecoderHack decodeObjectOfClass:forKey:].cold.1();
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXDecoderHack decodeObjectOfClass:forKey:].cold.2();
  }

  __break(1u);
  return result;
}

- (id)contextFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setContextFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextFactory, 0);
}

- (void)decodeObjectOfClass:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: Unexpected key for decoding", v2, v3, v4, v5, v6);
}

- (void)decodeObjectOfClass:forKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: Unexpected class for decoding", v2, v3, v4, v5, v6);
}

@end
