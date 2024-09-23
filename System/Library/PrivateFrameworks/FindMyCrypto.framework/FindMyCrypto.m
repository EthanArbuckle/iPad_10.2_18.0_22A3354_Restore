ValueMetadata *type metadata accessor for P256PrivateKey()
{
  return &type metadata for P256PrivateKey;
}

ValueMetadata *type metadata accessor for SymmetricKey256()
{
  return &type metadata for SymmetricKey256;
}

uint64_t sub_23B6973D4()
{
  _BYTE *v0;

  if (*v0)
    return 0x6574707972636E65;
  else
    return 0x727574616E676973;
}

uint64_t getEnumTagSinglePayload for KeyRepresentableInternal(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t destroy for KeyRepresentableInternal(uint64_t a1)
{
  return sub_23B6980D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

ValueMetadata *type metadata accessor for EncryptAndSignEnvelope()
{
  return &type metadata for EncryptAndSignEnvelope;
}

uint64_t storeEnumTagSinglePayload for KeyRepresentableInternal(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_23B6974E0()
{
  return 1635017060;
}

uint64_t storeEnumTagSinglePayload for EncryptAndSignEnvelope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EncryptAndSignEnvelope(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

ValueMetadata *type metadata accessor for EncryptAndSignEnvelope.CodingKeys()
{
  return &type metadata for EncryptAndSignEnvelope.CodingKeys;
}

uint64_t sub_23B6975A4()
{
  return 7955819;
}

ValueMetadata *type metadata accessor for P256PublicKey()
{
  return &type metadata for P256PublicKey;
}

uint64_t sub_23B6975C4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return EncryptAndSignEnvelope.init(from:)(a1, a2);
}

uint64_t sub_23B6975D8@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return SymmetricKey256.init(from:)(a1, a2);
}

uint64_t SymmetricKey256.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40890);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69770C();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B69770C()
{
  unint64_t result;

  result = qword_256A40888;
  if (!qword_256A40888)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEF28, &type metadata for SymmetricKey256.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40888);
  }
  return result;
}

uint64_t sub_23B697750@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return P256PrivateKey.init(from:)(a1, a2);
}

uint64_t P256PrivateKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6978C8();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B697884()
{
  unint64_t result;

  result = qword_256A40278;
  if (!qword_256A40278)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyRepresentableInternal, &type metadata for KeyRepresentableInternal);
    atomic_store(result, (unint64_t *)&qword_256A40278);
  }
  return result;
}

unint64_t sub_23B6978C8()
{
  unint64_t result;

  result = qword_256A40818;
  if (!qword_256A40818)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AECC8, &type metadata for P256PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40818);
  }
  return result;
}

uint64_t sub_23B69790C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return KeyRepresentableInternal.init(from:)(a1, a2);
}

uint64_t KeyRepresentableInternal.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40338);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B697A84();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697A40();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B697A40()
{
  unint64_t result;

  result = qword_256A40340;
  if (!qword_256A40340)
  {
    result = MEMORY[0x23B86AC88](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A40340);
  }
  return result;
}

unint64_t sub_23B697A84()
{
  unint64_t result;

  result = qword_256A40328;
  if (!qword_256A40328)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD05C, &type metadata for KeyRepresentableInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40328);
  }
  return result;
}

void P256PrivateKey.publicKey.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v1 = sub_23B6AC320();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B6AC2CC();
  MEMORY[0x24BDAC7A8]();
  v5 = v0[1];
  v9 = *v0;
  v10 = v5;
  sub_23B698550(v9, v5);
  sub_23B6AC2A8();
  sub_23B6AC290();
  sub_23B6AC308();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  __asm { BR              X10 }
}

uint64_t sub_23B697CC0(_QWORD *a1)
{
  return EncryptAndSignEnvelope.encode(to:)(a1);
}

uint64_t EncryptAndSignEnvelope.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40420);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v9 = v1[2];
  v13 = v1[3];
  v14 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B697E2C();
  sub_23B6AC50C();
  v16 = v8;
  v17 = v7;
  v18 = 0;
  sub_23B697E70();
  v10 = v15;
  sub_23B6AC458();
  if (!v10)
  {
    v16 = v14;
    v17 = v13;
    v18 = 1;
    sub_23B6AC458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23B697E2C()
{
  unint64_t result;

  result = qword_256A40428;
  if (!qword_256A40428)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD65C, &type metadata for EncryptAndSignEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40428);
  }
  return result;
}

unint64_t sub_23B697E70()
{
  unint64_t result;

  result = qword_256A40330;
  if (!qword_256A40330)
  {
    result = MEMORY[0x23B86AC88](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A40330);
  }
  return result;
}

uint64_t destroy for EncryptAndSignEnvelope(uint64_t a1)
{
  sub_23B6980D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_23B6980D8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t EncryptAndSignEnvelope.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40430);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B697E2C();
  sub_23B6AC500();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16 = a2;
  v19 = 0;
  sub_23B697A40();
  sub_23B6AC434();
  v9 = v17;
  v10 = v18;
  v19 = 1;
  sub_23B698550(v17, v18);
  sub_23B6AC434();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v17;
  v12 = v18;
  sub_23B698550(v9, v10);
  sub_23B698550(v11, v12);
  sub_23B6980D8(v9, v10);
  v13 = v16;
  *v16 = v9;
  v13[1] = v10;
  v13[2] = v11;
  v13[3] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23B6980D8(v9, v10);
  return sub_23B6980D8(v11, v12);
}

uint64_t sub_23B6980D8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

NSObject *decryptAndValidate(envelope:symmetricKey:publicKey:)(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v6 = sub_23B6AC26C();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x24BDAC7A8]();
  v47 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B6AC2F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v51 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B6AC320();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a1;
  v15 = a1[1];
  v49 = a1[2];
  v50 = v15;
  v48 = a1[3];
  v17 = *(NSObject **)a2;
  v18 = *(_QWORD *)(a2 + 8);
  v19 = a3[1];
  v52 = *a3;
  v53 = v19;
  sub_23B698550(v52, v19);
  v20 = v54;
  sub_23B6AC314();
  if (!v20)
  {
    v41 = v17;
    v42 = v8;
    v43 = v9;
    v44 = v11;
    v54 = v12;
    v52 = v16;
    v53 = v50;
    sub_23B698550(v16, v50);
    sub_23B698880();
    v21 = v51;
    sub_23B6AC2E4();
    v23 = v48;
    v22 = v49;
    v52 = v49;
    v53 = v48;
    v24 = v14;
    v25 = sub_23B6AC2FC();
    v26 = v54;
    if ((v25 & 1) != 0)
    {
      v52 = (uint64_t)v41;
      v53 = v18;
      sub_23B698550((uint64_t)v41, v18);
      sub_23B6AC254();
      sub_23B698550(v22, v23);
      sub_23B698904(v22, v23);
      v27 = v43;
      v36 = v35;
      v38 = v37;
      v17 = sub_23B6AC218();
      sub_23B6980D8(v36, v38);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v46);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v42);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v44);
    }
    else
    {
      if (qword_256A401D8 != -1)
        swift_once();
      v28 = sub_23B6AC20C();
      __swift_project_value_buffer(v28, (uint64_t)qword_256A40960);
      v17 = sub_23B6AC1F4();
      v29 = sub_23B6AC3A4();
      v30 = os_log_type_enabled(v17, v29);
      v31 = v44;
      v32 = v42;
      if (v30)
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_23B696000, v17, v29, "Invalid ECDSASignature", v33, 2u);
        MEMORY[0x23B86ACDC](v33, -1, -1);
      }

      sub_23B6A0E8C();
      swift_allocError();
      *v34 = 0;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v21, v32);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v31);
    }
  }
  return v17;
}

uint64_t *initializeBufferWithCopyOfBuffer for KeyRepresentableInternal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_23B698550(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_23B698550(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t encryptAndSign(data:symmetricKey:privateKey:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v40 = a5;
  v9 = sub_23B6AC2F0();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  MEMORY[0x24BDAC7A8]();
  v41 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_23B6AC2CC();
  v11 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8]();
  v43 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A40438);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23B6AC26C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a3;
  v20 = a3[1];
  v21 = *a4;
  v22 = a4[1];
  v46 = a1;
  v47 = a2;
  v44 = v19;
  v45 = v20;
  sub_23B698550(v19, v20);
  sub_23B6AC254();
  v23 = sub_23B6AC230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
  sub_23B698880();
  v24 = v48;
  v25 = sub_23B6AC224();
  if (v24)
  {
    sub_23B6988C4((uint64_t)v14);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    v36 = v11;
    v37 = v25;
    v48 = v26;
    sub_23B6988C4((uint64_t)v14);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v46 = v21;
    v47 = v22;
    sub_23B698550(v21, v22);
    v28 = v43;
    sub_23B6AC2A8();
    v29 = v37;
    v30 = v48;
    v46 = v37;
    v47 = v48;
    v31 = v41;
    sub_23B6AC2C0();
    v32 = sub_23B6AC2D8();
    v34 = v33;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v39);
    result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v28, v42);
    v35 = v40;
    *v40 = v32;
    v35[1] = v34;
    v35[2] = v29;
    v35[3] = v30;
  }
  return result;
}

unint64_t sub_23B698880()
{
  unint64_t result;

  result = qword_256A40250;
  if (!qword_256A40250)
  {
    result = MEMORY[0x23B86AC88](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A40250);
  }
  return result;
}

uint64_t sub_23B6988C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40438);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23B698904(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

void sub_23B69893C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    sub_23B6989F8(v1, v0);
  }
  else
  {
    v2 = sub_23B6AC23C();
    sub_23B6A1D50();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x24BDC61A0], v2);
    swift_willThrow();
    sub_23B6980D8(v1, v0);
  }
}

void sub_23B6989F8(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_23B698A5C
     + dword_23B6A0E7C[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_23B698A6C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_23B698550(v1, v0);
  sub_23B698C90(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_23B6980D8(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

_BYTE *sub_23B698C90@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23B6AB034(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23B6AB0F4((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23B698D04((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_23B698D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23B6AC104();
  swift_allocObject();
  result = sub_23B6AC0C8();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B86AC7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for KeyRepresentableInternal.CodingKeys()
{
  return &type metadata for KeyRepresentableInternal.CodingKeys;
}

unint64_t sub_23B698E48()
{
  unint64_t result;

  result = qword_256A40360;
  if (!qword_256A40360)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACFA4, &type metadata for KeyRepresentableInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40360);
  }
  return result;
}

unint64_t sub_23B698E8C()
{
  unint64_t result;

  result = qword_256A40368;
  if (!qword_256A40368)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACFCC, &type metadata for KeyRepresentableInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40368);
  }
  return result;
}

unint64_t sub_23B698ED8()
{
  unint64_t result;

  result = qword_256A40450;
  if (!qword_256A40450)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD5A4, &type metadata for EncryptAndSignEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40450);
  }
  return result;
}

unint64_t sub_23B698F1C()
{
  unint64_t result;

  result = qword_256A40458;
  if (!qword_256A40458)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD5CC, &type metadata for EncryptAndSignEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40458);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymmetricKey256.CodingKeys()
{
  return &type metadata for SymmetricKey256.CodingKeys;
}

unint64_t sub_23B698F78()
{
  unint64_t result;

  result = qword_256A408D0;
  if (!qword_256A408D0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEE70, &type metadata for SymmetricKey256.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A408D0);
  }
  return result;
}

unint64_t sub_23B698FBC()
{
  unint64_t result;

  result = qword_256A408D8;
  if (!qword_256A408D8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEE98, &type metadata for SymmetricKey256.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A408D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for P256PrivateKey.CodingKeys()
{
  return &type metadata for P256PrivateKey.CodingKeys;
}

unint64_t sub_23B699018()
{
  unint64_t result;

  result = qword_256A40860;
  if (!qword_256A40860)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEC10, &type metadata for P256PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40860);
  }
  return result;
}

unint64_t sub_23B69905C()
{
  unint64_t result;

  result = qword_256A40868;
  if (!qword_256A40868)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEC38, &type metadata for P256PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40868);
  }
  return result;
}

uint64_t sub_23B6990A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6AC20C();
  __swift_allocate_value_buffer(v0, qword_256A40948);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A40948);
  if (qword_256A401F8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A40990);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

double TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)@<D0>(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, unint64_t a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  __int128 v9;
  double result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;

  v8 = *((_QWORD *)a5 + 2);
  v9 = *a1;
  v18 = *a2;
  v19 = v9;
  v17 = *a3;
  v15 = *a5;
  v16 = v8;
  sub_23B6991B4((uint64_t *)&v19, (uint64_t *)&v18, (uint64_t *)&v17, (unint64_t *)&v15, a4, (uint64_t *)v20);
  if (!v6)
  {
    v11 = v21;
    result = *(double *)v20;
    v12 = v20[1];
    v13 = v20[2];
    v14 = v20[3];
    *(_OWORD *)a6 = v20[0];
    *(_OWORD *)(a6 + 16) = v12;
    *(_OWORD *)(a6 + 32) = v13;
    *(_OWORD *)(a6 + 48) = v14;
    *(_QWORD *)(a6 + 64) = v11;
  }
  return result;
}

uint64_t sub_23B6991B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  os_log_t log;
  NSObject *loga;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v41;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46[2];
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v6 = a1[1];
  v49 = *a1;
  v7 = *a2;
  v45 = a2[1];
  v8 = *a3;
  v9 = a3[1];
  v11 = *a4;
  v10 = a4[1];
  v12 = a4[2];
  if (!a5)
  {
    sub_23B69A8B4(v49, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v8, v9);
    sub_23B69A988(v11, v10, v12);
    sub_23B69A9A4();
    swift_allocError();
    return swift_willThrow();
  }
  if (v12 >> 60 == 15)
  {
    sub_23B698550(v8, v9);
    sub_23B698550(v8, v9);
    sub_23B699840(v49, v6);
    sub_23B698550(v7, v45);
    v14 = v8;
    v15 = v9;
    v16 = a5;
  }
  else
  {
    log = (os_log_t)(a5 - v11);
    if (a5 >= v11)
    {
      sub_23B698550(v8, v9);
      sub_23B699840(v49, v6);
      sub_23B698550(v7, v45);
      sub_23B69A9E8(v11, v10, v12);
      if (qword_256A401D0 != -1)
        swift_once();
      v21 = sub_23B6AC20C();
      __swift_project_value_buffer(v21, (uint64_t)qword_256A40948);
      sub_23B698550(v10, v12);
      v22 = sub_23B6AC1F4();
      v36 = sub_23B6AC398();
      if (os_log_type_enabled(v22, v36))
      {
        v35 = v22;
        *(_QWORD *)typea = v9;
        v23 = v6;
        v24 = v7;
        v25 = swift_slowAlloc();
        *(_DWORD *)v25 = 134218240;
        v47 = v11;
        sub_23B6AC3BC();
        v26 = v10;
        result = sub_23B69A988(v11, v10, v12);
        *(_WORD *)(v25 + 12) = 2048;
        if (a5 < (unint64_t)log)
        {
          __break(1u);
          return result;
        }
        v47 = a5 - (_QWORD)log;
        sub_23B6AC3BC();
        _os_log_impl(&dword_23B696000, v35, v36, "KeyGenerationHint hint.index:%llu saved %llu ratchet iterations", (uint8_t *)v25, 0x16u);
        MEMORY[0x23B86ACDC](v25, -1, -1);

        v27 = v11;
        v14 = v10;
        v15 = v12;
        sub_23B69A988(v27, v26, v12);
        v7 = v24;
        v6 = v23;
        v9 = *(_QWORD *)typea;
      }
      else
      {
        sub_23B69A988(v11, v10, v12);
        sub_23B69A988(v11, v10, v12);

        v14 = v10;
        v15 = v12;
      }
      v16 = (uint64_t)log;
    }
    else
    {
      sub_23B698550(v8, v9);
      sub_23B699840(v49, v6);
      sub_23B698550(v7, v45);
      if (qword_256A401D0 != -1)
        swift_once();
      v18 = sub_23B6AC20C();
      __swift_project_value_buffer(v18, (uint64_t)qword_256A40948);
      sub_23B698550(v10, v12);
      v19 = sub_23B6AC1F4();
      type = sub_23B6AC3B0();
      if (os_log_type_enabled(v19, type))
      {
        loga = v19;
        v20 = swift_slowAlloc();
        *(_DWORD *)v20 = 134218240;
        sub_23B6AC3BC();
        sub_23B69A988(v11, v10, v12);
        *(_WORD *)(v20 + 12) = 2048;
        v47 = a5;
        sub_23B6AC3BC();
        _os_log_impl(&dword_23B696000, loga, type, "Ignoring KeyGenerationHint: hint.index (%llu) > initialRatchetsToSkip(%llu)", (uint8_t *)v20, 0x16u);
        MEMORY[0x23B86ACDC](v20, -1, -1);

        sub_23B69A988(v11, v10, v12);
      }
      else
      {
        sub_23B69A988(v11, v10, v12);
        sub_23B69A988(v11, v10, v12);

      }
      v16 = a5 - 1;
      sub_23B698550(v8, v9);
      v14 = v8;
      v15 = v9;
    }
  }
  v28 = v14;
  v46[0] = v14;
  v46[1] = v15;
  sub_23B69F200(v46, v16, (uint64_t *)&v47);
  if (v44)
  {
    sub_23B6980D8(v8, v9);
    sub_23B6980D8(v7, v45);
    v29 = v49;
    sub_23B69A8B4(v49, v6);
    sub_23B69A8B4(v29, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v8, v9);
    v30 = v14;
    v31 = v15;
  }
  else
  {
    v41 = v8;
    v32 = v49;
    v43 = a5;
    v33 = v47;
    v34 = v48;
    sub_23B698550(v47, v48);
    sub_23B6980D8(v28, v15);
    sub_23B699840(v32, v6);
    sub_23B698550(v7, v45);
    sub_23B698550(v41, v9);
    sub_23B698550(v33, v34);
    sub_23B6980D8(v33, v34);
    sub_23B6980D8(v41, v9);
    sub_23B6980D8(v7, v45);
    sub_23B69A8B4(v32, v6);
    *a6 = v32;
    a6[1] = v6;
    a6[2] = v7;
    a6[3] = v45;
    a6[4] = v41;
    a6[5] = v9;
    a6[6] = v43;
    a6[7] = v33;
    a6[8] = v34;
    sub_23B69A8B4(v32, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v41, v9);
    v30 = v33;
    v31 = v34;
  }
  return sub_23B6980D8(v30, v31);
}

uint64_t TokenSequence.makeIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v10;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  sub_23B699840(v2, v3);
  sub_23B698550(v4, v5);
  sub_23B698550(v6, v10);
  return sub_23B698550(v7, v8);
}

uint64_t sub_23B699840(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B698550(a1, a2);
  return a1;
}

__n128 TokenSequence.next()@<Q0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  unint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];

  v3 = *((_QWORD *)v1 + 8);
  v4 = *v1;
  v5 = *((_QWORD *)v1 + 7);
  v6 = *((_QWORD *)v1 + 6);
  v11 = v1[1];
  v12 = v4;
  *(_QWORD *)&v10 = v5;
  *((_QWORD *)&v10 + 1) = v3;
  sub_23B698550(v5, v3);
  sub_23B69EAA8((uint64_t *)&v12, (uint64_t *)&v11, &v10, (uint64_t)(v1 + 3), (uint64_t)v1 + 56, v13);
  result = (__n128)v13[0];
  v8 = v13[1];
  v9 = v13[2];
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v3;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = v9;
  return result;
}

__n128 sub_23B699A84@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v3;
  result = *(__n128 *)(v1 + 32);
  v5 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = v2;
  return result;
}

uint64_t sub_23B699AA0()
{
  return 0;
}

uint64_t sub_23B699AA8()
{
  return 2;
}

_QWORD *sub_23B699AB0()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  _QWORD *v3;
  _OWORD v5[4];
  uint64_t v6;

  v1 = *(_OWORD *)(v0 + 48);
  v5[2] = *(_OWORD *)(v0 + 32);
  v5[3] = v1;
  v6 = *(_QWORD *)(v0 + 64);
  v2 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v2;
  v3 = sub_23B69A4C4((uint64_t)v5);
  sub_23B69A8C8(v5, (void (*)(_QWORD, _QWORD))sub_23B69A8B4, (void (*)(uint64_t, uint64_t))sub_23B6980D8);
  return v3;
}

uint64_t sub_23B699B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B699B50(a1, a2, a3);
}

uint64_t sub_23B699B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v33;
  __int128 v34;
  uint64_t v35[2];
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unint64_t v41;
  _BYTE v42[16];
  __int128 v43;

  v6 = *(_OWORD *)(v3 + 48);
  v39 = *(_OWORD *)(v3 + 32);
  v40 = v6;
  v41 = *(_QWORD *)(v3 + 64);
  v7 = *(_OWORD *)(v3 + 16);
  v37 = *(_OWORD *)v3;
  v38 = v7;
  if (!a2)
  {
    v8 = 0;
    v20 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(a1 + 48) = v20;
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(v3 + 64);
    v21 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v3;
    *(_OWORD *)(a1 + 16) = v21;
    return v8;
  }
  v8 = a3;
  if (!a3)
    goto LABEL_6;
  v9 = a2;
  v43 = *(_OWORD *)(v3 + 16);
  sub_23B69A47C(v3, (uint64_t)v42);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v10 = 0;
    do
    {
      v12 = *((_QWORD *)&v40 + 1);
      v11 = v41;
      v13 = v40;
      sub_23B69A47C((uint64_t)v42, (uint64_t)v35);
      v34 = v43;
      *(_QWORD *)&v33 = v12;
      *((_QWORD *)&v33 + 1) = v11;
      sub_23B698550(v12, v11);
      sub_23B69EAA8(v35, (uint64_t *)&v34, &v33, (uint64_t)&v40, (uint64_t)&v40 + 8, v36);
      ++v10;
      v14 = v36[0];
      v15 = v36[1];
      v16 = v36[2];
      *(_QWORD *)v9 = v13;
      *(_QWORD *)(v9 + 8) = v12;
      *(_QWORD *)(v9 + 16) = v11;
      *(_OWORD *)(v9 + 24) = v14;
      *(_OWORD *)(v9 + 40) = v15;
      *(_OWORD *)(v9 + 56) = v16;
      v9 += 72;
    }
    while (v8 != v10);
