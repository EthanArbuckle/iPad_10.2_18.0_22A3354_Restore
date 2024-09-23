@implementation ICNAOptedInObject

+ (void)disableAnalytics
{
  _analtyicsDisabled = 1;
}

- (ICNAOptedInObject)init
{
  ICNAOptedInObject *v3;
  ICNAOptedInObject *v4;
  objc_super v6;

  if (+[ICNAOptedInObject isOptedInForAnalytics](ICNAOptedInObject, "isOptedInForAnalytics"))
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNAOptedInObject;
    self = -[ICNAOptedInObject init](&v6, sel_init);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

+ (BOOL)isOptedInForAnalytics
{
  void *v3;
  void *v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _Unwind_Exception *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  if ((_analtyicsDisabled & 1) != 0)
    return 0;
  v3 = (void *)_isOptedInNumber;
  if (!_isOptedInNumber)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v5 = (uint64_t (*)(void))getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
    v14 = getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
    if (!getDiagnosticLogSubmissionEnabledSymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getDiagnosticLogSubmissionEnabledSymbolLoc_block_invoke;
      v10[3] = &unk_1E771C138;
      v10[4] = &v11;
      __getDiagnosticLogSubmissionEnabledSymbolLoc_block_invoke((uint64_t)v10);
      v5 = (uint64_t (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)+[ICNAOptedInObject isOptedInForAnalytics].cold.1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    objc_msgSend(v4, "numberWithBool:", v5());
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_isOptedInNumber;
    _isOptedInNumber = v6;

    v8 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[ICNAOptedInObject isOptedInForAnalytics].cold.2(v8);

    v3 = (void *)_isOptedInNumber;
  }
  return objc_msgSend(v3, "BOOLValue");
}

+ (uint64_t)isOptedInForAnalytics
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[ICNAOptedInObject isOptedInForAnalytics].cold.2(v0);
}

+ (void)isOptedInForAnalytics
{
  int v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)_isOptedInNumber, "BOOLValue");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BDCEC000, a1, OS_LOG_TYPE_DEBUG, "D&U check result: %@", (uint8_t *)&v4, 0xCu);
}

@end
