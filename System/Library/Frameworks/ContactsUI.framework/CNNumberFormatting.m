@implementation CNNumberFormatting

+ (id)localizedStringWithInteger:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (localizedStringWithInteger__cn_once_token_0 != -1)
    dispatch_once(&localizedStringWithInteger__cn_once_token_0, &__block_literal_global_22832);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (id)localizedStringWithInteger__cn_once_object_0;
  objc_msgSend(v4, "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__CNNumberFormatting_localizedStringWithInteger___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  objc_msgSend(v0, "setNumberStyle:", 0);
  v2 = (void *)localizedStringWithInteger__cn_once_object_0;
  localizedStringWithInteger__cn_once_object_0 = (uint64_t)v0;

}

@end
