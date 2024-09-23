MorphunSwift::TokenType_optional __swiftcall TokenType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (MorphunSwift::TokenType_optional)rawValue;
}

BOOL sub_21397C568(char *a1, char *a2)
{
  return sub_21398015C(*a1, *a2);
}

uint64_t sub_21397C574()
{
  unsigned __int8 *v0;

  return sub_21398016C(*v0);
}

uint64_t sub_21397C57C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_2139816CC(a1, *v1);
}

uint64_t sub_21397C584(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_2139801C8(a1, *v1);
}

MorphunSwift::TokenType_optional sub_21397C58C(Swift::Int *a1)
{
  return TokenType.init(rawValue:)(*a1);
}

MorphunSwift::TokenizationType_optional __swiftcall TokenizationType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (MorphunSwift::TokenizationType_optional)rawValue;
}

uint64_t TokenizationType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_21397C5B0()
{
  return sub_2139801A4();
}

MorphunSwift::TokenizationType_optional sub_21397C5B8(Swift::Int *a1)
{
  return TokenizationType.init(rawValue:)(*a1);
}

uint64_t sub_21397C5C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = TokenizationType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21397C5E4()
{
  uint64_t v0;

  v0 = mtokc_compare();
  swift_release();
  swift_release();
  return v0;
}

void sub_21397C70C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_9();
  v5 = OUTLINED_FUNCTION_22(v4);
  v6(v5);
  OUTLINED_FUNCTION_27();
  if (v0)
  {
    if ((id)OUTLINED_FUNCTION_14())
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_8();
      v7 = OUTLINED_FUNCTION_2();
      *v8 = v2;
      v8[1] = v3;
      OUTLINED_FUNCTION_3(v7, (uint64_t)v8);
      OUTLINED_FUNCTION_4();

    }
    else
    {
      OUTLINED_FUNCTION_4();

    }
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
}

void sub_21397C7C8()
{
  uint64_t (*v0)(void);
  uint64_t v1;

  OUTLINED_FUNCTION_9();
  if (!v0())
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v1, (uint64_t)"Call returned nullptr but no error was set.");
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
}

void sub_21397C8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  OUTLINED_FUNCTION_9();
  v13 = OUTLINED_FUNCTION_22(v12);
  v15 = v14(v13);
  if (a9)
  {
    if ((id)OUTLINED_FUNCTION_14())
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_8();
      v16 = OUTLINED_FUNCTION_2();
      *v17 = v10;
      v17[1] = v11;
      OUTLINED_FUNCTION_3(v16, (uint64_t)v17);
      OUTLINED_FUNCTION_10();

      goto LABEL_8;
    }

  }
  if (!v15)
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v18, (uint64_t)"Call returned nullptr but no error was set.");
  }
  OUTLINED_FUNCTION_10();
LABEL_8:
  OUTLINED_FUNCTION_5();
}

void sub_21397C990(uint64_t a1, uint64_t a2)
{
  sub_21397CFB8(a1, a2);
  OUTLINED_FUNCTION_28();
}

uint64_t sub_21397C9D4()
{
  uint64_t Type;

  Type = mtok_getType();
  swift_release();
  return Type;
}

void sub_21397CAE0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_9();
  v4();
  OUTLINED_FUNCTION_27();
  if (v0)
  {
    if ((id)OUTLINED_FUNCTION_14())
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_8();
      v5 = OUTLINED_FUNCTION_2();
      *v6 = v2;
      v6[1] = v3;
      OUTLINED_FUNCTION_3(v5, (uint64_t)v6);
      OUTLINED_FUNCTION_4();

    }
    else
    {
      OUTLINED_FUNCTION_4();

    }
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
}

void sub_21397CB9C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_9();
  mlogc_registerLogger();
  OUTLINED_FUNCTION_27();
  if (v0)
  {
    if ((id)OUTLINED_FUNCTION_14())
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_8();
      v4 = OUTLINED_FUNCTION_2();
      *v5 = v2;
      v5[1] = v3;
      OUTLINED_FUNCTION_3(v4, (uint64_t)v5);
      OUTLINED_FUNCTION_4();

    }
    else
    {
      OUTLINED_FUNCTION_4();

    }
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
}

void sub_21397CC64()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_22(v4);
  mlogc_unregisterLogger();
  OUTLINED_FUNCTION_27();
  if (v0)
  {
    if ((id)OUTLINED_FUNCTION_14())
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_8();
      v5 = OUTLINED_FUNCTION_2();
      *v6 = v2;
      v6[1] = v3;
      OUTLINED_FUNCTION_3(v5, (uint64_t)v6);
      OUTLINED_FUNCTION_4();

    }
    else
    {
      OUTLINED_FUNCTION_4();

    }
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
}

void sub_21397CD1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21397CD68(a1, a2, a3, MEMORY[0x24BEDC958]);
  OUTLINED_FUNCTION_28();
}

void sub_21397CD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, CFErrorRef *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CFErrorRef v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  CFErrorRef err[2];

  err[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  err[0] = 0;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = (void *)sub_2139817A4();
  v9 = a4(v7, v8, err);

  v10 = err[0];
  if (err[0])
  {
    v11 = (id)CFErrorGetDomain(err[0]);
    if (v11)
    {
      v12 = (__CFString *)v11;
      sub_2139817B0();
      OUTLINED_FUNCTION_37();
      v13 = OUTLINED_FUNCTION_2();
      *v14 = v4;
      v14[1] = v5;
      OUTLINED_FUNCTION_3(v13, (uint64_t)v14);
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_4();

      goto LABEL_8;
    }

  }
  if (v9)
  {
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_26();
  }
  else
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v15, (uint64_t)"Call returned nullptr but no error was set.");
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_4();
  }
LABEL_8:
  OUTLINED_FUNCTION_16();
}

void sub_21397CE98()
{
  uint64_t v0;

  if (mca_createTokenChain())
  {
    OUTLINED_FUNCTION_4();
  }
  else
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v0, (uint64_t)"Call returned nullptr but no error was set.");
    swift_release();
  }
  swift_release();
  OUTLINED_FUNCTION_16();
}

void sub_21397CFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_33(a1, a2);
  if (!v3)
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v2, (uint64_t)"Call returned nullptr but no error was set.");
  }
}

