@implementation MUIBrandIndicatorProvider

- (MUIBrandIndicatorProvider)initWithMessageRepository:(id)a3 svgConverter:(id)a4
{
  id v7;
  id v8;
  MUIBrandIndicatorProvider *v9;
  MUIBrandIndicatorProvider *v10;
  uint64_t v11;
  EFScheduler *scheduler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUIBrandIndicatorProvider;
  v9 = -[MUIBrandIndicatorProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageRepository, a3);
    objc_storeStrong((id *)&v10->_svgConverter, a4);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mail.MUIBrandIndicatorProvider"), 25);
    v11 = objc_claimAutoreleasedReturnValue();
    scheduler = v10->_scheduler;
    v10->_scheduler = (EFScheduler *)v11;

  }
  return v10;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MUIBrandIndicatorProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (OS_os_log *)(id)log_log_5;
}

void __32__MUIBrandIndicatorProvider_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MUIBrandIndicatorProvider_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (OS_os_log *)(id)signpostLog_log_0;
}

void __40__MUIBrandIndicatorProvider_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (id)brandIndicatorFutureForLocation:(id)a3
{
  return -[MUIBrandIndicatorProvider brandIndicatorFutureForLocation:size:](self, "brandIndicatorFutureForLocation:size:", a3, 60.0, 60.0);
}

- (id)brandIndicatorFutureForLocation:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  CGFloat v23;
  CGFloat v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    +[MUIBrandIndicatorProvider signpostLog](MUIBrandIndicatorProvider, "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[MUIBrandIndicatorProvider signpostID](self, "signpostID");
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        v11 = v7;
        if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
        {
          objc_msgSend(v11, "absoluteString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v11, "absoluteString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fullyRedactedStringForString:", v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        _os_signpost_emit_with_name_impl(&dword_1D5522000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BIMI REQUEST", "Scheduling request for brand indicator url %{public}@", buf, 0xCu);

      }
    }

    v19 = (void *)MEMORY[0x1E0D1EEC0];
    -[MUIBrandIndicatorProvider scheduler](self, "scheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke;
    v21[3] = &unk_1E99E26F0;
    v21[4] = self;
    v22 = v7;
    v23 = width;
    v24 = height;
    objc_msgSend(v19, "onScheduler:lazyFutureWithBlock:", v15, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MUIBrandIndicatorProvider log](MUIBrandIndicatorProvider, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MUIBrandIndicatorProvider brandIndicatorFutureForLocation:size:].cold.1(v13);

    v14 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

id __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brandIndicatorForLocation:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MUIBrandIndicatorProvider signpostLog](MUIBrandIndicatorProvider, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      v9 = (void *)MEMORY[0x1E0D1E1A8];
      v10 = *(id *)(a1 + 40);
      if (objc_msgSend(v9, "preferenceEnabled:", 13))
      {
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v10, "absoluteString");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fullyRedactedStringForString:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (id)v13;
      }

      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v6, OS_SIGNPOST_EVENT, v8, "BIMI REQUEST", "Requesting brand indicator for url %{public}@", buf, 0xCu);

    }
  }

  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7;
  v30 = &unk_1E99E26C8;
  v14 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v31 = v14;
  v32 = v15;
  v33 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v5, "then:", &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "result:", a2, v27, v28, v29, v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MUIBrandIndicatorProvider signpostLog](MUIBrandIndicatorProvider, "signpostLog");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v18))
    {
      v21 = (void *)MEMORY[0x1E0D1E1A8];
      v22 = *(id *)(a1 + 40);
      if (objc_msgSend(v21, "preferenceEnabled:", 13))
      {
        objc_msgSend(v22, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v22, "absoluteString");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fullyRedactedStringForString:", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (id)v25;
      }

      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v18, OS_SIGNPOST_INTERVAL_END, v20, "BIMI REQUEST", "Fetched brand indicator data for url %{public}@", buf, 0xCu);

    }
  }

  return v17;
}

id __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    +[MUIBrandIndicatorProvider signpostLog](MUIBrandIndicatorProvider, "signpostLog");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        v12 = (void *)MEMORY[0x1E0D1E1A8];
        v13 = *(id *)(a1 + 32);
        if (objc_msgSend(v12, "preferenceEnabled:", 13))
        {
          objc_msgSend(v13, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v13, "absoluteString");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fullyRedactedStringForString:", v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (id)v20;
        }

        *(_DWORD *)buf = 138543362;
        v29 = v14;
        _os_signpost_emit_with_name_impl(&dword_1D5522000, v9, OS_SIGNPOST_EVENT, v11, "BIMI REQUEST", "Generating image for url %{public}@", buf, 0xCu);

      }
    }

    v21 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
    objc_msgSend(*(id *)(a1 + 40), "svgConverter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_11;
    v26[3] = &unk_1E99E26A0;
    v27 = v21;
    v23 = *(double *)(a1 + 48);
    v24 = *(double *)(a1 + 56);
    v17 = v21;
    objc_msgSend(v22, "imageForSVGData:size:scale:completionHandler:", v5, v26, v23, v24, v8);

    objc_msgSend(v17, "future");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MUIBrandIndicatorProvider log](MUIBrandIndicatorProvider, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7_cold_1(a1, v15);

    v16 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_11(uint64_t a1, UIImage *image)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  UIImagePNGRepresentation(image);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v6 = (id)v3;
  if (v3)
  {
    objc_msgSend(v4, "finishWithResult:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v5);

  }
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (MUICachingSVGConverter)svgConverter
{
  return self->_svgConverter;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_svgConverter, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

- (void)brandIndicatorFutureForLocation:(os_log_t)log size:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5522000, log, OS_LOG_TYPE_ERROR, "Missing brand indicator location. No BIMI image will be returned", v1, 2u);
}

void __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D1E1A8];
  v4 = *(id *)(a1 + 32);
  if (objc_msgSend(v3, "preferenceEnabled:", 13))
  {
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v4, "absoluteString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullyRedactedStringForString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }

  v8 = 138543362;
  v9 = v5;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "No data fetched for brand indicator url %{public}@", (uint8_t *)&v8, 0xCu);

}

@end
