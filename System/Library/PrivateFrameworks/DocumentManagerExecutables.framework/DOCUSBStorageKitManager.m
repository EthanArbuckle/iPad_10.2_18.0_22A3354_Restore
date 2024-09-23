@implementation DOCUSBStorageKitManager

- (_TtC26DocumentManagerExecutables23DOCUSBStorageKitManager)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables23DOCUSBStorageKitManager_prewarmStarted) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables23DOCUSBStorageKitManager_prewarmComplete) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCUSBStorageKitManager();
  return -[DOCUSBStorageKitManager init](&v3, sel_init);
}

- (void)initialPopulateComplete
{
  _TtC26DocumentManagerExecutables23DOCUSBStorageKitManager *v2;

  v2 = self;
  DOCUSBStorageKitManager.initialPopulateComplete()();

}

@end
