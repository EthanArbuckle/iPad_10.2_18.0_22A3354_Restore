@implementation ICRealtimeCollaborationSelectionState

+ (void)registerWithICCRCoder
{
  void *v2;
  uint64_t ObjCClassFromMetadata;
  id v4;

  v2 = (void *)objc_opt_self();
  type metadata accessor for RealtimeCollaborationSelectionDocument.State();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (id)sub_1BDBFD6C8();
  objc_msgSend(v2, sel_registerClass_forType_, ObjCClassFromMetadata, v4);

}

- (ICRealtimeCollaborationSelectionState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ICRealtimeCollaborationSelectionState init](&v3, sel_init);
}

@end
