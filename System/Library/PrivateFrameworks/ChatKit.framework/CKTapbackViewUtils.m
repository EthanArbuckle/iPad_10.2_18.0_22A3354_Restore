@implementation CKTapbackViewUtils

+ (id)viewFor:(id)a3 isSelected:(BOOL)a4
{
  id v6;
  _BYTE *v7;

  v6 = a3;
  v7 = _s7ChatKit16TapbackViewUtilsC4view3for10isSelectedSo09CKTapbackD8Protocol_So6UIViewCXcSo9IMTapbackCSg_SbtFZ_0(a3, a4);

  return v7;
}

- (CKTapbackViewUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackViewUtils();
  return -[CKTapbackViewUtils init](&v3, sel_init);
}

@end