void sub_21397D0AC()
{
  mtok_setStyle();
  swift_release();
}

void sub_21397D1B0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, uint64_t, CFErrorRef *))
{
  CFErrorRef v3;
  const __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  CFErrorRef err[2];

  err[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  err[0] = 0;
  a3(*(_QWORD *)(a1 + 16), a2, err);
  v3 = err[0];
  if (err[0])
  {
    v4 = (id)CFErrorGetDomain(err[0]);
    if (v4)
    {
      v5 = (__CFString *)v4;
      v6 = sub_2139817B0();
      v8 = v7;
      sub_21397ECC0();
      v9 = OUTLINED_FUNCTION_2();
      *v10 = v6;
      v10[1] = v8;
      OUTLINED_FUNCTION_3(v9, (uint64_t)v10);
      OUTLINED_FUNCTION_10();

    }
    else
    {
      OUTLINED_FUNCTION_10();

    }
  }
  else
  {
    OUTLINED_FUNCTION_10();
  }
}

void sub_21397D298(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;

  OUTLINED_FUNCTION_33(a1, a2);
  if ((v3 & 1) != 0)
  {
    sub_21397ECC0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1(v2, (uint64_t)"Call returned nullptr but no error was set.");
  }
}

void Token.value.getter()
{
  sub_21397D3A4();
}

void Token.cleanValue.getter()
{
  sub_21397D3A4();
}

void sub_21397D3A4()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *v0;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_24();
  sub_21397C7C8();
  if (v1)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    v3 = v2;
    sub_2139817B0();

    OUTLINED_FUNCTION_6();
  }
}

void Token.type.getter(_BYTE *a1@<X8>)
{
  Swift::Int v2;
  char v3;

  OUTLINED_FUNCTION_7();
  v2 = sub_21397C9D4();
  TokenType.init(rawValue:)(v2);
  if (v3 == 7)
  {
    __break(1u);
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    *a1 = v3;
    OUTLINED_FUNCTION_6();
  }
}

void Token.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_31();
  if (v1)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_29();

    OUTLINED_FUNCTION_6();
  }
}

uint64_t Token.debugDescription.getter()
{
  void *v0;
  uint64_t v1;
  Swift::Int v2;
  uint64_t result;
  char v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_31();
  if (!v1)
  {
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_29();

    sub_2139817BC();
    swift_bridgeObjectRelease();
    sub_2139817BC();
    OUTLINED_FUNCTION_20();
    v2 = sub_21397C9D4();
    TokenType.init(rawValue:)(v2);
    if (v4 != 7)
    {
      OUTLINED_FUNCTION_29();
      sub_2139818A0();
      return 0;
    }
    __break(1u);
  }
  result = OUTLINED_FUNCTION_0();
  __break(1u);
  return result;
}

uint64_t Token.range.getter()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t result;

  mtok_getStartChar();
  mtok_getEndChar();
  sub_21397D7AC();
  v0 = sub_213981810();
  v2 = v1;
  result = OUTLINED_FUNCTION_36();
  if ((v2 & 1) == 0)
    return v0;
  __break(1u);
  return result;
}

Swift::Bool __swiftcall Token.isSignificant()()
{
  Swift::Bool result;

  sub_21397D670();
  return result;
}

Swift::Bool __swiftcall Token.isWhitespace()()
{
  Swift::Bool result;

  sub_21397D670();
  return result;
}

void sub_21397D670()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_24();
  sub_21397CAE0();
  if (v1)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_6();
  }
}

void sub_21397D6C0(_DWORD *a1@<X8>)
{
  int v2;

  sub_21397D70C();
  *a1 = v2;
}

uint64_t sub_21397D6E8(unsigned int *a1)
{
  return sub_21397D76C(*a1);
}

void sub_21397D70C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (*(_BYTE *)(v0 + 44) == 1)
  {
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_23();
    if (v1)
    {
      OUTLINED_FUNCTION_0();
      __break(1u);
    }
    else
    {
      *(_DWORD *)(v0 + 40) = v2;
      *(_BYTE *)(v0 + 44) = 0;
    }
  }
}

uint64_t sub_21397D76C(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 40) = result;
  *(_BYTE *)(v1 + 44) = 0;
  return result;
}

void sub_21397D778(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_21397D7AC();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_21397D7A0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21397D870(a1, a2, a3, a4, sub_21397D830);
}

void sub_21397D7AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (!*(_QWORD *)(v1 + 56))
  {
    v2 = OUTLINED_FUNCTION_7();
    sub_21397C8AC(v2, MEMORY[0x24BEDCA60], v3, v4, v5, v6, v7, v8, v9);
    sub_2139817B0();
    OUTLINED_FUNCTION_30();
    *(_QWORD *)(v1 + 48) = v0;
    *(_QWORD *)(v1 + 56) = 0;
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_36();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6();
}

uint64_t sub_21397D830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return OUTLINED_FUNCTION_19();
}

void sub_21397D83C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_21397D8AC();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_21397D864(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21397D870(a1, a2, a3, a4, sub_21397D930);
}

uint64_t sub_21397D870(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  OUTLINED_FUNCTION_25();
  return a5(v7, v6);
}

void sub_21397D8AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (!*(_QWORD *)(v1 + 72))
  {
    v2 = OUTLINED_FUNCTION_7();
    sub_21397C8AC(v2, MEMORY[0x24BEDCA68], v3, v4, v5, v6, v7, v8, v9);
    sub_2139817B0();
    OUTLINED_FUNCTION_30();
    *(_QWORD *)(v1 + 64) = v0;
    *(_QWORD *)(v1 + 72) = 0;
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_36();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6();
}

uint64_t sub_21397D930(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return OUTLINED_FUNCTION_19();
}

uint64_t TokenChain.size.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 80);
}

uint64_t sub_21397D944(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 40) = 0;
  *(_BYTE *)(v1 + 44) = 1;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_QWORD *)(v1 + 16) = a1;
  *(_DWORD *)(v1 + 80) = mtokc_getSize();
  return v1;
}

void static TokenChain.== infix(_:_:)()
{
  swift_retain();
  swift_retain();
  sub_21397C5E4();
  OUTLINED_FUNCTION_6();
}