LABEL_6:
    v17 = v41;
    v18 = v38;
    *(_OWORD *)a1 = v37;
    *(_OWORD *)(a1 + 16) = v18;
    v19 = v40;
    *(_OWORD *)(a1 + 32) = v39;
    *(_OWORD *)(a1 + 48) = v19;
    *(_QWORD *)(a1 + 64) = v17;
    return v8;
  }
  __break(1u);
  swift_once();
  v22 = sub_23B6AC20C();
  __swift_project_value_buffer(v22, (uint64_t)qword_256A40948);
  v23 = v4;
  v24 = sub_23B6AC1F4();
  v25 = sub_23B6AC3A4();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138543362;
    *(_QWORD *)&v36[0] = sub_23B6AC110();
    sub_23B6AC3BC();
    *v27 = *(_QWORD *)&v36[0];
    MEMORY[0x23B86AC34](v4);
    _os_log_impl(&dword_23B696000, v24, v25, "Error in TokenSequence: %{public}@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A40218);
    swift_arrayDestroy();
    MEMORY[0x23B86ACDC](v27, -1, -1);
    MEMORY[0x23B86ACDC](v26, -1, -1);

    MEMORY[0x23B86AC34](v4);
  }
  else
  {
    MEMORY[0x23B86AC34](v4);
    MEMORY[0x23B86AC34](v4);

  }
  v28 = v41;
  v29 = v38;
  *(_OWORD *)a1 = v37;
  *(_OWORD *)(a1 + 16) = v29;
  v30 = v40;
  *(_OWORD *)(a1 + 32) = v39;
  *(_OWORD *)(a1 + 48) = v30;
  *(_QWORD *)(a1 + 64) = v28;
  return v5;
}

uint64_t sub_23B699E3C()
{
  return sub_23B6AC35C();
}

uint64_t *sub_23B699E60@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;

  if (*a2 == -1)
  {
    __break(1u);
  }
  else
  {
    v5 = result[2];
    v18 = *result;
    v19 = result[1];
    v6 = result[3];
    v7 = result[4];
    v8 = result[5];
    ++*a2;
    v9 = *a3;
    v10 = a3[1];
    *a3 = v7;
    a3[1] = v8;
    sub_23B698550(v7, v8);
    sub_23B6980D8(v9, v10);
    sub_23B698550(v7, v8);
    v11 = sub_23B6AC338();
    v13 = v12;
    sub_23B698550(v7, v8);
    sub_23B69F944(v7, v8, v11, v13, 32);
    if (v4)
    {
      sub_23B6980D8(v7, v8);
      sub_23B6980D8(v11, v13);
      return (uint64_t *)sub_23B6980D8(v7, v8);
    }
    else
    {
      v16 = v14;
      v17 = v15;
      sub_23B6980D8(v7, v8);
      sub_23B6A1EB4(v16, v17);
      sub_23B6980D8(v11, v13);
      sub_23B6980D8(v7, v8);
      *(_OWORD *)a4 = v20;
      *(_QWORD *)(a4 + 16) = v5;
      *(_QWORD *)(a4 + 24) = v6;
      *(_QWORD *)(a4 + 32) = v18;
      *(_QWORD *)(a4 + 40) = v19;
      sub_23B698550(v5, v6);
      return (uint64_t *)sub_23B699840(v18, v19);
    }
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23B69A014()
{
  unint64_t result;

  result = qword_256A40220;
  if (!qword_256A40220)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for TokenSequence, &type metadata for TokenSequence);
    atomic_store(result, (unint64_t *)&qword_256A40220);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenSequence(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TokenSequence(uint64_t *a1)
{
  unint64_t v2;

  v2 = a1[1];
  if (v2 >> 60 != 15)
    sub_23B6980D8(*a1, v2);
  sub_23B6980D8(a1[2], a1[3]);
  sub_23B6980D8(a1[4], a1[5]);
  return sub_23B6980D8(a1[7], a1[8]);
}

uint64_t initializeWithCopy for TokenSequence(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_23B698550(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[2];
  v7 = a2[3];
  sub_23B698550(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = a2[4];
  v9 = a2[5];
  sub_23B698550(v8, v9);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  v10 = a2[7];
  *(_QWORD *)(a1 + 48) = a2[6];
  v11 = a2[8];
  sub_23B698550(v10, v11);
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  return a1;
}

uint64_t *assignWithCopy for TokenSequence(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *a2;
      sub_23B698550(*a2, a2[1]);
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_23B6980D8(v7, v8);
      goto LABEL_8;
    }
    sub_23B69A26C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *a2;
  sub_23B698550(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  v9 = a2[2];
  v10 = a2[3];
  sub_23B698550(v9, v10);
  v11 = a1[2];
  v12 = a1[3];
  a1[2] = v9;
  a1[3] = v10;
  sub_23B6980D8(v11, v12);
  v13 = a2[4];
  v14 = a2[5];
  sub_23B698550(v13, v14);
  v15 = a1[4];
  v16 = a1[5];
  a1[4] = v13;
  a1[5] = v14;
  sub_23B6980D8(v15, v16);
  a1[6] = a2[6];
  v18 = a2[7];
  v17 = a2[8];
  sub_23B698550(v18, v17);
  v19 = a1[7];
  v20 = a1[8];
  a1[7] = v18;
  a1[8] = v17;
  sub_23B6980D8(v19, v20);
  return a1;
}

uint64_t sub_23B69A26C(uint64_t a1)
{
  destroy for KeyRepresentableInternal(a1);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TokenSequence(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      v6 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v5;
      sub_23B6980D8(v6, v4);
      goto LABEL_6;
    }
    sub_23B69A26C(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_23B6980D8(v7, v8);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_23B6980D8(v9, v10);
  v11 = *(_QWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = v11;
  sub_23B6980D8(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenSequence(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 24) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 24) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TokenSequence(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 72) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)(result + 24) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenSequence()
{
  return &type metadata for TokenSequence;
}

void type metadata accessor for SecKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256A40228)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256A40228);
  }
}

uint64_t sub_23B69A47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_23B69A4C4(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t i;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  __int128 *v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *result;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD *v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  _BYTE v57[16];
  __int128 v58;

  v58 = *(_OWORD *)(a1 + 16);
  sub_23B69A47C(a1, (uint64_t)v57);
  v2 = *(_OWORD *)(a1 + 48);
  v54 = *(_OWORD *)(a1 + 32);
  v55 = v2;
  v56 = *(_QWORD *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 16);
  v52 = *(_OWORD *)a1;
  v53 = v3;
  v4 = &v55;
  sub_23B69A8C8((_QWORD *)a1, (void (*)(_QWORD, _QWORD))sub_23B699840, (void (*)(uint64_t, uint64_t))sub_23B698550);
  v5 = 0;
  v45 = (_QWORD *)MEMORY[0x24BEE4AF8];
  for (i = MEMORY[0x24BEE4AF8] + 32; ; i += 72)
  {
    v8 = *((_QWORD *)&v55 + 1);
    v7 = v56;
    v9 = v55;
    sub_23B69A47C((uint64_t)v57, (uint64_t)v48);
    v47 = v58;
    *(_QWORD *)&v46 = v8;
    *((_QWORD *)&v46 + 1) = v7;
    sub_23B698550(v8, v7);
    sub_23B69EAA8(v48, (uint64_t *)&v47, &v46, (uint64_t)v4, (uint64_t)&v55 + 8, &v49);
    v10 = v49;
    v11 = v50;
    v12 = v51;
    if (!v5)
      break;
    v13 = v45;
    v14 = __OFSUB__(v5--, 1);
    if (v14)
      goto LABEL_27;
LABEL_19:
    v45 = v13;
    *(_QWORD *)i = v9;
    *(_QWORD *)(i + 8) = v8;
    *(_QWORD *)(i + 16) = v7;
    *(_OWORD *)(i + 24) = v10;
    *(_OWORD *)(i + 40) = v11;
    *(_OWORD *)(i + 56) = v12;
  }
  v15 = v45[3];
  if ((uint64_t)((v15 >> 1) + 0x4000000000000000) < 0)
    goto LABEL_28;
  v42 = v51;
  v43 = v50;
  v44 = v49;
  v16 = v4;
  v17 = v15 & 0xFFFFFFFFFFFFFFFELL;
  if (v17 <= 1)
    v18 = 1;
  else
    v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A40238);
  v19 = (_QWORD *)swift_allocObject();
  v20 = _swift_stdlib_malloc_size(v19) - 32;
  v21 = v45;
  v22 = v20 / 72;
  v19[2] = v18;
  v19[3] = 2 * (v20 / 72);
  v23 = (unint64_t)(v19 + 4);
  v24 = v45[3] >> 1;
  if (v45[2])
  {
    if (v19 != v45 || v23 >= (unint64_t)&v45[9 * v24 + 4])
    {
      memmove(v19 + 4, v45 + 4, 72 * v24);
      v21 = v45;
    }
    v21[2] = 0;
  }
  i = v23 + 72 * v24;
  v26 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
  swift_release();
  v13 = v19;
  v4 = v16;
  v11 = v43;
  v10 = v44;
  v12 = v42;
  v14 = __OFSUB__(v26, 1);
  v5 = v26 - 1;
  if (!v14)
    goto LABEL_19;
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  swift_once();
  v27 = sub_23B6AC20C();
  __swift_project_value_buffer(v27, (uint64_t)qword_256A40948);
  v28 = 0;
  v29 = sub_23B6AC1F4();
  v30 = sub_23B6AC3A4();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v31 = 138543362;
    v33 = sub_23B6AC110();
    *(_QWORD *)&v49 = v33;
    sub_23B6AC3BC();
    *v32 = v33;
    MEMORY[0x23B86AC34](0);
    _os_log_impl(&dword_23B696000, v29, v30, "Error in TokenSequence: %{public}@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A40218);
    swift_arrayDestroy();
    MEMORY[0x23B86ACDC](v32, -1, -1);
    MEMORY[0x23B86ACDC](v31, -1, -1);

    MEMORY[0x23B86AC34](0);
  }
  else
  {
    MEMORY[0x23B86AC34](0);
    MEMORY[0x23B86AC34](0);

  }
  v34 = v53;
  v35 = v54;
  v36 = *((_QWORD *)&v55 + 1);
  v37 = v56;
  sub_23B69A8B4(v52, *((unint64_t *)&v52 + 1));
  sub_23B6980D8(v34, *((unint64_t *)&v34 + 1));
  sub_23B6980D8(v35, *((unint64_t *)&v35 + 1));
  sub_23B6980D8(v36, v37);
  result = v45;
  v39 = v45[3];
  if (v39 >= 2)
  {
    v40 = v39 >> 1;
    v14 = __OFSUB__(v40, v5);
    v41 = v40 - v5;
    if (v14)
      __break(1u);
    else
      v45[2] = v41;
  }
  return result;
}

uint64_t sub_23B69A8B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B6980D8(a1, a2);
  return a1;
}

_QWORD *sub_23B69A8C8(_QWORD *a1, void (*a2)(_QWORD, _QWORD), void (*a3)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[7];
  v10 = a1[8];
  a2(*a1, a1[1]);
  a3(v5, v6);
  a3(v7, v8);
  a3(v9, v10);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23B69A988(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 60 != 15)
    return sub_23B6980D8(a2, a3);
  return result;
}

unint64_t sub_23B69A9A4()
{
  unint64_t result;

  result = qword_256A40240;
  if (!qword_256A40240)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for TokenSequenceError, &type metadata for TokenSequenceError);
    atomic_store(result, (unint64_t *)&qword_256A40240);
  }
  return result;
}

uint64_t sub_23B69A9E8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 60 != 15)
    return sub_23B698550(a2, a3);
  return result;
}

uint64_t static Advertisement.length.getter()
{
  return 28;
}

uint64_t Advertisement.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t Advertisement.hint.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;

  v1 = *v0;
  v2 = v0[1];
  sub_23B698550(v1, v2);
  v3 = sub_23B6AC068();
  sub_23B69AF78(v3, v1, v2);
  v4 = sub_23B6AC188();
  sub_23B6980D8(v6, v7);
  return v4;
}

uint64_t Advertisement.address.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *v0;
  v2 = v0[1];
  sub_23B698550(v1, v2);
  v3 = sub_23B6AC068();
  sub_23B69AF78(v3, v1, v2);
  return v5;
}

uint64_t Advertisement.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 Advertisement.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

double Advertisement.init(macAddress:pubKey2:ek:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  double v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double result;
  __int128 v13;

  v8 = COERCE_DOUBLE(sub_23B6AC05C());
  v10 = v9;
  *(double *)&v13 = v8;
  *((_QWORD *)&v13 + 1) = v9;
  sub_23B698550(*(uint64_t *)&v8, v9);
  sub_23B6AC188();
  sub_23B6980D8(*(uint64_t *)&v8, v10);
  sub_23B6AC164();
  sub_23B698550(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_23B698550(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_23B698550(a2, a3);
  sub_23B69B878(a2, a3);
  sub_23B6980D8(a2, a3);
  v11 = sub_23B6AC074();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  sub_23B6980D8(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_23B6980D8(*(uint64_t *)&v8, *((unint64_t *)&v13 + 1));
  sub_23B6980D8(a2, a3);
  result = v8;
  *a4 = v13;
  return result;
}

uint64_t Advertisement.description.getter()
{
  sub_23B69BA90();
  return sub_23B6AC368();
}

uint64_t Advertisement.hashed.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v3 = sub_23B6AC080();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v13 = v8;
  v14 = v7;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE31818], v3);
  sub_23B698550(v8, v7);
  sub_23B698880();
  v9 = sub_23B6AC08C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  result = sub_23B6980D8(v13, v14);
  *a1 = v9;
  a1[1] = v11;
  return result;
}

uint64_t sub_23B69AD54()
{
  return 1;
}

uint64_t sub_23B69AD60()
{
  return sub_23B6AC4D0();
}

uint64_t sub_23B69AD8C()
{
  return 0;
}

void sub_23B69AD98(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23B69ADA4()
{
  sub_23B69BAD4();
  return sub_23B6AC518();
}

uint64_t sub_23B69ADCC()
{
  sub_23B69BAD4();
  return sub_23B6AC524();
}

uint64_t Advertisement.encode(to:)(_QWORD *a1)
{
  return sub_23B69B278(a1, &qword_256A40258, (void (*)(void))sub_23B69BAD4);
}

uint64_t Advertisement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_23B69B3B0(a1, &qword_256A40270, (void (*)(void))sub_23B69BAD4, a2);
}

uint64_t sub_23B69AE4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 sub_23B69AE58@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B69AE64()
{
  sub_23B69BA90();
  return sub_23B6AC368();
}

uint64_t sub_23B69AEA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t sub_23B69AED4()
{
  return 28;
}

uint64_t sub_23B69AEDC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return Advertisement.init(from:)(a1, a2);
}

uint64_t sub_23B69AEF0(_QWORD *a1)
{
  return Advertisement.encode(to:)(a1);
}

void sub_23B69AF10(uint64_t *a1)
{
  sub_23B6AB2BC(*a1, a1[1]);
}

double Advertisement.nearOwner.getter@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  unint64_t v3;
  uint64_t v4;
  double result;
  __int128 v6;

  v4 = *v1;
  v3 = v1[1];
  sub_23B698550(v4, v3);
  sub_23B69AF78(6, v4, v3);
  result = *(double *)&v6;
  *a1 = v6;
  return result;
}

void sub_23B69AF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x23B69B0C0);
}

uint64_t static HashedAdvertisement.length.getter()
{
  return 32;
}

uint64_t sub_23B69B0FC()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

uint64_t sub_23B69B13C()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

uint64_t sub_23B69B178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23B6AC47C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23B69B1FC()
{
  sub_23B69BB5C();
  return sub_23B6AC518();
}

uint64_t sub_23B69B224()
{
  sub_23B69BB5C();
  return sub_23B6AC524();
}

uint64_t HashedAdvertisement.encode(to:)(_QWORD *a1)
{
  return sub_23B69B278(a1, &qword_256A40280, (void (*)(void))sub_23B69BB5C);
}

uint64_t sub_23B69B278(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v12 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v3;
  v9 = v3[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11();
  sub_23B6AC50C();
  v13 = v8;
  v14 = v9;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v7, v5);
}

uint64_t HashedAdvertisement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_23B69B3B0(a1, &qword_256A40290, (void (*)(void))sub_23B69BB5C, a2);
}

uint64_t sub_23B69B3B0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _OWORD *v10;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;

  v13 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v15 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_23B6AC500();
  if (!v4)
  {
    v10 = v13;
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v7);
    *v10 = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B69B4DC()
{
  return 32;
}

uint64_t sub_23B69B4E4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return HashedAdvertisement.init(from:)(a1, a2);
}

uint64_t sub_23B69B4F8(_QWORD *a1)
{
  return HashedAdvertisement.encode(to:)(a1);
}

uint64_t sub_23B69B50C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23B6AC4C4();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t sub_23B69B56C()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *v0;
  v1 = v0[1];
  sub_23B698550(v2, v1);
  sub_23B6AC170();
  return sub_23B6980D8(v2, v1);
}

uint64_t sub_23B69B5B8()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23B6AC4C4();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t sub_23B69B614(_QWORD *a1)
{
  return sub_23B6AB34C(*a1, a1[1]);
}

uint64_t sub_23B69B620(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  sub_23B698550(*a1, v3);
  sub_23B698550(v4, v5);
  sub_23B69CFE4(v2, v3);
  v7 = v6;
  sub_23B6980D8(v4, v5);
  sub_23B6980D8(v2, v3);
  return v7 & 1;
}

uint64_t sub_23B69B69C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23B6AC0D4();
  if (!result || (result = sub_23B6AC0F8(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23B6AC0EC();
      return sub_23B6AC14C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23B69B72C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x23B69B78CLL);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_23B69B744 + *((int *)qword_23B69B790 + (a4 >> 62))))(v5);
}

uint64_t sub_23B69B7A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_23B69B7B0 + *((int *)qword_23B69B858 + (a4 >> 62))))();
}

uint64_t sub_23B69B7C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, unsigned int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x23B69B850);
  }
  return ((uint64_t (*)(void))((char *)&loc_23B69B800 + *((int *)qword_23B69B868 + a3)))();
}

void sub_23B69B878(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_23B69B8DC
     + *((int *)qword_23B69BA80 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_23B69B8EC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_23B698550(v1, v0);
  sub_23B6AC14C();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

unint64_t sub_23B69BA90()
{
  unint64_t result;

  result = qword_256A40248;
  if (!qword_256A40248)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A40248);
  }
  return result;
}

unint64_t sub_23B69BAD4()
{
  unint64_t result;

  result = qword_256A40260;
  if (!qword_256A40260)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACCF0, &type metadata for Advertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40260);
  }
  return result;
}

unint64_t sub_23B69BB18()
{
  unint64_t result;

  result = qword_256A40268;
  if (!qword_256A40268)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyRepresentableInternal, &type metadata for KeyRepresentableInternal);
    atomic_store(result, (unint64_t *)&qword_256A40268);
  }
  return result;
}

unint64_t sub_23B69BB5C()
{
  unint64_t result;

  result = qword_256A40288;
  if (!qword_256A40288)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACCA0, &type metadata for HashedAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40288);
  }
  return result;
}

unint64_t sub_23B69BBA0(uint64_t a1)
{
  unint64_t result;

  result = sub_23B69BBC4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B69BBC4()
{
  unint64_t result;

  result = qword_256A40298;
  if (!qword_256A40298)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A40298);
  }
  return result;
}

uint64_t sub_23B69BC08(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23B69BDCC(a1, a2, a3, (uint64_t (*)(void))sub_23B69BC2C, (uint64_t (*)(void))sub_23B69BC70, (uint64_t (*)(void))sub_23B69BCB4, (uint64_t (*)(void))sub_23B69BA90);
}

unint64_t sub_23B69BC2C()
{
  unint64_t result;

  result = qword_256A402A0;
  if (!qword_256A402A0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A402A0);
  }
  return result;
}

unint64_t sub_23B69BC70()
{
  unint64_t result;

  result = qword_256A402A8;
  if (!qword_256A402A8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A402A8);
  }
  return result;
}

unint64_t sub_23B69BCB4()
{
  unint64_t result;

  result = qword_256A402B0;
  if (!qword_256A402B0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A402B0);
  }
  return result;
}

unint64_t sub_23B69BCFC()
{
  unint64_t result;

  result = qword_256A402B8;
  if (!qword_256A402B8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for Advertisement, &type metadata for Advertisement);
    atomic_store(result, (unint64_t *)&qword_256A402B8);
  }
  return result;
}

unint64_t sub_23B69BD40(uint64_t a1)
{
  unint64_t result;

  result = sub_23B69BD64();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B69BD64()
{
  unint64_t result;

  result = qword_256A402C0;
  if (!qword_256A402C0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402C0);
  }
  return result;
}

uint64_t sub_23B69BDA8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_23B69BDCC(a1, a2, a3, (uint64_t (*)(void))sub_23B69BE1C, (uint64_t (*)(void))sub_23B69BE60, (uint64_t (*)(void))sub_23B69BEA4, (uint64_t (*)(void))sub_23B69BEE8);
}

uint64_t sub_23B69BDCC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  a1[3] = a6();
  result = a7();
  a1[4] = result;
  return result;
}

unint64_t sub_23B69BE1C()
{
  unint64_t result;

  result = qword_256A402C8;
  if (!qword_256A402C8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402C8);
  }
  return result;
}

unint64_t sub_23B69BE60()
{
  unint64_t result;

  result = qword_256A402D0;
  if (!qword_256A402D0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402D0);
  }
  return result;
}

unint64_t sub_23B69BEA4()
{
  unint64_t result;

  result = qword_256A402D8;
  if (!qword_256A402D8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402D8);
  }
  return result;
}

unint64_t sub_23B69BEE8()
{
  unint64_t result;

  result = qword_256A402E0;
  if (!qword_256A402E0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402E0);
  }
  return result;
}

unint64_t sub_23B69BF30()
{
  unint64_t result;

  result = qword_256A402E8;
  if (!qword_256A402E8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for HashedAdvertisement, &type metadata for HashedAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A402E8);
  }
  return result;
}

uint64_t *assignWithTake for KeyRepresentableInternal(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_23B6980D8(v3, v4);
  return a1;
}

ValueMetadata *type metadata accessor for Advertisement()
{
  return &type metadata for Advertisement;
}

uint64_t *assignWithCopy for KeyRepresentableInternal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_23B698550(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_23B6980D8(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for HashedAdvertisement()
{
  return &type metadata for HashedAdvertisement;
}

uint64_t sub_23B69C024()
{
  return 0;
}

ValueMetadata *type metadata accessor for HashedAdvertisement.CodingKeys()
{
  return &type metadata for HashedAdvertisement.CodingKeys;
}

uint64_t getEnumTagSinglePayload for KeyRepresentableInternal.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s12FindMyCrypto19HashedAdvertisementV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B69C0D0 + 4 * asc_23B6AC860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B69C0F0 + 4 * byte_23B6AC865[v4]))();
}

_BYTE *sub_23B69C0D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B69C0F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69C0F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69C100(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69C108(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69C110(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Advertisement.CodingKeys()
{
  return &type metadata for Advertisement.CodingKeys;
}

unint64_t sub_23B69C130()
{
  unint64_t result;

  result = qword_256A402F0;
  if (!qword_256A402F0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACBC0, &type metadata for Advertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A402F0);
  }
  return result;
}

unint64_t sub_23B69C178()
{
  unint64_t result;

  result = qword_256A402F8;
  if (!qword_256A402F8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACC78, &type metadata for HashedAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A402F8);
  }
  return result;
}

unint64_t sub_23B69C1C0()
{
  unint64_t result;

  result = qword_256A40300;
  if (!qword_256A40300)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACBE8, &type metadata for HashedAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40300);
  }
  return result;
}

