@implementation BlastDoorLiteMessageCompressor

- (id)compressData:(id)a3 codecID:(int64_t *)a4
{
  id v7;
  BlastDoorLiteMessageCompressor *v8;
  void *v9;

  v7 = a3;
  v8 = self;
  v9 = (void *)sub_1BEDE3064(a3, a4);

  return v9;
}

- (BlastDoorLiteMessageCompressor)init
{
  objc_super v4;

  LiteMessageCompressor.init()();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return -[BlastDoorLiteMessageCompressor init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
