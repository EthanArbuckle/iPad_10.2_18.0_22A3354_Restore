@implementation CAFStateCapture

- (CAFStateCapture)initWithIdentifier:(id)a3 capture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  CAFStateCapture *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  id capture;
  NSObject *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  CAFStateCapture *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CAFGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (!v9)
  {
    CAFStateCaptureLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2080;
      v28 = "-[CAFStateCapture initWithIdentifier:capture:]";
      _os_log_impl(&dword_237717000, v10, OS_LOG_TYPE_INFO, "%@ %s disabled", buf, 0x16u);
    }

  }
  v24.receiver = self;
  v24.super_class = (Class)CAFStateCapture;
  v11 = -[CAFStateCapture init](&v24, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = MEMORY[0x23B81B894](v7);
    capture = v11->_capture;
    v11->_capture = (id)v14;

    CAFStateCaptureLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v11;
      v27 = 2080;
      v28 = "-[CAFStateCapture initWithIdentifier:capture:]";
      _os_log_impl(&dword_237717000, v16, OS_LOG_TYPE_INFO, "%@ %s", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.caraccessoryframework.StateCapture-%@-%p"), v11->_identifier, v11);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v20;

    objc_initWeak((id *)buf, v11);
    objc_copyWeak(&v23, (id *)buf);
    v11->_handler = os_state_add_handler();
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

uint64_t __46__CAFStateCapture_initWithIdentifier_capture___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CAFStateCaptureLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = WeakRetained;
    _os_log_impl(&dword_237717000, v4, OS_LOG_TYPE_INFO, "%@ got called os_state_add_handler", (uint8_t *)&v7, 0xCu);
  }

  if (WeakRetained && *(_DWORD *)(a2 + 16) == 3)
    v5 = objc_msgSend(WeakRetained, "stateCapture");
  else
    v5 = 0;

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (-[CAFStateCapture handler](self, "handler"))
  {
    -[CAFStateCapture handler](self, "handler");
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)CAFStateCapture;
  -[CAFStateCapture dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFStateCapture identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (os_state_data_s)stateCapture
{
  void (**v3)(void);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  size_t v9;
  os_state_data_s *v10;
  os_state_data_s *v11;
  objc_class *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v17;
  uint8_t buf[4];
  CAFStateCapture *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CAFStateCapture capture](self, "capture");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v5 = (void *)MEMORY[0x23B81B5DC](v4, 0, &v17);
  v6 = v5;
  if (v17)
  {
    CAFStateCaptureLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAFStateCapture stateCapture].cold.3((uint64_t)self, &v17, v7);
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x7D01)
  {
    CAFStateCaptureLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAFStateCapture stateCapture].cold.1((uint64_t)self, v6, v7);
    goto LABEL_12;
  }
  v8 = objc_msgSend(v6, "length");
  v9 = v8;
  v10 = (os_state_data_s *)malloc_type_calloc(1uLL, v8 + 200, 0x753F5A3DuLL);
  if (!v10)
  {
    CAFStateCaptureLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAFStateCapture stateCapture].cold.2((uint64_t)self, v7);
    goto LABEL_12;
  }
  v11 = v10;
  v10->var0 = 3;
  __strlcpy_chk();
  v12 = (objc_class *)objc_opt_class();
  class_getName(v12);
  __strlcpy_chk();
  v11->var1.var1 = v8;
  -[CAFStateCapture identifier](self, "identifier");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "UTF8String");
  __strlcpy_chk();

  v14 = objc_retainAutorelease(v6);
  memcpy(v11->var4, (const void *)objc_msgSend(v14, "bytes"), v9);
  CAFStateCaptureLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v14, "length");
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2048;
    v21 = v15;
    _os_log_impl(&dword_237717000, v7, OS_LOG_TYPE_INFO, "%@ captured state data.length=%lu", buf, 0x16u);
  }
LABEL_13:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)capture
{
  return self->_capture;
}

- (void)setCapture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)handler
{
  return self->_handler;
}

- (void)setHandler:(unint64_t)a3
{
  self->_handler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_capture, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)stateCapture
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "%@ Error serializing dictionary for State Capture: %d", (uint8_t *)&v4, 0x12u);
}

@end