unint64_t sub_23B69C208()
{
  unint64_t result;

  result = qword_256A40308;
  if (!qword_256A40308)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACC10, &type metadata for HashedAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40308);
  }
  return result;
}

unint64_t sub_23B69C250()
{
  unint64_t result;

  result = qword_256A40310;
  if (!qword_256A40310)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACB30, &type metadata for Advertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40310);
  }
  return result;
}

unint64_t sub_23B69C298()
{
  unint64_t result;

  result = qword_256A40318;
  if (!qword_256A40318)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ACB58, &type metadata for Advertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40318);
  }
  return result;
}

uint64_t KeyRepresenting.init(rawValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  unint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;

  v10 = *(_QWORD *)(a4 + 8);
  v11 = *(void (**)(uint64_t, uint64_t))(v10 + 48);
  sub_23B698550(a1, a2);
  v11(a3, v10);
  sub_23B69C780(a1, a2);
  v12 = v16;
  v13 = v17;
  v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 24);
  sub_23B698550(v16, v17);
  v14(&v16, a3, a4);
  sub_23B6980D8(a1, a2);
  sub_23B6980D8(v12, v13);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 0, 1, a3);
}

uint64_t KeyRepresenting.rawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 40))();
}

uint64_t KeyRepresentableError.description.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v4;

  v2 = *(_QWORD *)v0;
  v1 = *(_QWORD *)(v0 + 8);
  if (!*(_BYTE *)(v0 + 16))
  {
    sub_23B6AC3D4();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000019;
    sub_23B6AC470();
    sub_23B6AC344();
    swift_bridgeObjectRelease();
    sub_23B6AC344();
    sub_23B6AC470();
    sub_23B6AC344();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (*(_BYTE *)(v0 + 16) == 1)
  {
    sub_23B698550(v2, v1);
    sub_23B6AC3D4();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000018;
    sub_23B698880();
    sub_23B6AC098();
    sub_23B6AC344();
    swift_bridgeObjectRelease();
    sub_23B6AC344();
    sub_23B69C8AC(v2, v1, 1);
    return v4;
  }
  if (v2 | v1)
    return 0x64696C61766E692ELL;
  else
    return 0x7479426F72657A2ELL;
}

uint64_t static KeyRepresenting.random()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 48))();
  v5 = MEMORY[0x23B86A6D0](v4);
  return KeyRepresentable<>.init(data:)(v5, v6, a1, a2);
}

uint64_t KeyRepresentable<>.init(data:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v16)(uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;

  v9 = *(_QWORD *)(a4 + 8);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 48);
  sub_23B698550(a1, a2);
  v10(a3, v9);
  sub_23B69C780(a1, a2);
  if (v4)
  {
    v11 = a1;
    v12 = a2;
  }
  else
  {
    v14 = v17;
    v13 = v18;
    v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 24);
    sub_23B698550(v17, v18);
    v16(&v17, a3, a4);
    sub_23B6980D8(a1, a2);
    v11 = v14;
    v12 = v13;
  }
  return sub_23B6980D8(v11, v12);
}

void sub_23B69C780(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_23B69C7C0(uint64_t *a1@<X8>)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (BYTE6(v2) == v4)
  {
    *a1 = v3;
    a1[1] = v2;
    return;
  }
  if (!v1)
  {
    v5 = BYTE6(v2);
    goto LABEL_9;
  }
  if (v1 != 1)
  {
    v7 = *(_QWORD *)(v3 + 16);
    v6 = *(_QWORD *)(v3 + 24);
    v5 = v6 - v7;
    if (!__OFSUB__(v6, v7))
      goto LABEL_9;
LABEL_11:
    __break(1u);
    JUMPOUT(0x23B69C89CLL);
  }
  if (__OFSUB__(HIDWORD(v3), (_DWORD)v3))
  {
    __break(1u);
    goto LABEL_11;
  }
  v5 = HIDWORD(v3) - (int)v3;
LABEL_9:
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v8 = v4;
  *(_QWORD *)(v8 + 8) = v5;
  *(_BYTE *)(v8 + 16) = 0;
  swift_willThrow();
  sub_23B6980D8(v3, v2);
}

uint64_t sub_23B69C8AC(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 == 1)
    return sub_23B6980D8(a1, a2);
  return a1;
}

uint64_t KeyRepresentableInternal.hash(into:)()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *v0;
  v1 = v0[1];
  sub_23B698550(v2, v1);
  sub_23B6AC170();
  return sub_23B6980D8(v2, v1);
}

void static KeyRepresentableInternal.== infix(_:_:)(uint64_t *a1)
{
  sub_23B69CFE4(*a1, a1[1]);
}

uint64_t sub_23B69C920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23B6AC47C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23B69C9A4()
{
  sub_23B697A84();
  return sub_23B6AC518();
}

uint64_t sub_23B69C9CC()
{
  sub_23B697A84();
  return sub_23B6AC524();
}

uint64_t KeyRepresentableInternal.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40320);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B697A84();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B697E70();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t KeyRepresentableInternal.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23B6AC4C4();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t sub_23B69CB54(_QWORD *a1)
{
  return KeyRepresentableInternal.encode(to:)(a1);
}

void sub_23B69CB68(uint64_t *a1)
{
  sub_23B69CFE4(*a1, a1[1]);
}

uint64_t SecurityKeyRepresentable.init(rawValue:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(void))(a2 + 16))();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a3, 0, 1, a1);
}

id LocationDecryptionKey.rawValue.getter()
{
  id *v0;

  return *v0;
}

uint64_t LocationDecryptionKey.init(secKey:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_23B69CBD4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *sub_23B69CBDC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_23B69CBE8@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

void sub_23B69CBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23B69CC54(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x23B69CE38);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_23B69CE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_23B69CBF4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_23B69CF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_23B6AC0D4();
  v11 = result;
  if (result)
  {
    result = sub_23B6AC0F8();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_23B6AC0EC();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_23B69CBF4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_23B69CFE4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23B69D030()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23B69D064 + dword_23B69D23C[v0 >> 62]))();
}

uint64_t sub_23B69D074@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

unint64_t sub_23B69D260()
{
  unint64_t result;

  result = qword_256A40348;
  if (!qword_256A40348)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyRepresentableInternal, &type metadata for KeyRepresentableInternal);
    atomic_store(result, (unint64_t *)&qword_256A40348);
  }
  return result;
}

unint64_t sub_23B69D2A4(uint64_t a1)
{
  unint64_t result;

  result = sub_23B69D2C8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B69D2C8()
{
  unint64_t result;

  result = qword_256A40350;
  if (!qword_256A40350)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for LocationDecryptionKey, &type metadata for LocationDecryptionKey);
    atomic_store(result, (unint64_t *)&qword_256A40350);
  }
  return result;
}

uint64_t sub_23B69D310(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 == 1)
    return sub_23B698550(a1, a2);
  return a1;
}

uint64_t destroy for KeyRepresentableError(uint64_t a1)
{
  return sub_23B69C8AC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s12FindMyCrypto21KeyRepresentableErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B69D310(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for KeyRepresentableError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B69D310(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23B69C8AC(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for KeyRepresentableError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23B69C8AC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyRepresentableError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for KeyRepresentableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B69D4B4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23B69D4CC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeyRepresentableError()
{
  return &type metadata for KeyRepresentableError;
}

uint64_t dispatch thunk of KeyRepresentable.data.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static KeyRepresentable.length.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of KeyRepresenting.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KeyRepresenting.init(key:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for KeyRepresentableInternal()
{
  return &type metadata for KeyRepresentableInternal;
}

uint64_t dispatch thunk of SecurityKeyRepresentable.init(secKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *type metadata accessor for LocationDecryptionKey()
{
  return &type metadata for LocationDecryptionKey;
}

uint64_t storeEnumTagSinglePayload for KeyRepresentableInternal.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B69D57C + 4 * byte_23B6ACD50[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B69D59C + 4 * byte_23B6ACD55[v4]))();
}

_BYTE *sub_23B69D57C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B69D59C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69D5A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69D5AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69D5B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69D5BC(_DWORD *result)
{
  *result = 0;
  return result;
}

unint64_t sub_23B69D5CC()
{
  unint64_t result;

  result = qword_256A40358;
  if (!qword_256A40358)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD034, &type metadata for KeyRepresentableInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40358);
  }
  return result;
}

unint64_t sub_23B69D610()
{
  unint64_t result;

  result = qword_256A40370;
  if (!qword_256A40370)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyRepresentableError, &type metadata for KeyRepresentableError);
    atomic_store(result, (unint64_t *)&qword_256A40370);
  }
  return result;
}

uint64_t KeyGenerationHint.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t KeyGenerationHint.sharedSecret.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  *a1 = v2;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t KeyGenerationHint.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23B6AC4E8();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  return sub_23B6980D8(v1, v2);
}

uint64_t static KeyGenerationHint.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  if (*a1 != *a2)
    return 0;
  v3 = a2[1];
  v2 = a2[2];
  v5 = a1[1];
  v4 = a1[2];
  sub_23B698550(v5, v4);
  sub_23B698550(v3, v2);
  sub_23B69CFE4(v5, v4);
  v7 = v6;
  sub_23B6980D8(v3, v2);
  sub_23B6980D8(v5, v4);
  return v7 & 1;
}

BOOL sub_23B69D754(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23B69D76C()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

uint64_t sub_23B69D7B0()
{
  return sub_23B6AC4D0();
}

uint64_t sub_23B69D7D8()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

uint64_t sub_23B69D818()
{
  _BYTE *v0;

  if (*v0)
    return 0x6553646572616873;
  else
    return 0x7865646E69;
}

uint64_t sub_23B69D858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B69E2FC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B69D87C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23B69D888()
{
  sub_23B69DDF8();
  return sub_23B6AC518();
}

uint64_t sub_23B69D8B0()
{
  sub_23B69DDF8();
  return sub_23B6AC524();
}

uint64_t KeyGenerationHint.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40378);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  v10 = *(_QWORD *)(v1 + 16);
  v11 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69DDF8();
  sub_23B6AC50C();
  LOBYTE(v12) = 0;
  sub_23B6AC464();
  if (!v2)
  {
    v12 = v11;
    v13 = v10;
    v14 = 1;
    sub_23B69DE3C();
    sub_23B6AC458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t KeyGenerationHint.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23B6AC4C4();
  sub_23B6AC4E8();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t KeyGenerationHint.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40390);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69DDF8();
  sub_23B6AC500();
  if (!v2)
  {
    LOBYTE(v12) = 0;
    v9 = sub_23B6AC440();
    v13 = 1;
    sub_23B69DE80();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v12;
    *(_QWORD *)a2 = v9;
    *(_OWORD *)(a2 + 8) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B69DBF8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23B6AC4C4();
  sub_23B6AC4E8();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t sub_23B69DC70()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23B6AC4E8();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  return sub_23B6980D8(v1, v2);
}

uint64_t sub_23B69DCC8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  sub_23B6AC4C4();
  sub_23B6AC4E8();
  sub_23B698550(v1, v2);
  sub_23B6AC170();
  sub_23B6980D8(v1, v2);
  return sub_23B6AC4F4();
}

uint64_t sub_23B69DD3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return KeyGenerationHint.init(from:)(a1, a2);
}

uint64_t sub_23B69DD50(_QWORD *a1)
{
  return KeyGenerationHint.encode(to:)(a1);
}

uint64_t sub_23B69DD64(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  if (*a1 != *a2)
    return 0;
  v3 = a2[1];
  v2 = a2[2];
  v5 = a1[1];
  v4 = a1[2];
  sub_23B698550(v5, v4);
  sub_23B698550(v3, v2);
  sub_23B69CFE4(v5, v4);
  v7 = v6;
  sub_23B6980D8(v3, v2);
  sub_23B6980D8(v5, v4);
  return v7 & 1;
}

unint64_t sub_23B69DDF8()
{
  unint64_t result;

  result = qword_256A40380;
  if (!qword_256A40380)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD258, &type metadata for KeyGenerationHint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40380);
  }
  return result;
}

unint64_t sub_23B69DE3C()
{
  unint64_t result;

  result = qword_256A40388;
  if (!qword_256A40388)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A40388);
  }
  return result;
}

unint64_t sub_23B69DE80()
{
  unint64_t result;

  result = qword_256A40398;
  if (!qword_256A40398)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A40398);
  }
  return result;
}

unint64_t sub_23B69DEC8()
{
  unint64_t result;

  result = qword_256A403A0;
  if (!qword_256A403A0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyGenerationHint, &type metadata for KeyGenerationHint);
    atomic_store(result, (unint64_t *)&qword_256A403A0);
  }
  return result;
}

uint64_t destroy for KeyGenerationHint(uint64_t a1)
{
  return sub_23B6980D8(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

_QWORD *_s12FindMyCrypto17KeyGenerationHintVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  v4 = a2[2];
  sub_23B698550(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

_QWORD *assignWithCopy for KeyGenerationHint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  sub_23B698550(v3, v4);
  v5 = a1[1];
  v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_23B6980D8(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for KeyGenerationHint(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  sub_23B6980D8(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyGenerationHint(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for KeyGenerationHint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyGenerationHint()
{
  return &type metadata for KeyGenerationHint;
}

uint64_t getEnumTagSinglePayload for KeyGenerationHint.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for KeyGenerationHint.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B69E190 + 4 * byte_23B6AD0B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B69E1C4 + 4 * byte_23B6AD0B0[v4]))();
}

uint64_t sub_23B69E1C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B69E1CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B69E1D4);
  return result;
}

uint64_t sub_23B69E1E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B69E1E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B69E1EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B69E1F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B69E200(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B69E208(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KeyGenerationHint.CodingKeys()
{
  return &type metadata for KeyGenerationHint.CodingKeys;
}

unint64_t sub_23B69E228()
{
  unint64_t result;

  result = qword_256A403A8;
  if (!qword_256A403A8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD230, &type metadata for KeyGenerationHint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A403A8);
  }
  return result;
}

unint64_t sub_23B69E270()
{
  unint64_t result;

  result = qword_256A403B0;
  if (!qword_256A403B0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD1A0, &type metadata for KeyGenerationHint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A403B0);
  }
  return result;
}

unint64_t sub_23B69E2B8()
{
  unint64_t result;

  result = qword_256A403B8;
  if (!qword_256A403B8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD1C8, &type metadata for KeyGenerationHint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A403B8);
  }
  return result;
}

uint64_t sub_23B69E2FC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_23B6AC47C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6553646572616873 && a2 == 0xEC00000074657263)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B6AC47C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t static IntermediateKey.length.getter()
{
  return 32;
}

uint64_t IntermediateKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t IntermediateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 IntermediateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B69E44C()
{
  sub_23B69E59C();
  return sub_23B6AC518();
}

uint64_t sub_23B69E474()
{
  sub_23B69E59C();
  return sub_23B6AC524();
}

uint64_t IntermediateKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A403C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69E59C();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23B69E59C()
{
  unint64_t result;

  result = qword_256A403C8;
  if (!qword_256A403C8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD4B8, &type metadata for IntermediateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A403C8);
  }
  return result;
}

uint64_t IntermediateKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A403D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69E59C();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B69E700(uint64_t a1)
{
  unint64_t result;

  result = sub_23B69E724();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B69E724()
{
  unint64_t result;

  result = qword_256A403D8;
  if (!qword_256A403D8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A403D8);
  }
  return result;
}

unint64_t sub_23B69E768(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B69E7A4();
  a1[2] = sub_23B69E7E8();
  a1[3] = sub_23B69E82C();
  result = sub_23B69E870();
  a1[4] = result;
  return result;
}

unint64_t sub_23B69E7A4()
{
  unint64_t result;

  result = qword_256A403E0;
  if (!qword_256A403E0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A403E0);
  }
  return result;
}

unint64_t sub_23B69E7E8()
{
  unint64_t result;

  result = qword_256A403E8;
  if (!qword_256A403E8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A403E8);
  }
  return result;
}

unint64_t sub_23B69E82C()
{
  unint64_t result;

  result = qword_256A403F0;
  if (!qword_256A403F0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A403F0);
  }
  return result;
}

unint64_t sub_23B69E870()
{
  unint64_t result;

  result = qword_256A403F8;
  if (!qword_256A403F8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A403F8);
  }
  return result;
}

uint64_t sub_23B69E8B4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return IntermediateKey.init(from:)(a1, a2);
}

uint64_t sub_23B69E8C8(_QWORD *a1)
{
  return IntermediateKey.encode(to:)(a1);
}

unint64_t sub_23B69E8E0()
{
  unint64_t result;

  result = qword_256A40400;
  if (!qword_256A40400)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for IntermediateKey, &type metadata for IntermediateKey);
    atomic_store(result, (unint64_t *)&qword_256A40400);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntermediateKey()
{
  return &type metadata for IntermediateKey;
}

uint64_t storeEnumTagSinglePayload for IntermediateKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B69E974 + 4 * byte_23B6AD2A8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B69E994 + 4 * byte_23B6AD2AD[v4]))();
}

_BYTE *sub_23B69E974(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B69E994(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69E99C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69E9A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B69E9AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B69E9B4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for IntermediateKey.CodingKeys()
{
  return &type metadata for IntermediateKey.CodingKeys;
}

unint64_t sub_23B69E9D4()
{
  unint64_t result;

  result = qword_256A40408;
  if (!qword_256A40408)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD490, &type metadata for IntermediateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40408);
  }
  return result;
}

unint64_t sub_23B69EA1C()
{
  unint64_t result;

  result = qword_256A40410;
  if (!qword_256A40410)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD400, &type metadata for IntermediateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40410);
  }
  return result;
}

unint64_t sub_23B69EA64()
{
  unint64_t result;

  result = qword_256A40418;
  if (!qword_256A40418)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD428, &type metadata for IntermediateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40418);
  }
  return result;
}

uint64_t sub_23B69EAA8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  return sub_23B69EAC4(a1, a2, a3, a4, a5, (void (*)(_OWORD *__return_ptr, __int128 *, uint64_t, uint64_t))sub_23B699E60, a6);
}

uint64_t sub_23B69EAC4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(_OWORD *__return_ptr, __int128 *, uint64_t, uint64_t)@<X5>, _OWORD *a7@<X8>)
{
  uint64_t v7;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  __int128 v53;
  __int128 v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  __int128 v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(_OWORD *__return_ptr, __int128 *, uint64_t, uint64_t);
  __int128 v66;
  uint64_t v67;
  unint64_t v68;
  __int128 v69;
  _OWORD v70[4];
  unint64_t v71;

  v13 = *a1;
  v12 = a1[1];
  v14 = *a2;
  v15 = a2[1];
  v66 = *a3;
  result = sub_23B69F200((uint64_t *)&v66, 1, (uint64_t *)v70);
  if (!v7)
  {
    v63 = a4;
    v64 = a5;
    v65 = a6;
    v62 = a7;
    v71 = v12;
    v17 = v70[0];
    v18 = sub_23B6AC338();
    v20 = v19;
    sub_23B698550(v17, *((unint64_t *)&v17 + 1));
    sub_23B69F944(v17, *((uint64_t *)&v17 + 1), v18, v20, 72);
    v22 = v21;
    v24 = v23;
    sub_23B6980D8(v17, *((unint64_t *)&v17 + 1));
    sub_23B6A1D98(v22, v24);
    sub_23B6980D8(v18, v20);
    v25 = v70[0];
    v26 = v71;
    if (v71 >> 60 == 15)
    {
      sub_23B698550(*(uint64_t *)&v70[0], *((unint64_t *)&v70[0] + 1));
      sub_23B698550(v14, v15);
      sub_23B69FFB8(v14, v15);
      v28 = v27;
      sub_23B6A0760();
      v60 = v31;
      MEMORY[0x23B86AB14](v28);
      sub_23B6980D8(v14, v15);
      sub_23B6980D8(v25, *((unint64_t *)&v25 + 1));
      v32 = sub_23B69F74C(v60, 0);
      v34 = v32;
      v35 = v33;
      sub_23B698550(v32, v33);
      if (qword_256A401E0 != -1)
        swift_once();
      sub_23B69CFE4(v34, v35);
      if ((v36 & 1) != 0)
      {
        sub_23B69D610();
        swift_allocError();
        *(_QWORD *)v37 = 0;
        *(_QWORD *)(v37 + 8) = 0;
        *(_BYTE *)(v37 + 16) = 2;
        swift_willThrow();
        sub_23B6980D8(v34, v35);
        sub_23B6980D8(v25, *((unint64_t *)&v25 + 1));
        v47 = v34;
        v48 = v35;
LABEL_3:
        sub_23B6980D8(v47, v48);
        return sub_23B6980D8(v17, *((unint64_t *)&v17 + 1));
      }
      v44 = sub_23B69FDB4(v34, v35);
      sub_23B6980D8((uint64_t)v44, v46);
      sub_23B69C780(v34, v35);
      v56 = *((_QWORD *)&v70[0] + 1);
      v57 = *(_QWORD *)&v70[0];
      MEMORY[0x23B86AB14](v60);
      sub_23B6980D8(v34, v35);
      v51 = v13;
    }
    else
    {
      sub_23B699840(v13, v71);
      sub_23B698550(v25, *((unint64_t *)&v25 + 1));
      sub_23B69FFB8(v13, v26);
      v30 = v29;
      sub_23B6A0760();
      v39 = v38;
      MEMORY[0x23B86AB14](v30);
      sub_23B6980D8(v25, *((unint64_t *)&v25 + 1));
      v40 = sub_23B69F74C(v39, 1);
      v42 = v41;
      v43 = sub_23B69F74C(v39, 0);
      v59 = v45;
      v61 = v43;
      sub_23B698550(v40, v42);
      PrivateKey.init(data:)(v40, v42);
      v58 = v70[0];
      sub_23B698550(v61, v59);
      if (qword_256A401E0 != -1)
        swift_once();
      sub_23B69CFE4(v61, v59);
      if ((v49 & 1) != 0)
      {
        sub_23B69D610();
        swift_allocError();
        *(_QWORD *)v50 = 0;
        *(_QWORD *)(v50 + 8) = 0;
        *(_BYTE *)(v50 + 16) = 2;
        swift_willThrow();
        sub_23B6980D8(v61, v59);
        sub_23B6980D8(v58, *((unint64_t *)&v58 + 1));
        sub_23B69A8B4(v13, v26);
        sub_23B6980D8(v25, *((unint64_t *)&v25 + 1));
        sub_23B6980D8(v40, v42);
        v47 = v61;
        v48 = v59;
        goto LABEL_3;
      }
      v52 = sub_23B69FDB4(v61, v59);
      sub_23B6980D8((uint64_t)v52, v55);
      sub_23B69C780(v61, v59);
      v56 = *((_QWORD *)&v70[0] + 1);
      v57 = *(_QWORD *)&v70[0];
      MEMORY[0x23B86AB14](v39);
      sub_23B6980D8(v61, v59);
      sub_23B6980D8(v40, v42);
      sub_23B69A8B4(v13, v71);
      v26 = *((_QWORD *)&v58 + 1);
      v51 = v58;
    }
    *(_QWORD *)&v66 = v51;
    *((_QWORD *)&v66 + 1) = v26;
    v67 = v57;
    v68 = v56;
    v69 = v17;
    sub_23B698550(v17, *((unint64_t *)&v17 + 1));
    sub_23B699840(v57, v56);
    v65(v70, &v66, v63, v64);
    sub_23B6980D8(v25, *((unint64_t *)&v25 + 1));
    sub_23B69A8B4(v57, v56);
    sub_23B6980D8(v17, *((unint64_t *)&v17 + 1));
    sub_23B69A8B4(v51, v26);
    sub_23B6980D8(v57, v56);
    result = sub_23B6980D8(v17, *((unint64_t *)&v17 + 1));
    v53 = v70[1];
    v54 = v70[2];
    *v62 = v70[0];
    v62[1] = v53;
    v62[2] = v54;
  }
  return result;
}

