@implementation EFMainThreadScheduler

- (BOOL)prefersImmediateExecution
{
  return pthread_main_np() == 1;
}

- (EFMainThreadScheduler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EFMainThreadScheduler;
  return -[EFQueueScheduler initWithQueue:](&v3, sel_initWithQueue_, MEMORY[0x1E0C80D38]);
}

@end
