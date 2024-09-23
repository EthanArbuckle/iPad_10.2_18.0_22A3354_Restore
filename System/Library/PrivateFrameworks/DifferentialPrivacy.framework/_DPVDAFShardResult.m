@implementation _DPVDAFShardResult

- (NSData)publicShare
{
  return (NSData *)sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPVDAFShardResult_publicShare);
}

- (NSArray)inputShares
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D400589C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSData)nonce
{
  return (NSData *)sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPVDAFShardResult_nonce);
}

- (int64_t)dimension
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_dimension);
}

- (int64_t)chunkLength
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_chunkLength);
}

- (_DPVDAFShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7
{
  objc_class *ObjectType;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  objc_super v27;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = sub_1D40056C8();
  v19 = v18;

  v20 = (objc_class *)sub_1D40058A8();
  v21 = sub_1D40056C8();
  v23 = v22;

  v24 = (uint64_t *)((char *)self + OBJC_IVAR____DPVDAFShardResult_publicShare);
  *v24 = v17;
  v24[1] = v19;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_inputShares) = v20;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____DPVDAFShardResult_nonce);
  *v25 = v21;
  v25[1] = v23;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_dimension) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_chunkLength) = (Class)a7;
  v27.receiver = self;
  v27.super_class = ObjectType;
  return -[_DPVDAFShardResult init](&v27, sel_init);
}

- (_DPVDAFShardResult)init
{
  _DPVDAFShardResult *result;

  result = (_DPVDAFShardResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_publicShare), *(_QWORD *)&self->publicShare[OBJC_IVAR____DPVDAFShardResult_publicShare]);
  swift_bridgeObjectRelease();
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPVDAFShardResult_nonce), *(_QWORD *)&self->publicShare[OBJC_IVAR____DPVDAFShardResult_nonce]);
}

@end
