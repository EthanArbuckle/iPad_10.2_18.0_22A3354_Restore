uint64_t sub_21449D890()
{
  __SecTask *v0;
  __CFString *v1;
  unsigned __int8 v3;

  v1 = (__CFString *)sub_2144A4990();
  SecTaskCopyValueForEntitlement(v0, v1, 0);

  __swift_instantiateConcreteTypeFromMangledName(qword_253F0F9C0);
  return swift_dynamicCast() & v3;
}

uint64_t sub_21449D904(uint64_t a1)
{
  __SecTask *v1;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  uint64_t v7;
  uint64_t v8;

  v3 = SecTaskCopyTeamIdentifier();
  if (v3)
  {
    v4 = (void *)v3;
    v7 = 0;
    v8 = 0;
    sub_2144A499C();

  }
  if (!os_variant_allows_internal_security_policies())
    return 0;
  v5 = (__CFString *)sub_2144A4990();
  SecTaskCopyValueForEntitlement(v1, v5, 0);

  __swift_instantiateConcreteTypeFromMangledName(qword_253F0F9C0);
  if ((swift_dynamicCast() & 1) != 0 && v8)
    return v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199CECBC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21449DA4C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_21449DA8C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21449DAAC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_253F0F9B0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_253F0F9B0);
  }
}

uint64_t dispatch thunk of KeyRetrieving.retrieveEncodingKeyData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeyRetrieving.retrieveDecodingKeyDatas()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static TeamIdentifierRetrieving.teamIdentifierFromCurrentConnection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static TeamIdentifierRetrieving.teamIdentifier(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t (*v4)(_OWORD *);
  __int128 v5;
  _OWORD v7[2];
  char v8;

  v3 = *(_BYTE *)(a1 + 32);
  v4 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  v8 = v3;
  return v4(v7);
}

uint64_t KeyGenerator.generateKeyData()()
{
  return sub_21449DCB0();
}

ValueMetadata *type metadata accessor for KeyGenerator()
{
  return &type metadata for KeyGenerator;
}

ValueMetadata *type metadata accessor for Cryptor()
{
  return &type metadata for Cryptor;
}

BOOL sub_21449DBE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21449DBF4()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

uint64_t sub_21449DC38()
{
  return sub_2144A4AE0();
}

uint64_t sub_21449DC60()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

uint64_t sub_21449DCB0()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v3;

  v0 = sub_2144A4A14();
  *(_QWORD *)(v0 + 16) = 32;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x20uLL, (void *)(v0 + 32)))
  {
    swift_bridgeObjectRelease();
    sub_21449E26C();
    swift_allocError();
    *v1 = 2;
    return swift_willThrow();
  }
  else
  {
    v3 = sub_2144A2D30(v0);
    swift_bridgeObjectRelease();
    return v3;
  }
}

void sub_21449DD78(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21449DDB0()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE *v2;

  if (BYTE6(v0) != 32)
  {
    sub_21449E26C();
    swift_allocError();
    *v2 = 1;
    swift_willThrow();
    sub_21449E2B0(v1, v0);
  }
  return v1;
}

unint64_t sub_21449DE50(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  v33 = a5;
  v34 = a6;
  *(_QWORD *)&v32 = a1;
  *((_QWORD *)&v32 + 1) = a2;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D770B0);
  MEMORY[0x24BDAC7A8](v8);
  v36 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_2144A4984();
  v10 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2144A4960();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2144A4930();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v40 = a3;
  *((_QWORD *)&v40 + 1) = a4;
  sub_21449E1A4(a3, a4);
  sub_2144A4924();
  v40 = xmmword_2144A4E20;
  v20 = sub_21449E1E8();
  v21 = v37;
  sub_2144A4954();
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  else
  {
    v30 = v10;
    v37 = v17;
    v40 = v32;
    v22 = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v36, v15, v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v22, 0, 1, v12);
    v23 = v35;
    v38 = v33;
    v39 = v34;
    sub_2144A4948();
    v34 = 0;
    sub_21449E22C(v36);
    v24 = sub_2144A496C();
    v26 = v37;
    if (v25 >> 60 == 15)
    {
      sub_21449E26C();
      v20 = swift_allocError();
      *v27 = 0;
      swift_willThrow();
    }
    else
    {
      v20 = v24;
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v23, v31);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v16);
  }
  return v20;
}

uint64_t sub_21449E1A4(uint64_t a1, unint64_t a2)
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

unint64_t sub_21449E1E8()
{
  unint64_t result;

  result = qword_254D770B8;
  if (!qword_254D770B8)
  {
    result = MEMORY[0x2199CECD4](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254D770B8);
  }
  return result;
}

uint64_t sub_21449E22C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D770B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21449E26C()
{
  unint64_t result;

  result = qword_254D770C0;
  if (!qword_254D770C0)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A4EDC, &type metadata for CryptorError);
    atomic_store(result, (unint64_t *)&qword_254D770C0);
  }
  return result;
}

uint64_t sub_21449E2B0(uint64_t a1, unint64_t a2)
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CryptorError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CryptorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21449E3DC + 4 * byte_2144A4E35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21449E410 + 4 * byte_2144A4E30[v4]))();
}

uint64_t sub_21449E410(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21449E418(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21449E420);
  return result;
}

