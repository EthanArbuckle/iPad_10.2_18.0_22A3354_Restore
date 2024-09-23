@implementation CNSchedulerProvider

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

+ (CNSchedulerProvider)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CNSchedulerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1)
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  return (CNSchedulerProvider *)(id)defaultProvider_cn_once_object_1;
}

- (CNScheduler)immediateScheduler
{
  return self->_immediateScheduler;
}

- (id)newSerialSchedulerWithName:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[CNSchedulerProvider serialSchedulerProvider](self, "serialSchedulerProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serialSchedulerProvider
{
  return self->_serialSchedulerProvider;
}

- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3
{
  CNQualityOfServiceSchedulerDecorator *v5;
  void *v6;
  CNQualityOfServiceSchedulerDecorator *v7;

  v5 = [CNQualityOfServiceSchedulerDecorator alloc];
  -[CNSchedulerProvider backgroundScheduler](self, "backgroundScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNQualityOfServiceSchedulerDecorator initWithScheduler:qualityOfService:](v5, "initWithScheduler:qualityOfService:", v6, a3);

  return v7;
}

- (CNScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (id)newSynchronousSerialSchedulerWithName:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[CNSchedulerProvider synchronousSerialSchedulerProvider](self, "synchronousSerialSchedulerProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousSerialSchedulerProvider
{
  return self->_synchronousSerialSchedulerProvider;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

+ (CNSchedulerProvider)providerWithBackgroundConcurrencyLimit:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)a1);
  +[CNScheduler operationQueueSchedulerWithMaxConcurrentOperationCount:](CNScheduler, "operationQueueSchedulerWithMaxConcurrentOperationCount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler mainThreadScheduler](CNScheduler, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler inlineScheduler](CNScheduler, "inlineScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v5, v6, v7, v8, &__block_literal_global_79, &__block_literal_global_2_2, &__block_literal_global_4_2);

  return (CNSchedulerProvider *)v9;
}

void __38__CNSchedulerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeDefaultProvider");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultProvider_cn_once_object_1;
  defaultProvider_cn_once_object_1 = v1;

}

- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 immediateScheduler:(id)a5 serialSchedulerProvider:(id)a6 synchronousSerialSchedulerProvider:(id)a7 readerWriterSchedulerProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  CNSchedulerProvider *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[CNScheduler inlineScheduler](CNScheduler, "inlineScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CNSchedulerProvider initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:](self, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v19, v18, v20, v17, v16, v15, v14);

  return v21;
}

+ (id)makeDefaultProvider
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc((Class)a1);
  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler mainThreadScheduler](CNScheduler, "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler inlineScheduler](CNScheduler, "inlineScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v3, v4, v5, v6, &__block_literal_global_79, &__block_literal_global_2_2, &__block_literal_global_4_2);

  return v7;
}

- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 inlineScheduler:(id)a5 immediateScheduler:(id)a6 serialSchedulerProvider:(id)a7 synchronousSerialSchedulerProvider:(id)a8 readerWriterSchedulerProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  CNSchedulerProvider *v20;
  CNSchedulerProvider *v21;
  uint64_t v22;
  id serialSchedulerProvider;
  uint64_t v24;
  id synchronousSerialSchedulerProvider;
  uint64_t v26;
  id readerWriterSchedulerProvider;
  CNSchedulerProvider *v28;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CNSchedulerProvider;
  v20 = -[CNSchedulerProvider init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_backgroundScheduler, a3);
    objc_storeStrong((id *)&v21->_mainThreadScheduler, a4);
    objc_storeStrong((id *)&v21->_inlineScheduler, a5);
    objc_storeStrong((id *)&v21->_immediateScheduler, a6);
    v22 = objc_msgSend(v17, "copy");
    serialSchedulerProvider = v21->_serialSchedulerProvider;
    v21->_serialSchedulerProvider = (id)v22;

    v24 = objc_msgSend(v18, "copy");
    synchronousSerialSchedulerProvider = v21->_synchronousSerialSchedulerProvider;
    v21->_synchronousSerialSchedulerProvider = (id)v24;

    v26 = objc_msgSend(v19, "copy");
    readerWriterSchedulerProvider = v21->_readerWriterSchedulerProvider;
    v21->_readerWriterSchedulerProvider = (id)v26;

    v28 = v21;
  }

  return v21;
}

- (id)newReaderWriterSchedulerWithName:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[CNSchedulerProvider readerWriterSchedulerProvider](self, "readerWriterSchedulerProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readerWriterSchedulerProvider
{
  return self->_readerWriterSchedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readerWriterSchedulerProvider, 0);
  objc_storeStrong(&self->_synchronousSerialSchedulerProvider, 0);
  objc_storeStrong(&self->_serialSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_immediateScheduler, 0);
  objc_storeStrong((id *)&self->_inlineScheduler, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
}

@end
