@implementation RecordingHelperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.RecordingHelper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.RecordingHelper"), CFSTR("_accessibilityDidStartListening"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.RecordingHelper"), CFSTR("_accessibilityDidStopListening"), "v", 0);

}

- (void)_accessibilityDidStartListening
{
  NSObject *v2;
  uint8_t v3[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_232B15000, v2, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we are recording for Translation", v3, 2u);
  }

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", MEMORY[0x24BDBD1C8]);
}

- (void)_accessibilityDidStopListening
{
  NSObject *v2;
  uint8_t v3[16];

  AXLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_232B15000, v2, OS_LOG_TYPE_DEFAULT, "Finished recording for Translation. Resetting VO quiet state.", v3, 2u);
  }

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
}

@end
