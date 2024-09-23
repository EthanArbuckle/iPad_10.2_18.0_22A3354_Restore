@implementation RunLoopWorkerThread

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC10AirPlayKit19RunLoopWorkerThread *v5;
  uint64_t v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_255AFE878;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_22A6A5CAC();
  __swift_project_value_buffer(v6, (uint64_t)qword_255B08F48);
  sub_22A629A38(0xD00000000000005BLL, 0x800000022A6AD520, 0x74696E696564, 0xE600000000000000);
  -[RunLoopWorkerThread cancel](v5, sel_cancel);
  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[RunLoopWorkerThread dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)main
{
  void *v2;
  _TtC10AirPlayKit19RunLoopWorkerThread *v3;

  v3 = self;
  v2 = (void *)MEMORY[0x22E2DEDE0]();
  sub_22A681610(v3, (char *)v3);
  objc_autoreleasePoolPop(v2);

}

- (_TtC10AirPlayKit19RunLoopWorkerThread)init
{
  return (_TtC10AirPlayKit19RunLoopWorkerThread *)sub_22A682124();
}

@end
