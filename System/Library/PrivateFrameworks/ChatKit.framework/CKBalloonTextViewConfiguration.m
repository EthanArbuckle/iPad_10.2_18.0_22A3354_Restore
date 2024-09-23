@implementation CKBalloonTextViewConfiguration

- (BOOL)textKit2Enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CKBalloonTextViewConfiguration_textKit2Enabled);
}

- (BOOL)expressiveTextEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CKBalloonTextViewConfiguration_expressiveTextEnabled);
}

+ (id)defaultConfiguration
{
  id v2;
  unsigned int v3;
  char v4;
  unsigned __int8 v5;
  objc_class *v6;
  _BYTE *v7;
  id v8;
  objc_super v10;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags);
  v3 = objc_msgSend(v2, sel_isTextKit2Enabled);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v2, sel_isExpressiveTextEnabled);
  else
    v5 = 0;
  v6 = (objc_class *)type metadata accessor for BalloonTextViewConfiguration();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___CKBalloonTextViewConfiguration_textKit2Enabled] = v4;
  v7[OBJC_IVAR___CKBalloonTextViewConfiguration_expressiveTextEnabled] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

- (CKBalloonTextViewConfiguration)init
{
  CKBalloonTextViewConfiguration *result;

  result = (CKBalloonTextViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