uint64_t sub_21449E42C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21449E434);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21449E438(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21449E440(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21449E44C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21449E458(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CryptorError()
{
  return &type metadata for CryptorError;
}

uint64_t *initializeBufferWithCopyOfBuffer for Cryptor.Key(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_21449E1A4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for Cryptor.Key(uint64_t a1)
{
  return sub_21449E2B0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for Cryptor.Key(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_21449E1A4(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_21449E2B0(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for Cryptor.Key(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_21449E2B0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Cryptor.Key(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Cryptor.Key(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for Cryptor.Key()
{
  return &type metadata for Cryptor.Key;
}

unint64_t sub_21449E5F4()
{
  unint64_t result;

  result = qword_254D770C8;
  if (!qword_254D770C8)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A4EB4, &type metadata for CryptorError);
    atomic_store(result, (unint64_t *)&qword_254D770C8);
  }
  return result;
}

uint64_t sub_21449E63C()
{
  return 1;
}

uint64_t sub_21449E644()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

uint64_t sub_21449E684()
{
  return sub_2144A4AE0();
}

uint64_t sub_21449E6A8()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

id KeyRetriever.init()@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F28]), sel_init);
  *a1 = result;
  return result;
}

uint64_t KeyRetriever.retrieveEncodingKeyData()()
{
  id *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  int v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  uint64_t v23[2];

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_managedSettings);
  v3 = objc_msgSend(v2, sel_tokenEncodingKey);

  if (v3)
  {
    v4 = sub_2144A48E8();
    v6 = v5;

    sub_21449E1A4(v4, v6);
    v7 = sub_2144A48C4();
    v9 = v8;
    sub_21449E1A4(v4, v6);
    sub_21449F094(v4, v6);
    v11 = v10;
    sub_21449E2B0(v7, v9);
    sub_21449E2B0(v4, v6);
    sub_21449E2B0(v4, v6);
    if ((v11 & 1) == 0)
      goto LABEL_13;
  }
  else
  {
    v4 = 0;
    v6 = 0xF000000000000000;
  }
  v12 = objc_msgSend(v1, sel_allowedClient);
  v13 = objc_msgSend(v12, sel_tokenKeys);

  if (!v13)
  {
    sub_21449E998(v4, v6);
    goto LABEL_11;
  }
  sub_21449E9F0();
  v14 = sub_2144A4A20();

  result = sub_21449EE10(v14);
  if ((v17 & 1) == 0)
  {
    if (*(_DWORD *)(v14 + 36) == v16)
    {
      if (result != 1 << *(_BYTE *)(v14 + 32))
      {
        sub_21449EEB0(result, v16, v14, v23);
        sub_21449E998(v4, v6);
        swift_bridgeObjectRelease();
        v4 = v23[0];
        v6 = v23[1];
LABEL_13:
        sub_21449E1A4(v4, v6);
        v18 = sub_2144A48C4();
        v20 = v19;
        sub_21449F094(v4, v6);
        v22 = v21;
        sub_21449E2B0(v18, v20);
        if ((v22 & 1) == 0)
        {
          sub_21449E998(v4, v6);
          return v4;
        }
        sub_21449E2B0(v4, v6);
LABEL_15:
        sub_21449E9AC();
        swift_allocError();
        swift_willThrow();
        sub_21449E998(v4, v6);
        return v4;
      }
      sub_21449E998(v4, v6);
      swift_bridgeObjectRelease();
LABEL_11:
      v4 = 0;
      v6 = 0xF000000000000000;
      goto LABEL_15;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21449E998(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21449E2B0(a1, a2);
  return a1;
}

unint64_t sub_21449E9AC()
{
  unint64_t result;

  result = qword_254D770D0;
  if (!qword_254D770D0)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A4FDC, &type metadata for KeyRetrieverError);
    atomic_store(result, (unint64_t *)&qword_254D770D0);
  }
  return result;
}

unint64_t sub_21449E9F0()
{
  unint64_t result;

  result = qword_254D770D8;
  if (!qword_254D770D8)
  {
    result = MEMORY[0x2199CECD4](MEMORY[0x24BDCDE08], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254D770D8);
  }
  return result;
}

uint64_t KeyRetriever.retrieveDecodingKeyDatas()()
{
  id *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_managedSettings);
  v3 = objc_msgSend(v2, sel_tokenDecodingKeys);

  if (v3)
  {
    sub_21449E9F0();
    v4 = sub_2144A4A20();

    if (*(_QWORD *)(v4 + 16))
      return v4;
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v1, sel_allowedClient);
  v6 = objc_msgSend(v5, sel_tokenKeys);

  if (!v6)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    sub_21449E9AC();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    return v4;
  }
  sub_21449E9F0();
  v7 = sub_2144A4A20();
  swift_bridgeObjectRelease();

  v4 = v7;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_9;
  return v4;
}

uint64_t sub_21449EB80()
{
  return KeyRetriever.retrieveEncodingKeyData()();
}

uint64_t sub_21449EB94()
{
  return KeyRetriever.retrieveDecodingKeyDatas()();
}

void sub_21449EBA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_21449EC08(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x21449EDECLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_21449EE10(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_21449EEB0@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  if (result < 0 || 1 << *(_BYTE *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a3 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    v4 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * result);
    v5 = *v4;
    v6 = v4[1];
    *a4 = *v4;
    a4[1] = v6;
    return sub_21449E1A4(v5, v6);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_21449EF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_21449EBA8((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21449EFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_2144A4864();
  v11 = result;
  if (result)
  {
    result = sub_2144A4888();
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
  v14 = sub_2144A487C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21449EBA8(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_21449F094(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21449F0E0()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21449F114 + dword_21449F2EC[v0 >> 62]))();
}

uint64_t sub_21449F124@<X0>(int a1@<W8>)
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

ValueMetadata *type metadata accessor for KeyRetriever()
{
  return &type metadata for KeyRetriever;
}

uint64_t getEnumTagSinglePayload for KeyRetrieverError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for KeyRetrieverError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21449F3B0 + 4 * byte_2144A4F20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21449F3D0 + 4 * byte_2144A4F25[v4]))();
}

_BYTE *sub_21449F3B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21449F3D0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21449F3D8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21449F3E0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21449F3E8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21449F3F0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21449F3FC()
{
  return 0;
}

ValueMetadata *type metadata accessor for KeyRetrieverError()
{
  return &type metadata for KeyRetrieverError;
}

unint64_t sub_21449F418()
{
  unint64_t result;

  result = qword_254D770E0;
  if (!qword_254D770E0)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A4FB4, &type metadata for KeyRetrieverError);
    atomic_store(result, (unint64_t *)&qword_254D770E0);
  }
  return result;
}

void sub_21449F45C(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_21449F4C0
     + dword_21449F6F4[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_21449F4D0()
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
  sub_21449E1A4(v1, v0);
  sub_2144A28F4(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_21449E2B0(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

uint64_t sub_21449F704(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D77130);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2144A312C((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_2144A4A38();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_2144A2DE0(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_2144A49B4();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_2144A2E44(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_2144A2604();
    __asm { BR              X12 }
  }
  sub_2144A31C8(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_2144A48A0();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t sub_21449FC00()
{
  sub_2144A4AD4();
  sub_2144A49A8();
  swift_bridgeObjectRelease();
  return sub_2144A4AEC();
}

uint64_t sub_21449FCA8()
{
  sub_2144A49A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21449FD2C()
{
  sub_2144A4AD4();
  sub_2144A49A8();
  swift_bridgeObjectRelease();
  return sub_2144A4AEC();
}

uint64_t sub_21449FDD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2144A2EE0();
  *a1 = result;
  return result;
}

void sub_21449FDFC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE800000000000000;
  v4 = 0xEA00000000004449;
  v5 = 0x79726F6765746163;
  if (v2 != 1)
  {
    v5 = 0x69616D6F44626577;
    v4 = 0xE90000000000006ELL;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x4449656C646E7562;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21449FE64()
{
  sub_2144A4274();
  return sub_2144A4A08();
}

uint64_t sub_21449FEC0()
{
  sub_2144A4274();
  return sub_2144A49FC();
}

uint64_t sub_21449FF0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21449FF18(*a1, *a2);
}

uint64_t sub_21449FF18(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x79726F6765746163;
    else
      v3 = 0x69616D6F44626577;
    if (v2 == 1)
      v4 = 0xEA00000000004449;
    else
      v4 = 0xE90000000000006ELL;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x79726F6765746163;
      else
        v6 = 0x69616D6F44626577;
      if (v5 == 1)
        v7 = 0xEA00000000004449;
      else
        v7 = 0xE90000000000006ELL;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE800000000000000;
    v3 = 0x4449656C646E7562;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE800000000000000;
  if (v3 != 0x4449656C646E7562)
  {
LABEL_21:
    v8 = sub_2144A4A98();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_2144A0040(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2144A0050()
{
  return sub_2144A4AE0();
}

uint64_t sub_2144A0074(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (sub_2144A4A98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x697461746F6E6E61 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2144A4A98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2144A0160()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

uint64_t sub_2144A01A4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x697461746F6E6E61;
  else
    return 1835365481;
}

BOOL sub_2144A01E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2144A0040(*a1, *a2);
}

uint64_t sub_2144A01F8()
{
  return sub_2144A0160();
}

uint64_t sub_2144A020C()
{
  return sub_2144A0050();
}

uint64_t sub_2144A0220()
{
  sub_2144A4AD4();
  sub_2144A0050();
  return sub_2144A4AEC();
}

uint64_t sub_2144A0268()
{
  char *v0;

  return sub_2144A01A4(*v0);
}

uint64_t sub_2144A027C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2144A0074(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2144A02AC()
{
  return 0;
}

uint64_t sub_2144A02B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2144A2F28();
  *a1 = result;
  return result;
}

uint64_t sub_2144A02E8(uint64_t a1)
{
  MEMORY[0x2199CECD4](&unk_2144A56C4, a1);
  return sub_2144A4B10();
}

uint64_t sub_2144A031C(uint64_t a1)
{
  MEMORY[0x2199CECD4](&unk_2144A56C4, a1);
  return sub_2144A4B1C();
}

uint64_t sub_2144A0350(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[4];
  char v15;
  char v16;
  char v17;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v14[0] = *(_QWORD *)(a2 + 32);
  v14[1] = v4;
  v6 = type metadata accessor for Annotated.CodingKeys(255, v4, v5, v14[0]);
  MEMORY[0x2199CECD4](&unk_2144A56C4, v6);
  v7 = sub_2144A4A8C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v14 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = v14[2];
  sub_2144A4B04();
  v17 = 0;
  v12 = v14[3];
  sub_2144A4A80();
  if (!v12)
  {
    v16 = *(_BYTE *)(v11 + *(int *)(a2 + 44));
    v15 = 1;
    sub_2144A3F20();
    sub_2144A4A80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2144A04B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;

  v28 = a5;
  v30 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v36 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Annotated.CodingKeys(255, v10, v11, v12);
  MEMORY[0x2199CECD4](&unk_2144A56C4, v13);
  v35 = sub_2144A4A68();
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v28 - v14;
  v34 = a2;
  v31 = a3;
  v29 = type metadata accessor for Annotated(0, a2, a3, a4);
  v16 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v28 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v32 = v15;
  v19 = v37;
  sub_2144A4AF8();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = v16;
  v21 = v29;
  v22 = v30;
  v23 = v18;
  v40 = 0;
  v24 = v35;
  v25 = v34;
  v26 = v32;
  sub_2144A4A5C();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v23, v36, v25);
  v38 = 1;
  sub_2144A3EDC();
  sub_2144A4A5C();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v24);
  v23[*(int *)(v21 + 44)] = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28, v23, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v23, v21);
}

uint64_t sub_2144A0750@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2144A04B4(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_2144A0770(_QWORD *a1, uint64_t a2)
{
  return sub_2144A0350(a1, a2);
}

uint64_t sub_2144A0784()
{
  uint64_t v0;

  sub_2144A4840();
  sub_2144A30EC(&qword_254D77120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB410], MEMORY[0x24BDCB3C8]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D77100);
  sub_2144A31FC(&qword_254D77128, &qword_254D77100, (uint64_t)&unk_2144A5318);
  sub_2144A490C();
  if (!v0)
    __asm { BR              X10 }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2144A0950(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (sub_2144A4A98() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2144A4A98();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2144A0A30(char a1)
{
  if ((a1 & 1) != 0)
    return 0x676E6964646170;
  else
    return 1835365481;
}

void sub_2144A0A60()
{
  type metadata accessor for Padded.CodingKeys();
}

uint64_t sub_2144A0AB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x2199CECD4](&unk_2144A5714, a1);
  v3 = sub_2144A4A8C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_2144A4B04();
  *(_BYTE *)(v2 - 128) = 0;
  v7 = *(_QWORD *)(v2 - 72);
  sub_2144A4A80();
  if (!v7)
  {
    *(_BYTE *)(v2 - 128) = 1;
    sub_2144A4A74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_2144A0BD4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[14];

  v9[0] = a3;
  v9[2] = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9[5] = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[9] = v4;
  v9[10] = v5;
  v9[11] = v6;
  v9[12] = v7;
  v9[13] = v8;
  type metadata accessor for Padded.CodingKeys();
}

void sub_2144A0C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 - 128) = MEMORY[0x2199CECD4](&unk_2144A5714, a1);
  v7 = sub_2144A4A68();
  *(_QWORD *)(v6 - 144) = v7;
  *(_QWORD *)(v6 - 184) = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v6 - 168) = v2;
  *(_QWORD *)(v6 - 160) = v3;
  *(_QWORD *)(v6 - 120) = v3;
  *(_QWORD *)(v6 - 112) = v5;
  *(_QWORD *)(v6 - 104) = v2;
  *(_QWORD *)(v6 - 96) = v4;
  *(_QWORD *)(v6 - 88) = v1;
  type metadata accessor for Padded();
}

uint64_t sub_2144A0CD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;

  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v18 - v6;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  *(_QWORD *)(v3 - 136) = v1;
  v8 = *(_QWORD *)(v3 - 72);
  sub_2144A4AF8();
  if (v8)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  *(_QWORD *)(v3 - 72) = v5;
  v9 = *(_QWORD *)(v3 - 184);
  v10 = *(_QWORD *)(v3 - 176);
  *(_BYTE *)(v3 - 120) = 0;
  v11 = *(_QWORD *)(v3 - 160);
  sub_2144A4A5C();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 32))(v7, *(_QWORD *)(v3 - 152), v11);
  *(_BYTE *)(v3 - 120) = 1;
  v12 = sub_2144A4A50();
  v14 = v13;
  (*(void (**)(_QWORD, _QWORD))(v9 + 8))(*(_QWORD *)(v3 - 136), *(_QWORD *)(v3 - 144));
  v15 = (uint64_t *)&v7[*(int *)(a1 + 60)];
  *v15 = v12;
  v15[1] = v14;
  v16 = *(_QWORD *)(v3 - 72);
  (*(void (**)(_QWORD, char *, uint64_t))(v16 + 16))(*(_QWORD *)(v3 - 192), v7, a1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v7, a1);
}

BOOL sub_2144A0E64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2144A0040(*a1, *a2);
}

uint64_t sub_2144A0E80()
{
  return sub_2144A0160();
}

uint64_t sub_2144A0E98()
{
  return sub_2144A0050();
}

uint64_t sub_2144A0EB0()
{
  sub_2144A4AD4();
  sub_2144A0050();
  return sub_2144A4AEC();
}

uint64_t sub_2144A0EFC()
{
  char *v0;

  return sub_2144A0A30(*v0);
}

uint64_t sub_2144A0F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2144A0950(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2144A0F48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2144A2F28();
  *a1 = result;
  return result;
}

uint64_t sub_2144A0F7C(uint64_t a1)
{
  MEMORY[0x2199CECD4](&unk_2144A5714, a1);
  return sub_2144A4B10();
}

uint64_t sub_2144A0FB0(uint64_t a1)
{
  MEMORY[0x2199CECD4](&unk_2144A5714, a1);
  return sub_2144A4B1C();
}

void sub_2144A0FE4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2144A0BD4(a1, *(_QWORD *)(a2 + 16), a3);
}

void sub_2144A1008()
{
  sub_2144A0A60();
}

_QWORD *TokenEncoder.__allocating_init(teamIdentifier:keyRetriever:)(uint64_t a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2144A4810();
  MEMORY[0x24BDAC7A8](v6);
  v7 = (_QWORD *)swift_allocObject();
  sub_2144A4840();
  swift_allocObject();
  v8 = sub_2144A4834();
  sub_2144A4804();
  sub_2144A481C();
  v7[2] = v8;
  v7[3] = sub_21449F704(a1, a2);
  v7[4] = v9;
  sub_2144A31C8(a3, (uint64_t)(v7 + 5));
  return v7;
}

_QWORD *TokenEncoder.init(teamIdentifier:keyRetriever:)(uint64_t a1, unint64_t a2, __int128 *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = v3;
  v8 = sub_2144A4810();
  MEMORY[0x24BDAC7A8](v8);
  sub_2144A4840();
  swift_allocObject();
  v9 = sub_2144A4834();
  sub_2144A4804();
  sub_2144A481C();
  v4[2] = v9;
  v4[3] = sub_21449F704(a1, a2);
  v4[4] = v10;
  sub_2144A31C8(a3, (uint64_t)(v4 + 5));
  return v4;
}

uint64_t sub_2144A11B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = v0[8];
  v3 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    v6 = result;
    v7 = v5;
    sub_2144A13F4();
    return sub_21449E2B0(v6, v7);
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

uint64_t sub_2144A128C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = v0[8];
  v3 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    v6 = result;
    v7 = v5;
    sub_2144A13F4();
    return sub_21449E2B0(v6, v7);
  }
  return result;
}

uint64_t sub_2144A1340()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = v0[8];
  v3 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    v6 = result;
    v7 = v5;
    sub_2144A13F4();
    return sub_21449E2B0(v6, v7);
  }
  return result;
}

uint64_t sub_2144A13F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v1 = sub_2144A0784();
  if (!v0)
  {
    v3 = v1;
    swift_bridgeObjectRetain();
    MEMORY[0x2199CEA10](77, 0xE100000000000000, v3);
    swift_bridgeObjectRelease_n();
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D77100);
    sub_2144A31FC(&qword_254D77128, &qword_254D77100, (uint64_t)&unk_2144A5318);
    sub_2144A4828();
    v5 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __asm { BR              X10 }
  }
  swift_bridgeObjectRelease_n();
  return swift_release_n();
}

