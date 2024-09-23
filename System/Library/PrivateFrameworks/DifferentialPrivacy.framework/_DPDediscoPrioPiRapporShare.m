@implementation _DPDediscoPrioPiRapporShare

- (_DPDediscoPrioPiRapporShare)initWithPrioShare:(id)a3 numberOfEncodedIndices:(unint64_t)a4 piRapporOtherPhi:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v10 = sub_1D40056C8();
  v12 = v11;

  v13 = sub_1D40056C8();
  v15 = v14;

  v16 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  *v16 = v10;
  v16[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices) = (Class)a4;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  *v17 = v13;
  v17[1] = v15;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return -[_DPDediscoPrioPiRapporShare init](&v19, sel_init);
}

- (_DPDediscoPrioPiRapporShare)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = sub_1D40056C8();
  v7 = v6;

  return (_DPDediscoPrioPiRapporShare *)_DPDediscoPrioPiRapporShare.init(serializedData:)(v5, v7);
}

- (id)getPrioShare
{
  return sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
}

- (unint64_t)getNumberOfEncodedIndices
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
}

- (id)getPiRapporOtherPhi
{
  return sub_1D3FFB5B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
}

- (id)serializeAndReturnError:(id *)a3
{
  uint64_t v4;
  _BYTE *v5;
  _DPDediscoPrioPiRapporShare *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _BYTE v12[16];
  _DPDediscoPrioPiRapporShare *v13;

  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1E0C80A78]();
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = self;
  sub_1D3FFB394();
  v6 = self;
  sub_1D4005788();
  v7 = sub_1D4005764();
  v9 = v8;
  sub_1D3FFB420((uint64_t)v5);

  v10 = (void *)sub_1D40056BC();
  sub_1D3FFB3DC(v7, v9);
  return v10;
}

- (_DPDediscoPrioPiRapporShare)init
{
  _DPDediscoPrioPiRapporShare *result;

  result = (_DPDediscoPrioPiRapporShare *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare), *(_QWORD *)&self->prioShare[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare]);
  sub_1D3FFB3DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi), *(_QWORD *)&self->prioShare[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi]);
}

@end
