@implementation LSATTrackingEnforcementManager

+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3
{
  NSObject *v5;

  if ((Class)getATTrackingEnforcementManagerClass[0]())
    return objc_msgSend((Class)getATTrackingEnforcementManagerClass[0](), "shouldEnforceTrackingWithReasonCode:", a3);
  _LSDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[LSATTrackingEnforcementManager shouldEnforceTrackingWithReasonCode:].cold.1(v5);

  if (a3)
    *a3 = 0;
  return 1;
}

+ (void)shouldEnforceTrackingWithReasonCode:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Class ATTrackingEnforcementManager not found. Enforcing tracking restrictions.", v1, 2u);
}

@end
