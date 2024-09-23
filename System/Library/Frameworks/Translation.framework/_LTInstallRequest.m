@implementation _LTInstallRequest

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4
{
  id v7;
  _LTInstallRequest *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  _LTInstallRequest *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTInstallRequest;
  v8 = -[_LTInstallRequest init](&v13, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_locales, a3);
    v8->_useCellular = a4;
    v11 = v8;
  }

  return v8;
}

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 progressHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  _LTInstallRequest *v9;
  uint64_t v10;
  id progressHandler;
  _LTInstallRequest *v12;

  v5 = a4;
  v8 = a5;
  v9 = -[_LTInstallRequest initWithLocales:useCellular:](self, "initWithLocales:useCellular:", a3, v5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    progressHandler = v9->_progressHandler;
    v9->_progressHandler = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 delegate:(id)a5
{
  _BOOL8 v5;
  id v8;
  _LTInstallRequest *v9;
  _LTInstallRequest *v10;
  _LTInstallRequest *v11;

  v5 = a4;
  v8 = a5;
  v9 = -[_LTInstallRequest initWithLocales:useCellular:](self, "initWithLocales:useCellular:", a3, v5);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (_LTInstallRequest)initWithCoder:(id)a3
{
  id v4;
  _LTInstallRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *locales;
  _LTInstallRequest *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTInstallRequest;
  v5 = -[_LTInstallRequest init](&v12, sel_init);
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("locales"));
    v8 = objc_claimAutoreleasedReturnValue();
    locales = v5->_locales;
    v5->_locales = (NSArray *)v8;

    v5->_useCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useCellular"));
    v10 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *locales;
  id v5;

  locales = self->_locales;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locales, CFSTR("locales"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useCellular, CFSTR("useCellular"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_startInstallationWithService:(id)a3 done:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_DEFAULT, "Start installation request with service", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___LTInstallRequest__startInstallationWithService_done___block_invoke;
  block[3] = &unk_2506936E0;
  objc_copyWeak(&v15, buf);
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)languageInstallProgressed:(id)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  void (**progressHandler)(id, id, id);
  void (**completionHandler)(id, id);
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "languageInstallProgressed:error:", v10, v6);

  if (v10 && (progressHandler = (void (**)(id, id, id))self->_progressHandler) != 0)
  {
    progressHandler[2](progressHandler, v10, v6);
  }
  else
  {
    completionHandler = (void (**)(id, id))self->_completionHandler;
    if (completionHandler)
      completionHandler[2](completionHandler, v6);
  }

}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (void)setUseCellular:(BOOL)a3
{
  self->_useCellular = a3;
}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