uint64_t sub_21397DAB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t Next;
  uint64_t v4;
  uint64_t result;

  if (*(_QWORD *)(v1 + 24))
  {
    OUTLINED_FUNCTION_15();
    Next = mtok_getNext();
  }
  else
  {
    OUTLINED_FUNCTION_15();
    Next = mtokc_getHead();
  }
  v4 = Next;
  swift_endAccess();
  *(_QWORD *)(v1 + 24) = v4;
  result = swift_beginAccess();
  if (*(_QWORD *)(v1 + 32) || !v4)
  {
    *a1 = 0;
    a1[1] = 0;
  }
  else
  {
    *a1 = v4;
    a1[1] = v1;
    return OUTLINED_FUNCTION_7();
  }
  return result;
}

uint64_t TokenChain.deinit()
{
  uint64_t v0;

  mtokc_destroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TokenChain.__deallocating_deinit()
{
  TokenChain.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21397DB9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21397DBC4();
  *a1 = result;
  return result;
}

uint64_t sub_21397DBC4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21397DBD0()
{
  return 2;
}

uint64_t sub_21397DBD8()
{
  return sub_21397DBF8();
}

uint64_t sub_21397DBF8()
{
  uint64_t v0;

  v0 = sub_21397EA70();
  swift_release();
  return v0;
}

uint64_t sub_21397DC28()
{
  return sub_21397DC48();
}

uint64_t sub_21397DC4C()
{
  type metadata accessor for TokenChain();
  return sub_2139817D4();
}

uint64_t sub_21397DCB0@<X0>(uint64_t *a1@<X8>)
{
  return sub_21397DAB4(a1);
}

void sub_21397DCD0()
{
  sub_21397D7AC();
}

void sub_21397DCF0()
{
  sub_21397D8AC();
}

uint64_t sub_21397DD10()
{
  char v0;

  static TokenChain.== infix(_:_:)();
  return v0 & 1;
}

void Tokenizer.__allocating_init(locale:)(uint64_t a1)
{
  swift_allocObject();
  Tokenizer.init(locale:)(a1);
  OUTLINED_FUNCTION_35();
}

uint64_t Tokenizer.init(locale:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];

  *(_QWORD *)(v1 + 24) = 0;
  v8[2] = a1;
  sub_21397CFB8((uint64_t)sub_21397DE4C, (uint64_t)v8);
  if (v2)
  {
    v4 = sub_213981750();
    OUTLINED_FUNCTION_18(v4);
    type metadata accessor for Tokenizer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v5 = v3;
    v6 = sub_213981750();
    OUTLINED_FUNCTION_18(v6);
    *(_QWORD *)(v1 + 16) = v5;
  }
  return v1;
}

void sub_21397DE04(uint64_t *a1@<X8>)
{
  void *v2;
  uint64_t Tokenizer;

  v2 = (void *)sub_213981738();
  Tokenizer = mtok_createTokenizer();

  *a1 = Tokenizer;
}

void sub_21397DE4C(uint64_t *a1@<X8>)
{
  sub_21397DE04(a1);
}

uint64_t type metadata accessor for Tokenizer()
{
  return objc_opt_self();
}

void sub_21397DE74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRetain();
  sub_21397CD68(v2, a1, a2, MEMORY[0x24BEDC9B8]);
  if (!v3)
  {
    v7 = v6;
    type metadata accessor for TokenChain();
    swift_allocObject();
    sub_21397D944(v7);
  }
  OUTLINED_FUNCTION_35();
}

uint64_t type metadata accessor for TokenChain()
{
  return objc_opt_self();
}

uint64_t sub_21397DF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRetain();
  sub_21397CD68(v2, a1, a2, MEMORY[0x24BEDC9B8]);
  v6 = v5;
  type metadata accessor for TokenChain();
  v7 = swift_allocObject();
  sub_21397D944(v6);
  return v7;
}

void sub_21397DF9C()
{
  OUTLINED_FUNCTION_7();
  sub_21397D0AC();
  OUTLINED_FUNCTION_6();
}

void sub_21397DFE0(_DWORD *a1@<X8>)
{
  int v2;

  sub_21397E02C();
  *a1 = v2;
}

void sub_21397E008(unsigned int *a1)
{
  sub_21397E038(*a1);
}

void sub_21397E02C()
{
  sub_21397E104();
}

void sub_21397E038(uint64_t a1)
{
  sub_21397E154(a1, MEMORY[0x24BEDCA20]);
}

void sub_21397E044(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;

  *(_QWORD *)a1 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_23();
  *(_QWORD *)(a1 + 8) = v2;
  if (v2)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    *(_DWORD *)(a1 + 16) = v4;
    OUTLINED_FUNCTION_6();
  }
}

void sub_21397E0A0(uint64_t a1, uint64_t a2)
{
  sub_21397E208(a1, a2, MEMORY[0x24BEDCA20]);
}

void sub_21397E0AC(_DWORD *a1@<X8>)
{
  int v2;

  sub_21397E0F8();
  *a1 = v2;
}

void sub_21397E0D4(unsigned int *a1)
{
  sub_21397E148(*a1);
}

void sub_21397E0F8()
{
  sub_21397E104();
}

void sub_21397E104()
{
  OUTLINED_FUNCTION_7();
  sub_21397C70C();
  OUTLINED_FUNCTION_6();
}

void sub_21397E148(uint64_t a1)
{
  sub_21397E154(a1, MEMORY[0x24BEDCA28]);
}

void sub_21397E154(uint64_t a1, void (*a2)(_QWORD, uint64_t, CFErrorRef *))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_7();
  sub_21397D1B0(v4, a1, a2);
  OUTLINED_FUNCTION_6();
}

void sub_21397E1A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;

  *(_QWORD *)a1 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_23();
  *(_QWORD *)(a1 + 8) = v2;
  if (v2)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
  else
  {
    *(_DWORD *)(a1 + 16) = v4;
    OUTLINED_FUNCTION_6();
  }
}

void sub_21397E1FC(uint64_t a1, uint64_t a2)
{
  sub_21397E208(a1, a2, MEMORY[0x24BEDCA28]);
}

