@implementation LALocalizedString

+ (NSString)ok
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("OK"));
}

+ (id)_localizedStringWithKey:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  +[LALocalizedString _localizedStringWithKey:tableSuffix:](v3, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NSString)cancel
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("CANCEL"));
}

+ (NSString)tryAgain
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("TRY_AGAIN"));
}

+ (NSString)enterPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("ENTER_PASSCODE"));
}

+ (NSString)passcodeChangeTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_TITLE"));
}

+ (NSString)passcodeChangeOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_OLD_PASSCODE"));
}

+ (NSString)passcodeRemovalTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_TITLE"));
}

+ (NSString)passcodeRemovalOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_OLD_PASSCODE"));
}

+ (id)passcodeRemovalNotAllowedTitle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REMOVAL_NOT_ALLOWED_TITLE"), &stru_24FDCE800, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)passcodeRemovalNotAllowedText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REMOVAL_NOT_ALLOWED_TEXT"), &stru_24FDCE800, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60700], "marketingDeviceFamilyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSString)passcodeRemovalFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_FAILED_TITLE"));
}

+ (NSString)passcodeRecoveryTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_TITLE"));
}

+ (NSString)passcodeRecoveryEnabledTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_ENABLED_TITLE"));
}

+ (NSString)passcodeRecoveryDisabledTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_DISABLED_TITLE"));
}

+ (NSString)passcodeRecoveryOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_OLD_PASSCODE"));
}

+ (NSString)passcodeChangeNext
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_NEXT"));
}

+ (NSString)passcodeChangeDone
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_DONE"));
}

+ (NSString)passcodeChangeNewPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_NEW_PASSCODE"));
}

+ (NSString)passcodeChangeNewPasscodeVerify
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_NEW_PASSCODE_VERIFY"));
}

+ (NSString)passcodeRecoveryRecoveryEnabled
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_RECOVERY_ENABLED"));
}

+ (NSString)passcodeRecoveryRecoveryDisabled
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_RECOVERY_DISABLED"));
}

+ (NSString)passcodeRecoveryFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_FAILED_TITLE"));
}

+ (NSString)passcodeChangeOptions
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_RECOVERY_OPTIONS"));
}

+ (NSString)passcodeChangeUseDifferentPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_CHANGE_PASSCODE"));
}

+ (NSString)passcodeChangeErrorPasscodeIsTooEasyTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_ERROR_PASSCODE_IS_TOO_EASY_TITLE"));
}

+ (NSString)passcodeChangeErrorPasscodeIsTooEasyText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS"));
}

+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_ERROR_PASSCODE_DOES_NOT_MEET_REQUIREMENTS_TITLE"));
}

+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS"));
}

+ (NSString)passcodeChangeErrorNewPasscodeMismatchTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_ERROR_NEW_PASSCODE_MISMATCH_TITLE"));
}

+ (NSString)passcodeChangeErrorNewPasscodeMismatchText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS"));
}

+ (NSString)passcodeChangeUseAnyway
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_RECOVERY_USE_ANYWAY"));
}

+ (NSString)passcodeTypeNumericFourDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_TYPE_NUMERIC_FOUR_DIGITS"));
}

+ (NSString)passcodeTypeNumericSixDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_TYPE_NUMERIC_SIX_DIGITS"));
}

+ (NSString)passcodeTypeNumericCustomDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_TYPE_NUMERIC_CUSTOM_DIGITS"));
}

+ (NSString)passcodeTypeAlphanumeric
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_TYPE_ALPHANUMERIC"));
}

+ (NSString)passcodeTypeNone
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_TYPE_NONE"));
}

+ (NSString)passcodeChangeNotAvailable
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_NOT_AVAILABLE"));
}

+ (id)passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASSCODE_RECOVERY_ERROR_FAILED_ATTEMPTS"), &stru_24FDCE800, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)passcodeChangeBackoffMessage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MINUTES_TO_UNBLOCK"), &stru_24FDCE800, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)passcodeChangeFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_FAILED_TITLE"));
}

+ (NSString)passcodeChangeLocalizedReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_RATCHET_LOCALIZED_REASON"), CFSTR("Ratchet"));
}

+ (id)_localizedStringWithKey:(void *)a3 tableSuffix:
{
  id v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = CFSTR("Localizable");
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("Localizable"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_24FDCE800, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSString)passcodeChangeRatchetBeginTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_RATCHET_BEGIN_TITLE"), CFSTR("Ratchet"));
}

+ (NSString)passcodeChangeRatchetBeginText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_RATCHET_BEGIN_TEXT"), CFSTR("Ratchet"));
}

+ (NSString)passcodeChangeRatchetCountdownText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_RATCHET_COUNTDOWN_TEXT"), CFSTR("Ratchet"));
}

+ (NSString)passcodeChangeRatchetCalloutReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_CHANGE_RATCHET_CALLOUT_REASON"), CFSTR("Ratchet"));
}

+ (NSString)passcodeRemovalLocalizedReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_RATCHET_LOCALIZED_REASON"), CFSTR("Ratchet"));
}

+ (NSString)passcodeRemovalRatchetBeginTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_RATCHET_BEGIN_TITLE"), CFSTR("Ratchet"));
}

+ (NSString)passcodeRemovalRatchetBeginText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_RATCHET_BEGIN_TEXT"), CFSTR("Ratchet"));
}

+ (NSString)passcodeRemovalRatchetCountdownText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_RATCHET_COUNTDOWN_TEXT"), CFSTR("Ratchet"));
}

+ (NSString)passcodeRemovalRatchetCalloutReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, CFSTR("PASSCODE_REMOVAL_RATCHET_CALLOUT_REASON"), CFSTR("Ratchet"));
}

+ (NSString)passcodeVerificationTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_VERIFICATION_TITLE"));
}

+ (NSString)passcodeVerificationPrompt
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, CFSTR("PASSCODE_VERIFICATION_PROMPT"));
}

@end
