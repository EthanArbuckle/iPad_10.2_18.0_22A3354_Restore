@implementation CKOperation(IC)

- (id)ic_loggingValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)&off_1EF559788;
  objc_msgSendSuper2(&v15, sel_ic_loggingValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudKitMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  if (v7 > 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudKitMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "duration");
    objc_msgSend(v8, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("duration"));

  }
  objc_msgSend(a1, "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ic_loggingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("group"));

  return v3;
}

- (uint64_t)ic_removeAllCompletionBlocks
{
  return objc_msgSend(a1, "setCompletionBlock:", 0);
}

@end
