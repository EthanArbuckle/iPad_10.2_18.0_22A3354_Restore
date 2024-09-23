@implementation CLEmergencyEnablementAssertion

+ (id)newAssertionWithBundleId:(id)a3 bundlePath:(id)a4 reason:(id)a5 overrideDeauthorizationForBeneficiary:(BOOL)a6
{
  return (id)sub_18F5D7C54((uint64_t)a3, (const char *)a4, (uint64_t)a5, a6);
}

+ (id)newAssertionWithReason:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990190);
  v4 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    v7 = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA\"}", (uint8_t *)&v7, 0x12u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990190);
  }
  v5 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    v7 = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA", "{\"msg%{public}.0s\":\"Non-specific CLEmergencyEnablementAssertion is no longer supported #CLEEA\"}", (uint8_t *)&v7, 0x12u);
  }
  return (id)sub_18F5D7C54((uint64_t)&stru_1E2993188, &stru_1E2993188, (uint64_t)a3, 0);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)sub_18F5D7C54((uint64_t)v5, &stru_1E2993188, (uint64_t)a4, 0);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = (void *)objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (const char *)(id)objc_msgSend_copy(v5, v6, v7, v8);
  return (id)sub_18F5D7C54((uint64_t)&stru_1E2993188, v9, (uint64_t)a4, 0);
}

@end