uint64_t sub_23B69F200@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v5 = *a1;
  v6 = a1[1];
  sub_23B698550(*a1, v6);
  v7 = sub_23B6AC338();
  v9 = v7;
  v10 = v8;
  if (a2)
  {
    v11 = (void *)MEMORY[0x23B86AB5C]();
    sub_23B698550(v5, v6);
    sub_23B69F944(v5, v6, v9, v10, 32);
    if (!v3)
    {
      v13 = v12;
      sub_23B6980D8(v5, v6);
      __asm { BR              X9 }
    }
    sub_23B6980D8(v5, v6);
    objc_autoreleasePoolPop(v11);
    sub_23B6980D8(v9, v10);
    return sub_23B6980D8(v5, v6);
  }
  else
  {
    result = sub_23B6980D8(v7, v8);
    *a3 = v5;
    a3[1] = v6;
  }
  return result;
}

uint64_t sub_23B69F420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B6A1BEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B69F444()
{
  sub_23B697E2C();
  return sub_23B6AC518();
}

uint64_t sub_23B69F46C()
{
  sub_23B697E2C();
  return sub_23B6AC524();
}

uint64_t sub_23B69F4A4()
{
  int Pair;
  char v1;
  Swift::Int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char *v7;
  char v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  char v14;

  Pair = CCECCryptorGeneratePair();
  if (Pair)
  {
    v1 = Pair;
    v2 = Pair;
    if (qword_256A401D8 != -1)
      swift_once();
    v3 = sub_23B6AC20C();
    __swift_project_value_buffer(v3, (uint64_t)qword_256A40960);
    v4 = sub_23B6AC1F4();
    v5 = sub_23B6AC3A4();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v6 = 67109120;
      v14 = v1;
      sub_23B6AC3BC();
      _os_log_impl(&dword_23B696000, v4, v5, "CCECCryptorGeneratePair failed. Status: %d", v6, 8u);
      MEMORY[0x23B86ACDC](v6, -1, -1);
    }

    CryptoError.init(rawValue:)(v2);
    sub_23B6A0E8C();
    swift_allocError();
    if (v14 == 14)
      v8 = 9;
    else
      v8 = v14;
  }
  else
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v10 = sub_23B6AC20C();
    __swift_project_value_buffer(v10, (uint64_t)qword_256A40960);
    v11 = sub_23B6AC1F4();
    v12 = sub_23B6AC3A4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23B696000, v11, v12, "Private key is not available.", v13, 2u);
      MEMORY[0x23B86ACDC](v13, -1, -1);
    }

    sub_23B6A0E8C();
    swift_allocError();
    v8 = 12;
  }
  *v7 = v8;
  return swift_willThrow();
}

uint64_t sub_23B69F74C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
    v3 = 85;
  else
    v3 = 57;
  v14 = v3;
  v16 = sub_23B6A13F0(v3);
  v17 = v4;
  sub_23B6A10D4((uint64_t)&v16);
  if (v2)
    return sub_23B6980D8(v16, v17);
  v6 = v5;
  if (v5)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v7 = sub_23B6AC20C();
    __swift_project_value_buffer(v7, (uint64_t)qword_256A40960);
    v8 = sub_23B6AC1F4();
    v9 = sub_23B6AC3A4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v10 = 67109120;
      LOBYTE(v15) = v6;
      sub_23B6AC3BC();
      _os_log_impl(&dword_23B696000, v8, v9, "Error running CCECCryptorExportKey. Code: %d", v10, 8u);
      MEMORY[0x23B86ACDC](v10, -1, -1);
    }

    CryptoError.init(rawValue:)(v6);
    sub_23B6A0E8C();
    swift_allocError();
    if (v15 == 14)
      v12 = 9;
    else
      v12 = v15;
    *v11 = v12;
    swift_willThrow();
    return sub_23B6980D8(v16, v17);
  }
  sub_23B69AF78(v14, v16, v17);
  return v15;
}

void sub_23B69F944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_23B6A13F0(a5);
  __asm { BR              X10 }
}

uint64_t sub_23B69F9B4()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  int v9;
  char *v10;
  char v11;
  int v13;
  int v14;
  char v15;
  char v16;
  char v17;
  char v18;
  __int16 v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;

  LOWORD(v14) = v3;
  BYTE2(v14) = BYTE2(v3);
  HIBYTE(v14) = BYTE3(v3);
  v15 = BYTE4(v3);
  v16 = BYTE5(v3);
  v17 = BYTE6(v3);
  v18 = HIBYTE(v3);
  v19 = v2;
  v20 = BYTE2(v2);
  v21 = BYTE3(v2);
  v22 = BYTE4(v2);
  v23 = BYTE5(v2);
  sub_23B698550(v1, v0);
  sub_23B6A048C((uint64_t)&v14, (uint64_t)&v14 + BYTE6(v2), v3, v2);
  sub_23B6980D8(v3, v2);
  sub_23B6980D8(v1, v0);
  if (v4)
    return sub_23B6980D8(v24, v25);
  if (v13)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v5 = sub_23B6AC20C();
    __swift_project_value_buffer(v5, (uint64_t)qword_256A40960);
    v6 = sub_23B6AC1F4();
    v7 = sub_23B6AC3A4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 67109120;
      v14 = v13;
      sub_23B6AC3BC();
      _os_log_impl(&dword_23B696000, v6, v7, "Error running CCDeriveKey. Code: %d.", v8, 8u);
      MEMORY[0x23B86ACDC](v8, -1, -1);
    }

    CryptoError.init(rawValue:)(v13);
    v9 = v14;
    sub_23B6A0E8C();
    swift_allocError();
    if (v9 == 14)
      v11 = 9;
    else
      v11 = v9;
    *v10 = v11;
    swift_willThrow();
    return sub_23B6980D8(v24, v25);
  }
  return v24;
}

uint8_t *sub_23B69FDB4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD *v10;
  _BYTE *v11;
  uint64_t v13;

  sub_23B69FFB8(a1, a2);
  if (v2)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v6 = sub_23B6AC20C();
    __swift_project_value_buffer(v6, (uint64_t)qword_256A40960);
    v7 = v2;
    v8 = sub_23B6AC1F4();
    v9 = sub_23B6AC3A4();
    if (os_log_type_enabled(v8, v9))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v3 = 138543362;
      v13 = sub_23B6AC110();
      sub_23B6AC3BC();
      *v10 = v13;
      MEMORY[0x23B86AC34](v2);
      _os_log_impl(&dword_23B696000, v8, v9, "Error deriving advertisementKey: %{public}@", v3, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A40218);
      swift_arrayDestroy();
      MEMORY[0x23B86ACDC](v10, -1, -1);
      MEMORY[0x23B86ACDC](v3, -1, -1);
    }
    else
    {
      MEMORY[0x23B86AC34](v2);
    }

    sub_23B6A1D0C();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
    MEMORY[0x23B86AC34](v2);
  }
  else
  {
    v5 = v4;
    v3 = (uint8_t *)sub_23B69F74C(v4, 0);
    MEMORY[0x23B86AB14](v5);
  }
  return v3;
}

void sub_23B69FFB8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6A001C()
{
  char v0;
  uint64_t result;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  char *v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  char v14;
  uint64_t v15;

  v14 = v0;
  v8 = CCECCryptorImportKey();
  v9 = v8;
  if (v8)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v10 = sub_23B6AC20C();
    __swift_project_value_buffer(v10, (uint64_t)qword_256A40960);
    v11 = sub_23B6AC1F4();
    v12 = sub_23B6AC3A4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v13 = 67109120;
      v14 = v9;
      sub_23B6AC3BC();
      _os_log_impl(&dword_23B696000, v11, v12, "Error running CCECCryptorImportKey. Code: %d", v13, 8u);
      MEMORY[0x23B86ACDC](v13, -1, -1);
    }

    CryptoError.init(rawValue:)(v9);
    sub_23B6A0E8C();
    swift_allocError();
    if (v14 == 14)
      v7 = 9;
    else
      v7 = v14;
  }
  else
  {
    result = v15;
    if (v15)
      return result;
    if (qword_256A401D8 != -1)
      swift_once();
    v2 = sub_23B6AC20C();
    __swift_project_value_buffer(v2, (uint64_t)qword_256A40960);
    v3 = sub_23B6AC1F4();
    v4 = sub_23B6AC3A4();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B696000, v3, v4, "CryptoUtil: diversifyKey: CryptorRef was not populated as expected.", v5, 2u);
      MEMORY[0x23B86ACDC](v5, -1, -1);
    }

    sub_23B6A0E8C();
    swift_allocError();
    v7 = 9;
  }
  *v6 = v7;
  return swift_willThrow();
}

uint64_t sub_23B6A048C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;

  if (a1)
    __asm { BR              X11 }
  sub_23B6A0E8C();
  swift_allocError();
  *v4 = 3;
  return swift_willThrow();
}

void sub_23B6A0760()
{
  sub_23B6AC17C();
  JUMPOUT(0x23B6A0930);
}

uint64_t sub_23B6A07E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))((char *)&loc_23B6A0864 + dword_23B6A0DFC[v3 >> 62]))(a1, a2, a3, 0);
}

uint8_t *sub_23B6A0874()
{
  uint64_t v0;
  uint8_t *v1;
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  char *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;

  v0 = CCECCryptorTwinDiversifyKey();
  v1 = (uint8_t *)v0;
  v2 = v14 | ((unint64_t)v15 << 32) | ((unint64_t)v16 << 40);
  v18 = v13;
  v19 = v2 | ((unint64_t)v17 << 48);
  if ((_DWORD)v0)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v8 = sub_23B6AC20C();
    __swift_project_value_buffer(v8, (uint64_t)qword_256A40960);
    v9 = sub_23B6AC1F4();
    v10 = sub_23B6AC3A4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 67109120;
      LOBYTE(v13) = (_BYTE)v1;
      sub_23B6AC3BC();
      _os_log_impl(&dword_23B696000, v9, v10, "Error running CCECCryptorTwinDiversifyKey. Code: %d.", v11, 8u);
      MEMORY[0x23B86ACDC](v11, -1, -1);
    }

    CryptoError.init(rawValue:)((int)v1);
    sub_23B6A0E8C();
    swift_allocError();
    if (v13 == 14)
      v7 = 9;
    else
      v7 = v13;
LABEL_17:
    *v6 = v7;
    swift_willThrow();
    sub_23B6980D8(v18, v19);
    return v1;
  }
  v1 = v20;
  if (!v20)
  {
    if (qword_256A401D8 != -1)
      swift_once();
    v3 = sub_23B6AC20C();
    __swift_project_value_buffer(v3, (uint64_t)qword_256A40960);
    v4 = sub_23B6AC1F4();
    v5 = sub_23B6AC3A4();
    if (os_log_type_enabled(v4, v5))
    {
      v1 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_23B696000, v4, v5, "CryptoUtil: diversifyKey: CryptorRef was not populated as expected.", v1, 2u);
      MEMORY[0x23B86ACDC](v1, -1, -1);
    }

    sub_23B6A0E8C();
    swift_allocError();
    v7 = 9;
    goto LABEL_17;
  }
  sub_23B6980D8(v13, v2 | ((unint64_t)v17 << 48));
  return v1;
}

uint64_t sub_23B6A0E0C()
{
  uint64_t v0;

  v0 = sub_23B6AC20C();
  __swift_allocate_value_buffer(v0, qword_256A40960);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A40960);
  return sub_23B6AC200();
}

unint64_t sub_23B6A0E8C()
{
  unint64_t result;

  result = qword_256A40440;
  if (!qword_256A40440)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for CryptoError, &type metadata for CryptoError);
    atomic_store(result, (unint64_t *)&qword_256A40440);
  }
  return result;
}

uint64_t *initializeWithCopy for EncryptAndSignEnvelope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_23B698550(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v7 = a2[2];
  v6 = a2[3];
  sub_23B698550(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for EncryptAndSignEnvelope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  sub_23B698550(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_23B6980D8(v6, v7);
  v9 = a2[2];
  v8 = a2[3];
  sub_23B698550(v9, v8);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_23B6980D8(v10, v11);
  return a1;
}

uint64_t *assignWithTake for EncryptAndSignEnvelope(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_23B6980D8(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_23B6980D8(v6, v7);
  return a1;
}

uint64_t storeEnumTagSinglePayload for EncryptAndSignEnvelope.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B6A101C + 4 * byte_23B6AD525[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B6A1050 + 4 * byte_23B6AD520[v4]))();
}

uint64_t sub_23B6A1050(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A1058(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6A1060);
  return result;
}

uint64_t sub_23B6A106C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6A1074);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B6A1078(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A1080(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

unint64_t sub_23B6A1090()
{
  unint64_t result;

  result = qword_256A40448;
  if (!qword_256A40448)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD634, &type metadata for EncryptAndSignEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40448);
  }
  return result;
}

void sub_23B6A10D4(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23B6A1138@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;
  unsigned int v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  LOWORD(v4) = a1;
  BYTE2(v4) = BYTE2(a1);
  HIBYTE(v4) = BYTE3(a1);
  v5 = BYTE4(a1);
  v6 = BYTE5(a1);
  v7 = BYTE6(a1);
  result = CCECCryptorExportKey();
  *v1 = v2;
  v1[1] = v4 | ((unint64_t)v5 << 32) | ((unint64_t)v6 << 40) | ((unint64_t)v7 << 48);
  return result;
}

uint64_t sub_23B6A13F0(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_23B6AC104();
      swift_allocObject();
      sub_23B6AC0E0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23B6AC140();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void sub_23B6A148C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (sub_23B6AC0D4())
  {
    if (!__OFSUB__(a1, sub_23B6AC0F8()))
    {
      sub_23B6AC0EC();
      __asm { BR              X10 }
    }
    __break(1u);
    JUMPOUT(0x23B6A1578);
  }
  __break(1u);
  JUMPOUT(0x23B6A1584);
}

void sub_23B6A1594(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23B6A1600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v4;

  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))((char *)&loc_23B6A1684
                                                                   + *((int *)qword_23B6A19E8 + (v3 >> 62))))(*v4, a2, a3, 0);
}

uint64_t sub_23B6A1694()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  unsigned int v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v1 = CCDeriveKey();
  CCKDFParametersDestroy();
  *v0 = v3;
  v0[1] = v4 | ((unint64_t)v5 << 32) | ((unint64_t)v6 << 40) | ((unint64_t)v7 << 48);
  return v1;
}

uint64_t sub_23B6A19F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v13;
  _BYTE *v14;

  v7 = v6;
  if (!sub_23B6AC0D4())
  {
    sub_23B6AC0EC();
    sub_23B6A0E8C();
    swift_allocError();
    *v14 = 3;
    swift_willThrow();
    sub_23B6980D8(a5, a6);
    return v7;
  }
  result = sub_23B6AC0F8();
  if (!__OFSUB__(a1, result))
  {
    sub_23B6AC0EC();
    sub_23B698550(a5, a6);
    sub_23B6A1594(a3);
    v7 = v13;
    sub_23B6980D8(a5, a6);
    sub_23B6980D8(a5, a6);
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6A1B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  result = sub_23B6AC0D4();
  v10 = result;
  if (result)
  {
    result = sub_23B6AC0F8();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v10 += a1 - result;
  }
  v11 = __OFSUB__(a2, a1);
  v12 = a2 - a1;
  if (v11)
  {
    __break(1u);
    goto LABEL_15;
  }
  v13 = sub_23B6AC0EC();
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  v15 = v10 + v14;
  if (v10)
    v16 = v15;
  else
    v16 = 0;
  result = sub_23B6A048C(v10, v16, a4, a5);
  if (!v17)
    return v18;
  return result;
}

uint64_t sub_23B6A1BEC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x727574616E676973 && a2 == 0xE900000000000065;
  if (v2 || (sub_23B6AC47C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574707972636E65 && a2 == 0xED00006174614464)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B6AC47C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_23B6A1D0C()
{
  unint64_t result;

  result = qword_256A40460;
  if (!qword_256A40460)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for CryptoTokenError, &type metadata for CryptoTokenError);
    atomic_store(result, (unint64_t *)&qword_256A40460);
  }
  return result;
}

unint64_t sub_23B6A1D50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A40468;
  if (!qword_256A40468)
  {
    v1 = sub_23B6AC23C();
    result = MEMORY[0x23B86AC88](MEMORY[0x24BDC61C0], v1);
    atomic_store(result, (unint64_t *)&qword_256A40468);
  }
  return result;
}

void sub_23B6A1D98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_23B6A1DD4(uint64_t *a1@<X8>)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (BYTE6(v2) == 72)
  {
    *a1 = v3;
    a1[1] = v2;
    return;
  }
  if (!v1)
  {
    v4 = BYTE6(v2);
    goto LABEL_9;
  }
  if (v1 != 1)
  {
    v6 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v3 + 24);
    v4 = v5 - v6;
    if (!__OFSUB__(v5, v6))
      goto LABEL_9;
LABEL_11:
    __break(1u);
    JUMPOUT(0x23B6A1EA4);
  }
  if (__OFSUB__(HIDWORD(v3), (_DWORD)v3))
  {
    __break(1u);
    goto LABEL_11;
  }
  v4 = HIDWORD(v3) - (int)v3;
LABEL_9:
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v7 = 72;
  *(_QWORD *)(v7 + 8) = v4;
  *(_BYTE *)(v7 + 16) = 0;
  swift_willThrow();
  sub_23B6980D8(v3, v2);
}

void sub_23B6A1EB4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_23B6A1EF0(uint64_t *a1@<X8>)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (BYTE6(v2) == 32)
  {
    *a1 = v3;
    a1[1] = v2;
    return;
  }
  if (!v1)
  {
    v4 = BYTE6(v2);
    goto LABEL_9;
  }
  if (v1 != 1)
  {
    v6 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v3 + 24);
    v4 = v5 - v6;
    if (!__OFSUB__(v5, v6))
      goto LABEL_9;
LABEL_11:
    __break(1u);
    JUMPOUT(0x23B6A1FC0);
  }
  if (__OFSUB__(HIDWORD(v3), (_DWORD)v3))
  {
    __break(1u);
    goto LABEL_11;
  }
  v4 = HIDWORD(v3) - (int)v3;
LABEL_9:
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v7 = 32;
  *(_QWORD *)(v7 + 8) = v4;
  *(_BYTE *)(v7 + 16) = 0;
  swift_willThrow();
  sub_23B6980D8(v3, v2);
}

void sub_23B6A1FD0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

void sub_23B6A200C(uint64_t *a1@<X8>)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (BYTE6(v2) == 28)
  {
    *a1 = v3;
    a1[1] = v2;
    return;
  }
  if (!v1)
  {
    v4 = BYTE6(v2);
    goto LABEL_9;
  }
  if (v1 != 1)
  {
    v6 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v3 + 24);
    v4 = v5 - v6;
    if (!__OFSUB__(v5, v6))
      goto LABEL_9;
LABEL_11:
    __break(1u);
    JUMPOUT(0x23B6A20DCLL);
  }
  if (__OFSUB__(HIDWORD(v3), (_DWORD)v3))
  {
    __break(1u);
    goto LABEL_11;
  }
  v4 = HIDWORD(v3) - (int)v3;
LABEL_9:
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v7 = 28;
  *(_QWORD *)(v7 + 8) = v4;
  *(_BYTE *)(v7 + 16) = 0;
  swift_willThrow();
  sub_23B6980D8(v3, v2);
}

uint64_t DiversifiedRootKeys.intermediateKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B699840(v2, v3);
}

uint64_t DiversifiedRootKeys.publicKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t DiversifiedRootKeys.privateKey.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_23B699840(v2, v3);
}

uint64_t DiversifiedRootKeys.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v1 = v0[2];
  v4 = v0[3];
  v3 = v0[4];
  v5 = v0[5];
  if (v2 >> 60 == 15)
  {
    sub_23B6AC4DC();
  }
  else
  {
    v6 = *v0;
    sub_23B6AC4DC();
    sub_23B698550(v6, v2);
    sub_23B6AC170();
    sub_23B69A8B4(v6, v2);
  }
  sub_23B698550(v1, v4);
  sub_23B6AC170();
  sub_23B6980D8(v1, v4);
  if (v5 >> 60 == 15)
    return sub_23B6AC4DC();
  sub_23B6AC4DC();
  sub_23B698550(v3, v5);
  sub_23B6AC170();
  return sub_23B69A8B4(v3, v5);
}

BOOL sub_23B6A2230(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B6A2244()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x654B63696C627570;
  if (*v0 != 1)
    v1 = 0x4B65746176697270;
  if (*v0)
    return v1;
  else
    return 0x64656D7265746E69;
}

uint64_t sub_23B6A22B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B6A355C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23B6A22D8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23B6A22E4()
{
  sub_23B6A2D74();
  return sub_23B6AC518();
}

uint64_t sub_23B6A230C()
{
  sub_23B6A2D74();
  return sub_23B6AC524();
}

uint64_t DiversifiedRootKeys.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256A40470) - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v9 = v1[2];
  v20 = v1[3];
  v21 = v9;
  v10 = v1[4];
  v18 = v1[5];
  v19 = v10;
  v11 = a1[3];
  v12 = a1;
  v14 = v13;
  __swift_project_boxed_opaque_existential_1(v12, v11);
  sub_23B6A2D74();
  sub_23B6AC50C();
  v22 = v8;
  v23 = v7;
  v24 = 0;
  sub_23B69E7E8();
  sub_23B6AC44C();
  if (!v2)
  {
    v16 = v18;
    v15 = v19;
    v22 = v21;
    v23 = v20;
    v24 = 1;
    sub_23B6A2DB8();
    sub_23B6AC458();
    v22 = v15;
    v23 = v16;
    v24 = 2;
    sub_23B6A2DFC();
    sub_23B6AC44C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v14);
}

uint64_t DiversifiedRootKeys.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  sub_23B6AC4C4();
  sub_23B6AC4DC();
  if (v2 >> 60 != 15)
  {
    sub_23B698550(v1, v2);
    sub_23B6AC170();
    sub_23B69A8B4(v1, v2);
  }
  sub_23B698550(v3, v4);
  sub_23B6AC170();
  sub_23B6980D8(v3, v4);
  sub_23B6AC4DC();
  if (v6 >> 60 != 15)
  {
    sub_23B698550(v5, v6);
    sub_23B6AC170();
    sub_23B69A8B4(v5, v6);
  }
  return sub_23B6AC4F4();
}

