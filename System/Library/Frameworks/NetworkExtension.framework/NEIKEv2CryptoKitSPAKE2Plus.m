@implementation NEIKEv2CryptoKitSPAKE2Plus

- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)initWithSeed:(id)a3 initiatorID:(id)a4 responderID:(id)a5 salt:(id)a6 context:(id)a7 forInitiator:(BOOL)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33 = sub_19BEC49E4();
  v19 = v18;

  v20 = sub_19BEC49E4();
  v22 = v21;

  v23 = sub_19BEC49E4();
  v25 = v24;

  v26 = sub_19BEC49E4();
  v28 = v27;

  v29 = sub_19BEC49E4();
  v31 = v30;

  return (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *)NEIKEv2CryptoKitSPAKE2Plus.init(seed:initiatorID:responderID:salt:context:forInitiator:)(v33, v19, v20, v22, v23, v25, v26, v28, v29, v31, a8);
}

- (id)getFirstMessageAndReturnError:(id *)a3
{
  return sub_19BD1F734(self, (uint64_t)a2, (uint64_t)a3, NEIKEv2CryptoKitSPAKE2Plus.getFirstMessage());
}

- (id)processFirstPeerMessage:(id)a3 error:(id *)a4
{
  id v5;
  _TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = a3;
  v6 = self;
  v7 = sub_19BEC49E4();
  v9 = v8;

  v10 = NEIKEv2CryptoKitSPAKE2Plus.processFirstPeerMessage(_:)();
  v12 = v11;

  sub_19BD22AD8(v7, v9);
  v13 = (void *)sub_19BEC49D8();
  sub_19BD22AD8(v10, v12);
  return v13;
}

- (id)processSecondPeerMessage:(id)a3 error:(id *)a4
{
  id v5;
  _TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_19BEC49E4();
  v9 = v8;

  v10 = (void *)NEIKEv2CryptoKitSPAKE2Plus.processSecondPeerMessage(_:)();
  sub_19BD22AD8(v7, v9);
  return v10;
}

- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)init
{
  _TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *result;

  result = (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19BD238E4((uint64_t)self + OBJC_IVAR____TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus_prover, &qword_1EE411320);
  sub_19BD238E4((uint64_t)self + OBJC_IVAR____TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus_verifier, &qword_1EE411318);
}

@end