uint64_t TokenEncoder.deinit()
{
  uint64_t v0;

  swift_release();
  sub_21449E2B0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
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

uint64_t TokenEncoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  sub_21449E2B0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return swift_deallocClassInstance();
}

_QWORD *TokenDecoder.__allocating_init(teamIdentifier:keyRetriever:)(uint64_t a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2144A4810();
  MEMORY[0x24BDAC7A8](v6);
  v7 = (_QWORD *)swift_allocObject();
  sub_2144A47F8();
  swift_allocObject();
  v7[2] = sub_2144A47EC();
  sub_2144A4840();
  swift_allocObject();
  v8 = sub_2144A4834();
  sub_2144A4804();
  sub_2144A481C();
  v7[3] = v8;
  v7[4] = sub_21449F704(a1, a2);
  v7[5] = v9;
  sub_2144A31C8(a3, (uint64_t)(v7 + 6));
  return v7;
}

_QWORD *TokenDecoder.init(teamIdentifier:keyRetriever:)(uint64_t a1, unint64_t a2, __int128 *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = v3;
  v8 = sub_2144A4810();
  MEMORY[0x24BDAC7A8](v8);
  sub_2144A47F8();
  swift_allocObject();
  v3[2] = sub_2144A47EC();
  sub_2144A4840();
  swift_allocObject();
  v9 = sub_2144A4834();
  sub_2144A4804();
  sub_2144A481C();
  v4[3] = v9;
  v4[4] = sub_21449F704(a1, a2);
  v4[5] = v10;
  sub_2144A31C8(a3, (uint64_t)(v4 + 6));
  return v4;
}

