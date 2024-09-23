@implementation DOCOperation

- (_TtC26DocumentManagerExecutables12DOCOperation)init
{
  return (_TtC26DocumentManagerExecutables12DOCOperation *)DOCOperation.init()();
}

- (void)start
{
  _TtC26DocumentManagerExecutables12DOCOperation *v2;

  v2 = self;
  DOCOperation.start()();

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  _TtC26DocumentManagerExecutables12DOCOperation *v2;
  char v3;

  v2 = self;
  v3 = DOCOperation.isFinished.getter();

  return v3 & 1;
}

- (void)setFinished:(BOOL)a3
{
  _TtC26DocumentManagerExecutables12DOCOperation *v4;

  v4 = self;
  DOCOperation.isFinished.setter(a3);

}

- (BOOL)isExecuting
{
  _TtC26DocumentManagerExecutables12DOCOperation *v2;
  char v3;

  v2 = self;
  v3 = DOCOperation.isExecuting.getter();

  return v3 & 1;
}

- (void)setExecuting:(BOOL)a3
{
  _TtC26DocumentManagerExecutables12DOCOperation *v4;

  v4 = self;
  DOCOperation.isExecuting.setter(a3);

}

- (void)cancel
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCOperation();
  v2 = v3.receiver;
  -[DOCOperation cancel](&v3, sel_cancel);
  DOCOperation._finishIfCanceled()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_synchronizationQueue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_callbackQueue));
  sub_21EA5CA7C(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC26DocumentManagerExecutables12DOCOperation_finishedBlock));
}

@end