uint64_t DiversifiedRootKeys.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v20[2];
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40490);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A2D74();
  sub_23B6AC500();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v25 = 0;
  sub_23B69E7A4();
  sub_23B6AC428();
  v10 = v23;
  v9 = v24;
  v25 = 1;
  sub_23B699840(v23, v24);
  sub_23B6A2E40();
  sub_23B6AC434();
  v22 = v9;
  v11 = v23;
  v25 = 2;
  v21 = v24;
  sub_23B698550(v23, v24);
  sub_23B6A2E84();
  v20[1] = 0;
  sub_23B6AC428();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v23;
  v13 = v24;
  v14 = v11;
  v15 = v10;
  v16 = v10;
  v17 = v22;
  sub_23B699840(v16, v22);
  v18 = v21;
  sub_23B698550(v14, v21);
  sub_23B699840(v12, v13);
  sub_23B6980D8(v14, v18);
  sub_23B69A8B4(v15, v17);
  *a2 = v15;
  a2[1] = v17;
  a2[2] = v14;
  a2[3] = v18;
  a2[4] = v12;
  a2[5] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23B69A8B4(v15, v17);
  sub_23B6980D8(v14, v18);
  return sub_23B69A8B4(v12, v13);
}

uint64_t sub_23B6A28CC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  sub_23B6AC4C4();
  sub_23B6AC4DC();
  if (v2 >> 60 != 15)
  {
    sub_23B698550(v1, v2);
    sub_23B6AC170();
    sub_23B69A8B4(v1, v2);
  }
  sub_23B698550(v3, v4);
  sub_23B6AC170();
  sub_23B6980D8(v3, v4);
  sub_23B6AC4DC();
  if (v6 >> 60 != 15)
  {
    sub_23B698550(v5, v6);
    sub_23B6AC170();
    sub_23B69A8B4(v5, v6);
  }
  return sub_23B6AC4F4();
}

uint64_t sub_23B6A29E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return DiversifiedRootKeys.init(from:)(a1, a2);
}

uint64_t sub_23B6A29F4(_QWORD *a1)
{
  return DiversifiedRootKeys.encode(to:)(a1);
}

uint64_t DiversifiedRootKeys.advertisement.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  sub_23B698550(v1, v2);
  sub_23B698550(v1, v2);
  v3 = sub_23B69FDB4(v1, v2);
  v5 = v4;
  sub_23B6980D8(v1, v2);
  sub_23B6A1FD0((uint64_t)v3, v5);
  return sub_23B6980D8(v1, v2);
}

BOOL _s12FindMyCrypto19DiversifiedRootKeysV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v22 = a1[4];
  v23 = a1[5];
  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  v9 = a2[3];
  v10 = a2[4];
  v11 = a2[5];
  if (v3 >> 60 == 15)
  {
    if (v7 >> 60 == 15)
      goto LABEL_8;
LABEL_5:
    sub_23B699840(v2, v3);
    sub_23B699840(v6, v7);
    sub_23B69A8B4(v2, v3);
    v12 = v6;
LABEL_6:
    sub_23B69A8B4(v12, v7);
    return 0;
  }
  if (v7 >> 60 == 15)
    goto LABEL_5;
  v21 = a2[4];
  sub_23B699840(v2, v3);
  sub_23B699840(v6, v7);
  sub_23B69CFE4(v2, v3);
  v14 = v13;
  sub_23B69A8B4(v6, v7);
  sub_23B69A8B4(v2, v3);
  v10 = v21;
  if ((v14 & 1) == 0)
    return 0;
LABEL_8:
  v15 = v10;
  sub_23B698550(v4, v5);
  sub_23B698550(v8, v9);
  sub_23B69CFE4(v4, v5);
  v17 = v16;
  sub_23B6980D8(v8, v9);
  sub_23B6980D8(v4, v5);
  if ((v17 & 1) == 0)
    return 0;
  v7 = v11;
  if (v23 >> 60 == 15)
  {
    if (v11 >> 60 == 15)
      return 1;
    goto LABEL_13;
  }
  if (v11 >> 60 == 15)
  {
LABEL_13:
    sub_23B699840(v22, v23);
    sub_23B699840(v15, v11);
    sub_23B69A8B4(v22, v23);
    v12 = v15;
    goto LABEL_6;
  }
  sub_23B699840(v22, v23);
  sub_23B699840(v15, v11);
  sub_23B69CFE4(v22, v23);
  v19 = v18;
  sub_23B69A8B4(v15, v11);
  sub_23B69A8B4(v22, v23);
  return (v19 & 1) != 0;
}

unint64_t sub_23B6A2D74()
{
  unint64_t result;

  result = qword_256A40478;
  if (!qword_256A40478)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD868, &type metadata for DiversifiedRootKeys.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40478);
  }
  return result;
}

unint64_t sub_23B6A2DB8()
{
  unint64_t result;

  result = qword_256A40480;
  if (!qword_256A40480)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40480);
  }
  return result;
}

unint64_t sub_23B6A2DFC()
{
  unint64_t result;

  result = qword_256A40488;
  if (!qword_256A40488)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40488);
  }
  return result;
}

unint64_t sub_23B6A2E40()
{
  unint64_t result;

  result = qword_256A40498;
  if (!qword_256A40498)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40498);
  }
  return result;
}

unint64_t sub_23B6A2E84()
{
  unint64_t result;

  result = qword_256A404A0;
  if (!qword_256A404A0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A404A0);
  }
  return result;
}

unint64_t sub_23B6A2ECC()
{
  unint64_t result;

  result = qword_256A404B0;
  if (!qword_256A404B0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for DiversifiedRootKeys, &type metadata for DiversifiedRootKeys);
    atomic_store(result, (unint64_t *)&qword_256A404B0);
  }
  return result;
}

uint64_t destroy for DiversifiedRootKeys(uint64_t *a1)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v4;

  v2 = a1[1];
  if (v2 >> 60 != 15)
    sub_23B6980D8(*a1, v2);
  result = sub_23B6980D8(a1[2], a1[3]);
  v4 = a1[5];
  if (v4 >> 60 != 15)
    return sub_23B6980D8(a1[4], v4);
  return result;
}

uint64_t initializeWithCopy for DiversifiedRootKeys(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_23B698550(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[2];
  v7 = a2[3];
  sub_23B698550(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = a2 + 4;
  v9 = a2[5];
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v8;
  }
  else
  {
    v10 = *v8;
    sub_23B698550(*v8, v9);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v9;
  }
  return a1;
}

uint64_t *assignWithCopy for DiversifiedRootKeys(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 == 15)
  {
    if (v4 >> 60 != 15)
    {
      v5 = *a2;
      sub_23B698550(*a2, a2[1]);
      *a1 = v5;
      a1[1] = v4;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
    sub_23B6A314C((uint64_t)a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v6 = *a2;
  sub_23B698550(*a2, a2[1]);
  v7 = *a1;
  v8 = a1[1];
  *a1 = v6;
  a1[1] = v4;
  sub_23B6980D8(v7, v8);
LABEL_8:
  v9 = a2[2];
  v10 = a2[3];
  sub_23B698550(v9, v10);
  v11 = a1[2];
  v12 = a1[3];
  a1[2] = v9;
  a1[3] = v10;
  sub_23B6980D8(v11, v12);
  v13 = a2 + 4;
  v14 = a2[5];
  if ((unint64_t)a1[5] >> 60 != 15)
  {
    if (v14 >> 60 != 15)
    {
      v16 = *v13;
      sub_23B698550(*v13, v14);
      v17 = a1[4];
      v18 = a1[5];
      a1[4] = v16;
      a1[5] = v14;
      sub_23B6980D8(v17, v18);
      return a1;
    }
    sub_23B69A26C((uint64_t)(a1 + 4));
    goto LABEL_13;
  }
  if (v14 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v13;
    return a1;
  }
  v15 = *v13;
  sub_23B698550(*v13, v14);
  a1[4] = v15;
  a1[5] = v14;
  return a1;
}

uint64_t sub_23B6A314C(uint64_t a1)
{
  destroy for KeyRepresentableInternal(a1);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DiversifiedRootKeys(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >> 60 == 15)
    goto LABEL_4;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 >> 60 == 15)
  {
    sub_23B6A314C(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  v6 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  sub_23B6980D8(v6, v4);
LABEL_6:
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_23B6980D8(v7, v8);
  v9 = (_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 >> 60 != 15)
  {
    v11 = *(_QWORD *)(a2 + 40);
    if (v11 >> 60 != 15)
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 32) = *v9;
      *(_QWORD *)(a1 + 40) = v11;
      sub_23B6980D8(v12, v10);
      return a1;
    }
    sub_23B69A26C(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for DiversifiedRootKeys(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 24) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 24) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DiversifiedRootKeys(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)(result + 24) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiversifiedRootKeys()
{
  return &type metadata for DiversifiedRootKeys;
}

uint64_t getEnumTagSinglePayload for DiversifiedRootKeys.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DiversifiedRootKeys.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23B6A33FC + 4 * byte_23B6AD6B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B6A3430 + 4 * byte_23B6AD6B0[v4]))();
}

uint64_t sub_23B6A3430(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A3438(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6A3440);
  return result;
}

uint64_t sub_23B6A344C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6A3454);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B6A3458(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A3460(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23B6A346C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DiversifiedRootKeys.CodingKeys()
{
  return &type metadata for DiversifiedRootKeys.CodingKeys;
}

unint64_t sub_23B6A3488()
{
  unint64_t result;

  result = qword_256A404B8;
  if (!qword_256A404B8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD840, &type metadata for DiversifiedRootKeys.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A404B8);
  }
  return result;
}

unint64_t sub_23B6A34D0()
{
  unint64_t result;

  result = qword_256A404C0;
  if (!qword_256A404C0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD7B0, &type metadata for DiversifiedRootKeys.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A404C0);
  }
  return result;
}

unint64_t sub_23B6A3518()
{
  unint64_t result;

  result = qword_256A404C8;
  if (!qword_256A404C8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AD7D8, &type metadata for DiversifiedRootKeys.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A404C8);
  }
  return result;
}

uint64_t sub_23B6A355C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x64656D7265746E69 && a2 == 0xEF79654B65746169;
  if (v2 || (sub_23B6AC47C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079 || (sub_23B6AC47C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4B65746176697270 && a2 == 0xEA00000000007965)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23B6AC47C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void PublicKey.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  char v7;
  uint64_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;

  if (qword_256A401E0 != -1)
    swift_once();
  sub_23B69CFE4(a1, a2);
  if ((v7 & 1) != 0)
  {
    sub_23B69D610();
    swift_allocError();
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(v8 + 8) = 0;
    *(_BYTE *)(v8 + 16) = 2;
    swift_willThrow();
    sub_23B6980D8(a1, a2);
  }
  else
  {
    v9 = sub_23B69FDB4(a1, a2);
    if (v3)
    {
      MEMORY[0x23B86AC34](v3);
      sub_23B69D610();
      swift_allocError();
      *(_QWORD *)v11 = a1;
      *(_QWORD *)(v11 + 8) = a2;
      *(_BYTE *)(v11 + 16) = 1;
      swift_willThrow();
    }
    else
    {
      sub_23B6980D8((uint64_t)v9, v10);
      sub_23B69C780(a1, a2);
      *a3 = v12;
    }
  }
}

uint64_t PublicKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

void PublicKey.advertisement.getter()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v0;
  v1 = v0[1];
  sub_23B698550(*v0, v1);
  v3 = sub_23B69FDB4(v2, v1);
  v5 = v4;
  sub_23B6980D8(v2, v1);
  sub_23B6A1FD0((uint64_t)v3, v5);
}

uint64_t static PublicKey.length.getter()
{
  return 57;
}

char *sub_23B6A39A4()
{
  char *result;
  uint64_t v1;
  uint64_t v2;

  sub_23B6AC104();
  swift_allocObject();
  v1 = 0x3900000000;
  v2 = sub_23B6AC0E0();
  result = sub_23B6AACE4((int *)&v1, 0);
  qword_256A404D0 = v1;
  *(_QWORD *)algn_256A404D8 = v2 | 0x4000000000000000;
  return result;
}

uint64_t PublicKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 PublicKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6A3A38()
{
  sub_23B6A3CE4();
  return sub_23B6AC518();
}

uint64_t sub_23B6A3A60()
{
  sub_23B6A3CE4();
  return sub_23B6AC524();
}

uint64_t PublicKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A404E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A3CE4();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PublicKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A404F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A3CE4();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B6A3CA8()
{
  return 57;
}

uint64_t sub_23B6A3CB0@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return PublicKey.init(from:)(a1, a2);
}

uint64_t sub_23B6A3CC4(_QWORD *a1)
{
  return PublicKey.encode(to:)(a1);
}

void sub_23B6A3CD8(uint64_t *a1)
{
  sub_23B6AB350(*a1, a1[1]);
}

unint64_t sub_23B6A3CE4()
{
  unint64_t result;

  result = qword_256A404E8;
  if (!qword_256A404E8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADACC, &type metadata for PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A404E8);
  }
  return result;
}

unint64_t sub_23B6A3D28(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6A3D4C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6A3D4C()
{
  unint64_t result;

  result = qword_256A404F8;
  if (!qword_256A404F8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A404F8);
  }
  return result;
}

unint64_t sub_23B6A3D90(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6A2E40();
  a1[2] = sub_23B6A2DB8();
  a1[3] = sub_23B6A3DCC();
  result = sub_23B6A3E10();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6A3DCC()
{
  unint64_t result;

  result = qword_256A40500;
  if (!qword_256A40500)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40500);
  }
  return result;
}

unint64_t sub_23B6A3E10()
{
  unint64_t result;

  result = qword_256A40508;
  if (!qword_256A40508)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40508);
  }
  return result;
}

unint64_t sub_23B6A3E58()
{
  unint64_t result;

  result = qword_256A40510;
  if (!qword_256A40510)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PublicKey, &type metadata for PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40510);
  }
  return result;
}

ValueMetadata *type metadata accessor for PublicKey()
{
  return &type metadata for PublicKey;
}

uint64_t storeEnumTagSinglePayload for PublicKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6A3EEC + 4 * byte_23B6AD8C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6A3F0C + 4 * byte_23B6AD8C5[v4]))();
}

_BYTE *sub_23B6A3EEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6A3F0C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A3F14(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A3F1C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A3F24(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A3F2C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PublicKey.CodingKeys()
{
  return &type metadata for PublicKey.CodingKeys;
}

unint64_t sub_23B6A3F4C()
{
  unint64_t result;

  result = qword_256A40518;
  if (!qword_256A40518)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADAA4, &type metadata for PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40518);
  }
  return result;
}

unint64_t sub_23B6A3F94()
{
  unint64_t result;

  result = qword_256A40520;
  if (!qword_256A40520)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADA14, &type metadata for PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40520);
  }
  return result;
}

unint64_t sub_23B6A3FDC()
{
  unint64_t result;

  result = qword_256A40528;
  if (!qword_256A40528)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADA3C, &type metadata for PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40528);
  }
  return result;
}

FindMyCrypto::CryptoError_optional __swiftcall CryptoError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 1;
  switch(rawValue)
  {
    case -4320:
      *v1 = 13;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4319:
    case -4318:
    case -4317:
    case -4316:
    case -4315:
    case -4314:
    case -4313:
    case -4312:
      goto LABEL_6;
    case -4311:
      *v1 = 12;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4310:
      *v1 = 11;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4309:
      *v1 = 10;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4308:
      *v1 = 9;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4307:
      *v1 = 8;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4306:
      *v1 = 7;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4305:
      *v1 = 6;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4304:
      *v1 = 5;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4303:
      *v1 = 4;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4302:
      *v1 = 3;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4301:
      *v1 = 2;
      return (FindMyCrypto::CryptoError_optional)rawValue;
    case -4300:
      goto LABEL_5;
    default:
      if (rawValue)
      {
LABEL_6:
        *v1 = 14;
      }
      else
      {
        v2 = 0;
LABEL_5:
        *v1 = v2;
      }
      return (FindMyCrypto::CryptoError_optional)rawValue;
  }
}

uint64_t CryptoError.rawValue.getter()
{
  char *v0;

  return qword_23B6ADD58[*v0];
}

BOOL sub_23B6A410C(char *a1, char *a2)
{
  return qword_23B6ADD58[*a1] == qword_23B6ADD58[*a2];
}

uint64_t sub_23B6A4130()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

uint64_t sub_23B6A417C()
{
  return sub_23B6AC4D0();
}

uint64_t sub_23B6A41B0()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

FindMyCrypto::CryptoError_optional sub_23B6A41F8(Swift::Int *a1)
{
  return CryptoError.init(rawValue:)(*a1);
}

void sub_23B6A4200(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_23B6ADD58[*v1];
}

uint64_t sub_23B6A4218()
{
  sub_23B6A4624();
  sub_23B6A4668();
  return sub_23B6AC4B8();
}

BOOL static CryptoTokenError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CryptoTokenError.hash(into:)()
{
  return sub_23B6AC4D0();
}

uint64_t CryptoTokenError.hashValue.getter()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

unint64_t sub_23B6A42E0()
{
  unint64_t result;

  result = qword_256A40530;
  if (!qword_256A40530)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for CryptoError, &type metadata for CryptoError);
    atomic_store(result, (unint64_t *)&qword_256A40530);
  }
  return result;
}

unint64_t sub_23B6A4328()
{
  unint64_t result;

  result = qword_256A40538;
  if (!qword_256A40538)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for CryptoTokenError, &type metadata for CryptoTokenError);
    atomic_store(result, (unint64_t *)&qword_256A40538);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CryptoError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CryptoError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_23B6A4448 + 4 * byte_23B6ADB3A[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_23B6A447C + 4 * byte_23B6ADB35[v4]))();
}

uint64_t sub_23B6A447C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A4484(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6A448CLL);
  return result;
}

uint64_t sub_23B6A4498(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6A44A0);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_23B6A44A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A44AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CryptoError()
{
  return &type metadata for CryptoError;
}

uint64_t getEnumTagSinglePayload for CryptoTokenError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CryptoTokenError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23B6A45A4 + 4 * byte_23B6ADB44[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B6A45D8 + 4 * byte_23B6ADB3F[v4]))();
}

uint64_t sub_23B6A45D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A45E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6A45E8);
  return result;
}

uint64_t sub_23B6A45F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6A45FCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B6A4600(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A4608(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CryptoTokenError()
{
  return &type metadata for CryptoTokenError;
}

unint64_t sub_23B6A4624()
{
  unint64_t result;

  result = qword_256A40540;
  if (!qword_256A40540)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for CryptoError, &type metadata for CryptoError);
    atomic_store(result, (unint64_t *)&qword_256A40540);
  }
  return result;
}

unint64_t sub_23B6A4668()
{
  unint64_t result;

  result = qword_256A40548;
  if (!qword_256A40548)
  {
    result = MEMORY[0x23B86AC88](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256A40548);
  }
  return result;
}

uint64_t static P256PublicKey.length.getter()
{
  return 64;
}

char *sub_23B6A46BC()
{
  char *result;
  uint64_t v1;
  uint64_t v2;

  sub_23B6AC104();
  swift_allocObject();
  v1 = 0x4000000000;
  v2 = sub_23B6AC0E0();
  result = sub_23B6AACE4((int *)&v1, 0);
  qword_256A40550 = v1;
  *(_QWORD *)algn_256A40558 = v2 | 0x4000000000000000;
  return result;
}

uint64_t P256PublicKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t P256PublicKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 P256PublicKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void P256PublicKey.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  char v7;
  uint64_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;

  if (qword_256A401E8 != -1)
    swift_once();
  sub_23B69CFE4(a1, a2);
  if ((v7 & 1) != 0)
  {
    sub_23B69D610();
    swift_allocError();
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(v8 + 8) = 0;
    *(_BYTE *)(v8 + 16) = 2;
    swift_willThrow();
    sub_23B6980D8(a1, a2);
  }
  else
  {
    v9 = sub_23B69FDB4(a1, a2);
    if (v3)
    {
      MEMORY[0x23B86AC34](v3);
      sub_23B69D610();
      swift_allocError();
      *(_QWORD *)v11 = a1;
      *(_QWORD *)(v11 + 8) = a2;
      *(_BYTE *)(v11 + 16) = 1;
      swift_willThrow();
    }
    else
    {
      sub_23B6980D8((uint64_t)v9, v10);
      sub_23B69C780(a1, a2);
      *a3 = v12;
    }
  }
}

uint64_t sub_23B6A48C8()
{
  sub_23B6A4B74();
  return sub_23B6AC518();
}

uint64_t sub_23B6A48F0()
{
  sub_23B6A4B74();
  return sub_23B6AC524();
}

uint64_t P256PublicKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40560);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A4B74();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t P256PublicKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40570);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A4B74();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B6A4B38()
{
  return 64;
}

uint64_t sub_23B6A4B40@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return P256PublicKey.init(from:)(a1, a2);
}

uint64_t sub_23B6A4B54(_QWORD *a1)
{
  return P256PublicKey.encode(to:)(a1);
}

void sub_23B6A4B68(uint64_t *a1)
{
  sub_23B6AB3E0(*a1, a1[1]);
}

unint64_t sub_23B6A4B74()
{
  unint64_t result;

  result = qword_256A40568;
  if (!qword_256A40568)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADFE0, &type metadata for P256PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40568);
  }
  return result;
}

unint64_t sub_23B6A4BB8(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6A4BDC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6A4BDC()
{
  unint64_t result;

  result = qword_256A40578;
  if (!qword_256A40578)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40578);
  }
  return result;
}

unint64_t sub_23B6A4C20(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6A4C5C();
  a1[2] = sub_23B6A4CA0();
  a1[3] = sub_23B6A4CE4();
  result = sub_23B6A4D28();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6A4C5C()
{
  unint64_t result;

  result = qword_256A40580;
  if (!qword_256A40580)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40580);
  }
  return result;
}

unint64_t sub_23B6A4CA0()
{
  unint64_t result;

  result = qword_256A40588;
  if (!qword_256A40588)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40588);
  }
  return result;
}

unint64_t sub_23B6A4CE4()
{
  unint64_t result;

  result = qword_256A40590;
  if (!qword_256A40590)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40590);
  }
  return result;
}

unint64_t sub_23B6A4D28()
{
  unint64_t result;

  result = qword_256A40598;
  if (!qword_256A40598)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A40598);
  }
  return result;
}

unint64_t sub_23B6A4D70()
{
  unint64_t result;

  result = qword_256A405A0;
  if (!qword_256A405A0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PublicKey, &type metadata for P256PublicKey);
    atomic_store(result, (unint64_t *)&qword_256A405A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for P256PublicKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6A4DF4 + 4 * byte_23B6ADDD0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6A4E14 + 4 * byte_23B6ADDD5[v4]))();
}

