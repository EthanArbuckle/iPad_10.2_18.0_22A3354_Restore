@implementation _CNOffMainThreadScheduler

- (void)performBlock:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v6 = 8;
  if (v5)
    v6 = 16;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42___CNOffMainThreadScheduler_performBlock___block_invoke;
  v9[3] = &unk_1E29B9380;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1)
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_18);
  return (id)os_log_cn_once_object_1_1;
}

- (_CNOffMainThreadScheduler)init
{
  void *v3;
  _CNOffMainThreadScheduler *v4;

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CNOffMainThreadScheduler initWithBackgroundScheduler:](self, "initWithBackgroundScheduler:", v3);

  return v4;
}

- (_CNOffMainThreadScheduler)initWithBackgroundScheduler:(id)a3
{
  id v5;
  NSObject *v6;
  _CNOffMainThreadScheduler *v7;
  uint64_t v8;
  CNScheduler *alreadyOffMainThreadScheduler;
  _CNOffMainThreadScheduler *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_88);
    v6 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
      -[_CNOffMainThreadScheduler initWithBackgroundScheduler:].cold.1(v6);
  }
  v12.receiver = self;
  v12.super_class = (Class)_CNOffMainThreadScheduler;
  v7 = -[_CNOffMainThreadScheduler init](&v12, sel_init);
  if (v7)
  {
    +[CNScheduler inlineScheduler](CNScheduler, "inlineScheduler");
    v8 = objc_claimAutoreleasedReturnValue();
    alreadyOffMainThreadScheduler = v7->_alreadyOffMainThreadScheduler;
    v7->_alreadyOffMainThreadScheduler = (CNScheduler *)v8;

    objc_storeStrong((id *)&v7->_needToGetOffMainThreadScheduler, a3);
    v10 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("backgroundScheduler"), self->_needToGetOffMainThreadScheduler);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = 8;
  if (v7)
    v8 = 16;
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59___CNOffMainThreadScheduler_performBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E29B9380;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "performBlock:qualityOfService:", v11, a4);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v6 = 8;
  if (v5)
    v6 = 16;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52___CNOffMainThreadScheduler_performCancelableBlock___block_invoke;
  v11[3] = &unk_1E29B9850;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "performCancelableBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = 8;
  if (v7)
    v8 = 16;
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69___CNOffMainThreadScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E29B9850;
  v13[4] = self;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "performCancelableBlock:qualityOfService:", v13, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = 8;
  if (v7)
    v8 = 16;
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53___CNOffMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v13[3] = &unk_1E29B9380;
  v13[4] = self;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "afterDelay:performBlock:", v13, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v8 = a4;
  v9 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v10 = 8;
  if (v9)
    v10 = 16;
  v11 = *(Class *)((char *)&self->super.isa + v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70___CNOffMainThreadScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v15[3] = &unk_1E29B9380;
  v15[4] = self;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "afterDelay:performBlock:qualityOfService:", v15, a5, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)timestamp
{
  double result;

  -[CNScheduler timestamp](self->_needToGetOffMainThreadScheduler, "timestamp");
  return result;
}

- (CNScheduler)alreadyOffMainThreadScheduler
{
  return self->_alreadyOffMainThreadScheduler;
}

- (CNScheduler)needToGetOffMainThreadScheduler
{
  return self->_needToGetOffMainThreadScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needToGetOffMainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_alreadyOffMainThreadScheduler, 0);
}

- (void)initWithBackgroundScheduler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "parameter ‘backgroundScheduler’ must be nonnull", v1, 2u);
}

@end
