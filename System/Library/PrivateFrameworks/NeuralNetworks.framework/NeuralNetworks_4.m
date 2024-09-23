uint64_t sub_242C1CCAC(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  unsigned int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF7 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 247);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 6)
    v4 = 0;
  else
    v4 = v3 ^ 0xFF;
  if (v4 >= 3)
    return v4 - 2;
  else
    return 0;
}

uint64_t sub_242C1CCF4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF6)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 247;
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -3 - a2;
  }
  return result;
}

uint64_t sub_242C1CD44(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 24);
  if (v1 <= 6)
    return 0;
  else
    return v1 ^ 0xFF;
}

uint64_t sub_242C1CD58(uint64_t result, unsigned int a2)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 249;
  }
  else if (a2)
  {
    *(_BYTE *)(result + 24) = ~(_BYTE)a2;
  }
  return result;
}

void type metadata accessor for DimensionExpectation()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t sub_242C1CD90(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 + 3) >= 2u)
    return sub_242B5A204(a2, a3, a4);
  return result;
}

uint64_t sub_242C1CDB4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 + 3) >= 2u)
    return sub_242B5A218(a2, a3, a4);
  return result;
}

uint64_t sub_242C1CDD8(uint64_t a1)
{
  sub_242A8E358(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t sub_242C1CE08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_242A8E344(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_242C480E0();
  return a1;
}

uint64_t sub_242C1CE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_242A8E344(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_242A8E358(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_242C480E0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_242C1CEE0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_242A8E358(v5, v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_242C1CF34(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_242C1CF74(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ShapeExpectation()
{
  OUTLINED_FUNCTION_22_4();
}

void OUTLINED_FUNCTION_4_71()
{
  sub_242A59264();
}

uint64_t OUTLINED_FUNCTION_5_72()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_9_70()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_54()
{
  uint64_t v0;
  uint64_t v1;

  sub_242A8E358(v1, v0, 4);
  return sub_242A8E358(v1, v0, 4);
}

uint64_t OUTLINED_FUNCTION_14_46()
{
  return sub_242C48314();
}

void OUTLINED_FUNCTION_15_52(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10@<Q0>, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t (*a17)(uint64_t))
{
  char v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD, uint64_t, uint64_t);

  LOBYTE(a12) = v17;
  sub_242C1B5A4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a12, a10.n128_i64[0], a10.n128_i64[1], v18, v19, a17);
}

uint64_t OUTLINED_FUNCTION_16_48()
{
  return 0x747361656C207461;
}

uint64_t OUTLINED_FUNCTION_17_49()
{
  return 0x2074736F6D207461;
}

uint64_t OUTLINED_FUNCTION_21_45()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_23_49()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_242B55458(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_24_49()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_25_46()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_26_48()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  return sub_242B55458(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_28_50()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_242A8E358(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_29_35()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_38()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DebugValueLocator.description.getter(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_32_38()
{
  __n128 *v0;

  return v0[2];
}

uint64_t OUTLINED_FUNCTION_34_40()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_37_36()
{
  return sub_242C48680();
}

uint64_t OUTLINED_FUNCTION_38_32(uint64_t a1)
{
  uint64_t v1;
  char v2;

  return sub_242B55458(a1, v1, v2);
}

void OUTLINED_FUNCTION_40_40()
{
  uint64_t v0;

  ComparableExpectation.description.getter(v0);
}

uint64_t OUTLINED_FUNCTION_44_30()
{
  uint64_t v0;

  return v0;
}

BOOL static ScalarType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void *static ScalarType.floatingPointTypes.getter()
{
  return &unk_25137AF40;
}

uint64_t ScalarType.stride.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 0xA)
    return OUTLINED_FUNCTION_31_1();
  else
    return OUTLINED_FUNCTION_33_39((char)v1);
}

uint64_t ScalarType.alignment.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 0xA)
    return OUTLINED_FUNCTION_31_1();
  else
    return OUTLINED_FUNCTION_33_39((char)v1);
}

BOOL ScalarType.isFloatingPoint.getter()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  const char *v3;
  int v4;
  _BOOL8 result;

  v1 = *v0;
  v2 = 3;
  v3 = "\b\t\n\v";
  do
  {
    v4 = *(unsigned __int8 *)v3++;
    result = v4 == v1;
  }
  while (v4 != v1 && v2-- != 0);
  return result;
}

uint64_t sub_242C1D2C0(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t var1;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 32))(&var1);
  v2 = var1 - 1;
  if (v2 > 0xA)
    return 1;
  else
    return qword_242C61920[(char)v2];
}

Swift::Bool __swiftcall ScalarType.isCastable(to:)(NeuralNetworks::ScalarType to)
{
  unsigned __int8 *v1;
  char v2;
  int v3;
  int v4;

  v3 = *(unsigned __int8 *)to;
  v4 = *v1;
  sub_242B64794(v4, (uint64_t)&unk_25137AF40);
  OUTLINED_FUNCTION_10_28();
  if ((v2 & 1) == 0)
    return v3 != 12 || v4 == 12;
  sub_242B64794(v3, (uint64_t)&unk_25137B550);
  OUTLINED_FUNCTION_10_28();
  return 0;
}

uint64_t ScalarType.isInteger.getter()
{
  unsigned __int8 *v0;

  sub_242B64794(*v0, (uint64_t)&unk_25137B550);
  OUTLINED_FUNCTION_40_0();
  return v0 & 1;
}

void *static ScalarType.integerTypes.getter()
{
  return &unk_25137B550;
}

uint64_t sub_242C1D3C8(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 32))(&v4);
  sub_242B64794(v4, (uint64_t)&unk_25137AF40);
  OUTLINED_FUNCTION_40_0();
  return v2 & 1;
}

uint64_t ScalarType.size.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 0xA)
    return OUTLINED_FUNCTION_31_1();
  else
    return OUTLINED_FUNCTION_33_39((char)v1);
}

void static ScalarType.int.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void *static ScalarType.unsignedTypes.getter()
{
  return &unk_25137E238;
}

BOOL ScalarType.isUnsigned.getter()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  char *v3;
  int v4;
  _BOOL8 result;

  v1 = *v0;
  v2 = 3;
  v3 = &byte_25137E258;
  do
  {
    v4 = *v3++;
    result = v4 == v1;
  }
  while (v4 != v1 && v2-- != 0);
  return result;
}

uint64_t ScalarType.hash(into:)()
{
  return sub_242C4934C();
}

uint64_t sub_242C1D4B4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  char v18;

  v2 = a1 == 947154537 && a2 == 0xE400000000000000;
  if (v2 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x3631746E69 && a2 == 0xE500000000000000;
    if (v6 || (sub_242C4925C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x3233746E69 && a2 == 0xE500000000000000;
      if (v7 || (sub_242C4925C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x3436746E69 && a2 == 0xE500000000000000;
        if (v8 || (sub_242C4925C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x38746E6975 && a2 == 0xE500000000000000;
          if (v9 || (sub_242C4925C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x3631746E6975 && a2 == 0xE600000000000000;
            if (v10 || (sub_242C4925C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x3233746E6975 && a2 == 0xE600000000000000;
              if (v11 || (sub_242C4925C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x3436746E6975 && a2 == 0xE600000000000000;
                if (v12 || (sub_242C4925C() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x363174616F6C66 && a2 == 0xE700000000000000;
                  if (v13 || (sub_242C4925C() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 0x363174616F6C6662 && a2 == 0xE800000000000000;
                    if (v14 || (sub_242C4925C() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 0x323374616F6C66 && a2 == 0xE700000000000000;
                      if (v15 || (sub_242C4925C() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        v16 = a1 == 0x343674616F6C66 && a2 == 0xE700000000000000;
                        if (v16 || (sub_242C4925C() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else if (a1 == 1819242338 && a2 == 0xE400000000000000)
                        {
                          swift_bridgeObjectRelease();
                          return 12;
                        }
                        else
                        {
                          v18 = sub_242C4925C();
                          swift_bridgeObjectRelease();
                          if ((v18 & 1) != 0)
                            return 12;
                          else
                            return 13;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_242C1D964()
{
  return 13;
}

uint64_t sub_242C1D96C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_242C1D998 + 4 * byte_242C60D70[a1]))(947154537, 0xE400000000000000);
}

uint64_t sub_242C1D998()
{
  return 0x3631746E69;
}

uint64_t sub_242C1D9AC()
{
  return 0x3233746E69;
}

uint64_t sub_242C1D9C0()
{
  return 0x3436746E69;
}

uint64_t sub_242C1D9D4()
{
  return 0x38746E6975;
}

uint64_t sub_242C1D9E8()
{
  return 0x3631746E6975;
}

uint64_t sub_242C1D9FC()
{
  return 0x3233746E6975;
}

uint64_t sub_242C1DA10()
{
  return 0x3436746E6975;
}

uint64_t sub_242C1DA24()
{
  return 0x363174616F6C66;
}

uint64_t sub_242C1DA3C()
{
  return 0x363174616F6C6662;
}

uint64_t sub_242C1DA54()
{
  return 0x323374616F6C66;
}

uint64_t sub_242C1DA6C()
{
  return 0x343674616F6C66;
}

uint64_t sub_242C1DA84()
{
  return 1819242338;
}

uint64_t sub_242C1DA90()
{
  sub_242C1EED0();
  return sub_242C494D8();
}

uint64_t sub_242C1DAB8()
{
  sub_242C1EED0();
  return sub_242C494E4();
}

uint64_t sub_242C1DAE0()
{
  sub_242C1EE1C();
  return sub_242C494D8();
}

uint64_t sub_242C1DB08()
{
  sub_242C1EE1C();
  return sub_242C494E4();
}

uint64_t sub_242C1DB30()
{
  unsigned __int8 *v0;

  return sub_242C1D96C(*v0);
}

uint64_t sub_242C1DB38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242C1D4B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242C1DB5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_242C1D964();
  *a1 = result;
  return result;
}

uint64_t sub_242C1DB80()
{
  sub_242C1EDE0();
  return sub_242C494D8();
}

uint64_t sub_242C1DBA8()
{
  sub_242C1EDE0();
  return sub_242C494E4();
}

uint64_t sub_242C1DBD0()
{
  sub_242C1EF0C();
  return sub_242C494D8();
}

uint64_t sub_242C1DBF8()
{
  sub_242C1EF0C();
  return sub_242C494E4();
}

uint64_t sub_242C1DC20()
{
  sub_242C1EE94();
  return sub_242C494D8();
}

uint64_t sub_242C1DC48()
{
  sub_242C1EE94();
  return sub_242C494E4();
}

uint64_t sub_242C1DC70()
{
  sub_242C1EE58();
  return sub_242C494D8();
}

uint64_t sub_242C1DC98()
{
  sub_242C1EE58();
  return sub_242C494E4();
}

uint64_t sub_242C1DCC0()
{
  sub_242C1F0B0();
  return sub_242C494D8();
}

uint64_t sub_242C1DCE8()
{
  sub_242C1F0B0();
  return sub_242C494E4();
}

uint64_t sub_242C1DD10()
{
  sub_242C1F074();
  return sub_242C494D8();
}

uint64_t sub_242C1DD38()
{
  sub_242C1F074();
  return sub_242C494E4();
}

uint64_t sub_242C1DD60()
{
  sub_242C1F038();
  return sub_242C494D8();
}

uint64_t sub_242C1DD88()
{
  sub_242C1F038();
  return sub_242C494E4();
}

uint64_t sub_242C1DDB0()
{
  sub_242C1F0EC();
  return sub_242C494D8();
}

uint64_t sub_242C1DDD8()
{
  sub_242C1F0EC();
  return sub_242C494E4();
}

uint64_t sub_242C1DE00()
{
  sub_242C1EFC0();
  return sub_242C494D8();
}

uint64_t sub_242C1DE28()
{
  sub_242C1EFC0();
  return sub_242C494E4();
}

uint64_t sub_242C1DE50()
{
  sub_242C1EF84();
  return sub_242C494D8();
}

uint64_t sub_242C1DE78()
{
  sub_242C1EF84();
  return sub_242C494E4();
}

uint64_t sub_242C1DEA0()
{
  sub_242C1EF48();
  return sub_242C494D8();
}

uint64_t sub_242C1DEC8()
{
  sub_242C1EF48();
  return sub_242C494E4();
}

uint64_t sub_242C1DEF0()
{
  sub_242C1EFFC();
  return sub_242C494D8();
}

uint64_t sub_242C1DF18()
{
  sub_242C1EFFC();
  return sub_242C494E4();
}

void ScalarType.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  _BYTE v45[8];
  uint64_t v46;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFC0);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_71(v4, v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFC8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_62_15(v6, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFD0);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_63_15(v8, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFD8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFE0);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_6();
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFE8);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v42 - 8));
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFF0);
  OUTLINED_FUNCTION_21_23(v13, (uint64_t)&v46);
  OUTLINED_FUNCTION_67_16(v14);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v16);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722DFF8);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v41 - 8));
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E000);
  OUTLINED_FUNCTION_21_23(v19, (uint64_t)v45);
  OUTLINED_FUNCTION_67_16(v20);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v22);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E008);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v40 - 8));
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E010);
  OUTLINED_FUNCTION_21_23(v25, (uint64_t)v43);
  OUTLINED_FUNCTION_67_16(v26);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_18_27(v28);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E018);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v39 - 8));
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_15_53();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E020);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_4_9();
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E028);
  v43[0] = *(_QWORD *)(v44 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_4_9();
  v34 = v33 - v32;
  v35 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C1EDE0();
  v43[1] = v34;
  sub_242C49478();
  __asm { BR              X9 }
}

void sub_242C1E270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  *(_BYTE *)(v3 - 93) = 0;
  sub_242C1F0EC();
  v4 = *(_QWORD *)(v3 - 104);
  sub_242C49118();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  v5 = OUTLINED_FUNCTION_23_0();
  v6(v5, v4);
  OUTLINED_FUNCTION_0_9();
}

void ScalarType.hashValue.getter()
{
  sub_242C49340();
  OUTLINED_FUNCTION_32_2();
  sub_242C49394();
  OUTLINED_FUNCTION_36_2();
}

void ScalarType.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0A0);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_9_71(v3, v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0A8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5_6();
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0B0);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v58 - 8));
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_6();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0B8);
  OUTLINED_FUNCTION_21_23(v6, (uint64_t)&v65);
  OUTLINED_FUNCTION_67_16(v7);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_6();
  v59[1] = v9;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0C0);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v57 - 8));
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_6();
  v59[0] = v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0C8);
  OUTLINED_FUNCTION_21_23(v12, (uint64_t)&v64);
  OUTLINED_FUNCTION_67_16(v13);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_5_6();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0D0);
  OUTLINED_FUNCTION_21_23(v15, (uint64_t)&v63);
  OUTLINED_FUNCTION_67_16(v16);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_62_15(v18, v52);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0D8);
  OUTLINED_FUNCTION_21_23(v19, (uint64_t)&v62);
  OUTLINED_FUNCTION_67_16(v20);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_5_6();
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0E0);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v56 - 8));
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_5_6();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0E8);
  OUTLINED_FUNCTION_21_23(v23, (uint64_t)&v60);
  OUTLINED_FUNCTION_67_16(v24);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_63_15(v26, v53);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0F0);
  OUTLINED_FUNCTION_21_23(v27, (uint64_t)v59);
  OUTLINED_FUNCTION_67_16(v28);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_5_6();
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E0F8);
  OUTLINED_FUNCTION_67_16(*(_QWORD *)(v55 - 8));
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_5_6();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E100);
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_15_53();
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722E108);
  v33 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_4_9();
  v36 = v35 - v34;
  v37 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v37);
  sub_242C1EDE0();
  v38 = v61;
  sub_242C49448();
  if (v38)
  {
    v39 = (uint64_t)v60;
  }
  else
  {
    v61 = v33;
    v54 = v32;
    v40 = sub_242C49100();
    v41 = *(_QWORD *)(v40 + 16);
    if (v41)
    {
      v42 = *(unsigned __int8 *)(v40 + 32);
      sub_242C1F158(1, v41, v40, v40 + 32, 0, (2 * v41) | 1);
      v44 = v43;
      v46 = v45;
      swift_bridgeObjectRelease();
      if (v44 == v46 >> 1)
        __asm { BR              X9 }
    }
    v39 = (uint64_t)v60;
    v47 = v61;
    v48 = sub_242C48CD4();
    swift_allocError();
    v50 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257222A38);
    *v50 = &type metadata for ScalarType;
    sub_242C4907C();
    sub_242C48CC8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v48 - 8) + 104))(v50, *MEMORY[0x24BEE26D0], v48);
    swift_willThrow();
    OUTLINED_FUNCTION_2_11();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v36, v54);
  }
  __swift_destroy_boxed_opaque_existential_1(v39);
  OUTLINED_FUNCTION_0_9();
}

void sub_242C1EA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_24_50();
  sub_242C49070();
  if (v0)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18_54();
    JUMPOUT(0x242C1ED14);
  }
  v1 = OUTLINED_FUNCTION_5_73();
  OUTLINED_FUNCTION_13_63(v1, v2);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_18_54();
  JUMPOUT(0x242C1EDCCLL);
}

void sub_242C1EAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_35_33();
  OUTLINED_FUNCTION_0_92();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_5_73();
    v3(v2, *(_QWORD *)(v1 - 384));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_16_49();
    JUMPOUT(0x242C1EDC8);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_16_49();
  JUMPOUT(0x242C1ED10);
}

unint64_t sub_242C1EDE0()
{
  unint64_t result;

  result = qword_25722E030;
  if (!qword_25722E030)
  {
    result = MEMORY[0x2494EDE24](&unk_242C618CC, &type metadata for ScalarType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E030);
  }
  return result;
}

unint64_t sub_242C1EE1C()
{
  unint64_t result;

  result = qword_25722E038;
  if (!qword_25722E038)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6187C, &type metadata for ScalarType.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E038);
  }
  return result;
}

unint64_t sub_242C1EE58()
{
  unint64_t result;

  result = qword_25722E040;
  if (!qword_25722E040)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6182C, &type metadata for ScalarType.Float64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E040);
  }
  return result;
}

unint64_t sub_242C1EE94()
{
  unint64_t result;

  result = qword_25722E048;
  if (!qword_25722E048)
  {
    result = MEMORY[0x2494EDE24](&unk_242C617DC, &type metadata for ScalarType.Float32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E048);
  }
  return result;
}

unint64_t sub_242C1EED0()
{
  unint64_t result;

  result = qword_25722E050;
  if (!qword_25722E050)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6178C, &type metadata for ScalarType.Bfloat16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E050);
  }
  return result;
}

unint64_t sub_242C1EF0C()
{
  unint64_t result;

  result = qword_25722E058;
  if (!qword_25722E058)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6173C, &type metadata for ScalarType.Float16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E058);
  }
  return result;
}

unint64_t sub_242C1EF48()
{
  unint64_t result;

  result = qword_25722E060;
  if (!qword_25722E060)
  {
    result = MEMORY[0x2494EDE24](&unk_242C616EC, &type metadata for ScalarType.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E060);
  }
  return result;
}

unint64_t sub_242C1EF84()
{
  unint64_t result;

  result = qword_25722E068;
  if (!qword_25722E068)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6169C, &type metadata for ScalarType.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E068);
  }
  return result;
}

unint64_t sub_242C1EFC0()
{
  unint64_t result;

  result = qword_25722E070;
  if (!qword_25722E070)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6164C, &type metadata for ScalarType.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E070);
  }
  return result;
}

unint64_t sub_242C1EFFC()
{
  unint64_t result;

  result = qword_25722E078;
  if (!qword_25722E078)
  {
    result = MEMORY[0x2494EDE24](&unk_242C615FC, &type metadata for ScalarType.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E078);
  }
  return result;
}

unint64_t sub_242C1F038()
{
  unint64_t result;

  result = qword_25722E080;
  if (!qword_25722E080)
  {
    result = MEMORY[0x2494EDE24](&unk_242C615AC, &type metadata for ScalarType.Int64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E080);
  }
  return result;
}

unint64_t sub_242C1F074()
{
  unint64_t result;

  result = qword_25722E088;
  if (!qword_25722E088)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6155C, &type metadata for ScalarType.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E088);
  }
  return result;
}

unint64_t sub_242C1F0B0()
{
  unint64_t result;

  result = qword_25722E090;
  if (!qword_25722E090)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6150C, &type metadata for ScalarType.Int16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E090);
  }
  return result;
}

unint64_t sub_242C1F0EC()
{
  unint64_t result;

  result = qword_25722E098;
  if (!qword_25722E098)
  {
    result = MEMORY[0x2494EDE24](&unk_242C614BC, &type metadata for ScalarType.Int8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E098);
  }
  return result;
}

void sub_242C1F128(_QWORD *a1)
{
  ScalarType.init(from:)(a1);
}

void sub_242C1F13C(_QWORD *a1)
{
  ScalarType.encode(to:)(a1);
}

uint64_t sub_242C1F158(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_242C1F1D4()
{
  unint64_t result;

  result = qword_25722E110;
  if (!qword_25722E110)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for ScalarType, &type metadata for ScalarType);
    atomic_store(result, (unint64_t *)&qword_25722E110);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScalarType()
{
  return &type metadata for ScalarType;
}

uint64_t _s14NeuralNetworks10ScalarTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14NeuralNetworks10ScalarTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242C1F2FC + 4 * byte_242C60D9C[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_242C1F330 + 4 * byte_242C60D97[v4]))();
}

uint64_t sub_242C1F330(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C1F338(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C1F340);
  return result;
}

uint64_t sub_242C1F34C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C1F354);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_242C1F358(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C1F360(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ScalarType.CodingKeys()
{
  return &type metadata for ScalarType.CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Int8CodingKeys()
{
  return &type metadata for ScalarType.Int8CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Int16CodingKeys()
{
  return &type metadata for ScalarType.Int16CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Int32CodingKeys()
{
  return &type metadata for ScalarType.Int32CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Int64CodingKeys()
{
  return &type metadata for ScalarType.Int64CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Uint8CodingKeys()
{
  return &type metadata for ScalarType.Uint8CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Uint16CodingKeys()
{
  return &type metadata for ScalarType.Uint16CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Uint32CodingKeys()
{
  return &type metadata for ScalarType.Uint32CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Uint64CodingKeys()
{
  return &type metadata for ScalarType.Uint64CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Float16CodingKeys()
{
  return &type metadata for ScalarType.Float16CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Bfloat16CodingKeys()
{
  return &type metadata for ScalarType.Bfloat16CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Float32CodingKeys()
{
  return &type metadata for ScalarType.Float32CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.Float64CodingKeys()
{
  return &type metadata for ScalarType.Float64CodingKeys;
}

ValueMetadata *type metadata accessor for ScalarType.BoolCodingKeys()
{
  return &type metadata for ScalarType.BoolCodingKeys;
}

unint64_t sub_242C1F450()
{
  unint64_t result;

  result = qword_25722E118;
  if (!qword_25722E118)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61494, &type metadata for ScalarType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E118);
  }
  return result;
}

unint64_t sub_242C1F490()
{
  unint64_t result;

  result = qword_25722E120;
  if (!qword_25722E120)
  {
    result = MEMORY[0x2494EDE24](&unk_242C613B4, &type metadata for ScalarType.Int8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E120);
  }
  return result;
}

unint64_t sub_242C1F4D0()
{
  unint64_t result;

  result = qword_25722E128;
  if (!qword_25722E128)
  {
    result = MEMORY[0x2494EDE24](&unk_242C613DC, &type metadata for ScalarType.Int8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E128);
  }
  return result;
}

unint64_t sub_242C1F510()
{
  unint64_t result;

  result = qword_25722E130;
  if (!qword_25722E130)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61364, &type metadata for ScalarType.Int16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E130);
  }
  return result;
}

unint64_t sub_242C1F550()
{
  unint64_t result;

  result = qword_25722E138;
  if (!qword_25722E138)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6138C, &type metadata for ScalarType.Int16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E138);
  }
  return result;
}

unint64_t sub_242C1F590()
{
  unint64_t result;

  result = qword_25722E140;
  if (!qword_25722E140)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61314, &type metadata for ScalarType.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E140);
  }
  return result;
}

unint64_t sub_242C1F5D0()
{
  unint64_t result;

  result = qword_25722E148;
  if (!qword_25722E148)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6133C, &type metadata for ScalarType.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E148);
  }
  return result;
}

unint64_t sub_242C1F610()
{
  unint64_t result;

  result = qword_25722E150;
  if (!qword_25722E150)
  {
    result = MEMORY[0x2494EDE24](&unk_242C612C4, &type metadata for ScalarType.Int64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E150);
  }
  return result;
}

unint64_t sub_242C1F650()
{
  unint64_t result;

  result = qword_25722E158;
  if (!qword_25722E158)
  {
    result = MEMORY[0x2494EDE24](&unk_242C612EC, &type metadata for ScalarType.Int64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E158);
  }
  return result;
}

unint64_t sub_242C1F690()
{
  unint64_t result;

  result = qword_25722E160;
  if (!qword_25722E160)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61274, &type metadata for ScalarType.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E160);
  }
  return result;
}

unint64_t sub_242C1F6D0()
{
  unint64_t result;

  result = qword_25722E168;
  if (!qword_25722E168)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6129C, &type metadata for ScalarType.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E168);
  }
  return result;
}

unint64_t sub_242C1F710()
{
  unint64_t result;

  result = qword_25722E170;
  if (!qword_25722E170)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61224, &type metadata for ScalarType.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E170);
  }
  return result;
}

unint64_t sub_242C1F750()
{
  unint64_t result;

  result = qword_25722E178;
  if (!qword_25722E178)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6124C, &type metadata for ScalarType.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E178);
  }
  return result;
}

unint64_t sub_242C1F790()
{
  unint64_t result;

  result = qword_25722E180;
  if (!qword_25722E180)
  {
    result = MEMORY[0x2494EDE24](&unk_242C611D4, &type metadata for ScalarType.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E180);
  }
  return result;
}

unint64_t sub_242C1F7D0()
{
  unint64_t result;

  result = qword_25722E188;
  if (!qword_25722E188)
  {
    result = MEMORY[0x2494EDE24](&unk_242C611FC, &type metadata for ScalarType.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E188);
  }
  return result;
}

unint64_t sub_242C1F810()
{
  unint64_t result;

  result = qword_25722E190;
  if (!qword_25722E190)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61184, &type metadata for ScalarType.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E190);
  }
  return result;
}

unint64_t sub_242C1F850()
{
  unint64_t result;

  result = qword_25722E198;
  if (!qword_25722E198)
  {
    result = MEMORY[0x2494EDE24](&unk_242C611AC, &type metadata for ScalarType.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E198);
  }
  return result;
}

unint64_t sub_242C1F890()
{
  unint64_t result;

  result = qword_25722E1A0;
  if (!qword_25722E1A0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61134, &type metadata for ScalarType.Float16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1A0);
  }
  return result;
}

unint64_t sub_242C1F8D0()
{
  unint64_t result;

  result = qword_25722E1A8;
  if (!qword_25722E1A8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6115C, &type metadata for ScalarType.Float16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1A8);
  }
  return result;
}

unint64_t sub_242C1F910()
{
  unint64_t result;

  result = qword_25722E1B0;
  if (!qword_25722E1B0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C610E4, &type metadata for ScalarType.Bfloat16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1B0);
  }
  return result;
}

unint64_t sub_242C1F950()
{
  unint64_t result;

  result = qword_25722E1B8;
  if (!qword_25722E1B8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6110C, &type metadata for ScalarType.Bfloat16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1B8);
  }
  return result;
}

unint64_t sub_242C1F990()
{
  unint64_t result;

  result = qword_25722E1C0;
  if (!qword_25722E1C0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61094, &type metadata for ScalarType.Float32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1C0);
  }
  return result;
}

unint64_t sub_242C1F9D0()
{
  unint64_t result;

  result = qword_25722E1C8;
  if (!qword_25722E1C8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C610BC, &type metadata for ScalarType.Float32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1C8);
  }
  return result;
}

unint64_t sub_242C1FA10()
{
  unint64_t result;

  result = qword_25722E1D0;
  if (!qword_25722E1D0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61044, &type metadata for ScalarType.Float64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1D0);
  }
  return result;
}

unint64_t sub_242C1FA50()
{
  unint64_t result;

  result = qword_25722E1D8;
  if (!qword_25722E1D8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6106C, &type metadata for ScalarType.Float64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1D8);
  }
  return result;
}

unint64_t sub_242C1FA90()
{
  unint64_t result;

  result = qword_25722E1E0;
  if (!qword_25722E1E0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C60FF4, &type metadata for ScalarType.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1E0);
  }
  return result;
}

unint64_t sub_242C1FAD0()
{
  unint64_t result;

  result = qword_25722E1E8;
  if (!qword_25722E1E8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6101C, &type metadata for ScalarType.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1E8);
  }
  return result;
}

unint64_t sub_242C1FB10()
{
  unint64_t result;

  result = qword_25722E1F0;
  if (!qword_25722E1F0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C61404, &type metadata for ScalarType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1F0);
  }
  return result;
}

unint64_t sub_242C1FB50()
{
  unint64_t result;

  result = qword_25722E1F8;
  if (!qword_25722E1F8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C6142C, &type metadata for ScalarType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E1F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_92()
{
  return sub_242C49070();
}

uint64_t OUTLINED_FUNCTION_2_86()
{
  return sub_242C49118();
}

uint64_t OUTLINED_FUNCTION_5_73()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_76()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_9_71(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_13_63@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

uint64_t OUTLINED_FUNCTION_16_49()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_54()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_20_54()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 8;
  return sub_242C1EF0C();
}

unint64_t OUTLINED_FUNCTION_21_46()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 89) = 4;
  return sub_242C1EFFC();
}

unint64_t OUTLINED_FUNCTION_23_50()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 12;
  return sub_242C1EE1C();
}

unint64_t OUTLINED_FUNCTION_24_50()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 92) = 1;
  return sub_242C1F0B0();
}

unint64_t OUTLINED_FUNCTION_25_47()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 7;
  return sub_242C1EF48();
}

unint64_t OUTLINED_FUNCTION_26_49()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 90) = 3;
  return sub_242C1F038();
}

unint64_t OUTLINED_FUNCTION_28_51()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 11;
  return sub_242C1EE58();
}

unint64_t OUTLINED_FUNCTION_32_39()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 6;
  return sub_242C1EF84();
}

uint64_t OUTLINED_FUNCTION_33_39@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + 8 * a1);
}

unint64_t OUTLINED_FUNCTION_34_41()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 10;
  return sub_242C1EE94();
}

unint64_t OUTLINED_FUNCTION_35_33()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 91) = 2;
  return sub_242C1F074();
}

unint64_t OUTLINED_FUNCTION_36_35()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 5;
  return sub_242C1EFC0();
}

unint64_t OUTLINED_FUNCTION_37_37()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 9;
  return sub_242C1EED0();
}

void sub_242C1FCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ObjectType;
  void (*v54)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __n128 *v71;
  uint64_t v72;
  _QWORD v73[4];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  OUTLINED_FUNCTION_18_1();
  a19 = v23;
  a20 = v24;
  v85 = v21;
  v25 = v20;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_36_11();
  v31 = v29 - v30;
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_64_0();
  v87 = v33;
  v34 = OUTLINED_FUNCTION_28_39();
  v89 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_13_1();
  v86 = v36;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_64_0();
  v88 = v38;
  v39 = OUTLINED_FUNCTION_11_55();
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_58_0();
  v41 = sub_242B89308();
  sub_242A9E618(v41, v27);
  if (v42)
  {
    v44 = v42;
    v45 = v43;
    v74 = v34;
    v82 = v31;
    *(_QWORD *)v22 = 0;
    *(_QWORD *)(v22 + 8) = 0;
    v46 = 1;
    *(_BYTE *)(v22 + 16) = 1;
    *(int64x2_t *)(v22 + 24) = vdupq_n_s64(1uLL);
    v47 = *MEMORY[0x24BEDF568];
    v83 = v40;
    v84 = v39;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104))(v22, v47, v39);
    v48 = v25[6];
    v79 = v25[7];
    v80 = v48;
    v49 = v25[8];
    v77 = v25[9];
    v78 = v49;
    v50 = v25[10];
    v51 = v25[11];
    v52 = v25[12];
    v75 = v51;
    v76 = v50;
    if (*(_QWORD *)(v52 + 16) >= 2uLL)
      v46 = *(_QWORD *)(v52 + 32);
    v73[0] = v46;
    type metadata accessor for NativeTensorStorage();
    a10 = v52;
    ObjectType = swift_getObjectType();
    v54 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v45 + 8);
    v81 = v52;
    swift_bridgeObjectRetain_n();
    v73[2] = ObjectType;
    v73[3] = v44;
    v54(&v90, ObjectType, v45);
    OUTLINED_FUNCTION_25_48();
    sub_242B1D8D0(v55, v56, v57);
    v59 = v58;
    OUTLINED_FUNCTION_84_3(v58);
    OUTLINED_FUNCTION_1_7((uint64_t)&a10, v88);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v45 + 16))(&a10, ObjectType, v45);
    v60 = v86;
    OUTLINED_FUNCTION_1_7((uint64_t)&a10, v86);
    v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16);
    v61(v87, v86, v74);
    OUTLINED_FUNCTION_4_21(v87);
    v62 = v82;
    v61(v82, v88, v74);
    v63 = OUTLINED_FUNCTION_4_21(v82);
    v73[1] = v73;
    MEMORY[0x24BDAC7A8](v63);
    v64 = v80;
    v73[-8] = v22;
    v73[-7] = v64;
    v65 = v78;
    v73[-6] = v79;
    v73[-5] = v65;
    v66 = v76;
    v73[-4] = v77;
    v73[-3] = v66;
    v67 = v73[0];
    v73[-2] = v75;
    v73[-1] = v67;
    MEMORY[0x24BDAC7A8](v68);
    v73[-6] = v59;
    v73[-5] = &off_251387678;
    v73[-4] = v62;
    v73[-3] = sub_242C213B4;
    OUTLINED_FUNCTION_42_15((uint64_t)v73);
    v69 = v85;
    sub_242BF6310((uint64_t)sub_242AA785C, (uint64_t)&v73[-8], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE4AE0]);
    if (v69)
    {
      OUTLINED_FUNCTION_23_5();
      OUTLINED_FUNCTION_22_50();
      OUTLINED_FUNCTION_52_3();
      OUTLINED_FUNCTION_9_72(v60);
      OUTLINED_FUNCTION_9_72(v88);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_33_40();
    }
    else
    {
      swift_release();
      OUTLINED_FUNCTION_22_50();
      OUTLINED_FUNCTION_52_3();
      OUTLINED_FUNCTION_9_72(v60);
      OUTLINED_FUNCTION_9_72(v88);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_33_40();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v72 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v72 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v72 + 32) = v59;
      *(_QWORD *)(v72 + 40) = &off_251387678;
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_242A6A5B0();
    v70 = OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_0_30((__n128)xmmword_242C61980, v70, v71);
  }
  OUTLINED_FUNCTION_15_54();
  OUTLINED_FUNCTION_0_9();
}

#error "242C200C4: call analysis failed (funcsize=5)"

void sub_242C200D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __n128 *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[15];

  OUTLINED_FUNCTION_18_1();
  a19 = v23;
  a20 = v24;
  v108 = v21;
  v25 = v20;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_36_11();
  v31 = v29 - v30;
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v91 - v33;
  MEMORY[0x24BDAC7A8](v35);
  v109 = (uint64_t)&v91 - v36;
  v37 = OUTLINED_FUNCTION_28_39();
  v112 = *(_QWORD *)(v37 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v38);
  v110 = (uint64_t)&v91 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v40);
  v111 = (uint64_t)&v91 - v41;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_64_0();
  v113 = v43;
  v44 = OUTLINED_FUNCTION_11_55();
  v114 = *(_QWORD *)(v44 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_58_0();
  v46 = sub_242B89308();
  sub_242A9E618(v46, v27);
  if (!v47)
    goto LABEL_9;
  v49 = v48;
  v107 = v47;
  v104 = v34;
  v50 = sub_242B89308();
  sub_242A9E618(v50, v27);
  if (!v51)
  {
    swift_unknownObjectRelease();
LABEL_9:
    sub_242A6A5B0();
    v88 = OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_0_30((__n128)xmmword_242C61990, v88, v89);
    goto LABEL_10;
  }
  v53 = v51;
  v54 = v52;
  v103 = v31;
  v105 = v49;
  *(_QWORD *)v22 = 0;
  *(_QWORD *)(v22 + 8) = 0;
  v55 = 1;
  *(_BYTE *)(v22 + 16) = 1;
  *(int64x2_t *)(v22 + 24) = vdupq_n_s64(1uLL);
  v56 = *MEMORY[0x24BEDF568];
  v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v114 + 104);
  v95 = v22;
  v57(v22, v56, v44);
  v101 = v20[6];
  v100 = v20[7];
  v99 = v20[8];
  v98 = v20[9];
  v97 = v20[10];
  v58 = v20[12];
  v96 = v25[11];
  v59 = OUTLINED_FUNCTION_39_35();
  sub_242C480E0();
  sub_242BC8254(v59, v54, v60);
  if (v61 > 1)
  {
    OUTLINED_FUNCTION_40_41();
    if (!*(_QWORD *)(a10 + 16))
    {
      OUTLINED_FUNCTION_5_24();
      OUTLINED_FUNCTION_10_16();
    }
    v55 = *(_QWORD *)(a10 + 32);
    swift_bridgeObjectRelease();
  }
  v93 = v55;
  OUTLINED_FUNCTION_26_50();
  v115[0] = v58;
  v62 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v54 + 8);
  v102 = v58;
  sub_242C480E0();
  v62(&a10, v59, v54);
  OUTLINED_FUNCTION_25_48();
  v63 = v108;
  sub_242B1D8D0(v64, v65, v66);
  v68 = v67;
  v92 = v67;
  v108 = v63;
  v106 = v53;
  v94 = OUTLINED_FUNCTION_39_35();
  (*(void (**)(_QWORD *__return_ptr))(v105 + 16))(v115);
  v69 = v113;
  OUTLINED_FUNCTION_1_7((uint64_t)v115, v113);
  OUTLINED_FUNCTION_40_41();
  v70 = v111;
  OUTLINED_FUNCTION_1_7((uint64_t)v115, v111);
  v115[0] = *(_QWORD *)(v68 + 16);
  sub_242C480E0();
  v71 = v110;
  OUTLINED_FUNCTION_1_7((uint64_t)v115, v110);
  v72 = v109;
  OUTLINED_FUNCTION_5_7(v109, v69);
  OUTLINED_FUNCTION_0_10(v72);
  v73 = (uint64_t)v104;
  OUTLINED_FUNCTION_5_7((uint64_t)v104, v70);
  OUTLINED_FUNCTION_0_10(v73);
  v74 = v103;
  OUTLINED_FUNCTION_5_7(v103, v71);
  v75 = __swift_storeEnumTagSinglePayload(v74, 0, 1, v37);
  v91 = (uint64_t)&v91;
  MEMORY[0x24BDAC7A8](v75);
  v76 = v95;
  *(&v91 - 10) = v69;
  *(&v91 - 9) = v76;
  OUTLINED_FUNCTION_43_33();
  *(_QWORD *)(v77 - 64) = v79;
  *(_QWORD *)(v77 - 56) = v78;
  OUTLINED_FUNCTION_42_33();
  *(_QWORD *)(v80 - 48) = v82;
  *(_QWORD *)(v80 - 40) = v81;
  v83 = v96;
  *(_QWORD *)(v80 - 32) = v97;
  *(_QWORD *)(v80 - 24) = v83;
  *(_QWORD *)(v80 - 16) = v93;
  MEMORY[0x24BDAC7A8](v84);
  *(&v91 - 8) = v106;
  *(&v91 - 7) = v54;
  v85 = v92;
  *(&v91 - 6) = v73;
  *(&v91 - 5) = v85;
  *(&v91 - 4) = (uint64_t)&off_251387678;
  *(&v91 - 3) = v74;
  *(&v91 - 2) = (uint64_t)sub_242C2169C;
  *(&v91 - 1) = v86;
  swift_retain();
  v87 = v108;
  sub_242BF6310((uint64_t)sub_242AA4900, (uint64_t)(&v91 - 10), MEMORY[0x24BEE4AE0] + 8, (uint64_t)&a16);
  if (v87)
  {
    OUTLINED_FUNCTION_23_5();
    OUTLINED_FUNCTION_5_74();
    sub_242A6AB60(v73);
    sub_242A6AB60(v72);
    OUTLINED_FUNCTION_3_77();
    OUTLINED_FUNCTION_6_6(v111);
    OUTLINED_FUNCTION_6_6(v113);
    OUTLINED_FUNCTION_122_8();
    OUTLINED_FUNCTION_46_5();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_19_43();
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_5_74();
    sub_242A6AB60(v73);
    sub_242A6AB60(v72);
    OUTLINED_FUNCTION_3_77();
    OUTLINED_FUNCTION_6_6(v111);
    OUTLINED_FUNCTION_6_6(v113);
    OUTLINED_FUNCTION_122_8();
    OUTLINED_FUNCTION_19_43();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v90 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v90 + 16) = xmmword_242C4B7D0;
    *(_QWORD *)(v90 + 32) = v85;
    *(_QWORD *)(v90 + 40) = &off_251387678;
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_46_5();
  }
LABEL_10:
  OUTLINED_FUNCTION_15_54();
  OUTLINED_FUNCTION_0_9();
}

#error "242C20684: call analysis failed (funcsize=5)"

void sub_242C20690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(_BYTE *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __n128 *v57;
  uint64_t v58;
  uint64_t ObjectType;
  void (*v60)(char *__return_ptr, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(void);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  char v94;

  OUTLINED_FUNCTION_18_1();
  a19 = v22;
  a20 = v23;
  v89 = v21;
  v25 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_36_11();
  v29 = v27 - v28;
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_64_0();
  v88 = v31;
  v32 = OUTLINED_FUNCTION_28_39();
  v93 = *(_QWORD *)(v32 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_13_1();
  v90 = v34;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_64_0();
  v92 = v36;
  v37 = OUTLINED_FUNCTION_11_55();
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)v78 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_242B89308();
  sub_242A9E618(v41, v25);
  if (v43)
  {
    v44 = v42;
    *v40 = *(_BYTE *)(v20 + 192);
    v45 = *MEMORY[0x24BEDF570];
    v46 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v38 + 104);
    v91 = v40;
    v46(v40, v45, v37);
    v47 = *(_QWORD *)(v20 + 48);
    v48 = *(_QWORD *)(v20 + 56);
    v49 = *(_QWORD *)(v20 + 64);
    v50 = *(_QWORD *)(v20 + 72);
    v51 = *(_QWORD *)(v20 + 80);
    v52 = *(_QWORD *)(v20 + 88);
    v53 = *(_QWORD *)(v20 + 96);
    v54 = *(_QWORD *)(v53 + 16);
    v86 = v38;
    v87 = v37;
    v84 = v47;
    v85 = v29;
    v82 = v49;
    v83 = v48;
    v80 = v51;
    v81 = v50;
    v79 = v52;
    if (v54 < 2)
      v55 = 1;
    else
      v55 = *(_QWORD *)(v53 + 32);
    v78[0] = v55;
    v58 = v88;
    type metadata accessor for NativeTensorStorage();
    a10 = v53;
    ObjectType = swift_getObjectType();
    v60 = *(void (**)(char *__return_ptr, uint64_t, uint64_t))(v44 + 8);
    swift_bridgeObjectRetain_n();
    v88 = v53;
    v60(&v94, ObjectType, v44);
    OUTLINED_FUNCTION_25_48();
    v61 = v89;
    sub_242B1D8D0(v62, v63, v64);
    v66 = v65;
    v89 = v61;
    OUTLINED_FUNCTION_84_3(v65);
    OUTLINED_FUNCTION_1_7((uint64_t)&a10, v92);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v44 + 16))(&a10, ObjectType, v44);
    v67 = v90;
    OUTLINED_FUNCTION_1_7((uint64_t)&a10, v90);
    v68 = *(void (**)(void))(v93 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v68)(v58, v67, v32);
    OUTLINED_FUNCTION_2_72(v58);
    v69 = v85;
    v68();
    v70 = OUTLINED_FUNCTION_2_72(v69);
    v78[1] = v78;
    MEMORY[0x24BDAC7A8](v70);
    v71 = v84;
    v78[-8] = v91;
    v78[-7] = v71;
    v72 = v82;
    v78[-6] = v83;
    v78[-5] = v72;
    v73 = v80;
    v78[-4] = v81;
    v78[-3] = v73;
    v74 = v78[0];
    v78[-2] = v79;
    v78[-1] = v74;
    MEMORY[0x24BDAC7A8](v75);
    v78[-6] = v66;
    v78[-5] = &off_251387678;
    v78[-4] = v69;
    v78[-3] = sub_242C213B4;
    OUTLINED_FUNCTION_42_15((uint64_t)v78);
    v76 = v89;
    sub_242BF6310((uint64_t)sub_242AA785C, (uint64_t)&v78[-8], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE4AE0]);
    if (v76)
    {
      OUTLINED_FUNCTION_23_5();
      OUTLINED_FUNCTION_52_3();
      sub_242A6AB60(v58);
      OUTLINED_FUNCTION_9_72(v67);
      OUTLINED_FUNCTION_9_72(v92);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_32_40();
    }
    else
    {
      swift_release();
      OUTLINED_FUNCTION_52_3();
      sub_242A6AB60(v58);
      OUTLINED_FUNCTION_9_72(v67);
      OUTLINED_FUNCTION_9_72(v92);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32_40();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v77 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v77 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v77 + 32) = v66;
      *(_QWORD *)(v77 + 40) = &off_251387678;
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_242A6A5B0();
    v56 = OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_0_30((__n128)xmmword_242C619A0, v56, v57);
  }
  OUTLINED_FUNCTION_15_54();
  OUTLINED_FUNCTION_0_9();
}

#error "242C20A90: call analysis failed (funcsize=5)"

void sub_242C20A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __n128 *v61;
  void (*v62)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[2];
  uint64_t v88;
  uint64_t v89;
  uint64_t ObjectType;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  uint64_t v109;
  uint64_t v110[12];
  uint64_t v111;

  OUTLINED_FUNCTION_18_1();
  a19 = v22;
  a20 = v23;
  v24 = v21;
  v25 = v20;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_36_11();
  v31 = v29 - v30;
  MEMORY[0x24BDAC7A8](v32);
  v102 = (uint64_t)v87 - v33;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)v87 - v35;
  v37 = sub_242C47930();
  v107 = *(_QWORD *)(v37 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v38);
  v105 = (uint64_t)v87 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v40);
  v106 = (uint64_t)v87 - v41;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v42);
  v104 = (uint64_t)v87 - v43;
  v44 = OUTLINED_FUNCTION_11_55();
  v109 = *(_QWORD *)(v44 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v45);
  v108 = (char *)v87 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_242B89308();
  sub_242A9E618(v47, v27);
  if (!v48)
    goto LABEL_7;
  v50 = v48;
  v103 = v49;
  v100 = v36;
  v51 = sub_242B89308();
  sub_242A9E618(v51, v27);
  if (!v52)
  {
    OUTLINED_FUNCTION_37_38();
LABEL_7:
    sub_242A6A5B0();
    v60 = OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_0_30((__n128)xmmword_242C619B0, v60, v61);
    goto LABEL_11;
  }
  v54 = v52;
  v55 = v53;
  v101 = v50;
  *v108 = *(_BYTE *)(v20 + 184);
  (*(void (**)(void))(v109 + 104))();
  v98 = *(_QWORD *)(v20 + 48);
  v97 = *(_QWORD *)(v20 + 56);
  v96 = *(_QWORD *)(v20 + 64);
  v95 = *(_QWORD *)(v20 + 72);
  v94 = *(_QWORD *)(v20 + 80);
  v56 = *(_QWORD *)(v20 + 96);
  v93 = *(_QWORD *)(v25 + 88);
  v57 = OUTLINED_FUNCTION_39_35();
  sub_242C480E0();
  sub_242BC8254(v57, v55, v58);
  v99 = v44;
  if (v59 <= 1)
  {
    v92 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_23_51();
    if (!*(_QWORD *)(a10 + 16))
    {
      OUTLINED_FUNCTION_5_24();
      OUTLINED_FUNCTION_10_16();
    }
    v92 = *(_QWORD *)(a10 + 32);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_26_50();
  v110[0] = v56;
  v62 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v55 + 8);
  sub_242C480E0();
  v62(&a10, v57, v55);
  v63 = v24;
  sub_242B1D8D0(v110, (uint64_t)&a10, 0);
  v65 = v64;
  v88 = v64;
  v91 = v63;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr))(v103 + 16))(v110);
  v66 = v104;
  OUTLINED_FUNCTION_1_7((uint64_t)v110, v104);
  OUTLINED_FUNCTION_23_51();
  v89 = v55;
  v67 = v106;
  OUTLINED_FUNCTION_1_7((uint64_t)v110, v106);
  v110[0] = *(_QWORD *)(v65 + 16);
  sub_242C480E0();
  v68 = v105;
  OUTLINED_FUNCTION_1_7((uint64_t)v110, v105);
  v69 = (uint64_t)v100;
  OUTLINED_FUNCTION_5_7((uint64_t)v100, v66);
  OUTLINED_FUNCTION_0_10(v69);
  v70 = v102;
  OUTLINED_FUNCTION_5_7(v102, v67);
  OUTLINED_FUNCTION_0_10(v70);
  OUTLINED_FUNCTION_5_7(v31, v68);
  v71 = __swift_storeEnumTagSinglePayload(v31, 0, 1, v37);
  v87[1] = v87;
  MEMORY[0x24BDAC7A8](v71);
  v72 = v108;
  v87[-10] = v66;
  v87[-9] = v72;
  v73 = v97;
  v87[-8] = v98;
  v87[-7] = v73;
  OUTLINED_FUNCTION_43_33();
  *(_QWORD *)(v74 - 48) = v76;
  *(_QWORD *)(v74 - 40) = v75;
  OUTLINED_FUNCTION_42_33();
  *(_QWORD *)(v77 - 32) = v79;
  *(_QWORD *)(v77 - 24) = v78;
  *(_QWORD *)(v77 - 16) = v92;
  MEMORY[0x24BDAC7A8](v80);
  v81 = v89;
  v87[-8] = v54;
  v87[-7] = v81;
  v82 = v88;
  v87[-6] = v70;
  v87[-5] = v82;
  v87[-4] = &off_251387678;
  v87[-3] = v31;
  v87[-2] = sub_242C2169C;
  v87[-1] = v83;
  v84 = v82;
  swift_retain();
  v85 = v91;
  sub_242BF6310((uint64_t)sub_242AA4900, (uint64_t)&v87[-10], MEMORY[0x24BEE4AE0] + 8, (uint64_t)&v111);
  if (v85)
  {
    OUTLINED_FUNCTION_23_5();
    OUTLINED_FUNCTION_5_74();
    OUTLINED_FUNCTION_52_3();
    sub_242A6AB60(v69);
    OUTLINED_FUNCTION_3_77();
    OUTLINED_FUNCTION_6_6(v106);
    OUTLINED_FUNCTION_6_6(v104);
    OUTLINED_FUNCTION_122_8();
    OUTLINED_FUNCTION_37_38();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_20_55();
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_5_74();
    OUTLINED_FUNCTION_52_3();
    sub_242A6AB60(v69);
    OUTLINED_FUNCTION_3_77();
    OUTLINED_FUNCTION_6_6(v106);
    OUTLINED_FUNCTION_6_6(v104);
    OUTLINED_FUNCTION_122_8();
    OUTLINED_FUNCTION_20_55();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v86 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v86 + 16) = xmmword_242C4B7D0;
    *(_QWORD *)(v86 + 32) = v84;
    *(_QWORD *)(v86 + 40) = &off_251387678;
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_37_38();
  }
LABEL_11:
  OUTLINED_FUNCTION_15_54();
  OUTLINED_FUNCTION_0_9();
}

#error "242C21048: call analysis failed (funcsize=5)"

uint64_t sub_242C21054(uint64_t a1)
{
  uint64_t result;

  result = sub_242C21124(&qword_257221F00, (uint64_t (*)(uint64_t))type metadata accessor for Average2DPoolGradientOperation);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C21088(uint64_t a1)
{
  uint64_t result;

  result = sub_242C21124(&qword_257221F08, (uint64_t (*)(uint64_t))type metadata accessor for Average2DPoolOperation);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C210BC(uint64_t a1)
{
  uint64_t result;

  result = sub_242C21124(&qword_257221EF0, (uint64_t (*)(uint64_t))type metadata accessor for Max2DPoolGradientOperation);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C210F0(uint64_t a1)
{
  uint64_t result;

  result = sub_242C21124(&qword_257221EF8, (uint64_t (*)(uint64_t))type metadata accessor for Max2DPoolOperation);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C21124(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = a2(255);
    result = MEMORY[0x2494EDE24](&unk_242C5367C, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242C21164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[192];
  uint64_t v37;

  v31 = a8;
  v37 = a7;
  v32 = a6;
  v33 = a4;
  v34 = a5;
  v25 = a3;
  v27 = a2;
  v28 = a1;
  v29 = a9;
  v30 = sub_242C477D4();
  v9 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v11 = (uint64_t *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_242C477C8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_242C47630();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_242C476C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v25, v16);
  sub_242AA3BBC(v36);
  sub_242AB0920((uint64_t)v36, (uint64_t)&v35);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEDF7E0], v12);
  v20 = v30;
  v21 = v31;
  *v11 = v29;
  v11[1] = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEDF7F0], v20);
  sub_242C48A28();
  sub_242C489B0();
  if (sub_242C476A8())
  {
    sub_242C476B4();
    return swift_release();
  }
  else
  {
    sub_242A6A5B0();
    swift_allocError();
    *(_OWORD *)v23 = xmmword_242C619C0;
    *(_BYTE *)(v23 + 16) = 4;
    return swift_willThrow();
  }
}

uint64_t sub_242C213B4(uint64_t a1, uint64_t a2)
{
  return sub_242C216B0(a1, a2);
}

uint64_t sub_242C213C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[192];
  uint64_t v43;

  v39 = a8;
  v43 = a7;
  v40 = a6;
  v32 = a2;
  v33 = a5;
  v30 = a4;
  v29[2] = a3;
  v38 = a9;
  v37 = a10;
  v35 = a11;
  v36 = sub_242C477D4();
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v13 = (_QWORD *)((char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v31 = sub_242C477C8();
  v14 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_242C47630();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_242C47930();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v29[1] = a1;
  (*(void (**)(char *, uint64_t, __n128))(v24 + 16))((char *)v29 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v22);
  sub_242C489C8();
  sub_242C476C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v33, v17);
  sub_242AA3BBC(v42);
  sub_242AB0920((uint64_t)v42, (uint64_t)&v41);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BEDF7E0], v31);
  v25 = v36;
  v26 = v37;
  *v13 = v35;
  v13[1] = v26;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v34 + 104))(v13, *MEMORY[0x24BEDF7F0], v25);
  sub_242C48A28();
  sub_242C489B0();
  if (sub_242C476A8())
  {
    sub_242C4769C();
    return swift_release();
  }
  else
  {
    sub_242A6A5B0();
    swift_allocError();
    *(_OWORD *)v28 = xmmword_242C619D0;
    *(_BYTE *)(v28 + 16) = 4;
    return swift_willThrow();
  }
}

uint64_t sub_242C2169C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_242C216E0(a1, a2, a3);
}

uint64_t sub_242C216B0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_242C21164(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8]);
}

uint64_t sub_242C216E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_242C213C8(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9]);
}

uint64_t OUTLINED_FUNCTION_3_77()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 224) + 8))(*(_QWORD *)(v1 - 240), v0);
}

uint64_t OUTLINED_FUNCTION_5_74()
{
  uint64_t v0;

  return sub_242A6AB60(v0);
}

uint64_t OUTLINED_FUNCTION_9_72(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_55()
{
  return sub_242C47630();
}

uint64_t OUTLINED_FUNCTION_15_54()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19_43()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 208) + 8))(v0, *(_QWORD *)(v1 - 296));
}

uint64_t OUTLINED_FUNCTION_20_55()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 208) + 8))(v0, *(_QWORD *)(v1 - 288));
}

uint64_t OUTLINED_FUNCTION_22_50()
{
  uint64_t v0;

  return sub_242A6AB60(v0);
}

uint64_t OUTLINED_FUNCTION_23_51()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_26_50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 296) = v0;
  return type metadata accessor for NativeTensorStorage();
}

uint64_t OUTLINED_FUNCTION_32_40()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 152) + 8))(*(_QWORD *)(v0 - 112), *(_QWORD *)(v0 - 144));
}

uint64_t OUTLINED_FUNCTION_33_40()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 152) + 8))(v0, *(_QWORD *)(v1 - 144));
}

uint64_t OUTLINED_FUNCTION_37_38()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_35()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_40_41()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t BFloat16.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t result;
  _WORD v9[8];

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_32_41((uint64_t)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  sub_242A77290();
  sub_242C48050();
  v7 = v9[7];
  result = OUTLINED_FUNCTION_7_24(a1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  *a3 = v7;
  return result;
}

uint64_t BFloat16.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X3>, _WORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  float v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t result;
  _DWORD v15[4];

  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_32_41((uint64_t)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  if (sub_242C48B30() < 65)
  {
    v11 = sub_242C48B3C();
    v12 = sub_242C48B24();
    OUTLINED_FUNCTION_21_47();
    if ((v11 & 1) != 0)
      v10 = (float)v12;
    else
      v10 = (float)(unint64_t)v12;
  }
  else
  {
    sub_242A77290();
    sub_242B4E430();
    sub_242C48068();
    OUTLINED_FUNCTION_21_47();
    v10 = *(float *)&v15[3];
  }
  v13 = HIWORD(LODWORD(v10));
  result = a3(a1, a2);
  *a4 = v13;
  return result;
}

void sub_242C21A14()
{
  __asm { BR              X10 }
}

void sub_242C21A4C()
{
  OUTLINED_FUNCTION_1_0();
}

uint64_t static TensorScalarKind.allCases.getter()
{
  uint64_t v0;
  unint64_t v1;
  char *v2;
  char v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v0 = 4;
  OUTLINED_FUNCTION_6_77();
  v1 = *(_QWORD *)(v20 + 16);
  v2 = &byte_25137E280;
  do
  {
    v4 = *v2++;
    v3 = v4;
    if (v1 >= *(_QWORD *)(v20 + 24) >> 1)
      sub_242AC3E1C();
    *(_QWORD *)(v20 + 16) = v1 + 1;
    *(_BYTE *)(v20 + v1++ + 32) = v3;
    --v0;
  }
  while (v0);
  swift_bridgeObjectRelease();
  v5 = 4;
  OUTLINED_FUNCTION_6_77();
  v6 = *(_QWORD *)(v20 + 16);
  v7 = &byte_25137E2A8;
  do
  {
    v9 = *v7++;
    v8 = v9;
    if (v6 >= *(_QWORD *)(v20 + 24) >> 1)
      OUTLINED_FUNCTION_11_56();
    *(_QWORD *)(v20 + 16) = v6 + 1;
    *(_BYTE *)(v20 + v6++ + 32) = v8 | 0x40;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_49();
  v10 = 4;
  OUTLINED_FUNCTION_6_77();
  v11 = *(_QWORD *)(v20 + 16);
  v12 = &byte_25137E2D0;
  do
  {
    v14 = *v12++;
    v13 = v14;
    if (v11 >= *(_QWORD *)(v20 + 24) >> 1)
      OUTLINED_FUNCTION_11_56();
    *(_QWORD *)(v20 + 16) = v11 + 1;
    *(_BYTE *)(v20 + v11++ + 32) = v13 | 0x80;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_49();
  v15 = v20;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_34_42();
    v15 = v18;
  }
  v16 = *(_QWORD *)(v15 + 16);
  if (v16 >= *(_QWORD *)(v15 + 24) >> 1)
  {
    OUTLINED_FUNCTION_34_42();
    v15 = v19;
  }
  *(_QWORD *)(v15 + 16) = v16 + 1;
  *(_BYTE *)(v15 + v16 + 32) = -64;
  return v15;
}

void *static TensorSignedIntegerScalarKind.allCases.getter()
{
  return &unk_25137E260;
}

void *static TensorUnsignedIntegerScalarKind.allCases.getter()
{
  return &unk_25137E288;
}

void *static TensorFloatingPointScalarKind.allCases.getter()
{
  return &unk_25137E2B0;
}

void static TensorScalarKind.int8.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static TensorScalarKind.int16.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.int32.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.int64.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.uint8.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.uint16.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.uint32.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.uint64.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.float16.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.bfloat16.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.float.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorFloatingPointScalarKind.float32.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorScalarKind.double.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static TensorFloatingPointScalarKind.float64.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void TensorScalarKind.type.getter()
{
  __asm { BR              X11 }
}

void sub_242C21E74()
{
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_242C21EB8@<X0>(char a1@<W8>)
{
  return ((uint64_t (*)(_UNKNOWN **))((char *)&loc_242C21EA8 + 4 * byte_242C61A61[a1 & 0x3F]))(&protocol witness table for Float16);
}

void sub_242C21EE4()
{
  sub_242C256B0();
  JUMPOUT(0x242C21EA8);
}

void sub_242C21EF4()
{
  JUMPOUT(0x242C21EA8);
}

void sub_242C21F08()
{
  JUMPOUT(0x242C21EA8);
}

uint64_t TensorSignedIntegerScalarKind.type.getter()
{
  char *v0;

  return qword_251393128[*v0];
}

uint64_t TensorUnsignedIntegerScalarKind.type.getter()
{
  char *v0;

  return qword_251393168[*v0];
}

void TensorFloatingPointScalarKind.type.getter()
{
  __asm { BR              X10 }
}

void sub_242C21F94()
{
  sub_242C256B0();
  OUTLINED_FUNCTION_1_0();
}

uint64_t TensorScalarKind.size.getter()
{
  uint64_t v0;

  TensorScalarKind.type.getter();
  return *(_QWORD *)(*(_QWORD *)(v0 - 8) + 64);
}

uint64_t TensorScalarKind.stride.getter()
{
  uint64_t v0;

  TensorScalarKind.type.getter();
  return *(_QWORD *)(*(_QWORD *)(v0 - 8) + 72);
}

uint64_t TensorScalarKind.alignment.getter()
{
  uint64_t v0;

  TensorScalarKind.type.getter();
  return *(unsigned __int8 *)(*(_QWORD *)(v0 - 8) + 80) + 1;
}

uint64_t sub_242C22030(unsigned __int8 *a1)
{
  return sub_242B3F6A4(*a1);
}

void sub_242C2203C()
{
  char *v0;

  sub_242C44BDC(*v0);
}

void sub_242C22044(uint64_t a1)
{
  char *v1;

  sub_242A5CAB0(a1, *v1);
}

void sub_242C2204C(uint64_t a1)
{
  char *v1;

  sub_242BA9208(a1, *v1);
}

uint64_t sub_242C22054@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static TensorScalarKind.allCases.getter();
  *a1 = result;
  return result;
}

uint64_t TensorScalarKind.isCastable(to:)(unsigned __int8 *a1)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_242C220A0 + 4 * byte_242C61A69[*a1 >> 6]))(1);
}

BOOL sub_242C220A0@<W0>(char a1@<W8>)
{
  return (a1 & 0xC0) != 128;
}

BOOL sub_242C220B0@<W0>(int a1@<W8>)
{
  return a1 == 192;
}

uint64_t TensorScalarKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)())((char *)sub_242C220E0 + 4 * byte_242C61A6D[*v0 >> 6]))();
}

uint64_t sub_242C220E0()
{
  unsigned int v0;

  return v0;
}

uint64_t TensorSignedIntegerScalarKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t TensorUnsignedIntegerScalarKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 4;
}

uint64_t TensorFloatingPointScalarKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 8;
}

unint64_t TensorScalarKind.init(rawValue:)@<X0>(unint64_t result@<X0>, _BYTE *a2@<X8>)
{
  if (result >= 4)
  {
    if ((result & 0xFFFFFFFFFFFFFFFCLL) == 8)
    {
      if (result - 8 < 4)
      {
        result = (result - 8) | 0xFFFFFF80;
        goto LABEL_11;
      }
    }
    else if ((result & 0xFFFFFFFFFFFFFFFCLL) == 4)
    {
      if (result < 8)
      {
        result = 0x43424140FCFCFCFCuLL >> (8 * result);
        goto LABEL_11;
      }
    }
    else if (result == 12)
    {
      result = 192;
      goto LABEL_11;
    }
    result = 252;
  }
LABEL_11:
  *a2 = result;
  return result;
}

NeuralNetworks::TensorSignedIntegerScalarKind_optional __swiftcall TensorSignedIntegerScalarKind.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (NeuralNetworks::TensorSignedIntegerScalarKind_optional)rawValue;
}

NeuralNetworks::TensorUnsignedIntegerScalarKind_optional __swiftcall TensorUnsignedIntegerScalarKind.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  NeuralNetworks::TensorUnsignedIntegerScalarKind_optional result;

  OUTLINED_FUNCTION_108_6(v1);
  return result;
}

NeuralNetworks::TensorFloatingPointScalarKind_optional __swiftcall TensorFloatingPointScalarKind.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = rawValue - 8;
  if ((unint64_t)(rawValue - 8) >= 4)
    v2 = 4;
  *v1 = v2;
  return (NeuralNetworks::TensorFloatingPointScalarKind_optional)rawValue;
}

unint64_t sub_242C221E0@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return TensorScalarKind.init(rawValue:)(*a1, a2);
}

void sub_242C221E8(uint64_t *a1@<X8>)
{
  *a1 = TensorScalarKind.rawValue.getter();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_242C22208()
{
  sub_242C26084();
  return sub_242C48524();
}

uint64_t sub_242C22264()
{
  sub_242C26084();
  return sub_242C484F4();
}

NeuralNetworks::TensorSignedIntegerScalarKind_optional sub_242C222B0(Swift::Int *a1)
{
  return TensorSignedIntegerScalarKind.init(rawValue:)(*a1);
}

void sub_242C222B8(uint64_t *a1@<X8>)
{
  *a1 = TensorSignedIntegerScalarKind.rawValue.getter();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_242C222D8()
{
  sub_242C26048();
  return sub_242C48524();
}

uint64_t sub_242C22334()
{
  sub_242C26048();
  return sub_242C484F4();
}

void sub_242C22380(_QWORD *a1@<X8>)
{
  *a1 = &unk_25137E260;
}

NeuralNetworks::TensorUnsignedIntegerScalarKind_optional sub_242C22390(Swift::Int *a1)
{
  return TensorUnsignedIntegerScalarKind.init(rawValue:)(*a1);
}

void sub_242C22398(uint64_t *a1@<X8>)
{
  *a1 = TensorUnsignedIntegerScalarKind.rawValue.getter();
  OUTLINED_FUNCTION_1_0();
}

void sub_242C223B8()
{
  sub_242C44BE8();
}

void sub_242C223C0()
{
  sub_242A5C5A4();
}

void sub_242C223C8()
{
  sub_242BA8F48();
}

uint64_t sub_242C223D0()
{
  sub_242C2600C();
  return sub_242C48524();
}

uint64_t sub_242C2242C()
{
  sub_242C2600C();
  return sub_242C484F4();
}

void sub_242C22478(_QWORD *a1@<X8>)
{
  *a1 = &unk_25137E288;
}

NeuralNetworks::TensorFloatingPointScalarKind_optional sub_242C22488(Swift::Int *a1)
{
  return TensorFloatingPointScalarKind.init(rawValue:)(*a1);
}

void sub_242C22490(uint64_t *a1@<X8>)
{
  *a1 = TensorFloatingPointScalarKind.rawValue.getter();
  OUTLINED_FUNCTION_1_0();
}

void sub_242C224B0()
{
  sub_242C44C18();
}

void sub_242C224B8()
{
  sub_242A5C5C8();
}

void sub_242C224C0()
{
  sub_242BA8F78();
}

uint64_t sub_242C224C8()
{
  sub_242C25FD0();
  return sub_242C48524();
}

uint64_t sub_242C22524()
{
  sub_242C25FD0();
  return sub_242C484F4();
}

void sub_242C22570(_QWORD *a1@<X8>)
{
  *a1 = &unk_25137E2B0;
}

void sub_242C22584(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_242C22590(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_242C22598(_BYTE *a1@<X8>)
{
  *a1 = 67;
}

void sub_242C225A4(_BYTE *a1@<X8>)
{
  *a1 = 64;
}

void sub_242C225B0(_BYTE *a1@<X8>)
{
  *a1 = 65;
}

void sub_242C225BC(_BYTE *a1@<X8>)
{
  *a1 = 66;
}

void sub_242C225C8(_BYTE *a1@<X8>)
{
  *a1 = -64;
}

void static TensorScalar.tensorScalarKind.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_39(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10, SWORD2(v10), SBYTE6(v10), SHIBYTE(v10));
  sub_242C225FC(v8);
  OUTLINED_FUNCTION_30_5();
}

void sub_242C225FC(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void sub_242C22610(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  sub_242C239D0(a1, a2, a3, a4, (uint64_t)sub_242ACA978, a5);
}

void static Int8.scalarType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_242C2262C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _BYTE *a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t, uint64_t);
  char v30;
  uint64_t result;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char v36;
  uint64_t v37;
  char *v38;
  char v39;
  char *v40;
  char *v41;
  char *v42;
  char v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  char *v48;
  char v49;
  char *v50;
  char v51;
  BOOL v52;
  char *v53;
  char v54;
  int v55;
  char v56;
  _QWORD v57[2];
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  _BYTE *v63;
  void (*v64)(char *, uint64_t, uint64_t);
  char v65;
  char v66;
  char v67;

  v60 = a4;
  v63 = a5;
  v57[1] = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v57[0] = (char *)v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v58 = (char *)v57 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v62 = (char *)v57 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v57 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v61 = (char *)v57 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v57 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v57 - v24;
  v26 = sub_242C48B3C();
  v64 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v64(v25, a1, a2);
  v59 = v8;
  if ((v26 & 1) == 0)
  {
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v32 = v25;
LABEL_8:
    v28(v32, a2);
    goto LABEL_9;
  }
  v27 = sub_242C48B30();
  v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v25, a2);
  if (v27 <= 8)
  {
LABEL_9:
    v29 = v64;
    goto LABEL_10;
  }
  v29 = v64;
  v64(v22, a1, a2);
  v65 = 0x80;
  if ((sub_242C48B3C() & 1) == 0)
  {
    v44 = sub_242C48B3C();
    v45 = sub_242C48B30();
    if ((v44 & 1) != 0)
    {
      if (v45 > 8)
      {
        sub_242C25F94();
        v46 = v61;
        sub_242C48B00();
        v47 = sub_242C481AC();
        v28(v46, a2);
        result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
        v29 = v64;
        if ((v47 & 1) != 0)
          goto LABEL_37;
        goto LABEL_10;
      }
      swift_getAssociatedConformanceWitness();
      sub_242C492B0();
      v53 = v61;
      sub_242C49250();
      v54 = sub_242C481AC();
      v28(v53, a2);
      AssociatedTypeWitness = v57[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v59 + 32))(v57[0], v22, a2);
      if ((v54 & 1) != 0)
        goto LABEL_36;
      v55 = v65;
      v56 = sub_242C48B24();
      result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
      v52 = v55 <= v56;
LABEL_33:
      v29 = v64;
      if (!v52)
        goto LABEL_37;
      goto LABEL_10;
    }
    if (v45 < 8)
    {
      v51 = sub_242C48B24();
      result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
      v52 = v65 <= v51;
      goto LABEL_33;
    }
    v32 = v22;
    goto LABEL_8;
  }
  if (sub_242C48B30() >= 8)
  {
    sub_242C25F94();
    v48 = v61;
    sub_242C48B00();
    v49 = sub_242C481AC();
    v50 = v48;
    v29 = v64;
    v28(v50, a2);
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if ((v49 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v30 = sub_242C48B24();
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if (v65 > v30)
      goto LABEL_37;
  }
LABEL_10:
  v33 = sub_242C48B30();
  v29(v17, a1, a2);
  if (v33 < 9)
  {
    v34 = sub_242C48B30();
    v28(v17, a2);
    if (v34 != 8 || (sub_242C48B3C() & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    v28(v17, a2);
  }
  v35 = v62;
  v29(v62, a1, a2);
  v67 = 127;
  v36 = sub_242C48B3C();
  v37 = sub_242C48B30();
  if ((v36 & 1) == 0)
  {
    if (v37 > 7)
    {
      v66 = 127;
      v41 = v61;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v61, v35, a2);
      sub_242C25F94();
      v42 = v58;
      sub_242C48B00();
      v39 = sub_242C481AC();
      v28(v42, a2);
      v40 = v41;
      goto LABEL_20;
    }
LABEL_18:
    sub_242C48B24();
    v28(v35, a2);
LABEL_21:
    v43 = sub_242C48B24();
    result = ((uint64_t (*)(uint64_t, uint64_t))v28)(a1, a2);
    *v63 = v43;
    return result;
  }
  if (v37 <= 8)
    goto LABEL_18;
  sub_242C25F94();
  v38 = v61;
  sub_242C48B00();
  v39 = sub_242C481AC();
  v28(v38, a2);
  v40 = v35;
LABEL_20:
  v28(v40, a2);
  if ((v39 & 1) == 0)
    goto LABEL_21;
  __break(1u);
LABEL_36:
  result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_242C22CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _WORD *a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t, uint64_t);
  __int16 v30;
  uint64_t result;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char v36;
  uint64_t v37;
  char *v38;
  char v39;
  char *v40;
  char *v41;
  char *v42;
  __int16 v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  char *v48;
  char v49;
  char *v50;
  __int16 v51;
  BOOL v52;
  char *v53;
  char v54;
  int v55;
  __int16 v56;
  _QWORD v57[2];
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  _WORD *v63;
  void (*v64)(char *, uint64_t, uint64_t);
  __int16 v65;
  __int16 v66;
  __int16 v67;

  v60 = a4;
  v63 = a5;
  v57[1] = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v57[0] = (char *)v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v58 = (char *)v57 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v62 = (char *)v57 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v57 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v61 = (char *)v57 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v57 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v57 - v24;
  v26 = sub_242C48B3C();
  v64 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v64(v25, a1, a2);
  v59 = v8;
  if ((v26 & 1) == 0)
  {
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v32 = v25;
LABEL_8:
    v28(v32, a2);
    goto LABEL_9;
  }
  v27 = sub_242C48B30();
  v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v25, a2);
  if (v27 <= 16)
  {
LABEL_9:
    v29 = v64;
    goto LABEL_10;
  }
  v29 = v64;
  v64(v22, a1, a2);
  v65 = 0x8000;
  if ((sub_242C48B3C() & 1) == 0)
  {
    v44 = sub_242C48B3C();
    v45 = sub_242C48B30();
    if ((v44 & 1) != 0)
    {
      if (v45 > 16)
      {
        sub_242C25F58();
        v46 = v61;
        sub_242C48B00();
        v47 = sub_242C481AC();
        v28(v46, a2);
        result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
        v29 = v64;
        if ((v47 & 1) != 0)
          goto LABEL_37;
        goto LABEL_10;
      }
      swift_getAssociatedConformanceWitness();
      sub_242C492B0();
      v53 = v61;
      sub_242C49250();
      v54 = sub_242C481AC();
      v28(v53, a2);
      AssociatedTypeWitness = v57[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v59 + 32))(v57[0], v22, a2);
      if ((v54 & 1) != 0)
        goto LABEL_36;
      v55 = v65;
      v56 = sub_242C48B24();
      result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
      v52 = v55 <= v56;
LABEL_33:
      v29 = v64;
      if (!v52)
        goto LABEL_37;
      goto LABEL_10;
    }
    if (v45 < 16)
    {
      v51 = sub_242C48B24();
      result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
      v52 = v65 <= v51;
      goto LABEL_33;
    }
    v32 = v22;
    goto LABEL_8;
  }
  if (sub_242C48B30() >= 16)
  {
    sub_242C25F58();
    v48 = v61;
    sub_242C48B00();
    v49 = sub_242C481AC();
    v50 = v48;
    v29 = v64;
    v28(v50, a2);
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if ((v49 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v30 = sub_242C48B24();
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if (v65 > v30)
      goto LABEL_37;
  }
LABEL_10:
  v33 = sub_242C48B30();
  v29(v17, a1, a2);
  if (v33 < 17)
  {
    v34 = sub_242C48B30();
    v28(v17, a2);
    if (v34 != 16 || (sub_242C48B3C() & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    v28(v17, a2);
  }
  v35 = v62;
  v29(v62, a1, a2);
  v67 = 0x7FFF;
  v36 = sub_242C48B3C();
  v37 = sub_242C48B30();
  if ((v36 & 1) == 0)
  {
    if (v37 > 15)
    {
      v66 = 0x7FFF;
      v41 = v61;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v61, v35, a2);
      sub_242C25F58();
      v42 = v58;
      sub_242C48B00();
      v39 = sub_242C481AC();
      v28(v42, a2);
      v40 = v41;
      goto LABEL_20;
    }
LABEL_18:
    sub_242C48B24();
    v28(v35, a2);
LABEL_21:
    v43 = sub_242C48B24();
    result = ((uint64_t (*)(uint64_t, uint64_t))v28)(a1, a2);
    *v63 = v43;
    return result;
  }
  if (v37 <= 16)
    goto LABEL_18;
  sub_242C25F58();
  v38 = v61;
  sub_242C48B00();
  v39 = sub_242C481AC();
  v28(v38, a2);
  v40 = v35;
LABEL_20:
  v28(v40, a2);
  if ((v39 & 1) == 0)
    goto LABEL_21;
  __break(1u);
LABEL_36:
  result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_242C2333C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _DWORD *a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t, uint64_t);
  signed int v30;
  uint64_t result;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char v36;
  uint64_t v37;
  char *v38;
  char v39;
  char *v40;
  char *v41;
  char *v42;
  int v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  char *v48;
  char v49;
  char *v50;
  signed int v51;
  BOOL v52;
  char *v53;
  char v54;
  signed int v55;
  signed int v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  _DWORD *v65;
  void (*v66)(char *, uint64_t, uint64_t);
  signed int v67;
  int v68;
  int v69;

  v62 = a4;
  v65 = a5;
  v59 = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v58 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v57 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v64 = (char *)&v57 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v57 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v63 = (char *)&v57 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v57 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v57 - v24;
  v26 = sub_242C48B3C();
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v66(v25, a1, a2);
  v61 = v8;
  if ((v26 & 1) == 0)
  {
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v32 = v25;
LABEL_8:
    v28(v32, a2);
    goto LABEL_9;
  }
  v27 = sub_242C48B30();
  v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v25, a2);
  if (v27 <= 32)
  {
LABEL_9:
    v29 = v66;
    goto LABEL_10;
  }
  v29 = v66;
  v66(v22, a1, a2);
  v67 = 0x80000000;
  if ((sub_242C48B3C() & 1) == 0)
  {
    v44 = sub_242C48B3C();
    v45 = sub_242C48B30();
    if ((v44 & 1) != 0)
    {
      if (v45 > 32)
      {
        sub_242B4F184();
        v46 = v63;
        sub_242C48B00();
        v47 = sub_242C481AC();
        v28(v46, a2);
        result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
        v29 = v66;
        if ((v47 & 1) != 0)
          goto LABEL_37;
        goto LABEL_10;
      }
      swift_getAssociatedConformanceWitness();
      sub_242C492B0();
      v53 = v63;
      sub_242C49250();
      v54 = sub_242C481AC();
      v28(v53, a2);
      AssociatedTypeWitness = (uint64_t)v58;
      (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v58, v22, a2);
      if ((v54 & 1) != 0)
        goto LABEL_36;
      v55 = v67;
      v56 = sub_242C48B24();
      result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
      v52 = v55 <= v56;
LABEL_33:
      v29 = v66;
      if (!v52)
        goto LABEL_37;
      goto LABEL_10;
    }
    if (v45 < 32)
    {
      v51 = sub_242C48B24();
      result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
      v52 = v67 <= v51;
      goto LABEL_33;
    }
    v32 = v22;
    goto LABEL_8;
  }
  if (sub_242C48B30() >= 32)
  {
    sub_242B4F184();
    v48 = v63;
    sub_242C48B00();
    v49 = sub_242C481AC();
    v50 = v48;
    v29 = v66;
    v28(v50, a2);
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if ((v49 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v30 = sub_242C48B24();
    result = ((uint64_t (*)(char *, uint64_t))v28)(v22, a2);
    if (v67 > v30)
      goto LABEL_37;
  }
LABEL_10:
  v33 = sub_242C48B30();
  v29(v17, a1, a2);
  if (v33 < 33)
  {
    v34 = sub_242C48B30();
    v28(v17, a2);
    if (v34 != 32 || (sub_242C48B3C() & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    v28(v17, a2);
  }
  v35 = v64;
  v29(v64, a1, a2);
  v69 = 0x7FFFFFFF;
  v36 = sub_242C48B3C();
  v37 = sub_242C48B30();
  if ((v36 & 1) == 0)
  {
    if (v37 > 31)
    {
      v68 = 0x7FFFFFFF;
      v41 = v63;
      (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v63, v35, a2);
      sub_242B4F184();
      v42 = v60;
      sub_242C48B00();
      v39 = sub_242C481AC();
      v28(v42, a2);
      v40 = v41;
      goto LABEL_20;
    }
LABEL_18:
    sub_242C48B24();
    v28(v35, a2);
LABEL_21:
    v43 = sub_242C48B24();
    result = ((uint64_t (*)(uint64_t, uint64_t))v28)(a1, a2);
    *v65 = v43;
    return result;
  }
  if (v37 <= 32)
    goto LABEL_18;
  sub_242B4F184();
  v38 = v63;
  sub_242C48B00();
  v39 = sub_242C481AC();
  v28(v38, a2);
  v40 = v35;
LABEL_20:
  v28(v40, a2);
  if ((v39 & 1) == 0)
    goto LABEL_21;
  __break(1u);
LABEL_36:
  result = ((uint64_t (*)(uint64_t, uint64_t))v28)(AssociatedTypeWitness, a2);
LABEL_37:
  __break(1u);
  return result;
}

void sub_242C239C4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  sub_242C239D0(a1, a2, a3, a4, (uint64_t)sub_242C25F1C, a5);
}

void sub_242C239D0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  char v49;
  int64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t *v59;
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t v61;
  int64_t v62;

  v55 = a5;
  v56 = a4;
  v59 = a6;
  v52[1] = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_26();
  MEMORY[0x24BDAC7A8](v10);
  v11 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_13_1();
  v52[0] = v13;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v14);
  v53 = (char *)v52 - v15;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v16);
  v58 = (char *)v52 - v17;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_338();
  MEMORY[0x24BDAC7A8](v19);
  v57 = (char *)v52 - v20;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v52 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v52 - v25;
  v27 = OUTLINED_FUNCTION_3_78();
  v60 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v60(v26, a1, a2);
  v54 = v11;
  if ((v27 & 1) == 0)
  {
    v31 = (uint64_t)v26;
    goto LABEL_8;
  }
  v28 = OUTLINED_FUNCTION_4_72();
  OUTLINED_FUNCTION_1_81((uint64_t)v26);
  if (v28 <= 64)
    goto LABEL_9;
  v29 = (uint64_t)v60;
  v60(v23, a1, a2);
  v62 = 0x8000000000000000;
  if ((OUTLINED_FUNCTION_3_78() & 1) == 0)
  {
    v42 = OUTLINED_FUNCTION_3_78();
    v43 = OUTLINED_FUNCTION_4_72();
    if ((v42 & 1) != 0)
    {
      if (v43 > 64)
      {
        OUTLINED_FUNCTION_26_51();
        OUTLINED_FUNCTION_2_87();
        v44 = OUTLINED_FUNCTION_5_75();
        OUTLINED_FUNCTION_1_81(v42);
        OUTLINED_FUNCTION_1_81((uint64_t)v23);
        if ((v44 & 1) != 0)
          goto LABEL_37;
        goto LABEL_9;
      }
      swift_getAssociatedConformanceWitness();
      sub_242C492B0();
      v48 = (uint64_t)v57;
      sub_242C49250();
      v49 = OUTLINED_FUNCTION_5_75();
      OUTLINED_FUNCTION_1_81(v48);
      AssociatedTypeWitness = v52[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v54 + 32))(v52[0], v23, a2);
      if ((v49 & 1) != 0)
        goto LABEL_36;
      v50 = v62;
      v51 = OUTLINED_FUNCTION_7_60();
      OUTLINED_FUNCTION_1_81(AssociatedTypeWitness);
      v47 = v51 < v50;
LABEL_32:
      if (v47)
        goto LABEL_37;
      goto LABEL_9;
    }
    if (v43 < 64)
    {
      v46 = OUTLINED_FUNCTION_7_60();
      OUTLINED_FUNCTION_1_81((uint64_t)v23);
      v47 = v46 < v62;
      goto LABEL_32;
    }
    v31 = (uint64_t)v23;
LABEL_8:
    OUTLINED_FUNCTION_1_81(v31);
    goto LABEL_9;
  }
  if (OUTLINED_FUNCTION_4_72() >= 64)
  {
    OUTLINED_FUNCTION_26_51();
    OUTLINED_FUNCTION_2_87();
    v45 = OUTLINED_FUNCTION_5_75();
    OUTLINED_FUNCTION_1_81(v29);
    OUTLINED_FUNCTION_1_81((uint64_t)v23);
    if ((v45 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v30 = OUTLINED_FUNCTION_7_60();
    OUTLINED_FUNCTION_1_81((uint64_t)v23);
    if (v30 < v62)
      goto LABEL_37;
  }
LABEL_9:
  v32 = OUTLINED_FUNCTION_4_72();
  OUTLINED_FUNCTION_17_50();
  if (v32 < 65)
  {
    v33 = OUTLINED_FUNCTION_4_72();
    OUTLINED_FUNCTION_1_81(v6);
    if (v33 != 64 || (OUTLINED_FUNCTION_3_78() & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    OUTLINED_FUNCTION_1_81(v6);
  }
  v34 = (uint64_t)v58;
  OUTLINED_FUNCTION_17_50();
  v62 = 0x7FFFFFFFFFFFFFFFLL;
  v35 = OUTLINED_FUNCTION_3_78();
  v36 = OUTLINED_FUNCTION_4_72();
  if ((v35 & 1) == 0)
  {
    if (v36 > 63)
    {
      v61 = 0x7FFFFFFFFFFFFFFFLL;
      v39 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v57, v34, a2);
      OUTLINED_FUNCTION_26_51();
      v40 = (uint64_t)v53;
      sub_242C48B00();
      v37 = sub_242C481AC();
      OUTLINED_FUNCTION_1_81(v40);
      v38 = (uint64_t)v39;
      goto LABEL_19;
    }
LABEL_17:
    OUTLINED_FUNCTION_7_60();
    OUTLINED_FUNCTION_1_81(v34);
LABEL_20:
    v41 = OUTLINED_FUNCTION_7_60();
    OUTLINED_FUNCTION_1_81(a1);
    *v59 = v41;
    OUTLINED_FUNCTION_13_11();
    return;
  }
  if (v36 <= 64)
    goto LABEL_17;
  OUTLINED_FUNCTION_26_51();
  OUTLINED_FUNCTION_2_87();
  v37 = sub_242C481AC();
  OUTLINED_FUNCTION_1_81(v35);
  v38 = v34;
LABEL_19:
  OUTLINED_FUNCTION_1_81(v38);
  if ((v37 & 1) == 0)
    goto LABEL_20;
  __break(1u);
LABEL_36:
  OUTLINED_FUNCTION_1_81(AssociatedTypeWitness);
LABEL_37:
  __break(1u);
}

void static UInt.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void sub_242C23E8C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  sub_242C24B9C(a1, a2, a3, (void (*)(void))sub_242C25EE0, a4);
}

void static UInt8.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C23EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  unsigned int v21;
  char *v22;
  unsigned __int8 v23;
  char v24;
  char v25;
  uint64_t result;
  void (*v27)(char *, uint64_t, uint64_t);
  _BYTE *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;

  v7 = *(_QWORD *)(a2 - 8);
  v30 = a3;
  v31 = v7;
  MEMORY[0x24BDAC7A8](a1);
  v29 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  if ((sub_242C48B3C() & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_242C492B0();
    sub_242C49250();
    v16 = sub_242C481B8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, a2);
    if ((v16 & 1) == 0)
      goto LABEL_17;
  }
  if (sub_242C48B30() < 8)
  {
LABEL_16:
    v25 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(a1, a2);
    *a4 = v25;
    return result;
  }
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v28 = a4;
  v27(v11, a1, a2);
  v32 = -1;
  v17 = sub_242C48B3C();
  v18 = sub_242C48B30();
  if ((v17 & 1) == 0)
  {
    if (v18 < 9)
    {
      sub_242C48B24();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, a2);
LABEL_15:
      a4 = v28;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (v18 > 8)
  {
LABEL_10:
    sub_242C25EA4();
    sub_242C48B00();
    v24 = sub_242C481AC();
    v20 = *(void (**)(char *, uint64_t))(v31 + 8);
    v20(v14, a2);
    if ((v24 & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
  swift_getAssociatedConformanceWitness();
  sub_242C492B0();
  sub_242C49250();
  v19 = sub_242C481A0();
  v20 = *(void (**)(char *, uint64_t))(v31 + 8);
  v20(v14, a2);
  v21 = v32;
  v22 = v29;
  v27(v29, (uint64_t)v11, a2);
  if ((v19 & 1) == 0)
  {
    v20(v22, a2);
    goto LABEL_14;
  }
  v23 = sub_242C48B24();
  v20(v22, a2);
  if (v21 >= v23)
  {
LABEL_14:
    v20(v11, a2);
    goto LABEL_15;
  }
LABEL_17:
  result = sub_242C48F50();
  __break(1u);
  return result;
}

void static UInt16.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C242F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, _WORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  unsigned int v21;
  char *v22;
  unsigned __int16 v23;
  char v24;
  __int16 v25;
  uint64_t result;
  void (*v27)(char *, uint64_t, uint64_t);
  _WORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 v32;

  v7 = *(_QWORD *)(a2 - 8);
  v30 = a3;
  v31 = v7;
  MEMORY[0x24BDAC7A8](a1);
  v29 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  if ((sub_242C48B3C() & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_242C492B0();
    sub_242C49250();
    v16 = sub_242C481B8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, a2);
    if ((v16 & 1) == 0)
      goto LABEL_17;
  }
  if (sub_242C48B30() < 16)
  {
LABEL_16:
    v25 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(a1, a2);
    *a4 = v25;
    return result;
  }
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v28 = a4;
  v27(v11, a1, a2);
  v32 = -1;
  v17 = sub_242C48B3C();
  v18 = sub_242C48B30();
  if ((v17 & 1) == 0)
  {
    if (v18 < 17)
    {
      sub_242C48B24();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, a2);
LABEL_15:
      a4 = v28;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (v18 > 16)
  {
LABEL_10:
    sub_242C25E68();
    sub_242C48B00();
    v24 = sub_242C481AC();
    v20 = *(void (**)(char *, uint64_t))(v31 + 8);
    v20(v14, a2);
    if ((v24 & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
  swift_getAssociatedConformanceWitness();
  sub_242C492B0();
  sub_242C49250();
  v19 = sub_242C481A0();
  v20 = *(void (**)(char *, uint64_t))(v31 + 8);
  v20(v14, a2);
  v21 = v32;
  v22 = v29;
  v27(v29, (uint64_t)v11, a2);
  if ((v19 & 1) == 0)
  {
    v20(v22, a2);
    goto LABEL_14;
  }
  v23 = sub_242C48B24();
  v20(v22, a2);
  if (v21 >= v23)
  {
LABEL_14:
    v20(v11, a2);
    goto LABEL_15;
  }
LABEL_17:
  result = sub_242C48F50();
  __break(1u);
  return result;
}

void static UInt32.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C24748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, _DWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  unsigned int v21;
  char *v22;
  unsigned int v23;
  char v24;
  int v25;
  uint64_t result;
  void (*v27)(char *, uint64_t, uint64_t);
  _DWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;

  v7 = *(_QWORD *)(a2 - 8);
  v30 = a3;
  v31 = v7;
  MEMORY[0x24BDAC7A8](a1);
  v29 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  if ((sub_242C48B3C() & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_242C492B0();
    sub_242C49250();
    v16 = sub_242C481B8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, a2);
    if ((v16 & 1) == 0)
      goto LABEL_17;
  }
  if (sub_242C48B30() < 32)
  {
LABEL_16:
    v25 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(a1, a2);
    *a4 = v25;
    return result;
  }
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v28 = a4;
  v27(v11, a1, a2);
  v32 = -1;
  v17 = sub_242C48B3C();
  v18 = sub_242C48B30();
  if ((v17 & 1) == 0)
  {
    if (v18 < 33)
    {
      sub_242C48B24();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, a2);
LABEL_15:
      a4 = v28;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (v18 > 32)
  {
LABEL_10:
    sub_242C25E2C();
    sub_242C48B00();
    v24 = sub_242C481AC();
    v20 = *(void (**)(char *, uint64_t))(v31 + 8);
    v20(v14, a2);
    if ((v24 & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
  swift_getAssociatedConformanceWitness();
  sub_242C492B0();
  sub_242C49250();
  v19 = sub_242C481A0();
  v20 = *(void (**)(char *, uint64_t))(v31 + 8);
  v20(v14, a2);
  v21 = v32;
  v22 = v29;
  v27(v29, (uint64_t)v11, a2);
  if ((v19 & 1) == 0)
  {
    v20(v22, a2);
    goto LABEL_14;
  }
  v23 = sub_242C48B24();
  v20(v22, a2);
  if (v21 >= v23)
  {
LABEL_14:
    v20(v11, a2);
    goto LABEL_15;
  }
LABEL_17:
  result = sub_242C48F50();
  __break(1u);
  return result;
}

void sub_242C24B90(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  sub_242C24B9C(a1, a2, a3, (void (*)(void))sub_242ACAA2C, a4);
}

void sub_242C24B9C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, void (*a4)(void)@<X6>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(void);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a4;
  v29 = a3;
  v30 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_13_1();
  v27 = v9;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_338();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - v12;
  v15 = *(_QWORD *)(*(_QWORD *)(v14 + 24) + 16);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_26();
  MEMORY[0x24BDAC7A8](v16);
  if ((OUTLINED_FUNCTION_20_56() & 1) != 0)
  {
    OUTLINED_FUNCTION_19_44();
    OUTLINED_FUNCTION_16_50();
    OUTLINED_FUNCTION_13_64();
    v17 = sub_242C481B8();
    OUTLINED_FUNCTION_7_24((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    if ((v17 & 1) == 0)
      goto LABEL_16;
  }
  if (OUTLINED_FUNCTION_37_39() < 64)
  {
LABEL_15:
    v23 = OUTLINED_FUNCTION_8_60();
    OUTLINED_FUNCTION_7_24(a1, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    *a5 = v23;
    OUTLINED_FUNCTION_13_11();
    return;
  }
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
  v26 = a5;
  v25(v5, a1, a2);
  v31 = -1;
  v18 = OUTLINED_FUNCTION_20_56();
  v19 = OUTLINED_FUNCTION_37_39();
  if ((v18 & 1) == 0)
  {
    if (v19 < 65)
    {
      OUTLINED_FUNCTION_8_60();
      goto LABEL_14;
    }
LABEL_10:
    v28();
    sub_242C48B00();
    sub_242C481AC();
    OUTLINED_FUNCTION_12_49();
    if ((v15 & 1) != 0)
      goto LABEL_16;
    goto LABEL_14;
  }
  if (v19 > 64)
    goto LABEL_10;
  OUTLINED_FUNCTION_19_44();
  OUTLINED_FUNCTION_16_50();
  OUTLINED_FUNCTION_13_64();
  sub_242C481A0();
  OUTLINED_FUNCTION_12_49();
  v20 = v31;
  v21 = v27;
  v25(v27, v5, a2);
  if ((v15 & 1) == 0)
  {
    OUTLINED_FUNCTION_15_55(v21);
    goto LABEL_14;
  }
  v22 = OUTLINED_FUNCTION_8_60();
  OUTLINED_FUNCTION_15_55(v21);
  if (v20 >= v22)
  {
LABEL_14:
    OUTLINED_FUNCTION_15_55(v5);
    a5 = v26;
    goto LABEL_15;
  }
LABEL_16:
  OUTLINED_FUNCTION_1_3();
  sub_242C48F50();
  __break(1u);
}

void sub_242C24EC0(_BYTE *a1@<X8>)
{
  *a1 = -127;
}

void sub_242C24ECC(_BYTE *a1@<X8>)
{
  *a1 = 0x80;
}

void sub_242C24ED8(_BYTE *a1@<X8>)
{
  *a1 = -126;
}

void sub_242C24EE4(_BYTE *a1@<X8>)
{
  *a1 = -125;
}

void static TensorFloatingPointScalar.tensorScalarKind.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  OUTLINED_FUNCTION_27_39(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10, SWORD2(v10), SBYTE6(v10), SHIBYTE(v10));
  *v8 = v11 | 0x80;
  OUTLINED_FUNCTION_30_5();
}

void static Float16.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C24F20()
{
  sub_242AF3280();
  return sub_242C48050();
}

uint64_t sub_242C24F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t result;
  char v8;
  uint64_t v9;
  __int16 v15;

  if (sub_242C48B30() < 65)
  {
    v8 = sub_242C48B3C();
    v9 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    if ((v8 & 1) != 0)
      _S0 = (float)v9;
    else
      _S0 = (float)(unint64_t)v9;
    __asm { FCVT            H0, S0 }
  }
  else
  {
    sub_242AF3280();
    sub_242AF32BC();
    sub_242C48068();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    _H0 = v15;
  }
  *a3 = _H0;
  return result;
}

uint64_t BFloat16.data.getter()
{
  unsigned __int16 *v0;

  return *v0;
}

uint64_t BFloat16.data.setter(uint64_t result)
{
  _WORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*BFloat16.data.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_242C250A8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_242C4925C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_242C2511C()
{
  return 1635017060;
}

uint64_t sub_242C25130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242C250A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_242C25158()
{
  sub_242C256EC();
  return sub_242C494D8();
}

uint64_t sub_242C25180()
{
  sub_242C256EC();
  return sub_242C494E4();
}

void static BFloat16.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void static BFloat16.tensorFloatingPointScalarKind.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

void BFloat16.encode(to:)(_QWORD *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25722E208);
  OUTLINED_FUNCTION_166_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_58_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C256EC();
  sub_242C49478();
  sub_242C49190();
  OUTLINED_FUNCTION_4_45();
  OUTLINED_FUNCTION_0_9();
}

void BFloat16.init(from:)(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  __int16 v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25722E218);
  OUTLINED_FUNCTION_166_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_58_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C256EC();
  sub_242C49448();
  if (!v2)
  {
    v6 = sub_242C490E8();
    OUTLINED_FUNCTION_4_45();
    *a2 = v6;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_9();
}

void sub_242C2533C(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  BFloat16.init(from:)(a1, a2);
}

void sub_242C25350(_QWORD *a1)
{
  BFloat16.encode(to:)(a1);
}

BOOL static BFloat16.< infix(_:_:)(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 < *a2;
}

BOOL static BFloat16.== infix(_:_:)(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

BOOL sub_242C25390(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_242B09268(*a1, *a2);
}

BOOL sub_242C2539C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_242B092A8(*a1, *a2);
}

BOOL sub_242C253A8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_242B0913C(*a1, *a2);
}

uint64_t BFloat16.description.getter()
{
  return sub_242C486C8();
}

void static Float.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C253D0()
{
  sub_242A77290();
  return sub_242C48050();
}

uint64_t sub_242C25428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, float *a3@<X8>)
{
  uint64_t result;
  float v7;
  char v8;
  uint64_t v9;
  float v10;

  if (sub_242C48B30() < 65)
  {
    v8 = sub_242C48B3C();
    v9 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    if ((v8 & 1) != 0)
      v7 = (float)v9;
    else
      v7 = (float)(unint64_t)v9;
  }
  else
  {
    sub_242A77290();
    sub_242B4E430();
    sub_242C48068();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    v7 = v10;
  }
  *a3 = v7;
  return result;
}

void static Double.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

uint64_t sub_242C2553C()
{
  sub_242AC5140();
  return sub_242C48050();
}

uint64_t sub_242C25594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  uint64_t result;
  double v7;
  char v8;
  uint64_t v9;
  double v10;

  if (sub_242C48B30() < 65)
  {
    v8 = sub_242C48B3C();
    v9 = sub_242C48B24();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    if ((v8 & 1) != 0)
      v7 = (double)v9;
    else
      v7 = (double)(unint64_t)v9;
  }
  else
  {
    sub_242AC5140();
    sub_242AC5194();
    sub_242C48068();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    v7 = v10;
  }
  *a3 = v7;
  return result;
}

void static Bool.scalarType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_108_6(a1);
}

unint64_t sub_242C256B0()
{
  unint64_t result;

  result = qword_25722E200;
  if (!qword_25722E200)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for BFloat16, &type metadata for BFloat16);
    atomic_store(result, (unint64_t *)&qword_25722E200);
  }
  return result;
}

unint64_t sub_242C256EC()
{
  unint64_t result;

  result = qword_25722E210;
  if (!qword_25722E210)
  {
    result = MEMORY[0x2494EDE24](&unk_242C623E0, &type metadata for BFloat16.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E210);
  }
  return result;
}

unint64_t sub_242C2572C()
{
  unint64_t result;

  result = qword_25722E220;
  if (!qword_25722E220)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorScalarKind, &type metadata for TensorScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E220);
  }
  return result;
}

uint64_t sub_242C25768()
{
  return sub_242C258B8(&qword_25722E228, &qword_25722E230);
}

unint64_t sub_242C25790()
{
  unint64_t result;

  result = qword_25722E238;
  if (!qword_25722E238)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorSignedIntegerScalarKind, &type metadata for TensorSignedIntegerScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E238);
  }
  return result;
}

uint64_t sub_242C257CC()
{
  return sub_242C258B8(&qword_25722E240, &qword_25722E248);
}

unint64_t sub_242C257F4()
{
  unint64_t result;

  result = qword_25722E250;
  if (!qword_25722E250)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorUnsignedIntegerScalarKind, &type metadata for TensorUnsignedIntegerScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E250);
  }
  return result;
}

uint64_t sub_242C25830()
{
  return sub_242C258B8(&qword_25722E258, &qword_25722E260);
}

unint64_t sub_242C25858()
{
  unint64_t result;

  result = qword_25722E268;
  if (!qword_25722E268)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorFloatingPointScalarKind, &type metadata for TensorFloatingPointScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E268);
  }
  return result;
}

uint64_t sub_242C25894()
{
  return sub_242C258B8(&qword_25722E270, &qword_25722E278);
}

uint64_t sub_242C258B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_242C258F8(uint64_t a1)
{
  unint64_t result;

  result = sub_242A7730C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_242C2591C(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_242C25948();
  result = sub_242C25984();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_242C25948()
{
  unint64_t result;

  result = qword_25722E280;
  if (!qword_25722E280)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for BFloat16, &type metadata for BFloat16);
    atomic_store(result, (unint64_t *)&qword_25722E280);
  }
  return result;
}

unint64_t sub_242C25984()
{
  unint64_t result;

  result = qword_25722E288;
  if (!qword_25722E288)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for BFloat16, &type metadata for BFloat16);
    atomic_store(result, (unint64_t *)&qword_25722E288);
  }
  return result;
}

unint64_t sub_242C259C4()
{
  unint64_t result;

  result = qword_25722E290;
  if (!qword_25722E290)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for BFloat16, &type metadata for BFloat16);
    atomic_store(result, (unint64_t *)&qword_25722E290);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TensorScalarKind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;

  if (!a2)
  {
    v5 = -1;
    return v5 + 1;
  }
  if (a2 >= 0x3D)
  {
    if (a2 + 195 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 195) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 196;
    return v5 + 1;
  }
LABEL_17:
  v5 = (*a1 & 0x3C | (*a1 >> 6)) ^ 0x3F;
  if (v5 >= 0x3C)
    v5 = -1;
  return v5 + 1;
}

uint64_t storeEnumTagSinglePayload for TensorScalarKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 195 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 195) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x3D)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x3C)
    return ((uint64_t (*)(void))((char *)&loc_242C25AE0 + 4 * byte_242C61A76[v4]))();
  *a1 = a2 - 61;
  return ((uint64_t (*)(void))((char *)sub_242C25B14 + 4 * byte_242C61A71[v4]))();
}

uint64_t sub_242C25B14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C25B1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C25B24);
  return result;
}

uint64_t sub_242C25B3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C25B44);
  *(_BYTE *)result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
  return result;
}

uint64_t sub_242C25B48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C25B50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C25B5C(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *a1;
  v2 = v1 >> 6;
  v3 = (v1 & 3) + 3;
  if (v2 == 3)
    return v3;
  else
    return v2;
}

_BYTE *sub_242C25B78(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_242C25B88(_BYTE *result, unsigned int a2)
{
  char v2;

  if (a2 < 3)
    v2 = *result & 3 | ((_BYTE)a2 << 6);
  else
    v2 = (a2 + 1) & 3 | 0xC0;
  *result = v2;
  return result;
}

void type metadata accessor for TensorScalarKind()
{
  OUTLINED_FUNCTION_22_4();
}

void type metadata accessor for TensorSignedIntegerScalarKind()
{
  OUTLINED_FUNCTION_22_4();
}

void type metadata accessor for TensorUnsignedIntegerScalarKind()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t _s14NeuralNetworks29TensorSignedIntegerScalarKindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242C25C28 + 4 * byte_242C61A80[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_242C25C5C + 4 * byte_242C61A7B[v4]))();
}

uint64_t sub_242C25C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C25C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C25C6CLL);
  return result;
}

uint64_t sub_242C25C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C25C80);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_242C25C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C25C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TensorFloatingPointScalarKind()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t dispatch thunk of static TensorScalar.tensorScalarKind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static TensorScalar.scalarType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TensorFloatingPointScalar.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of TensorIntegerScalar.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

void type metadata accessor for BFloat16()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t storeEnumTagSinglePayload for BFloat16.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_242C25D10 + 4 * byte_242C61A85[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_242C25D30 + 4 * byte_242C61A8A[v4]))();
}

_BYTE *sub_242C25D10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_242C25D30(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C25D38(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C25D40(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C25D48(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C25D50(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BFloat16.CodingKeys()
{
  return &type metadata for BFloat16.CodingKeys;
}

unint64_t sub_242C25D70()
{
  unint64_t result;

  result = qword_25722E298;
  if (!qword_25722E298)
  {
    result = MEMORY[0x2494EDE24](&unk_242C623B8, &type metadata for BFloat16.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E298);
  }
  return result;
}

unint64_t sub_242C25DB0()
{
  unint64_t result;

  result = qword_25722E2A0;
  if (!qword_25722E2A0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C62328, &type metadata for BFloat16.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E2A0);
  }
  return result;
}

unint64_t sub_242C25DF0()
{
  unint64_t result;

  result = qword_25722E2A8;
  if (!qword_25722E2A8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C62350, &type metadata for BFloat16.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722E2A8);
  }
  return result;
}

unint64_t sub_242C25E2C()
{
  unint64_t result;

  result = qword_25722E2B0;
  if (!qword_25722E2B0)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE4538], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_25722E2B0);
  }
  return result;
}

unint64_t sub_242C25E68()
{
  unint64_t result;

  result = qword_25722E2B8;
  if (!qword_25722E2B8)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE44B8], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_25722E2B8);
  }
  return result;
}

unint64_t sub_242C25EA4()
{
  unint64_t result;

  result = qword_25722E2C0;
  if (!qword_25722E2C0)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_25722E2C0);
  }
  return result;
}

unint64_t sub_242C25EE0()
{
  unint64_t result;

  result = qword_25722E2C8;
  if (!qword_25722E2C8)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE1EC0], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_25722E2C8);
  }
  return result;
}

unint64_t sub_242C25F1C()
{
  unint64_t result;

  result = qword_25722E2D0;
  if (!qword_25722E2D0)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_25722E2D0);
  }
  return result;
}

unint64_t sub_242C25F58()
{
  unint64_t result;

  result = qword_25722E2D8;
  if (!qword_25722E2D8)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE3F58], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_25722E2D8);
  }
  return result;
}

unint64_t sub_242C25F94()
{
  unint64_t result;

  result = qword_25722E2E0;
  if (!qword_25722E2E0)
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE3E78], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_25722E2E0);
  }
  return result;
}

unint64_t sub_242C25FD0()
{
  unint64_t result;

  result = qword_25722E2E8;
  if (!qword_25722E2E8)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorFloatingPointScalarKind, &type metadata for TensorFloatingPointScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E2E8);
  }
  return result;
}

unint64_t sub_242C2600C()
{
  unint64_t result;

  result = qword_25722E2F0;
  if (!qword_25722E2F0)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorUnsignedIntegerScalarKind, &type metadata for TensorUnsignedIntegerScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E2F0);
  }
  return result;
}

unint64_t sub_242C26048()
{
  unint64_t result;

  result = qword_25722E2F8;
  if (!qword_25722E2F8)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorSignedIntegerScalarKind, &type metadata for TensorSignedIntegerScalarKind);
    atomic_store(result, (unint64_t *)&qword_25722E2F8);
  }
  return result;
}

unint64_t sub_242C26084()
{
  unint64_t result;

  result = qword_25722E300[0];
  if (!qword_25722E300[0])
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for TensorScalarKind, &type metadata for TensorScalarKind);
    atomic_store(result, qword_25722E300);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_81(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_2_87()
{
  return sub_242C48B00();
}

uint64_t OUTLINED_FUNCTION_3_78()
{
  return sub_242C48B3C();
}

uint64_t OUTLINED_FUNCTION_4_72()
{
  return sub_242C48B30();
}

uint64_t OUTLINED_FUNCTION_5_75()
{
  return sub_242C481AC();
}

void OUTLINED_FUNCTION_6_77()
{
  sub_242AC3E1C();
}

uint64_t OUTLINED_FUNCTION_7_60()
{
  return sub_242C48B24();
}

uint64_t OUTLINED_FUNCTION_8_60()
{
  return sub_242C48B24();
}

void OUTLINED_FUNCTION_11_56()
{
  sub_242AC3E1C();
}

uint64_t OUTLINED_FUNCTION_12_49()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_13_64()
{
  return sub_242C49250();
}

uint64_t OUTLINED_FUNCTION_15_55(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_50()
{
  return sub_242C492B0();
}

uint64_t OUTLINED_FUNCTION_17_50()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v2, v0);
}

uint64_t OUTLINED_FUNCTION_19_44()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_20_56()
{
  return sub_242C48B3C();
}

uint64_t OUTLINED_FUNCTION_21_47()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_25_49()
{
  sub_242B658BC();
}

uint64_t OUTLINED_FUNCTION_26_51()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 144))();
}

_QWORD *OUTLINED_FUNCTION_27_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  return (*(_QWORD *(**)(char *__return_ptr))(a2 + 32))(&a13);
}

uint64_t OUTLINED_FUNCTION_32_41@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

void OUTLINED_FUNCTION_34_42()
{
  sub_242A5F170();
}

uint64_t OUTLINED_FUNCTION_37_39()
{
  return sub_242C48B30();
}

uint64_t sub_242C26268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t ObjectType;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v24)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v25;
  _QWORD v28[4];
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (!v7)
  {
    swift_unknownObjectRelease();
    v11 = MEMORY[0x24BEE4AF8];
    goto LABEL_29;
  }
  v36 = MEMORY[0x24BEE4AF8];
  sub_242AC3124();
  if (v7 < 0)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    v28[2] = 0;
    v28[3] = 0;
    v28[1] = v6;
    v29 = -1;
    v31 = 0;
    v32 = 0;
    v30 = a6;
    v33 = -1;
    v34 = 4;
    sub_242A59264();
  }
  v11 = v36;
  ObjectType = swift_getObjectType();
  v24 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 16);
  v25 = ObjectType;
  a6 = a5 + 32;
  v6 = a1;
  do
  {
    if (a2 == v6)
    {
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v24(&v35, v25, a3);
    a6 = *(_QWORD *)(v35 + 16);
    if (v6 < -a6 || v6 >= a6)
      goto LABEL_41;
    v14 = (a6 & (a1 >> 63)) + v6;
    if (v14 >= a6)
      goto LABEL_31;
    v15 = *(_QWORD *)(v35 + 8 * v14 + 32);
    swift_bridgeObjectRelease();
    v16 = swift_getObjectType();
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a4 + 16))(v28, v16, a4);
    a6 = *(_QWORD *)(v28[0] + 16);
    if (v6 < -a6 || v6 >= a6)
      goto LABEL_41;
    v18 = (a6 & (a1 >> 63)) + v6;
    if (v18 >= a6)
      goto LABEL_32;
    v19 = *(_QWORD *)(v28[0] + 8 * v18 + 32);
    swift_bridgeObjectRelease();
    a6 = v15 - v19;
    if (__OFSUB__(v15, v19))
      goto LABEL_33;
    if (a1 < 0)
      goto LABEL_34;
    if ((unint64_t)v6 >= *(_QWORD *)(a5 + 16))
      goto LABEL_35;
    v20 = *(_QWORD *)(a5 + 32 + 8 * v6);
    v21 = a6 - v20;
    if (__OFSUB__(a6, v20))
      goto LABEL_36;
    v36 = v11;
    v22 = *(_QWORD *)(v11 + 16);
    if (v22 >= *(_QWORD *)(v11 + 24) >> 1)
    {
      sub_242AC3124();
      v11 = v36;
    }
    *(_QWORD *)(v11 + 16) = v22 + 1;
    a6 = v11 + 8 * v22;
    *(_QWORD *)(a6 + 32) = v21;
    if (a2 < a1)
      goto LABEL_37;
    if (v6 >= a2)
      goto LABEL_38;
    ++v6;
  }
  while (a2 != v6);
  swift_unknownObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_242C26504(unint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  uint64_t ObjectType;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  uint64_t v23;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_19;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_242C480E0();
  for (; v4; v4 = sub_242C48FC8())
  {
    v5 = v3 & 0xC000000000000001;
    v6 = MEMORY[0x24BEE4AF8];
    v7 = 4;
    v22 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v5)
        MEMORY[0x2494EC84C](v7 - 4, v3);
      else
        swift_retain();
      v8 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      sub_242B89308();
      if (*(_QWORD *)(a2 + 16) && (v9 = sub_242A613F0(), (v10 & 1) != 0))
      {
        v11 = v4;
        v12 = v3;
        v13 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v9);
        v15 = *v13;
        v14 = v13[1];
        swift_unknownObjectRetain();
        swift_release();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v23 = v6;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_242A5EA98();
          v6 = v19;
          v23 = v19;
        }
        v17 = *(_QWORD *)(v6 + 16);
        if (v17 >= *(_QWORD *)(v6 + 24) >> 1)
        {
          sub_242A5EA98();
          v6 = v20;
          v23 = v20;
        }
        ObjectType = swift_getObjectType();
        sub_242B18CF0(v17, v15, &v23, ObjectType, v14);
        v3 = v12;
        v4 = v11;
        v5 = v22;
      }
      else
      {
        swift_release();
      }
      ++v7;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_19:
    sub_242C480E0();
  }
  swift_bridgeObjectRelease();
  v6 = MEMORY[0x24BEE4AF8];
LABEL_21:
  swift_bridgeObjectRelease();
  return v6;
}

#error "242C26794: call analysis failed (funcsize=44)"

void sub_242C267AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;

  OUTLINED_FUNCTION_18_1();
  a19 = v24;
  a20 = v25;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v49 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = OUTLINED_FUNCTION_14_1();
  v51 = *(_QWORD *)(v31 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_26_10();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_305_0();
  v34 = OUTLINED_FUNCTION_36_17();
  sub_242A9E618(v34, v27);
  if (v35)
  {
    v37 = v35;
    v38 = v36;
    OUTLINED_FUNCTION_64_3();
    a10 = *(_QWORD *)(v20 + 56);
    v52 = *(_BYTE *)(v20 + 64);
    sub_242C480E0();
    OUTLINED_FUNCTION_54_25(&a10, (uint64_t)&v52);
    v40 = v39;
    v50 = v21;
    OUTLINED_FUNCTION_84_3(v39);
    OUTLINED_FUNCTION_35_15((uint64_t)&a10, v23);
    v41 = OUTLINED_FUNCTION_240_0();
    OUTLINED_FUNCTION_42_34(v41);
    OUTLINED_FUNCTION_35_15((uint64_t)&a10, v22);
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v30, v23, v31);
    v42 = OUTLINED_FUNCTION_0_10((uint64_t)v30);
    MEMORY[0x24BDAC7A8](v42);
    *(&v49 - 4) = v37;
    *(&v49 - 3) = v38;
    v44 = v43;
    *(&v49 - 2) = v43;
    *(&v49 - 1) = v20;
    v45 = v50;
    sub_242B5081C((uint64_t)v30, (void (*)(_BYTE *))sub_242C2AE38);
    if (v45)
    {
      OUTLINED_FUNCTION_19_5();
      sub_242AB8F10((uint64_t)v30, &qword_2572216B8);
      OUTLINED_FUNCTION_15_1(v23);
      OUTLINED_FUNCTION_32_10();
    }
    else
    {
      sub_242AB8F10((uint64_t)v30, &qword_2572216B8);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v48 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v48 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v48 + 32) = v40;
      *(_QWORD *)(v48 + 40) = &off_251387678;
      OUTLINED_FUNCTION_32_10();
      OUTLINED_FUNCTION_15_1(v23);
    }
    OUTLINED_FUNCTION_15_1(v44);
  }
  else
  {
    sub_242A6A5B0();
    v46 = OUTLINED_FUNCTION_24_1();
    *v47 = xmmword_242C62440;
    OUTLINED_FUNCTION_4_41(v46, (uint64_t)v47);
  }
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C269EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getObjectType();
  v11 = sub_242C47930();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, a2, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  v14 = a1;
  v15 = a3;
  sub_242BF6310((uint64_t)sub_242C2AE54, (uint64_t)v13, MEMORY[0x24BEE4AE0] + 8, a4);
  return sub_242AB8F10((uint64_t)v10, &qword_2572216B8);
}

uint64_t sub_242C26B10()
{
  void *v0;
  uint64_t v1;
  uint64_t v3;

  sub_242C47690();
  sub_242C480E0();
  sub_242C48A28();
  sub_242C489B0();
  if (sub_242C47684())
  {
    sub_242C47618();
    if (v0)
    {
      sub_242C48C38();
      sub_242C48314();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221160);
      sub_242C48E78();
      sub_242C48314();
      sub_242A6A5B0();
      swift_allocError();
      *(_QWORD *)v1 = 0;
      *(_QWORD *)(v1 + 8) = 0xE000000000000000;
      *(_BYTE *)(v1 + 16) = 1;
      swift_willThrow();

    }
    return swift_release();
  }
  else
  {
    sub_242A6A5B0();
    swift_allocError();
    *(_OWORD *)v3 = xmmword_242C62440;
    *(_BYTE *)(v3 + 16) = 4;
    return swift_willThrow();
  }
}

#error "242C26CE4: call analysis failed (funcsize=5)"

uint64_t sub_242C26CF0()
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
  _QWORD *v9;
  uint64_t v10;
  _OWORD *v11;

  v2 = v0;
  v3 = OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_6_37(v3);
  if (v4)
  {
    v6 = v4;
    v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v1 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v1 + 16) = xmmword_242C4B7D0;
    v8 = *(_QWORD *)(v2 + 48);
    type metadata accessor for ViewingTensorStorage();
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v6;
    v9[3] = v7;
    v9[4] = v8;
    *(_QWORD *)(v1 + 32) = v9;
    *(_QWORD *)(v1 + 40) = &off_251383270;
    sub_242C480E0();
  }
  else
  {
    sub_242A6A5B0();
    v10 = OUTLINED_FUNCTION_24_1();
    *v11 = xmmword_242C62450;
    OUTLINED_FUNCTION_4_41(v10, (uint64_t)v11);
  }
  return v1;
}

uint64_t sub_242C26DC0()
{
  return sub_242C26CF0();
}

void sub_242C26DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ObjectType;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t *v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  _QWORD v118[6];
  int v119;
  char v120;
  uint64_t v121;
  uint64_t v122;

  OUTLINED_FUNCTION_18_1();
  a19 = v23;
  a20 = v24;
  v109 = v21;
  v25 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_13_1();
  v105 = v27;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_8_11();
  v106 = v29;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_64_0();
  v107 = v31;
  v108 = sub_242C47714();
  v32 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  OUTLINED_FUNCTION_36_11();
  OUTLINED_FUNCTION_55_27();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_64_0();
  v116 = v34;
  v35 = OUTLINED_FUNCTION_14_1();
  v36 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_13_1();
  v112 = v37;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v38);
  v113 = (uint64_t)&v96 - v39;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v96 - v41;
  v43 = *(_QWORD *)(v20 + 40);
  v44 = sub_242B89308();
  OUTLINED_FUNCTION_63_21(v44);
  if (!v45)
  {
    sub_242A6A5B0();
    v62 = OUTLINED_FUNCTION_24_1();
    *v63 = xmmword_242C62460;
    OUTLINED_FUNCTION_4_41(v62, (uint64_t)v63);
    goto LABEL_11;
  }
  v47 = v45;
  v48 = v46;
  v111 = v36;
  v114 = v42;
  v104 = v32;
  ObjectType = swift_getObjectType();
  v50 = *(_QWORD *)(v48 + 16);
  v110 = v47;
  v101 = ObjectType;
  v102 = v48;
  ((void (*)(uint64_t *__return_ptr))v50)(&a10);
  v121 = a10;
  v103 = v25;
  v51 = *(_QWORD *)(v25 + 56);
  v52 = *(_QWORD *)(v51 + 16);
  static ShapeInference.broadcasting(_:toRank:)((uint64_t)&v121, v52, v118);
  OUTLINED_FUNCTION_4_0();
  v53 = v118[0];
  if (!v118[0])
    goto LABEL_13;
  v121 = v51;
  v117 = *(_BYTE *)(v43 + 160);
  v119 = 0;
  memset(v118, 0, sizeof(v118));
  OUTLINED_FUNCTION_141();
  Tensor.init(ones:scalarType:on:)(&v121, &v117, (uint64_t)v118, &a10);
  swift_retain_n();
  swift_release();
  OUTLINED_FUNCTION_25_50();
  v54 = v109;
  v59 = sub_242BC9F84(v55, v56, v57, v58);
  v50 = v60;
  swift_release();
  v115 = v22;
  v100 = v35;
  v99 = v54;
  if (v52 >= 2)
  {
    if (*(_QWORD *)(v51 + 16))
    {
      v61 = *(_QWORD *)(v51 + 32);
      goto LABEL_8;
    }
    __break(1u);
LABEL_13:
    v118[0] = 0;
    v118[1] = 0xE000000000000000;
    sub_242C48C38();
    sub_242C48314();
    ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v50)(&a10, v101, v102);
    v95 = OUTLINED_FUNCTION_28_1();
    MEMORY[0x2494EC0FC](v95, MEMORY[0x24BEE1768]);
    OUTLINED_FUNCTION_4_0();
    sub_242C48314();
    OUTLINED_FUNCTION_4_0();
    swift_bridgeObjectRelease();
    sub_242C48314();
    a10 = v52;
    sub_242C491CC();
    sub_242C48314();
    OUTLINED_FUNCTION_4_0();
    sub_242C48314();
    v120 = 3;
    OUTLINED_FUNCTION_33_41();
    sub_242A59170();
  }
  v61 = 1;
LABEL_8:
  v98 = v61;
  v118[0] = v53;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_1_7((uint64_t)v118, (uint64_t)v114);
  OUTLINED_FUNCTION_39_35();
  (*(void (**)(_QWORD *__return_ptr))(v50 + 16))(v118);
  v64 = v113;
  OUTLINED_FUNCTION_1_7((uint64_t)v118, v113);
  v118[0] = v53;
  OUTLINED_FUNCTION_81_13();
  v121 = a10;
  v109 = v59;
  sub_242B26518((uint64_t)v118, (uint64_t)&v121, v116);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_81_13();
  a10 = v118[0];
  v121 = v53;
  sub_242B26518((uint64_t)&a10, (uint64_t)&v121, v115);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_136();
  v118[0] = v51;
  OUTLINED_FUNCTION_141();
  v65 = v112;
  OUTLINED_FUNCTION_1_7((uint64_t)v118, v112);
  OUTLINED_FUNCTION_64_3();
  v118[0] = v51;
  v97 = v50;
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_190_2(v101);
  OUTLINED_FUNCTION_25_50();
  v66 = v99;
  sub_242B1D8D0(v67, v68, v69);
  v71 = v70;
  v99 = v66;
  v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16);
  v73 = v107;
  v74 = v100;
  OUTLINED_FUNCTION_47_4(v107, (uint64_t)v114);
  OUTLINED_FUNCTION_2_72(v73);
  v75 = v106;
  v76 = v64;
  v77 = v74;
  OUTLINED_FUNCTION_47_4(v106, v76);
  OUTLINED_FUNCTION_2_72(v75);
  v78 = v105;
  v72(v105, v65, v77);
  v79 = OUTLINED_FUNCTION_24_51();
  v82 = __swift_storeEnumTagSinglePayload(v79, v80, v81, v77);
  v96 = (uint64_t)&v96;
  MEMORY[0x24BDAC7A8](v82);
  v83 = v115;
  *(&v96 - 4) = v116;
  *(&v96 - 3) = v83;
  v84 = v98;
  *(&v96 - 2) = v103;
  *(&v96 - 1) = v84;
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_16_51();
  v86 = v97;
  *(_QWORD *)(v87 - 64) = v109;
  *(_QWORD *)(v87 - 56) = v86;
  *(_QWORD *)(v87 - 48) = v75;
  *(_QWORD *)(v87 - 40) = v71;
  *(_QWORD *)(v87 - 32) = &off_251387678;
  *(_QWORD *)(v87 - 24) = v78;
  *(_QWORD *)(v87 - 16) = sub_242C2AE6C;
  *(_QWORD *)(v87 - 8) = v88;
  OUTLINED_FUNCTION_71_3((uint64_t)sub_242AA4900, v89, MEMORY[0x24BEE4AE0] + 8, (uint64_t)&v122);
  if (v66)
  {
    OUTLINED_FUNCTION_19_5();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_43_9();
    OUTLINED_FUNCTION_15_56(v78);
    OUTLINED_FUNCTION_15_56(v75);
    OUTLINED_FUNCTION_15_56(v73);
    OUTLINED_FUNCTION_75_15(v112);
    OUTLINED_FUNCTION_75_15(v113);
    OUTLINED_FUNCTION_75_15((uint64_t)v114);
    v90 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v91 = v108;
    v90(v115, v108);
    v90(v116, v91);
  }
  else
  {
    OUTLINED_FUNCTION_15_56(v78);
    OUTLINED_FUNCTION_15_56(v75);
    OUTLINED_FUNCTION_15_56(v73);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v92 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v92 + 16) = xmmword_242C4B7D0;
    *(_QWORD *)(v92 + 32) = v71;
    *(_QWORD *)(v92 + 40) = &off_251387678;
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_43_9();
    OUTLINED_FUNCTION_76_19(v112);
    OUTLINED_FUNCTION_76_19(v113);
    OUTLINED_FUNCTION_76_19((uint64_t)v114);
    v93 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v94 = v108;
    v93(v115, v108);
    v93(v116, v94);
  }
LABEL_11:
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C2754C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v26[0] = a7;
  v27 = a4;
  v28 = a5;
  v32 = a1;
  v33 = a3;
  v34 = a2;
  v7 = sub_242C477C8();
  v30 = *(_QWORD *)(v7 - 8);
  v31 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v29 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_242C47894();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_242C47714();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v26 - v18;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v26 - v21;
  v26[2] = sub_242C4787C();
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v23(v22, v27, v13);
  v23(v19, v28, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BEDF680], v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEDF9B8], v9);
  sub_242C48A28();
  sub_242C489B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, *MEMORY[0x24BEDF7E0], v31);
  if (sub_242C47870())
  {
    sub_242C47864();
    return swift_release();
  }
  else
  {
    sub_242A6A5B0();
    swift_allocError();
    *(_OWORD *)v25 = xmmword_242C62460;
    *(_BYTE *)(v25 + 16) = 4;
    return swift_willThrow();
  }
}

#error "242C277EC: call analysis failed (funcsize=5)"

void sub_242C277F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t ObjectType;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  _QWORD v75[3];
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;

  OUTLINED_FUNCTION_18_1();
  a19 = v22;
  a20 = v23;
  v24 = v20;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_13_1();
  v69 = v28;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_64_0();
  v68 = v30;
  OUTLINED_FUNCTION_25_50();
  swift_beginAccess();
  OUTLINED_FUNCTION_0_2();
  v31 = sub_242C480E0();
  v32 = sub_242C26504(v31, v26);
  swift_bridgeObjectRelease();
  v33 = *(_QWORD *)(v32 + 16);
  if (v33 == sub_242B40E50())
  {
    OUTLINED_FUNCTION_64_3();
    v75[0] = *(_QWORD *)(v24 + 64);
    LOBYTE(a10) = *(_BYTE *)(v24 + 72);
    sub_242C480E0();
    OUTLINED_FUNCTION_25_50();
    sub_242B1D8D0(v34, v35, v36);
    v38 = v37;
    v72 = v21;
    v67 = *(_QWORD *)(v32 + 16);
    if (v67)
    {
      ObjectType = swift_getObjectType();
      v73 = 0;
      v39 = 0;
      v65 = MEMORY[0x24BEE4AE0] + 8;
      v64 = v32;
      v40 = v68;
      while (1)
      {
        v70 = v39;
        v74 = *(_OWORD *)(v32 + 16 * v39 + 32);
        v41 = OUTLINED_FUNCTION_65_3();
        swift_unknownObjectRetain();
        swift_retain();
        OUTLINED_FUNCTION_38_33();
        OUTLINED_FUNCTION_1_7((uint64_t)v75, v40);
        v42 = v24;
        v43 = OUTLINED_FUNCTION_14_1();
        v44 = OUTLINED_FUNCTION_24_51();
        __swift_storeEnumTagSinglePayload(v44, v45, v46, v43);
        OUTLINED_FUNCTION_38_33();
        v47 = v69;
        OUTLINED_FUNCTION_1_7((uint64_t)v75, v69);
        v48 = __swift_storeEnumTagSinglePayload(v47, 0, 1, v43);
        v71 = &v64;
        MEMORY[0x24BDAC7A8](v48);
        *(&v64 - 6) = v73;
        *(_OWORD *)(&v64 - 5) = v74;
        *(&v64 - 3) = v42;
        *(&v64 - 2) = v38;
        *(&v64 - 1) = (uint64_t)&off_251387678;
        MEMORY[0x24BDAC7A8](v49);
        OUTLINED_FUNCTION_16_51();
        *(_QWORD *)(v50 - 48) = *((_QWORD *)&v74 + 1);
        v51 = ObjectType;
        *(_QWORD *)(v50 - 64) = v41;
        *(_QWORD *)(v50 - 56) = v51;
        *(_QWORD *)(v50 - 40) = v52;
        *(_QWORD *)(v50 - 32) = v38;
        *(_QWORD *)(v50 - 24) = v47;
        *(_QWORD *)(v50 - 16) = sub_242C2AE88;
        *(_QWORD *)(v50 - 8) = v53;
        v54 = v72;
        sub_242BF66C0((uint64_t)sub_242C2AEA4, v55, v65, (uint64_t)&a12);
        sub_242AB8F10(v47, &qword_2572216B8);
        sub_242AB8F10(v40, &qword_2572216B8);
        v72 = v54;
        if (v54)
          break;
        swift_release();
        OUTLINED_FUNCTION_38_33();
        v56 = *(_QWORD *)(v42 + 48);
        v57 = *(_QWORD *)(a10 + 16);
        if (v56 < -v57 || v56 >= v57)
          goto LABEL_19;
        v56 += v57 & (v56 >> 63);
        if (v56 >= (unint64_t)v57)
        {
          __break(1u);
LABEL_18:
          __break(1u);
LABEL_19:
          v75[1] = 0;
          v75[2] = 0;
          v75[0] = v56;
          v76 = -1;
          v78 = 0;
          v79 = 0;
          v77 = v57;
          v80 = -1;
          v81 = 4;
          sub_242A59264();
        }
        v24 = v42;
        v59 = *(_QWORD *)(a10 + 8 * v56 + 32);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_49_4();
        v60 = __OFADD__(v73, v59);
        v57 = v73 + v59;
        v73 += v59;
        if (v60)
          goto LABEL_18;
        v39 = v70 + 1;
        v32 = v64;
        if (v67 == v70 + 1)
          goto LABEL_13;
      }
      OUTLINED_FUNCTION_49_4();
      OUTLINED_FUNCTION_23_5();
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_13:
      OUTLINED_FUNCTION_81();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v61 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v61 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v61 + 32) = v38;
      *(_QWORD *)(v61 + 40) = &off_251387678;
    }
  }
  else
  {
    OUTLINED_FUNCTION_81();
    sub_242A6A5B0();
    v62 = OUTLINED_FUNCTION_24_1();
    *v63 = xmmword_242C62470;
    OUTLINED_FUNCTION_4_41(v62, (uint64_t)v63);
  }
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C27C28(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  void (*v33)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _QWORD v35[3];
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  _BYTE __dst[176];
  _BYTE v43[176];
  uint64_t v44;

  v8 = *(_QWORD *)(a2 + 136);
  if (v8)
  {
    ObjectType = swift_getObjectType();
    v33 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 16);
    v33(v35, ObjectType, a5);
    v44 = v35[0];
    v14 = sub_242C00DB8();
    swift_bridgeObjectRelease();
    v15 = *(_QWORD *)(a6 + 48);
    if ((v15 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v15 < *(_QWORD *)(v14 + 16))
    {
      v16 = *(_QWORD *)(v14 + 8 * v15 + 32);
      swift_bridgeObjectRelease();
      v17 = a3 * v16;
      if ((unsigned __int128)(a3 * (__int128)v16) >> 64 == (a3 * v16) >> 63)
      {
        v18 = sub_242BC8590(ObjectType, a5);
        if ((unsigned __int128)(v17 * (__int128)v18) >> 64 == (v17 * v18) >> 63)
        {
          *(_QWORD *)(a2 + 136) = v8 + v17 * v18;
          v19 = a1[1];
          v20 = v19 == 0x10000;
          if (v19 == 0x10000)
            v21 = 163840;
          else
            v21 = 294912;
          if (v20)
            v22 = 1;
          else
            v22 = 3;
          a1[1] = v21;
          if (*(_DWORD *)(a2 + 4) == 0x10000)
            v23 = 163840;
          else
            v23 = 294912;
          *(_DWORD *)(a2 + 4) = v23;
          v33(&v44, ObjectType, a5);
          if (!*(_QWORD *)(v44 + 16))
          {
LABEL_27:
            memset(v35, 0, sizeof(v35));
            v36 = -1;
            v38 = 0;
            v39 = 0;
            v37 = 0;
            v40 = -1;
            v41 = 4;
            sub_242A59264();
          }
          v24 = *(_QWORD *)(v44 + 32);
          swift_bridgeObjectRelease();
          sub_242B54308(v24, v22);
          v33(v35, ObjectType, a5);
          v44 = v35[0];
          v25 = sub_242C00DB8();
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v25 + 16))
          {
            v26 = *(_QWORD *)(v25 + 32);
            swift_bridgeObjectRelease();
            sub_242B543F0(v26, v22);
            sub_242B54308(v24, v22);
            v27 = swift_getObjectType();
            (*(void (**)(_QWORD *__return_ptr, uint64_t))(a8 + 16))(v35, v27);
            v44 = v35[0];
            v28 = sub_242C00DB8();
            swift_bridgeObjectRelease();
            if (*(_QWORD *)(v28 + 16))
            {
              v29 = *(_QWORD *)(v28 + 32);
              swift_bridgeObjectRelease();
              sub_242B543F0(v29, v22);
              memcpy(__dst, a1, sizeof(__dst));
              memcpy(v43, (const void *)a2, sizeof(v43));
              sub_242C48A28();
              sub_242C489B0();
              return sub_242C478C4();
            }
            goto LABEL_26;
          }
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  sub_242A6A5B0();
  swift_allocError();
  *(_QWORD *)v31 = 0xD00000000000002CLL;
  *(_QWORD *)(v31 + 8) = 0x8000000242C72AF0;
  *(_BYTE *)(v31 + 16) = 1;
  return swift_willThrow();
}

#error "242C27F88: call analysis failed (funcsize=5)"

void sub_242C27F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _OWORD *v87;
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t ObjectType;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  OUTLINED_FUNCTION_18_1();
  a19 = v23;
  a20 = v24;
  v25 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_26_10();
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v89 - v28;
  v30 = OUTLINED_FUNCTION_14_1();
  v31 = *(_QWORD *)(v30 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_13_1();
  v97 = v33;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_64_0();
  v36 = v35;
  v98 = v20;
  v37 = OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_63_21(v37);
  v106 = v39;
  v107 = v38;
  if (!v38)
  {
    sub_242A6A5B0();
    v86 = OUTLINED_FUNCTION_24_1();
    *v87 = xmmword_242C62480;
    OUTLINED_FUNCTION_4_41(v86, (uint64_t)v87);
LABEL_15:
    OUTLINED_FUNCTION_0_9();
    return;
  }
  v40 = *(_QWORD *)(v98 + 72);
  v41 = *(_QWORD *)(v40 + 16);
  if (!v41)
  {
    OUTLINED_FUNCTION_80_16();
    goto LABEL_15;
  }
  v95 = v29;
  v96 = v22;
  v94 = OUTLINED_FUNCTION_64_3();
  ObjectType = swift_getObjectType();
  v93 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v106 + 16);
  OUTLINED_FUNCTION_28_1();
  v104 = 0;
  v42 = MEMORY[0x24BEE4AF8];
  v89 = v40;
  v90 = v31;
  v43 = (_BYTE *)(v40 + 40);
  v91 = v36;
  v92 = MEMORY[0x24BEE4AE0] + 8;
  v44 = v30;
  v45 = v31;
  v46 = v36;
  while (1)
  {
    v100 = v41;
    v101 = v42;
    v47 = *v43;
    v99 = v43;
    a10 = *((_QWORD *)v43 - 1);
    LOBYTE(v109) = v47;
    sub_242C480E0();
    OUTLINED_FUNCTION_25_50();
    sub_242B1D8D0(v48, v49, v50);
    v52 = v51;
    v103 = v25;
    v53 = swift_getObjectType();
    v54 = v98;
    v102 = v53;
    a10 = *(_QWORD *)(v52 + 16);
    swift_retain();
    sub_242C480E0();
    v93(&v109, ObjectType, v106);
    v108 = v109;
    v55 = (_QWORD *)sub_242C00DB8();
    OUTLINED_FUNCTION_81();
    sub_242B51AEC((uint64_t)&a10, v55, 2, v46);
    a10 = *(_QWORD *)(v52 + 16);
    sub_242C480E0();
    v56 = v46;
    v57 = v97;
    OUTLINED_FUNCTION_1_7((uint64_t)&a10, v97);
    v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    v59 = (uint64_t)v95;
    OUTLINED_FUNCTION_47_4((uint64_t)v95, v56);
    OUTLINED_FUNCTION_2_72(v59);
    v60 = v44;
    v61 = v96;
    v58(v96, v57, v60);
    v62 = OUTLINED_FUNCTION_24_51();
    v65 = __swift_storeEnumTagSinglePayload(v62, v63, v64, v60);
    MEMORY[0x24BDAC7A8](v65);
    v66 = v104;
    *(&v89 - 6) = v104;
    *(&v89 - 5) = v52;
    *(&v89 - 4) = (uint64_t)&off_251387678;
    *(&v89 - 3) = v54;
    v67 = v106;
    *(&v89 - 2) = v107;
    *(&v89 - 1) = v67;
    MEMORY[0x24BDAC7A8](v68);
    OUTLINED_FUNCTION_16_51();
    v69 = v102;
    v70 = v103;
    *(_QWORD *)(v71 - 64) = ObjectType;
    *(_QWORD *)(v71 - 56) = v69;
    *(_QWORD *)(v71 - 48) = v72;
    *(_QWORD *)(v71 - 40) = v73;
    *(_QWORD *)(v71 - 32) = v52;
    *(_QWORD *)(v71 - 24) = v61;
    *(_QWORD *)(v71 - 16) = sub_242C2AEB8;
    *(_QWORD *)(v71 - 8) = v74;
    sub_242BF66C0((uint64_t)sub_242C2AEA4, v75, v92, v71);
    v103 = v70;
    if (v70)
    {
      OUTLINED_FUNCTION_15_56(v61);
      OUTLINED_FUNCTION_15_56(v59);
      v88 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
      OUTLINED_FUNCTION_39_36();
      v88(v91, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_80_16();
      OUTLINED_FUNCTION_23_5();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_15_56(v61);
    OUTLINED_FUNCTION_15_56(v59);
    v76 = v90;
    OUTLINED_FUNCTION_39_36();
    v46 = v91;
    OUTLINED_FUNCTION_39_36();
    swift_release();
    v77 = *(_QWORD *)(v54 + 64);
    a10 = *(_QWORD *)(v52 + 16);
    v78 = TensorShape.subscript.getter(v77);
    v79 = __OFADD__(v66, v78);
    v80 = v66 + v78;
    if (v79)
      break;
    v44 = v60;
    v45 = v76;
    swift_retain();
    v42 = v101;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v104 = v80;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      OUTLINED_FUNCTION_70_19();
      v42 = v84;
    }
    v25 = v103;
    v82 = *(_QWORD *)(v42 + 16);
    if (v82 >= *(_QWORD *)(v42 + 24) >> 1)
    {
      OUTLINED_FUNCTION_70_19();
      v42 = v85;
    }
    *(_QWORD *)(v42 + 16) = v82 + 1;
    v83 = v42 + 16 * v82;
    *(_QWORD *)(v83 + 32) = v52;
    *(_QWORD *)(v83 + 40) = &off_251387678;
    swift_release();
    v43 = v99 + 16;
    v41 = v100 - 1;
    if (v100 == 1)
    {
      OUTLINED_FUNCTION_80_16();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  __break(1u);
}

uint64_t sub_242C283D8(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void (*v34)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v35;
  _QWORD v36[3];
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  _BYTE __dst[176];
  _BYTE v44[176];
  uint64_t v45;

  v8 = *(_QWORD *)(a1 + 136);
  if (v8)
  {
    ObjectType = swift_getObjectType();
    v34 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 16);
    v35 = ObjectType;
    v34(v36, ObjectType, a5);
    v45 = v36[0];
    v15 = sub_242C00DB8();
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(a6 + 64);
    if ((v16 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v16 < *(_QWORD *)(v15 + 16))
    {
      v17 = *(_QWORD *)(v15 + 8 * v16 + 32);
      swift_bridgeObjectRelease();
      v18 = a3 * v17;
      if ((unsigned __int128)(a3 * (__int128)v17) >> 64 == (a3 * v17) >> 63)
      {
        v19 = sub_242BC8590(v35, a5);
        if ((unsigned __int128)(v18 * (__int128)v19) >> 64 == (v18 * v19) >> 63)
        {
          *(_QWORD *)(a1 + 136) = v8 + v18 * v19;
          v20 = *(_DWORD *)(a1 + 4);
          v21 = v20 == 0x10000;
          if (v20 == 0x10000)
            v22 = 163840;
          else
            v22 = 294912;
          if (v21)
            v23 = 1;
          else
            v23 = 3;
          *(_DWORD *)(a1 + 4) = v22;
          if (a2[1] == 0x10000)
            v24 = 163840;
          else
            v24 = 294912;
          a2[1] = v24;
          v34(&v45, v35, a5);
          if (!*(_QWORD *)(v45 + 16))
          {
LABEL_27:
            memset(v36, 0, sizeof(v36));
            v37 = -1;
            v39 = 0;
            v40 = 0;
            v38 = 0;
            v41 = -1;
            v42 = 4;
            sub_242A59264();
          }
          v25 = *(_QWORD *)(v45 + 32);
          swift_bridgeObjectRelease();
          sub_242B54308(v25, v23);
          v26 = swift_getObjectType();
          (*(void (**)(_QWORD *__return_ptr, uint64_t))(a8 + 16))(v36, v26);
          v45 = v36[0];
          v27 = sub_242C00DB8();
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v27 + 16))
          {
            v28 = *(_QWORD *)(v27 + 32);
            swift_bridgeObjectRelease();
            sub_242B543F0(v28, v23);
            sub_242B54308(v25, v23);
            v34(v36, v35, a5);
            v45 = v36[0];
            v29 = sub_242C00DB8();
            swift_bridgeObjectRelease();
            if (*(_QWORD *)(v29 + 16))
            {
              v30 = *(_QWORD *)(v29 + 32);
              swift_bridgeObjectRelease();
              sub_242B543F0(v30, v23);
              memcpy(__dst, (const void *)a1, sizeof(__dst));
              memcpy(v44, a2, sizeof(v44));
              sub_242C48A28();
              sub_242C489B0();
              return sub_242C478C4();
            }
            goto LABEL_26;
          }
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  sub_242A6A5B0();
  swift_allocError();
  *(_QWORD *)v32 = 0xD00000000000002BLL;
  *(_QWORD *)(v32 + 8) = 0x8000000242C72B20;
  *(_BYTE *)(v32 + 16) = 1;
  return swift_willThrow();
}

#error "242C28738: call analysis failed (funcsize=5)"

uint64_t sub_242C28744(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_36_17();
  sub_242A9E618(v4, a1);
  if (v6)
  {
    v7 = v5;
    OUTLINED_FUNCTION_64_3();
    v8 = OUTLINED_FUNCTION_65_3();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v7 + 16))(&v14, v8, v7);
    swift_unknownObjectRetain();
    swift_retain();
    sub_242B1E858();
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v2 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v2 + 16) = xmmword_242C4B7D0;
    *(_QWORD *)(v2 + 32) = v12;
    *(_QWORD *)(v2 + 40) = &off_251387678;
    OUTLINED_FUNCTION_49_4();
  }
  else
  {
    sub_242A6A5B0();
    v9 = OUTLINED_FUNCTION_24_1();
    *v10 = xmmword_242C62490;
    OUTLINED_FUNCTION_4_41(v9, (uint64_t)v10);
  }
  return v2;
}

void sub_242C28880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, unsigned __int8 a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const float *v34;
  const float *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float *v42;
  uint64_t v43;

  OUTLINED_FUNCTION_18_1();
  a22 = v24;
  a23 = v25;
  v43 = v26;
  v28 = v27;
  v42 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = sub_242C49208();
  v37 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_59_23();
  v38 = OUTLINED_FUNCTION_65_3();
  (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(v31 + 8))(&a13, v38, v31);
  a12 = *(_BYTE *)(v28 + 48);
  sub_242BC8698(v38, v31, v39);
  v41 = v40;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v23, *MEMORY[0x24BEE38B8], v36);
  sub_242AB0FE8(v35, v33, &a13, v42, v43, &a12, v41, v23);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v23, v36);
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C28968(uint64_t a1)
{
  return sub_242C28744(a1);
}

void sub_242C2897C()
{
  __asm { BR              X10 }
}

uint64_t sub_242C289B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *MEMORY[0x24BEDF750];
  v2 = sub_242C477B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v0, v1, v2);
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v2);
}

void sub_242C28A28()
{
  sub_242C477B0();
  JUMPOUT(0x242C28A14);
}

void sub_242C28A44()
{
  sub_242B2ED20();
  sub_242A59170();
}

void sub_242C28B20()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD v38[17];
  uint64_t v39;

  OUTLINED_FUNCTION_18_1();
  v39 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_13_1();
  v38[7] = v3;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8_11();
  v38[8] = v5;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v6);
  v38[9] = (char *)v38 - v7;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v38 - v9;
  MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_64_0();
  v38[6] = v13;
  v14 = OUTLINED_FUNCTION_14_1();
  v38[16] = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_13_1();
  v38[13] = v16;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_8_11();
  v38[14] = v18;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v19);
  v38[15] = (char *)v38 - v20;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_55_27();
  MEMORY[0x24BDAC7A8](v22);
  v38[11] = (char *)v38 - v23;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_64_0();
  v38[12] = v25;
  v26 = sub_242B89308();
  OUTLINED_FUNCTION_48_30(v26);
  if (v27)
  {
    v29 = v27;
    v38[5] = v28;
    v30 = sub_242B89308();
    OUTLINED_FUNCTION_48_30(v30);
    v38[10] = v32;
    if (v32)
    {
      v38[3] = v31;
      v33 = sub_242B89308();
      OUTLINED_FUNCTION_48_30(v33);
      v38[4] = v34;
      if (v34)
      {
        v35 = (char *)&loc_242C28D20 + 4 * byte_242C624D7[*(unsigned __int8 *)(v0 + 80)];
        v38[1] = v29;
        __asm { BR              X10 }
      }
      OUTLINED_FUNCTION_2_11();
    }
    OUTLINED_FUNCTION_2_11();
  }
  sub_242B2ED20();
  OUTLINED_FUNCTION_18_11();
  v36 = OUTLINED_FUNCTION_24_1();
  *v37 = v10;
  v37[1] = v14;
  OUTLINED_FUNCTION_4_41(v36, (uint64_t)v37);
  OUTLINED_FUNCTION_0_9();
}

void sub_242C28D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ObjectType;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v7 = sub_242C4925C(7107949, 0xE300000000000000, 7628147, 0xE300000000000000, 0);
  v8 = swift_bridgeObjectRelease(0xE300000000000000);
  if ((v7 & 1) != 0)
  {
    v9 = OUTLINED_FUNCTION_64_3(v8);
    v10 = OUTLINED_FUNCTION_65_3();
    ((void (*)(void))OUTLINED_FUNCTION_47_30)();
    OUTLINED_FUNCTION_47_30(v10);
    v11 = *(unsigned __int8 *)(v6 - 65);
    *(_BYTE *)(v6 - 66) = v11;
    v12 = v11 - 1;
    if (v12 > 0xA)
      v13 = 1;
    else
      v13 = qword_242C62618[(char)v12];
    v5 = *(_QWORD *)(v6 - 312);
    v16 = *(_QWORD *)(v6 - 200);
    v17 = *(_QWORD *)(v6 - 184);
    v15 = sub_242B1E574(v6 - 176, v6 - 66, v13, v9);
    *(_QWORD *)(v6 - 184) = v17;
  }
  else
  {
    v14 = swift_unknownObjectRetain(*(_QWORD *)(v6 - 288));
    v15 = sub_242C266F8(v14, v3);
    v16 = *(_QWORD *)(v6 - 200);
  }
  v18 = *(unsigned __int8 *)(v4 + 48);
  *(_QWORD *)(v6 - 304) = v15;
  if (v18)
  {
    if (v18 != 2)
    {
      swift_release(v15);
      *(_QWORD *)(v6 - 176) = sub_242B2ED20();
      *(_QWORD *)(v6 - 168) = v70;
      v71 = OUTLINED_FUNCTION_33_41("applied(to:)");
      sub_242A59170(v71);
    }
    ObjectType = swift_getObjectType(v5);
    v49 = *(_QWORD *)(v6 - 280);
    v50 = *(void (**)(uint64_t, uint64_t))(v49 + 16);
    swift_retain(v15);
    v50(ObjectType, v49);
    v51 = OUTLINED_FUNCTION_1_10(v6 - 176);
    *(_QWORD *)(v6 - 224) = OUTLINED_FUNCTION_240_0(v51);
    OUTLINED_FUNCTION_46_29();
    v52 = *(_QWORD *)(v6 - 208);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(v15 + 16));
    v53 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v54 = v16;
    v55 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_47_4(v55, v52);
    OUTLINED_FUNCTION_2_72(v55);
    v56 = *(_QWORD *)(v6 - 256);
    OUTLINED_FUNCTION_47_4(v56, v54);
    OUTLINED_FUNCTION_2_72(v56);
    v57 = *(_QWORD *)(v6 - 264);
    OUTLINED_FUNCTION_47_4(v57, v53);
    v58 = OUTLINED_FUNCTION_2_72(v57);
    v59 = MEMORY[0x24BDAC7A8](v58);
    OUTLINED_FUNCTION_57_27(v59);
    *(_QWORD *)(v60 - 64) = v5;
    *(_QWORD *)(v60 - 56) = v61;
    v62 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v60 - 48) = v56;
    *(_QWORD *)(v60 - 40) = v62;
    *(_QWORD *)(v60 - 32) = &off_251387678;
    *(_QWORD *)(v60 - 24) = v57;
    *(_QWORD *)(v60 - 16) = sub_242C2AF34;
    *(_QWORD *)(v60 - 8) = v4;
    OUTLINED_FUNCTION_56_23(v55, sub_242AA4900);
    if (ObjectType)
    {
      sub_242AB8F10(v57, &unk_2572216B8);
      OUTLINED_FUNCTION_50_26(v56);
      OUTLINED_FUNCTION_50_26(v55);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
      v63 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
      v64 = OUTLINED_FUNCTION_18_55(v63);
      OUTLINED_FUNCTION_49_4(v64);
      v47 = v5;
      goto LABEL_13;
    }
    sub_242AB8F10(v57, &unk_2572216B8);
    OUTLINED_FUNCTION_50_26(v56);
    OUTLINED_FUNCTION_50_26(v55);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
  }
  else
  {
    *(_QWORD *)(v6 - 208) = *(_QWORD *)(v4 + 40);
    v19 = swift_getObjectType(*(_QWORD *)(v6 - 240));
    *(_QWORD *)(v6 - 248) = v2;
    *(_QWORD *)(v6 - 216) = v0;
    v20 = v19;
    *(_QWORD *)(v6 - 200) = v19;
    v21 = *(_QWORD *)(v6 - 296);
    v22 = *(void (**)(uint64_t, uint64_t))(v21 + 16);
    swift_retain(v15);
    v22(v20, v21);
    v23 = *(_QWORD *)(v6 - 272);
    v24 = *(_QWORD *)(v6 - 224);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v25 = swift_getObjectType(v5);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 - 280) + 16))(v25);
    v26 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(*(_QWORD *)(v6 - 304) + 16));
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_47_4(v23, v24);
    v27 = OUTLINED_FUNCTION_71_14(v23);
    v28 = v1;
    v29 = v26;
    v30 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_47_4(v27, v31);
    v32 = OUTLINED_FUNCTION_71_14(v29);
    OUTLINED_FUNCTION_47_4(v32, v33);
    v34 = OUTLINED_FUNCTION_2_72(v30);
    v35 = MEMORY[0x24BDAC7A8](v34);
    v36 = OUTLINED_FUNCTION_77_16(v35);
    *(_QWORD *)(v37 - 16) = v38;
    *(_QWORD *)(v37 - 8) = v4;
    v39 = MEMORY[0x24BDAC7A8](v36);
    OUTLINED_FUNCTION_57_27(v39);
    *(_QWORD *)(v40 - 64) = v42;
    *(_QWORD *)(v40 - 56) = v41;
    v43 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v40 - 48) = v29;
    *(_QWORD *)(v40 - 40) = v43;
    *(_QWORD *)(v40 - 32) = &off_251387678;
    *(_QWORD *)(v40 - 24) = v30;
    *(_QWORD *)(v40 - 16) = sub_242C2AF4C;
    *(_QWORD *)(v40 - 8) = v44;
    OUTLINED_FUNCTION_56_23(v23, sub_242AA4900);
    if (v22)
    {
      sub_242AB8F10(v30, &unk_2572216B8);
      OUTLINED_FUNCTION_33_9(v29);
      OUTLINED_FUNCTION_33_9(v23);
      OUTLINED_FUNCTION_9_72(v28);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
      v45 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
      v46 = OUTLINED_FUNCTION_18_55(v45);
      OUTLINED_FUNCTION_49_4(v46);
      v47 = *(_QWORD *)(v6 - 312);
LABEL_13:
      swift_unknownObjectRelease(v47);
      OUTLINED_FUNCTION_23_5(*(_QWORD *)(v6 - 304));
      goto LABEL_18;
    }
    sub_242AB8F10(v30, &unk_2572216B8);
    OUTLINED_FUNCTION_33_9(v29);
    OUTLINED_FUNCTION_33_9(v23);
    OUTLINED_FUNCTION_9_72(v28);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
  }
  v65 = *(_QWORD *)(v6 - 304);
  swift_release(v65);
  v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
  v67 = OUTLINED_FUNCTION_5_4(v66);
  *(_OWORD *)(v67 + 16) = xmmword_242C4B7D0;
  *(_QWORD *)(v67 + 32) = v65;
  *(_QWORD *)(v67 + 40) = &off_251387678;
  v68 = OUTLINED_FUNCTION_18_55(v67);
  v69 = OUTLINED_FUNCTION_49_4(v68);
  OUTLINED_FUNCTION_2_11(v69);
LABEL_18:
  JUMPOUT(0x242C28D60);
}

void sub_242C28D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ObjectType;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v7 = sub_242C4925C(7889261, 0xE300000000000000, 7628147, 0xE300000000000000, 0);
  v8 = swift_bridgeObjectRelease(0xE300000000000000);
  if ((v7 & 1) != 0)
  {
    v9 = OUTLINED_FUNCTION_64_3(v8);
    v10 = OUTLINED_FUNCTION_65_3();
    OUTLINED_FUNCTION_47_30(v10);
    OUTLINED_FUNCTION_47_30(v10);
    v11 = *(unsigned __int8 *)(v6 - 65);
    *(_BYTE *)(v6 - 66) = v11;
    v12 = v11 - 1;
    if (v12 > 0xA)
      v13 = 1;
    else
      v13 = qword_242C62618[(char)v12];
    v5 = *(_QWORD *)(v6 - 312);
    v16 = *(_QWORD *)(v6 - 200);
    v17 = *(_QWORD *)(v6 - 184);
    v15 = sub_242B1E574(v6 - 176, v6 - 66, v13, v9);
    *(_QWORD *)(v6 - 184) = v17;
  }
  else
  {
    v14 = swift_unknownObjectRetain(*(_QWORD *)(v6 - 288));
    v15 = sub_242C266F8(v14, v3);
    v16 = *(_QWORD *)(v6 - 200);
  }
  v18 = *(unsigned __int8 *)(v4 + 48);
  *(_QWORD *)(v6 - 304) = v15;
  if (v18)
  {
    if (v18 != 2)
    {
      swift_release(v15);
      *(_QWORD *)(v6 - 176) = sub_242B2ED20();
      *(_QWORD *)(v6 - 168) = v70;
      v71 = OUTLINED_FUNCTION_33_41("applied(to:)");
      sub_242A59170(v71);
    }
    ObjectType = swift_getObjectType(v5);
    v49 = *(_QWORD *)(v6 - 280);
    v50 = *(void (**)(uint64_t, uint64_t))(v49 + 16);
    swift_retain(v15);
    v50(ObjectType, v49);
    v51 = OUTLINED_FUNCTION_1_10(v6 - 176);
    *(_QWORD *)(v6 - 224) = OUTLINED_FUNCTION_240_0(v51);
    OUTLINED_FUNCTION_46_29();
    v52 = *(_QWORD *)(v6 - 208);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(v15 + 16));
    v53 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v54 = v16;
    v55 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_47_4(v55, v52);
    OUTLINED_FUNCTION_2_72(v55);
    v56 = *(_QWORD *)(v6 - 256);
    OUTLINED_FUNCTION_47_4(v56, v54);
    OUTLINED_FUNCTION_2_72(v56);
    v57 = *(_QWORD *)(v6 - 264);
    OUTLINED_FUNCTION_47_4(v57, v53);
    v58 = OUTLINED_FUNCTION_2_72(v57);
    v59 = MEMORY[0x24BDAC7A8](v58);
    OUTLINED_FUNCTION_57_27(v59);
    *(_QWORD *)(v60 - 64) = v5;
    *(_QWORD *)(v60 - 56) = v61;
    v62 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v60 - 48) = v56;
    *(_QWORD *)(v60 - 40) = v62;
    *(_QWORD *)(v60 - 32) = &off_251387678;
    *(_QWORD *)(v60 - 24) = v57;
    *(_QWORD *)(v60 - 16) = sub_242C2AF34;
    *(_QWORD *)(v60 - 8) = v4;
    OUTLINED_FUNCTION_56_23(v55, sub_242AA4900);
    if (ObjectType)
    {
      sub_242AB8F10(v57, &unk_2572216B8);
      OUTLINED_FUNCTION_50_26(v56);
      OUTLINED_FUNCTION_50_26(v55);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
      v63 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
      v64 = OUTLINED_FUNCTION_18_55(v63);
      OUTLINED_FUNCTION_49_4(v64);
      v47 = v5;
      goto LABEL_13;
    }
    sub_242AB8F10(v57, &unk_2572216B8);
    OUTLINED_FUNCTION_50_26(v56);
    OUTLINED_FUNCTION_50_26(v55);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
  }
  else
  {
    *(_QWORD *)(v6 - 208) = *(_QWORD *)(v4 + 40);
    v19 = swift_getObjectType(*(_QWORD *)(v6 - 240));
    *(_QWORD *)(v6 - 248) = v2;
    *(_QWORD *)(v6 - 216) = v0;
    v20 = v19;
    *(_QWORD *)(v6 - 200) = v19;
    v21 = *(_QWORD *)(v6 - 296);
    v22 = *(void (**)(uint64_t, uint64_t))(v21 + 16);
    swift_retain(v15);
    v22(v20, v21);
    v23 = *(_QWORD *)(v6 - 272);
    v24 = *(_QWORD *)(v6 - 224);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v25 = swift_getObjectType(v5);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 - 280) + 16))(v25);
    v26 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(*(_QWORD *)(v6 - 304) + 16));
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_47_4(v23, v24);
    v27 = OUTLINED_FUNCTION_71_14(v23);
    v28 = v1;
    v29 = v26;
    v30 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_47_4(v27, v31);
    v32 = OUTLINED_FUNCTION_71_14(v29);
    OUTLINED_FUNCTION_47_4(v32, v33);
    v34 = OUTLINED_FUNCTION_2_72(v30);
    v35 = MEMORY[0x24BDAC7A8](v34);
    v36 = OUTLINED_FUNCTION_77_16(v35);
    *(_QWORD *)(v37 - 16) = v38;
    *(_QWORD *)(v37 - 8) = v4;
    v39 = MEMORY[0x24BDAC7A8](v36);
    OUTLINED_FUNCTION_57_27(v39);
    *(_QWORD *)(v40 - 64) = v42;
    *(_QWORD *)(v40 - 56) = v41;
    v43 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v40 - 48) = v29;
    *(_QWORD *)(v40 - 40) = v43;
    *(_QWORD *)(v40 - 32) = &off_251387678;
    *(_QWORD *)(v40 - 24) = v30;
    *(_QWORD *)(v40 - 16) = sub_242C2AF4C;
    *(_QWORD *)(v40 - 8) = v44;
    OUTLINED_FUNCTION_56_23(v23, sub_242AA4900);
    if (v22)
    {
      sub_242AB8F10(v30, &unk_2572216B8);
      OUTLINED_FUNCTION_33_9(v29);
      OUTLINED_FUNCTION_33_9(v23);
      OUTLINED_FUNCTION_9_72(v28);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
      v45 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
      v46 = OUTLINED_FUNCTION_18_55(v45);
      OUTLINED_FUNCTION_49_4(v46);
      v47 = *(_QWORD *)(v6 - 312);
LABEL_13:
      swift_unknownObjectRelease(v47);
      OUTLINED_FUNCTION_23_5(*(_QWORD *)(v6 - 304));
      goto LABEL_18;
    }
    sub_242AB8F10(v30, &unk_2572216B8);
    OUTLINED_FUNCTION_33_9(v29);
    OUTLINED_FUNCTION_33_9(v23);
    OUTLINED_FUNCTION_9_72(v28);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
  }
  v65 = *(_QWORD *)(v6 - 304);
  swift_release(v65);
  v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
  v67 = OUTLINED_FUNCTION_5_4(v66);
  *(_OWORD *)(v67 + 16) = xmmword_242C4B7D0;
  *(_QWORD *)(v67 + 32) = v65;
  *(_QWORD *)(v67 + 40) = &off_251387678;
  v68 = OUTLINED_FUNCTION_18_55(v67);
  v69 = OUTLINED_FUNCTION_49_4(v68);
  OUTLINED_FUNCTION_2_11(v69);
LABEL_18:
  JUMPOUT(0x242C28D60);
}

void sub_242C28D8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ObjectType;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v7 = sub_242C4925C(7235949, 0xE300000000000000, 7628147, 0xE300000000000000, 0);
  v8 = swift_bridgeObjectRelease(0xE300000000000000);
  if ((v7 & 1) != 0)
  {
    v9 = OUTLINED_FUNCTION_64_3(v8);
    v10 = OUTLINED_FUNCTION_65_3();
    OUTLINED_FUNCTION_47_30(v10);
    OUTLINED_FUNCTION_47_30(v10);
    v11 = *(unsigned __int8 *)(v6 - 65);
    *(_BYTE *)(v6 - 66) = v11;
    v12 = v11 - 1;
    if (v12 > 0xA)
      v13 = 1;
    else
      v13 = qword_242C62618[(char)v12];
    v5 = *(_QWORD *)(v6 - 312);
    v16 = *(_QWORD *)(v6 - 200);
    v17 = *(_QWORD *)(v6 - 184);
    v15 = sub_242B1E574(v6 - 176, v6 - 66, v13, v9);
    *(_QWORD *)(v6 - 184) = v17;
  }
  else
  {
    v14 = swift_unknownObjectRetain(*(_QWORD *)(v6 - 288));
    v15 = sub_242C266F8(v14, v3);
    v16 = *(_QWORD *)(v6 - 200);
  }
  v18 = *(unsigned __int8 *)(v4 + 48);
  *(_QWORD *)(v6 - 304) = v15;
  if (v18)
  {
    if (v18 != 2)
    {
      swift_release(v15);
      *(_QWORD *)(v6 - 176) = sub_242B2ED20();
      *(_QWORD *)(v6 - 168) = v70;
      v71 = OUTLINED_FUNCTION_33_41("applied(to:)");
      sub_242A59170(v71);
    }
    ObjectType = swift_getObjectType(v5);
    v49 = *(_QWORD *)(v6 - 280);
    v50 = *(void (**)(uint64_t, uint64_t))(v49 + 16);
    swift_retain(v15);
    v50(ObjectType, v49);
    v51 = OUTLINED_FUNCTION_1_10(v6 - 176);
    *(_QWORD *)(v6 - 224) = OUTLINED_FUNCTION_240_0(v51);
    OUTLINED_FUNCTION_46_29();
    v52 = *(_QWORD *)(v6 - 208);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(v15 + 16));
    v53 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v54 = v16;
    v55 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_47_4(v55, v52);
    OUTLINED_FUNCTION_2_72(v55);
    v56 = *(_QWORD *)(v6 - 256);
    OUTLINED_FUNCTION_47_4(v56, v54);
    OUTLINED_FUNCTION_2_72(v56);
    v57 = *(_QWORD *)(v6 - 264);
    OUTLINED_FUNCTION_47_4(v57, v53);
    v58 = OUTLINED_FUNCTION_2_72(v57);
    v59 = MEMORY[0x24BDAC7A8](v58);
    OUTLINED_FUNCTION_57_27(v59);
    *(_QWORD *)(v60 - 64) = v5;
    *(_QWORD *)(v60 - 56) = v61;
    v62 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v60 - 48) = v56;
    *(_QWORD *)(v60 - 40) = v62;
    *(_QWORD *)(v60 - 32) = &off_251387678;
    *(_QWORD *)(v60 - 24) = v57;
    *(_QWORD *)(v60 - 16) = sub_242C2AF34;
    *(_QWORD *)(v60 - 8) = v4;
    OUTLINED_FUNCTION_56_23(v55, sub_242AA4900);
    if (ObjectType)
    {
      sub_242AB8F10(v57, &unk_2572216B8);
      OUTLINED_FUNCTION_50_26(v56);
      OUTLINED_FUNCTION_50_26(v55);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
      v63 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
      v64 = OUTLINED_FUNCTION_18_55(v63);
      OUTLINED_FUNCTION_49_4(v64);
      v47 = v5;
      goto LABEL_13;
    }
    sub_242AB8F10(v57, &unk_2572216B8);
    OUTLINED_FUNCTION_50_26(v56);
    OUTLINED_FUNCTION_50_26(v55);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 216));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 208));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 200));
  }
  else
  {
    *(_QWORD *)(v6 - 208) = *(_QWORD *)(v4 + 40);
    v19 = swift_getObjectType(*(_QWORD *)(v6 - 240));
    *(_QWORD *)(v6 - 248) = v2;
    *(_QWORD *)(v6 - 216) = v0;
    v20 = v19;
    *(_QWORD *)(v6 - 200) = v19;
    v21 = *(_QWORD *)(v6 - 296);
    v22 = *(void (**)(uint64_t, uint64_t))(v21 + 16);
    swift_retain(v15);
    v22(v20, v21);
    v23 = *(_QWORD *)(v6 - 272);
    v24 = *(_QWORD *)(v6 - 224);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    v25 = swift_getObjectType(v5);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 - 280) + 16))(v25);
    v26 = *(_QWORD *)(v6 - 248);
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_61_23(*(_QWORD *)(*(_QWORD *)(v6 - 304) + 16));
    OUTLINED_FUNCTION_1_10(v6 - 176);
    OUTLINED_FUNCTION_47_4(v23, v24);
    v27 = OUTLINED_FUNCTION_71_14(v23);
    v28 = v1;
    v29 = v26;
    v30 = *(_QWORD *)(v6 - 216);
    OUTLINED_FUNCTION_47_4(v27, v31);
    v32 = OUTLINED_FUNCTION_71_14(v29);
    OUTLINED_FUNCTION_47_4(v32, v33);
    v34 = OUTLINED_FUNCTION_2_72(v30);
    v35 = MEMORY[0x24BDAC7A8](v34);
    v36 = OUTLINED_FUNCTION_77_16(v35);
    *(_QWORD *)(v37 - 16) = v38;
    *(_QWORD *)(v37 - 8) = v4;
    v39 = MEMORY[0x24BDAC7A8](v36);
    OUTLINED_FUNCTION_57_27(v39);
    *(_QWORD *)(v40 - 64) = v42;
    *(_QWORD *)(v40 - 56) = v41;
    v43 = *(_QWORD *)(v6 - 304);
    *(_QWORD *)(v40 - 48) = v29;
    *(_QWORD *)(v40 - 40) = v43;
    *(_QWORD *)(v40 - 32) = &off_251387678;
    *(_QWORD *)(v40 - 24) = v30;
    *(_QWORD *)(v40 - 16) = sub_242C2AF4C;
    *(_QWORD *)(v40 - 8) = v44;
    OUTLINED_FUNCTION_56_23(v23, sub_242AA4900);
    if (v22)
    {
      sub_242AB8F10(v30, &unk_2572216B8);
      OUTLINED_FUNCTION_33_9(v29);
      OUTLINED_FUNCTION_33_9(v23);
      OUTLINED_FUNCTION_9_72(v28);
      OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
      v45 = OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
      v46 = OUTLINED_FUNCTION_18_55(v45);
      OUTLINED_FUNCTION_49_4(v46);
      v47 = *(_QWORD *)(v6 - 312);
LABEL_13:
      swift_unknownObjectRelease(v47);
      OUTLINED_FUNCTION_23_5(*(_QWORD *)(v6 - 304));
      goto LABEL_18;
    }
    sub_242AB8F10(v30, &unk_2572216B8);
    OUTLINED_FUNCTION_33_9(v29);
    OUTLINED_FUNCTION_33_9(v23);
    OUTLINED_FUNCTION_9_72(v28);
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 232));
    OUTLINED_FUNCTION_9_72(*(_QWORD *)(v6 - 224));
  }
  v65 = *(_QWORD *)(v6 - 304);
  swift_release(v65);
  v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
  v67 = OUTLINED_FUNCTION_5_4(v66);
  *(_OWORD *)(v67 + 16) = xmmword_242C4B7D0;
  *(_QWORD *)(v67 + 32) = v65;
  *(_QWORD *)(v67 + 40) = &off_251387678;
  v68 = OUTLINED_FUNCTION_18_55(v67);
  v69 = OUTLINED_FUNCTION_49_4(v68);
  OUTLINED_FUNCTION_2_11(v69);
LABEL_18:
  JUMPOUT(0x242C28D60);
}

void sub_242C28D98()
{
  swift_bridgeObjectRelease();
  JUMPOUT(0x242C28DD4);
}

uint64_t sub_242C29324(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257228448);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242C2897C();
  sub_242C48A28();
  sub_242C489B0();
  sub_242B544D8(a1);
  return sub_242AB8F10((uint64_t)v4, &qword_257228448);
}

uint64_t sub_242C2940C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257228448);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242C2897C();
  sub_242C48A28();
  sub_242C489B0();
  sub_242B54828(a1);
  return sub_242AB8F10((uint64_t)v4, &qword_257228448);
}

void sub_242C294E8()
{
  sub_242C28B20();
}

void sub_242C294FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t ObjectType;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[12];

  OUTLINED_FUNCTION_18_1();
  a19 = v23;
  a20 = v24;
  v120 = v21;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_13_1();
  v117 = v28;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v29);
  v118 = (char *)&v109 - v30;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_55_27();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v109 - v33;
  MEMORY[0x24BDAC7A8](v35);
  v37 = (char *)&v109 - v36;
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_64_0();
  v116 = v39;
  v40 = OUTLINED_FUNCTION_14_1();
  v126 = *(_QWORD *)(v40 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_13_1();
  v123 = v42;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v43);
  v124 = (uint64_t)&v109 - v44;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_8_11();
  v125 = v46;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_8_11();
  v121 = v48;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_8_11();
  v122 = v50;
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_64_0();
  v53 = v52;
  v54 = sub_242B89308();
  sub_242A9E618(v54, v26);
  if (v55)
  {
    v57 = v55;
    v119 = v56;
    v58 = sub_242B89308();
    sub_242A9E618(v58, v26);
    if (v59)
    {
      v110 = v34;
      v111 = v22;
      v61 = v59;
      v62 = v60;
      OUTLINED_FUNCTION_64_3();
      v127[0] = *(_QWORD *)(v20 + 80);
      sub_242C480E0();
      OUTLINED_FUNCTION_25_50();
      v63 = v120;
      sub_242B1D8D0(v64, v65, v66);
      v68 = v67;
      v69 = *(unsigned __int8 *)(v20 + 56);
      v120 = v67;
      v114 = v63;
      v115 = v61;
      v113 = v57;
      v112 = v62;
      if (v69)
      {
        if (v69 != 2)
        {
          v127[0] = sub_242B9E2CC();
          v127[1] = v108;
          OUTLINED_FUNCTION_33_41();
          sub_242A59170();
        }
        ObjectType = swift_getObjectType();
        v122 = ObjectType;
        v92 = *(_QWORD *)(v62 + 16);
        OUTLINED_FUNCTION_158_0();
        v93 = v68;
        OUTLINED_FUNCTION_190_2(ObjectType);
        v94 = v125;
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v125);
        v95 = OUTLINED_FUNCTION_240_0();
        v96 = v119;
        OUTLINED_FUNCTION_42_34(v95);
        v97 = v124;
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v124);
        OUTLINED_FUNCTION_61_23(*(_QWORD *)(v93 + 16));
        v98 = v123;
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v123);
        v99 = v111;
        OUTLINED_FUNCTION_5_7(v111, v94);
        OUTLINED_FUNCTION_0_10(v99);
        v100 = (uint64_t)v118;
        OUTLINED_FUNCTION_5_7((uint64_t)v118, v97);
        OUTLINED_FUNCTION_0_10(v100);
        v101 = v117;
        OUTLINED_FUNCTION_5_7(v117, v98);
        v102 = OUTLINED_FUNCTION_0_10(v101);
        MEMORY[0x24BDAC7A8](v102);
        OUTLINED_FUNCTION_16_51();
        *(_QWORD *)(v103 - 64) = v57;
        *(_QWORD *)(v103 - 56) = v96;
        v104 = v120;
        *(_QWORD *)(v103 - 48) = v100;
        *(_QWORD *)(v103 - 40) = v104;
        *(_QWORD *)(v103 - 32) = &off_251387678;
        *(_QWORD *)(v103 - 24) = v101;
        *(_QWORD *)(v103 - 16) = sub_242C29C5C;
        *(_QWORD *)(v103 - 8) = 0;
        OUTLINED_FUNCTION_71_3((uint64_t)sub_242AA4900, v105, MEMORY[0x24BEE4AE0] + 8, (uint64_t)&a16);
        if (v92)
        {
          sub_242AB8F10(v101, &qword_2572216B8);
          OUTLINED_FUNCTION_60_25(v100);
          OUTLINED_FUNCTION_60_25(v99);
          OUTLINED_FUNCTION_15_1(v123);
          OUTLINED_FUNCTION_15_1(v124);
          OUTLINED_FUNCTION_15_1(v125);
          OUTLINED_FUNCTION_18_55();
          OUTLINED_FUNCTION_43_9();
          goto LABEL_11;
        }
        sub_242AB8F10(v101, &qword_2572216B8);
        OUTLINED_FUNCTION_60_25(v100);
        OUTLINED_FUNCTION_60_25(v99);
        OUTLINED_FUNCTION_15_1(v123);
        OUTLINED_FUNCTION_15_1(v124);
        OUTLINED_FUNCTION_15_1(v125);
      }
      else
      {
        v123 = *(_QWORD *)(v20 + 40);
        v70 = swift_getObjectType();
        v124 = v70;
        v71 = *(_QWORD *)(v62 + 16);
        OUTLINED_FUNCTION_158_0();
        v118 = v37;
        v72 = v68;
        OUTLINED_FUNCTION_190_2(v70);
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v53);
        v73 = v57;
        v74 = OUTLINED_FUNCTION_240_0();
        OUTLINED_FUNCTION_46_29(v74, v119);
        v75 = v122;
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v122);
        v76 = *(_QWORD *)(v72 + 16);
        v77 = (uint64_t)v118;
        OUTLINED_FUNCTION_61_23(v76);
        v78 = v121;
        OUTLINED_FUNCTION_1_10((uint64_t)v127, v121);
        v79 = v116;
        v125 = v53;
        OUTLINED_FUNCTION_5_7(v116, v53);
        OUTLINED_FUNCTION_0_10(v79);
        OUTLINED_FUNCTION_5_7(v77, v75);
        OUTLINED_FUNCTION_0_10(v77);
        v80 = (uint64_t)v110;
        OUTLINED_FUNCTION_5_7((uint64_t)v110, v78);
        v81 = OUTLINED_FUNCTION_0_10(v80);
        MEMORY[0x24BDAC7A8](v81);
        OUTLINED_FUNCTION_77_16();
        *(_QWORD *)(v82 - 16) = v83;
        MEMORY[0x24BDAC7A8](v84);
        OUTLINED_FUNCTION_16_51();
        *(_QWORD *)(v85 - 64) = v73;
        v86 = v120;
        *(_QWORD *)(v85 - 56) = v119;
        *(_QWORD *)(v85 - 48) = v77;
        *(_QWORD *)(v85 - 40) = v86;
        *(_QWORD *)(v85 - 32) = &off_251387678;
        *(_QWORD *)(v85 - 24) = v80;
        *(_QWORD *)(v85 - 16) = sub_242C2AF64;
        *(_QWORD *)(v85 - 8) = v87;
        OUTLINED_FUNCTION_71_3((uint64_t)sub_242AA4900, v88, MEMORY[0x24BEE4AE0] + 8, (uint64_t)&a16);
        if (v71)
        {
          sub_242AB8F10(v80, &qword_2572216B8);
          OUTLINED_FUNCTION_35_34(v77);
          OUTLINED_FUNCTION_35_34(v79);
          OUTLINED_FUNCTION_6_6(v121);
          OUTLINED_FUNCTION_6_6(v122);
          OUTLINED_FUNCTION_6_6(v125);
          OUTLINED_FUNCTION_18_55();
          swift_unknownObjectRelease();
LABEL_11:
          OUTLINED_FUNCTION_23_5();
          goto LABEL_12;
        }
        sub_242AB8F10(v80, &qword_2572216B8);
        OUTLINED_FUNCTION_35_34(v77);
        OUTLINED_FUNCTION_35_34(v79);
        OUTLINED_FUNCTION_6_6(v121);
        OUTLINED_FUNCTION_6_6(v122);
        OUTLINED_FUNCTION_6_6(v125);
      }
      v106 = v120;
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v107 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v107 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v107 + 32) = v106;
      *(_QWORD *)(v107 + 40) = &off_251387678;
      OUTLINED_FUNCTION_32_10();
      swift_unknownObjectRelease();
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_32_10();
  }
  sub_242B9E2CC();
  OUTLINED_FUNCTION_18_11();
  v89 = OUTLINED_FUNCTION_24_1();
  *v90 = v40;
  v90[1] = v53;
  OUTLINED_FUNCTION_4_41(v89, (uint64_t)v90);
LABEL_12:
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C29BE4()
{
  sub_242C48A28();
  sub_242C489B0();
  return sub_242C47948();
}

uint64_t sub_242C29C5C()
{
  sub_242C48A28();
  sub_242C489B0();
  return sub_242C47960();
}

#error "242C29CCC: call analysis failed (funcsize=5)"

uint64_t sub_242C29CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0;
  v3 = OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_63_21(v3);
  if (v4)
  {
    OUTLINED_FUNCTION_64_3();
    swift_unknownObjectRetain();
    swift_retain();
    sub_242C480E0();
    sub_242B1E9B0();
    if (!v1)
    {
      v8 = v7;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v2 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v2 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v2 + 32) = v8;
      *(_QWORD *)(v2 + 40) = &off_251387678;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    sub_242A6A5B0();
    v5 = OUTLINED_FUNCTION_24_1();
    *v6 = xmmword_242C624A0;
    OUTLINED_FUNCTION_4_41(v5, (uint64_t)v6);
  }
  return v2;
}

uint64_t sub_242C29E20(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  ObjectType = swift_getObjectType();
  OUTLINED_FUNCTION_47_30(ObjectType);
  OUTLINED_FUNCTION_47_30(ObjectType);
  sub_242C33648();
  v6 = v5;
  OUTLINED_FUNCTION_141();
  sub_242C29F0C(a1, a2, v9, v8, v6);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_136();
  return swift_bridgeObjectRelease();
}

void sub_242C29F0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  type metadata accessor for SliceOperation();
  v27 = sub_242C00DB8();
  v8 = *(_QWORD *)(v27 + 16);
  if (v8)
  {
    v26 = *(_QWORD *)(a5 + 16);
    if (v26)
    {
      v24 = a2;
      v9 = *(_QWORD *)(v27 + 32);
      sub_242C480E0();
      v10 = 0;
      v11 = a5;
      v12 = 0;
      v13 = (uint64_t *)(v11 + 48);
      v14 = MEMORY[0x24BEE4AF8];
      while (1)
      {
        v15 = v9 * *v13;
        if ((unsigned __int128)(v9 * (__int128)*v13) >> 64 != v15 >> 63)
          break;
        v16 = *(v13 - 2);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_242A5DFBC(0, *(_QWORD *)(v14 + 16) + 1, 1, v14);
          v14 = v21;
        }
        v18 = *(_QWORD *)(v14 + 16);
        v17 = *(_QWORD *)(v14 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_242A5DFBC(v17 > 1, v18 + 1, 1, v14);
          v14 = v22;
        }
        *(_QWORD *)(v14 + 16) = v18 + 1;
        *(_QWORD *)(v14 + 8 * v18 + 32) = v15;
        v19 = v9 * v16;
        if ((unsigned __int128)(v9 * (__int128)v16) >> 64 != (v9 * v16) >> 63)
          goto LABEL_25;
        v20 = __OFADD__(v12, v19);
        v12 += v19;
        if (v20)
          goto LABEL_26;
        if (v8 - 1 != v10)
        {
          if ((unint64_t)(v10 + 1) >= *(_QWORD *)(v27 + 16))
            goto LABEL_27;
          v13 += 3;
          v9 = *(_QWORD *)(v27 + 40 + 8 * v10++);
          if (v26 != v10)
            continue;
        }
        swift_bridgeObjectRelease();
        a2 = v24;
        goto LABEL_17;
      }
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
  }
  v12 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  if ((a4 - 1) > 0xAu)
    v23 = 1;
  else
    v23 = qword_242C62618[(char)(a4 - 1)];
  if ((unsigned __int128)(v12 * (__int128)v23) >> 64 != (v12 * v23) >> 63)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (!a1 || !__OFSUB__(a2 - a1, v12 * v23))
  {
    sub_242C2A188();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_29:
  __break(1u);
}

void sub_242C2A188()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unsigned int v15;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[184];
  _BYTE v47[184];
  _BYTE v48[176];
  int v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;

  OUTLINED_FUNCTION_18_1();
  v2 = v1;
  v66 = v3;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_14_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_36_11();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  v15 = *(unsigned __int8 *)(v2 + 8);
  if (v15 > 0xC || ((1 << v15) & 0x1777) == 0)
  {
    sub_242A6A5B0();
    OUTLINED_FUNCTION_24_1();
    *(_OWORD *)v30 = xmmword_242C624B0;
    *(_BYTE *)(v30 + 16) = 3;
    swift_willThrow();
LABEL_10:
    OUTLINED_FUNCTION_70_3();
    OUTLINED_FUNCTION_0_9();
    return;
  }
  v38 = v12;
  v39 = v11;
  v40 = v0;
  v17 = *(_QWORD **)v2;
  v18 = sub_242C48AD0();
  v19 = OUTLINED_FUNCTION_0_2();
  sub_242C37DF0(v19);
  v21 = v20;
  OUTLINED_FUNCTION_136();
  *(_QWORD *)&v41 = v21;
  OUTLINED_FUNCTION_1_10((uint64_t)&v41, (uint64_t)v14);
  LOBYTE(v41) = v15;
  sub_242C480E0();
  sub_242B5408C(v18, v14, v5, (uint64_t)v46);
  sub_242AB0920((uint64_t)v46, (uint64_t)v47);
  if (sub_242B03F18((uint64_t)v47) != 1)
  {
    memcpy(v48, v47, sizeof(v48));
    if (v17[2])
      OUTLINED_FUNCTION_0_2();
    else
      v17 = &unk_25137E2D8;
    *(_QWORD *)&v41 = v17;
    OUTLINED_FUNCTION_35_15((uint64_t)&v41, v9);
    v37 = sub_242C47918();
    sub_242C4790C();
    v35 = v42;
    v36 = v41;
    v34 = v43;
    v22 = v44;
    v23 = v45;
    sub_242C47924();
    v32 = v42;
    v33 = v41;
    v31 = v43;
    v24 = v44;
    v25 = v45;
    OUTLINED_FUNCTION_73_19();
    v27 = v26;
    OUTLINED_FUNCTION_73_19();
    v29 = v28;
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v9, v39);
    v49 = 0;
    v50 = v37;
    v51 = v36;
    v52 = v35;
    v53 = v34;
    v54 = v22;
    v55 = v23;
    v56 = v33;
    v57 = v32;
    v58 = v31;
    v59 = v24;
    v60 = v25;
    v61 = v66;
    v62 = v27;
    v63 = 0;
    v64 = v29;
    v65 = 1065353216;
    sub_242C48A28();
    OUTLINED_FUNCTION_25_50();
    sub_242C489B0();
    sub_242C478C4();
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_242C2A440()
{
  return sub_242C29CD8();
}

void sub_242C2A454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;

  OUTLINED_FUNCTION_18_1();
  v57 = v1;
  v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OUTLINED_FUNCTION_14_1();
  v58 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_36_11();
  v11 = v9 - v10;
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_305_0();
  v13 = sub_242B89308();
  OUTLINED_FUNCTION_6_37(v13);
  if (!v14)
    goto LABEL_6;
  v16 = v14;
  v17 = v15;
  v18 = sub_242B89308();
  OUTLINED_FUNCTION_6_37(v18);
  if (!v19)
  {
    OUTLINED_FUNCTION_23_13();
LABEL_6:
    sub_242A6A5B0();
    v46 = OUTLINED_FUNCTION_24_1();
    *v47 = 0xD000000000000013;
    v47[1] = 0x8000000242C6C6D0;
    OUTLINED_FUNCTION_4_41(v46, (uint64_t)v47);
    goto LABEL_7;
  }
  v21 = v20;
  v22 = *(_QWORD *)(v0 + 48);
  v23 = *(_QWORD *)(v22 + 16);
  v52 = v6;
  v24 = v22;
  v25 = v7;
  v26 = v2;
  v27 = v19;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v54 = v24;
  sub_242C480E0();
  v56 = v27;
  v28 = v25;
  v29 = v21;
  v30 = v57;
  v53 = sub_242C26268(0, v23, v29, v17, v24, v31);
  v32 = v11;
  OUTLINED_FUNCTION_64_3();
  v60 = *(_QWORD *)(v3 + 72);
  v59 = *(_BYTE *)(v3 + 80);
  sub_242C480E0();
  OUTLINED_FUNCTION_54_25(&v60, (uint64_t)&v59);
  v34 = v33;
  v51 = v30;
  v60 = *(_QWORD *)(v33 + 16);
  sub_242C480E0();
  OUTLINED_FUNCTION_1_10((uint64_t)&v60, v26);
  v35 = OUTLINED_FUNCTION_39_35();
  OUTLINED_FUNCTION_42_34(v35);
  OUTLINED_FUNCTION_1_10((uint64_t)&v60, v32);
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  v37 = (uint64_t)v52;
  v55 = v26;
  v36(v52, v26, v28);
  v38 = OUTLINED_FUNCTION_24_51();
  v57 = v28;
  v41 = __swift_storeEnumTagSinglePayload(v38, v39, v40, v28);
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_16_51();
  *(_QWORD *)(v42 - 64) = v16;
  *(_QWORD *)(v42 - 56) = v17;
  v43 = v32;
  v44 = v54;
  *(_QWORD *)(v42 - 48) = v32;
  *(_QWORD *)(v42 - 40) = v44;
  *(_QWORD *)(v42 - 32) = v53;
  *(_QWORD *)(v42 - 24) = v3;
  *(_QWORD *)(v42 - 16) = 1;
  v45 = v51;
  sub_242B5081C(v37, (void (*)(_BYTE *))sub_242C2AF7C);
  if (v45)
  {
    swift_release();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_23_13();
    sub_242AB8F10(v37, &qword_2572216B8);
    OUTLINED_FUNCTION_15_1(v55);
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_15_1(v32);
  }
  else
  {
    sub_242AB8F10(v37, &qword_2572216B8);
    OUTLINED_FUNCTION_81();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
    v48 = OUTLINED_FUNCTION_5_4();
    *(_OWORD *)(v48 + 16) = xmmword_242C4B7D0;
    *(_QWORD *)(v48 + 32) = v34;
    *(_QWORD *)(v48 + 40) = &off_251387678;
    OUTLINED_FUNCTION_23_13();
    swift_unknownObjectRelease();
    v49 = v57;
    v50 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v50(v55, v57);
    v50(v43, v49);
  }
LABEL_7:
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C2A784@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = a7;
  v20 = a8;
  v21 = a2;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  v16 = sub_242C47930();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, a3, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v16);
  v23 = a1;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = v19;
  sub_242BF6310((uint64_t)sub_242C2AFA0, (uint64_t)v22, MEMORY[0x24BEE4AE0] + 8, v20);
  return sub_242AB8F10((uint64_t)v15, &qword_2572216B8);
}

uint64_t sub_242C2A8B8(uint64_t a1, uint64_t a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v10 = sub_242C47624();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (_DWORD *)((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v13 = 0;
  (*(void (**)(_DWORD *, _QWORD, __n128))(v14 + 104))(v13, *MEMORY[0x24BEDF548], v11);
  sub_242C480E0();
  sub_242C480E0();
  sub_242B060E4(a3, a4);
  v16 = v15;
  v17 = *(_QWORD *)(v15 + 16);
  if (v17)
  {
    v25 = a2;
    v26 = a6;
    v27 = MEMORY[0x24BEE4AF8];
    sub_242AC38B0();
    v18 = 0;
    v19 = v27;
    v20 = *(_QWORD *)(v27 + 16);
    do
    {
      v21 = *(_OWORD *)(v16 + 16 * v18 + 32);
      v27 = v19;
      if (v20 >= *(_QWORD *)(v19 + 24) >> 1)
      {
        v24 = v21;
        sub_242AC38B0();
        v21 = v24;
        v19 = v27;
      }
      ++v18;
      *(_QWORD *)(v19 + 16) = v20 + 1;
      *(_OWORD *)(v19 + 16 * v20++ + 32) = v21;
    }
    while (v17 != v18);
  }
  swift_bridgeObjectRelease();
  sub_242C47678();
  sub_242C48A28();
  sub_242C489B0();
  if (sub_242C4766C())
  {
    sub_242C47618();
    return swift_release();
  }
  else
  {
    sub_242A6A5B0();
    swift_allocError();
    *(_QWORD *)v23 = 0xD000000000000013;
    *(_QWORD *)(v23 + 8) = 0x8000000242C6C6D0;
    *(_BYTE *)(v23 + 16) = 4;
    return swift_willThrow();
  }
}

void sub_242C2AB0C()
{
  sub_242C2A454();
}

void sub_242C2AB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_18_1();
  a19 = v24;
  a20 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572216B8);
  OUTLINED_FUNCTION_11_15();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_36_11();
  v29 = v27 - v28;
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_305_0();
  v31 = OUTLINED_FUNCTION_14_1();
  v32 = *(_QWORD *)(v31 - 8);
  v50 = v31;
  v51 = v32;
  OUTLINED_FUNCTION_9_3();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_59_23();
  v34 = OUTLINED_FUNCTION_36_17();
  OUTLINED_FUNCTION_48_30(v34);
  if (v35)
  {
    OUTLINED_FUNCTION_64_3();
    v49 = v21;
    v36 = OUTLINED_FUNCTION_39_35();
    OUTLINED_FUNCTION_42_34(v36);
    OUTLINED_FUNCTION_42_34(v36);
    OUTLINED_FUNCTION_25_50();
    sub_242B1D8D0(v37, v38, v39);
    v41 = v40;
    v48 = v22;
    OUTLINED_FUNCTION_84_3(v40);
    sub_242B51AEC((uint64_t)&a10, 0, 1, v20);
    OUTLINED_FUNCTION_5_7(v23, v20);
    OUTLINED_FUNCTION_0_10(v23);
    OUTLINED_FUNCTION_5_7(v29, v20);
    v42 = OUTLINED_FUNCTION_0_10(v29);
    v47 = (uint64_t)&v47;
    MEMORY[0x24BDAC7A8](v42);
    *(&v47 - 6) = v41;
    *(&v47 - 5) = (uint64_t)&off_251387678;
    *(&v47 - 4) = v29;
    *(&v47 - 3) = (uint64_t)sub_242C2AFC0;
    *(&v47 - 2) = v49;
    OUTLINED_FUNCTION_158_0();
    v43 = v48;
    sub_242BF6310((uint64_t)sub_242A6AB40, (uint64_t)(&v47 - 8), MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE4AE0]);
    if (v43)
    {
      OUTLINED_FUNCTION_23_13();
      OUTLINED_FUNCTION_23_5();
      OUTLINED_FUNCTION_33_9(v29);
      OUTLINED_FUNCTION_33_9(v23);
    }
    else
    {
      OUTLINED_FUNCTION_19_5();
      OUTLINED_FUNCTION_35_34(v29);
      OUTLINED_FUNCTION_35_34(v23);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F190);
      v46 = OUTLINED_FUNCTION_5_4();
      *(_OWORD *)(v46 + 16) = xmmword_242C4B7D0;
      *(_QWORD *)(v46 + 32) = v41;
      *(_QWORD *)(v46 + 40) = &off_251387678;
      OUTLINED_FUNCTION_23_13();
    }
    OUTLINED_FUNCTION_41_39();
  }
  else
  {
    sub_242A6A5B0();
    v44 = OUTLINED_FUNCTION_24_1();
    *v45 = xmmword_242C624C0;
    OUTLINED_FUNCTION_4_41(v44, (uint64_t)v45);
  }
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_242C2ADA4()
{
  sub_242C48A28();
  sub_242C489B0();
  return sub_242C476CC();
}

#error "242C2AE2C: call analysis failed (funcsize=5)"

uint64_t sub_242C2AE38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_242C269EC(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_242C2AE54()
{
  return sub_242C26B10();
}

uint64_t sub_242C2AE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_242C2754C(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_242C2AE88(uint64_t a1, uint64_t a2)
{
  return sub_242C2AED4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_242C27C28);
}

void sub_242C2AEA4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_242C2AEF8(a1, a2);
}

uint64_t sub_242C2AEB8(uint64_t a1, uint64_t a2)
{
  return sub_242C2AED4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_242C283D8);
}

uint64_t sub_242C2AED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
}

void sub_242C2AEF8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_242BF6BC0(a1, v2[8], v2[9], v2[2], v2[3], MEMORY[0x24BEE4AE0] + 8, a2, v2[4], v2[5]);
}

uint64_t sub_242C2AF34(void *a1)
{
  return sub_242C2940C(a1);
}

uint64_t sub_242C2AF4C(void *a1)
{
  return sub_242C29324(a1);
}

uint64_t sub_242C2AF64()
{
  return sub_242C29BE4();
}

uint64_t sub_242C2AF7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_242C2A784(a1, v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], a2);
}

uint64_t sub_242C2AFA0(uint64_t a1)
{
  uint64_t v1;

  return sub_242C2A8B8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_242C2AFC0()
{
  return sub_242C2ADA4();
}

uint64_t OUTLINED_FUNCTION_15_56(uint64_t a1)
{
  uint64_t *v1;

  return sub_242AB8F10(a1, v1);
}

uint64_t OUTLINED_FUNCTION_18_55()
{
  return swift_unknownObjectRelease();
}

double OUTLINED_FUNCTION_20_57@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)(v2 - 160) = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  *(_QWORD *)(v2 - 152) = (a1 - 32) | 0x8000000000000000;
  result = 0.0;
  *(_OWORD *)(v2 - 144) = 0u;
  *(_OWORD *)(v2 - 128) = 0u;
  *(_OWORD *)(v2 - 112) = 0u;
  *(_DWORD *)(v2 - 96) = 0;
  *(_BYTE *)(v2 - 92) = 7;
  return result;
}

uint64_t OUTLINED_FUNCTION_24_51()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35_34(uint64_t a1)
{
  uint64_t *v1;

  return sub_242AB8F10(a1, v1);
}

uint64_t OUTLINED_FUNCTION_38_33()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_39_36()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_41_39()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_34(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_46_29(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t OUTLINED_FUNCTION_47_30(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void OUTLINED_FUNCTION_48_30(uint64_t a1)
{
  uint64_t v1;

  sub_242A9E618(a1, v1);
}

uint64_t OUTLINED_FUNCTION_50_26(uint64_t a1)
{
  uint64_t *v1;

  return sub_242AB8F10(a1, v1);
}

void OUTLINED_FUNCTION_54_25(uint64_t *a1, uint64_t a2)
{
  sub_242B1D8D0(a1, a2, 0);
}

void OUTLINED_FUNCTION_56_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_242BF6310(a2, a3, a5, v5 - 40);
}

uint64_t OUTLINED_FUNCTION_60_25(uint64_t a1)
{
  uint64_t *v1;

  return sub_242AB8F10(a1, v1);
}

uint64_t OUTLINED_FUNCTION_61_23(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 176) = a1;
  return sub_242C480E0();
}

void OUTLINED_FUNCTION_63_21(uint64_t a1)
{
  uint64_t v1;

  sub_242A9E618(a1, v1);
}

void OUTLINED_FUNCTION_70_19()
{
  sub_242A5EA98();
}

uint64_t OUTLINED_FUNCTION_71_14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(a1, 0, 1, v2);
  return v1;
}

void OUTLINED_FUNCTION_73_19()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 136) = v1;
  sub_242B526F4();
}

uint64_t OUTLINED_FUNCTION_75_15(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_76_19(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_80_16()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_81_13()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t static CodingUserInfoKey.optimizerSerializationContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257222B00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242C48E9C();
  v5 = sub_242C48EB4();
  result = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, v4, v5);
  __break(1u);
  return result;
}

uint64_t (*sub_242C2B268(uint64_t a1, uint64_t a2, uint64_t a3))(_BYTE *, _QWORD)
{
  uint64_t (*result)(_BYTE *, _QWORD);
  _QWORD *v4;
  _BYTE v5[32];

  result = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(a3 + 32))(v5);
  if (__OFADD__(*v4, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v4;
    return (uint64_t (*)(_BYTE *, _QWORD))result(v5, 0);
  }
  return result;
}

uint64_t sub_242C2B2BC(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD v5[6];
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[7];
  _OWORD v10[3];
  int v11;

  v1 = *(_QWORD *)(a1 + 8);
  swift_retain();
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v2 = *(_BYTE *)(*(_QWORD *)(v1 + 16) + 160);
  sub_242A66290((uint64_t)v10, (uint64_t)v9);
  v7 = MEMORY[0x24BEE4AF8];
  v6 = v2;
  sub_242A66290((uint64_t)v9, (uint64_t)v5);
  Tensor.init(shape:coercingScalars:scalarType:on:)();
  sub_242A662D8((uint64_t)v9);
  v3 = v8;
  sub_242A662D8((uint64_t)v10);
  *(_QWORD *)&v10[0] = v1;
  Tensor.squared()();
  v5[0] = v9[0];
  Tensor.sum()();
  swift_release();
  v9[0] = *(_QWORD *)&v10[0];
  v5[0] = v3;
  static Tensor.* infix(_:_:)();
  swift_release();
  OUTLINED_FUNCTION_135();
  return swift_release();
}

uint64_t sub_242C2B3D0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  float v23;
  float v24;
  int v25;
  int v26;
  char v27;
  uint64_t inited;
  uint64_t v29;
  void (*v30)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v31;
  int v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_QWORD *__return_ptr, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  unsigned __int8 v71;
  uint64_t v72[7];
  uint64_t v73[7];
  _QWORD v74[6];
  int v75;
  uint64_t v76;

  v63 = a5;
  v64 = a6;
  v62 = a4;
  v65 = a3;
  v76 = *MEMORY[0x24BDAC8D0];
  v13 = sub_242C49208();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v15);
  v22 = (char *)v55 - v19;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    v56 = v21;
    v57 = v20;
    v58 = result;
    v60 = a1;
    v61 = v8;
    OUTLINED_FUNCTION_4_73((uint64_t)v55 - v19);
    swift_retain();
    OUTLINED_FUNCTION_9_73();
    v24 = v23;
    OUTLINED_FUNCTION_7_61((uint64_t)v22);
    if (v24 != 1.0)
    {
      OUTLINED_FUNCTION_4_73((uint64_t)v22);
      OUTLINED_FUNCTION_9_73();
      v26 = v25;
      OUTLINED_FUNCTION_7_61((uint64_t)v22);
      v75 = 0;
      memset(v74, 0, sizeof(v74));
      v27 = *(_BYTE *)(*(_QWORD *)(a2 + 16) + 160);
      OUTLINED_FUNCTION_5_76();
      v68 = MEMORY[0x24BEE4AF8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_242C4B7D0;
      *(_DWORD *)(inited + 32) = v26;
      LOBYTE(v67) = v27;
      OUTLINED_FUNCTION_3_79();
      Tensor.init(shape:coercingScalars:scalarType:on:)();
      OUTLINED_FUNCTION_10_54();
      v29 = v69;
      OUTLINED_FUNCTION_209_1();
      v73[0] = a2;
      v72[0] = v29;
      static Tensor.* infix(_:_:)();
      OUTLINED_FUNCTION_135();
      swift_release();
      a2 = v74[0];
    }
    OUTLINED_FUNCTION_4_73((uint64_t)v17);
    v30 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a8 + 40);
    swift_retain();
    v30(&v69, a7, a8);
    v59 = a7;
    OUTLINED_FUNCTION_7_61((uint64_t)v17);
    v31 = v60;
    if (v71 == 255)
    {
      swift_release();
      v74[0] = a2;
    }
    else
    {
      v32 = v69;
      v33 = v70 | ((unint64_t)v71 << 32);
      if (v71)
      {
        v34 = (_QWORD *)*v62;
        OUTLINED_FUNCTION_2_88();
        if (HIDWORD(v33) == 1)
        {
          v36 = *(_BYTE *)(v35 + 160);
          OUTLINED_FUNCTION_5_76();
          v67 = MEMORY[0x24BEE4AF8];
          __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
          v37 = swift_initStackObject();
          *(_OWORD *)(v37 + 16) = xmmword_242C4B7D0;
          *(_DWORD *)(v37 + 32) = v32;
          v66 = v36;
          OUTLINED_FUNCTION_3_79();
          swift_retain();
          OUTLINED_FUNCTION_1_82();
          OUTLINED_FUNCTION_10_54();
          v38 = v68;
          OUTLINED_FUNCTION_209_1();
          v73[0] = a2;
          Tensor.squared()();
          v72[0] = v74[0];
          Tensor.sum()();
          OUTLINED_FUNCTION_17_5();
          v72[0] = v73[0];
          sqrt(_:)();
          OUTLINED_FUNCTION_135();
          v39 = v74[0];
          v73[0] = a2;
          v74[0] = v38;
          v72[0] = v39;
          v67 = v38;
          max(_:_:)();
          v67 = v68;
          static Tensor./ infix(_:_:)();
          OUTLINED_FUNCTION_17_5();
          v68 = v72[0];
          static Tensor.* infix(_:_:)();
          OUTLINED_FUNCTION_23_5();
          swift_release();
          OUTLINED_FUNCTION_17_5();
        }
        else
        {
          v40 = *(_BYTE *)(v35 + 160);
          OUTLINED_FUNCTION_5_76();
          v67 = MEMORY[0x24BEE4AF8];
          __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
          v41 = swift_initStackObject();
          *(_OWORD *)(v41 + 16) = xmmword_242C4B7D0;
          *(_DWORD *)(v41 + 32) = v33;
          v66 = v40;
          OUTLINED_FUNCTION_3_79();
          swift_retain();
          OUTLINED_FUNCTION_1_82();
          OUTLINED_FUNCTION_10_54();
          v42 = v68;
          OUTLINED_FUNCTION_209_1();
          v55[1] = a2;
          v74[0] = a2;
          v73[0] = v42;
          static Tensor.* infix(_:_:)();
          v74[0] = v34;
          LOBYTE(v68) = *(_BYTE *)(*(_QWORD *)(a2 + 16) + 160);
          v43 = *MEMORY[0x24BEE38B8];
          v45 = v57;
          v44 = v58;
          v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 104);
          v62 = v34;
          v47 = v56;
          v46(v56, v43, v58);
          Tensor.cast(to:roundingRule:)();
          (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v44);
          v68 = v73[0];
          static Tensor./ infix(_:_:)();
          OUTLINED_FUNCTION_135();
          OUTLINED_FUNCTION_17_5();
          OUTLINED_FUNCTION_23_5();
        }
        swift_release();
        OUTLINED_FUNCTION_135();
      }
      else
      {
        v73[0] = a2;
        Tensor.clamped(to:)((uint64_t)v74, *(float *)&v69, *((float *)&v69 + 1));
        OUTLINED_FUNCTION_23_5();
      }
    }
    v48 = *(_QWORD *)(*(_QWORD *)v31 + 32);
    v49 = v59;
    if ((~v48 & 0xF000000000000007) != 0 && v48 < 0)
    {
      v73[0] = v48 & 0x7FFFFFFFFFFFFFFFLL;
      v72[0] = v74[0];
      v50 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t))(a8 + 64);
      swift_retain();
      sub_242A70278(v48);
      v50(v74, v63, v73, v72, v49, a8);
      OUTLINED_FUNCTION_17_5();
      v51 = v74[0];
      swift_retain();
      v52 = v64;
      sub_242A5D8BC();
      v53 = *(_QWORD *)(*v52 + 16);
      sub_242A5DC0C();
      v54 = *v52;
      *(_QWORD *)(v54 + 16) = v53 + 1;
      *(_QWORD *)(v54 + 8 * v53 + 32) = v51;
      *v52 = v54;
      v74[0] = v51;
      swift_retain();
      Parameter.wrappedValue.setter(v74);
      sub_242A70294(v48);
      OUTLINED_FUNCTION_17_5();
      return swift_release();
    }
    else
    {
      result = sub_242C48F5C();
      __break(1u);
    }
  }
  return result;
}

uint64_t OptimizerSerializationContext.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  OptimizerSerializationContext.init(_:)(a1);
  return v2;
}

uint64_t OptimizerSerializationContext.init(_:)(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96), a1);
  return v1;
}

uint64_t OptimizerSerializationContext.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  return v0;
}

uint64_t OptimizerSerializationContext.__deallocating_deinit()
{
  OptimizerSerializationContext.deinit();
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of Optimizer.learningRate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Optimizer.learningRate.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Optimizer.learningRate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Optimizer.update(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata accessor for OptimizerSerializationContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptimizerSerializationContext);
}

uint64_t method lookup function for OptimizerSerializationContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OptimizerSerializationContext.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void OUTLINED_FUNCTION_1_82()
{
  Tensor.init(shape:coercingScalars:scalarType:on:)();
}

double OUTLINED_FUNCTION_2_88()
{
  uint64_t v0;
  double result;

  *(_DWORD *)(v0 + 104) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_79()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242A66290(v1 - 216, v0 + 216);
}

uint64_t OUTLINED_FUNCTION_4_73(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;

  return v2(a1, *(_QWORD *)(v1 + 88), v3);
}

uint64_t OUTLINED_FUNCTION_5_76()
{
  uint64_t v0;

  return sub_242A66290(v0 - 160, v0 - 216);
}

uint64_t OUTLINED_FUNCTION_7_61(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_9_73()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_54()
{
  uint64_t v0;

  return sub_242A662D8(v0 - 216);
}

uint64_t sub_242C2BBB0()
{
  return sub_242C2BBE8(&qword_2572205B0);
}

uint64_t sub_242C2BBCC()
{
  return sub_242C2BBE8(&qword_2572205B8);
}

uint64_t sub_242C2BBE8(_QWORD *a1)
{
  uint64_t v1;

  if (*a1 != -1)
    swift_once();
  swift_retain();
  v1 = sub_242C2BC48();
  swift_release();
  return v1;
}

uint64_t sub_242C2BC3C(uint64_t a1)
{
  return sub_242C2BCF4(a1, &qword_25722E388);
}

uint64_t sub_242C2BC48()
{
  uint64_t v0;
  uint64_t v1;

  swift_retain();
  swift_retain();
  sub_242B5AFB4();
  v1 = *(unsigned int *)(v0 + 24);
  *(_DWORD *)(v0 + 24) = v1 + 1;
  sub_242B5AFD4();
  swift_release();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for VariableIdentityGenerator()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LayerIdentityGenerator()
{
  return objc_opt_self();
}

uint64_t sub_242C2BCE8(uint64_t a1)
{
  return sub_242C2BCF4(a1, &qword_25722E390);
}

uint64_t sub_242C2BCF4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25722E678);
  swift_allocObject();
  result = sub_242C2BDF8(0);
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for TensorOperationIdentityGenerator()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TensorRepresentationIdentityGenerator()
{
  return objc_opt_self();
}

uint64_t sub_242C2BD78()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_242C2BDF8(int a1)
{
  uint64_t v1;

  type metadata accessor for UnfairLock();
  swift_allocObject();
  *(_QWORD *)(v1 + 16) = sub_242B5AF3C();
  *(_DWORD *)(v1 + 24) = a1;
  return v1;
}

uint64_t *sub_242C2BE48()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));
  return v0;
}

uint64_t sub_242C2BE8C()
{
  sub_242C2BE48();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SequentialIDGenerator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SequentialIDGenerator);
}

uint64_t sub_242C2BEBC@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 12;
  switch(result)
  {
    case 0:
      break;
    case 2:
      v2 = 8;
      break;
    case 3:
      v2 = 10;
      break;
    case 4:
      v2 = 11;
      break;
    case 5:
      v2 = 0;
      break;
    case 6:
      v2 = 1;
      break;
    case 7:
      v2 = 2;
      break;
    case 8:
      v2 = 3;
      break;
    case 9:
      v2 = 4;
      break;
    case 10:
      v2 = 5;
      break;
    case 11:
      v2 = 6;
      break;
    case 12:
      v2 = 7;
      break;
    default:
      sub_242C48C38();
      OUTLINED_FUNCTION_0_93();
      type metadata accessor for SNNDataType(0);
      OUTLINED_FUNCTION_4_74();
      OUTLINED_FUNCTION_1_83();
      OUTLINED_FUNCTION_24_34();
      OUTLINED_FUNCTION_2_89();
      sub_242A59170();
  }
  *a2 = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_93()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_1_83()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_4_74()
{
  return sub_242C48E78();
}

uint64_t SequentialSampler.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_242C2C0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[4];
  __int128 v12[2];
  uint64_t v13;
  _BYTE v14[40];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = a2;
  swift_beginAccess();
  sub_242A587A8(v2 + 16, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257224240);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257224248);
  if (swift_dynamicCast())
  {
    sub_242A64518(v12, (uint64_t)v15);
    v4 = v16;
    v5 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v6 = *(uint64_t (**)(uint64_t, uint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t))(v5 + 24);
    v7 = sub_242AC5194();
    v8 = sub_242C2D7F0();
    v9 = v6(a1, &v18, MEMORY[0x24BEE4568], v7, v8, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    return v9;
  }
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  result = sub_242ACA914((uint64_t)v12);
  if ((a1 & 0x8000000000000000) == 0)
  {
    MEMORY[0x24BDAC7A8](result);
    v11[2] = v2;
    v11[3] = &v18;
    return sub_242B5CEA4((uint64_t)sub_242C2D7D4, (uint64_t)v11, 0, a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C2C210(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  v3 = a2 + 16;
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1(v3, *(_QWORD *)(a2 + 40));
  sub_242AC5194();
  sub_242C2D7F0();
  sub_242C48158();
  swift_endAccess();
  return v5;
}

uint64_t sub_242C2C2B4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v5 = *v2;
  v9 = type metadata accessor for AnyRandomNumberGenerator();
  v10 = sub_242C2D758(&qword_25722E978, (uint64_t)&unk_242C51D68);
  v8[0] = v5;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  swift_retain();
  v6 = sub_242C2C0AC(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

uint64_t sub_242C2C350(uint64_t a1, float a2, float a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[8];
  float v7;
  _DWORD v8[2];

  *(float *)v8 = a2;
  *(float *)&v8[1] = a3;
  v7 = a3 - a2;
  if ((~COERCE_INT(a3 - a2) & 0x7F800000) != 0)
  {
    MEMORY[0x24BDAC7A8](a1);
    v6[2] = v3;
    v6[3] = v8;
    v6[4] = &v7;
    v6[5] = v4;
    return sub_242C2D520(v4, sub_242C2D73C, (uint64_t)v6, (uint64_t (*)(void))sub_242A85D3C);
  }
  else
  {
    result = sub_242C48F5C();
    __break(1u);
  }
  return result;
}

uint64_t sub_242C2C434(uint64_t *a1, _QWORD *a2, float a3, float a4, float a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v13 = sub_242C37658(0, a1[1]);
  v14 = *(_QWORD *)(v13 + 16);
  result = sub_242C2C2B4(v14, 16777217);
  if (!v14)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    result = swift_release();
    *a2 = a7;
    return result;
  }
  v16 = *(_QWORD *)(result + 16);
  if (v16)
  {
    v17 = *(_QWORD *)(result + 32);
    if (v17 == 0x1000000)
    {
      v18 = 0;
LABEL_10:
      result = swift_bridgeObjectRelease();
      if (v18 < *(_QWORD *)(v13 + 16))
      {
        v22 = *(_QWORD *)(v13 + 8 * v18 + 32);
        result = swift_release();
        *(float *)(*a1 + 4 * v22) = a4;
        return result;
      }
      goto LABEL_16;
    }
    v18 = 0;
    v19 = *a1;
    v20 = v16 - 1;
    v21 = *(_QWORD *)(v13 + 16);
    while (v21 != v18)
    {
      *(float *)(v19 + 4 * *(_QWORD *)(v13 + 32 + 8 * v18)) = (float)((float)((float)v17 * 0.000000059605) * a5) + a3;
      if (v14 - 1 == v18)
        goto LABEL_12;
      if (v20 == v18)
        goto LABEL_14;
      v17 = *(_QWORD *)(result + 40 + 8 * v18++);
      if (v17 == 0x1000000)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    __break(1u);
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_242C2C594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[8];
  _QWORD v9[2];

  v9[0] = a2;
  v9[1] = a3;
  if (a3 - a2 == -1)
    return sub_242C2D424(a1, a1);
  v4 = sub_242C2C2B4(a1, a3 - a2 + 1);
  MEMORY[0x24BDAC7A8](v4);
  v8[2] = a1;
  v8[3] = v9;
  v8[4] = v5;
  v6 = sub_242C2D520(a1, (uint64_t (*)(_QWORD *, uint64_t *))sub_242C2D82C, (uint64_t)v8, (uint64_t (*)(void))sub_242A85D48);
  swift_bridgeObjectRelease();
  return v6;
}

_QWORD **sub_242C2C65C(_QWORD **result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (!a3)
    {
LABEL_6:
      *a2 = a3;
      return result;
    }
    if ((unint64_t)(a3 - 1) < *(_QWORD *)(a6 + 16))
    {
      v6 = *result;
      v7 = (uint64_t *)(a6 + 32);
      v8 = a3;
      do
      {
        v9 = *v7++;
        *v6++ = v9 + a4;
        --v8;
      }
      while (v8);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t SequentialSampler.init()()
{
  uint64_t v0;

  return v0;
}

void sub_242C2C6AC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_74();
  OUTLINED_FUNCTION_99_0();
  MEMORY[0x24BDAC7A8](v0);
  sub_242C487D0();
  OUTLINED_FUNCTION_9_74();
  swift_getAssociatedConformanceWitness();
  sub_242C4865C();
  OUTLINED_FUNCTION_7_0();
}

uint64_t SequentialSampler.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SequentialSampler.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_242C2C780()
{
  sub_242C2C6AC();
}

void ShuffleSampler.__allocating_init(seed:)(unint64_t a1, char a2, uint64_t a3)
{
  _BYTE v3[40];

  OUTLINED_FUNCTION_8_61(a1, a2, a3);
  type metadata accessor for ShuffleSampler();
  OUTLINED_FUNCTION_4_6();
  RandomSampler.init(generator:)(v3);
  OUTLINED_FUNCTION_0_11();
}

uint64_t sub_242C2C7CC()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  OUTLINED_FUNCTION_5_77();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_99_0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - v3;
  OUTLINED_FUNCTION_7_62();
  OUTLINED_FUNCTION_10_55();
  type metadata accessor for AnyRandomNumberGenerator();
  swift_getAssociatedConformanceWitness();
  sub_242C2D758((unint64_t *)&qword_257224230, (uint64_t)&unk_242C51D84);
  v5 = sub_242C484B8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, AssociatedTypeWitness);
  swift_endAccess();
  return v5;
}

uint64_t sub_242C2C8F0()
{
  return sub_242C2C7CC();
}

uint64_t RandomSampler.__allocating_init(generator:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_4_6();
  RandomSampler.init(generator:)(a1);
  return v2;
}

void _s14NeuralNetworks14ShuffleSamplerC9generatorACSG_p_tcfc_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = type metadata accessor for AnyRandomNumberGenerator();
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = __swift_mutable_project_boxed_opaque_existential_1(a1, v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v10 + 16))(v9, v7);
  v11 = sub_242ACA9B4((uint64_t)v9, v3, v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v1 + 16) = v11;
  OUTLINED_FUNCTION_7_0();
}

uint64_t RandomSampler.__allocating_init(seed:)(unint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE v5[40];

  OUTLINED_FUNCTION_8_61(a1, a2, a3);
  return (*(uint64_t (**)(_BYTE *))(v3 + 112))(v5);
}

uint64_t sub_242C2CA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];

  OUTLINED_FUNCTION_5_77();
  v5 = OUTLINED_FUNCTION_0_94();
  v6 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_99_0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v17 - v8;
  OUTLINED_FUNCTION_7_62();
  v10 = OUTLINED_FUNCTION_1_84();
  result = OUTLINED_FUNCTION_1_84();
  v12 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_10_55();
    v13 = sub_242C2C594(v10, 0, v12);
    v14 = swift_endAccess();
    v17[1] = v13;
    MEMORY[0x24BDAC7A8](v14);
    v17[-4] = v3;
    v17[-3] = a3;
    v17[-2] = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257220EA0);
    OUTLINED_FUNCTION_0_94();
    sub_242B0BED8();
    v15 = OUTLINED_FUNCTION_6_78();
    v16 = OUTLINED_FUNCTION_12_50(v15, (uint64_t)sub_242C2D658, (uint64_t)&v17[-6]);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_242C2CB8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void (*v6)(_BYTE *, _QWORD);
  _BYTE v8[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = &v8[-v4];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_242B7D18C();
  v6 = (void (*)(_BYTE *, _QWORD))sub_242C48854();
  (*(void (**)(uint64_t))(v3 + 16))(a1);
  v6(v8, 0);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, AssociatedTypeWitness);
}

uint64_t RandomSampler.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_137_6();
  return v0;
}

uint64_t _s14NeuralNetworks14ShuffleSamplerCfD_0()
{
  OUTLINED_FUNCTION_137_6();
  return swift_deallocClassInstance();
}

uint64_t sub_242C2CD08()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t WeightedRandomSampler.weights.getter()
{
  return sub_242C480E0();
}

void WeightedRandomSampler.__allocating_init(generator:weights:)(uint64_t a1)
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_17_51(a1);
  OUTLINED_FUNCTION_9();
}

void WeightedRandomSampler.init(generator:weights:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  float *v5;
  float v6;
  float v7;
  _BYTE v8[40];

  *(_QWORD *)(v2 + 24) = a2;
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v5 = (float *)(a2 + 32);
    v6 = 0.0;
    do
    {
      v7 = *v5++;
      v6 = v6 + v7;
      --v4;
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }
  *(float *)(v2 + 32) = v6;
  sub_242A587A8(a1, (uint64_t)v8);
  RandomSampler.init(generator:)(v8);
  __swift_destroy_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_0_11();
}

uint64_t WeightedRandomSampler.__allocating_init(seed:weights:)(unint64_t a1, char a2)
{
  uint64_t v2;
  _BYTE v4[40];
  uint64_t v5[5];

  sub_242B9340C(a1, a2 & 1, v5);
  sub_242A587A8((uint64_t)v5, (uint64_t)v4);
  type metadata accessor for WeightedRandomSampler();
  v2 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_17_51((uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2;
}

uint64_t sub_242C2CE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char *v20;
  _QWORD v21[4];

  OUTLINED_FUNCTION_5_77();
  v6 = OUTLINED_FUNCTION_0_94();
  v7 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_99_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - v9;
  v11 = *(_QWORD *)(*(_QWORD *)(v3 + 24) + 16);
  if (v11 == OUTLINED_FUNCTION_1_84())
  {
    OUTLINED_FUNCTION_7_62();
    v12 = OUTLINED_FUNCTION_1_84();
    v13 = *(float *)(v3 + 32);
    if (v13 < 0.0)
    {
      __break(1u);
    }
    else
    {
      v14 = v12;
      v21[0] = v6;
      OUTLINED_FUNCTION_10_55();
      v15 = sub_242C2C350(v14, 0.0, v13);
      swift_endAccess();
      v16 = OUTLINED_FUNCTION_1_84();
      if ((v16 & 0x8000000000000000) == 0)
      {
        v21[1] = 0;
        v21[2] = v16;
        MEMORY[0x24BDAC7A8](v16);
        v21[-6] = v4;
        v21[-5] = a3;
        v21[-4] = v3;
        v21[-3] = v15;
        v20 = v10;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257222B28);
        OUTLINED_FUNCTION_0_94();
        sub_242AA1C14();
        v17 = OUTLINED_FUNCTION_6_78();
        v18 = OUTLINED_FUNCTION_12_50(v17, (uint64_t)sub_242C2D684, (uint64_t)&v21[-8]);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, _QWORD))(v7 + 8))(v10, v21[0]);
        return v18;
      }
    }
    __break(1u);
  }
  result = sub_242C48F5C();
  __break(1u);
  return result;
}

void sub_242C2D030(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _QWORD);
  _BYTE v21[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = &v21[-v10];
  v12 = *a1;
  v13 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD *)(v13 + 16);
  if (!v14)
  {
LABEL_8:
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    sub_242B7D18C();
    v20 = (void (*)(_BYTE *, _QWORD))sub_242C48854();
    (*(void (**)(uint64_t))(v9 + 16))(a4);
    v20(v21, 0);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
    return;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 < *(_QWORD *)(a3 + 16))
  {
    v15 = *(float *)(v13 + 32) + 0.0;
    v16 = *(float *)(a3 + 4 * v12 + 32);
    v17 = 0;
    if (v16 > v15)
    {
      v18 = v13 + 36;
      v19 = v14 - 1;
      do
      {
        if (v19 == v17)
          break;
        v15 = v15 + *(float *)(v18 + 4 * v17++);
      }
      while (v16 > v15);
    }
    goto LABEL_8;
  }
  __break(1u);
}

void WeightedRandomSampler.__allocating_init(generator:)()
{
  OUTLINED_FUNCTION_11_57();
  __break(1u);
}

void WeightedRandomSampler.init(generator:)()
{
  OUTLINED_FUNCTION_11_57();
  __break(1u);
}

uint64_t sub_242C2D27C()
{
  return swift_bridgeObjectRelease();
}

uint64_t WeightedRandomSampler.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_137_6();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WeightedRandomSampler.__deallocating_deinit()
{
  WeightedRandomSampler.deinit();
  return swift_deallocClassInstance();
}

uint64_t static Sampler<>.sequential.getter()
{
  type metadata accessor for SequentialSampler();
  return swift_allocObject();
}

void static Sampler<>.shuffle(seed:)(unint64_t a1, char a2)
{
  sub_242C2D31C(a1, a2, (void (*)(void))type metadata accessor for ShuffleSampler);
}

void static Sampler<>.shuffle(using:)(uint64_t a1)
{
  sub_242C2D364(a1, (void (*)(uint64_t))type metadata accessor for ShuffleSampler);
}

void static Sampler<>.random(seed:)(unint64_t a1, char a2)
{
  sub_242C2D31C(a1, a2, (void (*)(void))type metadata accessor for RandomSampler);
}

void sub_242C2D31C(unint64_t a1, char a2, void (*a3)(void))
{
  uint64_t v4;

  OUTLINED_FUNCTION_8_61(a1, a2, (uint64_t)a3);
  a3();
  v4 = OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_15_57(v4);
  OUTLINED_FUNCTION_0_11();
}

void static Sampler<>.random(using:)(uint64_t a1)
{
  sub_242C2D364(a1, (void (*)(uint64_t))type metadata accessor for RandomSampler);
}

void sub_242C2D364(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[40];

  v3 = sub_242A587A8(a1, (uint64_t)v5);
  a2(v3);
  v4 = OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_15_57(v4);
  OUTLINED_FUNCTION_0_11();
}

void static Sampler<>.weightedRandom(seed:weights:)(unint64_t a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  type metadata accessor for WeightedRandomSampler();
  sub_242C480E0();
  WeightedRandomSampler.__allocating_init(seed:weights:)(a1, v3);
  OUTLINED_FUNCTION_9();
}

void static Sampler<>.weightedRandom(using:weights:)(uint64_t a1)
{
  _BYTE v1[40];

  sub_242A587A8(a1, (uint64_t)v1);
  type metadata accessor for WeightedRandomSampler();
  OUTLINED_FUNCTION_2_0();
  sub_242C480E0();
  OUTLINED_FUNCTION_17_51((uint64_t)v1);
  OUTLINED_FUNCTION_0_11();
}

uint64_t sub_242C2D424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;

  if (a1 < 0)
    goto LABEL_12;
  if (a1)
  {
    v4 = sub_242C485CC();
    *(_QWORD *)(v4 + 16) = a1;
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_4;
  }
  else
  {
    v4 = MEMORY[0x24BEE4AF8];
    if ((a2 & 0x8000000000000000) == 0)
    {
LABEL_4:
      if (a2)
      {
        v5 = (uint64_t *)(v4 + 32);
        v6 = a2;
        do
        {
          *v5++ = sub_242AC7BCC();
          --v6;
        }
        while (v6);
      }
      if (a1 >= a2)
      {
        *(_QWORD *)(v4 + 16) = a2;
        return v4;
      }
      goto LABEL_11;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  result = sub_242C48F50();
  __break(1u);
  return result;
}

uint64_t sub_242C2D520(uint64_t a1, uint64_t (*a2)(_QWORD *, uint64_t *), uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];
  uint64_t v12;

  v7 = a4();
  v9 = v8;
  v11[1] = a1;
  v12 = 0;
  v11[0] = v8;
  result = a2(v11, &v12);
  if (v4)
  {
    if (v12 > a1)
    {
      __break(1u);
    }
    else
    {
      if (!v11[0])
      {
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
      if (v9 == v11[0])
      {
        *(_QWORD *)(v7 + 16) = v12;
        swift_bridgeObjectRelease();
        return v7;
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  if (v12 > a1)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v11[0])
  {
    if (v9 == v11[0])
    {
      *(_QWORD *)(v7 + 16) = v12;
      return v7;
    }
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_242C2D5F8(uint64_t *a1, _QWORD *a2, uint64_t a3, float *a4, float *a5, uint64_t a6)
{
  return sub_242C2C434(a1, a2, *a4, a4[1], *a5, a3, a6);
}

_QWORD **sub_242C2D618(_QWORD **a1, _QWORD *a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return sub_242C2C65C(a1, a2, a3, *a4, a4[1], a5);
}

uint64_t type metadata accessor for ShuffleSampler()
{
  return objc_opt_self();
}

uint64_t sub_242C2D658@<X0>(uint64_t a1@<X8>)
{
  return sub_242C2CB8C(a1);
}

uint64_t type metadata accessor for WeightedRandomSampler()
{
  return objc_opt_self();
}

void sub_242C2D684(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_242C2D030(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t type metadata accessor for SequentialSampler()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RandomSampler()
{
  return objc_opt_self();
}

uint64_t dispatch thunk of Sampler.callAsFunction<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t method lookup function for SequentialSampler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SequentialSampler.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SequentialSampler.callAsFunction<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t method lookup function for ShuffleSampler()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for RandomSampler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RandomSampler.__allocating_init(generator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of RandomSampler.callAsFunction<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t method lookup function for WeightedRandomSampler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WeightedRandomSampler.__allocating_init(generator:weights:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_242C2D73C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_242C2D5F8(a1, a2, *(_QWORD *)(v2 + 16), *(float **)(v2 + 24), *(float **)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_242C2D758(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AnyRandomNumberGenerator();
    result = MEMORY[0x2494EDE24](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242C2D798@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_242C2C210(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_242C2D7D4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_242C2D798(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_242C2D7F0()
{
  unint64_t result;

  result = qword_25722E980[0];
  if (!qword_25722E980[0])
  {
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE4590], MEMORY[0x24BEE4568]);
    atomic_store(result, qword_25722E980);
  }
  return result;
}

_QWORD **sub_242C2D82C(_QWORD **a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_242C2D618(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t **)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t OUTLINED_FUNCTION_0_94()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_1_84()
{
  return sub_242C487B8();
}

uint64_t OUTLINED_FUNCTION_6_78()
{
  return OUTLINED_FUNCTION_31_1();
}

uint64_t OUTLINED_FUNCTION_7_62()
{
  return sub_242C487D0();
}

void OUTLINED_FUNCTION_8_61(unint64_t a1, char a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_242B9340C(a1, a2 & 1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_9_74()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_10_55()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_57()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_12_50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return sub_242AAB47C(a1, a2, a3, v5, v3, v4);
}

uint64_t OUTLINED_FUNCTION_15_57(uint64_t a1, ...)
{
  uint64_t (*v1)(char *);
  va_list va;

  va_start(va, a1);
  return v1(va);
}

void OUTLINED_FUNCTION_17_51(uint64_t a1)
{
  uint64_t v1;

  WeightedRandomSampler.init(generator:weights:)(a1, v1);
}

void sub_242C2D908(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_9();
  v13 = v12 - v11;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v12 - v11, v5);
  sub_242C2D9A0(v13, a1, a2, a3, a4, a5);
}

void sub_242C2D9A0(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a6, a1, a4);
  v12 = type metadata accessor for Batches(0, a4, a5, v11);
  *(_QWORD *)(a6 + *(int *)(v12 + 36)) = a2;
  *(_BYTE *)(a6 + *(int *)(v12 + 40)) = a3;
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_242C2DA08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  int v23;

  v23 = a3;
  v11 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_9();
  v14 = v13 - v12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v19 = (char *)&v22 - v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v11 + 16))(v14, a1, a4, v17);
  sub_242C483D4();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, a4);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a6, v19, AssociatedTypeWitness);
  result = type metadata accessor for Batches.Iterator(0, a4, a5, v20);
  *(_QWORD *)(a6 + *(int *)(result + 36)) = a2;
  *(_BYTE *)(a6 + *(int *)(result + 40)) = v23;
  return result;
}

void Batches.makeIterator()(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 16);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_9();
  v8 = v7 - v6;
  OUTLINED_FUNCTION_45_10(v7 - v6, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  sub_242C2DA08(v8, *(_QWORD *)(v2 + *(int *)(a1 + 36)), *(unsigned __int8 *)(v2 + *(int *)(a1 + 40)), v5, *(_QWORD *)(a1 + 24), a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  OUTLINED_FUNCTION_7_0();
}

Swift::OpaquePointer_optional __swiftcall Batches.Iterator.next()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_getAssociatedTypeWitness();
  v0 = sub_242C48A64();
  MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  sub_242C47FFC();
  sub_242C480E0();
  OUTLINED_FUNCTION_3_80();
}

uint64_t sub_242C2DCC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 - 104) = v2;
  if (a1 < *(_QWORD *)(v1 + v2))
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    sub_242C48A94();
    if (__swift_getEnumTagSinglePayload(v5, 1, v4) != 1)
    {
      OUTLINED_FUNCTION_45_10(v7, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
      OUTLINED_FUNCTION_45_10(v6, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
      OUTLINED_FUNCTION_4_75();
      sub_242C48620();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v4);
      sub_242C480E0();
      OUTLINED_FUNCTION_3_80();
    }
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 136) + 8))(v5, *(_QWORD *)(v8 - 128));
  }
  *(_QWORD *)(v8 - 96) = *(_QWORD *)(v8 - 88);
  v10 = OUTLINED_FUNCTION_4_75();
  MEMORY[0x2494EDE24](MEMORY[0x24BEE12E0], v10);
  if ((sub_242C4883C() & 1) == 0)
  {
    sub_242C480E0();
    OUTLINED_FUNCTION_3_80();
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_242C2DE7C()
{
  JUMPOUT(0x2494EDE24);
}

void sub_242C2DE8C()
{
  Batches.Iterator.next()();
}

uint64_t sub_242C2DEA0(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t sub_242C2DEB0()
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

uint64_t *sub_242C2DF34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  }
  return v4;
}

uint64_t sub_242C2DFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E17C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v15;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0xFE)
    v7 = 254;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 >= 0xFE)
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    v15 = *(unsigned __int8 *)(((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 8);
    if (v15 >= 2)
      return ((v15 + 2147483646) & 0x7FFFFFFF) + 1;
    return 0;
  }
  v9 = ((v8 + 7) & 0xFFFFFFF8) + 9;
  v10 = (a2 - v7 + 255) >> (8 * v9);
  if (v9 < 4)
    v11 = v10 + 1;
  else
    v11 = 2;
  if (v11 >= 0x10000)
    v12 = 4;
  else
    v12 = 2;
  if (v11 < 0x100)
    v12 = 1;
  if (v11 >= 2)
    v13 = v12;
  else
    v13 = 0;
  return ((uint64_t (*)(void))((char *)&loc_242C2E204 + 4 * byte_242C628D8[v13]))();
}

void sub_242C2E294(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFEu)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 9;
  if (v6 >= a3)
  {
    v10 = 0;
  }
  else
  {
    if (v7 <= 3)
      v8 = ((a3 - v6 + 255) >> (8 * v7)) + 1;
    else
      v8 = 2;
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
  }
  if (v6 < a2)
  {
    v11 = ~v6 + a2;
    v12 = (~(_BYTE)v6 + a2);
    if (v7 >= 4)
      v13 = v11;
    else
      v13 = v12;
    bzero(a1, v7);
    if ((_DWORD)v7 == 1)
      *a1 = v13;
    else
      *(_DWORD *)a1 = v13;
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

void sub_242C2E3AC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_242C2E3B4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x242C2E3BCLL);
}

void sub_242C2E3F8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_242C2E400()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_242C2E408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!(_DWORD)a2)
LABEL_2:
    JUMPOUT(0x242C2E410);
  if (a3 < 0xFE)
  {
    *(_BYTE *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = a2 + 1;
    goto LABEL_2;
  }
  return __swift_storeEnumTagSinglePayload(v6, a2, a3, a4);
}

uint64_t type metadata accessor for Batches(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Batches);
}

uint64_t sub_242C2E434()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_242C2E4C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v10 = ((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  }
  return a1;
}

uint64_t sub_242C2E59C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_242C2E5E8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E670(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E6F8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E780(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = *(_BYTE *)(v8 + 8);
  return a1;
}

uint64_t sub_242C2E808(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0xFE)
    v7 = 254;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 < a2)
  {
    v9 = ((v8 + 7) & 0xFFFFFFF8) + 9;
    if (v9 < 4)
      v10 = ((a2 - v7 + 255) >> (8 * v9)) + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    __asm { BR              X14 }
  }
  if (v6 >= 0xFE)
    return __swift_getEnumTagSinglePayload(a1, v6, AssociatedTypeWitness);
  v14 = *(unsigned __int8 *)(((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 8);
  if (v14 >= 2)
    return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

void sub_242C2E960(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0xFEu)
    v7 = 254;
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 9;
  if (v7 >= a3)
  {
    v11 = 0;
  }
  else
  {
    if (v8 <= 3)
      v9 = ((a3 - v7 + 255) >> (8 * v8)) + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
  }
  if (v7 < a2)
  {
    if (v8 >= 4)
      v12 = ~v7 + a2;
    else
      v12 = (~(_BYTE)v7 + a2);
    bzero(a1, v8);
    if ((_DWORD)v8 == 1)
      *a1 = v12;
    else
      *(_DWORD *)a1 = v12;
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

void sub_242C2EA98()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v0 + v2) = v1;
}

void sub_242C2EAA0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x242C2EAA8);
}

void sub_242C2EAE8()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_WORD *)(v0 + v2) = v1;
}

void sub_242C2EAF0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = v1;
}

uint64_t sub_242C2EAF8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v4 + v6) = 0;
  if (!(_DWORD)v5)
LABEL_2:
    JUMPOUT(0x242C2EB00);
  if (a1 < 0xFE)
  {
    *(_BYTE *)(((v4 + a3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = v5 + 1;
    goto LABEL_2;
  }
  return __swift_storeEnumTagSinglePayload(v4, v5, a1, a2);
}

uint64_t type metadata accessor for Batches.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Batches.Iterator);
}

void OUTLINED_FUNCTION_3_80()
{
  JUMPOUT(0x2494EC198);
}

uint64_t OUTLINED_FUNCTION_4_75()
{
  return sub_242C48650();
}

uint64_t sub_242C2EB38(uint64_t result)
{
  if (result == 3)
    return 48;
  if (result == 2)
    return 32;
  if (result)
  {
    sub_242C48C38();
    OUTLINED_FUNCTION_0_95();
    OUTLINED_FUNCTION_2_90();
    OUTLINED_FUNCTION_4_74();
    OUTLINED_FUNCTION_1_85();
    OUTLINED_FUNCTION_3_81();
    sub_242A59170();
  }
  return result;
}

uint64_t sub_242C2EBF0(uint64_t a1)
{
  uint64_t result;

  result = 0x65746176697270;
  switch(a1)
  {
    case 0:
      result = 0x646572616873;
      break;
    case 1:
      result = 0x646567616E616DLL;
      break;
    case 2:
      return result;
    case 3:
      result = 0x656C79726F6D656DLL;
      break;
    default:
      sub_242C48C38();
      OUTLINED_FUNCTION_0_95();
      OUTLINED_FUNCTION_2_90();
      OUTLINED_FUNCTION_4_74();
      OUTLINED_FUNCTION_1_85();
      OUTLINED_FUNCTION_3_81();
      sub_242A59170();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_95()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_1_85()
{
  return sub_242C48314();
}

void OUTLINED_FUNCTION_2_90()
{
  type metadata accessor for MTLStorageMode(0);
}

unint64_t sub_242C2ED44()
{
  return 0xD000000000000015;
}

unint64_t sub_242C2ED60()
{
  return 0xD00000000000001ALL;
}

void sub_242C2ED7C()
{
  sub_242A59170();
}

void sub_242C2EDD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
  v1 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v1 + 16) = xmmword_242C4B7C0;
  v2 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 40) = v2;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4();
  swift_retain();
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_242C2EE30()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257220B20);
  v1 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v1 + 16) = xmmword_242C4B7D0;
  v2 = *(_BYTE *)(v0 + 128);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 120);
  *(_BYTE *)(v1 + 40) = v2;
  sub_242C480E0();
  return v1;
}

uint64_t sub_242C2EE84()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_242C2EEB8()
{
  sub_242C2EE84();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BaseLossOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C2EEFC(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x2494EDE24](&unk_242C62B2C, a1);
  return sub_242BD01E4(a1, v2);
}

uint64_t sub_242C2EF38()
{
  return sub_242C2EF68();
}

uint64_t type metadata accessor for LossOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C2EF60()
{
  return sub_242C2EF68();
}

uint64_t sub_242C2EF68()
{
  uint64_t v0;

  sub_242C2EE84();
  sub_242A6549C(*(_QWORD *)(v0 + 136));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SoftmaxCrossEntropyOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C2EFBC()
{
  uint64_t v0;

  sub_242C4817C();
  sub_242C4934C();
  if (*(_BYTE *)(v0 + 160) == 2)
    return sub_242C49358();
  OUTLINED_FUNCTION_4_76();
  return sub_242C4934C();
}

uint64_t sub_242C2F024()
{
  return sub_242C2EFBC();
}

void sub_242C2F044()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
  v1 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v1 + 16) = xmmword_242C4B7E0;
  v2 = v0[5];
  v3 = v0[6];
  *(_QWORD *)(v1 + 32) = v0[19];
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v3;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_242C2F0AC()
{
  sub_242C2EE84();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SoftmaxCrossEntropyGradientOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C2F0F4()
{
  uint64_t v0;

  sub_242C4817C();
  sub_242C4934C();
  if (*(_BYTE *)(v0 + 144) == 2)
    return sub_242C49358();
  OUTLINED_FUNCTION_4_76();
  return sub_242C4934C();
}

uint64_t sub_242C2F15C()
{
  return sub_242C2F0F4();
}

uint64_t sub_242C2F17C(uint64_t a1)
{
  uint64_t result;

  result = sub_242A65450(&qword_25722EE90, type metadata accessor for LossOperation, (uint64_t)&unk_242C62B2C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C2F1B8(uint64_t a1)
{
  uint64_t result;

  result = sub_242A65450(&qword_25722EE98, type metadata accessor for BaseLossOperation, (uint64_t)&unk_242C62B04);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_76()
{
  return sub_242C49358();
}

uint64_t sub_242C2F200(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    sub_242AC3124();
    result = v8;
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v6 = *v4;
      v4 += 2;
      v5 = v6;
      v9 = result;
      v7 = *(_QWORD *)(result + 16);
      if (v7 >= *(_QWORD *)(result + 24) >> 1)
      {
        sub_242AC3124();
        result = v9;
      }
      *(_QWORD *)(result + 16) = v7 + 1;
      *(_QWORD *)(result + 8 * v7 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_242C2F2BC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    return *(_QWORD *)(a1 + 8 * v1 + 24);
  else
    return 0;
}

uint64_t sub_242C2F2E0(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    return sub_242C480E0();
  else
    return 0;
}

void conv2D(_:weight:bias:stride:padding:dilation:groupCount:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, __int128 **a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (**v38)(_QWORD, _QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  _BYTE v59[48];
  uint64_t v60;
  char v61;

  v15 = *a1;
  v16 = *a2;
  v17 = *a3;
  v18 = OUTLINED_FUNCTION_24_52();
  v19 = sub_242B64794(v11, (uint64_t)v18);
  swift_bridgeObjectRelease();
  if (!v19)
  {
LABEL_19:
    OUTLINED_FUNCTION_11_58();
    OUTLINED_FUNCTION_31_13();
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    *(_QWORD *)v59 = v11;
    *(_QWORD *)&v59[8] = v17;
    *(_OWORD *)&v59[16] = xmmword_242C4CD60;
    OUTLINED_FUNCTION_3_82(v42);
    OUTLINED_FUNCTION_0_96();
    goto LABEL_23;
  }
  v20 = *(_QWORD *)(v15 + 16);
  v21 = *(_QWORD *)(v20 + 152);
  if (*(_QWORD *)(v21 + 16) != 4)
  {
    *(_QWORD *)v59 = *(_QWORD *)(v21 + 16);
    *(_OWORD *)&v59[8] = xmmword_242C4CD60;
    v59[24] = 0;
    *(_OWORD *)&v59[32] = xmmword_242C4CD80;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_23;
  }
  v22 = *(_QWORD *)(*(_QWORD *)(v16 + 16) + 152);
  if (*(_QWORD *)(v22 + 16) != 4)
  {
    *(_QWORD *)v59 = *(_QWORD *)(v22 + 16);
    *(_OWORD *)&v59[8] = xmmword_242C4E7C0;
    v59[24] = 0;
    *(_OWORD *)&v59[32] = xmmword_242C4CD80;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_23;
  }
  if (!v17)
    goto LABEL_7;
  v23 = *((_QWORD *)v17 + 2);
  v24 = *(_QWORD *)(v23 + 152);
  if (*(_QWORD *)(v24 + 16) != 1)
  {
    *(_QWORD *)v59 = *(_QWORD *)(v24 + 16);
    *(_OWORD *)&v59[8] = xmmword_242C56260;
    v59[24] = 0;
    *(_OWORD *)&v59[32] = xmmword_242C501F0;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_23;
  }
  if (*(_QWORD *)(v24 + 32) != *(_QWORD *)(v22 + 32))
  {
    *(_QWORD *)v59 = 0;
    *(_QWORD *)&v59[8] = 0xE000000000000000;
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_31_47();
    v55 = *(_OWORD *)v59;
    OUTLINED_FUNCTION_37_20();
    v11 = *(_QWORD *)(v23 + 152);
    v39 = OUTLINED_FUNCTION_28_1();
    MEMORY[0x2494EC0FC](v39, MEMORY[0x24BEE1768]);
    sub_242C48314();
    OUTLINED_FUNCTION_4_0();
    swift_bridgeObjectRelease();
    v17 = &v55;
    OUTLINED_FUNCTION_17_8();
    v40 = *(_QWORD *)(*(_QWORD *)(v16 + 16) + 152);
    if (*(_QWORD *)(v40 + 16))
    {
      v41 = *(_QWORD *)(v40 + 32);
      if ((unsigned __int128)(v41 * (__int128)a11) >> 64 == (v41 * a11) >> 63)
      {
        *(_QWORD *)v59 = v41 * a11;
        sub_242C491CC();
        sub_242C48314();
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_28_8();
        OUTLINED_FUNCTION_4_77();
        __break(1u);
        return;
      }
      __break(1u);
      goto LABEL_19;
    }
    memset(v59, 0, 24);
    v59[24] = -1;
    *(_QWORD *)&v59[40] = 0;
    v60 = 0;
    *(_QWORD *)&v59[32] = 0;
    v61 = -1;
    OUTLINED_FUNCTION_39_37();
    OUTLINED_FUNCTION_17_52();
LABEL_23:
    sub_242A59264();
  }
LABEL_7:
  v47 = *(_QWORD *)(v16 + 16);
  v25 = *(_QWORD *)(v15 + 16);
  *(_QWORD *)&v55 = *(_QWORD *)(v20 + 152);
  *(_QWORD *)&v51 = v22;
  LOBYTE(v45) = 2;
  sub_242C36C58((uint64_t)&v55, (uint64_t *)&v51, a4, a5, a6, a7, a8, a10, v59, a11, (uint64_t)"conv2D(_:weight:bias:stride:padding:dilation:groupCount:)", 57, v45, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/Operations/NN.swift", 95, 2u, 232);
  v26 = *(_QWORD *)v59;
  v27 = a4;
  if (v17)
  {
    v46 = *((_QWORD *)v17 + 2);
    swift_retain();
  }
  else
  {
    v46 = 0;
  }
  *(_QWORD *)v59 = v15;
  Tensor.scalarType.getter();
  OUTLINED_FUNCTION_29_36();
  v29 = *(void (**)(uint64_t))(v28 + 32);
  swift_retain();
  swift_retain();
  v30 = OUTLINED_FUNCTION_20_58();
  v29(v30);
  *(_QWORD *)&v55 = v26;
  v31 = OUTLINED_FUNCTION_2_0();
  *(_BYTE *)(v31 + 16) = v17 != 0;
  *(_QWORD *)(v31 + 24) = v27;
  *(_QWORD *)(v31 + 32) = a5;
  *(_QWORD *)(v31 + 40) = a6;
  *(_QWORD *)(v31 + 48) = a7;
  *(_QWORD *)(v31 + 56) = a8;
  *(_QWORD *)(v31 + 64) = a10;
  *(_QWORD *)(v31 + 72) = a11;
  OUTLINED_FUNCTION_98_7((uint64_t)sub_242C32344);
  OUTLINED_FUNCTION_135();
  *(_OWORD *)&v59[8] = xmmword_242C522A0;
  *(_OWORD *)&v59[24] = xmmword_242C62B50;
  *(_QWORD *)v59 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/NNOps.swift";
  OUTLINED_FUNCTION_43_34(101);
  type metadata accessor for Convolution2DOperation();
  OUTLINED_FUNCTION_2_0();
  *(_QWORD *)&v44 = a8;
  *((_QWORD *)&v44 + 1) = a10;
  *(_QWORD *)&v43 = a6;
  *((_QWORD *)&v43 + 1) = a7;
  v32 = OUTLINED_FUNCTION_48_20();
  v35 = sub_242B027E0(v32, v33, v34, v25, v47, v46, v27, a5, v43, v44, a11, (uint64_t)&v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221168);
  v36 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v36 + 16) = xmmword_242C4B7F0;
  *(_QWORD *)(v36 + 32) = v16;
  *(_QWORD *)(v36 + 40) = v15;
  swift_retain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_0_2();
  while (1)
  {
    v37 = OUTLINED_FUNCTION_34_43();
    sub_242A66290(v37, (uint64_t)&v51);
    if (*((_QWORD *)&v52 + 1))
      break;
    sub_242A662D8((uint64_t)&v51);
    if ((a8 & 1) != 0)
    {
      OUTLINED_FUNCTION_136();
      v58 = 0;
      v56 = 0u;
      v57 = 0u;
      v55 = 0u;
      goto LABEL_15;
    }
  }
  OUTLINED_FUNCTION_136();
  v55 = v51;
  v56 = v52;
  v57 = v53;
  v58 = v54;
LABEL_15:
  OUTLINED_FUNCTION_136();
  v38 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_257221ED8, (uint64_t (*)(uint64_t))type metadata accessor for Convolution2DOperation, (uint64_t)&unk_242C54D40);
  OUTLINED_FUNCTION_13_40(v35, v38, (uint64_t)&v55, a9);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_13_11();
}

void transposedConv2D(_:weight:bias:stride:padding:dilation:groupCount:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, __int128 **a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;

  v11 = *a1;
  v12 = *a3;
  v14 = *a2;
  v15 = v11;
  v13 = v12;
  transposedConv2D(_:weight:bias:stride:padding:outputPadding:dilation:groupCount:)(&v15, &v14, &v13, a4, a5, a6, a7, 0, a9, 0, a8, a10, a11);
}

void transposedConv2D(_:weight:bias:stride:padding:outputPadding:dilation:groupCount:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, __int128 **a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (**v45)(_QWORD, _QWORD);
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  int v70;
  _BYTE v71[48];
  uint64_t v72;
  char v73;

  v15 = v71;
  v16 = *a1;
  v17 = *a2;
  v18 = *a3;
  v19 = OUTLINED_FUNCTION_24_52();
  v20 = OUTLINED_FUNCTION_10_56((uint64_t)v19);
  OUTLINED_FUNCTION_81();
  if (!v20)
  {
LABEL_25:
    OUTLINED_FUNCTION_11_58();
    OUTLINED_FUNCTION_31_13();
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    *(_QWORD *)v71 = v13;
    *(_QWORD *)&v71[8] = v18;
    *((_OWORD *)v15 + 1) = xmmword_242C4CD60;
    OUTLINED_FUNCTION_3_82(v51);
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v21 = *(_QWORD *)(v16 + 16);
  if (*(_QWORD *)(*(_QWORD *)(v21 + 152) + 16) != 4)
  {
    *(_QWORD *)v71 = *(_QWORD *)(*(_QWORD *)(v21 + 152) + 16);
    *(_OWORD *)&v71[8] = xmmword_242C4CD60;
    v71[24] = 0;
    *(_OWORD *)&v71[32] = xmmword_242C4CD80;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v22 = OUTLINED_FUNCTION_24_52();
  v23 = OUTLINED_FUNCTION_10_56((uint64_t)v22);
  OUTLINED_FUNCTION_81();
  if (!v23)
  {
    OUTLINED_FUNCTION_11_58();
    OUTLINED_FUNCTION_31_13();
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    *(_QWORD *)v71 = v13;
    *(_QWORD *)&v71[8] = v18;
    *(_OWORD *)&v71[16] = xmmword_242C4E7C0;
    OUTLINED_FUNCTION_3_82(v52);
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v24 = *(_QWORD *)(v17 + 16);
  v25 = *(_QWORD *)(v24 + 152);
  if (*(_QWORD *)(v25 + 16) != 4)
  {
    *(_QWORD *)v71 = *(_QWORD *)(v25 + 16);
    *(_OWORD *)&v71[8] = xmmword_242C4E7C0;
    v71[24] = 0;
    *(_OWORD *)&v71[32] = xmmword_242C4CD80;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v57 = a9;
  if (!v18)
    goto LABEL_12;
  v26 = OUTLINED_FUNCTION_24_52();
  v27 = OUTLINED_FUNCTION_10_56((uint64_t)v26);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_81();
  if (!v27)
  {
    OUTLINED_FUNCTION_11_58();
    OUTLINED_FUNCTION_31_13();
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    *(_QWORD *)v71 = v13;
    *(_QWORD *)&v71[8] = v18;
    *(_OWORD *)&v71[16] = xmmword_242C56260;
    OUTLINED_FUNCTION_3_82(v53);
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v28 = *((_QWORD *)v18 + 2);
  v29 = *(_QWORD *)(v28 + 152);
  if (*(_QWORD *)(v29 + 16) != 1)
  {
    *(_QWORD *)v71 = *(_QWORD *)(v29 + 16);
    *(_OWORD *)&v71[8] = xmmword_242C56260;
    v71[24] = 0;
    *(_OWORD *)&v71[32] = xmmword_242C501F0;
    OUTLINED_FUNCTION_7_63();
    OUTLINED_FUNCTION_0_96();
    goto LABEL_33;
  }
  v30 = *(_QWORD *)(*(_QWORD *)(v17 + 16) + 152);
  v31 = *(_QWORD *)(v30 + 16);
  if (v31 <= 1)
  {
    *(_QWORD *)&v71[16] = 0;
    *(_OWORD *)v71 = 1uLL;
    v71[24] = -1;
    *(_QWORD *)&v71[40] = 0;
    v72 = 0;
    *(_QWORD *)&v71[32] = v31;
    v73 = -1;
LABEL_32:
    OUTLINED_FUNCTION_39_37();
    OUTLINED_FUNCTION_17_52();
LABEL_33:
    sub_242A59264();
  }
  v32 = *(_QWORD *)(v30 + 40);
  if ((unsigned __int128)(v32 * (__int128)a13) >> 64 != (v32 * a13) >> 63)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (*(_QWORD *)(v29 + 32) != v32 * a13)
  {
LABEL_22:
    *(_QWORD *)v71 = 0;
    *(_QWORD *)&v71[8] = 0xE000000000000000;
    OUTLINED_FUNCTION_31_47();
    v67 = *(_OWORD *)v71;
    OUTLINED_FUNCTION_37_20();
    v13 = *(_QWORD *)(v28 + 152);
    v46 = OUTLINED_FUNCTION_28_1();
    MEMORY[0x2494EC0FC](v46, MEMORY[0x24BEE1768]);
    v15 = v47;
    sub_242C48314();
    OUTLINED_FUNCTION_4_0();
    swift_bridgeObjectRelease();
    v18 = &v67;
    OUTLINED_FUNCTION_17_8();
    v48 = *(_QWORD *)(*(_QWORD *)(v17 + 16) + 152);
    v49 = *(_QWORD *)(v48 + 16);
    if (v49 > 1)
    {
      v50 = *(_QWORD *)(v48 + 40);
      if ((unsigned __int128)(v50 * (__int128)a13) >> 64 == (v50 * a13) >> 63)
      {
        *(_QWORD *)v71 = v50 * a13;
        sub_242C491CC();
        sub_242C48314();
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_28_8();
        OUTLINED_FUNCTION_4_77();
        __break(1u);
        return;
      }
      __break(1u);
      goto LABEL_25;
    }
    *(_QWORD *)&v71[16] = 0;
    *(_OWORD *)v71 = 1uLL;
    v71[24] = -1;
    *(_QWORD *)&v71[40] = 0;
    v72 = 0;
    *(_QWORD *)&v71[32] = v49;
    v73 = -1;
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_135();
  v24 = *(_QWORD *)(v17 + 16);
  v25 = *(_QWORD *)(v24 + 152);
LABEL_12:
  v33 = *(_QWORD *)(v16 + 16);
  *(_QWORD *)&v67 = *(_QWORD *)(v33 + 152);
  *(_QWORD *)&v63 = v25;
  sub_242C371CC(&v67, (uint64_t)&v63, a4, a5, a6, a7, a8, a10, (uint64_t *)v71, a11, a12, a13);
  v34 = *(_QWORD *)v71;
  if (v18)
  {
    v56 = *((_QWORD *)v18 + 2);
    swift_retain();
  }
  else
  {
    v56 = 0;
  }
  *(_QWORD *)v71 = v16;
  Tensor.scalarType.getter();
  OUTLINED_FUNCTION_29_36();
  v36 = *(void (**)(uint64_t))(v35 + 32);
  swift_retain();
  swift_retain();
  v37 = OUTLINED_FUNCTION_20_58();
  v36(v37);
  *(_QWORD *)&v67 = v34;
  v38 = OUTLINED_FUNCTION_2_0();
  *(_BYTE *)(v38 + 16) = v18 != 0;
  *(_QWORD *)(v38 + 24) = a4;
  *(_QWORD *)(v38 + 32) = a5;
  *(_QWORD *)(v38 + 40) = a6;
  *(_QWORD *)(v38 + 48) = a7;
  *(_QWORD *)(v38 + 56) = a11;
  *(_QWORD *)(v38 + 64) = a12;
  *(_QWORD *)(v38 + 72) = a13;
  OUTLINED_FUNCTION_98_7((uint64_t)sub_242C32CD0);
  OUTLINED_FUNCTION_135();
  *(_OWORD *)&v71[8] = xmmword_242C522A0;
  *(_OWORD *)&v71[24] = xmmword_242C62B60;
  *(_QWORD *)v71 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/NNOps.swift";
  OUTLINED_FUNCTION_43_34(115);
  type metadata accessor for ConvolutionTranspose2DOperation();
  OUTLINED_FUNCTION_2_0();
  *(_QWORD *)&v55 = a8;
  *((_QWORD *)&v55 + 1) = a10;
  *(_QWORD *)&v54 = a6;
  *((_QWORD *)&v54 + 1) = a7;
  v39 = OUTLINED_FUNCTION_48_20();
  v42 = sub_242B02964(v39, v40, v41, v33, v24, v56, a4, a5, v54, v55, a11, a12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221168);
  v43 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v43 + 16) = xmmword_242C4B7F0;
  *(_QWORD *)(v43 + 32) = v17;
  *(_QWORD *)(v43 + 40) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_0_2();
  while (1)
  {
    v44 = OUTLINED_FUNCTION_34_43();
    sub_242A66290(v44, (uint64_t)&v63);
    if (*((_QWORD *)&v64 + 1))
      break;
    sub_242A662D8((uint64_t)&v63);
    if ((v17 & 1) != 0)
    {
      OUTLINED_FUNCTION_136();
      v70 = 0;
      v68 = 0u;
      v69 = 0u;
      v67 = 0u;
      goto LABEL_20;
    }
  }
  OUTLINED_FUNCTION_136();
  v67 = v63;
  v68 = v64;
  v69 = v65;
  v70 = v66;
LABEL_20:
  OUTLINED_FUNCTION_136();
  v45 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_257221EC8, (uint64_t (*)(uint64_t))type metadata accessor for ConvolutionTranspose2DOperation, (uint64_t)&unk_242C54D40);
  OUTLINED_FUNCTION_13_40(v42, v45, (uint64_t)&v67, v57);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_13_11();
}

uint64_t Tensor.padded(forSizes:with:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[6];

  v7 = *v3;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v8 = OUTLINED_FUNCTION_45_25();
  v11[0] = v7;
  Tensor.scalarType.getter();
  if (v8 == v9)
  {
    v11[5] = v7;
    sub_242A587A8((uint64_t)a2, (uint64_t)v11);
    Tensor.padded(forSizes:mode:)(a1, a3);
    return sub_242A8A7D4((uint64_t)v11);
  }
  else
  {
    result = OUTLINED_FUNCTION_4_77();
    __break(1u);
  }
  return result;
}

uint64_t Tensor.padded(forSizes:mode:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  _BOOL8 v3;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (**v31)(_QWORD, _QWORD);
  uint64_t v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  const char *v37;
  uint64_t v38;
  __int16 v39;
  char v40;
  _QWORD v41[3];
  uint64_t v42;
  __int128 v43[2];
  const char *v44;

  v6 = *v2;
  OUTLINED_FUNCTION_35_35(a1, (uint64_t)&v34);
  if ((unint64_t)v36 > 2)
  {
    sub_242A64518((__int128 *)&v34, (uint64_t)v41);
    v7 = v42;
    __swift_project_boxed_opaque_existential_1(v41, v42);
    v8 = OUTLINED_FUNCTION_45_25();
    OUTLINED_FUNCTION_40_42();
    if (v8 == v9)
    {
      v10 = OUTLINED_FUNCTION_93_12();
      v3 = sub_242B64794(v7, (uint64_t)v10);
      OUTLINED_FUNCTION_81();
      if (v3)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
        goto LABEL_6;
      }
    }
    else
    {
      OUTLINED_FUNCTION_4_77();
      __break(1u);
    }
    LOBYTE(v34) = v7;
    sub_242C21A14();
    OUTLINED_FUNCTION_31_13();
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    v34 = (const char *)a2;
    v35 = (unint64_t)&v34;
    *(_QWORD *)&v36 = 0;
    BYTE8(v36) = 6;
    v37 = (const char *)v33;
    LOBYTE(v38) = 2;
    v40 = 3;
    OUTLINED_FUNCTION_0_96();
    sub_242A59264();
  }
  sub_242A8A7D4((uint64_t)&v34);
LABEL_6:
  v41[0] = *(_QWORD *)(*(_QWORD *)(v6 + 16) + 152);
  OUTLINED_FUNCTION_0_2();
  sub_242C36B20();
  v11 = OUTLINED_FUNCTION_136();
  v12 = v34;
  v13 = *(_QWORD *)(v6 + 16);
  OUTLINED_FUNCTION_35_35(v11, (uint64_t)v41);
  OUTLINED_FUNCTION_40_42();
  OUTLINED_FUNCTION_29_36();
  v15 = *(uint64_t (**)(uint64_t))(v14 + 32);
  swift_retain();
  sub_242C480E0();
  v16 = OUTLINED_FUNCTION_20_58();
  v17 = v15(v16);
  v44 = v12;
  OUTLINED_FUNCTION_35_35(v17, (uint64_t)&v34);
  v18 = *(_QWORD *)(v13 + 152);
  *(_QWORD *)&v43[0] = v6;
  Tensor.scalarType.getter();
  OUTLINED_FUNCTION_29_36();
  sub_242A8A798((uint64_t)&v34, (uint64_t)v43);
  v19 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  sub_242A64518(v43, (uint64_t)(v19 + 2));
  v19[7] = a1;
  v19[8] = v18;
  v19[9] = v43;
  v19[10] = v3;
  sub_242C480E0();
  sub_242C480E0();
  v20 = sub_242BD0D40((uint64_t)sub_242C32D54);
  v22 = v21;
  OUTLINED_FUNCTION_50_0();
  sub_242A8A7D4((uint64_t)&v34);
  v34 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PaddingOps.swift";
  v35 = xmmword_242C4E400;
  v36 = xmmword_242C62B70;
  v37 = "init(id:operand:mode:padding:resultDescriptor:creationSite:backward:)";
  v38 = 69;
  v39 = 2;
  type metadata accessor for PadOperation();
  OUTLINED_FUNCTION_2_0();
  v23 = OUTLINED_FUNCTION_48_20();
  sub_242ABD788(v23, v24, v25, v13, v26, a1, v27, v28, v20, v22);
  v30 = v29;
  v31 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_257221F18, (uint64_t (*)(uint64_t))type metadata accessor for PadOperation, (uint64_t)&unk_242C514B4);
  sub_242A66290(*(_QWORD *)(v6 + 16) + 168, (uint64_t)v41);
  return OUTLINED_FUNCTION_13_40(v30, v31, (uint64_t)v41, a2);
}

uint64_t maxPool2D(_:kernelSize:stride:padding:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v8;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t inited;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (**v28)(_QWORD, _QWORD);
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  const char *v36;
  uint64_t v37[6];
  uint64_t v38;
  const char *v39;
  __int128 v40;
  __int128 v41;

  v14 = *a1;
  v15 = OUTLINED_FUNCTION_93_12();
  v16 = sub_242B64794(v8, (uint64_t)v15);
  swift_bridgeObjectRelease();
  if (!v16)
  {
    OUTLINED_FUNCTION_32_42();
    OUTLINED_FUNCTION_31_13();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    v39 = a8;
    *(_QWORD *)&v40 = v8;
    OUTLINED_FUNCTION_4_49(v30, (__n128)xmmword_242C4CD60);
    OUTLINED_FUNCTION_0_96();
    sub_242A59264();
  }
  v33 = (uint64_t *)a8;
  v36 = *(const char **)(*(_QWORD *)(v14 + 16) + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_242C4DE40;
  *(int64x2_t *)(inited + 32) = vdupq_n_s64(1uLL);
  v31 = a2;
  *(_QWORD *)(inited + 48) = a2;
  *(_QWORD *)(inited + 56) = a3;
  v38 = inited;
  OUTLINED_FUNCTION_0_2();
  v18 = a4;
  v32 = a5;
  sub_242C36888((uint64_t)&v36, (uint64_t)&v38, a4, a5, a6, a7, &v39);
  OUTLINED_FUNCTION_136();
  swift_bridgeObjectRelease();
  v19 = v39;
  if (v39)
  {
    OUTLINED_FUNCTION_42_35();
    v21 = v20;
    v23 = v22;
    v24 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 32);
    OUTLINED_FUNCTION_11_6();
    v24(v37, v21, v23);
    v36 = v19;
    v25 = (_QWORD *)OUTLINED_FUNCTION_2_0();
    v25[2] = v31;
    v25[3] = a3;
    v25[4] = v18;
    v25[5] = v32;
    v25[6] = a6;
    v25[7] = a7;
    sub_242BD0D40((uint64_t)sub_242C32D70);
    OUTLINED_FUNCTION_8_1();
    v40 = xmmword_242C4E400;
    v41 = xmmword_242C62B80;
    v39 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PoolingOps.swift";
    OUTLINED_FUNCTION_37_40(82);
    type metadata accessor for Max2DPoolOperation();
    OUTLINED_FUNCTION_2_0();
    v26 = OUTLINED_FUNCTION_48_20();
    v27 = sub_242AF8564(v26);
    v28 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_257221EF8, (uint64_t (*)(uint64_t))type metadata accessor for Max2DPoolOperation, (uint64_t)&unk_242C5367C);
    sub_242A66290(*(_QWORD *)(v14 + 16) + 168, (uint64_t)&v36);
    return OUTLINED_FUNCTION_13_40(v27, v28, (uint64_t)&v36, v33);
  }
  else
  {
    result = OUTLINED_FUNCTION_4_77();
    __break(1u);
  }
  return result;
}

uint64_t averagePool2D(_:kernelSize:stride:padding:countIncludesPadding:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>)
{
  uint64_t v9;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  uint64_t inited;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (**v29)(_QWORD, _QWORD);
  uint64_t result;
  uint64_t v31;
  uint64_t v33;
  uint64_t *v34;
  const char *v36;
  uint64_t v37[6];
  uint64_t v38;
  const char *v39;
  __int128 v40;
  __int128 v41;

  v16 = *a1;
  v17 = OUTLINED_FUNCTION_93_12();
  v18 = sub_242B64794(v9, (uint64_t)v17);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    OUTLINED_FUNCTION_32_42();
    OUTLINED_FUNCTION_31_13();
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
    v39 = (const char *)v18;
    *(_QWORD *)&v40 = v9;
    OUTLINED_FUNCTION_4_49(v31, (__n128)xmmword_242C4CD60);
    OUTLINED_FUNCTION_0_96();
    sub_242A59264();
  }
  v34 = a9;
  v36 = *(const char **)(*(_QWORD *)(v16 + 16) + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_242C4DE40;
  *(int64x2_t *)(inited + 32) = vdupq_n_s64(1uLL);
  *(_QWORD *)(inited + 48) = a2;
  *(_QWORD *)(inited + 56) = a3;
  v38 = inited;
  OUTLINED_FUNCTION_28_1();
  v33 = a5;
  sub_242C36888((uint64_t)&v36, (uint64_t)&v38, a4, a5, a6, a7, &v39);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_136();
  v20 = v39;
  if (v39)
  {
    OUTLINED_FUNCTION_42_35();
    v22 = v21;
    v24 = v23;
    v25 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v23 + 32);
    OUTLINED_FUNCTION_11_6();
    v25(v37, v22, v24);
    v36 = v20;
    v26 = OUTLINED_FUNCTION_2_0();
    *(_QWORD *)(v26 + 16) = a2;
    *(_QWORD *)(v26 + 24) = a3;
    *(_QWORD *)(v26 + 32) = a4;
    *(_QWORD *)(v26 + 40) = v33;
    *(_QWORD *)(v26 + 48) = a6;
    *(_QWORD *)(v26 + 56) = a7;
    *(_BYTE *)(v26 + 64) = a8 & 1;
    sub_242BD0D40((uint64_t)sub_242C32D8C);
    OUTLINED_FUNCTION_8_1();
    v40 = xmmword_242C4E400;
    v41 = xmmword_242C62B90;
    v39 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PoolingOps.swift";
    OUTLINED_FUNCTION_37_40(103);
    type metadata accessor for Average2DPoolOperation();
    OUTLINED_FUNCTION_2_0();
    v27 = OUTLINED_FUNCTION_48_20();
    v28 = sub_242AF83CC(v27);
    v29 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_257221F08, (uint64_t (*)(uint64_t))type metadata accessor for Average2DPoolOperation, (uint64_t)&unk_242C5367C);
    sub_242A66290(*(_QWORD *)(v16 + 16) + 168, (uint64_t)&v36);
    return OUTLINED_FUNCTION_13_40(v28, v29, (uint64_t)&v36, v34);
  }
  else
  {
    result = OUTLINED_FUNCTION_4_77();
    __break(1u);
  }
  return result;
}

void sub_242C309F4(uint64_t *a1@<X0>, uint64_t *a2@<X8>, float a3@<S0>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t inited;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[3];
  uint64_t v49;
  _UNKNOWN **v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  _UNKNOWN **v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;
  _QWORD v59[6];
  int v60;
  const char *v61;
  __int128 v62;
  __int128 v63;
  const char *v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = sub_242C49208();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  if (a3 <= 0.0)
  {
    *a2 = v11;
    swift_retain();
  }
  else if (a3 >= 1.0)
  {
    v48[0] = *v3;
    OUTLINED_FUNCTION_11_6();
    Tensor.init(zerosLike:)(v48, a2);
  }
  else
  {
    v43 = a2;
    v12 = *a1;
    v13 = OUTLINED_FUNCTION_93_12();
    v14 = sub_242B64794(v3, (uint64_t)v13);
    swift_bridgeObjectRelease();
    if (!v14)
    {
      v48[0] = v11;
      Tensor.scalarType.getter();
      v36 = v35;
      v38 = v37;
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257221930);
      v48[0] = v36;
      v48[1] = v38;
      v48[2] = 0;
      v49 = 0;
      LOBYTE(v50) = 6;
      v51 = v39;
      v52 = 2;
      v56 = 3;
      OUTLINED_FUNCTION_0_96();
      sub_242A59264();
    }
    v15 = *(_QWORD *)(v12 + 16);
    *(_QWORD *)&v41 = *(_QWORD *)(v11 + 16);
    v59[0] = *(_QWORD *)(v41 + 152);
    v16 = *(_BYTE *)(v41 + 160);
    v49 = MEMORY[0x24BEE13C8];
    v50 = &protocol witness table for Double;
    v48[0] = 0;
    v53 = MEMORY[0x24BEE13C8];
    v54 = &protocol witness table for Double;
    v51 = 0x3FF0000000000000;
    v57 = 2;
    v58 = v16;
    v61 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/RandomOp.swift";
    v62 = xmmword_242C4CA40;
    v63 = xmmword_242C4CA50;
    v64 = "init(id:state:shape:distribution:creationSite:)";
    v65 = 47;
    v66 = 2;
    type metadata accessor for RandomOperation();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_91();
    sub_242C480E0();
    v17 = OUTLINED_FUNCTION_48_20();
    v23 = sub_242B91B60(v17, v18, v19, v15, v20, v21, v22);
    type metadata accessor for ContextManager();
    memset(v59, 0, sizeof(v59));
    v60 = 0;
    v42 = v23;
    swift_retain();
    sub_242B93328();
    OUTLINED_FUNCTION_263_0();
    OUTLINED_FUNCTION_135();
    v24 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v48);
    sub_242B93328();
    OUTLINED_FUNCTION_263_0();
    OUTLINED_FUNCTION_135();
    v25 = (uint64_t)v54;
    OUTLINED_FUNCTION_91();
    sub_242A5DC30((uint64_t)v48);
    type metadata accessor for TensorRepresentation();
    v26 = OUTLINED_FUNCTION_2_0();
    LOBYTE(v48[0]) = 1;
    sub_242B4BE5C(v23, 0, (uint64_t)v59, 0x100000000, v24, v25, v26);
    v28 = v27;
    type metadata accessor for TensorHandle();
    v29 = OUTLINED_FUNCTION_2_0();
    *(_QWORD *)(v29 + 16) = v28;
    v30 = v29;
    v40[1] = v29;
    swift_retain();
    sub_242BC995C();
    v47 = v30;
    LOBYTE(v23) = *(_BYTE *)(v41 + 160);
    OUTLINED_FUNCTION_44_31();
    v45 = MEMORY[0x24BEE4AF8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
    inited = swift_initStackObject();
    v41 = xmmword_242C4B7D0;
    *(_OWORD *)(inited + 16) = xmmword_242C4B7D0;
    *(float *)(inited + 32) = a3;
    v44 = v23;
    OUTLINED_FUNCTION_27_40();
    Tensor.init(shape:coercingScalars:scalarType:on:)();
    sub_242A662D8((uint64_t)v48);
    v59[0] = v46;
    static Tensor..>= infix(_:_:)();
    OUTLINED_FUNCTION_50_0();
    v32 = v48[0];
    LOBYTE(v30) = *(_BYTE *)(*(_QWORD *)(v11 + 16) + 160);
    OUTLINED_FUNCTION_44_31();
    v46 = MEMORY[0x24BEE4AF8];
    v33 = OUTLINED_FUNCTION_2_0();
    *(_OWORD *)(v33 + 16) = v41;
    *(float *)(v33 + 32) = 1.0 - a3;
    LOBYTE(v45) = v30;
    OUTLINED_FUNCTION_27_40();
    Tensor.init(shape:coercingScalars:scalarType:on:)();
    sub_242A662D8((uint64_t)v48);
    v34 = v47;
    v48[0] = v11;
    v59[0] = v32;
    LOBYTE(v46) = *(_BYTE *)(*(_QWORD *)(v11 + 16) + 160);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE38B8], v7);
    Tensor.cast(to:roundingRule:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v46 = v47;
    static Tensor.* infix(_:_:)();
    OUTLINED_FUNCTION_135();
    v46 = v34;
    v47 = v59[0];
    static Tensor./ infix(_:_:)();
    OUTLINED_FUNCTION_50_0();
    OUTLINED_FUNCTION_135();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *v43 = v48[0];
  }
}

uint64_t normalize(_:mean:variance:scale:offset:varianceEpsilon:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X2>, uint64_t *a3@<X3>, uint64_t *a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v6 = *a1;
  v7 = *a3;
  v8 = *a4;
  v11 = *a2;
  static Tensor.+ infix(_:_:)();
  rsqrt(_:)();
  OUTLINED_FUNCTION_135();
  v9 = v11;
  v12 = v6;
  static Tensor.- infix(_:_:)();
  if (v7)
  {
    v12 = v9;
    static Tensor.* infix(_:_:)();
  }
  else
  {
    OUTLINED_FUNCTION_91();
  }
  static Tensor.* infix(_:_:)();
  OUTLINED_FUNCTION_28_5();
  swift_release();
  if (v8)
  {
    static Tensor.+ infix(_:_:)();
    OUTLINED_FUNCTION_28_5();
    return OUTLINED_FUNCTION_135();
  }
  else
  {
    result = OUTLINED_FUNCTION_135();
    *a5 = v12;
  }
  return result;
}

uint64_t Tensor.droppingOut(withProbability:seed:)@<X0>(unint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>, float a4@<S0>)
{
  uint64_t *v4;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  char v19;
  uint64_t v20;

  if (a4 < 0.0 || a4 > 1.0)
    goto LABEL_14;
  v9 = *v4;
  if ((a2 & 1) == 0)
  {
LABEL_10:
    UInt64.vector2.getter(a1);
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = v14;
    v19 = 0;
    v20 = 0;
    v18[1] = v9;
    sub_242AC87F0(v18);
    v17 = v18[0];
    sub_242C309F4(&v17, a3, a4);
    return OUTLINED_FUNCTION_28_5();
  }
  type metadata accessor for ContextManager();
  v10 = (char *)sub_242B93328() + 16;
  swift_beginAccess();
  v11 = *(_QWORD *)(*(_QWORD *)v10 + 16);
  swift_beginAccess();
  v12 = *(_QWORD *)v10;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v10 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    if (v11)
      goto LABEL_8;
  }
  else
  {
    sub_242B4B510();
    v12 = v16;
    *(_QWORD *)v10 = v16;
    if (v11)
    {
LABEL_8:
      if (v11 <= *(_QWORD *)(v12 + 16))
      {
        a1 = sub_242B93088();
        swift_endAccess();
        OUTLINED_FUNCTION_28_5();
        goto LABEL_10;
      }
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  sub_242C48C38();
  OUTLINED_FUNCTION_37_20();
  sub_242C48704();
  result = OUTLINED_FUNCTION_4_77();
  __break(1u);
  return result;
}

uint64_t sub_242C311FC(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (result < a5 || result >= a6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257222B28);
    sub_242B5A218(a2, a3, a4);
    sub_242B5A218(a7, a8, a9);
    sub_242A59264();
  }
  return result;
}

uint64_t sub_242C312F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[56];
  _BYTE v31[56];
  const char *v32;
  __int128 v33;
  __int128 v34;
  const char *v35;
  uint64_t v36;
  __int16 v37;

  if (*(_QWORD *)(result + 16))
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
      v9 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 16);
      v10 = *(_BYTE *)(v9 + 160);
      v26 = *(_QWORD *)(v9 + 152);
      v27 = v10;
      v33 = xmmword_242C4E400;
      v34 = xmmword_242C62BA0;
      v32 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PoolingOps.swift";
      v35 = "init(id:gradientOperand:operand:kernelSize:stride:padding:resultDescriptor:creationSite:)";
      v36 = 89;
      v37 = 2;
      type metadata accessor for Max2DPoolGradientOperation();
      swift_allocObject();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_242C480E0();
      v15 = sub_242AF8628(0, 0, 0, v8, v9, a3, a4, a5, a6, a7, a8, &v26, &v32);
      sub_242A66290(v8 + 168, (uint64_t)v31);
      sub_242A66290((uint64_t)v31, (uint64_t)v30);
      type metadata accessor for ContextManager();
      swift_retain();
      sub_242B93328();
      sub_242B933C0((uint64_t)&v26);
      swift_release();
      v16 = v29;
      swift_retain();
      sub_242A5DC30((uint64_t)&v26);
      sub_242B93328();
      sub_242B933C0((uint64_t)&v26);
      swift_release();
      v17 = v28;
      swift_retain();
      sub_242A5DC30((uint64_t)&v26);
      type metadata accessor for TensorRepresentation();
      v18 = swift_allocObject();
      LOBYTE(v26) = 1;
      v19 = sub_242B4DC2C(v15, 0, v30, 0x100000000, v16, v17, v18);
      type metadata accessor for TensorHandle();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v19;
      swift_retain();
      sub_242BC995C();
      swift_release();
      sub_242A662D8((uint64_t)v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_242C4B7D0;
      swift_retain();
      swift_retain();
      v22 = sub_242AC4964();
      *(_QWORD *)(v21 + 32) = v20;
      *(_QWORD *)(v21 + 40) = v22;
      *(_QWORD *)(v21 + 48) = v23;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v21;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C315BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[56];
  _BYTE v33[56];
  const char *v34;
  __int128 v35;
  __int128 v36;
  const char *v37;
  uint64_t v38;
  __int16 v39;

  if (*(_QWORD *)(result + 16))
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
      v10 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 16);
      v11 = *(_BYTE *)(v10 + 160);
      v28 = *(_QWORD *)(v10 + 152);
      v29 = v11;
      v35 = xmmword_242C4E400;
      v36 = xmmword_242C62BB0;
      v34 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PoolingOps.swift";
      v37 = "init(id:gradientOperand:operand:kernelSize:stride:padding:countIncludesPadding:resultDescriptor:creationSite:)";
      v38 = 110;
      v39 = 2;
      type metadata accessor for Average2DPoolGradientOperation();
      swift_allocObject();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_242C480E0();
      v25 = a9 & 1;
      v16 = sub_242AF8498(0, 0, 0, v9, v10, a3, a4, a5, a6, a7, a8, v25, &v28, &v34);
      sub_242A66290(v9 + 168, (uint64_t)v33);
      sub_242A66290((uint64_t)v33, (uint64_t)v32);
      type metadata accessor for ContextManager();
      swift_retain();
      sub_242B93328();
      sub_242B933C0((uint64_t)&v28);
      swift_release();
      v17 = v31;
      swift_retain();
      sub_242A5DC30((uint64_t)&v28);
      sub_242B93328();
      sub_242B933C0((uint64_t)&v28);
      swift_release();
      v18 = v30;
      swift_retain();
      sub_242A5DC30((uint64_t)&v28);
      type metadata accessor for TensorRepresentation();
      v19 = swift_allocObject();
      LOBYTE(v28) = 1;
      v20 = sub_242B4DDC0(v16, 0, v32, 0x100000000, v17, v18, v19);
      type metadata accessor for TensorHandle();
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = v20;
      swift_retain();
      sub_242BC995C();
      swift_release();
      sub_242A662D8((uint64_t)v33);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_242C4B7D0;
      swift_retain();
      swift_retain();
      v23 = sub_242AC4964();
      *(_QWORD *)(v22 + 32) = v21;
      *(_QWORD *)(v22 + 40) = v23;
      *(_QWORD *)(v22 + 48) = v24;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C31894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64x2_t *v33;
  int64x2_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39[18];
  _BYTE v40[56];
  uint64_t v41;
  _QWORD v42[6];
  _BYTE v43[24];
  unint64_t v44;
  _BYTE v45[56];
  const char *v46;
  __int128 v47;
  __int128 v48;
  const char *v49;
  uint64_t v50;
  __int16 v51;

  if (!*(_QWORD *)(a1 + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a2 + 16))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a2 + 32);
  sub_242A66290(*(_QWORD *)(v12 + 16) + 168, (uint64_t)v45);
  sub_242A8A798(a3, (uint64_t)v43);
  if (v44 < 3)
  {
    v14 = *(_QWORD *)(v12 + 16);
    v15 = *(_QWORD *)(v13 + 16);
    sub_242A8A798(a3, (uint64_t)v39);
    v16 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a7 + 32);
    swift_retain();
    swift_retain();
    sub_242C480E0();
    swift_retain();
    swift_retain();
    sub_242C480E0();
    v16(v42, a6, a7);
    v41 = a5;
    v47 = xmmword_242C4E400;
    v48 = xmmword_242C62BC0;
    v46 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/PaddingOps.swift";
    v49 = "init(id:gradientOperand:operand:mode:padding:resultDescriptor:creationSite:)";
    v50 = 76;
    v51 = 2;
    type metadata accessor for PadGradientOperation();
    swift_allocObject();
    sub_242ABD8B4(0, 0, 0, v14, v15, (uint64_t)v39, a4, (uint64_t)&v41, (uint64_t)&v46);
    v18 = v17;
    sub_242A66290((uint64_t)v45, (uint64_t)&v41);
    sub_242A66290((uint64_t)&v41, (uint64_t)v40);
    type metadata accessor for ContextManager();
    swift_retain();
    sub_242B93328();
    sub_242B933C0((uint64_t)v39);
    swift_release();
    v19 = v39[10];
    swift_retain();
    sub_242A5DC30((uint64_t)v39);
    sub_242B93328();
    sub_242B933C0((uint64_t)v39);
    swift_release();
    v20 = v39[9];
    swift_retain();
    sub_242A5DC30((uint64_t)v39);
    type metadata accessor for TensorRepresentation();
    v21 = swift_allocObject();
    LOBYTE(v39[0]) = 1;
    v22 = sub_242B4DF54(v18, 0, v40, 0x100000000, v19, v20, v21);
    type metadata accessor for TensorHandle();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    swift_retain();
    sub_242BC995C();
    swift_release();
    sub_242A662D8((uint64_t)&v41);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_242C4B7D0;
    swift_retain();
    swift_retain();
    v25 = sub_242AC4964();
    *(_QWORD *)(v24 + 32) = v23;
    *(_QWORD *)(v24 + 40) = v25;
    *(_QWORD *)(v24 + 48) = v26;
    swift_release();
    swift_release();
LABEL_8:
    swift_release();
    swift_release();
    sub_242A662D8((uint64_t)v45);
    sub_242A8A7D4((uint64_t)v43);
    return v24;
  }
  swift_retain();
  swift_retain();
  v27 = sub_242C2F200(a4);
  v28 = *(_QWORD *)(v27 + 16);
  if (v28 == *(_QWORD *)(a5 + 16) && v28 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 16) + 152) + 16))
  {
    v29 = v27;
    sub_242C480E0();
    sub_242C480E0();
    sub_242ABFC10(v29, a5);
    v31 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = sub_242C480E0();
    sub_242ABF9DC(v32, v31);
    v34 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_242AC00F4(v34, v12, v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v35 = v39[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_242C4B7D0;
    swift_retain();
    swift_retain();
    v36 = sub_242AC4964();
    *(_QWORD *)(v24 + 32) = v35;
    *(_QWORD *)(v24 + 40) = v36;
    *(_QWORD *)(v24 + 48) = v37;
    swift_release();
    goto LABEL_8;
  }
LABEL_11:
  result = sub_242C48F5C();
  __break(1u);
  return result;
}

uint64_t sub_242C31CF8(uint64_t result, _QWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v53[72];
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[56];
  _OWORD v57[3];
  int v58;
  _BYTE v59[56];
  const char *v60;
  __int128 v61;
  __int128 v62;
  const char *v63;
  uint64_t v64;
  __int16 v65;

  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v15 = a2[2];
  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v15 == 1)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v16 = *(_QWORD *)(result + 32);
  v17 = a2[4];
  v18 = a2[5];
  if ((a3 & 1) == 0)
  {
    v19 = a8;
    v20 = a7;
    v21 = a6;
    v26 = 0;
    v50 = 0;
    v23 = *(_QWORD *)(v16 + 16);
    v24 = *(_QWORD *)(v17 + 16);
    v25 = *(_QWORD *)(v18 + 16);
LABEL_8:
    v61 = xmmword_242C522A0;
    v62 = xmmword_242C62BD0;
    v60 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/NNOps.swift";
    v63 = "init(id:gradient:input:weight:bias:stride:padding:dilation:groupCount:creationSite:)";
    v64 = 84;
    v65 = 2;
    type metadata accessor for Convolution2DGradientOperation();
    swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v27 = sub_242B028E0(0, 0, 0, v23, v24, v25, v26, a4, a5, v21, v20, v19, a9, a10, &v60);
    sub_242A66290(v23 + 168, (uint64_t)v59);
    sub_242A66290((uint64_t)v59, (uint64_t)v57);
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    type metadata accessor for ContextManager();
    swift_retain();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v28 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v29 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    type metadata accessor for TensorRepresentation();
    v30 = swift_allocObject();
    v53[0] = 1;
    v31 = sub_242B4E0EC(v27, 0, v56, 0x100000000, v28, v29, v30);
    type metadata accessor for TensorHandle();
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v31;
    swift_retain();
    sub_242BC995C();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    sub_242A8A510(&qword_257221ED0, (uint64_t (*)(uint64_t))type metadata accessor for Convolution2DGradientOperation, (uint64_t)&unk_242C54D40);
    sub_242A66290((uint64_t)v59, (uint64_t)v57);
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    swift_retain_n();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v33 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v34 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    v35 = swift_allocObject();
    v53[0] = 1;
    v36 = sub_242B4E0EC(v27, 1, v56, 0x100000000, v33, v34, v35);
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v36;
    swift_retain();
    sub_242BC995C();
    swift_release();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_242C4B7F0;
    swift_retain();
    swift_retain();
    v39 = sub_242AC4964();
    *(_QWORD *)(v38 + 32) = v32;
    *(_QWORD *)(v38 + 40) = v39;
    *(_QWORD *)(v38 + 48) = v40;
    swift_retain();
    swift_retain();
    v41 = sub_242AC4964();
    *(_QWORD *)(v38 + 56) = v37;
    *(_QWORD *)(v38 + 64) = v41;
    *(_QWORD *)(v38 + 72) = v42;
    if (!v50)
    {
      sub_242A662D8((uint64_t)v59);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v38;
    }
    v58 = 0;
    memset(v57, 0, sizeof(v57));
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    swift_retain();
    swift_retain();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v43 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v44 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    v45 = swift_allocObject();
    v53[0] = 1;
    v46 = sub_242B4E0EC(v27, 2, v56, 0x100000000, v43, v44, v45);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v46;
    swift_retain();
    sub_242BC995C();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    swift_retain();
    v10 = sub_242AC4964();
    v13 = v47;
    v12 = *(_QWORD *)(v38 + 16);
    v14 = v12 + 1;
    if (v12 < *(_QWORD *)(v38 + 24) >> 1)
    {
LABEL_10:
      *(_QWORD *)(v38 + 16) = v14;
      v48 = (_QWORD *)(v38 + 24 * v12);
      v48[4] = v11;
      v48[5] = v10;
      v48[6] = v13;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release_n();
      sub_242A662D8((uint64_t)v59);
      return v38;
    }
LABEL_16:
    sub_242A5EBB0();
    v38 = v49;
    goto LABEL_10;
  }
  if (v15 >= 3)
  {
    v19 = a8;
    v20 = a7;
    v21 = a6;
    v22 = a2[6];
    v23 = *(_QWORD *)(v16 + 16);
    v24 = *(_QWORD *)(v17 + 16);
    v25 = *(_QWORD *)(v18 + 16);
    v26 = *(_QWORD *)(v22 + 16);
    swift_retain();
    v50 = v22;
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_242C32338()
{
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_242C32344(uint64_t a1, uint64_t a2)
{
  return sub_242C32CDC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_242C31CF8);
}

uint64_t sub_242C32350(uint64_t result, _QWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v53[72];
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[56];
  _BYTE v57[56];
  _BYTE v58[56];
  const char *v59;
  __int128 v60;
  __int128 v61;
  const char *v62;
  uint64_t v63;
  __int16 v64;

  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v15 = a2[2];
  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v15 == 1)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v16 = *(_QWORD *)(result + 32);
  v17 = a2[4];
  v18 = a2[5];
  if ((a3 & 1) == 0)
  {
    v19 = a8;
    v20 = a7;
    v21 = a6;
    v26 = 0;
    v50 = 0;
    v23 = *(_QWORD *)(v16 + 16);
    v24 = *(_QWORD *)(v17 + 16);
    v25 = *(_QWORD *)(v18 + 16);
LABEL_8:
    v60 = xmmword_242C522A0;
    v61 = xmmword_242C62BE0;
    v59 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/NNOps.swift";
    v62 = "init(id:gradient:input:weight:bias:stride:padding:dilation:groupCount:creationSite:)";
    v63 = 84;
    v64 = 2;
    type metadata accessor for ConvolutionTranspose2DGradientOperation();
    swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v27 = sub_242B02B68(0, 0, 0, v23, v24, v25, v26, a4, a5, v21, v20, v19, a9, a10, &v59);
    sub_242A66290(v23 + 168, (uint64_t)v58);
    sub_242A66290((uint64_t)v58, (uint64_t)v57);
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    type metadata accessor for ContextManager();
    swift_retain();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v28 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v29 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    type metadata accessor for TensorRepresentation();
    v30 = swift_allocObject();
    v53[0] = 1;
    v31 = sub_242B4E280(v27, 0, v56, 0x100000000, v28, v29, v30);
    type metadata accessor for TensorHandle();
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v31;
    swift_retain();
    sub_242BC995C();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    sub_242A8A510(&qword_257221EC0, (uint64_t (*)(uint64_t))type metadata accessor for ConvolutionTranspose2DGradientOperation, (uint64_t)&unk_242C54D40);
    sub_242A66290((uint64_t)v58, (uint64_t)v57);
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    swift_retain_n();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v33 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v34 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    v35 = swift_allocObject();
    v53[0] = 1;
    v36 = sub_242B4E280(v27, 1, v56, 0x100000000, v33, v34, v35);
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v36;
    swift_retain();
    sub_242BC995C();
    swift_release();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_242C4B7F0;
    swift_retain();
    swift_retain();
    v39 = sub_242AC4964();
    *(_QWORD *)(v38 + 32) = v32;
    *(_QWORD *)(v38 + 40) = v39;
    *(_QWORD *)(v38 + 48) = v40;
    swift_retain();
    swift_retain();
    v41 = sub_242AC4964();
    *(_QWORD *)(v38 + 56) = v37;
    *(_QWORD *)(v38 + 64) = v41;
    *(_QWORD *)(v38 + 72) = v42;
    if (!v50)
    {
      sub_242A662D8((uint64_t)v58);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return v38;
    }
    sub_242A66290(*(_QWORD *)(v50 + 16) + 168, (uint64_t)v57);
    sub_242A66290((uint64_t)v57, (uint64_t)v56);
    swift_retain();
    swift_retain();
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v43 = v55;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    sub_242B93328();
    sub_242B933C0((uint64_t)v53);
    swift_release();
    v44 = v54;
    swift_retain();
    sub_242A5DC30((uint64_t)v53);
    v45 = swift_allocObject();
    v53[0] = 1;
    v46 = sub_242B4E280(v27, 2, v56, 0x100000000, v43, v44, v45);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v46;
    swift_retain();
    sub_242BC995C();
    swift_release();
    sub_242A662D8((uint64_t)v57);
    swift_retain();
    swift_retain();
    v10 = sub_242AC4964();
    v13 = v47;
    v12 = *(_QWORD *)(v38 + 16);
    v14 = v12 + 1;
    if (v12 < *(_QWORD *)(v38 + 24) >> 1)
    {
LABEL_10:
      *(_QWORD *)(v38 + 16) = v14;
      v48 = (_QWORD *)(v38 + 24 * v12);
      v48[4] = v11;
      v48[5] = v10;
      v48[6] = v13;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release_n();
      swift_release();
      sub_242A662D8((uint64_t)v58);
      return v38;
    }
LABEL_16:
    sub_242A5EBB0();
    v38 = v49;
    goto LABEL_10;
  }
  if (v15 >= 3)
  {
    v19 = a8;
    v20 = a7;
    v21 = a6;
    v22 = a2[6];
    v23 = *(_QWORD *)(v16 + 16);
    v24 = *(_QWORD *)(v17 + 16);
    v25 = *(_QWORD *)(v18 + 16);
    v26 = *(_QWORD *)(v22 + 16);
    swift_retain();
    v50 = v22;
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t Tensor.topk(_:)(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[56];
  const char *v39;
  __int128 v40;
  __int128 v41;
  const char *v42;
  uint64_t v43;
  __int16 v44;

  v7 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  result = sub_242C2F2BC(*(_QWORD *)(v7 + 152));
  if ((v9 & 1) == 0)
  {
    if ((result & 0x8000000000000000) == 0)
    {
      sub_242C311FC(a3, 107, 0xE100000000000000, 0, 0, result, 0, 0, 255);
      *(_QWORD *)(OUTLINED_FUNCTION_2_0() + 16) = a3;
      swift_retain();
      v10 = OUTLINED_FUNCTION_98_7((uint64_t)sub_242C32DC8);
      v12 = v11;
      OUTLINED_FUNCTION_135();
      v39 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/TensorTransf"
            "ormationOps.swift";
      v40 = xmmword_242C55120;
      v41 = xmmword_242C62BF0;
      v42 = "init(id:operand:k:creationSite:backward:)";
      v43 = 41;
      v44 = 2;
      type metadata accessor for TopKOperation();
      OUTLINED_FUNCTION_2_0();
      v13 = OUTLINED_FUNCTION_48_20();
      sub_242B9F4BC(v13, v14, v15, v7, a3, v16, v10, v12);
      v18 = v17;
      v19 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510(&qword_2572281E0, (uint64_t (*)(uint64_t))type metadata accessor for TopKOperation, (uint64_t)&unk_242C5AC58);
      OUTLINED_FUNCTION_26_52((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26, v36);
      v27 = OUTLINED_FUNCTION_91();
      v28 = OUTLINED_FUNCTION_13_40(v27, v19, (uint64_t)v38, a1);
      OUTLINED_FUNCTION_26_52(v28, v29, v30, v31, v32, v33, v34, v35, v37);
      return sub_242BC9830(v18, v19, 1uLL, (uint64_t)v38, a2);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C32B74(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(result + 16))
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v4 = *(_QWORD *)(result + 32);
      v13 = *(_QWORD *)(a2 + 32);
      v5 = v13;
      swift_retain();
      swift_retain();
      Tensor.topk(_:)(&v12, &v11, a3);
      swift_release();
      v10[1] = v4;
      v10[2] = v11;
      v13 = v5;
      swift_retain();
      Tensor.init(zerosLike:)(&v13, v10);
      sub_242B602C4();
      swift_release();
      swift_release();
      v6 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221118);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_242C4B7D0;
      swift_retain();
      swift_retain();
      v8 = sub_242AC4964();
      *(_QWORD *)(v7 + 32) = v6;
      *(_QWORD *)(v7 + 40) = v8;
      *(_QWORD *)(v7 + 48) = v9;
      swift_release();
      swift_release();
      swift_release();
      return v7;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C32CC4()
{
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_242C32CD0(uint64_t a1, uint64_t a2)
{
  return sub_242C32CDC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_242C32350);
}

uint64_t sub_242C32CDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v3;

  return a3(a1, a2, *(unsigned __int8 *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 72));
}

uint64_t sub_242C32D14()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40) >= 3uLL)
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_242C32D54(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_242C31894(a1, a2, (uint64_t)(v2 + 2), v2[7], v2[8], v2[9], v2[10]);
}

uint64_t sub_242C32D64()
{
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_242C32D70(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_242C312F8(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_242C32D80()
{
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_242C32D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_242C315BC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_BYTE *)(v2 + 64));
}

uint64_t sub_242C32DBC()
{
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_242C32DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_242C32B74(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t _s11PaddingModeOwxx(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t _s11PaddingModeOwcp(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  else
  {
    v4 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  return a1;
}

uint64_t _s11PaddingModeOwca(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(_QWORD *)(a1 + 24) = v4;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t _s11PaddingModeOwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t _s11PaddingModeOwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t _s11PaddingModeOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2 + 2;
  }
  return result;
}

uint64_t sub_242C32FDC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

double sub_242C32FF4(uint64_t a1, int a2)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(_QWORD *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for Tensor.PaddingMode()
{
  return &type metadata for Tensor.PaddingMode;
}

uint64_t OUTLINED_FUNCTION_3_82(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 176) = 0;
  *(_QWORD *)(v1 - 168) = result;
  *(_BYTE *)(v1 - 160) = 2;
  *(_BYTE *)(v1 - 100) = 3;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_77()
{
  return sub_242C48F5C();
}

void OUTLINED_FUNCTION_7_63()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 160) = 0;
  *(_BYTE *)(v0 - 100) = 7;
}

BOOL OUTLINED_FUNCTION_10_56(uint64_t a1)
{
  unsigned __int8 v1;

  return sub_242B64794(v1, a1);
}

void OUTLINED_FUNCTION_11_58()
{
  char v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 208) = v0;
  sub_242C21A14();
}

uint64_t OUTLINED_FUNCTION_20_58()
{
  uint64_t v0;

  return v0;
}

void *OUTLINED_FUNCTION_24_52()
{
  return static ScalarType.floatingPointTypes.getter();
}

uint64_t OUTLINED_FUNCTION_26_52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  return sub_242A66290(v9, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_27_40()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242A66290(v0 + 128, v1 - 240);
}

uint64_t OUTLINED_FUNCTION_31_47()
{
  return sub_242C48C38();
}

void OUTLINED_FUNCTION_32_42()
{
  char v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 200) = v0;
  sub_242C21A14();
}

uint64_t OUTLINED_FUNCTION_34_43()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(v1 + 8 * v0) + 16) + 168;
}

uint64_t OUTLINED_FUNCTION_35_35(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_242A8A798(v2, a2);
}

uint64_t OUTLINED_FUNCTION_37_40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = v1;
  *(_QWORD *)(v2 - 152) = a1;
  *(_WORD *)(v2 - 144) = 2;
  return 0;
}

uint64_t OUTLINED_FUNCTION_39_37()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 100) = 4;
  return sub_242C480E0();
}

void OUTLINED_FUNCTION_40_42()
{
  Tensor.scalarType.getter();
}

void OUTLINED_FUNCTION_42_35()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 200) = v0;
  Tensor.scalarType.getter();
}

uint64_t OUTLINED_FUNCTION_43_34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = v1;
  *(_QWORD *)(v2 - 160) = a1;
  *(_WORD *)(v2 - 152) = 2;
  return 0;
}

double OUTLINED_FUNCTION_44_31()
{
  uint64_t v0;
  double result;

  *(_DWORD *)(v0 + 176) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_45_25()
{
  return swift_getDynamicType();
}

uint64_t Tensor.withUnsafeMetalBuffer<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[7];
  char v25[4];

  v1 = v0;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)v0 + 16);
    v3 = swift_retain_n();
    v4 = OUTLINED_FUNCTION_0_97(v3, v2);
    v6 = v5;
    swift_release();
    if (qword_2572205A8 != -1)
      swift_once();
    v7 = qword_257259A10;
    v8 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    v24[0] = *(_QWORD *)(v8 + 152);
    v25[0] = *(_BYTE *)(v8 + 160);
    v9 = v8 + 168;
    swift_unknownObjectRetain();
    sub_242C480E0();
    sub_242C035A0(v24, v25, v9, v7, v4, v6);
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = type metadata accessor for TensorRepresentation();
    sub_242A66290(*(_QWORD *)(*(_QWORD *)v1 + 16) + 168, (uint64_t)v24);
    ObjectType = swift_getObjectType();
    v14 = swift_unknownObjectRetain();
    v25[0] = 1;
    v15 = sub_242BCBE34(v14, (uint64_t)v24, 0x100000000uLL, v12, ObjectType, v11);
    type metadata accessor for TensorHandle();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    swift_retain();
    sub_242BC995C();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    *(_QWORD *)v1 = v16;
    swift_release();
  }
  v17 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v18 = swift_retain_n();
  v19 = OUTLINED_FUNCTION_0_97(v18, v17);
  swift_release();
  if (object_getClass(v19) != (Class)_TtC14NeuralNetworks21MPSGraphTensorStorage || v19 == 0)
  {
    swift_unknownObjectRelease();
  }
  else
  {
    sub_242B8586C();
    v22 = v21;
    swift_unknownObjectRelease();
    if (v22)
    {
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_1_86();
      return swift_unknownObjectRelease_n();
    }
  }
  return OUTLINED_FUNCTION_1_86();
}

id OUTLINED_FUNCTION_0_97(uint64_t a1, uint64_t a2)
{
  return sub_242BC9F84(a1, a2, 0, 0);
}

uint64_t OUTLINED_FUNCTION_1_86()
{
  uint64_t (*v0)(void);

  return v0();
}

void sub_242C33410(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v3 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!v3)
  {
LABEL_15:
    swift_release();
    return;
  }
  v25 = MEMORY[0x24BEE4AF8];
  sub_242AC38E8();
  v6 = a1;
  if (a2 >= a1 && (v3 & 0x8000000000000000) == 0)
  {
    v7 = a3[6];
    v8 = a3[7];
    v9 = v7 + 32;
    v10 = v8 + 32;
    v11 = a3[8];
    v12 = v11 + 32;
    v13 = a1;
    while (a2 != v13)
    {
      if (v6 < 0)
        goto LABEL_18;
      if (v13 >= *(_QWORD *)(v7 + 16))
        goto LABEL_19;
      if (v13 >= *(_QWORD *)(v8 + 16))
        goto LABEL_20;
      v14 = *(_QWORD *)(v9 + 8 * v13);
      v15 = *(_QWORD *)(v10 + 8 * v13);
      if (v15 < v14)
        goto LABEL_21;
      if (v13 >= *(_QWORD *)(v11 + 16))
        goto LABEL_22;
      v16 = *(_QWORD *)(v12 + 8 * v13);
      v17 = *(_QWORD *)(v25 + 16);
      if (v17 >= *(_QWORD *)(v25 + 24) >> 1)
      {
        v22 = v8;
        v23 = v7;
        v20 = v10;
        v21 = v9;
        v19 = v12;
        sub_242AC38E8();
        v12 = v19;
        v10 = v20;
        v9 = v21;
        v8 = v22;
        v7 = v23;
        v6 = a1;
      }
      *(_QWORD *)(v25 + 16) = v17 + 1;
      v18 = (_QWORD *)(v25 + 24 * v17);
      v18[4] = v14;
      v18[5] = v15;
      v18[6] = v16;
      if (a2 == ++v13)
        goto LABEL_15;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
LABEL_24:
  __break(1u);
}

uint64_t sub_242C335C0()
{
  return OUTLINED_FUNCTION_2_91();
}

unint64_t sub_242C335D0()
{
  return 0xD000000000000013;
}

void sub_242C335EC()
{
  sub_242A59170();
}

void sub_242C33648()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[6] + 16);
  swift_retain();
  sub_242C33410(0, v1, v0);
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_242C3368C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257220B20);
  v1 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v1 + 16) = xmmword_242C4B7D0;
  v2 = *(_BYTE *)(v0 + 80);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(v1 + 40) = v2;
  sub_242C480E0();
  return v1;
}

uint64_t sub_242C336E0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  char v11;

  v10 = *a8;
  v11 = *((_BYTE *)a8 + 8);
  *(_DWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  *(_QWORD *)(v9 + 48) = a5;
  *(_QWORD *)(v9 + 56) = a6;
  *(_QWORD *)(v9 + 64) = a7;
  *(_QWORD *)(v9 + 72) = v10;
  *(_BYTE *)(v9 + 80) = v11;
  sub_242A56808(a9, v9 + 88);
  return v9;
}

uint64_t sub_242C33724()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_242C33768()
{
  sub_242C33724();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BaseSliceOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C337AC(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x2494EDE24](&unk_242C62D44, a1);
  return sub_242BD01E4(a1, v2);
}

void sub_242C337E8()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)v0 + 136))();
  sub_242C4817C();
  swift_bridgeObjectRelease();
  sub_242C02D08();
  sub_242C02D08();
  sub_242C02D08();
}

void sub_242C33858()
{
  sub_242C337E8();
}

void sub_242C33878(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  *(_QWORD *)(v11 + 152) = a10;
  *(_QWORD *)(v11 + 160) = a11;
  if (!a3)
  {
    v12 = OUTLINED_FUNCTION_2_91();
    a1 = sub_242BD0204(v12, v13);
  }
  OUTLINED_FUNCTION_0_98(a1, a2, a3, a4, a5, a6, a7, a8, v14, v15, v16, v17);
  OUTLINED_FUNCTION_14_11();
}

uint64_t sub_242C338D0()
{
  uint64_t v0;

  sub_242C33724();
  sub_242A6549C(*(_QWORD *)(v0 + 152));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SliceOperation()
{
  return objc_opt_self();
}

void sub_242C33918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
  v1 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v1 + 16) = xmmword_242C4B7C0;
  v2 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v1 + 40) = v2;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4();
  swift_retain();
  OUTLINED_FUNCTION_21_1();
}

void sub_242C33974(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  *(_QWORD *)(v8 + 152) = a4;
  if (!a3)
    a1 = sub_242BD0204(0xD000000000000013, 0x8000000242C6C6D0);
  OUTLINED_FUNCTION_0_98(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_14_11();
}

uint64_t sub_242C339DC()
{
  sub_242C33724();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SliceGradientOperation()
{
  return objc_opt_self();
}

uint64_t sub_242C33A24(uint64_t a1)
{
  uint64_t result;

  result = sub_242A65450(&qword_2572281F8, type metadata accessor for SliceGradientOperation, (uint64_t)&unk_242C62D44);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C33A60(uint64_t a1)
{
  uint64_t result;

  result = sub_242A65450((unint64_t *)&qword_257224020, type metadata accessor for SliceOperation, (uint64_t)&unk_242C62D44);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C33A9C(uint64_t a1)
{
  uint64_t result;

  result = sub_242A65450(&qword_25722F188, type metadata accessor for BaseSliceOperation, (uint64_t)&unk_242C62D1C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_98(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  a11 = v17;
  a12 = v18;
  return sub_242C336E0(a1, a2, a3, v15, v14, v13, v12, &a11, v16);
}

uint64_t OUTLINED_FUNCTION_2_91()
{
  return 0x79625F6563696C73;
}

uint64_t sub_242C33B24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(v1 + 16);
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(v3))
  {
    v5 = v4;
    ObjectType = swift_getObjectType();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_unknownObjectRetain();
    v8 = v7(a1, ObjectType, v5);
    swift_unknownObjectRelease();
    return v8;
  }
  else
  {
    sub_242C480E0();
    sub_242C37C54();
    v11 = v10;
    swift_bridgeObjectRelease();
    return v11;
  }
}

uint64_t sub_242C33BF0(uint64_t a1)
{
  return sub_242C33B24(a1);
}

unint64_t sub_242C33C04(uint64_t a1)
{
  unint64_t result;

  result = sub_242C33C28();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_242C33C28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572225C0;
  if (!qword_2572225C0)
  {
    v1 = type metadata accessor for PassthroughOperation();
    result = MEMORY[0x2494EDE24](&unk_242C4E798, v1);
    atomic_store(result, (unint64_t *)&qword_2572225C0);
  }
  return result;
}

void static Tensor..! prefix(_:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[56];
  __int128 v10;
  _BYTE v11[24];
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (*(_BYTE *)(v3 + 160) != 12)
  {
    sub_242C21A14();
    *(_QWORD *)&v10 = v7;
    *((_QWORD *)&v10 + 1) = v8;
    *(_OWORD *)v11 = xmmword_242C4CA60;
    v11[16] = 6;
    v12 = 12;
    LOBYTE(v13) = 0;
    v15 = 3;
    sub_242A59264();
  }
  *(_QWORD *)&v10 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/Unar"
                    "yLogicalOps.swift";
  *((_QWORD *)&v10 + 1) = 117;
  v11[0] = 2;
  *(_OWORD *)&v11[8] = xmmword_242C62D80;
  v12 = (uint64_t)"init(id:operator:operand:creationSite:)";
  v13 = 39;
  v14 = 2;
  type metadata accessor for UnaryLogicalOperation();
  swift_allocObject();
  swift_retain();
  v4 = sub_242C44DE0(0, 0, 0, v3, &v10);
  v5 = (uint64_t (**)(_QWORD, _QWORD))sub_242A8A510((unint64_t *)&qword_257224808, (uint64_t (*)(uint64_t))type metadata accessor for UnaryLogicalOperation, (uint64_t)&unk_242C54FA0);
  OUTLINED_FUNCTION_16_23(v3 + 168, v6);
  sub_242BC9830(v4, v5, 0, (uint64_t)v9, a2);
  OUTLINED_FUNCTION_21_48();
}

#error "242C33DF0: call analysis failed (funcsize=96)"

uint64_t static Tensor..& infix(_:_:)(char a1, uint64_t *a2)
{
  return sub_242C3432C(a1, a2, (void (*)(_OWORD *, _QWORD *))static Tensor..& infix(_:_:));
}

void static Tensor..& infix(_:_:)(uint64_t *a1, char a2)
{
  sub_242C343F0(a1, a2, (void (*)(uint64_t *, _OWORD *))static Tensor..& infix(_:_:));
}

#error "242C33FC4: call analysis failed (funcsize=96)"

uint64_t static Tensor..| infix(_:_:)(char a1, uint64_t *a2)
{
  return sub_242C3432C(a1, a2, (void (*)(_OWORD *, _QWORD *))static Tensor..| infix(_:_:));
}

void static Tensor..| infix(_:_:)(uint64_t *a1, char a2)
{
  sub_242C343F0(a1, a2, (void (*)(uint64_t *, _OWORD *))static Tensor..| infix(_:_:));
}

#error "242C34198: call analysis failed (funcsize=96)"

uint64_t static Tensor..^ infix(_:_:)(char a1, uint64_t *a2)
{
  return sub_242C3432C(a1, a2, (void (*)(_OWORD *, _QWORD *))static Tensor..^ infix(_:_:));
}

uint64_t sub_242C3432C(char a1, uint64_t *a2, void (*a3)(_OWORD *, _QWORD *))
{
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[13];
  _OWORD v11[3];
  int v12;

  v5 = *a2;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572289F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_242C4B7D0;
  *(_BYTE *)(inited + 32) = a1;
  OUTLINED_FUNCTION_16_23((uint64_t)v11, v7);
  OUTLINED_FUNCTION_23_52(MEMORY[0x24BEE4AF8], v8);
  sub_242A662D8((uint64_t)v11);
  *(_QWORD *)&v11[0] = v10[12];
  v10[0] = v5;
  a3(v11, v10);
  return swift_release();
}

void static Tensor..^ infix(_:_:)(uint64_t *a1, char a2)
{
  sub_242C343F0(a1, a2, (void (*)(uint64_t *, _OWORD *))static Tensor..^ infix(_:_:));
}

void sub_242C343F0(uint64_t *a1, char a2, void (*a3)(uint64_t *, _OWORD *))
{
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[3];
  int v10;
  uint64_t v11;

  v11 = *a1;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572289F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_242C4B7D0;
  *(_BYTE *)(inited + 32) = a2;
  OUTLINED_FUNCTION_16_23((uint64_t)v9, v6);
  OUTLINED_FUNCTION_23_52(MEMORY[0x24BEE4AF8], v7);
  sub_242A662D8((uint64_t)v9);
  *(_QWORD *)&v9[0] = v8;
  a3(&v11, v9);
  swift_release();
  OUTLINED_FUNCTION_21_48();
}

uint64_t OUTLINED_FUNCTION_2_92(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  va_arg(va1, _QWORD);
  v15 = v13;
  return sub_242B5E498((uint64_t *)va, (uint64_t *)va1);
}

uint64_t OUTLINED_FUNCTION_3_83()
{
  return static ShapeInference.broadcasting(_:_:)();
}

uint64_t OUTLINED_FUNCTION_5_78(__n128 a1)
{
  uint64_t v1;

  *(__n128 *)(v1 + 24) = a1;
  return type metadata accessor for BinaryLogicalOperation();
}

uint64_t OUTLINED_FUNCTION_6_79(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  va_list va;

  va_start(va, a6);
  return sub_242BC9830(v7, v8, 0, (uint64_t)va, v6);
}

uint64_t OUTLINED_FUNCTION_7_64(__n128 a1)
{
  uint64_t v1;

  *(__n128 *)(v1 + 40) = a1;
  return sub_242C480E0();
}

uint64_t OUTLINED_FUNCTION_9_75()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_59(__n128 *a1, __n128 a2)
{
  unint64_t v2;
  unint64_t v3;

  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  a1[2].n128_u64[1] = v3;
  return swift_retain();
}

void OUTLINED_FUNCTION_12_51(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_242C0EDC4(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_13_65()
{
  sub_242C21A14();
}

uint64_t OUTLINED_FUNCTION_17_53()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_56()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_23_52(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  sub_242B67278(a1, v2, (uint64_t)va, (uint64_t *)va1);
}

uint64_t OUTLINED_FUNCTION_24_53()
{
  return swift_initStackObject();
}

uint64_t OUTLINED_FUNCTION_25_51(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_242A8A510(a1, v3, a3);
}

uint64_t sub_242C34640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v20;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (!v4)
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
    goto LABEL_21;
  }
  v20 = MEMORY[0x24BEE4AF8];
  sub_242AC3124();
  if (v4 < 0)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    sub_242A59264();
  }
  v7 = v20;
  v8 = a3;
  v9 = a4;
  v10 = a1;
  do
  {
    if (a2 == v10)
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    if (a1 < 0)
      goto LABEL_23;
    if (v10 >= *(_QWORD *)(v9 + 16))
      goto LABEL_24;
    v11 = *(_QWORD *)(a4 + 32 + 8 * v10);
    v12 = *(_QWORD *)(v8 + 16);
    if (v11 < -v12 || v11 >= v12)
      goto LABEL_30;
    v14 = (v12 & (v11 >> 63)) + v11;
    if (v14 >= v12)
      goto LABEL_25;
    v15 = *(_QWORD *)(a3 + 32 + 8 * v14);
    v16 = *(_QWORD *)(v20 + 16);
    if (v16 >= *(_QWORD *)(v20 + 24) >> 1)
    {
      sub_242AC3124();
      v8 = a3;
      v9 = a4;
    }
    *(_QWORD *)(v20 + 16) = v16 + 1;
    *(_QWORD *)(v20 + 8 * v16 + 32) = v15;
    if (a2 < a1)
      goto LABEL_26;
    if ((uint64_t)v10 >= a2)
      goto LABEL_27;
    ++v10;
  }
  while (a2 != v10);
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_242C34824(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_242AC3124();
    v5 = v13;
    v6 = (uint64_t *)(a1 + 32);
    do
    {
      v8 = *v6++;
      v7 = v8;
      v9 = *(_QWORD *)(a2 + 16);
      if (v8 < -v9 || v7 >= v9)
        sub_242A59264();
      v11 = *(_QWORD *)(v13 + 16);
      if (v11 >= *(_QWORD *)(v13 + 24) >> 1)
        sub_242AC3124();
      *(_QWORD *)(v13 + 16) = v11 + 1;
      *(_QWORD *)(v13 + 8 * v11 + 32) = (v9 & (v7 >> 63)) + v7;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v5;
}

uint64_t sub_242C34984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_242AC3290();
    v7 = v18;
    v8 = (uint64_t *)(a1 + 32);
    do
    {
      v9 = *(_QWORD *)(a2 + 16);
      if (-v9 > a3 || v9 <= a3)
        goto LABEL_19;
      v12 = *v8++;
      v11 = v12;
      sub_242C480E0();
      v13 = a2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_242B4B43C();
        v13 = v16;
      }
      v14 = (v9 & (a3 >> 63)) + a3;
      if ((v14 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        sub_242C480E0();
        sub_242A59264();
      }
      if (v14 >= *(_QWORD *)(v13 + 16))
        goto LABEL_18;
      *(_QWORD *)(v13 + 8 * v14 + 32) = v11;
      v15 = *(_QWORD *)(v18 + 16);
      if (v15 >= *(_QWORD *)(v18 + 24) >> 1)
        sub_242AC3290();
      *(_QWORD *)(v18 + 16) = v15 + 1;
      *(_QWORD *)(v18 + 8 * v15 + 32) = v13;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v7;
}

void sub_242C34B34(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_QWORD *)(*(_QWORD *)a2 + 16))
  {
    sub_242C480E0();
    OUTLINED_FUNCTION_4_18();
  }
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16) - 1;
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 32);
  *a3 = *(_QWORD *)a1;
  sub_242C480E0();
  TensorShape.subscript.setter(v4, v3);
}

uint64_t sub_242C34BDC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t *a5@<X8>)
{
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[8];
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  result = v6 - 2;
  if (v6 < 2)
    goto LABEL_10;
  v8 = *a3;
  if (*(_QWORD *)(*a3 + 16) < 2uLL)
    goto LABEL_10;
  v11 = OUTLINED_FUNCTION_60_26(result);
  v20 = v11;
  v12 = OUTLINED_FUNCTION_60_26(v6 - 1);
  v13 = *(_QWORD *)(v8 + 16);
  v14 = OUTLINED_FUNCTION_58_17(v13 - 2);
  result = OUTLINED_FUNCTION_58_17(v13 - 1);
  v19 = result;
  if ((a2 & 1) != 0)
  {
    v20 = v12;
    v12 = v11;
  }
  if ((a4 & 1) != 0)
  {
    v19 = v14;
    v14 = result;
  }
  if (v12 != v14)
    goto LABEL_10;
  sub_242C480E0();
  OUTLINED_FUNCTION_49_26();
  v16 = v15;
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_49_26();
  static ShapeInference.broadcasting(_:_:)();
  OUTLINED_FUNCTION_136();
  result = OUTLINED_FUNCTION_34();
  if (v17)
  {
    v16 = v17;
    sub_242C375A4(&v16, &v20, (uint64_t)v18, a5);
    return OUTLINED_FUNCTION_136();
  }
  else
  {
LABEL_10:
    *a5 = 0;
  }
  return result;
}

uint64_t sub_242C34D3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  OUTLINED_FUNCTION_38_34();
  OUTLINED_FUNCTION_0_2();
  v5 = sub_242C34824(a2, v3);
  v6 = sub_242C480E0();
  v7 = *(_QWORD *)(sub_242A707E4(v6) + 16);
  swift_bridgeObjectRelease();
  if (v7 != *(_QWORD *)(v3 + 16))
  {
LABEL_7:
    OUTLINED_FUNCTION_3_6();
    result = 0;
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(v5 + 16);
  if (v8)
  {
    v9 = 0;
    while (*(_QWORD *)(v5 + 8 * v9 + 32) < v7)
    {
      if (v8 == ++v9)
        goto LABEL_6;
    }
    goto LABEL_7;
  }
LABEL_6:
  OUTLINED_FUNCTION_0_2();
  result = sub_242C34640(0, v7, v3, v5);
LABEL_8:
  *v2 = result;
  return result;
}

uint64_t static ShapeInference.broadcasting(_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;

  OUTLINED_FUNCTION_38_34();
  v3 = *v2;
  if ((sub_242C00B0C(v1, *v2) & 1) != 0)
  {
    *v0 = v1;
    return sub_242C480E0();
  }
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v3 + 16);
  v7 = v3 + 24;
  v23 = v0;
  v8 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = v5 - 1;
    if ((uint64_t)(v5 - 1) < 0)
    {
      v10 = 0;
    }
    else
    {
      v7 = *(_QWORD *)(v1 + 16);
      if (v9 >= v7)
        goto LABEL_35;
      v10 = *(_QWORD *)(v1 + 24 + 8 * v5);
    }
    if (__OFSUB__(v9, 1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      v25 = 0;
      v26 = 0;
      v24 = v9;
      v27 = -1;
      v30 = 0;
      v28 = v7;
      goto LABEL_37;
    }
    v11 = v6 - 1;
    if (((v6 - 1) & 0x8000000000000000) == 0)
    {
      v12 = *(_QWORD *)(v3 + 16);
      if (v11 < v12)
      {
        v13 = *(_QWORD *)(v3 + 24 + 8 * v6);
        goto LABEL_13;
      }
      v25 = 0;
      v26 = 0;
      v24 = v6 - 1;
      v27 = -1;
      v30 = 0;
      v28 = v12;
LABEL_37:
      v29 = 0;
      v31 = -1;
      v32 = 4;
      OUTLINED_FUNCTION_4_18();
    }
    v13 = 0;
LABEL_13:
    if (__OFSUB__(v11, 1))
      goto LABEL_34;
    if ((v9 & 0x8000000000000000) != 0)
    {
      if ((v11 & 0x8000000000000000) != 0)
      {
        v24 = v8;
        v22 = sub_242C37678((uint64_t)&v24);
        result = OUTLINED_FUNCTION_3_6();
        *v23 = v22;
        return result;
      }
      goto LABEL_27;
    }
    if ((v11 & 0x8000000000000000) != 0 || v13 == 1)
    {
      v13 = v10;
      goto LABEL_27;
    }
    if (v10 != 1)
      break;
LABEL_27:
    if ((OUTLINED_FUNCTION_28_16() & 1) == 0)
    {
      OUTLINED_FUNCTION_4_78(0, *(_QWORD *)(v8 + 16) + 1);
      v8 = v18;
    }
    v15 = *(_QWORD *)(v8 + 16);
    v17 = *(_QWORD *)(v8 + 24);
    v16 = v15 + 1;
    if (v15 >= v17 >> 1)
    {
      OUTLINED_FUNCTION_3_84(v17);
      v8 = v19;
    }
LABEL_31:
    *(_QWORD *)(v8 + 16) = v16;
    *(_QWORD *)(v8 + 8 * v15 + 32) = v13;
    v5 = v9;
    v6 = v11;
  }
  if (v10 == v13)
  {
    if ((OUTLINED_FUNCTION_28_16() & 1) == 0)
    {
      OUTLINED_FUNCTION_4_78(0, *(_QWORD *)(v8 + 16) + 1);
      v8 = v20;
    }
    v15 = *(_QWORD *)(v8 + 16);
    v14 = *(_QWORD *)(v8 + 24);
    v16 = v15 + 1;
    if (v15 >= v14 >> 1)
    {
      OUTLINED_FUNCTION_3_84(v14);
      v8 = v21;
    }
    v13 = v10;
    goto LABEL_31;
  }
  result = OUTLINED_FUNCTION_3_6();
  *v23 = 0;
  return result;
}

void static ShapeInference.broadcasting(_:toRank:)(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (a2 == v4)
  {
    *a3 = *(_QWORD *)a1;
    sub_242C480E0();
    return;
  }
  if (a2 > v4)
  {
    sub_242C39C9C(1, a2 - v4);
    v13 = MEMORY[0x24BEE4AF8];
    sub_242C480E0();
    sub_242B65064();
    v5 = OUTLINED_FUNCTION_74();
    sub_242B65310(v5, v6);
    OUTLINED_FUNCTION_3_6();
    v7 = v13;
LABEL_13:
    *a3 = v7;
    return;
  }
  v8 = __OFSUB__(v4, a2);
  v9 = v4 - a2;
  if (v8)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v9 < 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = sub_242AD5D84(0, v9, v4);
  if ((v11 & 1) != 0)
    v12 = v4;
  else
    v12 = v10;
  if (v4 < v12)
    goto LABEL_16;
  if ((v12 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_74();
    sub_242A5B894();
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
}

uint64_t sub_242C35154()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  OUTLINED_FUNCTION_38_34();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = v2;
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_74();
    v5 = 0;
    while (1)
    {
      v6 = *(_QWORD *)(v4 + 8 * v5 + 32);
      v7 = *(_QWORD *)(v1 + 16);
      v8 = v6 >= ~v7 && v6 <= v7;
      if (!v8 || (v9 = ((v7 + 1) & (v6 >> 63)) + v6, v7 < v9))
      {
        OUTLINED_FUNCTION_136();
        result = OUTLINED_FUNCTION_34();
        v1 = 0;
        goto LABEL_18;
      }
      if (v9 < 0)
        break;
      v10 = OUTLINED_FUNCTION_42();
      if (!(_DWORD)v10 || (unint64_t)v7 >= *(_QWORD *)(v1 + 24) >> 1)
      {
        OUTLINED_FUNCTION_32_43(v10);
        v1 = v11;
      }
      v12 = *(_QWORD *)(v1 + 16) - v9;
      if (v12 < 0)
        goto LABEL_20;
      ++v5;
      v13 = v1 + 8 * v9;
      memmove((void *)(v13 + 40), (const void *)(v13 + 32), 8 * v12);
      ++*(_QWORD *)(v1 + 16);
      *(_QWORD *)(v13 + 32) = 1;
      if (v3 == v5)
      {
        result = OUTLINED_FUNCTION_34();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    OUTLINED_FUNCTION_2_77();
    result = OUTLINED_FUNCTION_0_82();
    __break(1u);
  }
  else
  {
    result = OUTLINED_FUNCTION_0_2();
LABEL_18:
    *v0 = v1;
  }
  return result;
}

void sub_242C35288()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;

  OUTLINED_FUNCTION_38_34();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v1 + 16);
  if (v5 < v4)
    goto LABEL_2;
  v34 = v1;
  if (v4)
  {
    v25 = v3;
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_74();
    sub_242C39468(&v25);
    v6 = v25;
    v7 = *(_QWORD *)(v25 + 16);
    if (!v7)
    {
LABEL_33:
      OUTLINED_FUNCTION_17_5();
      *v0 = v1;
      return;
    }
    v8 = *(_QWORD *)(v25 + 32);
    v5 = *(_QWORD *)(v1 + 16);
    if (v8 >= -(uint64_t)v5 && v8 < (uint64_t)v5)
    {
      v11 = 0;
      v12 = v7 - 1;
      while (1)
      {
        v2 = (v5 & (v8 >> 63)) + v8;
        if (v2 >= (uint64_t)v5)
          break;
        if (v2 < -(uint64_t)v5)
          goto LABEL_77;
        v13 = (v5 & (v2 >> 63)) + v2;
        if (v13 >= v5)
          goto LABEL_64;
        if (*(_QWORD *)(v1 + 8 * v13 + 32) != 1)
          break;
        if (v2 < 0)
          goto LABEL_70;
        if (v2 >= v5)
          goto LABEL_73;
        v14 = OUTLINED_FUNCTION_42();
        if (!(_DWORD)v14 || (int64_t)(v5 - 1) > *(_QWORD *)(v1 + 24) >> 1)
        {
          OUTLINED_FUNCTION_32_43(v14);
          v1 = v15;
        }
        v16 = *(_QWORD *)(v1 + 16) - (v2 + 1);
        if (v16 < 0)
        {
          OUTLINED_FUNCTION_2_77();
          OUTLINED_FUNCTION_0_82();
          __break(1u);
LABEL_77:
          v27 = 0;
          v25 = v2;
LABEL_78:
          v26 = 0;
          v28 = -1;
          v30 = 0;
          v31 = 0;
          v29 = v5;
          v32 = -1;
LABEL_79:
          v33 = 4;
          OUTLINED_FUNCTION_4_18();
        }
        memmove((void *)(v1 + 32 + 8 * v2), (const void *)(v1 + 32 + 8 * (v2 + 1)), 8 * v16);
        v17 = *(_QWORD *)(v1 + 16);
        v5 = v17 - 1;
        *(_QWORD *)(v1 + 16) = v17 - 1;
        v34 = v1;
        if (v12 == v11)
          goto LABEL_33;
        if ((unint64_t)(v11 + 1) >= *(_QWORD *)(v6 + 16))
          goto LABEL_65;
        v8 = *(_QWORD *)(v6 + 8 * v11++ + 40);
        if (v8 < 1 - v17 || v8 >= (uint64_t)v5)
          goto LABEL_9;
      }
      OUTLINED_FUNCTION_136();
      OUTLINED_FUNCTION_17_5();
    }
    else
    {
LABEL_9:
      OUTLINED_FUNCTION_17_5();
      OUTLINED_FUNCTION_136();
    }
LABEL_2:
    *v0 = 0;
    return;
  }
  if (!v5)
  {
    OUTLINED_FUNCTION_0_2();
    v10 = 0;
    goto LABEL_62;
  }
  v10 = 0;
  while (1)
  {
    v6 = v10 + 1;
    if (*(_QWORD *)(v1 + 32 + 8 * v10) == 1)
      break;
    ++v10;
    if (v5 == v6)
    {
      OUTLINED_FUNCTION_0_2();
      v10 = v5;
      goto LABEL_62;
    }
  }
  if (v5 - 1 == v10)
  {
    OUTLINED_FUNCTION_0_2();
    goto LABEL_61;
  }
  if (v6 < -(uint64_t)v5)
  {
    OUTLINED_FUNCTION_0_2();
    goto LABEL_75;
  }
  OUTLINED_FUNCTION_0_2();
  if (v6 >= v5)
  {
LABEL_75:
    v27 = 0;
    v25 = v6;
    goto LABEL_78;
  }
  v6 = v10 + 5;
  while (1)
  {
    v19 = v6 - 4;
    if (v6 - 4 >= v5)
    {
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      if (__CFADD__(v5, v2))
        __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      v6 -= 4;
      goto LABEL_75;
    }
    v20 = *(_QWORD *)(v1 + 8 * v6);
    if (v20 != 1)
    {
      if (v19 != v10)
      {
        if (v10 < -(uint64_t)v5 || v10 >= (uint64_t)v5)
        {
          v27 = 0;
          v25 = v10;
          goto LABEL_78;
        }
        v2 = (v5 & (v10 >> 63)) + v10;
        if (v2 >= v5)
          goto LABEL_67;
        v5 = *(_QWORD *)(v1 + 32 + 8 * v2);
        if ((OUTLINED_FUNCTION_42() & 1) == 0)
        {
          OUTLINED_FUNCTION_43_11();
          v1 = v24;
        }
        if ((unint64_t)v2 >= *(_QWORD *)(v1 + 16))
          goto LABEL_68;
        *(_QWORD *)(v1 + 8 * v2 + 32) = v20;
        if (v19 >= *(_QWORD *)(v1 + 16))
        {
          v26 = 0;
          v27 = 0;
          v25 = v6 - 4;
          OUTLINED_FUNCTION_18_57();
          goto LABEL_79;
        }
        *(_QWORD *)(v1 + 8 * v6) = v5;
        v34 = v1;
      }
      if (__OFADD__(v10++, 1))
        goto LABEL_66;
    }
    v5 = *(_QWORD *)(v1 + 16);
    v23 = v6 - 3 >= v5;
    if (v6 - 3 == v5)
      break;
    ++v6;
    if (v23)
      goto LABEL_74;
  }
  v5 = v6 - 3;
LABEL_61:
  if ((uint64_t)v5 < v10)
    goto LABEL_69;
LABEL_62:
  sub_242C35E70(v10, v5);
  *v0 = v34;
}

uint64_t static ShapeInference.broadcastingAxes(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v2 = *a1;
  v3 = *a2;
  if ((sub_242C00B0C(*a1, *a2) & 1) != 0)
    return MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v3 + 16) <= *(_QWORD *)(v2 + 16))
    v5 = *(_QWORD *)(v2 + 16);
  else
    v5 = *(_QWORD *)(v3 + 16);
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_47_31(0, v5, 0);
  v4 = v6;
  if (*(_QWORD *)(v3 + 16) <= *(_QWORD *)(v2 + 16))
    v7 = *(_QWORD *)(v2 + 16);
  else
    v7 = *(_QWORD *)(v3 + 16);
  OUTLINED_FUNCTION_47_31(0, v7, 0);
  v9 = v8;
  v10 = *(_QWORD *)(v2 + 16);
  v11 = *(_QWORD *)(v3 + 16);
  if (v10 >= v11)
  {
    if (v11 < v10)
    {
      v14 = sub_242C39C9C(1, v10 - v11);
      OUTLINED_FUNCTION_64_23(v14, v15, v14);
    }
  }
  else
  {
    v12 = sub_242C39C9C(1, v11 - v10);
    OUTLINED_FUNCTION_64_23(v12, v13, v12);
  }
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28_1();
  v16 = *(_QWORD *)(v2 + 16);
  if (v16)
  {
    v17 = 4;
    while (1)
    {
      v18 = v17 - 4;
      if (v17 - 4 < -(uint64_t)v16 || v18 >= v16)
        goto LABEL_40;
      v20 = *(_QWORD *)(v3 + 16);
      if (v18 == v20)
        goto LABEL_39;
      if (v18 >= v20)
        goto LABEL_40;
      v21 = *(_QWORD *)(v3 + 8 * v17);
      if (v21 == 1)
        break;
      v26 = *(_QWORD *)(v2 + 8 * v17);
      if (v26 == 1)
      {
        v23 = *(_QWORD *)(v4 + 16);
        v27 = *(_QWORD *)(v4 + 24);
        v24 = v23 + 1;
        if (v23 >= v27 >> 1)
        {
          OUTLINED_FUNCTION_4_78(v27 > 1, v23 + 1);
          v4 = v25;
        }
        else
        {
          v25 = v4;
        }
        goto LABEL_27;
      }
      if (v26 != v21)
      {
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_81();
        OUTLINED_FUNCTION_49();
        OUTLINED_FUNCTION_49();
        return 0;
      }
LABEL_29:
      v16 = *(_QWORD *)(v2 + 16);
      v28 = v17 + 1;
      v29 = v17 - 3;
      ++v17;
      if (v29 == v16)
      {
        v30 = v28 - 4;
        goto LABEL_34;
      }
    }
    v23 = *(_QWORD *)(v9 + 16);
    v22 = *(_QWORD *)(v9 + 24);
    v24 = v23 + 1;
    if (v23 >= v22 >> 1)
    {
      OUTLINED_FUNCTION_47_31(v22 > 1, v23 + 1, 1);
      v9 = v25;
    }
    else
    {
      v25 = v9;
    }
LABEL_27:
    *(_QWORD *)(v25 + 16) = v24;
    *(_QWORD *)(v25 + 8 * v23 + 32) = v18;
    goto LABEL_29;
  }
  v30 = 0;
LABEL_34:
  v31 = *(_QWORD *)(v3 + 16);
  if (v30 != v31)
  {
    if (v30 < v31)
    {
LABEL_39:
      sub_242C48F5C();
      __break(1u);
    }
LABEL_40:
    OUTLINED_FUNCTION_4_18();
  }
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_49();
  return v4;
}

uint64_t sub_242C35908(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  v4 = *(_QWORD *)(*a1 + 16);
  if (-v4 > a3 || v4 <= a3)
  {
    OUTLINED_FUNCTION_2_81();
    OUTLINED_FUNCTION_4_18();
  }
  v6 = (v4 & (a3 >> 63)) + a3;
  if (v4 < v6)
    return 0;
  v8 = TensorShape.subscript.getter((v4 & (a3 >> 63)) + a3);
  v9 = v8 / a2;
  if (a2 == -1)
  {
    if (v8 != 0x8000000000000000)
      goto LABEL_11;
    __break(1u);
  }
  if (v8 % a2)
    return 0;
LABEL_11:
  OUTLINED_FUNCTION_74();
  TensorShape.subscript.setter(v9, v6);
  return sub_242BC0A10(v3, a2);
}

uint64_t sub_242C359F8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;

  result = 0;
  v5 = *a1;
  v6 = *(_QWORD *)(*a1 + 16);
  if (-v6 <= a3 && v6 > a3)
  {
    v9 = (v6 & (a3 >> 63)) + a3;
    result = TensorShape.subscript.getter(v9);
    v10 = *(_QWORD *)(a2 + 16);
    if (v10)
    {
      v11 = 0;
      v12 = (uint64_t *)(a2 + 32);
      do
      {
        v13 = *v12++;
        v14 = __OFADD__(v11, v13);
        v11 += v13;
        if (v14)
        {
          __break(1u);
          return result;
        }
        --v10;
      }
      while (v10);
      if (result != v11)
        return 0;
      goto LABEL_10;
    }
    if (!result)
    {
LABEL_10:
      OUTLINED_FUNCTION_74();
      return sub_242C34984(a2, v5, v9);
    }
    return 0;
  }
  return result;
}

void sub_242C35AB4(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v6 = 0;
    v8 = a1 + 32;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v7 + 16);
    while (*(_QWORD *)(*(_QWORD *)(a1 + 8 * v6 + 32) + 16) == v9)
    {
      if (v4 == ++v6)
      {
        OUTLINED_FUNCTION_0_2();
        OUTLINED_FUNCTION_74();
        for (i = 0; i != v4; ++i)
        {
          v11 = *(_QWORD *)(v8 + 8 * i);
          if (*(_QWORD *)(v11 + 16) != v9)
            goto LABEL_19;
          if (v9)
          {
            v12 = 0;
            v13 = v11 + 32;
            while (a2 == v12 || *(_QWORD *)(v13 + 8 * v12) == *(_QWORD *)(v7 + 8 * v12 + 32))
            {
              if (v9 == ++v12)
                goto LABEL_12;
            }
LABEL_19:
            OUTLINED_FUNCTION_136();
            goto LABEL_20;
          }
LABEL_12:
          ;
        }
        OUTLINED_FUNCTION_34();
        v14 = *(_QWORD *)(v7 + 16);
        if (-v14 <= a2 && v14 > a2)
        {
          v16 = 0;
          v17 = (v14 & (a2 >> 63)) + a2;
          do
          {
            v18 = *(_QWORD *)(*(_QWORD *)v8 + 16);
            if (v17 < -v18 || v17 >= v18)
              goto LABEL_48;
            v20 = (v18 & (v17 >> 63)) + v17;
            if (v20 >= v18)
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            v21 = *(_QWORD *)(*(_QWORD *)v8 + 8 * v20 + 32);
            v22 = __OFADD__(v16, v21);
            v16 += v21;
            if (v22)
              goto LABEL_43;
            v8 += 8;
            --v4;
          }
          while (v4);
          if (v17 < -v14 || v17 >= v14)
          {
            OUTLINED_FUNCTION_2_81();
            goto LABEL_49;
          }
          if ((v17 & 0x8000000000000000) == 0 || (v22 = __OFADD__(v14, v17), v17 += v14, !v22))
          {
            if ((OUTLINED_FUNCTION_42() & 1) != 0)
            {
              if ((v17 & 0x8000000000000000) == 0)
                goto LABEL_40;
LABEL_45:
              __break(1u);
              goto LABEL_46;
            }
LABEL_44:
            OUTLINED_FUNCTION_43_11();
            v7 = v24;
            if (v17 < 0)
              goto LABEL_45;
LABEL_40:
            if ((unint64_t)v17 < *(_QWORD *)(v7 + 16))
            {
              *(_QWORD *)(v7 + 8 * v17 + 32) = v16;
              goto LABEL_22;
            }
LABEL_46:
            __break(1u);
          }
          __break(1u);
LABEL_48:
          OUTLINED_FUNCTION_74();
          sub_242C480E0();
LABEL_49:
          OUTLINED_FUNCTION_4_18();
        }
LABEL_20:
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  v7 = 0;
LABEL_22:
  *a3 = v7;
}

void sub_242C35CC8(uint64_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  int v20;
  uint64_t *v21;
  uint64_t v22;

  v4 = a4;
  v5 = *a1;
  v6 = *(_QWORD *)(a2 + 16);
  if (!v6)
  {
    v13 = MEMORY[0x24BEE4AF8];
    if ((a3 & 1) == 0)
    {
LABEL_18:
      v22 = v13;
      MEMORY[0x24BDAC7A8](a1);
      v19[2] = &v22;
      OUTLINED_FUNCTION_0_2();
      v8 = sub_242C00810((uint64_t)sub_242C39D50, (uint64_t)v19, v5);
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_136();
      goto LABEL_19;
    }
LABEL_15:
    sub_242C3648C(v13, 1, v5, &v22);
    OUTLINED_FUNCTION_3_6();
    v8 = v22;
    goto LABEL_19;
  }
  v8 = 0;
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(v5 + 16);
  if (v9 >= -v10 && v9 < v10)
  {
    v20 = a3;
    v21 = a4;
    sub_242C480E0();
    sub_242A5DFBC(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)(v12 + 16);
    v16 = v6 - 1;
    while (1)
    {
      v17 = *(_QWORD *)(v13 + 24);
      if (v15 >= v17 >> 1)
      {
        OUTLINED_FUNCTION_72_4(v17 > 1, v15 + 1);
        v13 = v18;
      }
      *(_QWORD *)(v13 + 16) = v15 + 1;
      *(_QWORD *)(v13 + 8 * v15 + 32) = (v10 & (v9 >> 63)) + v9;
      if (v16 == v14)
        break;
      v9 = *(_QWORD *)(a2 + 8 * v14 + 40);
      if (v9 >= -v10)
      {
        ++v14;
        ++v15;
        if (v9 < v10)
          continue;
      }
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_81();
      v8 = 0;
      v4 = v21;
      goto LABEL_19;
    }
    a1 = (uint64_t *)OUTLINED_FUNCTION_81();
    v4 = v21;
    if ((v20 & 1) == 0)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_19:
  *v4 = v8;
  OUTLINED_FUNCTION_13_11();
}

void sub_242C35E70(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v9 <= *(_QWORD *)(v4 + 24) >> 1)
  {
    if (!v8)
      goto LABEL_17;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    sub_242A5DFBC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    v4 = v12;
    if (!v8)
      goto LABEL_17;
  }
  v13 = *(_QWORD *)(v4 + 16);
  if (__OFSUB__(v13, a2))
    goto LABEL_23;
  sub_242BC197C(v4 + 32 + 8 * a2, v13 - a2, v4 + 32 + 8 * a1);
  v14 = *(_QWORD *)(v4 + 16);
  v15 = __OFADD__(v14, v8);
  v16 = v14 + v8;
  if (!v15)
  {
    *(_QWORD *)(v4 + 16) = v16;
LABEL_17:
    *v2 = v4;
    OUTLINED_FUNCTION_12_0();
    return;
  }
LABEL_24:
  __break(1u);
}

void sub_242C35F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    sub_242A5DFBC(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    v5 = v14;
  }
  v15 = (_QWORD *)(v5 + 32 + 8 * a1);
  if (!v9)
    goto LABEL_16;
  v16 = *(_QWORD *)(v5 + 16);
  if (__OFSUB__(v16, a2))
    goto LABEL_22;
  sub_242BC197C(v5 + 32 + 8 * a2, v16 - a2, v15 + 1);
  v17 = *(_QWORD *)(v5 + 16);
  v18 = __OFADD__(v17, v9);
  v19 = v17 + v9;
  if (!v18)
  {
    *(_QWORD *)(v5 + 16) = v19;
LABEL_16:
    *v15 = a3;
    *v3 = v5;
    OUTLINED_FUNCTION_12_0();
    return;
  }
LABEL_23:
  __break(1u);
}

void sub_242C36030()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_10_25();
  if (v1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v6 = v2;
  v7 = *v0;
  v8 = *(_QWORD *)(*v0 + 16);
  if (v8 < v2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v9 = v1;
  v10 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v11 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v8, v11))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v12 = v3;
  v13 = v4;
  v21 = v5;
  if (!swift_isUniquelyReferenced_nonNull_native() || v8 + v11 > *(_QWORD *)(v7 + 24) >> 1)
  {
    sub_242A5E45C();
    v7 = v14;
  }
  v15 = v7 + 32;
  swift_arrayDestroy();
  if (!v11)
    goto LABEL_13;
  v16 = *(_QWORD *)(v7 + 16);
  if (__OFSUB__(v16, v6))
    goto LABEL_19;
  sub_242BC1BA0(v15 + 24 * v6, v16 - v6);
  v17 = *(_QWORD *)(v7 + 16);
  v18 = __OFADD__(v17, v11);
  v19 = v17 + v11;
  if (!v18)
  {
    *(_QWORD *)(v7 + 16) = v19;
LABEL_13:
    *(_QWORD *)(v7 + 32 + 24 * v9) = v12;
    v20 = v15 + 24 * v9;
    *(_QWORD *)(v20 + 8) = v13;
    *(_QWORD *)(v20 + 16) = v21;
    *v0 = v7;
    OUTLINED_FUNCTION_16_40();
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_242C36144()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_10_25();
  if (v1 < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  v6 = v2;
  v7 = *v0;
  v8 = *(_QWORD *)(*v0 + 16);
  if (v8 < v2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v9 = v1;
  v10 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v11 = v4;
  v12 = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v13 = v12 - v10;
  if (__OFSUB__(v12, v10))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v14 = v8 + v13;
  if (__OFADD__(v8, v13))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    return;
  }
  v26 = v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v14 > *(_QWORD *)(v7 + 24) >> 1)
  {
    if (v8 <= v14)
      v16 = v8 + v13;
    else
      v16 = v8;
    sub_242A5DEE0(isUniquelyReferenced_nonNull_native, v16, 1, v7);
    v7 = v17;
  }
  v18 = (char *)(v7 + 32 + 8 * v9);
  if (!v13)
    goto LABEL_22;
  v19 = *(_QWORD *)(v7 + 16);
  v20 = v19 - v6;
  if (__OFSUB__(v19, v6))
    goto LABEL_31;
  v21 = &v18[8 * v12];
  v22 = (char *)(v7 + 32 + 8 * v6);
  if (v21 != v22 || &v22[8 * v20] <= v21)
  {
    memmove(v21, v22, 8 * v20);
    v19 = *(_QWORD *)(v7 + 16);
  }
  v24 = __OFADD__(v19, v13);
  v25 = v19 + v13;
  if (v24)
    goto LABEL_32;
  *(_QWORD *)(v7 + 16) = v25;
LABEL_22:
  if (v12 >= 1)
    memcpy(v18, (const void *)(v26 + 8 * v11), 8 * v12);
  swift_unknownObjectRelease();
  *v0 = v7;
  OUTLINED_FUNCTION_16_40();
}

void sub_242C3626C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = *(_QWORD *)(a3 + 16);
  v11 = v10 - v8;
  if (__OFSUB__(v10, v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v12 = v6 + v11;
  if (__OFADD__(v6, v11))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v12 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v12)
      v14 = v6 + v11;
    else
      v14 = v6;
    sub_242A5DFBC(isUniquelyReferenced_nonNull_native, v14, 1, v5);
    v5 = v15;
  }
  v16 = (char *)(v5 + 32 + 8 * a1);
  if (!v11)
    goto LABEL_16;
  v17 = *(_QWORD *)(v5 + 16);
  if (__OFSUB__(v17, a2))
    goto LABEL_25;
  sub_242BC197C(v5 + 32 + 8 * a2, v17 - a2, &v16[8 * v10]);
  v18 = *(_QWORD *)(v5 + 16);
  v19 = __OFADD__(v18, v11);
  v20 = v18 + v11;
  if (v19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  *(_QWORD *)(v5 + 16) = v20;
LABEL_16:
  if (!v10)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    *v3 = v5;
    return;
  }
  if (*(_QWORD *)(a3 + 16) == v10)
  {
    memcpy(v16, (const void *)(a3 + 32), 8 * v10);
    goto LABEL_19;
  }
LABEL_27:
  __break(1u);
}

void sub_242C36390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  if (a1 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v10 = a3;
  v11 = a3 - v9;
  if (__OFSUB__(a3, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v12 = v7 + v11;
  if (__OFADD__(v7, v11))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v14 = OUTLINED_FUNCTION_28_16();
  if (!(_DWORD)v14 || v12 > *(_QWORD *)(v6 + 24) >> 1)
  {
    if (v7 <= v12)
      v15 = v7 + v11;
    else
      v15 = v7;
    OUTLINED_FUNCTION_72_4(v14, v15);
    v6 = v16;
  }
  v17 = (_QWORD *)(v6 + 32 + 8 * a1);
  v18 = &v17[v10];
  if (!v11)
  {
LABEL_16:
    if (v10 < 1)
    {
LABEL_19:
      *v4 = v6;
      OUTLINED_FUNCTION_13_11();
      return;
    }
    while (v10)
    {
      *v17++ = a4;
      --v10;
      if (v17 >= v18)
        goto LABEL_19;
    }
    __break(1u);
    goto LABEL_21;
  }
  v19 = *(_QWORD *)(v6 + 16);
  if (__OFSUB__(v19, a2))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  sub_242BC197C(v6 + 32 + 8 * a2, v19 - a2, &v17[v10]);
  v20 = *(_QWORD *)(v6 + 16);
  v21 = __OFADD__(v20, v11);
  v22 = v20 + v11;
  if (!v21)
  {
    *(_QWORD *)(v6 + 16) = v22;
    goto LABEL_16;
  }
LABEL_27:
  __break(1u);
}

uint64_t sub_242C3648C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v15;

  v4 = a3;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    result = sub_242C480E0();
    goto LABEL_17;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a3 + 16);
  if (v8 < -v9)
  {
    sub_242C480E0();
    sub_242C480E0();
LABEL_23:
    sub_242A59264();
  }
  sub_242C480E0();
  sub_242C480E0();
  if (v8 >= v9)
    goto LABEL_23;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
LABEL_21:
    sub_242B4B43C();
    v4 = v15;
  }
  v11 = 0;
  while (1)
  {
    v12 = (v9 & (v8 >> 63)) + v8;
    if (v12 < 0)
    {
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if ((unint64_t)v12 >= *(_QWORD *)(v4 + 16))
      goto LABEL_19;
    *(_QWORD *)(v4 + 32 + 8 * v12) = a2;
    if (v6 - 1 == v11)
      break;
    if (v11 + 1 >= v6)
      goto LABEL_20;
    v8 = *(_QWORD *)(a1 + 8 * v11 + 40);
    v9 = *(_QWORD *)(v4 + 16);
    ++v11;
    if (v8 < -v9 || v8 >= v9)
      goto LABEL_23;
  }
  result = swift_bridgeObjectRelease();
LABEL_17:
  *a4 = v4;
  return result;
}

uint64_t sub_242C3660C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
    return a2;
  if (*(_QWORD *)(a3 + 32) == result)
    return 0;
  if (v3 == 1)
    return a2;
  for (i = 5; ; ++i)
  {
    v5 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    if (*(_QWORD *)(a3 + 8 * i) == result)
      return 0;
    if (v5 == v3)
      return a2;
  }
  __break(1u);
  return result;
}

void static ShapeInference.broadcasting(_:to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_10_25();
  v30 = v2;
  v31 = v6;
  v7 = v5;
  v8 = *v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *v3;
  v11 = *(_QWORD *)(*v3 + 16);
  if (v9 < v11)
  {
    *v5 = 0;
    goto LABEL_34;
  }
  if ((sub_242C00B0C(*v3, *v4) & 1) != 0)
  {
    *v7 = v10;
    sub_242C480E0();
    return;
  }
  v28 = v7;
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_0_2();
  v12 = v9 + 3;
  v13 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v14 = v11;
    if (v11)
      break;
    if (v12 == 3)
      goto LABEL_37;
    v11 = 0;
    v15 = 0;
LABEL_10:
    if ((int64_t)(v12 - 4) >= *(_QWORD *)(v8 + 16))
      goto LABEL_36;
    v16 = *(_QWORD *)(v8 + 8 * v12);
    if (!v14)
    {
LABEL_20:
      if ((OUTLINED_FUNCTION_28_16() & 1) == 0)
      {
        OUTLINED_FUNCTION_4_78(0, *(_QWORD *)(v13 + 16) + 1);
        v13 = v21;
      }
      OUTLINED_FUNCTION_39_38();
      if (v18)
      {
        OUTLINED_FUNCTION_3_84(v19);
        v13 = v22;
      }
      v15 = v16;
      goto LABEL_30;
    }
    if (v16 == 1)
    {
      if (v15 != 1)
        goto LABEL_33;
      if ((OUTLINED_FUNCTION_28_16() & 1) == 0)
      {
        OUTLINED_FUNCTION_4_78(0, *(_QWORD *)(v13 + 16) + 1);
        v13 = v23;
      }
      OUTLINED_FUNCTION_39_38();
      if (v18)
      {
        OUTLINED_FUNCTION_3_84(v17);
        v13 = v24;
      }
      v15 = 1;
    }
    else
    {
      if (v15 == 1)
        goto LABEL_20;
      if (v15 != v16)
      {
LABEL_33:
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_34();
        OUTLINED_FUNCTION_136();
        *v28 = 0;
        goto LABEL_34;
      }
      if ((OUTLINED_FUNCTION_28_16() & 1) == 0)
      {
        OUTLINED_FUNCTION_4_78(0, *(_QWORD *)(v13 + 16) + 1);
        v13 = v25;
      }
      OUTLINED_FUNCTION_39_38();
      if (v18)
      {
        OUTLINED_FUNCTION_3_84(v20);
        v13 = v26;
      }
    }
LABEL_30:
    *(_QWORD *)(v13 + 16) = v0;
    *(_QWORD *)(v13 + 8 * v1 + 32) = v15;
    --v12;
  }
  --v11;
  if ((int64_t)(v14 - 1) < *(_QWORD *)(v10 + 16))
  {
    if (v12 == 3)
      goto LABEL_33;
    v15 = *(_QWORD *)(v10 + 32 + 8 * v11);
    goto LABEL_10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  v29 = v13;
  v27 = sub_242C37678((uint64_t)&v29);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_136();
  *v28 = v27;
LABEL_34:
  OUTLINED_FUNCTION_16_40();
}

void sub_242C36888(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;

  v7 = *(_QWORD **)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16) != 4
    || (v8 = *(_QWORD **)a2, *(_QWORD *)(*(_QWORD *)a2 + 16) != 4)
    || v7[6] < v8[6] && v7[7] < v8[7])
  {
    v11 = 0;
    goto LABEL_6;
  }
  v29 = a7;
  OUTLINED_FUNCTION_0_2();
  v12 = 0;
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = 4;
  while (1)
  {
    if (v12 >= v13)
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    v14 = v7[v12 + 4];
    if (v12)
    {
      if (v12 == 3)
      {
        v16 = a4;
        v15 = a6;
        v17 = v8 + 7;
        if (v8[2] < 4uLL)
          goto LABEL_44;
      }
      else
      {
        v15 = a5;
        v16 = a3;
        v17 = v8 + 6;
        if (v12 == 1)
          goto LABEL_24;
      }
      if (v15 + 0x4000000000000000 < 0)
        goto LABEL_39;
      v18 = __OFADD__(v14, 2 * v15);
      v19 = v14 + 2 * v15;
      if (v18)
        goto LABEL_40;
      v20 = *v17;
      v18 = __OFSUB__(v19, v20);
      v21 = v19 - v20;
      if (v18)
        goto LABEL_41;
      if (!v16)
        goto LABEL_42;
      if (v21 == 0x8000000000000000 && v16 == -1)
        goto LABEL_45;
      v23 = v21 / v16;
      v14 = v23 + 1;
      if (__OFADD__(v23, 1))
        goto LABEL_43;
      if (v14 < 1)
        break;
    }
LABEL_24:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_258_1(0, v11[2] + 1);
      v11 = v26;
    }
    v25 = v11[2];
    v24 = v11[3];
    if (v25 >= v24 >> 1)
    {
      OUTLINED_FUNCTION_258_1(v24 > 1, v25 + 1);
      v11 = v27;
    }
    ++v12;
    v11[2] = v25 + 1;
    v11[v25 + 4] = v14;
    v13 = v7[2];
    if (v12 == v13)
    {
      OUTLINED_FUNCTION_136();
      if (v7[2] >= 2uLL)
      {
        if (v11[2] <= 1uLL)
          goto LABEL_49;
        v12 = v7[5];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        {
LABEL_34:
          if (v11[2] >= 2uLL)
          {
            v11[5] = v12;
            goto LABEL_37;
          }
          __break(1u);
LABEL_49:
          OUTLINED_FUNCTION_18_57();
          OUTLINED_FUNCTION_4_18();
        }
LABEL_47:
        sub_242B4B43C();
        v11 = v28;
        goto LABEL_34;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v12 == 4)
      goto LABEL_49;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_136();
  v11 = 0;
LABEL_37:
  a7 = v29;
LABEL_6:
  *a7 = v11;
}

uint64_t sub_242C36B20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  OUTLINED_FUNCTION_38_34();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 == *(_QWORD *)(v1 + 16))
  {
    if (v3)
    {
      v4 = v2;
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_74();
      v5 = 0;
      v6 = (_QWORD *)(v4 + 16 * v3 + 24);
      v7 = -v3;
      while (1)
      {
        v8 = *(v6 - 1);
        v9 = v8 + *v6;
        if (__OFADD__(v8, *v6))
          break;
        v10 = *(_QWORD *)(v1 + 16);
        if ((OUTLINED_FUNCTION_42() & 1) == 0)
        {
          OUTLINED_FUNCTION_43_11();
          v1 = v15;
        }
        v11 = v5 + v10 - 1;
        if ((v11 & 0x8000000000000000) != 0)
          goto LABEL_13;
        if (v11 >= *(_QWORD *)(v1 + 16))
          goto LABEL_14;
        v12 = *(_QWORD *)(v1 + 32 + 8 * v11);
        v13 = __OFADD__(v12, v9);
        v14 = v12 + v9;
        if (v13)
          goto LABEL_15;
        v6 -= 2;
        *(_QWORD *)(v1 + 32 + 8 * v11) = v14;
        if (v7 == --v5)
          goto LABEL_16;
      }
      __break(1u);
LABEL_13:
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      result = OUTLINED_FUNCTION_34();
    }
    else
    {
      result = OUTLINED_FUNCTION_0_2();
    }
    *v0 = v1;
  }
  else
  {
    result = sub_242C48F5C();
    __break(1u);
  }
  return result;
}

uint64_t sub_242C36C58@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16, uint64_t a17)
{
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v73;

  v17 = *(_QWORD **)a1;
  v18 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v18 <= 1 || (v19 = (_QWORD *)*a2, v20 = *(_QWORD *)(*a2 + 16), v20 <= 1))
  {
    sub_242C480E0();
    goto LABEL_58;
  }
  v21 = v19[5];
  if ((unsigned __int128)(v21 * (__int128)a10) >> 64 != (v21 * a10) >> 63)
    goto LABEL_53;
  if (v17[5] != v21 * a10)
  {
    sub_242C48C38();
    OUTLINED_FUNCTION_62_21();
    OUTLINED_FUNCTION_21_49();
    OUTLINED_FUNCTION_19_45();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_14_47();
    OUTLINED_FUNCTION_21_49();
    OUTLINED_FUNCTION_19_45();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_14_47();
    OUTLINED_FUNCTION_21_49();
    OUTLINED_FUNCTION_19_45();
    OUTLINED_FUNCTION_4_0();
    v58 = sub_242C48314();
    OUTLINED_FUNCTION_41_40(v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, a11);
    goto LABEL_66;
  }
  if (v18 != 4 || v20 != 4)
LABEL_66:
    sub_242A59264();
  v73 = a5 + 0x4000000000000000;
  if (a5 + 0x4000000000000000 < 0)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  v23 = v17[6];
  if (__OFADD__(v23, 2 * a5))
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  v71 = v19 + 6;
  if (v23 + 2 * a5 < v19[6])
  {
    OUTLINED_FUNCTION_61_24();
    goto LABEL_66;
  }
  v25 = a6 + 0x4000000000000000;
  if (a6 + 0x4000000000000000 < 0)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v26 = v17[7];
  if (__OFADD__(v26, 2 * a6))
  {
LABEL_57:
    __break(1u);
LABEL_58:
    OUTLINED_FUNCTION_47_22();
    goto LABEL_66;
  }
  v70 = *a2;
  HIDWORD(v67) = a16;
  v27 = v19 + 7;
  if (v26 + 2 * a6 < v19[7])
  {
    OUTLINED_FUNCTION_61_24();
LABEL_60:
    OUTLINED_FUNCTION_41_40(v50, v51, v52, v53, v54, v55, v56, v57, a15, v67, a17, a11);
    goto LABEL_66;
  }
  sub_242C480E0();
  v28 = 0;
  v29 = MEMORY[0x24BEE4AF8];
  v30 = 4;
  while (1)
  {
    if (v28 >= v30)
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    v31 = v17[v28 + 4];
    if (!v28)
      goto LABEL_34;
    v32 = v25;
    v33 = a6;
    v34 = a4;
    v35 = a8;
    v36 = v27;
    if (v28 != 3)
    {
      if (v28 == 1)
      {
        if (!*(_QWORD *)(v70 + 16))
          goto LABEL_51;
        v31 = *(_QWORD *)(v70 + 32);
        goto LABEL_34;
      }
      v33 = a5;
      v32 = v73;
      v34 = a3;
      v35 = a7;
      v36 = v71;
    }
    if (v32 < 0)
      goto LABEL_43;
    v37 = __OFADD__(v31, 2 * v33);
    v38 = v31 + 2 * v33;
    if (v37)
      goto LABEL_44;
    v37 = __OFSUB__(*v36, 1);
    v39 = *v36 - 1;
    if (v37)
      goto LABEL_45;
    v40 = v35 * v39;
    if ((unsigned __int128)(v35 * (__int128)v39) >> 64 != (v35 * v39) >> 63)
      goto LABEL_46;
    v41 = v38 - v40;
    if (__OFSUB__(v38, v40))
      goto LABEL_47;
    v37 = __OFSUB__(v41, 1);
    v42 = v41 - 1;
    if (v37)
      goto LABEL_48;
    if (!v34)
      goto LABEL_49;
    if (v42 == 0x8000000000000000 && v34 == -1)
      goto LABEL_52;
    v44 = v42 / v34;
    v31 = v44 + 1;
    if (__OFADD__(v44, 1))
      goto LABEL_50;
    if (v31 < 1)
    {
      sub_242C48C38();
      OUTLINED_FUNCTION_14_47();
      sub_242C491CC();
      OUTLINED_FUNCTION_19_45();
      OUTLINED_FUNCTION_4_0();
      v50 = OUTLINED_FUNCTION_14_47();
      goto LABEL_60;
    }
LABEL_34:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_53_24(0, *(_QWORD *)(v29 + 16) + 1);
      v29 = v47;
    }
    v46 = *(_QWORD *)(v29 + 16);
    v45 = *(_QWORD *)(v29 + 24);
    if (v46 >= v45 >> 1)
    {
      OUTLINED_FUNCTION_53_24(v45 > 1, v46 + 1);
      v29 = v48;
    }
    ++v28;
    *(_QWORD *)(v29 + 16) = v46 + 1;
    *(_QWORD *)(v29 + 8 * v46 + 32) = v31;
    v30 = v17[2];
    if (v28 == v30)
      break;
    if (v28 - 1 >= 3)
      goto LABEL_58;
  }
  result = swift_bridgeObjectRelease();
  *a9 = v29;
  return result;
}

double sub_242C371CC@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double result;

  v12 = (_QWORD *)*a1;
  v13 = v12[2];
  if (v13 <= 1)
    goto LABEL_45;
  v14 = *(_QWORD **)a2;
  v15 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  if (!v15)
    goto LABEL_45;
  if (v12[5] != v14[4])
  {
    sub_242C48C38();
    OUTLINED_FUNCTION_62_21();
    OUTLINED_FUNCTION_34_44();
    OUTLINED_FUNCTION_99_6();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_99_6();
    OUTLINED_FUNCTION_34_44();
    OUTLINED_FUNCTION_99_6();
    OUTLINED_FUNCTION_4_0();
    sub_242C48314();
    goto LABEL_47;
  }
  if (v13 != 4 || v15 != 4)
LABEL_47:
    sub_242A59264();
  v16 = v14[5];
  v17 = v16 * a12;
  if ((unsigned __int128)(v16 * (__int128)a12) >> 64 != (v16 * a12) >> 63)
  {
    __break(1u);
    goto LABEL_27;
  }
  v18 = v12[6];
  v19 = v18 - 1;
  if (__OFSUB__(v18, 1))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v20 = v19 * a3;
  if ((unsigned __int128)(v19 * (__int128)a3) >> 64 != (v19 * a3) >> 63)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (a5 + 0x4000000000000000 < 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v21 = __OFSUB__(v20, 2 * a5);
  v22 = v20 - 2 * a5;
  if (v21)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v23 = v14[6];
  v21 = __OFSUB__(v23, 1);
  v24 = v23 - 1;
  if (v21)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v25 = a10 * v24;
  if ((unsigned __int128)(a10 * (__int128)v24) >> 64 != (a10 * v24) >> 63)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v21 = __OFADD__(v22, v25);
  v26 = v22 + v25;
  if (v21)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v21 = __OFADD__(v26, 1);
  v27 = v26 + 1;
  if (v21)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v28 = v27 + a7;
  if (__OFADD__(v27, a7))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v29 = v12[7];
  v30 = v29 - 1;
  if (__OFSUB__(v29, 1))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v31 = v30 * a4;
  if ((unsigned __int128)(v30 * (__int128)a4) >> 64 != (v30 * a4) >> 63)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (a6 + 0x4000000000000000 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v21 = __OFSUB__(v31, 2 * a6);
  v32 = v31 - 2 * a6;
  if (v21)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v34 = v14[7];
  v21 = __OFSUB__(v34, 1);
  v35 = v34 - 1;
  if (v21)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v36 = a11 * v35;
  if ((unsigned __int128)(a11 * (__int128)v35) >> 64 != (a11 * v35) >> 63)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v37 = v32 + v36;
  if (__OFADD__(v32, v36))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v21 = __OFADD__(v37, 1);
  v38 = v37 + 1;
  if (v21)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v39 = v38 + a8;
  if (__OFADD__(v38, a8))
  {
LABEL_44:
    __break(1u);
LABEL_45:
    sub_242C480E0();
    OUTLINED_FUNCTION_47_22();
    goto LABEL_47;
  }
  v40 = v12[4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
  v41 = OUTLINED_FUNCTION_2_0();
  *(_QWORD *)&result = 4;
  *(_OWORD *)(v41 + 16) = xmmword_242C4DE40;
  *(_QWORD *)(v41 + 32) = v40;
  *(_QWORD *)(v41 + 40) = v17;
  *(_QWORD *)(v41 + 48) = v28;
  *(_QWORD *)(v41 + 56) = v39;
  *a9 = v41;
  return result;
}

void sub_242C37590()
{
  qword_257259A18 = (uint64_t)&unk_25137AD20;
}

void sub_242C375A4(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *a1;
  v6 = *a2;
  v7 = *(_QWORD *)(a3 + 8);
  *a4 = v5;
  v8 = *(_QWORD *)(v5 + 16);
  v9 = v8 + 2;
  if (__OFADD__(v8, 2))
  {
    __break(1u);
  }
  else
  {
    sub_242C480E0();
    sub_242AD5DD4(v9, 1);
    sub_242A5D8E0();
    v10 = *(_QWORD *)(*a4 + 16);
    sub_242A5DBC4();
    v11 = *a4;
    *(_QWORD *)(v11 + 16) = v10 + 1;
    *(_QWORD *)(v11 + 8 * v10 + 32) = v6;
    sub_242A5D8E0();
    v12 = *(_QWORD *)(*a4 + 16);
    sub_242A5DBC4();
    v13 = *a4;
    *(_QWORD *)(v13 + 16) = v12 + 1;
    *(_QWORD *)(v13 + 8 * v12 + 32) = v7;
  }
}

uint64_t sub_242C37658(uint64_t a1, uint64_t a2)
{
  return sub_242C37C74(a1, a2, (uint64_t (*)(_BYTE *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_242C37F04);
}

void sub_242C37664(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_242C37D54(a1, a2, a3, a4, &qword_257221120, (void (*)(uint64_t, uint64_t, _QWORD *))sub_242B6A4F0);
}

_QWORD *sub_242C37678(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  size_t v3;
  _QWORD *v4;
  uint64_t v6;

  v1 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
  v2 = (_QWORD *)swift_allocObject();
  v3 = _swift_stdlib_malloc_size(v2);
  v2[2] = v1;
  v2[3] = 2 * ((uint64_t)(v3 - 32) / 8);
  sub_242C480E0();
  v4 = sub_242C37F88(&v6, v2 + 4, v1);
  swift_bridgeObjectRelease();
  if (v4 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v2;
}

void sub_242C3772C()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  OUTLINED_FUNCTION_37();
  if (*(_QWORD *)(v0 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
    v1 = (const void *)OUTLINED_FUNCTION_5_79();
    _swift_stdlib_malloc_size(v1);
    OUTLINED_FUNCTION_17_54();
    OUTLINED_FUNCTION_11_60(v2);
    sub_242C3801C(v3, v4, v5, v6);
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_2_93();
    if (!v7)
      __break(1u);
  }
  OUTLINED_FUNCTION_9_0();
}

void sub_242C377A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
    v3 = (_QWORD *)OUTLINED_FUNCTION_5_79();
    v4 = _swift_stdlib_malloc_size(v3);
    v3[2] = v1;
    v3[3] = 2 * ((uint64_t)(v4 - 32) / 8);
    v5 = OUTLINED_FUNCTION_0_2();
    v13 = OUTLINED_FUNCTION_42_36(v5, v6, v7, v8, v9, v10, v11, v12, v17);
    sub_242C385E0(v13, v14, v15, v16);
    OUTLINED_FUNCTION_44_32();
    if (a1 != v1)
      __break(1u);
  }
  OUTLINED_FUNCTION_21_1();
}

void sub_242C3782C()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  _QWORD *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  OUTLINED_FUNCTION_37();
  if (*(_QWORD *)(v0 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25722C6A8);
    v1 = (const void *)OUTLINED_FUNCTION_2_0();
    v2 = _swift_stdlib_malloc_size(v1);
    OUTLINED_FUNCTION_11_60(2 * v2 - 64);
    sub_242C3869C(v3, v4, v5, v6);
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_2_93();
    if (!v7)
      __break(1u);
  }
  OUTLINED_FUNCTION_9_0();
}

void sub_242C378AC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  uint64_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    if (!v5)
      goto LABEL_8;
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
      v8 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      _swift_stdlib_malloc_size(v8);
      OUTLINED_FUNCTION_17_54();
      v8[2] = v5;
      v8[3] = v9;
    }
    if (v4 != a3)
    {
      sub_242B6A61C(a2 + 8 * a3, v5);
LABEL_8:
      OUTLINED_FUNCTION_7_0();
      return;
    }
  }
  __break(1u);
}

void sub_242C37948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  size_t v32;
  char v33;

  OUTLINED_FUNCTION_37();
  a25 = v26;
  a26 = v28;
  v29 = *(_QWORD *)(v27 + 16);
  if (v29)
  {
    v30 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25722C910);
    v31 = (_QWORD *)OUTLINED_FUNCTION_2_0();
    v32 = _swift_stdlib_malloc_size(v31);
    v31[2] = v29;
    v31[3] = 2 * ((uint64_t)(v32 - 32) / 24);
    sub_242C38830((uint64_t)&a10, v31 + 4, v29, v30);
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_2_93();
    if (!v33)
      __break(1u);
  }
  OUTLINED_FUNCTION_9_0();
}

void sub_242C379E4()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  OUTLINED_FUNCTION_37();
  if (*(_QWORD *)(v0 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D0);
    v1 = (const void *)OUTLINED_FUNCTION_5_79();
    v2 = _swift_stdlib_malloc_size(v1);
    OUTLINED_FUNCTION_11_60(2 * ((uint64_t)(v2 - 32) / 32));
    sub_242C38B2C(v3, v4, v5, v6);
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_2_93();
    if (!v7)
      __break(1u);
  }
  OUTLINED_FUNCTION_9_0();
}

void sub_242C37A6C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    if (!v5)
      goto LABEL_8;
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722F1C0);
      v7 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      _swift_stdlib_malloc_size(v7);
      OUTLINED_FUNCTION_55_28();
      v7[2] = v5;
      v7[3] = v8;
    }
    if (v4 != a3)
    {
      sub_242B6A504();
LABEL_8:
      OUTLINED_FUNCTION_7_0();
      return;
    }
  }
  __break(1u);
}

void sub_242C37B08(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_8;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      _swift_stdlib_malloc_size(v3);
      OUTLINED_FUNCTION_17_54();
      v3[2] = v2;
      v3[3] = v4;
    }
    OUTLINED_FUNCTION_28_1();
    sub_242B6C7AC((uint64_t)(v3 + 4), v2, v1);
    v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_8:
    OUTLINED_FUNCTION_28_1();
    v2 = sub_242C48FC8();
    OUTLINED_FUNCTION_4_0();
  }
  OUTLINED_FUNCTION_9();
}

void sub_242C37BCC(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  size_t v5;

  if (a2)
  {
    if (a2 <= 0)
    {
      v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221110);
      v4 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      v5 = _swift_stdlib_malloc_size(v4);
      v4[2] = a2;
      v4[3] = 2 * ((uint64_t)(v5 - 32) / 4);
    }
    sub_242B6A500(a1, a2, v4 + 4);
  }
  OUTLINED_FUNCTION_9();
}

void sub_242C37C54()
{
  sub_242C37E88();
}

uint64_t sub_242C37C68(uint64_t a1, uint64_t a2)
{
  return sub_242C37C74(a1, a2, (uint64_t (*)(_BYTE *, _QWORD *, uint64_t, uint64_t, uint64_t))sub_242C38F40);
}

uint64_t sub_242C37C74(uint64_t result, uint64_t a2, uint64_t (*a3)(_BYTE *, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v3)
      return MEMORY[0x24BEE4AF8];
    v6 = result;
    if (v3 <= 0)
    {
      v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
      v7 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      _swift_stdlib_malloc_size(v7);
      OUTLINED_FUNCTION_54_26();
      v7[2] = v3;
      v7[3] = v8;
    }
    result = a3(v9, v7 + 4, v3, v6, a2);
    if (result == v3)
      return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

void sub_242C37D2C()
{
  sub_242C37E88();
}

void sub_242C37D40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_242C37D54(a1, a2, a3, a4, &qword_257221168, (void (*)(uint64_t, uint64_t, _QWORD *))sub_242B6A808);
}

void sub_242C37D54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *))
{
  unint64_t v6;
  uint64_t v7;
  _QWORD *v11;
  uint64_t v12;

  v6 = a4 >> 1;
  v7 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    if (v7 <= 0)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)OUTLINED_FUNCTION_5_79();
      _swift_stdlib_malloc_size(v11);
      OUTLINED_FUNCTION_54_26();
      v11[2] = v7;
      v11[3] = v12;
    }
    if (v6 != a3)
    {
      a6(a2 + 8 * a3, v7, v11 + 4);
LABEL_9:
      OUTLINED_FUNCTION_7_0();
      return;
    }
  }
  __break(1u);
}

void sub_242C37DF0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221120);
    v3 = (_QWORD *)OUTLINED_FUNCTION_5_79();
    v4 = _swift_stdlib_malloc_size(v3);
    v3[2] = v1;
    v3[3] = 2 * ((uint64_t)(v4 - 32) / 8);
    v5 = OUTLINED_FUNCTION_0_2();
    v13 = OUTLINED_FUNCTION_42_36(v5, v6, v7, v8, v9, v10, v11, v12, v17);
    sub_242C391D8(v13, v14, v15, v16);
    OUTLINED_FUNCTION_44_32();
    if (a1 != v1)
      __break(1u);
  }
  OUTLINED_FUNCTION_21_1();
}

void sub_242C37E74()
{
  sub_242C37E88();
}

void sub_242C37E88()
{
  uint64_t *v0;
  void (*v1)(void);
  uint64_t v2;
  void (*v3)(void);
  const void *v4;
  uint64_t v5;
  char v6;

  OUTLINED_FUNCTION_37();
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(v0);
    v4 = (const void *)OUTLINED_FUNCTION_5_79();
    _swift_stdlib_malloc_size(v4);
    OUTLINED_FUNCTION_55_28();
    OUTLINED_FUNCTION_11_60(v5);
    v3();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_2_93();
    if (!v6)
      __break(1u);
  }
  OUTLINED_FUNCTION_9_0();
}

_QWORD *sub_242C37F04(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a5 == a4)
    {
LABEL_5:
      a3 = 0;
      goto LABEL_6;
    }
    if (a5 >= a4)
    {
      if (a5 <= a4)
      {
LABEL_17:
        __break(1u);
LABEL_18:
        v5 = a5;
        a3 = a5 - a4;
      }
      else
      {
        v6 = a3 - 1;
        v5 = a4 + 1;
        while (1)
        {
          *a2 = v5 - 1;
          if (!v6)
            break;
          if (a5 == v5)
            goto LABEL_18;
          ++a2;
          --v6;
          v7 = v5 >= a4 && v5 < a5;
          ++v5;
          if (!v7)
            goto LABEL_17;
        }
      }
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

_QWORD *sub_242C37F88(_QWORD *result, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v3;
  v5 = *(_QWORD *)(*v3 + 16);
  if (!a2)
  {
    v7 = *(_QWORD *)(*v3 + 16);
    v5 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    v7 = *(_QWORD *)(*v3 + 16);
LABEL_13:
    v5 = a3;
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v5)
    {
      v6 = 0;
      while (v5 + v6 <= *(_QWORD *)(v4 + 16))
      {
        *a2 = *(_QWORD *)(v4 + 8 * v5 + 24 + 8 * v6);
        if (!(a3 - 1 + v6))
        {
          v7 = v5 + v6 - 1;
          goto LABEL_13;
        }
        ++a2;
        --v6;
        if (!(v5 + v6))
          goto LABEL_9;
      }
      __break(1u);
      goto LABEL_16;
    }
LABEL_9:
    v7 = 0;
LABEL_14:
    *result = v4;
    result[1] = v7;
    return (_QWORD *)v5;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_242C3801C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_retain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_242C38214(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t Strong;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t ObjectType;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD v27[10];
  _QWORD v28[3];
  uint64_t v29;
  char v30;
  char v31[8];

  OUTLINED_FUNCTION_2_34();
  v7 = *(_QWORD *)(v3 + 24);
  OUTLINED_FUNCTION_74();
  result = swift_release();
  if (!a2)
    goto LABEL_25;
  if (!a3)
  {
    v10 = 0;
    goto LABEL_27;
  }
  if (a3 < 0)
  {
    __break(1u);
    return result;
  }
  v9 = *(_QWORD *)(v7 + 16);
  if (!v9)
  {
LABEL_25:
    v10 = 0;
    a3 = 0;
    goto LABEL_27;
  }
  v10 = 0;
  v11 = 0;
  v12 = v7 + 32;
  v13 = 1;
  while (2)
  {
    v25 = a2;
    v26 = v11;
    v24 = v13;
    v14 = v12 + 8 * v10;
    while (1)
    {
      v15 = v10;
      v10 = *(_QWORD *)(v7 + 16);
      if (v15 >= v10)
      {
        __break(1u);
        goto LABEL_29;
      }
      sub_242B8968C(v14, (uint64_t)v31);
      Strong = swift_weakLoadStrong();
      if (Strong)
        break;
      OUTLINED_FUNCTION_26_53();
LABEL_20:
      v10 = v15 + 1;
      v14 += 8;
      if ((uint64_t)(v15 + 1) >= v9)
      {
        v10 = v15 + 1;
        a3 = v26;
        goto LABEL_27;
      }
    }
    v17 = Strong;
    if (*(uint64_t *)(Strong + 32) <= 0)
      goto LABEL_18;
    swift_retain();
    v18 = OUTLINED_FUNCTION_45_26();
    objc_msgSend(v18, sel_lock);

    OUTLINED_FUNCTION_2_34();
    sub_242A6FF34(v17 + 40, (uint64_t)v28);
    if (v30)
    {
      if (v30 == 1)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        sub_242A6FFE8((uint64_t)&v29);
      }
      else
      {
        sub_242A6FF70((uint64_t)v28);
      }
      v22 = OUTLINED_FUNCTION_45_26();
      objc_msgSend(v22, sel_unlock);
      OUTLINED_FUNCTION_19_5();

LABEL_18:
      OUTLINED_FUNCTION_26_53();
LABEL_19:
      OUTLINED_FUNCTION_19_5();
      goto LABEL_20;
    }
    sub_242A8D620((uint64_t)v28, (uint64_t)v27);
    v19 = v27[1];
    ObjectType = swift_getObjectType();
    LOBYTE(v19) = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 56))(ObjectType, v19);
    sub_242A6FFE8((uint64_t)v27);
    v21 = OUTLINED_FUNCTION_45_26();
    objc_msgSend(v21, sel_unlock);
    OUTLINED_FUNCTION_19_5();

    OUTLINED_FUNCTION_26_53();
    if ((v19 & 1) != 0)
      goto LABEL_19;
    v23 = v24;
    *v25 = v17;
    v10 = v15 + 1;
    if (v24 == a3)
    {
LABEL_29:
      v23 = a3;
      break;
    }
    v13 = v24 + 1;
    a2 = v25 + 1;
    v11 = v24;
    v12 = v7 + 32;
    if ((uint64_t)v10 < v9)
      continue;
    break;
  }
  a3 = v23;
LABEL_27:
  *a1 = v7;
  a1[1] = v10;
  return a3;
}

uint64_t sub_242C38470(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v6 = sub_242ACDDF8();
  v8 = v7;
  swift_release();
  if (!a2)
  {
LABEL_7:
    a3 = 0;
    goto LABEL_8;
  }
  if (a3)
  {
    if (a3 < 0)
      goto LABEL_25;
    if (v6 >> 62)
      goto LABEL_26;
    v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      v10 = v9 - v8;
      if (v9 == v8)
        goto LABEL_7;
      v12 = 0;
      while (1)
      {
        v13 = v8 + v12;
        if ((v6 & 0xC000000000000001) != 0)
        {
          v14 = MEMORY[0x2494EC84C](v13, v6);
        }
        else
        {
          if ((v13 & 0x8000000000000000) != 0)
            goto LABEL_23;
          if (v13 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_24;
          v14 = swift_retain();
        }
        if (!(v8 - 0x7FFFFFFFFFFFFFFFLL + v12))
          break;
        *(_QWORD *)(a2 + 8 * v12) = v14;
        if (a3 - 1 == v12)
        {
          v8 += v12 + 1;
          goto LABEL_8;
        }
        if (v12 + 1 >= a3)
          goto LABEL_22;
        if (v10 == ++v12)
        {
          v8 = v9;
          a3 = v10;
          goto LABEL_8;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      sub_242C480E0();
      v9 = sub_242C48FC8();
      swift_bridgeObjectRelease();
    }
  }
LABEL_8:
  *a1 = v6;
  a1[1] = v8;
  return a3;
}

uint64_t sub_242C385E0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (!a2)
    goto LABEL_11;
  if (!a3)
    goto LABEL_12;
  if (a3 < 0)
  {
    __break(1u);
LABEL_15:
    OUTLINED_FUNCTION_2_81();
    OUTLINED_FUNCTION_4_18();
  }
  v4 = *(_QWORD *)(a4 + 16);
  if (!v4)
  {
LABEL_11:
    a3 = 0;
    goto LABEL_12;
  }
  v5 = 0;
  while (1)
  {
    *(_QWORD *)(a2 + 8 * v5) = *(_QWORD *)(a4 + 32 + 8 * v5);
    if (a3 - 1 == v5)
      break;
    v6 = *(_QWORD *)(a4 + 16);
    if (v5 + 1 == v6)
    {
      a3 = v5 + 1;
      break;
    }
    if (v4 - 1 == v5)
      goto LABEL_15;
    if (++v5 >= v6)
    {
      __break(1u);
      goto LABEL_11;
    }
  }
LABEL_12:
  *a1 = a4;
  a1[1] = a3;
  return a3;
}

_QWORD *sub_242C3869C(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_36:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
    if (v9 == a3)
      goto LABEL_36;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_18;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    v13 = v8;
LABEL_18:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_19;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    v13 = v15;
    goto LABEL_18;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_14;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_17;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_242C38830(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v22;
    v11[1] = v21;
    v11[2] = v23;
    if (v13 == v10)
    {
      sub_242C480E0();
      goto LABEL_38;
    }
    v11 += 3;
    result = sub_242C480E0();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_242C38A34(void *a1, char *a2, uint64_t a3)
{
  const void *v3;
  const void *v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE v96[240];

  v4 = v3;
  OUTLINED_FUNCTION_27_41(&v71, v4);
  bzero(&v41, 0xECuLL);
  sub_242C39D68((uint64_t)&v71, (uint64_t)&v41);
  v8 = OUTLINED_FUNCTION_27_41(v96, &v41);
  if (!a2 || !a3)
  {
LABEL_11:
    OUTLINED_FUNCTION_27_41(a1, v96);
    OUTLINED_FUNCTION_7_0();
    return;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v16 = OUTLINED_FUNCTION_56_24((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
            v52,
            v53,
            v54,
            v55,
            v56,
            v57,
            v58,
            v59,
            v60,
            v61,
            v62,
            v63,
            v64,
            v65,
            v66,
            v67,
            v68,
            v69,
            v70,
            v71,
            v72,
            v73,
            v74,
            v75,
            v76,
            v77,
            v78,
            v79,
            v80,
            v81,
            v82,
            v83,
            v84,
            v85,
            v86,
            v87,
            v88,
            v89,
            v90,
            v91,
            v92,
            v93,
            v94,
            v95);
    OUTLINED_FUNCTION_57_28(v16, v17, v18, v19, v20, v21, v22, v23, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      v87,
      v88,
      v89,
      v90,
      v91,
      v92,
      v93,
      v94,
      v95);
    if (v41)
    {
      v24 = 0;
      while (1)
      {
        OUTLINED_FUNCTION_27_41(&v71, &v41);
        v25 = OUTLINED_FUNCTION_27_41(a2, &v71);
        if (a3 - 1 == v24)
          break;
        a2 += 240;
        v33 = OUTLINED_FUNCTION_56_24((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
                v52,
                v53,
                v54,
                v55,
                v56,
                v57,
                v58,
                v59,
                v60,
                v61,
                v62,
                v63,
                v64,
                v65,
                v66,
                v67,
                v68,
                v69,
                v70,
                v71,
                v72,
                v73,
                v74,
                v75,
                v76,
                v77,
                v78,
                v79,
                v80,
                v81,
                v82,
                v83,
                v84,
                v85,
                v86,
                v87,
                v88,
                v89,
                v90,
                v91,
                v92,
                v93,
                v94,
                v95);
        OUTLINED_FUNCTION_57_28(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
          v52,
          v53,
          v54,
          v55,
          v56,
          v57,
          v58,
          v59,
          v60,
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          v68,
          v69,
          v70,
          v71,
          v72,
          v73,
          v74,
          v75,
          v76,
          v77,
          v78,
          v79,
          v80,
          v81,
          v82,
          v83,
          v84,
          v85,
          v86,
          v87,
          v88,
          v89,
          v90,
          v91,
          v92,
          v93,
          v94,
          v95);
        ++v24;
        if (!v41)
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      sub_242AB8F10((uint64_t)&v41, &qword_257222958);
    }
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t sub_242C38B2C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v24 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(_QWORD *)(a4 + 48) + 24 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    v23 = *(_QWORD *)(v20 + 8);
    v22 = *(_QWORD *)(v20 + 16);
    *(_DWORD *)v11 = *(_DWORD *)v20;
    *(_QWORD *)(v11 + 8) = v23;
    *(_QWORD *)(v11 + 16) = v22;
    *(_QWORD *)(v11 + 24) = v21;
    if (v13 == v10)
    {
      sub_242C480E0();
      goto LABEL_38;
    }
    v11 += 32;
    result = sub_242C480E0();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          v18 = *(_QWORD *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            v17 = v12;
            goto LABEL_18;
          }
          v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            v9 = 0;
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v17 >= v14)
              {
                v9 = 0;
                v12 = v14 - 1;
                goto LABEL_37;
              }
              v18 = *(_QWORD *)(v6 + 8 * v17);
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_242C38D40(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *v11 = *(_OWORD *)(*(_QWORD *)(a4 + 56) + 16 * v16);
    if (v13 == v10)
    {
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_unknownObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

_QWORD *sub_242C38F40(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
    goto LABEL_20;
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4)
    goto LABEL_21;
  if (a5 > a4)
  {
    v5 = a4 + 1;
    *a2 = a4;
    v6 = a3 - 1;
    if (a3 == 1)
      goto LABEL_7;
    v7 = a2 + 1;
    while (v6)
    {
      if (a5 == v5)
      {
        v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
      if (v5 >= a5)
        goto LABEL_19;
      v8 = v5 + 1;
      *v7++ = v5++;
      if (!--v6)
      {
        v5 = v8;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_242C38FDC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (uint64_t *)(*(_QWORD *)(a4 + 56) + 16 * v16);
    v21 = *v20;
    v22 = v20[1];
    *v11 = v21;
    v11[1] = v22;
    if (v13 == v10)
    {
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_unknownObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_242C391D8(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a4 + 16);
  if (a2)
  {
    if (a3)
    {
      if (a3 < 0)
      {
        __break(1u);
      }
      else if (v4)
      {
        v5 = 0;
        while (1)
        {
          v6 = v4 + v5 - 1;
          *a2 = *(_QWORD *)(a4 + 8 * v4 + 24 + 8 * v5);
          if (!(a3 - 1 + v5))
            goto LABEL_12;
          if (v4 + v5 == 1)
            goto LABEL_13;
          ++a2;
          --v5;
          if (v4 + v5 > *(_QWORD *)(a4 + 16))
          {
            __break(1u);
            goto LABEL_10;
          }
        }
      }
      v6 = 0;
      goto LABEL_13;
    }
    v6 = *(_QWORD *)(a4 + 16);
LABEL_12:
    v4 = a3;
    goto LABEL_13;
  }
LABEL_10:
  v6 = v4;
  v4 = 0;
LABEL_13:
  *a1 = a4;
  a1[1] = v6;
  return v4;
}

uint64_t sub_242C3926C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      sub_242C480E0();
      goto LABEL_38;
    }
    v11 += 2;
    result = sub_242C480E0();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_242C39468(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_242BEC2F4();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_242C394D0(v5);
  *a1 = v2;
}

void sub_242C394D0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  char v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;

  v3 = a1[1];
  v4 = sub_242C491C0();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_242C39AA0(0, v3, 1, a1);
      return;
    }
    goto LABEL_124;
  }
  v5 = v4;
  sub_242A85D48(v3 / 2);
  v85 = a1;
  v86 = v6;
  v90 = v7;
  v88 = v3;
  if (v3 <= 0)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v27 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_90:
    if (v27 < 2)
    {
LABEL_101:
      swift_bridgeObjectRelease();
      if (v88 >= -1)
      {
        *(_QWORD *)(v86 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_129;
    }
    v78 = *v85;
    while (1)
    {
      v79 = v27 - 2;
      if (v27 < 2)
        break;
      if (!v78)
        goto LABEL_133;
      v80 = *(_QWORD *)&v10[16 * v79 + 32];
      v81 = *(_QWORD *)&v10[16 * v27 + 24];
      sub_242C39AF8((uint64_t *)(v78 + 8 * v80), (uint64_t *)(v78 + 8 * *(_QWORD *)&v10[16 * v27 + 16]), v78 + 8 * v81, v90);
      if (v1)
        goto LABEL_86;
      if (v81 < v80)
        goto LABEL_119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = sub_242BB9110((uint64_t)v10);
      if (v79 >= *((_QWORD *)v10 + 2))
        goto LABEL_120;
      v82 = &v10[16 * v79 + 32];
      *(_QWORD *)v82 = v80;
      *((_QWORD *)v82 + 1) = v81;
      v83 = *((_QWORD *)v10 + 2);
      if (v27 > v83)
        goto LABEL_121;
      memmove(&v10[16 * v27 + 16], &v10[16 * v27 + 32], 16 * (v83 - v27));
      *((_QWORD *)v10 + 2) = v83 - 1;
      v27 = v83 - 1;
      if (v83 <= 2)
        goto LABEL_101;
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return;
  }
  v8 = 0;
  v9 = *a1;
  v84 = *a1 - 8;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v87 = v5;
  v89 = *a1;
  while (1)
  {
    v11 = v8++;
    if (v8 < v3)
    {
      v12 = *(_QWORD *)(v9 + 8 * v8);
      v13 = *(_QWORD *)(v9 + 8 * v11);
      v8 = v11 + 2;
      if (v11 + 2 < v3)
      {
        v14 = v12;
        while (1)
        {
          v15 = *(_QWORD *)(v9 + 8 * v8);
          if (v13 < v12 == v14 >= v15)
            break;
          ++v8;
          v14 = v15;
          if (v8 >= v3)
          {
            v8 = v3;
            break;
          }
        }
      }
      if (v13 < v12)
      {
        if (v8 < v11)
          goto LABEL_126;
        if (v11 < v8)
        {
          v16 = v8 - 1;
          v17 = v11;
          do
          {
            if (v17 != v16)
            {
              if (!v9)
                goto LABEL_132;
              v18 = *(_QWORD *)(v9 + 8 * v17);
              *(_QWORD *)(v9 + 8 * v17) = *(_QWORD *)(v9 + 8 * v16);
              *(_QWORD *)(v9 + 8 * v16) = v18;
            }
            v58 = ++v17 < v16--;
          }
          while (v58);
        }
      }
    }
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v11))
        goto LABEL_123;
      if (v8 - v11 < v5)
      {
        v19 = v11 + v5;
        if (__OFADD__(v11, v5))
          goto LABEL_127;
        if (v19 >= v3)
          v19 = v3;
        if (v19 < v11)
          goto LABEL_128;
        if (v8 != v19)
        {
          v20 = (uint64_t *)(v84 + 8 * v8);
          do
          {
            v21 = *(_QWORD *)(v9 + 8 * v8);
            v22 = v11;
            v23 = v20;
            do
            {
              v24 = *v23;
              if (*v23 >= v21)
                break;
              if (!v9)
                goto LABEL_130;
              *v23 = v21;
              v23[1] = v24;
              --v23;
              ++v22;
            }
            while (v8 != v22);
            ++v8;
            ++v20;
          }
          while (v8 != v19);
          v8 = v19;
        }
      }
    }
    if (v8 < v11)
      goto LABEL_122;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_242BB9024(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v26 = *((_QWORD *)v10 + 2);
    v25 = *((_QWORD *)v10 + 3);
    v27 = v26 + 1;
    v9 = v89;
    if (v26 >= v25 >> 1)
    {
      v77 = sub_242BB9024((char *)(v25 > 1), v26 + 1, 1, v10);
      v9 = v89;
      v10 = v77;
    }
    *((_QWORD *)v10 + 2) = v27;
    v28 = v10 + 32;
    v29 = &v10[16 * v26 + 32];
    *(_QWORD *)v29 = v11;
    *((_QWORD *)v29 + 1) = v8;
    if (v26)
      break;
    v27 = 1;
LABEL_81:
    v5 = v87;
    v3 = v88;
    if (v8 >= v88)
      goto LABEL_90;
  }
  while (1)
  {
    v30 = v27 - 1;
    if (v27 >= 4)
    {
      v35 = &v28[16 * v27];
      v36 = *((_QWORD *)v35 - 8);
      v37 = *((_QWORD *)v35 - 7);
      v41 = __OFSUB__(v37, v36);
      v38 = v37 - v36;
      if (v41)
        goto LABEL_107;
      v40 = *((_QWORD *)v35 - 6);
      v39 = *((_QWORD *)v35 - 5);
      v41 = __OFSUB__(v39, v40);
      v33 = v39 - v40;
      v34 = v41;
      if (v41)
        goto LABEL_108;
      v42 = v27 - 2;
      v43 = &v28[16 * v27 - 32];
      v45 = *(_QWORD *)v43;
      v44 = *((_QWORD *)v43 + 1);
      v41 = __OFSUB__(v44, v45);
      v46 = v44 - v45;
      if (v41)
        goto LABEL_109;
      v41 = __OFADD__(v33, v46);
      v47 = v33 + v46;
      if (v41)
        goto LABEL_111;
      if (v47 >= v38)
      {
        v65 = &v28[16 * v30];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v41 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v41)
          goto LABEL_117;
        v58 = v33 < v68;
        goto LABEL_70;
      }
    }
    else
    {
      if (v27 != 3)
      {
        v59 = *((_QWORD *)v10 + 4);
        v60 = *((_QWORD *)v10 + 5);
        v41 = __OFSUB__(v60, v59);
        v52 = v60 - v59;
        v53 = v41;
        goto LABEL_64;
      }
      v32 = *((_QWORD *)v10 + 4);
      v31 = *((_QWORD *)v10 + 5);
      v41 = __OFSUB__(v31, v32);
      v33 = v31 - v32;
      v34 = v41;
    }
    if ((v34 & 1) != 0)
      goto LABEL_110;
    v42 = v27 - 2;
    v48 = &v28[16 * v27 - 32];
    v50 = *(_QWORD *)v48;
    v49 = *((_QWORD *)v48 + 1);
    v51 = __OFSUB__(v49, v50);
    v52 = v49 - v50;
    v53 = v51;
    if (v51)
      goto LABEL_112;
    v54 = &v28[16 * v30];
    v56 = *(_QWORD *)v54;
    v55 = *((_QWORD *)v54 + 1);
    v41 = __OFSUB__(v55, v56);
    v57 = v55 - v56;
    if (v41)
      goto LABEL_114;
    if (__OFADD__(v52, v57))
      goto LABEL_116;
    if (v52 + v57 >= v33)
    {
      v58 = v33 < v57;
LABEL_70:
      if (v58)
        v30 = v42;
      goto LABEL_72;
    }
LABEL_64:
    if ((v53 & 1) != 0)
      goto LABEL_113;
    v61 = &v28[16 * v30];
    v63 = *(_QWORD *)v61;
    v62 = *((_QWORD *)v61 + 1);
    v41 = __OFSUB__(v62, v63);
    v64 = v62 - v63;
    if (v41)
      goto LABEL_115;
    if (v64 < v52)
      goto LABEL_81;
LABEL_72:
    v69 = v10;
    v70 = v30 - 1;
    if (v30 - 1 >= v27)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v9)
      goto LABEL_131;
    v71 = &v28[16 * v70];
    v72 = *(_QWORD *)v71;
    v73 = v28;
    v74 = &v28[16 * v30];
    v75 = *((_QWORD *)v74 + 1);
    sub_242C39AF8((uint64_t *)(v9 + 8 * *(_QWORD *)v71), (uint64_t *)(v9 + 8 * *(_QWORD *)v74), v9 + 8 * v75, v90);
    if (v1)
      break;
    if (v75 < v72)
      goto LABEL_104;
    if (v30 > *((_QWORD *)v69 + 2))
      goto LABEL_105;
    *(_QWORD *)v71 = v72;
    *(_QWORD *)&v73[16 * v70 + 8] = v75;
    v76 = *((_QWORD *)v69 + 2);
    if (v30 >= v76)
      goto LABEL_106;
    v10 = v69;
    v27 = v76 - 1;
    memmove(v74, v74 + 16, 16 * (v76 - 1 - v30));
    v28 = v73;
    *((_QWORD *)v69 + 2) = v76 - 1;
    v9 = v89;
    if (v76 <= 2)
      goto LABEL_81;
  }
LABEL_86:
  swift_bridgeObjectRelease();
  if (v88 < -1)
    goto LABEL_125;
  *(_QWORD *)(v86 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_242C39AA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v6 = *(_QWORD *)(v4 + 8 * a3);
      v7 = result;
      v8 = (uint64_t *)v5;
      do
      {
        v9 = *v8;
        if (*v8 >= v6)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_242C39AF8(uint64_t *a1, uint64_t *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  BOOL v15;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = (char *)a2 - (char *)a1;
  v9 = a2 - a1;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v9 >= v11)
  {
    sub_242BC197C(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v12 = &v4[v11];
    if (v7 >= v6 || v10 < 8)
      goto LABEL_39;
    v18 = (uint64_t *)(a3 - 8);
    while (1)
    {
      v19 = v18 + 1;
      v20 = *(v6 - 1);
      if (v20 >= *(v12 - 1))
      {
        v22 = v19 != v12 || v18 >= v12;
        v20 = *--v12;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v21 = v19 != v6 || v18 >= v6;
        --v6;
        if (!v21)
          goto LABEL_35;
      }
      *v18 = v20;
LABEL_35:
      --v18;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_39;
    }
  }
  sub_242BC197C(a1, a2 - a1, a4);
  v12 = &v4[v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v14 = *v6;
      if (*v4 < *v6)
        break;
      v14 = *v4;
      v15 = v7 == v4++;
      if (!v15)
        goto LABEL_11;
LABEL_12:
      ++v7;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_17;
    }
    v15 = v7 == v6++;
    if (v15)
      goto LABEL_12;
LABEL_11:
    *v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  sub_242BC197C(v4, v12 - v4, v6);
  return 1;
}

char *sub_242C39C70(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[8 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 8 * a2);
  return __src;
}

uint64_t sub_242C39C9C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2 < 0)
  {
    __break(1u);
  }
  else if (a2)
  {
    v3 = result;
    result = sub_242C485CC();
    v4 = 0;
    *(_QWORD *)(result + 16) = a2;
    do
    {
      v5 = result + 8 * v4++;
      *(_QWORD *)(v5 + 32) = v3;
    }
    while (a2 != v4);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

ValueMetadata *type metadata accessor for ShapeInference()
{
  return &type metadata for ShapeInference;
}

uint64_t sub_242C39D10@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v6;

  result = sub_242C3660C(*a1, a1[1], *a2);
  if (!v3)
  {
    *(_QWORD *)a3 = result;
    *(_BYTE *)(a3 + 8) = v6 & 1;
  }
  return result;
}

uint64_t sub_242C39D50@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_242C39D10(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t sub_242C39D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257222958);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_242C39DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257222958);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_93()
{
  return sub_242A6FF2C();
}

void OUTLINED_FUNCTION_3_84(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_242A5DEE0(a1 > 1, v2, 1, v1);
}

void OUTLINED_FUNCTION_4_78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_242A5DEE0(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_5_79()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_11_60(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = a1;
}

uint64_t OUTLINED_FUNCTION_14_47()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_19_45()
{
  return sub_242C48314();
}

uint64_t OUTLINED_FUNCTION_21_49()
{
  return sub_242C491CC();
}

uint64_t OUTLINED_FUNCTION_26_53()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_242AB8F10(v1 - 120, v0);
}

void *OUTLINED_FUNCTION_27_41(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xECuLL);
}

void OUTLINED_FUNCTION_32_43(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_242A5DFBC(a1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_34_44()
{
  return sub_242C491CC();
}

uint64_t OUTLINED_FUNCTION_41_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return a12;
}

uint64_t *OUTLINED_FUNCTION_42_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_44_32()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_45_26()
{
  return sub_242BCA40C();
}

void OUTLINED_FUNCTION_47_31(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_242A5DEE0(a1, a2, a3, v3);
}

void OUTLINED_FUNCTION_49_26()
{
  sub_242A5B894();
}

void OUTLINED_FUNCTION_53_24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_242A5DEE0(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_56_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  return sub_242C39DB0((uint64_t)&a69, (uint64_t)&a9);
}

void OUTLINED_FUNCTION_57_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  bzero(&a69, 0xECuLL);
}

uint64_t OUTLINED_FUNCTION_58_17(uint64_t a1)
{
  return TensorShape.subscript.getter(a1);
}

uint64_t OUTLINED_FUNCTION_60_26(uint64_t a1)
{
  return TensorShape.subscript.getter(a1);
}

uint64_t OUTLINED_FUNCTION_62_21()
{
  return sub_242C48314();
}

void OUTLINED_FUNCTION_64_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_242C3626C(0, 0, a3);
}

uint64_t sub_242C39FF4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_242C3A000@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void Layer<>.compiled(forInput:options:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[8];
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  OUTLINED_FUNCTION_50_27();
  v13 = v1;
  v9[0] = v2;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  sub_242A6B598(v6, v0, (uint64_t)&v13, (uint64_t)v9, (uint64_t (*)(uint64_t))sub_242C3C64C, 0, (uint64_t)sub_242C3C648, 0, (uint64_t)&type metadata for Tensor, (uint64_t)&type metadata for Tensor, v7, v8);
}

{
  sub_242C3A3C8();
}

{
  sub_242C3A290();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[32];

  OUTLINED_FUNCTION_6_80();
  OUTLINED_FUNCTION_38_35();
  v2 = OUTLINED_FUNCTION_3_85();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572231A8);
  OUTLINED_FUNCTION_2_94(v3, v4, v5, (uint64_t)v8, (uint64_t (*)(uint64_t))sub_242C3C650, v6, (uint64_t)sub_242C3B328, v7, v2, v3, v1, v0);
}

{
  sub_242C3A290();
}

{
  sub_242C3A3C8();
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[8];
  uint64_t v12;
  uint64_t v13;
  char v14;

  OUTLINED_FUNCTION_6_80();
  v11[0] = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v6 = OUTLINED_FUNCTION_3_85();
  OUTLINED_FUNCTION_2_94(v6, v7, v8, (uint64_t)v11, sub_242C3B870, v9, (uint64_t)sub_242C3C648, v10, v6, (uint64_t)&type metadata for Tensor, v1, v0);
}

void Layer<>.compiled(forInput:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[32];

  OUTLINED_FUNCTION_7_65(a1, a2, a3);
  v5 = OUTLINED_FUNCTION_3_85();
  OUTLINED_FUNCTION_2_94(v5, v6, v7, (uint64_t)v10, (uint64_t (*)(uint64_t))sub_242C3B36C, v8, (uint64_t)sub_242C3C648, v9, v5, (uint64_t)&type metadata for Tensor, v4, v3);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];

  OUTLINED_FUNCTION_7_65(a1, a2, a3);
  v5 = OUTLINED_FUNCTION_3_85();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257228E30);
  OUTLINED_FUNCTION_2_94(v6, v7, v8, (uint64_t)v11, (uint64_t (*)(uint64_t))sub_242C3B36C, v9, (uint64_t)sub_242C3B370, v10, v5, v6, v4, v3);
}

void Layer.compiled(forInput:options:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  char v22;

  OUTLINED_FUNCTION_6_80();
  v19[0] = v5;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v17 = v9;
  v18 = v10;
  v14 = v9;
  v15 = v10;
  v11 = OUTLINED_FUNCTION_40_43();
  v12 = OUTLINED_FUNCTION_40_43();
  OUTLINED_FUNCTION_20_59(v4, v0, v3, (uint64_t)v19, (uint64_t (*)(uint64_t))sub_242C3C658, (uint64_t)v16, (uint64_t)sub_242C3C654, (uint64_t)v13, v11, v12, v2, v1);
}

void sub_242C3A290()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[8];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  OUTLINED_FUNCTION_44_33();
  v5 = v4;
  OUTLINED_FUNCTION_50_27();
  v19 = v6;
  v15[0] = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
  OUTLINED_FUNCTION_42_37(v5, v0, (uint64_t)&v19, (uint64_t)v15, v1, 0, v13, v14, (uint64_t)&type metadata for Tensor, v12, v3, v2);
}

void Layer<>.compiled(forInput:options:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _BYTE v14[8];
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v9 = *a3;
  v10 = *((_QWORD *)a3 + 1);
  v11 = *((_QWORD *)a3 + 2);
  v12 = a3[24];
  v18 = a2;
  v14[0] = v9;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257228E30);
  OUTLINED_FUNCTION_20_59(a1, v5, (uint64_t)&v18, (uint64_t)v14, sub_242C3B488, 0, (uint64_t)sub_242C3B370, 0, v13, v13, a4, a5);
}

void sub_242C3A3C8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[48];
  _BYTE v12[32];

  OUTLINED_FUNCTION_44_33();
  v5 = v4;
  v7 = v6;
  OUTLINED_FUNCTION_38_35();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_42_37(v7, v0, v5, (uint64_t)v12, v1, (uint64_t)v11, v9, v10, AssociatedTypeWitness, (uint64_t)&type metadata for Tensor, v3, v2);
}

void Layer<>.compiled(forInput:options:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[32];
  uint64_t v9;
  _BYTE v10[32];
  _BYTE v11[8];

  OUTLINED_FUNCTION_9_76(a1, a2);
  v9 = v6;
  v7 = OUTLINED_FUNCTION_3_85();
  OUTLINED_FUNCTION_20_59(v5, v2, (uint64_t)v11, (uint64_t)v10, (uint64_t (*)(uint64_t))sub_242C3B680, 0, (uint64_t)sub_242C3B7F4, (uint64_t)v8, (uint64_t)&type metadata for Tensor, v7, v4, v3);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[40];
  _BYTE v8[32];
  _BYTE v9[8];

  OUTLINED_FUNCTION_9_76(a1, a2);
  v6 = OUTLINED_FUNCTION_3_85();
  OUTLINED_FUNCTION_20_59(v5, v2, (uint64_t)v9, (uint64_t)v8, (uint64_t (*)(uint64_t))sub_242C3C64C, 0, (uint64_t)sub_242C3B840, (uint64_t)v7, (uint64_t)&type metadata for Tensor, v6, v4, v3);
}

void Layer<>.compiled(forInput:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[16];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[8];
  uint64_t v28;
  uint64_t v29;
  char v30;

  v12 = *(_QWORD *)(a3 + 8);
  v13 = *(_QWORD *)(a3 + 16);
  v14 = *(_BYTE *)(a3 + 24);
  v27[0] = *(_BYTE *)a3;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v15 = OUTLINED_FUNCTION_40_43();
  v16 = OUTLINED_FUNCTION_40_43();
  OUTLINED_FUNCTION_20_59(a1, v7, a2, (uint64_t)v27, (uint64_t (*)(uint64_t))sub_242C3B828, (uint64_t)v22, (uint64_t)sub_242C3B834, (uint64_t)v17, v15, v16, a4, a5);
}

uint64_t sub_242C3A5BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  swift_retain();
  sub_242C480E0();
  sub_242C37E74();
  v2 = v1;
  swift_bridgeObjectRelease();
  v6 = v2;
  sub_242C3BCE4(&v6);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 24) = v6;
  v3 = sub_242C480E0();
  sub_242A706AC(v3);
  *(_QWORD *)(v0 + 16) = v4;
  swift_release();
  return v0;
}

uint64_t sub_242C3A650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  swift_retain();
  sub_242C480E0();
  sub_242C37E74();
  v2 = v1;
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_242C3BCE4(&v4);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = v4;
  swift_release();
  return v0;
}

uint64_t Function.description.getter()
{
  return sub_242B3E088();
}

uint64_t Function.customMirror.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];

  v1 = sub_242C493D0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572229D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v0;
  v8 = v0[1];
  v10 = v0[2];
  v9 = v0[3];
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v10;
  v13[5] = v9;
  v13[1] = MEMORY[0x24BEE4AF8];
  v11 = sub_242C493C4();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D8);
  sub_242C3B8A0();
  sub_242AA68AC((uint64_t)v3);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_242C49400();
}

void Function<>.inputTensorProperties.getter(_QWORD *a1, uint64_t a2)
{
  sub_242C3A968(a1, a2, (uint64_t (*)(void))sub_242BBBB3C);
}

void Function<>.outputTensorProperties.getter(_QWORD *a1, uint64_t a2)
{
  sub_242C3A968(a1, a2, (uint64_t (*)(void))sub_242BBBAA4);
}

void sub_242C3A968(_QWORD *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3();
  if (*(_QWORD *)(v5 + 16))
  {
    v6 = *(_QWORD *)(v5 + 48);
    swift_retain();
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v6 + 152);
    sub_242C480E0();
    v8 = swift_release();
    *a1 = v7;
    if (*(_QWORD *)(((uint64_t (*)(uint64_t))a3)(v8) + 16))
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_release();
      sub_242C21A14();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void Function<>.inputCount.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_25_52(*(_QWORD *)(a1 + 24), a4, *(_QWORD *)(a1 + 16));
  OUTLINED_FUNCTION_16_53();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

{
  OUTLINED_FUNCTION_0_100(a1, a2, a3, a4);
  OUTLINED_FUNCTION_16_53();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AA68()
{
  OUTLINED_FUNCTION_8_63();
  OUTLINED_FUNCTION_23_53();
}

void sub_242C3AA7C()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_1_43();
}

void Function<>.tensorProperties(forInputAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_27_42(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

{
  OUTLINED_FUNCTION_21_50(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AAC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a19)
  {
    OUTLINED_FUNCTION_1_88();
    if (v19)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_18_58();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_49_27();
    OUTLINED_FUNCTION_1_46();
  }
  else
  {
    __break(1u);
  }
}

void Function<>.outputCount.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_25_52(*(_QWORD *)(a1 + 24), a4, *(_QWORD *)(a1 + 16));
  OUTLINED_FUNCTION_16_53();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

{
  OUTLINED_FUNCTION_0_100(a1, a2, a3, a4);
  OUTLINED_FUNCTION_16_53();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AB7C()
{
  OUTLINED_FUNCTION_8_63();
  OUTLINED_FUNCTION_23_53();
}

void sub_242C3AB90()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_1_43();
}

void Function<>.tensorProperties(forOutputAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_27_42(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

{
  OUTLINED_FUNCTION_21_50(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3ABDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a19)
  {
    OUTLINED_FUNCTION_1_88();
    if (v19)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_18_58();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_49_27();
    OUTLINED_FUNCTION_1_46();
  }
  else
  {
    __break(1u);
  }
}

void sub_242C3AC80()
{
  OUTLINED_FUNCTION_8_63();
  OUTLINED_FUNCTION_23_53();
}

void sub_242C3AC94()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_309();
}

void Function<>.inputNames.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_100(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3ACD8()
{
  OUTLINED_FUNCTION_33_42();
  OUTLINED_FUNCTION_45_27();
  OUTLINED_FUNCTION_309();
}

void Function<>.tensorProperties(forInputNamed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_19_46(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a23)
  {
    OUTLINED_FUNCTION_1_88();
    if (v26)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_39_39();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_46_30();
    *v25 = a25;
    v25[1] = v27;
    v25[2] = v28;
  }
  else
  {
    *v25 = 0;
    v25[1] = 0;
    v25[2] = 0;
  }
  OUTLINED_FUNCTION_39_13();
}

void sub_242C3ADB4()
{
  OUTLINED_FUNCTION_11_61();
  JUMPOUT(0x242C3AD7CLL);
}

void sub_242C3ADF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a21)
  {
    OUTLINED_FUNCTION_1_88();
    if (v21)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_18_58();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_51_34();
    OUTLINED_FUNCTION_36_36();
  }
  else
  {
    __break(1u);
  }
}

void sub_242C3AE9C()
{
  OUTLINED_FUNCTION_8_63();
  OUTLINED_FUNCTION_23_53();
}

void sub_242C3AEB0()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_309();
}

void Function<>.outputNames.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_100(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_12_52();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AEF4()
{
  OUTLINED_FUNCTION_33_42();
  OUTLINED_FUNCTION_45_27();
  OUTLINED_FUNCTION_309();
}

uint64_t sub_242C3AF1C@<X0>(uint64_t a1@<X0>, char a2@<W6>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  result = sub_242A75648(*(_BYTE *)a1, a2);
  if ((result & 1) != 0)
  {
    result = sub_242C480E0();
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  *a3 = v5;
  a3[1] = v4;
  return result;
}

void Function<>.tensorProperties(forOutputNamed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_19_46(a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_13_66();
  OUTLINED_FUNCTION_13_29();
}

void sub_242C3AFB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a23)
  {
    OUTLINED_FUNCTION_1_88();
    if (v26)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_39_39();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_46_30();
    *v25 = a25;
    v25[1] = v27;
    v25[2] = v28;
  }
  else
  {
    *v25 = 0;
    v25[1] = 0;
    v25[2] = 0;
  }
  OUTLINED_FUNCTION_39_13();
}

void sub_242C3B030()
{
  OUTLINED_FUNCTION_11_61();
  JUMPOUT(0x242C3AFF8);
}

void sub_242C3B038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 8) != a2 || *(_QWORD *)(a1 + 16) != a3)
    sub_242C4925C();
  OUTLINED_FUNCTION_28_19();
}

void sub_242C3B0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  OUTLINED_FUNCTION_14_48();
  swift_bridgeObjectRelease();
  if (a21)
  {
    OUTLINED_FUNCTION_1_88();
    if (v21)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_15_59();
    }
    OUTLINED_FUNCTION_4_79();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_18_58();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_51_34();
    OUTLINED_FUNCTION_36_36();
  }
  else
  {
    __break(1u);
  }
}

void CompilationOptions.learningPhase.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void static CompilationOptions.default.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 46;
  *(_QWORD *)(a1 + 16) = 0xE100000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

void static CompilationOptions.inference.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 2;
  *(_QWORD *)(a1 + 8) = 46;
  *(_QWORD *)(a1 + 16) = 0xE100000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

void static Function.load(from:options:)()
{
  id v0;
  void *v1;
  unsigned int v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_242C47B58();
  v1 = (void *)sub_242C48224();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
    sub_242A59170();
  sub_242C48C38();
  swift_bridgeObjectRelease();
  sub_242C47B58();
  sub_242C48314();
  swift_bridgeObjectRelease();
  sub_242C48314();
  sub_242C48F5C();
  __break(1u);
}

void sub_242C3B2F4(uint64_t a1)
{
  uint64_t *v1;

  sub_242C3B6A0(a1, v1[2], v1[3], v1[4], (uint64_t)&associated type descriptor for Layer.Input, (void (*)(_QWORD, uint64_t, uint64_t, __n128))type metadata accessor for TensorCollectionInputParser, (void (*)(char *))sub_242BBCB0C);
}

void sub_242C3B32C()
{
  uint64_t v0;

  type metadata accessor for TensorArrayOutputParser(0);
  swift_allocObject();
  v0 = sub_242C480E0();
  sub_242BBE600(v0);
}

uint64_t sub_242C3B370(uint64_t a1)
{
  return sub_242C3B4A0(a1, &qword_25722F2E8, 24, (uint64_t (*)(uint64_t))sub_242C3A650);
}

void sub_242C3B3FC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_51();
  OUTLINED_FUNCTION_43_35();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for TensorKeyValuePairsInputParser();
}

void sub_242C3B470()
{
  OUTLINED_FUNCTION_28_52();
  sub_242BBCDD8();
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_242C3B488(uint64_t a1)
{
  return sub_242C3B4A0(a1, &qword_25722F2F0, 32, (uint64_t (*)(uint64_t))sub_242C3A5BC);
}

uint64_t sub_242C3B4A0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  swift_allocObject();
  v5 = sub_242C480E0();
  return a4(v5);
}

void sub_242C3B4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v11 - v8;
  type metadata accessor for KeyTensorPairsRepresentableInputParser(0, AssociatedTypeWitness, a4, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, AssociatedTypeWitness);
  sub_242BBD99C();
}

void sub_242C3B5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v12 - v9;
  type metadata accessor for KeyTensorPairsRepresentableOutputParser(0, AssociatedTypeWitness, a5, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, AssociatedTypeWitness);
  sub_242BBEF04();
}

uint64_t sub_242C3B660()
{
  type metadata accessor for TensorOutputParser(0);
  return swift_allocObject();
}

uint64_t sub_242C3B680()
{
  type metadata accessor for TensorInputParser(0);
  return swift_allocObject();
}

void sub_242C3B6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(_QWORD, uint64_t, uint64_t, __n128), void (*a7)(char *))
{
  uint64_t v7;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  OUTLINED_FUNCTION_22_51();
  OUTLINED_FUNCTION_43_35();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v15 - v13;
  a6(0, v7, a4, v12);
  OUTLINED_FUNCTION_28_52();
  a7(v14);
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_242C3B71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, uint64_t, __n128), uint64_t (*a6)(char *))
{
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;

  v9 = OUTLINED_FUNCTION_22_51();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v15 - v12;
  a5(0, v9, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  return a6(v13);
}

void sub_242C3B7C0(uint64_t a1)
{
  uint64_t *v1;

  sub_242C3B6A0(a1, v1[2], v1[3], v1[4], (uint64_t)&associated type descriptor for Layer.Input, (void (*)(_QWORD, uint64_t, uint64_t, __n128))type metadata accessor for KeyTensorPairsRepresentableInputParser, (void (*)(char *))sub_242BBD99C);
}

void sub_242C3B7F4(uint64_t a1)
{
  uint64_t *v1;

  sub_242C3B6A0(a1, v1[2], v1[3], v1[4], (uint64_t)&associated type descriptor for Layer.Output, (void (*)(_QWORD, uint64_t, uint64_t, __n128))type metadata accessor for KeyTensorPairsRepresentableOutputParser, (void (*)(char *))sub_242BBEF04);
}

void sub_242C3B828(uint64_t a1)
{
  uint64_t *v1;

  sub_242C3B4F0(a1, v1[2], v1[3], v1[4]);
}

void sub_242C3B834(uint64_t a1)
{
  uint64_t *v1;

  sub_242C3B5A8(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_242C3B840(uint64_t a1)
{
  uint64_t v1;

  return sub_242C3B71C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&associated type descriptor for Layer.Output, (void (*)(_QWORD, uint64_t, __n128))type metadata accessor for CustomOutputParser, (uint64_t (*)(char *))sub_242BBF478);
}

uint64_t sub_242C3B870(uint64_t a1)
{
  uint64_t v1;

  return sub_242C3B71C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&associated type descriptor for Layer.Input, (void (*)(_QWORD, uint64_t, __n128))type metadata accessor for CustomInputParser, (uint64_t (*)(char *))sub_242BBDF48);
}

unint64_t sub_242C3B8A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25722F1E0[0];
  if (!qword_25722F1E0[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25722F1D8);
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, qword_25722F1E0);
  }
  return result;
}

void sub_242C3B8E4(char *a1)
{
  sub_242A75648(*a1, 0);
  OUTLINED_FUNCTION_28_19();
}

uint64_t Function.CompilationError.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_242C480E0();
  return v1;
}

void sub_242C3B944(char *a1)
{
  sub_242A75648(*a1, 3);
  OUTLINED_FUNCTION_28_19();
}

uint64_t sub_242C3B974@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_242C3B9BC(a1, 0, a2);
}

uint64_t sub_242C3B98C(uint64_t a1)
{
  return sub_242C3B9E0(a1) & 1;
}

uint64_t sub_242C3B9A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_242C3B9BC(a1, 3, a2);
}

uint64_t sub_242C3B9BC@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  return sub_242C3AF1C(a1, a2, a3);
}

uint64_t sub_242C3B9E0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_242C3B038(a1, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
  return v2 & 1;
}

void sub_242C3BA08()
{
  sub_242C3B3FC();
}

_QWORD *sub_242C3BA28(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_242C3BA7C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_242C3BB08(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t type metadata accessor for Function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Function);
}

uint64_t initializeWithCopy for CompilationOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  sub_242C480E0();
  return a1;
}

uint64_t assignWithCopy for CompilationOptions(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  sub_242C480E0();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for CompilationOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompilationOptions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for CompilationOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CompilationOptions()
{
  return &type metadata for CompilationOptions;
}

uint64_t type metadata accessor for Function.CompilationError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Function.CompilationError);
}

void sub_242C3BCE4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_242BEC5CC();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_242C3BD4C(v5);
  *a1 = v2;
}

void sub_242C3BD4C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  BOOL v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;

  v3 = a1[1];
  v4 = sub_242C491C0();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_242C3C3B0(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_242A85D24(v3 / 2);
  v98 = v6;
  v99 = v3;
  v100 = v7;
  v96 = a1;
  if (v3 <= 0)
  {
    v101 = MEMORY[0x24BEE4AF8];
    v33 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v33 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v98 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v88 = *v96;
    while (1)
    {
      v89 = v33 - 2;
      if (v33 < 2)
        break;
      if (!v88)
        goto LABEL_153;
      v90 = (char *)v101;
      v91 = *(_QWORD *)(v101 + 32 + 16 * v89);
      v92 = *(_QWORD *)(v101 + 32 + 16 * (v33 - 1) + 8);
      sub_242C3C474((char *)(v88 + 16 * v91), (char *)(v88 + 16 * *(_QWORD *)(v101 + 32 + 16 * (v33 - 1))), v88 + 16 * v92, v100);
      if (v1)
        goto LABEL_106;
      if (v92 < v91)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v90 = sub_242BB9110(v101);
      if (v89 >= *((_QWORD *)v90 + 2))
        goto LABEL_140;
      v93 = &v90[16 * v89 + 32];
      *(_QWORD *)v93 = v91;
      *((_QWORD *)v93 + 1) = v92;
      v94 = *((_QWORD *)v90 + 2);
      if (v33 > v94)
        goto LABEL_141;
      memmove(&v90[16 * v33 + 16], &v90[16 * v33 + 32], 16 * (v94 - v33));
      v101 = (uint64_t)v90;
      *((_QWORD *)v90 + 2) = v94 - 1;
      v33 = v94 - 1;
      v3 = v99;
      if (v94 <= 2)
        goto LABEL_121;
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return;
  }
  v97 = v5;
  v8 = 0;
  v9 = *a1;
  v95 = *a1 + 8;
  v101 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v11 = (uint64_t *)(v9 + 16 * v8);
    v12 = *v11;
    v13 = v11[1];
    v14 = (_QWORD *)(v9 + 16 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_31;
      v16 = 0;
LABEL_13:
      v18 = (_QWORD *)(v95 + 16 * v17);
      do
      {
        v19 = (_QWORD *)(v9 + 16 * v8);
        if (*(v18 - 1) == *v19 && *v18 == v19[1])
        {
          if ((v16 & 1) != 0)
            goto LABEL_24;
        }
        else if (((v16 ^ sub_242C4925C()) & 1) != 0)
        {
          goto LABEL_23;
        }
        v18 += 2;
        v21 = v17 + 1;
        v8 = v17;
        v17 = v21;
      }
      while (v21 < v3);
      v17 = v21;
      goto LABEL_23;
    }
    v16 = sub_242C4925C();
    v17 = v10 + 2;
    if (v10 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v8 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v17 < v10)
      goto LABEL_148;
    if (v10 < v17)
    {
      v22 = 16 * v17;
      v23 = 16 * v10;
      v24 = v17;
      v25 = v10;
      do
      {
        if (v25 != --v24)
        {
          if (!v9)
            goto LABEL_152;
          v26 = v9 + v22;
          v27 = *(_QWORD *)(v9 + v23);
          v28 = *(_QWORD *)(v9 + v23 + 8);
          *(_OWORD *)(v9 + v23) = *(_OWORD *)(v9 + v22 - 16);
          *(_QWORD *)(v26 - 16) = v27;
          *(_QWORD *)(v26 - 8) = v28;
        }
        ++v25;
        v22 -= 16;
        v23 += 16;
      }
      while (v25 < v24);
    }
LABEL_31:
    v8 = v17;
LABEL_32:
    if (v8 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v8, v10))
      goto LABEL_143;
    if (v8 - v10 >= v97)
      goto LABEL_41;
    if (__OFADD__(v10, v97))
      goto LABEL_146;
    if (v10 + v97 >= v3)
      v29 = v3;
    else
      v29 = v10 + v97;
    if (v29 < v10)
      goto LABEL_147;
    if (v8 == v29)
    {
LABEL_41:
      v30 = (char *)v101;
    }
    else
    {
      v81 = (_QWORD *)(v9 + 16 * v8);
      v30 = (char *)v101;
      do
      {
        v82 = (uint64_t *)(v9 + 16 * v8);
        v83 = *v82;
        v84 = v82[1];
        v85 = v10;
        v86 = v81;
        do
        {
          v87 = v83 == *(v86 - 2) && v84 == *(v86 - 1);
          if (v87 || (sub_242C4925C() & 1) == 0)
            break;
          if (!v9)
            goto LABEL_150;
          v83 = *v86;
          v84 = v86[1];
          *(_OWORD *)v86 = *((_OWORD *)v86 - 1);
          *(v86 - 1) = v84;
          *(v86 - 2) = v83;
          v86 -= 2;
          ++v85;
        }
        while (v8 != v85);
        ++v8;
        v81 += 2;
      }
      while (v8 != v29);
      v8 = v29;
    }
    if (v8 < v10)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v30 = sub_242BB9024(0, *((_QWORD *)v30 + 2) + 1, 1, v30);
    v32 = *((_QWORD *)v30 + 2);
    v31 = *((_QWORD *)v30 + 3);
    v33 = v32 + 1;
    if (v32 >= v31 >> 1)
      v30 = sub_242BB9024((char *)(v31 > 1), v32 + 1, 1, v30);
    *((_QWORD *)v30 + 2) = v33;
    v34 = v30 + 32;
    v35 = &v30[16 * v32 + 32];
    *(_QWORD *)v35 = v10;
    *((_QWORD *)v35 + 1) = v8;
    v101 = (uint64_t)v30;
    if (v32)
      break;
    v33 = 1;
LABEL_90:
    v3 = v99;
    if (v8 >= v99)
      goto LABEL_110;
  }
  while (1)
  {
    v36 = v33 - 1;
    if (v33 >= 4)
    {
      v41 = &v34[16 * v33];
      v42 = *((_QWORD *)v41 - 8);
      v43 = *((_QWORD *)v41 - 7);
      v47 = __OFSUB__(v43, v42);
      v44 = v43 - v42;
      if (v47)
        goto LABEL_127;
      v46 = *((_QWORD *)v41 - 6);
      v45 = *((_QWORD *)v41 - 5);
      v47 = __OFSUB__(v45, v46);
      v39 = v45 - v46;
      v40 = v47;
      if (v47)
        goto LABEL_128;
      v48 = v33 - 2;
      v49 = &v34[16 * v33 - 32];
      v51 = *(_QWORD *)v49;
      v50 = *((_QWORD *)v49 + 1);
      v47 = __OFSUB__(v50, v51);
      v52 = v50 - v51;
      if (v47)
        goto LABEL_129;
      v47 = __OFADD__(v39, v52);
      v53 = v39 + v52;
      if (v47)
        goto LABEL_131;
      if (v53 >= v44)
      {
        v71 = &v34[16 * v36];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v47 = __OFSUB__(v72, v73);
        v74 = v72 - v73;
        if (v47)
          goto LABEL_137;
        v64 = v39 < v74;
        goto LABEL_79;
      }
    }
    else
    {
      if (v33 != 3)
      {
        v65 = *((_QWORD *)v30 + 4);
        v66 = *((_QWORD *)v30 + 5);
        v47 = __OFSUB__(v66, v65);
        v58 = v66 - v65;
        v59 = v47;
        goto LABEL_73;
      }
      v38 = *((_QWORD *)v30 + 4);
      v37 = *((_QWORD *)v30 + 5);
      v47 = __OFSUB__(v37, v38);
      v39 = v37 - v38;
      v40 = v47;
    }
    if ((v40 & 1) != 0)
      goto LABEL_130;
    v48 = v33 - 2;
    v54 = &v34[16 * v33 - 32];
    v56 = *(_QWORD *)v54;
    v55 = *((_QWORD *)v54 + 1);
    v57 = __OFSUB__(v55, v56);
    v58 = v55 - v56;
    v59 = v57;
    if (v57)
      goto LABEL_132;
    v60 = &v34[16 * v36];
    v62 = *(_QWORD *)v60;
    v61 = *((_QWORD *)v60 + 1);
    v47 = __OFSUB__(v61, v62);
    v63 = v61 - v62;
    if (v47)
      goto LABEL_134;
    if (__OFADD__(v58, v63))
      goto LABEL_136;
    if (v58 + v63 >= v39)
    {
      v64 = v39 < v63;
LABEL_79:
      if (v64)
        v36 = v48;
      goto LABEL_81;
    }
LABEL_73:
    if ((v59 & 1) != 0)
      goto LABEL_133;
    v67 = &v34[16 * v36];
    v69 = *(_QWORD *)v67;
    v68 = *((_QWORD *)v67 + 1);
    v47 = __OFSUB__(v68, v69);
    v70 = v68 - v69;
    if (v47)
      goto LABEL_135;
    if (v70 < v58)
      goto LABEL_90;
LABEL_81:
    v75 = v36 - 1;
    if (v36 - 1 >= v33)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v76 = &v34[16 * v75];
    v77 = *(_QWORD *)v76;
    v78 = &v34[16 * v36];
    v79 = *((_QWORD *)v78 + 1);
    sub_242C3C474((char *)(v9 + 16 * *(_QWORD *)v76), (char *)(v9 + 16 * *(_QWORD *)v78), v9 + 16 * v79, v100);
    if (v1)
      break;
    if (v79 < v77)
      goto LABEL_124;
    if (v36 > *(_QWORD *)(v101 + 16))
      goto LABEL_125;
    *(_QWORD *)v76 = v77;
    *(_QWORD *)&v34[16 * v75 + 8] = v79;
    v80 = *(_QWORD *)(v101 + 16);
    if (v36 >= v80)
      goto LABEL_126;
    v30 = (char *)v101;
    v33 = v80 - 1;
    memmove(&v34[16 * v36], v78 + 16, 16 * (v80 - 1 - v36));
    *(_QWORD *)(v101 + 16) = v80 - 1;
    if (v80 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v99 < -1)
    goto LABEL_145;
  *(_QWORD *)(v98 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_242C3C3B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_242C4925C();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_242C3C474(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_242BC1924(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = (char *)(v12 - 16);
      v21 = *(_QWORD *)(v12 - 16) == *((_QWORD *)v6 - 2) && *(_QWORD *)(v12 - 8) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_242C4925C() & 1) == 0)
      {
        v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_47;
    }
  }
  sub_242BC1924(a1, (a2 - a1) / 16, a4);
  v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_242C4925C() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_242BC1924(v4, (uint64_t)(v12 - (_QWORD)v4) / 16, v6);
  return 1;
}

uint64_t sub_242C3C618(char *a1)
{
  char v1;

  sub_242C3B8E4(a1);
  return v1 & 1;
}

uint64_t sub_242C3C630(char *a1)
{
  char v1;

  sub_242C3B944(a1);
  return v1 & 1;
}

uint64_t OUTLINED_FUNCTION_0_100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 40) = v4;
  return _s14descr25138D269C9IOMappingVMa(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
}

uint64_t OUTLINED_FUNCTION_1_88()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242B4B240(v0, (v1 & 0xC000000000000001) == 0, v1);
}

void OUTLINED_FUNCTION_2_94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va;

  va_start(va, a11);
  sub_242A6B598(v13, v11, v12, a4, a5, (uint64_t)va, a7, 0, a8, a9, a10, a11);
}

uint64_t OUTLINED_FUNCTION_3_85()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_4_79()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_7_65(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *(_QWORD *)(a3 + 8);
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_BYTE *)(a3 + 24);
  *(_BYTE *)(v3 - 80) = *(_BYTE *)a3;
  *(_QWORD *)(v3 - 72) = v4;
  *(_QWORD *)(v3 - 64) = v5;
  *(_BYTE *)(v3 - 56) = v6;
}

uint64_t OUTLINED_FUNCTION_8_63()
{
  return sub_242C48D40();
}

void OUTLINED_FUNCTION_9_76(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = *a2;
}

uint64_t OUTLINED_FUNCTION_11_61()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_52()
{
  return sub_242C480E0();
}

uint64_t OUTLINED_FUNCTION_13_66()
{
  return sub_242C480E0();
}

uint64_t OUTLINED_FUNCTION_14_48()
{
  return sub_242C48470();
}

void OUTLINED_FUNCTION_15_59()
{
  JUMPOUT(0x2494EC84CLL);
}

uint64_t OUTLINED_FUNCTION_16_53()
{
  return sub_242C48650();
}

uint64_t OUTLINED_FUNCTION_18_58()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = *(_QWORD *)(v1 + 152);
  return sub_242C480E0();
}

uint64_t OUTLINED_FUNCTION_19_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s14descr25138D269C9IOMappingVMa(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
}

void OUTLINED_FUNCTION_20_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_242A6B598(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t OUTLINED_FUNCTION_21_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s14descr25138D269C9IOMappingVMa(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
}

uint64_t OUTLINED_FUNCTION_22_51()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_23_53()
{
  JUMPOUT(0x2494EC198);
}

uint64_t OUTLINED_FUNCTION_25_52@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return _s14descr25138D269C9IOMappingVMa(255, a3, a1, a2);
}

uint64_t OUTLINED_FUNCTION_27_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s14descr25138D269C9IOMappingVMa(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
}

uint64_t OUTLINED_FUNCTION_28_52()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_33_42()
{
  return sub_242C4841C();
}

uint64_t OUTLINED_FUNCTION_39_39()
{
  return sub_242C480E0();
}

uint64_t OUTLINED_FUNCTION_40_43()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_42_37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  sub_242A6B598(a1, a2, a3, a4, a5, a6, v12, 0, a9, a10, a11, a12);
}

uint64_t OUTLINED_FUNCTION_45_27()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_46_30()
{
  sub_242C21A14();
}

void OUTLINED_FUNCTION_49_27()
{
  sub_242C21A14();
}

void OUTLINED_FUNCTION_51_34()
{
  sub_242C21A14();
}

BOOL LayerState.isInitialized.getter()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_37_42();
  return !v1 && v0 < 0;
}

void LayerState.place(on:)()
{
  uint64_t *v0;

  if ((OUTLINED_FUNCTION_33_43() & 1) != 0)
  {
    OUTLINED_FUNCTION_32_44();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    *v0 = OUTLINED_FUNCTION_31_48();
    OUTLINED_FUNCTION_8_64();
  }
}

void LayerState.scalarType.getter()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_37_42();
  if (v1)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v0 < 0)
    {
      Tensor.scalarType.getter();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void LayerState.cast(to:)(uint64_t a1@<X1>, uint64_t **a2@<X8>)
{
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)(a1 + 8) + 32))(&v3);
  *a2 = sub_242A79344(&v3);
  OUTLINED_FUNCTION_21_1();
}

uint64_t LayerState.projectedValue.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_retain();
}

uint64_t LayerState.shape.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  if ((~v2 & 0xF000000000000007) != 0)
  {
    if (v2 < 0)
    {
      *a1 = *(_QWORD *)(*(_QWORD *)(v2 + 16) + 152);
      return sub_242C480E0();
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void LayerState.init(initializer:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  OUTLINED_FUNCTION_226();
  OUTLINED_FUNCTION_1_4();
  sub_242A78594(a1);
  *a2 = v4;
  OUTLINED_FUNCTION_9();
}

Swift::Void __swiftcall LayerState.initializeIfNeeded(toShape:)(NeuralNetworks::TensorShape toShape)
{
  sub_242A78630();
  OUTLINED_FUNCTION_30_5();
}

void OptionalLayerState.wrappedValue.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char v4;

  if (*(_BYTE *)(v1 + 8) == 1)
  {
    v2 = OUTLINED_FUNCTION_43_36();
    if (v4)
    {
      OUTLINED_FUNCTION_5_18();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_105_0();
    }
    else
    {
      if (v2 < 0)
      {
        *v3 = v2 & 0x7FFFFFFFFFFFFFFFLL;
        OUTLINED_FUNCTION_16_8();
        return;
      }
      OUTLINED_FUNCTION_0_23();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_80_1();
    }
    OUTLINED_FUNCTION_4_28();
    __break(1u);
  }
  else
  {
    *a1 = 0;
  }
}

void OptionalLayerState.wrappedValue.setter(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  char v3;
  _QWORD v4[2];

  if (*a1)
  {
    v2 = *v1;
    v4[0] = *a1;
    v4[1] = v2;
    LayerState.wrappedValue.setter(v4);
LABEL_4:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  OUTLINED_FUNCTION_20_60();
  if (!v3)
    goto LABEL_4;
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_13_67();
  __break(1u);
}

void OptionalLayerState.projectedValue.getter(uint64_t *a1@<X8>)
{
  char v2;
  uint64_t v3;

  OUTLINED_FUNCTION_20_60();
  if (v2)
    v3 = swift_retain();
  else
    v3 = 0;
  *a1 = v3;
  OUTLINED_FUNCTION_1_0();
}

void OptionalLayerState.init(_:)(uint64_t *a1)
{
  uint64_t v1;

  if (*a1)
  {
    v1 = *a1;
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
  }
  OUTLINED_FUNCTION_18_59(v1);
  OUTLINED_FUNCTION_9();
}

void OptionalLayerState.init(initializer:)(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    sub_242A78594(a1);
  }
  else
  {
    type metadata accessor for LayerVariableReference();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
  }
  OUTLINED_FUNCTION_18_59(v2);
  OUTLINED_FUNCTION_9();
}

uint64_t LayerState.id.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 16);
}

void LayerState.wrappedValue.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_24_54(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v1 < 0)
    {
      OUTLINED_FUNCTION_31_7(v1);
      OUTLINED_FUNCTION_30_5();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C3CDF8(uint64_t *a1, char a2)
{
  sub_242C3D158(a1, a2);
}

uint64_t _s14NeuralNetworks10LayerStateV12wrappedValueAA6TensorVvg_0()
{
  uint64_t v0;
  uint64_t *v1;
  char v2;
  uint64_t result;

  v0 = OUTLINED_FUNCTION_43_36();
  if (v2)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v0 < 0)
    {
      *v1 = v0 & 0x7FFFFFFFFFFFFFFFLL;
      return OUTLINED_FUNCTION_16_8();
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void sub_242C3CE84(void (*a1)(uint64_t *__return_ptr)@<X3>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  a1(&v3);
  *a2 = v3;
  OUTLINED_FUNCTION_30_5();
}

void sub_242C3CEBC(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD *))
{
  uint64_t v6;
  _QWORD v7[2];

  v6 = *a2;
  v7[0] = *a1;
  v7[1] = v6;
  swift_retain();
  a5(v7);
  OUTLINED_FUNCTION_30_5();
}

uint64_t _s14NeuralNetworks10LayerStateV12wrappedValueAA6TensorVvs_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  if ((~v2 & 0xF000000000000007) != 0)
  {
    if ((v2 & 0x8000000000000000) == 0)
    {
      OUTLINED_FUNCTION_28_53();
      sub_242A783A0(v7);
      return swift_release();
    }
    if ((sub_242C00B0C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 16) + 152), *(_QWORD *)(*(_QWORD *)(v2 + 16) + 152)) & 1) != 0)
    {
      OUTLINED_FUNCTION_28_53();
      sub_242A70278(v2);
      sub_242A783A0(v7);
      sub_242A70294(v2);
      return swift_release();
    }
    v7[0] = 0;
    v7[1] = 0xE000000000000000;
    swift_retain();
    sub_242A70278(v2);
    sub_242C48C38();
    sub_242C48314();
    v4 = sub_242C480E0();
    v5 = MEMORY[0x24BEE1768];
    MEMORY[0x2494EC0FC](v4, MEMORY[0x24BEE1768]);
    OUTLINED_FUNCTION_19_32();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    sub_242C48314();
    v6 = sub_242C480E0();
    MEMORY[0x2494EC0FC](v6, v5);
    OUTLINED_FUNCTION_19_32();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_34();
    sub_242C48314();
  }
  else
  {
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_80_1();
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void LayerState.value.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_24_54(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v1 < 0)
    {
      OUTLINED_FUNCTION_31_7(v1);
      OUTLINED_FUNCTION_30_5();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C3D14C(uint64_t *a1, char a2)
{
  sub_242C3D158(a1, a2);
}

void sub_242C3D158(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v4 = a1[1];
    v3 = swift_retain();
    OUTLINED_FUNCTION_39_40(v3, v4, v2);
    OUTLINED_FUNCTION_22_52();
  }
  else
  {
    OUTLINED_FUNCTION_39_40((uint64_t)a1, a1[1], v2);
    OUTLINED_FUNCTION_21_1();
  }
}

uint64_t LayerState.rank.getter()
{
  uint64_t v0;
  char v1;
  uint64_t result;

  OUTLINED_FUNCTION_37_42();
  if (v1)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v0 < 0)
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 152) + 16);
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void _s14NeuralNetworks10LayerStateVyAcA6TensorVcfC_0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_226();
  v2 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_55(v2);
  *a1 = v3;
  OUTLINED_FUNCTION_30_5();
}

BOOL sub_242C3D268()
{
  uint64_t v0;

  v0 = sub_242C49064();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_242C3D2BC@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_242C3D268();
  *a1 = result;
  return result;
}

void sub_242C3D2F0(_QWORD *a1@<X8>)
{
  *a1 = 0x656C626169726176;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_242C3D30C()
{
  return 0x656C626169726176;
}

uint64_t sub_242C3D324@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = sub_242C3D2AC();
  *a1 = result != 0;
  return result;
}

uint64_t sub_242C3D350()
{
  sub_242C3E524();
  return sub_242C494D8();
}

uint64_t sub_242C3D378()
{
  sub_242C3E524();
  return sub_242C494E4();
}

void LayerState.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_18_1();
  v14 = v13;
  v16 = v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F2F8);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_58_0();
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_242C3E524();
  OUTLINED_FUNCTION_10_7();
  if (!v10)
  {
    type metadata accessor for LayerVariableReference();
    sub_242C3E560(&qword_25722F308, (uint64_t)&unk_242C4CB94);
    sub_242C490D0();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v17);
    *v16 = a10;
  }
  OUTLINED_FUNCTION_23_15();
  OUTLINED_FUNCTION_0_9();
}

void LayerState.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_18_1();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F310);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_58_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_242C3E524();
  sub_242C49478();
  type metadata accessor for LayerVariableReference();
  sub_242C3E560(&qword_25722F318, (uint64_t)&unk_242C4CB6C);
  sub_242C49184();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  OUTLINED_FUNCTION_0_9();
}

void (*sub_242C3D584(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  LayerState.value.modify((uint64_t)v2);
  v2[4] = v3;
  return sub_242A8D588;
}

void sub_242C3D5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  LayerState.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_242C3D5E0()
{
  LayerState.encode(to:)();
}

BOOL static LayerState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(_QWORD *)a1 + 16) == *(_DWORD *)(*(_QWORD *)a2 + 16);
}

void LayerState.hash(into:)()
{
  sub_242C49370();
  OUTLINED_FUNCTION_1_0();
}

uint64_t LayerState.hashValue.getter()
{
  sub_242C49340();
  sub_242C49370();
  return sub_242C49394();
}

uint64_t sub_242C3D684()
{
  sub_242C49340();
  sub_242C49370();
  return sub_242C49394();
}

unint64_t LayerState.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  if ((~v1 & 0xF000000000000007) == 0)
    return 0;
  sub_242A7028C();
  sub_242C48C38();
  if (v1 < 0)
  {
    swift_bridgeObjectRelease();
    v7 = 0xD000000000000014;
    v6 = sub_242C480E0();
    MEMORY[0x2494EC0FC](v6, MEMORY[0x24BEE1768]);
    OUTLINED_FUNCTION_19_32();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    sub_242C48314();
    Tensor.scalarType.getter();
    sub_242C494F0();
  }
  else
  {
    v3 = swift_bridgeObjectRelease();
    v7 = 0xD000000000000028;
    ParameterInitializer.description.getter(v3, v4, v5);
  }
  OUTLINED_FUNCTION_19_32();
  OUTLINED_FUNCTION_34();
  sub_242C48314();
  sub_242A70294(v1);
  return v7;
}

uint64_t LayerState.customMirror.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  _OWORD v17[2];
  __int128 v18;
  ValueMetadata *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = sub_242C493D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572229D8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_23_54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257220FF8);
  inited = swift_initStackObject();
  v7 = inited;
  *(_OWORD *)(inited + 16) = xmmword_242C4B7F0;
  *(_QWORD *)(inited + 32) = 25705;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  v8 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 48) = *(_DWORD *)(v0 + 16);
  *(_QWORD *)(inited + 72) = v8;
  strcpy((char *)(inited + 80), "isInitialized");
  *(_WORD *)(inited + 94) = -4864;
  v9 = *(_QWORD *)(v0 + 32);
  if ((~v9 & 0xF000000000000007) != 0)
  {
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 96) = v9 < 0;
    if (v9 < 0)
    {
      v19 = &type metadata for Tensor;
      *(_QWORD *)&v18 = v9 & 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)&v16 = 0x65756C6176;
      *((_QWORD *)&v16 + 1) = 0xE500000000000000;
      sub_242A7A2D8(&v18, v17);
      sub_242A7028C();
      sub_242A5F1A8();
      v7 = v10;
      *(_QWORD *)(v10 + 16) = 3;
      v11 = v17[0];
      *(_OWORD *)(v10 + 128) = v16;
      *(_OWORD *)(v10 + 144) = v11;
      *(_OWORD *)(v10 + 160) = v17[1];
    }
  }
  else
  {
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 96) = 0;
  }
  *(_QWORD *)&v16 = v0;
  swift_retain();
  v12 = sub_242A5B420(v7);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v18 = v12;
  v13 = sub_242C493C4();
  OUTLINED_FUNCTION_21_51(v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE43C0], v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D8);
  sub_242C3B8A0();
  return sub_242C49400();
}

void LayerState.computeDevice.getter(uint64_t a1@<X8>)
{
  sub_242A78FC0(a1);
  OUTLINED_FUNCTION_1_0();
}

void LayerState.placed(on:)(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  *a1 = *v1;
  swift_retain();
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    OUTLINED_FUNCTION_32_44();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    *a1 = OUTLINED_FUNCTION_31_48();
    OUTLINED_FUNCTION_8_64();
  }
}

void sub_242C3DB44(_QWORD *a1@<X8>)
{
  uint64_t v2;

  OptionalLayerState.wrappedValue.getter(&v2);
  *a1 = v2;
}

void sub_242C3DB8C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  char v3;
  _QWORD v4[2];
  char v5;

  v2 = *a2;
  v3 = *((_BYTE *)a2 + 8);
  v4[0] = *a1;
  v4[1] = v2;
  v5 = v3;
  swift_retain();
  OptionalLayerState.wrappedValue.setter(v4);
}

void OptionalLayerState.wrappedValue.modify(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *v1;
  *(_QWORD *)(a1 + 8) = *v1;
  v3 = *((unsigned __int8 *)v1 + 8);
  *(_BYTE *)(a1 + 16) = v3;
  if (v3 != 1)
  {
    *(_QWORD *)a1 = 0;
    goto LABEL_6;
  }
  v4 = *(_QWORD *)(v2 + 32);
  if ((~v4 & 0xF000000000000007) != 0)
  {
    if (v4 < 0)
    {
      OUTLINED_FUNCTION_31_7(v4);
LABEL_6:
      OUTLINED_FUNCTION_30_5();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C3DC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = swift_retain();
      OUTLINED_FUNCTION_147_3(v4, v5, v6);
LABEL_7:
      OUTLINED_FUNCTION_22_52();
      return;
    }
    if ((*(_BYTE *)(a1 + 16) & 1) == 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  if (v3)
  {
    OUTLINED_FUNCTION_147_3(a1, a2, a3);
LABEL_9:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  if (*(_BYTE *)(a1 + 16) != 1)
    goto LABEL_9;
LABEL_10:
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_13_67();
  __break(1u);
}

void OptionalLayerState.init(wrappedValue:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*a1)
  {
    OUTLINED_FUNCTION_226();
    v1 = OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_17_55(v1);
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
  }
  OUTLINED_FUNCTION_18_59(v2);
  OUTLINED_FUNCTION_21_1();
}

BOOL static OptionalLayerState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(_QWORD *)a1 + 16) == *(_DWORD *)(*(_QWORD *)a2 + 16);
}

uint64_t sub_242C3DD94(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x7453726579616C5FLL && a2 == 0xEB00000000657461;
  if (v2 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C62616E457369 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_242C4925C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_242C3DEA4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C62616E457369;
  else
    return 0x7453726579616C5FLL;
}

uint64_t sub_242C3DEE8()
{
  char *v0;

  return sub_242C3DEA4(*v0);
}

uint64_t sub_242C3DEF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242C3DD94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242C3DF14()
{
  sub_242C3E5A0();
  return sub_242C494D8();
}

uint64_t sub_242C3DF3C()
{
  sub_242C3E5A0();
  return sub_242C494E4();
}

void OptionalLayerState.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _DWORD v9[3];
  char v10;
  char v11;

  OUTLINED_FUNCTION_18_1();
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F320);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[2] = *(unsigned __int8 *)(v0 + 8);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_242C3E5A0();
  sub_242C49478();
  v11 = 0;
  sub_242C17870();
  sub_242C49184();
  if (!v1)
  {
    v10 = 1;
    sub_242C49160();
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v5);
  OUTLINED_FUNCTION_0_9();
}

void OptionalLayerState.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  OUTLINED_FUNCTION_18_1();
  v12 = v11;
  v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F330);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v15);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_242C3E5A0();
  OUTLINED_FUNCTION_10_7();
  if (v10)
  {
    OUTLINED_FUNCTION_23_15();
  }
  else
  {
    sub_242C17834();
    sub_242C490D0();
    swift_retain();
    v16 = sub_242C490AC();
    OUTLINED_FUNCTION_1_12();
    *(_QWORD *)v14 = a10;
    *(_BYTE *)(v14 + 8) = v16 & 1;
    OUTLINED_FUNCTION_23_15();
    swift_release();
  }
  OUTLINED_FUNCTION_0_9();
}

void sub_242C3E1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  OptionalLayerState.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_242C3E1D0()
{
  OptionalLayerState.encode(to:)();
}

uint64_t OptionalLayerState.customMirror.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v1 = sub_242C493D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_58_0();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572229D8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_23_54();
  OUTLINED_FUNCTION_20_60();
  if (v4)
    return LayerState.customMirror.getter();
  v5 = sub_242C493C4();
  OUTLINED_FUNCTION_21_51(v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x24BEE43C0], v1);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D8);
  sub_242C3B8A0();
  return sub_242C49400();
}

void OptionalLayerState.description.getter()
{
  char v0;

  OUTLINED_FUNCTION_20_60();
  if (v0)
    LayerState.description.getter();
  OUTLINED_FUNCTION_30_5();
}

void OptionalLayerState.computeDevice.getter(uint64_t a1@<X8>)
{
  char v2;

  OUTLINED_FUNCTION_20_60();
  if (v2)
  {
    swift_retain();
    sub_242A78FC0(a1);
    swift_release();
  }
  else
  {
    *(_DWORD *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    OUTLINED_FUNCTION_1_0();
  }
}

void OptionalLayerState.place(on:)()
{
  uint64_t *v0;
  char v1;

  OUTLINED_FUNCTION_20_60();
  if (!v1)
    goto LABEL_5;
  if (OUTLINED_FUNCTION_33_43())
  {
    OUTLINED_FUNCTION_32_44();
LABEL_5:
    OUTLINED_FUNCTION_9();
    return;
  }
  *v0 = OUTLINED_FUNCTION_31_48();
  OUTLINED_FUNCTION_8_64();
}

void OptionalLayerState.placed(on:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(unsigned __int8 *)(v1 + 8);
  if (v3 == 1)
  {
    v4 = *(_QWORD *)v1;
    swift_retain_n();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      OUTLINED_FUNCTION_32_44();
      swift_release();
    }
    else
    {
      v6 = OUTLINED_FUNCTION_31_48();
      swift_release_n();
      v4 = v6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
    v4 = v5;
  }
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v3;
  OUTLINED_FUNCTION_9();
}

void OptionalLayerState.cast(to:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;

  v5 = *(unsigned __int8 *)(v3 + 8);
  if (v5 == 1)
  {
    v7 = *(_QWORD *)(a2 + 8);
    v8 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v7 + 32);
    swift_retain();
    v8(&v11, a1, v7);
    v9 = sub_242A79344(&v11);
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
    v9 = v10;
  }
  *(_QWORD *)a3 = v9;
  *(_BYTE *)(a3 + 8) = v5;
}

unint64_t sub_242C3E524()
{
  unint64_t result;

  result = qword_25722F300;
  if (!qword_25722F300)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63378, &unk_251393E20);
    atomic_store(result, (unint64_t *)&qword_25722F300);
  }
  return result;
}

uint64_t sub_242C3E560(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LayerVariableReference();
    result = MEMORY[0x2494EDE24](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_242C3E5A0()
{
  unint64_t result;

  result = qword_25722F328;
  if (!qword_25722F328)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63328, &type metadata for OptionalLayerState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F328);
  }
  return result;
}

unint64_t sub_242C3E5E0()
{
  unint64_t result;

  result = qword_25722F338;
  if (!qword_25722F338)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for LayerState, &type metadata for LayerState);
    atomic_store(result, (unint64_t *)&qword_25722F338);
  }
  return result;
}

void sub_242C3E61C(_QWORD *a1@<X8>)
{
  sub_242C3CE84((void (*)(uint64_t *__return_ptr))LayerState.wrappedValue.getter, a1);
}

void sub_242C3E638(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_242C3CEBC(a1, a2, a3, a4, (void (*)(_QWORD *))LayerState.wrappedValue.setter);
}

void sub_242C3E654(_QWORD *a1@<X8>)
{
  sub_242C3CE84((void (*)(uint64_t *__return_ptr))LayerState.value.getter, a1);
}

void sub_242C3E670(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  sub_242C3CEBC(a1, a2, a3, a4, (void (*)(_QWORD *))LayerState.value.setter);
}

void type metadata accessor for LayerState()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t initializeBufferWithCopyOfBuffer for OptionalLayerState(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OptionalLayerState(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for OptionalLayerState(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

void type metadata accessor for OptionalLayerState()
{
  OUTLINED_FUNCTION_22_4();
}

uint64_t storeEnumTagSinglePayload for OptionalLayerState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242C3E7B4 + 4 * byte_242C62F55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_242C3E7E8 + 4 * byte_242C62F50[v4]))();
}

uint64_t sub_242C3E7E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C3E7F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C3E7F8);
  return result;
}

uint64_t sub_242C3E804(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C3E80CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_242C3E810(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C3E818(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OptionalLayerState.CodingKeys()
{
  return &type metadata for OptionalLayerState.CodingKeys;
}

uint64_t sub_242C3E834(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_242C3E874 + 4 * byte_242C62F5A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_242C3E894 + 4 * byte_242C62F5F[v4]))();
}

_BYTE *sub_242C3E874(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_242C3E894(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C3E89C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C3E8A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C3E8AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C3E8B4(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for LayerState.CodingKeys()
{
  OUTLINED_FUNCTION_22_4();
}

unint64_t sub_242C3E8D0()
{
  unint64_t result;

  result = qword_25722F340;
  if (!qword_25722F340)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63248, &unk_251393E20);
    atomic_store(result, (unint64_t *)&qword_25722F340);
  }
  return result;
}

unint64_t sub_242C3E910()
{
  unint64_t result;

  result = qword_25722F348;
  if (!qword_25722F348)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63300, &type metadata for OptionalLayerState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F348);
  }
  return result;
}

unint64_t sub_242C3E950()
{
  unint64_t result;

  result = qword_25722F350;
  if (!qword_25722F350)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63270, &type metadata for OptionalLayerState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F350);
  }
  return result;
}

unint64_t sub_242C3E990()
{
  unint64_t result;

  result = qword_25722F358;
  if (!qword_25722F358)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63298, &type metadata for OptionalLayerState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F358);
  }
  return result;
}

unint64_t sub_242C3E9D0()
{
  unint64_t result;

  result = qword_25722F360;
  if (!qword_25722F360)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63180, &unk_251393E20);
    atomic_store(result, (unint64_t *)&qword_25722F360);
  }
  return result;
}

unint64_t sub_242C3EA10()
{
  unint64_t result;

  result = qword_25722F368;
  if (!qword_25722F368)
  {
    result = MEMORY[0x2494EDE24](&unk_242C631A8, &unk_251393E20);
    atomic_store(result, (unint64_t *)&qword_25722F368);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_8_64()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13_67()
{
  return sub_242C48F5C();
}

void OUTLINED_FUNCTION_17_55(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  sub_242A78538((uint64_t *)va, 0x100000000);
}

uint64_t OUTLINED_FUNCTION_18_59(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)v1 = result;
  *(_BYTE *)(v1 + 8) = v2 != 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_51(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_22_52()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_54(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(a1 + 8) = *v1;
  return *(_QWORD *)(v2 + 32);
}

uint64_t OUTLINED_FUNCTION_28_53()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_31_48()
{
  return sub_242A79120();
}

void OUTLINED_FUNCTION_32_44()
{
  sub_242A79038();
}

uint64_t OUTLINED_FUNCTION_33_43()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_39_40(uint64_t a1, ...)
{
  uint64_t (*v1)(char *);
  va_list va;

  va_start(va, a1);
  return v1(va);
}

uint64_t OUTLINED_FUNCTION_43_36()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 32);
}

uint64_t Parameter.projectedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;

  v2 = *(_BYTE *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 9) = v3;
  return swift_retain();
}

void OptionalParameter.wrappedValue.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char v4;

  if (*(_BYTE *)(v1 + 10) == 1)
  {
    v2 = OUTLINED_FUNCTION_43_36();
    if (v4)
    {
      OUTLINED_FUNCTION_5_18();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_105_0();
    }
    else
    {
      if (v2 < 0)
      {
        *v3 = v2 & 0x7FFFFFFFFFFFFFFFLL;
        OUTLINED_FUNCTION_16_8();
        return;
      }
      OUTLINED_FUNCTION_0_23();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_80_1();
    }
    OUTLINED_FUNCTION_4_28();
    __break(1u);
  }
  else
  {
    *a1 = 0;
  }
}

void OptionalParameter.wrappedValue.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_55();
  if (v1)
  {
    if (v0)
    {
      v2 = v0;
      Parameter.wrappedValue.setter(&v2);
      return;
    }
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_55_2();
    goto LABEL_9;
  }
  if (v0)
  {
    swift_release();
    OUTLINED_FUNCTION_29_4();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
LABEL_9:
    OUTLINED_FUNCTION_51_35();
    __break(1u);
  }
}

void OptionalParameter.projectedValue.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;

  OUTLINED_FUNCTION_24_55();
  if (v3)
  {
    if (*(_BYTE *)(v1 + 9))
      v4 = 256;
    else
      v4 = 0;
    v6 = v4 | *(unsigned __int8 *)(v1 + 8);
    v5 = swift_retain();
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_WORD *)(a1 + 8) = v6;
  OUTLINED_FUNCTION_1_0();
}

BOOL Parameter.isInitialized.getter()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_37_42();
  return !v1 && v0 < 0;
}

uint64_t Parameter.rank.getter()
{
  uint64_t v0;
  char v1;
  uint64_t result;

  OUTLINED_FUNCTION_37_42();
  if (v1)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v0 < 0)
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 152) + 16);
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

uint64_t Parameter.shape.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  if ((~v2 & 0xF000000000000007) != 0)
  {
    if (v2 < 0)
    {
      *a1 = *(_QWORD *)(*(_QWORD *)(v2 + 16) + 152);
      return sub_242C480E0();
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void OptionalParameter.init(_:)(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unsigned int v4;
  char v5;
  int v6;
  uint64_t v7;

  v3 = *a1;
  if (*a1)
  {
    v4 = *((unsigned __int16 *)a1 + 4);
    v5 = v4 & 1;
    v6 = (v4 >> 8) & 1;
    v7 = *a1;
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
    v5 = 0;
    LOBYTE(v6) = 1;
  }
  *(_QWORD *)a2 = v7;
  *(_BYTE *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 9) = v6;
  *(_BYTE *)(a2 + 10) = v3 != 0;
  OUTLINED_FUNCTION_9();
}

void Parameter.init(initializer:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  OUTLINED_FUNCTION_226();
  OUTLINED_FUNCTION_1_4();
  sub_242A78594(a1);
  *(_QWORD *)a2 = v4;
  *(_WORD *)(a2 + 8) = 256;
  OUTLINED_FUNCTION_9();
}

void OptionalParameter.init(initializer:)(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    sub_242A78594(a1);
  }
  else
  {
    type metadata accessor for LayerVariableReference();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
  }
  OUTLINED_FUNCTION_23_55(v2);
  OUTLINED_FUNCTION_9();
}

Swift::Void __swiftcall Parameter.initializeIfNeeded(toShape:)(NeuralNetworks::TensorShape toShape)
{
  sub_242A78630();
  OUTLINED_FUNCTION_30_5();
}

void Parameter.place(on:)()
{
  uint64_t *v0;

  if ((OUTLINED_FUNCTION_33_43() & 1) != 0)
  {
    sub_242A79038();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    *v0 = sub_242A79120();
    OUTLINED_FUNCTION_8_64();
  }
}

void Parameter.scalarType.getter()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_37_42();
  if (v1)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v0 < 0)
    {
      Tensor.scalarType.getter();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void Parameter.cast(to:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)(a1 + 8) + 32))(&v3);
  *(_QWORD *)a2 = sub_242A79344(&v3);
  *(_WORD *)(a2 + 8) = 256;
  OUTLINED_FUNCTION_21_1();
}

uint64_t Parameter.id.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 16);
}

void Parameter.wrappedValue.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  *(_QWORD *)(a1 + 8) = v1;
  v2 = OUTLINED_FUNCTION_17_56();
  if (v3)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v2 < 0)
    {
      OUTLINED_FUNCTION_31_7(v2);
      OUTLINED_FUNCTION_30_5();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C3F124(uint64_t a1, char a2)
{
  sub_242C3F4A4(a1, a2);
}

void sub_242C3F134(void (*a1)(uint64_t *__return_ptr)@<X3>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  a1(&v3);
  *a2 = v3;
  OUTLINED_FUNCTION_3_0();
}

void sub_242C3F17C()
{
  uint64_t v0;

  v0 = swift_retain();
  OUTLINED_FUNCTION_119_8(v0);
  OUTLINED_FUNCTION_30_5();
}

uint64_t _s14NeuralNetworks9ParameterV12wrappedValueAA6TensorVvs_0(uint64_t *a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10[2];
  char v11;

  v2 = *a1;
  if (v1[8] == 1)
    return swift_release();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    v10[0] = v2;
    v4 = *(unsigned int *)(*(_QWORD *)v1 + 16);
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_6();
    v11 = 0;
    sub_242A78538(v10, v4);
    *(_QWORD *)v1 = v5;
    OUTLINED_FUNCTION_8_1();
    return swift_release();
  }
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  if ((~v3 & 0xF000000000000007) != 0)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      v10[0] = v2 | 0x8000000000000000;
      OUTLINED_FUNCTION_6();
      sub_242A783A0(v10);
      return OUTLINED_FUNCTION_8_1();
    }
    if ((sub_242C00B0C(*(_QWORD *)(*(_QWORD *)(v2 + 16) + 152), *(_QWORD *)(*(_QWORD *)(v3 + 16) + 152)) & 1) != 0)
    {
      v10[0] = v2 | 0x8000000000000000;
      OUTLINED_FUNCTION_6();
      sub_242A70278(v3);
      sub_242A783A0(v10);
      sub_242A70294(v3);
      return OUTLINED_FUNCTION_8_1();
    }
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    OUTLINED_FUNCTION_6();
    sub_242A70278(v3);
    sub_242C48C38();
    sub_242C48314();
    v7 = sub_242C480E0();
    v8 = MEMORY[0x24BEE1768];
    MEMORY[0x2494EC0FC](v7, MEMORY[0x24BEE1768]);
    sub_242C48314();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    sub_242C48314();
    v9 = sub_242C480E0();
    MEMORY[0x2494EC0FC](v9, v8);
    sub_242C48314();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_34();
    sub_242C48314();
  }
  else
  {
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_80_1();
  result = OUTLINED_FUNCTION_4_28();
  __break(1u);
  return result;
}

void Parameter.value.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  *(_QWORD *)(a1 + 8) = v1;
  v2 = OUTLINED_FUNCTION_17_56();
  if (v3)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v2 < 0)
    {
      OUTLINED_FUNCTION_31_7(v2);
      OUTLINED_FUNCTION_30_5();
      return;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C3F498(uint64_t a1, char a2)
{
  sub_242C3F4A4(a1, a2);
}

void sub_242C3F4A4(uint64_t a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_retain();
    OUTLINED_FUNCTION_119_8(v2);
    OUTLINED_FUNCTION_22_52();
  }
  else
  {
    OUTLINED_FUNCTION_119_8(a1);
    OUTLINED_FUNCTION_21_1();
  }
}

uint64_t Parameter.isFrozen.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t Parameter.isFrozen.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*Parameter.isFrozen.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t Parameter.isRequiringGradients.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t Parameter.isRequiringGradients.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 9) = result;
  return result;
}

uint64_t (*Parameter.isRequiringGradients.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

void _s14NeuralNetworks9ParameterV12wrappedValueAcA6TensorV_tcfC_0(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_226();
  v2 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_55(v2);
  *(_QWORD *)a1 = v3;
  *(_WORD *)(a1 + 8) = 256;
  OUTLINED_FUNCTION_30_5();
}

uint64_t sub_242C3F57C()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_242C49064();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_242C3F5D0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E657A6F72467369;
  else
    return 0x656C626169726176;
}

void sub_242C3F600(char *a1, char *a2)
{
  sub_242B3E69C(*a1, *a2);
}

void sub_242C3F60C()
{
  sub_242C44C60();
}

uint64_t sub_242C3F614()
{
  return sub_242A5C218();
}

void sub_242C3F61C()
{
  sub_242BA8D80();
}

uint64_t sub_242C3F624@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_242C3F57C();
  *a1 = result;
  return result;
}

void sub_242C3F650(uint64_t *a1@<X8>)
{
  char *v1;

  *a1 = sub_242C3F5D0(*v1);
  a1[1] = 0xE800000000000000;
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_242C3F678()
{
  char *v0;

  return sub_242C3F5D0(*v0);
}

uint64_t sub_242C3F694@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_242C3F5CC();
  *a1 = result;
  return result;
}

uint64_t sub_242C3F6B8()
{
  sub_242C4093C();
  return sub_242C494D8();
}

uint64_t sub_242C3F6E0()
{
  sub_242C4093C();
  return sub_242C494E4();
}

void Parameter.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  OUTLINED_FUNCTION_18_1();
  v12 = v11;
  v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F370);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v15);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_242C4093C();
  OUTLINED_FUNCTION_16_54();
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    type metadata accessor for LayerVariableReference();
    sub_242C40978(&qword_25722F308, (uint64_t)&unk_242C4CB94);
    OUTLINED_FUNCTION_69_1();
    swift_retain();
    v16 = OUTLINED_FUNCTION_32_45();
    OUTLINED_FUNCTION_1_12();
    *(_QWORD *)v14 = a10;
    *(_BYTE *)(v14 + 8) = v16 & 1;
    *(_BYTE *)(v14 + 9) = 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    OUTLINED_FUNCTION_157_0();
  }
  OUTLINED_FUNCTION_0_9();
}

void Parameter.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_18_1();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F380);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_29_37();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_242C4093C();
  OUTLINED_FUNCTION_28_54();
  type metadata accessor for LayerVariableReference();
  sub_242C40978(&qword_25722F318, (uint64_t)&unk_242C4CB6C);
  sub_242C49184();
  if (!v0)
    OUTLINED_FUNCTION_34_45();
  OUTLINED_FUNCTION_13_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0_9();
}

void (*sub_242C3F944(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  Parameter.value.modify((uint64_t)v2);
  v2[4] = v3;
  return sub_242A8D588;
}

void sub_242C3F98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  Parameter.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_242C3F9A0()
{
  Parameter.encode(to:)();
}

Swift::Void __swiftcall Parameter.freeze()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 8) = 1;
}

Swift::Void __swiftcall Parameter.unfreeze()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 8) = 0;
}

BOOL static Parameter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(_QWORD *)a1 + 16) == *(_DWORD *)(*(_QWORD *)a2 + 16);
}

void Parameter.hash(into:)()
{
  sub_242C49370();
  OUTLINED_FUNCTION_1_0();
}

uint64_t Parameter.hashValue.getter()
{
  sub_242C49340();
  sub_242C49370();
  return sub_242C49394();
}

unint64_t Parameter.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  if ((~v1 & 0xF000000000000007) == 0)
    return 0;
  sub_242A7028C();
  sub_242C48C38();
  if (v1 < 0)
  {
    swift_bridgeObjectRelease();
    v7 = 0xD000000000000012;
    v6 = sub_242C480E0();
    MEMORY[0x2494EC0FC](v6, MEMORY[0x24BEE1768]);
    sub_242C48314();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    sub_242C48314();
    Tensor.scalarType.getter();
    sub_242C494F0();
  }
  else
  {
    v3 = swift_bridgeObjectRelease();
    v7 = 0xD000000000000026;
    ParameterInitializer.description.getter(v3, v4, v5);
  }
  sub_242C48314();
  OUTLINED_FUNCTION_34();
  sub_242C48314();
  sub_242A70294(v1);
  return v7;
}

uint64_t Parameter.customMirror.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;
  ValueMetadata *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = sub_242C493D0();
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_9();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572229D8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_9();
  v10 = v9 - v8;
  v11 = *v0;
  v12 = *((_BYTE *)v0 + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257220FF8);
  inited = swift_initStackObject();
  v14 = inited;
  *(_OWORD *)(inited + 16) = xmmword_242C4B810;
  *(_QWORD *)(inited + 32) = 25705;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  v15 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 48) = *(_DWORD *)(v11 + 16);
  *(_QWORD *)(inited + 72) = v15;
  *(_QWORD *)(inited + 80) = 0x6E657A6F72467369;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  v16 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = v12;
  *(_QWORD *)(inited + 120) = v16;
  strcpy((char *)(inited + 128), "isInitialized");
  *(_WORD *)(inited + 142) = -4864;
  v17 = *(_QWORD *)(v11 + 32);
  if ((~v17 & 0xF000000000000007) != 0)
  {
    *(_QWORD *)(inited + 168) = v16;
    *(_BYTE *)(inited + 144) = v17 < 0;
    if (v17 < 0)
    {
      v28 = &type metadata for Tensor;
      *(_QWORD *)&v27 = v17 & 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)&v25 = 0x65756C6176;
      *((_QWORD *)&v25 + 1) = 0xE500000000000000;
      sub_242A7A2D8(&v27, v26);
      sub_242A7028C();
      sub_242A5F1A8();
      v14 = v18;
      *(_QWORD *)(v18 + 16) = 4;
      v19 = v26[0];
      *(_OWORD *)(v18 + 176) = v25;
      *(_OWORD *)(v18 + 192) = v19;
      *(_OWORD *)(v18 + 208) = v26[1];
    }
  }
  else
  {
    *(_QWORD *)(inited + 168) = v16;
    *(_BYTE *)(inited + 144) = 0;
  }
  swift_retain();
  v20 = sub_242A5B420(v14);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v27 = v20;
  v21 = sub_242C493C4();
  OUTLINED_FUNCTION_33_19(v10, v22, v23, v21);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v6, *MEMORY[0x24BEE43C0], v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D8);
  sub_242C3B8A0();
  return sub_242C49400();
}

void Parameter.computeDevice.getter(uint64_t a1@<X8>)
{
  sub_242A78FC0(a1);
  OUTLINED_FUNCTION_1_0();
}

void Parameter.placed(on:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  char v4;

  v3 = *(_BYTE *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4;
  swift_retain();
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    OUTLINED_FUNCTION_42_38();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    *(_QWORD *)a1 = OUTLINED_FUNCTION_43_37();
    OUTLINED_FUNCTION_8_64();
  }
}

void sub_242C3FF00(_QWORD *a1@<X8>)
{
  uint64_t v2;

  OptionalParameter.wrappedValue.getter(&v2);
  *a1 = v2;
}

void sub_242C3FF58()
{
  swift_retain();
  OptionalParameter.wrappedValue.setter();
}

void OptionalParameter.wrappedValue.modify(_QWORD *a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;

  a1[1] = v1;
  OUTLINED_FUNCTION_24_55();
  if (!v3)
  {
    *a1 = 0;
LABEL_6:
    OUTLINED_FUNCTION_30_5();
    return;
  }
  v4 = OUTLINED_FUNCTION_17_56();
  if (v3)
  {
    OUTLINED_FUNCTION_5_18();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_105_0();
  }
  else
  {
    if (v4 < 0)
    {
      OUTLINED_FUNCTION_31_7(v4);
      goto LABEL_6;
    }
    OUTLINED_FUNCTION_0_23();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
  }
  OUTLINED_FUNCTION_4_28();
  __break(1u);
}

void sub_242C40030(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    if (*(_BYTE *)(a1[1] + 10))
    {
      if (v2)
      {
        v3 = *a1;
        OUTLINED_FUNCTION_6();
        Parameter.wrappedValue.setter(&v3);
LABEL_9:
        OUTLINED_FUNCTION_22_52();
        return;
      }
      goto LABEL_12;
    }
    if (!v2)
      goto LABEL_9;
LABEL_14:
    OUTLINED_FUNCTION_29_4();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
    goto LABEL_15;
  }
  if (!*(_BYTE *)(a1[1] + 10))
  {
    if (v2)
    {
      OUTLINED_FUNCTION_8_1();
      goto LABEL_14;
    }
LABEL_11:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  if (v2)
  {
    v3 = *a1;
    Parameter.wrappedValue.setter(&v3);
    goto LABEL_11;
  }
LABEL_12:
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_55_2();
LABEL_15:
  OUTLINED_FUNCTION_51_35();
  __break(1u);
}

void OptionalParameter.init(wrappedValue:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*a1)
  {
    OUTLINED_FUNCTION_226();
    v1 = OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_17_55(v1);
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
  }
  OUTLINED_FUNCTION_23_55(v2);
  OUTLINED_FUNCTION_21_1();
}

BOOL static OptionalParameter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(_QWORD *)a1 + 16) == *(_DWORD *)(*(_QWORD *)a2 + 16);
}

uint64_t sub_242C40168(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x74656D617261705FLL && a2 == 0xEA00000000007265;
  if (v2 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C62616E457369 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_242C4925C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_242C4026C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C62616E457369;
  else
    return 0x74656D617261705FLL;
}

uint64_t sub_242C402AC()
{
  char *v0;

  return sub_242C4026C(*v0);
}

uint64_t sub_242C402B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242C40168(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242C402D8()
{
  sub_242C409B4();
  return sub_242C494D8();
}

uint64_t sub_242C40300()
{
  sub_242C409B4();
  return sub_242C494E4();
}

void OptionalParameter.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_18_1();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F388);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_29_37();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_242C409B4();
  OUTLINED_FUNCTION_28_54();
  sub_242A97EC4();
  sub_242C49184();
  if (!v0)
    OUTLINED_FUNCTION_34_45();
  OUTLINED_FUNCTION_13_4(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_0_9();
}

void OptionalParameter.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;

  OUTLINED_FUNCTION_18_1();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25722F398);
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_242C409B4();
  OUTLINED_FUNCTION_16_54();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    sub_242A97E88();
    OUTLINED_FUNCTION_69_1();
    swift_retain();
    v6 = OUTLINED_FUNCTION_32_45();
    OUTLINED_FUNCTION_1_12();
    *(_QWORD *)v4 = v7;
    *(_BYTE *)(v4 + 8) = v8;
    *(_BYTE *)(v4 + 9) = v9;
    *(_BYTE *)(v4 + 10) = v6 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    OUTLINED_FUNCTION_157_0();
  }
  OUTLINED_FUNCTION_0_9();
}

void sub_242C40564()
{
  OptionalParameter.init(from:)();
}

void sub_242C40578()
{
  OptionalParameter.encode(to:)();
}

void OptionalParameter.customMirror.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  char v16;
  char v17;
  char v18;

  v1 = sub_242C493D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4_9();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572229D8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *((_BYTE *)v0 + 8);
  v10 = *((_BYTE *)v0 + 9);
  if (*((_BYTE *)v0 + 10) == 1)
  {
    v15 = *v0;
    v16 = v9;
    v17 = v10;
    Parameter.customMirror.getter();
  }
  else
  {
    v15 = *v0;
    v16 = v9;
    v17 = v10;
    v18 = 0;
    v14[1] = MEMORY[0x24BEE4AF8];
    v11 = sub_242C493C4();
    OUTLINED_FUNCTION_33_19((uint64_t)v8, v12, v13, v11);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BEE43C0], v1);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25722F1D8);
    sub_242C3B8A0();
    sub_242C49400();
  }
  OUTLINED_FUNCTION_12_0();
}

void OptionalParameter.description.getter()
{
  char v0;

  OUTLINED_FUNCTION_24_55();
  if (v0)
    Parameter.description.getter();
  OUTLINED_FUNCTION_30_5();
}

void OptionalParameter.computeDevice.getter(uint64_t a1@<X8>)
{
  char v2;

  OUTLINED_FUNCTION_24_55();
  if (v2)
  {
    swift_retain();
    sub_242A78FC0(a1);
    swift_release();
  }
  else
  {
    *(_DWORD *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    OUTLINED_FUNCTION_1_0();
  }
}

void OptionalParameter.place(on:)()
{
  uint64_t *v0;
  char v1;

  OUTLINED_FUNCTION_24_55();
  if (!v1)
    goto LABEL_5;
  if (OUTLINED_FUNCTION_33_43())
  {
    sub_242A79038();
LABEL_5:
    OUTLINED_FUNCTION_9();
    return;
  }
  *v0 = sub_242A79120();
  OUTLINED_FUNCTION_8_64();
}

void OptionalParameter.placed(on:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(unsigned __int8 *)(v1 + 10);
  if (v3 == 1)
  {
    v4 = *(_QWORD *)v1;
    v5 = *(_BYTE *)(v1 + 9);
    v6 = *(_BYTE *)(v1 + 8);
    swift_retain_n();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      OUTLINED_FUNCTION_42_38();
      swift_release();
    }
    else
    {
      v8 = OUTLINED_FUNCTION_43_37();
      swift_release_n();
      v4 = v8;
    }
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
    v4 = v7;
    v6 = 0;
    v5 = 1;
  }
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 9) = v5;
  *(_BYTE *)(a1 + 10) = v3;
  OUTLINED_FUNCTION_12_0();
}

void OptionalParameter.cast(to:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;

  v5 = *(unsigned __int8 *)(v3 + 10);
  if (v5 == 1)
  {
    v7 = *(_QWORD *)(a2 + 8);
    v8 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v7 + 32);
    swift_retain();
    v8(&v11, a1, v7);
    v9 = sub_242A79344(&v11);
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_226();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_12_9();
    v9 = v10;
  }
  *(_QWORD *)a3 = v9;
  *(_WORD *)(a3 + 8) = 256;
  *(_BYTE *)(a3 + 10) = v5;
}

unint64_t sub_242C4093C()
{
  unint64_t result;

  result = qword_25722F378;
  if (!qword_25722F378)
  {
    result = MEMORY[0x2494EDE24](&unk_242C637F8, &unk_2513941C0);
    atomic_store(result, (unint64_t *)&qword_25722F378);
  }
  return result;
}

void sub_242C40978(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for LayerVariableReference();
    atomic_store(MEMORY[0x2494EDE24](a2, v4), a1);
  }
  OUTLINED_FUNCTION_1_0();
}

unint64_t sub_242C409B4()
{
  unint64_t result;

  result = qword_25722F390;
  if (!qword_25722F390)
  {
    result = MEMORY[0x2494EDE24](&unk_242C637A8, &type metadata for OptionalParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F390);
  }
  return result;
}

unint64_t sub_242C409F4()
{
  unint64_t result;

  result = qword_25722F3A0;
  if (!qword_25722F3A0)
  {
    result = MEMORY[0x2494EDE24](&protocol conformance descriptor for Parameter, &type metadata for Parameter);
    atomic_store(result, (unint64_t *)&qword_25722F3A0);
  }
  return result;
}

void sub_242C40A30(_QWORD *a1@<X8>)
{
  sub_242C3F134((void (*)(uint64_t *__return_ptr))Parameter.wrappedValue.getter, a1);
}

void sub_242C40A4C()
{
  sub_242C3F17C();
}

void sub_242C40A68(_QWORD *a1@<X8>)
{
  sub_242C3F134((void (*)(uint64_t *__return_ptr))Parameter.value.getter, a1);
}

void sub_242C40A84()
{
  sub_242C3F17C();
}

void sub_242C40AAC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_retain();
  OUTLINED_FUNCTION_1_0();
}

uint64_t assignWithCopy for Parameter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t assignWithTake for Parameter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Parameter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 10))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Parameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 10) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for Parameter()
{
  OUTLINED_FUNCTION_22_4();
}

void sub_242C40C04(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  swift_retain();
  OUTLINED_FUNCTION_1_0();
}

uint64_t assignWithCopy for OptionalParameter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  return a1;
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for OptionalParameter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  return a1;
}

uint64_t getEnumTagSinglePayload for OptionalParameter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 11))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OptionalParameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 11) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for OptionalParameter()
{
  OUTLINED_FUNCTION_22_4();
}

ValueMetadata *type metadata accessor for OptionalParameter.CodingKeys()
{
  return &type metadata for OptionalParameter.CodingKeys;
}

uint64_t _s14NeuralNetworks17OptionalParameterV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242C40DE8 + 4 * byte_242C633D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_242C40E1C + 4 * byte_242C633D0[v4]))();
}

uint64_t sub_242C40E1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C40E24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C40E2CLL);
  return result;
}

uint64_t sub_242C40E38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C40E40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_242C40E44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C40E4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for Parameter.CodingKeys()
{
  OUTLINED_FUNCTION_22_4();
}

unint64_t sub_242C40E68()
{
  unint64_t result;

  result = qword_25722F3A8;
  if (!qword_25722F3A8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C636C8, &unk_2513941C0);
    atomic_store(result, (unint64_t *)&qword_25722F3A8);
  }
  return result;
}

unint64_t sub_242C40EA8()
{
  unint64_t result;

  result = qword_25722F3B0;
  if (!qword_25722F3B0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63780, &type metadata for OptionalParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F3B0);
  }
  return result;
}

unint64_t sub_242C40EE8()
{
  unint64_t result;

  result = qword_25722F3B8;
  if (!qword_25722F3B8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C636F0, &type metadata for OptionalParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F3B8);
  }
  return result;
}

unint64_t sub_242C40F28()
{
  unint64_t result;

  result = qword_25722F3C0;
  if (!qword_25722F3C0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63718, &type metadata for OptionalParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F3C0);
  }
  return result;
}

unint64_t sub_242C40F68()
{
  unint64_t result;

  result = qword_25722F3C8;
  if (!qword_25722F3C8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63600, &unk_2513941C0);
    atomic_store(result, (unint64_t *)&qword_25722F3C8);
  }
  return result;
}

unint64_t sub_242C40FA8()
{
  unint64_t result;

  result = qword_25722F3D0;
  if (!qword_25722F3D0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63628, &unk_2513941C0);
    atomic_store(result, (unint64_t *)&qword_25722F3D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_16_54()
{
  return sub_242C49448();
}

uint64_t OUTLINED_FUNCTION_17_56()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 32);
}

uint64_t OUTLINED_FUNCTION_23_55(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)v1 = result;
  *(_WORD *)(v1 + 8) = 256;
  *(_BYTE *)(v1 + 10) = v2 != 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_28_54()
{
  return sub_242C49478();
}

uint64_t OUTLINED_FUNCTION_32_45()
{
  return sub_242C490AC();
}

uint64_t OUTLINED_FUNCTION_34_45()
{
  return sub_242C49160();
}

void OUTLINED_FUNCTION_42_38()
{
  sub_242A79038();
}

uint64_t OUTLINED_FUNCTION_43_37()
{
  return sub_242A79120();
}

uint64_t OUTLINED_FUNCTION_51_35()
{
  return sub_242C48F5C();
}

uint64_t static Framework.name.getter()
{
  return 0x654E6C617275654ELL;
}

unint64_t static Framework.bundleIdentifier.getter()
{
  return 0xD000000000000018;
}

ValueMetadata *type metadata accessor for Framework()
{
  return &type metadata for Framework;
}

double sub_242C41100@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/OptimizerOps.swift";
  *(_OWORD *)(a1 + 8) = xmmword_242C4D6C0;
  *(_QWORD *)&result = 82;
  *(_OWORD *)(a1 + 24) = xmmword_242C586B0;
  *(_QWORD *)(a1 + 40) = "init(id:parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:creationSite:)";
  *(_QWORD *)(a1 + 48) = 93;
  *(_WORD *)(a1 + 56) = 2;
  return result;
}

float SGD.learningRate.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void SGD.learningRate.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*SGD.learningRate.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

float SGD.momentum.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

float SGD.gradientScale.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

uint64_t SGD.usesNesterovMomentum.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 12);
}

void SGD.gradientClippingMode.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  char v3;

  v2 = *(_DWORD *)(v1 + 24);
  v3 = *(_BYTE *)(v1 + 28);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 12) = v3;
  *(_DWORD *)(a1 + 8) = v2;
}

void SGD.regularizationKind.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 32);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 36);
  *(_DWORD *)a1 = v2;
}

uint64_t SGD.velocity.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  return sub_242C480E0();
}

uint64_t SGD.velocity.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = v2;
  return result;
}

uint64_t (*SGD.velocity.modify())(_QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t SGD.init(for:learningRate:momentum:usesNesterovMomentum:gradientClippingMode:regularizationKind:gradientScale:)(uint64_t a1, double a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v11 = MEMORY[0x24BDAC7A8](a1).n128_f32[0];
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v11 < 0.0)
  {
    OUTLINED_FUNCTION_42_2();
    v15 = 40;
LABEL_9:
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_80_1();
    goto LABEL_10;
  }
  if (a3 >= 0.0)
  {
    if (*(unsigned __int8 *)(v9 + 4) == 255 || *(float *)v9 > 0.0)
    {
      (*(void (**)(char *))(v10 + 16))(v13);
      OptimizerStateDictionary.init(_:)((uint64_t)v13, a7, (uint64_t)&v16);
    }
    OUTLINED_FUNCTION_42_2();
    v15 = 43;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_42_2();
  v15 = 41;
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_80_1();
LABEL_10:
  result = sub_242C48F5C();
  __break(1u);
  return result;
}

uint64_t (*SGD.update(_:with:)(uint64_t a1, unint64_t a2, uint64_t a3))(_BYTE *, _QWORD)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_signpost_type_t v25;
  uint8_t *v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  const char **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  __n128 v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, _QWORD);
  uint64_t v56;
  float v57;
  unint64_t v58;
  __n128 *v59;
  uint64_t v60;
  unsigned int v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(unint64_t, unint64_t);
  uint64_t v72;
  unint64_t v73;
  int v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  __n128 *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  float v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  char *v131;
  os_signpost_type_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint8_t *v137;
  os_signpost_id_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  __n128 v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  const char **v156;
  uint64_t v157;
  uint64_t v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  void (*v169)(unint64_t, uint64_t);
  char *v170;
  uint64_t v171;
  uint64_t v172;
  __int128 v173;
  uint64_t v174;
  uint64_t v175;
  __int128 v176;
  void (*v177)(char *, _QWORD);
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t TupleTypeMetadata2;
  unint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  __n128 v196;
  __int128 v197;
  __int128 v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202[10];
  uint64_t v203[7];
  unint64_t v204;
  __n128 v205;
  __int128 v206;
  __int128 v207;
  int v208;
  char v209[32];
  const char *v210;
  __int128 v211;
  __int128 v212;
  const char *v213;
  uint64_t v214;
  __int16 v215;
  uint64_t v216;

  v186 = a1;
  v216 = *MEMORY[0x24BDAC8D0];
  v6 = sub_242C49208();
  v164 = *(_QWORD *)(v6 - 8);
  v165 = (_QWORD *)v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_6();
  v163 = v7;
  v8 = sub_242C47F3C();
  v161 = *(_QWORD *)(v8 - 8);
  v162 = v8;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_6();
  v160 = v9;
  v172 = sub_242C47F0C();
  v10 = *(_QWORD *)(v172 - 8);
  MEMORY[0x24BDAC7A8](v172);
  v170 = (char *)&v158 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v158 - v13;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (unint64_t)&v158 - v17;
  v189 = MEMORY[0x2494EDE24](&unk_242C63888, a3, v16);
  v179 = v3;
  nullsub_1(a3, v189, v19);
  v190 = a3;
  v183 = *(_QWORD *)(a3 + 16);
  sub_242C48E30();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v188 = a2;
  v20 = MEMORY[0x2494EC198](a2);
  sub_242A5E910(0, v20 & ~(v20 >> 63), 0, MEMORY[0x24BEE4AF8]);
  v180 = v21;
  if (qword_257220558 != -1)
LABEL_88:
    swift_once();
  v22 = sub_242C47F30();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_257223360);
  sub_242C47F00();
  v168 = v23;
  v24 = sub_242C47F24();
  v25 = sub_242C489A4();
  if ((sub_242C48A34() & 1) != 0)
  {
    v26 = (uint8_t *)OUTLINED_FUNCTION_38_2();
    *(_WORD *)v26 = 0;
    v27 = sub_242C47EF4();
    _os_signpost_emit_with_name_impl(&dword_242A44000, v24, v25, v27, "Optimizing", "", v26, 2u);
    OUTLINED_FUNCTION_37_2();
  }

  v28 = v172;
  (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v14, v18, v172);
  sub_242C47F60();
  swift_allocObject();
  v171 = sub_242C47F54();
  v169 = *(void (**)(unint64_t, uint64_t))(v10 + 8);
  v169(v18, v28);
  OUTLINED_FUNCTION_97_0();
  OUTLINED_FUNCTION_20_61();
  v29 = MEMORY[0x24BEE4AF8];
  sub_242A85A44(MEMORY[0x24BEE4AF8], (uint64_t)&unk_25137CCE0, (uint64_t)&v210, (uint64_t *)&v205);
  v30 = OUTLINED_FUNCTION_6_11();
  v195 = v205.n128_u64[0];
  v10 = v179;
  if (*(unsigned __int8 *)(v179 + 28) != 255
    && (unint64_t)*(unsigned __int8 *)(v179 + 28) << 32 == 0x200000000)
  {
    v18 = *(_QWORD *)(v179 + 16);
    if ((v18 & 0x100000000) != 0)
    {
      v196.n128_u64[0] = v188;
      MEMORY[0x24BDAC7A8](v30);
      v156 = v34;
      v157 = v189;
      v35 = sub_242C48650();
      v36 = MEMORY[0x2494EDE24](MEMORY[0x24BEE12E0], v35);
      sub_242A7DAD0((void (*)(char *, uint64_t))sub_242A85EAC, (uint64_t)(&v158 - 4), v35, (uint64_t)&type metadata for Tensor, MEMORY[0x24BEE4078], v36, MEMORY[0x24BEE40A8], v37);
      v191 = 0;
      v196.n128_u8[0] = 13;
      Tensor.init(stacking:alongAxis:scalarType:)();
      v205.n128_u64[0] = (unint64_t)v210;
      Tensor.sum()();
      swift_release();
      v38 = v196.n128_u64[0];
      OUTLINED_FUNCTION_97_0();
      v18 = *(unsigned __int8 *)(*(_QWORD *)(v38 + 16) + 160);
      OUTLINED_FUNCTION_20_61();
      v202[0] = v29;
      v209[0] = v18;
      sub_242A66290((uint64_t)&v210, (uint64_t)&v205);
      Tensor.init(shape:coercingScalars:scalarType:on:)();
      sub_242A662D8((uint64_t)&v210);
      v39 = v203[0];
      OUTLINED_FUNCTION_6_11();
      v196.n128_u64[0] = v38;
      v205.n128_u64[0] = v39;
      static Tensor.* infix(_:_:)();
      v205.n128_u64[0] = (unint64_t)v210;
      sqrt(_:)();
      swift_release();
      OUTLINED_FUNCTION_17_5();
      OUTLINED_FUNCTION_135();
      v33 = v196.n128_u64[0];
      swift_release();
    }
    else
    {
      OUTLINED_FUNCTION_97_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
      v32 = OUTLINED_FUNCTION_2_0();
      *(_OWORD *)(v32 + 16) = xmmword_242C4B7D0;
      *(_DWORD *)(v32 + 32) = v18;
      OUTLINED_FUNCTION_20_61();
      sub_242A85A44(MEMORY[0x24BEE4AF8], v32, (uint64_t)&v210, (uint64_t *)&v205);
      OUTLINED_FUNCTION_6_11();
      v33 = v205.n128_u64[0];
      swift_release();
      v191 = 0;
    }
    v195 = v33;
  }
  else
  {
    v191 = 0;
  }
  sub_242A5E1D4();
  v194 = v40;
  v41 = v180;
  if (v20 < 0)
    __break(1u);
  if (v20)
  {
    v14 = 0;
    v159 = *MEMORY[0x24BEE38B8];
    v178 = MEMORY[0x24BEE4AE0] + 8;
    v176 = xmmword_242C4B7D0;
    v173 = xmmword_242C4B7F0;
    v167 = xmmword_242C4D6C0;
    v166 = xmmword_242C586B0;
    v182 = v20;
    while (1)
    {
      if (v14 == (char *)v20)
      {
        __break(1u);
        goto LABEL_88;
      }
      v42 = v20;
      sub_242C48680();
      v43 = v196;
      swift_retain();
      v44 = OUTLINED_FUNCTION_39_0();
      v192 = &v158;
      MEMORY[0x24BDAC7A8](v44);
      v45 = (unint64_t)(&v158 - 10);
      v46 = v189;
      v47 = v190;
      *(&v158 - 8) = v190;
      *(&v158 - 7) = v46;
      *(&v158 - 6) = v43.n128_i64[1];
      *(&v158 - 5) = v10;
      *(&v158 - 4) = (uint64_t)&v195;
      *(&v158 - 3) = v43.n128_u64[0];
      v156 = (const char **)&v194;
      swift_retain();
      v48 = sub_242C48B54();
      if ((v49 & 1) != 0)
        break;
      MEMORY[0x24BDAC7A8](v48);
      v50 = *(_QWORD *)(v47 + 24);
      *(&v158 - 6) = v183;
      *(&v158 - 5) = v50;
      *(&v158 - 4) = v51;
      *(&v158 - 3) = (uint64_t)sub_242A85FF8;
      v156 = (const char **)(&v158 - 10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221160);
      v20 = v182;
      v52 = v191;
      sub_242BA1484();
      v191 = v52;
      swift_release();
LABEL_78:
      v125 = sub_242B89308();
      v18 = *(_QWORD *)(v41 + 16);
      v126 = *(_QWORD *)(v41 + 24);
      if (v18 >= v126 >> 1)
      {
        sub_242A5E910(v126 > 1, v18 + 1, 1, v41);
        v41 = v127;
      }
      ++v14;
      *(_QWORD *)(v41 + 16) = v18 + 1;
      *(_QWORD *)(v41 + 8 * v18 + 32) = v125;
      OUTLINED_FUNCTION_23_5();
      OUTLINED_FUNCTION_23_5();
      if (v14 == (char *)v20)
        goto LABEL_81;
    }
    v53 = swift_modifyAtWritableKeyPath();
    v55 = (void (*)(char *, _QWORD))v53;
    if ((*(_BYTE *)(v54 + 8) & 1) != 0)
    {
      v20 = v42;
LABEL_77:
      v55(v209, 0);
      swift_release();
      goto LABEL_78;
    }
    v56 = v54;
    v177 = (void (*)(char *, _QWORD))v53;
    v57 = *(float *)(v10 + 8);
    v20 = v42;
    v185 = v54;
    if (v57 == 1.0)
    {
      OUTLINED_FUNCTION_39_0();
      v58 = v43.n128_u64[1];
    }
    else
    {
      OUTLINED_FUNCTION_97_0();
      v45 = *(unsigned __int8 *)(*(_QWORD *)(v43.n128_u64[1] + 16) + 160);
      OUTLINED_FUNCTION_12_53();
      v204 = MEMORY[0x24BEE4AF8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
      v59 = (__n128 *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_27_43(v59);
      OUTLINED_FUNCTION_11_62();
      OUTLINED_FUNCTION_39_0();
      OUTLINED_FUNCTION_0_101();
      OUTLINED_FUNCTION_26_54();
      v60 = v202[0];
      OUTLINED_FUNCTION_6_11();
      v205.n128_u64[0] = v43.n128_u64[1];
      v203[0] = v60;
      static Tensor.* infix(_:_:)();
      v56 = v185;
      swift_release();
      swift_release();
      v58 = v196.n128_u64[0];
    }
    v61 = *(unsigned __int8 *)(v10 + 28);
    v180 = v41;
    if (v61 <= 0xFEuLL)
    {
      v45 = *(_QWORD *)(v10 + 16);
      v41 = *(unsigned int *)(v10 + 24) | ((unint64_t)v61 << 32);
      if ((_BYTE)v61)
      {
        v62 = v195;
        OUTLINED_FUNCTION_28_55();
        if (HIDWORD(v41) == 1)
        {
          v64 = *(_BYTE *)(v63 + 160);
          OUTLINED_FUNCTION_12_53();
          v204 = MEMORY[0x24BEE4AF8];
          __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
          v65 = OUTLINED_FUNCTION_2_0();
          *(_OWORD *)(v65 + 16) = v176;
          *(_DWORD *)(v65 + 32) = v45;
          LOBYTE(v193) = v64;
          OUTLINED_FUNCTION_11_62();
          OUTLINED_FUNCTION_11();
          swift_retain();
          OUTLINED_FUNCTION_0_101();
          OUTLINED_FUNCTION_26_54();
          v41 = v202[0];
          OUTLINED_FUNCTION_6_11();
          v205.n128_u64[0] = v58;
          Tensor.squared()();
          v45 = v62;
          v203[0] = v196.n128_u64[0];
          Tensor.sum()();
          OUTLINED_FUNCTION_19_5();
          v203[0] = v205.n128_u64[0];
          sqrt(_:)();
          OUTLINED_FUNCTION_135();
          v66 = v196.n128_u64[0];
          v205.n128_u64[0] = v58;
          v196.n128_u64[0] = v41;
          v203[0] = v66;
          v204 = v41;
          max(_:_:)();
          v204 = v202[0];
          static Tensor./ infix(_:_:)();
          OUTLINED_FUNCTION_19_5();
          v202[0] = v203[0];
          static Tensor.* infix(_:_:)();
          OUTLINED_FUNCTION_23_5();
          swift_release();
          OUTLINED_FUNCTION_19_5();
          OUTLINED_FUNCTION_17_5();
        }
        else
        {
          v67 = *(_BYTE *)(v63 + 160);
          OUTLINED_FUNCTION_12_53();
          v204 = MEMORY[0x24BEE4AF8];
          __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
          v68 = OUTLINED_FUNCTION_2_0();
          *(_OWORD *)(v68 + 16) = v176;
          *(_DWORD *)(v68 + 32) = v41;
          LOBYTE(v193) = v67;
          OUTLINED_FUNCTION_11_62();
          OUTLINED_FUNCTION_11();
          swift_retain();
          OUTLINED_FUNCTION_0_101();
          OUTLINED_FUNCTION_26_54();
          v69 = v202[0];
          v184 = v202[0];
          OUTLINED_FUNCTION_6_11();
          v196.n128_u64[0] = v58;
          v203[0] = v69;
          static Tensor.* infix(_:_:)();
          v181 = v205.n128_u64[0];
          v203[0] = v205.n128_u64[0];
          v196.n128_u64[0] = v62;
          LOBYTE(v204) = *(_BYTE *)(*(_QWORD *)(v58 + 16) + 160);
          v41 = v163;
          v70 = v164;
          v45 = (unint64_t)v165;
          (*(void (**)(unint64_t, _QWORD, _QWORD *))(v164 + 104))(v163, v159, v165);
          Tensor.cast(to:roundingRule:)();
          v71 = *(void (**)(unint64_t, unint64_t))(v70 + 8);
          v20 = v182;
          v71(v41, v45);
          v204 = v202[0];
          static Tensor./ infix(_:_:)();
          OUTLINED_FUNCTION_23_5();
          OUTLINED_FUNCTION_19_5();
          swift_release();
          OUTLINED_FUNCTION_135();
        }
        swift_release();
        v10 = v179;
        v56 = v185;
      }
      else
      {
        v205.n128_u64[0] = v58;
        Tensor.clamped(to:)((uint64_t)&v196, *(float *)&v45, *((float *)&v45 + 1));
        v56 = v185;
        OUTLINED_FUNCTION_17_1();
      }
    }
    else
    {
      v196.n128_u64[0] = v58;
    }
    v72 = *(_QWORD *)(*(_QWORD *)v56 + 32);
    if ((~v72 & 0xF000000000000007) == 0)
    {
      OUTLINED_FUNCTION_42_2();
      v158 = 329;
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_80_1();
      goto LABEL_95;
    }
    if ((v72 & 0x8000000000000000) == 0)
    {
      OUTLINED_FUNCTION_42_2();
      v158 = 325;
LABEL_93:
      OUTLINED_FUNCTION_24_0();
      goto LABEL_94;
    }
    v73 = v196.n128_u64[0];
    OUTLINED_FUNCTION_10();
    sub_242A70278(v72);
    if (qword_257220500 != -1)
      swift_once();
    v181 = v72;
    swift_beginAccess();
    v184 = v73;
    if (byte_257220DE8 == 1)
    {
      if (*(unsigned __int8 *)(v10 + 36) == 255)
      {
        OUTLINED_FUNCTION_10();
        v175 = v73;
      }
      else
      {
        OUTLINED_FUNCTION_3_86(*(_BYTE *)(v10 + 36));
        v175 = v196.n128_u64[0];
      }
      v74 = *(_DWORD *)v10;
      v75 = *(_BYTE *)(*(_QWORD *)((v72 & 0x7FFFFFFFFFFFFFFFLL) + 0x10) + 160);
      OUTLINED_FUNCTION_97_0();
      v202[0] = MEMORY[0x24BEE4AF8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
      v76 = OUTLINED_FUNCTION_2_0();
      *(_OWORD *)(v76 + 16) = v176;
      *(_DWORD *)(v76 + 32) = v74;
      LOBYTE(v204) = v75;
      OUTLINED_FUNCTION_12_53();
      Tensor.init(shape:coercingScalars:scalarType:on:)();
      v77 = OUTLINED_FUNCTION_6_11();
      v81 = v10;
      v82 = v203[0];
      v83 = *(float *)(v81 + 4);
      if (v83 > 0.0)
      {
        if (!*(_QWORD *)(v81 + 48))
        {
          v205.n128_u64[0] = *(_QWORD *)(v81 + 40);
          OUTLINED_FUNCTION_1_89(v77, v78, v79, v80);
          sub_242C480E0();
          OUTLINED_FUNCTION_34_46(v43.n128_i64[0], (uint64_t)sub_242A85E84);
        }
        v205.n128_u64[0] = *(_QWORD *)(v81 + 40);
        v84 = OUTLINED_FUNCTION_1_89(v77, v78, v79, v80);
        v85 = OptimizerStateDictionary.subscript.getter(v43.n128_i64[0], v84);
        v86 = v196.n128_u64[0];
        if (!v196.n128_u64[0])
          goto LABEL_45;
        v114 = v191;
        MEMORY[0x24BDAC7A8](v85);
        OUTLINED_FUNCTION_29_38();
        *(_QWORD *)(v115 - 48) = v175;
        *(_QWORD *)(v115 - 40) = v86;
        v116 = v179;
        *(_QWORD *)(v115 - 32) = v82;
        *(_QWORD *)(v115 - 24) = v116;
        *(_QWORD *)(v115 - 16) = v43.n128_u64[0];
        sub_242A81DD4();
        v191 = v114;
        swift_release();
        OUTLINED_FUNCTION_17_1();
        OUTLINED_FUNCTION_19_5();
        OUTLINED_FUNCTION_135();
        v20 = v182;
        goto LABEL_64;
      }
      v203[0] = v72 & 0x7FFFFFFFFFFFFFFFLL;
      v202[0] = v175;
      v204 = 0;
      v193 = v82;
      basicSGD(parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:)((uint64_t *)&v196, (uint64_t *)&v205, v203, v202, (uint64_t *)&v204, v83, (uint64_t)&v193, *(_BYTE *)(v81 + 12));
      OUTLINED_FUNCTION_17_5();
      swift_release();
      OUTLINED_FUNCTION_19_5();
    }
    else
    {
      if (*(unsigned __int8 *)(v10 + 36) == 255)
      {
        OUTLINED_FUNCTION_10();
      }
      else
      {
        OUTLINED_FUNCTION_3_86(*(_BYTE *)(v10 + 36));
        v73 = v196.n128_u64[0];
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221168);
      v87 = OUTLINED_FUNCTION_2_0();
      *(_OWORD *)(v87 + 16) = v173;
      *(_QWORD *)(v87 + 32) = v72 & 0x7FFFFFFFFFFFFFFFLL;
      v88 = v87 + 32;
      *(_QWORD *)(v87 + 40) = v73;
      sub_242A70278(v181);
      v175 = v73;
      OUTLINED_FUNCTION_10();
      sub_242C480E0();
      v89 = 0;
      v90 = 0;
      while (1)
      {
        v91 = v89;
        sub_242A66290(*(_QWORD *)(*(_QWORD *)(v88 + 8 * v90) + 16) + 168, (uint64_t)&v196);
        if (*((_QWORD *)&v197 + 1))
          break;
        OUTLINED_FUNCTION_6_11();
        v89 = 1;
        v90 = 1;
        if ((v91 & 1) != 0)
        {
          OUTLINED_FUNCTION_136();
          v208 = 0;
          v206 = 0u;
          v207 = 0u;
          v205 = 0u;
          goto LABEL_52;
        }
      }
      OUTLINED_FUNCTION_136();
      v205 = v196;
      v206 = v197;
      v207 = v198;
      v208 = v199;
LABEL_52:
      OUTLINED_FUNCTION_136();
      OUTLINED_FUNCTION_97_0();
      v204 = MEMORY[0x24BEE4AF8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_257221108);
      v92 = (__n128 *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_27_43(v92);
      sub_242A66290((uint64_t)&v196, (uint64_t)v203);
      OUTLINED_FUNCTION_0_101();
      v93 = OUTLINED_FUNCTION_6_11();
      v97 = *(float *)(v10 + 4);
      v174 = v202[0];
      if (v97 <= 0.0)
      {
        v103 = *(_QWORD *)((v72 & 0x7FFFFFFFFFFFFFFFLL) + 0x10);
        v104 = *(_QWORD *)(v175 + 16);
        v105 = *(_QWORD *)(v202[0] + 16);
        v106 = *(_BYTE *)(v10 + 12);
        v211 = v167;
        v212 = v166;
        v210 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/OptimizerOps.swift";
        v213 = "init(id:parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:creationSite:)";
        v214 = 93;
        v215 = 2;
        type metadata accessor for StochasticGradientDescentOperation();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_91();
        swift_retain();
        OUTLINED_FUNCTION_11();
        v156 = &v210;
        sub_242A55E24(0, 0, 0, v97, v103, v104, 0, v105, v106);
        v108 = v107;
        OUTLINED_FUNCTION_11_62();
        sub_242A66290((uint64_t)v203, (uint64_t)v202);
        type metadata accessor for ContextManager();
        OUTLINED_FUNCTION_11();
        sub_242B93328();
        OUTLINED_FUNCTION_36_37();
        OUTLINED_FUNCTION_135();
        v109 = v201;
        OUTLINED_FUNCTION_10();
        sub_242A5DC30((uint64_t)&v196);
        sub_242B93328();
        OUTLINED_FUNCTION_36_37();
        OUTLINED_FUNCTION_135();
        v110 = v200;
        OUTLINED_FUNCTION_91();
        sub_242A5DC30((uint64_t)&v196);
        type metadata accessor for TensorRepresentation();
        v111 = OUTLINED_FUNCTION_2_0();
        v196.n128_u8[0] = 1;
        v112 = sub_242B4C934(v108, 0, v202, 0x100000000, v109, v110, v111);
        type metadata accessor for TensorHandle();
        v113 = OUTLINED_FUNCTION_2_0();
        *(_QWORD *)(v113 + 16) = v112;
        OUTLINED_FUNCTION_91();
        sub_242BC995C();
        OUTLINED_FUNCTION_135();
        sub_242A662D8((uint64_t)v203);
        OUTLINED_FUNCTION_17_1();
        swift_release();
        swift_release();
        v196.n128_u64[0] = v113;
      }
      else
      {
        v99 = v10 + 40;
        v98 = *(_QWORD *)(v10 + 40);
        if (!*(_QWORD *)(v99 + 8))
        {
          v203[0] = v98;
          OUTLINED_FUNCTION_1_89(v93, v94, v95, v96);
          sub_242C480E0();
          OUTLINED_FUNCTION_34_46(v43.n128_i64[0], (uint64_t)sub_242A85E84);
        }
        v203[0] = v98;
        v100 = OUTLINED_FUNCTION_1_89(v93, v94, v95, v96);
        v101 = OptimizerStateDictionary.subscript.getter(v43.n128_i64[0], v100);
        v102 = v196.n128_u64[0];
        if (!v196.n128_u64[0])
        {
LABEL_45:
          OUTLINED_FUNCTION_13_68();
          sub_242A59264();
        }
        v117 = v191;
        MEMORY[0x24BDAC7A8](v101);
        OUTLINED_FUNCTION_29_38();
        v118 = v174;
        *(_QWORD *)(v119 - 48) = v175;
        *(_QWORD *)(v119 - 40) = v102;
        v120 = v179;
        *(_QWORD *)(v119 - 32) = v118;
        *(_QWORD *)(v119 - 24) = v120;
        *(_QWORD *)(v119 - 16) = &v205;
        *(_QWORD *)(v119 - 8) = v43.n128_u64[0];
        sub_242A81DD4();
        v191 = v117;
        OUTLINED_FUNCTION_17_5();
        OUTLINED_FUNCTION_17_1();
        OUTLINED_FUNCTION_135();
      }
      OUTLINED_FUNCTION_26_54();
    }
    swift_release();
LABEL_64:
    v58 = v196.n128_u64[0];
    v121 = v194;
    OUTLINED_FUNCTION_11();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_41_3();
      v121 = v128;
    }
    v10 = v179;
    v45 = *(_QWORD *)(v121 + 16);
    if (v45 >= *(_QWORD *)(v121 + 24) >> 1)
    {
      OUTLINED_FUNCTION_41_3();
      v121 = v129;
    }
    *(_QWORD *)(v121 + 16) = v45 + 1;
    *(_QWORD *)(v121 + 8 * v45 + 32) = v58;
    v194 = v121;
    v122 = v185;
    if ((*(_BYTE *)(v185 + 8) & 1) == 0)
    {
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        v41 = *(_QWORD *)(*(_QWORD *)v122 + 32);
        if ((~v41 & 0xF000000000000007) == 0)
        {
          OUTLINED_FUNCTION_42_2();
          v158 = 317;
          goto LABEL_93;
        }
        if ((v41 & 0x8000000000000000) != 0)
        {
          v45 = *(_QWORD *)(v41 + 16);
          if ((sub_242C00B0C(*(_QWORD *)(*(_QWORD *)(v58 + 16) + 152), *(_QWORD *)(v45 + 152)) & 1) == 0)
          {
            while (1)
            {
              v196.n128_u64[0] = 0;
              v196.n128_u64[1] = 0xE000000000000000;
              OUTLINED_FUNCTION_11();
              sub_242A70278(v41);
              sub_242C48C38();
              OUTLINED_FUNCTION_90_0();
              v153 = *(_QWORD *)(v45 + 152);
              sub_242C480E0();
              v41 = MEMORY[0x24BEE1768];
              MEMORY[0x2494EC0FC](v153, MEMORY[0x24BEE1768]);
              OUTLINED_FUNCTION_90_0();
              OUTLINED_FUNCTION_34();
              swift_bridgeObjectRelease();
              sub_242C48314();
              v45 = *(_QWORD *)(*(_QWORD *)(v58 + 16) + 152);
              v154 = sub_242C480E0();
              MEMORY[0x2494EC0FC](v154, v41);
              v58 = v155;
              OUTLINED_FUNCTION_90_0();
              OUTLINED_FUNCTION_34();
              swift_bridgeObjectRelease();
              sub_242C48314();
              OUTLINED_FUNCTION_42_2();
              v158 = 116;
LABEL_94:
              OUTLINED_FUNCTION_80_1();
LABEL_95:
              sub_242C48F5C();
              __break(1u);
            }
          }
          v196.n128_u64[0] = v58 | 0x8000000000000000;
          OUTLINED_FUNCTION_11();
          sub_242A70278(v41);
          sub_242A783A0((uint64_t *)&v196);
          sub_242A70294(v41);
        }
        else
        {
          v196.n128_u64[0] = v58 | 0x8000000000000000;
          OUTLINED_FUNCTION_11();
          sub_242A783A0((uint64_t *)&v196);
        }
      }
      else
      {
        v196.n128_u64[0] = v58;
        v123 = *(unsigned int *)(*(_QWORD *)v122 + 16);
        type metadata accessor for LayerVariableReference();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_11();
        v205.n128_u8[0] = 0;
        sub_242A78538((uint64_t *)&v196, v123);
        *(_QWORD *)v122 = v124;
        OUTLINED_FUNCTION_17_1();
      }
    }
    swift_release();
    sub_242A70294(v181);
    swift_release();
    v41 = v180;
    v55 = v177;
    goto LABEL_77;
  }
LABEL_81:
  v130 = sub_242C47F24();
  v131 = v170;
  sub_242C47F48();
  v132 = sub_242C48998();
  if ((sub_242C48A34() & 1) != 0)
  {
    swift_retain();
    v133 = v160;
    sub_242C47F6C();
    swift_release();
    v135 = v161;
    v134 = v162;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v161 + 88))(v133, v162) == *MEMORY[0x24BEE7810])
    {
      v136 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v133, v134);
      v136 = "";
    }
    v137 = (uint8_t *)OUTLINED_FUNCTION_38_2();
    *(_WORD *)v137 = 0;
    v138 = sub_242C47EF4();
    _os_signpost_emit_with_name_impl(&dword_242A44000, v130, v132, v138, "Optimizing", v136, v137, 2u);
    OUTLINED_FUNCTION_37_2();
  }
  swift_release();

  v169((unint64_t)v131, v172);
  v139 = v194;
  swift_release();
  v140 = sub_242A707C8(v41);
  v196.n128_u64[0] = 1;
  v196.n128_u64[1] = v140;
  Array<A>.resolve(descriptor:)(&v196, v139, v141, v142, v143, v144, v145, v146, v147, v148);
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_34();
  v149 = v189;
  v150 = v190;
  j_nullsub_1(v190, v189, v151);
  return sub_242C2B268(v10, v150, v149);
}

void sub_242C42908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[9];
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[56];
  _BYTE v35[56];
  const char *v36;
  __int128 v37;
  __int128 v38;
  const char *v39;
  uint64_t v40;
  __int16 v41;

  v30 = *a8;
  v11 = *(_QWORD *)(a2 + 16);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(a4 + 16);
  v14 = *(_QWORD *)(a5 + 16);
  v15 = *(float *)(a6 + 4);
  v16 = *(_BYTE *)(a6 + 12);
  v37 = xmmword_242C4D6C0;
  v38 = xmmword_242C586B0;
  v36 = "/Library/Caches/com.apple.xbs/Sources/NeuralNetworks/Sources/NeuralNetworks/LazyCore/Operations/OptimizerOps.swift";
  v39 = "init(id:parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:creationSite:)";
  v40 = 93;
  v41 = 2;
  type metadata accessor for StochasticGradientDescentOperation();
  swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_242A55E24(0, 0, 0, v15, v11, v12, v13, v14, v16);
  v18 = v17;
  sub_242A66290(a7, (uint64_t)v35);
  sub_242A66290((uint64_t)v35, (uint64_t)v34);
  type metadata accessor for ContextManager();
  swift_retain();
  sub_242B93328();
  sub_242B933C0((uint64_t)v31);
  swift_release();
  v19 = v33;
  swift_retain();
  sub_242A5DC30((uint64_t)v31);
  sub_242B93328();
  sub_242B933C0((uint64_t)v31);
  swift_release();
  v20 = v32;
  swift_retain();
  sub_242A5DC30((uint64_t)v31);
  type metadata accessor for TensorRepresentation();
  v21 = swift_allocObject();
  LOBYTE(v31[0]) = 1;
  v22 = sub_242B4C934(v18, 0, v34, 0x100000000, v19, v20, v21);
  type metadata accessor for TensorHandle();
  *(_QWORD *)(swift_allocObject() + 16) = v22;
  swift_retain();
  sub_242BC995C();
  swift_release();
  sub_242A662D8((uint64_t)v35);
  sub_242A66290(a7, (uint64_t)v35);
  sub_242A66290((uint64_t)v35, (uint64_t)v34);
  swift_retain();
  sub_242B93328();
  sub_242B933C0((uint64_t)v31);
  swift_release();
  v23 = v33;
  swift_retain();
  sub_242A5DC30((uint64_t)v31);
  sub_242B93328();
  sub_242B933C0((uint64_t)v31);
  swift_release();
  v24 = v32;
  swift_retain();
  sub_242A5DC30((uint64_t)v31);
  v25 = swift_allocObject();
  LOBYTE(v31[0]) = 1;
  v26 = sub_242B4C934(v18, 1, v34, 0x100000000, v23, v24, v25);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v26;
  swift_retain();
  sub_242BC995C();
  swift_release();
  sub_242A662D8((uint64_t)v35);
  v31[0] = v27;
  v29 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(v30 + *MEMORY[0x24BEE2B70]), a9, v28);
  swift_retain();
  swift_retain();
  OptimizerStateDictionary.subscript.setter(v31, (uint64_t)a8, v29);
}

uint64_t sub_242C42C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t result;
  _QWORD *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257221168);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_242C4B7F0;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v0;
  swift_retain();
  swift_retain();
  sub_242B89200(inited);
  swift_release();
  swift_release();
  swift_setDeallocating();
  result = sub_242B71334();
  *v4 = v0;
  return result;
}

uint64_t sub_242C42CEC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = *a6;
  v17 = a2;
  v18 = a1;
  v15 = a4;
  v16 = a3;
  result = basicSGD(parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:)(&v20, &v19, &v18, &v17, &v16, *(float *)(a5 + 4), (uint64_t)&v15, *(_BYTE *)(a5 + 12));
  if (v19)
  {
    v20 = v19;
    v14 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(v11 + *MEMORY[0x24BEE2B70]), a7, v13);
    swift_retain_n();
    swift_retain();
    OptimizerStateDictionary.subscript.setter(&v20, (uint64_t)a6, v14);
  }
  *a8 = v20;
  return result;
}

uint64_t sub_242C42E40()
{
  unint64_t v0;

  v0 = sub_242C49064();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_242C42E8C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_242C42EC4
                                                            + 4 * asc_242C63858[a1]))(0x6F69746172657469, 0xE90000000000006ELL);
}

uint64_t sub_242C42EC4()
{
  return 0x676E696E7261656CLL;
}

uint64_t sub_242C42EE4()
{
  return 0x6D75746E656D6F6DLL;
}

unint64_t sub_242C42EFC()
{
  return 0xD000000000000014;
}

unint64_t sub_242C42F48()
{
  return 0xD000000000000012;
}

uint64_t sub_242C42F68()
{
  return 0x797469636F6C6576;
}

uint64_t sub_242C42F88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t (**v35)(_QWORD, _QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _DWORD v47[7];
  char v48;
  uint64_t v49[13];
  uint64_t v50[7];

  v7 = v5;
  v10 = *a2;
  v11 = *a3;
  v12 = sub_242A57DA4();
  swift_beginAccess();
  if (*v12 == 1)
  {
    v13 = *(_DWORD *)(v7 + 32);
    BYTE4(v41[0]) = *(_BYTE *)(v7 + 36);
    LODWORD(v41[0]) = v13;
    v50[0] = v11;
    v49[0] = v10;
    sub_242A6621C(v50, &v42);
    v14 = v42;
    *(_QWORD *)&v42 = v10;
    Tensor.elementType.getter(v49);
    LODWORD(v45) = 0;
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    Tensor.init(coercing:scalarType:on:)((char *)v49, (uint64_t)&v42, v50);
    v16 = *(float *)(v7 + 4);
    if (v16 <= 0.0)
    {
      v49[0] = v10;
      v40 = 0;
      v41[0] = v14;
      v39 = v50[0];
      basicSGD(parameter:gradient:velocity:learningRate:momentum:usesNesterovMomentum:)((uint64_t *)&v42, v50, v49, v41, &v40, v16, (uint64_t)&v39, *(_BYTE *)(v7 + 12));
      swift_release();
      swift_release();
      result = swift_release();
      *a5 = v42;
    }
    else
    {
      if (!*(_QWORD *)(v7 + 48))
      {
        v50[0] = *(_QWORD *)(v7 + 40);
        v37 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v15);
        sub_242C480E0();
        OptimizerStateDictionary.subscript.getter(a1, (uint64_t)sub_242A85E84, v10, v37);
      }
      v50[0] = *(_QWORD *)(v7 + 40);
      v17 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v15);
      v18 = OptimizerStateDictionary.subscript.getter(a1, v17);
      if (!(_QWORD)v42)
        goto LABEL_9;
      MEMORY[0x24BDAC7A8](v18);
      sub_242A81DD4();
      swift_release();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    v19 = *(_DWORD *)(v7 + 32);
    BYTE4(v41[0]) = *(_BYTE *)(v7 + 36);
    LODWORD(v41[0]) = v19;
    v50[0] = v11;
    v49[0] = v10;
    sub_242A6621C(v50, &v42);
    v20 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257221168);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_242C4B7F0;
    *(_QWORD *)(inited + 32) = v10;
    *(_QWORD *)(inited + 40) = v20;
    v24 = nullsub_1(inited, v22, v23);
    swift_retain();
    swift_retain();
    sub_242B7661C(v24, (uint64_t)v50);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v42 = v10;
    Tensor.elementType.getter(v41);
    LODWORD(v45) = 0;
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    Tensor.init(coercing:scalarType:on:)((char *)v41, (uint64_t)&v42, v49);
    v26 = v49[0];
    v27 = *(float *)(v7 + 4);
    if (v27 <= 0.0)
    {
      type metadata accessor for StochasticGradientDescentOperation();
      *(_QWORD *)&v42 = v10;
      v31 = sub_242A9E99C();
      *(_QWORD *)&v42 = v20;
      v32 = sub_242A9E99C();
      *(_QWORD *)&v42 = v26;
      v33 = sub_242A9E99C();
      v34 = *(_BYTE *)(v7 + 12);
      sub_242C41100((uint64_t)&v42);
      sub_242A55D74(0, 0, 0, v31, v32, 0, v33, v34, v27);
      v35 = (uint64_t (**)(_QWORD, _QWORD))sub_242C44054();
      sub_242A66290((uint64_t)v50, (uint64_t)v49);
      v36 = swift_retain();
      sub_242BC9830(v36, v35, 0, (uint64_t)v49, a5);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      if (!*(_QWORD *)(v7 + 48))
      {
        v49[0] = *(_QWORD *)(v7 + 40);
        v38 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v25);
        sub_242C480E0();
        OptimizerStateDictionary.subscript.getter(a1, (uint64_t)sub_242A85E84, v10, v38);
      }
      v49[0] = *(_QWORD *)(v7 + 40);
      v28 = type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v25);
      v29 = OptimizerStateDictionary.subscript.getter(a1, v28);
      if (!(_QWORD)v42)
      {
LABEL_9:
        v46 = 0u;
        memset(v47, 0, sizeof(v47));
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v48 = 22;
        sub_242A59264();
      }
      MEMORY[0x24BDAC7A8](v29);
      sub_242A81DD4();
      swift_release();
      swift_release();
      swift_release();
    }
    return sub_242A662D8((uint64_t)v50);
  }
  return result;
}

uint64_t sub_242C434E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2494EDE24](&unk_242C639C8, a3);
  return sub_242C49298();
}

uint64_t sub_242C4353C(uint64_t a1)
{
  MEMORY[0x2494EDE24](&unk_242C639C8, a1);
  return sub_242C48500();
}

uint64_t sub_242C43588()
{
  MEMORY[0x2494EDE24](&unk_242C639C8);
  return sub_242C48518();
}

uint64_t sub_242C435D8()
{
  MEMORY[0x2494EDE24](&unk_242C639C8);
  return sub_242C4850C();
}

uint64_t sub_242C43628@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_242C42E40();
  *a1 = result;
  return result;
}

uint64_t sub_242C4365C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_242C42E8C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_242C43688(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_242C42F80(*v1, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_242C43694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t result;

  result = sub_242C42E88(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
  *a4 = result;
  return result;
}

uint64_t sub_242C436C0()
{
  return sub_242A65800();
}

uint64_t sub_242C436E0(uint64_t a1)
{
  MEMORY[0x2494EDE24](&unk_242C63A68, a1);
  return sub_242C494D8();
}

uint64_t sub_242C43714(uint64_t a1)
{
  MEMORY[0x2494EDE24](&unk_242C63A68, a1);
  return sub_242C494E4();
}

void SGD.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;

  v8 = type metadata accessor for SGD.CodingKeys(255, a2, a3, a4);
  MEMORY[0x2494EDE24](&unk_242C63A68, v8);
  v20 = sub_242C4910C();
  v9 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v21 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C49448();
  if (v22)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v10 = sub_242C490C4();
    OUTLINED_FUNCTION_7_66(1);
    v12 = v11;
    OUTLINED_FUNCTION_7_66(2);
    v14 = v13;
    LOBYTE(v24) = 3;
    v23 = sub_242C490AC();
    sub_242A85F10();
    OUTLINED_FUNCTION_16_55();
    sub_242A85ED4();
    OUTLINED_FUNCTION_16_55();
    OUTLINED_FUNCTION_7_66(4);
    v16 = v15;
    v18 = type metadata accessor for OptimizerStateDictionary(0, a2, a3, v17);
    MEMORY[0x2494EDE24](&protocol conformance descriptor for OptimizerStateDictionary<A>, v18);
    sub_242C490D0();
    OUTLINED_FUNCTION_169(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    *(_DWORD *)a5 = v12;
    *(_DWORD *)(a5 + 4) = v14;
    *(_DWORD *)(a5 + 8) = v16;
    *(_BYTE *)(a5 + 12) = v23 & 1;
    *(_QWORD *)(a5 + 16) = v24;
    *(_BYTE *)(a5 + 28) = v26;
    *(_DWORD *)(a5 + 24) = v25;
    *(_BYTE *)(a5 + 36) = BYTE4(v24);
    *(_DWORD *)(a5 + 32) = v24;
    *(_QWORD *)(a5 + 40) = v24;
    *(_QWORD *)(a5 + 48) = v10;
    sub_242C480E0();
    __swift_destroy_boxed_opaque_existential_1(v21);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_65();
}

void SGD.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  char v33;

  v6 = *(_QWORD *)(a2 + 24);
  v20 = *(_QWORD *)(a2 + 16);
  v21 = v6;
  v7 = type metadata accessor for SGD.CodingKeys(255, v20, v6, a4);
  MEMORY[0x2494EDE24](&unk_242C63A68, v7);
  v8 = sub_242C491A8();
  v28 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - v9;
  v27 = *(unsigned __int8 *)(v4 + 12);
  v11 = *(_QWORD *)(v4 + 16);
  v25 = *(unsigned __int8 *)(v4 + 28);
  v26 = v11;
  v24 = *(unsigned int *)(v4 + 24);
  v22 = *(unsigned __int8 *)(v4 + 36);
  v23 = *(unsigned int *)(v4 + 32);
  v19 = *(_QWORD *)(v4 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C49478();
  LOBYTE(v31) = 0;
  v12 = v29;
  sub_242C49178();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  }
  else
  {
    v13 = v24;
    v14 = v25;
    v15 = v26;
    v16 = v28;
    LOBYTE(v31) = 1;
    OUTLINED_FUNCTION_10_58();
    LOBYTE(v31) = 2;
    OUTLINED_FUNCTION_10_58();
    LOBYTE(v31) = 3;
    sub_242C49160();
    v31 = v15;
    v32 = v13;
    v33 = (v13 | (unint64_t)(v14 << 32)) >> 32;
    v30 = 5;
    sub_242A85F88();
    OUTLINED_FUNCTION_15_60();
    BYTE4(v31) = (v23 | (unint64_t)(v22 << 32)) >> 32;
    LODWORD(v31) = v23;
    v30 = 6;
    sub_242A85F4C();
    OUTLINED_FUNCTION_15_60();
    LOBYTE(v31) = 4;
    OUTLINED_FUNCTION_10_58();
    v31 = v19;
    v30 = 7;
    v18 = type metadata accessor for OptimizerStateDictionary(0, v20, v21, v17);
    MEMORY[0x2494EDE24](&protocol conformance descriptor for OptimizerStateDictionary<A>, v18);
    sub_242C49184();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v8);
  }
  OUTLINED_FUNCTION_8_65();
}

void sub_242C43CD4(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  SGD.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

void sub_242C43CF0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  SGD.encode(to:)(a1, a2, a3, a4);
}

void sub_242C43D04(uint64_t a1)
{
  sub_242C44094(a1);
}

uint64_t sub_242C43D18@<X0>(_QWORD *a1@<X8>)
{
  return sub_242C440C4(a1);
}

uint64_t type metadata accessor for SGD.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SGD.CodingKeys);
}

uint64_t sub_242C43D38(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x2494EDE24](&protocol conformance descriptor for SGD<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_242C43D64()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242C43D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 21) = *(_QWORD *)(a2 + 21);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  sub_242C480E0();
  return a1;
}

uint64_t sub_242C43DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 21) = *(_QWORD *)(a2 + 21);
  *(_QWORD *)(a1 + 16) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  sub_242C480E0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_242C43E5C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 21) = *(_QWORD *)(a2 + 21);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_242C43ED0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
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

uint64_t sub_242C43F10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for SGD(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SGD);
}

uint64_t sub_242C43F68(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_242C43FB4 + 4 * byte_242C63865[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_242C43FE8 + 4 * byte_242C63860[v4]))();
}

uint64_t sub_242C43FE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C43FF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C43FF8);
  return result;
}

uint64_t sub_242C44004(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C4400CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_242C44010(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C44018(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_242C44024()
{
  JUMPOUT(0x2494EDE24);
}

void sub_242C44034()
{
  JUMPOUT(0x2494EDE24);
}

void sub_242C44044()
{
  JUMPOUT(0x2494EDE24);
}

unint64_t sub_242C44054()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257226B38;
  if (!qword_257226B38)
  {
    v1 = type metadata accessor for StochasticGradientDescentOperation();
    result = MEMORY[0x2494EDE24](&unk_242C4B9C0, v1);
    atomic_store(result, (unint64_t *)&qword_257226B38);
  }
  return result;
}

void sub_242C44094(uint64_t a1)
{
  uint64_t v1;

  sub_242C42908(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(uint64_t **)(v1 + 72), *(_QWORD *)(v1 + 16));
}

uint64_t sub_242C440C4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_242C42CEC(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(uint64_t **)(v1 + 64), *(_QWORD *)(v1 + 16), a1);
}

void OUTLINED_FUNCTION_0_101()
{
  Tensor.init(shape:coercingScalars:scalarType:on:)();
}

uint64_t OUTLINED_FUNCTION_1_89(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for OptimizerStateDictionary(0, *(_QWORD *)(v4 + 240), *(_QWORD *)(*(_QWORD *)(v4 + 296) + 24), a4);
}

uint64_t OUTLINED_FUNCTION_3_86@<X0>(unsigned __int8 a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v5 = *(unsigned int *)(v4 + 32) | ((unint64_t)a1 << 32);
  *(_DWORD *)(v1 + 496) = *(_DWORD *)(v4 + 32);
  *(_BYTE *)(v1 + 500) = BYTE4(v5) & 1;
  *(_QWORD *)(v1 + 640) = v3;
  *(_QWORD *)(v1 + 576) = v2;
  return sub_242A6609C();
}

uint64_t OUTLINED_FUNCTION_7_66@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 112) = a1;
  return sub_242C490B8();
}

uint64_t OUTLINED_FUNCTION_10_58()
{
  return sub_242C4916C();
}

uint64_t OUTLINED_FUNCTION_11_62()
{
  uint64_t v0;

  return sub_242A66290(v0 + 640, v0 + 576);
}

uint64_t OUTLINED_FUNCTION_12_53()
{
  uint64_t v0;

  return sub_242A66290(v0 + 352, v0 + 640);
}

double OUTLINED_FUNCTION_13_68()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 444) = 0u;
  *(_OWORD *)(v0 + 416) = 0u;
  *(_OWORD *)(v0 + 432) = 0u;
  *(_OWORD *)(v0 + 384) = 0u;
  *(_OWORD *)(v0 + 400) = 0u;
  *(_OWORD *)(v0 + 352) = 0u;
  *(_OWORD *)(v0 + 368) = 0u;
  *(_BYTE *)(v0 + 460) = 22;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_60()
{
  return sub_242C4913C();
}

uint64_t OUTLINED_FUNCTION_16_55()
{
  return sub_242C49094();
}

uint64_t OUTLINED_FUNCTION_20_61()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242A66290(v0 + 352, v1 - 184);
}

uint64_t OUTLINED_FUNCTION_26_54()
{
  uint64_t v0;

  return sub_242A662D8(v0 + 640);
}

__n128 OUTLINED_FUNCTION_27_43(__n128 *a1)
{
  __n128 *v1;
  unsigned __int8 v2;
  unsigned __int32 v3;
  __n128 result;

  result = v1[11];
  a1[1] = result;
  a1[2].n128_u32[0] = v3;
  v1[20].n128_u8[0] = v2;
  return result;
}

double OUTLINED_FUNCTION_28_55()
{
  uint64_t v0;
  double result;

  *(_DWORD *)(v0 + 400) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 368) = 0u;
  *(_OWORD *)(v0 + 384) = 0u;
  *(_OWORD *)(v0 + 352) = 0u;
  return result;
}

void OUTLINED_FUNCTION_34_46(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  OptimizerStateDictionary.subscript.getter(a1, a2, v3, v2);
}

void OUTLINED_FUNCTION_36_37()
{
  uint64_t v0;

  sub_242B933C0(v0 + 352);
}

ValueMetadata *type metadata accessor for TensorDescriptor()
{
  return &type metadata for TensorDescriptor;
}

unint64_t sub_242C4427C()
{
  unint64_t result;

  result = qword_25722F510;
  if (!qword_25722F510)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63B14, &type metadata for TensorDescriptor);
    atomic_store(result, (unint64_t *)&qword_25722F510);
  }
  return result;
}

uint64_t sub_242C442B8()
{
  sub_242C02D08();
  return sub_242C4934C();
}

uint64_t sub_242C442F0()
{
  uint64_t v0;

  sub_242C48C38();
  sub_242C48314();
  v0 = sub_242C480E0();
  MEMORY[0x2494EC0FC](v0, MEMORY[0x24BEE1768]);
  sub_242C48314();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_242C48314();
  sub_242C48E78();
  sub_242C48314();
  return 0;
}

uint64_t sub_242C443EC(uint64_t result, char a2)
{
  NSUInteger v2;

  if ((a2 & 1) == 0)
  {
    if (result > 0x100000)
    {
      if ((unint64_t)result >= 0xA00000)
      {
        if (!((unint64_t)result >> 26))
        {
          v2 = 0x8000000;
          return NSRoundUpToMultipleOfPageSize(v2);
        }
        goto LABEL_13;
      }
LABEL_8:
      v2 = 0x2000000;
      return NSRoundUpToMultipleOfPageSize(v2);
    }
LABEL_9:
    v2 = 0x800000;
    return NSRoundUpToMultipleOfPageSize(v2);
  }
  if (result <= 0x100000)
    goto LABEL_9;
  if ((unint64_t)result < 0xA00000)
    goto LABEL_8;
  if (!((unint64_t)result >> 29))
  {
    v2 = 0x40000000;
    return NSRoundUpToMultipleOfPageSize(v2);
  }
LABEL_13:
  if (!__OFADD__(result, 0x200000))
  {
    v2 = (result + 0x1FFFFF) & 0xFFFFFFFFFFE00000;
    return NSRoundUpToMultipleOfPageSize(v2);
  }
  __break(1u);
  return result;
}

int64_t sub_242C44484()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;
  _BYTE *v3;
  BOOL v4;
  int64_t result;

  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_size);
  v3 = objc_msgSend(v1, sel_usedSize);
  v4 = __OFSUB__(v2, v3);
  result = v2 - v3;
  if (v4)
    __break(1u);
  return result;
}

BOOL sub_242C444D0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setPurgeableState_, 4) == (id)4;
}

uint64_t sub_242C444FC()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MPSHeap()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for MPSHeap.Descriptor(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MPSHeap.Descriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MPSHeap.Descriptor()
{
  return &type metadata for MPSHeap.Descriptor;
}

uint64_t sub_242C445E0()
{
  return OUTLINED_FUNCTION_6_81();
}

BOOL sub_242C445FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t sub_242C44608()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_32_2();
  return OUTLINED_FUNCTION_78();
}

uint64_t sub_242C44638()
{
  return sub_242C44608();
}

uint64_t sub_242C44644()
{
  return sub_242C445E0();
}

BOOL sub_242C44650(uint64_t *a1, uint64_t *a2)
{
  return sub_242C445FC(*a1, 0, *a2);
}

uint64_t sub_242C44664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_242C48C38();
  OUTLINED_FUNCTION_19_32();
  sub_242C491CC();
  OUTLINED_FUNCTION_19_32();
  swift_bridgeObjectRelease();
  sub_242C48314();
  sub_242C2EBF0(a3);
  OUTLINED_FUNCTION_19_32();
  swift_bridgeObjectRelease();
  sub_242C48314();
  return 0;
}

uint64_t sub_242C4474C()
{
  OUTLINED_FUNCTION_6_81();
  return sub_242C4934C();
}

BOOL sub_242C44774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a3 == a6;
}

void sub_242C44784()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_32_2();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_309();
}

void sub_242C447B8()
{
  sub_242C44784();
}

uint64_t sub_242C447C8()
{
  return sub_242C4474C();
}

void sub_242C447D8()
{
  sub_242C49340();
  OUTLINED_FUNCTION_32_2();
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_309();
}

uint64_t sub_242C44810()
{
  uint64_t *v0;

  return sub_242C44664(*v0, 0, v0[2]);
}

BOOL sub_242C44820(uint64_t *a1, uint64_t *a2)
{
  return sub_242C44774(*a1, 0, a1[2], *a2, 0, a2[2]);
}

unint64_t sub_242C44844()
{
  unint64_t result;

  result = qword_25722F5C0;
  if (!qword_25722F5C0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63B94, &type metadata for MPSHeap.Descriptor);
    atomic_store(result, (unint64_t *)&qword_25722F5C0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MPSHeap.Size(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MPSHeap.Size(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MPSHeap.Size()
{
  return &type metadata for MPSHeap.Size;
}

unint64_t sub_242C44924()
{
  unint64_t result;

  result = qword_25722F5C8;
  if (!qword_25722F5C8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63C2C, &type metadata for MPSHeap.Size);
    atomic_store(result, (unint64_t *)&qword_25722F5C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_81()
{
  return sub_242C4934C();
}

void sub_242C44970()
{
  sub_242BA90A0();
}

void sub_242C44980(uint64_t a1)
{
  sub_242C44BA8(a1, (void (*)(_BYTE *, uint64_t))sub_242A5CB30);
}

void sub_242C4498C(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242A98E90);
}

void sub_242C44998(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242A963F8);
}

uint64_t sub_242C449A8(char a1)
{
  return sub_242BA930C(0, a1 & 1);
}

void sub_242C449B4(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242ABCCF0);
}

void sub_242C449C0()
{
  sub_242BA8EF4();
}

uint64_t sub_242C449CC(uint64_t a1)
{
  return sub_242BA8DE0(0, a1);
}

void sub_242C449D8()
{
  OUTLINED_FUNCTION_103_6();
  sub_242C49370();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44A08()
{
  sub_242BA9170();
}

void sub_242C44A14()
{
  sub_242BA8E4C();
}

void sub_242C44A20()
{
  sub_242BA93F0();
}

void sub_242C44A2C(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242B7ADDC);
}

void sub_242C44A38(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242B7AEB8);
}

void sub_242C44A44()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_61_17();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44A70()
{
  OUTLINED_FUNCTION_103_6();
  sub_242C49358();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44AA4(uint64_t a1)
{
  sub_242C44BA8(a1, (void (*)(_BYTE *, uint64_t))sub_242A5C4E4);
}

void sub_242C44AB0(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242BF5508);
}

void sub_242C44ABC()
{
  sub_242BA8FA8();
}

void sub_242C44AC8()
{
  sub_242BA9000();
}

void sub_242C44AD4(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242C0E928);
}

void sub_242C44AE0(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242C0EB68);
}

void sub_242C44AEC()
{
  sub_242BA90F0();
}

void sub_242C44AF8(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242C11D00);
}

void sub_242C44B04()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_61_17();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44B34(uint64_t a1)
{
  sub_242C44BA8(a1, (void (*)(_BYTE *, uint64_t))sub_242A5C284);
}

void sub_242C44B40(uint64_t a1)
{
  sub_242C44B4C(a1, (void (*)(uint64_t))sub_242C15940);
}

void sub_242C44B4C(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_103_6();
  a2(a1);
  sub_242C4817C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44B9C(uint64_t a1)
{
  sub_242C44BA8(a1, (void (*)(_BYTE *, uint64_t))sub_242A5C2EC);
}

void sub_242C44BA8(uint64_t a1, void (*a2)(_BYTE *, uint64_t))
{
  _BYTE v4[72];

  OUTLINED_FUNCTION_103_6();
  a2(v4, a1);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44BDC(char a1)
{
  sub_242BA9208(0, a1);
}

void sub_242C44BE8()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_61_17();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44C18()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_61_17();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44C48()
{
  sub_242C44C6C();
}

void sub_242C44C60()
{
  sub_242BA8D80();
}

void sub_242C44C6C()
{
  OUTLINED_FUNCTION_103_6();
  sub_242C4817C();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44CA4()
{
  OUTLINED_FUNCTION_103_6();
  OUTLINED_FUNCTION_61_17();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

void sub_242C44CD0()
{
  OUTLINED_FUNCTION_103_6();
  sub_242C4934C();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_36_2();
}

BOOL sub_242C44D04()
{
  uint64_t v0;

  v0 = sub_242C49064();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

void sub_242C44D48()
{
  sub_242C44C6C();
}

BOOL sub_242C44D7C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_242C44D04();
  *a1 = result;
  return result;
}

void sub_242C44DB0(_QWORD *a1@<X8>)
{
  *a1 = 0x4E6C616369676F6CLL;
  a1[1] = 0xEA0000000000746FLL;
}

void sub_242C44DD0(_QWORD *a1@<X8>)
{
  *a1 = &unk_25137E4C8;
}

uint64_t sub_242C44DE0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  char v19;
  char v20;

  v6 = *a5;
  v7 = *((unsigned __int8 *)a5 + 16);
  v8 = *(__int128 *)((char *)a5 + 24);
  v9 = *(__int128 *)((char *)a5 + 40);
  v10 = *((_BYTE *)a5 + 56);
  if (!a3)
  {
    v13 = *(__int128 *)((char *)a5 + 24);
    v14 = *a5;
    v12 = *(__int128 *)((char *)a5 + 40);
    sub_242C0E564();
    v9 = v12;
    v8 = v13;
    v6 = v14;
  }
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = 0;
  return sub_242B056CC(a1, a2, a3, a4, (uint64_t)&v15);
}

uint64_t sub_242C44E5C()
{
  sub_242B056F8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnaryLogicalOperation()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for UnaryLogicalOperation.Operator(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_242C44ED8 + 4 * byte_242C63CA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_242C44EF8 + 4 * byte_242C63CA5[v4]))();
}

_BYTE *sub_242C44ED8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_242C44EF8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C44F00(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C44F08(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242C44F10(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242C44F18(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UnaryLogicalOperation.Operator()
{
  return &type metadata for UnaryLogicalOperation.Operator;
}

unint64_t sub_242C44F38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25722F6B0;
  if (!qword_25722F6B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25722F6B8);
    result = MEMORY[0x2494EDE24](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25722F6B0);
  }
  return result;
}

unint64_t sub_242C44F80()
{
  unint64_t result;

  result = qword_25722F6C0;
  if (!qword_25722F6C0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63D90, &type metadata for UnaryLogicalOperation.Operator);
    atomic_store(result, (unint64_t *)&qword_25722F6C0);
  }
  return result;
}

uint64_t sub_242C44FBC()
{
  return sub_242A5C8F4();
}

void OUTLINED_FUNCTION_0_102()
{
  sub_242C44C6C();
}

void OUTLINED_FUNCTION_4_80()
{
  sub_242C44C6C();
}

uint64_t OUTLINED_FUNCTION_5_80()
{
  return 0x4E6C616369676F6CLL;
}

uint64_t sub_242C45010(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  float v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  float v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  unsigned int v76;
  BOOL v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  id v92;
  unsigned int v93;
  unsigned int v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  float v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  _QWORD __dst[18];
  _QWORD __src[18];

  v3 = v2;
  v5 = a2 & 0xC000000000000001;
  OUTLINED_FUNCTION_28_6(0, (a2 & 0xC000000000000001) == 0);
  if (v5)
    goto LABEL_71;
  v6 = *(id *)(a2 + 32);
  if (OUTLINED_FUNCTION_9_77())
  {
    OUTLINED_FUNCTION_20_62();
    OUTLINED_FUNCTION_28_6(1, v7);
    v121 = *(id *)(a2 + 40);
  }
  else
  {
    v121 = 0;
  }
  if (OUTLINED_FUNCTION_9_77())
  {
    OUTLINED_FUNCTION_20_62();
    OUTLINED_FUNCTION_28_6(2, v8);
    v124 = *(id *)(a2 + 48);
  }
  else
  {
    v124 = 0;
  }
  OUTLINED_FUNCTION_9_77();
  OUTLINED_FUNCTION_20_62();
  if ((v10 & 1) != 0)
  {
    OUTLINED_FUNCTION_28_6(3, v9);
    v11 = *(void **)(a2 + 56);
  }
  else
  {
    OUTLINED_FUNCTION_28_6(1, v9);
    v11 = *(void **)(a2 + 40);
  }
  v12 = v11;
  OUTLINED_FUNCTION_9_77();
  v127 = v6;
  OUTLINED_FUNCTION_20_62();
  if ((v14 & 1) != 0)
  {
    OUTLINED_FUNCTION_28_6(4, v13);
    v15 = *(void **)(a2 + 64);
  }
  else
  {
    OUTLINED_FUNCTION_28_6(2, v13);
    v15 = *(void **)(a2 + 48);
  }
  v16 = v12;
  v17 = v15;
  v18 = sub_242BC8924();
  sub_242BC8BE8(v18);
  v19 = sub_242BC8924();
  if (v19 == sub_242BC8844())
  {
    v123 = v12;
    v20 = v17;
  }
  else
  {
    OUTLINED_FUNCTION_30_3();
    OUTLINED_FUNCTION_5_81();
    v21 = (void *)sub_242C4853C();
    OUTLINED_FUNCTION_136();
    v123 = OUTLINED_FUNCTION_1_90(a1, sel_reshapeTensor_withShape_name_, (uint64_t)v12, (uint64_t)v21);

    OUTLINED_FUNCTION_30_3();
    v22 = (void *)sub_242C4853C();
    OUTLINED_FUNCTION_136();
    v20 = OUTLINED_FUNCTION_1_90(a1, sel_reshapeTensor_withShape_name_, (uint64_t)v17, (uint64_t)v22);

    v12 = v17;
  }
  v23 = v127;

  v120 = v20;
  if (*(_BYTE *)(v2 + 168))
  {
    if (*(_BYTE *)(v2 + 168) != 1)
      goto LABEL_30;
LABEL_22:
    swift_bridgeObjectRelease();
    v25 = sub_242C45BE4((uint64_t)v127, 0, 0, a1);
    v26 = sub_242C45C80((uint64_t)v127, (uint64_t)v25, 0, 0, a1);
    v128 = v26;
    if (sub_242BC8F10())
    {
      v27 = *(_QWORD *)(v3 + 64);
      v28 = *(_QWORD *)(v27 + 16);
      if (v28)
      {
        v29 = (unint64_t *)(v27 + 32);
        v30 = *(_QWORD *)(*(_QWORD *)(v3 + 40) + 152);
        v31 = v30 + 32;
        v32 = *(_QWORD *)(v30 + 16);
        v33 = 1.0;
        while (1)
        {
          v35 = *v29++;
          v34 = v35;
          if (v35 >= v32)
            break;
          v33 = v33 * (float)*(uint64_t *)(v31 + 8 * v34);
          if (!--v28)
            goto LABEL_38;
        }
        __break(1u);
LABEL_71:
        OUTLINED_FUNCTION_27_3();
      }
      v33 = 1.0;
LABEL_38:
      v54 = (float)(v33 / (float)(v33 + -1.0));
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
      v55 = OUTLINED_FUNCTION_1_4();
      *(_OWORD *)(v55 + 16) = xmmword_242C4BF60;
      OUTLINED_FUNCTION_5_81();
      v56 = v26;
      *(_QWORD *)(v55 + 32) = sub_242C48A04();
      __src[0] = v55;
      OUTLINED_FUNCTION_7_67();
      v57 = (void *)sub_242C4853C();
      OUTLINED_FUNCTION_136();
      LOBYTE(__src[0]) = *(_BYTE *)(*(_QWORD *)(v3 + 40) + 160);
      sub_242BF51CC();
      v59 = objc_msgSend(a1, sel_constantWithScalar_shape_dataType_, v57, v58, v54);

      v126 = OUTLINED_FUNCTION_1_90(a1, sel_multiplicationWithPrimaryTensor_secondaryTensor_name_, (uint64_t)v56, (uint64_t)v59);
    }
    else
    {
      v126 = v26;
    }
    v60 = *(float *)(v3 + 72);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
    v61 = OUTLINED_FUNCTION_1_4();
    *(_OWORD *)(v61 + 16) = xmmword_242C4BF60;
    OUTLINED_FUNCTION_5_81();
    *(_QWORD *)(v61 + 32) = OUTLINED_FUNCTION_19_47();
    __src[0] = v61;
    OUTLINED_FUNCTION_7_67();
    v62 = (void *)sub_242C4853C();
    OUTLINED_FUNCTION_3_6();
    v63 = v121;
    if (v121)
      v64 = objc_msgSend(v121, sel_dataType);
    else
      v64 = objc_msgSend(v25, sel_dataType);
    v122 = objc_msgSend(a1, sel_constantWithScalar_shape_dataType_, v62, v64, v60);

    if (v63)
      v65 = v63;
    else
      v65 = v25;
    v117 = v63;
    v66 = OUTLINED_FUNCTION_1_90(a1, sel_multiplicationWithPrimaryTensor_secondaryTensor_name_, (uint64_t)v65, (uint64_t)v122);
    OUTLINED_FUNCTION_13_69();
    v67 = OUTLINED_FUNCTION_1_4();
    *(_OWORD *)(v67 + 16) = xmmword_242C4BF60;
    v68 = v63;
    *(_QWORD *)(v67 + 32) = OUTLINED_FUNCTION_19_47();
    __src[0] = v67;
    OUTLINED_FUNCTION_7_67();
    v69 = (void *)sub_242C4853C();
    OUTLINED_FUNCTION_136();
    v70 = objc_msgSend(a1, sel_constantWithScalar_shape_dataType_, v69, OUTLINED_FUNCTION_17_57(), (float)(1.0 - v60));

    v118 = (uint64_t)v25;
    v119 = v70;
    v71 = OUTLINED_FUNCTION_1_90(a1, sel_multiplicationWithPrimaryTensor_secondaryTensor_name_, (uint64_t)v25, (uint64_t)v70);
    v72 = OUTLINED_FUNCTION_12_54(a1, sel_squeezeTensor_name_, (uint64_t)v71);

    v73 = v68;
    v74 = v72;
    v75 = (uint64_t)objc_msgSend(v68, sel_dataType);
    v76 = OUTLINED_FUNCTION_17_57();
    if ((_DWORD)v75 == 268435472)
    {

      if (v76 == 268435488)
      {
        v79 = OUTLINED_FUNCTION_2_95(a1, sel_castTensor_toType_name_, (uint64_t)v73);
        v80 = v73;
        v81 = v73;
        v73 = v79;
        goto LABEL_52;
      }
      v81 = v73;
    }
    else
    {
      v77 = (_DWORD)v75 == 268435488;
      v75 = 268435488;
      if (!v77)
      {
        v80 = v73;
        v81 = v74;
LABEL_52:

        goto LABEL_53;
      }

      if (v76 == 268435472)
      {
        v78 = OUTLINED_FUNCTION_2_95(a1, sel_castTensor_toType_name_, (uint64_t)v74);
        v80 = v74;
        v81 = v74;
        v74 = v78;
        goto LABEL_52;
      }
      v81 = v74;
    }
LABEL_53:

    v82 = sub_242A88AA4(0x5F676E696E6E7572, 0xEC0000006E61656DLL);
    sub_242A8A808((uint64_t)v73, (uint64_t)v74, v82, v83, a1);
    v84 = v124;
    v116 = v85;
    if (v124)
    {
      v86 = v124;
    }
    else
    {
      v86 = v128;
      v84 = 0;
    }
    v125 = v84;
    v87 = OUTLINED_FUNCTION_1_90(a1, sel_multiplicationWithPrimaryTensor_secondaryTensor_name_, (uint64_t)v86, (uint64_t)v122);
    OUTLINED_FUNCTION_13_69();
    v88 = (id)v75;
    v89 = OUTLINED_FUNCTION_1_90(a1, sel_multiplicationWithPrimaryTensor_secondaryTensor_name_, (uint64_t)v126, (uint64_t)v119);
    v90 = (uint64_t)v88;
    v91 = OUTLINED_FUNCTION_12_54(a1, sel_squeezeTensor_name_, (uint64_t)v89);
    OUTLINED_FUNCTION_13_69();
    v92 = v88;
    v93 = objc_msgSend(v88, sel_dataType);
    v94 = objc_msgSend(v92, sel_dataType);
    if (v93 == 268435472)
    {

      if (v94 != 268435488)
      {
        v97 = v88;
        goto LABEL_64;
      }
      v98 = OUTLINED_FUNCTION_2_95(a1, sel_castTensor_toType_name_, (uint64_t)v88);
      v96 = v88;
      v97 = v88;
      v90 = (uint64_t)v98;
    }
    else if (v93 == 268435488)
    {

      if (v94 != 268435472)
      {
        v97 = v92;
        goto LABEL_64;
      }
      v95 = OUTLINED_FUNCTION_2_95(a1, sel_castTensor_toType_name_, (uint64_t)v92);
      v96 = v92;
      v97 = v92;
      v92 = v95;
    }
    else
    {
      v96 = v88;
      v97 = v92;
    }

LABEL_64:
    v114 = v92;
    v115 = (id)v90;

    v99 = sub_242A88AA4(0xD000000000000010, 0x8000000242C73E40);
    sub_242A8A808(v90, (uint64_t)v92, v99, v100, a1);
    v113 = v101;
    v102 = *(float *)(v3 + 76);
    v103 = v123;
    v23 = v120;
    v104 = OUTLINED_FUNCTION_24_19();
    v106 = sub_242A88AA4(v104, v105);
    v43 = (void *)v118;
    v108 = sub_242C461D8((uint64_t)v127, v118, (uint64_t)v128, (uint64_t)v123, (uint64_t)v120, v102, v106, v107, a1);

    v109 = swift_allocObject();
    *(_OWORD *)(v109 + 16) = xmmword_242C4B7E0;
    *(_QWORD *)(v109 + 32) = v108;
    *(_QWORD *)(v109 + 40) = v116;
    *(_QWORD *)(v109 + 48) = v113;
    __src[0] = v109;
    OUTLINED_FUNCTION_7_67();
    v53 = __src[0];
    v110 = v108;
    v111 = v116;

    v50 = v115;
    v45 = v73;
    v49 = v74;
    goto LABEL_65;
  }
  type metadata accessor for ContextManager();
  sub_242B93328();
  sub_242B933C0((uint64_t)__src);
  swift_release();
  memcpy(__dst, __src, 0x88uLL);
  if (__dst[10])
  {
    v24 = *(_BYTE *)(__dst[10] + 24);
    sub_242A5DC30((uint64_t)__dst);
    if ((v24 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    sub_242A5DC30((uint64_t)__dst);
  }
LABEL_30:
  v36 = v121;
  if (v121)
  {
    v37 = v121;
  }
  else
  {
    v37 = sub_242C45BE4((uint64_t)v127, 0, 0, a1);
    v36 = 0;
  }
  v126 = v36;
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_5_81();
  v38 = (void *)OUTLINED_FUNCTION_22_53();
  swift_bridgeObjectRelease();
  v39 = OUTLINED_FUNCTION_1_90(a1, sel_reshapeTensor_withShape_name_, (uint64_t)v37, (uint64_t)v38);

  if (v124)
  {
    v40 = v39;
    v41 = v124;
    v42 = v124;
  }
  else
  {
    v42 = sub_242C45C80((uint64_t)v127, (uint64_t)v39, 0, 0, a1);
    v41 = 0;
  }
  v43 = v39;
  v128 = v41;
  OUTLINED_FUNCTION_30_3();
  swift_bridgeObjectRelease();
  v44 = (void *)OUTLINED_FUNCTION_22_53();
  swift_bridgeObjectRelease();
  v45 = OUTLINED_FUNCTION_1_90(a1, sel_reshapeTensor_withShape_name_, (uint64_t)v42, (uint64_t)v44);

  v46 = *(float *)(v3 + 76);
  v48 = *(_QWORD *)(v3 + 24);
  v47 = *(_QWORD *)(v3 + 32);
  sub_242C480E0();
  v49 = v123;
  v50 = v120;
  v51 = sub_242C461D8((uint64_t)v127, (uint64_t)v43, (uint64_t)v45, (uint64_t)v123, (uint64_t)v120, v46, v48, v47, a1);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
  v52 = OUTLINED_FUNCTION_1_4();
  *(_OWORD *)(v52 + 16) = xmmword_242C4BF60;
  *(_QWORD *)(v52 + 32) = v51;
  __src[0] = v52;
  OUTLINED_FUNCTION_7_67();
  v53 = __src[0];
LABEL_65:

  return v53;
}

id sub_242C45BE4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  void *v8;
  id v9;

  sub_242A5A5E8(*(_QWORD *)(v4 + 64));
  OUTLINED_FUNCTION_23_56();
  v8 = (void *)OUTLINED_FUNCTION_16_56();
  swift_bridgeObjectRelease();
  if (a3)
    a3 = (void *)sub_242C48224();
  v9 = objc_msgSend(a4, sel_meanOfTensor_axes_name_, a1, v8, a3);

  return v9;
}

id sub_242C45C80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5;
  void *v10;
  id v11;

  sub_242A5A5E8(*(_QWORD *)(v5 + 64));
  OUTLINED_FUNCTION_23_56();
  v10 = (void *)OUTLINED_FUNCTION_16_56();
  swift_bridgeObjectRelease();
  if (a4)
    a4 = (void *)sub_242C48224();
  v11 = objc_msgSend(a5, sel_varianceOfTensor_meanTensor_axes_name_, a1, a2, v10, a4);

  return v11;
}

uint64_t sub_242C45D2C(void *a1, uint64_t a2)
{
  return sub_242C45010(a1, a2);
}

uint64_t sub_242C45D40(void *a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;

  v5 = a2 & 0xC000000000000001;
  OUTLINED_FUNCTION_28_6(0, (a2 & 0xC000000000000001) == 0);
  if (v5)
    OUTLINED_FUNCTION_27_3();
  v6 = *(id *)(a2 + 32);
  OUTLINED_FUNCTION_28_6(1, 1);
  v7 = *(id *)(a2 + 40);
  v8 = *(_QWORD *)(v2 + 48);
  if (v8)
  {
    OUTLINED_FUNCTION_28_6(2, 1);
    v9 = *(id *)(a2 + 48);
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  v11 = sub_242BC8924();
  sub_242BC8BE8(v11);
  if (v9)
  {
    v12 = a1;
    v13 = sub_242BC8924();
    if (v13 == sub_242BC8844())
    {

      OUTLINED_FUNCTION_3_6();
      a1 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_18_60();
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_5_81();
      v14 = (void *)OUTLINED_FUNCTION_15_61();
      OUTLINED_FUNCTION_81();
      a1 = v12;
      v9 = OUTLINED_FUNCTION_1_90(v12, sel_reshapeTensor_withShape_name_, (uint64_t)v10, (uint64_t)v14);

    }
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
  }
  v47 = sub_242C45BE4((uint64_t)v7, 0, 0, a1);
  v15 = sub_242C45C80((uint64_t)v7, (uint64_t)v47, 0, 0, a1);
  v45 = v9;
  if (v8)
  {
    v16 = a1;
    if (*(_QWORD *)(v2 + 56))
    {
      OUTLINED_FUNCTION_18_60();
      OUTLINED_FUNCTION_5_81();
      v17 = (uint64_t)v7;
      v18 = (void *)sub_242C4853C();
      OUTLINED_FUNCTION_81();
      v19 = *(float *)(v2 + 76);
      v20 = sub_242A88AA4(0x656C616373, 0xE500000000000000);
      v46 = sub_242C46358((uint64_t)v6, v17, (uint64_t)v47, (uint64_t)v15, (uint64_t)v18, v19, v20, v21, a1);

      v7 = (id)v17;
      v9 = v45;
      OUTLINED_FUNCTION_18_60();
      v22 = (void *)sub_242C4853C();
      OUTLINED_FUNCTION_3_6();
      v23 = sub_242A88AA4(0x74657366666FLL, 0xE600000000000000);
      v25 = sub_242C46408((uint64_t)v6, (uint64_t)v7, (uint64_t)v22, v23, v24, v16);

    }
    else
    {
      v25 = 0;
      v46 = 0;
    }
  }
  else
  {
    v25 = 0;
    v46 = 0;
    v16 = a1;
  }
  sub_242A5A5E8(*(_QWORD *)(v2 + 64));
  OUTLINED_FUNCTION_5_81();
  v26 = (void *)OUTLINED_FUNCTION_15_61();
  OUTLINED_FUNCTION_81();
  v27 = *(float *)(v2 + 76);
  v28 = OUTLINED_FUNCTION_24_19();
  v30 = sub_242A88AA4(v28, v29);
  v44 = v6;
  v32 = sub_242C46288((uint64_t)v6, (uint64_t)v7, (uint64_t)v47, (uint64_t)v15, (uint64_t)v9, (uint64_t)v46, (uint64_t)v25, (uint64_t)v26, v27, v30, v31, v16);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25722A830);
  v33 = OUTLINED_FUNCTION_1_4();
  *(_OWORD *)(v33 + 16) = xmmword_242C4BF60;
  *(_QWORD *)(v33 + 32) = v32;
  v48 = v33;
  OUTLINED_FUNCTION_21_52();
  v34 = v15;
  v35 = v46;
  if (v46)
  {
    v36 = v32;
    v37 = v46;
    v38 = OUTLINED_FUNCTION_12_54(v16, sel_squeezeTensor_name_, (uint64_t)v37);
    MEMORY[0x2494EC0CC]();
    if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_8_66();
    sub_242C485F0();
    OUTLINED_FUNCTION_21_52();

    v35 = v46;
    if (v25)
      goto LABEL_19;
LABEL_23:
    v41 = v47;
    goto LABEL_24;
  }
  v42 = v32;
  if (!v25)
    goto LABEL_23;
LABEL_19:
  v39 = v25;
  v40 = OUTLINED_FUNCTION_12_54(v16, sel_squeezeTensor_name_, (uint64_t)v39);
  MEMORY[0x2494EC0CC]();
  if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    OUTLINED_FUNCTION_8_66();
  sub_242C485F0();
  OUTLINED_FUNCTION_21_52();

  v41 = v32;
  v34 = v39;
  v32 = v39;
LABEL_24:

  return v48;
}

uint64_t sub_242C461C4(void *a1, unint64_t a2)
{
  return sub_242C45D40(a1, a2);
}

id sub_242C461D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v16;
  double v17;
  id v18;

  v16 = (void *)sub_242C48224();
  swift_bridgeObjectRelease();
  *(float *)&v17 = a6;
  v18 = objc_msgSend(a9, sel_normalizationWithTensor_meanTensor_varianceTensor_gammaTensor_betaTensor_epsilon_name_, a1, a2, a3, a4, a5, v16, v17);

  return v18;
}

id sub_242C46288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v20;
  double v21;
  id v22;

  v20 = (void *)sub_242C48224();
  swift_bridgeObjectRelease();
  *(float *)&v21 = a9;
  v22 = objc_msgSend(a12, sel_normalizationGradientWithIncomingGradientTensor_sourceTensor_meanTensor_varianceTensor_gammaTensor_gammaGradientTensor_betaGradientTensor_reductionAxes_epsilon_name_, a1, a2, a3, a4, a5, a6, v21, a7, a8, v20);

  return v22;
}

id sub_242C46358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v16;
  double v17;
  id v18;

  v16 = (void *)sub_242C48224();
  swift_bridgeObjectRelease();
  *(float *)&v17 = a6;
  v18 = objc_msgSend(a9, sel_normalizationGammaGradientWithIncomingGradientTensor_sourceTensor_meanTensor_varianceTensor_reductionAxes_epsilon_name_, a1, a2, a3, a4, a5, v16, v17);

  return v18;
}

id sub_242C46408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;

  v10 = (void *)sub_242C48224();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(a6, sel_normalizationBetaGradientWithIncomingGradientTensor_sourceTensor_reductionAxes_name_, a1, a2, a3, v10);

  return v11;
}

id OUTLINED_FUNCTION_1_90(id a1, SEL a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, a2, a3, a4, 0);
}

id OUTLINED_FUNCTION_2_95(id a1, SEL a2, uint64_t a3)
{
  return objc_msgSend(a1, a2, a3, 268435488, 0);
}

unint64_t OUTLINED_FUNCTION_5_81()
{
  return sub_242AAB33C();
}

uint64_t OUTLINED_FUNCTION_7_67()
{
  return sub_242C4856C();
}

uint64_t OUTLINED_FUNCTION_8_66()
{
  return sub_242C485A8();
}

BOOL OUTLINED_FUNCTION_9_77()
{
  return sub_242BC8E74();
}

id OUTLINED_FUNCTION_12_54(id a1, SEL a2, uint64_t a3)
{
  return objc_msgSend(a1, a2, a3, 0);
}

void OUTLINED_FUNCTION_13_69()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_15_61()
{
  return sub_242C4853C();
}

uint64_t OUTLINED_FUNCTION_16_56()
{
  return sub_242C4853C();
}

id OUTLINED_FUNCTION_17_57()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 968));
}

void OUTLINED_FUNCTION_18_60()
{
  uint64_t v0;

  sub_242A5A5E8(v0);
}

uint64_t OUTLINED_FUNCTION_19_47()
{
  return sub_242C48A04();
}

uint64_t OUTLINED_FUNCTION_21_52()
{
  return sub_242C4856C();
}

uint64_t OUTLINED_FUNCTION_22_53()
{
  return sub_242C4853C();
}

unint64_t OUTLINED_FUNCTION_23_56()
{
  return sub_242AAB33C();
}

uint64_t sub_242C46548(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  _BYTE *v12;

  v4 = v3;
  v7 = *(_QWORD *)(v2 + 16);
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(v7))
  {
    v9 = v8;
    ObjectType = swift_getObjectType();
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 24);
    swift_unknownObjectRetain();
    v4 = v11(a1, a2, ObjectType, v9);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_242B18BF8();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_242C46634(uint64_t a1, uint64_t a2)
{
  return sub_242C46548(a1, a2);
}

unint64_t sub_242C46648(uint64_t a1)
{
  unint64_t result;

  result = sub_242C4666C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_242C4666C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257228240;
  if (!qword_257228240)
  {
    v1 = type metadata accessor for TrackedOperation();
    result = MEMORY[0x2494EDE24](&unk_242C4E798, v1);
    atomic_store(result, (unint64_t *)&qword_257228240);
  }
  return result;
}

uint64_t static GradientClippingMode.== infix(_:_:)(uint64_t *a1, float *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = *a1;
  v3 = *(_QWORD *)a2;
  v4 = *((unsigned __int8 *)a2 + 12);
  if (*((_BYTE *)a1 + 12))
  {
    if (*((_BYTE *)a1 + 12) == 1)
      return v4 == 1 && *(float *)&v2 == *(float *)&v3;
    if (v4 == 2)
    {
      if ((v2 & 0x100000000) != 0)
      {
        if ((v3 & 0x100000000) != 0)
          return *((float *)a1 + 2) == a2[2];
      }
      else if ((v3 & 0x100000000) == 0 && *(float *)&v2 == *(float *)&v3)
      {
        return *((float *)a1 + 2) == a2[2];
      }
    }
    return 0;
  }
  if (*((_BYTE *)a2 + 12))
    return 0;
  LODWORD(v3) = *(float *)&v2 == *(float *)&v3;
  if (*((float *)&v2 + 1) == *((float *)&v3 + 1))
    return v3;
  else
    return 0;
}

unint64_t sub_242C46758(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

uint64_t sub_242C46768(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696D697263736964 && a2 == 0xED0000726F74616ELL;
  if (v2 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000242C73E60 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000242C73E80 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000242C73EA0 || (sub_242C4925C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000022 && a2 == 0x8000000242C73EC0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_242C4925C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_242C46984(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_242C469C4 + 4 * byte_242C63E40[a1]))(0x696D697263736964, 0xED0000726F74616ELL);
}

unint64_t sub_242C469C4()
{
  return 0xD000000000000016;
}

unint64_t sub_242C46A34@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_242C46758(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_242C46A5C()
{
  sub_242C473BC();
  return sub_242C48524();
}

uint64_t sub_242C46AB8()
{
  sub_242C473BC();
  return sub_242C484F4();
}

uint64_t sub_242C46B04()
{
  unsigned __int8 *v0;

  return sub_242C46984(*v0);
}

uint64_t sub_242C46B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242C46768(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242C46B30()
{
  sub_242C46D78();
  return sub_242C494D8();
}

uint64_t sub_242C46B58()
{
  sub_242C46D78();
  return sub_242C494E4();
}

void GradientClippingMode.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F6C8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C46D78();
  sub_242C49448();
  if (!v2)
  {
    sub_242C46DB4();
    OUTLINED_FUNCTION_4_81();
    if (v13)
    {
      if (v13 != 1)
      {
        v10 = sub_242C49088();
        OUTLINED_FUNCTION_11_7();
        v9 = v11;
        OUTLINED_FUNCTION_1_12();
        v8 = v10 & 0x1FFFFFFFFLL;
        goto LABEL_9;
      }
      OUTLINED_FUNCTION_11_7();
      v7 = v6;
      OUTLINED_FUNCTION_1_12();
      v8 = v7;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572298C8);
      sub_242BC6698(&qword_25722B348, MEMORY[0x24BEE1520], MEMORY[0x24BEE0900]);
      OUTLINED_FUNCTION_4_81();
      OUTLINED_FUNCTION_1_12();
      v8 = v12;
    }
    v9 = 0;
LABEL_9:
    *(_QWORD *)a2 = v8;
    *(_DWORD *)(a2 + 8) = v9;
    *(_BYTE *)(a2 + 12) = v13;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_26_14();
}

unint64_t sub_242C46D78()
{
  unint64_t result;

  result = qword_25722F6D0;
  if (!qword_25722F6D0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C640C8, &type metadata for GradientClippingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F6D0);
  }
  return result;
}

unint64_t sub_242C46DB4()
{
  unint64_t result;

  result = qword_25722F6D8;
  if (!qword_25722F6D8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C640A0, &type metadata for GradientClippingMode.Discriminator);
    atomic_store(result, (unint64_t *)&qword_25722F6D8);
  }
  return result;
}

void GradientClippingMode.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25722F6E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  v8 = *((unsigned __int8 *)v1 + 12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242C46D78();
  sub_242C49478();
  if (v8)
  {
    if (v8 == 1)
    {
      LOBYTE(v11) = 1;
      OUTLINED_FUNCTION_5_82();
      OUTLINED_FUNCTION_0_103();
      if (!v2)
      {
        LOBYTE(v11) = 2;
LABEL_9:
        sub_242C4916C();
      }
    }
    else
    {
      LOBYTE(v11) = 2;
      OUTLINED_FUNCTION_5_82();
      OUTLINED_FUNCTION_0_103();
      if (!v2)
      {
        LOBYTE(v11) = 4;
        sub_242C49130();
        LOBYTE(v11) = 3;
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
    OUTLINED_FUNCTION_5_82();
    OUTLINED_FUNCTION_0_103();
    if (!v2)
    {
      v11 = v10;
      v12 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572298C8);
      sub_242BC6698(&qword_25722B338, MEMORY[0x24BEE14F8], MEMORY[0x24BEE08E0]);
      sub_242C49184();
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_26_14();
}

unint64_t sub_242C47004()
{
  unint64_t result;

  result = qword_25722F6E8;
  if (!qword_25722F6E8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C64078, &type metadata for GradientClippingMode.Discriminator);
    atomic_store(result, (unint64_t *)&qword_25722F6E8);
  }
  return result;
}

void sub_242C47040(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  GradientClippingMode.init(from:)(a1, a2);
}

void sub_242C47054(_QWORD *a1)
{
  GradientClippingMode.encode(to:)(a1);
}

_QWORD *__swift_memcpy13_4(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for GradientClippingMode(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 13))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 12);
      if (v3 <= 2)
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

uint64_t storeEnumTagSinglePayload for GradientClippingMode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 13) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 13) = 0;
    if (a2)
      *(_BYTE *)(result + 12) = -(char)a2;
  }
  return result;
}

uint64_t sub_242C47104(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t sub_242C4710C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 12) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GradientClippingMode()
{
  return &type metadata for GradientClippingMode;
}

uint64_t storeEnumTagSinglePayload for GradientClippingMode.Discriminator(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242C47170 + 4 * byte_242C63E4A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_242C471A4 + 4 * byte_242C63E45[v4]))();
}

uint64_t sub_242C471A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C471AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C471B4);
  return result;
}

uint64_t sub_242C471C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C471C8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_242C471CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C471D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GradientClippingMode.Discriminator()
{
  return &type metadata for GradientClippingMode.Discriminator;
}

uint64_t storeEnumTagSinglePayload for GradientClippingMode.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_242C4723C + 4 * byte_242C63E54[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_242C47270 + 4 * byte_242C63E4F[v4]))();
}

uint64_t sub_242C47270(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C47278(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242C47280);
  return result;
}

uint64_t sub_242C4728C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242C47294);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_242C47298(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242C472A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GradientClippingMode.CodingKeys()
{
  return &type metadata for GradientClippingMode.CodingKeys;
}

unint64_t sub_242C472C0()
{
  unint64_t result;

  result = qword_25722F6F0;
  if (!qword_25722F6F0)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63FB0, &type metadata for GradientClippingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F6F0);
  }
  return result;
}

unint64_t sub_242C47300()
{
  unint64_t result;

  result = qword_25722F6F8;
  if (!qword_25722F6F8)
  {
    result = MEMORY[0x2494EDE24](&unk_242C64050, &type metadata for GradientClippingMode.Discriminator);
    atomic_store(result, (unint64_t *)&qword_25722F6F8);
  }
  return result;
}

unint64_t sub_242C47340()
{
  unint64_t result;

  result = qword_25722F700;
  if (!qword_25722F700)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63F20, &type metadata for GradientClippingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F700);
  }
  return result;
}

unint64_t sub_242C47380()
{
  unint64_t result;

  result = qword_25722F708;
  if (!qword_25722F708)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63F48, &type metadata for GradientClippingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25722F708);
  }
  return result;
}

unint64_t sub_242C473BC()
{
  unint64_t result;

  result = qword_25722F710;
  if (!qword_25722F710)
  {
    result = MEMORY[0x2494EDE24](&unk_242C63FD8, &type metadata for GradientClippingMode.Discriminator);
    atomic_store(result, (unint64_t *)&qword_25722F710);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_103()
{
  return sub_242C49184();
}

uint64_t OUTLINED_FUNCTION_4_81()
{
  return sub_242C490D0();
}

unint64_t OUTLINED_FUNCTION_5_82()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 0;
  return sub_242C47004();
}

uint64_t sub_242C475F4()
{
  return MEMORY[0x24BEDF500]();
}

uint64_t sub_242C47600()
{
  return MEMORY[0x24BEDF528]();
}

uint64_t sub_242C4760C()
{
  return MEMORY[0x24BEDF538]();
}

uint64_t sub_242C47618()
{
  return MEMORY[0x24BEDF540]();
}

uint64_t sub_242C47624()
{
  return MEMORY[0x24BEDF560]();
}

uint64_t sub_242C47630()
{
  return MEMORY[0x24BEDF578]();
}

uint64_t sub_242C4763C()
{
  return MEMORY[0x24BEDF580]();
}

uint64_t sub_242C47648()
{
  return MEMORY[0x24BEDF588]();
}

uint64_t sub_242C47654()
{
  return MEMORY[0x24BEDF590]();
}

uint64_t sub_242C47660()
{
  return MEMORY[0x24BEDF5E8]();
}

uint64_t sub_242C4766C()
{
  return MEMORY[0x24BEDF5F0]();
}

uint64_t sub_242C47678()
{
  return MEMORY[0x24BEDF5F8]();
}

uint64_t sub_242C47684()
{
  return MEMORY[0x24BEDF600]();
}

uint64_t sub_242C47690()
{
  return MEMORY[0x24BEDF608]();
}

uint64_t sub_242C4769C()
{
  return MEMORY[0x24BEDF610]();
}

uint64_t sub_242C476A8()
{
  return MEMORY[0x24BEDF618]();
}

uint64_t sub_242C476B4()
{
  return MEMORY[0x24BEDF620]();
}

uint64_t sub_242C476C0()
{
  return MEMORY[0x24BEDF628]();
}

uint64_t sub_242C476CC()
{
  return MEMORY[0x24BEDF630]();
}

uint64_t sub_242C476D8()
{
  return MEMORY[0x24BEDF638]();
}

uint64_t sub_242C476E4()
{
  return MEMORY[0x24BEDF640]();
}

uint64_t sub_242C476F0()
{
  return MEMORY[0x24BEDF650]();
}

uint64_t sub_242C476FC()
{
  return MEMORY[0x24BEDF660]();
}

uint64_t sub_242C47708()
{
  return MEMORY[0x24BEDF678]();
}

uint64_t sub_242C47714()
{
  return MEMORY[0x24BEDF690]();
}

uint64_t sub_242C47720()
{
  return MEMORY[0x24BEDF698]();
}

uint64_t sub_242C4772C()
{
  return MEMORY[0x24BEDF6A0]();
}

uint64_t sub_242C47738()
{
  return MEMORY[0x24BEDF6A8]();
}

uint64_t sub_242C47744()
{
  return MEMORY[0x24BEDF6B0]();
}

uint64_t sub_242C47750()
{
  return MEMORY[0x24BEDF6B8]();
}

uint64_t sub_242C4775C()
{
  return MEMORY[0x24BEDF6D0]();
}

uint64_t sub_242C47768()
{
  return MEMORY[0x24BEDF6D8]();
}

uint64_t sub_242C47774()
{
  return MEMORY[0x24BEDF6E0]();
}

uint64_t sub_242C47780()
{
  return MEMORY[0x24BEDF6E8]();
}

uint64_t sub_242C4778C()
{
  return MEMORY[0x24BEDF6F0]();
}

uint64_t sub_242C47798()
{
  return MEMORY[0x24BEDF700]();
}

uint64_t sub_242C477A4()
{
  return MEMORY[0x24BEDF708]();
}

uint64_t sub_242C477B0()
{
  return MEMORY[0x24BEDF7A8]();
}

uint64_t sub_242C477BC()
{
  return MEMORY[0x24BEDF7B8]();
}

uint64_t sub_242C477C8()
{
  return MEMORY[0x24BEDF7E8]();
}

uint64_t sub_242C477D4()
{
  return MEMORY[0x24BEDF7F8]();
}

uint64_t sub_242C477E0()
{
  return MEMORY[0x24BEDF800]();
}

uint64_t sub_242C477EC()
{
  return MEMORY[0x24BEDF808]();
}

uint64_t sub_242C477F8()
{
  return MEMORY[0x24BEDF810]();
}

uint64_t sub_242C47804()
{
  return MEMORY[0x24BEDF818]();
}

uint64_t sub_242C47810()
{
  return MEMORY[0x24BEDF820]();
}

uint64_t sub_242C4781C()
{
  return MEMORY[0x24BEDF838]();
}

uint64_t sub_242C47828()
{
  return MEMORY[0x24BEDF840]();
}

uint64_t sub_242C47834()
{
  return MEMORY[0x24BEDF850]();
}

uint64_t sub_242C47840()
{
  return MEMORY[0x24BEDF858]();
}

uint64_t sub_242C4784C()
{
  return MEMORY[0x24BEDF860]();
}

uint64_t sub_242C47858()
{
  return MEMORY[0x24BEDF868]();
}

uint64_t sub_242C47864()
{
  return MEMORY[0x24BEDF870]();
}

uint64_t sub_242C47870()
{
  return MEMORY[0x24BEDF878]();
}

uint64_t sub_242C4787C()
{
  return MEMORY[0x24BEDF880]();
}

uint64_t sub_242C47888()
{
  return MEMORY[0x24BEDF960]();
}

uint64_t sub_242C47894()
{
  return MEMORY[0x24BEDF9C8]();
}

uint64_t sub_242C478A0()
{
  return MEMORY[0x24BEDF9D0]();
}

uint64_t sub_242C478AC()
{
  return MEMORY[0x24BEDF9D8]();
}

uint64_t sub_242C478B8()
{
  return MEMORY[0x24BEDF9E0]();
}

uint64_t sub_242C478C4()
{
  return MEMORY[0x24BEDF9E8]();
}

uint64_t sub_242C478D0()
{
  return MEMORY[0x24BEDF9F0]();
}

uint64_t sub_242C478DC()
{
  return MEMORY[0x24BEDFA10]();
}

uint64_t sub_242C478E8()
{
  return MEMORY[0x24BEDFA20]();
}

uint64_t sub_242C478F4()
{
  return MEMORY[0x24BEDFA28]();
}

uint64_t sub_242C47900()
{
  return MEMORY[0x24BEDFA40]();
}

uint64_t sub_242C4790C()
{
  return MEMORY[0x24BEDFA48]();
}

uint64_t sub_242C47918()
{
  return MEMORY[0x24BEDFA50]();
}

uint64_t sub_242C47924()
{
  return MEMORY[0x24BEDFA58]();
}

uint64_t sub_242C47930()
{
  return MEMORY[0x24BEDFA60]();
}

uint64_t sub_242C4793C()
{
  return MEMORY[0x24BEDFA70]();
}

uint64_t sub_242C47948()
{
  return MEMORY[0x24BEDFA78]();
}

uint64_t sub_242C47954()
{
  return MEMORY[0x24BEDFA80]();
}

uint64_t sub_242C47960()
{
  return MEMORY[0x24BEDFA88]();
}

uint64_t sub_242C4796C()
{
  return MEMORY[0x24BEDFA90]();
}

uint64_t sub_242C47978()
{
  return MEMORY[0x24BEDFA98]();
}

uint64_t sub_242C47984()
{
  return MEMORY[0x24BEDFAC0]();
}

uint64_t sub_242C47990()
{
  return MEMORY[0x24BEDFAE0]();
}

uint64_t sub_242C4799C()
{
  return MEMORY[0x24BEDFAE8]();
}

uint64_t sub_242C479A8()
{
  return MEMORY[0x24BEDFAF0]();
}

uint64_t sub_242C479B4()
{
  return MEMORY[0x24BEDFAF8]();
}

uint64_t sub_242C479C0()
{
  return MEMORY[0x24BEDFB00]();
}

uint64_t sub_242C479CC()
{
  return MEMORY[0x24BEDFB08]();
}

uint64_t sub_242C479D8()
{
  return MEMORY[0x24BEDFB10]();
}

uint64_t sub_242C479E4()
{
  return MEMORY[0x24BEDFB18]();
}

uint64_t sub_242C479F0()
{
  return MEMORY[0x24BEDFB20]();
}

uint64_t sub_242C479FC()
{
  return MEMORY[0x24BEDFB28]();
}

uint64_t sub_242C47A08()
{
  return MEMORY[0x24BEDFB30]();
}

uint64_t sub_242C47A14()
{
  return MEMORY[0x24BEDFB38]();
}

uint64_t sub_242C47A20()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_242C47A2C()
{
  return MEMORY[0x24BDCB2A0]();
}

uint64_t sub_242C47A38()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_242C47A44()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_242C47A50()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_242C47A5C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_242C47A68()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_242C47A74()
{
  return MEMORY[0x24BDCB7D8]();
}

uint64_t sub_242C47A80()
{
  return MEMORY[0x24BDCB7E0]();
}

uint64_t sub_242C47A8C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_242C47A98()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_242C47AA4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_242C47AB0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_242C47ABC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_242C47AC8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_242C47AD4()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_242C47AE0()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_242C47AEC()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_242C47AF8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_242C47B04()
{
  return MEMORY[0x24BDCD750]();
}

uint64_t sub_242C47B10()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_242C47B1C()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_242C47B28()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_242C47B34()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_242C47B40()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_242C47B4C()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_242C47B58()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_242C47B64()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_242C47B70()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_242C47B7C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_242C47B88()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_242C47B94()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_242C47BA0()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t sub_242C47BAC()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_242C47BB8()
{
  return MEMORY[0x24BDCDBD8]();
}

uint64_t sub_242C47BC4()
{
  return MEMORY[0x24BDCDC80]();
}

uint64_t sub_242C47BD0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_242C47BDC()
{
  return MEMORY[0x24BDCDCB8]();
}

uint64_t sub_242C47BE8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_242C47BF4()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_242C47C00()
{
  return MEMORY[0x24BDCDD08]();
}

uint64_t sub_242C47C0C()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_242C47C18()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_242C47C24()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_242C47C30()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_242C47C3C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_242C47C48()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_242C47C54()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_242C47C60()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_242C47C6C()
{
  return MEMORY[0x24BE623F8]();
}

uint64_t sub_242C47C78()
{
  return MEMORY[0x24BE62438]();
}

uint64_t sub_242C47C84()
{
  return MEMORY[0x24BE62448]();
}

uint64_t sub_242C47C90()
{
  return MEMORY[0x24BE62490]();
}

uint64_t sub_242C47C9C()
{
  return MEMORY[0x24BE624B0]();
}

uint64_t sub_242C47CA8()
{
  return MEMORY[0x24BE624E8]();
}

uint64_t sub_242C47CB4()
{
  return MEMORY[0x24BE62580]();
}

uint64_t sub_242C47CC0()
{
  return MEMORY[0x24BE62988]();
}

uint64_t sub_242C47CCC()
{
  return MEMORY[0x24BE62990]();
}

uint64_t sub_242C47CD8()
{
  return MEMORY[0x24BE629B8]();
}

uint64_t sub_242C47CE4()
{
  return MEMORY[0x24BE629C8]();
}

uint64_t sub_242C47CF0()
{
  return MEMORY[0x24BE62D58]();
}

uint64_t sub_242C47CFC()
{
  return MEMORY[0x24BE62D78]();
}

uint64_t sub_242C47D08()
{
  return MEMORY[0x24BE62D80]();
}

uint64_t sub_242C47D14()
{
  return MEMORY[0x24BE62D90]();
}

uint64_t sub_242C47D20()
{
  return MEMORY[0x24BE62D98]();
}

uint64_t sub_242C47D2C()
{
  return MEMORY[0x24BE62DA0]();
}

uint64_t sub_242C47D38()
{
  return MEMORY[0x24BE62DB8]();
}

uint64_t sub_242C47D44()
{
  return MEMORY[0x24BE62DC0]();
}

uint64_t sub_242C47D50()
{
  return MEMORY[0x24BE62DC8]();
}

uint64_t sub_242C47D5C()
{
  return MEMORY[0x24BE62DE8]();
}

uint64_t sub_242C47D68()
{
  return MEMORY[0x24BE62DF0]();
}

uint64_t sub_242C47D74()
{
  return MEMORY[0x24BE62EE0]();
}

uint64_t sub_242C47D80()
{
  return MEMORY[0x24BE62F18]();
}

uint64_t sub_242C47D8C()
{
  return MEMORY[0x24BE62F30]();
}

uint64_t sub_242C47D98()
{
  return MEMORY[0x24BE62F38]();
}

uint64_t sub_242C47DA4()
{
  return MEMORY[0x24BE62F58]();
}

uint64_t sub_242C47DB0()
{
  return MEMORY[0x24BE62F68]();
}

uint64_t sub_242C47DBC()
{
  return MEMORY[0x24BE62F78]();
}

uint64_t sub_242C47DC8()
{
  return MEMORY[0x24BE62F80]();
}

uint64_t sub_242C47DD4()
{
  return MEMORY[0x24BE62FA0]();
}

uint64_t sub_242C47DE0()
{
  return MEMORY[0x24BE62FB0]();
}

uint64_t sub_242C47DEC()
{
  return MEMORY[0x24BE62FC8]();
}

uint64_t sub_242C47DF8()
{
  return MEMORY[0x24BE62FD8]();
}

uint64_t sub_242C47E04()
{
  return MEMORY[0x24BE62FF0]();
}

uint64_t sub_242C47E10()
{
  return MEMORY[0x24BE630F0]();
}

uint64_t sub_242C47E1C()
{
  return MEMORY[0x24BE630F8]();
}

uint64_t sub_242C47E28()
{
  return MEMORY[0x24BE63100]();
}

uint64_t sub_242C47E34()
{
  return MEMORY[0x24BE63108]();
}

uint64_t sub_242C47E40()
{
  return MEMORY[0x24BE63110]();
}

uint64_t sub_242C47E4C()
{
  return MEMORY[0x24BE63118]();
}

uint64_t sub_242C47E58()
{
  return MEMORY[0x24BE63128]();
}

uint64_t sub_242C47E64()
{
  return MEMORY[0x24BE63138]();
}

uint64_t sub_242C47E70()
{
  return MEMORY[0x24BE63148]();
}

uint64_t sub_242C47E7C()
{
  return MEMORY[0x24BE63150]();
}

uint64_t sub_242C47E88()
{
  return MEMORY[0x24BE63168]();
}

uint64_t sub_242C47E94()
{
  return MEMORY[0x24BE63170]();
}

uint64_t sub_242C47EA0()
{
  return MEMORY[0x24BE631B0]();
}

uint64_t sub_242C47EAC()
{
  return MEMORY[0x24BE631F0]();
}

uint64_t sub_242C47EB8()
{
  return MEMORY[0x24BE631F8]();
}

uint64_t sub_242C47EC4()
{
  return MEMORY[0x24BE63200]();
}

uint64_t sub_242C47ED0()
{
  return MEMORY[0x24BE63210]();
}

uint64_t sub_242C47EDC()
{
  return MEMORY[0x24BE632E8]();
}

uint64_t sub_242C47EE8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_242C47EF4()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_242C47F00()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_242C47F0C()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_242C47F18()
{
  return MEMORY[0x24BEE77B0]();
}

uint64_t sub_242C47F24()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_242C47F30()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_242C47F3C()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_242C47F48()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_242C47F54()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_242C47F60()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_242C47F6C()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_242C47F78()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_242C47F84()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_242C47F90()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_242C47F9C()
{
  return MEMORY[0x24BDBFD00]();
}

uint64_t sub_242C47FA8()
{
  return MEMORY[0x24BDBFD08]();
}

uint64_t sub_242C47FB4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_242C47FC0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_242C47FCC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_242C47FD8()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_242C47FE4()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_242C47FF0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_242C47FFC()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_242C48008()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_242C48014()
{
  return MEMORY[0x24BEE01E0]();
}

uint64_t sub_242C48020()
{
  return MEMORY[0x24BEE01E8]();
}

uint64_t sub_242C4802C()
{
  return MEMORY[0x24BEE01F0]();
}

uint64_t sub_242C48038()
{
  return MEMORY[0x24BEE01F8]();
}

uint64_t sub_242C48044()
{
  return MEMORY[0x24BEE0220]();
}

uint64_t sub_242C48050()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_242C4805C()
{
  return MEMORY[0x24BEE0230]();
}

uint64_t sub_242C48068()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_242C48074()
{
  return MEMORY[0x24BEE0258]();
}

uint64_t sub_242C48080()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_242C4808C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_242C48098()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_242C480A4()
{
  return MEMORY[0x24BEE0280]();
}

uint64_t sub_242C480B0()
{
  return MEMORY[0x24BEE0298]();
}

uint64_t sub_242C480BC()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_242C480C8()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t sub_242C480D4()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_242C480E0()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_242C480EC()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_242C480F8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_242C48104()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_242C48110()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_242C4811C()
{
  return MEMORY[0x24BEE0548]();
}

uint64_t sub_242C48128()
{
  return MEMORY[0x24BEE0588]();
}

uint64_t sub_242C48134()
{
  return MEMORY[0x24BEE05A0]();
}

uint64_t sub_242C48140()
{
  return MEMORY[0x24BEE05E8]();
}

uint64_t sub_242C4814C()
{
  return MEMORY[0x24BEE05F8]();
}

uint64_t sub_242C48158()
{
  return MEMORY[0x24BEE0600]();
}

uint64_t sub_242C48164()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_242C48170()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_242C4817C()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_242C48188()
{
  return MEMORY[0x24BEE0798]();
}

uint64_t sub_242C48194()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_242C481A0()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_242C481AC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_242C481B8()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_242C481C4()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_242C481D0()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_242C481DC()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_242C481E8()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_242C481F4()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_242C48200()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_242C4820C()
{
  return MEMORY[0x24BEE0998]();
}

uint64_t sub_242C48218()
{
  return MEMORY[0x24BEE09B0]();
}

uint64_t sub_242C48224()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_242C48230()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_242C4823C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_242C48248()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_242C48254()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_242C48260()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_242C4826C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_242C48278()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_242C48284()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_242C48290()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_242C4829C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_242C482A8()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_242C482B4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_242C482C0()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t sub_242C482CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_242C482D8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_242C482E4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_242C482F0()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_242C482FC()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_242C48308()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_242C48314()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_242C48320()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_242C4832C()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_242C48338()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_242C48344()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_242C48350()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_242C4835C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_242C48368()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_242C48374()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_242C48380()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_242C4838C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_242C48398()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_242C483A4()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_242C483B0()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_242C483BC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_242C483C8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_242C483D4()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_242C483E0()
{
  return MEMORY[0x24BEE0DF0]();
}

uint64_t sub_242C483EC()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_242C483F8()
{
  return MEMORY[0x24BEE0E10]();
}

uint64_t sub_242C48404()
{
  return MEMORY[0x24BEE0E30]();
}

uint64_t sub_242C48410()
{
  return MEMORY[0x24BEE0E38]();
}

uint64_t sub_242C4841C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_242C48428()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_242C48434()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_242C48440()
{
  return MEMORY[0x24BEE0E60]();
}

uint64_t sub_242C4844C()
{
  return MEMORY[0x24BEE0E68]();
}

uint64_t sub_242C48458()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_242C48464()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_242C48470()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_242C4847C()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_242C48488()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_242C48494()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_242C484A0()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_242C484AC()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_242C484B8()
{
  return MEMORY[0x24BEE0EF8]();
}

uint64_t sub_242C484C4()
{
  return MEMORY[0x24BEE0F08]();
}

uint64_t sub_242C484D0()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_242C484DC()
{
  return MEMORY[0x24BEE0F78]();
}

uint64_t sub_242C484E8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_242C484F4()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_242C48500()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_242C4850C()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_242C48518()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_242C48524()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_242C48530()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_242C4853C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_242C48548()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_242C48554()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_242C48560()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_242C4856C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_242C48578()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_242C48584()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_242C48590()
{
  return MEMORY[0x24BEE1148]();
}

uint64_t sub_242C4859C()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_242C485A8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_242C485B4()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_242C485C0()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_242C485CC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_242C485D8()
{
  return MEMORY[0x24BEE1198]();
}

uint64_t sub_242C485E4()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_242C485F0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_242C485FC()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_242C48608()
{
  return MEMORY[0x24BEE11E0]();
}

uint64_t sub_242C48614()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_242C48620()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_242C4862C()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_242C48638()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_242C48644()
{
  return MEMORY[0x24BEE1248]();
}

uint64_t sub_242C48650()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_242C4865C()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_242C48668()
{
  return MEMORY[0x24BEE1290]();
}

uint64_t sub_242C48674()
{
  return MEMORY[0x24BEE1300]();
}

uint64_t sub_242C48680()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_242C4868C()
{
  return MEMORY[0x24BEE1380]();
}

uint64_t sub_242C48698()
{
  return MEMORY[0x24BEE1390]();
}

uint64_t sub_242C486A4()
{
  return MEMORY[0x24BEE13A0]();
}

uint64_t sub_242C486B0()
{
  return MEMORY[0x24BEE13B0]();
}

uint64_t sub_242C486BC()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_242C486C8()
{
  return MEMORY[0x24BEE1488]();
}

uint64_t sub_242C486D4()
{
  return MEMORY[0x24BEE1498]();
}

uint64_t sub_242C486E0()
{
  return MEMORY[0x24BEE14A8]();
}

uint64_t sub_242C486EC()
{
  return MEMORY[0x24BEE14B8]();
}

uint64_t sub_242C486F8()
{
  return MEMORY[0x24BEE14C0]();
}

uint64_t sub_242C48704()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_242C48710()
{
  return MEMORY[0x24BEE14D0]();
}

uint64_t sub_242C4871C()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t sub_242C48728()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_242C48734()
{
  return MEMORY[0x24BEE15F8]();
}

uint64_t sub_242C48740()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_242C4874C()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_242C48758()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_242C48764()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_242C48770()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_242C4877C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_242C48788()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_242C48794()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_242C487A0()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_242C487AC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_242C487B8()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_242C487C4()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_242C487D0()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_242C487DC()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_242C487E8()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_242C487F4()
{
  return MEMORY[0x24BEE1958]();
}

uint64_t sub_242C48800()
{
  return MEMORY[0x24BEE1960]();
}

uint64_t sub_242C4880C()
{
  return MEMORY[0x24BEE1968]();
}

uint64_t sub_242C48818()
{
  return MEMORY[0x24BEE1970]();
}

uint64_t sub_242C48824()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_242C48830()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_242C4883C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_242C48848()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_242C48854()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_242C48860()
{
  return MEMORY[0x24BEE7648]();
}

uint64_t sub_242C4886C()
{
  return MEMORY[0x24BEE1AD8]();
}

uint64_t sub_242C48878()
{
  return MEMORY[0x24BEE1B08]();
}

uint64_t sub_242C48884()
{
  return MEMORY[0x24BEE1B20]();
}

uint64_t sub_242C48890()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_242C4889C()
{
  return MEMORY[0x24BEE1B80]();
}

uint64_t sub_242C488A8()
{
  return MEMORY[0x24BEE1B88]();
}

uint64_t sub_242C488B4()
{
  return MEMORY[0x24BEDFD38]();
}

uint64_t sub_242C488C0()
{
  return MEMORY[0x24BEDFD40]();
}

uint64_t sub_242C488CC()
{
  return MEMORY[0x24BEDFD48]();
}

uint64_t sub_242C488D8()
{
  return MEMORY[0x24BEDFD50]();
}

uint64_t sub_242C488E4()
{
  return MEMORY[0x24BEDFD58]();
}

uint64_t sub_242C488F0()
{
  return MEMORY[0x24BEDFD60]();
}

uint64_t sub_242C488FC()
{
  return MEMORY[0x24BEDFD68]();
}

uint64_t sub_242C48908()
{
  return MEMORY[0x24BEDFD70]();
}

uint64_t sub_242C48914()
{
  return MEMORY[0x24BDCFE50]();
}

uint64_t sub_242C48920()
{
  return MEMORY[0x24BDCFE60]();
}

uint64_t sub_242C4892C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_242C48938()
{
  return MEMORY[0x24BEDFD98]();
}

uint64_t sub_242C48944()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_242C48950()
{
  return MEMORY[0x24BEE5740]();
}

uint64_t sub_242C4895C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_242C48968()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_242C48974()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_242C48980()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_242C4898C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_242C48998()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_242C489A4()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_242C489B0()
{
  return MEMORY[0x24BEDFDC0]();
}

uint64_t sub_242C489BC()
{
  return MEMORY[0x24BEDFDD8]();
}

uint64_t sub_242C489C8()
{
  return MEMORY[0x24BEDFDE0]();
}

uint64_t sub_242C489D4()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_242C489E0()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_242C489EC()
{
  return MEMORY[0x24BEDFDE8]();
}

uint64_t sub_242C489F8()
{
  return MEMORY[0x24BEDFDF0]();
}

uint64_t sub_242C48A04()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_242C48A10()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_242C48A1C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_242C48A28()
{
  return MEMORY[0x24BEDFE10]();
}

uint64_t sub_242C48A34()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_242C48A40()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_242C48A4C()
{
  return MEMORY[0x24BEE1BE8]();
}

uint64_t sub_242C48A58()
{
  return MEMORY[0x24BEE1C28]();
}

uint64_t sub_242C48A64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_242C48A70()
{
  return MEMORY[0x24BEE1C80]();
}

uint64_t sub_242C48A7C()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_242C48A88()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_242C48A94()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_242C48AA0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_242C48AAC()
{
  return MEMORY[0x24BEE1F08]();
}

uint64_t sub_242C48AB8()
{
  return MEMORY[0x24BEE1F10]();
}

uint64_t sub_242C48AC4()
{
  return MEMORY[0x24BEE1F18]();
}

uint64_t sub_242C48AD0()
{
  return MEMORY[0x24BEE1F20]();
}

uint64_t sub_242C48ADC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_242C48AE8()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_242C48AF4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_242C48B00()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_242C48B0C()
{
  return MEMORY[0x24BEE1FF0]();
}

uint64_t sub_242C48B18()
{
  return MEMORY[0x24BEE2020]();
}

uint64_t sub_242C48B24()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_242C48B30()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_242C48B3C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_242C48B48()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_242C48B54()
{
  return MEMORY[0x24BEE20D0]();
}

uint64_t sub_242C48B60()
{
  return MEMORY[0x24BEE20D8]();
}

uint64_t sub_242C48B6C()
{
  return MEMORY[0x24BEE20E0]();
}

uint64_t sub_242C48B78()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t sub_242C48B84()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_242C48B90()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_242C48B9C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_242C48BA8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_242C48BB4()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_242C48BC0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_242C48BCC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_242C48BD8()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_242C48BE4()
{
  return MEMORY[0x24BEE23F8]();
}

uint64_t sub_242C48BF0()
{
  return MEMORY[0x24BEE2410]();
}

uint64_t sub_242C48BFC()
{
  return MEMORY[0x24BEE2428]();
}

uint64_t sub_242C48C08()
{
  return MEMORY[0x24BEE2438]();
}

uint64_t sub_242C48C14()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_242C48C20()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_242C48C2C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_242C48C38()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_242C48C44()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_242C48C50()
{
  return MEMORY[0x24BEE2528]();
}

uint64_t sub_242C48C5C()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_242C48C68()
{
  return MEMORY[0x24BEE25F0]();
}

uint64_t sub_242C48C74()
{
  return MEMORY[0x24BEE25F8]();
}

uint64_t sub_242C48C80()
{
  return MEMORY[0x24BEE2600]();
}

uint64_t sub_242C48C8C()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_242C48C98()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_242C48CA4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_242C48CB0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_242C48CBC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_242C48CC8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_242C48CD4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_242C48CE0()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_242C48CEC()
{
  return MEMORY[0x24BEE2740]();
}

uint64_t sub_242C48CF8()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_242C48D04()
{
  return MEMORY[0x24BEE2810]();
}

uint64_t sub_242C48D10()
{
  return MEMORY[0x24BEE2818]();
}

uint64_t sub_242C48D1C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_242C48D28()
{
  return MEMORY[0x24BEE2868]();
}

uint64_t sub_242C48D34()
{
  return MEMORY[0x24BEE28A8]();
}

uint64_t sub_242C48D40()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_242C48D4C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_242C48D58()
{
  return MEMORY[0x24BEE2928]();
}

uint64_t sub_242C48D64()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_242C48D70()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_242C48D7C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_242C48D88()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_242C48D94()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_242C48DA0()
{
  return MEMORY[0x24BEE2990]();
}

uint64_t sub_242C48DAC()
{
  return MEMORY[0x24BEE2998]();
}

uint64_t sub_242C48DB8()
{
  return MEMORY[0x24BEE29A0]();
}

uint64_t sub_242C48DC4()
{
  return MEMORY[0x24BEE29A8]();
}

uint64_t sub_242C48DD0()
{
  return MEMORY[0x24BEE29B0]();
}

uint64_t sub_242C48DDC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_242C48DE8()
{
  return MEMORY[0x24BEE29E0]();
}

uint64_t sub_242C48DF4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_242C48E00()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_242C48E0C()
{
  return MEMORY[0x24BEE2A80]();
}

uint64_t sub_242C48E18()
{
  return MEMORY[0x24BEE2AF8]();
}

uint64_t sub_242C48E24()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_242C48E30()
{
  return MEMORY[0x24BEE2B60]();
}

uint64_t sub_242C48E3C()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_242C48E48()
{
  return MEMORY[0x24BEE2B90]();
}

uint64_t sub_242C48E54()
{
  return MEMORY[0x24BEE2B98]();
}

uint64_t sub_242C48E60()
{
  return MEMORY[0x24BEE2BA8]();
}

uint64_t sub_242C48E6C()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_242C48E78()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_242C48E84()
{
  return MEMORY[0x24BEE2C38]();
}

uint64_t sub_242C48E90()
{
  return MEMORY[0x24BEE2CA8]();
}

uint64_t sub_242C48E9C()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_242C48EA8()
{
  return MEMORY[0x24BEE2CC0]();
}

uint64_t sub_242C48EB4()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_242C48EC0()
{
  return MEMORY[0x24BEE2D10]();
}

uint64_t sub_242C48ECC()
{
  return MEMORY[0x24BEE2D70]();
}

uint64_t sub_242C48ED8()
{
  return MEMORY[0x24BEE2DE0]();
}

uint64_t sub_242C48EE4()
{
  return MEMORY[0x24BEE2E40]();
}

uint64_t sub_242C48EF0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_242C48EFC()
{
  return MEMORY[0x24BEE2E60]();
}

uint64_t sub_242C48F08()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_242C48F14()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_242C48F20()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_242C48F2C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_242C48F38()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_242C48F44()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_242C48F50()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_242C48F5C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_242C48F68()
{
  return MEMORY[0x24BEE2F50]();
}

uint64_t sub_242C48F74()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_242C48F80()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_242C48F8C()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_242C48F98()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_242C48FA4()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_242C48FB0()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_242C48FBC()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_242C48FC8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_242C48FD4()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_242C48FE0()
{
  return MEMORY[0x24BEE3078]();
}

uint64_t sub_242C48FEC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_242C48FF8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_242C49004()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_242C49010()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_242C4901C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_242C49028()
{
  return MEMORY[0x24BEE30B8]();
}

uint64_t sub_242C49034()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_242C49040()
{
  return MEMORY[0x24BEE3158]();
}

uint64_t sub_242C4904C()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t sub_242C49058()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_242C49064()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_242C49070()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_242C4907C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_242C49088()
{
  return MEMORY[0x24BEE32F0]();
}

uint64_t sub_242C49094()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_242C490A0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_242C490AC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_242C490B8()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_242C490C4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_242C490D0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_242C490DC()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_242C490E8()
{
  return MEMORY[0x24BEE33B0]();
}

uint64_t sub_242C490F4()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_242C49100()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_242C4910C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_242C49118()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_242C49124()
{
  return MEMORY[0x24BEE3410]();
}

uint64_t sub_242C49130()
{
  return MEMORY[0x24BEE3440]();
}

uint64_t sub_242C4913C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_242C49148()
{
  return MEMORY[0x24BEE3470]();
}

uint64_t sub_242C49154()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_242C49160()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_242C4916C()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_242C49178()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_242C49184()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_242C49190()
{
  return MEMORY[0x24BEE3500]();
}

uint64_t sub_242C4919C()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_242C491A8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_242C491B4()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_242C491C0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_242C491CC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_242C491D8()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_242C491E4()
{
  return MEMORY[0x24BEE35A8]();
}

uint64_t sub_242C491F0()
{
  return MEMORY[0x24BEE3878]();
}

uint64_t sub_242C491FC()
{
  return MEMORY[0x24BEE38D8]();
}

uint64_t sub_242C49208()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_242C49214()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_242C49220()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_242C4922C()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_242C49238()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_242C49244()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_242C49250()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_242C4925C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_242C49268()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_242C49274()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_242C49280()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_242C4928C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_242C49298()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_242C492A4()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_242C492B0()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_242C492BC()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_242C492C8()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_242C492D4()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_242C492E0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_242C492EC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_242C492F8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_242C49304()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_242C49310()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_242C4931C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_242C49328()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_242C49334()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_242C49340()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_242C4934C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_242C49358()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_242C49364()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_242C49370()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_242C4937C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_242C49388()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_242C49394()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_242C493A0()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_242C493AC()
{
  return MEMORY[0x24BEE4350]();
}

uint64_t sub_242C493B8()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_242C493C4()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t sub_242C493D0()
{
  return MEMORY[0x24BEE43C8]();
}

uint64_t sub_242C493DC()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_242C493E8()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_242C493F4()
{
  return MEMORY[0x24BEE43E8]();
}

uint64_t sub_242C49400()
{
  return MEMORY[0x24BEE43F0]();
}

uint64_t sub_242C4940C()
{
  return MEMORY[0x24BEE43F8]();
}

uint64_t sub_242C49418()
{
  return MEMORY[0x24BDD0810]();
}

uint64_t sub_242C49424()
{
  return MEMORY[0x24BEE45C0]();
}

uint64_t sub_242C49430()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_242C4943C()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_242C49448()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_242C49454()
{
  return MEMORY[0x24BEE4618]();
}

uint64_t sub_242C49460()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_242C4946C()
{
  return MEMORY[0x24BEE4630]();
}

uint64_t sub_242C49478()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_242C49484()
{
  return MEMORY[0x24BEE4648]();
}

uint64_t sub_242C49490()
{
  return MEMORY[0x24BEE4650]();
}

uint64_t sub_242C4949C()
{
  return MEMORY[0x24BEE4658]();
}

uint64_t sub_242C494A8()
{
  return MEMORY[0x24BEE4660]();
}

uint64_t sub_242C494B4()
{
  return MEMORY[0x24BEE4668]();
}

uint64_t sub_242C494C0()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t sub_242C494CC()
{
  return MEMORY[0x24BEE49B8]();
}

uint64_t sub_242C494D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_242C494E4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_242C494F0()
{
  return MEMORY[0x24BEE4A98]();
}

int BNNSArithmeticFilterApplyBatch(void *filter, size_t batch_size, size_t number_of_inputs, const void **in, const size_t *in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x24BDB27E8](filter, batch_size, number_of_inputs, in, in_stride, out, out_stride);
}

void *__cdecl BNNSCreateRandomGeneratorWithSeed(BNNSRandomGeneratorMethod method, uint64_t seed, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x24BDB2800](*(_QWORD *)&method, seed, filter_params);
}

void BNNSDestroyRandomGenerator(void *generator)
{
  MEMORY[0x24BDB2808](generator);
}

int BNNSDirectApplyLSTMBatchTrainingCaching(const BNNSLayerParametersLSTM *layer_params, const BNNSFilterParameters *filter_params, void *training_cache_ptr, const size_t training_cache_capacity)
{
  return MEMORY[0x24BDB2810](layer_params, filter_params, training_cache_ptr, training_cache_capacity);
}

int BNNSFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x24BDB2828](filter, batch_size, in, in_stride, out, out_stride);
}

void *__cdecl BNNSFilterCreateLayerArithmetic(const BNNSLayerParametersArithmetic *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x24BDB2848](layer_params, filter_params);
}

int BNNSLossFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride)
{
  return MEMORY[0x24BDB2960](filter, batch_size, in, in_stride, in_delta, in_delta_stride, labels, labels_stride);
}

int BNNSLossFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, void *out, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride)
{
  return MEMORY[0x24BDB2968](filter, batch_size, in, in_stride, labels, labels_stride, weights, weights_size);
}

int BNNSNormalizationFilterApplyBackwardBatch(void *filter, size_t batch_size, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *beta_delta, BNNSNDArrayDescriptor *gamma_delta)
{
  return MEMORY[0x24BDB2978](filter, batch_size, in_delta, in_delta_stride, out, out_stride, out_delta, out_delta_stride);
}

int BNNSNormalizationFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, BOOL training)
{
  return MEMORY[0x24BDB2980](filter, batch_size, in, in_stride, out, out_stride, training);
}

int BNNSRandomFillNormalFloat(void *generator, BNNSNDArrayDescriptor *desc, float mean, float stddev)
{
  return MEMORY[0x24BDB2988](generator, desc, mean, stddev);
}

int BNNSRandomFillUniformFloat(void *generator, BNNSNDArrayDescriptor *desc, float a, float b)
{
  return MEMORY[0x24BDB2990](generator, desc, a, b);
}

int BNNSRandomFillUniformInt(void *generator, BNNSNDArrayDescriptor *desc, int64_t a, int64_t b)
{
  return MEMORY[0x24BDB2998](generator, desc, a, b);
}

int BNNSScatter(size_t axis, BNNSReduceFunction op, const BNNSNDArrayDescriptor *input, const BNNSNDArrayDescriptor *indices, BNNSNDArrayDescriptor *output, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x24BDB29A0](axis, *(_QWORD *)&op, input, indices, output, filter_params);
}

int BNNSScatterND(BNNSReduceFunction op, const BNNSNDArrayDescriptor *input, const BNNSNDArrayDescriptor *indices, BNNSNDArrayDescriptor *output, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x24BDB29A8](*(_QWORD *)&op, input, indices, output, filter_params);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x24BDD8B28](property, value);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8B68](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x24BDD8C98](property);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8CF0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x24BDD8DB0](buffer, *(_QWORD *)&newState, oldState);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

BOOL MPSSupportsMTLDevice(id device)
{
  return MEMORY[0x24BDDE220](device);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x24BDD1200](bytes);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t espresso_plan_add_cpp_net_from_mil_program_and_reload()
{
  return MEMORY[0x24BE2F3D8]();
}

uint64_t MIL::IRArgument::Make()
{
  return MEMORY[0x24BE615A8]();
}

{
  return MEMORY[0x24BE615B0]();
}

uint64_t MIL::IRFunction::Make()
{
  return MEMORY[0x24BE615B8]();
}

uint64_t MIL::IROperation::Make()
{
  return MEMORY[0x24BE61618]();
}

uint64_t MIL::ParserOptions::Make(MIL::ParserOptions *this)
{
  return MEMORY[0x24BE61648](this);
}

uint64_t MIL::UnknownLocation::Make(MIL::UnknownLocation *this)
{
  return MEMORY[0x24BE61650](this);
}

uint64_t MIL::IRNamedValueType::Make()
{
  return MEMORY[0x24BE61658]();
}

void MIL::IRNamedValueType::~IRNamedValueType(MIL::IRNamedValueType *this)
{
  MEMORY[0x24BE61660](this);
}

uint64_t MIL::TextFileLocation::Make()
{
  return MEMORY[0x24BE61668]();
}

void MIL::ValidationResult::~ValidationResult(MIL::ValidationResult *this)
{
  MEMORY[0x24BE616C0](this);
}

uint64_t MIL::IRTensorValueType::MakeScalar()
{
  return MEMORY[0x24BE616D8]();
}

uint64_t MIL::IRTensorValueType::MakeWithShape()
{
  return MEMORY[0x24BE616E0]();
}

uint64_t MIL::IRDataTypeToString()
{
  return MEMORY[0x24BE616F8]();
}

uint64_t MIL::IRProgramValidator::Validate(MIL::IRProgramValidator *this, const IRProgram *a2)
{
  return MEMORY[0x24BE61700](this, a2);
}

uint64_t MIL::IRConstantDimension::Make(MIL::IRConstantDimension *this, MILContext *a2)
{
  return MEMORY[0x24BE61728](this, a2);
}

uint64_t MIL::Text::SerializeToFile()
{
  return MEMORY[0x24BE61780]();
}

uint64_t MIL::Text::SerializerOptions::Make(MIL::Text::SerializerOptions *this)
{
  return MEMORY[0x24BE61788](this);
}

uint64_t MIL::Text::ParseProgramFromFile()
{
  return MEMORY[0x24BE61790]();
}

uint64_t MIL::Proto::SerializeProgram()
{
  return MEMORY[0x24BE617A0]();
}

uint64_t MIL::Opsets::Common::CreateMILContext(MIL::Opsets::Common *this)
{
  return MEMORY[0x24BE617A8](this);
}

uint64_t MIL::IRBlock::Make()
{
  return MEMORY[0x24BE618B0]();
}

uint64_t MIL::IRProgram::Make()
{
  return MEMORY[0x24BE618E8]();
}

uint64_t Espresso::get_internal_context(Espresso *this, void *a2)
{
  return MEMORY[0x24BE2F5F0](this, a2);
}

uint64_t Espresso::get_internal_network()
{
  return MEMORY[0x24BE2F5F8]();
}

uint64_t MIL::IRArgument::GetName(MIL::IRArgument *this)
{
  return MEMORY[0x24BE61920](this);
}

uint64_t MIL::IRArgument::GetValue(MIL::IRArgument *this)
{
  return MEMORY[0x24BE61928](this);
}

uint64_t MIL::MILContext::GetOpset()
{
  return MEMORY[0x24BE61958]();
}

uint64_t MIL::IRDimension::AsConstant(MIL::IRDimension *this)
{
  return MEMORY[0x24BE61960](this);
}

uint64_t MIL::IRListValue::GetValues(MIL::IRListValue *this)
{
  return MEMORY[0x24BE61970](this);
}

uint64_t MIL::IRTensorValue::GetDataView<signed char>()
{
  return MEMORY[0x24BE61A88]();
}

uint64_t MIL::IRTensorValue::GetDataView<BOOL>()
{
  return MEMORY[0x24BE61A90]();
}

uint64_t MIL::IRTensorValue::GetDataView<double>()
{
  return MEMORY[0x24BE61AA0]();
}

uint64_t MIL::IRTensorValue::GetDataView<float>()
{
  return MEMORY[0x24BE61AA8]();
}

uint64_t MIL::IRTensorValue::GetDataView<unsigned char>()
{
  return MEMORY[0x24BE61AB8]();
}

uint64_t MIL::IRTensorValue::GetDataView<int>()
{
  return MEMORY[0x24BE61AC8]();
}

uint64_t MIL::IRTensorValue::GetDataView<unsigned int>()
{
  return MEMORY[0x24BE61AE0]();
}

uint64_t MIL::IRTensorValue::GetDataView<short>()
{
  return MEMORY[0x24BE61AF0]();
}

uint64_t MIL::IRTensorValue::GetDataView<unsigned short>()
{
  return MEMORY[0x24BE61AF8]();
}

uint64_t MIL::IRTensorValue::GetDataView<long long>()
{
  return MEMORY[0x24BE61B08]();
}

uint64_t MIL::IRTensorValue::GetDataView<unsigned long long>()
{
  return MEMORY[0x24BE61B18]();
}

uint64_t MIL::IRNamedValueType::GetName(MIL::IRNamedValueType *this)
{
  return MEMORY[0x24BE61BD8](this);
}

uint64_t MIL::IRNamedValueType::GetType(MIL::IRNamedValueType *this)
{
  return MEMORY[0x24BE61BE8](this);
}

uint64_t MIL::ValidationResult::IsGood(MIL::ValidationResult *this)
{
  return MEMORY[0x24BE61C00](this);
}

uint64_t MIL::IRTensorValueType::MakeBoolValue()
{
  return MEMORY[0x24BE61C28]();
}

uint64_t MIL::IRTensorValueType::MakeInt8Value()
{
  return MEMORY[0x24BE61C30]();
}

uint64_t MIL::IRTensorValueType::MakeInt16Value()
{
  return MEMORY[0x24BE61C38]();
}

uint64_t MIL::IRTensorValueType::MakeInt32Value()
{
  return MEMORY[0x24BE61C40]();
}

uint64_t MIL::IRTensorValueType::MakeInt64Value()
{
  return MEMORY[0x24BE61C48]();
}

uint64_t MIL::IRTensorValueType::MakeUInt8Value()
{
  return MEMORY[0x24BE61C50]();
}

uint64_t MIL::IRTensorValueType::MakeStringValue()
{
  return MEMORY[0x24BE61C58]();
}

uint64_t MIL::IRTensorValueType::MakeUInt16Value()
{
  return MEMORY[0x24BE61C60]();
}

uint64_t MIL::IRTensorValueType::MakeUInt32Value()
{
  return MEMORY[0x24BE61C68]();
}

uint64_t MIL::IRTensorValueType::MakeUInt64Value()
{
  return MEMORY[0x24BE61C70]();
}

uint64_t MIL::IRTensorValueType::MakeUInt64Value(MIL::IRTensorValueType *this)
{
  return MEMORY[0x24BE61C78](this);
}

uint64_t MIL::IRTensorValueType::MakeFloat16Value()
{
  return MEMORY[0x24BE61C80]();
}

uint64_t MIL::IRTensorValueType::MakeFloat32Value()
{
  return MEMORY[0x24BE61C88]();
}

uint64_t MIL::IRTensorValueType::MakeFloat64Value()
{
  return MEMORY[0x24BE61C90]();
}

uint64_t MIL::IRTensorValueType::MakeValueFromFileProperties()
{
  return MEMORY[0x24BE61CA0]();
}

uint64_t MIL::IROpset::TryGetOperatorSharedPtr()
{
  return MEMORY[0x24BE61EC8]();
}

uint64_t MIL::IRValue::GetScalar<std::string>()
{
  return MEMORY[0x24BE61F98]();
}

uint64_t MIL::IRValue::GetScalar<signed char>()
{
  return MEMORY[0x24BE61FA8]();
}

uint64_t MIL::IRValue::GetScalar<BOOL>()
{
  return MEMORY[0x24BE61FB8]();
}

uint64_t MIL::IRValue::GetScalar<double>()
{
  return MEMORY[0x24BE61FC0]();
}

uint64_t MIL::IRValue::GetScalar<float>()
{
  return MEMORY[0x24BE61FD0]();
}

uint64_t MIL::IRValue::GetScalar<unsigned char>()
{
  return MEMORY[0x24BE61FD8]();
}

uint64_t MIL::IRValue::GetScalar<int>()
{
  return MEMORY[0x24BE61FE8]();
}

uint64_t MIL::IRValue::GetScalar<unsigned int>()
{
  return MEMORY[0x24BE61FF8]();
}

uint64_t MIL::IRValue::GetScalar<short>()
{
  return MEMORY[0x24BE62000]();
}

uint64_t MIL::IRValue::GetScalar<unsigned short>()
{
  return MEMORY[0x24BE62008]();
}

uint64_t MIL::IRValue::GetScalar<long long>()
{
  return MEMORY[0x24BE62010]();
}

uint64_t MIL::IRValue::GetScalar<unsigned long long>()
{
  return MEMORY[0x24BE62020]();
}

uint64_t MIL::IRObject::GetAttributes(MIL::IRObject *this)
{
  return MEMORY[0x24BE62050](this);
}

uint64_t MIL::MILResult::GetMessage(MIL::MILResult *this)
{
  return MEMORY[0x24BE62090](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_25137A0E8(__p);
}

uint64_t operator delete()
{
  return off_25137A0F0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25137A0F8(__sz);
}

uint64_t operator new()
{
  return off_25137A100();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_context_set_int_option()
{
  return MEMORY[0x24BE2FB08]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x24BE2FB40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x24BE2FC40]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x24BE2FCB8]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x24BDAF3E8]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2FB0]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x24BDB2FC0]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x24BEE4CF0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetadataKind()
{
  return MEMORY[0x24BEE4D90]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x24BEE4EC0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
}

uint64_t swift_reflectionMirror_recursiveChildMetadata()
{
  return MEMORY[0x24BEE4EE0]();
}

uint64_t swift_reflectionMirror_recursiveChildOffset()
{
  return MEMORY[0x24BEE4EE8]();
}

uint64_t swift_reflectionMirror_recursiveCount()
{
  return MEMORY[0x24BEE4EF0]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x24BEE5018]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x24BEE5020]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x24BEE5040]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x24BEE5048]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

void vDSP_vdpsp(const double *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3360](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3398](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt16D(const __int16 *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33A0](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33A8](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt32D(const int *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33B0](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt8(const char *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33B8](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt8D(const char *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33C0](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu16(const unsigned __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33C8](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu16D(const unsigned __int16 *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33D0](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu32(const unsigned int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33D8](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu32D(const unsigned int *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33E0](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33E8](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu8D(const unsigned __int8 *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33F0](__A, __IA, __C, __IC, __N);
}

void vDSP_vspdp(const float *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3520](__A, __IA, __C, __IC, __N);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

