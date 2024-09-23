@implementation FBKData

- (void)beginObservingAllUploadTasks
{
  FBKData *v2;

  v2 = self;
  sub_10005CD18();

}

- (void)allUploadTasksWithUser:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  FBKData *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10005F8D8(v7, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (id)uploadTasksFromDatabaseWithContext:(id)a3
{
  id v4;
  FBKData *v5;
  id v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_1000602F0();

  sub_100053458(0, &qword_100116958, FBKUploadTask_ptr);
  sub_100060654((unint64_t *)&unk_100116960, &qword_100116958, FBKUploadTask_ptr);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

@end