void sub_21397E208(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, uint64_t, CFErrorRef *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned int *)(a1 + 16);
  v6 = swift_retain();
  sub_21397D1B0(v6, v5, a3);
  if (v4)
  {
    OUTLINED_FUNCTION_0();
    __break(1u);
  }
}

uint64_t Tokenizer.deinit()
{
  uint64_t v0;

  mtok_destroy();
  return v0;
}

uint64_t Tokenizer.__deallocating_deinit()
{
  mtok_destroy();
  return swift_deallocClassInstance();
}

unint64_t sub_21397E2B4()
{
  unint64_t result;

  result = qword_254D0CA40;
  if (!qword_254D0CA40)
  {
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for TokenType, &type metadata for TokenType);
    atomic_store(result, (unint64_t *)&qword_254D0CA40);
  }
  return result;
}

unint64_t sub_21397E2F4()
{
  unint64_t result;

  result = qword_254D0CA48;
  if (!qword_254D0CA48)
  {
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for TokenizationType, &type metadata for TokenizationType);
    atomic_store(result, (unint64_t *)&qword_254D0CA48);
  }
  return result;
}

unint64_t sub_21397E334()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D0CA50;
  if (!qword_254D0CA50)
  {
    v1 = type metadata accessor for TokenChain();
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for TokenChain, v1);
    atomic_store(result, (unint64_t *)&qword_254D0CA50);
  }
  return result;
}

uint64_t sub_21397E374()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for MorphunError()
{
  return sub_21397E38C();
}

uint64_t sub_21397E38C()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s12MorphunSwift12MorphunErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_21397E374();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MorphunError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_21397E374();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_21397E38C();
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

uint64_t assignWithTake for MorphunError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_21397E38C();
  return a1;
}

uint64_t getEnumTagSinglePayload for MorphunError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MorphunError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21397E50C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_21397E518(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for MorphunError()
{
  OUTLINED_FUNCTION_21();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TokenType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21397E614 + 4 * byte_213981D05[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21397E648 + 4 * byte_213981D00[v4]))();
}

uint64_t sub_21397E648(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397E650(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21397E658);
  return result;
}

uint64_t sub_21397E664(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21397E66CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21397E670(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397E678(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TokenType()
{
  OUTLINED_FUNCTION_21();
}

uint64_t getEnumTagSinglePayload for TokenizationType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenizationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21397E764 + 4 * byte_213981D0F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21397E798 + 4 * byte_213981D0A[v4]))();
}

uint64_t sub_21397E798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397E7A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21397E7A8);
  return result;
}

uint64_t sub_21397E7B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21397E7BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21397E7C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397E7C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397E7D4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21397E7DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for TokenizationType()
{
  OUTLINED_FUNCTION_21();
}

