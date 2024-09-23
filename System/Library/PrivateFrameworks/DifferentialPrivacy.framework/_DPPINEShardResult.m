@implementation _DPPINEShardResult

- (NSData)publicShare
{
  return (NSData *)sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPPINEShardResult_publicShare);
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
  return (NSData *)sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPPINEShardResult_nonce);
}

- (int64_t)dimension
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_dimension);
}

- (int64_t)chunkLength
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_chunkLength);
}

- (float)l2NormBound
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_l2NormBound);
}

- (_DPPINEShardResult)initWithPublicShare:(id)a3 inputShares:(id)a4 nonce:(id)a5 dimension:(int64_t)a6 chunkLength:(int64_t)a7 l2NormBound:(float)a8
{
  objc_class *ObjectType;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  objc_super v29;

  ObjectType = (objc_class *)swift_getObjectType();
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = sub_1D40056C8();
  v21 = v20;

  v22 = (objc_class *)sub_1D40058A8();
  v23 = sub_1D40056C8();
  v25 = v24;

  v26 = (uint64_t *)((char *)self + OBJC_IVAR____DPPINEShardResult_publicShare);
  *v26 = v19;
  v26[1] = v21;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_inputShares) = v22;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR____DPPINEShardResult_nonce);
  *v27 = v23;
  v27[1] = v25;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_dimension) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_chunkLength) = (Class)a7;
  *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_l2NormBound) = a8;
  v29.receiver = self;
  v29.super_class = ObjectType;
  return -[_DPPINEShardResult init](&v29, sel_init);
}

- (_DPPINEShardResult)init
{
  _DPPINEShardResult *result;

  result = (_DPPINEShardResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_publicShare), *(_QWORD *)&self->publicShare[OBJC_IVAR____DPPINEShardResult_publicShare]);
  swift_bridgeObjectRelease();
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEShardResult_nonce), *(_QWORD *)&self->publicShare[OBJC_IVAR____DPPINEShardResult_nonce]);
}

@end