unint64_t sub_2144A1910(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = v1[9];
  v5 = v1[10];
  v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    v6 = sub_2144A1AFC(a1, v7, 0);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_2144A19B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = v1[9];
  v5 = v1[10];
  v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    v6 = sub_2144A1AFC(a1, v7, 1);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_2144A1A58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = v1[9];
  v5 = v1[10];
  v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    v6 = sub_2144A1AFC(a1, v7, 2);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_2144A1AFC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  _QWORD *v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;

  v34 = a3;
  v45 = a1;
  v5 = sub_2144A4984();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2144A4930();
  v42 = *(_QWORD *)(v7 - 8);
  v43 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a2 + 56);
  v37 = (_QWORD *)(a2 + 56);
  v10 = 1 << *(_BYTE *)(a2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v35 = *MEMORY[0x24BDC61A0];
  v46 = a2;
  swift_bridgeObjectRetain();
  v36 = 0;
  v55 = 0xF000000000000000;
  v44 = v3;
  v47 = 0;
  if (v12)
  {
    v13 = __clz(__rbit64(v12));
    goto LABEL_15;
  }
  v14 = 1;
  if (v38 > 1)
  {
    v15 = v37[1];
    if (v15)
    {
LABEL_14:
      v13 = __clz(__rbit64(v15)) + (v14 << 6);
LABEL_15:
      __asm { BR              X9 }
    }
    v16 = 2;
    if (v38 > 2)
    {
      v15 = v37[2];
      if (v15)
        goto LABEL_13;
      v16 = 3;
      if (v38 <= 3)
        goto LABEL_20;
      v15 = v37[3];
      if (v15)
      {
LABEL_13:
        v14 = v16;
        goto LABEL_14;
      }
      v16 = 4;
      if (v38 > 4)
      {
        v15 = v37[4];
        if (v15)
          goto LABEL_13;
        while (1)
        {
          v14 = v16 + 1;
          if (__OFADD__(v16, 1))
          {
            __break(1u);
            JUMPOUT(0x2144A2398);
          }
          if (v14 >= v38)
            break;
          v15 = v37[v14];
          ++v16;
          if (v15)
            goto LABEL_14;
        }
      }
    }
  }
LABEL_20:
  swift_release();
  if (v55 >> 60 == 15)
  {
    if (!v36)
    {
      sub_2144A2538();
      swift_allocError();
    }
    swift_willThrow();
  }
  else
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D77100);
    sub_21449E1A4(0, v55);
    sub_2144A31FC(&qword_254D77108, &qword_254D77100, (uint64_t)&unk_2144A53C0);
    v17 = v48;
    sub_2144A47E0();
    if (v17)
    {
      MEMORY[0x2199CEC98](v36);
      v18 = v55;
      sub_21449E998(0, v55);
      sub_21449E998(0, v18);
    }
    else
    {
      v20 = v50;
      v19 = v51;
      v21 = v52;
      v22 = v53;
      v12 = v54;
      swift_retain_n();
      swift_bridgeObjectRetain();
      v26 = sub_2144A0784();
      swift_bridgeObjectRetain();
      v27 = MEMORY[0x2199CEA10](77, 0xE100000000000000, v26);
      v29 = v28;
      swift_bridgeObjectRelease();
      swift_release();
      if (v22 == v27 && v12 == v29)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v30 = sub_2144A4A98();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
        {
          sub_2144A25C0();
          swift_allocError();
          swift_willThrow();
          v23 = v47;
          v24 = v55;
          sub_21449E998(v47, v55);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          MEMORY[0x2199CEC98](v36);
          sub_21449E998(v23, v24);
          swift_release();
          return v12;
        }
        swift_release();
      }
      v31 = v55;
      v32 = v47;
      swift_bridgeObjectRelease();
      v12 = sub_2144A2F30(v20, v19, v21, v34);
      swift_bridgeObjectRetain();
      MEMORY[0x2199CEC98](v36);
      sub_21449E998(v32, v31);
      sub_21449E998(v32, v31);
      swift_bridgeObjectRelease();
    }
  }
  return v12;
}

