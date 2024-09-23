@implementation ATXAssetsAggregateLogger

+ (void)logKey:(id)a3 replaceScalarValueWith:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAssetsAggregateLogger.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setKey:", v10);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:count:", v7, a4);

}

@end
