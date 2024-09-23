@implementation CKPIETFKeyBlinding

+ (id)privateScalarFromSecKey:(__SecKey *)a3
{
  __SecKey *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  _s16CryptoKitPrivate18CKPIETFKeyBlindingC23privateScalarFromSecKeyy10Foundation4DataVSgSo0iJ3RefaFZ_0(v3);
  v5 = v4;
  v7 = v6;

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_1D2CAA954();
    sub_1D2C6BAE4(v5, v7);
  }
  return v8;
}

+ (BOOL)isValidWithSignature:(id)a3 for:(id)a4 with:(__SecKey *)a5 context:(id)a6
{
  id v9;
  id v10;
  __SecKey *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = sub_1D2CAA96C();
  v15 = v14;

  v16 = sub_1D2CAA96C();
  v18 = v17;

  LOBYTE(v10) = _s16CryptoKitPrivate18CKPIETFKeyBlindingC7isValid9signature3for4with7contextSb10Foundation4DataV_AKSo9SecKeyRefaSo6NSDataCtFZ_0(v13, v15, v16, v18, v11);
  sub_1D2C45258(v16, v18);
  sub_1D2C45258(v13, v15);

  return v10 & 1;
}

+ (id)blindSign:(id)a3 blindedBy:(__SecKey *)a4 with:(__SecKey *)a5 context:(id)a6 error:(id *)a7
{
  id v10;
  __SecKey *v11;
  __SecKey *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_1D2CAA96C();
  v16 = v15;

  v17 = (void *)sub_1D2C6E130(v14, v16, v11, v12, v13);
  sub_1D2C45258(v14, v16);
  return v17;
}

+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3
{
  __SecKey *v3;
  void *v4;

  v3 = a3;
  v4 = (void *)_s16CryptoKitPrivate18CKPIETFKeyBlindingC28compressedRepresentationFrom6secKeySo6NSDataCSgSo03SecJ3Refa_tFZ_0(v3);

  return v4;
}

+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)_s16CryptoKitPrivate18CKPIETFKeyBlindingC10secKeyFrom24compressedRepresentationSo03SecG3RefaSgSo6NSDataC_tFZ_0();

  return (__SecKey *)v4;
}

+ (__SecKey)blindPublicKeyWithPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  return (__SecKey *)sub_1D2C6D4C4((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1D2C6EA34);
}

+ (__SecKey)unblindPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  return (__SecKey *)sub_1D2C6D4C4((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1D2C6EF84);
}

- (_TtC16CryptoKitPrivate18CKPIETFKeyBlinding)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKPIETFKeyBlinding();
  return -[CKPIETFKeyBlinding init](&v3, sel_init);
}

@end