uint64_t TokenDecoder.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_21449E2B0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return v0;
}

uint64_t TokenDecoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_21449E2B0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TokenEncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for TokenEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TokenEncoder.__allocating_init(teamIdentifier:keyRetriever:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TokenEncoder.encode(bundleIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of TokenEncoder.encode(categoryIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of TokenEncoder.encode(webDomain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t type metadata accessor for TokenDecoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for TokenDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TokenDecoder.__allocating_init(teamIdentifier:keyRetriever:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TokenDecoder.decode(bundleIdentifierToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of TokenDecoder.decode(categoryIdentifierToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TokenDecoder.decode(webDomainToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

unint64_t sub_2144A2538()
{
  unint64_t result;

  result = qword_254D770F8;
  if (!qword_254D770F8)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A53E8, &type metadata for DecoderError);
    atomic_store(result, (unint64_t *)&qword_254D770F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199CECC8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2144A25C0()
{
  unint64_t result;

  result = qword_254D77110;
  if (!qword_254D77110)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A5380, &type metadata for PaddingError);
    atomic_store(result, (unint64_t *)&qword_254D77110);
  }
  return result;
}

void sub_2144A2604()
{
  __asm { BR              X11 }
}

_QWORD *sub_2144A2664@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_2144A28F4@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_2144A2B78(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_2144A2C38((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_2144A2CB0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_2144A2968(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_2144A29CC(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_2144A4864();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_2144A4888();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_2144A487C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_2144A2A78(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_2144A49E4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2199CE9EC](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_2144A2AF0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_2144A4A2C();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2144A2B78(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_2144A2C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2144A4894();
  swift_allocObject();
  result = sub_2144A4858();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2144A48B8();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2144A2CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2144A4894();
  swift_allocObject();
  result = sub_2144A4858();
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

uint64_t sub_2144A2D30(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D77140);
  v10 = sub_2144A31FC(qword_254D77148, &qword_254D77140, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_2144A28F4(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

_BYTE *sub_2144A2DE0(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_2144A2B78(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_2144A2C38((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_2144A2CB0((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_2144A2E44(uint64_t result)
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
      sub_2144A4894();
      swift_allocObject();
      sub_2144A4870();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2144A48B8();
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

uint64_t sub_2144A2EE0()
{
  unint64_t v0;

  v0 = sub_2144A4A44();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2144A2F28()
{
  return 2;
}

uint64_t sub_2144A2F30(uint64_t a1, uint64_t a2, char a3, unsigned __int8 a4)
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  char v10;

  if (!a3)
  {
    v6 = 0xE800000000000000;
    v5 = 0x4449656C646E7562;
    v7 = a4;
    if (a4)
      goto LABEL_9;
LABEL_18:
    v9 = 0xE800000000000000;
    if (v5 != 0x4449656C646E7562)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (a3 == 1)
    v5 = 0x79726F6765746163;
  else
    v5 = 0x69616D6F44626577;
  if (a3 == 1)
    v6 = 0xEA00000000004449;
  else
    v6 = 0xE90000000000006ELL;
  v7 = a4;
  if (!a4)
    goto LABEL_18;
LABEL_9:
  if (v7 == 1)
    v8 = 0x79726F6765746163;
  else
    v8 = 0x69616D6F44626577;
  if (v7 == 1)
    v9 = 0xEA00000000004449;
  else
    v9 = 0xE90000000000006ELL;
  if (v5 != v8)
    goto LABEL_21;
LABEL_19:
  if (v6 == v9)
  {
    swift_bridgeObjectRelease_n();
    return a1;
  }
LABEL_21:
  v10 = sub_2144A4A98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    sub_2144A30A8();
    swift_allocError();
    swift_willThrow();
  }
  return a1;
}

unint64_t sub_2144A30A8()
{
  unint64_t result;

  result = qword_254D77118;
  if (!qword_254D77118)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A5340, &type metadata for AnnotationError);
    atomic_store(result, (unint64_t *)&qword_254D77118);
  }
  return result;
}

uint64_t sub_2144A30EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199CECD4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2144A312C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D77138);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_2144A316C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_2144A2968((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2144A31E0, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2144A31C8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2144A31E0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2144A2AF0(a1, a2);
}

uint64_t sub_2144A31FC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199CECD4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnotationError()
{
  return &type metadata for AnnotationError;
}

ValueMetadata *type metadata accessor for PaddingError()
{
  return &type metadata for PaddingError;
}

uint64_t sub_2144A3264()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2144A326C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_2144A32E0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(_QWORD *, _QWORD *))(v5 + 16))(a1, a2);
    *((_BYTE *)v4 + v6) = *((_BYTE *)a2 + v6);
  }
  else
  {
    v10 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v4;
}

uint64_t sub_2144A336C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_2144A337C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_2144A33C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_2144A340C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_2144A3454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_2144A349C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xFD)
    v6 = 253;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = v7 + 1;
  v10 = 8 * (v7 + 1);
  if ((v7 + 1) <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if (v5 >= 0xFD)
        return (*(uint64_t (**)(void))(v4 + 48))();
      v15 = *(unsigned __int8 *)(v7 + a1);
      if (v15 >= 3)
        return v15 - 2;
      else
        return 0;
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if ((_DWORD)v7 == -1)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2144A3564 + 4 * byte_2144A5030[(v9 - 1)]))();
}

void sub_2144A35C4(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFDu)
    v6 = 253;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = v7 + 1;
  if (a3 > v6)
  {
    if (v8 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v7 != -1)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v7 + 1);
        if (v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if (v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7 + 1);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t type metadata accessor for Annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Annotated);
}

uint64_t sub_2144A37A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2144A37AC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2144A3820(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_2144A38DC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2144A391C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2144A3984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2144A39F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2144A3A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2144A3AC0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_2144A3B3C + 4 * byte_2144A503E[v10]))();
  }
}

void sub_2144A3BC0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_2144A3CB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x2144A3D2CLL);
}

void sub_2144A3CBC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x2144A3CC4);
  JUMPOUT(0x2144A3D2CLL);
}

void sub_2144A3D08()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x2144A3D2CLL);
}

void sub_2144A3D10()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x2144A3D2CLL);
}

uint64_t sub_2144A3D18(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x2144A3D24);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x2144A3D2CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

void type metadata accessor for Padded()
{
  JUMPOUT(0x2199CECB0);
}

uint64_t _s22ManagedSettingsSupport15AnnotationErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2144A3D90 + 4 * byte_2144A504D[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2144A3DB0 + 4 * byte_2144A5052[v4]))();
}

