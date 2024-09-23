@implementation EDAMTypesConstants

+ (id)CLASSIFICATION_RECIPE_USER_NON_RECIPE
{
  return CFSTR("000");
}

+ (id)CLASSIFICATION_RECIPE_USER_RECIPE
{
  return CFSTR("001");
}

+ (id)CLASSIFICATION_RECIPE_SERVICE_RECIPE
{
  return CFSTR("002");
}

+ (id)EDAM_NOTE_SOURCE_WEB_CLIP
{
  return CFSTR("web.clip");
}

+ (id)EDAM_NOTE_SOURCE_WEB_CLIP_SIMPLIFIED
{
  return CFSTR("Clearly");
}

+ (id)EDAM_NOTE_SOURCE_MAIL_CLIP
{
  return CFSTR("mail.clip");
}

+ (id)EDAM_NOTE_SOURCE_MAIL_SMTP_GATEWAY
{
  return CFSTR("mail.smtp");
}

@end
