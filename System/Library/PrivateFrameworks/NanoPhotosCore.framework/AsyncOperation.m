@implementation AsyncOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isReady
{
  _TtC14NanoPhotosCore14AsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = AsyncOperation.isReady.getter();

  return v3 & 1;
}

- (BOOL)isExecuting
{
  _TtC14NanoPhotosCore14AsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = AsyncOperation.isExecuting.getter();

  return v3 & 1;
}

- (BOOL)isFinished
{
  _TtC14NanoPhotosCore14AsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = AsyncOperation.isFinished.getter();

  return v3 & 1;
}

- (void)start
{
  _TtC14NanoPhotosCore14AsyncOperation *v2;

  v2 = self;
  if (-[AsyncOperation isCancelled](v2, sel_isCancelled))
  {
    AsyncOperation.state.setter(2);
  }
  else
  {
    AsyncOperation.state.setter(0);
    -[AsyncOperation main](v2, sel_main);
  }

}

- (void)main
{
  sub_21388C574();
  __break(1u);
}

- (_TtC14NanoPhotosCore14AsyncOperation)init
{
  return (_TtC14NanoPhotosCore14AsyncOperation *)AsyncOperation.init()();
}

- (void).cxx_destruct
{

}

@end