_BYTE *sub_2144A3D90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2144A3DB0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2144A3DB8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2144A3DC0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2144A3DC8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2144A3DD0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DecoderError()
{
  return &type metadata for DecoderError;
}

unint64_t sub_2144A3DF0()
{
  unint64_t result;

  result = qword_254D77250;
  if (!qword_254D77250)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A51D0, &type metadata for DecoderError);
    atomic_store(result, (unint64_t *)&qword_254D77250);
  }
  return result;
}

unint64_t sub_2144A3E38()
{
  unint64_t result;

  result = qword_254D77258;
  if (!qword_254D77258)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A5288, &type metadata for PaddingError);
    atomic_store(result, (unint64_t *)&qword_254D77258);
  }
  return result;
}

unint64_t sub_2144A3E80()
{
  unint64_t result;

  result = qword_254D77260;
  if (!qword_254D77260)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A52F0, &type metadata for AnnotationError);
    atomic_store(result, (unint64_t *)&qword_254D77260);
  }
  return result;
}

void type metadata accessor for Padded.CodingKeys()
{
  JUMPOUT(0x2199CECB0);
}

uint64_t type metadata accessor for Annotated.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Annotated.CodingKeys);
}

unint64_t sub_2144A3EDC()
{
  unint64_t result;

  result = qword_254D77268;
  if (!qword_254D77268)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A569C, &type metadata for Annotation);
    atomic_store(result, (unint64_t *)&qword_254D77268);
  }
  return result;
}

