@implementation DOCDateFormatter

+ (id)sharedLongDateFormatter
{
  if (sharedLongDateFormatter_onceToken != -1)
    dispatch_once(&sharedLongDateFormatter_onceToken, &__block_literal_global_4);
  return (id)sharedLongDateFormatter_shared;
}

uint64_t __43__DOCDateFormatter_sharedLongDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)sharedLongDateFormatter_shared;
  sharedLongDateFormatter_shared = (uint64_t)v0;

  objc_msgSend((id)sharedLongDateFormatter_shared, "setDateStyle:", 3);
  return objc_msgSend((id)sharedLongDateFormatter_shared, "setTimeStyle:", 1);
}

+ (id)longDateStringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedLongDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
