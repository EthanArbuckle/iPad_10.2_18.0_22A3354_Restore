@implementation HSLoginRequest

- (HSLoginRequest)init
{
  return -[HSLoginRequest initWithAction:](self, "initWithAction:", CFSTR("login"));
}

- (HSLoginRequest)initWithAction:(id)a3
{
  HSLoginRequest *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HSLoginRequest;
  v3 = -[HSRequest initWithAction:](&v19, sel_initWithAction_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedVideoQualities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          v11 = objc_msgSend(v4, "length");
          v12 = objc_msgSend(v10, "intValue");
          if (v11)
            v13 = CFSTR(",%d");
          else
            v13 = CFSTR("%d");
          objc_msgSend(v4, "appendFormat:", v13, v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v7);
    }
    -[HSRequest setValue:forArgument:](v3, "setValue:forArgument:", v4, CFSTR("preferredVideoQuality"));

  }
  return v3;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[HSResponse responseWithResponse:](HSLoginResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setSessionID:", objc_msgSend(v5, "unsignedIntValue"));
  return v3;
}

+ (id)supportedVideoQualities
{
  if (supportedVideoQualities_onceToken != -1)
    dispatch_once(&supportedVideoQualities_onceToken, &__block_literal_global_1693);
  return (id)__videoQualities;
}

void __41__HSLoginRequest_supportedVideoQualities__block_invoke()
{
  id v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)__videoQualities;
  __videoQualities = (uint64_t)v0;

  MSVGetMaximumScreenSize();
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  if (v4 > 720.0)
  {
    v5 = (void *)__videoQualities;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (v4 > 480.0)
  {
    v7 = (void *)__videoQualities;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)__videoQualities;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

@end