unint64_t sub_2144A3F20()
{
  unint64_t result;

  result = qword_254D77270[0];
  if (!qword_254D77270[0])
  {
    result = MEMORY[0x2199CECD4](&unk_2144A5674, &type metadata for Annotation);
    atomic_store(result, qword_254D77270);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199CECB0](a1, v6, a5);
}

uint64_t sub_2144A3F90()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2144A3FA0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2144A3FA8(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_2144A4038(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2144A4084 + 4 * byte_2144A505C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2144A40B8 + 4 * byte_2144A5057[v4]))();
}

uint64_t sub_2144A40B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A40C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2144A40C8);
  return result;
}

uint64_t sub_2144A40D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2144A40DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2144A40E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A40E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2144A40F4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t storeEnumTagSinglePayload for Annotation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2144A414C + 4 * byte_2144A5066[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2144A4180 + 4 * byte_2144A5061[v4]))();
}

uint64_t sub_2144A4180(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A4188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2144A4190);
  return result;
}

uint64_t sub_2144A419C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2144A41A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2144A41A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A41B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Annotation()
{
  return &type metadata for Annotation;
}

unint64_t sub_2144A41D0()
{
  unint64_t result;

  result = qword_254D77378;
  if (!qword_254D77378)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A5464, &type metadata for Annotation);
    atomic_store(result, (unint64_t *)&qword_254D77378);
  }
  return result;
}

void sub_2144A4214()
{
  JUMPOUT(0x2199CECD4);
}

void sub_2144A4224()
{
  JUMPOUT(0x2199CECD4);
}

void sub_2144A4234()
{
  JUMPOUT(0x2199CECD4);
}

void sub_2144A4244()
{
  JUMPOUT(0x2199CECD4);
}

void sub_2144A4254()
{
  JUMPOUT(0x2199CECD4);
}

void sub_2144A4264()
{
  JUMPOUT(0x2199CECD4);
}

unint64_t sub_2144A4274()
{
  unint64_t result;

  result = qword_254D77380;
  if (!qword_254D77380)
  {
    result = MEMORY[0x2199CECD4](&unk_2144A548C, &type metadata for Annotation);
    atomic_store(result, (unint64_t *)&qword_254D77380);
  }
  return result;
}

BOOL static TeamIdentifierRetrieverError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TeamIdentifierRetrieverError.hash(into:)()
{
  return sub_2144A4AE0();
}

uint64_t TeamIdentifierRetrieverError.hashValue.getter()
{
  sub_2144A4AD4();
  sub_2144A4AE0();
  return sub_2144A4AEC();
}

uint64_t static TeamIdentifierRetriever.internalTeamIdentifier.getter()
{
  return 0x656C707041;
}

uint64_t static TeamIdentifierRetriever.simulatorTeamIdentifier.getter()
{
  return 0x6F74616C756D6953;
}

