@implementation HRTapToRadarManager

+ (void)presentTapToRadarDialogueFromViewController:(id)a3
{
  id v4;

  swift_getObjCClassMetadata();
  v4 = a3;
  static TapToRadarManager.presentTapToRadarDialogue(from:)(v4);

}

- (HRTapToRadarManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapToRadarManager();
  return -[HRTapToRadarManager init](&v3, sel_init);
}

@end
