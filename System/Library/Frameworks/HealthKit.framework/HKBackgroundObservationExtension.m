@implementation HKBackgroundObservationExtension

- (HKBackgroundObservationExtension)init
{
  HKBackgroundObservationExtension *v2;
  objc_class *v3;
  objc_class *v4;
  objc_method *InstanceMethod;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKBackgroundObservationExtension;
  v2 = -[HKBackgroundObservationExtension init](&v11, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    if (InstanceMethod != class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_))
    {
      _HKInitializeLogging();
      v6 = HKLogBackgroundUpdates;
      if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_ERROR))
        -[HKBackgroundObservationExtension init].cold.1(v6);
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99750];
      NSStringFromClass(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("You have overridden 'beginRequestWithExtensionContext:' on your subclass (%@) - this is not allowed"), v9);

    }
  }
  return v2;
}

- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  char isKindOfClass;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBackgroundObservationExtension.m"), 44, CFSTR("sample type should be of quantity type"));

  }
  _HKInitializeLogging();
  v10 = HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEBUG))
    -[HKBackgroundObservationExtension didReceiveUpdateForSampleType:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  v7[2](v7);

}

- (void)backgroundObservationExtensionTimeWillExpire
{
  OUTLINED_FUNCTION_0_16(&dword_19A0E6000, a1, a3, "HealthKit extension base class received backgroundObservationExtensionTimeWillExpire", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (objc_class *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBackgroundObservationExtension.m"), 57, CFSTR("remoteContext of type: %@ is not an instance of %@"), v8, v7);

  }
  objc_msgSend(v8, "setExtensionInstance:", self);

}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "HealthKit extension was initialized but the developer is hijacking 'beginRequestWithExtensionContext:'", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)didReceiveUpdateForSampleType:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_16(&dword_19A0E6000, a1, a3, "HealthKit extension base class received didReceiveUpdateForSampleType:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