uint64_t static TeamIdentifierRetriever.teamIdentifierFromCurrentConnection()()
{
  id v0;
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentConnection);
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, sel_auditToken);
    v5 = v8;
    v6 = v7;

    v3 = v5;
    v2 = v6;
  }
  else
  {
    v2 = 0uLL;
    v3 = 0uLL;
  }
  v7 = v2;
  v8 = v3;
  v9 = v1 == 0;
  return sub_2144A44D4((uint64_t)&v7);
}

uint64_t static TeamIdentifierRetriever.teamIdentifier(from:)(uint64_t a1)
{
  return sub_2144A44D4(a1);
}

uint64_t sub_2144A4424()
{
  id v0;
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentConnection);
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, sel_auditToken);
    v5 = v8;
    v6 = v7;

    v3 = v5;
    v2 = v6;
  }
  else
  {
    v2 = 0uLL;
    v3 = 0uLL;
  }
  v7 = v2;
  v8 = v3;
  v9 = v1 == 0;
  return sub_2144A44D4((uint64_t)&v7);
}

uint64_t sub_2144A44C0(uint64_t a1)
{
  return sub_2144A44D4(a1);
}

uint64_t sub_2144A44D4(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  const __CFAllocator *v3;
  SecTaskRef v4;
  SecTaskRef v5;
  _BYTE *v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  audit_token_t v11;
  audit_token_t v12;
  char v13;

  sub_2144A4754(a1, (uint64_t)&v12);
  if ((v13 & 1) != 0)
  {
    sub_2144A479C();
    swift_allocError();
    *v2 = 1;
LABEL_7:
    swift_willThrow();
    return v1;
  }
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v11 = v12;
  v4 = SecTaskCreateWithAuditToken(v3, &v11);
  if (!v4)
  {
    sub_2144A479C();
    swift_allocError();
    *v6 = 0;
    goto LABEL_7;
  }
  v5 = v4;
  v1 = 0x656C707041;
  if ((sub_21449D890() & 1) == 0)
  {
    v8 = sub_21449D904(0x656C707041);
    if (v9)
    {
      v1 = v8;
    }
    else
    {
      sub_2144A479C();
      swift_allocError();
      *v10 = 2;
      swift_willThrow();
    }
  }

  return v1;
}

unint64_t sub_2144A4634()
{
  unint64_t result;

  result = qword_254D77388;
  if (!qword_254D77388)
  {
    result = MEMORY[0x2199CECD4](&protocol conformance descriptor for TeamIdentifierRetrieverError, &type metadata for TeamIdentifierRetrieverError);
    atomic_store(result, (unint64_t *)&qword_254D77388);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TeamIdentifierRetrieverError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2144A46C4 + 4 * byte_2144A5775[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2144A46F8 + 4 * byte_2144A5770[v4]))();
}

uint64_t sub_2144A46F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A4700(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2144A4708);
  return result;
}

uint64_t sub_2144A4714(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2144A471CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2144A4720(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144A4728(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TeamIdentifierRetrieverError()
{
  return &type metadata for TeamIdentifierRetrieverError;
}

ValueMetadata *type metadata accessor for TeamIdentifierRetriever()
{
  return &type metadata for TeamIdentifierRetriever;
}

uint64_t sub_2144A4754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F9B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2144A479C()
{
  unint64_t result;

  result = qword_254D77390;
  if (!qword_254D77390)
  {
    result = MEMORY[0x2199CECD4](&protocol conformance descriptor for TeamIdentifierRetrieverError, &type metadata for TeamIdentifierRetrieverError);
    atomic_store(result, (unint64_t *)&qword_254D77390);
  }
  return result;
}

uint64_t sub_2144A47E0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2144A47EC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2144A47F8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2144A4804()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_2144A4810()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_2144A481C()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_2144A4828()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2144A4834()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2144A4840()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2144A484C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2144A4858()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2144A4864()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2144A4870()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2144A487C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2144A4888()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2144A4894()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2144A48A0()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_2144A48AC()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2144A48B8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2144A48C4()
{
  return MEMORY[0x24BDDAE38]();
}

uint64_t sub_2144A48D0()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2144A48DC()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2144A48E8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2144A48F4()
{
  return MEMORY[0x24BDDAEB0]();
}

uint64_t sub_2144A4900()
{
  return MEMORY[0x24BDDAEB8]();
}

uint64_t sub_2144A490C()
{
  return MEMORY[0x24BDB9C08]();
}

uint64_t sub_2144A4918()
{
  return MEMORY[0x24BDC61A8]();
}

uint64_t sub_2144A4924()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_2144A4930()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_2144A493C()
{
  return MEMORY[0x24BDC6590]();
}

uint64_t sub_2144A4948()
{
  return MEMORY[0x24BDC6598]();
}

uint64_t sub_2144A4954()
{
  return MEMORY[0x24BDC65B8]();
}

uint64_t sub_2144A4960()
{
  return MEMORY[0x24BDC65D0]();
}

uint64_t sub_2144A496C()
{
  return MEMORY[0x24BDC6620]();
}

uint64_t sub_2144A4978()
{
  return MEMORY[0x24BDC6628]();
}

uint64_t sub_2144A4984()
{
  return MEMORY[0x24BDC6638]();
}

uint64_t sub_2144A4990()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2144A499C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2144A49A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2144A49B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2144A49C0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2144A49CC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2144A49D8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2144A49E4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2144A49F0()
{
  return MEMORY[0x24BEE0CF0]();
}

uint64_t sub_2144A49FC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2144A4A08()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2144A4A14()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2144A4A20()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2144A4A2C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2144A4A38()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2144A4A44()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2144A4A50()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2144A4A5C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2144A4A68()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_2144A4A74()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2144A4A80()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2144A4A8C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_2144A4A98()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2144A4AA4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2144A4AB0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2144A4ABC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2144A4AC8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2144A4AD4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2144A4AE0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2144A4AEC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2144A4AF8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2144A4B04()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2144A4B10()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2144A4B1C()
{
  return MEMORY[0x24BEE4A10]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x24BDE8D40]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

