@implementation NEIKEv2CryptoKitHPKE

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyRef:(__SecKey *)a7
{
  id v11;
  id v12;
  id v13;
  __SecKey *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v29;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = sub_19BEC49E4();
  v18 = v17;

  if (v15)
  {
    v19 = sub_19BEC49E4();
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0xF000000000000000;
  }
  v22 = sub_19BEC49E4();
  v24 = v23;

  v25 = sub_19BEC49E4();
  v27 = v26;

  v28 = v16;
  v29 = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)sub_19BD22958(v16, v18, v19, v21, v22, v24, v25, v27, v14);

  sub_19BD22AD8(v25, v27);
  sub_19BD22AD8(v22, v24);
  sub_19BD22B1C(v19, v21);
  sub_19BD22AD8(v28, v18);
  return v29;
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)initWithPayload:(id)a3 aad:(id)a4 psk:(id)a5 pskID:(id)a6 keyData:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v32;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = sub_19BEC49E4();
  v35 = v17;
  v36 = v16;

  if (v15)
  {
    v18 = sub_19BEC49E4();
    v20 = v19;

  }
  else
  {
    v18 = 0;
    v20 = 0xF000000000000000;
  }
  v34 = v20;
  v21 = sub_19BEC49E4();
  v23 = v22;

  v24 = sub_19BEC49E4();
  v26 = v25;

  v27 = sub_19BEC49E4();
  v29 = v28;

  v30 = v20;
  v31 = v18;
  v32 = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)sub_19BD22B30(v36, v35, v18, v30, v21, v23, v24, v26, v27, v29);
  sub_19BD22AD8(v27, v29);
  sub_19BD22AD8(v24, v26);
  sub_19BD22AD8(v21, v23);
  sub_19BD22B1C(v31, v34);
  sub_19BD22AD8(v36, v35);
  return v32;
}

- (id)performHPKESealAndReturnError:(id *)a3
{
  return sub_19BD1F734(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))NEIKEv2CryptoKitHPKE.performHPKESeal());
}

- (id)performHPKEOpenAndReturnError:(id *)a3
{
  return sub_19BD1F734(self, (uint64_t)a2, (uint64_t)a3, NEIKEv2CryptoKitHPKE.performHPKEOpen());
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE)init
{
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *result;

  result = (_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_19BD22AD8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_payload), *(_QWORD *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_payload]);
  sub_19BD22B1C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_aad), *(_QWORD *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_aad]);
  v3 = (char *)self + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_psk;
  v4 = sub_19BEC4B70();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_19BD22AD8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_pskID), *(_QWORD *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_pskID]);
  sub_19BD23674(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_key), *(_QWORD *)&self->payload[OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitHPKE_key]);
}

@end