_BYTE *sub_23B6A4DF4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6A4E14(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A4E1C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A4E24(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A4E2C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A4E34(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for P256PublicKey.CodingKeys()
{
  return &type metadata for P256PublicKey.CodingKeys;
}

unint64_t sub_23B6A4E54()
{
  unint64_t result;

  result = qword_256A405A8;
  if (!qword_256A405A8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADFB8, &type metadata for P256PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A405A8);
  }
  return result;
}

unint64_t sub_23B6A4E9C()
{
  unint64_t result;

  result = qword_256A405B0;
  if (!qword_256A405B0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADF28, &type metadata for P256PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A405B0);
  }
  return result;
}

unint64_t sub_23B6A4EE4()
{
  unint64_t result;

  result = qword_256A405B8;
  if (!qword_256A405B8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6ADF50, &type metadata for P256PublicKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A405B8);
  }
  return result;
}

uint64_t SharedSecretKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t static SharedSecretKey.length.getter()
{
  return 32;
}

uint64_t SharedSecretKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 SharedSecretKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6A4F78()
{
  sub_23B6A50C8();
  return sub_23B6AC518();
}

uint64_t sub_23B6A4FA0()
{
  sub_23B6A50C8();
  return sub_23B6AC524();
}

uint64_t SharedSecretKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A405C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A50C8();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23B6A50C8()
{
  unint64_t result;

  result = qword_256A405C8;
  if (!qword_256A405C8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE240, &type metadata for SharedSecretKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A405C8);
  }
  return result;
}

uint64_t SharedSecretKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A405D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A50C8();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B6A522C(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6A5250();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6A5250()
{
  unint64_t result;

  result = qword_256A405D8;
  if (!qword_256A405D8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A405D8);
  }
  return result;
}

unint64_t sub_23B6A5294(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B69DE80();
  a1[2] = sub_23B69DE3C();
  a1[3] = sub_23B6A52D0();
  result = sub_23B6A5314();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6A52D0()
{
  unint64_t result;

  result = qword_256A405E0;
  if (!qword_256A405E0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A405E0);
  }
  return result;
}

unint64_t sub_23B6A5314()
{
  unint64_t result;

  result = qword_256A405E8;
  if (!qword_256A405E8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A405E8);
  }
  return result;
}

uint64_t sub_23B6A5358@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return SharedSecretKey.init(from:)(a1, a2);
}

uint64_t sub_23B6A536C(_QWORD *a1)
{
  return SharedSecretKey.encode(to:)(a1);
}

unint64_t sub_23B6A5384()
{
  unint64_t result;

  result = qword_256A405F0;
  if (!qword_256A405F0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SharedSecretKey, &type metadata for SharedSecretKey);
    atomic_store(result, (unint64_t *)&qword_256A405F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedSecretKey()
{
  return &type metadata for SharedSecretKey;
}

uint64_t storeEnumTagSinglePayload for SharedSecretKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6A5418 + 4 * byte_23B6AE030[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6A5438 + 4 * byte_23B6AE035[v4]))();
}

_BYTE *sub_23B6A5418(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6A5438(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A5440(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A5448(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A5450(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A5458(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SharedSecretKey.CodingKeys()
{
  return &type metadata for SharedSecretKey.CodingKeys;
}

unint64_t sub_23B6A5478()
{
  unint64_t result;

  result = qword_256A405F8;
  if (!qword_256A405F8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE218, &type metadata for SharedSecretKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A405F8);
  }
  return result;
}

unint64_t sub_23B6A54C0()
{
  unint64_t result;

  result = qword_256A40600;
  if (!qword_256A40600)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE188, &type metadata for SharedSecretKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40600);
  }
  return result;
}

unint64_t sub_23B6A5508()
{
  unint64_t result;

  result = qword_256A40608;
  if (!qword_256A40608)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE1B0, &type metadata for SharedSecretKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40608);
  }
  return result;
}

uint64_t TimeBasedKey.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t TimeBasedKey.index.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*TimeBasedKey.index.modify())()
{
  return nullsub_1;
}

uint64_t TimeBasedKey.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TimeBasedKey() + 20);
  v4 = sub_23B6AC0B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for TimeBasedKey()
{
  uint64_t result;

  result = qword_256A40670;
  if (!qword_256A40670)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TimeBasedKey.keyMaterial.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for TimeBasedKey() + 24));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_23B699840(v4, v5);
  sub_23B698550(v6, v7);
  return sub_23B699840(v8, v9);
}

uint64_t TimeBasedKey.description.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for TimeBasedKey() + 24));
  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  sub_23B698550(v4, v5);
  sub_23B698550(v4, v5);
  sub_23B699840(v2, v3);
  sub_23B698550(v4, v5);
  sub_23B699840(v6, v7);
  v8 = sub_23B69FDB4(v4, v5);
  v10 = v9;
  sub_23B6980D8(v4, v5);
  sub_23B6A1FD0((uint64_t)v8, v10);
  sub_23B6980D8(v4, v5);
  sub_23B69A8B4(v2, v3);
  sub_23B6980D8(v4, v5);
  sub_23B69A8B4(v6, v7);
  sub_23B698880();
  sub_23B6AC098();
  sub_23B6980D8(v12, v13);
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  sub_23B6AC344();
  sub_23B6AC470();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  sub_23B6AC344();
  swift_bridgeObjectRetain();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6AC3D4();
  swift_bridgeObjectRelease();
  sub_23B6AC0B0();
  sub_23B6A59CC();
  sub_23B6AC470();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x203A74766441;
}

unint64_t sub_23B6A59CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A40610;
  if (!qword_256A40610)
  {
    v1 = sub_23B6AC0B0();
    result = MEMORY[0x23B86AC88](MEMORY[0x24BDCB8B8], v1);
    atomic_store(result, (unint64_t *)&qword_256A40610);
  }
  return result;
}

unint64_t TimeBasedKey.debugDescription.getter()
{
  sub_23B6AC3D4();
  swift_bridgeObjectRelease();
  sub_23B6AC470();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  sub_23B6AC344();
  type metadata accessor for TimeBasedKey();
  sub_23B6AC0B0();
  sub_23B6A59CC();
  sub_23B6AC470();
  sub_23B6AC344();
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimeBasedKey(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23B6AC0B0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = *(int *)(a3 + 24);
    v12 = (char *)v4 + v11;
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = *(uint64_t *)((char *)a2 + v11 + 8);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)v12 = *(_OWORD *)v13;
    }
    else
    {
      v16 = *v13;
      sub_23B698550(*v13, v14);
      *(_QWORD *)v12 = v16;
      *((_QWORD *)v12 + 1) = v14;
    }
    v17 = v13[2];
    v18 = v13[3];
    sub_23B698550(v17, v18);
    *((_QWORD *)v12 + 2) = v17;
    *((_QWORD *)v12 + 3) = v18;
    v19 = v13 + 4;
    v20 = v13[5];
    if (v20 >> 60 == 15)
    {
      *((_OWORD *)v12 + 2) = *(_OWORD *)v19;
    }
    else
    {
      v21 = *v19;
      sub_23B698550(*v19, v13[5]);
      *((_QWORD *)v12 + 4) = v21;
      *((_QWORD *)v12 + 5) = v20;
    }
  }
  return v4;
}

uint64_t destroy for TimeBasedKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t result;
  unint64_t v9;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23B6AC0B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_23B6980D8(*v6, v7);
  result = sub_23B6980D8(v6[2], v6[3]);
  v9 = v6[5];
  if (v9 >> 60 != 15)
    return sub_23B6980D8(v6[4], v9);
  return result;
}

_QWORD *initializeWithCopy for TimeBasedKey(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6AC0B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *(_QWORD *)((char *)a2 + v10 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  else
  {
    v14 = *v12;
    sub_23B698550(*v12, v13);
    *(_QWORD *)v11 = v14;
    *((_QWORD *)v11 + 1) = v13;
  }
  v15 = v12[2];
  v16 = v12[3];
  sub_23B698550(v15, v16);
  *((_QWORD *)v11 + 2) = v15;
  *((_QWORD *)v11 + 3) = v16;
  v17 = v12 + 4;
  v18 = v12[5];
  if (v18 >> 60 == 15)
  {
    *((_OWORD *)v11 + 2) = *(_OWORD *)v17;
  }
  else
  {
    v19 = *v17;
    sub_23B698550(*v17, v12[5]);
    *((_QWORD *)v11 + 4) = v19;
    *((_QWORD *)v11 + 5) = v18;
  }
  return a1;
}

_QWORD *assignWithCopy for TimeBasedKey(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6AC0B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *(_QWORD *)((char *)a2 + v10 + 8);
  if (*(_QWORD *)((char *)a1 + v10 + 8) >> 60 == 15)
  {
    if (v13 >> 60 != 15)
    {
      v14 = *v12;
      sub_23B698550(*v12, v13);
      *v11 = v14;
      v11[1] = v13;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
    sub_23B6A314C((uint64_t)v11);
LABEL_6:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  v15 = *v12;
  sub_23B698550(*v12, v13);
  v16 = *v11;
  v17 = v11[1];
  *v11 = v15;
  v11[1] = v13;
  sub_23B6980D8(v16, v17);
LABEL_8:
  v18 = v12[2];
  v19 = v12[3];
  sub_23B698550(v18, v19);
  v20 = v11[2];
  v21 = v11[3];
  v11[2] = v18;
  v11[3] = v19;
  sub_23B6980D8(v20, v21);
  v22 = v12 + 4;
  v23 = v12[5];
  if ((unint64_t)v11[5] >> 60 != 15)
  {
    if (v23 >> 60 != 15)
    {
      v25 = *v22;
      sub_23B698550(*v22, v12[5]);
      v26 = v11[4];
      v27 = v11[5];
      v11[4] = v25;
      v11[5] = v23;
      sub_23B6980D8(v26, v27);
      return a1;
    }
    sub_23B69A26C((uint64_t)(v11 + 4));
    goto LABEL_13;
  }
  if (v23 >> 60 == 15)
  {
LABEL_13:
    *((_OWORD *)v11 + 2) = *(_OWORD *)v22;
    return a1;
  }
  v24 = *v22;
  sub_23B698550(*v22, v12[5]);
  v11[4] = v24;
  v11[5] = v23;
  return a1;
}

_QWORD *initializeWithTake for TimeBasedKey(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6AC0B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_OWORD *)((char *)a1 + v10);
  v12 = (_OWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v11[2] = v12[2];
  return a1;
}

_QWORD *assignWithTake for TimeBasedKey(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6AC0B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (uint64_t)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = *(_QWORD *)((char *)a1 + v10 + 8);
  if (v13 >> 60 == 15)
    goto LABEL_4;
  v14 = *((_QWORD *)v12 + 1);
  if (v14 >> 60 == 15)
  {
    sub_23B6A314C(v11);
LABEL_4:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_6;
  }
  v15 = *(_QWORD *)v11;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_QWORD *)(v11 + 8) = v14;
  sub_23B6980D8(v15, v13);
LABEL_6:
  v16 = *(_QWORD *)(v11 + 16);
  v17 = *(_QWORD *)(v11 + 24);
  *(_OWORD *)(v11 + 16) = *((_OWORD *)v12 + 1);
  sub_23B6980D8(v16, v17);
  v18 = v12 + 32;
  v19 = *(_QWORD *)(v11 + 40);
  if (v19 >> 60 != 15)
  {
    v20 = *((_QWORD *)v12 + 5);
    if (v20 >> 60 != 15)
    {
      v21 = *(_QWORD *)(v11 + 32);
      *(_QWORD *)(v11 + 32) = *v18;
      *(_QWORD *)(v11 + 40) = v20;
      sub_23B6980D8(v21, v19);
      return a1;
    }
    sub_23B69A26C(v11 + 32);
  }
  *(_OWORD *)(v11 + 32) = *(_OWORD *)v18;
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeBasedKey()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B6A60F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = sub_23B6AC0B0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24) >> 60;
  if (((4 * (_DWORD)v9) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v9) & 0xC | (v9 >> 2));
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TimeBasedKey()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B6A6198(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = sub_23B6AC0B0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  v10 = a1 + *(int *)(a4 + 24);
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_23B6A6224()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B6AC0B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  char v25;
  void (*v26)(_BYTE *, uint64_t, uint64_t);
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void (*v48)(_BYTE *, uint64_t);
  uint64_t v49;
  unint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  unint64_t v53;
  os_log_t v54;
  uint64_t v55;
  void (*v56)(_BYTE *, uint64_t);
  uint64_t result;
  _BYTE v58[12];
  int v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;

  v8 = sub_23B6AC1E8();
  v66 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = &v58[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_23B6AC20C();
  v11 = *(_QWORD *)(v10 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v67 = &v58[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_23B6AC1DC();
  v68 = *(_QWORD *)(v13 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = &v58[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = &v58[-v18];
  v20 = MEMORY[0x24BDAC7A8](v17);
  v69 = &v58[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v70 = &v58[-v22];
  v63 = a1;
  v64 = v8;
  if (a4 == 15)
  {
    v23 = v10;
    LODWORD(v61) = 0;
  }
  else
  {
    if (a4 != 1440)
    {
      v73 = 0;
      v74 = 0xE000000000000000;
      sub_23B6AC3D4();
      swift_bridgeObjectRelease();
      v73 = 0xD000000000000018;
      v74 = 0x800000023B6B12F0;
      v72 = a4;
      sub_23B6AC470();
      sub_23B6AC344();
      swift_bridgeObjectRelease();
      result = sub_23B6AC410();
      __break(1u);
      return result;
    }
    v23 = v10;
    LODWORD(v61) = 1;
  }
  v24 = (double)a4 * 60.0;
  sub_23B6AC1A0();
  sub_23B6AC194();
  sub_23B6A6E1C(&qword_256A406B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v25 = sub_23B6AC32C();
  v26 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v68 + 16);
  if ((v25 & 1) != 0)
    v27 = a2;
  else
    v27 = a3;
  v26(v69, v27, v13);
  sub_23B6AC1B8();
  v29 = v28 / v24;
  if ((~*(_QWORD *)&v29 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v29 <= -1.0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v29 >= 1.84467441e19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((unint64_t)v29 == -1)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v75 = (unint64_t)v29 + 1;
  if (qword_256A401D8 != -1)
LABEL_27:
    swift_once();
  v30 = v23;
  v31 = __swift_project_value_buffer(v23, (uint64_t)qword_256A40960);
  v32 = v11;
  v33 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16);
  v34 = v67;
  v62 = v30;
  v33(v67, v31, v30);
  v26(v19, a2, v13);
  v26(v16, a3, v13);
  v36 = v65;
  v35 = v66;
  v37 = v64;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v66 + 16))(v65, v63, v64);
  v38 = sub_23B6AC1F4();
  v39 = sub_23B6AC38C();
  v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    v41 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    v73 = v63;
    *(_DWORD *)v41 = 136447491;
    v42 = (_DWORD)v61 == 0;
    if ((_DWORD)v61)
      v43 = 0x61646E6F6365732ELL;
    else
      v43 = 0x7972616D6972702ELL;
    v61 = v38;
    if (v42)
      v44 = 0xE800000000000000;
    else
      v44 = 0xEA00000000007972;
    v72 = sub_23B6A6D4C(v43, v44, &v73);
    sub_23B6AC3BC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2048;
    swift_beginAccess();
    v71 = v75;
    sub_23B6AC3BC();
    *(_WORD *)(v41 + 22) = 2082;
    sub_23B6A6E1C(&qword_256A406B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v60 = v32;
    v45 = sub_23B6AC470();
    v71 = sub_23B6A6D4C(v45, v46, &v73);
    sub_23B6AC3BC();
    swift_bridgeObjectRelease();
    v59 = v40;
    v47 = v37;
    v48 = *(void (**)(_BYTE *, uint64_t))(v68 + 8);
    v48(v19, v13);
    *(_WORD *)(v41 + 32) = 2082;
    v49 = sub_23B6AC470();
    v71 = sub_23B6A6D4C(v49, v50, &v73);
    sub_23B6AC3BC();
    swift_bridgeObjectRelease();
    v48(v16, v13);
    *(_WORD *)(v41 + 42) = 2160;
    v71 = 1752392040;
    sub_23B6AC3BC();
    *(_WORD *)(v41 + 52) = 2081;
    sub_23B6A6E1C(&qword_256A406C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v51 = v65;
    v52 = sub_23B6AC470();
    v71 = sub_23B6A6D4C(v52, v53, &v73);
    sub_23B6AC3BC();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v66 + 8))(v51, v47);
    v54 = v61;
    _os_log_impl(&dword_23B696000, v61, (os_log_type_t)v59, "Bucket [%{public}s] calculated to ‣%llu baseTime: %{public}s date: %{public}s  beacon: %{private,mask.hash}s.", (uint8_t *)v41, 0x3Eu);
    v55 = v63;
    swift_arrayDestroy();
    MEMORY[0x23B86ACDC](v55, -1, -1);
    MEMORY[0x23B86ACDC](v41, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v60 + 8))(v67, v62);
    v48(v69, v13);
    v48(v70, v13);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v36, v37);
    v56 = *(void (**)(_BYTE *, uint64_t))(v68 + 8);
    v56(v16, v13);
    v56(v19, v13);
    (*(void (**)(_BYTE *, uint64_t))(v32 + 8))(v34, v62);
    v56(v69, v13);
    v56(v70, v13);
  }
  swift_beginAccess();
  return v75;
}

uint64_t dateInterval(baseTime:bucket:bucketSizeInMinutes:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  void (*v33)(char *, uint64_t);
  char *v34;
  char *v35;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;

  v39 = a4;
  v7 = sub_23B6AC1DC();
  v40 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v37 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v37 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v37 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v37 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v37 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v37 - v25;
  if (!a2)
  {
    v37[1] = a3;
    v38 = a1;
    if (qword_256A401D8 != -1)
      swift_once();
    v27 = sub_23B6AC20C();
    __swift_project_value_buffer(v27, (uint64_t)qword_256A40960);
    v28 = sub_23B6AC1F4();
    v29 = sub_23B6AC3A4();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_23B696000, v28, v29, "Caller attempted to calculate dateInterval for bucket 0!", v30, 2u);
      MEMORY[0x23B86ACDC](v30, -1, -1);
    }

    a2 = 1;
    a1 = v38;
  }
  v38 = v15;
  sub_23B6AC1A0();
  sub_23B6AC194();
  v31 = v40;
  v32 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v32(v21, a1, v7);
  sub_23B6AC1AC();
  v32(v21, v26, v7);
  sub_23B6AC1AC();
  v32(v21, v18, v7);
  sub_23B6AC1AC();
  sub_23B6AC1D0();
  v33 = *(void (**)(char *, uint64_t))(v31 + 8);
  v33(v12, v7);
  v34 = v38;
  sub_23B6AC1C4();
  if (a2 == 1)
    v35 = v24;
  else
    v35 = v18;
  v32(v21, v35, v7);
  v32(v41, v34, v7);
  sub_23B6AC0A4();
  v33(v34, v7);
  v33(v18, v7);
  v33(v24, v7);
  return ((uint64_t (*)(char *, uint64_t))v33)(v26, v7);
}

uint64_t sub_23B6A6D4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B6A6E5C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B6A7014((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_23B6A7014((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23B6A6E1C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B86AC88](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B6A6E5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23B6AC3C8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B6A7050(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_23B6AC3EC();
  if (!v8)
  {
    sub_23B6AC404();
    __break(1u);
LABEL_17:
    result = sub_23B6AC41C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_23B6A7014(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B6A7050(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B6A70E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B6A72BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B6A72BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B6A70E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_23B6A7258(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B6AC3E0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B6AC404();
      __break(1u);
LABEL_10:
      v2 = sub_23B6AC350();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B6AC41C();
    __break(1u);
LABEL_14:
    result = sub_23B6AC404();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B6A7258(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A406C8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B6A72BC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A406C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23B6AC41C();
  __break(1u);
  return result;
}

uint64_t sub_23B6A7408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6AC20C();
  __swift_allocate_value_buffer(v0, qword_256A40978);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A40978);
  if (qword_256A401F8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A40990);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

double TokenAsyncSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)@<D0>(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, unint64_t a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  __int128 v9;
  double result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;

  v8 = *((_QWORD *)a5 + 2);
  v9 = *a1;
  v18 = *a2;
  v19 = v9;
  v17 = *a3;
  v15 = *a5;
  v16 = v8;
  sub_23B6A751C((uint64_t *)&v19, (uint64_t *)&v18, (uint64_t *)&v17, (unint64_t *)&v15, a4, (uint64_t *)v20);
  if (!v6)
  {
    v11 = v21;
    result = *(double *)v20;
    v12 = v20[1];
    v13 = v20[2];
    v14 = v20[3];
    *(_OWORD *)a6 = v20[0];
    *(_OWORD *)(a6 + 16) = v12;
    *(_OWORD *)(a6 + 32) = v13;
    *(_OWORD *)(a6 + 48) = v14;
    *(_QWORD *)(a6 + 64) = v11;
  }
  return result;
}

uint64_t sub_23B6A751C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  os_log_t log;
  NSObject *loga;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v41;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46[2];
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v6 = a1[1];
  v49 = *a1;
  v7 = *a2;
  v45 = a2[1];
  v8 = *a3;
  v9 = a3[1];
  v11 = *a4;
  v10 = a4[1];
  v12 = a4[2];
  if (!a5)
  {
    sub_23B69A8B4(v49, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v8, v9);
    sub_23B69A988(v11, v10, v12);
    sub_23B69A9A4();
    swift_allocError();
    return swift_willThrow();
  }
  if (v12 >> 60 == 15)
  {
    sub_23B698550(v8, v9);
    sub_23B698550(v8, v9);
    sub_23B699840(v49, v6);
    sub_23B698550(v7, v45);
    v14 = v8;
    v15 = v9;
    v16 = a5;
  }
  else
  {
    log = (os_log_t)(a5 - v11);
    if (a5 >= v11)
    {
      sub_23B698550(v8, v9);
      sub_23B699840(v49, v6);
      sub_23B698550(v7, v45);
      sub_23B69A9E8(v11, v10, v12);
      if (qword_256A401F0 != -1)
        swift_once();
      v21 = sub_23B6AC20C();
      __swift_project_value_buffer(v21, (uint64_t)qword_256A40978);
      sub_23B698550(v10, v12);
      v22 = sub_23B6AC1F4();
      v36 = sub_23B6AC398();
      if (os_log_type_enabled(v22, v36))
      {
        v35 = v22;
        *(_QWORD *)typea = v9;
        v23 = v6;
        v24 = v7;
        v25 = swift_slowAlloc();
        *(_DWORD *)v25 = 134218240;
        v47 = v11;
        sub_23B6AC3BC();
        v26 = v10;
        result = sub_23B69A988(v11, v10, v12);
        *(_WORD *)(v25 + 12) = 2048;
        if (a5 < (unint64_t)log)
        {
          __break(1u);
          return result;
        }
        v47 = a5 - (_QWORD)log;
        sub_23B6AC3BC();
        _os_log_impl(&dword_23B696000, v35, v36, "KeyGenerationHint hint.index:%llu saved %llu ratchet iterations", (uint8_t *)v25, 0x16u);
        MEMORY[0x23B86ACDC](v25, -1, -1);

        v27 = v11;
        v14 = v10;
        v15 = v12;
        sub_23B69A988(v27, v26, v12);
        v7 = v24;
        v6 = v23;
        v9 = *(_QWORD *)typea;
      }
      else
      {
        sub_23B69A988(v11, v10, v12);
        sub_23B69A988(v11, v10, v12);

        v14 = v10;
        v15 = v12;
      }
      v16 = (uint64_t)log;
    }
    else
    {
      sub_23B698550(v8, v9);
      sub_23B699840(v49, v6);
      sub_23B698550(v7, v45);
      if (qword_256A401F0 != -1)
        swift_once();
      v18 = sub_23B6AC20C();
      __swift_project_value_buffer(v18, (uint64_t)qword_256A40978);
      sub_23B698550(v10, v12);
      v19 = sub_23B6AC1F4();
      type = sub_23B6AC3B0();
      if (os_log_type_enabled(v19, type))
      {
        loga = v19;
        v20 = swift_slowAlloc();
        *(_DWORD *)v20 = 134218240;
        sub_23B6AC3BC();
        sub_23B69A988(v11, v10, v12);
        *(_WORD *)(v20 + 12) = 2048;
        v47 = a5;
        sub_23B6AC3BC();
        _os_log_impl(&dword_23B696000, loga, type, "Ignoring KeyGenerationHint: hint.index (%llu) > initialRatchetsToSkip(%llu)", (uint8_t *)v20, 0x16u);
        MEMORY[0x23B86ACDC](v20, -1, -1);

        sub_23B69A988(v11, v10, v12);
      }
      else
      {
        sub_23B69A988(v11, v10, v12);
        sub_23B69A988(v11, v10, v12);

      }
      v16 = a5 - 1;
      sub_23B698550(v8, v9);
      v14 = v8;
      v15 = v9;
    }
  }
  v28 = v14;
  v46[0] = v14;
  v46[1] = v15;
  sub_23B69F200(v46, v16, (uint64_t *)&v47);
  if (v44)
  {
    sub_23B6980D8(v8, v9);
    sub_23B6980D8(v7, v45);
    v29 = v49;
    sub_23B69A8B4(v49, v6);
    sub_23B69A8B4(v29, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v8, v9);
    v30 = v14;
    v31 = v15;
  }
  else
  {
    v41 = v8;
    v32 = v49;
    v43 = a5;
    v33 = v47;
    v34 = v48;
    sub_23B698550(v47, v48);
    sub_23B6980D8(v28, v15);
    sub_23B699840(v32, v6);
    sub_23B698550(v7, v45);
    sub_23B698550(v41, v9);
    sub_23B698550(v33, v34);
    sub_23B6980D8(v33, v34);
    sub_23B6980D8(v41, v9);
    sub_23B6980D8(v7, v45);
    sub_23B69A8B4(v32, v6);
    *a6 = v32;
    a6[1] = v6;
    a6[2] = v7;
    a6[3] = v45;
    a6[4] = v41;
    a6[5] = v9;
    a6[6] = v43;
    a6[7] = v33;
    a6[8] = v34;
    sub_23B69A8B4(v32, v6);
    sub_23B6980D8(v7, v45);
    sub_23B6980D8(v41, v9);
    v30 = v33;
    v31 = v34;
  }
  return sub_23B6980D8(v30, v31);
}

uint64_t TokenAsyncSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v10;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  sub_23B699840(v2, v3);
  sub_23B698550(v4, v5);
  sub_23B698550(v6, v10);
  return sub_23B698550(v7, v8);
}

double TokenAsyncSequence.next()@<D0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[3];

  if ((sub_23B6AC380() & 1) != 0)
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0xF000000000000000;
    *(_QWORD *)&v7 = 0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
  }
  else
  {
    v3 = *((_QWORD *)v1 + 7);
    v4 = *((_QWORD *)v1 + 8);
    v5 = *((_QWORD *)v1 + 6);
    v6 = *v1;
    v12 = v1[1];
    v13 = v6;
    *(_QWORD *)&v11 = v3;
    *((_QWORD *)&v11 + 1) = v4;
    sub_23B698550(v3, v4);
    sub_23B69EAA8((uint64_t *)&v13, (uint64_t *)&v12, &v11, (uint64_t)(v1 + 3), (uint64_t)v1 + 56, v14);
    v7 = v14[0];
    v8 = v14[1];
    v9 = v14[2];
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v3;
    *(_QWORD *)(a1 + 16) = v4;
    *(_OWORD *)(a1 + 24) = v7;
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = v9;
  }
  return *(double *)&v7;
}

uint64_t sub_23B6A7DE4(uint64_t a1)
{
  uint64_t v1;

  TokenAsyncSequence.next()(a1);
  return sub_23B6A7F24(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23B6A7E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  if (a2)
  {
    swift_getObjectType();
    sub_23B6AC374();
  }
  return swift_task_switch();
}

uint64_t sub_23B6A7E8C()
{
  uint64_t v0;
  double v1;

  v1 = TokenAsyncSequence.next()(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(double))(v0 + 8))(v1);
}

unint64_t sub_23B6A7EC4()
{
  unint64_t result;

  result = qword_256A406D0[0];
  if (!qword_256A406D0[0])
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for TokenAsyncSequence, &type metadata for TokenAsyncSequence);
    atomic_store(result, qword_256A406D0);
  }
  return result;
}

uint64_t sub_23B6A7F08()
{
  return MEMORY[0x24BEE40A8];
}

ValueMetadata *type metadata accessor for TokenAsyncSequence()
{
  return &type metadata for TokenAsyncSequence;
}

uint64_t sub_23B6A7F24(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t AntiTrackingKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t static AntiTrackingKey.length.getter()
{
  return 72;
}

uint64_t AntiTrackingKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

__n128 AntiTrackingKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6A7F80()
{
  sub_23B6A80D0();
  return sub_23B6AC518();
}

uint64_t sub_23B6A7FA8()
{
  sub_23B6A80D0();
  return sub_23B6AC524();
}

uint64_t AntiTrackingKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A406E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A80D0();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23B6A80D0()
{
  unint64_t result;

  result = qword_256A406F0;
  if (!qword_256A406F0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE5C4, &type metadata for AntiTrackingKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A406F0);
  }
  return result;
}

uint64_t AntiTrackingKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A406F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A80D0();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_23B6A8234(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6A8258();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6A8258()
{
  unint64_t result;

  result = qword_256A40700;
  if (!qword_256A40700)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40700);
  }
  return result;
}

uint64_t sub_23B6A829C()
{
  return 72;
}

unint64_t sub_23B6A82A4(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6A82E0();
  a1[2] = sub_23B6A8324();
  a1[3] = sub_23B6A8368();
  result = sub_23B6A83AC();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6A82E0()
{
  unint64_t result;

  result = qword_256A40708;
  if (!qword_256A40708)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40708);
  }
  return result;
}

unint64_t sub_23B6A8324()
{
  unint64_t result;

  result = qword_256A40710;
  if (!qword_256A40710)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40710);
  }
  return result;
}

