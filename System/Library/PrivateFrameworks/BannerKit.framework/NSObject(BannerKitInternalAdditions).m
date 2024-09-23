@implementation NSObject(BannerKitInternalAdditions)

- (void)_uniquelyIdentifyPresentable
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+BannerKit.m"), 37, CFSTR("Attempt to uniquely identify object that isn't a presentable: %@"), a1);

  }
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "uniquePresentableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)BNLogPresentable;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BNEffectivePresentableDescription(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "Asked to uniquely identify presentable that already has a unique identifier: presentable: %{public}@; uniqueID: %{public}@",
        buf,
        0x16u);

    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_setAssociatedObject(v4, "com.apple.BannerKit.presentableUniqueIdentifier", v8, (void *)3);

  objc_sync_exit(v4);
}

- (void)ensurePresentableIsUniquelyIdentifiable
{
  void *v4;
  int v5;
  void *v6;
  id obj;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+BannerKit.m"), 48, CFSTR("Attempt to uniquely identify object that isn't a presentable: %@"), a1);

  }
  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(obj, "uniquePresentableIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  v5 = objc_msgSend(obj, "providesTemplateContent");

  if (v5)
LABEL_6:
    objc_msgSend(obj, "_uniquelyIdentifyPresentable");
LABEL_8:
  objc_sync_exit(obj);

}

@end
