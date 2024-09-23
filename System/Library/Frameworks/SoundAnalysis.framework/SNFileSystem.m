@implementation SNFileSystem

- (SNFileSystem)init
{
  SNFileSystem *result;

  sub_1D430C69C();
  return result;
}

- (void)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5
{
  void *v7;
  void *v8;
  SNFileSystem *v9;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D430CDBC();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
}

- (void)removeRequest:(id)a3
{
  SNFileSystem *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D430D548();
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