unint64_t sub_23B6A8368()
{
  unint64_t result;

  result = qword_256A40718;
  if (!qword_256A40718)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40718);
  }
  return result;
}

unint64_t sub_23B6A83AC()
{
  unint64_t result;

  result = qword_256A40720;
  if (!qword_256A40720)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40720);
  }
  return result;
}

uint64_t sub_23B6A83F0@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return AntiTrackingKey.init(from:)(a1, a2);
}

uint64_t sub_23B6A8404(_QWORD *a1)
{
  return AntiTrackingKey.encode(to:)(a1);
}

unint64_t sub_23B6A841C()
{
  unint64_t result;

  result = qword_256A40728;
  if (!qword_256A40728)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for AntiTrackingKey, &type metadata for AntiTrackingKey);
    atomic_store(result, (unint64_t *)&qword_256A40728);
  }
  return result;
}

void sub_23B6A8460(uint64_t *a1)
{
  sub_23B6AB470(*a1, a1[1]);
}

ValueMetadata *type metadata accessor for AntiTrackingKey()
{
  return &type metadata for AntiTrackingKey;
}

uint64_t storeEnumTagSinglePayload for AntiTrackingKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6A84BC + 4 * asc_23B6AE3B4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6A84DC + 4 * byte_23B6AE3B9[v4]))();
}

_BYTE *sub_23B6A84BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6A84DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A84E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A84EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A84F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A84FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AntiTrackingKey.CodingKeys()
{
  return &type metadata for AntiTrackingKey.CodingKeys;
}

unint64_t sub_23B6A851C()
{
  unint64_t result;

  result = qword_256A40730;
  if (!qword_256A40730)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE59C, &type metadata for AntiTrackingKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40730);
  }
  return result;
}

unint64_t sub_23B6A8564()
{
  unint64_t result;

  result = qword_256A40738;
  if (!qword_256A40738)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE50C, &type metadata for AntiTrackingKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40738);
  }
  return result;
}

unint64_t sub_23B6A85AC()
{
  unint64_t result;

  result = qword_256A40740;
  if (!qword_256A40740)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE534, &type metadata for AntiTrackingKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40740);
  }
  return result;
}

uint64_t sub_23B6A85F0()
{
  uint64_t v0;

  v0 = sub_23B6AC20C();
  __swift_allocate_value_buffer(v0, qword_256A40990);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A40990);
  return sub_23B6AC200();
}

__n128 NearOwnerAdvertisement.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t static NearOwnerAdvertisement.length.getter()
{
  return 6;
}

uint64_t NearOwnerAdvertisement.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t NearOwnerAdvertisement.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

double NearOwnerAdvertisement.init(macAddress:ek:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double result;
  __int128 v9;

  v4 = COERCE_DOUBLE(sub_23B6AC05C());
  v6 = v5;
  *(double *)&v9 = v4;
  *((_QWORD *)&v9 + 1) = v5;
  sub_23B698550(*(uint64_t *)&v4, v5);
  sub_23B6AC188();
  sub_23B6980D8(*(uint64_t *)&v4, v6);
  sub_23B6AC164();
  v7 = sub_23B6AC074();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  result = v4;
  *a2 = v9;
  return result;
}

uint64_t NearOwnerAdvertisement.description.getter()
{
  sub_23B6A8A80();
  return sub_23B6AC368();
}

uint64_t sub_23B6A8794()
{
  sub_23B6A8AC4();
  return sub_23B6AC518();
}

uint64_t sub_23B6A87BC()
{
  sub_23B6A8AC4();
  return sub_23B6AC524();
}

uint64_t NearOwnerAdvertisement.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40750);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A8AC4();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t NearOwnerAdvertisement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40760);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A8AC4();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B6A8A04()
{
  sub_23B6A8A80();
  return sub_23B6AC368();
}

uint64_t sub_23B6A8A44()
{
  return 6;
}

uint64_t sub_23B6A8A4C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return NearOwnerAdvertisement.init(from:)(a1, a2);
}

uint64_t sub_23B6A8A60(_QWORD *a1)
{
  return NearOwnerAdvertisement.encode(to:)(a1);
}

void sub_23B6A8A74(uint64_t *a1)
{
  sub_23B6AB500(*a1, a1[1]);
}

unint64_t sub_23B6A8A80()
{
  unint64_t result;

  result = qword_256A40748;
  if (!qword_256A40748)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40748);
  }
  return result;
}

unint64_t sub_23B6A8AC4()
{
  unint64_t result;

  result = qword_256A40758;
  if (!qword_256A40758)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE86C, &type metadata for NearOwnerAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40758);
  }
  return result;
}

unint64_t sub_23B6A8B08(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6A8B2C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6A8B2C()
{
  unint64_t result;

  result = qword_256A40768;
  if (!qword_256A40768)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40768);
  }
  return result;
}

unint64_t sub_23B6A8B70(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6A8BAC();
  a1[2] = sub_23B6A8BF0();
  a1[3] = sub_23B6A8C34();
  result = sub_23B6A8A80();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6A8BAC()
{
  unint64_t result;

  result = qword_256A40770;
  if (!qword_256A40770)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40770);
  }
  return result;
}

unint64_t sub_23B6A8BF0()
{
  unint64_t result;

  result = qword_256A40778;
  if (!qword_256A40778)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40778);
  }
  return result;
}

unint64_t sub_23B6A8C34()
{
  unint64_t result;

  result = qword_256A40780;
  if (!qword_256A40780)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40780);
  }
  return result;
}

unint64_t sub_23B6A8C7C()
{
  unint64_t result;

  result = qword_256A40788;
  if (!qword_256A40788)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for NearOwnerAdvertisement, &type metadata for NearOwnerAdvertisement);
    atomic_store(result, (unint64_t *)&qword_256A40788);
  }
  return result;
}

ValueMetadata *type metadata accessor for NearOwnerAdvertisement()
{
  return &type metadata for NearOwnerAdvertisement;
}

uint64_t storeEnumTagSinglePayload for NearOwnerAdvertisement.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6A8D10 + 4 * byte_23B6AE620[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6A8D30 + 4 * byte_23B6AE625[v4]))();
}

_BYTE *sub_23B6A8D10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6A8D30(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A8D38(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A8D40(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6A8D48(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6A8D50(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for NearOwnerAdvertisement.CodingKeys()
{
  return &type metadata for NearOwnerAdvertisement.CodingKeys;
}

unint64_t sub_23B6A8D70()
{
  unint64_t result;

  result = qword_256A40790;
  if (!qword_256A40790)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE844, &type metadata for NearOwnerAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40790);
  }
  return result;
}

unint64_t sub_23B6A8DB8()
{
  unint64_t result;

  result = qword_256A40798;
  if (!qword_256A40798)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE7B4, &type metadata for NearOwnerAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40798);
  }
  return result;
}

unint64_t sub_23B6A8E00()
{
  unint64_t result;

  result = qword_256A407A0;
  if (!qword_256A407A0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE7DC, &type metadata for NearOwnerAdvertisement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A407A0);
  }
  return result;
}

uint64_t GeneratedTokens.hint.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t GeneratedTokens.diversifiedRootKeys.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = v1[3];
  v3 = v1[4];
  v4 = v1[5];
  v5 = v1[6];
  v7 = v1[7];
  v6 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v7;
  a1[5] = v6;
  sub_23B699840(v2, v3);
  sub_23B698550(v4, v5);
  return sub_23B699840(v7, v6);
}

uint64_t GeneratedTokens.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = v0[1];
  v3 = v0[2];
  v2 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v7 = v0[6];
  v6 = v0[7];
  v8 = v0[8];
  sub_23B6AC4E8();
  sub_23B698550(v1, v3);
  sub_23B6AC170();
  sub_23B6980D8(v1, v3);
  sub_23B6AC4DC();
  sub_23B699840(v2, v5);
  sub_23B698550(v4, v7);
  sub_23B699840(v6, v8);
  if (v5 >> 60 != 15)
  {
    sub_23B699840(v2, v5);
    sub_23B6AC170();
    sub_23B69A8B4(v2, v5);
  }
  sub_23B698550(v4, v7);
  sub_23B6AC170();
  sub_23B6980D8(v4, v7);
  sub_23B6AC4DC();
  if (v8 >> 60 != 15)
  {
    sub_23B698550(v6, v8);
    sub_23B6AC170();
    sub_23B69A8B4(v6, v8);
  }
  sub_23B69A8B4(v2, v5);
  sub_23B6980D8(v4, v7);
  return sub_23B69A8B4(v6, v8);
}

uint64_t sub_23B6A905C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 1953393000;
}

uint64_t sub_23B6A9094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B6A9EC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B6A90B8()
{
  sub_23B6A972C();
  return sub_23B6AC518();
}

uint64_t sub_23B6A90E0()
{
  sub_23B6A972C();
  return sub_23B6AC524();
}

uint64_t GeneratedTokens.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A407A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v1;
  v9 = *((_QWORD *)v1 + 2);
  v8 = *((_QWORD *)v1 + 3);
  v17 = *((_QWORD *)v1 + 4);
  v18 = v8;
  v10 = *((_QWORD *)v1 + 5);
  v15 = *((_QWORD *)v1 + 6);
  v16 = v10;
  v11 = *((_QWORD *)v1 + 7);
  v13 = *((_QWORD *)v1 + 8);
  v14 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A972C();
  sub_23B6AC50C();
  v20 = v19;
  v21 = v9;
  v25 = 0;
  sub_23B6A9770();
  sub_23B6AC458();
  if (!v2)
  {
    *(_QWORD *)&v20 = v18;
    *((_QWORD *)&v20 + 1) = v17;
    v21 = v16;
    v22 = v15;
    v23 = v14;
    v24 = v13;
    v25 = 1;
    sub_23B6A97B4();
    sub_23B6AC458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t GeneratedTokens.hashValue.getter()
{
  sub_23B6AC4C4();
  GeneratedTokens.hash(into:)();
  return sub_23B6AC4F4();
}

uint64_t GeneratedTokens.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A407C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6A972C();
  sub_23B6AC500();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v36 = 0;
  sub_23B6A97F8();
  sub_23B6AC434();
  v9 = v31;
  v29 = v30;
  v10 = v32;
  v36 = 1;
  sub_23B698550(v31, v32);
  sub_23B6A983C();
  sub_23B6AC434();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v30;
  v12 = v31;
  v26 = v30;
  v27 = v31;
  v13 = v32;
  v28 = v32;
  v14 = v34;
  v24 = v33;
  v25 = v35;
  sub_23B698550(v9, v10);
  sub_23B699840(v11, v12);
  v15 = v13;
  v16 = v24;
  sub_23B698550(v15, v24);
  v17 = v14;
  v18 = v14;
  v19 = v25;
  sub_23B699840(v17, v25);
  sub_23B6980D8(v9, v10);
  *a2 = v29;
  a2[1] = v9;
  v21 = v26;
  v20 = v27;
  a2[2] = v10;
  a2[3] = v21;
  v22 = v28;
  a2[4] = v20;
  a2[5] = v22;
  a2[6] = v16;
  a2[7] = v18;
  a2[8] = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23B6980D8(v9, v10);
  sub_23B69A8B4(v21, v27);
  sub_23B6980D8(v28, v16);
  return sub_23B69A8B4(v18, v19);
}

uint64_t sub_23B6A9558()
{
  sub_23B6AC4C4();
  GeneratedTokens.hash(into:)();
  return sub_23B6AC4F4();
}

uint64_t sub_23B6A95B4()
{
  sub_23B6AC4C4();
  GeneratedTokens.hash(into:)();
  return sub_23B6AC4F4();
}

uint64_t sub_23B6A9608@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeneratedTokens.init(from:)(a1, a2);
}

uint64_t sub_23B6A961C(_QWORD *a1)
{
  return GeneratedTokens.encode(to:)(a1);
}

BOOL _s12FindMyCrypto15GeneratedTokensV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  _OWORD v17[3];

  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  v14 = *(_OWORD *)(a1 + 40);
  v15 = *(_OWORD *)(a1 + 24);
  v12 = *(_OWORD *)(a2 + 24);
  v13 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a2 + 56);
  v11 = *(_OWORD *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 8);
  v2 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  sub_23B698550(v5, v4);
  sub_23B698550(v3, v2);
  sub_23B69CFE4(v5, v4);
  v7 = v6;
  sub_23B6980D8(v3, v2);
  sub_23B6980D8(v5, v4);
  if ((v7 & 1) != 0)
  {
    v17[0] = v15;
    v17[1] = v14;
    v17[2] = v13;
    v16[0] = v12;
    v16[1] = v11;
    v16[2] = v10;
    return _s12FindMyCrypto19DiversifiedRootKeysV2eeoiySbAC_ACtFZ_0((uint64_t *)v17, (uint64_t *)v16);
  }
  else
  {
    return 0;
  }
}

unint64_t sub_23B6A972C()
{
  unint64_t result;

  result = qword_256A407B0;
  if (!qword_256A407B0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEA60, &type metadata for GeneratedTokens.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A407B0);
  }
  return result;
}

unint64_t sub_23B6A9770()
{
  unint64_t result;

  result = qword_256A407B8;
  if (!qword_256A407B8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyGenerationHint, &type metadata for KeyGenerationHint);
    atomic_store(result, (unint64_t *)&qword_256A407B8);
  }
  return result;
}

unint64_t sub_23B6A97B4()
{
  unint64_t result;

  result = qword_256A407C0;
  if (!qword_256A407C0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for DiversifiedRootKeys, &type metadata for DiversifiedRootKeys);
    atomic_store(result, (unint64_t *)&qword_256A407C0);
  }
  return result;
}

unint64_t sub_23B6A97F8()
{
  unint64_t result;

  result = qword_256A407D0;
  if (!qword_256A407D0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for KeyGenerationHint, &type metadata for KeyGenerationHint);
    atomic_store(result, (unint64_t *)&qword_256A407D0);
  }
  return result;
}

unint64_t sub_23B6A983C()
{
  unint64_t result;

  result = qword_256A407D8;
  if (!qword_256A407D8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for DiversifiedRootKeys, &type metadata for DiversifiedRootKeys);
    atomic_store(result, (unint64_t *)&qword_256A407D8);
  }
  return result;
}

unint64_t sub_23B6A9884()
{
  unint64_t result;

  result = qword_256A407E0;
  if (!qword_256A407E0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for GeneratedTokens, &type metadata for GeneratedTokens);
    atomic_store(result, (unint64_t *)&qword_256A407E0);
  }
  return result;
}

uint64_t destroy for GeneratedTokens(_QWORD *a1)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v4;

  sub_23B6980D8(a1[1], a1[2]);
  v2 = a1[4];
  if (v2 >> 60 != 15)
    sub_23B6980D8(a1[3], v2);
  result = sub_23B6980D8(a1[5], a1[6]);
  v4 = a1[8];
  if (v4 >> 60 != 15)
    return sub_23B6980D8(a1[7], v4);
  return result;
}

uint64_t initializeWithCopy for GeneratedTokens(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  v5 = a2[2];
  sub_23B698550(v4, v5);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v6 = a2 + 3;
  v7 = a2[4];
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    sub_23B698550(*v6, a2[4]);
    *(_QWORD *)(a1 + 24) = v8;
    *(_QWORD *)(a1 + 32) = v7;
  }
  v9 = a2[5];
  v10 = a2[6];
  sub_23B698550(v9, v10);
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  v11 = a2 + 7;
  v12 = a2[8];
  if (v12 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)v11;
  }
  else
  {
    v13 = *v11;
    sub_23B698550(*v11, v12);
    *(_QWORD *)(a1 + 56) = v13;
    *(_QWORD *)(a1 + 64) = v12;
  }
  return a1;
}