_QWORD *initializeBufferWithCopyOfBuffer for Token(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for Token()
{
  return swift_release();
}

_QWORD *assignWithCopy for Token(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for Token(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Token(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Token(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for Token()
{
  OUTLINED_FUNCTION_21();
}

uint64_t method lookup function for TokenChain()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TokenChain.wordCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of TokenChain.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TokenChain.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TokenChain.next()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t method lookup function for Tokenizer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Tokenizer.__allocating_init(locale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of Tokenizer.tokenizeWithError(string:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of Tokenizer.tokenize(string:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of Tokenizer.setStyle(type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of Tokenizer.maxInputSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Tokenizer.maxTokens.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_21397EA2C(a1, &qword_254D0CA58);
}

void type metadata accessor for CFLocale(uint64_t a1)
{
  sub_21397EA2C(a1, &qword_254D0CA60);
}

void sub_21397EA2C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21397EA70()
{
  uint64_t result;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  swift_retain();
  result = sub_21397DAB4(&v19);
  v1 = v20;
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = 0;
  if (v20)
  {
    v4 = (uint64_t *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      v5 = v19;
      if (!v3)
      {
        v6 = v2[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_24;
        v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1)
          v8 = 1;
        else
          v8 = v7;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254D0CA68);
        v9 = (_QWORD *)swift_allocObject();
        v10 = (uint64_t)(_swift_stdlib_malloc_size(v9) - 32) / 16;
        v9[2] = v8;
        v9[3] = 2 * v10;
        v11 = (unint64_t)(v9 + 4);
        v12 = v2[3];
        v13 = v12 >> 1;
        if (v2[2])
        {
          if (v9 != v2 || v11 >= (unint64_t)&v2[2 * v13 + 4])
            memmove(v9 + 4, v2 + 4, 16 * v13);
          v2[2] = 0;
        }
        v4 = (uint64_t *)(v11 + 16 * v13);
        v3 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - (v12 >> 1);
        result = swift_release();
        v2 = v9;
      }
      v15 = __OFSUB__(v3--, 1);
      if (v15)
        break;
      *v4 = v5;
      v4[1] = v1;
      v4 += 2;
      result = sub_21397DAB4(&v19);
      v1 = v20;
      if (!v20)
        goto LABEL_19;
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  result = swift_release();
  v16 = v2[3];
  if (v16 < 2)
    return (uint64_t)v2;
  v17 = v16 >> 1;
  v15 = __OFSUB__(v17, v3);
  v18 = v17 - v3;
  if (!v15)
  {
    v2[2] = v18;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

_QWORD *sub_21397EBD4(_QWORD *result, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = result;
  v5 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *v4 = v3;
    return (_QWORD *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = a2;
    sub_21397DAB4(&v9);
    v8 = v10;
    if (v10)
    {
      v5 = 0;
      while (1)
      {
        *v7 = v9;
        v7[1] = v8;
        if (a3 - 1 == v5)
          break;
        sub_21397DAB4(&v9);
        v8 = v10;
        v7 += 2;
        ++v5;
        if (!v10)
          goto LABEL_11;
      }
      v5 = a3;
    }
    else
    {
      v5 = 0;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B954C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21397ECC0()
{
  unint64_t result;

  result = qword_254D0CA70;
  if (!qword_254D0CA70)
  {
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for MorphunError, &type metadata for MorphunError);
    atomic_store(result, (unint64_t *)&qword_254D0CA70);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_unexpectedError();
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_QWORD *)a1 = 0xD00000000000002BLL;
  *(_QWORD *)(a1 + 8) = (a2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_8()
{
  return sub_21397ECC0();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_2139817B0();
}

CFErrorDomain OUTLINED_FUNCTION_14()
{
  __CFError *v0;

  return CFErrorGetDomain(v0);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void OUTLINED_FUNCTION_23()
{
  sub_21397C70C();
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_release();
}

void OUTLINED_FUNCTION_30()
{
  void *v0;

}

void OUTLINED_FUNCTION_31()
{
  sub_21397C7C8();
}

unint64_t OUTLINED_FUNCTION_32()
{
  return sub_21397ECC0();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1, uint64_t a2, ...)
{
  uint64_t (*v2)(char *);
  va_list va;

  va_start(va, a2);
  return v2(va);
}

uint64_t OUTLINED_FUNCTION_34()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_37()
{
  return sub_21397ECC0();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_2139817B0();
}

void sub_21397EEEC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *SupportedLocalesList;
  void *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v14[2];

  v14[0] = sub_213981750();
  v0 = *(_QWORD *)(v14[0] - 8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  SupportedLocalesList = (void *)mloc_getSupportedLocalesList();
  if (!SupportedLocalesList)
    goto LABEL_16;
  v4 = SupportedLocalesList;
  v5 = (char *)objc_msgSend(SupportedLocalesList, sel_count);
  v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (((unint64_t)v6 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v7 = 0;
  v8 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = objc_msgSend(v4, sel_objectAtIndex_, v7);
    sub_213981870();
    swift_unknownObjectRelease();
    type metadata accessor for CFLocale(0);
    swift_dynamicCast();
    v10 = (void *)v14[1];
    sub_213981744();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = OUTLINED_FUNCTION_0_0(0, *(_QWORD *)(v8 + 16) + 1);
    v12 = *(_QWORD *)(v8 + 16);
    v11 = *(_QWORD *)(v8 + 24);
    if (v12 >= v11 >> 1)
      v8 = OUTLINED_FUNCTION_0_0(v11 > 1, v12 + 1);
    *(_QWORD *)(v8 + 16) = v12 + 1;
    (*(void (**)(unint64_t, char *, _QWORD))(v0 + 32))(v8+ ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80))+ *(_QWORD *)(v0 + 72) * v12, v2, v14[0]);

    if (v6 == v7)
      break;
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_14;
    }
  }

}

uint64_t LocaleUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LocaleUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21397F0C4(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D0CA78);
  v10 = *(_QWORD *)(sub_213981750() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_2139818AC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_213981750() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_213981380(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21397F2C8(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t type metadata accessor for LocaleUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocaleUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static LocaleUtils.getSupportedLocalesList()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_21397F2C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_213981750() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_2139818C4();
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_21397F0C4(a1, a2, 1, v2);
}

MorphunSwift::ConfigurationFeature_optional __swiftcall ConfigurationFeature.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 13;
  if ((unint64_t)rawValue < 0xD)
    v2 = rawValue;
  *v1 = v2;
  return (MorphunSwift::ConfigurationFeature_optional)rawValue;
}

uint64_t ConfigurationFeature.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

MorphunSwift::ConfigurationFeature_optional sub_21397F410(Swift::Int *a1)
{
  return ConfigurationFeature.init(rawValue:)(*a1);
}

uint64_t sub_21397F418@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ConfigurationFeature.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_21397F43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  swift_bridgeObjectRetain();
  sub_21397CD1C(v2, a1, a2);
  if (!v3)
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_35();
}

void sub_21397F494()
{
  uint64_t v0;

  OUTLINED_FUNCTION_7();
  swift_retain();
  sub_21397CE98();
  if (!v0)
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_2_0();
  }
}

uint64_t ConfigurableAnalyzer.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ConfigurableAnalyzer.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void DefaultAnalyzerFactory.__allocating_init(configOptions:)(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1();
  DefaultAnalyzerFactory.init(configOptions:)(a1);
  OUTLINED_FUNCTION_35();
}

uint64_t DefaultAnalyzerFactory.init(configOptions:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFErrorRef v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  CFErrorRef err;

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = v1;
    err = (CFErrorRef)MEMORY[0x24BEE4AF8];
    sub_21397FA34(0, v4, 0);
    v6 = 0;
    v7 = err;
    v8 = *((_QWORD *)err + 2);
    do
    {
      v9 = *(unsigned __int8 *)(a1 + v6 + 32);
      v10 = v9 > 0x40;
      if (v9 >= 0x40)
        v11 = 0;
      else
        v11 = 1 << v9;
      if (v10)
        v12 = 0;
      else
        v12 = v11;
      v13 = *((_QWORD *)err + 3);
      if (v8 >= v13 >> 1)
        sub_21397FA34((char *)(v13 > 1), v8 + 1, 1);
      ++v6;
      *((_QWORD *)err + 2) = v8 + 1;
      *((_QWORD *)err + v8++ + 4) = v12;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    v2 = v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (CFErrorRef)MEMORY[0x24BEE4AF8];
  }
  v14 = *((_QWORD *)v7 + 2);
  if (v14)
  {
    v15 = 0;
    v16 = (uint64_t *)((char *)v7 + 32);
    do
    {
      v17 = *v16++;
      v15 |= v17;
      --v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  v18 = mdaf_create();
  if (v18)
  {
    *(_QWORD *)(v2 + 16) = v18;
  }
  else
  {
    sub_21397ECC0();
    v19 = OUTLINED_FUNCTION_2();
    *v20 = 0xD00000000000002BLL;
    v20[1] = 0x8000000213982580;
    OUTLINED_FUNCTION_3(v19, (uint64_t)v20);
    type metadata accessor for DefaultAnalyzerFactory();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

void DefaultAnalyzerFactory.__allocating_init()()
{
  uint64_t v0;

  if (qword_254D0CA20 != -1)
    swift_once();
  type metadata accessor for DefaultAnalyzerFactory();
  OUTLINED_FUNCTION_0_1();
  v0 = swift_bridgeObjectRetain();
  DefaultAnalyzerFactory.init(configOptions:)(v0);
  OUTLINED_FUNCTION_35();
}

uint64_t sub_21397F824(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];

  v6[3] = a1;
  sub_21397C990((uint64_t)sub_21397FA70, (uint64_t)v6);
  if (!v2)
  {
    v4 = v3;
    type metadata accessor for ConfigurableAnalyzer();
    v2 = OUTLINED_FUNCTION_0_1();
    *(_QWORD *)(v2 + 16) = v4;
    *(_QWORD *)(v2 + 24) = v1;
    OUTLINED_FUNCTION_7();
  }
  return v2;
}

void sub_21397F884(uint64_t *a1@<X8>)
{
  void *v2;
  uint64_t Analyzer;

  v2 = (void *)sub_213981738();
  Analyzer = mdaf_getAnalyzer();

  *a1 = Analyzer;
}

void sub_21397F8D8()
{
  qword_254D0CA80 = (uint64_t)&unk_24D0948C8;
}

uint64_t static DefaultAnalyzerFactory.defaultFeatureConfig.getter()
{
  if (qword_254D0CA20 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t DefaultAnalyzerFactory.deinit()
{
  uint64_t v0;

  mdaf_destroy();
  return v0;
}

uint64_t DefaultAnalyzerFactory.__deallocating_deinit()
{
  mdaf_destroy();
  return swift_deallocClassInstance();
}

void *sub_21397F96C(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)sub_2139818C4();
  __break(1u);
  return result;
}

char *sub_21397FA34(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_21397FCB0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for DefaultAnalyzerFactory()
{
  return objc_opt_self();
}

void sub_21397FA70(uint64_t *a1@<X8>)
{
  sub_21397F884(a1);
}

uint64_t type metadata accessor for ConfigurableAnalyzer()
{
  return objc_opt_self();
}

unint64_t sub_21397FA9C()
{
  unint64_t result;

  result = qword_254D0CA88;
  if (!qword_254D0CA88)
  {
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for ConfigurationFeature, &type metadata for ConfigurationFeature);
    atomic_store(result, (unint64_t *)&qword_254D0CA88);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConfigurationFeature(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF4)
  {
    if (a2 + 12 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 12) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v5 = v6 - 13;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfigurationFeature(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_21397FBAC + 4 * byte_213982175[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_21397FBE0 + 4 * byte_213982170[v4]))();
}

uint64_t sub_21397FBE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397FBE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21397FBF0);
  return result;
}

uint64_t sub_21397FBFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21397FC04);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_21397FC08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21397FC10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationFeature()
{
  return &type metadata for ConfigurationFeature;
}

uint64_t method lookup function for ConfigurableAnalyzer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeString(string:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeTokenChain(tokenChain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t method lookup function for DefaultAnalyzerFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.__allocating_init(configOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.getAnalyzer(locale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

char *sub_21397FCB0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F098D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_213981440(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21397F96C(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  uint64_t v0;

  return sub_21397D944(v0);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return type metadata accessor for TokenChain();
}

void registerDataPathForLocale(locale:path:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_21397D298((uint64_t)sub_21397FE04, (uint64_t)v3);
}

void sub_21397FE04(_BYTE *a1@<X8>)
{
  sub_21397FE50(a1);
}

void registerDataPathForLocaleWithError(locale:path:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_21397D298((uint64_t)sub_213980158, (uint64_t)v3);
}

void sub_21397FE50(_BYTE *a1@<X8>)
{
  void *v2;
  void *v3;

  v2 = (void *)sub_213981738();
  v3 = (void *)sub_2139817A4();
  mdr_registerDataPathForLocale();

  *a1 = 0;
}

uint64_t getDataPathForLocale(locale:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[4];

  v5[2] = a1;
  sub_21397C990((uint64_t)sub_21397FF78, (uint64_t)v5);
  v2 = v1;
  v3 = sub_2139817B0();

  return v3;
}

void sub_21397FF30(uint64_t *a1@<X8>)
{
  void *v2;
  uint64_t DataPathForLocaleCopy;

  v2 = (void *)sub_213981738();
  DataPathForLocaleCopy = mdr_getDataPathForLocaleCopy();

  *a1 = DataPathForLocaleCopy;
}

void sub_21397FF78(uint64_t *a1@<X8>)
{
  sub_21397FF30(a1);
}

uint64_t sub_21397FF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_213981750();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_bridgeObjectRetain();
  sub_21398172C();
  v12 = v9;
  v13 = a3;
  v14 = a4;
  sub_21397D298((uint64_t)sub_213980158, (uint64_t)v11);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_213980058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_213981750();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_21398172C();
  v4 = getDataPathForLocale(locale:)((uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t Assets.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Assets.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Assets()
{
  return objc_opt_self();
}

uint64_t method lookup function for Assets()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static Assets.setPathForMorphun(language:path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static Assets.getPathFromMorphun(language:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

BOOL sub_21398015C(char a1, char a2)
{
  return a1 == a2;
}

void sub_213980170()
{
  sub_213981900();
  OUTLINED_FUNCTION_4_1();
  sub_213981918();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_2139801A4()
{
  return sub_21398190C();
}

void sub_2139801CC()
{
  sub_213981900();
  OUTLINED_FUNCTION_4_1();
  sub_213981918();
  OUTLINED_FUNCTION_3_0();
}

MorphunSwift::LogLevel_optional __swiftcall LogLevel.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 6;
  if ((unint64_t)rawValue < 6)
    v2 = rawValue;
  *v1 = v2;
  return (MorphunSwift::LogLevel_optional)rawValue;
}

void *static LogLevel.allCases.getter()
{
  return &unk_24D094970;
}

uint64_t LogLevel.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_213980224()
{
  sub_213980170();
}

void sub_21398023C()
{
  sub_2139801CC();
}

MorphunSwift::LogLevel_optional sub_213980254(Swift::Int *a1)
{
  return LogLevel.init(rawValue:)(*a1);
}

uint64_t sub_21398025C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = LogLevel.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_213980280(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D094970;
}

uint64_t sub_213980290()
{
  uint64_t v0;

  sub_213981864();
  sub_213981858();
  return v0;
}

uint64_t sub_2139802DC()
{
  sub_213980290();
  return swift_deallocClassInstance();
}

uint64_t sub_2139802FC()
{
  uint64_t v0;

  v0 = sub_213981774();
  __swift_allocate_value_buffer(v0, qword_254D0D4E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D0D4E0);
  return sub_213981768();
}

void sub_213980374(uint64_t a1, Swift::Int rawValue, const UChar *a3, const UChar *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  const char *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  const UChar *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjectType;
  uint64_t v22;
  NSObject *oslog;
  char v24;
  char v25;

  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 8);
    LogLevel.init(rawValue:)(rawValue);
    if (v25 == 6)
    {
      v7 = qword_254D0CA28;
      swift_unknownObjectRetain();
      if (v7 != -1)
        swift_once();
      v8 = sub_213981774();
      __swift_project_value_buffer(v8, (uint64_t)qword_254D0D4E0);
      v9 = sub_21398175C();
      v10 = sub_21398181C();
      if (!os_log_type_enabled(v9, v10))
        goto LABEL_21;
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      v12 = "Error in morphun logging: Invalid log level passed by morphun";
LABEL_20:
      _os_log_impl(&dword_21397B000, v9, v10, v12, v11, 2u);
      MEMORY[0x2199B95DC](v11, -1, -1);
LABEL_21:

      swift_unknownObjectRelease();
      return;
    }
    if (a3)
    {
      swift_unknownObjectRetain();
      u_strlen(a3);
      v16 = sub_213981798();
      a3 = v17;
      if (a4)
      {
LABEL_14:
        u_strlen(a4);
        v18 = sub_213981798();
        v20 = v19;
        ObjectType = swift_getObjectType();
        v24 = v25;
        (*(void (**)(char *, uint64_t, const UChar *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(&v24, v16, a3, v18, v20, ObjectType, v6);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      swift_unknownObjectRetain();
      v16 = 0;
      if (a4)
        goto LABEL_14;
    }
    swift_bridgeObjectRelease();
    if (qword_254D0CA28 != -1)
      swift_once();
    v22 = sub_213981774();
    __swift_project_value_buffer(v22, (uint64_t)qword_254D0D4E0);
    v9 = sub_21398175C();
    v10 = sub_21398181C();
    if (!os_log_type_enabled(v9, v10))
      goto LABEL_21;
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = "Error in morphun logging: Morphun log message is found to be null";
    goto LABEL_20;
  }
  if (qword_254D0CA28 != -1)
    swift_once();
  v13 = sub_213981774();
  __swift_project_value_buffer(v13, (uint64_t)qword_254D0D4E0);
  oslog = sub_21398175C();
  v14 = sub_21398181C();
  if (os_log_type_enabled(oslog, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_21397B000, oslog, v14, "Error in morphun logging: loggerDelegateCPtr is null", v15, 2u);
    MEMORY[0x2199B95DC](v15, -1, -1);
  }

}

uint64_t sub_2139806A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  _QWORD v5[2];

  v0 = sub_213981834();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213981828();
  MEMORY[0x24BDAC7A8]();
  sub_21398178C();
  MEMORY[0x24BDAC7A8]();
  sub_2139815E4();
  sub_213981780();
  v5[1] = MEMORY[0x24BEE4AF8];
  sub_213981620();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D0CB48);
  sub_213981660((unint64_t *)&unk_254D0CB50, &qword_254D0CB48, MEMORY[0x24BEE12C8]);
  sub_21398187C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_21398184C();
  qword_254D0D4F8 = result;
  return result;
}

void sub_213980848()
{
  qword_254D0D500 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_21398085C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  if (qword_254D0CA38 != -1)
    swift_once();
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_2139809B8(v6, a1);
  swift_bridgeObjectRelease();
  result = swift_release();
  v9 = 0;
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D0CB30);
    v9 = swift_allocObject();
    swift_unknownObjectRetain();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_QWORD *)(v9 + 16) = v10;
    *v10 = a1;
    v10[1] = a2;
    swift_beginAccess();
    v11 = swift_retain();
    MEMORY[0x2199B9144](v11);
    sub_213981354(*(_QWORD *)((qword_254D0D500 & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_213981804();
    sub_2139817EC();
    result = swift_endAccess();
  }
  *a3 = v9;
  return result;
}

uint64_t sub_2139809B8(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_2139818B8())
  {
    v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x2199B91EC](v5 - 4, a1);
      }
      else
      {
        v6 = *(_QWORD *)(a1 + 8 * v5);
        swift_retain();
      }
      v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if (**(_QWORD **)(v6 + 16) == a2)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v6;
      }
      swift_release();
      ++v5;
      if (v7 == v4)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_213980AC8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  uint64_t result;
  uint64_t v9;

  if (qword_254D0CA38 != -1)
    swift_once();
  swift_beginAccess();
  swift_unknownObjectRetain();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_213980BC8(v4, a1);
  v7 = v6;
  result = swift_bridgeObjectRelease();
  v9 = 0;
  if ((v7 & 1) == 0)
  {
    swift_beginAccess();
    v9 = sub_213980CBC(v5);
    result = swift_endAccess();
  }
  *a2 = v9;
  return result;
}

uint64_t sub_213980BC8(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_2139818B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = 0;
  if (v4)
  {
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? MEMORY[0x2199B91EC](v5, a1) : swift_retain();
      v7 = **(_QWORD **)(v6 + 16);
      swift_release();
      if (v7 == a2)
        break;
      v8 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      ++v5;
      if (v8 == v4)
      {
        v5 = 0;
        break;
      }
    }
  }
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_213980CBC(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_213981524(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    v9 = v5 + 8 * a1;
    v10 = *(_QWORD *)(v9 + 32);
    sub_2139814A0((char *)(v9 + 40), v8, (char *)(v9 + 32));
    *(_QWORD *)(v5 + 16) = v7;
    sub_2139817EC();
    return v10;
  }
  return result;
}

void static LoggerConfig.setLogLevel(logLevel:)()
{
  mlogc_setLogLevel();
}

MorphunSwift::LogLevel_optional static LoggerConfig.getLogLevel()()
{
  Swift::Int LogLevel;

  LogLevel = mlogc_getLogLevel();
  return LogLevel.init(rawValue:)(LogLevel);
}

void static LoggerConfig.logToConsole(value:)()
{
  mlogc_logToConsole();
}

uint64_t static LoggerConfig.registerLogger(loggerDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_213980FA4(a1, a2, (uint64_t)sub_213980F64, (uint64_t (*)(void))sub_21397CB9C) & 1;
}

uint64_t sub_213980F64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21398085C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t static LoggerConfig.unregisterLogger(loggerDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_213980FA4(a1, a2, (uint64_t)sub_213981098, (uint64_t (*)(void))sub_21397CC64) & 1;
}

uint64_t sub_213980FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5;
  id v6;
  char v7;
  uint64_t v9;

  if (qword_254D0CA30 != -1)
    swift_once();
  MEMORY[0x24BDAC7A8]();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D0CA90);
  sub_213981840();

  v7 = v9;
  if (v9)
    v7 = a4();
  return v7 & 1;
}

uint64_t sub_213981098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_213980AC8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t LoggerConfig.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LoggerConfig.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_2139810CC()
{
  unint64_t result;

  result = qword_254D0CA98;
  if (!qword_254D0CA98)
  {
    result = MEMORY[0x2199B9564](&protocol conformance descriptor for LogLevel, &type metadata for LogLevel);
    atomic_store(result, (unint64_t *)&qword_254D0CA98);
  }
  return result;
}

uint64_t sub_213981108()
{
  return sub_213981660(&qword_254D0CAA0, qword_254D0CAA8, MEMORY[0x24BEE12E0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B9558](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LogLevel(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LogLevel(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_21398124C + 4 * byte_213982305[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_213981280 + 4 * byte_213982300[v4]))();
}

uint64_t sub_213981280(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213981288(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213981290);
  return result;
}

uint64_t sub_21398129C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2139812A4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2139812A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2139812B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LogLevel()
{
  return &type metadata for LogLevel;
}

uint64_t dispatch thunk of LoggerDelegate.log(logLevel:category:message:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_2139812D8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MemoryManagedPointer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MemoryManagedPointer);
}

uint64_t type metadata accessor for LoggerConfig()
{
  return objc_opt_self();
}

uint64_t method lookup function for LoggerConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_213981354(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_2139817F8();
  return result;
}

uint64_t sub_213981380(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_0();
    result = OUTLINED_FUNCTION_0_2();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_213981750(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_213981750();
    OUTLINED_FUNCTION_2_1();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_2_1();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_213981440(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_0();
    __src = (char *)OUTLINED_FUNCTION_0_2();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2139814A0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2139818C4();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void sub_213981524(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2139818B8();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2199B91F8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

unint64_t sub_2139815E4()
{
  unint64_t result;

  result = qword_254D0CB38;
  if (!qword_254D0CB38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D0CB38);
  }
  return result;
}

unint64_t sub_213981620()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D0CB40;
  if (!qword_254D0CB40)
  {
    v1 = sub_213981828();
    result = MEMORY[0x2199B9564](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_254D0CB40);
  }
  return result;
}

uint64_t sub_213981660(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199B9564](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199B9528](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_2139818C4();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_21398190C();
}

uint64_t sub_21398172C()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_213981738()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_213981744()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_213981750()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21398175C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213981768()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_213981774()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213981780()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21398178C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213981798()
{
  return MEMORY[0x24BDCF8A0]();
}

uint64_t sub_2139817A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2139817B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2139817BC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2139817C8()
{
  return MEMORY[0x24BEE0E60]();
}

uint64_t sub_2139817D4()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2139817E0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2139817EC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2139817F8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_213981804()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_213981810()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_21398181C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_213981828()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_213981834()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_213981840()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_21398184C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_213981858()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_213981864()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_213981870()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21398187C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213981888()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213981894()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2139818A0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2139818AC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2139818B8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2139818C4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2139818D0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2139818DC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2139818E8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2139818F4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_213981900()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21398190C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213981918()
{
  return MEMORY[0x24BEE4328]();
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

uint64_t mca_createTokenChain()
{
  return MEMORY[0x24BEDC950]();
}

uint64_t mdaf_create()
{
  return MEMORY[0x24BEDC960]();
}

uint64_t mdaf_destroy()
{
  return MEMORY[0x24BEDC968]();
}

uint64_t mdaf_getAnalyzer()
{
  return MEMORY[0x24BEDC970]();
}

uint64_t mdr_getDataPathForLocaleCopy()
{
  return MEMORY[0x24BEDC978]();
}

uint64_t mdr_registerDataPathForLocale()
{
  return MEMORY[0x24BEDC980]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t mloc_getSupportedLocalesList()
{
  return MEMORY[0x24BEDC988]();
}

uint64_t mlogc_getLogLevel()
{
  return MEMORY[0x24BEDC990]();
}

uint64_t mlogc_logToConsole()
{
  return MEMORY[0x24BEDC998]();
}

uint64_t mlogc_registerLogger()
{
  return MEMORY[0x24BEDC9A0]();
}

uint64_t mlogc_setLogLevel()
{
  return MEMORY[0x24BEDC9A8]();
}

uint64_t mlogc_unregisterLogger()
{
  return MEMORY[0x24BEDC9B0]();
}

uint64_t mtok_createTokenizer()
{
  return MEMORY[0x24BEDC9C0]();
}

uint64_t mtok_destroy()
{
  return MEMORY[0x24BEDC9C8]();
}

uint64_t mtok_getEndChar()
{
  return MEMORY[0x24BEDC9D8]();
}

uint64_t mtok_getNext()
{
  return MEMORY[0x24BEDC9F0]();
}

uint64_t mtok_getStartChar()
{
  return MEMORY[0x24BEDC9F8]();
}

uint64_t mtok_getType()
{
  return MEMORY[0x24BEDCA00]();
}

uint64_t mtok_setStyle()
{
  return MEMORY[0x24BEDCA30]();
}

uint64_t mtokc_compare()
{
  return MEMORY[0x24BEDCA38]();
}

uint64_t mtokc_destroy()
{
  return MEMORY[0x24BEDCA40]();
}

uint64_t mtokc_getHead()
{
  return MEMORY[0x24BEDCA48]();
}

uint64_t mtokc_getSize()
{
  return MEMORY[0x24BEDCA50]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

