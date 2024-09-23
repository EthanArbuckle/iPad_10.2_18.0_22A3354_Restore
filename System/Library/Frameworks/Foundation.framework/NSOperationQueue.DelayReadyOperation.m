@implementation NSOperationQueue.DelayReadyOperation

- (void)main
{
  _TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation *v2;

  v2 = self;
  NSOperationQueue.DelayReadyOperation.main()();

}

- (void)cancel
{
  objc_class *ObjectType;
  _QWORD *v4;
  uint64_t v5;
  _TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation *v6;
  void *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action);
  v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action);
  *v4 = 0;
  v4[1] = 0;
  v6 = self;
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?(v5);
  v7 = *(Class *)((char *)&v6->super.super.isa
                + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue);
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue) = 0;

  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_context) = 0;
  swift_release();
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[NSOperation cancel](&v8, sel_cancel);

}

- (BOOL)isReady
{
  _BYTE *v2;
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  if (-[NSOperation isReady](&v5, sel_isReady))
    v3 = v2[OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_readyFromAfter];
  else
    v3 = 0;

  return v3;
}

- (_TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation)init
{
  _TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation *result;

  result = (_TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue));
  swift_release();
}

@end