_QWORD *assignWithCopy for GeneratedTokens(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_23B698550(v4, v5);
  v6 = a1[1];
  v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_23B6980D8(v6, v7);
  v8 = a2 + 3;
  v9 = a2[4];
  if (a1[4] >> 60 == 15)
  {
    if (v9 >> 60 != 15)
    {
      v10 = *v8;
      sub_23B698550(*v8, a2[4]);
      a1[3] = v10;
      a1[4] = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
    sub_23B6A314C((uint64_t)(a1 + 3));
LABEL_6:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)v8;
    goto LABEL_8;
  }
  v11 = *v8;
  sub_23B698550(*v8, a2[4]);
  v12 = a1[3];
  v13 = a1[4];
  a1[3] = v11;
  a1[4] = v9;
  sub_23B6980D8(v12, v13);
LABEL_8:
  v14 = a2[5];
  v15 = a2[6];
  sub_23B698550(v14, v15);
  v16 = a1[5];
  v17 = a1[6];
  a1[5] = v14;
  a1[6] = v15;
  sub_23B6980D8(v16, v17);
  v18 = a2 + 7;
  v19 = a2[8];
  if (a1[8] >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      v21 = *v18;
      sub_23B698550(*v18, v19);
      v22 = a1[7];
      v23 = a1[8];
      a1[7] = v21;
      a1[8] = v19;
      sub_23B6980D8(v22, v23);
      return a1;
    }
    sub_23B69A26C((uint64_t)(a1 + 7));
    goto LABEL_13;
  }
  if (v19 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)(a1 + 7) = *(_OWORD *)v18;
    return a1;
  }
  v20 = *v18;
  sub_23B698550(*v18, v19);
  a1[7] = v20;
  a1[8] = v19;
  return a1;
}

uint64_t assignWithTake for GeneratedTokens(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  sub_23B6980D8(v5, v6);
  v7 = (_OWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 >> 60 == 15)
    goto LABEL_4;
  v9 = *(_QWORD *)(a2 + 32);
  if (v9 >> 60 == 15)
  {
    sub_23B6A314C(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *v7;
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)v7;
  *(_QWORD *)(a1 + 32) = v9;
  sub_23B6980D8(v10, v8);
LABEL_6:
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_23B6980D8(v11, v12);
  v13 = (_QWORD *)(a2 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  if (v14 >> 60 != 15)
  {
    v15 = *(_QWORD *)(a2 + 64);
    if (v15 >> 60 != 15)
    {
      v16 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 56) = *v13;
      *(_QWORD *)(a1 + 64) = v15;
      sub_23B6980D8(v16, v14);
      return a1;
    }
    sub_23B69A26C(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for GeneratedTokens(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for GeneratedTokens(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 72) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneratedTokens()
{
  return &type metadata for GeneratedTokens;
}

uint64_t storeEnumTagSinglePayload for GeneratedTokens.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23B6A9D68 + 4 * byte_23B6AE8C1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B6A9D9C + 4 * byte_23B6AE8BC[v4]))();
}

uint64_t sub_23B6A9D9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A9DA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6A9DACLL);
  return result;
}

uint64_t sub_23B6A9DB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6A9DC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B6A9DC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6A9DCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GeneratedTokens.CodingKeys()
{
  return &type metadata for GeneratedTokens.CodingKeys;
}

unint64_t sub_23B6A9DEC()
{
  unint64_t result;

  result = qword_256A407E8;
  if (!qword_256A407E8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEA38, &type metadata for GeneratedTokens.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A407E8);
  }
  return result;
}

unint64_t sub_23B6A9E34()
{
  unint64_t result;

  result = qword_256A407F0;
  if (!qword_256A407F0)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE9A8, &type metadata for GeneratedTokens.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A407F0);
  }
  return result;
}

unint64_t sub_23B6A9E7C()
{
  unint64_t result;

  result = qword_256A407F8;
  if (!qword_256A407F8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AE9D0, &type metadata for GeneratedTokens.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A407F8);
  }
  return result;
}

uint64_t sub_23B6A9EC0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1953393000 && a2 == 0xE400000000000000;
  if (v2 || (sub_23B6AC47C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023B6B1550)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B6AC47C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t static P256PrivateKey.length.getter()
{
  return 32;
}

char *sub_23B6A9FA4()
{
  char *result;
  uint64_t v1;
  uint64_t v2;

  sub_23B6AC104();
  swift_allocObject();
  v1 = 0x2000000000;
  v2 = sub_23B6AC0E0();
  result = sub_23B6AACE4((int *)&v1, 0);
  qword_256A40800 = v1;
  *(_QWORD *)algn_256A40808 = v2 | 0x4000000000000000;
  return result;
}

uint64_t P256PrivateKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t P256PrivateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t static P256PrivateKey.random()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_23B6AC2CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B6AC2B4();
  v4 = sub_23B6AC29C();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return P256PrivateKey.init(data:)(v4, v6);
}

uint64_t P256PrivateKey.init(data:)(uint64_t a1, unint64_t a2)
{
  char v4;
  uint64_t v5;

  if (qword_256A40200 != -1)
    swift_once();
  sub_23B69CFE4(a1, a2);
  if ((v4 & 1) == 0)
    __asm { BR              X10 }
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 16) = 2;
  swift_willThrow();
  return sub_23B6980D8(a1, a2);
}

__n128 P256PrivateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6AA2D0()
{
  sub_23B6978C8();
  return sub_23B6AC518();
}

uint64_t sub_23B6AA2F8()
{
  sub_23B6978C8();
  return sub_23B6AC524();
}

uint64_t P256PrivateKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40810);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6978C8();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23B6AA420(_QWORD *a1)
{
  return P256PrivateKey.encode(to:)(a1);
}

unint64_t sub_23B6AA444(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6AA468();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6AA468()
{
  unint64_t result;

  result = qword_256A40828;
  if (!qword_256A40828)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40828);
  }
  return result;
}

unint64_t sub_23B6AA4AC(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6AA4E8();
  a1[2] = sub_23B6AA52C();
  a1[3] = sub_23B6AA570();
  result = sub_23B6AA5B4();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6AA4E8()
{
  unint64_t result;

  result = qword_256A40830;
  if (!qword_256A40830)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40830);
  }
  return result;
}

unint64_t sub_23B6AA52C()
{
  unint64_t result;

  result = qword_256A40838;
  if (!qword_256A40838)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40838);
  }
  return result;
}

unint64_t sub_23B6AA570()
{
  unint64_t result;

  result = qword_256A40840;
  if (!qword_256A40840)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40840);
  }
  return result;
}

unint64_t sub_23B6AA5B4()
{
  unint64_t result;

  result = qword_256A40848;
  if (!qword_256A40848)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40848);
  }
  return result;
}

unint64_t sub_23B6AA5FC()
{
  unint64_t result;

  result = qword_256A40850;
  if (!qword_256A40850)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for P256PrivateKey, &type metadata for P256PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40850);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for P256PrivateKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6AA680 + 4 * byte_23B6AEAB8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6AA6A0 + 4 * byte_23B6AEABD[v4]))();
}

_BYTE *sub_23B6AA680(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6AA6A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AA6A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AA6B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AA6B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AA6C0(_DWORD *result)
{
  *result = 0;
  return result;
}

unint64_t sub_23B6AA6D0()
{
  unint64_t result;

  result = qword_256A40858;
  if (!qword_256A40858)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AECA0, &type metadata for P256PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40858);
  }
  return result;
}

uint64_t static SymmetricKey256.length.getter()
{
  return 32;
}

char *sub_23B6AA71C()
{
  char *result;
  uint64_t v1;
  uint64_t v2;

  sub_23B6AC104();
  swift_allocObject();
  v1 = 0x2000000000;
  v2 = sub_23B6AC0E0();
  result = sub_23B6AACE4((int *)&v1, 0);
  qword_256A40870 = v1;
  *(_QWORD *)algn_256A40878 = v2 | 0x4000000000000000;
  return result;
}

uint64_t SymmetricKey256.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t SymmetricKey256.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t static SymmetricKey256.random()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v0 = sub_23B6AC284();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23B6AC26C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B6AC278();
  sub_23B6AC260();
  sub_23B6AC248();
  v5 = v9;
  v6 = v10;
  sub_23B698550(v9, v10);
  SymmetricKey256.init(data:)(v5, v6);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_23B6980D8(v5, v6);
}

uint64_t sub_23B6AA910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v14[3] = MEMORY[0x24BEE0F88];
  v14[4] = MEMORY[0x24BDCFB90];
  v14[0] = a1;
  v14[1] = a2;
  v4 = __swift_project_boxed_opaque_existential_1(v14, MEMORY[0x24BEE0F88]);
  v5 = (_BYTE *)*v4;
  if (*v4 && (v6 = (_BYTE *)v4[1], v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      v8 = sub_23B6AB034(v5, v6);
      v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      v8 = sub_23B6AB0F4((uint64_t)v5, (uint64_t)v6);
      v9 = v13 | 0x8000000000000000;
    }
    else
    {
      v8 = sub_23B698D04((uint64_t)v5, (uint64_t)v6);
      v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0xC000000000000000;
  }
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
}

uint64_t SymmetricKey256.init(data:)(uint64_t a1, unint64_t a2)
{
  char v4;
  uint64_t v5;

  if (qword_256A40208 != -1)
    swift_once();
  sub_23B69CFE4(a1, a2);
  if ((v4 & 1) == 0)
    __asm { BR              X10 }
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 16) = 2;
  swift_willThrow();
  return sub_23B6980D8(a1, a2);
}

__n128 SymmetricKey256.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6AAB80()
{
  sub_23B69770C();
  return sub_23B6AC518();
}

uint64_t sub_23B6AABA8()
{
  sub_23B69770C();
  return sub_23B6AC524();
}

uint64_t SymmetricKey256.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40880);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B69770C();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23B6AACD0(_QWORD *a1)
{
  return SymmetricKey256.encode(to:)(a1);
}

char *sub_23B6AACE4(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_23B6AC134();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_23B6AC0D4();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_23B6AC0F8();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_23B6AC0EC();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

unint64_t sub_23B6AAD64(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6AAD88();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6AAD88()
{
  unint64_t result;

  result = qword_256A40898;
  if (!qword_256A40898)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A40898);
  }
  return result;
}

unint64_t sub_23B6AADCC(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6AAE08();
  a1[2] = sub_23B6AAE4C();
  a1[3] = sub_23B6AAE90();
  result = sub_23B6AAED4();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6AAE08()
{
  unint64_t result;

  result = qword_256A408A0;
  if (!qword_256A408A0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A408A0);
  }
  return result;
}

unint64_t sub_23B6AAE4C()
{
  unint64_t result;

  result = qword_256A408A8;
  if (!qword_256A408A8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A408A8);
  }
  return result;
}

unint64_t sub_23B6AAE90()
{
  unint64_t result;

  result = qword_256A408B0;
  if (!qword_256A408B0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A408B0);
  }
  return result;
}

unint64_t sub_23B6AAED4()
{
  unint64_t result;

  result = qword_256A408B8;
  if (!qword_256A408B8)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A408B8);
  }
  return result;
}

unint64_t sub_23B6AAF1C()
{
  unint64_t result;

  result = qword_256A408C0;
  if (!qword_256A408C0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for SymmetricKey256, &type metadata for SymmetricKey256);
    atomic_store(result, (unint64_t *)&qword_256A408C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SymmetricKey256.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6AAFA0 + 4 * byte_23B6AED18[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6AAFC0 + 4 * byte_23B6AED1D[v4]))();
}

_BYTE *sub_23B6AAFA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6AAFC0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AAFC8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AAFD0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AAFD8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AAFE0(_DWORD *result)
{
  *result = 0;
  return result;
}

unint64_t sub_23B6AAFF0()
{
  unint64_t result;

  result = qword_256A408C8;
  if (!qword_256A408C8)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AEF00, &type metadata for SymmetricKey256.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A408C8);
  }
  return result;
}

uint64_t sub_23B6AB034(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_23B6AB0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23B6AC104();
  swift_allocObject();
  result = sub_23B6AC0C8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23B6AC140();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t static TokenSequenceError.== infix(_:_:)()
{
  return 1;
}

uint64_t TokenSequenceError.hash(into:)()
{
  return sub_23B6AC4D0();
}

uint64_t TokenSequenceError.hashValue.getter()
{
  sub_23B6AC4C4();
  sub_23B6AC4D0();
  return sub_23B6AC4F4();
}

unint64_t sub_23B6AB1DC()
{
  unint64_t result;

  result = qword_256A408E0;
  if (!qword_256A408E0)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for TokenSequenceError, &type metadata for TokenSequenceError);
    atomic_store(result, (unint64_t *)&qword_256A408E0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TokenSequenceError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6AB260 + 4 * byte_23B6AEF80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6AB280 + 4 * byte_23B6AEF85[v4]))();
}

_BYTE *sub_23B6AB260(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6AB280(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AB288(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AB290(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6AB298(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6AB2A0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TokenSequenceError()
{
  return &type metadata for TokenSequenceError;
}

void sub_23B6AB2BC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB2E8(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 28)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB350(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB37C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 57)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB3E0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB40C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 64)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB470(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB49C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 72)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB500(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB52C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 6)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB590(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB5BC(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 32)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_23B6AB620(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23B6AB64C(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 85)
  {
    sub_23B6980D8(result, a2);
    result = 0;
    a2 = 0xF000000000000000;
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t PrivateKey.init(data:)(uint64_t a1, unint64_t a2)
{
  char v4;
  uint64_t v5;

  if (qword_256A40210 != -1)
    swift_once();
  sub_23B69CFE4(a1, a2);
  if ((v4 & 1) == 0)
    __asm { BR              X10 }
  sub_23B69D610();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 16) = 2;
  swift_willThrow();
  return sub_23B6980D8(a1, a2);
}

uint64_t PrivateKey.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23B698550(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t static PrivateKey.length.getter()
{
  return 85;
}

char *sub_23B6AB884()
{
  char *result;
  uint64_t v1;
  uint64_t v2;

  sub_23B6AC104();
  swift_allocObject();
  v1 = 0x5500000000;
  v2 = sub_23B6AC0E0();
  result = sub_23B6AACE4((int *)&v1, 0);
  qword_256A408E8 = v1;
  unk_256A408F0 = v2 | 0x4000000000000000;
  return result;
}

uint64_t PrivateKey.key.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23B698550(v2, v3);
}

uint64_t static PrivateKey.random()()
{
  return sub_23B69F4A4();
}

__n128 PrivateKey.init(key:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6AB968()
{
  sub_23B6ABD20();
  return sub_23B6AC518();
}

uint64_t sub_23B6AB990()
{
  sub_23B6ABD20();
  return sub_23B6AC524();
}

uint64_t PrivateKey.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A408F8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6ABD20();
  sub_23B6AC50C();
  v10[0] = v8;
  v10[1] = v7;
  sub_23B69BB18();
  sub_23B6AC458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PrivateKey.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A40908);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B6ABD20();
  sub_23B6AC500();
  if (!v2)
  {
    sub_23B697884();
    sub_23B6AC434();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23B6ABBD8()
{
  return 85;
}

uint64_t sub_23B6ABBE0@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return PrivateKey.init(from:)(a1, a2);
}

uint64_t sub_23B6ABBF4(_QWORD *a1)
{
  return PrivateKey.encode(to:)(a1);
}

void sub_23B6ABC08(uint64_t *a1)
{
  sub_23B6AB620(*a1, a1[1]);
}

void PrivateKey.publicKey.getter()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *v0;
  v1 = v0[1];
  sub_23B698550(v2, v1);
  sub_23B69AF78(57, v2, v1);
  __asm { BR              X10 }
}

uint64_t sub_23B6ABC70(uint64_t result, unint64_t a2)
{
  uint64_t *v2;

  if (BYTE6(a2) != 57)
  {
    sub_23B6980D8(result, a2);
    sub_23B6AC410();
    __break(1u);
    JUMPOUT(0x23B6ABD10);
  }
  *v2 = result;
  v2[1] = a2;
  return result;
}

unint64_t sub_23B6ABD20()
{
  unint64_t result;

  result = qword_256A40900;
  if (!qword_256A40900)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AF26C, &type metadata for PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40900);
  }
  return result;
}

unint64_t sub_23B6ABD64(uint64_t a1)
{
  unint64_t result;

  result = sub_23B6ABD88();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23B6ABD88()
{
  unint64_t result;

  result = qword_256A40910;
  if (!qword_256A40910)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40910);
  }
  return result;
}

unint64_t sub_23B6ABDCC(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B6A2E84();
  a1[2] = sub_23B6A2DFC();
  a1[3] = sub_23B6ABE08();
  result = sub_23B6ABE4C();
  a1[4] = result;
  return result;
}

unint64_t sub_23B6ABE08()
{
  unint64_t result;

  result = qword_256A40918;
  if (!qword_256A40918)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40918);
  }
  return result;
}

unint64_t sub_23B6ABE4C()
{
  unint64_t result;

  result = qword_256A40920;
  if (!qword_256A40920)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40920);
  }
  return result;
}

unint64_t sub_23B6ABE94()
{
  unint64_t result;

  result = qword_256A40928;
  if (!qword_256A40928)
  {
    result = MEMORY[0x23B86AC88](&protocol conformance descriptor for PrivateKey, &type metadata for PrivateKey);
    atomic_store(result, (unint64_t *)&qword_256A40928);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateKey()
{
  return &type metadata for PrivateKey;
}

uint64_t storeEnumTagSinglePayload for PrivateKey.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23B6ABF28 + 4 * byte_23B6AF060[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6ABF48 + 4 * byte_23B6AF065[v4]))();
}

_BYTE *sub_23B6ABF28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6ABF48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6ABF50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6ABF58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6ABF60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6ABF68(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PrivateKey.CodingKeys()
{
  return &type metadata for PrivateKey.CodingKeys;
}

unint64_t sub_23B6ABF88()
{
  unint64_t result;

  result = qword_256A40930;
  if (!qword_256A40930)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AF244, &type metadata for PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40930);
  }
  return result;
}

unint64_t sub_23B6ABFD0()
{
  unint64_t result;

  result = qword_256A40938;
  if (!qword_256A40938)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AF1B4, &type metadata for PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40938);
  }
  return result;
}

unint64_t sub_23B6AC018()
{
  unint64_t result;

  result = qword_256A40940;
  if (!qword_256A40940)
  {
    result = MEMORY[0x23B86AC88](&unk_23B6AF1DC, &type metadata for PrivateKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A40940);
  }
  return result;
}

uint64_t sub_23B6AC05C()
{
  return MEMORY[0x24BE31710]();
}

uint64_t sub_23B6AC068()
{
  return MEMORY[0x24BE31728]();
}

uint64_t sub_23B6AC074()
{
  return MEMORY[0x24BE31730]();
}

uint64_t sub_23B6AC080()
{
  return MEMORY[0x24BE31820]();
}

uint64_t sub_23B6AC08C()
{
  return MEMORY[0x24BE31A28]();
}

uint64_t sub_23B6AC098()
{
  return MEMORY[0x24BE31A30]();
}

uint64_t sub_23B6AC0A4()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_23B6AC0B0()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_23B6AC0BC()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23B6AC0C8()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23B6AC0D4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23B6AC0E0()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23B6AC0EC()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23B6AC0F8()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23B6AC104()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23B6AC110()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23B6AC11C()
{
  return MEMORY[0x24BE31A48]();
}

uint64_t sub_23B6AC128()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23B6AC134()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_23B6AC140()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23B6AC14C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23B6AC158()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_23B6AC164()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_23B6AC170()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23B6AC17C()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_23B6AC188()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_23B6AC194()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_23B6AC1A0()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23B6AC1AC()
{
  return MEMORY[0x24BDCE2E8]();
}

uint64_t sub_23B6AC1B8()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23B6AC1C4()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_23B6AC1D0()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23B6AC1DC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23B6AC1E8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B6AC1F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B6AC200()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B6AC20C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B6AC218()
{
  return MEMORY[0x24BDC6108]();
}

uint64_t sub_23B6AC224()
{
  return MEMORY[0x24BDC6120]();
}

uint64_t sub_23B6AC230()
{
  return MEMORY[0x24BDC6138]();
}

uint64_t sub_23B6AC23C()
{
  return MEMORY[0x24BDC61A8]();
}

uint64_t sub_23B6AC248()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_23B6AC254()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_23B6AC260()
{
  return MEMORY[0x24BDC63C0]();
}

uint64_t sub_23B6AC26C()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_23B6AC278()
{
  return MEMORY[0x24BDC64F0]();
}

uint64_t sub_23B6AC284()
{
  return MEMORY[0x24BDC6510]();
}

uint64_t sub_23B6AC290()
{
  return MEMORY[0x24BDC6980]();
}

uint64_t sub_23B6AC29C()
{
  return MEMORY[0x24BDC6988]();
}

uint64_t sub_23B6AC2A8()
{
  return MEMORY[0x24BDC6990]();
}

uint64_t sub_23B6AC2B4()
{
  return MEMORY[0x24BDC69A8]();
}

uint64_t sub_23B6AC2C0()
{
  return MEMORY[0x24BDC69C0]();
}

uint64_t sub_23B6AC2CC()
{
  return MEMORY[0x24BDC69D0]();
}

uint64_t sub_23B6AC2D8()
{
  return MEMORY[0x24BDC69F0]();
}

uint64_t sub_23B6AC2E4()
{
  return MEMORY[0x24BDC69F8]();
}

uint64_t sub_23B6AC2F0()
{
  return MEMORY[0x24BDC6A00]();
}

uint64_t sub_23B6AC2FC()
{
  return MEMORY[0x24BDC6A10]();
}

uint64_t sub_23B6AC308()
{
  return MEMORY[0x24BDC6A18]();
}

uint64_t sub_23B6AC314()
{
  return MEMORY[0x24BDC6A20]();
}

uint64_t sub_23B6AC320()
{
  return MEMORY[0x24BDC6A60]();
}

uint64_t sub_23B6AC32C()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_23B6AC338()
{
  return MEMORY[0x24BE31AA0]();
}

uint64_t sub_23B6AC344()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B6AC350()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B6AC35C()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_23B6AC368()
{
  return MEMORY[0x24BE31AC8]();
}

uint64_t sub_23B6AC374()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B6AC380()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_23B6AC38C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23B6AC398()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23B6AC3A4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B6AC3B0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B6AC3BC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B6AC3C8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B6AC3D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B6AC3E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B6AC3EC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B6AC3F8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23B6AC404()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B6AC410()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B6AC41C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B6AC428()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23B6AC434()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23B6AC440()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_23B6AC44C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23B6AC458()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23B6AC464()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_23B6AC470()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B6AC47C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B6AC488()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B6AC494()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B6AC4A0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B6AC4AC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B6AC4B8()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23B6AC4C4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B6AC4D0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B6AC4DC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23B6AC4E8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23B6AC4F4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B6AC500()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23B6AC50C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23B6AC518()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23B6AC524()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x24BDAC1A0]();
}

uint64_t CCECCryptorExportKey()
{
  return MEMORY[0x24BDAC200]();
}

uint64_t CCECCryptorGeneratePair()
{
  return MEMORY[0x24BDAC208]();
}

uint64_t CCECCryptorImportKey()
{
  return MEMORY[0x24BDAC210]();
}

uint64_t CCECCryptorRelease()
{
  return MEMORY[0x24BDAC218]();
}

uint64_t CCECCryptorTwinDiversifyKey()
{
  return MEMORY[0x24BDAC220]();
}

uint64_t CCKDFParametersCreateAnsiX963()
{
  return MEMORY[0x24BDAC258]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x24BDAC270]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

