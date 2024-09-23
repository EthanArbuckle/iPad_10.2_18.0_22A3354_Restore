@implementation _LTLanguageAssetRequest

- (_LTLanguageAssetRequest)initWithLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  _LTLanguageAssetRequest *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  id progress;
  uint64_t v19;
  id completion;
  _LTLanguageAssetRequest *v21;
  objc_super v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_LTLanguageAssetRequest;
  v14 = -[_LTLanguageAssetRequest init](&v23, sel_init);
  if (v14)
  {
    v15 = dispatch_queue_create("com.apple.translationd.AssetXPC", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_assets, a3);
    v14->_options = a4;
    v17 = objc_msgSend(v12, "copy");
    progress = v14->_progress;
    v14->_progress = (id)v17;

    v19 = objc_msgSend(v13, "copy");
    completion = v14->_completion;
    v14->_completion = (id)v19;

    v21 = v14;
  }

  return v14;
}

- (_LTLanguageAssetRequest)initWithCoder:(id)a3
{
  id v4;
  _LTLanguageAssetRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *assets;
  _LTLanguageAssetRequest *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageAssetRequest;
  v5 = -[_LTLanguageAssetRequest init](&v12, sel_init);
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("assets"));
    v8 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (NSArray *)v8;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    v10 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *assets;
  id v5;

  assets = self->_assets;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assets, CFSTR("assets"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLanguageAssetRequest)assetRequestWithService:(id)a3 done:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _LTLanguageAssetRequest *result;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56___LTLanguageAssetRequest_assetRequestWithService_done___block_invoke;
  v12[3] = &unk_2506936E0;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return result;
}

- (void)assetResponseWithProgress:(id)a3 finished:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___LTLanguageAssetRequest_assetResponseWithProgress_finished_error___block_invoke;
  block[3] = &unk_250693758;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)progress
{
  return self->_progress;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
