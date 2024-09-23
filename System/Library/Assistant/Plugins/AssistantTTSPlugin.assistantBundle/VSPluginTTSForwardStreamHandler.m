@implementation VSPluginTTSForwardStreamHandler

- (VSPluginTTSForwardStreamHandler)initWithDictionary:(id)a3
{
  id v4;
  VSPluginTTSForwardStreamHandler *v5;
  uint64_t v6;
  void *v7;
  int v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *streamObject;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VSPluginTTSForwardStreamHandler;
  v5 = -[VSPluginTTSForwardStreamHandler init](&v18, sel_init);
  if (v5)
  {
    v6 = *MEMORY[0x24BE81078];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE81078]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE82608]);

    if (v8)
    {
      v9 = (objc_class *)MEMORY[0x24BE81820];
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE82610]);

      if (v11)
      {
        v9 = (objc_class *)MEMORY[0x24BE81828];
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE82618]);

        if (!v13)
        {
          VSGetLogDefault();
          streamObject = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(streamObject, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE81AB8]);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v20 = "-[VSPluginTTSForwardStreamHandler initWithDictionary:]";
            v21 = 2112;
            v22 = v17;
            _os_log_error_impl(&dword_21CBCE000, streamObject, OS_LOG_TYPE_ERROR, "%s Unknown class %@", buf, 0x16u);

          }
          goto LABEL_9;
        }
        v9 = (objc_class *)MEMORY[0x24BE81830];
      }
    }
    v14 = objc_msgSend([v9 alloc], "initWithDictionary:", v4);
    streamObject = v5->_streamObject;
    v5->_streamObject = (SATTSSpeechSynthesisStreaming *)v14;
LABEL_9:

  }
  return v5;
}

- (void)performWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[VSPluginTTSForwardStreamHandler streamObject](self, "streamObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC0E00], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSPluginTTSForwardStreamHandler streamObject](self, "streamObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forwardStreamObject:", v6);

    if (v7)
      v7[2](v7, 0);
  }

}

- (SATTSSpeechSynthesisStreaming)streamObject
{
  return self->_streamObject;
}

- (void)setStreamObject:(id)a3
{
  objc_storeStrong((id *)&self->_streamObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamObject, 0);
}

@end
