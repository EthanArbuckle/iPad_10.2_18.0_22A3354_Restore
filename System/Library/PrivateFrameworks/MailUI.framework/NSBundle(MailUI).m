@implementation NSBundle(MailUI)

+ (id)mui_MailUIBundle
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NSBundle_MailUI__mui_MailUIBundle__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (mui_MailUIBundle_onceToken != -1)
    dispatch_once(&mui_MailUIBundle_onceToken, v3);
  return (id)mui_MailUIBundle_bundle;
}

@end
