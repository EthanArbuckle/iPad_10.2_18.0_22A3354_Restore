@implementation AlishaSPAKE2Prover

- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)initWithPassword:(id)a3 salt:(id)a4 authenticatedData:(id)a5 keyDerivationCost:(unint64_t)a6
{
  return (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover *)AlishaSPAKE2Prover.init(password:salt:authenticatedData:keyDerivationCost:)(a3, (uint64_t *)a4, a5, (uint64_t *)a6);
}

- (id)getX
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_X);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), sel_initWithBytes_length_, v2 + 32, *(_QWORD *)(v2 + 16));
}

- (id)processResponseWithY:(id)a3 M1:(id)a4
{
  id v6;
  id v7;
  _TtC16CryptoKitPrivate18AlishaSPAKE2Prover *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1D2C70E68(v6, v7);

  return v9;
}

- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)init
{
  _TtC16CryptoKitPrivate18AlishaSPAKE2Prover *result;

  result = (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_z0_self), *(_QWORD *)&self->spakeCtxData[OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_z0_self]);
  sub_1D2C45258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_z1_self), *(_QWORD *)&self->spakeCtxData[OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_z1_self]);
}

@end
