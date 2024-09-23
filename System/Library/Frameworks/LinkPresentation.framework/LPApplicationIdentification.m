@implementation LPApplicationIdentification

+ (BOOL)isCNNMobile
{
  return hasMainBundleIdentifier(CFSTR("com.cnn.iphone"));
}

+ (BOOL)isMessages
{
  return hasMainBundleIdentifier(CFSTR("com.apple.mobilesms"));
}

+ (BOOL)isMessagesViewService
{
  return hasMainBundleIdentifier(CFSTR("com.apple.mobilesms.compose"));
}

+ (BOOL)isMessagesOrMessagesViewService
{
  return +[LPApplicationIdentification isMessages](LPApplicationIdentification, "isMessages")
      || +[LPApplicationIdentification isMessagesViewService](LPApplicationIdentification, "isMessagesViewService");
}

+ (BOOL)isMobileReminders
{
  return hasMainBundleIdentifier(CFSTR("com.apple.reminders"));
}

+ (BOOL)isMobileNotes
{
  return hasMainBundleIdentifier(CFSTR("com.apple.mobilenotes"));
}

+ (BOOL)isMacNotes
{
  return hasMainBundleIdentifier(CFSTR("com.apple.Notes"));
}

+ (BOOL)isFreeform
{
  return hasMainBundleIdentifier(CFSTR("com.apple.freeform"));
}

+ (BOOL)isNotesPreviewGenerator
{
  if ((hasMainBundleIdentifier(CFSTR("com.apple.mobilenotes.LPPreviewGenerator")) & 1) != 0)
    return 1;
  else
    return hasMainBundleIdentifier(CFSTR("com.apple.Notes.LPPreviewGenerator"));
}

@end
