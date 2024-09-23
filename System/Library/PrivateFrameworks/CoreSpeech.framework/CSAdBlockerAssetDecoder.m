@implementation CSAdBlockerAssetDecoder

- (CSAdBlockerAssetDecoder)initWithAssetPath:(id)a3
{
  id v4;
  CSAdBlockerAssetDecoder *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSData *payLoadData;
  NSObject *v10;
  CSAdBlockerAssetDecoder *v11;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAdBlockerAssetDecoder;
  v5 = -[CSAdBlockerAssetDecoder init](&v14, sel_init);
  if (!v5)
    goto LABEL_9;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSAdBlockerAssetDecoder initWithAssetPath:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s initilizing adBlockerAssetDecoder with assetPath: %@", buf, 0x16u);
  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 2, &v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v13;
  payLoadData = v5->_payLoadData;
  v5->_payLoadData = (NSData *)v7;

  if (v8 || !v5->_payLoadData)
  {
    v10 = *MEMORY[0x1E0D18F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAdBlockerAssetDecoder initWithAssetPath:]";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Error reading file", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
LABEL_9:
    v11 = v5;
  }

  return v11;
}

- (NSData)payLoadData
{
  return self->_payLoadData;
}

- (void)setPayLoadData:(id)a3
{
  objc_storeStrong((id *)&self->_payLoadData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLoadData, 0);
}

@end
