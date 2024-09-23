unint64_t destroy for NLRouterServiceResponse.NLRoutingDecisionSource(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

void _s13CDMFoundation23NLRouterServiceResponseV23NLRoutingDecisionSourceOwCP_0(_OWORD *a1, uint64_t *a2)
{
  unint64_t v3;

  v3 = a2[1];
  if (v3 < 0xFFFFFFFF)
    *a1 = *(_OWORD *)a2;
  else
    OUTLINED_FUNCTION_435(v3, *a2);
  OUTLINED_FUNCTION_60_0();
}

void assignWithCopy for NLRouterServiceResponse.NLRoutingDecisionSource()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_57_1();
  v4 = *(_QWORD *)(v3 + 8);
  if (*(_QWORD *)(v2 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *v0 = *v1;
      OUTLINED_FUNCTION_248_2(v1[1]);
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v0 = *(_OWORD *)v1;
    goto LABEL_8;
  }
  if (v4 < 0xFFFFFFFF)
  {
    OUTLINED_FUNCTION_13_0();
    goto LABEL_7;
  }
  *v0 = *v1;
  OUTLINED_FUNCTION_248_2(v1[1]);
  OUTLINED_FUNCTION_13_0();
LABEL_8:
  OUTLINED_FUNCTION_56();
}

void assignWithTake for NLRouterServiceResponse.NLRoutingDecisionSource(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  OUTLINED_FUNCTION_60_0();
}

uint64_t getEnumTagSinglePayload for NLRouterServiceResponse.NLRoutingDecisionSource(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return OUTLINED_FUNCTION_65_2();
  if (a2 >= 0x7FFFFFFC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 3;
  if (v4 >= 5)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NLRouterServiceResponse.NLRoutingDecisionSource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      return OUTLINED_FUNCTION_422(result, a2 + 3);
  }
  return result;
}

uint64_t sub_21A3A0B8C(uint64_t a1)
{
  return OUTLINED_FUNCTION_131(*(_QWORD *)(a1 + 8));
}

_QWORD *sub_21A3A0B94(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    return (_QWORD *)OUTLINED_FUNCTION_422((uint64_t)result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterCurrentUserQueryDecoration()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3A0BC8(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_140(-1);
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 11);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 11);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 11);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_140(v8);
}

uint64_t sub_21A3A0C4C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_21A3A0C98 + 4 * byte_21A463C90[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2 + 4 * byte_21A463C8B[v4]))();
}

uint64_t sub_21A3A0CD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A0CD8);
  return result;
}

_BYTE *sub_21A3A0CE0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A0CE8);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 10);
}

void type metadata accessor for ModelSpecialToken()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterCurrentUserQueryDecoration.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3A0D24(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_140(-1);
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 5);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 5);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 5);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_140(v8);
}

uint64_t sub_21A3A0DA8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A0DF4 + 4 * byte_21A463C9A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_0 + 4 * byte_21A463C95[v4]))();
}

uint64_t sub_21A3A0E2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A0E34);
  return result;
}

_BYTE *sub_21A3A0E3C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A0E44);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 4);
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.NoneCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.OverrideCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.ModelCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.HeuristicRuleCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponse.NLRoutingDecisionSource.HeuristicCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.SucceededCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.ClientNotInitializedCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.InputInvalidCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.NoClientResponseCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.OverridesMatchedCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.AssetMissingCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterServiceResponseStatus.AssetLoadingFailedCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterModelOutput.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterPrompt.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3A0F14(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_140(-1);
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 8);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 8);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 8);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_140(v8);
}

uint64_t sub_21A3A0F98(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A0FE4 + 4 * byte_21A463CA4[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_1 + 4 * byte_21A463C9F[v4]))();
}

uint64_t sub_21A3A101C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A1024);
  return result;
}

_BYTE *sub_21A3A102C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A1034);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 7);
}

void type metadata accessor for NLRouterServiceRequest.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterTurnProbingResult.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterNLParseResponse.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterActionCandidate.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterSiriXParse.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterSiriXParse.UsoCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterSiriXParse.PommesCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterSiriXParse.EmptyCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3A10A4(unsigned __int8 *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return OUTLINED_FUNCTION_65_2();
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *(unsigned int *)a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return OUTLINED_FUNCTION_570(a1);
}

uint64_t sub_21A3A10EC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21A3A112C + 4 * byte_21A463CA9[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21A3A114C + 4 * byte_21A463CAE[v4]))();
}

_BYTE *sub_21A3A112C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21A3A114C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21A3A1154(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21A3A115C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21A3A1164(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21A3A116C(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for NLRouterPommesResponse.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for NLRouterSiriXUSOParse.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t _s13CDMFoundation29NLRouterServiceResponseStatusOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_140(-1);
  if (a2 < 0xFA)
    goto LABEL_17;
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
    if (v4)
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 7);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 7);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_140((*a1 | (v4 << 8)) - 7);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_140(v8);
}

uint64_t _s13CDMFoundation29NLRouterServiceResponseStatusOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A1268 + 4 * byte_21A463CB8[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_2 + 4 * byte_21A463CB3[v4]))();
}

uint64_t sub_21A3A12A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A12A8);
  return result;
}

_BYTE *sub_21A3A12B0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A12B8);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 6);
}

void type metadata accessor for NLRouterTurnContext.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for RequestSummary.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t _s13CDMFoundation14RequestSummaryV13UserInputTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A132C + 4 * byte_21A463CC2[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_3 + 4 * byte_21A463CBD[v4]))();
}

uint64_t sub_21A3A1364(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A136CLL);
  return result;
}

_BYTE *sub_21A3A1374(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A137CLL);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 2);
}

void type metadata accessor for RequestSummary.UserInputType.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for RequestSummary.UserInputType.QueryCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for RequestSummary.UserInputType.TapCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for RequestSummary.UserInputType.NoneCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3A13BC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A1408 + 4 * byte_21A463CCC[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_4 + 4 * byte_21A463CC7[v4]))();
}

uint64_t sub_21A3A1440(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A1448);
  return result;
}

_BYTE *sub_21A3A1450(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A1458);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 3);
}

void type metadata accessor for TurnSummary.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t _s13CDMFoundation11TurnSummaryV15ExecutionSourceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3A14C0 + 4 * byte_21A463CD6[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_264_2_5 + 4 * byte_21A463CD1[v4]))();
}

uint64_t sub_21A3A14F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3A1500);
  return result;
}

_BYTE *sub_21A3A1508(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3A1510);
  return OUTLINED_FUNCTION_56_2((_BYTE *)a1, a2 + 1);
}

void type metadata accessor for TurnSummary.ExecutionSource.CodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for TurnSummary.ExecutionSource.SiriXCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

void type metadata accessor for TurnSummary.ExecutionSource.PlannerCodingKeys()
{
  OUTLINED_FUNCTION_15_1();
}

unint64_t sub_21A3A1548()
{
  unint64_t result;

  result = qword_2550DF960[0];
  if (!qword_2550DF960[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464E84, &unk_24DCAA9C0);
    atomic_store(result, qword_2550DF960);
  }
  return result;
}

unint64_t sub_21A3A1588()
{
  unint64_t result;

  result = qword_2550DFB70[0];
  if (!qword_2550DFB70[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464F3C, &unk_24DCAA930);
    atomic_store(result, qword_2550DFB70);
  }
  return result;
}

unint64_t sub_21A3A15C8()
{
  unint64_t result;

  result = qword_2550E0080[0];
  if (!qword_2550E0080[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4650E4, &unk_24DCAA840);
    atomic_store(result, qword_2550E0080);
  }
  return result;
}

unint64_t sub_21A3A1608()
{
  unint64_t result;

  result = qword_2550E0290[0];
  if (!qword_2550E0290[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46519C, &unk_24DCAA7B0);
    atomic_store(result, qword_2550E0290);
  }
  return result;
}

unint64_t sub_21A3A1648()
{
  unint64_t result;

  result = qword_2550E0520[0];
  if (!qword_2550E0520[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46528C, &unk_24DCAA720);
    atomic_store(result, qword_2550E0520);
  }
  return result;
}

unint64_t sub_21A3A1688()
{
  unint64_t result;

  result = qword_2550E07B0[0];
  if (!qword_2550E07B0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46537C, &unk_24DCAA690);
    atomic_store(result, qword_2550E07B0);
  }
  return result;
}

unint64_t sub_21A3A16C8()
{
  unint64_t result;

  result = qword_2550E09C0[0];
  if (!qword_2550E09C0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465434, &unk_24DCAA600);
    atomic_store(result, qword_2550E09C0);
  }
  return result;
}

unint64_t sub_21A3A1708()
{
  unint64_t result;

  result = qword_2550E0CD0[0];
  if (!qword_2550E0CD0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46553C, &unk_24DCAA550);
    atomic_store(result, qword_2550E0CD0);
  }
  return result;
}

unint64_t sub_21A3A1748()
{
  unint64_t result;

  result = qword_2550E0EE0[0];
  if (!qword_2550E0EE0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4655F4, &unk_24DCAA4C0);
    atomic_store(result, qword_2550E0EE0);
  }
  return result;
}

unint64_t sub_21A3A1788()
{
  unint64_t result;

  result = qword_2550E10F0[0];
  if (!qword_2550E10F0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4656AC, &unk_24DCAA430);
    atomic_store(result, qword_2550E10F0);
  }
  return result;
}

unint64_t sub_21A3A17C8()
{
  unint64_t result;

  result = qword_2550E1300[0];
  if (!qword_2550E1300[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465764, &unk_24DCAA3A0);
    atomic_store(result, qword_2550E1300);
  }
  return result;
}

unint64_t sub_21A3A1808()
{
  unint64_t result;

  result = qword_2550E1590[0];
  if (!qword_2550E1590[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465854, &unk_24DCAA310);
    atomic_store(result, qword_2550E1590);
  }
  return result;
}

unint64_t sub_21A3A1848()
{
  unint64_t result;

  result = qword_2550E17A0[0];
  if (!qword_2550E17A0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46590C, &unk_24DCAA280);
    atomic_store(result, qword_2550E17A0);
  }
  return result;
}

unint64_t sub_21A3A1888()
{
  unint64_t result;

  result = qword_2550E19B0[0];
  if (!qword_2550E19B0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4659C4, &unk_24DCAA1F0);
    atomic_store(result, qword_2550E19B0);
  }
  return result;
}

unint64_t sub_21A3A18C8()
{
  unint64_t result;

  result = qword_2550E1BC0[0];
  if (!qword_2550E1BC0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465A7C, &unk_24DCAA160);
    atomic_store(result, qword_2550E1BC0);
  }
  return result;
}

unint64_t sub_21A3A1908()
{
  unint64_t result;

  result = qword_2550E1DD0[0];
  if (!qword_2550E1DD0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465B34, &unk_24DCAA0D0);
    atomic_store(result, qword_2550E1DD0);
  }
  return result;
}

unint64_t sub_21A3A1948()
{
  unint64_t result;

  result = qword_2550E26E0[0];
  if (!qword_2550E26E0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465E1C, &unk_24DCA9F60);
    atomic_store(result, qword_2550E26E0);
  }
  return result;
}

unint64_t sub_21A3A1988()
{
  unint64_t result;

  result = qword_2550E28F0[0];
  if (!qword_2550E28F0[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465ED4, &unk_24DCA9ED0);
    atomic_store(result, qword_2550E28F0);
  }
  return result;
}

unint64_t sub_21A3A19C8()
{
  unint64_t result;

  result = qword_2550E2F00[0];
  if (!qword_2550E2F00[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4660CC, &unk_24DCA9DC0);
    atomic_store(result, qword_2550E2F00);
  }
  return result;
}

unint64_t sub_21A3A1A08()
{
  unint64_t result;

  result = qword_2550E3110[0];
  if (!qword_2550E3110[0])
  {
    result = MEMORY[0x220744A58](&unk_21A466184, &unk_24DCA9D30);
    atomic_store(result, qword_2550E3110);
  }
  return result;
}

unint64_t sub_21A3A1A48()
{
  unint64_t result;

  result = qword_2550E3320[0];
  if (!qword_2550E3320[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46623C, &unk_24DCA9CA0);
    atomic_store(result, qword_2550E3320);
  }
  return result;
}

unint64_t sub_21A3A1A88()
{
  unint64_t result;

  result = qword_2550E3430;
  if (!qword_2550E3430)
  {
    result = MEMORY[0x220744A58](&unk_21A4661AC, &unk_24DCA9CA0);
    atomic_store(result, (unint64_t *)&qword_2550E3430);
  }
  return result;
}

unint64_t sub_21A3A1AC8()
{
  unint64_t result;

  result = qword_2550E3438[0];
  if (!qword_2550E3438[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4661D4, &unk_24DCA9CA0);
    atomic_store(result, qword_2550E3438);
  }
  return result;
}

unint64_t sub_21A3A1B08()
{
  unint64_t result;

  result = qword_2550E34C0;
  if (!qword_2550E34C0)
  {
    result = MEMORY[0x220744A58](&unk_21A4660F4, &unk_24DCA9D30);
    atomic_store(result, (unint64_t *)&qword_2550E34C0);
  }
  return result;
}

unint64_t sub_21A3A1B48()
{
  unint64_t result;

  result = qword_2550E34C8[0];
  if (!qword_2550E34C8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46611C, &unk_24DCA9D30);
    atomic_store(result, qword_2550E34C8);
  }
  return result;
}

unint64_t sub_21A3A1B88()
{
  unint64_t result;

  result = qword_2550E3550;
  if (!qword_2550E3550)
  {
    result = MEMORY[0x220744A58](&unk_21A465FEC, &unk_24DCA9DE0);
    atomic_store(result, (unint64_t *)&qword_2550E3550);
  }
  return result;
}

unint64_t sub_21A3A1BC8()
{
  unint64_t result;

  result = qword_2550E3558[0];
  if (!qword_2550E3558[0])
  {
    result = MEMORY[0x220744A58](&unk_21A466014, &unk_24DCA9DE0);
    atomic_store(result, qword_2550E3558);
  }
  return result;
}

unint64_t sub_21A3A1C08()
{
  unint64_t result;

  result = qword_2550E35E0;
  if (!qword_2550E35E0)
  {
    result = MEMORY[0x220744A58](&unk_21A465F9C, &unk_24DCA9E00);
    atomic_store(result, (unint64_t *)&qword_2550E35E0);
  }
  return result;
}

unint64_t sub_21A3A1C48()
{
  unint64_t result;

  result = qword_2550E35E8[0];
  if (!qword_2550E35E8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465FC4, &unk_24DCA9E00);
    atomic_store(result, qword_2550E35E8);
  }
  return result;
}

unint64_t sub_21A3A1C88()
{
  unint64_t result;

  result = qword_2550E3670;
  if (!qword_2550E3670)
  {
    result = MEMORY[0x220744A58](&unk_21A465F4C, &unk_24DCA9E20);
    atomic_store(result, (unint64_t *)&qword_2550E3670);
  }
  return result;
}

unint64_t sub_21A3A1CC8()
{
  unint64_t result;

  result = qword_2550E3678;
  if (!qword_2550E3678)
  {
    result = MEMORY[0x220744A58](&unk_21A465F74, &unk_24DCA9E20);
    atomic_store(result, (unint64_t *)&qword_2550E3678);
  }
  return result;
}

unint64_t sub_21A3A1D08()
{
  unint64_t result;

  result = qword_2550E3700;
  if (!qword_2550E3700)
  {
    result = MEMORY[0x220744A58](&unk_21A465EFC, &unk_24DCA9E40);
    atomic_store(result, (unint64_t *)&qword_2550E3700);
  }
  return result;
}

unint64_t sub_21A3A1D48()
{
  unint64_t result;

  result = qword_2550E3708[0];
  if (!qword_2550E3708[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465F24, &unk_24DCA9E40);
    atomic_store(result, qword_2550E3708);
  }
  return result;
}

unint64_t sub_21A3A1D88()
{
  unint64_t result;

  result = qword_2550E3790;
  if (!qword_2550E3790)
  {
    result = MEMORY[0x220744A58](&unk_21A465E44, &unk_24DCA9ED0);
    atomic_store(result, (unint64_t *)&qword_2550E3790);
  }
  return result;
}

unint64_t sub_21A3A1DC8()
{
  unint64_t result;

  result = qword_2550E3798[0];
  if (!qword_2550E3798[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465E6C, &unk_24DCA9ED0);
    atomic_store(result, qword_2550E3798);
  }
  return result;
}

unint64_t sub_21A3A1E08()
{
  unint64_t result;

  result = qword_2550E3820;
  if (!qword_2550E3820)
  {
    result = MEMORY[0x220744A58](&unk_21A46603C, &unk_24DCA9DC0);
    atomic_store(result, (unint64_t *)&qword_2550E3820);
  }
  return result;
}

unint64_t sub_21A3A1E48()
{
  unint64_t result;

  result = qword_2550E3828[0];
  if (!qword_2550E3828[0])
  {
    result = MEMORY[0x220744A58](&unk_21A466064, &unk_24DCA9DC0);
    atomic_store(result, qword_2550E3828);
  }
  return result;
}

unint64_t sub_21A3A1E88()
{
  unint64_t result;

  result = qword_2550E38B0;
  if (!qword_2550E38B0)
  {
    result = MEMORY[0x220744A58](&unk_21A465D3C, &unk_24DCA9F80);
    atomic_store(result, (unint64_t *)&qword_2550E38B0);
  }
  return result;
}

unint64_t sub_21A3A1EC8()
{
  unint64_t result;

  result = qword_2550E38B8[0];
  if (!qword_2550E38B8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465D64, &unk_24DCA9F80);
    atomic_store(result, qword_2550E38B8);
  }
  return result;
}

unint64_t sub_21A3A1F08()
{
  unint64_t result;

  result = qword_2550E3940;
  if (!qword_2550E3940)
  {
    result = MEMORY[0x220744A58](&unk_21A465CEC, &unk_24DCA9FA0);
    atomic_store(result, (unint64_t *)&qword_2550E3940);
  }
  return result;
}

unint64_t sub_21A3A1F48()
{
  unint64_t result;

  result = qword_2550E3948[0];
  if (!qword_2550E3948[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465D14, &unk_24DCA9FA0);
    atomic_store(result, qword_2550E3948);
  }
  return result;
}

unint64_t sub_21A3A1F88()
{
  unint64_t result;

  result = qword_2550E39D0;
  if (!qword_2550E39D0)
  {
    result = MEMORY[0x220744A58](&unk_21A465C9C, &unk_24DCA9FC0);
    atomic_store(result, (unint64_t *)&qword_2550E39D0);
  }
  return result;
}

unint64_t sub_21A3A1FC8()
{
  unint64_t result;

  result = qword_2550E39D8[0];
  if (!qword_2550E39D8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465CC4, &unk_24DCA9FC0);
    atomic_store(result, qword_2550E39D8);
  }
  return result;
}

unint64_t sub_21A3A2008()
{
  unint64_t result;

  result = qword_2550E3A60;
  if (!qword_2550E3A60)
  {
    result = MEMORY[0x220744A58](&unk_21A465C4C, &unk_24DCA9FE0);
    atomic_store(result, (unint64_t *)&qword_2550E3A60);
  }
  return result;
}

unint64_t sub_21A3A2048()
{
  unint64_t result;

  result = qword_2550E3A68[0];
  if (!qword_2550E3A68[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465C74, &unk_24DCA9FE0);
    atomic_store(result, qword_2550E3A68);
  }
  return result;
}

unint64_t sub_21A3A2088()
{
  unint64_t result;

  result = qword_2550E3AF0;
  if (!qword_2550E3AF0)
  {
    result = MEMORY[0x220744A58](&unk_21A465BFC, &unk_24DCAA000);
    atomic_store(result, (unint64_t *)&qword_2550E3AF0);
  }
  return result;
}

unint64_t sub_21A3A20C8()
{
  unint64_t result;

  result = qword_2550E3AF8[0];
  if (!qword_2550E3AF8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465C24, &unk_24DCAA000);
    atomic_store(result, qword_2550E3AF8);
  }
  return result;
}

unint64_t sub_21A3A2108()
{
  unint64_t result;

  result = qword_2550E3B80;
  if (!qword_2550E3B80)
  {
    result = MEMORY[0x220744A58](&unk_21A465BAC, &unk_24DCAA020);
    atomic_store(result, (unint64_t *)&qword_2550E3B80);
  }
  return result;
}

unint64_t sub_21A3A2148()
{
  unint64_t result;

  result = qword_2550E3B88[0];
  if (!qword_2550E3B88[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465BD4, &unk_24DCAA020);
    atomic_store(result, qword_2550E3B88);
  }
  return result;
}

unint64_t sub_21A3A2188()
{
  unint64_t result;

  result = qword_2550E3C10;
  if (!qword_2550E3C10)
  {
    result = MEMORY[0x220744A58](&unk_21A465B5C, &unk_24DCAA040);
    atomic_store(result, (unint64_t *)&qword_2550E3C10);
  }
  return result;
}

unint64_t sub_21A3A21C8()
{
  unint64_t result;

  result = qword_2550E3C18[0];
  if (!qword_2550E3C18[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465B84, &unk_24DCAA040);
    atomic_store(result, qword_2550E3C18);
  }
  return result;
}

unint64_t sub_21A3A2208()
{
  unint64_t result;

  result = qword_2550E3CA0;
  if (!qword_2550E3CA0)
  {
    result = MEMORY[0x220744A58](&unk_21A465D8C, &unk_24DCA9F60);
    atomic_store(result, (unint64_t *)&qword_2550E3CA0);
  }
  return result;
}

unint64_t sub_21A3A2248()
{
  unint64_t result;

  result = qword_2550E3CA8[0];
  if (!qword_2550E3CA8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465DB4, &unk_24DCA9F60);
    atomic_store(result, qword_2550E3CA8);
  }
  return result;
}

unint64_t sub_21A3A2288()
{
  unint64_t result;

  result = qword_2550E3D30;
  if (!qword_2550E3D30)
  {
    result = MEMORY[0x220744A58](&unk_21A465AA4, &unk_24DCAA0D0);
    atomic_store(result, (unint64_t *)&qword_2550E3D30);
  }
  return result;
}

unint64_t sub_21A3A22C8()
{
  unint64_t result;

  result = qword_2550E3D38[0];
  if (!qword_2550E3D38[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465ACC, &unk_24DCAA0D0);
    atomic_store(result, qword_2550E3D38);
  }
  return result;
}

unint64_t sub_21A3A2308()
{
  unint64_t result;

  result = qword_2550E3DC0;
  if (!qword_2550E3DC0)
  {
    result = MEMORY[0x220744A58](&unk_21A4659EC, &unk_24DCAA160);
    atomic_store(result, (unint64_t *)&qword_2550E3DC0);
  }
  return result;
}

unint64_t sub_21A3A2348()
{
  unint64_t result;

  result = qword_2550E3DC8[0];
  if (!qword_2550E3DC8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465A14, &unk_24DCAA160);
    atomic_store(result, qword_2550E3DC8);
  }
  return result;
}

unint64_t sub_21A3A2388()
{
  unint64_t result;

  result = qword_2550E3E50;
  if (!qword_2550E3E50)
  {
    result = MEMORY[0x220744A58](&unk_21A465934, &unk_24DCAA1F0);
    atomic_store(result, (unint64_t *)&qword_2550E3E50);
  }
  return result;
}

unint64_t sub_21A3A23C8()
{
  unint64_t result;

  result = qword_2550E3E58[0];
  if (!qword_2550E3E58[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46595C, &unk_24DCAA1F0);
    atomic_store(result, qword_2550E3E58);
  }
  return result;
}

unint64_t sub_21A3A2408()
{
  unint64_t result;

  result = qword_2550E3EE0;
  if (!qword_2550E3EE0)
  {
    result = MEMORY[0x220744A58](&unk_21A46587C, &unk_24DCAA280);
    atomic_store(result, (unint64_t *)&qword_2550E3EE0);
  }
  return result;
}

unint64_t sub_21A3A2448()
{
  unint64_t result;

  result = qword_2550E3EE8[0];
  if (!qword_2550E3EE8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4658A4, &unk_24DCAA280);
    atomic_store(result, qword_2550E3EE8);
  }
  return result;
}

unint64_t sub_21A3A2488()
{
  unint64_t result;

  result = qword_2550E3F70;
  if (!qword_2550E3F70)
  {
    result = MEMORY[0x220744A58](&unk_21A46578C, &unk_24DCAA310);
    atomic_store(result, (unint64_t *)&qword_2550E3F70);
  }
  return result;
}

unint64_t sub_21A3A24C8()
{
  unint64_t result;

  result = qword_2550E3F78;
  if (!qword_2550E3F78)
  {
    result = MEMORY[0x220744A58](&unk_21A4657B4, &unk_24DCAA310);
    atomic_store(result, (unint64_t *)&qword_2550E3F78);
  }
  return result;
}

unint64_t sub_21A3A2508()
{
  unint64_t result;

  result = qword_2550E4000;
  if (!qword_2550E4000)
  {
    result = MEMORY[0x220744A58](&unk_21A4656D4, &unk_24DCAA3A0);
    atomic_store(result, (unint64_t *)&qword_2550E4000);
  }
  return result;
}

unint64_t sub_21A3A2548()
{
  unint64_t result;

  result = qword_2550E4008[0];
  if (!qword_2550E4008[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4656FC, &unk_24DCAA3A0);
    atomic_store(result, qword_2550E4008);
  }
  return result;
}

unint64_t sub_21A3A2588()
{
  unint64_t result;

  result = qword_2550E4090;
  if (!qword_2550E4090)
  {
    result = MEMORY[0x220744A58](&unk_21A465564, &unk_24DCAA4C0);
    atomic_store(result, (unint64_t *)&qword_2550E4090);
  }
  return result;
}

unint64_t sub_21A3A25C8()
{
  unint64_t result;

  result = qword_2550E4098[0];
  if (!qword_2550E4098[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46558C, &unk_24DCAA4C0);
    atomic_store(result, qword_2550E4098);
  }
  return result;
}

unint64_t sub_21A3A2608()
{
  unint64_t result;

  result = qword_2550E4120;
  if (!qword_2550E4120)
  {
    result = MEMORY[0x220744A58](&unk_21A4654AC, &unk_24DCAA550);
    atomic_store(result, (unint64_t *)&qword_2550E4120);
  }
  return result;
}

unint64_t sub_21A3A2648()
{
  unint64_t result;

  result = qword_2550E4128[0];
  if (!qword_2550E4128[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4654D4, &unk_24DCAA550);
    atomic_store(result, qword_2550E4128);
  }
  return result;
}

unint64_t sub_21A3A2688()
{
  unint64_t result;

  result = qword_2550E41B0;
  if (!qword_2550E41B0)
  {
    result = MEMORY[0x220744A58](&unk_21A46545C, &unk_24DCAA570);
    atomic_store(result, (unint64_t *)&qword_2550E41B0);
  }
  return result;
}

unint64_t sub_21A3A26C8()
{
  unint64_t result;

  result = qword_2550E41B8[0];
  if (!qword_2550E41B8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465484, &unk_24DCAA570);
    atomic_store(result, qword_2550E41B8);
  }
  return result;
}

unint64_t sub_21A3A2708()
{
  unint64_t result;

  result = qword_2550E4240;
  if (!qword_2550E4240)
  {
    result = MEMORY[0x220744A58](&unk_21A46561C, &unk_24DCAA430);
    atomic_store(result, (unint64_t *)&qword_2550E4240);
  }
  return result;
}

unint64_t sub_21A3A2748()
{
  unint64_t result;

  result = qword_2550E4248[0];
  if (!qword_2550E4248[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465644, &unk_24DCAA430);
    atomic_store(result, qword_2550E4248);
  }
  return result;
}

unint64_t sub_21A3A2788()
{
  unint64_t result;

  result = qword_2550E42D0;
  if (!qword_2550E42D0)
  {
    result = MEMORY[0x220744A58](&unk_21A4653A4, &unk_24DCAA600);
    atomic_store(result, (unint64_t *)&qword_2550E42D0);
  }
  return result;
}

unint64_t sub_21A3A27C8()
{
  unint64_t result;

  result = qword_2550E42D8[0];
  if (!qword_2550E42D8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4653CC, &unk_24DCAA600);
    atomic_store(result, qword_2550E42D8);
  }
  return result;
}

unint64_t sub_21A3A2808()
{
  unint64_t result;

  result = qword_2550E4360;
  if (!qword_2550E4360)
  {
    result = MEMORY[0x220744A58](&unk_21A4652B4, &unk_24DCAA690);
    atomic_store(result, (unint64_t *)&qword_2550E4360);
  }
  return result;
}

unint64_t sub_21A3A2848()
{
  unint64_t result;

  result = qword_2550E4368[0];
  if (!qword_2550E4368[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4652DC, &unk_24DCAA690);
    atomic_store(result, qword_2550E4368);
  }
  return result;
}

unint64_t sub_21A3A2888()
{
  unint64_t result;

  result = qword_2550E43F0;
  if (!qword_2550E43F0)
  {
    result = MEMORY[0x220744A58](&unk_21A4651C4, &unk_24DCAA720);
    atomic_store(result, (unint64_t *)&qword_2550E43F0);
  }
  return result;
}

unint64_t sub_21A3A28C8()
{
  unint64_t result;

  result = qword_2550E43F8[0];
  if (!qword_2550E43F8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A4651EC, &unk_24DCAA720);
    atomic_store(result, qword_2550E43F8);
  }
  return result;
}

unint64_t sub_21A3A2908()
{
  unint64_t result;

  result = qword_2550E4480;
  if (!qword_2550E4480)
  {
    result = MEMORY[0x220744A58](&unk_21A46510C, &unk_24DCAA7B0);
    atomic_store(result, (unint64_t *)&qword_2550E4480);
  }
  return result;
}

unint64_t sub_21A3A2948()
{
  unint64_t result;

  result = qword_2550E4488[0];
  if (!qword_2550E4488[0])
  {
    result = MEMORY[0x220744A58](&unk_21A465134, &unk_24DCAA7B0);
    atomic_store(result, qword_2550E4488);
  }
  return result;
}

unint64_t sub_21A3A2988()
{
  unint64_t result;

  result = qword_2550E4510;
  if (!qword_2550E4510)
  {
    result = MEMORY[0x220744A58](&unk_21A465004, &unk_24DCAA860);
    atomic_store(result, (unint64_t *)&qword_2550E4510);
  }
  return result;
}

unint64_t sub_21A3A29C8()
{
  unint64_t result;

  result = qword_2550E4518[0];
  if (!qword_2550E4518[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46502C, &unk_24DCAA860);
    atomic_store(result, qword_2550E4518);
  }
  return result;
}

unint64_t sub_21A3A2A08()
{
  unint64_t result;

  result = qword_2550E45A0;
  if (!qword_2550E45A0)
  {
    result = MEMORY[0x220744A58](&unk_21A464FB4, &unk_24DCAA880);
    atomic_store(result, (unint64_t *)&qword_2550E45A0);
  }
  return result;
}

unint64_t sub_21A3A2A48()
{
  unint64_t result;

  result = qword_2550E45A8[0];
  if (!qword_2550E45A8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464FDC, &unk_24DCAA880);
    atomic_store(result, qword_2550E45A8);
  }
  return result;
}

unint64_t sub_21A3A2A88()
{
  unint64_t result;

  result = qword_2550E4630;
  if (!qword_2550E4630)
  {
    result = MEMORY[0x220744A58](&unk_21A464F64, &unk_24DCAA8A0);
    atomic_store(result, (unint64_t *)&qword_2550E4630);
  }
  return result;
}

unint64_t sub_21A3A2AC8()
{
  unint64_t result;

  result = qword_2550E4638[0];
  if (!qword_2550E4638[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464F8C, &unk_24DCAA8A0);
    atomic_store(result, qword_2550E4638);
  }
  return result;
}

unint64_t sub_21A3A2B08()
{
  unint64_t result;

  result = qword_2550E46C0;
  if (!qword_2550E46C0)
  {
    result = MEMORY[0x220744A58](&unk_21A465054, &unk_24DCAA840);
    atomic_store(result, (unint64_t *)&qword_2550E46C0);
  }
  return result;
}

unint64_t sub_21A3A2B48()
{
  unint64_t result;

  result = qword_2550E46C8[0];
  if (!qword_2550E46C8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A46507C, &unk_24DCAA840);
    atomic_store(result, qword_2550E46C8);
  }
  return result;
}

unint64_t sub_21A3A2B88()
{
  unint64_t result;

  result = qword_2550E4750;
  if (!qword_2550E4750)
  {
    result = MEMORY[0x220744A58](&unk_21A464EAC, &unk_24DCAA930);
    atomic_store(result, (unint64_t *)&qword_2550E4750);
  }
  return result;
}

unint64_t sub_21A3A2BC8()
{
  unint64_t result;

  result = qword_2550E4758[0];
  if (!qword_2550E4758[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464ED4, &unk_24DCAA930);
    atomic_store(result, qword_2550E4758);
  }
  return result;
}

unint64_t sub_21A3A2C08()
{
  unint64_t result;

  result = qword_2550E47E0;
  if (!qword_2550E47E0)
  {
    result = MEMORY[0x220744A58](&unk_21A464DA4, &unk_24DCAA9E0);
    atomic_store(result, (unint64_t *)&qword_2550E47E0);
  }
  return result;
}

unint64_t sub_21A3A2C48()
{
  unint64_t result;

  result = qword_2550E47E8[0];
  if (!qword_2550E47E8[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464DCC, &unk_24DCAA9E0);
    atomic_store(result, qword_2550E47E8);
  }
  return result;
}

unint64_t sub_21A3A2C88()
{
  unint64_t result;

  result = qword_2550E4870;
  if (!qword_2550E4870)
  {
    result = MEMORY[0x220744A58](&unk_21A464D54, &unk_24DCAAA00);
    atomic_store(result, (unint64_t *)&qword_2550E4870);
  }
  return result;
}

unint64_t sub_21A3A2CC8()
{
  unint64_t result;

  result = qword_2550E4878;
  if (!qword_2550E4878)
  {
    result = MEMORY[0x220744A58](&unk_21A464D7C, &unk_24DCAAA00);
    atomic_store(result, (unint64_t *)&qword_2550E4878);
  }
  return result;
}

unint64_t sub_21A3A2D08()
{
  unint64_t result;

  result = qword_2550E4900;
  if (!qword_2550E4900)
  {
    result = MEMORY[0x220744A58](&unk_21A464DF4, &unk_24DCAA9C0);
    atomic_store(result, (unint64_t *)&qword_2550E4900);
  }
  return result;
}

unint64_t sub_21A3A2D48()
{
  unint64_t result;

  result = qword_2550E4908[0];
  if (!qword_2550E4908[0])
  {
    result = MEMORY[0x220744A58](&unk_21A464E1C, &unk_24DCAA9C0);
    atomic_store(result, qword_2550E4908);
  }
  return result;
}

unint64_t sub_21A3A2D84()
{
  unint64_t result;

  result = qword_2550D79A8;
  if (!qword_2550D79A8)
  {
    result = MEMORY[0x220744A58](&unk_21A463D84, &unk_24DCA95E0);
    atomic_store(result, (unint64_t *)&qword_2550D79A8);
  }
  return result;
}

uint64_t sub_21A3A2DC0()
{
  return sub_21A38F58C();
}

void __swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
    *a1 = swift_allocBox();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A2E20()
{
  OUTLINED_FUNCTION_40_1();
  sub_21A44F318();
  OUTLINED_FUNCTION_40_1();
  sub_21A44F30C();
  OUTLINED_FUNCTION_56();
}

void sub_21A3A2E64()
{
  OUTLINED_FUNCTION_18_0();
  sub_21A44F354();
  OUTLINED_FUNCTION_56();
}

unint64_t sub_21A3A2E98()
{
  unint64_t result;

  result = qword_2550D7A28;
  if (!qword_2550D7A28)
  {
    result = MEMORY[0x220744A58](&protocol conformance descriptor for NLRouterPrompt, &type metadata for NLRouterPrompt);
    atomic_store(result, (unint64_t *)&qword_2550D7A28);
  }
  return result;
}

unint64_t sub_21A3A2ED4()
{
  unint64_t result;

  result = qword_2550D7A30;
  if (!qword_2550D7A30)
  {
    result = MEMORY[0x220744A58](&protocol conformance descriptor for NLRouterPrompt, &type metadata for NLRouterPrompt);
    atomic_store(result, &qword_2550D7A30);
  }
  return result;
}

uint64_t sub_21A3A2F10()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_339_1(v1, (uint64_t)sub_21A3A2F60);
  return sub_21A38D8CC();
}

uint64_t sub_21A3A2F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_2_6();
  v0 = OUTLINED_FUNCTION_64_0();
  return OUTLINED_FUNCTION_252_2(v0, v1, v2);
}

uint64_t sub_21A3A2F94()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_339_1(v1, (uint64_t)sub_21A3A32E0);
  return sub_21A38D918();
}

uint64_t sub_21A3A2FE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  OUTLINED_FUNCTION_69_0();
  v1 = *(_QWORD *)(OUTLINED_FUNCTION_20_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_77(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_380_1();
  return swift_deallocObject();
}

uint64_t sub_21A3A3084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(OUTLINED_FUNCTION_20_2() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = v0 + v3;
  v7 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v8 = *v7;
  v9 = v7[1];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_21A2E7920;
  return sub_21A38D97C((uint64_t)v10, v11, v12, v4, v5, v6, v8, v9);
}

unint64_t sub_21A3A313C()
{
  unint64_t result;

  result = qword_2550D7A58;
  if (!qword_2550D7A58)
  {
    result = MEMORY[0x220744A58](&protocol conformance descriptor for NLRouterModelOutput, &type metadata for NLRouterModelOutput);
    atomic_store(result, (unint64_t *)&qword_2550D7A58);
  }
  return result;
}

unint64_t sub_21A3A3178()
{
  unint64_t result;

  result = qword_2550D7A60;
  if (!qword_2550D7A60)
  {
    result = MEMORY[0x220744A58](&protocol conformance descriptor for NLRouterModelOutput, &type metadata for NLRouterModelOutput);
    atomic_store(result, &qword_2550D7A60);
  }
  return result;
}

uint64_t sub_21A3A31B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  v5 = (_QWORD *)OUTLINED_FUNCTION_25_18(v4);
  *v5 = v1;
  v5[1] = sub_21A2E754C;
  OUTLINED_FUNCTION_559_0();
  return sub_21A38E00C(v6, v7, v8, v9, v10, v3, v2);
}

uint64_t sub_21A3A3230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 56);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21A2E7920;
  OUTLINED_FUNCTION_559_0();
  return sub_21A38DAA0(v4, v5, v6, v7, v8, v2);
}

void sub_21A3A329C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_527_0();
  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(v0);
  OUTLINED_FUNCTION_60_0();
}

void *OUTLINED_FUNCTION_6_26(uint64_t a1)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

void *OUTLINED_FUNCTION_14_23@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(a1 + 64));
}

uint64_t OUTLINED_FUNCTION_18_22()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_21_25@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

void *OUTLINED_FUNCTION_25_19(uint64_t a1)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

void OUTLINED_FUNCTION_27_19(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_29_19()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_33_15()
{
  return sub_21A450CBC();
}

uint64_t OUTLINED_FUNCTION_34_12()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_35_14()
{
  return 0;
}

void OUTLINED_FUNCTION_40_16(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_42_14(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_45_15()
{
  type metadata accessor for NLRouterSiriXUSOParse(0);
  return sub_21A44C828();
}

void OUTLINED_FUNCTION_49_14(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_50_17()
{
  return sub_21A44CE34();
}

uint64_t OUTLINED_FUNCTION_63_11(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_64_14()
{
  return sub_21A44C828();
}

uint64_t OUTLINED_FUNCTION_69_10()
{
  return sub_21A450C2C();
}

uint64_t OUTLINED_FUNCTION_73_11()
{
  return sub_21A450C2C();
}

uint64_t OUTLINED_FUNCTION_74_14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_82_9()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_84_7()
{
  return sub_21A44CE34();
}

uint64_t OUTLINED_FUNCTION_86_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_91_10(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_93_10()
{
  return sub_21A450CD4();
}

uint64_t OUTLINED_FUNCTION_96_7()
{
  return swift_task_dealloc();
}

unint64_t OUTLINED_FUNCTION_97_10@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_98_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_107_4()
{
  return sub_21A450D1C();
}

void OUTLINED_FUNCTION_112_5(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

_QWORD *OUTLINED_FUNCTION_120_4(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_122_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_125_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(v0 + *(int *)(v2 + 24)) = *(_OWORD *)(v1 + *(int *)(v2 + 24));
  v3 = *(int *)(v2 + 28);
  v4 = v0 + v3;
  v5 = v1 + v3;
  *(_BYTE *)(v4 + 4) = *(_BYTE *)(v5 + 4);
  *(_DWORD *)v4 = *(_DWORD *)v5;
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_127_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(v0 + *(int *)(v2 + 24)) = *(_OWORD *)(v1 + *(int *)(v2 + 24));
  v3 = *(int *)(v2 + 28);
  v4 = v0 + v3;
  v5 = v1 + v3;
  *(_BYTE *)(v4 + 4) = *(_BYTE *)(v5 + 4);
  *(_DWORD *)v4 = *(_DWORD *)v5;
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_129_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 104) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_130_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_131_4()
{
  return sub_21A450B3C();
}

uint64_t OUTLINED_FUNCTION_135_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_137_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 4) = *(_BYTE *)(a1 + 4);
  *(_DWORD *)v1 = *(_DWORD *)a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_138_3()
{
  return sub_21A450E24();
}

id OUTLINED_FUNCTION_139_2()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v3 = v2[9];
  v4 = v2[10];
  v5 = *(void **)(v1 + v3);
  *(_QWORD *)(v0 + v3) = v5;
  v6 = (_QWORD *)(v0 + v4);
  v7 = (_QWORD *)(v1 + v4);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  v9 = v2[11];
  v10 = (_QWORD *)(v0 + v9);
  v11 = (_QWORD *)(v1 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  return v5;
}

uint64_t OUTLINED_FUNCTION_142_2()
{
  return sub_21A450B3C();
}

uint64_t OUTLINED_FUNCTION_143_2()
{
  return sub_21A450CD4();
}

uint64_t OUTLINED_FUNCTION_144_4()
{
  return sub_21A450D1C();
}

void OUTLINED_FUNCTION_145_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_148_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_150_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + *(int *)(v2 + 36)) = *(_QWORD *)(v1 + *(int *)(v2 + 36));
  *(_BYTE *)(v0 + *(int *)(v2 + 40)) = *(_BYTE *)(v1 + *(int *)(v2 + 40));
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_153_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(int *)(v2 + 24);
  v4 = *(int *)(v2 + 28);
  v5 = (_QWORD *)(v0 + v3);
  v6 = (_QWORD *)(v1 + v3);
  v7 = v6[1];
  *v5 = *v6;
  v5[1] = v7;
  v8 = v0 + v4;
  v9 = v1 + v4;
  *(_BYTE *)(v8 + 4) = *(_BYTE *)(v9 + 4);
  *(_DWORD *)v8 = *(_DWORD *)v9;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_162_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)(v1 + a1);
  v4 = (uint64_t *)(v2 + a1);
  v6 = *v4;
  v5 = v4[1];
  *v3 = v6;
  v3[1] = v5;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_163_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_164_2()
{
  return 0x6465747563657865;
}

uint64_t OUTLINED_FUNCTION_166_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

_QWORD *OUTLINED_FUNCTION_169_2(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_172_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_173_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_174_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(int *)(v2 + 28);
  *(_QWORD *)(v0 + *(int *)(v2 + 24)) = *(_QWORD *)(v1 + *(int *)(v2 + 24));
  *(_QWORD *)(v0 + v3) = *(_QWORD *)(v1 + v3);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_175_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_178_3()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 288));
}

uint64_t OUTLINED_FUNCTION_179_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_184_1()
{
  return sub_21A450CE0();
}

uint64_t OUTLINED_FUNCTION_188_2()
{
  return sub_21A450E18();
}

void *OUTLINED_FUNCTION_190_1(void *a1, uint64_t a2, size_t a3)
{
  const void *v3;

  return memcpy(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_191_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + *(int *)(v2 + 24)) = *(_QWORD *)(v1 + *(int *)(v2 + 24));
  return v0;
}

uint64_t OUTLINED_FUNCTION_195_1(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_197_3()
{
  return sub_21A450D1C();
}

uint64_t OUTLINED_FUNCTION_198_3()
{
  return sub_21A450C2C();
}

uint64_t OUTLINED_FUNCTION_204_1()
{
  return 0x4C4E79636167656CLL;
}

uint64_t OUTLINED_FUNCTION_205_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_206_2()
{
  return 0x45746E65696C6173;
}

uint64_t OUTLINED_FUNCTION_207_3()
{
  return 0x6F4373656D6D6F70;
}

uint64_t OUTLINED_FUNCTION_215_2()
{
  return sub_21A450CD4();
}

uint64_t OUTLINED_FUNCTION_216_1()
{
  return sub_21A450E24();
}

uint64_t OUTLINED_FUNCTION_217_1()
{
  return 0x6C646E7542707061;
}

uint64_t OUTLINED_FUNCTION_219_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)(v1 + a1);
  v4 = (_QWORD *)(v2 + a1);
  *v3 = *v4;
  v3[1] = v4[1];
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_221_3(unint64_t *a1)
{
  uint64_t *v1;

  sub_21A39CC3C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_225_2(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  return 0;
}

uint64_t OUTLINED_FUNCTION_230_3()
{
  return sub_21A44EDF0();
}

uint64_t OUTLINED_FUNCTION_232_2()
{
  return 0x6154657669746361;
}

uint64_t OUTLINED_FUNCTION_234_3()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[43] + 8))(v0[45], v0[42]);
}

uint64_t OUTLINED_FUNCTION_238_3()
{
  return 0x7372615072657375;
}

uint64_t OUTLINED_FUNCTION_242_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_243_1()
{
  return sub_21A450C2C();
}

uint64_t OUTLINED_FUNCTION_246_3(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_248_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_252_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_262_3(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_263_3(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_264_2(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_265_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_269_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_270_1()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  v0[2] = v1[2];
}

uint64_t OUTLINED_FUNCTION_271_2()
{
  return sub_21A450C98();
}

size_t OUTLINED_FUNCTION_272_0@<X0>(uint64_t a1@<X8>)
{
  int64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  return sub_21A2C04A8(0, v1, 0);
}

uint64_t OUTLINED_FUNCTION_274_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_275_2()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_276_2()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 128) = 0x3E656761733CLL;
  *(_QWORD *)(v0 - 120) = 0xE600000000000000;
  return sub_21A39C404();
}

uint64_t OUTLINED_FUNCTION_279_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_280_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_285_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(int *)(v2 + 40);
  *(_QWORD *)(v0 + *(int *)(v2 + 36)) = *(_QWORD *)(v1 + *(int *)(v2 + 36));
  *(_BYTE *)(v0 + v3) = *(_BYTE *)(v1 + v3);
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_291_1(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_294_0()
{
  return sub_21A450C50();
}

uint64_t OUTLINED_FUNCTION_297_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_298_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_299_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

void OUTLINED_FUNCTION_301_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_21A3336F4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_304_2()
{
  return type metadata accessor for NLRouterSiriXParse(0);
}

uint64_t OUTLINED_FUNCTION_306_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_307_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_308_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_309_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_310_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_311_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_313_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_314_0()
{
  return sub_21A450C2C();
}

uint64_t OUTLINED_FUNCTION_315_1()
{
  return sub_21A450C98();
}

void OUTLINED_FUNCTION_317_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
}

void OUTLINED_FUNCTION_318_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_321_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_322_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_328_0@<X0>(int *a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *a1;
  *(_BYTE *)(v1 + 4) = *((_BYTE *)a1 + 4);
  *(_DWORD *)v1 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_329_1()
{
  return 0x6365447972657571;
}

uint64_t OUTLINED_FUNCTION_332_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_333_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
}

uint64_t OUTLINED_FUNCTION_334_2()
{
  return swift_initStructMetadata();
}

char *OUTLINED_FUNCTION_335_2@<X0>(uint64_t a1@<X8>)
{
  return sub_21A2CCDB4(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_337_0()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  v0[1] = v1[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_339_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_340_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_344_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_346(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_21A3336F4(a1, a2, v2);
}

void OUTLINED_FUNCTION_348_1(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_21A2C8FB0(v2, a2);
}

uint64_t OUTLINED_FUNCTION_351_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_352_1()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_353_1()
{
  return sub_21A33FEA4();
}

void OUTLINED_FUNCTION_359_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_361_1@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 112) = a1;
  return sub_21A450C5C();
}

uint64_t OUTLINED_FUNCTION_364_1()
{
  return sub_21A44C324();
}

void OUTLINED_FUNCTION_366_0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_21A2C8FB0(v2, a2);
}

uint64_t OUTLINED_FUNCTION_367()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_370_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_371_0()
{
  return 0x6572656767697274;
}

uint64_t OUTLINED_FUNCTION_372_1()
{
  return type metadata accessor for NLRouterSiriXUSOParse(0);
}

uint64_t OUTLINED_FUNCTION_373_1()
{
  return sub_21A450B48();
}

uint64_t OUTLINED_FUNCTION_374_1()
{
  return nullsub_1(0, 0);
}

uint64_t OUTLINED_FUNCTION_375_1()
{
  return type metadata accessor for NLRouterActionCandidate(0);
}

uint64_t OUTLINED_FUNCTION_376_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_378_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_21A39CF78(a1, a2, a3, a4, 0, a6);
}

uint64_t OUTLINED_FUNCTION_380_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_385_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_387_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void OUTLINED_FUNCTION_388_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_21A2C9004(*(_QWORD *)(v2 - 144), a2);
}

uint64_t OUTLINED_FUNCTION_389_1()
{
  return sub_21A450C44();
}

uint64_t OUTLINED_FUNCTION_393_1()
{
  return sub_21A450CC8();
}

uint64_t OUTLINED_FUNCTION_396_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_397_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_401_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_402_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_405_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_408_0(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_410_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + a1) = *(_QWORD *)(v2 + a1);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_413_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + a1) = *(_QWORD *)(v2 + a1);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_415_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_416_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_422@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_423()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_427()
{
  return 0;
}

void OUTLINED_FUNCTION_428()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
}

uint64_t OUTLINED_FUNCTION_429_0()
{
  return 0x74754F6C65646F6DLL;
}

uint64_t OUTLINED_FUNCTION_430()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_434_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_435@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;

  *v2 = a2;
  v2[1] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_437_0()
{
  return sub_21A450DE8();
}

uint64_t OUTLINED_FUNCTION_442_0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_443_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_446_0()
{
  return sub_21A450CBC();
}

uint64_t OUTLINED_FUNCTION_448_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_451_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_456(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_462_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_465_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_466@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_467_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_473_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_475_0()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_476()
{
  NSObject *v0;
  os_log_type_t v1;

  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_477_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_479_0()
{
  return sub_21A44C33C();
}

uint64_t OUTLINED_FUNCTION_481()
{
  return sub_21A450E18();
}

uint64_t OUTLINED_FUNCTION_483_0()
{
  return sub_21A450E18();
}

__n128 OUTLINED_FUNCTION_484_0()
{
  __n128 *v0;
  __n128 *v1;
  __n128 result;

  result = *v1;
  *v0 = *v1;
  v0[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_485_0()
{
  return sub_21A450C50();
}

unint64_t OUTLINED_FUNCTION_486_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_21A39CD48();
}

unint64_t OUTLINED_FUNCTION_487_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_21A39C518();
}

unint64_t OUTLINED_FUNCTION_488_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 1;
  return sub_21A39D818();
}

unint64_t OUTLINED_FUNCTION_489_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_21A39C808();
}

unint64_t OUTLINED_FUNCTION_490_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 1;
  return sub_21A39D6B0();
}

uint64_t OUTLINED_FUNCTION_491_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_494_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_496_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_498_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_500_0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_501_0()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_502_0()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_503_0()
{
  return sub_21A450CB0();
}

uint64_t OUTLINED_FUNCTION_504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_505_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_507_0()
{
  return 0x6974736972756568;
}

void OUTLINED_FUNCTION_508_0(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_21A2C8F84(a1, *(_QWORD *)(v2 - 144), v1);
}

id OUTLINED_FUNCTION_511_0()
{
  return sub_21A33FEA4();
}

uint64_t OUTLINED_FUNCTION_512_0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  *v1 = *a1;
  result = a1[1];
  v1[1] = result;
  return result;
}

unint64_t OUTLINED_FUNCTION_513_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 2;
  return sub_21A39CD0C();
}

unint64_t OUTLINED_FUNCTION_514_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_21A39C7CC();
}

void OUTLINED_FUNCTION_515_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
}

unint64_t OUTLINED_FUNCTION_516_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return sub_21A39D7DC();
}

unint64_t OUTLINED_FUNCTION_517_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 2;
  return sub_21A39D674();
}

uint64_t OUTLINED_FUNCTION_518_0()
{
  return sub_21A450E18();
}

uint64_t OUTLINED_FUNCTION_519()
{
  return sub_21A450DA0();
}

uint64_t OUTLINED_FUNCTION_520_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + *(int *)(v2 + 40)) = *(_BYTE *)(v1 + *(int *)(v2 + 40));
  return v0;
}

void OUTLINED_FUNCTION_522(unint64_t *a1)
{
  uint64_t *v1;

  sub_21A39D358(a1, v1);
}

uint64_t OUTLINED_FUNCTION_523_0()
{
  return sub_21A450C14();
}

void OUTLINED_FUNCTION_524_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
}

unint64_t OUTLINED_FUNCTION_525_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 3;
  return sub_21A39D638();
}

unint64_t OUTLINED_FUNCTION_526_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 3;
  return sub_21A39D7A0();
}

uint64_t OUTLINED_FUNCTION_528_0()
{
  return sub_21A450C98();
}

uint64_t OUTLINED_FUNCTION_531_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_532_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_534_0()
{
  return sub_21A450A34();
}

unint64_t OUTLINED_FUNCTION_536()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 6;
  return sub_21A39D584();
}

uint64_t OUTLINED_FUNCTION_538_0()
{
  return sub_21A4505FC();
}

uint64_t OUTLINED_FUNCTION_541_0()
{
  return sub_21A2FE964();
}

uint64_t OUTLINED_FUNCTION_545_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 72);
}

uint64_t OUTLINED_FUNCTION_546_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_548_0()
{
  return type metadata accessor for NLRouterServiceResponse(0);
}

uint64_t OUTLINED_FUNCTION_549()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_550()
{
  return swift_task_alloc();
}

unint64_t OUTLINED_FUNCTION_551_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 5;
  return sub_21A39D5C0();
}

unint64_t OUTLINED_FUNCTION_554_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return sub_21A39D764();
}

unint64_t OUTLINED_FUNCTION_555_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 4;
  return sub_21A39D5FC();
}

uint64_t OUTLINED_FUNCTION_556_0()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_558_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_562_0()
{
  return sub_21A450DDC();
}

uint64_t OUTLINED_FUNCTION_563_0(uint64_t a1, unint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_21A2BCCC4(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_564_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_566_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_567_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_21A2C8FD8(a1, *(_QWORD *)(v3 - 200), a3);
}

uint64_t OUTLINED_FUNCTION_569_0()
{
  return sub_21A44FC24();
}

uint64_t OUTLINED_FUNCTION_574_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_575()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t sub_21A3A4734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  _QWORD *v27;
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
  id v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  id v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int EnumTagSinglePayload;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t, uint64_t);
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
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  id v97;
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

  v122 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E43740);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6();
  v102 = v4;
  OUTLINED_FUNCTION_42();
  v105 = sub_21A44CE34();
  v101 = *(_QWORD *)(v105 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6();
  v107 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E43870);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6();
  v106 = v8;
  OUTLINED_FUNCTION_42();
  v108 = sub_21A44FCE4();
  v104 = *(_QWORD *)(v108 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6();
  v103 = v10;
  OUTLINED_FUNCTION_42();
  v121 = sub_21A44F2C4();
  v111 = *(_QWORD *)(v121 - 8);
  OUTLINED_FUNCTION_2();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v109 = (uint64_t)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v110 = (uint64_t)&v99 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v112 = (uint64_t)&v99 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4A10);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_6();
  v114 = v18;
  v19 = OUTLINED_FUNCTION_42();
  v115 = type metadata accessor for NLRouterTurnContext(v19);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_6();
  v113 = v21;
  v22 = OUTLINED_FUNCTION_42();
  v23 = type metadata accessor for NLRouterSiriXParse(v22);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0_0();
  v27 = (_QWORD *)(v26 - v25);
  v28 = type metadata accessor for NLRouterActionCandidate(0);
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_0_0();
  v32 = v31 - v30;
  v33 = sub_21A4501A0();
  v117 = *(_QWORD *)(v33 - 8);
  v118 = v33;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_0_0();
  v37 = v36 - v35;
  v38 = sub_21A2BBC08(0, (unint64_t *)&qword_253E44690);
  v39 = sub_21A33FEA4();
  v120 = v37;
  sub_21A33FF0C((uint64_t)"HeuristicRules.MathRule", 23, 2, v39);

  v40 = sub_21A2BBC08(0, &qword_2550D47D0);
  sub_21A2EBA80();
  v119 = v38;
  v116 = v40;
  if ((v41 & 1) == 0)
  {
    sub_21A450920();
    v50 = sub_21A33FEA4();
    sub_21A450164();

    v43 = v122;
    goto LABEL_16;
  }
  v123 = v23;
  v42 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for NLRouterServiceRequest(0) + 28));
  v43 = v122;
  if (!v42 || (v44 = *(_QWORD *)(v42 + 16)) == 0)
  {
LABEL_16:
    sub_21A2EC750();
    if ((v51 & 1) == 0)
    {
      sub_21A450920();
      v58 = sub_21A33FEA4();
      sub_21A450164();

      v57 = 1;
      v56 = v120;
      goto LABEL_20;
    }
    v52 = type metadata accessor for NLRouterServiceRequest(0);
    v53 = v114;
    sub_21A319E74(a1 + *(int *)(v52 + 20), v114, &qword_2550D4A10);
    v54 = v115;
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v53, 1, v115);
    v56 = v120;
    if (EnumTagSinglePayload == 1)
    {
      sub_21A2C9004(v53, &qword_2550D4A10);
      v57 = 1;
LABEL_20:
      v60 = v117;
      v59 = v118;
      v61 = v121;
      goto LABEL_54;
    }
    v62 = v113;
    sub_21A2C4F00(v53, v113);
    v63 = a1 + *(int *)(type metadata accessor for HeuristicRoutingRequest(0) + 20);
    v65 = v111;
    v64 = v112;
    v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16);
    v61 = v121;
    v66(v112, v63, v121);
    v67 = v110;
    v66(v110, v64, v61);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v65 + 88))(v67, v61) != *MEMORY[0x24BE9A288])
    {
      OUTLINED_FUNCTION_59_0(v64);
      sub_21A2C8FB0(v62, type metadata accessor for NLRouterTurnContext);
      OUTLINED_FUNCTION_59_0(v67);
LABEL_52:
      v57 = 1;
      goto LABEL_53;
    }
    (*(void (**)(uint64_t, uint64_t))(v65 + 96))(v67, v61);
    v68 = swift_bridgeObjectRelease();
    sub_21A2FFB2C(v68, v69, v70, v71, v72, v73, v74, v75, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,
      v110);
    v76 = v106;
    sub_21A319E74(v62 + *(int *)(v54 + 28), v106, (uint64_t *)&unk_253E43870);
    v77 = v108;
    if (__swift_getEnumTagSinglePayload(v76, 1, v108) == 1)
    {
      sub_21A2C9004(v76, (uint64_t *)&unk_253E43870);
    }
    else
    {
      v78 = v103;
      v79 = v104;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v103, v76, v77);
      v80 = sub_21A44FCD8();
      if (v81)
      {
        v82 = v80 == 1752457581 && v81 == 0xE400000000000000;
        v83 = v105;
        v84 = v107;
        if (v82)
        {
          OUTLINED_FUNCTION_8_20();
          swift_bridgeObjectRelease();
        }
        else
        {
          v85 = OUTLINED_FUNCTION_4_23();
          OUTLINED_FUNCTION_8_20();
          swift_bridgeObjectRelease();
          if ((v85 & 1) == 0)
          {
LABEL_36:
            v86 = v113;
            v87 = v102;
            sub_21A319E74(v113 + *(int *)(v115 + 32), v102, &qword_253E43740);
            if (__swift_getEnumTagSinglePayload(v87, 1, v83) == 1)
            {
              OUTLINED_FUNCTION_59_0(v109);
              OUTLINED_FUNCTION_59_0(v112);
              sub_21A2C8FB0(v86, type metadata accessor for NLRouterTurnContext);
              sub_21A2C9004(v87, &qword_253E43740);
              goto LABEL_52;
            }
            v88 = v101;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v84, v87, v83);
            if ((sub_21A44CE28() & 1) == 0)
            {
              (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v84, v83);
              OUTLINED_FUNCTION_59_0(v109);
              v93 = OUTLINED_FUNCTION_59_0(v112);
              OUTLINED_FUNCTION_11_23(v93, type metadata accessor for NLRouterTurnContext);
              goto LABEL_52;
            }
            v90 = sub_21A44CE1C() == 0x74656D6874697261 && v89 == 0xEA00000000006369;
            v91 = v112;
            if (v90)
            {
              swift_bridgeObjectRelease();
              v92 = 1;
            }
            else
            {
              v92 = sub_21A450D64();
              swift_bridgeObjectRelease();
            }
            (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v107, v83);
            v95 = *(uint64_t (**)(uint64_t, uint64_t))(v65 + 8);
            v96 = v95(v91, v61);
            OUTLINED_FUNCTION_11_23(v96, type metadata accessor for NLRouterTurnContext);
            if ((v92 & 1) == 0)
            {
              v95(v109, v61);
              goto LABEL_52;
            }
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v43, v109, v61);
LABEL_50:
            v57 = 0;
LABEL_53:
            v60 = v117;
            v59 = v118;
            goto LABEL_54;
          }
        }
        v94 = (*(uint64_t (**)(uint64_t, uint64_t))(v65 + 8))(v112, v61);
        OUTLINED_FUNCTION_11_23(v94, type metadata accessor for NLRouterTurnContext);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v43, v109, v61);
        goto LABEL_50;
      }
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v77);
    }
    v83 = v105;
    v84 = v107;
    goto LABEL_36;
  }
  v99 = a1;
  v45 = v32 + *(int *)(v28 + 20);
  v46 = v42 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
  v47 = *(_QWORD *)(v29 + 72);
  v100 = v42;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_21A319C3C(v46, v32, type metadata accessor for NLRouterActionCandidate);
    sub_21A319C3C(v45, (uint64_t)v27, type metadata accessor for NLRouterSiriXParse);
    sub_21A2C8FB0(v32, type metadata accessor for NLRouterActionCandidate);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_21A2C8FB0((uint64_t)v27, type metadata accessor for NLRouterSiriXParse);
      goto LABEL_13;
    }
    if (*v27 == 1752457581 && v27[1] == 0xE400000000000000)
      break;
    v49 = OUTLINED_FUNCTION_4_23();
    swift_bridgeObjectRelease();
    if ((v49 & 1) != 0)
      goto LABEL_33;
LABEL_13:
    v46 += v47;
    if (!--v44)
    {
      OUTLINED_FUNCTION_10_27();
      v43 = v122;
      a1 = v99;
      goto LABEL_16;
    }
  }
  OUTLINED_FUNCTION_10_27();
LABEL_33:
  swift_bridgeObjectRelease();
  v61 = v121;
  v43 = v122;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v111 + 104))(v122, *MEMORY[0x24BE9A298], v121);
  v57 = 0;
  v60 = v117;
  v59 = v118;
  v56 = v120;
LABEL_54:
  __swift_storeEnumTagSinglePayload(v43, v57, 1, v61);
  v97 = sub_21A33FEA4();
  sub_21A33FF68(v56, (uint64_t)"HeuristicRules.MathRule", 23, 2, (uint64_t)v97);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v56, v59);
}

ValueMetadata *type metadata accessor for MathRule()
{
  return &type metadata for MathRule;
}

uint64_t OUTLINED_FUNCTION_4_23()
{
  return sub_21A450D64();
}

uint64_t OUTLINED_FUNCTION_8_20()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 248) + 8))(*(_QWORD *)(v0 - 256), *(_QWORD *)(v0 - 216));
}

uint64_t OUTLINED_FUNCTION_10_27()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11_23(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_21A2C8FB0(*(_QWORD *)(v2 - 176), a2);
}

void sub_21A3A5068()
{
  qword_2550E4E60 = (uint64_t)&unk_24DCAAB90;
}

void sub_21A3A507C()
{
  OUTLINED_FUNCTION_28_1();
  sub_21A3A50AC();
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3A50AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v1 = v0;
  v2 = sub_21A44E9AC();
  if (!v2)
    goto LABEL_6;
  v3 = v2;
  if (qword_2550E49A0 != -1)
    swift_once();
  v4 = (_QWORD *)qword_2550E4E60;
  swift_bridgeObjectRetain();
  v5 = sub_21A44ECDC();
  v7 = sub_21A2FE9F8(v5, v6, v4);
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_17_0();
  swift_release();
  if ((v7 & 1) != 0)
  {
    *(_QWORD *)(v1 + 16) = v3;
  }
  else
  {
LABEL_6:
    swift_release();
    type metadata accessor for NLRouterUsoGraphPromptHelper();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v1;
}

uint64_t type metadata accessor for NLRouterUsoGraphPromptHelper()
{
  return objc_opt_self();
}

uint64_t sub_21A3A51A0()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_21A44ECDC();
  v1 = v0;
  v2 = OUTLINED_FUNCTION_31_16();
  sub_21A3A6B94(v2, v3, v4, v1);
  v6 = v5;
  v8 = v7;
  OUTLINED_FUNCTION_70_0();
  sub_21A3A5270();
  v10 = v9;
  if (v9)
  {
    OUTLINED_FUNCTION_7_0();
    sub_21A3A6448(v10, v6, v8);
    OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_0_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
    OUTLINED_FUNCTION_46_17();
    sub_21A4505E4();
    OUTLINED_FUNCTION_13_0();
  }
  else
  {
    OUTLINED_FUNCTION_3_2();
  }
  return OUTLINED_FUNCTION_29_5();
}

void sub_21A3A5270()
{
  uint64_t v0;
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t inited;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char v18;
  BOOL v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  BOOL v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;
  char v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  _BOOL8 v73;
  unint64_t v74;
  char v75;
  unint64_t v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t n;
  unint64_t v86;
  unint64_t v87;
  _BOOL8 v88;
  int64_t v89;
  char v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  unint64_t v100;
  char *v101;
  uint64_t v103;
  BOOL v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  os_log_type_t v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  BOOL v118;
  _BOOL8 v119;
  int64_t v120;
  char v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  unint64_t v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  _UNKNOWN **v135;
  char *v136[5];
  char *v137;
  uint64_t v138;
  uint64_t v139;

  v1 = (char *)v0;
  sub_21A3A6614();
  if ((v2 & 1) != 0)
    goto LABEL_191;
  v3 = *(_QWORD *)(OUTLINED_FUNCTION_54_15() + 16);
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_191;
  v4 = OUTLINED_FUNCTION_54_15();
  v138 = sub_21A3A6680(v4);
  v137 = (char *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D7FF0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21A4611C0;
  v6 = (uint64_t *)type metadata accessor for DateTimeRageAttribute();
  v7 = sub_21A44ECDC();
  v9 = v8;
  v128 = (char *)v0;
  v122 = (char *)inited;
  if (v7 == 0xD000000000000014 && v8 == (_QWORD *)0x800000021A473250)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_3_2();
    if ((v0 & 1) == 0)
      goto LABEL_36;
  }
  OUTLINED_FUNCTION_19_24();
  if ((v10 & 1) == 0)
  {
    OUTLINED_FUNCTION_55_13();
    OUTLINED_FUNCTION_19_24();
    if ((v24 & 1) == 0)
      goto LABEL_36;
    OUTLINED_FUNCTION_19_24();
    if ((v25 & 1) == 0)
      goto LABEL_36;
  }
  if (qword_2550E4A08 != -1)
    swift_once();
  v6 = &qword_2550E4000;
  v11 = qword_2550E4A10;
  OUTLINED_FUNCTION_70_7();
  if (v12)
  {
    OUTLINED_FUNCTION_8_21();
    for (i = 0; i != 48; i += 16)
    {
      OUTLINED_FUNCTION_39_3();
      OUTLINED_FUNCTION_11_24();
      v9 = v14;
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_3_2();
    }
    OUTLINED_FUNCTION_10_0();
    v11 = qword_2550E4A10;
  }
  OUTLINED_FUNCTION_8_21();
  v15 = 0;
  inited = MEMORY[0x24BEE4B00];
  v123 = v11;
  while (1)
  {
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_23_16();
    if (v16)
      break;
    OUTLINED_FUNCTION_30_2();
LABEL_31:
    v15 += 16;
    if (v15 == 48)
    {
      OUTLINED_FUNCTION_10_0();
      v23 = OUTLINED_FUNCTION_48_15();
      if (v23)
      {
        *(_QWORD *)(inited + 56) = v0;
        *(_QWORD *)(inited + 64) = &_MergedGlobals_5;
        *(_QWORD *)(inited + 32) = v23;
        goto LABEL_37;
      }
LABEL_36:
      OUTLINED_FUNCTION_28_21(inited + 32);
LABEL_37:
      OUTLINED_FUNCTION_75_12();
      type metadata accessor for DateTimeAttribute();
      v27 = (uint64_t *)OUTLINED_FUNCTION_53_16() == v6 && v26 == 0xEF656D6954657461;
      if (v27)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_37_12();
        v0 = OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_3_2();
        if ((v0 & 1) == 0)
          goto LABEL_71;
      }
      OUTLINED_FUNCTION_19_24();
      if ((v28 & 1) == 0)
      {
        OUTLINED_FUNCTION_19_24();
        if ((v29 & 1) == 0)
          goto LABEL_71;
      }
      if (qword_2550E49F8 != -1)
        swift_once();
      v6 = &qword_2550E4000;
      v30 = qword_2550E4A00;
      OUTLINED_FUNCTION_70_7();
      if (v31)
      {
        OUTLINED_FUNCTION_8_21();
        for (j = 0; j != 32; j += 16)
        {
          OUTLINED_FUNCTION_39_3();
          OUTLINED_FUNCTION_11_24();
          v9 = v33;
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_3_2();
        }
        OUTLINED_FUNCTION_10_0();
        v30 = qword_2550E4A00;
      }
      OUTLINED_FUNCTION_8_21();
      v34 = 0;
      inited = MEMORY[0x24BEE4B00];
      v124 = v30;
      do
      {
        OUTLINED_FUNCTION_89_0();
        OUTLINED_FUNCTION_23_16();
        if (v35)
        {
          OUTLINED_FUNCTION_13_25();
          OUTLINED_FUNCTION_27_20();
          if (v30)
          {
            OUTLINED_FUNCTION_89_0();
            OUTLINED_FUNCTION_62_11();
            OUTLINED_FUNCTION_6_27();
            OUTLINED_FUNCTION_32_14();
            if (v19)
              goto LABEL_193;
            v1 = v36;
            v38 = v37;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E43950);
            if ((OUTLINED_FUNCTION_15_27() & 1) != 0)
            {
              OUTLINED_FUNCTION_21_26();
              OUTLINED_FUNCTION_30_17();
              if (!v27)
                goto LABEL_202;
              v1 = v39;
            }
            inited = (unint64_t)v136[0];
            if ((v38 & 1) != 0)
            {
              OUTLINED_FUNCTION_20_20();
              *v9 = &qword_2550E4000;
              v9[1] = v30;
            }
            else
            {
              OUTLINED_FUNCTION_0_33();
              if (v19)
                goto LABEL_197;
              *((_QWORD *)v136[0] + 2) = v40;
              OUTLINED_FUNCTION_89_0();
            }
            OUTLINED_FUNCTION_10_0();
            OUTLINED_FUNCTION_56_17();
            v1 = v128;
          }
          else
          {
            OUTLINED_FUNCTION_30_2();
          }
          v30 = v124;
        }
        else
        {
          OUTLINED_FUNCTION_30_2();
        }
        v34 += 16;
      }
      while (v34 != 32);
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_48_15();
      OUTLINED_FUNCTION_75_12();
      if (v41)
      {
        *(_QWORD *)(inited + 96) = v0;
        *(_QWORD *)(inited + 104) = &off_253E443D8;
        *(_QWORD *)(inited + 72) = v41;
      }
      else
      {
LABEL_71:
        OUTLINED_FUNCTION_28_21(inited + 72);
      }
      type metadata accessor for DateAttribute();
      if ((uint64_t *)OUTLINED_FUNCTION_53_16() == v6 && v42 == 0xEB00000000657461)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_37_12();
        v0 = OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_3_2();
        if ((v0 & 1) == 0)
          goto LABEL_106;
      }
      OUTLINED_FUNCTION_43_11();
      OUTLINED_FUNCTION_19_24();
      if ((v44 & 1) == 0)
      {
        OUTLINED_FUNCTION_42_15();
        OUTLINED_FUNCTION_19_24();
        if ((v45 & 1) == 0)
          goto LABEL_106;
      }
      if (qword_2550E49C8 != -1)
        swift_once();
      v46 = qword_2550E49D0;
      OUTLINED_FUNCTION_70_7();
      if (v47)
      {
        OUTLINED_FUNCTION_8_21();
        for (k = 0; k != 64; k += 16)
        {
          OUTLINED_FUNCTION_39_3();
          OUTLINED_FUNCTION_11_24();
          v9 = v49;
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_3_2();
        }
        OUTLINED_FUNCTION_10_0();
        v46 = qword_2550E49D0;
      }
      OUTLINED_FUNCTION_8_21();
      v50 = 0;
      inited = MEMORY[0x24BEE4B00];
      v125 = v46;
      do
      {
        OUTLINED_FUNCTION_89_0();
        OUTLINED_FUNCTION_23_16();
        if (v51)
        {
          OUTLINED_FUNCTION_13_25();
          OUTLINED_FUNCTION_27_20();
          if (v46)
          {
            OUTLINED_FUNCTION_89_0();
            OUTLINED_FUNCTION_62_11();
            OUTLINED_FUNCTION_6_27();
            OUTLINED_FUNCTION_32_14();
            if (v19)
              goto LABEL_194;
            v1 = v52;
            v54 = v53;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E43950);
            if ((OUTLINED_FUNCTION_15_27() & 1) != 0)
            {
              OUTLINED_FUNCTION_21_26();
              OUTLINED_FUNCTION_30_17();
              if (!v27)
                goto LABEL_202;
              v1 = v55;
            }
            inited = (unint64_t)v136[0];
            if ((v54 & 1) != 0)
            {
              OUTLINED_FUNCTION_20_20();
              *v9 = &qword_2550E4000;
              v9[1] = v46;
            }
            else
            {
              OUTLINED_FUNCTION_0_33();
              if (v19)
                goto LABEL_198;
              *((_QWORD *)v136[0] + 2) = v56;
              OUTLINED_FUNCTION_89_0();
            }
            OUTLINED_FUNCTION_10_0();
            OUTLINED_FUNCTION_56_17();
            v1 = v128;
          }
          else
          {
            OUTLINED_FUNCTION_30_2();
          }
          v46 = v125;
        }
        else
        {
          OUTLINED_FUNCTION_30_2();
        }
        v50 += 16;
      }
      while (v50 != 64);
      OUTLINED_FUNCTION_10_0();
      v57 = OUTLINED_FUNCTION_48_15();
      if (v57)
      {
        *(_QWORD *)(inited + 136) = v0;
        *(_QWORD *)(inited + 144) = &off_253E44438;
        *(_QWORD *)(inited + 112) = v57;
      }
      else
      {
LABEL_106:
        OUTLINED_FUNCTION_28_21(inited + 112);
      }
      if (qword_2550E49E8 != -1)
        goto LABEL_201;
LABEL_108:
      v58 = qword_2550E49F0;
      v59 = OUTLINED_FUNCTION_53_16();
      LOBYTE(v58) = sub_21A3311A0(v59, v60, v58);
      OUTLINED_FUNCTION_0_1();
      if ((v58 & 1) == 0)
        goto LABEL_134;
      if (qword_2550E49D8 != -1)
        swift_once();
      v61 = qword_2550E49E0;
      OUTLINED_FUNCTION_70_7();
      if (v62)
      {
        OUTLINED_FUNCTION_85_0();
        for (m = 0; m != 64; m += 16)
        {
          OUTLINED_FUNCTION_39_3();
          OUTLINED_FUNCTION_11_24();
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_3_2();
        }
        OUTLINED_FUNCTION_10_0();
        v61 = qword_2550E49E0;
      }
      OUTLINED_FUNCTION_85_0();
      v64 = 0;
      v1 = (char *)MEMORY[0x24BEE4B00];
      v126 = v61;
      do
      {
        v65 = *(_QWORD *)(v61 + v64 + 32);
        inited = *(_QWORD *)(v61 + v64 + 40);
        OUTLINED_FUNCTION_88_4();
        sub_21A3A6EF4(v65, inited);
        if (v66)
        {
          v67 = OUTLINED_FUNCTION_13_25();
          v69 = v68;
          swift_release();
          if (v69)
          {
            OUTLINED_FUNCTION_88_4();
            swift_isUniquelyReferenced_nonNull_native();
            v136[0] = v1;
            v70 = sub_21A2CCFF8(v65, inited);
            v72 = *((_QWORD *)v1 + 2);
            v73 = (v71 & 1) == 0;
            v1 = (char *)(v72 + v73);
            if (__OFADD__(v72, v73))
              goto LABEL_195;
            v74 = v70;
            v75 = v71;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E43950);
            if ((sub_21A450BB4() & 1) != 0)
            {
              sub_21A2CCFF8(v65, inited);
              OUTLINED_FUNCTION_30_17();
              if (!v27)
                goto LABEL_202;
              v74 = v76;
            }
            v1 = v136[0];
            if ((v75 & 1) != 0)
            {
              v77 = (uint64_t *)(*((_QWORD *)v136[0] + 7) + 16 * v74);
              swift_bridgeObjectRelease();
              *v77 = v67;
              v77[1] = v69;
            }
            else
            {
              *(_QWORD *)&v136[0][8 * (v74 >> 6) + 64] |= 1 << v74;
              v78 = (uint64_t *)(*((_QWORD *)v1 + 6) + 16 * v74);
              *v78 = v65;
              v78[1] = inited;
              v79 = (uint64_t *)(*((_QWORD *)v1 + 7) + 16 * v74);
              *v79 = v67;
              v79[1] = v69;
              v80 = *((_QWORD *)v1 + 2);
              v19 = __OFADD__(v80, 1);
              v81 = v80 + 1;
              if (v19)
                goto LABEL_199;
              *((_QWORD *)v1 + 2) = v81;
              OUTLINED_FUNCTION_88_4();
            }
            OUTLINED_FUNCTION_10_0();
          }
          swift_bridgeObjectRelease();
          v61 = v126;
        }
        else
        {
          OUTLINED_FUNCTION_86_0();
        }
        v64 += 16;
      }
      while (v64 != 64);
      OUTLINED_FUNCTION_10_0();
      v82 = type metadata accessor for TimeAttribute();
      v83 = sub_21A3A7870(v1);
      v1 = v128;
      inited = (unint64_t)v122;
      if (v83)
      {
        *((_QWORD *)v122 + 22) = v82;
        *((_QWORD *)v122 + 23) = &off_253E44408;
        *((_QWORD *)v122 + 19) = v83;
      }
      else
      {
LABEL_134:
        OUTLINED_FUNCTION_28_21(inited + 152);
      }
      v84 = (char *)MEMORY[0x24BEE4AF8];
      for (n = 32; n != 192; n += 40)
      {
        sub_21A3A94DC(inited + n, (uint64_t)v136);
        sub_21A3A9524((uint64_t)v136, (uint64_t)&v131);
        if (v132)
        {
          sub_21A2C4EE8(&v131, (uint64_t)&v133);
          sub_21A2C4EE8(&v133, (uint64_t)&v131);
          if ((OUTLINED_FUNCTION_67_13() & 1) == 0)
            v84 = sub_21A3A813C(0, *((_QWORD *)v84 + 2) + 1, 1, (uint64_t)v84);
          v87 = *((_QWORD *)v84 + 2);
          v86 = *((_QWORD *)v84 + 3);
          if (v87 >= v86 >> 1)
          {
            v88 = OUTLINED_FUNCTION_74_15(v86);
            v84 = sub_21A3A813C((char *)v88, v89, v90, (uint64_t)v84);
          }
          *((_QWORD *)v84 + 2) = v87 + 1;
          sub_21A2C4EE8(&v131, (uint64_t)&v84[40 * v87 + 32]);
        }
        else
        {
          sub_21A3A956C((uint64_t)&v131);
        }
      }
      swift_setDeallocating();
      sub_21A3A80EC();
      sub_21A3A69C0((uint64_t)v84);
      v91 = v138;
      OUTLINED_FUNCTION_60_14();
      OUTLINED_FUNCTION_85_0();
      v92 = (char *)sub_21A3A84DC(v91);
      OUTLINED_FUNCTION_0_1();
      v136[0] = v92;
      sub_21A3A843C(v136);
      OUTLINED_FUNCTION_177_0();
      OUTLINED_FUNCTION_0_1();
      v93 = v136[0];
      v127 = *((_QWORD *)v136[0] + 2);
      if (v127)
      {
        inited = 0;
        v122 = v136[0] + 32;
        do
        {
          if (inited >= *((_QWORD *)v93 + 2))
          {
            __break(1u);
LABEL_193:
            __break(1u);
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
LABEL_199:
            __break(1u);
LABEL_200:
            __break(1u);
LABEL_201:
            swift_once();
            goto LABEL_108;
          }
          v94 = (uint64_t *)&v122[16 * inited];
          v95 = *v94;
          v96 = v94[1];
          v129 = *v94;
          v130 = v96;
          OUTLINED_FUNCTION_84_0();
          v97 = OUTLINED_FUNCTION_54_15();
          if (*(_QWORD *)(v97 + 16))
          {
            OUTLINED_FUNCTION_84_0();
            v98 = sub_21A2CCFF8(v95, v96);
            if ((v99 & 1) != 0)
            {
              v100 = *(_QWORD *)(*(_QWORD *)(v97 + 56) + 8 * v98);
              swift_bridgeObjectRetain();
              OUTLINED_FUNCTION_204_0();
              OUTLINED_FUNCTION_0_1();
              v101 = v137;
              if (!*((_QWORD *)v137 + 2))
              {
                if (_MergedGlobals_4 != -1)
                  swift_once();
                if (v95 != 0x5664656E69666564 || v96 != 0xEC00000065756C61)
                {
                  v103 = qword_2550E49B0;
                  if ((OUTLINED_FUNCTION_21_0() & 1) == 0)
                  {
                    v104 = v95 == 1701667182 && v96 == 0xE400000000000000;
                    if (!v104 && (OUTLINED_FUNCTION_21_0() & 1) == 0)
                    {
                      v117 = 0;
                      while (1)
                      {
                        v118 = *(_QWORD *)(v103 + v117 + 64) == v95 && *(_QWORD *)(v103 + v117 + 72) == v96;
                        if (v118 || (OUTLINED_FUNCTION_21_0() & 1) != 0)
                          break;
                        v117 += 16;
                        if (v117 == 80)
                          goto LABEL_163;
                      }
                    }
                  }
                }
                swift_beginAccess();
                v96 = 0xE000000000000000;
                swift_bridgeObjectRelease();
                v95 = 0;
              }
LABEL_163:
              OUTLINED_FUNCTION_84_0();
              swift_retain();
              OUTLINED_FUNCTION_84_0();
              v139 = sub_21A3A67FC(v100, (uint64_t)v1, v95, v96);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
              OUTLINED_FUNCTION_46_17();
              v105 = OUTLINED_FUNCTION_22_16();
              v107 = v106;
              OUTLINED_FUNCTION_41_0();
              v108 = HIBYTE(v107) & 0xF;
              if ((v107 & 0x2000000000000000) == 0)
                v108 = v105 & 0xFFFFFFFFFFFFLL;
              if (v108)
              {
                *((_QWORD *)&v134 + 1) = &type metadata for StandardAttribute;
                v135 = &off_253E44468;
                v109 = (_QWORD *)OUTLINED_FUNCTION_28_1();
                *(_QWORD *)&v133 = v109;
                v109[2] = v95;
                v109[3] = v96;
                v109[4] = v105;
                v109[5] = v107;
                OUTLINED_FUNCTION_84_0();
              }
              else
              {
                v135 = 0;
                v133 = 0u;
                v134 = 0u;
                OUTLINED_FUNCTION_0_1();
              }
              OUTLINED_FUNCTION_204_0();
              swift_bridgeObjectRelease();
              v1 = v128;
              if (*((_QWORD *)&v134 + 1))
              {
                sub_21A2C4EE8(&v133, (uint64_t)v136);
                sub_21A2C7FE4((uint64_t)v136, (uint64_t)&v133);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v101 = sub_21A3A813C(0, *((_QWORD *)v101 + 2) + 1, 1, (uint64_t)v101);
                v116 = *((_QWORD *)v101 + 2);
                v115 = *((_QWORD *)v101 + 3);
                if (v116 >= v115 >> 1)
                {
                  v119 = OUTLINED_FUNCTION_74_15(v115);
                  v101 = sub_21A3A813C((char *)v119, v120, v121, (uint64_t)v101);
                }
                *((_QWORD *)v101 + 2) = v116 + 1;
                sub_21A2C4EE8(&v133, (uint64_t)&v101[40 * v116 + 32]);
                v137 = v101;
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v136);
              }
              else
              {
                sub_21A3A956C((uint64_t)&v133);
              }
              swift_bridgeObjectRelease();
              goto LABEL_180;
            }
            OUTLINED_FUNCTION_204_0();
          }
          OUTLINED_FUNCTION_0_1();
          v110 = sub_21A45092C();
          sub_21A2BD468();
          v111 = sub_21A33FEA4();
          if (os_log_type_enabled(v111, v110))
          {
            OUTLINED_FUNCTION_60_14();
            v112 = swift_slowAlloc();
            v136[0] = (char *)swift_slowAlloc();
            *(_DWORD *)v112 = 136315394;
            swift_beginAccess();
            OUTLINED_FUNCTION_145();
            *(_QWORD *)(v112 + 4) = sub_21A2BCCC4(v129, v130, (uint64_t *)v136);
            OUTLINED_FUNCTION_41_0();
            *(_WORD *)(v112 + 12) = 2080;
            v113 = sub_21A44ECDC();
            *(_QWORD *)(v112 + 14) = sub_21A2BCCC4(v113, v114, (uint64_t *)v136);
            swift_release_n();
            OUTLINED_FUNCTION_3_2();
            _os_log_impl(&dword_21A2A0000, v111, v110, "Cannot get values of attribute %s from %s", (uint8_t *)v112, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_2_0();
          }
          swift_bridgeObjectRelease();

LABEL_180:
          ++inited;
        }
        while (inited != v127);
      }
      swift_release();
      OUTLINED_FUNCTION_0_1();
LABEL_191:
      OUTLINED_FUNCTION_2_2();
      return;
    }
  }
  OUTLINED_FUNCTION_13_25();
  OUTLINED_FUNCTION_27_20();
  if (!v11)
  {
    OUTLINED_FUNCTION_30_2();
LABEL_30:
    v11 = v123;
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_89_0();
  OUTLINED_FUNCTION_62_11();
  OUTLINED_FUNCTION_6_27();
  OUTLINED_FUNCTION_32_14();
  if (v19)
    goto LABEL_196;
  v1 = v17;
  v20 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E43950);
  if ((OUTLINED_FUNCTION_15_27() & 1) == 0)
  {
LABEL_23:
    inited = (unint64_t)v136[0];
    if ((v20 & 1) != 0)
    {
      OUTLINED_FUNCTION_20_20();
      *v9 = &qword_2550E4000;
      v9[1] = v11;
    }
    else
    {
      OUTLINED_FUNCTION_0_33();
      if (v19)
        goto LABEL_200;
      *((_QWORD *)v136[0] + 2) = v22;
      OUTLINED_FUNCTION_89_0();
    }
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_56_17();
    v1 = v128;
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_21_26();
  OUTLINED_FUNCTION_30_17();
  if (v27)
  {
    v1 = v21;
    goto LABEL_23;
  }
LABEL_202:
  sub_21A450D94();
  __break(1u);
  swift_release();
  __break(1u);
}

void sub_21A3A613C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v23 - v11;
  if ((a2 & 0x2000000000000000) != 0)
    v13 = HIBYTE(a2) & 0xF;
  else
    v13 = a1 & 0xFFFFFFFFFFFFLL;
  v14 = OUTLINED_FUNCTION_44_14();
  v15 = v14;
  v17 = v16;
  if (v13)
  {
    OUTLINED_FUNCTION_86_0();
    v18 = HIBYTE(v17) & 0xF;
    if ((v17 & 0x2000000000000000) == 0)
      v18 = v15 & 0xFFFFFFFFFFFFLL;
    if (v18)
    {
      a1 = OUTLINED_FUNCTION_44_14();
      v17 = v19;
    }
    else
    {
      OUTLINED_FUNCTION_89_0();
      v17 = a2;
    }
  }
  else
  {
    a1 = v14;
  }
  if (a1 == OUTLINED_FUNCTION_44_14() && v17 == v20)
  {
    OUTLINED_FUNCTION_86_0();
  }
  else
  {
    v22 = OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_30_2();
    if ((v22 & 1) == 0)
    {
      (*(void (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
      (*(void (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(a4 + 16))(a1, v17, v12, a3, a4);
      OUTLINED_FUNCTION_2_2();
      return;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(v24, v5, a3);
  OUTLINED_FUNCTION_2_2();
  swift_bridgeObjectRelease();
}

uint64_t sub_21A3A62CC(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_21A2CCDB4(0, v1, 0);
    v3 = v20;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = v4[3];
      v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 40))(v5, v6);
      v9 = v8;
      v10 = sub_21A44ECDC();
      sub_21A3A6B94(v10, v11, v7, v9);
      v13 = v12;
      v15 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_21A2CCDB4(0, *(_QWORD *)(v20 + 16) + 1, 1);
      v17 = *(_QWORD *)(v20 + 16);
      v16 = *(_QWORD *)(v20 + 24);
      if (v17 >= v16 >> 1)
        sub_21A2CCDB4((char *)(v16 > 1), v17 + 1, 1);
      *(_QWORD *)(v20 + 16) = v17 + 1;
      v18 = v20 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v13;
      *(_QWORD *)(v18 + 40) = v15;
      v4 += 5;
      --v1;
    }
    while (v1);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21A3A6448(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19[5];
  uint64_t v20;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_21A2CCDB4(0, v4, 0);
    v7 = (_QWORD *)(a1 + 32);
    do
    {
      v8 = v7[3];
      v9 = v7[4];
      __swift_project_boxed_opaque_existential_1(v7, v8);
      v19[3] = v8;
      v19[4] = v9;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
      sub_21A3A613C(a2, a3, v8, v9, (uint64_t)boxed_opaque_existential_1);
      v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9);
      v13 = v12;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      v14 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21A2CCDB4(0, *(_QWORD *)(v14 + 16) + 1, 1);
        v14 = v20;
      }
      v16 = *(_QWORD *)(v14 + 16);
      v15 = *(_QWORD *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_21A2CCDB4((char *)(v15 > 1), v16 + 1, 1);
        v14 = v20;
      }
      *(_QWORD *)(v14 + 16) = v16 + 1;
      v17 = v14 + 16 * v16;
      *(_QWORD *)(v17 + 32) = v11;
      *(_QWORD *)(v17 + 40) = v13;
      v7 += 5;
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
  return v14;
}

uint64_t sub_21A3A65C8()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_21A3A65EC()
{
  qword_2550E49B0 = (uint64_t)&unk_24DCAAE10;
}

void sub_21A3A6600()
{
  qword_2550E49C0 = (uint64_t)&unk_24DCAAC20;
}

void sub_21A3A6614()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_2550E49B8 != -1)
    swift_once();
  v0 = (_QWORD *)qword_2550E49C0;
  OUTLINED_FUNCTION_7_0();
  v1 = sub_21A44ECDC();
  sub_21A2FE9F8(v1, v2, v0);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_21A3A6680(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  unint64_t v20;

  v18 = sub_21A4508F0();
  result = sub_21A3A9424(a1, v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v20;
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v9 = v8 | (v5 << 6);
  while (1)
  {
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_21A369414(&v17, v15, v16);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v10 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v10 >= v7)
      goto LABEL_21;
    v11 = *(_QWORD *)(v4 + 8 * v10);
    v12 = v5 + 1;
    if (!v11)
    {
      v12 = v5 + 2;
      if (v5 + 2 >= v7)
        goto LABEL_21;
      v11 = *(_QWORD *)(v4 + 8 * v12);
      if (!v11)
      {
        v12 = v5 + 3;
        if (v5 + 3 >= v7)
          goto LABEL_21;
        v11 = *(_QWORD *)(v4 + 8 * v12);
        if (!v11)
        {
          v12 = v5 + 4;
          if (v5 + 4 >= v7)
            goto LABEL_21;
          v11 = *(_QWORD *)(v4 + 8 * v12);
          if (!v11)
          {
            v12 = v5 + 5;
            if (v5 + 5 >= v7)
              goto LABEL_21;
            v11 = *(_QWORD *)(v4 + 8 * v12);
            if (!v11)
            {
              v13 = v5 + 6;
              while (v13 < v7)
              {
                v11 = *(_QWORD *)(v4 + 8 * v13++);
                if (v11)
                {
                  v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_21A3A67FC(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v21;

  if (a1 >> 62)
    goto LABEL_22;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v6)
  {
    v7 = HIBYTE(a4) & 0xF;
    v8 = (a4 & 0x2000000000000000) == 0;
    a4 = a1;
    if (v8)
      v7 = a3 & 0xFFFFFFFFFFFFLL;
    v21 = v7;
    a3 = MEMORY[0x24BEE4AF8];
    v9 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v10 = MEMORY[0x22074327C](v9 - 4, a4);
      }
      else
      {
        v10 = *(_QWORD *)(a4 + 8 * v9);
        swift_retain();
      }
      v11 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      sub_21A3A703C(v10, v21 == 0);
      v13 = v12;
      v15 = v14;
      swift_release();
      if (v15)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          a3 = (uint64_t)sub_21A2C4974(0, *(_QWORD *)(a3 + 16) + 1, 1, a3);
        v17 = *(_QWORD *)(a3 + 16);
        v16 = *(_QWORD *)(a3 + 24);
        if (v17 >= v16 >> 1)
          a3 = (uint64_t)sub_21A2C4974((char *)(v16 > 1), v17 + 1, 1, a3);
        *(_QWORD *)(a3 + 16) = v17 + 1;
        v18 = a3 + 16 * v17;
        *(_QWORD *)(v18 + 32) = v13;
        *(_QWORD *)(v18 + 40) = v15;
        a4 = a1;
      }
      ++v9;
      if (v11 == v6)
        goto LABEL_20;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    v6 = sub_21A450BE4();
  }
  a3 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a3;
}

uint64_t sub_21A3A69C0(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)sub_21A3A813C((char *)result, v7, 1, v3);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = sub_21A3A834C(v6 + 32, v2, v3 + 40 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_21A3A6A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  if (a1 == a3 && a2 == a4)
  {
    v15 = 1;
    return v15 & 1;
  }
  if ((OUTLINED_FUNCTION_21_0() & 1) != 0)
    goto LABEL_17;
  if (_MergedGlobals_4 != -1)
    swift_once();
  v7 = (_QWORD *)qword_2550E49B0;
  v8 = OUTLINED_FUNCTION_64_0();
  v10 = sub_21A3A71E8(v8, v9, v7);
  if ((v11 & 1) != 0)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = v10;
  v13 = sub_21A3A71E8(a3, a4, v7);
  if ((v14 & 1) != 0)
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_16;
LABEL_17:
    v15 = 1;
    return v15 & 1;
  }
  if (v12 == v13)
  {
LABEL_16:
    v15 = sub_21A450D64() ^ 1;
    return v15 & 1;
  }
  v15 = v12 < v13;
  return v15 & 1;
}

void sub_21A3A6B94(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E44570);
  v8 = OUTLINED_FUNCTION_52_17();
  *(_OWORD *)(v8 + 16) = xmmword_21A4600F0;
  OUTLINED_FUNCTION_88_4();
  sub_21A450758();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  *(_QWORD *)(v8 + 48) = a1;
  *(_QWORD *)(v8 + 56) = a2;
  OUTLINED_FUNCTION_88_4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9_0();
  if ((OUTLINED_FUNCTION_39_21() & 1) != 0)
  {
    OUTLINED_FUNCTION_70_0();
  }
  else
  {
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_9_0();
    v9 = OUTLINED_FUNCTION_39_21();
    OUTLINED_FUNCTION_70_0();
    if ((v9 & 1) == 0)
    {
      OUTLINED_FUNCTION_17_0();
      swift_setDeallocating();
      sub_21A32702C();
      OUTLINED_FUNCTION_7_0();
      goto LABEL_6;
    }
  }
  swift_setDeallocating();
  sub_21A32702C();
  OUTLINED_FUNCTION_7_0();
  v10 = sub_21A450704();
  OUTLINED_FUNCTION_17_0();
  v11 = sub_21A2FEABC(v10, a3, a4);
  MEMORY[0x220742DF0](v11);
  OUTLINED_FUNCTION_0_1();
LABEL_6:
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_9_27();
}

uint64_t sub_21A3A6CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38[2];
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;

  v4 = sub_21A3A5270();
  if (v4)
  {
    v5 = v4;
    if (*(_QWORD *)(v4 + 16) == 1)
    {
      OUTLINED_FUNCTION_145();
      sub_21A2C7FE4(v5 + 32, (uint64_t)&v35);
      v6 = v36;
      v7 = v37;
      __swift_project_boxed_opaque_existential_1(&v35, v36);
      v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
      v10 = v9;
      swift_bridgeObjectRelease();
      v11 = HIBYTE(v10) & 0xF;
      if ((v10 & 0x2000000000000000) == 0)
        v11 = v8 & 0xFFFFFFFFFFFFLL;
      if (!v11)
      {
        OUTLINED_FUNCTION_41_0();
        sub_21A2C4EE8(&v35, (uint64_t)v38);
        OUTLINED_FUNCTION_41_0();
        sub_21A2C4EE8(v38, (uint64_t)v39);
        v27 = v40;
        v28 = v41;
        __swift_project_boxed_opaque_existential_1(v39, v40);
        v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 40))(v27, v28);
        v31 = v30;
        v32 = sub_21A44ECDC();
        sub_21A3A6B94(v32, v33, v29, v31);
        OUTLINED_FUNCTION_13_0();
        OUTLINED_FUNCTION_70_0();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
        return OUTLINED_FUNCTION_29_5();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v35);
      OUTLINED_FUNCTION_41_0();
    }
    swift_retain();
    v12 = sub_21A3A62CC(v5);
    OUTLINED_FUNCTION_41_0();
    v39[0] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
    OUTLINED_FUNCTION_68_9();
    v13 = OUTLINED_FUNCTION_47_13();
    v15 = v14;
    OUTLINED_FUNCTION_86_0();
    if (a2)
    {
      v16 = a2;
    }
    else
    {
      sub_21A44ECDC();
      v18 = v17;
      v19 = OUTLINED_FUNCTION_31_16();
      sub_21A3A6B94(v19, v20, v21, v18);
      a1 = v22;
      v16 = v23;
      OUTLINED_FUNCTION_17_0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E446A0);
    v24 = OUTLINED_FUNCTION_28_1();
    *(_OWORD *)(v24 + 16) = xmmword_21A4600F0;
    v25 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
    v26 = sub_21A2E0AA0();
    *(_QWORD *)(v24 + 32) = a1;
    *(_QWORD *)(v24 + 40) = v16;
    *(_QWORD *)(v24 + 96) = v25;
    *(_QWORD *)(v24 + 104) = v26;
    *(_QWORD *)(v24 + 64) = v26;
    *(_QWORD *)(v24 + 72) = v13;
    *(_QWORD *)(v24 + 80) = v15;
    OUTLINED_FUNCTION_7_0();
    sub_21A45065C();
  }
  return OUTLINED_FUNCTION_29_5();
}

void sub_21A3A6EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_21A44ED30();
  OUTLINED_FUNCTION_39_3();
  v5 = sub_21A31A5B8(a1, a2, v4);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_13_0();
  if (!v5)
    goto LABEL_12;
  if (!(v5 >> 62))
  {
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_4;
LABEL_11:
    OUTLINED_FUNCTION_3_2();
LABEL_12:
    OUTLINED_FUNCTION_56();
    return;
  }
  OUTLINED_FUNCTION_7_0();
  v7 = sub_21A450BE4();
  OUTLINED_FUNCTION_3_2();
  if (v7 != 1)
    goto LABEL_11;
  OUTLINED_FUNCTION_7_0();
  v8 = sub_21A450BE4();
  OUTLINED_FUNCTION_3_2();
  if (!v8)
    goto LABEL_11;
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = MEMORY[0x22074327C](0, v5);
LABEL_7:
    OUTLINED_FUNCTION_3_2();
    if (v6)
    {
      sub_21A44ECF4();
      swift_release();
    }
    goto LABEL_12;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(_QWORD *)(v5 + 32);
    swift_retain();
    goto LABEL_7;
  }
  __break(1u);
}

void sub_21A3A6FF0()
{
  if (*(_QWORD *)(sub_21A44ED30() + 16))
    OUTLINED_FUNCTION_65_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_56();
}

void sub_21A3A703C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  char v23;
  char v24;
  _QWORD v25[2];

  v3 = v2;
  v5 = sub_21A44ECAC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v25 - v10;
  if (!sub_21A44ECF4())
    goto LABEL_8;
  sub_21A3A6614();
  if ((v12 & 1) != 0)
  {
    OUTLINED_FUNCTION_177_0();
    goto LABEL_11;
  }
  if ((a2 & 1) != 0)
  {
    sub_21A44ECDC();
    v14 = v13;
    v15 = OUTLINED_FUNCTION_31_16();
    sub_21A3A6B94(v15, v16, v17, v14);
    v3 = v18;
    v20 = v19;
    OUTLINED_FUNCTION_0_1();
    sub_21A3A6CB4(v3, v20);
    OUTLINED_FUNCTION_73_12();
    OUTLINED_FUNCTION_30_2();
  }
  else
  {
    sub_21A3A6CB4(0, 0);
    OUTLINED_FUNCTION_73_12();
  }
  OUTLINED_FUNCTION_177_0();
  if (!v3)
  {
LABEL_8:
    sub_21A44ED00();
    sub_21A44EC88();
    OUTLINED_FUNCTION_73_12();
    v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    v21(v11, v5);
    if (!v3)
    {
      sub_21A44ED00();
      v22 = sub_21A44EC7C();
      v24 = v23;
      v21(v9, v5);
      if ((v24 & 1) == 0)
      {
        v25[1] = v22;
        sub_21A450D40();
        OUTLINED_FUNCTION_73_12();
      }
    }
  }
LABEL_11:
  OUTLINED_FUNCTION_2_2();
}

uint64_t sub_21A3A71E8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_21A450D64() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_21A450D64();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

uint64_t sub_21A3A72CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_21A450758();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_64_0();
    sub_21A450758();
    OUTLINED_FUNCTION_3_2();
  }
  else
  {
    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_64_0();
}

void sub_21A3A7350(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a3 = nullsub_1(a1, a2);
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v6;
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A737C()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3A739C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21A3A73A8()
{
  uint64_t v0;

  return sub_21A3A72CC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

void sub_21A3A73B4(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)OUTLINED_FUNCTION_28_1();
  v2[3] = 0;
  v2[4] = 0xE000000000000000;
  v2[2] = a1;
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3A73E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v3 + 96))(a3);
}

uint64_t sub_21A3A7410()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)(v1 + 16))
    return 0;
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_65_8();
  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 16 * v2);
    OUTLINED_FUNCTION_39_3();
  }
  else
  {
    v4 = 0;
  }
  OUTLINED_FUNCTION_3_2();
  return v4;
}

uint64_t sub_21A3A7488()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21A3A74AC()
{
  sub_21A3A7488();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CompositeAttributeBase()
{
  return objc_opt_self();
}

void sub_21A3A74EC()
{
  qword_2550E49D0 = (uint64_t)&unk_24DCAAD00;
}

uint64_t sub_21A3A7500()
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
  unint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D5F88);
  v0 = OUTLINED_FUNCTION_52_17();
  *(_OWORD *)(v0 + 16) = xmmword_21A460C00;
  OUTLINED_FUNCTION_43_11();
  v1 = sub_21A3A7410();
  v3 = v2;
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  sub_21A3A76E4();
  v5 = v4;
  v7 = v6;
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v0 + 56) = v6;
  v8 = OUTLINED_FUNCTION_51_11();
  v10 = v9;
  *(_QWORD *)(v0 + 64) = v8;
  *(_QWORD *)(v0 + 72) = v9;
  if (!v3)
  {
    v14 = (char *)MEMORY[0x24BEE4AF8];
    if (!v7)
      goto LABEL_12;
    goto LABEL_7;
  }
  v11 = OUTLINED_FUNCTION_89_0();
  v14 = OUTLINED_FUNCTION_244_1(v11, v12, v13, MEMORY[0x24BEE4AF8]);
  v16 = *((_QWORD *)v14 + 2);
  v15 = *((_QWORD *)v14 + 3);
  if (v16 >= v15 >> 1)
    v14 = OUTLINED_FUNCTION_22_0((char *)(v15 > 1), v16 + 1);
  *((_QWORD *)v14 + 2) = v16 + 1;
  v17 = &v14[16 * v16];
  *((_QWORD *)v17 + 4) = v1;
  *((_QWORD *)v17 + 5) = v3;
  if (v7)
  {
LABEL_7:
    OUTLINED_FUNCTION_9_0();
    if ((OUTLINED_FUNCTION_67_13() & 1) == 0)
      v14 = OUTLINED_FUNCTION_22_0(0, *((_QWORD *)v14 + 2) + 1);
    v19 = *((_QWORD *)v14 + 2);
    v18 = *((_QWORD *)v14 + 3);
    if (v19 >= v18 >> 1)
      v14 = OUTLINED_FUNCTION_22_0((char *)(v18 > 1), v19 + 1);
    *((_QWORD *)v14 + 2) = v19 + 1;
    v20 = &v14[16 * v19];
    *((_QWORD *)v20 + 4) = v5;
    *((_QWORD *)v20 + 5) = v7;
  }
LABEL_12:
  if (v10)
  {
    OUTLINED_FUNCTION_18_0();
    if ((OUTLINED_FUNCTION_67_13() & 1) == 0)
      v14 = OUTLINED_FUNCTION_22_0(0, *((_QWORD *)v14 + 2) + 1);
    v22 = *((_QWORD *)v14 + 2);
    v21 = *((_QWORD *)v14 + 3);
    if (v22 >= v21 >> 1)
      v14 = OUTLINED_FUNCTION_22_0((char *)(v21 > 1), v22 + 1);
    *((_QWORD *)v14 + 2) = v22 + 1;
    v23 = &v14[16 * v22];
    *((_QWORD *)v23 + 4) = v8;
    *((_QWORD *)v23 + 5) = v10;
  }
  OUTLINED_FUNCTION_50_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
  OUTLINED_FUNCTION_46_17();
  OUTLINED_FUNCTION_22_16();
  OUTLINED_FUNCTION_70_0();
  return OUTLINED_FUNCTION_29_5();
}

void sub_21A3A76E4()
{
  char *v0;
  int64_t v1;
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
  unint64_t v13;
  char v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D5F88);
  v3 = OUTLINED_FUNCTION_52_17();
  *(_OWORD *)(v3 + 16) = xmmword_21A4600F0;
  v4 = sub_21A3A7410();
  v6 = v5;
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  OUTLINED_FUNCTION_42_15();
  v8 = sub_21A3A7410();
  v9 = v7;
  *(_QWORD *)(v3 + 48) = v8;
  *(_QWORD *)(v3 + 56) = v7;
  if (!v6)
  {
    v0 = (char *)MEMORY[0x24BEE4AF8];
    if (!v7)
      goto LABEL_12;
    goto LABEL_7;
  }
  v10 = OUTLINED_FUNCTION_145();
  OUTLINED_FUNCTION_244_1(v10, v11, v12, MEMORY[0x24BEE4AF8]);
  OUTLINED_FUNCTION_69_11();
  if (v14)
    v0 = OUTLINED_FUNCTION_83_0((char *)(v13 > 1), v1);
  *((_QWORD *)v0 + 2) = v1;
  v15 = &v0[16 * v2];
  *((_QWORD *)v15 + 4) = v4;
  *((_QWORD *)v15 + 5) = v6;
  if (v9)
  {
LABEL_7:
    OUTLINED_FUNCTION_18_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v0 = OUTLINED_FUNCTION_83_0(0, *((_QWORD *)v0 + 2) + 1);
    v17 = *((_QWORD *)v0 + 2);
    v16 = *((_QWORD *)v0 + 3);
    if (v17 >= v16 >> 1)
      v0 = OUTLINED_FUNCTION_83_0((char *)(v16 > 1), v17 + 1);
    *((_QWORD *)v0 + 2) = v17 + 1;
    v18 = &v0[16 * v17];
    *((_QWORD *)v18 + 4) = v8;
    *((_QWORD *)v18 + 5) = v9;
  }
LABEL_12:
  OUTLINED_FUNCTION_50_2();
  if (*((_QWORD *)v0 + 2))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
    OUTLINED_FUNCTION_46_17();
    sub_21A4505E4();
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_9_27();
}

uint64_t type metadata accessor for DateAttribute()
{
  return objc_opt_self();
}

void sub_21A3A7894(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = sub_21A3A73E4(a1, a2, *a3);
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A78B8()
{
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A78DC(uint64_t *a1@<X8>)
{
  *a1 = OUTLINED_FUNCTION_332_0();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A7900()
{
  sub_21A3A7500();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A791C()
{
  qword_2550E49E0 = (uint64_t)&unk_24DCAADB0;
}

uint64_t sub_21A3A7930()
{
  uint64_t result;

  result = sub_21A33223C((uint64_t)&unk_24DCAAD60);
  qword_2550E49F0 = result;
  return result;
}

uint64_t sub_21A3A7954()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D5F88);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21A460C00;
  v1 = OUTLINED_FUNCTION_51_11();
  if (v2)
    v3 = v1;
  else
    v3 = 12336;
  if (v2)
    v4 = v2;
  else
    v4 = 0xE200000000000000;
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v4;
  v5 = sub_21A3A7410();
  if (v6)
    v7 = v5;
  else
    v7 = 12336;
  if (v6)
    v8 = v6;
  else
    v8 = 0xE200000000000000;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v8;
  v9 = sub_21A3A7410();
  v11 = v10;
  v28 = v9;
  *(_QWORD *)(inited + 64) = v9;
  *(_QWORD *)(inited + 72) = v10;
  v12 = OUTLINED_FUNCTION_88_4();
  v15 = OUTLINED_FUNCTION_244_1(v12, v13, v14, MEMORY[0x24BEE4AF8]);
  v17 = *((_QWORD *)v15 + 2);
  v16 = *((_QWORD *)v15 + 3);
  v18 = v17 + 1;
  if (v17 >= v16 >> 1)
    v15 = OUTLINED_FUNCTION_22_0((char *)(v16 > 1), v17 + 1);
  *((_QWORD *)v15 + 2) = v18;
  v19 = &v15[16 * v17];
  *((_QWORD *)v19 + 4) = v3;
  *((_QWORD *)v19 + 5) = v4;
  v20 = *((_QWORD *)v15 + 3);
  OUTLINED_FUNCTION_145();
  if (v18 >= v20 >> 1)
    v15 = OUTLINED_FUNCTION_22_0((char *)(v20 > 1), v17 + 2);
  *((_QWORD *)v15 + 2) = v17 + 2;
  v21 = &v15[16 * v18];
  *((_QWORD *)v21 + 4) = v7;
  *((_QWORD *)v21 + 5) = v8;
  if (v11)
  {
    v22 = *((_QWORD *)v15 + 2);
    v23 = *((_QWORD *)v15 + 3);
    OUTLINED_FUNCTION_18_0();
    if (v22 >= v23 >> 1)
      v15 = OUTLINED_FUNCTION_22_0((char *)(v23 > 1), v22 + 1);
    *((_QWORD *)v15 + 2) = v22 + 1;
    v24 = &v15[16 * v22];
    *((_QWORD *)v24 + 4) = v28;
    *((_QWORD *)v24 + 5) = v11;
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
  OUTLINED_FUNCTION_68_9();
  v25 = sub_21A4505E4();
  OUTLINED_FUNCTION_70_0();
  sub_21A3A7410();
  if (v26)
  {
    sub_21A450758();
    OUTLINED_FUNCTION_3_2();
  }
  return v25;
}

uint64_t type metadata accessor for TimeAttribute()
{
  return objc_opt_self();
}

void sub_21A3A7B84()
{
  sub_21A3A7954();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A7BA0()
{
  qword_2550E4A00 = (uint64_t)&unk_24DCAACC0;
}

void sub_21A3A7BB4()
{
  char *v0;
  int64_t v1;
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
  unint64_t v13;
  char v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D5F88);
  v3 = OUTLINED_FUNCTION_52_17();
  *(_OWORD *)(v3 + 16) = xmmword_21A4600F0;
  v4 = OUTLINED_FUNCTION_51_11();
  v6 = v5;
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  v8 = OUTLINED_FUNCTION_51_11();
  v9 = v7;
  *(_QWORD *)(v3 + 48) = v8;
  *(_QWORD *)(v3 + 56) = v7;
  if (!v6)
  {
    v0 = (char *)MEMORY[0x24BEE4AF8];
    if (!v7)
      goto LABEL_12;
    goto LABEL_7;
  }
  v10 = OUTLINED_FUNCTION_145();
  OUTLINED_FUNCTION_244_1(v10, v11, v12, MEMORY[0x24BEE4AF8]);
  OUTLINED_FUNCTION_69_11();
  if (v14)
    v0 = OUTLINED_FUNCTION_83_0((char *)(v13 > 1), v1);
  *((_QWORD *)v0 + 2) = v1;
  v15 = &v0[16 * v2];
  *((_QWORD *)v15 + 4) = v4;
  *((_QWORD *)v15 + 5) = v6;
  if (v9)
  {
LABEL_7:
    OUTLINED_FUNCTION_18_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v0 = OUTLINED_FUNCTION_83_0(0, *((_QWORD *)v0 + 2) + 1);
    v17 = *((_QWORD *)v0 + 2);
    v16 = *((_QWORD *)v0 + 3);
    if (v17 >= v16 >> 1)
      v0 = OUTLINED_FUNCTION_83_0((char *)(v16 > 1), v17 + 1);
    *((_QWORD *)v0 + 2) = v17 + 1;
    v18 = &v0[16 * v17];
    *((_QWORD *)v18 + 4) = v8;
    *((_QWORD *)v18 + 5) = v9;
  }
LABEL_12:
  OUTLINED_FUNCTION_50_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
  OUTLINED_FUNCTION_46_17();
  OUTLINED_FUNCTION_22_16();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_9_27();
}

uint64_t type metadata accessor for DateTimeAttribute()
{
  return objc_opt_self();
}

void sub_21A3A7D2C()
{
  sub_21A3A7BB4();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3A7D48()
{
  qword_2550E4A10 = (uint64_t)&unk_24DCAAC70;
}

uint64_t sub_21A3A7D5C()
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
  int64_t v9;
  uint64_t result;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_55_13();
  v1 = sub_21A3A7410();
  if (v2)
  {
    v3 = v1;
    sub_21A3A7410();
    if (v4)
    {
      sub_21A450758();
      sub_21A450758();
      OUTLINED_FUNCTION_3_2();
      return v3;
    }
    OUTLINED_FUNCTION_13_0();
  }
  v6 = sub_21A3A7410();
  if (v7)
    return v6;
  v8 = *(_QWORD *)(v0 + 16);
  v9 = *(_QWORD *)(v8 + 16);
  if (!v9)
  {
LABEL_23:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D4B48);
    OUTLINED_FUNCTION_68_9();
    v5 = OUTLINED_FUNCTION_47_13();
    OUTLINED_FUNCTION_3_2();
    return v5;
  }
  v22 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_39_3();
  sub_21A2CCDB4(0, v9, 0);
  result = sub_21A3A945C(v8);
  if ((result & 0x8000000000000000) == 0)
  {
    v12 = result;
    if (result < 1 << *(_BYTE *)(v8 + 32))
    {
      v13 = v11;
      v14 = v8 + 64;
      while ((*(_QWORD *)(v14 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
      {
        if (v13 != *(_DWORD *)(v8 + 36))
          goto LABEL_26;
        v15 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v12);
        v19 = v9;
        v20 = *v15;
        v21 = v15[1];
        OUTLINED_FUNCTION_85_0();
        swift_bridgeObjectRetain();
        sub_21A450758();
        sub_21A450758();
        swift_bridgeObjectRelease();
        result = OUTLINED_FUNCTION_30_2();
        v16 = *(_QWORD *)(v22 + 16);
        v17 = *(_QWORD *)(v22 + 24);
        if (v16 >= v17 >> 1)
          result = (uint64_t)sub_21A2CCDB4((char *)(v17 > 1), v16 + 1, 1);
        *(_QWORD *)(v22 + 16) = v16 + 1;
        v18 = v22 + 16 * v16;
        *(_QWORD *)(v18 + 32) = v20;
        *(_QWORD *)(v18 + 40) = v21;
        if ((uint64_t)v12 >= -(-1 << *(_BYTE *)(v8 + 32)))
          goto LABEL_27;
        v14 = v8 + 64;
        if ((*(_QWORD *)(v8 + 64 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
          goto LABEL_28;
        if (v13 != *(_DWORD *)(v8 + 36))
          goto LABEL_29;
        result = sub_21A450AD0();
        v9 = v19 - 1;
        if (v19 == 1)
        {
          OUTLINED_FUNCTION_13_0();
          goto LABEL_23;
        }
        v12 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          v13 = *(_DWORD *)(v8 + 36);
          if (result < 1 << *(_BYTE *)(v8 + 32))
            continue;
        }
        goto LABEL_30;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DateTimeRageAttribute()
{
  return objc_opt_self();
}

void sub_21A3A8038()
{
  sub_21A3A7D5C();
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3A8054(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_21A450BCC();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_21A45086C();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_21A3A80EC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D7FF8);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

char *sub_21A3A813C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D8000);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_21A2C4BE0((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21A3A8230(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_21A3A8230(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550D8008);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21A450BFC();
  __break(1u);
  return result;
}

uint64_t sub_21A3A834C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (v3 = a1 + 40 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_21A450BFC();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D8008);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21A3A843C(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v5[2];

  v2 = *a1;
  swift_retain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21A37D958((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  swift_retain();
  sub_21A3A85BC(v5);
  *a1 = v2;
  swift_release_n();
  return swift_release();
}

_QWORD *sub_21A3A84DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E44570);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_21A39CFF0((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21A2E6A6C();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21A3A85BC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
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
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  unint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t result;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v3 = a1[1];
  swift_retain_n();
  v4 = sub_21A450D34();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
      {
        swift_retain();
        sub_21A3A8D7C(0, v3, 1, a1);
      }
      swift_release_n();
      return swift_release_n();
    }
    goto LABEL_132;
  }
  v5 = v4;
  v115 = v1;
  v107 = sub_21A3A8054(v3 / 2);
  v108 = v3;
  v110 = v6;
  v105 = a1;
  if (v3 <= 0)
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
    v44 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_96:
    if (v44 < 2)
    {
LABEL_107:
      swift_bridgeObjectRelease();
      if (v108 >= -1)
        goto LABEL_108;
      goto LABEL_137;
    }
    v93 = *v105;
    v117 = *v105;
    while (1)
    {
      v94 = v44 - 2;
      if (v44 < 2)
        break;
      if (!v93)
        goto LABEL_141;
      v95 = (uint64_t)v9;
      v96 = *(_QWORD *)&v9[16 * v94 + 32];
      v97 = *(_QWORD *)&v9[16 * v44 + 24];
      v98 = (char *)(v93 + 16 * v96);
      v99 = (char *)(v93 + 16 * *(_QWORD *)&v9[16 * v44 + 16]);
      v100 = v93 + 16 * v97;
      swift_retain();
      sub_21A3A8E9C(v98, v99, v100, v110);
      if (v115)
        goto LABEL_93;
      if (v97 < v96)
        goto LABEL_127;
      v9 = (char *)v95;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_21A2E6838(v95);
      if (v94 >= *((_QWORD *)v9 + 2))
        goto LABEL_128;
      v101 = &v9[16 * v94 + 32];
      *(_QWORD *)v101 = v96;
      *((_QWORD *)v101 + 1) = v97;
      v102 = *((_QWORD *)v9 + 2);
      if (v44 > v102)
        goto LABEL_129;
      memmove(&v9[16 * v44 + 16], &v9[16 * v44 + 32], 16 * (v102 - v44));
      *((_QWORD *)v9 + 2) = v102 - 1;
      v44 = v102 - 1;
      v93 = v117;
      if (v102 <= 2)
        goto LABEL_107;
    }
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
LABEL_138:
    swift_release_n();
    __break(1u);
LABEL_139:
    swift_release_n();
    __break(1u);
LABEL_140:
    swift_release_n();
    __break(1u);
LABEL_141:
    result = swift_release_n();
    __break(1u);
    return result;
  }
  v106 = v5;
  v7 = 0;
  v8 = *a1;
  v104 = *a1 + 40;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v10 = v3;
  v116 = *a1;
  while (1)
  {
    v11 = v7++;
    if (v7 < v10)
    {
      v12 = v9;
      v13 = (uint64_t *)(v8 + 16 * v7);
      v14 = *v13;
      v15 = v13[1];
      v16 = (uint64_t *)(v8 + 16 * v11);
      v17 = v10;
      v19 = *v16;
      v18 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20 = sub_21A3A6A9C(v14, v15, v19, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = v11 + 2;
      if (v11 + 2 < v17)
      {
        v21 = (uint64_t *)(v104 + 16 * v11);
        while (1)
        {
          v22 = *(v21 - 1);
          v23 = *v21;
          v24 = *(v21 - 3);
          v25 = *(v21 - 2);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          LODWORD(v24) = sub_21A3A6A9C(v22, v23, v24, v25);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (((v20 ^ v24) & 1) != 0)
            break;
          v21 += 2;
          if (++v7 >= v108)
          {
            v7 = v108;
            break;
          }
        }
        v8 = v116;
      }
      v9 = v12;
      if ((v20 & 1) == 0)
        goto LABEL_20;
      if (v7 < v11)
        goto LABEL_134;
      if (v11 < v7)
      {
        v26 = 16 * v7;
        v27 = 16 * v11;
        v28 = v7;
        v29 = v11;
        v10 = v108;
        do
        {
          if (v29 != --v28)
          {
            if (!v8)
              goto LABEL_140;
            v30 = v8 + v26;
            v31 = *(_QWORD *)(v8 + v27);
            v32 = *(_QWORD *)(v8 + v27 + 8);
            *(_OWORD *)(v8 + v27) = *(_OWORD *)(v8 + v26 - 16);
            *(_QWORD *)(v30 - 16) = v31;
            *(_QWORD *)(v30 - 8) = v32;
          }
          ++v29;
          v26 -= 16;
          v27 += 16;
        }
        while (v29 < v28);
      }
      else
      {
LABEL_20:
        v10 = v108;
      }
    }
    if (v7 < v10)
    {
      if (__OFSUB__(v7, v11))
        goto LABEL_131;
      if (v7 - v11 < v106)
      {
        v33 = v11 + v106;
        if (__OFADD__(v11, v106))
          goto LABEL_135;
        if (v33 >= v10)
          v33 = v10;
        if (v33 < v11)
          goto LABEL_136;
        if (v7 != v33)
        {
          v111 = v9;
          v113 = v33;
          v34 = (uint64_t *)(v8 + 16 * v7);
          do
          {
            v35 = (uint64_t *)(v8 + 16 * v7);
            v36 = *v35;
            v37 = v35[1];
            v38 = v11;
            v39 = v34;
            while (1)
            {
              v40 = *(v39 - 2);
              v41 = *(v39 - 1);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              LOBYTE(v40) = sub_21A3A6A9C(v36, v37, v40, v41);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v40 & 1) == 0)
                break;
              v8 = v116;
              if (!v116)
                goto LABEL_138;
              v36 = *v39;
              v37 = v39[1];
              *(_OWORD *)v39 = *((_OWORD *)v39 - 1);
              *(v39 - 1) = v37;
              *(v39 - 2) = v36;
              v39 -= 2;
              if (v7 == ++v38)
                goto LABEL_36;
            }
            v8 = v116;
LABEL_36:
            ++v7;
            v34 += 2;
          }
          while (v7 != v113);
          v7 = v113;
          v9 = v111;
        }
      }
    }
    if (v7 < v11)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_21A2E6744(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v43 = *((_QWORD *)v9 + 2);
    v42 = *((_QWORD *)v9 + 3);
    v44 = v43 + 1;
    if (v43 >= v42 >> 1)
      v9 = sub_21A2E6744((char *)(v42 > 1), v43 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v44;
    v45 = v9 + 32;
    v46 = &v9[16 * v43 + 32];
    *(_QWORD *)v46 = v11;
    *((_QWORD *)v46 + 1) = v7;
    if (v43)
      break;
    v44 = 1;
LABEL_87:
    v10 = v108;
    if (v7 >= v108)
      goto LABEL_96;
  }
  v109 = v7;
  while (1)
  {
    v47 = v44 - 1;
    if (v44 >= 4)
    {
      v52 = &v45[16 * v44];
      v53 = *((_QWORD *)v52 - 8);
      v54 = *((_QWORD *)v52 - 7);
      v58 = __OFSUB__(v54, v53);
      v55 = v54 - v53;
      if (v58)
        goto LABEL_115;
      v57 = *((_QWORD *)v52 - 6);
      v56 = *((_QWORD *)v52 - 5);
      v58 = __OFSUB__(v56, v57);
      v50 = v56 - v57;
      v51 = v58;
      if (v58)
        goto LABEL_116;
      v59 = v44 - 2;
      v60 = &v45[16 * v44 - 32];
      v62 = *(_QWORD *)v60;
      v61 = *((_QWORD *)v60 + 1);
      v58 = __OFSUB__(v61, v62);
      v63 = v61 - v62;
      if (v58)
        goto LABEL_117;
      v58 = __OFADD__(v50, v63);
      v64 = v50 + v63;
      if (v58)
        goto LABEL_119;
      if (v64 >= v55)
      {
        v82 = &v45[16 * v47];
        v84 = *(_QWORD *)v82;
        v83 = *((_QWORD *)v82 + 1);
        v58 = __OFSUB__(v83, v84);
        v85 = v83 - v84;
        if (v58)
          goto LABEL_125;
        v75 = v50 < v85;
        goto LABEL_76;
      }
    }
    else
    {
      if (v44 != 3)
      {
        v76 = *((_QWORD *)v9 + 4);
        v77 = *((_QWORD *)v9 + 5);
        v58 = __OFSUB__(v77, v76);
        v69 = v77 - v76;
        v70 = v58;
        goto LABEL_70;
      }
      v49 = *((_QWORD *)v9 + 4);
      v48 = *((_QWORD *)v9 + 5);
      v58 = __OFSUB__(v48, v49);
      v50 = v48 - v49;
      v51 = v58;
    }
    if ((v51 & 1) != 0)
      goto LABEL_118;
    v59 = v44 - 2;
    v65 = &v45[16 * v44 - 32];
    v67 = *(_QWORD *)v65;
    v66 = *((_QWORD *)v65 + 1);
    v68 = __OFSUB__(v66, v67);
    v69 = v66 - v67;
    v70 = v68;
    if (v68)
      goto LABEL_120;
    v71 = &v45[16 * v47];
    v73 = *(_QWORD *)v71;
    v72 = *((_QWORD *)v71 + 1);
    v58 = __OFSUB__(v72, v73);
    v74 = v72 - v73;
    if (v58)
      goto LABEL_122;
    if (__OFADD__(v69, v74))
      goto LABEL_124;
    if (v69 + v74 >= v50)
    {
      v75 = v50 < v74;
LABEL_76:
      if (v75)
        v47 = v59;
      goto LABEL_78;
    }
LABEL_70:
    if ((v70 & 1) != 0)
      goto LABEL_121;
    v78 = &v45[16 * v47];
    v80 = *(_QWORD *)v78;
    v79 = *((_QWORD *)v78 + 1);
    v58 = __OFSUB__(v79, v80);
    v81 = v79 - v80;
    if (v58)
      goto LABEL_123;
    if (v81 < v69)
      goto LABEL_87;
LABEL_78:
    v86 = v47 - 1;
    if (v47 - 1 >= v44)
    {
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
      goto LABEL_126;
    }
    if (!v8)
      goto LABEL_139;
    v87 = &v45[16 * v86];
    v88 = *(_QWORD *)v87;
    v89 = v47;
    v90 = &v45[16 * v47];
    v91 = *((_QWORD *)v90 + 1);
    v112 = (char *)(v8 + 16 * *(_QWORD *)v90);
    v114 = (char *)(v8 + 16 * *(_QWORD *)v87);
    swift_retain();
    sub_21A3A8E9C(v114, v112, v8 + 16 * v91, v110);
    if (v115)
      break;
    if (v91 < v88)
      goto LABEL_112;
    if (v89 > *((_QWORD *)v9 + 2))
      goto LABEL_113;
    *(_QWORD *)v87 = v88;
    v45 = v9 + 32;
    *(_QWORD *)&v9[16 * v86 + 40] = v91;
    v92 = *((_QWORD *)v9 + 2);
    if (v89 >= v92)
      goto LABEL_114;
    v115 = 0;
    v44 = v92 - 1;
    memmove(v90, v90 + 16, 16 * (v92 - 1 - v89));
    *((_QWORD *)v9 + 2) = v92 - 1;
    v8 = v116;
    v7 = v109;
    if (v92 <= 2)
      goto LABEL_87;
  }
LABEL_93:
  swift_bridgeObjectRelease();
  if (v108 < -1)
    goto LABEL_133;
LABEL_108:
  *(_QWORD *)(v107 + 16) = 0;
  swift_release_n();
  swift_bridgeObjectRelease();
  return swift_release_n();
}

uint64_t sub_21A3A8D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    swift_retain();
    v6 = (uint64_t *)(v5 + 16 * v4);
    while (2)
    {
      v7 = (uint64_t *)(v5 + 16 * v4);
      v8 = *v7;
      v9 = v7[1];
      v10 = a1;
      v11 = v6;
      do
      {
        v12 = *(v11 - 2);
        v13 = *(v11 - 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        LOBYTE(v12) = sub_21A3A6A9C(v8, v9, v12, v13);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
          break;
        if (!v5)
        {
          result = swift_release();
          __break(1u);
          return result;
        }
        v8 = *v11;
        v9 = v11[1];
        *(_OWORD *)v11 = *((_OWORD *)v11 - 1);
        *(v11 - 1) = v9;
        *(v11 - 2) = v8;
        v11 -= 2;
        ++v10;
      }
      while (v4 != v10);
      ++v4;
      v6 += 2;
      if (v4 != a2)
        continue;
      break;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21A3A8E9C(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  BOOL v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  char *__src;
  char *v34;

  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  swift_retain();
  __src = a4;
  if (v9 >= v11)
  {
    sub_21A2C4C6C(v6, v11, a4);
    v14 = &a4[16 * v11];
    if (v7 >= v6 || v10 < 16)
    {
      v16 = (uint64_t *)a4;
      v12 = &a4[16 * v11];
    }
    else
    {
      v24 = (char *)(a3 - 16);
      v12 = v14;
      do
      {
        v25 = *((_QWORD *)v12 - 2);
        v26 = *((_QWORD *)v12 - 1);
        v34 = v24 + 16;
        v28 = *((_QWORD *)v6 - 2);
        v29 = *((_QWORD *)v6 - 1);
        v27 = v6 - 16;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        LOBYTE(v28) = sub_21A3A6A9C(v25, v26, v28, v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
        {
          v30 = v34 != v6 || v24 >= v6;
          v6 -= 16;
        }
        else
        {
          v30 = v34 != v12 || v24 >= v12;
          v27 = v12 - 16;
          v12 -= 16;
        }
        v16 = (uint64_t *)__src;
        if (v30)
          *(_OWORD *)v24 = *(_OWORD *)v27;
        v24 -= 16;
      }
      while (v6 > v7 && v12 > __src);
    }
  }
  else
  {
    sub_21A2C4C6C(v7, v9, a4);
    v12 = &a4[16 * v9];
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      v16 = (uint64_t *)a4;
      while (1)
      {
        v17 = *(_QWORD *)v6;
        v18 = *((_QWORD *)v6 + 1);
        v19 = *v16;
        v20 = v16[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        LOBYTE(v19) = sub_21A3A6A9C(v17, v18, v19, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) != 0)
          break;
        v21 = v16;
        v22 = v7 == (char *)v16;
        v16 += 2;
        if (!v22)
          goto LABEL_19;
LABEL_20:
        v7 += 16;
        if (v16 >= (uint64_t *)v12 || (unint64_t)v6 >= a3)
        {
          v6 = v7;
          goto LABEL_42;
        }
      }
      v21 = v6;
      v22 = v7 == v6;
      v6 += 16;
      if (v22)
        goto LABEL_20;
LABEL_19:
      *(_OWORD *)v7 = *v21;
      goto LABEL_20;
    }
    v6 = v7;
    v16 = (uint64_t *)a4;
  }
LABEL_42:
  sub_21A2C4C6C((char *)v16, (v12 - (char *)v16) / 16, v6);
  swift_release_n();
  return 1;
}

uint64_t sub_21A3A90E0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_21A450DDC();
  swift_bridgeObjectRetain();
  sub_21A4505D8();
  v6 = sub_21A450E0C();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_21A450D64() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_21A450D64() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21A369A30();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_21A3A926C(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_21A3A926C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_21A450AC4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_21A450DDC();
        swift_bridgeObjectRetain();
        sub_21A4505D8();
        v10 = sub_21A450E0C();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= (uint64_t)v11)
          {
LABEL_15:
            v14 = *(_QWORD *)(v3 + 48);
            v15 = (_OWORD *)(v14 + 16 * v2);
            v16 = (_OWORD *)(v14 + 16 * v6);
            v17 = v2 != v6 || v15 >= v16 + 1;
            v2 = v6;
            if (v17)
            {
              *v15 = *v16;
              v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= (uint64_t)v11)
        {
          goto LABEL_15;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21A3A9424@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_21A3A945C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 64);
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
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_21A3A94DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D7FF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A3A9524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D7FF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A3A956C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D7FF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A3A95AC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t destroy for StandardAttribute()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void assignWithCopy for StandardAttribute(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_0();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_56();
}

ValueMetadata *type metadata accessor for StandardAttribute()
{
  return &type metadata for StandardAttribute;
}

void OUTLINED_FUNCTION_0_33()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  *(_QWORD *)(v2 + 8 * (v1 >> 6) + 64) |= 1 << v1;
  v6 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v1);
  *v6 = v4;
  v6[1] = v3;
  v7 = (_QWORD *)(*(_QWORD *)(v2 + 56) + 16 * v1);
  *v7 = v0;
  v7[1] = v5;
}

unint64_t OUTLINED_FUNCTION_6_27()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21A2CCFF8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21A3A90E0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_25()
{
  return sub_21A3A6CB4(0, 0);
}

uint64_t OUTLINED_FUNCTION_15_27()
{
  return sub_21A450BB4();
}

void OUTLINED_FUNCTION_19_24()
{
  sub_21A3A6FF0();
}

uint64_t OUTLINED_FUNCTION_20_20()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_21_26()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21A2CCFF8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_22_16()
{
  return sub_21A4505E4();
}

void OUTLINED_FUNCTION_23_16()
{
  uint64_t v0;
  uint64_t v1;

  sub_21A3A6EF4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27_20()
{
  return swift_release();
}

double OUTLINED_FUNCTION_28_21@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_31_16()
{
  return 0x6E6F6D6D6F63;
}

uint64_t OUTLINED_FUNCTION_39_21()
{
  return sub_21A4507D0();
}

uint64_t OUTLINED_FUNCTION_42_15()
{
  return 0x6E6F4D664F796164;
}

uint64_t OUTLINED_FUNCTION_43_11()
{
  return 0x656557664F796164;
}

uint64_t OUTLINED_FUNCTION_44_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

unint64_t OUTLINED_FUNCTION_46_17()
{
  return sub_21A2CD38C();
}

uint64_t OUTLINED_FUNCTION_47_13()
{
  return sub_21A4505E4();
}

uint64_t OUTLINED_FUNCTION_48_15()
{
  uint64_t v0;

  return sub_21A3A7870(v0);
}

uint64_t OUTLINED_FUNCTION_51_11()
{
  return sub_21A3A7410();
}

uint64_t OUTLINED_FUNCTION_52_17()
{
  return swift_initStackObject();
}

uint64_t OUTLINED_FUNCTION_53_16()
{
  return sub_21A44ECDC();
}

uint64_t OUTLINED_FUNCTION_54_15()
{
  return sub_21A44ED30();
}

uint64_t OUTLINED_FUNCTION_55_13()
{
  return 0x7472617473;
}

uint64_t OUTLINED_FUNCTION_56_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_60_14()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_62_11()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t OUTLINED_FUNCTION_65_8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21A2CCFF8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_67_13()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t OUTLINED_FUNCTION_68_9()
{
  return sub_21A2CD38C();
}

BOOL OUTLINED_FUNCTION_74_15@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_21A3A9934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int EnumCaseMultiPayload;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v32;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;

  v2 = type metadata accessor for NLRouterSiriXParse(0);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  v5 = v4 - v3;
  v6 = type metadata accessor for NLRouterActionCandidate(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_0();
  v10 = v9 - v8;
  v11 = sub_21A4501A0();
  v37 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_0();
  v14 = v13 - v12;
  sub_21A2BBC08(0, (unint64_t *)&qword_253E44690);
  v15 = sub_21A33FEA4();
  v36 = v14;
  sub_21A33FF0C((uint64_t)"HeuristicRules.NLParseRule", 26, 2, v15);

  sub_21A2BBC08(0, &qword_2550D47D0);
  sub_21A2EBCF4();
  if ((v16 & 1) == 0)
  {
    sub_21A450920();
    v24 = sub_21A33FEA4();
    sub_21A450164();

    v25 = OUTLINED_FUNCTION_4();
    v26 = a2;
    v27 = 1;
LABEL_11:
    __swift_storeEnumTagSinglePayload(v26, v27, 1, v25);
    goto LABEL_12;
  }
  v17 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for NLRouterServiceRequest(0) + 28));
  if (!v17)
  {
    v28 = sub_21A44F2C4();
    OUTLINED_FUNCTION_100_3(a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104));
    v26 = a2;
    v27 = 0;
    v25 = v28;
    goto LABEL_11;
  }
  v34 = v11;
  v18 = *(_QWORD *)(v17 + 16);
  if (!v18)
  {
LABEL_8:
    v23 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_100_3(a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104));
    __swift_storeEnumTagSinglePayload(a2, 0, 1, v23);
    v11 = v34;
LABEL_12:
    v29 = v37;
    goto LABEL_13;
  }
  v19 = v10 + *(int *)(v6 + 20);
  v20 = v17 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v21 = *(_QWORD *)(v7 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_21A2BBC40(v20, v10, type metadata accessor for NLRouterActionCandidate);
    sub_21A2BBC40(v19, v5, type metadata accessor for NLRouterSiriXParse);
    sub_21A2BBCC8(v10, type metadata accessor for NLRouterActionCandidate);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 2)
      break;
    v20 += v21;
    if (!--v18)
    {
      OUTLINED_FUNCTION_3_31();
      goto LABEL_8;
    }
  }
  if (EnumCaseMultiPayload)
  {
    OUTLINED_FUNCTION_3_31();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_3_31();
    sub_21A2BBCC8(v5, type metadata accessor for NLRouterSiriXParse);
  }
  v11 = v34;
  v29 = v37;
  v32 = OUTLINED_FUNCTION_4();
  __swift_storeEnumTagSinglePayload(a2, 1, 1, v32);
LABEL_13:
  v30 = sub_21A33FEA4();
  sub_21A33FF68(v36, (uint64_t)"HeuristicRules.NLParseRule", 26, 2, (uint64_t)v30);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v36, v11);
}

ValueMetadata *type metadata accessor for NLParseRule()
{
  return &type metadata for NLParseRule;
}

uint64_t OUTLINED_FUNCTION_3_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t CDMClient.setup(with:serviceStateDirectory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v5 = sub_21A44C690();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = OUTLINED_FUNCTION_34_12();
  v4[22] = swift_task_alloc();
  v6 = sub_21A44C408();
  v4[23] = v6;
  v4[24] = *(_QWORD *)(v6 - 8);
  v4[25] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E44580);
  v4[26] = OUTLINED_FUNCTION_3_4();
  v7 = sub_21A44C4B0();
  v4[27] = v7;
  v4[28] = *(_QWORD *)(v7 - 8);
  v4[29] = OUTLINED_FUNCTION_34_12();
  v4[30] = swift_task_alloc();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_21A3A9D64()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  if (v0[17])
  {
    v1 = v0[29];
    v27 = v0[28];
    v25 = v0[27];
    v2 = v0[25];
    v4 = v0[23];
    v3 = v0[24];
    __swift_storeEnumTagSinglePayload(v0[26], 1, 1, v25);
    OUTLINED_FUNCTION_6_28();
    swift_bridgeObjectRetain();
    sub_21A44C480();
    OUTLINED_FUNCTION_6_28();
    sub_21A2CD418();
    sub_21A44C48C();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v1, v25);
    v5 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    sub_21A44C45C();
    v6 = (void *)sub_21A450620();
    swift_bridgeObjectRelease();
    LODWORD(v1) = objc_msgSend(v5, sel_fileExistsAtPath_, v6);

    if ((_DWORD)v1)
    {
      v7 = sub_21A450608();
      v10 = v9;
      v11 = v7;
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    OUTLINED_FUNCTION_7_21();
    v26 = v0[17];
    v8 = v10;
  }
  else
  {
    v26 = 0;
    v11 = 0;
    v8 = 0;
  }
  v12 = v0[21];
  v13 = v0[22];
  v15 = v0[19];
  v14 = v0[20];
  v28 = (void *)v0[18];
  v16 = v0[16];
  sub_21A44DEB4();
  sub_21A44C5F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v13, v15);
  v17 = objc_msgSend((id)objc_opt_self(), sel_graphNameForSsuInference);
  v18 = sub_21A450644();
  v20 = v19;

  v21 = objc_allocWithZone((Class)CDMClientSetup);
  swift_bridgeObjectRetain();
  v0[31] = sub_21A3AA684(v12, v11, v8, v18, v20, 0, 0, 0, v16, v26);
  v0[2] = v0;
  v0[3] = sub_21A3AA070;
  v22 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v23 = v0 + 10;
  v23[1] = 0x40000000;
  v23[2] = sub_21A2E7000;
  v23[3] = &block_descriptor_11;
  v23[4] = v22;
  OUTLINED_FUNCTION_15_28(v28, sel_setup_completionHandler_);
  return swift_continuation_await();
}

uint64_t sub_21A3AA070()
{
  OUTLINED_FUNCTION_3_32();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_21A3AA0AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_81_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_6();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_57_8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A3AA134()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 160);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_81_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_6();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_57_8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CDMClient.processSsuInferenceRequest(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[27] = a2;
  v3[28] = v2;
  v3[26] = a1;
  sub_21A44FC60();
  v3[29] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_21A3AA208()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t v16;
  id v17;

  sub_21A44DEC0();
  sub_21A2C0778(&qword_2550D8020, (uint64_t (*)(uint64_t))MEMORY[0x24BE9DF08], MEMORY[0x24BE9DF00]);
  v1 = sub_21A44FCA8();
  *(_QWORD *)(v0 + 240) = 0;
  v2 = v1;
  v4 = v3;
  v5 = objc_allocWithZone(MEMORY[0x24BE9E108]);
  v6 = sub_21A303D2C(v2, v4);
  *(_QWORD *)(v0 + 248) = v6;
  if (v6)
  {
    v7 = *(void **)(v0 + 224);
    *(_QWORD *)(v0 + 56) = v0 + 200;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21A3AA424;
    v8 = swift_continuation_init();
    *(_QWORD *)(v0 + 160) = MEMORY[0x24BDAC760];
    v9 = (_QWORD *)(v0 + 160);
    v9[1] = 0x40000000;
    v9[2] = sub_21A2E7440;
    v9[3] = &block_descriptor_2_0;
    v9[4] = v8;
    OUTLINED_FUNCTION_15_28(v7, sel_processSsuInferenceRequest_completionHandler_);
    return swift_continuation_await();
  }
  else
  {
    v11 = sub_21A450644();
    v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550D6FF8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21A4600E0;
    *(_QWORD *)(inited + 32) = sub_21A450644();
    *(_QWORD *)(inited + 40) = v15;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD000000000000049;
    *(_QWORD *)(inited + 56) = 0x800000021A4732B0;
    v16 = sub_21A4505A8();
    v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    sub_21A2E9DE0(v11, v13, 1, v16);
    swift_willThrow();
    OUTLINED_FUNCTION_11_25();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21A3AA424()
{
  OUTLINED_FUNCTION_3_32();
  OUTLINED_FUNCTION_7_2();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_21A3AA460()
{
  uint64_t v0;
  id v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;

  v1 = *(id *)(v0 + 200);
  result = sub_21A2E76D0(v1);
  if (v3 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 240);
    sub_21A44DECC();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE9DF18];
    sub_21A44FC54();
    sub_21A2C0778(&qword_2550D8028, v5, MEMORY[0x24BE9DF10]);
    sub_21A44FC9C();
    v6 = *(void **)(v0 + 248);

    if (v4)
      OUTLINED_FUNCTION_11_25();
    else
      OUTLINED_FUNCTION_8_1();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_21A3AA574()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 248);
  swift_willThrow();

  OUTLINED_FUNCTION_11_25();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21A3AA5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21A2E7920;
  return CDMClient.setup(with:serviceStateDirectory:)(a1, a2, a3);
}

uint64_t sub_21A3AA620(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21A2E754C;
  return CDMClient.processSsuInferenceRequest(with:)(a1, a2);
}

id sub_21A3AA684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  void *v11;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;

  v11 = v10;
  v17 = (void *)sub_21A44C648();
  if (a3)
  {
    v18 = (void *)sub_21A450620();
    swift_bridgeObjectRelease();
    if (a5)
      goto LABEL_3;
LABEL_6:
    v19 = 0;
    if (a7)
      goto LABEL_4;
    goto LABEL_7;
  }
  v18 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v19 = (void *)sub_21A450620();
  swift_bridgeObjectRelease();
  if (a7)
  {
LABEL_4:
    v20 = (void *)sub_21A450620();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  v20 = 0;
LABEL_8:
  if (!a8)
  {
    v21 = 0;
    if (a10)
      goto LABEL_10;
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  sub_21A3AA924();
  v21 = (void *)sub_21A450830();
  swift_bridgeObjectRelease();
  if (!a10)
    goto LABEL_12;
LABEL_10:
  v22 = (void *)sub_21A450620();
  swift_bridgeObjectRelease();
LABEL_13:
  v23 = objc_msgSend(v11, sel_initWithLocaleIdentifier_sandboxId_activeServiceGraph_assetDirPath_overrideSiriVocabSpans_serviceStateDirectory_, v17, v18, v19, v20, v21, v22);

  v24 = sub_21A44C690();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a1, v24);
  return v23;
}

uint64_t dispatch thunk of CDMSsuInferenceClient.setup(with:serviceStateDirectory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 8) + *(_QWORD *)(a5 + 8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_21A2E7920;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CDMSsuInferenceClient.processSsuInferenceRequest(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21A2E754C;
  return v11(a1, a2, a3, a4);
}

unint64_t sub_21A3AA924()
{
  unint64_t result;

  result = qword_2550D5BA0;
  if (!qword_2550D5BA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2550D5BA0);
  }
  return result;
}

void OUTLINED_FUNCTION_3_32()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *v0;
  v3 = (uint64_t *)(v1 - 8);
  *v3 = *v0;
  *v3 = *v0;
  *(_QWORD *)(v2 + 256) = *(_QWORD *)(v2 + 48);
}

uint64_t OUTLINED_FUNCTION_6_28()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_7_21()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, _QWORD);

  return v1(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 216));
}

uint64_t OUTLINED_FUNCTION_11_25()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_15_28(id a1, SEL a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(a1, a2, v2, v3);
}

uint64_t sub_21A3AA9B0()
{
  unint64_t v0;

  v0 = sub_21A450C14();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_21A3AA9F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21A3AAA28 + 4 * byte_21A4671D8[a1]))(0x454E4F4850, 0xE500000000000000);
}

uint64_t sub_21A3AAA28()
{
  return 4473168;
}

uint64_t sub_21A3AAA38()
{
  return 0x4E414D4553524F48;
}

uint64_t sub_21A3AAA50()
{
  return 1398097242;
}

uint64_t sub_21A3AAA60()
{
  return 0x4F454D4143;
}

uint64_t sub_21A3AAA70()
{
  return 0x4843544157;
}

uint64_t sub_21A3AAA80()
{
  return 5390659;
}

uint64_t sub_21A3AAA90()
{
  return 0x544952414752414DLL;
}

uint64_t sub_21A3AAAAC()
{
  return 0x6E776F6E6B6E75;
}

void sub_21A3AAAC4(char *a1)
{
  sub_21A3AAAD0(*a1);
}

void sub_21A3AAAD0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21A3AAB18(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21A3AABD0 + 4 * byte_21A4671EA[a2]))(4473168);
}

uint64_t sub_21A3AABD0(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 4473168 && v1 == 0xE300000000000000)
    v3 = 1;
  else
    v3 = sub_21A450D64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_21A3AACB8()
{
  unsigned __int8 *v0;

  return sub_21A3AACC0(*v0);
}

uint64_t sub_21A3AACC0(unsigned __int8 a1)
{
  sub_21A450DDC();
  sub_21A3AA9F8(a1);
  sub_21A4505D8();
  swift_bridgeObjectRelease();
  return sub_21A450E0C();
}

void sub_21A3AAD20(uint64_t a1)
{
  char *v1;

  sub_21A3AAD28(a1, *v1);
}

void sub_21A3AAD28(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21A3AAD64()
{
  sub_21A4505D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A3AAE14(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_21A3AAE1C(a1, *v1);
}

uint64_t sub_21A3AAE1C(uint64_t a1, unsigned __int8 a2)
{
  sub_21A450DDC();
  sub_21A3AA9F8(a2);
  sub_21A4505D8();
  swift_bridgeObjectRelease();
  return sub_21A450E0C();
}

void sub_21A3AAE78(_BYTE *a1@<X8>)
{
  *a1 = sub_21A3AA9B0();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3AAEA0(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_21A3AA9F8(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_60_0();
}

double sub_21A3AAEC4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (void *)sub_21A450620();
  v7 = MGCopyAnswerWithError();

  if (v7)
  {
    *(_QWORD *)(a3 + 24) = swift_getObjectType();
    *(_QWORD *)a3 = v7;
  }
  else
  {
    sub_21A45092C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E446A0);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_21A4600F0;
    v10 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
    v11 = sub_21A2E0AA0();
    *(_QWORD *)(v9 + 64) = v11;
    *(_QWORD *)(v9 + 32) = a1;
    *(_QWORD *)(v9 + 40) = a2;
    swift_bridgeObjectRetain();
    v12 = sub_21A450D40();
    *(_QWORD *)(v9 + 96) = v10;
    *(_QWORD *)(v9 + 104) = v11;
    *(_QWORD *)(v9 + 72) = v12;
    *(_QWORD *)(v9 + 80) = v13;
    sub_21A2BD468();
    v14 = (void *)sub_21A4509F8();
    sub_21A450164();
    swift_bridgeObjectRelease();

    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t static MobileGestalt.buildVersion.getter()
{
  return sub_21A3AB108(0x726556646C697542, 0xEC0000006E6F6973);
}

uint64_t static MobileGestalt.osVersion.getter()
{
  return sub_21A3AB108(0x56746375646F7250, 0xEE006E6F69737265);
}

uint64_t sub_21A3AB108(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v4[24];
  uint64_t v5;

  sub_21A3AAEC4(a1, a2, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast())
      return v3;
  }
  else
  {
    sub_21A2BBD04((uint64_t)v4);
  }
  return 0;
}

unint64_t sub_21A3AB174()
{
  unint64_t result;

  result = qword_2550D8050;
  if (!qword_2550D8050)
  {
    result = MEMORY[0x220744A58](&unk_21A467210, &unk_24DCAB1A0);
    atomic_store(result, (unint64_t *)&qword_2550D8050);
  }
  return result;
}

unint64_t sub_21A3AB1B4()
{
  unint64_t result;

  result = qword_2550D8058;
  if (!qword_2550D8058)
  {
    result = MEMORY[0x220744A58](&unk_21A4672B0, &unk_24DCAB230);
    atomic_store(result, (unint64_t *)&qword_2550D8058);
  }
  return result;
}

void type metadata accessor for MobileGestalt()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3AB1FC(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 8) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_21A3AB284(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_21A3AB2D0 + 4 * byte_21A467201[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_21A3AB304 + 4 * byte_21A4671FC[v4]))();
}

uint64_t sub_21A3AB304(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A3AB30C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3AB314);
  return result;
}

uint64_t sub_21A3AB320(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3AB328);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_21A3AB32C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A3AB334(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MobileGestalt.DeviceClass()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3AB34C(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_21A3AB3D4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A3AB420 + 4 * byte_21A46720B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21A3AB454 + 4 * byte_21A467206[v4]))();
}

uint64_t sub_21A3AB454(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A3AB45C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A3AB464);
  return result;
}

uint64_t sub_21A3AB470(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A3AB478);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21A3AB47C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A3AB484(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MobileGestalt.DevicePlatform()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_21A3AB49C()
{
  OUTLINED_FUNCTION_1_4();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21A3AB4C8(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_2();
  *(_QWORD *)(v1 + 104) = a1;
  return swift_bridgeObjectRelease();
}

void sub_21A3AB508()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3AB53C()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 80))
    OUTLINED_FUNCTION_18_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3AB57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 *a8, uint64_t a9)
{
  uint64_t v16;

  v16 = swift_allocObject();
  sub_21A3AB61C(v16, a2, a3, a4, a5, a6, a7, a8, a9);
  return v16;
}

_QWORD *sub_21A3AB61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 *a8, uint64_t a9)
{
  _QWORD *v9;

  swift_bridgeObjectRelease();
  sub_21A44F414();
  v9[13] = sub_21A4505A8();
  sub_21A2C7FE4((uint64_t)a8, (uint64_t)(v9 + 2));
  v9[7] = a5;
  v9[8] = a6;
  v9[9] = a3;
  v9[10] = a4;
  v9[11] = a7;
  OUTLINED_FUNCTION_0_2();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v9 + 2));
  sub_21A2C4EE8(a8, (uint64_t)(v9 + 2));
  swift_endAccess();
  v9[12] = a9;
  return v9;
}

void sub_21A3AB6FC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD);
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  id v30;
  void (*v31)(uint64_t, uint8_t *);
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(void);
  uint64_t v47;
  os_log_type_t v48;
  _WORD *v49;
  const char *v50;
  os_log_type_t v51;
  _WORD *v52;
  os_log_type_t v53;
  _WORD *v54;
  _QWORD v55[6];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_QWORD);
  uint64_t v64;
  Class isa;
  NSObject *v66;
  _QWORD v67[3];
  uint64_t v68;

  OUTLINED_FUNCTION_24_0();
  v59 = v0;
  v2 = v1;
  v3 = sub_21A44C5E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21A44DE0C();
  v61 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6();
  v60 = v9;
  OUTLINED_FUNCTION_42();
  v10 = sub_21A44F90C();
  isa = v10[-1].isa;
  v66 = v10;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6();
  v64 = v12;
  OUTLINED_FUNCTION_42();
  v13 = (uint8_t *)sub_21A4501B8();
  v14 = *((_QWORD *)v13 - 1);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_0();
  v58 = v15;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_94_0();
  v56 = v17;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_94_0();
  v57 = v19;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v20);
  v21 = OUTLINED_FUNCTION_24_14();
  v22 = *(void (**)(_QWORD))(v14 + 16);
  v62 = v21;
  v63 = v22;
  v22(v0);
  v23 = v2;
  v24 = sub_21A4501AC();
  v25 = sub_21A450920();
  if (os_log_type_enabled(v24, v25))
  {
    v55[2] = v13;
    v26 = OUTLINED_FUNCTION_16_0();
    v55[5] = v3;
    v27 = (uint8_t *)v26;
    v28 = OUTLINED_FUNCTION_16_0();
    v55[4] = v7;
    v55[0] = v28;
    v55[3] = v4;
    *(_DWORD *)v27 = 138412290;
    v67[0] = v23;
    v29 = v23;
    v55[1] = v14;
    v30 = v29;
    sub_21A450A34();
    *(_QWORD *)v55[0] = v23;

    OUTLINED_FUNCTION_16_3(&dword_21A2A0000, v24, v25, "NLRequestProcessor received message: %@", v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E43940);
    OUTLINED_FUNCTION_67_0();
    OUTLINED_FUNCTION_2_0();
  }

  v31 = *(void (**)(uint64_t, uint8_t *))(v14 + 8);
  v31(v0, v13);
  v32 = v64;
  v33 = v23;
  sub_21A44F3F0();
  v34 = v32;
  v35 = v66;
  v36 = (*((uint64_t (**)(uint64_t, NSObject *))isa + 11))(v34, v66);
  if (v36 == *MEMORY[0x24BE9B390])
  {
    v33 = v23;
    v35 = sub_21A44F3FC();
    swift_bridgeObjectRelease();
    if (v35)
    {
      v37 = v60;
      v38 = v59 + 16;
      (*(void (**)(_QWORD, id))(*(_QWORD *)v59 + 224))(MEMORY[0x24BEE4AF8], v23);
      OUTLINED_FUNCTION_1_4();
      sub_21A2C7FE4(v38, (uint64_t)v67);
      __swift_project_boxed_opaque_existential_1(v67, v68);
      sub_21A44F660();
      sub_21A44F648();
      OUTLINED_FUNCTION_48_16();
      v39();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_37_5((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v37, v7);
LABEL_10:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v67);
LABEL_20:
      OUTLINED_FUNCTION_2_2();
      return;
    }
    v47 = v57;
    OUTLINED_FUNCTION_10_28();
    OUTLINED_FUNCTION_200_0();
    v51 = OUTLINED_FUNCTION_26_9();
    if (OUTLINED_FUNCTION_43_2(v51))
    {
      v52 = (_WORD *)OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_35_15(v52);
      v50 = "Unexpected DictationAsrResultMessage content. resultType is partial but speechTokens is nil";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v36 == *MEMORY[0x24BE9B380])
  {
    v33 = v23;
    v40 = sub_21A44F408();
    if (!v40)
    {
      v47 = v56;
      OUTLINED_FUNCTION_10_28();
      OUTLINED_FUNCTION_200_0();
      v53 = OUTLINED_FUNCTION_26_9();
      if (OUTLINED_FUNCTION_43_2(v53))
      {
        v54 = (_WORD *)OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_35_15(v54);
        v50 = "Unexpected DictationAsrResultMessage content. resultType is final but speechPackage is final";
LABEL_18:
        OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v35, v33, v50, v13);
        OUTLINED_FUNCTION_2_0();
      }
LABEL_19:

      v31(v47, v13);
      goto LABEL_20;
    }
    v66 = v40;
    v41 = -[NSObject recognition](v40, sel_recognition);
    if (v41)
    {
      v42 = v41;
      v43 = AFSpeechRecognition.toNLXAsrHypotheses()();

      v44 = v60;
      v45 = v59 + 16;
      (*(void (**)(uint64_t, id))(*(_QWORD *)v59 + 224))(v43, v23);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_1_4();
      sub_21A2C7FE4(v45, (uint64_t)v67);
      __swift_project_boxed_opaque_existential_1(v67, v68);
      sub_21A44F660();
      sub_21A44F648();
      OUTLINED_FUNCTION_48_16();
      v46();

      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_37_5((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v44, v7);
      goto LABEL_10;
    }
    __break(1u);
  }
  else if (v36 == *MEMORY[0x24BE9B388])
  {
    v47 = v58;
    OUTLINED_FUNCTION_10_28();
    v35 = OUTLINED_FUNCTION_200_0();
    v48 = sub_21A450920();
    if (OUTLINED_FUNCTION_43_2(v48))
    {
      v49 = (_WORD *)OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_35_15(v49);
      v50 = "Recieved final result candidate do not process as of now";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  sub_21A450D58();
  __break(1u);
}

void sub_21A3ABC90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  id v15;
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
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t *, uint64_t, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  id v67;
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
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85[5];
  uint64_t v86[2];

  OUTLINED_FUNCTION_24_0();
  v81 = v0;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_17_2();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_46_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_94_0();
  v75 = v8;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_50_0();
  v74 = v10;
  OUTLINED_FUNCTION_42();
  v80 = sub_21A44CCE4();
  v78 = *(_QWORD *)(v80 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6();
  v79 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E43730);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_25_0();
  v14 = sub_21A44CCCC();
  v15 = *(id *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_28();
  v18 = v16 - v17;
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_50_0();
  v77 = v20;
  OUTLINED_FUNCTION_42();
  v21 = sub_21A44DE78();
  v82 = *(_QWORD *)(v21 - 8);
  v83 = v21;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_4_0();
  v73 = v23;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_94_0();
  v71 = v25;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_50_0();
  v27 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v84 = v28;
  v29 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v4) + 0x78))();
  v30 = (void *)(*(uint64_t (**)(uint64_t))((*v27 & *v4) + 0x60))(v29);
  if (!v30)
  {
    v49 = sub_21A32AEEC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v49, v5);
    sub_21A4501AC();
    v50 = OUTLINED_FUNCTION_26_9();
    if (OUTLINED_FUNCTION_43_2(v50))
    {
      v51 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      *(_WORD *)v51 = 0;
      OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v15, (os_log_type_t)v2, "CDMNluResponse is corrupted as objcProto is nil", v51);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_37_5(v2, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
LABEL_22:
    v64 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
    v65 = v84;
LABEL_23:
    v64(v65, v83);
LABEL_24:
    OUTLINED_FUNCTION_2_2();
    return;
  }
  v76 = v6;
  v72 = v5;
  v31 = v30;
  v32 = objc_msgSend(v31, sel_requestId);
  if (v32)
  {
    v33 = sub_21A3AD750(v32);
    if (v34)
      v35 = v33;
    else
      v35 = 0;
    if (v34)
      v36 = v34;
    else
      v36 = 0xE000000000000000;
    v37 = (*(uint64_t (**)(uint64_t))(*v81 + 152))(v33);
    v38 = sub_21A31B3B4(v35, v36, v37);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_1();
    if (v38)
    {
      sub_21A44DE18();
      sub_21A44CCD8();
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v79, v80);
      Siri_Nlu_External_ResponseStatus.StatusCode.toOrchestrationStatusCode()(v1);
      OUTLINED_FUNCTION_90_7(v18);
      if (__swift_getEnumTagSinglePayload(v1, 1, v14) == 1)
      {
        sub_21A2C05B0(v1, &qword_253E43730);
        v39 = sub_21A32AEEC();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v74, v39, v72);
        v40 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v82 + 16);
        OUTLINED_FUNCTION_44_15(v71);
        OUTLINED_FUNCTION_44_15(v73);
        v41 = sub_21A4501AC();
        v42 = sub_21A45092C();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = OUTLINED_FUNCTION_16_0();
          v86[0] = OUTLINED_FUNCTION_16_0();
          *(_DWORD *)v43 = 136315394;
          sub_21A44DE18();
          v44 = sub_21A450680();
          v85[0] = sub_21A2BCCC4(v44, v45, v86);
          sub_21A450A34();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_18_23();
          *(_WORD *)(v43 + 12) = 2080;
          sub_21A44DF50();
          v85[3] = v83;
          v85[4] = sub_21A2C0778((unint64_t *)&qword_253E445F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9DE98], MEMORY[0x24BE9DE60]);
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v85);
          v40(boxed_opaque_existential_1, v73, v83);
          v47 = sub_21A44DF44();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v85);
          v85[0] = OUTLINED_FUNCTION_251_0(v47, v48, v86);
          sub_21A450A34();
          OUTLINED_FUNCTION_41_0();
          OUTLINED_FUNCTION_18_23();
          _os_log_impl(&dword_21A2A0000, v41, v42, "Received error responseStatus: %s nlResponse: %s", (uint8_t *)v43, 0x16u);
          OUTLINED_FUNCTION_34_1();
          OUTLINED_FUNCTION_2_0();
        }
        v66 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
        OUTLINED_FUNCTION_18_23();
        v66(v73, v83);

        (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v74, v72);
        v67 = v38;
        v68 = OUTLINED_FUNCTION_352_0();
        v70 = v69;

        sub_21A3AD47C(0, v68, v70);
        OUTLINED_FUNCTION_13_0();
        v66(v84, v83);
        goto LABEL_24;
      }
      OUTLINED_FUNCTION_47_14(v77, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))v15 + 4));
      v59 = v31;
      sub_21A3AD090();

      (*((void (**)(uint64_t, _QWORD, uint64_t))v15 + 13))(v18, *MEMORY[0x24BE9CA70], v14);
      sub_21A2C0778((unint64_t *)&unk_253E43720, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CA90], MEMORY[0x24BE9CAA0]);
      OUTLINED_FUNCTION_60_15();
      OUTLINED_FUNCTION_60_15();
      OUTLINED_FUNCTION_90_7(v18);
      v60 = v38;
      v61 = OUTLINED_FUNCTION_352_0();
      v63 = v62;

      sub_21A3AD47C(v85[0] == v86[0], v61, v63);
      OUTLINED_FUNCTION_41_0();
      OUTLINED_FUNCTION_90_7(v77);
      goto LABEL_22;
    }
    sub_21A3AD47C(0, v81[7], v81[8]);
    v52 = sub_21A32AEEC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v75, v52, v72);
    v15 = v31;
    OUTLINED_FUNCTION_197_0();
    v53 = OUTLINED_FUNCTION_39_4();
    if (!os_log_type_enabled((os_log_t)v81, v53))
    {

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v75, v72);
      v64 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
      v65 = v84;
      goto LABEL_23;
    }
    v54 = (uint8_t *)OUTLINED_FUNCTION_16_0();
    v85[0] = OUTLINED_FUNCTION_16_0();
    *(_DWORD *)v54 = 136315138;
    v55 = objc_msgSend(v15, sel_requestId);
    if (v55)
    {
      v56 = sub_21A3AD750(v55);
      if (!v57)
        v56 = 7104878;
      v58 = OUTLINED_FUNCTION_251_0(v56, v57, v85);
      OUTLINED_FUNCTION_36_15(v58);
      sub_21A450A34();

      OUTLINED_FUNCTION_41_0();
      OUTLINED_FUNCTION_16_3(&dword_21A2A0000, v81, v53, "asrResult could not be found for nluRequestId: %s", v54);
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_2_0();
    }
  }
  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_21A3AC49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_24_0();
  v29 = sub_21A44C954();
  v2 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_29();
  v3 = OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_0();
  v27 = v4;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_94_0();
  v28 = v6;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_24_14();
  OUTLINED_FUNCTION_23_17(v0);
  v8 = sub_21A4501AC();
  v9 = sub_21A450920();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_16_0();
    *(_WORD *)v10 = 0;
    OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v8, v9, "CDMSetup failed while trying to send NLURequest for dictation", v10);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_90_7(v0);
  sub_21A44DDE8();
  v11 = sub_21A44C930();
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v29);
  v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 152);
  v15 = OUTLINED_FUNCTION_145();
  v16 = v14(v15);
  v30 = v11;
  v17 = sub_21A31B3B4(v11, v13, v16);
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_0_1();
  if (v17)
  {
    OUTLINED_FUNCTION_23_17(v28);
    OUTLINED_FUNCTION_145();
    v18 = OUTLINED_FUNCTION_197_0();
    v19 = sub_21A450920();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      v31 = OUTLINED_FUNCTION_16_0();
      *(_DWORD *)v20 = 136315138;
      OUTLINED_FUNCTION_145();
      v22 = OUTLINED_FUNCTION_251_0(v30, v21, &v31);
      OUTLINED_FUNCTION_36_15(v22);
      sub_21A450A34();
      OUTLINED_FUNCTION_50_18();
      OUTLINED_FUNCTION_16_3(&dword_21A2A0000, v18, v19, "CDM setup failure. Sending cached ASR results to dictation client for nluRequestId %s", v20);
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_49_15();
    OUTLINED_FUNCTION_90_7(v28);
    sub_21A3AD090();

  }
  else
  {
    OUTLINED_FUNCTION_23_17(v27);
    OUTLINED_FUNCTION_145();
    v23 = sub_21A4501AC();
    v24 = sub_21A450920();
    if (OUTLINED_FUNCTION_9_3(v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      v31 = OUTLINED_FUNCTION_16_0();
      *(_DWORD *)v25 = 136315138;
      OUTLINED_FUNCTION_145();
      OUTLINED_FUNCTION_251_0(v30, v26, &v31);
      sub_21A450A34();
      OUTLINED_FUNCTION_50_18();
      OUTLINED_FUNCTION_16_3(&dword_21A2A0000, v23, (os_log_type_t)v2, "asrResult could not be found for nluRequestId: %s", v25);
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_49_15();
    OUTLINED_FUNCTION_90_7(v27);
  }
  OUTLINED_FUNCTION_2_2();
}

uint64_t sub_21A3AC854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;

  v7 = OUTLINED_FUNCTION_17_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_25_0();
  v9 = *(uint64_t (**)(uint64_t))(*v3 + 152);
  v10 = swift_bridgeObjectRetain();
  v11 = v9(v10);
  v12 = sub_21A31B3B4(a2, a3, v11);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_41_0();
  if (v12)
  {
    v13 = v3[12];
    v14 = OUTLINED_FUNCTION_54_16();
    v16 = v15;
    v17 = v12;
    v18 = OUTLINED_FUNCTION_352_0();
    v20 = v19;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v13 + 136))(v14, v16, v18, v20, 0, 0, 0);
    OUTLINED_FUNCTION_17_0();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v22 = sub_21A32AEEC();
    OUTLINED_FUNCTION_56_0((uint64_t)v4, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
    sub_21A4501AC();
    v23 = OUTLINED_FUNCTION_39_4();
    if (OUTLINED_FUNCTION_24_9(v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      *(_WORD *)v24 = 0;
      OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v4, OS_LOG_TYPE_DEFAULT, "Missing DictationAsrResult while logging error", v24);
      OUTLINED_FUNCTION_2_0();
    }

    return (*(uint64_t (**)(NSObject *, uint64_t))(v8 + 8))(v4, v7);
  }
}

uint64_t sub_21A3AC9DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
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
  _BYTE *v25;
  double v26;
  double v27;
  uint64_t result;
  double v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t *);
  id v37;
  void (*v38)(uint64_t *, _QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  int v45;
  uint64_t v46;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[4];
  int v54;
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
  uint64_t v68[5];
  uint64_t v69[2];

  v57 = a1;
  v61 = a2;
  v5 = OUTLINED_FUNCTION_17_2();
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v5;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6();
  v58 = v7;
  OUTLINED_FUNCTION_42();
  v8 = sub_21A44DE0C();
  v59 = *(_QWORD *)(v8 - 8);
  v60 = v8;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v53[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_21A44C954();
  v66 = *(_QWORD *)(v12 - 8);
  v67 = v12;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_28();
  v16 = v14 - v15;
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_50_0();
  v64 = v18;
  OUTLINED_FUNCTION_42();
  v19 = sub_21A44C594();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_72_0();
  v65 = sub_21A44C9C0();
  v21 = *(_QWORD *)(v65 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_46_4();
  MEMORY[0x24BDAC7A8](v23);
  v25 = &v53[-v24];
  sub_21A44C9B4();
  OUTLINED_FUNCTION_18_0();
  sub_21A44C960();
  sub_21A44C588();
  sub_21A44C558();
  v27 = v26;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v3, v19);
  v29 = v27 * 1000.0;
  if ((~COERCE__INT64(v27 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v29 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v29 >= 1.84467441e19)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  sub_21A44C984();
  v30 = v2[8];
  v31 = v64;
  v55 = v2[7];
  v32 = (void *)v57;
  sub_21A3ACEBC();
  sub_21A44DE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v16, v31, v67);
  sub_21A44DDF4();
  v56 = v21;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v21 + 16))(v4, v25, v65);
  sub_21A44DDD0();
  v33 = sub_21A44C930();
  v35 = v34;
  v36 = *(uint64_t (**)(uint64_t *))(*v2 + 168);
  v37 = v32;
  v38 = (void (*)(uint64_t *, _QWORD))v36(v68);
  sub_21A3AD5C0((uint64_t)v37, v33, v35);
  swift_bridgeObjectRelease();
  v38(v68, 0);
  v39 = sub_21A32AEEC();
  v41 = v62;
  v40 = v63;
  v42 = v58;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v58, v39, v63);
  swift_retain_n();
  v43 = OUTLINED_FUNCTION_200_0();
  v44 = sub_21A450920();
  v45 = v44;
  if (os_log_type_enabled(v43, v44))
  {
    v46 = OUTLINED_FUNCTION_16_0();
    v57 = OUTLINED_FUNCTION_16_0();
    v69[0] = v57;
    *(_DWORD *)v46 = 136315394;
    v54 = v45;
    swift_bridgeObjectRetain();
    v68[0] = sub_21A2BCCC4(v55, v30, v69);
    sub_21A450A34();
    OUTLINED_FUNCTION_363();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    sub_21A44DF50();
    OUTLINED_FUNCTION_1_4();
    v68[3] = v60;
    v68[4] = sub_21A2C0778((unint64_t *)&qword_253E445E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9DE40], MEMORY[0x24BE9DE20]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v68);
    OUTLINED_FUNCTION_46_18((uint64_t)boxed_opaque_existential_1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 16));
    v48 = sub_21A44DF44();
    v50 = v49;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
    v68[0] = sub_21A2BCCC4(v48, v50, v69);
    sub_21A450A34();
    OUTLINED_FUNCTION_13_0();
    _os_log_impl(&dword_21A2A0000, v43, (os_log_type_t)v54, "Created dictation nluRequest for requestId=%s nluRequest = %s", (uint8_t *)v46, 0x16u);
    OUTLINED_FUNCTION_34_1();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_363();

  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v40);
  OUTLINED_FUNCTION_38_7();
  OUTLINED_FUNCTION_16_28();
  v51 = v59;
  v52 = v60;
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_46_18(v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 16));
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v51 + 8))(v11, v52);
}

void sub_21A3ACEBC()
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

  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E436F0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_6();
  v7 = v1;
  OUTLINED_FUNCTION_42();
  v2 = sub_21A44C7F8();
  v6 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6();
  v8 = v4;
  OUTLINED_FUNCTION_42();
  v5 = sub_21A44C5E8();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_72_0();
  sub_21A44C948();
  sub_21A3539F4();
  OUTLINED_FUNCTION_18_0();
  sub_21A450758();
  sub_21A44F684();
  sub_21A44C5AC();
  OUTLINED_FUNCTION_62_12();
  swift_bridgeObjectRetain();
  sub_21A450758();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21A44C93C();
  sub_21A353A60();
  swift_bridgeObjectRetain();
  sub_21A44C8F4();
  sub_21A44C5DC();
  sub_21A44DF5C();
  OUTLINED_FUNCTION_62_12();
  if (__swift_getEnumTagSinglePayload(v7, 1, v2) == 1)
  {
    sub_21A44C7EC();
    sub_21A2C05B0(v7, (uint64_t *)&unk_253E436F0);
  }
  else
  {
    OUTLINED_FUNCTION_47_14(v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
  }
  sub_21A44C90C();
  OUTLINED_FUNCTION_2_2();
}

void sub_21A3AD090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  int v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_24_0();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_17_2();
  v44 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_28();
  v11 = (v9 - v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v44 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = ((char *)&v44 - v16);
  v18 = sub_21A44F90C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_29();
  v20 = objc_allocWithZone(MEMORY[0x24BE091C0]);
  v21 = objc_msgSend(v20, sel_init, v44, v45);
  v22 = (void (**)(_QWORD, _QWORD))v21;
  if (v4)
    objc_msgSend(v21, sel_setNluResponse_, v4);
  sub_21A44F3F0();
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 88))(v1, v18);
  if (v23 == *MEMORY[0x24BE9B390])
  {
    if (!sub_21A44F3FC())
    {
      sub_21A32AEEC();
      OUTLINED_FUNCTION_28_22();
      OUTLINED_FUNCTION_56_0((uint64_t)v17, v36, v37);
      sub_21A4501AC();
      v38 = OUTLINED_FUNCTION_39_4();
      if (OUTLINED_FUNCTION_24_9(v38))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_16_0();
        *(_WORD *)v39 = 0;
        OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v17, (os_log_type_t)v11, "resultType is partial but speechTokens is nil", v39);
        OUTLINED_FUNCTION_2_0();
      }

      ((void (**)(NSObject *, uint64_t))v22)[1](v17, v19);
      goto LABEL_25;
    }
    v24 = *(void **)(v2 + 88);
    if ((objc_msgSend(v24, sel_respondsToSelector_, sel_didRecognizeTokens_nluResult_sessionUUID_) & 1) != 0)
    {
      sub_21A3AD7DC();
      swift_unknownObjectRetain();
      v25 = v22;
      v26 = (void *)sub_21A450830();
      v27 = (void *)OUTLINED_FUNCTION_59_12();
      OUTLINED_FUNCTION_53_17(v24, sel_didRecognizeTokens_nluResult_sessionUUID_, (uint64_t)v26);
      OUTLINED_FUNCTION_0_1();
      swift_unknownObjectRelease();

LABEL_11:
LABEL_25:
      OUTLINED_FUNCTION_2_2();
      return;
    }
    OUTLINED_FUNCTION_0_1();
    goto LABEL_23;
  }
  if (v23 == *MEMORY[0x24BE9B380])
  {
    v28 = sub_21A44F408();
    if (!v28)
    {
      sub_21A32AEEC();
      OUTLINED_FUNCTION_28_22();
      OUTLINED_FUNCTION_56_0((uint64_t)v15, v40, v41);
      OUTLINED_FUNCTION_197_0();
      v42 = OUTLINED_FUNCTION_39_4();
      if (OUTLINED_FUNCTION_24_9(v42))
      {
        v43 = (uint8_t *)OUTLINED_FUNCTION_16_0();
        *(_WORD *)v43 = 0;
        OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v6, (os_log_type_t)v11, "resultType is final but speechPackage is nil", v43);
        OUTLINED_FUNCTION_2_0();
      }

      ((void (**)(char *, uint64_t))v22)[1](v15, v19);
      goto LABEL_25;
    }
    v29 = (void *)v28;
    v30 = *(void **)(v2 + 88);
    if ((objc_msgSend(v30, sel_respondsToSelector_, sel_didRecognizePackage_nluResult_sessionUUID_) & 1) != 0)
    {
      v31 = v22;
      swift_unknownObjectRetain();
      v27 = (void *)OUTLINED_FUNCTION_59_12();
      OUTLINED_FUNCTION_53_17(v30, sel_didRecognizePackage_nluResult_sessionUUID_, (uint64_t)v29);

      swift_unknownObjectRelease();
      goto LABEL_11;
    }

LABEL_23:
    goto LABEL_25;
  }
  if (v23 == *MEMORY[0x24BE9B388])
  {
    sub_21A32AEEC();
    OUTLINED_FUNCTION_28_22();
    OUTLINED_FUNCTION_56_0((uint64_t)v11, v32, v33);
    sub_21A4501AC();
    v34 = OUTLINED_FUNCTION_39_4();
    if (OUTLINED_FUNCTION_9_3(v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      *(_WORD *)v35 = 0;
      OUTLINED_FUNCTION_40_2(&dword_21A2A0000, v11, (os_log_type_t)v15, "Do not handle resultType finalResultCandidate", v35);
      OUTLINED_FUNCTION_2_0();
    }

    ((void (**)(NSObject *, uint64_t))v22)[1](v11, v19);
    goto LABEL_25;
  }
  sub_21A450D58();
  __break(1u);
}

uint64_t sub_21A3AD47C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v3 + 96);
  v8 = OUTLINED_FUNCTION_54_16();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v7 + 128))(0, a1, v8, v9, a2, a3, 0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A3AD4F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21A3AD534()
{
  sub_21A3AD4F0();
  return swift_deallocClassInstance();
}

void sub_21A3AD554()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)v0 + 208))();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3AD578()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)v0 + 216))();
  OUTLINED_FUNCTION_60_0();
}

void sub_21A3AD59C()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)v0 + 200))();
  OUTLINED_FUNCTION_60_0();
}

uint64_t sub_21A3AD5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_21A3AD63C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_21A3AD63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_21A2CCFF8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D81A8);
  if ((sub_21A450BB4() & 1) == 0)
    goto LABEL_5;
  v13 = sub_21A2CCFF8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_21A450D94();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21A31BE84(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_21A3AD750(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_idA);

  if (!v2)
    return 0;
  v3 = sub_21A450644();

  return v3;
}

uint64_t type metadata accessor for DictationNLRequestHandler()
{
  return objc_opt_self();
}

unint64_t sub_21A3AD7DC()
{
  unint64_t result;

  result = qword_253E43900;
  if (!qword_253E43900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253E43900);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_10_28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 - 184))(v1, *(_QWORD *)(v2 - 192), v0);
}

uint64_t OUTLINED_FUNCTION_16_28()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 272) + 8))(v0, *(_QWORD *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_18_23()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_23_17(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

_WORD *OUTLINED_FUNCTION_35_15(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_36_15(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_38_7()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 192) + 8))(*(_QWORD *)(v0 - 208), *(_QWORD *)(v0 - 184));
}

uint64_t OUTLINED_FUNCTION_44_15(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_46_18@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_47_14@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_49_15()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_50_18()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_53_17(id a1, SEL a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(a1, a2, a3, v3, v4);
}

uint64_t OUTLINED_FUNCTION_54_16()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t OUTLINED_FUNCTION_59_12()
{
  return sub_21A450620();
}

uint64_t OUTLINED_FUNCTION_60_15()
{
  return sub_21A450818();
}

uint64_t OUTLINED_FUNCTION_62_12()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_21A3AD92C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  unint64_t v36;
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
  void (*v48)(uint64_t, uint64_t, uint64_t);
  char v49;
  void (*v50)(uint64_t, uint64_t);
  char v51;
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
  id v62;
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
  void (*v76)(uint64_t, uint64_t, uint64_t);
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

  sub_21A44C870();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6();
  v5 = sub_21A44CD20();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_0();
  v82 = v7;
  v9 = MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_21(v9, v10, v11, v12, v13, v14, v15, v16, v64);
  v84 = sub_21A44CC3C();
  v86 = *(_QWORD *)(v84 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_0_0();
  v20 = v19 - v18;
  v74 = sub_21A44CA20();
  v80 = *(_QWORD *)(v74 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_6();
  v73 = v22;
  v23 = sub_21A4501A0();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_0_0();
  v27 = v26 - v25;
  v28 = sub_21A2BBC08(0, (unint64_t *)&qword_253E44690);
  v29 = sub_21A33FEA4();
  v71 = v28;
  v72 = v27;
  sub_21A33FF0C((uint64_t)"HeuristicRules.TranslationRule", 30, 2, v29);

  sub_21A2BBC08(0, &qword_2550D47D0);
  sub_21A2EC3C4();
  v31 = v30;
  if (v33 == sub_21A2EAB98(1) && v31 == v32)
  {
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    v35 = sub_21A450D64();
    OUTLINED_FUNCTION_0_1();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
    {
LABEL_25:
      v60 = 1;
      goto LABEL_27;
    }
  }
  v36 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for NLRouterServiceRequest(0) + 32));
  if (v36 < 2)
    goto LABEL_25;
  v75 = *(_QWORD *)(v36 + 16);
  if (!v75)
    goto LABEL_25;
  v68 = v24;
  v69 = v23;
  v66 = a1;
  v70 = a2;
  OUTLINED_FUNCTION_72();
  v78 = v37 + v38;
  v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16);
  v77 = *(_QWORD *)(v39 + 72);
  v67 = v37;
  swift_bridgeObjectRetain_n();
  v40 = 0;
  v41 = v84;
  v42 = v73;
  v43 = v74;
  v81 = v6;
  do
  {
    v76(v42, v78 + v77 * v40, v43);
    v44 = *(_QWORD *)(sub_21A44C9CC() + 16);
    if (v44)
    {
      v79 = v40;
      OUTLINED_FUNCTION_72();
      v47 = v45 + v46;
      swift_bridgeObjectRetain();
      v85 = *(_QWORD *)(v86 + 72);
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16);
      while (1)
      {
        v48(v20, v47, v41);
        if ((sub_21A44CBDC() & 1) == 0)
          goto LABEL_17;
        OUTLINED_FUNCTION_5_26();
        v49 = sub_21A44CD08();
        v50 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
        v50(v83, v5);
        if ((v49 & 1) == 0)
          break;
        OUTLINED_FUNCTION_5_26();
        sub_21A44CD14();
        v50(v82, v5);
        sub_21A44DF68();
        OUTLINED_FUNCTION_3_33();
        v51 = sub_21A3ADE1C();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v20, v84);
        v41 = v84;
        v6 = v81;
        if ((v51 & 1) != 0)
        {
          OUTLINED_FUNCTION_10_0();
          (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v73, v74);
          OUTLINED_FUNCTION_10_0();
          v52 = type metadata accessor for HeuristicRoutingRequest(0);
          a2 = v70;
          sub_21A2FFB2C(v52, v53, v54, v55, v56, v57, v58, v59, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75,
            (uint64_t)v76);
          v60 = 0;
          goto LABEL_26;
        }
LABEL_18:
        v47 += v85;
        if (!--v44)
        {
          OUTLINED_FUNCTION_10_0();
          v42 = v73;
          v43 = v74;
          v40 = v79;
          goto LABEL_23;
        }
      }
      v41 = v84;
LABEL_17:
      OUTLINED_FUNCTION_36(v20, *(uint64_t (**)(uint64_t, uint64_t))(v86 + 8));
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
LABEL_23:
    ++v40;
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v42, v43);
  }
  while (v40 != v75);
  OUTLINED_FUNCTION_10_0();
  v60 = 1;
  a2 = v70;
LABEL_26:
  v23 = v69;
  v24 = v68;
LABEL_27:
  v61 = sub_21A44F2C4();
  __swift_storeEnumTagSinglePayload(a2, v60, 1, v61);
  v62 = sub_21A33FEA4();
  sub_21A33FF68(v72, (uint64_t)"HeuristicRules.TranslationRule", 30, 2, (uint64_t)v62);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v72, v23);
}

unint64_t sub_21A3ADE1C()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v1 = sub_21A44ECAC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_0();
  v5 = v4 - v3;
  v6 = sub_21A44EC70();
  v61 = *(_QWORD *)(v6 - 8);
  v62 = v6;
  OUTLINED_FUNCTION_2();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v51 - v11;
  v13 = sub_21A44EC40();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_5_21(v18, v19, v20, v21, v22, v23, v24, v25, v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D5FA0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_4_0();
  v58 = v27;
  MEMORY[0x24BDAC7A8](v28);
  v59 = (char *)&v51 - v29;
  v56 = v0;
  v30 = sub_21A44ECC4();
  v31 = *(_QWORD *)(v30 + 16);
  v60 = v30;
  if (v31)
  {
    v52 = v10;
    v53 = v5;
    v54 = v2;
    v55 = v1;
    OUTLINED_FUNCTION_72();
    v34 = v32 + v33;
    v35 = *(_QWORD *)(v14 + 72);
    v36 = v14;
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v37(v17, v34, v13);
      sub_21A44EC1C();
      v38 = sub_21A44EC64();
      v40 = v39;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v12, v62);
      if (v38 == 1802723700 && v40 == 0xE400000000000000)
        break;
      v42 = sub_21A450D64();
      OUTLINED_FUNCTION_0_1();
      if ((v42 & 1) != 0)
        goto LABEL_13;
      OUTLINED_FUNCTION_36((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
      v34 += v35;
      if (!--v31)
      {
        OUTLINED_FUNCTION_320_1();
        v43 = 1;
        v2 = v54;
        v1 = v55;
        v14 = v36;
        v10 = v52;
        v5 = v53;
        goto LABEL_11;
      }
    }
    OUTLINED_FUNCTION_320_1();
LABEL_13:
    swift_bridgeObjectRelease();
    v14 = v36;
    v44 = (uint64_t)v59;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v59, v17, v13);
    v43 = 0;
    v2 = v54;
    v1 = v55;
    v10 = v52;
    v5 = v53;
  }
  else
  {
    v43 = 1;
LABEL_11:
    v44 = (uint64_t)v59;
  }
  v45 = v58;
  __swift_storeEnumTagSinglePayload(v44, v43, 1, v13);
  OUTLINED_FUNCTION_320_1();
  sub_21A36EDE0(v44, v45);
  if (__swift_getEnumTagSinglePayload(v45, 1, v13) == 1)
  {
    sub_21A36EE28(v44);
    v46 = 0;
    v44 = v45;
LABEL_19:
    sub_21A36EE28(v44);
    return v46 & 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v57, v45, v13);
  v47 = sub_21A44ECD0();
  result = sub_21A44EC28();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v47 + 16))
  {
    OUTLINED_FUNCTION_72();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v5, v47 + v49 + *(_QWORD *)(v2 + 72) * v50, v1);
    swift_bridgeObjectRelease();
    sub_21A44ECA0();
    sub_21A44EC64();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v10, v62);
    v46 = sub_21A4507DC();
    OUTLINED_FUNCTION_0_1();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
    OUTLINED_FUNCTION_36(v57, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for TranslationRule()
{
  return &type metadata for TranslationRule;
}

uint64_t OUTLINED_FUNCTION_3_33()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 144) + 8))(v0, *(_QWORD *)(v1 - 136));
}

uint64_t OUTLINED_FUNCTION_5_26()
{
  return sub_21A44CBF4();
}

uint64_t sub_21A3AE210@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t *v18;

  v18 = a2;
  v3 = sub_21A44C690();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v6 = type metadata accessor for MorphunTokenizer();
  v7 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550D8270);
  v8 = *(_QWORD *)(sub_21A44C75C() - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21A463060;
  v12 = v11 + v10;
  OUTLINED_FUNCTION_0_34(v12, *MEMORY[0x24BE69028]);
  OUTLINED_FUNCTION_0_34(v12 + v9, *MEMORY[0x24BE69020]);
  OUTLINED_FUNCTION_0_34(v12 + 2 * v9, *MEMORY[0x24BE69018]);
  OUTLINED_FUNCTION_0_34(v12 + 3 * v9, *MEMORY[0x24BE69000]);
  v13 = v12 + 4 * v9;
  v14 = v6;
  v15 = v18;
  OUTLINED_FUNCTION_0_34(v13, *MEMORY[0x24BE69008]);
  sub_21A44C780();
  swift_allocObject();
  sub_21A44C774();
  v16 = sub_21A44C768();
  OUTLINED_FUNCTION_423();
  result = swift_release();
  *(_QWORD *)(v7 + 16) = v16;
  v15[3] = v14;
  v15[4] = (uint64_t)&off_24DCAB2F8;
  *v15 = v7;
  return result;
}

uint64_t type metadata accessor for MorphunTokenizer()
{
  return objc_opt_self();
}

uint64_t sub_21A3AE484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;

  if (*(_QWORD *)(v3 + 16))
  {
    swift_retain();
    v5 = sub_21A44C750();
    v7 = sub_21A3AE684(v5);
    swift_bridgeObjectRetain();
    v8 = sub_21A3AE8EC((uint64_t)v7, a3);
    swift_release();
    swift_release();
  }
  else
  {
    sub_21A45092C();
    OUTLINED_FUNCTION_2_10();
    v6 = OUTLINED_FUNCTION_29_0();
    v8 = MEMORY[0x24BEE4AF8];
    sub_21A450164();

  }
  return v8;
}

char *sub_21A3AE684(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  char *v13;
  void (*v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = sub_21A44C7A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550D8258);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a1;
  v10 = sub_21A44C744();
  sub_21A3AEA78(&qword_2550D8260, MEMORY[0x24BE68FE0]);
  swift_retain();
  sub_21A45080C();
  v11 = sub_21A3AEA78(&qword_2550D8268, MEMORY[0x24BE68FE8]);
  sub_21A450A28();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3);
  v24 = v1;
  if (EnumTagSinglePayload == 1)
  {
    v13 = (char *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v15 = *(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 32);
    v13 = (char *)MEMORY[0x24BEE4AF8];
    v26 = v11;
    v27 = v4;
    v25 = v15;
    do
    {
      v15(v6, v9, v3);
      if ((sub_21A44C798() & 1) != 0)
      {
        v16 = v10;
        v17 = sub_21A44C78C();
        v19 = v18;
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_21A2C4974(0, *((_QWORD *)v13 + 2) + 1, 1, (uint64_t)v13);
        v21 = *((_QWORD *)v13 + 2);
        v20 = *((_QWORD *)v13 + 3);
        if (v21 >= v20 >> 1)
          v13 = sub_21A2C4974((char *)(v20 > 1), v21 + 1, 1, (uint64_t)v13);
        *((_QWORD *)v13 + 2) = v21 + 1;
        v22 = &v13[16 * v21];
        *((_QWORD *)v22 + 4) = v17;
        *((_QWORD *)v22 + 5) = v19;
        v4 = v27;
        v10 = v16;
        v15 = v25;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
      sub_21A450A28();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) != 1);
  }
  swift_release();
  return v13;
}

uint64_t sub_21A3AE8EC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = result;
  v4 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v5 = 0;
    v6 = result + 40;
    v7 = MEMORY[0x24BEE4AF8];
    v16 = result + 40;
    do
    {
      v8 = (uint64_t *)(v6 + 16 * v5);
      v9 = v5;
      while (1)
      {
        if (v9 >= *(_QWORD *)(v3 + 16))
        {
          __break(1u);
          return result;
        }
        v11 = *(v8 - 1);
        v10 = *v8;
        v5 = v9 + 1;
        swift_bridgeObjectRetain();
        if ((sub_21A3311A0(v11, v10, a2) & 1) == 0)
          break;
        result = swift_bridgeObjectRelease();
        v8 += 2;
        ++v9;
        if (v4 == v5)
          goto LABEL_15;
      }
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
        result = (uint64_t)sub_21A2CCDB4(0, *(_QWORD *)(v7 + 16) + 1, 1);
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      v14 = v13 + 1;
      if (v13 >= v12 >> 1)
      {
        result = (uint64_t)sub_21A2CCDB4((char *)(v12 > 1), v13 + 1, 1);
        v14 = v13 + 1;
      }
      *(_QWORD *)(v7 + 16) = v14;
      v15 = v7 + 16 * v13;
      *(_QWORD *)(v15 + 32) = v11;
      *(_QWORD *)(v15 + 40) = v10;
      v6 = v16;
    }
    while (v4 - 1 != v9);
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
LABEL_15:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_21A3AEA50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 96))();
}

uint64_t sub_21A3AEA78(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21A44C744();
    result = MEMORY[0x220744A58](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_21A3AEAC0()
{
  uint64_t result;

  sub_21A2BD468();
  sub_21A33FD34();
  swift_bridgeObjectRetain();
  result = sub_21A450A04();
  qword_253E45700 = result;
  return result;
}

id sub_21A3AEB1C()
{
  if (_MergedGlobals_17 != -1)
    swift_once();
  return (id)qword_253E45700;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_253E45720 == -1)
  {
    if (qword_253E45728)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_253E45720, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_253E45728)
      return _availability_version_check();
  }
  if (qword_253E45718 == -1)
  {
    v8 = _MergedGlobals_18 < a2;
    if (_MergedGlobals_18 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_253E45718, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals_18 < a2;
    if (_MergedGlobals_18 > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_253E4570C > a3)
    return 1;
  return dword_253E4570C >= a3 && dword_253E45710 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_253E45728;
  if (qword_253E45728)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_253E45728 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x220744368](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals_18, &dword_253E4570C, &dword_253E45710);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
  return result;
}

void sub_21A3AFBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_21A3B1544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A3B2CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A3B49C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3B4C6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3B4E08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3B573C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3B5974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3B5AA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3B5BCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3B6074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21A3B68F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_21A3B7064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3B72EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3B7420(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3B7970(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3B79DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3B7A30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3B7AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;

  objc_sync_exit(v9);

  a9.super_class = (Class)CDMClient;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21A3B7BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3B7C6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21A3B9A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21A3B9FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BA3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BA61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A3BAA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BADE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21A3BB168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21A3BB4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21A3BB924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BBBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BBE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BC12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BC3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BC674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BC918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21A3BCC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__317(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__318(uint64_t a1)
{

}

void sub_21A3C1A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *a30,id *a31,uint64_t a32,id *a33,uint64_t a34,id *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id *location,id *a42,id *a43,id *a44,id *a45,id *a46)
{
  uint64_t v46;

  objc_destroyWeak(location);
  objc_destroyWeak(a42);
  objc_destroyWeak(a43);
  objc_destroyWeak(a30);
  objc_destroyWeak(a31);
  objc_destroyWeak(a33);
  objc_destroyWeak(a35);
  objc_destroyWeak(a44);
  objc_destroyWeak(a45);
  objc_destroyWeak(a46);
  _Block_object_dispose(&STACK[0xC20], 8);
  _Block_object_dispose(&STACK[0xC50], 8);
  _Block_object_dispose(&STACK[0xC80], 8);
  _Block_object_dispose(&STACK[0xCB0], 8);
  _Block_object_dispose(&STACK[0xCE0], 8);
  _Block_object_dispose(&STACK[0xD10], 8);
  _Block_object_dispose(&STACK[0xD40], 8);
  _Block_object_dispose(&STACK[0xD70], 8);
  _Block_object_dispose(&STACK[0xDA0], 8);
  _Block_object_dispose(&STACK[0xDD0], 8);
  _Block_object_dispose(&STACK[0xE00], 8);
  _Block_object_dispose(&STACK[0xE30], 8);
  _Block_object_dispose(&STACK[0xE60], 8);
  _Block_object_dispose(&STACK[0xE90], 8);
  _Block_object_dispose(&STACK[0xEC0], 8);
  _Block_object_dispose(&STACK[0xEF0], 8);
  _Block_object_dispose(&STACK[0xF20], 8);
  _Block_object_dispose(&STACK[0xF50], 8);
  _Block_object_dispose(&STACK[0xF80], 8);
  _Block_object_dispose(&STACK[0xFB0], 8);
  _Block_object_dispose(&STACK[0xFE0], 8);
  _Block_object_dispose(&STACK[0x1010], 8);
  _Block_object_dispose(&STACK[0x1040], 8);
  _Block_object_dispose(&STACK[0x1070], 8);
  _Block_object_dispose(&STACK[0x10A0], 8);
  _Block_object_dispose(&STACK[0x10D0], 8);
  _Block_object_dispose(&STACK[0x1100], 8);
  _Block_object_dispose(&STACK[0x1130], 8);
  _Block_object_dispose(&STACK[0x1160], 8);
  _Block_object_dispose(&STACK[0x1190], 8);
  _Block_object_dispose(&STACK[0x11C0], 8);
  _Block_object_dispose(&STACK[0x11F0], 8);
  _Block_object_dispose(&STACK[0x1220], 8);
  _Block_object_dispose(&STACK[0x1250], 8);
  _Block_object_dispose(&STACK[0x1280], 8);
  _Block_object_dispose((const void *)(v46 - 256), 8);
  _Block_object_dispose((const void *)(v46 - 208), 8);
  _Block_object_dispose((const void *)(v46 - 160), 8);
  objc_destroyWeak((id *)(v46 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__457(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__458(uint64_t a1)
{

}

void sub_21A3C367C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A3C3E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A3C4574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A3C4948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A3C6264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A3C655C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3C69D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3C6AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3C73C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A3C7BFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3CBC80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3D39C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3D3B80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3D3C58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3D3CD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3D43C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3D4D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21A3D4F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_21A3D5094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3D536C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21A3D55E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3D5AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A3D60E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_21A3D6718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_21A3D70D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3D73FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3D760C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3D7A08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3D7DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A3D8628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_21A3D8A38(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *(_QWORD *)(v2 + 8) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_21A3D8B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21A3D8BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21A3D9BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,char a49)
{
  void *v49;
  void *v50;
  uint64_t v51;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a18);
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100]((void ***)&a32);

  if (a48 < 0)
    operator delete(__p);
  MEMORY[0x220743D5C](&a49);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100](v51 - 256);

  _Unwind_Resume(a1);
}

void sub_21A3DA23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v4;

  _Unwind_Resume(a1);
}

void sub_21A3DA42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v4;

  _Unwind_Resume(a1);
}

void sub_21A3DA588(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3DA68C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3DA710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3DA768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>(uint64_t *a1)
{
  uint64_t v2;
  _QWORD v3[4];
  _QWORD v4[3];
  void **v5;

  v2 = operator new();
  v4[1] = 0;
  v4[2] = 0;
  v3[1] = 0;
  *(_BYTE *)v2 = 0;
  *(_BYTE *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 40) = 0;
  *(_BYTE *)(v2 + 64) = 0;
  *(_BYTE *)(v2 + 72) = 0;
  *(_BYTE *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  v4[0] = 0;
  *(_QWORD *)(v2 + 144) = 0;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  v3[2] = 0;
  v3[0] = 0;
  *(_BYTE *)(v2 + 152) = 0;
  *(_BYTE *)(v2 + 176) = 0;
  *a1 = v2;
  v5 = (void **)v3;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](&v5);
  v5 = (void **)v4;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

__n128 std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(uint64_t a1, __n128 *a2)
{
  __n128 result;

  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(_BYTE *)(a1 + 24))
    {
      if (*(char *)(a1 + 23) < 0)
        operator delete(*(void **)a1);
      result = *a2;
      *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
      *(__n128 *)a1 = result;
      a2[1].n128_u8[7] = 0;
      a2->n128_u8[0] = 0;
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    result = *a2;
    *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
    *(__n128 *)a1 = result;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    a2->n128_u64[0] = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

void **std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](void ***a1)
{
  void **result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    siri::ontology::UsoEntitySpan::~UsoEntitySpan(result);
    JUMPOUT(0x22074408CLL);
  }
  return result;
}

void siri::ontology::UsoEntitySpan::~UsoEntitySpan(void **this)
{
  uint64_t v2;
  void **v3;

  if (*((_BYTE *)this + 176) && *((char *)this + 175) < 0)
    operator delete(this[19]);
  v3 = this + 16;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = this + 11;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((_BYTE *)this + 80))
  {
    v2 = (uint64_t)this[9];
    this[9] = 0;
    if (v2)
      std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v2);
  }
  if (*((_BYTE *)this + 64) && *((char *)this + 63) < 0)
    operator delete(this[5]);
  if (*((_BYTE *)this + 24))
  {
    if (*((char *)this + 23) < 0)
      operator delete(*this);
  }
}

uint64_t std::__optional_storage_base<std::unique_ptr<siri::ontology::MatchInfo>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::unique_ptr<siri::ontology::MatchInfo>,false>>(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = result;
  if (*(unsigned __int8 *)(result + 8) == *((unsigned __int8 *)a2 + 8))
  {
    if (*(_BYTE *)(result + 8))
    {
      v3 = *a2;
      *a2 = 0;
      result = *(_QWORD *)result;
      *(_QWORD *)v2 = v3;
      if (result)
        std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](result);
    }
  }
  else if (*(_BYTE *)(result + 8))
  {
    result = *(_QWORD *)result;
    *(_QWORD *)v2 = 0;
    if (result)
      std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](result);
    *(_BYTE *)(v2 + 8) = 0;
  }
  else
  {
    v4 = *a2;
    *a2 = 0;
    *(_QWORD *)result = v4;
    *(_BYTE *)(result + 8) = 1;
  }
  return result;
}

void std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(_QWORD *)(a1 + 80) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x22074408CLL);
}

PB::Writer *std::unique_ptr<PB::Writer>::reset[abi:ne180100](PB::Writer **a1)
{
  PB::Writer *result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    PB::Writer::~Writer(result);
    JUMPOUT(0x22074408CLL);
  }
  return result;
}

uint64_t std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
        {
          if (*(char *)(v6 + 23) < 0)
            operator delete(*(void **)v6);
          MEMORY[0x22074408C](v6, 0x1012C40F498771DLL);
        }
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
        {
          if (*(_BYTE *)(v6 + 48) && *(char *)(v6 + 47) < 0)
            operator delete(*(void **)(v6 + 24));
          if (*(char *)(v6 + 23) < 0)
            operator delete(*(void **)v6);
          MEMORY[0x22074408C](v6, 0x1012C40785BF0B2);
        }
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DCA2360, MEMORY[0x24BEDAAF0]);
}

void sub_21A3DAF94(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21A3DB028(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_21A3DB1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1929(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1930(uint64_t a1)
{

}

void sub_21A3DB5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21A3DB9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21A3DBB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A3DC1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  id *v37;
  uint64_t v38;

  objc_destroyWeak(v37);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v38 - 256), 8);
  _Block_object_dispose((const void *)(v38 - 208), 8);
  _Block_object_dispose((const void *)(v38 - 160), 8);
  objc_destroyWeak((id *)(v38 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2015(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2016(uint64_t a1)
{

}

void sub_21A3DCF74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3DD70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A3E1030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3E116C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3E1308(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A3E13CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E14E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21A3E1714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E1814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E1968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E19D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E1B10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E1C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E1F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{

  _Unwind_Resume(a1);
}

void std::basic_string<char16_t>::resize(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __n, std::basic_string<char16_t>::value_type __c)
{
  std::basic_string<char16_t> *v3;
  unint64_t v4;
  std::basic_string<char16_t>::size_type v5;
  unint64_t v6;
  unint64_t v7;
  std::basic_string<char16_t>::size_type size;
  unint64_t v9;
  uint64_t v10;
  std::basic_string<char16_t> *v11;
  unint64_t v12;
  std::basic_string<char16_t> *v13;
  std::basic_string<char16_t> *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  std::basic_string<char16_t>::size_type v18;
  std::basic_string<char16_t> *v19;
  unint64_t v20;
  std::basic_string<char16_t>::size_type v21;

  v3 = this;
  LODWORD(v4) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v4 & 0x80000000) == 0)
  {
    v5 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v6 = __n - v5;
    if (__n > v5)
    {
      v7 = 10;
      goto LABEL_6;
    }
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_17:
    v13 = (std::basic_string<char16_t> *)((char *)v3 + 2 * __n);
    goto LABEL_35;
  }
  size = this->__r_.__value_.__l.__size_;
  v6 = __n - size;
  if (__n <= size)
  {
    this->__r_.__value_.__l.__size_ = __n;
    v3 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
    goto LABEL_17;
  }
  v5 = this->__r_.__value_.__l.__size_;
  v9 = this->__r_.__value_.__r.__words[2];
  v7 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  v4 = HIBYTE(v9);
LABEL_6:
  if (v7 - v5 >= v6)
  {
    v14 = this;
    if ((v4 & 0x80) == 0)
      goto LABEL_29;
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFF7;
    if (0x7FFFFFFFFFFFFFF7 - v7 < v6 - v7 + v5)
      std::string::__throw_length_error[abi:ne180100]();
    v11 = this;
    if ((v4 & 0x80) != 0)
      v11 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
    if (v7 <= 0x3FFFFFFFFFFFFFF2)
    {
      v12 = v6 + v5;
      if (v6 + v5 <= 2 * v7)
        v12 = 2 * v7;
      if (v12 >= 0xB)
      {
        v15 = (v12 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        v16 = v12 | 3;
        if (v16 == 11)
          v16 = v15;
        v10 = v16 + 1;
        if (v16 + 1 < 0)
          std::__throw_bad_array_new_length[abi:ne180100]();
      }
      else
      {
        v10 = 11;
      }
    }
    v17 = operator new(2 * v10);
    v18 = (std::basic_string<char16_t>::size_type)v17;
    if (v5)
      memmove(v17, v11, 2 * v5);
    if (v7 != 10)
      operator delete(v11);
    v3->__r_.__value_.__l.__size_ = v5;
    v3->__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    v3->__r_.__value_.__r.__words[0] = v18;
  }
  v14 = (std::basic_string<char16_t> *)v3->__r_.__value_.__r.__words[0];
LABEL_29:
  v19 = (std::basic_string<char16_t> *)((char *)v14 + 2 * v5);
  v20 = v6;
  do
  {
    v19->__r_.__value_.__s.__data_[0] = 0;
    v19 = (std::basic_string<char16_t> *)((char *)v19 + 2);
    --v20;
  }
  while (v20);
  v21 = v5 + v6;
  if (SHIBYTE(v3->__r_.__value_.__r.__words[2]) < 0)
    v3->__r_.__value_.__l.__size_ = v21;
  else
    *((_BYTE *)&v3->__r_.__value_.__s + 23) = v21 & 0x7F;
  v13 = (std::basic_string<char16_t> *)((char *)v14 + 2 * v21);
LABEL_35:
  v13->__r_.__value_.__s.__data_[0] = 0;
}

void sub_21A3E2488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21A3E2DE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21A3E32BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);

  _Unwind_Resume(a1);
}

void sub_21A3E36A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3E3958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E3A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_21A3E3BE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_21A3E3EA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E4128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A3E43E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E4518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2642(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2643(uint64_t a1)
{

}

void sub_21A3E45C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E49DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E4C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3E4EB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E4FF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E513C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E5274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E53AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E56A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3E604C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_21A3E6398(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E6444(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3E67A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_21A3E8570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  id *v69;
  id *v70;
  uint64_t v71;

  objc_destroyWeak(v69);
  objc_destroyWeak(v70);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v71 - 256), 8);
  _Block_object_dispose((const void *)(v71 - 208), 8);
  _Block_object_dispose((const void *)(v71 - 160), 8);
  objc_destroyWeak((id *)(v71 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3178(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3179(uint64_t a1)
{

}

void sub_21A3E9218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3E95DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3E9794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3E9CE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EA12C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EA4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A3EA9C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EB4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint8_t buf)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21A3EBBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A3EC24C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_21A3ECDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__3408(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3409(uint64_t a1)
{

}

void sub_21A3ED600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21A3ED934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21A3EDAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__304(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__305(uint64_t a1)
{

}

void sub_21A3EE3C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EE460(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EE55C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EE5E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EE638(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3EE69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A3EE74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21A3EEB60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_21A3EEFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3566(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3567(uint64_t a1)
{

}

void sub_21A3EF238(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id *v11;
  uint64_t v12;
  id v15;
  uint64_t v16;
  NSObject *v17;

  if (a2)
  {
    objc_destroyWeak(v11);
    if (a2 != 2)
    {
      objc_begin_catch(a1);
      JUMPOUT(0x21A3EF150);
    }
    v15 = objc_begin_catch(a1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Service [%@] hit an exception for handlerid: %@\nException:%@"));
    v16 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)(v12 - 64) = 136315394;
      *(_QWORD *)(v12 - 60) = "+[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:re"
                              "questId:dataDispatcherContext:serviceMetricsArray:]_block_invoke_2";
      *(_WORD *)(v12 - 52) = 2112;
      *(_QWORD *)(v12 - 50) = v16;
      _os_log_fault_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_FAULT, "%s [FAULT]%@", (uint8_t *)(v12 - 64), 0x16u);
    }

    objc_exception_rethrow();
  }
  JUMPOUT(0x21A3EF344);
}

void sub_21A3EF310(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x21A3EF254);
  }
  JUMPOUT(0x21A3EF344);
}

void sub_21A3EF328(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_21A3EFF00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21A3F0638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_sync_exit(v12);
  _Unwind_Resume(a1);
}

void sub_21A3F0920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3F0ADC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21A3F0C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3F0DA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A3F0F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3F10C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A3F1230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3F1484(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F3730(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3F3968(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3F3C64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A3F7038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F72BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F7540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F77C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F7A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F7CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F7F50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F81D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F8458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F86DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F8960(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F8BE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F8E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F90EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3F93A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3F966C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3F9EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  void *v37;
  void *v38;

  objc_end_catch();
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);

  _Unwind_Resume(a1);
}

void sub_21A3F9EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;

  if (SLOBYTE(STACK[0x207]) < 0)
    operator delete(__p);
  JUMPOUT(0x21A3F9FC8);
}

void sub_21A3F9EFC()
{
  JUMPOUT(0x21A3F9FC8);
}

void sub_21A3F9F18()
{
  JUMPOUT(0x21A3F9FD4);
}

void sub_21A3F9F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;
  void *v71;

  std::locale::~locale(&a71);

  JUMPOUT(0x21A3F9F38);
}

void sub_21A3F9F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100]((uint64_t)va1);

  JUMPOUT(0x21A3F9FC4);
}

void sub_21A3F9F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a73;

  if (a24 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a73);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a27);
  JUMPOUT(0x21A3F9FB8);
}

void sub_21A3F9F6C()
{
  JUMPOUT(0x21A3F9FC0);
}

void sub_21A3F9F78()
{
  JUMPOUT(0x21A3F9FB0);
}

void sub_21A3F9F80(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::locale a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a71;

  std::locale::~locale(&a19);
  std::ostringstream::~ostringstream((uint64_t)&a71);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a24);
  JUMPOUT(0x21A3F9FB8);
}

void sub_21A3F9F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  void *v37;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);
  _Unwind_Resume(a1);
}

void sub_21A3F9F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(&a36);
  _Unwind_Resume(a1);
}

void sub_21A3FA7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  void *v37;

  objc_end_catch();
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);

  _Unwind_Resume(a1);
}

void sub_21A3FA818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;

  if (SLOBYTE(STACK[0x207]) < 0)
    operator delete(__p);
  JUMPOUT(0x21A3FA91CLL);
}

void sub_21A3FA840()
{
  JUMPOUT(0x21A3FA91CLL);
}

void sub_21A3FA854()
{
  JUMPOUT(0x21A3FA924);
}

void sub_21A3FA85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;
  void *v71;

  std::locale::~locale(&a71);

  JUMPOUT(0x21A3FA874);
}

void sub_21A3FA884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  void *v14;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100]((uint64_t)va1);

  JUMPOUT(0x21A3FA914);
}

void sub_21A3FA894()
{
  JUMPOUT(0x21A3FA90CLL);
}

void sub_21A3FA89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a73;

  if (a24 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a73);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a27);
  JUMPOUT(0x21A3FA904);
}

void sub_21A3FA8B4()
{
  JUMPOUT(0x21A3FA910);
}

void sub_21A3FA8C0()
{
  JUMPOUT(0x21A3FA8FCLL);
}

void sub_21A3FA8C8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::locale a19)
{
  std::locale::~locale(&a19);
  JUMPOUT(0x21A3FA8F0);
}

void sub_21A3FA8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  void *v37;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);
  _Unwind_Resume(a1);
}

void sub_21A3FA8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(&a36);
  _Unwind_Resume(a1);
}

void sub_21A3FA8EC()
{
  JUMPOUT(0x21A3FA8F4);
}

void sub_21A3FA9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A3FAB24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3FAE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FB158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FB3EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FB928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21A3FBCF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3FBFFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3FC2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A3FC53C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FC7B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FCAB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FCDA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FD098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A3FD470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_21A3FD604(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x22074405C](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *p_b;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _BYTE v23[16];
  std::locale __b;
  size_t v25;
  int64_t v26;

  MEMORY[0x220743FCC](v23, a1);
  if (v23[0])
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        v25 = v16;
        v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0)
        operator delete(__b.__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x220743FD8](v23);
  return a1;
}

void sub_21A3FD84C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x220743FD8](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21A3FD820);
}

void sub_21A3FD8AC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_21A3FD984(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x22074405C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22074405C](a1 + 112);
  return a1;
}

uint64_t std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    MEMORY[0x220743D5C]();
    JUMPOUT(0x22074408CLL);
  }
  return result;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22074405C](a1 + 128);
  return a1;
}

void sub_21A3FE6D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A3FEDC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v3);
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_21A3FF324(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

void sub_21A3FF6D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_sync_exit(v6);
  _Unwind_Resume(a1);
}

void sub_21A3FF89C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3FFA18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A3FFB50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A400F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A401238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A40169C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A401768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A40280C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Block_object_dispose(&STACK[0x400], 8);
  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x520], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Block_object_dispose(&STACK[0x5B0], 8);
  _Block_object_dispose((const void *)(v2 - 256), 8);
  _Block_object_dispose((const void *)(v2 - 208), 8);
  _Block_object_dispose((const void *)(v2 - 160), 8);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4771(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4772(uint64_t a1)
{

}

void sub_21A404320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v6;

  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

void sub_21A404754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_sync_exit(v6);
  _Unwind_Resume(a1);
}

void sub_21A404D64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_21A404F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A40501C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A405250(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21A4052DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A40537C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A4053E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A40556C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A405688(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A40EBD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  NSObject *v9;

  if (a2)
  {
    objc_begin_catch(exception_object);
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(_QWORD *)((char *)&a9 + 4) = "+[SSUXPCUtils dispatchAsyncWithTransaction:block:]_block_invoke";
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Hit exception when running block. The open OS transaction will still be ended.", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x21A40EBACLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21A411B08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A411C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A411F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

void sub_21A41208C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A412374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_21A4124A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21A412704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A4129D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A412C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_21A412F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A413254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21A4138A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21A413D90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A414120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A414398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A414C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21A415870(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A415A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A415B40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v1;

  _Unwind_Resume(a1);
}

void sub_21A415C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21A415CE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A415E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A415F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A4160C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A416310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A416644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_21A41671C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A416EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A417874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21A417E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

void sub_21A4181D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_sync_exit(v6);
  _Unwind_Resume(a1);
}

void sub_21A4183AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A418510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A41864C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A418730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21A418840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A4188B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A418B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak((id *)(v29 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6147(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6148(uint64_t a1)
{

}

os_log_t createLogForCategoryString(const char *category)
{
  return os_log_create("com.apple.siri.cdm", category);
}

id CDMOSLoggerForCategory(int a1)
{
  if (a1 >= 5)
    __assert_rtn("CDMOSLoggerForCategory", "CDMLogging.mm", 18, "loggingCategory < CDMCategoryLogMax");
  if (CDMOSLoggerForCategory::onceToken != -1)
    dispatch_once(&CDMOSLoggerForCategory::onceToken, &__block_literal_global_6235);
  return (id)CDMOSLoggerForCategory::logObjects[a1];
}

void sub_21A41AB18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_21A41ACE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A41AFE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A420BEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A4211EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A421600(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A421EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__6654(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6655(uint64_t a1)
{

}

void sub_21A423790(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A423928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A424008(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A4240C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A424140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A4241B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A424728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A425298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A4257A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_21A425B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v24 = v20;

  _Unwind_Resume(a1);
}

void sub_21A426460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A426ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_21A427224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A427440(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A427760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v24 = v20;

  _Unwind_Resume(a1);
}

void sub_21A427C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21A428078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A428174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A42822C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A428298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A428338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A4283A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A428414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A428B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A428EAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A429274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A429338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A4293DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A42A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RadarDraftFunction()
{
  return (id)classRadarDraft;
}

Class initRadarDraft()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_7328);
  result = objc_getClass("RadarDraft");
  classRadarDraft = (uint64_t)result;
  getRadarDraftClass = (uint64_t (*)())RadarDraftFunction;
  return result;
}

id RadarComponentFunction()
{
  return (id)classRadarComponent;
}

Class initRadarComponent()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_7328);
  result = objc_getClass("RadarComponent");
  classRadarComponent = (uint64_t)result;
  getRadarComponentClass = (uint64_t (*)())RadarComponentFunction;
  return result;
}

id TapToRadarServiceFunction()
{
  return (id)classTapToRadarService;
}

Class initTapToRadarService()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_7328);
  result = objc_getClass("TapToRadarService");
  classTapToRadarService = (uint64_t)result;
  getTapToRadarServiceClass = (uint64_t (*)())TapToRadarServiceFunction;
  return result;
}

void sub_21A42A554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A42AF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19)
{

  _Unwind_Resume(a1);
}

void sub_21A42B23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A42B5E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A42C630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A42CA88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7509(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7510(uint64_t a1)
{

}

void sub_21A42DBA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A42F3DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A4323A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A43253C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A4325EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21A432680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21A4328DC()
{
  void *v0;
  void *v1;
  uint64_t v2;

  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x21A432964);
}

void sub_21A4328F8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_21A432908()
{
  JUMPOUT(0x21A432958);
}

void sub_21A432914(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  if (a22 < 0)
    operator delete(__p);
  marisa::Agent::~Agent((marisa::Agent *)&v25);

  JUMPOUT(0x21A432964);
}

void sub_21A432B58()
{
  void *v0;
  void *v1;
  uint64_t v2;

  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x21A432BD4);
}

void sub_21A432B74(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_21A432B84()
{
  JUMPOUT(0x21A432BC8);
}

void sub_21A432B90(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  uint64_t v24;

  if (a22 < 0)
    operator delete(__p);
  marisa::Agent::~Agent((marisa::Agent *)&v24);

  JUMPOUT(0x21A432BD4);
}

void sub_21A432C70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A432E94(_Unwind_Exception *a1, uint64_t a2, void *a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  marisa::Agent::~Agent((marisa::Agent *)va);
  _Unwind_Resume(a1);
}

void sub_21A433064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_21A43336C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;

  marisa::Agent::~Agent((marisa::Agent *)&a9);
  _Unwind_Resume(a1);
}

uint64_t *marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v2 - 8);
    v4 = v2 - 8;
    v3 = v5;
    if (v5)
    {
      v6 = 8 * v3;
      do
      {
        v7 = *(_QWORD *)(v4 + v6);
        if (v7)
          MEMORY[0x220744074](v7, 0x1050C80717B85FCLL);
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x220744074](v4 - 8, 0x20C8093837F09);
  }
  return a1;
}

uint64_t *marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v2 - 8);
    v4 = v2 - 8;
    v3 = v5;
    if (v5)
    {
      v6 = 8 * v3;
      do
      {
        v7 = *(_QWORD *)(v4 + v6);
        if (v7)
          MEMORY[0x220744074](v7, 0x1000C8077774924);
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x220744074](v4 - 8, 0x10C80436913F5);
  }
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void sub_21A433C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A433DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8029(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8030(uint64_t a1)
{

}

void sub_21A4344E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A434578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CDMMarisaTrie;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21A43460C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A434864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,__int128 buf)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  NSObject *v39;
  uint64_t v40;

  if (a2 == 1)
  {
    v38 = __cxa_begin_catch(a1);
    CDMOSLoggerForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = (*(uint64_t (**)(void *))(*(_QWORD *)v38 + 16))(v38);
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "-[CDMMarisaTrie createFromEntries:withHashValue:]";
      WORD6(buf) = 2080;
      *(_QWORD *)((char *)&buf + 14) = v40;
      _os_log_error_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_ERROR, "%s [ERR]: Marisa Exception: %s", (uint8_t *)&buf, 0x16u);
    }

    __cxa_end_catch();
    JUMPOUT(0x21A4347F8);
  }

  marisa::Keyset::~Keyset((marisa::Keyset *)&a20);
  _Unwind_Resume(a1);
}

void sub_21A434A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A434AC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A434BB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A434C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  marisa::Trie *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;

  if (a2 == 1)
  {
    v10 = __cxa_begin_catch(exception_object);
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (*(uint64_t (**)(void *))(*(_QWORD *)v10 + 16))(v10);
      LODWORD(a9) = 136315394;
      *(_QWORD *)((char *)&a9 + 4) = "-[CDMMarisaTrie _loadTrie]";
      WORD6(a9) = 2080;
      *(_QWORD *)((char *)&a9 + 14) = v12;
      _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Marisa Exception: %s", (uint8_t *)&a9, 0x16u);
    }

    marisa::Trie::clear(v9);
    __cxa_end_catch();
    JUMPOUT(0x21A434C60);
  }
  _Unwind_Resume(exception_object);
}

void sub_21A434EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void marisa::Keyset::~Keyset(marisa::Keyset *this)
{
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)this + 6);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)this + 3);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)this);
}

void sub_21A437294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 16))(v26);
  if (*(char *)(v28 - 81) < 0)
    operator delete(*(void **)(v28 - 104));

  _Unwind_Resume(a1);
}

void sub_21A4376A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21A437B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A437C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21A43867C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A438984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A438C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A438F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  void *v22;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A43923C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  void *v22;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A43953C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A439750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  void *v18;

  if (a16)
  {
    if (a15 < 0)
      operator delete(__p);
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_21A4399EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  void *v22;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A439BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  void *v18;

  if (a16)
  {
    if (a15 < 0)
      operator delete(__p);
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_21A439DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  void *v18;

  if (a16)
  {
    if (a15 < 0)
      operator delete(__p);
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_21A439F6C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x22074408C](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_21A43A27C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x22074408C](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_21A43A918(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x22074408C](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_21A43B03C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x22074408C](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_21A43BF24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_21A43C470(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22074408C](v1, 0x10A0C403D23BABBLL);
  _Unwind_Resume(a1);
}

void sub_21A43C6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  void *v22;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A43C9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  void *v22;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_21A43CCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  if (*(char *)(v51 - 89) < 0)
    operator delete(*(void **)(v51 - 112));
  if (a35 && a34 < 0)
    operator delete(__p);
  if (a41 < 0)
    operator delete(a36);
  if (a48 < 0)
    operator delete(a43);
  if (a22 < 0)
    operator delete(a17);
  if (a28 < 0)
    operator delete(a23);
  MEMORY[0x22074408C](v50, 0x1012C40071C2685);

  _Unwind_Resume(a1);
}

void sub_21A43CF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  void ***v24;

  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](v24);

  _Unwind_Resume(a1);
}

void sub_21A43D0A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22074408C](v1, 0x10A0C403D23BABBLL);
  _Unwind_Resume(a1);
}

void sub_21A43D6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t appName(void)
{
  unsigned __int8 v0;
  _QWORD *v2;

  {
    v2 = (_QWORD *)operator new();
    std::string::basic_string[abi:ne180100]<0>(v2, "com.apple.siri.sirinl");
    appName(void)::value = (uint64_t)v2;
  }
  return appName(void)::value;
}

void sub_21A43D7B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22074408C](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 72) && *(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  JUMPOUT(0x22074408CLL);
}

std::string *std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v3;

  this->__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__s.__data_[0] = 0;
  if (*((_BYTE *)a2 + 24))
  {
    if (*((char *)a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      v3 = *a2;
      this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_21A43D8B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21A441724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A441838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A441918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_21A441E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21A442134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21A44224C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A44234C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A44276C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21A44316C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);
  std::shared_ptr<siri::ontology::UsoVocabManager>::~shared_ptr[abi:ne180100]((uint64_t)&a19);

  _Unwind_Resume(a1);
}

void sub_21A443628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21A44390C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21A443BD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A443CC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21A443E50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A443FBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21A444840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  id *v32;
  uint64_t v33;

  objc_destroyWeak(v32);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v33 - 152), 8);
  objc_destroyWeak((id *)(v33 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9615(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9616(uint64_t a1)
{

}

void sub_21A4453EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21A4455E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A445680(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21A445A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_21A445D38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21A446258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  if (a18 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21A446468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21A446604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21A44A1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A44A324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315394;
      *(_QWORD *)((char *)&a9 + 4) = "-[NSDictionary(CDMJSONSerialization) _cdm_JSONString]";
      WORD6(a9) = 2112;
      *(_QWORD *)((char *)&a9 + 14) = v9;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Exception during JSON Serialization: %@", (uint8_t *)&a9, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x21A44A2E8);
  }
  _Unwind_Resume(exception_object);
}

void sub_21A44A540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A44AE7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A44AEFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A44C2B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t sub_21A44C2F4()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_21A44C300()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_21A44C30C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_21A44C318()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_21A44C324()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21A44C330()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21A44C33C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21A44C348()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_21A44C354()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21A44C360()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t sub_21A44C36C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21A44C378()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_21A44C384()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21A44C390()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21A44C39C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21A44C3A8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21A44C3B4()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_21A44C3C0()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_21A44C3CC()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t sub_21A44C3D8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21A44C3E4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21A44C3F0()
{
  return MEMORY[0x24BDCD4C8]();
}

uint64_t sub_21A44C3FC()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_21A44C408()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_21A44C414()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_21A44C420()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_21A44C42C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21A44C438()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21A44C444()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_21A44C450()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21A44C45C()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_21A44C468()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21A44C474()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21A44C480()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_21A44C48C()
{
  return MEMORY[0x24BDCDA88]();
}

uint64_t sub_21A44C498()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_21A44C4A4()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_21A44C4B0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21A44C4BC()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_21A44C4C8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21A44C4D4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21A44C4E0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_21A44C4EC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21A44C4F8()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_21A44C504()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_21A44C510()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_21A44C51C()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_21A44C528()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21A44C534()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_21A44C540()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21A44C54C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_21A44C558()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21A44C564()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_21A44C570()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21A44C57C()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_21A44C588()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21A44C594()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21A44C5A0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21A44C5AC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21A44C5B8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21A44C5C4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_21A44C5D0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_21A44C5DC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21A44C5E8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21A44C5F4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_21A44C600()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_21A44C60C()
{
  return MEMORY[0x24BDCEB38]();
}

uint64_t sub_21A44C618()
{
  return MEMORY[0x24BDCEB48]();
}

uint64_t sub_21A44C624()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_21A44C630()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_21A44C63C()
{
  return MEMORY[0x24BDCEBB8]();
}

uint64_t sub_21A44C648()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_21A44C654()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_21A44C660()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21A44C66C()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_21A44C678()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_21A44C684()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_21A44C690()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21A44C69C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21A44C6A8()
{
  return MEMORY[0x24BE30C20]();
}

uint64_t sub_21A44C6B4()
{
  return MEMORY[0x24BE30C30]();
}

uint64_t sub_21A44C6C0()
{
  return MEMORY[0x24BE30C38]();
}

uint64_t sub_21A44C6CC()
{
  return MEMORY[0x24BE67F50]();
}

uint64_t sub_21A44C6D8()
{
  return MEMORY[0x24BE680E8]();
}

uint64_t sub_21A44C6E4()
{
  return MEMORY[0x24BE68200]();
}

uint64_t sub_21A44C6F0()
{
  return MEMORY[0x24BE68218]();
}

uint64_t sub_21A44C6FC()
{
  return MEMORY[0x24BE682B0]();
}

uint64_t sub_21A44C708()
{
  return MEMORY[0x24BE682B8]();
}

uint64_t sub_21A44C714()
{
  return MEMORY[0x24BE68388]();
}

uint64_t sub_21A44C720()
{
  return MEMORY[0x24BE68390]();
}

uint64_t sub_21A44C72C()
{
  return MEMORY[0x24BE68508]();
}

uint64_t sub_21A44C738()
{
  return MEMORY[0x24BE68698]();
}

uint64_t sub_21A44C744()
{
  return MEMORY[0x24BE68FD8]();
}

uint64_t sub_21A44C750()
{
  return MEMORY[0x24BE68FF0]();
}

uint64_t sub_21A44C75C()
{
  return MEMORY[0x24BE69030]();
}

uint64_t sub_21A44C768()
{
  return MEMORY[0x24BE69040]();
}

uint64_t sub_21A44C774()
{
  return MEMORY[0x24BE69048]();
}

uint64_t sub_21A44C780()
{
  return MEMORY[0x24BE69050]();
}

uint64_t sub_21A44C78C()
{
  return MEMORY[0x24BE69058]();
}

uint64_t sub_21A44C798()
{
  return MEMORY[0x24BE69068]();
}

uint64_t sub_21A44C7A4()
{
  return MEMORY[0x24BE69080]();
}

uint64_t sub_21A44C7B0()
{
  return MEMORY[0x24BE9C118]();
}

uint64_t sub_21A44C7BC()
{
  return MEMORY[0x24BE9C120]();
}

uint64_t sub_21A44C7C8()
{
  return MEMORY[0x24BE9C130]();
}

uint64_t sub_21A44C7D4()
{
  return MEMORY[0x24BE9C140]();
}

uint64_t sub_21A44C7E0()
{
  return MEMORY[0x24BE9C148]();
}

uint64_t sub_21A44C7EC()
{
  return MEMORY[0x24BE9C160]();
}

uint64_t sub_21A44C7F8()
{
  return MEMORY[0x24BE9C168]();
}

uint64_t sub_21A44C804()
{
  return MEMORY[0x24BE9C1A0]();
}

uint64_t sub_21A44C810()
{
  return MEMORY[0x24BE9C1C8]();
}

uint64_t sub_21A44C81C()
{
  return MEMORY[0x24BE9C1D0]();
}

uint64_t sub_21A44C828()
{
  return MEMORY[0x24BE9C1E0]();
}

uint64_t sub_21A44C834()
{
  return MEMORY[0x24BE9C218]();
}

uint64_t sub_21A44C840()
{
  return MEMORY[0x24BE9C220]();
}

uint64_t sub_21A44C84C()
{
  return MEMORY[0x24BE9C240]();
}

uint64_t sub_21A44C858()
{
  return MEMORY[0x24BE9C290]();
}

uint64_t sub_21A44C864()
{
  return MEMORY[0x24BE9C2B0]();
}

uint64_t sub_21A44C870()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_21A44C87C()
{
  return MEMORY[0x24BE9C2C8]();
}

uint64_t sub_21A44C888()
{
  return MEMORY[0x24BE9C2D0]();
}

uint64_t sub_21A44C894()
{
  return MEMORY[0x24BE9C2E0]();
}

uint64_t sub_21A44C8A0()
{
  return MEMORY[0x24BE9C2F0]();
}

uint64_t sub_21A44C8AC()
{
  return MEMORY[0x24BE9C2F8]();
}

uint64_t sub_21A44C8B8()
{
  return MEMORY[0x24BE9C300]();
}

uint64_t sub_21A44C8C4()
{
  return MEMORY[0x24BE9C308]();
}

uint64_t sub_21A44C8D0()
{
  return MEMORY[0x24BE9C310]();
}

uint64_t sub_21A44C8DC()
{
  return MEMORY[0x24BE9C318]();
}

uint64_t sub_21A44C8E8()
{
  return MEMORY[0x24BE9C320]();
}

uint64_t sub_21A44C8F4()
{
  return MEMORY[0x24BE9C328]();
}

uint64_t sub_21A44C900()
{
  return MEMORY[0x24BE9C330]();
}

uint64_t sub_21A44C90C()
{
  return MEMORY[0x24BE9C338]();
}

uint64_t sub_21A44C918()
{
  return MEMORY[0x24BE9C340]();
}

uint64_t sub_21A44C924()
{
  return MEMORY[0x24BE9C348]();
}

uint64_t sub_21A44C930()
{
  return MEMORY[0x24BE9C358]();
}

uint64_t sub_21A44C93C()
{
  return MEMORY[0x24BE9C360]();
}

uint64_t sub_21A44C948()
{
  return MEMORY[0x24BE9C368]();
}

uint64_t sub_21A44C954()
{
  return MEMORY[0x24BE9C370]();
}

uint64_t sub_21A44C960()
{
  return MEMORY[0x24BE9C388]();
}

uint64_t sub_21A44C96C()
{
  return MEMORY[0x24BE9C390]();
}

uint64_t sub_21A44C978()
{
  return MEMORY[0x24BE9C398]();
}

uint64_t sub_21A44C984()
{
  return MEMORY[0x24BE9C3A0]();
}

uint64_t sub_21A44C990()
{
  return MEMORY[0x24BE9C3A8]();
}

uint64_t sub_21A44C99C()
{
  return MEMORY[0x24BE9C3B0]();
}

uint64_t sub_21A44C9A8()
{
  return MEMORY[0x24BE9C3B8]();
}

uint64_t sub_21A44C9B4()
{
  return MEMORY[0x24BE9C3C0]();
}

uint64_t sub_21A44C9C0()
{
  return MEMORY[0x24BE9C3C8]();
}

uint64_t sub_21A44C9CC()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_21A44C9D8()
{
  return MEMORY[0x24BE9C3F0]();
}

uint64_t sub_21A44C9E4()
{
  return MEMORY[0x24BE9C408]();
}

uint64_t sub_21A44C9F0()
{
  return MEMORY[0x24BE9C410]();
}

uint64_t sub_21A44C9FC()
{
  return MEMORY[0x24BE9C428]();
}

uint64_t sub_21A44CA08()
{
  return MEMORY[0x24BE9C430]();
}

uint64_t sub_21A44CA14()
{
  return MEMORY[0x24BE9C448]();
}

uint64_t sub_21A44CA20()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_21A44CA2C()
{
  return MEMORY[0x24BE9C460]();
}

uint64_t sub_21A44CA38()
{
  return MEMORY[0x24BE9C468]();
}

uint64_t sub_21A44CA44()
{
  return MEMORY[0x24BE9C4A0]();
}

uint64_t sub_21A44CA50()
{
  return MEMORY[0x24BE9C4A8]();
}

uint64_t sub_21A44CA5C()
{
  return MEMORY[0x24BE9C4B0]();
}

uint64_t sub_21A44CA68()
{
  return MEMORY[0x24BE9C4B8]();
}

uint64_t sub_21A44CA74()
{
  return MEMORY[0x24BE9C4F0]();
}

uint64_t sub_21A44CA80()
{
  return MEMORY[0x24BE9C4F8]();
}

uint64_t sub_21A44CA8C()
{
  return MEMORY[0x24BE9C508]();
}

uint64_t sub_21A44CA98()
{
  return MEMORY[0x24BE9C510]();
}

uint64_t sub_21A44CAA4()
{
  return MEMORY[0x24BE9C518]();
}

uint64_t sub_21A44CAB0()
{
  return MEMORY[0x24BE9C520]();
}

uint64_t sub_21A44CABC()
{
  return MEMORY[0x24BE9C530]();
}

uint64_t sub_21A44CAC8()
{
  return MEMORY[0x24BE9C538]();
}

uint64_t sub_21A44CAD4()
{
  return MEMORY[0x24BE9C540]();
}

uint64_t sub_21A44CAE0()
{
  return MEMORY[0x24BE9C548]();
}

uint64_t sub_21A44CAEC()
{
  return MEMORY[0x24BE9C550]();
}

uint64_t sub_21A44CAF8()
{
  return MEMORY[0x24BE9C570]();
}

uint64_t sub_21A44CB04()
{
  return MEMORY[0x24BE9C578]();
}

uint64_t sub_21A44CB10()
{
  return MEMORY[0x24BE9C598]();
}

uint64_t sub_21A44CB1C()
{
  return MEMORY[0x24BE9C5A0]();
}

uint64_t sub_21A44CB28()
{
  return MEMORY[0x24BE9C640]();
}

uint64_t sub_21A44CB34()
{
  return MEMORY[0x24BE9C650]();
}

uint64_t sub_21A44CB40()
{
  return MEMORY[0x24BE9C658]();
}

uint64_t sub_21A44CB4C()
{
  return MEMORY[0x24BE9C660]();
}

uint64_t sub_21A44CB58()
{
  return MEMORY[0x24BE9C668]();
}

uint64_t sub_21A44CB64()
{
  return MEMORY[0x24BE9C670]();
}

uint64_t sub_21A44CB70()
{
  return MEMORY[0x24BE9C678]();
}

uint64_t sub_21A44CB7C()
{
  return MEMORY[0x24BE9C680]();
}

uint64_t sub_21A44CB88()
{
  return MEMORY[0x24BE9C690]();
}

uint64_t sub_21A44CB94()
{
  return MEMORY[0x24BE9C698]();
}

uint64_t sub_21A44CBA0()
{
  return MEMORY[0x24BE9C6A0]();
}

uint64_t sub_21A44CBAC()
{
  return MEMORY[0x24BE9C6A8]();
}

uint64_t sub_21A44CBB8()
{
  return MEMORY[0x24BE9C6B0]();
}

uint64_t sub_21A44CBC4()
{
  return MEMORY[0x24BE9C6B8]();
}

uint64_t sub_21A44CBD0()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_21A44CBDC()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_21A44CBE8()
{
  return MEMORY[0x24BE9C748]();
}

uint64_t sub_21A44CBF4()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_21A44CC00()
{
  return MEMORY[0x24BE9C7D8]();
}

uint64_t sub_21A44CC0C()
{
  return MEMORY[0x24BE9C7F0]();
}

uint64_t sub_21A44CC18()
{
  return MEMORY[0x24BE9C810]();
}

uint64_t sub_21A44CC24()
{
  return MEMORY[0x24BE9C818]();
}

uint64_t sub_21A44CC30()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_21A44CC3C()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_21A44CC48()
{
  return MEMORY[0x24BE9C838]();
}

uint64_t sub_21A44CC54()
{
  return MEMORY[0x24BE9C850]();
}

uint64_t sub_21A44CC60()
{
  return MEMORY[0x24BE9C860]();
}

uint64_t sub_21A44CC6C()
{
  return MEMORY[0x24BE9C868]();
}

uint64_t sub_21A44CC78()
{
  return MEMORY[0x24BE9C870]();
}

uint64_t sub_21A44CC84()
{
  return MEMORY[0x24BE9C878]();
}

uint64_t sub_21A44CC90()
{
  return MEMORY[0x24BE9C880]();
}

uint64_t sub_21A44CC9C()
{
  return MEMORY[0x24BE9C888]();
}

uint64_t sub_21A44CCA8()
{
  return MEMORY[0x24BE9C890]();
}

uint64_t sub_21A44CCB4()
{
  return MEMORY[0x24BE9C898]();
}

uint64_t sub_21A44CCC0()
{
  return MEMORY[0x24BE9C8A0]();
}

uint64_t sub_21A44CCCC()
{
  return MEMORY[0x24BE9CA90]();
}

uint64_t sub_21A44CCD8()
{
  return MEMORY[0x24BE9CAA8]();
}

uint64_t sub_21A44CCE4()
{
  return MEMORY[0x24BE9CAB0]();
}

uint64_t sub_21A44CCF0()
{
  return MEMORY[0x24BE9CAD0]();
}

uint64_t sub_21A44CCFC()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_21A44CD08()
{
  return MEMORY[0x24BE9CAF8]();
}

uint64_t sub_21A44CD14()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_21A44CD20()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_21A44CD2C()
{
  return MEMORY[0x24BE9CB38]();
}

uint64_t sub_21A44CD38()
{
  return MEMORY[0x24BE9CB48]();
}

uint64_t sub_21A44CD44()
{
  return MEMORY[0x24BE9CB50]();
}

uint64_t sub_21A44CD50()
{
  return MEMORY[0x24BE9CB58]();
}

uint64_t sub_21A44CD5C()
{
  return MEMORY[0x24BE9CB60]();
}

uint64_t sub_21A44CD68()
{
  return MEMORY[0x24BE9CB68]();
}

uint64_t sub_21A44CD74()
{
  return MEMORY[0x24BE9CB78]();
}

uint64_t sub_21A44CD80()
{
  return MEMORY[0x24BE9CB80]();
}

uint64_t sub_21A44CD8C()
{
  return MEMORY[0x24BE9CB88]();
}

uint64_t sub_21A44CD98()
{
  return MEMORY[0x24BE9CB90]();
}

uint64_t sub_21A44CDA4()
{
  return MEMORY[0x24BE9CB98]();
}

uint64_t sub_21A44CDB0()
{
  return MEMORY[0x24BE9CBA0]();
}

uint64_t sub_21A44CDBC()
{
  return MEMORY[0x24BE9CBA8]();
}

uint64_t sub_21A44CDC8()
{
  return MEMORY[0x24BE9CBB0]();
}

uint64_t sub_21A44CDD4()
{
  return MEMORY[0x24BE9CBB8]();
}

uint64_t sub_21A44CDE0()
{
  return MEMORY[0x24BE9CBC0]();
}

uint64_t sub_21A44CDEC()
{
  return MEMORY[0x24BE9CBC8]();
}

uint64_t sub_21A44CDF8()
{
  return MEMORY[0x24BE9CBD0]();
}

uint64_t sub_21A44CE04()
{
  return MEMORY[0x24BE9CC08]();
}

uint64_t sub_21A44CE10()
{
  return MEMORY[0x24BE9CC28]();
}

uint64_t sub_21A44CE1C()
{
  return MEMORY[0x24BE9CC48]();
}

uint64_t sub_21A44CE28()
{
  return MEMORY[0x24BE9CC80]();
}

uint64_t sub_21A44CE34()
{
  return MEMORY[0x24BE9CCA8]();
}

uint64_t sub_21A44CE40()
{
  return MEMORY[0x24BE9CCC0]();
}

uint64_t sub_21A44CE4C()
{
  return MEMORY[0x24BE9CCC8]();
}

uint64_t sub_21A44CE58()
{
  return MEMORY[0x24BE9CCE0]();
}

uint64_t sub_21A44CE64()
{
  return MEMORY[0x24BE9CCE8]();
}

uint64_t sub_21A44CE70()
{
  return MEMORY[0x24BE9CD38]();
}

uint64_t sub_21A44CE7C()
{
  return MEMORY[0x24BE9CD50]();
}

uint64_t sub_21A44CE88()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_21A44CE94()
{
  return MEMORY[0x24BE9CD90]();
}

uint64_t sub_21A44CEA0()
{
  return MEMORY[0x24BE9CE20]();
}

uint64_t sub_21A44CEAC()
{
  return MEMORY[0x24BE9CE30]();
}

uint64_t sub_21A44CEB8()
{
  return MEMORY[0x24BE9CE50]();
}

uint64_t sub_21A44CEC4()
{
  return MEMORY[0x24BE9CE58]();
}

uint64_t sub_21A44CED0()
{
  return MEMORY[0x24BE9CE60]();
}

uint64_t sub_21A44CEDC()
{
  return MEMORY[0x24BE9CE68]();
}

uint64_t sub_21A44CEE8()
{
  return MEMORY[0x24BE9CE70]();
}

uint64_t sub_21A44CEF4()
{
  return MEMORY[0x24BE9CE78]();
}

uint64_t sub_21A44CF00()
{
  return MEMORY[0x24BE9CE88]();
}

uint64_t sub_21A44CF0C()
{
  return MEMORY[0x24BE9CE90]();
}

uint64_t sub_21A44CF18()
{
  return MEMORY[0x24BE9CE98]();
}

uint64_t sub_21A44CF24()
{
  return MEMORY[0x24BE9CEA0]();
}

uint64_t sub_21A44CF30()
{
  return MEMORY[0x24BE9CEA8]();
}

uint64_t sub_21A44CF3C()
{
  return MEMORY[0x24BE9CEB0]();
}

uint64_t sub_21A44CF48()
{
  return MEMORY[0x24BE9CEC0]();
}

uint64_t sub_21A44CF54()
{
  return MEMORY[0x24BE9CEC8]();
}

uint64_t sub_21A44CF60()
{
  return MEMORY[0x24BE9CED0]();
}

uint64_t sub_21A44CF6C()
{
  return MEMORY[0x24BE9CED8]();
}

uint64_t sub_21A44CF78()
{
  return MEMORY[0x24BE9CEE0]();
}

uint64_t sub_21A44CF84()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_21A44CF90()
{
  return MEMORY[0x24BE9CFA8]();
}

uint64_t sub_21A44CF9C()
{
  return MEMORY[0x24BE9CFB0]();
}

uint64_t sub_21A44CFA8()
{
  return MEMORY[0x24BE9CFB8]();
}

uint64_t sub_21A44CFB4()
{
  return MEMORY[0x24BE9CFC0]();
}

uint64_t sub_21A44CFC0()
{
  return MEMORY[0x24BE9D018]();
}

uint64_t sub_21A44CFCC()
{
  return MEMORY[0x24BE9D020]();
}

uint64_t sub_21A44CFD8()
{
  return MEMORY[0x24BE9D028]();
}

uint64_t sub_21A44CFE4()
{
  return MEMORY[0x24BE9D030]();
}

uint64_t sub_21A44CFF0()
{
  return MEMORY[0x24BE9D038]();
}

uint64_t sub_21A44CFFC()
{
  return MEMORY[0x24BE9D040]();
}

uint64_t sub_21A44D008()
{
  return MEMORY[0x24BE9D048]();
}

uint64_t sub_21A44D014()
{
  return MEMORY[0x24BE9D050]();
}

uint64_t sub_21A44D020()
{
  return MEMORY[0x24BE9D058]();
}

uint64_t sub_21A44D02C()
{
  return MEMORY[0x24BE9D060]();
}

uint64_t sub_21A44D038()
{
  return MEMORY[0x24BE9D068]();
}

uint64_t sub_21A44D044()
{
  return MEMORY[0x24BE9D070]();
}

uint64_t sub_21A44D050()
{
  return MEMORY[0x24BE9D078]();
}

uint64_t sub_21A44D05C()
{
  return MEMORY[0x24BE9D080]();
}

uint64_t sub_21A44D068()
{
  return MEMORY[0x24BE9D088]();
}

uint64_t sub_21A44D074()
{
  return MEMORY[0x24BE9D090]();
}

uint64_t sub_21A44D080()
{
  return MEMORY[0x24BE9D098]();
}

uint64_t sub_21A44D08C()
{
  return MEMORY[0x24BE9D0A0]();
}

uint64_t sub_21A44D098()
{
  return MEMORY[0x24BE9D0A8]();
}

uint64_t sub_21A44D0A4()
{
  return MEMORY[0x24BE9D0B8]();
}

uint64_t sub_21A44D0B0()
{
  return MEMORY[0x24BE9D0C0]();
}

uint64_t sub_21A44D0BC()
{
  return MEMORY[0x24BE9D0F8]();
}

uint64_t sub_21A44D0C8()
{
  return MEMORY[0x24BE9D110]();
}

uint64_t sub_21A44D0D4()
{
  return MEMORY[0x24BE9D128]();
}

uint64_t sub_21A44D0E0()
{
  return MEMORY[0x24BE9D138]();
}

uint64_t sub_21A44D0EC()
{
  return MEMORY[0x24BE9D148]();
}

uint64_t sub_21A44D0F8()
{
  return MEMORY[0x24BE9D150]();
}

uint64_t sub_21A44D104()
{
  return MEMORY[0x24BE9D190]();
}

uint64_t sub_21A44D110()
{
  return MEMORY[0x24BE9D198]();
}

uint64_t sub_21A44D11C()
{
  return MEMORY[0x24BE9D1A0]();
}

uint64_t sub_21A44D128()
{
  return MEMORY[0x24BE9D1B0]();
}

uint64_t sub_21A44D134()
{
  return MEMORY[0x24BE9D1B8]();
}

uint64_t sub_21A44D140()
{
  return MEMORY[0x24BE9D1D0]();
}

uint64_t sub_21A44D14C()
{
  return MEMORY[0x24BE9D1E8]();
}

uint64_t sub_21A44D158()
{
  return MEMORY[0x24BE9D200]();
}

uint64_t sub_21A44D164()
{
  return MEMORY[0x24BE9D218]();
}

uint64_t sub_21A44D170()
{
  return MEMORY[0x24BE9D228]();
}

uint64_t sub_21A44D17C()
{
  return MEMORY[0x24BE9D230]();
}

uint64_t sub_21A44D188()
{
  return MEMORY[0x24BE9D238]();
}

uint64_t sub_21A44D194()
{
  return MEMORY[0x24BE9D240]();
}

uint64_t sub_21A44D1A0()
{
  return MEMORY[0x24BE9D248]();
}

uint64_t sub_21A44D1AC()
{
  return MEMORY[0x24BE9D250]();
}

uint64_t sub_21A44D1B8()
{
  return MEMORY[0x24BE9D258]();
}

uint64_t sub_21A44D1C4()
{
  return MEMORY[0x24BE9D260]();
}

uint64_t sub_21A44D1D0()
{
  return MEMORY[0x24BE9D268]();
}

uint64_t sub_21A44D1DC()
{
  return MEMORY[0x24BE9D270]();
}

uint64_t sub_21A44D1E8()
{
  return MEMORY[0x24BE9D278]();
}

uint64_t sub_21A44D1F4()
{
  return MEMORY[0x24BE9D288]();
}

uint64_t sub_21A44D200()
{
  return MEMORY[0x24BE9D290]();
}

uint64_t sub_21A44D20C()
{
  return MEMORY[0x24BE9D2A0]();
}

uint64_t sub_21A44D218()
{
  return MEMORY[0x24BE9D2A8]();
}

uint64_t sub_21A44D224()
{
  return MEMORY[0x24BE9D2B8]();
}

uint64_t sub_21A44D230()
{
  return MEMORY[0x24BE9D2C0]();
}

uint64_t sub_21A44D23C()
{
  return MEMORY[0x24BE9D338]();
}

uint64_t sub_21A44D248()
{
  return MEMORY[0x24BE9D348]();
}

uint64_t sub_21A44D254()
{
  return MEMORY[0x24BE9D350]();
}

uint64_t sub_21A44D260()
{
  return MEMORY[0x24BE9D358]();
}

uint64_t sub_21A44D26C()
{
  return MEMORY[0x24BE9D360]();
}

uint64_t sub_21A44D278()
{
  return MEMORY[0x24BE9D368]();
}

uint64_t sub_21A44D284()
{
  return MEMORY[0x24BE9D378]();
}

uint64_t sub_21A44D290()
{
  return MEMORY[0x24BE9D388]();
}

uint64_t sub_21A44D29C()
{
  return MEMORY[0x24BE9D398]();
}

uint64_t sub_21A44D2A8()
{
  return MEMORY[0x24BE9D3A8]();
}

uint64_t sub_21A44D2B4()
{
  return MEMORY[0x24BE9D3B0]();
}

uint64_t sub_21A44D2C0()
{
  return MEMORY[0x24BE9D3C0]();
}

uint64_t sub_21A44D2CC()
{
  return MEMORY[0x24BE9D3C8]();
}

uint64_t sub_21A44D2D8()
{
  return MEMORY[0x24BE9D3D8]();
}

uint64_t sub_21A44D2E4()
{
  return MEMORY[0x24BE9D3E0]();
}

uint64_t sub_21A44D2F0()
{
  return MEMORY[0x24BE9D3F0]();
}

uint64_t sub_21A44D2FC()
{
  return MEMORY[0x24BE9D3F8]();
}

uint64_t sub_21A44D308()
{
  return MEMORY[0x24BE9D400]();
}

uint64_t sub_21A44D314()
{
  return MEMORY[0x24BE9D408]();
}

uint64_t sub_21A44D320()
{
  return MEMORY[0x24BE9D410]();
}

uint64_t sub_21A44D32C()
{
  return MEMORY[0x24BE9D420]();
}

uint64_t sub_21A44D338()
{
  return MEMORY[0x24BE9D430]();
}

uint64_t sub_21A44D344()
{
  return MEMORY[0x24BE9D448]();
}

uint64_t sub_21A44D350()
{
  return MEMORY[0x24BE9D460]();
}

uint64_t sub_21A44D35C()
{
  return MEMORY[0x24BE9D480]();
}

uint64_t sub_21A44D368()
{
  return MEMORY[0x24BE9D490]();
}

uint64_t sub_21A44D374()
{
  return MEMORY[0x24BE9D498]();
}

uint64_t sub_21A44D380()
{
  return MEMORY[0x24BE9D4A0]();
}

uint64_t sub_21A44D38C()
{
  return MEMORY[0x24BE9D4A8]();
}

uint64_t sub_21A44D398()
{
  return MEMORY[0x24BE9D4B0]();
}

uint64_t sub_21A44D3A4()
{
  return MEMORY[0x24BE9D4B8]();
}

uint64_t sub_21A44D3B0()
{
  return MEMORY[0x24BE9D4C0]();
}

uint64_t sub_21A44D3BC()
{
  return MEMORY[0x24BE9D4F0]();
}

uint64_t sub_21A44D3C8()
{
  return MEMORY[0x24BE9D4F8]();
}

uint64_t sub_21A44D3D4()
{
  return MEMORY[0x24BE9D508]();
}

uint64_t sub_21A44D3E0()
{
  return MEMORY[0x24BE9D510]();
}

uint64_t sub_21A44D3EC()
{
  return MEMORY[0x24BE9D518]();
}

uint64_t sub_21A44D3F8()
{
  return MEMORY[0x24BE9D520]();
}

uint64_t sub_21A44D404()
{
  return MEMORY[0x24BE9D540]();
}

uint64_t sub_21A44D410()
{
  return MEMORY[0x24BE9D548]();
}

uint64_t sub_21A44D41C()
{
  return MEMORY[0x24BE9D550]();
}

uint64_t sub_21A44D428()
{
  return MEMORY[0x24BE9D558]();
}

uint64_t sub_21A44D434()
{
  return MEMORY[0x24BE9D560]();
}

uint64_t sub_21A44D440()
{
  return MEMORY[0x24BE9D570]();
}

uint64_t sub_21A44D44C()
{
  return MEMORY[0x24BE9D578]();
}

uint64_t sub_21A44D458()
{
  return MEMORY[0x24BE9D580]();
}

uint64_t sub_21A44D464()
{
  return MEMORY[0x24BE9D588]();
}

uint64_t sub_21A44D470()
{
  return MEMORY[0x24BE9D590]();
}

uint64_t sub_21A44D47C()
{
  return MEMORY[0x24BE9D598]();
}

uint64_t sub_21A44D488()
{
  return MEMORY[0x24BE9D5A0]();
}

uint64_t sub_21A44D494()
{
  return MEMORY[0x24BE9D5A8]();
}

uint64_t sub_21A44D4A0()
{
  return MEMORY[0x24BE9D5B0]();
}

uint64_t sub_21A44D4AC()
{
  return MEMORY[0x24BE9D5B8]();
}

uint64_t sub_21A44D4B8()
{
  return MEMORY[0x24BE9D5C8]();
}

uint64_t sub_21A44D4C4()
{
  return MEMORY[0x24BE9D5D0]();
}

uint64_t sub_21A44D4D0()
{
  return MEMORY[0x24BE9D5D8]();
}

uint64_t sub_21A44D4DC()
{
  return MEMORY[0x24BE9D5E0]();
}

uint64_t sub_21A44D4E8()
{
  return MEMORY[0x24BE9D5F8]();
}

uint64_t sub_21A44D4F4()
{
  return MEMORY[0x24BE9D608]();
}

uint64_t sub_21A44D500()
{
  return MEMORY[0x24BE9D610]();
}

uint64_t sub_21A44D50C()
{
  return MEMORY[0x24BE9D618]();
}

uint64_t sub_21A44D518()
{
  return MEMORY[0x24BE9D620]();
}

uint64_t sub_21A44D524()
{
  return MEMORY[0x24BE9D628]();
}

uint64_t sub_21A44D530()
{
  return MEMORY[0x24BE9D630]();
}

uint64_t sub_21A44D53C()
{
  return MEMORY[0x24BE9D638]();
}

uint64_t sub_21A44D548()
{
  return MEMORY[0x24BE9D640]();
}

uint64_t sub_21A44D554()
{
  return MEMORY[0x24BE9D648]();
}

uint64_t sub_21A44D560()
{
  return MEMORY[0x24BE9D650]();
}

uint64_t sub_21A44D56C()
{
  return MEMORY[0x24BE9D658]();
}

uint64_t sub_21A44D578()
{
  return MEMORY[0x24BE9D660]();
}

uint64_t sub_21A44D584()
{
  return MEMORY[0x24BE9D668]();
}

uint64_t sub_21A44D590()
{
  return MEMORY[0x24BE9D670]();
}

uint64_t sub_21A44D59C()
{
  return MEMORY[0x24BE9D678]();
}

uint64_t sub_21A44D5A8()
{
  return MEMORY[0x24BE9D680]();
}

uint64_t sub_21A44D5B4()
{
  return MEMORY[0x24BE9D688]();
}

uint64_t sub_21A44D5C0()
{
  return MEMORY[0x24BE9D690]();
}

uint64_t sub_21A44D5CC()
{
  return MEMORY[0x24BE9D698]();
}

uint64_t sub_21A44D5D8()
{
  return MEMORY[0x24BE9D6A0]();
}

uint64_t sub_21A44D5E4()
{
  return MEMORY[0x24BE9D6B0]();
}

uint64_t sub_21A44D5F0()
{
  return MEMORY[0x24BE9D6B8]();
}

uint64_t sub_21A44D5FC()
{
  return MEMORY[0x24BE9D6C0]();
}

uint64_t sub_21A44D608()
{
  return MEMORY[0x24BE9D6C8]();
}

uint64_t sub_21A44D614()
{
  return MEMORY[0x24BE9D6D0]();
}

uint64_t sub_21A44D620()
{
  return MEMORY[0x24BE9D6D8]();
}

uint64_t sub_21A44D62C()
{
  return MEMORY[0x24BE9D6E0]();
}

uint64_t sub_21A44D638()
{
  return MEMORY[0x24BE9D6E8]();
}

uint64_t sub_21A44D644()
{
  return MEMORY[0x24BE9D6F0]();
}

uint64_t sub_21A44D650()
{
  return MEMORY[0x24BE9D6F8]();
}

uint64_t sub_21A44D65C()
{
  return MEMORY[0x24BE9D700]();
}

uint64_t sub_21A44D668()
{
  return MEMORY[0x24BE9D708]();
}

uint64_t sub_21A44D674()
{
  return MEMORY[0x24BE9D710]();
}

uint64_t sub_21A44D680()
{
  return MEMORY[0x24BE9D718]();
}

uint64_t sub_21A44D68C()
{
  return MEMORY[0x24BE9D720]();
}

uint64_t sub_21A44D698()
{
  return MEMORY[0x24BE9D728]();
}

uint64_t sub_21A44D6A4()
{
  return MEMORY[0x24BE9D730]();
}

uint64_t sub_21A44D6B0()
{
  return MEMORY[0x24BE9D738]();
}

uint64_t sub_21A44D6BC()
{
  return MEMORY[0x24BE9D740]();
}

uint64_t sub_21A44D6C8()
{
  return MEMORY[0x24BE9D748]();
}

uint64_t sub_21A44D6D4()
{
  return MEMORY[0x24BE9D750]();
}

uint64_t sub_21A44D6E0()
{
  return MEMORY[0x24BE9D758]();
}

uint64_t sub_21A44D6EC()
{
  return MEMORY[0x24BE9D760]();
}

uint64_t sub_21A44D6F8()
{
  return MEMORY[0x24BE9D768]();
}

uint64_t sub_21A44D704()
{
  return MEMORY[0x24BE9D770]();
}

uint64_t sub_21A44D710()
{
  return MEMORY[0x24BE9D778]();
}

uint64_t sub_21A44D71C()
{
  return MEMORY[0x24BE9D780]();
}

uint64_t sub_21A44D728()
{
  return MEMORY[0x24BE9D788]();
}

uint64_t sub_21A44D734()
{
  return MEMORY[0x24BE9D790]();
}

uint64_t sub_21A44D740()
{
  return MEMORY[0x24BE9D798]();
}

uint64_t sub_21A44D74C()
{
  return MEMORY[0x24BE9D7A0]();
}

uint64_t sub_21A44D758()
{
  return MEMORY[0x24BE9D7A8]();
}

uint64_t sub_21A44D764()
{
  return MEMORY[0x24BE9D7B0]();
}

uint64_t sub_21A44D770()
{
  return MEMORY[0x24BE9D7B8]();
}

uint64_t sub_21A44D77C()
{
  return MEMORY[0x24BE9D7C0]();
}

uint64_t sub_21A44D788()
{
  return MEMORY[0x24BE9D7C8]();
}

uint64_t sub_21A44D794()
{
  return MEMORY[0x24BE9D7D0]();
}

uint64_t sub_21A44D7A0()
{
  return MEMORY[0x24BE9D7D8]();
}

uint64_t sub_21A44D7AC()
{
  return MEMORY[0x24BE9D7E0]();
}

uint64_t sub_21A44D7B8()
{
  return MEMORY[0x24BE9D7E8]();
}

uint64_t sub_21A44D7C4()
{
  return MEMORY[0x24BE9D7F0]();
}

uint64_t sub_21A44D7D0()
{
  return MEMORY[0x24BE9D820]();
}

uint64_t sub_21A44D7DC()
{
  return MEMORY[0x24BE9D828]();
}

uint64_t sub_21A44D7E8()
{
  return MEMORY[0x24BE9D830]();
}

uint64_t sub_21A44D7F4()
{
  return MEMORY[0x24BE9D838]();
}

uint64_t sub_21A44D800()
{
  return MEMORY[0x24BE9D840]();
}

uint64_t sub_21A44D80C()
{
  return MEMORY[0x24BE9D868]();
}

uint64_t sub_21A44D818()
{
  return MEMORY[0x24BE9D878]();
}

uint64_t sub_21A44D824()
{
  return MEMORY[0x24BE9D880]();
}

uint64_t sub_21A44D830()
{
  return MEMORY[0x24BE9D8A8]();
}

uint64_t sub_21A44D83C()
{
  return MEMORY[0x24BE9D8B0]();
}

uint64_t sub_21A44D848()
{
  return MEMORY[0x24BE9D8B8]();
}

uint64_t sub_21A44D854()
{
  return MEMORY[0x24BE9D8C0]();
}

uint64_t sub_21A44D860()
{
  return MEMORY[0x24BE9D8C8]();
}

uint64_t sub_21A44D86C()
{
  return MEMORY[0x24BE9D8D0]();
}

uint64_t sub_21A44D878()
{
  return MEMORY[0x24BE9D8D8]();
}

uint64_t sub_21A44D884()
{
  return MEMORY[0x24BE9D8F8]();
}

uint64_t sub_21A44D890()
{
  return MEMORY[0x24BE9D900]();
}

uint64_t sub_21A44D89C()
{
  return MEMORY[0x24BE9D908]();
}

uint64_t sub_21A44D8A8()
{
  return MEMORY[0x24BE9D910]();
}

uint64_t sub_21A44D8B4()
{
  return MEMORY[0x24BE9D918]();
}

uint64_t sub_21A44D8C0()
{
  return MEMORY[0x24BE9D920]();
}

uint64_t sub_21A44D8CC()
{
  return MEMORY[0x24BE9D928]();
}

uint64_t sub_21A44D8D8()
{
  return MEMORY[0x24BE9D930]();
}

uint64_t sub_21A44D8E4()
{
  return MEMORY[0x24BE9D940]();
}

uint64_t sub_21A44D8F0()
{
  return MEMORY[0x24BE9D948]();
}

uint64_t sub_21A44D8FC()
{
  return MEMORY[0x24BE9D950]();
}

uint64_t sub_21A44D908()
{
  return MEMORY[0x24BE9D958]();
}

uint64_t sub_21A44D914()
{
  return MEMORY[0x24BE9D960]();
}

uint64_t sub_21A44D920()
{
  return MEMORY[0x24BE9D968]();
}

uint64_t sub_21A44D92C()
{
  return MEMORY[0x24BE9D970]();
}

uint64_t sub_21A44D938()
{
  return MEMORY[0x24BE9D978]();
}

uint64_t sub_21A44D944()
{
  return MEMORY[0x24BE9D998]();
}

uint64_t sub_21A44D950()
{
  return MEMORY[0x24BE9D9A8]();
}

uint64_t sub_21A44D95C()
{
  return MEMORY[0x24BE9D9B0]();
}

uint64_t sub_21A44D968()
{
  return MEMORY[0x24BE9D9B8]();
}

uint64_t sub_21A44D974()
{
  return MEMORY[0x24BE9D9C0]();
}

uint64_t sub_21A44D980()
{
  return MEMORY[0x24BE9D9C8]();
}

uint64_t sub_21A44D98C()
{
  return MEMORY[0x24BE9D9D0]();
}

uint64_t sub_21A44D998()
{
  return MEMORY[0x24BE9D9D8]();
}

uint64_t sub_21A44D9A4()
{
  return MEMORY[0x24BE9D9E0]();
}

uint64_t sub_21A44D9B0()
{
  return MEMORY[0x24BE9D9E8]();
}

uint64_t sub_21A44D9BC()
{
  return MEMORY[0x24BE9D9F0]();
}

uint64_t sub_21A44D9C8()
{
  return MEMORY[0x24BE9D9F8]();
}

uint64_t sub_21A44D9D4()
{
  return MEMORY[0x24BE9DA00]();
}

uint64_t sub_21A44D9E0()
{
  return MEMORY[0x24BE9DA20]();
}

uint64_t sub_21A44D9EC()
{
  return MEMORY[0x24BE9DA28]();
}

uint64_t sub_21A44D9F8()
{
  return MEMORY[0x24BE9DA30]();
}

uint64_t sub_21A44DA04()
{
  return MEMORY[0x24BE9DA40]();
}

uint64_t sub_21A44DA10()
{
  return MEMORY[0x24BE9DA48]();
}

uint64_t sub_21A44DA1C()
{
  return MEMORY[0x24BE9DA58]();
}

uint64_t sub_21A44DA28()
{
  return MEMORY[0x24BE9DA60]();
}

uint64_t sub_21A44DA34()
{
  return MEMORY[0x24BE9DA68]();
}

uint64_t sub_21A44DA40()
{
  return MEMORY[0x24BE9DA70]();
}

uint64_t sub_21A44DA4C()
{
  return MEMORY[0x24BE9DA80]();
}

uint64_t sub_21A44DA58()
{
  return MEMORY[0x24BE9DA88]();
}

uint64_t sub_21A44DA64()
{
  return MEMORY[0x24BE9DA90]();
}

uint64_t sub_21A44DA70()
{
  return MEMORY[0x24BE9DA98]();
}

uint64_t sub_21A44DA7C()
{
  return MEMORY[0x24BE9DAB8]();
}

uint64_t sub_21A44DA88()
{
  return MEMORY[0x24BE9DAC8]();
}

uint64_t sub_21A44DA94()
{
  return MEMORY[0x24BE9DAD0]();
}

uint64_t sub_21A44DAA0()
{
  return MEMORY[0x24BE9DAD8]();
}

uint64_t sub_21A44DAAC()
{
  return MEMORY[0x24BE9DAE0]();
}

uint64_t sub_21A44DAB8()
{
  return MEMORY[0x24BE9DAE8]();
}

uint64_t sub_21A44DAC4()
{
  return MEMORY[0x24BE9DAF0]();
}

uint64_t sub_21A44DAD0()
{
  return MEMORY[0x24BE9DAF8]();
}

uint64_t sub_21A44DADC()
{
  return MEMORY[0x24BE9DB00]();
}

uint64_t sub_21A44DAE8()
{
  return MEMORY[0x24BE9DB08]();
}

uint64_t sub_21A44DAF4()
{
  return MEMORY[0x24BE9DB10]();
}

uint64_t sub_21A44DB00()
{
  return MEMORY[0x24BE9DB18]();
}

uint64_t sub_21A44DB0C()
{
  return MEMORY[0x24BE9DB28]();
}

uint64_t sub_21A44DB18()
{
  return MEMORY[0x24BE9DB30]();
}

uint64_t sub_21A44DB24()
{
  return MEMORY[0x24BE9DB38]();
}

uint64_t sub_21A44DB30()
{
  return MEMORY[0x24BE9DB40]();
}

uint64_t sub_21A44DB3C()
{
  return MEMORY[0x24BE9DB48]();
}

uint64_t sub_21A44DB48()
{
  return MEMORY[0x24BE9DB50]();
}

uint64_t sub_21A44DB54()
{
  return MEMORY[0x24BE9DB60]();
}

uint64_t sub_21A44DB60()
{
  return MEMORY[0x24BE9DB68]();
}

uint64_t sub_21A44DB6C()
{
  return MEMORY[0x24BE9DB70]();
}

uint64_t sub_21A44DB78()
{
  return MEMORY[0x24BE9DB78]();
}

uint64_t sub_21A44DB84()
{
  return MEMORY[0x24BE9DBA8]();
}

uint64_t sub_21A44DB90()
{
  return MEMORY[0x24BE9DBB8]();
}

uint64_t sub_21A44DB9C()
{
  return MEMORY[0x24BE9DBC0]();
}

uint64_t sub_21A44DBA8()
{
  return MEMORY[0x24BE9DBC8]();
}

uint64_t sub_21A44DBB4()
{
  return MEMORY[0x24BE9DBD0]();
}

uint64_t sub_21A44DBC0()
{
  return MEMORY[0x24BE9DBD8]();
}

uint64_t sub_21A44DBCC()
{
  return MEMORY[0x24BE9DBE0]();
}

uint64_t sub_21A44DBD8()
{
  return MEMORY[0x24BE9DBE8]();
}

uint64_t sub_21A44DBE4()
{
  return MEMORY[0x24BE9DBF0]();
}

uint64_t sub_21A44DBF0()
{
  return MEMORY[0x24BE9DBF8]();
}

uint64_t sub_21A44DBFC()
{
  return MEMORY[0x24BE9DC00]();
}

uint64_t sub_21A44DC08()
{
  return MEMORY[0x24BE9DC08]();
}

uint64_t sub_21A44DC14()
{
  return MEMORY[0x24BE9DC10]();
}

uint64_t sub_21A44DC20()
{
  return MEMORY[0x24BE9DC18]();
}

uint64_t sub_21A44DC2C()
{
  return MEMORY[0x24BE9DC20]();
}

uint64_t sub_21A44DC38()
{
  return MEMORY[0x24BE9DC28]();
}

uint64_t sub_21A44DC44()
{
  return MEMORY[0x24BE9DC30]();
}

uint64_t sub_21A44DC50()
{
  return MEMORY[0x24BE9DC38]();
}

uint64_t sub_21A44DC5C()
{
  return MEMORY[0x24BE9DC48]();
}

uint64_t sub_21A44DC68()
{
  return MEMORY[0x24BE9DC50]();
}

uint64_t sub_21A44DC74()
{
  return MEMORY[0x24BE9DC58]();
}

uint64_t sub_21A44DC80()
{
  return MEMORY[0x24BE9DC60]();
}

uint64_t sub_21A44DC8C()
{
  return MEMORY[0x24BE9DC68]();
}

uint64_t sub_21A44DC98()
{
  return MEMORY[0x24BE9DC70]();
}

uint64_t sub_21A44DCA4()
{
  return MEMORY[0x24BE9DC78]();
}

uint64_t sub_21A44DCB0()
{
  return MEMORY[0x24BE9DC80]();
}

uint64_t sub_21A44DCBC()
{
  return MEMORY[0x24BE9DC88]();
}

uint64_t sub_21A44DCC8()
{
  return MEMORY[0x24BE9DCB0]();
}

uint64_t sub_21A44DCD4()
{
  return MEMORY[0x24BE9DCC0]();
}

uint64_t sub_21A44DCE0()
{
  return MEMORY[0x24BE9DCC8]();
}

uint64_t sub_21A44DCEC()
{
  return MEMORY[0x24BE9DCD0]();
}

uint64_t sub_21A44DCF8()
{
  return MEMORY[0x24BE9DCF0]();
}

uint64_t sub_21A44DD04()
{
  return MEMORY[0x24BE9DCF8]();
}

uint64_t sub_21A44DD10()
{
  return MEMORY[0x24BE9DD00]();
}

uint64_t sub_21A44DD1C()
{
  return MEMORY[0x24BE9DD78]();
}

uint64_t sub_21A44DD28()
{
  return MEMORY[0x24BE9DD88]();
}

uint64_t sub_21A44DD34()
{
  return MEMORY[0x24BE9DD90]();
}

uint64_t sub_21A44DD40()
{
  return MEMORY[0x24BE9DD98]();
}

uint64_t sub_21A44DD4C()
{
  return MEMORY[0x24BE9DDA0]();
}

uint64_t sub_21A44DD58()
{
  return MEMORY[0x24BE9DDA8]();
}

uint64_t sub_21A44DD64()
{
  return MEMORY[0x24BE9DDB0]();
}

uint64_t sub_21A44DD70()
{
  return MEMORY[0x24BE9DDC0]();
}

uint64_t sub_21A44DD7C()
{
  return MEMORY[0x24BE9DDC8]();
}

uint64_t sub_21A44DD88()
{
  return MEMORY[0x24BE9DDD0]();
}

uint64_t sub_21A44DD94()
{
  return MEMORY[0x24BE9DDD8]();
}

uint64_t sub_21A44DDA0()
{
  return MEMORY[0x24BE9DDE0]();
}

uint64_t sub_21A44DDAC()
{
  return MEMORY[0x24BE9DDE8]();
}

uint64_t sub_21A44DDB8()
{
  return MEMORY[0x24BE9DDF0]();
}

uint64_t sub_21A44DDC4()
{
  return MEMORY[0x24BE9DE00]();
}

uint64_t sub_21A44DDD0()
{
  return MEMORY[0x24BE9DE10]();
}

uint64_t sub_21A44DDDC()
{
  return MEMORY[0x24BE9DE18]();
}

uint64_t sub_21A44DDE8()
{
  return MEMORY[0x24BE9DE28]();
}

uint64_t sub_21A44DDF4()
{
  return MEMORY[0x24BE9DE30]();
}

uint64_t sub_21A44DE00()
{
  return MEMORY[0x24BE9DE38]();
}

uint64_t sub_21A44DE0C()
{
  return MEMORY[0x24BE9DE40]();
}

uint64_t sub_21A44DE18()
{
  return MEMORY[0x24BE9DE50]();
}

uint64_t sub_21A44DE24()
{
  return MEMORY[0x24BE9DE58]();
}

uint64_t sub_21A44DE30()
{
  return MEMORY[0x24BE9DE68]();
}

uint64_t sub_21A44DE3C()
{
  return MEMORY[0x24BE9DE70]();
}

uint64_t sub_21A44DE48()
{
  return MEMORY[0x24BE9DE78]();
}

uint64_t sub_21A44DE54()
{
  return MEMORY[0x24BE9DE80]();
}

uint64_t sub_21A44DE60()
{
  return MEMORY[0x24BE9DE88]();
}

uint64_t sub_21A44DE6C()
{
  return MEMORY[0x24BE9DE90]();
}

uint64_t sub_21A44DE78()
{
  return MEMORY[0x24BE9DE98]();
}

uint64_t sub_21A44DE84()
{
  return MEMORY[0x24BE9DEB0]();
}

uint64_t sub_21A44DE90()
{
  return MEMORY[0x24BE9DEC8]();
}

uint64_t sub_21A44DE9C()
{
  return MEMORY[0x24BE9DEE0]();
}

uint64_t sub_21A44DEA8()
{
  return MEMORY[0x24BE9DEE8]();
}

uint64_t sub_21A44DEB4()
{
  return MEMORY[0x24BE9DEF8]();
}

uint64_t sub_21A44DEC0()
{
  return MEMORY[0x24BE9DF08]();
}

uint64_t sub_21A44DECC()
{
  return MEMORY[0x24BE9DF18]();
}

uint64_t sub_21A44DED8()
{
  return MEMORY[0x24BE9DF28]();
}

uint64_t sub_21A44DEE4()
{
  return MEMORY[0x24BE9DF40]();
}

uint64_t sub_21A44DEF0()
{
  return MEMORY[0x24BE9DF58]();
}

uint64_t sub_21A44DEFC()
{
  return MEMORY[0x24BE9DF70]();
}

uint64_t sub_21A44DF08()
{
  return MEMORY[0x24BE9DF88]();
}

uint64_t sub_21A44DF14()
{
  return MEMORY[0x24BE9DFA0]();
}

uint64_t sub_21A44DF20()
{
  return MEMORY[0x24BE9DFB8]();
}

uint64_t sub_21A44DF2C()
{
  return MEMORY[0x24BE9DFD0]();
}

uint64_t sub_21A44DF38()
{
  return MEMORY[0x24BE9DFD8]();
}

uint64_t sub_21A44DF44()
{
  return MEMORY[0x24BE9DFE8]();
}

uint64_t sub_21A44DF50()
{
  return MEMORY[0x24BE9DFF0]();
}

uint64_t sub_21A44DF5C()
{
  return MEMORY[0x24BE9E000]();
}

uint64_t sub_21A44DF68()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_21A44DF74()
{
  return MEMORY[0x24BE9E020]();
}

uint64_t sub_21A44DF80()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_21A44DF8C()
{
  return MEMORY[0x24BE9EF38]();
}

uint64_t sub_21A44DF98()
{
  return MEMORY[0x24BE9EF40]();
}

uint64_t sub_21A44DFA4()
{
  return MEMORY[0x24BE9EF48]();
}

uint64_t sub_21A44DFB0()
{
  return MEMORY[0x24BE9EF50]();
}

uint64_t sub_21A44DFBC()
{
  return MEMORY[0x24BE9EF58]();
}

uint64_t sub_21A44DFC8()
{
  return MEMORY[0x24BE9EF60]();
}

uint64_t sub_21A44DFD4()
{
  return MEMORY[0x24BE9EF68]();
}

uint64_t sub_21A44DFE0()
{
  return MEMORY[0x24BE9EF70]();
}

uint64_t sub_21A44DFEC()
{
  return MEMORY[0x24BE9EF78]();
}

uint64_t sub_21A44DFF8()
{
  return MEMORY[0x24BE9EF80]();
}

uint64_t sub_21A44E004()
{
  return MEMORY[0x24BE9EF88]();
}

uint64_t sub_21A44E010()
{
  return MEMORY[0x24BE9EF90]();
}

uint64_t sub_21A44E01C()
{
  return MEMORY[0x24BE9EF98]();
}

uint64_t sub_21A44E028()
{
  return MEMORY[0x24BE9EFA0]();
}

uint64_t sub_21A44E034()
{
  return MEMORY[0x24BE9EFA8]();
}

uint64_t sub_21A44E040()
{
  return MEMORY[0x24BE9EFB0]();
}

uint64_t sub_21A44E04C()
{
  return MEMORY[0x24BE9EFB8]();
}

uint64_t sub_21A44E058()
{
  return MEMORY[0x24BE9EFC0]();
}

uint64_t sub_21A44E064()
{
  return MEMORY[0x24BE9EFC8]();
}

uint64_t sub_21A44E070()
{
  return MEMORY[0x24BE9EFD0]();
}

uint64_t sub_21A44E07C()
{
  return MEMORY[0x24BE9EFD8]();
}

uint64_t sub_21A44E088()
{
  return MEMORY[0x24BE9EFE8]();
}

uint64_t sub_21A44E094()
{
  return MEMORY[0x24BE9EFF0]();
}

uint64_t sub_21A44E0A0()
{
  return MEMORY[0x24BE9EFF8]();
}

uint64_t sub_21A44E0AC()
{
  return MEMORY[0x24BE9F000]();
}

uint64_t sub_21A44E0B8()
{
  return MEMORY[0x24BE9F008]();
}

uint64_t sub_21A44E0C4()
{
  return MEMORY[0x24BE9F010]();
}

uint64_t sub_21A44E0D0()
{
  return MEMORY[0x24BE9F018]();
}

uint64_t sub_21A44E0DC()
{
  return MEMORY[0x24BE9F020]();
}

uint64_t sub_21A44E0E8()
{
  return MEMORY[0x24BE9F028]();
}

uint64_t sub_21A44E0F4()
{
  return MEMORY[0x24BE9F030]();
}

uint64_t sub_21A44E100()
{
  return MEMORY[0x24BE9F038]();
}

uint64_t sub_21A44E10C()
{
  return MEMORY[0x24BE9F040]();
}

uint64_t sub_21A44E118()
{
  return MEMORY[0x24BE9F048]();
}

uint64_t sub_21A44E124()
{
  return MEMORY[0x24BE9F050]();
}

uint64_t sub_21A44E130()
{
  return MEMORY[0x24BE9F058]();
}

uint64_t sub_21A44E13C()
{
  return MEMORY[0x24BE9F060]();
}

uint64_t sub_21A44E148()
{
  return MEMORY[0x24BE9F068]();
}

uint64_t sub_21A44E154()
{
  return MEMORY[0x24BE9F070]();
}

uint64_t sub_21A44E160()
{
  return MEMORY[0x24BE9F078]();
}

uint64_t sub_21A44E16C()
{
  return MEMORY[0x24BE9F080]();
}

uint64_t sub_21A44E178()
{
  return MEMORY[0x24BE9F088]();
}

uint64_t sub_21A44E184()
{
  return MEMORY[0x24BE9F090]();
}

uint64_t sub_21A44E190()
{
  return MEMORY[0x24BE9F098]();
}

uint64_t sub_21A44E19C()
{
  return MEMORY[0x24BE9F0A0]();
}

uint64_t sub_21A44E1A8()
{
  return MEMORY[0x24BE9F0A8]();
}

uint64_t sub_21A44E1B4()
{
  return MEMORY[0x24BE9F0B0]();
}

uint64_t sub_21A44E1C0()
{
  return MEMORY[0x24BE9F0B8]();
}

uint64_t sub_21A44E1CC()
{
  return MEMORY[0x24BE9F0C0]();
}

uint64_t sub_21A44E1D8()
{
  return MEMORY[0x24BE9F0D0]();
}

uint64_t sub_21A44E1E4()
{
  return MEMORY[0x24BE9F0E0]();
}

uint64_t sub_21A44E1F0()
{
  return MEMORY[0x24BE9F0E8]();
}

uint64_t sub_21A44E1FC()
{
  return MEMORY[0x24BE9F0F0]();
}

uint64_t sub_21A44E208()
{
  return MEMORY[0x24BE9F0F8]();
}

uint64_t sub_21A44E214()
{
  return MEMORY[0x24BE9F100]();
}

uint64_t sub_21A44E220()
{
  return MEMORY[0x24BE9F118]();
}

uint64_t sub_21A44E22C()
{
  return MEMORY[0x24BE9F120]();
}

uint64_t sub_21A44E238()
{
  return MEMORY[0x24BE9F128]();
}

uint64_t sub_21A44E244()
{
  return MEMORY[0x24BE9F130]();
}

uint64_t sub_21A44E250()
{
  return MEMORY[0x24BE9F138]();
}

uint64_t sub_21A44E25C()
{
  return MEMORY[0x24BE9F140]();
}

uint64_t sub_21A44E268()
{
  return MEMORY[0x24BE9F148]();
}

uint64_t sub_21A44E274()
{
  return MEMORY[0x24BE9F150]();
}

uint64_t sub_21A44E280()
{
  return MEMORY[0x24BE9F158]();
}

uint64_t sub_21A44E28C()
{
  return MEMORY[0x24BE9F160]();
}

uint64_t sub_21A44E298()
{
  return MEMORY[0x24BE9F168]();
}

uint64_t sub_21A44E2A4()
{
  return MEMORY[0x24BE9F170]();
}

uint64_t sub_21A44E2B0()
{
  return MEMORY[0x24BE9F178]();
}

uint64_t sub_21A44E2BC()
{
  return MEMORY[0x24BE9F180]();
}

uint64_t sub_21A44E2C8()
{
  return MEMORY[0x24BE9F188]();
}

uint64_t sub_21A44E2D4()
{
  return MEMORY[0x24BE9F190]();
}

uint64_t sub_21A44E2E0()
{
  return MEMORY[0x24BE9F198]();
}

uint64_t sub_21A44E2EC()
{
  return MEMORY[0x24BE9F1A0]();
}

uint64_t sub_21A44E2F8()
{
  return MEMORY[0x24BE9F1A8]();
}

uint64_t sub_21A44E304()
{
  return MEMORY[0x24BE9F1B0]();
}

uint64_t sub_21A44E310()
{
  return MEMORY[0x24BE9F1B8]();
}

uint64_t sub_21A44E31C()
{
  return MEMORY[0x24BE9F1C0]();
}

uint64_t sub_21A44E328()
{
  return MEMORY[0x24BE9F1C8]();
}

uint64_t sub_21A44E334()
{
  return MEMORY[0x24BE9F1D0]();
}

uint64_t sub_21A44E340()
{
  return MEMORY[0x24BE9F1F8]();
}

uint64_t sub_21A44E34C()
{
  return MEMORY[0x24BE9F200]();
}

uint64_t sub_21A44E358()
{
  return MEMORY[0x24BE9F208]();
}

uint64_t sub_21A44E364()
{
  return MEMORY[0x24BE9F210]();
}

uint64_t sub_21A44E370()
{
  return MEMORY[0x24BE9F218]();
}

uint64_t sub_21A44E37C()
{
  return MEMORY[0x24BE9F220]();
}

uint64_t sub_21A44E388()
{
  return MEMORY[0x24BE9F228]();
}

uint64_t sub_21A44E394()
{
  return MEMORY[0x24BE9F230]();
}

uint64_t sub_21A44E3A0()
{
  return MEMORY[0x24BE9F238]();
}

uint64_t sub_21A44E3AC()
{
  return MEMORY[0x24BE9F240]();
}

uint64_t sub_21A44E3B8()
{
  return MEMORY[0x24BE9F248]();
}

uint64_t sub_21A44E3C4()
{
  return MEMORY[0x24BE9F250]();
}

uint64_t sub_21A44E3D0()
{
  return MEMORY[0x24BE9F258]();
}

uint64_t sub_21A44E3DC()
{
  return MEMORY[0x24BE9F260]();
}

uint64_t sub_21A44E3E8()
{
  return MEMORY[0x24BE9F268]();
}

uint64_t sub_21A44E3F4()
{
  return MEMORY[0x24BE9F2B8]();
}

uint64_t sub_21A44E400()
{
  return MEMORY[0x24BE9F2D0]();
}

uint64_t sub_21A44E40C()
{
  return MEMORY[0x24BE9F2D8]();
}

uint64_t sub_21A44E418()
{
  return MEMORY[0x24BE9F2E0]();
}

uint64_t sub_21A44E424()
{
  return MEMORY[0x24BE9F2E8]();
}

uint64_t sub_21A44E430()
{
  return MEMORY[0x24BE9F2F0]();
}

uint64_t sub_21A44E43C()
{
  return MEMORY[0x24BE9F2F8]();
}

uint64_t sub_21A44E448()
{
  return MEMORY[0x24BE9F300]();
}

uint64_t sub_21A44E454()
{
  return MEMORY[0x24BE9F308]();
}

uint64_t sub_21A44E460()
{
  return MEMORY[0x24BE9F310]();
}

uint64_t sub_21A44E46C()
{
  return MEMORY[0x24BE9F318]();
}

uint64_t sub_21A44E478()
{
  return MEMORY[0x24BE9F320]();
}

uint64_t sub_21A44E484()
{
  return MEMORY[0x24BE9F328]();
}

uint64_t sub_21A44E490()
{
  return MEMORY[0x24BE9F330]();
}

uint64_t sub_21A44E49C()
{
  return MEMORY[0x24BE9F338]();
}

uint64_t sub_21A44E4A8()
{
  return MEMORY[0x24BE9F340]();
}

uint64_t sub_21A44E4B4()
{
  return MEMORY[0x24BE9F348]();
}

uint64_t sub_21A44E4C0()
{
  return MEMORY[0x24BE9F350]();
}

uint64_t sub_21A44E4CC()
{
  return MEMORY[0x24BE9F360]();
}

uint64_t sub_21A44E4D8()
{
  return MEMORY[0x24BE9F368]();
}

uint64_t sub_21A44E4E4()
{
  return MEMORY[0x24BE9F370]();
}

uint64_t sub_21A44E4F0()
{
  return MEMORY[0x24BE9F378]();
}

uint64_t sub_21A44E4FC()
{
  return MEMORY[0x24BE9F380]();
}

uint64_t sub_21A44E508()
{
  return MEMORY[0x24BE9F388]();
}

uint64_t sub_21A44E514()
{
  return MEMORY[0x24BE9F390]();
}

uint64_t sub_21A44E520()
{
  return MEMORY[0x24BE9F398]();
}

uint64_t sub_21A44E52C()
{
  return MEMORY[0x24BE9F3A0]();
}

uint64_t sub_21A44E538()
{
  return MEMORY[0x24BE9F3A8]();
}

uint64_t sub_21A44E544()
{
  return MEMORY[0x24BE9F3B0]();
}

uint64_t sub_21A44E550()
{
  return MEMORY[0x24BE9F3B8]();
}

uint64_t sub_21A44E55C()
{
  return MEMORY[0x24BE9F3C0]();
}

uint64_t sub_21A44E568()
{
  return MEMORY[0x24BE9F3C8]();
}

uint64_t sub_21A44E574()
{
  return MEMORY[0x24BE9F3D0]();
}

uint64_t sub_21A44E580()
{
  return MEMORY[0x24BE9F3D8]();
}

uint64_t sub_21A44E58C()
{
  return MEMORY[0x24BE9F400]();
}

uint64_t sub_21A44E598()
{
  return MEMORY[0x24BE9F408]();
}

uint64_t sub_21A44E5A4()
{
  return MEMORY[0x24BE9F410]();
}

uint64_t sub_21A44E5B0()
{
  return MEMORY[0x24BE9F418]();
}

uint64_t sub_21A44E5BC()
{
  return MEMORY[0x24BE9F420]();
}

uint64_t sub_21A44E5C8()
{
  return MEMORY[0x24BE9F428]();
}

uint64_t sub_21A44E5D4()
{
  return MEMORY[0x24BE9F430]();
}

uint64_t sub_21A44E5E0()
{
  return MEMORY[0x24BE9F438]();
}

uint64_t sub_21A44E5EC()
{
  return MEMORY[0x24BE9F470]();
}

uint64_t sub_21A44E5F8()
{
  return MEMORY[0x24BE9F480]();
}

uint64_t sub_21A44E604()
{
  return MEMORY[0x24BE9F490]();
}

uint64_t sub_21A44E610()
{
  return MEMORY[0x24BE9F498]();
}

uint64_t sub_21A44E61C()
{
  return MEMORY[0x24BE9F4D8]();
}

uint64_t sub_21A44E628()
{
  return MEMORY[0x24BE9F508]();
}

uint64_t sub_21A44E634()
{
  return MEMORY[0x24BE9F510]();
}

uint64_t sub_21A44E640()
{
  return MEMORY[0x24BE9F518]();
}

uint64_t sub_21A44E64C()
{
  return MEMORY[0x24BE9F520]();
}

uint64_t sub_21A44E658()
{
  return MEMORY[0x24BE9F528]();
}

uint64_t sub_21A44E664()
{
  return MEMORY[0x24BE9F538]();
}

uint64_t sub_21A44E670()
{
  return MEMORY[0x24BE9F540]();
}

uint64_t sub_21A44E67C()
{
  return MEMORY[0x24BE9F548]();
}

uint64_t sub_21A44E688()
{
  return MEMORY[0x24BE9F550]();
}

uint64_t sub_21A44E694()
{
  return MEMORY[0x24BE9F558]();
}

uint64_t sub_21A44E6A0()
{
  return MEMORY[0x24BE9F560]();
}

uint64_t sub_21A44E6AC()
{
  return MEMORY[0x24BE9F568]();
}

uint64_t sub_21A44E6B8()
{
  return MEMORY[0x24BE9F570]();
}

uint64_t sub_21A44E6C4()
{
  return MEMORY[0x24BE9F578]();
}

uint64_t sub_21A44E6D0()
{
  return MEMORY[0x24BE9F580]();
}

uint64_t sub_21A44E6DC()
{
  return MEMORY[0x24BE9F588]();
}

uint64_t sub_21A44E6E8()
{
  return MEMORY[0x24BE9F590]();
}

uint64_t sub_21A44E6F4()
{
  return MEMORY[0x24BE9F598]();
}

uint64_t sub_21A44E700()
{
  return MEMORY[0x24BE9F5A0]();
}

uint64_t sub_21A44E70C()
{
  return MEMORY[0x24BE9F5A8]();
}

uint64_t sub_21A44E718()
{
  return MEMORY[0x24BE9F5B0]();
}

uint64_t sub_21A44E724()
{
  return MEMORY[0x24BE9F5B8]();
}

uint64_t sub_21A44E730()
{
  return MEMORY[0x24BE9F5C0]();
}

uint64_t sub_21A44E73C()
{
  return MEMORY[0x24BE9F5C8]();
}

uint64_t sub_21A44E748()
{
  return MEMORY[0x24BE9F5D0]();
}

uint64_t sub_21A44E754()
{
  return MEMORY[0x24BE9F5D8]();
}

uint64_t sub_21A44E760()
{
  return MEMORY[0x24BE9F5E0]();
}

uint64_t sub_21A44E76C()
{
  return MEMORY[0x24BE9F5E8]();
}

uint64_t sub_21A44E778()
{
  return MEMORY[0x24BE9F5F0]();
}

uint64_t sub_21A44E784()
{
  return MEMORY[0x24BE9F5F8]();
}

uint64_t sub_21A44E790()
{
  return MEMORY[0x24BE9F600]();
}

uint64_t sub_21A44E79C()
{
  return MEMORY[0x24BE9F608]();
}

uint64_t sub_21A44E7A8()
{
  return MEMORY[0x24BE9F610]();
}

uint64_t sub_21A44E7B4()
{
  return MEMORY[0x24BE9F618]();
}

uint64_t sub_21A44E7C0()
{
  return MEMORY[0x24BE9F620]();
}

uint64_t sub_21A44E7CC()
{
  return MEMORY[0x24BE9F628]();
}

uint64_t sub_21A44E7D8()
{
  return MEMORY[0x24BE9F630]();
}

uint64_t sub_21A44E7E4()
{
  return MEMORY[0x24BE9F638]();
}

uint64_t sub_21A44E7F0()
{
  return MEMORY[0x24BE9F640]();
}

uint64_t sub_21A44E7FC()
{
  return MEMORY[0x24BE9F648]();
}

uint64_t sub_21A44E808()
{
  return MEMORY[0x24BE9F650]();
}

uint64_t sub_21A44E814()
{
  return MEMORY[0x24BE9F658]();
}

uint64_t sub_21A44E820()
{
  return MEMORY[0x24BE9F660]();
}

uint64_t sub_21A44E82C()
{
  return MEMORY[0x24BE9F668]();
}

uint64_t sub_21A44E838()
{
  return MEMORY[0x24BE9F670]();
}

uint64_t sub_21A44E844()
{
  return MEMORY[0x24BE9F678]();
}

uint64_t sub_21A44E850()
{
  return MEMORY[0x24BE9F680]();
}

uint64_t sub_21A44E85C()
{
  return MEMORY[0x24BE9F688]();
}

uint64_t sub_21A44E868()
{
  return MEMORY[0x24BE9F690]();
}

uint64_t sub_21A44E874()
{
  return MEMORY[0x24BE9F698]();
}

uint64_t sub_21A44E880()
{
  return MEMORY[0x24BE9F6A0]();
}

uint64_t sub_21A44E88C()
{
  return MEMORY[0x24BE9F6A8]();
}

uint64_t sub_21A44E898()
{
  return MEMORY[0x24BE9F6B0]();
}

uint64_t sub_21A44E8A4()
{
  return MEMORY[0x24BE9F6B8]();
}

uint64_t sub_21A44E8B0()
{
  return MEMORY[0x24BE9F6C0]();
}

uint64_t sub_21A44E8BC()
{
  return MEMORY[0x24BE9F6C8]();
}

uint64_t sub_21A44E8C8()
{
  return MEMORY[0x24BE9F6D0]();
}

uint64_t sub_21A44E8D4()
{
  return MEMORY[0x24BE9F6D8]();
}

uint64_t sub_21A44E8E0()
{
  return MEMORY[0x24BE9F6E0]();
}

uint64_t sub_21A44E8EC()
{
  return MEMORY[0x24BE9F6E8]();
}

uint64_t sub_21A44E8F8()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21A44E904()
{
  return MEMORY[0x24BE9F738]();
}

uint64_t sub_21A44E910()
{
  return MEMORY[0x24BE9F7F0]();
}

uint64_t sub_21A44E91C()
{
  return MEMORY[0x24BE9F808]();
}

uint64_t sub_21A44E928()
{
  return MEMORY[0x24BE9F860]();
}

uint64_t sub_21A44E934()
{
  return MEMORY[0x24BE9F888]();
}

uint64_t sub_21A44E940()
{
  return MEMORY[0x24BE9F8C0]();
}

uint64_t sub_21A44E94C()
{
  return MEMORY[0x24BE9F928]();
}

uint64_t sub_21A44E958()
{
  return MEMORY[0x24BE9F978]();
}

uint64_t sub_21A44E964()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21A44E970()
{
  return MEMORY[0x24BE9F9B8]();
}

uint64_t sub_21A44E97C()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_21A44E988()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_21A44E994()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_21A44E9A0()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_21A44E9AC()
{
  return MEMORY[0x24BE9FFD8]();
}

uint64_t sub_21A44E9B8()
{
  return MEMORY[0x24BEA00A8]();
}

uint64_t sub_21A44E9C4()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_21A44E9D0()
{
  return MEMORY[0x24BEA00F8]();
}

uint64_t sub_21A44E9DC()
{
  return MEMORY[0x24BEA0100]();
}

uint64_t sub_21A44E9E8()
{
  return MEMORY[0x24BEA0500]();
}

uint64_t sub_21A44E9F4()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_21A44EA00()
{
  return MEMORY[0x24BEA05C0]();
}

uint64_t sub_21A44EA0C()
{
  return MEMORY[0x24BEA05F8]();
}

uint64_t sub_21A44EA18()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_21A44EA24()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_21A44EA30()
{
  return MEMORY[0x24BEA0980]();
}

uint64_t sub_21A44EA3C()
{
  return MEMORY[0x24BEA0A98]();
}

uint64_t sub_21A44EA48()
{
  return MEMORY[0x24BEA0AA0]();
}

uint64_t sub_21A44EA54()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_21A44EA60()
{
  return MEMORY[0x24BEA0B80]();
}

uint64_t sub_21A44EA6C()
{
  return MEMORY[0x24BEA0D10]();
}

uint64_t sub_21A44EA78()
{
  return MEMORY[0x24BEA0D40]();
}

uint64_t sub_21A44EA84()
{
  return MEMORY[0x24BEA0D48]();
}

uint64_t sub_21A44EA90()
{
  return MEMORY[0x24BEA0E58]();
}

uint64_t sub_21A44EA9C()
{
  return MEMORY[0x24BEA0E70]();
}

uint64_t sub_21A44EAA8()
{
  return MEMORY[0x24BEA0EC0]();
}

uint64_t sub_21A44EAB4()
{
  return MEMORY[0x24BEA0EC8]();
}

uint64_t sub_21A44EAC0()
{
  return MEMORY[0x24BEA0F60]();
}

uint64_t sub_21A44EACC()
{
  return MEMORY[0x24BEA1090]();
}

uint64_t sub_21A44EAD8()
{
  return MEMORY[0x24BEA1098]();
}

uint64_t sub_21A44EAE4()
{
  return MEMORY[0x24BEA1368]();
}

uint64_t sub_21A44EAF0()
{
  return MEMORY[0x24BEA1420]();
}

uint64_t sub_21A44EAFC()
{
  return MEMORY[0x24BEA1530]();
}

uint64_t sub_21A44EB08()
{
  return MEMORY[0x24BEA1540]();
}

uint64_t sub_21A44EB14()
{
  return MEMORY[0x24BEA1548]();
}

uint64_t sub_21A44EB20()
{
  return MEMORY[0x24BEA17C8]();
}

uint64_t sub_21A44EB2C()
{
  return MEMORY[0x24BEA17E0]();
}

uint64_t sub_21A44EB38()
{
  return MEMORY[0x24BEA18A0]();
}

uint64_t sub_21A44EB44()
{
  return MEMORY[0x24BEA18A8]();
}

uint64_t sub_21A44EB50()
{
  return MEMORY[0x24BEA1918]();
}

uint64_t sub_21A44EB5C()
{
  return MEMORY[0x24BEA1A58]();
}

uint64_t sub_21A44EB68()
{
  return MEMORY[0x24BEA1B30]();
}

uint64_t sub_21A44EB74()
{
  return MEMORY[0x24BEA1F78]();
}

uint64_t sub_21A44EB80()
{
  return MEMORY[0x24BEA1F80]();
}

uint64_t sub_21A44EB8C()
{
  return MEMORY[0x24BEA2020]();
}

uint64_t sub_21A44EB98()
{
  return MEMORY[0x24BEA2038]();
}

uint64_t sub_21A44EBA4()
{
  return MEMORY[0x24BEA2048]();
}

uint64_t sub_21A44EBB0()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_21A44EBBC()
{
  return MEMORY[0x24BEA2068]();
}

uint64_t sub_21A44EBC8()
{
  return MEMORY[0x24BEA2260]();
}

uint64_t sub_21A44EBD4()
{
  return MEMORY[0x24BEA24F8]();
}

uint64_t sub_21A44EBE0()
{
  return MEMORY[0x24BEA26E0]();
}

uint64_t sub_21A44EBEC()
{
  return MEMORY[0x24BEA2A20]();
}

uint64_t sub_21A44EBF8()
{
  return MEMORY[0x24BEA2A50]();
}

uint64_t sub_21A44EC04()
{
  return MEMORY[0x24BEA2E40]();
}

uint64_t sub_21A44EC10()
{
  return MEMORY[0x24BEA3298]();
}

uint64_t sub_21A44EC1C()
{
  return MEMORY[0x24BEA33C8]();
}

uint64_t sub_21A44EC28()
{
  return MEMORY[0x24BEA33D0]();
}

uint64_t sub_21A44EC34()
{
  return MEMORY[0x24BEA33D8]();
}

uint64_t sub_21A44EC40()
{
  return MEMORY[0x24BEA33E0]();
}

uint64_t sub_21A44EC4C()
{
  return MEMORY[0x24BEA33F0]();
}

uint64_t sub_21A44EC58()
{
  return MEMORY[0x24BEA33F8]();
}

uint64_t sub_21A44EC64()
{
  return MEMORY[0x24BEA3408]();
}

uint64_t sub_21A44EC70()
{
  return MEMORY[0x24BEA3410]();
}

uint64_t sub_21A44EC7C()
{
  return MEMORY[0x24BEA3428]();
}

uint64_t sub_21A44EC88()
{
  return MEMORY[0x24BEA3430]();
}

uint64_t sub_21A44EC94()
{
  return MEMORY[0x24BEA3440]();
}

uint64_t sub_21A44ECA0()
{
  return MEMORY[0x24BEA3450]();
}

uint64_t sub_21A44ECAC()
{
  return MEMORY[0x24BEA3458]();
}

uint64_t sub_21A44ECB8()
{
  return MEMORY[0x24BEA34F0]();
}

uint64_t sub_21A44ECC4()
{
  return MEMORY[0x24BEA3508]();
}

uint64_t sub_21A44ECD0()
{
  return MEMORY[0x24BEA3510]();
}

uint64_t sub_21A44ECDC()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_21A44ECE8()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_21A44ECF4()
{
  return MEMORY[0x24BEA3740]();
}

uint64_t sub_21A44ED00()
{
  return MEMORY[0x24BEA3760]();
}

uint64_t sub_21A44ED0C()
{
  return MEMORY[0x24BEA3768]();
}

uint64_t sub_21A44ED18()
{
  return MEMORY[0x24BEA3770]();
}

uint64_t sub_21A44ED24()
{
  return MEMORY[0x24BEA37F0]();
}

uint64_t sub_21A44ED30()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_21A44ED3C()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_21A44ED48()
{
  return MEMORY[0x24BEA8AA8]();
}

uint64_t sub_21A44ED54()
{
  return MEMORY[0x24BEA8B10]();
}

uint64_t sub_21A44ED60()
{
  return MEMORY[0x24BEB7FD8]();
}

uint64_t sub_21A44ED6C()
{
  return MEMORY[0x24BEB8028]();
}

uint64_t sub_21A44ED78()
{
  return MEMORY[0x24BEB8040]();
}

uint64_t sub_21A44ED84()
{
  return MEMORY[0x24BEB80B0]();
}

uint64_t sub_21A44ED90()
{
  return MEMORY[0x24BEB80B8]();
}

uint64_t sub_21A44ED9C()
{
  return MEMORY[0x24BE3BDC8]();
}

uint64_t sub_21A44EDA8()
{
  return MEMORY[0x24BEB8100]();
}

uint64_t sub_21A44EDB4()
{
  return MEMORY[0x24BEB82E0]();
}

uint64_t sub_21A44EDC0()
{
  return MEMORY[0x24BEB82F0]();
}

uint64_t sub_21A44EDCC()
{
  return MEMORY[0x24BEB8310]();
}

uint64_t sub_21A44EDD8()
{
  return MEMORY[0x24BEB8330]();
}

uint64_t sub_21A44EDE4()
{
  return MEMORY[0x24BEB8368]();
}

uint64_t sub_21A44EDF0()
{
  return MEMORY[0x24BEB8378]();
}

uint64_t sub_21A44EDFC()
{
  return MEMORY[0x24BEB8388]();
}

uint64_t sub_21A44EE08()
{
  return MEMORY[0x24BEB83E0]();
}

uint64_t sub_21A44EE14()
{
  return MEMORY[0x24BEB8420]();
}

uint64_t sub_21A44EE20()
{
  return MEMORY[0x24BEB86F8]();
}

uint64_t sub_21A44EE2C()
{
  return MEMORY[0x24BEB89B8]();
}

uint64_t sub_21A44EE38()
{
  return MEMORY[0x24BEB89D0]();
}

uint64_t sub_21A44EE44()
{
  return MEMORY[0x24BE3C3B8]();
}

uint64_t sub_21A44EE50()
{
  return MEMORY[0x24BEB8620]();
}

uint64_t sub_21A44EE5C()
{
  return MEMORY[0x24BE53180]();
}

uint64_t sub_21A44EE68()
{
  return MEMORY[0x24BE53190]();
}

uint64_t sub_21A44EE74()
{
  return MEMORY[0x24BE53198]();
}

uint64_t sub_21A44EE80()
{
  return MEMORY[0x24BE99D48]();
}

uint64_t sub_21A44EE8C()
{
  return MEMORY[0x24BEA5FA8]();
}

uint64_t sub_21A44EE98()
{
  return MEMORY[0x24BE99D60]();
}

uint64_t sub_21A44EEA4()
{
  return MEMORY[0x24BE99D68]();
}

uint64_t sub_21A44EEB0()
{
  return MEMORY[0x24BE99D80]();
}

uint64_t sub_21A44EEBC()
{
  return MEMORY[0x24BE99D88]();
}

uint64_t sub_21A44EEC8()
{
  return MEMORY[0x24BE99D90]();
}

uint64_t sub_21A44EED4()
{
  return MEMORY[0x24BE99D98]();
}

uint64_t sub_21A44EEE0()
{
  return MEMORY[0x24BE99DA0]();
}

uint64_t sub_21A44EEEC()
{
  return MEMORY[0x24BE99DA8]();
}

uint64_t sub_21A44EEF8()
{
  return MEMORY[0x24BE99DB0]();
}

uint64_t sub_21A44EF04()
{
  return MEMORY[0x24BE99DB8]();
}

uint64_t sub_21A44EF10()
{
  return MEMORY[0x24BE99DC0]();
}

uint64_t sub_21A44EF1C()
{
  return MEMORY[0x24BE99DC8]();
}

uint64_t sub_21A44EF28()
{
  return MEMORY[0x24BE99DD0]();
}

uint64_t sub_21A44EF34()
{
  return MEMORY[0x24BE99DE8]();
}

uint64_t sub_21A44EF40()
{
  return MEMORY[0x24BE99E00]();
}

uint64_t sub_21A44EF4C()
{
  return MEMORY[0x24BE99E08]();
}

uint64_t sub_21A44EF58()
{
  return MEMORY[0x24BE99E10]();
}

uint64_t sub_21A44EF64()
{
  return MEMORY[0x24BE99E18]();
}

uint64_t sub_21A44EF70()
{
  return MEMORY[0x24BE99E20]();
}

uint64_t sub_21A44EF7C()
{
  return MEMORY[0x24BE99E28]();
}

uint64_t sub_21A44EF88()
{
  return MEMORY[0x24BE99E30]();
}

uint64_t sub_21A44EF94()
{
  return MEMORY[0x24BE99E38]();
}

uint64_t sub_21A44EFA0()
{
  return MEMORY[0x24BE99E40]();
}

uint64_t sub_21A44EFAC()
{
  return MEMORY[0x24BE99E48]();
}

uint64_t sub_21A44EFB8()
{
  return MEMORY[0x24BE99E50]();
}

uint64_t sub_21A44EFC4()
{
  return MEMORY[0x24BE99E58]();
}

uint64_t sub_21A44EFD0()
{
  return MEMORY[0x24BE99E60]();
}

uint64_t sub_21A44EFDC()
{
  return MEMORY[0x24BE99EF0]();
}

uint64_t sub_21A44EFE8()
{
  return MEMORY[0x24BE99F30]();
}

uint64_t sub_21A44EFF4()
{
  return MEMORY[0x24BE99F38]();
}

uint64_t sub_21A44F000()
{
  return MEMORY[0x24BE99F40]();
}

uint64_t sub_21A44F00C()
{
  return MEMORY[0x24BE99F48]();
}

uint64_t sub_21A44F018()
{
  return MEMORY[0x24BE99F50]();
}

uint64_t sub_21A44F024()
{
  return MEMORY[0x24BE9A048]();
}

uint64_t sub_21A44F030()
{
  return MEMORY[0x24BE9A088]();
}

uint64_t sub_21A44F03C()
{
  return MEMORY[0x24BE9A090]();
}

uint64_t sub_21A44F048()
{
  return MEMORY[0x24BE9A098]();
}

uint64_t sub_21A44F054()
{
  return MEMORY[0x24BE9A0A0]();
}

uint64_t sub_21A44F060()
{
  return MEMORY[0x24BE9A0A8]();
}

uint64_t sub_21A44F06C()
{
  return MEMORY[0x24BE9A0B0]();
}

uint64_t sub_21A44F078()
{
  return MEMORY[0x24BE9A0B8]();
}

uint64_t sub_21A44F084()
{
  return MEMORY[0x24BE9A0C0]();
}

uint64_t sub_21A44F090()
{
  return MEMORY[0x24BE9A0C8]();
}

uint64_t sub_21A44F09C()
{
  return MEMORY[0x24BE9A0D0]();
}

uint64_t sub_21A44F0A8()
{
  return MEMORY[0x24BE9A0D8]();
}

uint64_t sub_21A44F0B4()
{
  return MEMORY[0x24BE9A0E0]();
}

uint64_t sub_21A44F0C0()
{
  return MEMORY[0x24BE9A0E8]();
}

uint64_t sub_21A44F0CC()
{
  return MEMORY[0x24BE9A0F0]();
}

uint64_t sub_21A44F0D8()
{
  return MEMORY[0x24BE9A0F8]();
}

uint64_t sub_21A44F0E4()
{
  return MEMORY[0x24BE9A100]();
}

uint64_t sub_21A44F0F0()
{
  return MEMORY[0x24BE9A108]();
}

uint64_t sub_21A44F0FC()
{
  return MEMORY[0x24BE9A110]();
}

uint64_t sub_21A44F108()
{
  return MEMORY[0x24BE9A118]();
}

uint64_t sub_21A44F114()
{
  return MEMORY[0x24BE9A120]();
}

uint64_t sub_21A44F120()
{
  return MEMORY[0x24BE9A128]();
}

uint64_t sub_21A44F12C()
{
  return MEMORY[0x24BE9A130]();
}

uint64_t sub_21A44F138()
{
  return MEMORY[0x24BE9A138]();
}

uint64_t sub_21A44F144()
{
  return MEMORY[0x24BE9A140]();
}

uint64_t sub_21A44F150()
{
  return MEMORY[0x24BE9A148]();
}

uint64_t sub_21A44F15C()
{
  return MEMORY[0x24BE9A150]();
}

uint64_t sub_21A44F168()
{
  return MEMORY[0x24BE9A158]();
}

uint64_t sub_21A44F174()
{
  return MEMORY[0x24BE9A1A8]();
}

uint64_t sub_21A44F180()
{
  return MEMORY[0x24BE9A1B0]();
}

uint64_t sub_21A44F18C()
{
  return MEMORY[0x24BE9A1B8]();
}

uint64_t sub_21A44F198()
{
  return MEMORY[0x24BE9A1C0]();
}

uint64_t sub_21A44F1A4()
{
  return MEMORY[0x24BE9A1C8]();
}

uint64_t sub_21A44F1B0()
{
  return MEMORY[0x24BE9A1D0]();
}

uint64_t sub_21A44F1BC()
{
  return MEMORY[0x24BE9A1D8]();
}

uint64_t sub_21A44F1C8()
{
  return MEMORY[0x24BE9A1E0]();
}

uint64_t sub_21A44F1D4()
{
  return MEMORY[0x24BE9A1E8]();
}

uint64_t sub_21A44F1E0()
{
  return MEMORY[0x24BE9A1F0]();
}

uint64_t sub_21A44F1EC()
{
  return MEMORY[0x24BE9A1F8]();
}

uint64_t sub_21A44F1F8()
{
  return MEMORY[0x24BE9A200]();
}

uint64_t sub_21A44F204()
{
  return MEMORY[0x24BE9A208]();
}

uint64_t sub_21A44F210()
{
  return MEMORY[0x24BE9A210]();
}

uint64_t sub_21A44F21C()
{
  return MEMORY[0x24BE9A218]();
}

uint64_t sub_21A44F228()
{
  return MEMORY[0x24BE9A220]();
}

uint64_t sub_21A44F234()
{
  return MEMORY[0x24BE9A228]();
}

uint64_t sub_21A44F240()
{
  return MEMORY[0x24BE9A230]();
}

uint64_t sub_21A44F24C()
{
  return MEMORY[0x24BE9A238]();
}

uint64_t sub_21A44F258()
{
  return MEMORY[0x24BE9A240]();
}

uint64_t sub_21A44F264()
{
  return MEMORY[0x24BE9A248]();
}

uint64_t sub_21A44F270()
{
  return MEMORY[0x24BE9A250]();
}

uint64_t sub_21A44F27C()
{
  return MEMORY[0x24BE9A258]();
}

uint64_t sub_21A44F288()
{
  return MEMORY[0x24BE9A260]();
}

uint64_t sub_21A44F294()
{
  return MEMORY[0x24BE9A268]();
}

uint64_t sub_21A44F2A0()
{
  return MEMORY[0x24BE9A270]();
}

uint64_t sub_21A44F2AC()
{
  return MEMORY[0x24BE9A278]();
}

uint64_t sub_21A44F2B8()
{
  return MEMORY[0x24BE9A2A0]();
}

uint64_t sub_21A44F2C4()
{
  return MEMORY[0x24BE9A2B8]();
}

uint64_t sub_21A44F2D0()
{
  return MEMORY[0x24BE9A2E0]();
}

uint64_t sub_21A44F2DC()
{
  return MEMORY[0x24BE9A2F0]();
}

uint64_t sub_21A44F2E8()
{
  return MEMORY[0x24BE9A2F8]();
}

uint64_t sub_21A44F2F4()
{
  return MEMORY[0x24BE9A300]();
}

uint64_t sub_21A44F300()
{
  return MEMORY[0x24BE9A308]();
}

uint64_t sub_21A44F30C()
{
  return MEMORY[0x24BE9A310]();
}

uint64_t sub_21A44F318()
{
  return MEMORY[0x24BE9A318]();
}

uint64_t sub_21A44F324()
{
  return MEMORY[0x24BE9A320]();
}

uint64_t sub_21A44F330()
{
  return MEMORY[0x24BE9A340]();
}

uint64_t sub_21A44F33C()
{
  return MEMORY[0x24BE9A350]();
}

uint64_t sub_21A44F348()
{
  return MEMORY[0x24BE9A358]();
}

uint64_t sub_21A44F354()
{
  return MEMORY[0x24BE9A360]();
}

uint64_t sub_21A44F360()
{
  return MEMORY[0x24BE9A368]();
}

uint64_t sub_21A44F36C()
{
  return MEMORY[0x24BE9A378]();
}

uint64_t sub_21A44F378()
{
  return MEMORY[0x24BE9A380]();
}

uint64_t sub_21A44F384()
{
  return MEMORY[0x24BE9A388]();
}

uint64_t sub_21A44F390()
{
  return MEMORY[0x24BE9A390]();
}

uint64_t sub_21A44F39C()
{
  return MEMORY[0x24BE9A398]();
}

uint64_t sub_21A44F3A8()
{
  return MEMORY[0x24BE9A3A0]();
}

uint64_t sub_21A44F3B4()
{
  return MEMORY[0x24BE9A3A8]();
}

uint64_t sub_21A44F3C0()
{
  return MEMORY[0x24BE9A3B0]();
}

uint64_t sub_21A44F3CC()
{
  return MEMORY[0x24BE9A3B8]();
}

uint64_t sub_21A44F3D8()
{
  return MEMORY[0x24BE9A400]();
}

uint64_t sub_21A44F3E4()
{
  return MEMORY[0x24BE9A448]();
}

uint64_t sub_21A44F3F0()
{
  return MEMORY[0x24BE9A498]();
}

uint64_t sub_21A44F3FC()
{
  return MEMORY[0x24BE9A4A0]();
}

uint64_t sub_21A44F408()
{
  return MEMORY[0x24BE9A4A8]();
}

uint64_t sub_21A44F414()
{
  return MEMORY[0x24BE9A4F8]();
}

uint64_t sub_21A44F420()
{
  return MEMORY[0x24BE9A550]();
}

uint64_t sub_21A44F42C()
{
  return MEMORY[0x24BE9A600]();
}

uint64_t sub_21A44F438()
{
  return MEMORY[0x24BE9A648]();
}

uint64_t sub_21A44F444()
{
  return MEMORY[0x24BE9A658]();
}

uint64_t sub_21A44F450()
{
  return MEMORY[0x24BE9A660]();
}

uint64_t sub_21A44F45C()
{
  return MEMORY[0x24BE9A6B0]();
}

uint64_t sub_21A44F468()
{
  return MEMORY[0x24BE9A6B8]();
}

uint64_t sub_21A44F474()
{
  return MEMORY[0x24BE9A6D8]();
}

uint64_t sub_21A44F480()
{
  return MEMORY[0x24BE9A748]();
}

uint64_t sub_21A44F48C()
{
  return MEMORY[0x24BE9A758]();
}

uint64_t sub_21A44F498()
{
  return MEMORY[0x24BE9A760]();
}

uint64_t sub_21A44F4A4()
{
  return MEMORY[0x24BE9A768]();
}

uint64_t sub_21A44F4B0()
{
  return MEMORY[0x24BE9A770]();
}

uint64_t sub_21A44F4BC()
{
  return MEMORY[0x24BE9A778]();
}

uint64_t sub_21A44F4C8()
{
  return MEMORY[0x24BE9A780]();
}

uint64_t sub_21A44F4D4()
{
  return MEMORY[0x24BE9A788]();
}

uint64_t sub_21A44F4E0()
{
  return MEMORY[0x24BE9A7C8]();
}

uint64_t sub_21A44F4EC()
{
  return MEMORY[0x24BE9A818]();
}

uint64_t sub_21A44F4F8()
{
  return MEMORY[0x24BE9A880]();
}

uint64_t sub_21A44F504()
{
  return MEMORY[0x24BE9A8C8]();
}

uint64_t sub_21A44F510()
{
  return MEMORY[0x24BE9A950]();
}

uint64_t sub_21A44F51C()
{
  return MEMORY[0x24BE9A958]();
}

uint64_t sub_21A44F528()
{
  return MEMORY[0x24BE9A960]();
}

uint64_t sub_21A44F534()
{
  return MEMORY[0x24BE9A968]();
}

uint64_t sub_21A44F540()
{
  return MEMORY[0x24BE9A970]();
}

uint64_t sub_21A44F54C()
{
  return MEMORY[0x24BE9A978]();
}

uint64_t sub_21A44F558()
{
  return MEMORY[0x24BE9A980]();
}

uint64_t sub_21A44F564()
{
  return MEMORY[0x24BE9A9B0]();
}

uint64_t sub_21A44F570()
{
  return MEMORY[0x24BE9A9D8]();
}

uint64_t sub_21A44F57C()
{
  return MEMORY[0x24BE9A9E0]();
}

uint64_t sub_21A44F588()
{
  return MEMORY[0x24BE9A9E8]();
}

uint64_t sub_21A44F594()
{
  return MEMORY[0x24BE9A9F0]();
}

uint64_t sub_21A44F5A0()
{
  return MEMORY[0x24BE9AA40]();
}

uint64_t sub_21A44F5AC()
{
  return MEMORY[0x24BE9AA48]();
}

uint64_t sub_21A44F5B8()
{
  return MEMORY[0x24BE9AAA0]();
}

uint64_t sub_21A44F5C4()
{
  return MEMORY[0x24BE9AAA8]();
}

uint64_t sub_21A44F5D0()
{
  return MEMORY[0x24BE9AB48]();
}

uint64_t sub_21A44F5DC()
{
  return MEMORY[0x24BE9ABA0]();
}

uint64_t sub_21A44F5E8()
{
  return MEMORY[0x24BE9ABA8]();
}

uint64_t sub_21A44F5F4()
{
  return MEMORY[0x24BE9ABB0]();
}

uint64_t sub_21A44F600()
{
  return MEMORY[0x24BE9ABB8]();
}

uint64_t sub_21A44F60C()
{
  return MEMORY[0x24BE9ABD0]();
}

uint64_t sub_21A44F618()
{
  return MEMORY[0x24BE9ABD8]();
}

uint64_t sub_21A44F624()
{
  return MEMORY[0x24BE9ABE0]();
}

uint64_t sub_21A44F630()
{
  return MEMORY[0x24BE9ABF8]();
}

uint64_t sub_21A44F63C()
{
  return MEMORY[0x24BE9AC98]();
}

uint64_t sub_21A44F648()
{
  return MEMORY[0x24BE9AD18]();
}

uint64_t sub_21A44F654()
{
  return MEMORY[0x24BE9AD20]();
}

uint64_t sub_21A44F660()
{
  return MEMORY[0x24BE9AD48]();
}

uint64_t sub_21A44F66C()
{
  return MEMORY[0x24BE9AD58]();
}

uint64_t sub_21A44F678()
{
  return MEMORY[0x24BE9AD60]();
}

uint64_t sub_21A44F684()
{
  return MEMORY[0x24BE9AD68]();
}

uint64_t sub_21A44F690()
{
  return MEMORY[0x24BE9AD98]();
}

uint64_t sub_21A44F69C()
{
  return MEMORY[0x24BE9AE60]();
}

uint64_t sub_21A44F6A8()
{
  return MEMORY[0x24BE9AE68]();
}

uint64_t sub_21A44F6B4()
{
  return MEMORY[0x24BE9AE70]();
}

uint64_t sub_21A44F6C0()
{
  return MEMORY[0x24BE9AE78]();
}

uint64_t sub_21A44F6CC()
{
  return MEMORY[0x24BE9AEA0]();
}

uint64_t sub_21A44F6D8()
{
  return MEMORY[0x24BE9AF10]();
}

uint64_t sub_21A44F6E4()
{
  return MEMORY[0x24BE9AF20]();
}

uint64_t sub_21A44F6F0()
{
  return MEMORY[0x24BE9AF40]();
}

uint64_t sub_21A44F6FC()
{
  return MEMORY[0x24BE9AF48]();
}

uint64_t sub_21A44F708()
{
  return MEMORY[0x24BE9AF50]();
}

uint64_t sub_21A44F714()
{
  return MEMORY[0x24BE9AF58]();
}

uint64_t sub_21A44F720()
{
  return MEMORY[0x24BE9AF60]();
}

uint64_t sub_21A44F72C()
{
  return MEMORY[0x24BE9AF68]();
}

uint64_t sub_21A44F738()
{
  return MEMORY[0x24BE9AFB8]();
}

uint64_t sub_21A44F744()
{
  return MEMORY[0x24BE9AFE0]();
}

uint64_t sub_21A44F750()
{
  return MEMORY[0x24BE9B030]();
}

uint64_t sub_21A44F75C()
{
  return MEMORY[0x24BE9B040]();
}

uint64_t sub_21A44F768()
{
  return MEMORY[0x24BE9B048]();
}

uint64_t sub_21A44F774()
{
  return MEMORY[0x24BE9B050]();
}

uint64_t sub_21A44F780()
{
  return MEMORY[0x24BE9B058]();
}

uint64_t sub_21A44F78C()
{
  return MEMORY[0x24BE9B060]();
}

uint64_t sub_21A44F798()
{
  return MEMORY[0x24BE9B068]();
}

uint64_t sub_21A44F7A4()
{
  return MEMORY[0x24BE9B080]();
}

uint64_t sub_21A44F7B0()
{
  return MEMORY[0x24BE9B088]();
}

uint64_t sub_21A44F7BC()
{
  return MEMORY[0x24BE9B090]();
}

uint64_t sub_21A44F7C8()
{
  return MEMORY[0x24BE9B0A8]();
}

uint64_t sub_21A44F7D4()
{
  return MEMORY[0x24BE9B0B0]();
}

uint64_t sub_21A44F7E0()
{
  return MEMORY[0x24BE9B0B8]();
}

uint64_t sub_21A44F7EC()
{
  return MEMORY[0x24BE9B0C0]();
}

uint64_t sub_21A44F7F8()
{
  return MEMORY[0x24BE9B0C8]();
}

uint64_t sub_21A44F804()
{
  return MEMORY[0x24BE9B0D0]();
}

uint64_t sub_21A44F810()
{
  return MEMORY[0x24BE9B110]();
}

uint64_t sub_21A44F81C()
{
  return MEMORY[0x24BE9B118]();
}

uint64_t sub_21A44F828()
{
  return MEMORY[0x24BE9B120]();
}

uint64_t sub_21A44F834()
{
  return MEMORY[0x24BE9B128]();
}

uint64_t sub_21A44F840()
{
  return MEMORY[0x24BE9B130]();
}

uint64_t sub_21A44F84C()
{
  return MEMORY[0x24BE9B138]();
}

uint64_t sub_21A44F858()
{
  return MEMORY[0x24BE9B140]();
}

uint64_t sub_21A44F864()
{
  return MEMORY[0x24BE9B148]();
}

uint64_t sub_21A44F870()
{
  return MEMORY[0x24BE9B150]();
}

uint64_t sub_21A44F87C()
{
  return MEMORY[0x24BE9B168]();
}

uint64_t sub_21A44F888()
{
  return MEMORY[0x24BE9B178]();
}

uint64_t sub_21A44F894()
{
  return MEMORY[0x24BE9B180]();
}

uint64_t sub_21A44F8A0()
{
  return MEMORY[0x24BE9B188]();
}

uint64_t sub_21A44F8AC()
{
  return MEMORY[0x24BE9B198]();
}

uint64_t sub_21A44F8B8()
{
  return MEMORY[0x24BE9B1C8]();
}

uint64_t sub_21A44F8C4()
{
  return MEMORY[0x24BE9B2B0]();
}

uint64_t sub_21A44F8D0()
{
  return MEMORY[0x24BE9B2B8]();
}

uint64_t sub_21A44F8DC()
{
  return MEMORY[0x24BE9B300]();
}

uint64_t sub_21A44F8E8()
{
  return MEMORY[0x24BE9B310]();
}

uint64_t sub_21A44F8F4()
{
  return MEMORY[0x24BE9B318]();
}

uint64_t sub_21A44F900()
{
  return MEMORY[0x24BE9B360]();
}

uint64_t sub_21A44F90C()
{
  return MEMORY[0x24BE9B398]();
}

uint64_t sub_21A44F918()
{
  return MEMORY[0x24BE9B3B0]();
}

uint64_t sub_21A44F924()
{
  return MEMORY[0x24BE9B3C8]();
}

uint64_t sub_21A44F930()
{
  return MEMORY[0x24BE9B3E8]();
}

uint64_t sub_21A44F93C()
{
  return MEMORY[0x24BE9B3F8]();
}

uint64_t sub_21A44F948()
{
  return MEMORY[0x24BE9B408]();
}

uint64_t sub_21A44F954()
{
  return MEMORY[0x24BE9B410]();
}

uint64_t sub_21A44F960()
{
  return MEMORY[0x24BE9B438]();
}

uint64_t sub_21A44F96C()
{
  return MEMORY[0x24BE9B450]();
}

uint64_t sub_21A44F978()
{
  return MEMORY[0x24BE9B460]();
}

uint64_t sub_21A44F984()
{
  return MEMORY[0x24BE9B470]();
}

uint64_t sub_21A44F990()
{
  return MEMORY[0x24BE9B488]();
}

uint64_t sub_21A44F99C()
{
  return MEMORY[0x24BE9B4F8]();
}

uint64_t sub_21A44F9A8()
{
  return MEMORY[0x24BE9C040]();
}

uint64_t sub_21A44F9B4()
{
  return MEMORY[0x24BE9C048]();
}

uint64_t sub_21A44F9C0()
{
  return MEMORY[0x24BE9C050]();
}

uint64_t sub_21A44F9CC()
{
  return MEMORY[0x24BE9C058]();
}

uint64_t sub_21A44F9D8()
{
  return MEMORY[0x24BE9C060]();
}

uint64_t sub_21A44F9E4()
{
  return MEMORY[0x24BE9C068]();
}

uint64_t sub_21A44F9F0()
{
  return MEMORY[0x24BE9C070]();
}

uint64_t sub_21A44F9FC()
{
  return MEMORY[0x24BE9C078]();
}

uint64_t sub_21A44FA08()
{
  return MEMORY[0x24BE9C080]();
}

uint64_t sub_21A44FA14()
{
  return MEMORY[0x24BE9C0A0]();
}

uint64_t sub_21A44FA20()
{
  return MEMORY[0x24BE9C0B0]();
}

uint64_t sub_21A44FA2C()
{
  return MEMORY[0x24BE9C0B8]();
}

uint64_t sub_21A44FA38()
{
  return MEMORY[0x24BE9C0C0]();
}

uint64_t sub_21A44FA44()
{
  return MEMORY[0x24BE9C0C8]();
}

uint64_t sub_21A44FA50()
{
  return MEMORY[0x24BE9C0D8]();
}

uint64_t sub_21A44FA5C()
{
  return MEMORY[0x24BE9C0E0]();
}

uint64_t sub_21A44FA68()
{
  return MEMORY[0x24BE9C0F0]();
}

uint64_t sub_21A44FA74()
{
  return MEMORY[0x24BE9C0F8]();
}

uint64_t sub_21A44FA80()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_21A44FA8C()
{
  return MEMORY[0x24BEE73D0]();
}

uint64_t sub_21A44FA98()
{
  return MEMORY[0x24BE3AEC8]();
}

uint64_t sub_21A44FAA4()
{
  return MEMORY[0x24BE3AED8]();
}

uint64_t sub_21A44FAB0()
{
  return MEMORY[0x24BE3AEE8]();
}

uint64_t sub_21A44FABC()
{
  return MEMORY[0x24BE3AF08]();
}

uint64_t sub_21A44FAC8()
{
  return MEMORY[0x24BE3AF58]();
}

uint64_t sub_21A44FAD4()
{
  return MEMORY[0x24BE688C0]();
}

uint64_t sub_21A44FAE0()
{
  return MEMORY[0x24BE688C8]();
}

uint64_t sub_21A44FAEC()
{
  return MEMORY[0x24BEA3F78]();
}

uint64_t sub_21A44FAF8()
{
  return MEMORY[0x24BEA3F80]();
}

uint64_t sub_21A44FB04()
{
  return MEMORY[0x24BEA3F88]();
}

uint64_t sub_21A44FB10()
{
  return MEMORY[0x24BEA3F90]();
}

uint64_t sub_21A44FB1C()
{
  return MEMORY[0x24BEA3F98]();
}

uint64_t sub_21A44FB28()
{
  return MEMORY[0x24BEA3FA0]();
}

uint64_t sub_21A44FB34()
{
  return MEMORY[0x24BEA3FA8]();
}

uint64_t sub_21A44FB40()
{
  return MEMORY[0x24BEA3FB0]();
}

uint64_t sub_21A44FB4C()
{
  return MEMORY[0x24BEA3FB8]();
}

uint64_t sub_21A44FB58()
{
  return MEMORY[0x24BEA3FC0]();
}

uint64_t sub_21A44FB64()
{
  return MEMORY[0x24BEA3FD8]();
}

uint64_t sub_21A44FB70()
{
  return MEMORY[0x24BEA3FE0]();
}

uint64_t sub_21A44FB7C()
{
  return MEMORY[0x24BEA3FF8]();
}

uint64_t sub_21A44FB88()
{
  return MEMORY[0x24BE5B970]();
}

uint64_t sub_21A44FB94()
{
  return MEMORY[0x24BE5B990]();
}

uint64_t sub_21A44FBA0()
{
  return MEMORY[0x24BE5B9A8]();
}

uint64_t sub_21A44FBAC()
{
  return MEMORY[0x24BE5B9B0]();
}

uint64_t sub_21A44FBB8()
{
  return MEMORY[0x24BE5B9D0]();
}

uint64_t sub_21A44FBC4()
{
  return MEMORY[0x24BE5B9F0]();
}

uint64_t sub_21A44FBD0()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t sub_21A44FBDC()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_21A44FBE8()
{
  return MEMORY[0x24BE5BA50]();
}

uint64_t sub_21A44FBF4()
{
  return MEMORY[0x24BE5BA70]();
}

uint64_t sub_21A44FC00()
{
  return MEMORY[0x24BE5BDE8]();
}

uint64_t sub_21A44FC0C()
{
  return MEMORY[0x24BE5BF88]();
}

uint64_t sub_21A44FC18()
{
  return MEMORY[0x24BE5BF90]();
}

uint64_t sub_21A44FC24()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t sub_21A44FC30()
{
  return MEMORY[0x24BE5BFA0]();
}

uint64_t sub_21A44FC3C()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_21A44FC48()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_21A44FC54()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_21A44FC60()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_21A44FC6C()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t sub_21A44FC78()
{
  return MEMORY[0x24BE5C190]();
}

uint64_t sub_21A44FC84()
{
  return MEMORY[0x24BE5C1A0]();
}

uint64_t sub_21A44FC90()
{
  return MEMORY[0x24BE5C1A8]();
}

uint64_t sub_21A44FC9C()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_21A44FCA8()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_21A44FCB4()
{
  return MEMORY[0x24BE5C1D8]();
}

uint64_t sub_21A44FCC0()
{
  return MEMORY[0x24BE94690]();
}

uint64_t sub_21A44FCCC()
{
  return MEMORY[0x24BE94698]();
}

uint64_t sub_21A44FCD8()
{
  return MEMORY[0x24BE946B0]();
}

uint64_t sub_21A44FCE4()
{
  return MEMORY[0x24BE946C0]();
}

uint64_t sub_21A44FCF0()
{
  return MEMORY[0x24BEA5FB0]();
}

uint64_t sub_21A44FCFC()
{
  return MEMORY[0x24BEA5FB8]();
}

uint64_t sub_21A44FD08()
{
  return MEMORY[0x24BEA5FC0]();
}

uint64_t sub_21A44FD14()
{
  return MEMORY[0x24BEA5FC8]();
}

uint64_t sub_21A44FD20()
{
  return MEMORY[0x24BEA5FD8]();
}

uint64_t sub_21A44FD2C()
{
  return MEMORY[0x24BEA5FE0]();
}

uint64_t sub_21A44FD38()
{
  return MEMORY[0x24BEA5FE8]();
}

uint64_t sub_21A44FD44()
{
  return MEMORY[0x24BEA5FF0]();
}

uint64_t sub_21A44FD50()
{
  return MEMORY[0x24BEA5FF8]();
}

uint64_t sub_21A44FD5C()
{
  return MEMORY[0x24BEA6000]();
}

uint64_t sub_21A44FD68()
{
  return MEMORY[0x24BEA6008]();
}

uint64_t sub_21A44FD74()
{
  return MEMORY[0x24BEA6018]();
}

uint64_t sub_21A44FD80()
{
  return MEMORY[0x24BEA6020]();
}

uint64_t sub_21A44FD8C()
{
  return MEMORY[0x24BEA6030]();
}

uint64_t sub_21A44FD98()
{
  return MEMORY[0x24BEA6038]();
}

uint64_t sub_21A44FDA4()
{
  return MEMORY[0x24BEA6040]();
}

uint64_t sub_21A44FDB0()
{
  return MEMORY[0x24BEA6048]();
}

uint64_t sub_21A44FDBC()
{
  return MEMORY[0x24BEA6068]();
}

uint64_t sub_21A44FDC8()
{
  return MEMORY[0x24BEA6070]();
}

uint64_t sub_21A44FDD4()
{
  return MEMORY[0x24BEA6078]();
}

uint64_t sub_21A44FDE0()
{
  return MEMORY[0x24BEA6088]();
}

uint64_t sub_21A44FDEC()
{
  return MEMORY[0x24BEA6090]();
}

uint64_t sub_21A44FDF8()
{
  return MEMORY[0x24BEA6098]();
}

uint64_t sub_21A44FE04()
{
  return MEMORY[0x24BEA60A0]();
}

uint64_t sub_21A44FE10()
{
  return MEMORY[0x24BEA60A8]();
}

uint64_t sub_21A44FE1C()
{
  return MEMORY[0x24BEA60B0]();
}

uint64_t sub_21A44FE28()
{
  return MEMORY[0x24BEA60B8]();
}

uint64_t sub_21A44FE34()
{
  return MEMORY[0x24BEA60C0]();
}

uint64_t sub_21A44FE40()
{
  return MEMORY[0x24BEA60C8]();
}

uint64_t sub_21A44FE4C()
{
  return MEMORY[0x24BEA60D0]();
}

uint64_t sub_21A44FE58()
{
  return MEMORY[0x24BEA60D8]();
}

uint64_t sub_21A44FE64()
{
  return MEMORY[0x24BEA60E0]();
}

uint64_t sub_21A44FE70()
{
  return MEMORY[0x24BEA60E8]();
}

uint64_t sub_21A44FE7C()
{
  return MEMORY[0x24BEA60F8]();
}

uint64_t sub_21A44FE88()
{
  return MEMORY[0x24BEA6178]();
}

uint64_t sub_21A44FE94()
{
  return MEMORY[0x24BEA6180]();
}

uint64_t sub_21A44FEA0()
{
  return MEMORY[0x24BEA6190]();
}

uint64_t sub_21A44FEAC()
{
  return MEMORY[0x24BEA61A0]();
}

uint64_t sub_21A44FEB8()
{
  return MEMORY[0x24BEA61A8]();
}

uint64_t sub_21A44FEC4()
{
  return MEMORY[0x24BEA61C0]();
}

uint64_t sub_21A44FED0()
{
  return MEMORY[0x24BEA61C8]();
}

uint64_t sub_21A44FEDC()
{
  return MEMORY[0x24BEA61D0]();
}

uint64_t sub_21A44FEE8()
{
  return MEMORY[0x24BEA61D8]();
}

uint64_t sub_21A44FEF4()
{
  return MEMORY[0x24BEA61E8]();
}

uint64_t sub_21A44FF00()
{
  return MEMORY[0x24BEA61F0]();
}

uint64_t sub_21A44FF0C()
{
  return MEMORY[0x24BEA6200]();
}

uint64_t sub_21A44FF18()
{
  return MEMORY[0x24BEA6208]();
}

uint64_t sub_21A44FF24()
{
  return MEMORY[0x24BEA6238]();
}

uint64_t sub_21A44FF30()
{
  return MEMORY[0x24BE57150]();
}

uint64_t sub_21A44FF3C()
{
  return MEMORY[0x24BE57320]();
}

uint64_t sub_21A44FF48()
{
  return MEMORY[0x24BE57380]();
}

uint64_t sub_21A44FF54()
{
  return MEMORY[0x24BE573C0]();
}

uint64_t sub_21A44FF60()
{
  return MEMORY[0x24BE573C8]();
}

uint64_t sub_21A44FF6C()
{
  return MEMORY[0x24BE57538]();
}

uint64_t sub_21A44FF78()
{
  return MEMORY[0x24BE57570]();
}

uint64_t sub_21A44FF84()
{
  return MEMORY[0x24BE575A8]();
}

uint64_t sub_21A44FF90()
{
  return MEMORY[0x24BE57608]();
}

uint64_t sub_21A44FF9C()
{
  return MEMORY[0x24BE576C8]();
}

uint64_t sub_21A44FFA8()
{
  return MEMORY[0x24BE57758]();
}

uint64_t sub_21A44FFB4()
{
  return MEMORY[0x24BE57778]();
}

uint64_t sub_21A44FFC0()
{
  return MEMORY[0x24BE57790]();
}

uint64_t sub_21A44FFCC()
{
  return MEMORY[0x24BE577B0]();
}

uint64_t sub_21A44FFD8()
{
  return MEMORY[0x24BE578A0]();
}

uint64_t sub_21A44FFE4()
{
  return MEMORY[0x24BE578A8]();
}

uint64_t sub_21A44FFF0()
{
  return MEMORY[0x24BE578B8]();
}

uint64_t sub_21A44FFFC()
{
  return MEMORY[0x24BE57B20]();
}

uint64_t sub_21A450008()
{
  return MEMORY[0x24BE57B60]();
}

uint64_t sub_21A450014()
{
  return MEMORY[0x24BE57BA8]();
}

uint64_t sub_21A450020()
{
  return MEMORY[0x24BE57BD8]();
}

uint64_t sub_21A45002C()
{
  return MEMORY[0x24BE57C38]();
}

uint64_t sub_21A450038()
{
  return MEMORY[0x24BE57C40]();
}

uint64_t sub_21A450044()
{
  return MEMORY[0x24BE57C58]();
}

uint64_t sub_21A450050()
{
  return MEMORY[0x24BE57C60]();
}

uint64_t sub_21A45005C()
{
  return MEMORY[0x24BE57C70]();
}

uint64_t sub_21A450068()
{
  return MEMORY[0x24BE57C80]();
}

uint64_t sub_21A450074()
{
  return MEMORY[0x24BE57C88]();
}

uint64_t sub_21A450080()
{
  return MEMORY[0x24BE57C90]();
}

uint64_t sub_21A45008C()
{
  return MEMORY[0x24BE57C98]();
}

uint64_t sub_21A450098()
{
  return MEMORY[0x24BE57CC8]();
}

uint64_t sub_21A4500A4()
{
  return MEMORY[0x24BE57CD0]();
}

uint64_t sub_21A4500B0()
{
  return MEMORY[0x24BE57CD8]();
}

uint64_t sub_21A4500BC()
{
  return MEMORY[0x24BE57DF8]();
}

uint64_t sub_21A4500C8()
{
  return MEMORY[0x24BE57E10]();
}

uint64_t sub_21A4500D4()
{
  return MEMORY[0x24BEA5460]();
}

uint64_t sub_21A4500E0()
{
  return MEMORY[0x24BEA5468]();
}

uint64_t sub_21A4500EC()
{
  return MEMORY[0x24BEA5490]();
}

uint64_t sub_21A4500F8()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_21A450104()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_21A450110()
{
  return MEMORY[0x24BDFCA98]();
}

uint64_t sub_21A45011C()
{
  return MEMORY[0x24BE3B468]();
}

uint64_t sub_21A450128()
{
  return MEMORY[0x24BE3B470]();
}

uint64_t sub_21A450134()
{
  return MEMORY[0x24BE3B6C8]();
}

uint64_t sub_21A450140()
{
  return MEMORY[0x24BE3B6F0]();
}

uint64_t sub_21A45014C()
{
  return MEMORY[0x24BE3B708]();
}

uint64_t sub_21A450158()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_21A450164()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_21A450170()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_21A45017C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_21A450188()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_21A450194()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_21A4501A0()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21A4501AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21A4501B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21A4501C4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21A4501D0()
{
  return MEMORY[0x24BEA5540]();
}

uint64_t sub_21A4501DC()
{
  return MEMORY[0x24BEA5570]();
}

uint64_t sub_21A4501E8()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_21A4501F4()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_21A450200()
{
  return MEMORY[0x24BEA5670]();
}

uint64_t sub_21A45020C()
{
  return MEMORY[0x24BEA5678]();
}

uint64_t sub_21A450218()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_21A450224()
{
  return MEMORY[0x24BEA5840]();
}

uint64_t sub_21A450230()
{
  return MEMORY[0x24BEA5850]();
}

uint64_t sub_21A45023C()
{
  return MEMORY[0x24BEA5858]();
}

uint64_t sub_21A450248()
{
  return MEMORY[0x24BEA5930]();
}

uint64_t sub_21A450254()
{
  return MEMORY[0x24BEA5950]();
}

uint64_t sub_21A450260()
{
  return MEMORY[0x24BEA5958]();
}

uint64_t sub_21A45026C()
{
  return MEMORY[0x24BEA5960]();
}

uint64_t sub_21A450278()
{
  return MEMORY[0x24BEA5968]();
}

uint64_t sub_21A450284()
{
  return MEMORY[0x24BEA5970]();
}

uint64_t sub_21A450290()
{
  return MEMORY[0x24BEA59B8]();
}

uint64_t sub_21A45029C()
{
  return MEMORY[0x24BEA59C0]();
}

uint64_t sub_21A4502A8()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_21A4502B4()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_21A4502C0()
{
  return MEMORY[0x24BEA5A48]();
}

uint64_t sub_21A4502CC()
{
  return MEMORY[0x24BEA5A60]();
}

uint64_t sub_21A4502D8()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_21A4502E4()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_21A4502F0()
{
  return MEMORY[0x24BEA5A88]();
}

uint64_t sub_21A4502FC()
{
  return MEMORY[0x24BEA5A98]();
}

uint64_t sub_21A450308()
{
  return MEMORY[0x24BEB8FB0]();
}

uint64_t sub_21A450314()
{
  return MEMORY[0x24BEB8FE0]();
}

uint64_t sub_21A450320()
{
  return MEMORY[0x24BEB9618]();
}

uint64_t sub_21A45032C()
{
  return MEMORY[0x24BEB9850]();
}

uint64_t sub_21A450338()
{
  return MEMORY[0x24BEB9858]();
}

uint64_t sub_21A450344()
{
  return MEMORY[0x24BEB9868]();
}

uint64_t sub_21A450350()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_21A45035C()
{
  return MEMORY[0x24BEB99A0]();
}

uint64_t sub_21A450368()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_21A450374()
{
  return MEMORY[0x24BEB9CE8]();
}

uint64_t sub_21A450380()
{
  return MEMORY[0x24BEB9D10]();
}

uint64_t sub_21A45038C()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_21A450398()
{
  return MEMORY[0x24BEBA4B0]();
}

uint64_t sub_21A4503A4()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21A4503B0()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_21A4503BC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21A4503C8()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_21A4503D4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21A4503E0()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_21A4503EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21A4503F8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21A450404()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21A450410()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_21A45041C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_21A450428()
{
  return MEMORY[0x24BE5E9F8]();
}

uint64_t sub_21A450434()
{
  return MEMORY[0x24BE5EA00]();
}

uint64_t sub_21A450440()
{
  return MEMORY[0x24BE5EA10]();
}

uint64_t sub_21A45044C()
{
  return MEMORY[0x24BE5EA28]();
}

uint64_t sub_21A450458()
{
  return MEMORY[0x24BE5EA38]();
}

uint64_t sub_21A450464()
{
  return MEMORY[0x24BE5EA48]();
}

uint64_t sub_21A450470()
{
  return MEMORY[0x24BE5EA68]();
}

uint64_t sub_21A45047C()
{
  return MEMORY[0x24BE5EA78]();
}

uint64_t sub_21A450488()
{
  return MEMORY[0x24BE5EA80]();
}

uint64_t sub_21A450494()
{
  return MEMORY[0x24BE5EA90]();
}

uint64_t sub_21A4504A0()
{
  return MEMORY[0x24BE5EAA0]();
}

uint64_t sub_21A4504AC()
{
  return MEMORY[0x24BE5EAA8]();
}

uint64_t sub_21A4504B8()
{
  return MEMORY[0x24BE5EAB0]();
}

uint64_t sub_21A4504C4()
{
  return MEMORY[0x24BE5EAB8]();
}

uint64_t sub_21A4504D0()
{
  return MEMORY[0x24BE5EAC0]();
}

uint64_t sub_21A4504DC()
{
  return MEMORY[0x24BE5EAC8]();
}

uint64_t sub_21A4504E8()
{
  return MEMORY[0x24BE5EAE8]();
}

uint64_t sub_21A4504F4()
{
  return MEMORY[0x24BE5EB00]();
}

uint64_t sub_21A450500()
{
  return MEMORY[0x24BE7A7E0]();
}

uint64_t sub_21A45050C()
{
  return MEMORY[0x24BE7A808]();
}

uint64_t sub_21A450518()
{
  return MEMORY[0x24BE7A900]();
}

uint64_t sub_21A450524()
{
  return MEMORY[0x24BE7A908]();
}

uint64_t sub_21A450530()
{
  return MEMORY[0x24BE7AB88]();
}

uint64_t sub_21A45053C()
{
  return MEMORY[0x24BE3C8C8]();
}

uint64_t sub_21A450548()
{
  return MEMORY[0x24BE3BA58]();
}

uint64_t sub_21A450554()
{
  return MEMORY[0x24BE3BA78]();
}

uint64_t sub_21A450560()
{
  return MEMORY[0x24BEB8690]();
}

uint64_t sub_21A45056C()
{
  return MEMORY[0x24BE3B080]();
}

uint64_t sub_21A450578()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21A450584()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_21A450590()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21A45059C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21A4505A8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21A4505B4()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_21A4505C0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21A4505CC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21A4505D8()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_21A4505E4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21A4505F0()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21A4505FC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21A450608()
{
  return MEMORY[0x24BDCF878]();
}

uint64_t sub_21A450614()
{
  return MEMORY[0x24BDCF890]();
}

uint64_t sub_21A450620()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21A45062C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21A450638()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21A450644()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21A450650()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21A45065C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21A450668()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21A450674()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21A450680()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21A45068C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21A450698()
{
  return MEMORY[0x24BE9E030]();
}

uint64_t sub_21A4506A4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21A4506B0()
{
  return MEMORY[0x24BEE0A68]();
}

uint64_t sub_21A4506BC()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_21A4506C8()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_21A4506D4()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_21A4506E0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21A4506EC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21A4506F8()
{
  return MEMORY[0x24BEE0B30]();
}

uint64_t sub_21A450704()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21A450710()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_21A45071C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21A450728()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21A450734()
{
  return MEMORY[0x24BEE0BA0]();
}

uint64_t sub_21A450740()
{
  return MEMORY[0x24BEE0BA8]();
}

uint64_t sub_21A45074C()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_21A450758()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21A450764()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t sub_21A450770()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_21A45077C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21A450788()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21A450794()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21A4507A0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21A4507AC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21A4507B8()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_21A4507C4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21A4507D0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21A4507DC()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_21A4507E8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21A4507F4()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21A450800()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21A45080C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21A450818()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21A450824()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21A450830()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21A45083C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21A450848()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21A450854()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21A450860()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21A45086C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21A450878()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21A450884()
{
  return MEMORY[0x24BEE1310]();
}

uint64_t sub_21A450890()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21A45089C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21A4508A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21A4508B4()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_21A4508C0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21A4508CC()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_21A4508D8()
{
  return MEMORY[0x24BEE6BB0]();
}

uint64_t sub_21A4508E4()
{
  return MEMORY[0x24BE9E038]();
}

uint64_t sub_21A4508F0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21A4508FC()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_21A450908()
{
  return MEMORY[0x24BE94898]();
}

uint64_t sub_21A450914()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21A450920()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21A45092C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21A450938()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21A450944()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21A450950()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21A45095C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21A450968()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_21A450974()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21A450980()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21A45098C()
{
  return MEMORY[0x24BEA3850]();
}

uint64_t sub_21A450998()
{
  return MEMORY[0x24BEA3858]();
}

uint64_t sub_21A4509A4()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21A4509B0()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21A4509BC()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_21A4509C8()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_21A4509D4()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_21A4509E0()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_21A4509EC()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_21A4509F8()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_21A450A04()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21A450A10()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21A450A1C()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_21A450A28()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_21A450A34()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21A450A40()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21A450A4C()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_21A450A58()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21A450A64()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21A450A70()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21A450A7C()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21A450A88()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_21A450A94()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21A450AA0()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_21A450AAC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21A450AB8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21A450AC4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21A450AD0()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_21A450ADC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21A450AE8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21A450AF4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21A450B00()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_21A450B0C()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_21A450B18()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21A450B24()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21A450B30()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21A450B3C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_21A450B48()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21A450B54()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21A450B60()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_21A450B6C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21A450B78()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21A450B84()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21A450B90()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21A450B9C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21A450BA8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21A450BB4()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21A450BC0()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21A450BCC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21A450BD8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21A450BE4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21A450BF0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21A450BFC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21A450C08()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21A450C14()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21A450C20()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_21A450C2C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_21A450C38()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_21A450C44()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21A450C50()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21A450C5C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21A450C68()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_21A450C74()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_21A450C80()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21A450C8C()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_21A450C98()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21A450CA4()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_21A450CB0()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_21A450CBC()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_21A450CC8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21A450CD4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21A450CE0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21A450CEC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21A450CF8()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_21A450D04()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21A450D10()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_21A450D1C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21A450D28()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_21A450D34()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21A450D40()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21A450D4C()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_21A450D58()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_21A450D64()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21A450D70()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_21A450D7C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21A450D88()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21A450D94()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21A450DA0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21A450DAC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21A450DB8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21A450DC4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21A450DD0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21A450DDC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A450DE8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A450DF4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21A450E00()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_21A450E0C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21A450E18()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21A450E24()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21A450E30()
{
  return MEMORY[0x24BEE46C8]();
}

uint64_t sub_21A450E3C()
{
  return MEMORY[0x24BEE4780]();
}

uint64_t sub_21A450E48()
{
  return MEMORY[0x24BEE47C8]();
}

uint64_t sub_21A450E54()
{
  return MEMORY[0x24BEE47D0]();
}

uint64_t sub_21A450E60()
{
  return MEMORY[0x24BEE47E0]();
}

uint64_t sub_21A450E6C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21A450E78()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21A450E84()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x24BE08CA8]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SiriAnalyticsMachAbsoluteTimeGetNanoseconds()
{
  return MEMORY[0x24BE909C8]();
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

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this)
{
  return MEMORY[0x24BE9E378](this);
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
  MEMORY[0x24BE9E380](this);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x24BE7B2E8](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x24BE7B2F0](this);
}

uint64_t siri::ontology::UsoGraphNode::setSuccessor()
{
  return MEMORY[0x24BEA3AA0]();
}

uint64_t siri::ontology::UsoEntityNode::addEntitySpan()
{
  return MEMORY[0x24BEA3AA8]();
}

uint64_t siri::ontology::UsoEntityNode::addIdentifier()
{
  return MEMORY[0x24BEA3AB0]();
}

{
  return MEMORY[0x24BEA3AB8]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x24BEA3AC0](this);
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment()
{
  return MEMORY[0x24BEA3AC8]();
}

uint64_t siri::ontology::UsoEntitySpan::addSpanProperty()
{
  return MEMORY[0x24BEA3AD0]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEdgeName()
{
  return MEMORY[0x24BEA3AD8]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomVerbName()
{
  return MEMORY[0x24BEA3AE0]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEntityName()
{
  return MEMORY[0x24BEA3AE8]();
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf()
{
  return MEMORY[0x24BE9E390]();
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x24BEA3AF0](this);
}

uint64_t siri::ontology::resetSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x24BEA3AF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_task(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Reference_run(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B20](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_label(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Decimal(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B48](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Integer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B50](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Setting(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B58](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_target(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_reference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_EmailAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommand(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MixedFraction(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_definedValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_integerValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DeviceCategory(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C20](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_numeratorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_canonicalString(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C48](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Last(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C50](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Next(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C58](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_denominatorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_relationshipType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_URL(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C80](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_First(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Ninth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Tenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Third(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PersonRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_offsetToReference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Book(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Show(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CD0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Song(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CD8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Middle(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Second(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Album(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Email(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Movie(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Photo(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Video(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D20](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Current(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twelfth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eleventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Previous(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D48](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D50](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Article(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D58](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Episode(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Podcast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Webpage(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D80](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twentieth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Document(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Location(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3D98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Playlist(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Nineteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Thirteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventeenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_ThirdToLast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DD0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DD8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFirst(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyThird(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_identifyingRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_MyLocation(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3DF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Screenshot(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_SecondToLast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentySecond(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E20](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_AudioMessage(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_CurrencyAmount(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesNew(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesRead(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E48](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E50](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSaved(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E58](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLatest(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnread(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFlagged(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSubject(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesTapback(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E80](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnsaved(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesReceived(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnflagged(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3E98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesAttachment(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EA0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesEchoEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EA8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoudEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoveEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSlamEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesHandwritten(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesDigitalTouch(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3ED0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesGentleEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3ED8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLasersEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesMusicSharing(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesBalloonsEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesConfettiEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3EF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFireworksEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3F00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSpotlightEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3F08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesCelebrationEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3F10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesInvisibleInkEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3F18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesShootingStarEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3F20](this);
}

uint64_t siri::ontology::UsoGraph::createIntNode()
{
  return MEMORY[0x24BEA3F28]();
}

uint64_t siri::ontology::UsoGraph::createTaskNode()
{
  return MEMORY[0x24BEA3F30]();
}

uint64_t siri::ontology::UsoGraph::createEntityNode()
{
  return MEMORY[0x24BEA3F38]();
}

uint64_t siri::ontology::UsoGraph::createStringNode()
{
  return MEMORY[0x24BEA3F40]();
}

uint64_t siri::ontology::UsoGraph::UsoGraph()
{
  return MEMORY[0x24BEA3F48]();
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
  MEMORY[0x24BEA3F50](this);
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x24BEDC580](this, a2);
}

uint64_t marisa::Trie::build(marisa::Trie *this, marisa::Keyset *a2)
{
  return MEMORY[0x24BEDC588](this, a2);
}

uint64_t marisa::Trie::clear(marisa::Trie *this)
{
  return MEMORY[0x24BEDC590](this);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x24BEDC598](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
  MEMORY[0x24BEDC5A0](this);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x24BEDC5A8](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x24BEDC5B0](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x24BEDC5B8](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
  MEMORY[0x24BEDC5C0](this);
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2)
{
  return MEMORY[0x24BEDC5C8](this, a2);
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2, float a3)
{
  return MEMORY[0x24BEDC5D0](this, a2, a3);
}

uint64_t marisa::Keyset::Keyset(marisa::Keyset *this)
{
  return MEMORY[0x24BEDC5D8](this);
}

uint64_t morphun::TokenIterator::TokenIterator()
{
  return MEMORY[0x24BEDC880]();
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x24BEDC888]();
}

uint64_t morphun::TokenizerFactory::createTokenizer(morphun::TokenizerFactory *this, const ULocale *a2)
{
  return MEMORY[0x24BEDC890](this, a2);
}

uint64_t morphun::util::ULocale::ULocale()
{
  return MEMORY[0x24BEDC8B0]();
}

void morphun::util::ULocale::~ULocale(morphun::util::ULocale *this)
{
  MEMORY[0x24BEDC8B8](this);
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
  return MEMORY[0x24BEDC8C8](this);
}

uint64_t morphun::Tokenizer::setMaxTokens(morphun::Tokenizer *this)
{
  return MEMORY[0x24BEDC8D8](this);
}

uint64_t morphun::Tokenizer::setMaxInputSize(morphun::Tokenizer *this)
{
  return MEMORY[0x24BEDC8E0](this);
}

uint64_t morphun::resources::DataRegistrationService::registerDataPathForLocale()
{
  return MEMORY[0x24BEDC8E8]();
}

uint64_t sirinluexternal::UsoGraph::writeTo(sirinluexternal::UsoGraph *this, PB::Writer *a2)
{
  return MEMORY[0x24BE9E398](this, a2);
}

uint64_t siri::ontology::UsoEntityNode::getEntitySpans(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x24BEA3F58](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint()
{
  return MEMORY[0x24BEA3F60]();
}

uint64_t siri::ontology::UsoGraph::getNodes(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x24BEA3F68](this);
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC5E0](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC5E8](this, a2);
}

uint64_t marisa::Trie::save(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x24BEDC5F0](this, a2);
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  return MEMORY[0x24BEDC5F8](this);
}

uint64_t marisa::Trie::empty(marisa::Trie *this)
{
  return MEMORY[0x24BEDC600](this);
}

uint64_t marisa::Trie::lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC608](this, a2);
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  return MEMORY[0x24BEDC610](this);
}

uint64_t morphun::TokenIterator::operator*()
{
  return MEMORY[0x24BEDC8F8]();
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x24BEDC900]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x24BEDC908]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x24BEDC910](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x24BEDC918](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x24BEDC920](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x24BEDC928](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x24BEDC930](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x24BEDC938](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x24BEDC940](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
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

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24DCA23A8();
}

void operator delete(void *__p)
{
  off_24DCA23B0(__p);
}

uint64_t operator delete()
{
  return off_24DCA23B8();
}

uint64_t operator new[]()
{
  return off_24DCA23C0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DCA23C8(__sz);
}

uint64_t operator new()
{
  return off_24DCA23D0();
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE8](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x24BDADD30](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t skitRemoveBidiCharacters()
{
  return MEMORY[0x24BEDDED8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x24BEE7218]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3288](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

