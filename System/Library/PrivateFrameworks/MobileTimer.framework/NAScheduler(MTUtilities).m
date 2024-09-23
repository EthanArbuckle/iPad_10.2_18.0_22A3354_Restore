@implementation NAScheduler(MTUtilities)

+ (uint64_t)mtMainThreadScheduler
{
  return objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", MEMORY[0x1E0C80D38]);
}

+ (id)mtSerialSchedulerForObject:()MTUtilities
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D519E8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@.serial"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serialDispatchQueueSchedulerWithName:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
