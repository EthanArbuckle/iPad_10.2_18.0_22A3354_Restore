@implementation CAMDisabledPreviewController

- (CAMDisabledPreviewController)init
{
  CAMDisabledPreviewController *v2;
  NSMutableSet *v3;
  NSMutableSet *reasonsForDisablingPreview;
  CAMDisabledPreviewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDisabledPreviewController;
  v2 = -[CAMDisabledPreviewController init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reasonsForDisablingPreview = v2->__reasonsForDisablingPreview;
    v2->__reasonsForDisablingPreview = v3;

    v5 = v2;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)removeDisabledPreviewReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CAMDisabledPreviewController _reasonsForDisablingPreview](self, "_reasonsForDisablingPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  v8 = objc_msgSend(v5, "count");
  if (v6 && !v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMDisabledPreviewController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Enabling disabled preview for final reason %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[CAMDisabledPreviewController delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject disabledPreviewController:wantsPreviewEnabledForReason:](v11, "disabledPreviewController:wantsPreviewEnabledForReason:", self, a3);
LABEL_9:

    goto LABEL_10;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMDisabledPreviewController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDisabledPreviewController _descriptionForReasons:](self, "_descriptionForReasons:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Removed disabled preview reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (NSMutableSet)_reasonsForDisablingPreview
{
  return self->__reasonsForDisablingPreview;
}

- (BOOL)isPreviewDisabled
{
  void *v2;
  BOOL v3;

  -[CAMDisabledPreviewController _reasonsForDisablingPreview](self, "_reasonsForDisablingPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)addDisabledPreviewReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CAMDisabledPreviewController _reasonsForDisablingPreview](self, "_reasonsForDisablingPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = objc_msgSend(v5, "count");
  if (!v6 && v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMDisabledPreviewController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Disabled preview for reason %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[CAMDisabledPreviewController delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject disabledPreviewController:wantsPreviewDisabledForReason:](v11, "disabledPreviewController:wantsPreviewDisabledForReason:", self, a3);
LABEL_9:

    goto LABEL_10;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMDisabledPreviewController _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDisabledPreviewController _descriptionForReasons:](self, "_descriptionForReasons:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Added disabled preview reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_descriptionStringForReason:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1EA32C388[a3];
}

- (id)_descriptionForReasons:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, unint64_t);
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  CAMDisabledPreviewController *v23;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke;
    v21[3] = &unk_1EA32B838;
    v22 = v5;
    v23 = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    v16 = 3221225472;
    v17 = __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_3;
    v18 = &unk_1EA32B8A0;
    v10 = objc_retain((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(")));
    v19 = v10;
    v20 = v9;
    v11 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);
    objc_msgSend(v10, "appendString:", CFSTR(")"), v15, v16, v17, v18);
    v12 = v20;
    v13 = (__CFString *)v10;

  }
  else
  {
    v13 = &stru_1EA3325A0;
  }

  return v13;
}

void __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_descriptionStringForReason:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 > a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

- (CAMDisabledPreviewControllerDelegate)delegate
{
  return (CAMDisabledPreviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reasonsForDisablingPreview, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
