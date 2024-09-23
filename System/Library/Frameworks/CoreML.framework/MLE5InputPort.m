@implementation MLE5InputPort

- (void)setPixelBufferPool:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLE5InputPort binder](self, "binder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPixelBufferPool:", v5);

}

- (MLE5InputPort)initWithPortHandle:(e5rt_io_port *)a3 name:(id)a4 featureDescription:(id)a5
{
  id v8;
  id v9;
  MLE5InputPort *v10;
  MLE5InputPort *v11;
  uint64_t v12;
  NSString *name;
  MLE5InputPortBinder *v14;
  MLE5InputPortBinder *binder;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLE5InputPort;
  v10 = -[MLE5InputPort init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_portHandle = a3;
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = -[MLE5InputPortBinder initWithPort:featureDescription:]([MLE5InputPortBinder alloc], "initWithPort:featureDescription:", a3, v9);
    binder = v11->_binder;
    v11->_binder = v14;

  }
  return v11;
}

- (MLE5InputPortBinder)binder
{
  return (MLE5InputPortBinder *)objc_getProperty(self, a2, 24, 1);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_portHandle)
  {
    e5rt_io_port_bind_buffer_object();
    e5rt_io_port_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MLE5InputPort;
  -[MLE5InputPort dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLE5InputPort name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MLE5InputPort: %p> %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)boundFeatureDirectly
{
  void *v2;
  BOOL v3;

  -[MLE5InputPort binder](self, "binder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bindingMode") == 1;

  return v3;
}

- (MLPixelBufferPool)pixelBufferPool
{
  void *v2;
  void *v3;

  -[MLE5InputPort binder](self, "binder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pixelBufferPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLPixelBufferPool *)v3;
}

- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MLE5InputPort binder](self, "binder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "reusableForFeatureValue:willBindDirectly:", v6, a4);

  return (char)a4;
}

- (BOOL)prepareForFeatureValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MLE5InputPort binder](self, "binder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "bindMemoryObjectForFeatureValue:error:", v6, a4);

  return (char)a4;
}

- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MLE5InputPort binder](self, "binder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "copyFeatureValue:error:", v6, a4);

  return (char)a4;
}

- (void)reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (e5rt_io_port_bind_buffer_object())
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      -[MLE5InputPort name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19C486000, v3, OS_LOG_TYPE_ERROR, "Failed to unbind feature value from %@ port.", buf, 0xCu);

    }
    v4 = (void *)MEMORY[0x1E0C99DA0];
    -[MLE5InputPort name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to unbind feature value from %@ port."), v5);

  }
  -[MLE5InputPort binder](self, "binder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (void)setBinder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binder, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
