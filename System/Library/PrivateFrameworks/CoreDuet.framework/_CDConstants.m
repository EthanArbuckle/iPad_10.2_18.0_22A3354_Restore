@implementation _CDConstants

+ (const)mobileMessagesBundleId
{
  objc_opt_self();
  return CFSTR("com.apple.MobileSMS");
}

+ (const)mobileMailBundleId
{
  objc_opt_self();
  return CFSTR("com.apple.mobilemail");
}

+ (const)contactsAutocompleteBundleId
{
  objc_opt_self();
  return CFSTR("com.apple.Contacts.Autocomplete");
}

+ (const)mobileCalendarBundleId
{
  objc_opt_self();
  return CFSTR("com.apple.mobilecal");
}

+ (const)mobilePhoneBundleId
{
  objc_opt_self();
  return CFSTR("com.apple.InCallService");
}

+ (const)facetimeBundleId
{
  objc_opt_self();
  objc_opt_self();
  return CFSTR("com.apple.facetime");
}

+ (const)shareSheetTargetBundleIdMessages
{
  objc_opt_self();
  return CFSTR("com.apple.UIKit.activity.Message");
}

+ (const)shareSheetTargetBundleIdMail
{
  objc_opt_self();
  return CFSTR("com.apple.UIKit.activity.Mail");
}

@end
