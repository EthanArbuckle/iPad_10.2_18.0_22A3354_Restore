@implementation ObjcDiagnosticsReporter

+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t ObjCClassMetadata;
  id v9;

  v7 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  v9 = a4;
  sub_21E27A470(a3, v9, ObjCClassMetadata, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (ObjcDiagnosticsReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return -[ObjcDiagnosticsReporter init](&v3, sel_init);
}

@end
