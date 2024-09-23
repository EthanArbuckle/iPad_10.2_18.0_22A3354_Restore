@implementation AAAccessQueue

- (AAAccessQueue)initWithQueue:(id)a3
{
  id v3;
  AAAccessQueue *v4;

  v3 = a3;
  v4 = (AAAccessQueue *)sub_1A5EC0BA0(v3);

  return v4;
}

- (void).cxx_destruct
{

  swift_release();
}

- (BOOL)isEqual:(id)a3
{
  AAAccessQueue *v4;
  AAAccessQueue *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A5F645C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = AccessQueue.isEqual(_:)((uint64_t)v8);

  sub_1A5EDCB44((uint64_t)v8);
  return v6;
}

- (AAAccessQueue)init
{
  AAAccessQueue *result;

  result = (AAAccessQueue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
