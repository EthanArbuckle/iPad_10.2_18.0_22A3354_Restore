@implementation DIUtilities

+ (void)onQueue:(id)a3 block:(id)a4
{
  void *v5;
  uint64_t ObjCClassMetadata;
  id v7;

  v5 = _Block_copy(a4);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v5);
  v7 = a3;
  sub_23A75CD90(a3, ObjCClassMetadata, (void (**)(_QWORD))v5);
  _Block_release(v5);

}

@end
