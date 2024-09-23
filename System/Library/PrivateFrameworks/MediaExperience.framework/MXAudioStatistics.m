@implementation MXAudioStatistics

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_36);
  return (id)gAudioStatistics;
}

- (void)sendSinglePerformanceMessageForRoutine:(const char *)a3 operationTime:(int64_t)a4 details:(id)a5
{
  id v9;
  void *v10;
  id v11;

  if (a4 >= 250000000)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a4);
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("RoutineName"));
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("OperationDurationInNanoseconds"));
    if (a5)
      objc_msgSend(v9, "setObject:forKey:", a5, CFSTR("OperationDetails"));
    ((void (*)(id, uint64_t, uint64_t))self->mSendSingleMessage)(v9, 13, 11);

  }
}

- (void)sendSinglePerformanceMessageForAssertion:(const char *)a3 explanation:(id)a4 activity:(id)a5
{
  void *v9;
  id v10;
  void *v11;

  if (MX_FeatureFlags_IsAssertionActivityReportingEnabled())
  {
    v9 = (void *)MEMORY[0x194035B20]();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("RoutineName"));
    objc_msgSend(v10, "setObject:forKey:", a4, CFSTR("AssertionExplanation"));
    objc_msgSend(v10, "setObject:forKey:", a5, CFSTR("AssertionActivity"));
    ((void (*)(id, uint64_t, uint64_t))self->mSendSingleMessage)(v10, 13, 11);

    objc_autoreleasePoolPop(v9);
  }
}

void *__35__MXAudioStatistics_sharedInstance__block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/libAudioStatistics.dylib", 1);
  if (result)
  {
    v1 = result;
    gAudioStatistics = -[MXAudioStatistics initInternal]([MXAudioStatistics alloc], "initInternal");
    result = dlsym(v1, "CAReportingClientSendSingleMessage");
    *(_QWORD *)(gAudioStatistics + 8) = result;
  }
  return result;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXAudioStatistics;
  return -[MXAudioStatistics init](&v3, sel_init);
}

@end
