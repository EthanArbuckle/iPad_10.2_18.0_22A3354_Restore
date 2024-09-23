@implementation FMFLocationDateFormatter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FMFLocationDateFormatter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_dispatch_predicate_1 != -1)
    dispatch_once(&sharedInstance_dispatch_predicate_1, block);
  return (id)sharedInstance_instance;
}

uint64_t __42__FMFLocationDateFormatter_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance_instance, "setLocalizedDateFormatFromTemplate:", CFSTR("H:mm:ss"));
}

@end
