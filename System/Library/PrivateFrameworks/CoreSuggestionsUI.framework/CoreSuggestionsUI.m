_BYTE *OUTLINED_FUNCTION_56()
{
  _BYTE *v0;
  _BYTE *v1;

  v1[16] = v0[16];
  v1[17] = v0[17];
  v1[18] = v0[18];
  return v1;
}

void OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188820(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_127()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_30_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_30_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(v0 + 52)) = *(_QWORD *)(v2 + *(int *)(v0 + 52));
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_30_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xA8))();
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  return type metadata accessor for SGSuggestionsTableView(0);
}

id OUTLINED_FUNCTION_30_4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_30_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  return sub_1B11BAE88();
}

void OUTLINED_FUNCTION_30_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(v0 + 60)) = *(_QWORD *)(v2 + *(int *)(v0 + 60));
  *(_BYTE *)(v1 + *(int *)(v0 + 64)) = *(_BYTE *)(v2 + *(int *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_1B11BAE88();
}

uint64_t OUTLINED_FUNCTION_41_1@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v3 = (_OWORD *)(v2 + a1);
  v4 = v3[1];
  *v1 = *v3;
  v1[1] = v4;
  v5 = v3[3];
  v1[2] = v3[2];
  v1[3] = v5;
  v1[4] = v3[4];
  return type metadata accessor for SGBannerPaddingParams(0);
}

BOOL OUTLINED_FUNCTION_41_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void *OUTLINED_FUNCTION_41_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 32) = a1;
  v2 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v1 + 40) = v2;
  return malloc(*(_QWORD *)(v2 + 64));
}

uint64_t OUTLINED_FUNCTION_41_4()
{
  return sub_1B11BB56C();
}

void OUTLINED_FUNCTION_41_5(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_41_7()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_41_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  return v10(v11, a10, v12);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_isEscapingClosureAtFileLocation();
}

void OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B117F254(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_161()
{
  JUMPOUT(0x1B5E17CECLL);
}

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

id OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(int *)(a1 + 48);
  v4 = v1 + v3;
  *(_BYTE *)v4 = *(_BYTE *)(v2 + v3);
  *(_BYTE *)(v4 + 1) = *(_BYTE *)(v2 + v3 + 1);
  *(_BYTE *)(v4 + 2) = *(_BYTE *)(v2 + v3 + 2);
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(v2 + v3 + 8);
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + v3 + 16);
  *(_QWORD *)(v4 + 24) = *(_QWORD *)(v2 + v3 + 24);
  v5 = *(void **)(v2 + v3 + 32);
  *(_QWORD *)(v4 + 32) = v5;
  return v5;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t (*v3)(char *, char *, uint64_t);
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v4 = *((_OWORD *)v1 + 1);
  *(_OWORD *)v0 = *(_OWORD *)v1;
  *((_OWORD *)v0 + 1) = v4;
  v5 = *((_OWORD *)v1 + 3);
  *((_OWORD *)v0 + 2) = *((_OWORD *)v1 + 2);
  *((_OWORD *)v0 + 3) = v5;
  *((_OWORD *)v0 + 4) = *((_OWORD *)v1 + 4);
  v6 = type metadata accessor for SGBannerPaddingParams(0);
  return v3(&v0[*(int *)(v6 + 56)], &v1[*(int *)(v6 + 56)], v2);
}

uint64_t OUTLINED_FUNCTION_6_5@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  a1[7] = a2;
  a1[8] = v2;
  a1[4] = 1;
  return sub_1B11BB3A4();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1, unint64_t *a2)
{
  return sub_1B1176E90(0, a2);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_1(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  return sub_1B11BAAD4();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xC0))();
}

id OUTLINED_FUNCTION_20(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_5_3()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 a13)
{
  uint64_t v13;

  *(_OWORD *)(a1 + 16) = a13;
  *(_QWORD *)(a1 + 32) = v13;
  return sub_1B11BB44C();
}

uint64_t OUTLINED_FUNCTION_42@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_1B11BA99C();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_14_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  v3 = *(int *)(v2 + 20);
  v4 = (_BYTE *)(v0 + v3);
  *v4 = *(_BYTE *)(v1 + v3);
  v4[1] = *(_BYTE *)(v1 + v3 + 1);
  v4[2] = *(_BYTE *)(v1 + v3 + 2);
  v4[3] = *(_BYTE *)(v1 + v3 + 3);
  v4[4] = *(_BYTE *)(v1 + v3 + 4);
  v4[5] = *(_BYTE *)(v1 + v3 + 5);
  v4[6] = *(_BYTE *)(v1 + v3 + 6);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_27(uint64_t a1)
{
  return sub_1B1175A30(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

void OUTLINED_FUNCTION_33(uint64_t a1, unint64_t *a2)
{
  sub_1B117C45C(0, a2);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_1B11BAA08();
}

void OUTLINED_FUNCTION_14_3()
{
  void *v0;

}

id OUTLINED_FUNCTION_14_4()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

void OUTLINED_FUNCTION_14_6()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B11A2618(v2, v1, v0);
}

id OUTLINED_FUNCTION_14_7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_3(id a1)
{

}

id OUTLINED_FUNCTION_4_2(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_0_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

uint64_t OUTLINED_FUNCTION_0_3(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  a1[4] = a2[4];
  return sub_1B11BAA08();
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, unint64_t))((v1 & a1) + 0x128))(0, 0xE000000000000000);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1B5E17BFC](a1, v6, a5);
}

void OUTLINED_FUNCTION_94(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B117F254(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_4_4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_4_5(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t OUTLINED_FUNCTION_4_6()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x140))();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;

  v3 = *(int *)(v0 + 56);
  v4 = (_OWORD *)(v1 + v3);
  v5 = *(_OWORD *)(v2 + v3 + 16);
  *v4 = *(_OWORD *)(v2 + v3);
  v4[1] = v5;
  v6 = *(_OWORD *)(v2 + v3 + 48);
  v4[2] = *(_OWORD *)(v2 + v3 + 32);
  v4[3] = v6;
  v4[4] = *(_OWORD *)(v2 + v3 + 64);
  return type metadata accessor for SGBannerPaddingParams(0);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_2_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1096));
}

uint64_t OUTLINED_FUNCTION_2_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;

  v4 = v2 + a1;
  v5 = v3 + a1;
  v6 = *(_QWORD *)(v5 + 8);
  *(_QWORD *)v4 = *(_QWORD *)v5;
  *(_QWORD *)(v4 + 8) = v6;
  *(_WORD *)(v4 + 16) = *(_WORD *)(v5 + 16);
  v7 = (_OWORD *)(v2 + v1);
  v8 = *(_OWORD *)(v3 + v1 + 16);
  *v7 = *(_OWORD *)(v3 + v1);
  v7[1] = v8;
  v9 = *(_OWORD *)(v3 + v1 + 48);
  v7[2] = *(_OWORD *)(v3 + v1 + 32);
  v7[3] = v9;
  v7[4] = *(_OWORD *)(v3 + v1 + 64);
  type metadata accessor for SGBannerPaddingParams(0);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))((v1 & a1) + 0x158))(1);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

id OUTLINED_FUNCTION_7_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 779));
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v3 = *(int *)(a1 + 48);
  v4 = v1 + v3;
  *(_BYTE *)v4 = *(_BYTE *)(v2 + v3);
  *(_WORD *)(v4 + 1) = *(_WORD *)(v2 + v3 + 1);
  *(_OWORD *)(v4 + 8) = *(_OWORD *)(v2 + v3 + 8);
  *(_QWORD *)(v4 + 24) = *(_QWORD *)(v2 + v3 + 24);
  v5 = *(_OWORD *)(v2 + v3 + 48);
  *(_OWORD *)(v4 + 32) = *(_OWORD *)(v2 + v3 + 32);
  *(_OWORD *)(v4 + 48) = v5;
  v6 = *(_OWORD *)(v2 + v3 + 80);
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v2 + v3 + 64);
  *(_OWORD *)(v4 + 80) = v6;
  *(_QWORD *)(v4 + 96) = *(_QWORD *)(v2 + v3 + 96);
  return type metadata accessor for SGBannerIconParams(0);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x90))();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return swift_getOpaqueTypeConformance2();
}

id OUTLINED_FUNCTION_7_7()
{
  return sub_1B1176148();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_23()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_3_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v1 + a1;
  *(_BYTE *)v3 = *(_BYTE *)(v2 + a1);
  *(_BYTE *)(v3 + 1) = *(_BYTE *)(v2 + a1 + 1);
  *(_BYTE *)(v3 + 2) = *(_BYTE *)(v2 + a1 + 2);
  *(_BYTE *)(v3 + 3) = *(_BYTE *)(v2 + a1 + 3);
  *(_BYTE *)(v3 + 4) = *(_BYTE *)(v2 + a1 + 4);
  *(_BYTE *)(v3 + 5) = *(_BYTE *)(v2 + a1 + 5);
  *(_BYTE *)(v3 + 6) = *(_BYTE *)(v2 + a1 + 6);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v2 + a1 + 8);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v2 + a1 + 16);
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_3_2(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, *(_QWORD *)(v2 - 136), a1);
}

_BYTE *OUTLINED_FUNCTION_3_4(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = a2[3];
  result[4] = a2[4];
  result[5] = a2[5];
  result[6] = a2[6];
  return result;
}

id OUTLINED_FUNCTION_3_5()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_8_1(id a1)
{

}

id OUTLINED_FUNCTION_8_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 779));
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + a1;
  *(_BYTE *)v3 = *(_BYTE *)(v2 + a1);
  *(_BYTE *)(v3 + 1) = *(_BYTE *)(v2 + a1 + 1);
  *(_BYTE *)(v3 + 2) = *(_BYTE *)(v2 + a1 + 2);
  *(_BYTE *)(v3 + 3) = *(_BYTE *)(v2 + a1 + 3);
  *(_BYTE *)(v3 + 4) = *(_BYTE *)(v2 + a1 + 4);
  *(_BYTE *)(v3 + 5) = *(_BYTE *)(v2 + a1 + 5);
  *(_BYTE *)(v3 + 6) = *(_BYTE *)(v2 + a1 + 6);
  v4 = *(_QWORD *)(v2 + a1 + 16);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v2 + a1 + 8);
  *(_QWORD *)(v3 + 16) = v4;
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_11(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_8_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_8_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *(int *)(v3 + 36));
  *v4 = v1;
  v4[1] = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_8_6(__n128 *a1, __n128 a2)
{
  unint64_t v2;

  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_1B11BB44C();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_103();
  v2 = type metadata accessor for SGBannerContainerView(0);
  v3 = (*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);

  v4 = v0 + v3 + *(int *)(v2 + 20);
  swift_bridgeObjectRelease();
  v5 = OUTLINED_FUNCTION_19();
  v6 = (id *)(v4 + *(int *)(v5 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = (char *)v6 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  v9 = *(void (**)(char *, uint64_t))(v8 + 8);
  v9(v7, v1);
  swift_release();
  swift_release();
  v10 = *(int *)(v5 + 56);
  v11 = OUTLINED_FUNCTION_58();
  v9((char *)(v4 + v10 + *(int *)(v11 + 56)), v1);

  OUTLINED_FUNCTION_150();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v12 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_1(v12);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v13 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_11_1(v13);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_157();
  OUTLINED_FUNCTION_112_0();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18)
{
  uint64_t v18;

  return sub_1B1179FA4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v18 + 48, 0.0, 1, 0.0, 1, a1, a2, a15, a16, a17, a18);
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_1B11BAAD4();
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1 + *(int *)(a1 + 56), v2 + *(int *)(a1 + 56), v3);
}

id OUTLINED_FUNCTION_11_3()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_11_4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return swift_retain();
}

BOOL OUTLINED_FUNCTION_11_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x138))();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

id OUTLINED_FUNCTION_18_1()
{
  id *v0;

  return *v0;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return type metadata accessor for SGBannerContainerView(0);
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return sub_1B11BAA08();
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = v1;
  v2[4] = v3;
  return sub_1B11BB3A4();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x80))();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_1B11BB440();
}

void OUTLINED_FUNCTION_18_4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  sub_1B117F254(v2, v0, v1);
}

_BYTE *OUTLINED_FUNCTION_18_6(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  return result;
}

id OUTLINED_FUNCTION_9(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

__n128 OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __n128 result;

  *(_BYTE *)(v6 - 112) = v3;
  *(_BYTE *)(v6 - 120) = v5;
  *(_DWORD *)(v2 + 153) = *(_DWORD *)(v0 + 48);
  *(_DWORD *)(v2 + 156) = *(_DWORD *)(v0 + 51);
  *(_DWORD *)(v2 + 169) = *(_DWORD *)(v6 - 127);
  *(_DWORD *)(v2 + 172) = *(_DWORD *)(v6 - 124);
  *(_QWORD *)(v2 + 144) = v1;
  *(_BYTE *)(v2 + 152) = v3;
  *(_QWORD *)(v2 + 160) = v4;
  *(_BYTE *)(v2 + 168) = v5;
  result = *(__n128 *)(v0 + 224);
  *(__n128 *)(v2 + 176) = result;
  *(_BYTE *)(v2 + 192) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

id OUTLINED_FUNCTION_9_1(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

uint64_t OUTLINED_FUNCTION_9_2(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __n128 a16)
{
  a16 = a1;
  return sub_1B118A5E8((uint64_t)&a16);
}

void OUTLINED_FUNCTION_9_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(int *)(a1 + 48);
  v4 = v1 + v3;
  v5 = v2 + v3;
  *(_BYTE *)v4 = *(_BYTE *)(v2 + v3);
  *(_BYTE *)(v4 + 1) = *(_BYTE *)(v2 + v3 + 1);
  *(_BYTE *)(v4 + 2) = *(_BYTE *)(v2 + v3 + 2);
  *(_OWORD *)(v4 + 8) = *(_OWORD *)(v2 + v3 + 8);
  *(_QWORD *)(v4 + 24) = *(_QWORD *)(v2 + v3 + 24);
  v6 = *(void **)(v1 + v3 + 32);
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(v5 + 32);

}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return 0x7261646E656C6163;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *(_BYTE *)(v2 + 16) = *(_BYTE *)(v0 + 16);
  *(_BYTE *)(v2 + 17) = *(_BYTE *)(v0 + 17);
  v5 = *(int *)(v1 + 56);
  v6 = (_QWORD *)(v3 + v5);
  *v6 = *(_QWORD *)(v4 + v5);
  v6[1] = *(_QWORD *)(v4 + v5 + 8);
  v6[2] = *(_QWORD *)(v4 + v5 + 16);
  v6[3] = *(_QWORD *)(v4 + v5 + 24);
  v6[4] = *(_QWORD *)(v4 + v5 + 32);
  v6[5] = *(_QWORD *)(v4 + v5 + 40);
  v6[6] = *(_QWORD *)(v4 + v5 + 48);
  v6[7] = *(_QWORD *)(v4 + v5 + 56);
  v6[8] = *(_QWORD *)(v4 + v5 + 64);
  v6[9] = *(_QWORD *)(v4 + v5 + 72);
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_beginAccess();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E17C50]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_unknownObjectRetain();
}

id OUTLINED_FUNCTION_21_1()
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

  v3 = v2[6];
  v4 = v2[7];
  v5 = *(void **)(v1 + v3);
  *(_QWORD *)(v0 + v3) = v5;
  v6 = (_QWORD *)(v0 + v4);
  v7 = (_QWORD *)(v1 + v4);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  *(_BYTE *)(v0 + v2[8]) = *(_BYTE *)(v1 + v2[8]);
  return v5;
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return sub_1B11BA9F0();
}

uint64_t OUTLINED_FUNCTION_21_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x90))();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_13(uint64_t a1)
{
  uint64_t *v1;

  sub_1B119CA7C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return sub_1B11BAE88();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x120))();
}

void OUTLINED_FUNCTION_24_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + *(int *)(v2 + 44)) = *(_BYTE *)(v1 + *(int *)(v2 + 44));
}

id OUTLINED_FUNCTION_24_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 3400));
}

void OUTLINED_FUNCTION_24_3()
{
  void *v0;

}

id OUTLINED_FUNCTION_24_4(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v2, v4);
}

uint64_t OUTLINED_FUNCTION_24_5(uint64_t result, uint64_t a2)
{
  *(_DWORD *)result = *(_DWORD *)a2;
  *(_BYTE *)(result + 4) = *(_BYTE *)(a2 + 4);
  *(_WORD *)(result + 5) = *(_WORD *)(a2 + 5);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void OUTLINED_FUNCTION_17_2(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_58()
{
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return sub_1B11BA978();
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return sub_1B11BB440();
}

void OUTLINED_FUNCTION_17_6(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_17_7(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(a1 + 8) = v1;
  *(_QWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_17_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x78))();
}

uint64_t OUTLINED_FUNCTION_17_9()
{
  return type metadata accessor for SGBannerContent();
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return type metadata accessor for SGBannerViewModel(0);
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_retain();
}

BOOL OUTLINED_FUNCTION_10_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_10_2(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 328));
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_1B11BB398();
}

void OUTLINED_FUNCTION_10_4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + *(int *)(v1 + 36)) = 0x3FF0000000000000;
  sub_1B119CA7C(v2, v0);
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_1B11BAAD4();
}

uint64_t OUTLINED_FUNCTION_10_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x120))();
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_1B11BB4B8();
}

void OUTLINED_FUNCTION_13_4(uint64_t a1, SEL *a2)
{
  void *v2;

  sub_1B119C9E8(v2, a2);
}

void OUTLINED_FUNCTION_13_5()
{
  sub_1B1183258();
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x1F8))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id OUTLINED_FUNCTION_51(void **a1, void **a2)
{
  void *v2;

  v2 = *a2;
  *a1 = *a2;
  return v2;
}

id OUTLINED_FUNCTION_51_0()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return swift_retain();
}

id OUTLINED_FUNCTION_51_2()
{
  return sub_1B1175A30(0xD000000000000021);
}

uint64_t OUTLINED_FUNCTION_51_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_53(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v4 & 1;
  *(_QWORD *)(v1 + 24) = v5;
  *(_QWORD *)(v1 + 32) = result;
  *(_QWORD *)(v1 + 40) = 1;
  *(_BYTE *)(v1 + 48) = 0;
  return result;
}

void OUTLINED_FUNCTION_53_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_53_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 72) = v2;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_143(id a1)
{

}

void OUTLINED_FUNCTION_55(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_55_0@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  return SGBannerContainerView.init(_:store:updateBannerView:)(v1, 0, a1);
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return sub_1B11BB3A4();
}

uint64_t OUTLINED_FUNCTION_55_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  *(_QWORD *)(v18 + *(int *)(v20 + 60)) = *(_QWORD *)(v19 + *(int *)(v20 + 60));
  *(_BYTE *)(v18 + *(int *)(v20 + 64)) = *(_BYTE *)(v19 + *(int *)(v20 + 64));
  result = a18;
  *(_BYTE *)(a18 + *(int *)(a17 + 28)) = *(_BYTE *)(a16 + *(int *)(a17 + 28));
  return result;
}

uint64_t OUTLINED_FUNCTION_55_3(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return type metadata accessor for SGBannerIconParams(0);
}

uint64_t OUTLINED_FUNCTION_188()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_57_1()
{
  return sub_1B11BB398();
}

uint64_t OUTLINED_FUNCTION_57_2(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_57_3()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B1188514(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_57_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  return v11(a10, a9, v10);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_115@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = a1[1];
  *v1 = *a1;
  v1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_115_0(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_115_1()
{
  uint64_t (*v0)(void);

  return v0();
}

void OUTLINED_FUNCTION_116(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B117F254(a1, a2, v2);
}

void OUTLINED_FUNCTION_116_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_61@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_63_0()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 779));
}

id OUTLINED_FUNCTION_63_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v0 + 40) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_63_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_1B11BB56C();
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_39_2()
{
  JUMPOUT(0x1B5E17D58);
}

id OUTLINED_FUNCTION_39_3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  char v9;

  return objc_msgSendSuper2(&a9, a2, v9 & 1);
}

uint64_t OUTLINED_FUNCTION_39_4()
{
  return sub_1B11BAE88();
}

uint64_t OUTLINED_FUNCTION_39_5()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_1B11BA99C();
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_138()
{
  return sub_1B11BAE88();
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return sub_1B11BA954();
}

id OUTLINED_FUNCTION_27_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_1B11995A8(v0, v2, 2, (_QWORD *)(v3 - 144), v1);
}

void OUTLINED_FUNCTION_27_4()
{
  JUMPOUT(0x1B5E17C68);
}

unint64_t OUTLINED_FUNCTION_27_5()
{
  return sub_1B11A94CC();
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x2D0))();
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_12(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, a2, 0, v3, 0, v4);
}

void OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  uint64_t *v1;

  sub_1B117F494(a1, v1);
}

void OUTLINED_FUNCTION_16_1(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x120))();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(int *)(v0 + 64);
  *(_QWORD *)(v2 + *(int *)(v0 + 60)) = *(_QWORD *)(v1 + *(int *)(v0 + 60));
  *(_BYTE *)(v2 + v3) = *(_BYTE *)(v1 + v3);
  return v2;
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return 0x2E2E2E646461;
}

__n128 OUTLINED_FUNCTION_76()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = v0 + *(int *)(v1 + 36);
  v4 = *(_OWORD *)(v2 - 96);
  *(_OWORD *)v3 = *(_OWORD *)(v2 - 112);
  *(_OWORD *)(v3 + 16) = v4;
  result = *(__n128 *)(v2 - 80);
  *(__n128 *)(v3 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return sub_1B11BAA98();
}

void OUTLINED_FUNCTION_16_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_1B11BAB88();
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_1B1176E24();
}

void OUTLINED_FUNCTION_16_6()
{
  void *v0;

}

id OUTLINED_FUNCTION_16_7()
{
  return SGBannerContent.__allocating_init()();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_20_1()
{
  void **v0;
  void *v1;

  v1 = *v0;
  *v0 = 0;

}

void *OUTLINED_FUNCTION_20_2()
{
  void *v0;
  const void *v1;
  uint64_t v2;

  return memcpy(v0, v1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
}

void OUTLINED_FUNCTION_20_3()
{
  JUMPOUT(0x1B5E17608);
}

void OUTLINED_FUNCTION_20_4(uint64_t a1)
{
  uint64_t *v1;

  sub_1B119CA7C(a1, v1);
}

void OUTLINED_FUNCTION_20_5()
{
  JUMPOUT(0x1B5E17224);
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x90))();
}

void OUTLINED_FUNCTION_15_1(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_1B11BAD74();
}

uint64_t OUTLINED_FUNCTION_15_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 a10)
{
  uint64_t v10;

  *(_QWORD *)(v10 + 64) = a1;
  *(_OWORD *)(v10 + 32) = a10;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + *(int *)(v3 + 60)) = *(_QWORD *)(v5 + *(int *)(v3 + 60));
  *(_BYTE *)(v4 + *(int *)(v3 + 64)) = *(_BYTE *)(v5 + *(int *)(v3 + 64));
  *(_BYTE *)(v0 + *(int *)(v2 + 28)) = *(_BYTE *)(v1 + *(int *)(v2 + 28));
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x90))();
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  return sub_1B11BADB0();
}

id OUTLINED_FUNCTION_15_7(id a1, SEL a2, uint64_t a3)
{
  return objc_msgSend(a1, a2, a3, 1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return sub_1B11BAB34();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return swift_getEnumCaseMultiPayload();
}

id OUTLINED_FUNCTION_59_0(uint64_t a1)
{
  return sub_1B1175A30(a1);
}

uint64_t OUTLINED_FUNCTION_200(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)v4 = result;
  *(_QWORD *)(v4 + 8) = a2;
  *(_BYTE *)(v4 + 16) = a3 & 1;
  *(_QWORD *)(v4 + 24) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_34_3()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1B119CA7C(v1, v0);
}

double OUTLINED_FUNCTION_34_4(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 24);
  *(double *)(a1 + 24) = result;
  return result;
}

void *OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char aBlock, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  a11 = v12;
  a12 = a1;
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_40_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x198))();
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16)
{
  a16 = a10;
  return sub_1B118A5E8((uint64_t)&a16);
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  uint64_t v0;

  sub_1B119F25C(v0);
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return sub_1B11BAABC();
}

BOOL OUTLINED_FUNCTION_40_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

char *OUTLINED_FUNCTION_25_0(char *a1, int64_t a2)
{
  char *v2;

  return sub_1B11770A4(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return sub_1B11BAABC();
}

void OUTLINED_FUNCTION_25_2()
{
  void *v0;
  void **v1;
  void *v2;

  v2 = *v1;
  *v1 = v0;

}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return sub_1B11BB4E8();
}

id OUTLINED_FUNCTION_25_4()
{
  return sub_1B1175A30(0xD00000000000002ALL);
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + *(int *)(v1 + 60)) = *(_QWORD *)(v3 + *(int *)(v1 + 60));
  *(_BYTE *)(v2 + *(int *)(v1 + 64)) = *(_BYTE *)(v3 + *(int *)(v1 + 64));
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_1B11BAB94();
}

void OUTLINED_FUNCTION_19_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_26_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_26_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x1F8))();
}

uint64_t OUTLINED_FUNCTION_101(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v3;

  return sub_1B11A5AD4(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_101_1()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return swift_retain();
}

void OUTLINED_FUNCTION_101_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_103_1()
{
  return swift_getEnumCaseMultiPayload();
}

void *OUTLINED_FUNCTION_103_2()
{
  return malloc(0x40uLL);
}

uint64_t OUTLINED_FUNCTION_72(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return sub_1B11BAE88();
}

void OUTLINED_FUNCTION_72_1(uint64_t a1)
{
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_72_2()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_72_3()
{
  sub_1B11A1E70();
  sub_1B11A1FB4();
}

id OUTLINED_FUNCTION_42_1(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_42_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a4);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_1B11BB56C();
}

id OUTLINED_FUNCTION_42_3()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_42_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_42_5()
{
  void *v0;

}

void OUTLINED_FUNCTION_46()
{
  _BYTE *v0;
  _BYTE *v1;

  v0[16] = v1[16];
  v0[17] = v1[17];
  v0[18] = v1[18];
}

uint64_t OUTLINED_FUNCTION_100(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_1B11BB494();
}

uint64_t OUTLINED_FUNCTION_248(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_46_3()
{
  uint64_t (*v0)(void);

  return v0();
}

void OUTLINED_FUNCTION_46_4()
{
  JUMPOUT(0x1B5E17608);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_109_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void OUTLINED_FUNCTION_109_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_DWORD *)v1 = *(_DWORD *)v0;
  *(_BYTE *)(v1 + 4) = *(_BYTE *)(v0 + 4);
  *(_WORD *)(v1 + 5) = *(_WORD *)(v0 + 5);
}

uint64_t OUTLINED_FUNCTION_132()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_132_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_86()
{
  sub_1B1183290();
}

void OUTLINED_FUNCTION_117()
{
  JUMPOUT(0x1B5E17C68);
}

uint64_t OUTLINED_FUNCTION_117_1(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 56);
}

id OUTLINED_FUNCTION_117_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3912));
}

void OUTLINED_FUNCTION_49_1(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  sub_1B119EC40((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_49_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return sub_1B11BB3C8();
}

uint64_t OUTLINED_FUNCTION_49_4()
{
  return sub_1B11BAE88();
}

uint64_t OUTLINED_FUNCTION_49_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  return type metadata accessor for SGWalletPassSuggestion();
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

void OUTLINED_FUNCTION_98(void **a1, void **a2)
{
  void *v2;

  v2 = *a1;
  *a1 = *a2;

}

void OUTLINED_FUNCTION_98_0()
{
  JUMPOUT(0x1B5E17C68);
}

void OUTLINED_FUNCTION_98_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 144) = v0;
}

uint64_t OUTLINED_FUNCTION_112()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_112_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  return sub_1B11BB56C();
}

uint64_t OUTLINED_FUNCTION_114_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_22_5(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B11A6CBC(a1, a2, v2);
}

__n128 OUTLINED_FUNCTION_22_6()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  uint64_t v3;

  *(_BYTE *)v0 = *(_BYTE *)v1;
  *(_WORD *)(v0 + 1) = *(_WORD *)(v1 + 1);
  result = *(__n128 *)(v1 + 8);
  *(__n128 *)(v0 + 8) = result;
  v3 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v0 + 32) = v3;
  return result;
}

id OUTLINED_FUNCTION_22_7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 332), v1);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_1B11BAD14();
}

void OUTLINED_FUNCTION_58_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_225()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_230()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

id OUTLINED_FUNCTION_35_1(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3912));
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_1B11BB398();
}

uint64_t OUTLINED_FUNCTION_35_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1 + *(int *)(a1 + 56), v3 + *(int *)(a1 + 56), v2);
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_35_4()
{
  return sub_1B11BA8F4();
}

unint64_t OUTLINED_FUNCTION_35_5()
{
  return 0xD000000000000025;
}

uint64_t OUTLINED_FUNCTION_35_6(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

_QWORD *OUTLINED_FUNCTION_120_0(_QWORD *result, int a2)
{
  *result = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return swift_retain();
}

id OUTLINED_FUNCTION_60_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 80);
  *(_QWORD *)(v0 + 80) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_60_4()
{
  uint64_t v0;

  return v0;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
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

void __swift_store_extra_inhabitant_indexTm()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_152();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_19();
    v5 = OUTLINED_FUNCTION_109_0(*(int *)(v4 + 20));
    OUTLINED_FUNCTION_50(v5, v6, v7, v8);
  }
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

uint64_t OUTLINED_FUNCTION_38_2()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_38_4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_38_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

void OUTLINED_FUNCTION_95(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B117F254(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_95_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x1F8))();
}

uint64_t OUTLINED_FUNCTION_131_0()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_131_1(uint64_t a1)
{
  uint64_t *v1;

  sub_1B1193558(a1, v1);
}

id OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 3272));
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(v0 + 52)) = *(_QWORD *)(v2 + *(int *)(v0 + 52));
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_29_3()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_29_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *(int *)(v1 + 36));
  *v6 = v4;
  v6[1] = v0;
  sub_1B119CA7C(v2, v5);
}

__n128 OUTLINED_FUNCTION_29_5(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

void OUTLINED_FUNCTION_66()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 80);
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v1 + 80);

}

unint64_t OUTLINED_FUNCTION_66_0()
{
  return sub_1B119A494();
}

_BYTE *OUTLINED_FUNCTION_66_1(_BYTE *result, char a2)
{
  *result = a2 + 1;
  return result;
}

double OUTLINED_FUNCTION_66_2(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 64) = *a1;
  return result;
}

void OUTLINED_FUNCTION_44_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188820(a1, a2, v2);
}

void OUTLINED_FUNCTION_44_1(uint64_t a1@<X8>)
{
  char v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = 0;
  sub_1B1193558(v3, v2);
}

id OUTLINED_FUNCTION_44_2()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_44_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

id OUTLINED_FUNCTION_44_5()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_50_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_1B1186804(a1, a2, v2);
}

id OUTLINED_FUNCTION_50_1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_50_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_50_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return sub_1B11BAA8C();
}

uint64_t OUTLINED_FUNCTION_50_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_50_6()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *(_BYTE *)(v0 + 16);
  *(_BYTE *)(v1 + 17) = *(_BYTE *)(v0 + 17);
  return v1;
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_getEnumCaseMultiPayload();
}

void OUTLINED_FUNCTION_184_0()
{
  JUMPOUT(0x1B5E17C68);
}

uint64_t OUTLINED_FUNCTION_54_1()
{
  return sub_1B11BB428();
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v0 + 56) = v2;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_54_4()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_133(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_1B117F224(v3 + 360, v3 + 512, a3);
}

uint64_t OUTLINED_FUNCTION_133_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_75(uint64_t a1)
{
  uint64_t *v1;

  sub_1B117F494(a1, v1);
}

uint64_t OUTLINED_FUNCTION_122_0@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

void OUTLINED_FUNCTION_71()
{
  JUMPOUT(0x1B5E17C68);
}

uint64_t OUTLINED_FUNCTION_94_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_94_1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v4, v2);
}

uint64_t OUTLINED_FUNCTION_97@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_97_0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + *(int *)(result + 48)) = *(_BYTE *)(v2 + *(int *)(result + 48));
  return result;
}

uint64_t OUTLINED_FUNCTION_97_1()
{
  return sub_1B1197B00();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_64_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_64_2(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 1) = result;
  return result;
}

double OUTLINED_FUNCTION_64_3(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 40) = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_73(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, a4);
}

uint64_t OUTLINED_FUNCTION_73_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_73_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(v0 + 17) = *(_BYTE *)(v1 + 17);
}

void OUTLINED_FUNCTION_73_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_1B117F254(v3, v4, a3);
}

void OUTLINED_FUNCTION_59_1()
{
  sub_1B118228C();
}

id OUTLINED_FUNCTION_59_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 88);
  *(_QWORD *)(v0 + 88) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_59_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_59_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = *(_QWORD *)(v0 + 8);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_65_1()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_65_2(uint64_t a1)
{
  uint64_t *v1;

  sub_1B119CA7C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_65_3()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_65_4(double *a1)
{
  uint64_t v1;
  _QWORD *v2;
  double result;

  result = *a1;
  *(double *)(v1 + 16) = *a1;
  *(_QWORD *)(v1 + 32) = *v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_75_1()
{
  return sub_1B11BAAA4();
}

uint64_t OUTLINED_FUNCTION_130_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

__n128 OUTLINED_FUNCTION_130_1()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;

  *(_BYTE *)v1 = *(_BYTE *)v0;
  *(_WORD *)(v1 + 1) = *(_WORD *)(v0 + 1);
  result = *(__n128 *)(v0 + 8);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_130_2@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_125(uint64_t a1)
{
  uint64_t *v1;

  sub_1B117F494(a1, v1);
}

uint64_t OUTLINED_FUNCTION_106_1()
{
  return sub_1B11BAB34();
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_1B11BAABC();
}

void OUTLINED_FUNCTION_68_2()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v2 + *(int *)(v1 + 36)) = v0;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E17C5C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_185()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 72) = *(_QWORD *)(v1 + 72);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return type metadata accessor for SGSuggestionsTableView(0);
}

void *OUTLINED_FUNCTION_36_3@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_33_1@<X0>(uint64_t (*a1)(void)@<X8>)
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_1B11BAB34();
}

uint64_t OUTLINED_FUNCTION_33_3()
{
  return sub_1B11BA8E8();
}

uint64_t OUTLINED_FUNCTION_33_5()
{
  return 0;
}

id OUTLINED_FUNCTION_33_6()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_123@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x180))();
}

uint64_t OUTLINED_FUNCTION_123_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_123_1()
{
  return type metadata accessor for PrimaryActionButtonView(0);
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_83_0@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t OUTLINED_FUNCTION_83_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  v3 = result + a3;
  *(_DWORD *)v3 = *(_DWORD *)(a2 + a3);
  *(_BYTE *)(v3 + 4) = *(_BYTE *)(a2 + a3 + 4);
  *(_WORD *)(v3 + 5) = *(_WORD *)(a2 + a3 + 5);
  return result;
}

id OUTLINED_FUNCTION_113_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_113_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_113_2()
{
  return sub_1B11BB398();
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_67()
{
  JUMPOUT(0x1B5E17C68);
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_47_3()
{
  JUMPOUT(0x1B5E17608);
}

uint64_t OUTLINED_FUNCTION_47_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *v1 = v2;
  v1[1] = v0;
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_28_3()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_99()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_1B117CED4(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_99_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void *OUTLINED_FUNCTION_31_1()
{
  uint64_t v0;
  void *v1;

  return memcpy(v1, (const void *)(v0 + 240), 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_1B11BB4AC();
}

uint64_t OUTLINED_FUNCTION_31_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 24))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_31_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x98))();
}

void OUTLINED_FUNCTION_31_5()
{
  void *v0;

}

void OUTLINED_FUNCTION_31_6(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B11A2618(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_31_8@<X0>(uint64_t (*a1)(void)@<X8>)
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return type metadata accessor for BannerUpdateViewModel(0);
}

void OUTLINED_FUNCTION_87_0(uint64_t a1)
{
  uint64_t *v1;

  sub_1B1193558(a1, v1);
}

void OUTLINED_FUNCTION_129(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_1B117F254(v4, v3, a3);
}

id OUTLINED_FUNCTION_129_1(void *a1)
{
  return objc_msgSend(a1, sel_respondsToSelector_);
}

void OUTLINED_FUNCTION_37_0()
{
  JUMPOUT(0x1B5E17608);
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_127_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_37_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x80))();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v1 + 56);
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_37_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

uint64_t OUTLINED_FUNCTION_37_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)v1 = *(_DWORD *)v0;
  *(_BYTE *)(v1 + 4) = *(_BYTE *)(v0 + 4);
  *(_WORD *)(v1 + 5) = *(_WORD *)(v0 + 5);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 8) = *(_QWORD *)(v0 + 8);
  *(_QWORD *)(v1 + 16) = v2;
  return 0;
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_1B11BA918();
}

void OUTLINED_FUNCTION_48_1(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
}

void OUTLINED_FUNCTION_48_2()
{
  void *v0;

}

void OUTLINED_FUNCTION_48_3()
{
  JUMPOUT(0x1B5E17224);
}

id OUTLINED_FUNCTION_48_4()
{
  uint64_t v0;

  return sub_1B11A8860(v0);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_67_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_67_3()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_70_1(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

uint64_t OUTLINED_FUNCTION_70_2()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_70_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void *OUTLINED_FUNCTION_79()
{
  void *v0;
  const void *v1;
  uint64_t v2;

  return memcpy(v0, v1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_90_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_90_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_81_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(int *)(v0 + 28);
  *(_QWORD *)(v2 + *(int *)(v0 + 24)) = *(_QWORD *)(v1 + *(int *)(v0 + 24));
  *(_BYTE *)(v2 + v3) = *(_BYTE *)(v1 + v3);
}

id OUTLINED_FUNCTION_81_1(void **a1, void **a2)
{
  void *v2;

  v2 = *a2;
  *a1 = *a2;
  return v2;
}

id OUTLINED_FUNCTION_81_2()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return swift_retain();
}

void OUTLINED_FUNCTION_61_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v1 + 88);

}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_80_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  v3 = result + a3;
  *(_DWORD *)v3 = *(_DWORD *)(a2 + a3);
  *(_BYTE *)(v3 + 4) = *(_BYTE *)(a2 + a3 + 4);
  *(_WORD *)(v3 + 5) = *(_WORD *)(a2 + a3 + 5);
  return result;
}

id OUTLINED_FUNCTION_80_1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  return objc_msgSend(v4, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_release();
}

void OUTLINED_FUNCTION_91_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(v0 + 60)) = *(_QWORD *)(v2 + *(int *)(v0 + 60));
  *(_BYTE *)(v1 + *(int *)(v0 + 64)) = *(_BYTE *)(v2 + *(int *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  return swift_storeEnumTagMultiPayload();
}

void OUTLINED_FUNCTION_85_0(id *a1)
{

}

__n128 OUTLINED_FUNCTION_85_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v3 = *(int *)(a1 + 48);
  v4 = v2 + v3;
  *(_BYTE *)v4 = *(_BYTE *)(v1 + v3);
  *(_WORD *)(v4 + 1) = *(_WORD *)(v1 + v3 + 1);
  result = *(__n128 *)(v1 + v3 + 8);
  *(__n128 *)(v4 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_118()
{
  return swift_getEnumCaseMultiPayload();
}

id OUTLINED_FUNCTION_118_1(void *a1)
{
  return objc_msgSend(a1, sel_respondsToSelector_);
}

uint64_t OUTLINED_FUNCTION_92@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

unint64_t OUTLINED_FUNCTION_92_0()
{
  return sub_1B11881B4();
}

uint64_t OUTLINED_FUNCTION_92_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v0, v2);
}

void OUTLINED_FUNCTION_74(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B117F224(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_102_1()
{
  return swift_release();
}

void OUTLINED_FUNCTION_93()
{
  _QWORD *v0;

  v0[12] = 0;
  v0[5] = 0;
  v0[6] = 0;
}

void OUTLINED_FUNCTION_93_0(void **a1, void **a2)
{
  void *v2;

  v2 = *a1;
  *a1 = *a2;

}

void OUTLINED_FUNCTION_128(uint64_t a1)
{
  uint64_t *v1;

  sub_1B117F494(a1, v1);
}

uint64_t OUTLINED_FUNCTION_128_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_128_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  return a14;
}

id OUTLINED_FUNCTION_128_2()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3912));
}

uint64_t OUTLINED_FUNCTION_108()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_108_0(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 8) = 256;
}

id OUTLINED_FUNCTION_108_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  return a13;
}

id OUTLINED_FUNCTION_108_2(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;

  return objc_msgSend(v3, a2, a3, 0);
}

uint64_t OUTLINED_FUNCTION_124@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x210))();
}

uint64_t OUTLINED_FUNCTION_139()
{
  return type metadata accessor for SGSuggestionStoreWrapper(0);
}

uint64_t OUTLINED_FUNCTION_124_0()
{
  return type metadata accessor for SGBannerContainerView(0);
}

uint64_t OUTLINED_FUNCTION_124_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_100_0@<X0>(uint64_t (*a1)(void)@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return a1();
}

void *OUTLINED_FUNCTION_100_1(uint64_t a1)
{
  size_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  return malloc(v1);
}

void OUTLINED_FUNCTION_52_0(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_1B117F1FC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return sub_1B11BB398();
}

id OUTLINED_FUNCTION_52_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B1175A30(*(_QWORD *)(v1 + a1));
}

void *OUTLINED_FUNCTION_52_4(_QWORD *a1)
{
  _QWORD *v1;

  *v1 = *a1;
  v1[9] = 0;
  return sub_1B11755D8();
}

void OUTLINED_FUNCTION_45_1()
{
  sub_1B118228C();
}

void OUTLINED_FUNCTION_45_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v1 = *(_QWORD *)a1;
  *(_QWORD *)(v1 + 8) = v2;
  *(_WORD *)(v1 + 16) = *(_WORD *)(a1 + 16);
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return type metadata accessor for SGWalletOrderSuggestion();
}

uint64_t OUTLINED_FUNCTION_45_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_WORD *)(v2 + 16) = *(_WORD *)(a2 + 16);
  return swift_retain();
}

id OUTLINED_FUNCTION_45_5()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_45_6()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B11A6CBC(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_32_2()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 3272));
}

uint64_t OUTLINED_FUNCTION_32_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + a1) = *(_BYTE *)(v2 + a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_32_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xC8))();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  _QWORD *v0;
  _QWORD *v1;

  return (*(uint64_t (**)(void))((*v1 & *v0) + 0x198))();
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return swift_unknownObjectRetain();
}

id OUTLINED_FUNCTION_56_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_201()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return sub_1B11BAEDC();
}

id OUTLINED_FUNCTION_19_3()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 3912));
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_19_6()
{
  return sub_1B11BB398();
}

uint64_t OUTLINED_FUNCTION_19_7()
{
  return sub_1B11BB4E8();
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  return sub_1B11BB4E8();
}

void OUTLINED_FUNCTION_105(uint64_t a1)
{
  uint64_t *v1;

  sub_1B117F494(a1, v1);
}

uint64_t OUTLINED_FUNCTION_105_0()
{
  return sub_1B11BAE88();
}

void OUTLINED_FUNCTION_43_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_43_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  return sub_1B11BA918();
}

void OUTLINED_FUNCTION_43_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_43_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  sub_1B11A6CBC(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_43_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_134()
{
  return sub_1B11BB02C();
}

void OUTLINED_FUNCTION_134_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + *(int *)(v2 + 60)) = *(_QWORD *)(v1 + *(int *)(v2 + 60));
}

void OUTLINED_FUNCTION_139_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188820(a1, a2, v2);
}

void *OUTLINED_FUNCTION_88()
{
  uint64_t v0;

  return memcpy((void *)(v0 + 240), (const void *)(v0 + 48), 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_88_0()
{
  return type metadata accessor for BannerViewBackgroundModifier(0);
}

uint64_t OUTLINED_FUNCTION_88_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_135_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

void *OUTLINED_FUNCTION_135_1()
{
  const void *v0;
  void *v1;
  uint64_t v2;

  return memcpy(v1, v0, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
}

unint64_t OUTLINED_FUNCTION_121_0()
{
  return sub_1B11933FC();
}

uint64_t OUTLINED_FUNCTION_121_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return 0;
}

id OUTLINED_FUNCTION_62_1()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3272));
}

void OUTLINED_FUNCTION_62_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 40);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 40);

}

void OUTLINED_FUNCTION_62_3(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_1B117F254(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_62_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

id OUTLINED_FUNCTION_62_5()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3784));
}

void __swift_get_extra_inhabitant_indexTm()
{
  unint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_118_0();
  if (v2)
  {
    OUTLINED_FUNCTION_122_0(*v0);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_19();
    v4 = OUTLINED_FUNCTION_211(*(int *)(v3 + 20));
    OUTLINED_FUNCTION_49(v4, v5, v6);
  }
}

uint64_t OUTLINED_FUNCTION_84_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_119(uint64_t result, int a2)
{
  *(_QWORD *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_119_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_119_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_104()
{
  return type metadata accessor for SGSuggestionsTableCell(0);
}

uint64_t OUTLINED_FUNCTION_104_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_104_1(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + a1) = *(_QWORD *)(v2 + a1);
}

void *OUTLINED_FUNCTION_104_2()
{
  return malloc(0x38uLL);
}

uint64_t OUTLINED_FUNCTION_126()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_89_1()
{
  return type metadata accessor for SectionHeadersUpdateModel(0);
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_82_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_107(uint64_t result, uint64_t a2)
{
  *(_WORD *)(result + 16) = *(_WORD *)(a2 + 16);
  *(_BYTE *)(result + 18) = *(_BYTE *)(a2 + 18);
  return result;
}

void OUTLINED_FUNCTION_107_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_1B1188514(a1, v3, a3);
}

void OUTLINED_FUNCTION_107_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(v0 + 60)) = *(_QWORD *)(v2 + *(int *)(v0 + 60));
  *(_BYTE *)(v1 + *(int *)(v0 + 64)) = *(_BYTE *)(v2 + *(int *)(v0 + 64));
}

_QWORD *OUTLINED_FUNCTION_111(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_111_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_111_1()
{
  _BYTE *v0;
  _BYTE *v1;

  v1[8] = v0[8];
  v1[9] = v0[9];
  v1[10] = v0[10];
}

void OUTLINED_FUNCTION_122_1(uint64_t a1)
{
  uint64_t *v1;

  sub_1B1193558(a1, v1);
}

void OUTLINED_FUNCTION_122_2()
{
  void *v0;

}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

void *sub_1B117556C()
{
  return &unk_1B11BD3C0;
}

void *sub_1B1175578()
{
  return &unk_1B11BD3C8;
}

void *sub_1B1175584()
{
  return &unk_1B11BD3D0;
}

void *sub_1B1175590()
{
  return &unk_1B11BD3D8;
}

void *sub_1B117559C()
{
  return &unk_1B11BD3E0;
}

void *sub_1B11755A8()
{
  return &unk_1B11BD3E8;
}

void *sub_1B11755B4()
{
  return &unk_1B11BD3F0;
}

void *sub_1B11755C0()
{
  return &unk_1B11BD3F8;
}

void *sub_1B11755CC()
{
  return &unk_1B11BD400;
}

void *sub_1B11755D8()
{
  return &unk_1B11BD408;
}

void *sub_1B11755E4()
{
  return &unk_1B11BD410;
}

void *sub_1B11755F0()
{
  return &unk_1B11BD418;
}

void *sub_1B11755FC()
{
  return &unk_1B11BD420;
}

void *sub_1B1175608()
{
  return &unk_1B11BD428;
}

void *sub_1B1175614()
{
  return &unk_1B11BD430;
}

void *sub_1B1175620()
{
  return &unk_1B11BD438;
}

void *sub_1B117562C()
{
  return &unk_1B11BD440;
}

void *sub_1B1175638()
{
  return &unk_1B11BD448;
}

void *sub_1B1175644()
{
  return &unk_1B11BD450;
}

void *sub_1B1175650()
{
  return &unk_1B11BD458;
}

void *sub_1B117565C()
{
  return &unk_1B11BD460;
}

void *sub_1B1175668()
{
  return &unk_1B11BD468;
}

void *sub_1B1175674()
{
  return &unk_1B11BD470;
}

void *sub_1B1175680()
{
  return &unk_1B11BD478;
}

void *sub_1B117568C()
{
  return &unk_1B11BD480;
}

void *sub_1B1175698()
{
  return &unk_1B11BD488;
}

void *sub_1B11756A4()
{
  return &unk_1B11BD498;
}

void *sub_1B11756B0()
{
  return &unk_1B11BD4A0;
}

void *sub_1B11756BC()
{
  return &unk_1B11BD4B0;
}

void *sub_1B11756C8()
{
  return &unk_1B11BD4B8;
}

void *sub_1B11756D4()
{
  return &unk_1B11BD4C0;
}

void *sub_1B11756E0()
{
  return &unk_1B11BD4C8;
}

void *sub_1B11756EC()
{
  return &unk_1B11BD4D0;
}

void *sub_1B11756F8()
{
  return &unk_1B11BD4D8;
}

void *sub_1B1175704()
{
  return &unk_1B11BD4E0;
}

void *sub_1B1175710()
{
  return &unk_1B11BD4E8;
}

void *sub_1B117571C()
{
  return &unk_1B11BD4F0;
}

void *sub_1B1175728()
{
  return &unk_1B11BD500;
}

void *sub_1B1175734()
{
  return &unk_1B11BD508;
}

void *sub_1B1175740()
{
  return &unk_1B11BD510;
}

void *sub_1B117574C()
{
  return &unk_1B11BD518;
}

void *sub_1B1175758()
{
  return &unk_1B11BD520;
}

void *sub_1B1175764()
{
  return &unk_1B11BD528;
}

void *sub_1B1175770()
{
  return &unk_1B11BD530;
}

void *sub_1B117577C()
{
  return &unk_1B11BD538;
}

void *sub_1B1175788()
{
  return &unk_1B11BD540;
}

void *sub_1B1175794()
{
  return &unk_1B11BD548;
}

void *sub_1B11757A0()
{
  return &unk_1B11BD550;
}

void *sub_1B11757AC()
{
  return &unk_1B11BD558;
}

void *sub_1B11757B8()
{
  return &unk_1B11BD560;
}

void *sub_1B11757C4()
{
  return &unk_1B11BD568;
}

void *sub_1B11757D0()
{
  return &unk_1B11BD570;
}

void *sub_1B11757DC()
{
  return &unk_1B11BD578;
}

void *sub_1B11757E8()
{
  return &unk_1B11BD580;
}

void *sub_1B11757F4()
{
  return &unk_1B11BD588;
}

void sub_1B1175800()
{
  qword_1EEF13878 = 0;
}

uint64_t *sub_1B117580C()
{
  if (qword_1EEF12650 != -1)
    swift_once();
  return &qword_1EEF13878;
}

void *sub_1B117584C()
{
  return &unk_1B11BD590;
}

void *sub_1B1175858()
{
  return &unk_1B11BD5A0;
}

void *sub_1B1175864()
{
  return &unk_1B11BD5A8;
}

void *sub_1B1175870()
{
  return &unk_1E62D47A0;
}

void *sub_1B117587C()
{
  return &unk_1E62D47B0;
}

void *sub_1B1175888()
{
  return &unk_1E62D47C0;
}

void *sub_1B1175894()
{
  return &unk_1E62D47D0;
}

void *sub_1B11758A0()
{
  return &unk_1E62D47E0;
}

void *sub_1B11758AC()
{
  return &unk_1E62D47F0;
}

void *sub_1B11758B8()
{
  return &unk_1E62D4800;
}

void *sub_1B11758C4()
{
  return &unk_1E62D4810;
}

void *sub_1B11758D0()
{
  return &unk_1E62D4820;
}

void *sub_1B11758DC()
{
  return &unk_1E62D4830;
}

const char *sub_1B11758E8()
{
  return "suggestions";
}

unint64_t sub_1B11758F4(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

uint64_t sub_1B1175904(uint64_t result)
{
  return result;
}

BOOL sub_1B117590C(char *a1, char *a2)
{
  return sub_1B1175918(*a1, *a2);
}

BOOL sub_1B1175918(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1B1175928()
{
  return sub_1B1175930();
}

uint64_t sub_1B1175930()
{
  sub_1B11BB5A8();
  sub_1B11BB5B4();
  return sub_1B11BB5C0();
}

uint64_t sub_1B1175974()
{
  return sub_1B117597C();
}

uint64_t sub_1B117597C()
{
  return sub_1B11BB5B4();
}

uint64_t sub_1B11759A0()
{
  return sub_1B11759A8();
}

uint64_t sub_1B11759A8()
{
  sub_1B11BB5A8();
  sub_1B11BB5B4();
  return sub_1B11BB5C0();
}

void sub_1B11759E8(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = sub_1B11758F4(*a1);
  OUTLINED_FUNCTION_41();
}

void sub_1B1175A0C(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_1B1175904(*v1);
  OUTLINED_FUNCTION_41();
}

id sub_1B1175A30(uint64_t a1)
{
  id result;
  void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16(a1, &qword_1ED3816A0);
  result = sub_1B1175AE0();
  if (result)
  {
    v2 = result;
    v3 = sub_1B11BA900();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B1175AE0()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v0);

  return v1;
}

uint64_t sub_1B1175B40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v9;

  v0 = sub_1B11BAAD4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  if (v5 == (id)6)
  {
    OUTLINED_FUNCTION_16(v6, &qword_1EEF10798);
    sub_1B1175C78(15461355);
    JUMPOUT(0x1B5E17248);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CD86D0], v0);
  v7 = sub_1B11BAAC8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v7 & 1) != 0)
    sub_1B118F5CC();
  else
    sub_1B118F538();
  return swift_retain();
}

id sub_1B1175C78(int a1)
{
  return sub_1B1176E2C(BYTE2(a1), BYTE1(a1), a1);
}

void sub_1B1175C8C(uint64_t *a1)
{
  uint64_t (*v1)(uint64_t);
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  void (*v22)();
  uint64_t v23;
  _QWORD v24[2];

  LOBYTE(v24[0]) = 0;
  v2 = (void *)OUTLINED_FUNCTION_18(*a1);
  if (!v2)
  {
    v10 = OUTLINED_FUNCTION_24_0();
    if (v11 && (v12 = sub_1B11BB3EC(), v10 = OUTLINED_FUNCTION_13_0(), v12 > 0) && (v10 = v1(v10), v13))
    {
      OUTLINED_FUNCTION_16(v10, (unint64_t *)&unk_1EEF107A0);
      OUTLINED_FUNCTION_36_0();
    }
    else
    {
      OUTLINED_FUNCTION_16(v10, (unint64_t *)&unk_1EEF107A0);
      OUTLINED_FUNCTION_26_0();
    }
    v9 = (uint64_t)sub_1B1176148();
    v3 = (void *)v9;
    goto LABEL_10;
  }
  v3 = v2;
  objc_msgSend(v2, sel_length);
  v4 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v4 + 16) = v24;
  v5 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v5 + 16) = sub_1B1177008;
  *(_QWORD *)(v5 + 24) = v4;
  v22 = sub_1B117701C;
  v23 = v5;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 1107296256;
  v20 = sub_1B11760B0;
  v21 = &block_descriptor;
  v6 = _Block_copy(&v18);
  swift_retain();
  v7 = swift_release();
  OUTLINED_FUNCTION_12(v7, sel_enumerateAttributesInRange_options_usingBlock_);
  _Block_release(v6);
  v8 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_34();
  if ((v8 & 1) == 0)
  {
    v9 = OUTLINED_FUNCTION_38();
LABEL_10:
    v14 = OUTLINED_FUNCTION_9(v9, sel_string);
    v15 = sub_1B11BB3C8();
    v17 = v16;

    v18 = v15;
    v19 = v17;
    v24[0] = 10;
    v24[1] = 0xE100000000000000;
    sub_1B1176EC8();
    sub_1B11BB4F4();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_17_1();
    return;
  }
  __break(1u);
}

uint64_t sub_1B1175E98(uint64_t a1, char *a2)
{
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];

  sub_1B117777C(a1, v27);
  v3 = v27[0];
  v4 = v27[3];
  v5 = v27[4];
  v23 = v27[1];
  v24 = (unint64_t)(v27[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_3;
LABEL_2:
  v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v8 = v7 | (v4 << 6);
  while (1)
  {
    v13 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v8);
    sub_1B1177908(*(_QWORD *)(v3 + 56) + 32 * v8, (uint64_t)&v26);
    v25 = v13;
    v14 = sub_1B11BB3C8();
    v16 = v15;
    if (v14 == sub_1B11BB3C8() && v16 == v17)
    {
      v22 = v13;
      swift_bridgeObjectRelease_n();
      v21 = 1;
    }
    else
    {
      v19 = sub_1B11BB59C();
      v20 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v19 & 1;
    }
    *a2 = v21;
    result = sub_1B1177944((uint64_t)&v25);
    if (v5)
      goto LABEL_2;
LABEL_3:
    v9 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v9 >= v24)
      return OUTLINED_FUNCTION_38();
    v10 = *(_QWORD *)(v23 + 8 * v9);
    v11 = v4 + 1;
    if (!v10)
    {
      v11 = v4 + 2;
      if (v4 + 2 >= v24)
        return OUTLINED_FUNCTION_38();
      v10 = *(_QWORD *)(v23 + 8 * v11);
      if (!v10)
      {
        v11 = v4 + 3;
        if (v4 + 3 >= v24)
          return OUTLINED_FUNCTION_38();
        v10 = *(_QWORD *)(v23 + 8 * v11);
        if (!v10)
        {
          v11 = v4 + 4;
          if (v4 + 4 >= v24)
            return OUTLINED_FUNCTION_38();
          v10 = *(_QWORD *)(v23 + 8 * v11);
          if (!v10)
          {
            v11 = v4 + 5;
            if (v4 + 5 >= v24)
              return OUTLINED_FUNCTION_38();
            v10 = *(_QWORD *)(v23 + 8 * v11);
            if (!v10)
            {
              v12 = v4 + 6;
              while (v12 < v24)
              {
                v10 = *(_QWORD *)(v23 + 8 * v12++);
                if (v10)
                {
                  v11 = v12 - 1;
                  goto LABEL_18;
                }
              }
              return OUTLINED_FUNCTION_38();
            }
          }
        }
      }
    }
LABEL_18:
    v5 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
    v4 = v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B11760B0(uint64_t a1)
{
  void (*v1)(void);

  v1 = *(void (**)(void))(a1 + 32);
  type metadata accessor for Key(0);
  sub_1B1177718(&qword_1EEF10848, (uint64_t)&unk_1B11BFCE0);
  sub_1B11BB368();
  v1();
  return swift_bridgeObjectRelease();
}

id sub_1B1176148()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

void sub_1B11761B8(void *a1)
{
  char *v1;
  id v2;
  int64_t v3;
  unint64_t v4;
  char *v5;
  char **p_types;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v13;
  id v14;
  char **v15;
  char *v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;

  if (a1)
  {
    v5 = a1;
    p_types = &stru_1E62DBFF8.types;
    v7 = (unint64_t)objc_msgSend(v5, sel_count);
    if ((v7 & 0x8000000000000000) == 0)
    {
      v9 = (char *)v7;
      if (v7)
      {
        v3 = 0;
        v1 = 0;
        do
        {
          v10 = objc_msgSend(v5, sel_objectAtIndexedSubscript_, v1);
          v2 = objc_msgSend(v10, sel_count);

          if (v2)
          {
            if (__OFADD__(v3++, 1))
            {
              __break(1u);
              goto LABEL_29;
            }
          }
          ++v1;
        }
        while (v9 != v1);
        if (!v3)
          goto LABEL_24;
        if (v3 == 1)
        {
          v1 = (char *)objc_msgSend(v5, sel_objectAtIndexedSubscript_, 0);
          v13 = objc_msgSend(v1, sel_category);
          if (!v13)
          {

            goto LABEL_25;
          }
          v14 = objc_msgSend(v13, sel_suggestionCategoryTitle);
          v2 = (id)sub_1B11BB3C8();
          p_types = v15;

          v16 = sub_1B11770A4(0, 1, 1, MEMORY[0x1E0DEE9D8]);
          v4 = *((_QWORD *)v16 + 2);
          v8 = *((_QWORD *)v16 + 3);
          v3 = v4 + 1;
          if (v4 >= v8 >> 1)
            goto LABEL_31;
          goto LABEL_12;
        }
        v18 = (unint64_t)OUTLINED_FUNCTION_9(v11, sel_count);
        if ((v18 & 0x8000000000000000) != 0)
          goto LABEL_30;
        v19 = v18;
        if (v18)
        {
          v20 = 0;
          v21 = (char *)MEMORY[0x1E0DEE9D8];
          do
          {
            v22 = objc_msgSend(v5, sel_objectAtIndexedSubscript_, v20);
            v23 = objc_msgSend(v22, sel_category);

            if (v23)
            {
              v24 = objc_msgSend(v23, sel_suggestionCategoryTitle);
              v25 = sub_1B11BB3C8();
              v27 = v26;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v21 = OUTLINED_FUNCTION_25_0(0, *((_QWORD *)v21 + 2) + 1);
              v29 = *((_QWORD *)v21 + 2);
              v28 = *((_QWORD *)v21 + 3);
              if (v29 >= v28 >> 1)
                v21 = OUTLINED_FUNCTION_25_0((char *)(v28 > 1), v29 + 1);
              *((_QWORD *)v21 + 2) = v29 + 1;
              v30 = &v21[16 * v29];
              *((_QWORD *)v30 + 4) = v25;
              *((_QWORD *)v30 + 5) = v27;
              swift_unknownObjectRelease();
            }
            ++v20;
          }
          while (v19 != v20);
        }
      }
LABEL_24:
      v1 = v5;
      goto LABEL_25;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    v16 = OUTLINED_FUNCTION_25_0((char *)(v8 > 1), v3);
LABEL_12:
    *((_QWORD *)v16 + 2) = v3;
    v17 = &v16[16 * v4];
    *((_QWORD *)v17 + 4) = v2;
    *((_QWORD *)v17 + 5) = p_types;

    swift_unknownObjectRelease();
LABEL_25:

  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1176450(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **p_types;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char **v51;
  uint64_t v52;
  void *v53;
  const void *v54;
  uint64_t v55;
  void (*v56)(void);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  uint64_t v76;
  uint64_t v77;

  result = MEMORY[0x1E0DEE9D8];
  v77 = MEMORY[0x1E0DEE9D8];
  if (a3)
  {
    v6 = a3;
    sub_1B1176A58(a1, a2, v6);
    if (v7 == -1)
    {

    }
    else
    {
      v68 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, v7);
      result = (uint64_t)objc_msgSend(v68, sel_count);
      if (result < 0)
      {
LABEL_38:
        __break(1u);
        return result;
      }
      v8 = result;
      if (result)
      {
        v65 = v6;
        v67 = type metadata accessor for SGBannerContent();
        v9 = 0;
        p_types = &stru_1E62DBFF8.types;
        v71 = xmmword_1B11BD3A0;
        while (1)
        {
          v11 = objc_msgSend(v68, sel_objectAtIndexedSubscript_, v9, v65);
          v12 = SGBannerContent.__allocating_init()();
          v13 = OUTLINED_FUNCTION_4_0();
          *(_QWORD *)(v13 + 16) = v12;
          *(_QWORD *)(v13 + 24) = v11;
          v75 = sub_1B11771CC;
          v76 = v13;
          v14 = OUTLINED_FUNCTION_40((uint64_t)&block_descriptor_20, v66, v67, (uint64_t)v68, v69, v71, *((uint64_t *)&v71 + 1), v72, MEMORY[0x1E0C809B0], 1107296256, v73, v74);
          v15 = v12;
          OUTLINED_FUNCTION_21_0();
          swift_release();
          dispatchInContext(1, (uint64_t)v14);
          _Block_release(v14);
          if ((OUTLINED_FUNCTION_19_3() & 1) != 0)
          {
            v16 = objc_msgSend(v11, p_types[460]);
            if (!v16)
            {
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_33_1(*(uint64_t (**)(void))(v17 + 368));
              goto LABEL_11;
            }
          }
          else
          {
            v16 = objc_msgSend(objc_msgSend((id)OUTLINED_FUNCTION_21_0(), sel_suggestionCategory), sel_suggestionCategoryImage);
            OUTLINED_FUNCTION_20_0();
            OUTLINED_FUNCTION_22_1();
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
          v18 = OUTLINED_FUNCTION_4_0();
          OUTLINED_FUNCTION_14(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v65, v67, (uint64_t)v68, v69, v71);
          OUTLINED_FUNCTION_1_1();
          v26 = v16;
          OUTLINED_FUNCTION_27_0();

LABEL_11:
          if ((OUTLINED_FUNCTION_19_3() & 1) != 0)
          {
            v27 = objc_msgSend(v11, sel_suggestionImageSGView);
            if (!v27)
              goto LABEL_18;
          }
          else
          {
            v28 = objc_msgSend((id)OUTLINED_FUNCTION_21_0(), sel_suggestionCategory);
            if ((OUTLINED_FUNCTION_35_1(v28) & 1) == 0)
            {
              OUTLINED_FUNCTION_20_0();
              OUTLINED_FUNCTION_22_1();
LABEL_18:
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_33_1(*(uint64_t (**)(void))(v38 + 536));
              goto LABEL_19;
            }
            v27 = objc_msgSend(v28, sel_suggestionCategoryImageSGView);
            OUTLINED_FUNCTION_20_0();
            OUTLINED_FUNCTION_22_1();
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
          v29 = OUTLINED_FUNCTION_4_0();
          OUTLINED_FUNCTION_14(v29, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v65, v67, (uint64_t)v68, v69, v71);
          OUTLINED_FUNCTION_1_1();
          v37 = v27;
          OUTLINED_FUNCTION_27_0();

LABEL_19:
          if ((OUTLINED_FUNCTION_19_3() & 1) != 0)
          {
            v39 = objc_msgSend((id)OUTLINED_FUNCTION_21_0(), sel_suggestionAttributedSubtitle);
            OUTLINED_FUNCTION_1_1();
            OUTLINED_FUNCTION_33_1(*(uint64_t (**)(void))(v40 + 320));
            OUTLINED_FUNCTION_20_0();
          }
          OUTLINED_FUNCTION_1_1();
          v42 = *(void (**)(uint64_t))(v41 + 416);
          v43 = OUTLINED_FUNCTION_21_0();
          v42(v43);
          v44 = MEMORY[0x1E0DEEDD8];
          HIBYTE(v72) = 0;
          OUTLINED_FUNCTION_1_1();
          v46 = (void *)(*(uint64_t (**)(void))(v45 + 312))();
          if (v46)
          {
            v47 = v46;
            v70 = objc_msgSend(v46, sel_length);
            v48 = OUTLINED_FUNCTION_4_0();
            *(_QWORD *)(v48 + 16) = (char *)&v72 + 7;
            v49 = OUTLINED_FUNCTION_4_0();
            *(_QWORD *)(v49 + 16) = sub_1B1177988;
            *(_QWORD *)(v49 + 24) = v48;
            v75 = (void (*)(uint64_t))sub_1B1177984;
            v76 = v49;
            v50 = v9;
            v51 = p_types;
            v52 = v8;
            v53 = OUTLINED_FUNCTION_40((uint64_t)&block_descriptor_31, (uint64_t)v65, v67, (uint64_t)v68, (uint64_t)v70, v71, *((uint64_t *)&v71 + 1), v72, MEMORY[0x1E0C809B0], 1107296256, v73, v74);
            swift_retain();
            OUTLINED_FUNCTION_34();
            objc_msgSend(v47, sel_enumerateAttributesInRange_options_usingBlock_, 0, v69, 0, v53);
            v54 = v53;
            v8 = v52;
            p_types = v51;
            v9 = v50;
            _Block_release(v54);
            LOBYTE(v50) = OUTLINED_FUNCTION_6();
            swift_release();
            result = swift_release();
            if ((v50 & 1) != 0)
            {
              __break(1u);
              goto LABEL_38;
            }
          }
          else
          {
            OUTLINED_FUNCTION_1_1();
            v56 = *(void (**)(void))(v55 + 288);
            v56();
            if (v57
              && (sub_1B11BB3EC(), v58 = OUTLINED_FUNCTION_32(), v44 > 0)
              && (((void (*)(uint64_t))v56)(v58), v59))
            {
              sub_1B1176E90(0, (unint64_t *)&unk_1EEF107A0);
            }
            else
            {
              sub_1B1176E90(0, (unint64_t *)&unk_1EEF107A0);
              OUTLINED_FUNCTION_26_0();
            }
            v47 = sub_1B1176148();
          }
          v60 = objc_msgSend(v47, sel_string);
          v61 = sub_1B11BB3C8();
          v63 = v62;

          (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v15) + 0x128))(v61, v63);
          v64 = v15;
          MEMORY[0x1B5E174E8]();
          if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B11BB458();
          ++v9;
          sub_1B11BB464();
          sub_1B11BB44C();
          OUTLINED_FUNCTION_20_0();

          if (v8 == v9)
          {

            return v77;
          }
        }
      }

    }
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

void sub_1B1176A58(uint64_t a1, uint64_t a2, id a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  v6 = (unint64_t)objc_msgSend(a3, sel_count);
  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = v6;
    if (!v6)
    {
LABEL_14:
      OUTLINED_FUNCTION_15();
      return;
    }
    v8 = 0;
    while (v7 != v8)
    {
      v9 = objc_msgSend(a3, sel_objectAtIndexedSubscript_, v8);
      v10 = objc_msgSend(v9, sel_category);

      if (v10)
      {
        v11 = objc_msgSend(v10, sel_suggestionCategoryTitle);
        swift_unknownObjectRelease();
        v12 = sub_1B11BB3C8();
        v14 = v13;

        if (v12 == a1 && v14 == a2)
        {
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        v16 = sub_1B11BB59C();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_14;
      }
      if (v7 == ++v8)
        goto LABEL_14;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1B1176B84(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1B1176BB0(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x210))();
  if (!v1)
  {
LABEL_9:
    v5 = (void *)OUTLINED_FUNCTION_23_1();
    if (v5)
    {
      v6 = (uint64_t)objc_msgSend(v5, sel_respondsToSelector_, sel_suggestionImageSGView);
      if ((v6 & 1) != 0)
        v7 = OUTLINED_FUNCTION_9(v6, sel_suggestionImageSGView);
      OUTLINED_FUNCTION_10_0();
    }
    goto LABEL_14;
  }
  v2 = v1;
  v3 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_8;
  }
  if (!OUTLINED_FUNCTION_39_0())
  {
LABEL_8:
    OUTLINED_FUNCTION_13_0();
    goto LABEL_9;
  }
LABEL_4:
  if ((v2 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_37_0();
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = *(id *)(v2 + 32);
    OUTLINED_FUNCTION_13_0();
LABEL_14:
    OUTLINED_FUNCTION_5();
    return;
  }
  __break(1u);
}

void sub_1B1176C8C(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x168))();
  if (!v1)
  {
LABEL_9:
    v5 = (void *)OUTLINED_FUNCTION_23_1();
    if (v5)
    {
      v6 = (uint64_t)objc_msgSend(v5, sel_respondsToSelector_, sel_suggestionImage);
      if ((v6 & 1) != 0)
        v7 = OUTLINED_FUNCTION_9(v6, sel_suggestionImage);
      OUTLINED_FUNCTION_10_0();
    }
    goto LABEL_14;
  }
  v2 = v1;
  v3 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_8;
  }
  if (!OUTLINED_FUNCTION_39_0())
  {
LABEL_8:
    OUTLINED_FUNCTION_13_0();
    goto LABEL_9;
  }
LABEL_4:
  if ((v2 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_37_0();
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = *(id *)(v2 + 32);
    OUTLINED_FUNCTION_13_0();
LABEL_14:
    OUTLINED_FUNCTION_5();
    return;
  }
  __break(1u);
}

uint64_t sub_1B1176D68(uint64_t a1)
{
  uint64_t result;

  result = 0x646E657065646E49;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6465646465626D45;
      break;
    case 2:
    case 3:
    case 4:
      result = 0x7A696D6F74737543;
      break;
    default:
      result = 0x726F707075736E55;
      break;
  }
  return result;
}

uint64_t sub_1B1176E24()
{
  return 0;
}

id sub_1B1176E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (double)a1 / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, 1.0);
}

uint64_t sub_1B1176E90(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_1B1176EC8()
{
  unint64_t result;

  result = qword_1ED3817D8;
  if (!qword_1ED3817D8)
  {
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED3817D8);
  }
  return result;
}

void (*sub_1B1176F04())(uint64_t)
{
  uint64_t *v0;

  return sub_1B11778D8(*v0, (void (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1B1176F2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B11778A4();
  *a1 = result;
  return result;
}

uint64_t sub_1B1176F50()
{
  return sub_1B1177320();
}

void (*sub_1B1176F5C())(uint64_t)
{
  uint64_t *v0;

  return sub_1B11778D8(*v0, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1B1176F7C()
{
  return sub_1B11773A4();
}

uint64_t sub_1B1176F84()
{
  return sub_1B11773E4();
}

uint64_t sub_1B1176F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B11BB398();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B1176FD0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B1176FF8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B1176FFC()
{
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_1B1177008(uint64_t a1)
{
  uint64_t v1;

  return sub_1B1175E98(a1, *(char **)(v1 + 16));
}

uint64_t sub_1B1177010()
{
  return OUTLINED_FUNCTION_0();
}

void sub_1B117701C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1177038()
{
  sub_1B1177718(&qword_1EEF10848, (uint64_t)&unk_1B11BFCE0);
  sub_1B1177718(&qword_1EEF10850, (uint64_t)&unk_1B11BD7A4);
  return sub_1B11BB584();
}

char *sub_1B11770A4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10858);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B11771A0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1B11771CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v2 = v1;
  v3 = *(_QWORD **)(v1 + 16);
  v4 = *(void **)(v2 + 24);
  v5 = OUTLINED_FUNCTION_9(a1, sel_suggestionTitle);
  sub_1B11BB3C8();
  OUTLINED_FUNCTION_43_0();
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v7 = OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x110));
  v14 = OUTLINED_FUNCTION_9(v7, sel_suggestionPrimaryAction);
  v8 = objc_msgSend(v14, sel_title);
  sub_1B11BB3C8();
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))((*v6 & *v3) + 0x188));
  if ((objc_msgSend(v4, sel_respondsToSelector_, sel_suggestionSubtitle) & 1) != 0)
  {
    v9 = objc_msgSend((id)OUTLINED_FUNCTION_31(), sel_suggestionSubtitle);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1B11BB3C8();
      v13 = v12;

    }
    else
    {
      v11 = 0;
      v13 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))((*v6 & *v3) + 0x128))(v11, v13);
    OUTLINED_FUNCTION_10_0();
  }

}

uint64_t sub_1B1177308()
{
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_1B1177314()
{
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_1B1177320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1B11BB3C8();
  v2 = v1;
  if (v0 == sub_1B11BB3C8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1B11BB59C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B11773A4()
{
  sub_1B11BB3C8();
  sub_1B11BB3E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B11773E4()
{
  uint64_t v0;

  sub_1B11BB3C8();
  sub_1B11BB5A8();
  sub_1B11BB3E0();
  v0 = sub_1B11BB5C0();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1B1177458()
{
  unint64_t result;

  result = qword_1EEF10818;
  if (!qword_1EEF10818)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BD5D0, &unk_1E62D4A40);
    atomic_store(result, (unint64_t *)&qword_1EEF10818);
  }
  return result;
}

void type metadata accessor for SGBannerConstants()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for SGBannerConstants.SGUIAccessibilityIdentifier()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B11774AC(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_1B1177534(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B1177580 + 4 * byte_1B11BD3BB[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B11775B4 + 4 * byte_1B11BD3B6[v4]))();
}

uint64_t sub_1B11775B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11775BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B11775C4);
  return result;
}

uint64_t sub_1B11775D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B11775D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B11775DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11775E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11775F0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B11775FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for MultiBannerSectionTypes()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for SGBannerHelpers()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B117761C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B117763C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1B117768C(a1, (unint64_t *)&unk_1EEF10820);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1B117768C(a1, (unint64_t *)&unk_1EEF121D0);
}

void sub_1B117768C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B11776D0()
{
  return sub_1B1177718((unint64_t *)&unk_1EEF10830, (uint64_t)&unk_1B11BD768);
}

uint64_t sub_1B11776F4()
{
  return sub_1B1177718(&qword_1EEF121E0, (uint64_t)&unk_1B11BD73C);
}

uint64_t sub_1B1177718(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x1B5E17C68](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B1177758()
{
  return sub_1B1177718(&qword_1EEF10840, (uint64_t)&unk_1B11BD7D8);
}

uint64_t sub_1B117777C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1B11777B4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1B11BB3B0();
  *a2 = 0;
  return result;
}

uint64_t sub_1B1177828(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1B11BB3BC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B11778A4()
{
  uint64_t v0;

  sub_1B11BB3C8();
  v0 = sub_1B11BB398();
  swift_bridgeObjectRelease();
  return v0;
}

void (*sub_1B11778D8(uint64_t a1, void (*a2)(uint64_t)))(uint64_t)
{
  uint64_t v3;

  v3 = sub_1B11BB3C8();
  a2(v3);
  OUTLINED_FUNCTION_32();
  return a2;
}

uint64_t sub_1B1177908(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B1177944(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10860);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1B1177994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  OUTLINED_FUNCTION_106();
  v3 = sub_1B11BAA44();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF108D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_7();
  sub_1B11BAA20();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_38_0();
  v7 = *(double *)sub_1B11757AC();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3518]), sel_initWithFrame_, 0.0, 0.0, v7, v7);
  objc_msgSend(v8, sel_addTarget_action_forControlEvents_, v0, sel_dismissalPressed_, 64);
  sub_1B117C45C(0, &qword_1ED380C50);
  v9 = sub_1B1177BAC();
  objc_msgSend(v8, sel_setImage_forState_, v9, 0);

  sub_1B117C45C(0, (unint64_t *)&unk_1EEF108E0);
  v10 = v8;
  sub_1B11BAA14();
  sub_1B11BAA38();
  sub_1B11757B8();
  sub_1B11BAA2C();
  OUTLINED_FUNCTION_97(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_127_0(v2, 0);
  v11 = (void *)sub_1B11BB470();
  objc_msgSend(v10, sel_setHoverStyle_, v11);

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithCustomView_, v10);
  return v12;
}

id sub_1B1177BAC()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_, v0);

  return v1;
}

BOOL sub_1B1177C0C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v9;

  OUTLINED_FUNCTION_24();
  v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
  v2 = sub_1B117CA28(v1);
  if (v2)
    v3 = v2;
  else
    v3 = MEMORY[0x1E0DEE9D8];
  if (v3 >> 62)
    goto LABEL_17;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 4;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = (void *)MEMORY[0x1B5E17608](v5 - 4, v3);
      }
      else
      {
        v6 = *(void **)(v3 + 8 * v5);
        swift_unknownObjectRetain();
      }
      v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if ((objc_msgSend(v6, sel_respondsToSelector_, sel_suggestionActionButtonType) & 1) != 0
        && (objc_msgSend(v6, sel_respondsToSelector_, sel_suggestionActionButtonType) & 1) != 0)
      {
        v9 = objc_msgSend(v6, sel_suggestionActionButtonType);
        OUTLINED_FUNCTION_13_0();
        swift_unknownObjectRelease();
        return v9 == (id)3;
      }
      swift_unknownObjectRelease();
      ++v5;
      if (v7 == v4)
        goto LABEL_14;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v4 = sub_1B11BB56C();
    OUTLINED_FUNCTION_13_0();
  }
LABEL_14:
  OUTLINED_FUNCTION_13_0();
  return 0;
}

void sub_1B1177D60(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X8>)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  OUTLINED_FUNCTION_139();
  sub_1B117CB38((uint64_t)&qword_1EEF11640);
  v12 = sub_1B11BAB70();
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = v11;
  *(_QWORD *)(a5 + 40) = v12;
  *(_QWORD *)(a5 + 48) = v13;
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B1177E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  void *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;

  v1 = v0;
  v2 = *(_QWORD *)v0;
  v3 = *(_QWORD *)(v0 + 8);
  v9 = *(_OWORD *)(v0 + 40);
  v4 = *(uint64_t (**)(void))(**((_QWORD **)&v9 + 1) + 96);
  swift_retain();
  v5 = (void *)v4();
  sub_1B117CA90((uint64_t)&v9);
  sub_1B1176450(v2, v3, v5);

  swift_getKeyPath();
  v6 = swift_allocObject();
  v7 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v6 + 32) = v7;
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v6 + 64) = *(_QWORD *)(v1 + 48);
  sub_1B117CAF4(v1);
  OUTLINED_FUNCTION_130_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF108F8);
  sub_1B117F464((uint64_t)&unk_1EEF10900);
  sub_1B117CB38((uint64_t)&unk_1EEF10908);
  sub_1B117CB68();
  return sub_1B11BB2FC();
}

void sub_1B1177F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v24;
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
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  id v58;
  char v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  __int16 v66;
  char v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v78;
  char v79;
  uint64_t (*v80)(void);
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t KeyPath;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(void);
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
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
  uint64_t *v119;
  _QWORD *v120;
  id v121;
  uint64_t v122;
  char *v123;
  __int128 v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _QWORD *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;

  OUTLINED_FUNCTION_24();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_0_0();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_17_0();
  v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10980);
  OUTLINED_FUNCTION_0_0();
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v124 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v124 - v12;
  v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DE8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_4();
  v129 = v15;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_55(v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_5_0();
  v136 = v19;
  v20 = sub_1B11BAC0C();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_57();
  v24 = (char *)(v23 - v22);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_7();
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v27);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v30);
  v135 = (uint64_t)&v124 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_29_0();
  v140 = v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E18);
  v138 = *(_QWORD *)(v34 - 8);
  v139 = v34;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_5_0();
  v147 = v36;
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10958);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_4();
  v137 = v38;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_29_0();
  v141 = v40;
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E20);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_5_0();
  v149 = v42;
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_5_0();
  v144 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10920);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_57();
  v49 = v48 - v47;
  v50 = *v5;
  if ((*(_BYTE *)(v3 + 24) & 1) != 0 && *(_QWORD *)(v3 + 32) == 6)
  {
    v51 = *(void **)(v3 + 16);
    v52 = v49;
    v53 = v50;
    v54 = v51;
    v55 = sub_1B119932C(v53);
    v56 = v144;
    *v144 = v53;
    v56[1] = v54;
    *((_BYTE *)v56 + 16) = v55 & 1;
    *((_BYTE *)v56 + 17) = BYTE1(v55) & 1;
    *((_BYTE *)v56 + 18) = BYTE2(v55) & 1;
    *(_OWORD *)(v56 + 3) = 0u;
    *(_OWORD *)(v56 + 5) = 0u;
    *((_BYTE *)v56 + 56) = 0;
    OUTLINED_FUNCTION_42_0();
    v57 = v53;
    v58 = v54;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10930);
    sub_1B117CC40();
    sub_1B117CD00();
    sub_1B11BAE88();
    OUTLINED_FUNCTION_116(v52, v149);
    OUTLINED_FUNCTION_42_0();
    sub_1B117CBD4();
    sub_1B117CDE0();
    sub_1B11BAE88();
    OUTLINED_FUNCTION_75(v52);

  }
  else
  {
    v127 = v49;
    v143 = v46;
    v59 = sub_1B1176E24();
    v60 = *(void **)(v3 + 16);
    if ((v59 & 1) != 0)
    {
      v126 = v7;
      v61 = v50;
      v62 = v60;
      v63 = (void *)sub_1B11A3014(v61);
      v65 = v64;
      *(_QWORD *)&v151 = v63;
      *((_QWORD *)&v151 + 1) = v64;
      LOWORD(v152) = v66 & 0x101;
      BYTE2(v152) = v67 & 1;
      sub_1B11BAB04();
      sub_1B117CDA4();
      sub_1B11BB110();

      v68 = v20;
      v69 = &v24[*(int *)(v20 + 20)];
      v125 = *MEMORY[0x1E0CDB0C0];
      v70 = v125;
      v71 = sub_1B11BAD2C();
      v72 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 104);
      v72(v69, v70, v71);
      __asm { FMOV            V0.2D, #5.0 }
      v124 = _Q0;
      *(_OWORD *)v24 = _Q0;
      v78 = sub_1B11BB1A0();
      v79 = sub_1B11BAF9C();
      v80 = MEMORY[0x1E0CDA088];
      sub_1B117F1D0((uint64_t)v24, v0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
      v81 = v0 + *(int *)(v130 + 36);
      *(_QWORD *)v81 = v78;
      *(_BYTE *)(v81 + 8) = v79;
      sub_1B117F1FC((uint64_t)v24, (uint64_t (*)(_QWORD))v80);
      v82 = (void *)objc_opt_self();
      v83 = MEMORY[0x1B5E1729C](objc_msgSend(v82, sel_systemGray6Color));
      KeyPath = swift_getKeyPath();
      v85 = v132;
      OUTLINED_FUNCTION_21(v0, v132);
      v86 = (uint64_t *)(v85 + *(int *)(v131 + 36));
      *v86 = KeyPath;
      v86[1] = v83;
      OUTLINED_FUNCTION_12_0(v0);
      v72(&v24[*(int *)(v68 + 20)], v125, v71);
      *(_OWORD *)v24 = v124;
      v87 = MEMORY[0x1B5E1729C](objc_msgSend(v82, sel_systemGray4Color));
      sub_1B11BAAF8();
      v88 = v136;
      v89 = MEMORY[0x1E0CDA088];
      sub_1B117F1D0((uint64_t)v24, v136, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
      v90 = v88 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E30) + 36);
      v91 = v152;
      *(_OWORD *)v90 = v151;
      *(_OWORD *)(v90 + 16) = v91;
      *(_QWORD *)(v90 + 32) = v153;
      v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E38);
      *(_QWORD *)(v88 + *(int *)(v92 + 52)) = v87;
      *(_WORD *)(v88 + *(int *)(v92 + 56)) = 256;
      v93 = sub_1B11BB338();
      v95 = v94;
      v96 = (uint64_t *)(v88 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E40) + 36));
      *v96 = v93;
      v96[1] = v95;
      sub_1B117F1FC((uint64_t)v24, (uint64_t (*)(_QWORD))v89);
      v97 = sub_1B11BB338();
      v99 = v98;
      v100 = v134;
      v101 = v134 + *(int *)(v133 + 36);
      OUTLINED_FUNCTION_95(v88, v101);
      v102 = (uint64_t *)(v101 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10E48) + 36));
      *v102 = v97;
      v102[1] = v99;
      OUTLINED_FUNCTION_21(v85, v100);
      OUTLINED_FUNCTION_105(v88);
      OUTLINED_FUNCTION_12_0(v85);
      v103 = *(_QWORD *)sub_1B11756B0();
      v104 = *(_QWORD *)sub_1B11756A4();
      LOBYTE(v88) = sub_1B11BAF9C();
      v105 = v140;
      OUTLINED_FUNCTION_21(v100, v140);
      v106 = v142;
      v107 = v105 + *(int *)(v142 + 36);
      *(_BYTE *)v107 = v88;
      *(_QWORD *)(v107 + 8) = v103;
      *(_QWORD *)(v107 + 16) = v104;
      *(_QWORD *)(v107 + 24) = 0;
      *(_QWORD *)(v107 + 32) = v104;
      *(_BYTE *)(v107 + 40) = 0;
      OUTLINED_FUNCTION_12_0(v100);
      __swift_storeEnumTagSinglePayload(v105, 0, 1, v106);
      v108 = v135;
      sub_1B117F254(v105, v135, &qword_1EEF10E10);
      v109 = 0;
      if (__swift_getEnumTagSinglePayload(v108, 1, v106) != 1)
      {
        v110 = v108;
        v111 = v128;
        OUTLINED_FUNCTION_74(v110, v128);
        OUTLINED_FUNCTION_21(v111, v129);
        sub_1B117F274((uint64_t)&unk_1EEF10E50);
        v109 = sub_1B11BB2A8();
        OUTLINED_FUNCTION_12_0(v111);
      }
      v113 = v137;
      v112 = v138;
      v114 = v147;
      v115 = v139;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v138 + 16))(v137, v147, v139);
      *(_QWORD *)(v113 + *(int *)(v146 + 36)) = v109;
      sub_1B117F494(v105, &qword_1EEF10E10);
      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v114, v115);
      v116 = v141;
      sub_1B117F224(v113, v141, &qword_1EEF10958);
      OUTLINED_FUNCTION_94(v116, (uint64_t)v144);
      OUTLINED_FUNCTION_54();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10930);
      sub_1B117CC40();
      sub_1B117CD00();
      v117 = v127;
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_21(v117, v149);
      OUTLINED_FUNCTION_42_0();
      sub_1B117CBD4();
      sub_1B117CDE0();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_12_0(v117);
      v118 = v116;
    }
    else
    {
      v119 = (uint64_t *)(v1 + *(int *)(v8 + 28));
      *v119 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
      OUTLINED_FUNCTION_42_0();
      *(_QWORD *)v1 = v50;
      *(_QWORD *)(v1 + 8) = v60;
      v120 = v50;
      v121 = v60;
      v122 = sub_1B119932C(v120);
      *(_BYTE *)(v1 + 16) = v122 & 1;
      *(_BYTE *)(v1 + 17) = BYTE1(v122) & 1;
      *(_BYTE *)(v1 + 18) = BYTE2(v122) & 1;
      sub_1B117F1D0(v1, (uint64_t)v11, type metadata accessor for SGSuggestionsTableCell);
      v123 = &v11[*(int *)(v150 + 36)];
      v123[32] = 0;
      *(_OWORD *)v123 = 0u;
      *((_OWORD *)v123 + 1) = 0u;
      sub_1B117F1FC(v1, type metadata accessor for SGSuggestionsTableCell);
      sub_1B117F224((uint64_t)v11, (uint64_t)v13, &qword_1EEF10980);
      OUTLINED_FUNCTION_94((uint64_t)v13, v149);
      OUTLINED_FUNCTION_54();
      sub_1B117CBD4();
      sub_1B117CDE0();
      OUTLINED_FUNCTION_138();
      v118 = (uint64_t)v13;
    }
    OUTLINED_FUNCTION_128(v118);
  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B11789E4()
{
  return sub_1B11BB104();
}

void sub_1B11789FC()
{
  sub_1B1177E18();
  OUTLINED_FUNCTION_131();
}

uint64_t sub_1B1178A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_27_1();
  v0 = OUTLINED_FUNCTION_70_0();
  return OUTLINED_FUNCTION_64(v0, v1, v2, v3);
}

void sub_1B1178A64()
{
  sub_1B1176EC8();
  swift_bridgeObjectRetain();
  sub_1B11BB0BC();
  sub_1B11A5BD4();
}

void sub_1B1178AE4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  sub_1B117CED4(v0, v1, v2);
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_131();
}

void sub_1B1178B0C()
{
  sub_1B1178A64();
}

uint64_t sub_1B1178B14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_1B11BAD08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B117F254(v2, (uint64_t)v10, (uint64_t *)&unk_1EEF10990);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1B11BAB94();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_1B11BB4A0();
    v14 = sub_1B11BAF90();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_1B117C4E0(0x5463696D616E7944, 0xEF657A6953657079, &v18);
      _os_log_impl(&dword_1B1170000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E17CEC](v16, -1, -1);
      MEMORY[0x1B5E17CEC](v15, -1, -1);
    }

    sub_1B11BACFC();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1B1178D2C()
{
  return sub_1B11BAC78();
}

void sub_1B1178D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B117C958(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD9958], MEMORY[0x1E0CDA620]);
}

double sub_1B1178D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  double v4;

  v1 = OUTLINED_FUNCTION_26_1();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0CD98D8], v1);
  sub_1B117CB38((uint64_t)&unk_1EEF109A0);
  v3 = sub_1B11BB38C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  v4 = *(double *)sub_1B1175644();
  if ((v3 & 1) == 0)
    return v4 + *(double *)sub_1B1175650();
  return v4;
}

void sub_1B1178E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  v2 = sub_1B11BAC00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_130_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  v5 = OUTLINED_FUNCTION_58_0();
  v6 = *(_QWORD *)sub_1B1175638();
  *(_QWORD *)v1 = v5;
  *(_QWORD *)(v1 + 8) = v6;
  *(_BYTE *)(v1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109B0);
  sub_1B1178F58();
  sub_1B11BABF4();
  sub_1B117F464((uint64_t)&unk_1EEF109B8);
  sub_1B117CB38((uint64_t)&unk_1EEF109C0);
  sub_1B11BB0E0();
  OUTLINED_FUNCTION_97(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_75(v1);
  OUTLINED_FUNCTION_15();
}

void sub_1B1178F58()
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
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  unsigned int v19;
  int v20;
  id v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  id v34;
  __int16 v35;
  int v36;
  int v37;
  int v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  __int16 v48;
  id v49;
  unsigned __int8 v50;
  unsigned __int8 v51;

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D50);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4();
  v6 = v5;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v41 - v8;
  if (*(_BYTE *)(v1 + 16) == 1)
  {
    v10 = sub_1B11BAD80();
    v11 = *(uint64_t **)v1;
    v12 = OUTLINED_FUNCTION_124(**(_QWORD **)v1);
    swift_bridgeObjectRelease();
    v42 = (char *)v1;
    v47 = v11;
    if (v12)
      v48 = 0;
    else
      v48 = 256;
    sub_1B117E7F8();
    sub_1B117E834();
    v17 = v11;
    sub_1B11BAE88();
    v18 = v49;
    v19 = v50;
    v20 = v51;
    v21 = v49;
    v14 = v18;

    v22 = sub_1B11BAFC0();
    sub_1B1175638();
    OUTLINED_FUNCTION_25_1();
    v45 = v24;
    v46 = v23;
    v43 = v26;
    v44 = v25;
    v27 = 256;
    if (!v20)
      v27 = 0;
    v16 = v27 | v19;
    v15 = v22;
    v13 = 1;
  }
  else
  {
    v10 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v45 = 0;
    v46 = 0;
    v43 = 0;
    v44 = 0;
    v16 = 65280;
  }
  v41 = v15;
  *(_QWORD *)v9 = sub_1B11BAD8C();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D58);
  sub_1B11791B0();
  sub_1B117F254((uint64_t)v9, v6, &qword_1EEF10D50);
  *(_QWORD *)v3 = v10;
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = v13;
  *(_QWORD *)(v3 + 24) = v14;
  *(_QWORD *)(v3 + 32) = v16;
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = v13;
  *(_QWORD *)(v3 + 56) = v15;
  v28 = v45;
  *(_QWORD *)(v3 + 64) = v46;
  *(_QWORD *)(v3 + 72) = v28;
  v42 = v9;
  v29 = v43;
  *(_QWORD *)(v3 + 80) = v44;
  *(_QWORD *)(v3 + 88) = v29;
  *(_BYTE *)(v3 + 96) = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10D60);
  sub_1B117F254(v6, v3 + *(int *)(v30 + 48), &qword_1EEF10D50);
  v31 = OUTLINED_FUNCTION_22_2();
  sub_1B117E750(v31, v32, v33, v34, v35);
  sub_1B117F494((uint64_t)v42, &qword_1EEF10D50);
  sub_1B117F494(v6, &qword_1EEF10D50);
  v36 = OUTLINED_FUNCTION_22_2();
  sub_1B117E7D4(v36, v37, v38, v39, v40);
  OUTLINED_FUNCTION_15();
}

void sub_1B11791B0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD **v2;
  char **v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
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
  char v36;
  char v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  char *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  char **p_types;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  void *v106;
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
  void (*v122)(_QWORD, _QWORD, _QWORD);
  char *v123;
  uint64_t v124;
  void (*v125)(_QWORD, _QWORD, _QWORD);
  void (*v126)(uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  unsigned __int8 v129;
  unsigned __int8 v130;
  unsigned __int8 v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  int *v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(uint64_t, uint64_t);
  uint64_t v144;
  uint64_t v145;
  char v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char **v154;
  char *v155;
  uint64_t v156;
  char *v157;
  uint64_t *v158;
  char *v159;
  uint64_t v160;
  char *v161;
  void (*v162)(_QWORD, _QWORD, _QWORD);
  int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  char *v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _DWORD v188[2];
  _DWORD v189[2];
  _DWORD v190[2];
  _DWORD v191[2];
  _QWORD v192[16];
  uint64_t v193;
  uint64_t v194;
  char v195;
  _BYTE v196[7];
  uint64_t v197;
  char v198;
  _BYTE v199[7];
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  char v204;
  _BYTE v205[7];
  char v206;
  _BYTE v207[7];
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  unsigned __int8 v213;
  _BYTE v214[7];
  _BYTE v215[7];
  unsigned __int8 v216;
  _BYTE v217[7];
  _BYTE v218[7];
  unsigned __int8 v219;

  OUTLINED_FUNCTION_80();
  v2 = (_QWORD **)v1;
  v164 = v1;
  v154 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4();
  v149 = v5;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_29_0();
  v148 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10D70);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_4();
  v167 = v9;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_29_0();
  v173 = v11;
  v12 = type metadata accessor for SGSuggestionsTableCell(0);
  v158 = *(uint64_t **)(v12 - 8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v147 = (uint64_t)&v147 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = v14;
  MEMORY[0x1E0C80A78](v13);
  v157 = (char *)&v147 - v15;
  v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119F0);
  v183 = *(_QWORD *)(v185 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_4();
  v184 = v17;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v18);
  v161 = (char *)&v147 - v19;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_29_0();
  v182 = v21;
  v166 = sub_1B11BB2F0();
  v156 = *(_QWORD *)(v166 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_4();
  v162 = v23;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_29_0();
  v165 = v25;
  v160 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10D80);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_4();
  v187 = v27;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_29_0();
  v181 = v29;
  v30 = OUTLINED_FUNCTION_134();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_38_0();
  v193 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **v2) + 0x108))();
  v194 = v32;
  v180 = sub_1B1176EC8();
  v33 = sub_1B11BB0BC();
  v35 = v34;
  v37 = v36 & 1;
  sub_1B11BAFE4();
  v38 = *(char **)(v31 + 104);
  LODWORD(v178) = *MEMORY[0x1E0CDD6D8];
  v179 = v38;
  ((void (*)(uint64_t))v38)(v0);
  sub_1B11BB038();
  OUTLINED_FUNCTION_91();
  v39 = *(char **)(v31 + 8);
  v186 = v30;
  v177 = v39;
  ((void (*)(uint64_t, uint64_t))v39)(v0, v30);
  sub_1B11BAFFC();
  swift_release();
  v40 = sub_1B11BB0B0();
  v170 = v41;
  LODWORD(v30) = v42;
  v44 = v43;
  OUTLINED_FUNCTION_91();
  sub_1B117CED4(v33, v35, v37);
  OUTLINED_FUNCTION_87();
  v45 = sub_1B11BAFA8();
  sub_1B1175620();
  OUTLINED_FUNCTION_25_1();
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v54 = sub_1B11BAFD8();
  sub_1B1175638();
  v55 = OUTLINED_FUNCTION_25_1();
  v150 = v57;
  v151 = v56;
  v163 = v30;
  v58 = v30 & 1;
  v59 = v164;
  v219 = v58;
  v216 = 0;
  v213 = 0;
  v60 = *(unsigned __int8 *)(v164 + 17);
  v171 = v40;
  v172 = v44;
  v168 = v54;
  v169 = v45;
  v152 = v62;
  v153 = v61;
  if (v60 == 1)
  {
    v63 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)v164) + 0x120))(v55);
    v65 = v49;
    v66 = v47;
    if (v64)
    {
      v193 = v63;
      v194 = v64;
      v67 = sub_1B11BB0BC();
      v69 = v68;
      v176 = v70;
      v72 = v71 & 1;
      sub_1B11BAFE4();
      v73 = v186;
      ((void (*)(uint64_t, _QWORD, uint64_t))v179)(v0, v178, v186);
      sub_1B11BB038();
      swift_release();
      ((void (*)(uint64_t, uint64_t))v177)(v0, v73);
      v74 = sub_1B11BB0B0();
      v179 = v75;
      v180 = v74;
      v77 = v76;
      v178 = v78;
      OUTLINED_FUNCTION_91();
      v177 = (char *)(v77 & 1);
      sub_1B117CED4(v67, v69, v72);
      OUTLINED_FUNCTION_96();
      LOBYTE(v67) = sub_1B11BAFD8();
      sub_1B11BAABC();
      v186 = v79;
      v176 = v80;
      v155 = v81;
      v174 = v82;
      v175 = (char *)v67;
    }
    else
    {
      v179 = 0;
      v180 = 0;
      v177 = 0;
      v178 = 0;
      v175 = 0;
      v176 = 0;
      v186 = 0;
      v155 = 0;
      v174 = 0;
    }
  }
  else
  {
    v65 = v49;
    v66 = v47;
    v179 = 0;
    v180 = 0;
    v176 = 0;
    v177 = 0;
    v174 = 0;
    v175 = 0;
    v186 = 0;
    v155 = 0;
    v178 = 1;
  }
  v83 = v187;
  v85 = v158;
  v84 = v159;
  v87 = v156;
  v86 = (uint64_t)v157;
  v88 = v165;
  sub_1B11BB2E4();
  sub_1B11BAFA8();
  sub_1B117562C();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8();
  v89 = v166;
  v159 = *(char **)(v87 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v159)(v83, v88, v166);
  OUTLINED_FUNCTION_15_1(v83 + *(int *)(v160 + 36));
  v160 = *(_QWORD *)(v87 + 8);
  ((void (*)(uint64_t, uint64_t))v160)(v88, v89);
  sub_1B117F224(v83, v181, (uint64_t *)&unk_1EEF10D80);
  sub_1B117F1D0(v59, v86, type metadata accessor for SGSuggestionsTableCell);
  v90 = *((unsigned __int8 *)v85 + 80);
  v91 = (v90 + 16) & ~v90;
  v92 = v90 | 7;
  v157 = &v84[v91];
  v93 = swift_allocObject();
  v94 = sub_1B117ED90(v86, v93 + v91);
  MEMORY[0x1E0C80A78](v94);
  v145 = v59;
  v95 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A00);
  sub_1B117EE50();
  v96 = v161;
  v158 = v95;
  sub_1B11BB26C();
  v97 = (id)v185;
  (*(void (**)(uint64_t, char *))(v183 + 32))(v182, v96);
  if (*(_BYTE *)(v59 + 18) == 1)
  {
    sub_1B11BB2E4();
    v98 = (void *)OUTLINED_FUNCTION_40_0(**(_QWORD **)v59);
    v100 = v66;
    if (v98)
    {
      p_types = &stru_1E62DBFF8.types;
      v102 = (uint64_t)objc_msgSend(v98, sel_respondsToSelector_, sel_suggestionDismissAction);
      if ((v102 & 1) != 0)
      {
        v97 = OUTLINED_FUNCTION_113_0(v102, sel_suggestionDismissAction);
        OUTLINED_FUNCTION_22_1();
        v103 = v65;
        if (v97)
        {
          v104 = objc_msgSend(v97, sel_title);

          v105 = sub_1B11BB3C8();
          v97 = v106;

          p_types = (char **)v164;
          v107 = v147;
          sub_1B117F1D0(v164, v147, type metadata accessor for SGSuggestionsTableCell);
          v108 = swift_allocObject();
          v109 = sub_1B117ED90(v107, v108 + v91);
          v95 = &v147;
          MEMORY[0x1E0C80A78](v109);
          *(&v147 - 4) = v105;
          *(&v147 - 3) = (uint64_t)v97;
          v145 = (uint64_t)p_types;
          v110 = v148;
          sub_1B11BB26C();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_109();
          v113 = v152;
          v112 = v153;
          v115 = v150;
          v114 = v151;
LABEL_15:
          OUTLINED_FUNCTION_73(v110, v111, v99, (uint64_t)v97);
          v121 = v165;
          v120 = v166;
          v122 = v162;
          v123 = v159;
          ((void (*)(uint64_t, _QWORD, uint64_t))v159)(v165, v162, v166);
          OUTLINED_FUNCTION_21(v110, (uint64_t)v95);
          ((void (*)(uint64_t, uint64_t, uint64_t))v123)(v92, v121, v120);
          v124 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10DD8);
          OUTLINED_FUNCTION_21((uint64_t)v95, v92 + *(int *)(v124 + 48));
          OUTLINED_FUNCTION_12_0(v110);
          v125 = v122;
          v126 = (void (*)(uint64_t, uint64_t))v160;
          ((void (*)(void (*)(_QWORD, _QWORD, _QWORD), uint64_t))v160)(v125, v120);
          OUTLINED_FUNCTION_12_0((uint64_t)v95);
          v126(v121, v120);
          v97 = (id)v185;
          v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DC8);
          OUTLINED_FUNCTION_73(v92, 0, v128, v127);
          v117 = v173;
          sub_1B117F224(v92, v173, (uint64_t *)&unk_1EEF10D70);
          v119 = v92;
          goto LABEL_16;
        }
        OUTLINED_FUNCTION_109();
LABEL_14:
        v113 = v152;
        v112 = v153;
        v115 = v150;
        v114 = v151;
        v110 = v148;
        goto LABEL_15;
      }
      OUTLINED_FUNCTION_22_1();
    }
    v111 = 1;
    v92 = v167;
    p_types = v154;
    v95 = v149;
    v103 = v65;
    goto LABEL_14;
  }
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DC8);
  v117 = v173;
  OUTLINED_FUNCTION_73(v173, 1, v118, v116);
  v119 = v167;
  p_types = v154;
  v100 = v66;
  v103 = v65;
  v113 = v152;
  v112 = v153;
  v115 = v150;
  v114 = v151;
LABEL_16:
  v129 = v219;
  LODWORD(v164) = v219;
  v191[0] = *(_DWORD *)v218;
  *(_DWORD *)((char *)v191 + 3) = *(_DWORD *)&v218[3];
  v190[0] = *(_DWORD *)v217;
  *(_DWORD *)((char *)v190 + 3) = *(_DWORD *)&v217[3];
  v130 = v216;
  LODWORD(v165) = v216;
  v189[0] = *(_DWORD *)v215;
  *(_DWORD *)((char *)v189 + 3) = *(_DWORD *)&v215[3];
  *(_DWORD *)((char *)v188 + 3) = *(_DWORD *)&v214[3];
  v188[0] = *(_DWORD *)v214;
  v131 = v213;
  LODWORD(v166) = v213;
  sub_1B117F254(v181, v187, (uint64_t *)&unk_1EEF10D80);
  v162 = *(void (**)(_QWORD, _QWORD, _QWORD))(v183 + 16);
  v162(v184, v182, v97);
  sub_1B117F254(v117, v119, (uint64_t *)&unk_1EEF10D70);
  v192[0] = v171;
  v192[1] = v170;
  LOBYTE(v192[2]) = v129;
  *(_DWORD *)((char *)&v192[2] + 1) = *(_DWORD *)v218;
  HIDWORD(v192[2]) = *(_DWORD *)&v218[3];
  v192[3] = v172;
  LOBYTE(v192[4]) = v169;
  *(_DWORD *)((char *)&v192[4] + 1) = *(_DWORD *)v217;
  HIDWORD(v192[4]) = *(_DWORD *)&v217[3];
  v192[5] = v100;
  v192[6] = v103;
  v192[7] = v51;
  v192[8] = v53;
  LOBYTE(v192[9]) = v130;
  HIDWORD(v192[9]) = *(_DWORD *)&v215[3];
  *(_DWORD *)((char *)&v192[9] + 1) = *(_DWORD *)v215;
  LOBYTE(v192[10]) = v168;
  HIDWORD(v192[10]) = *(_DWORD *)&v214[3];
  *(_DWORD *)((char *)&v192[10] + 1) = *(_DWORD *)v214;
  v192[11] = v112;
  v192[12] = v113;
  v192[13] = v114;
  v192[14] = v115;
  LOBYTE(v192[15]) = v131;
  memcpy(p_types, v192, 0x79uLL);
  v133 = v178;
  v132 = v179;
  p_types[16] = (char *)v180;
  p_types[17] = v132;
  v134 = v176;
  p_types[18] = v177;
  p_types[19] = (char *)v133;
  v178 = v133;
  v135 = v174;
  v176 = v134;
  v136 = (char *)v186;
  p_types[20] = v175;
  p_types[21] = v136;
  v137 = v155;
  p_types[22] = v134;
  p_types[23] = v137;
  p_types[24] = v135;
  v174 = v135;
  *((_BYTE *)p_types + 200) = 0;
  v138 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10DD0);
  sub_1B117F254(v187, (uint64_t)p_types + v138[16], (uint64_t *)&unk_1EEF10D80);
  v162((char *)p_types + v138[20], v184, v185);
  OUTLINED_FUNCTION_95(v119, (uint64_t)p_types + v138[24]);
  sub_1B117E870((uint64_t)v192);
  v146 = 0;
  v145 = (uint64_t)v135;
  sub_1B117E8BC(v180, (uint64_t)v179, (char)v177, v133);
  v139 = v163 & 1;
  v141 = v170;
  v140 = v171;
  sub_1B117E8AC(v171, v170, v163 & 1);
  v142 = v172;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_105(v173);
  v143 = *(void (**)(uint64_t, uint64_t))(v183 + 8);
  v144 = v185;
  v143(v182, v185);
  OUTLINED_FUNCTION_12_0(v181);
  sub_1B117CED4(v140, v141, v139);
  OUTLINED_FUNCTION_126();
  sub_1B117F494(v167, (uint64_t *)&unk_1EEF10D70);
  v143(v184, v144);
  OUTLINED_FUNCTION_12_0(v187);
  v146 = 0;
  v145 = (uint64_t)v174;
  sub_1B117E90C(v180, (uint64_t)v179, (char)v177, v178);
  v193 = v140;
  v194 = v141;
  v195 = v164;
  *(_DWORD *)v196 = v191[0];
  *(_DWORD *)&v196[3] = *(_DWORD *)((char *)v191 + 3);
  v197 = v142;
  v198 = v169;
  *(_DWORD *)v199 = v190[0];
  *(_DWORD *)&v199[3] = *(_DWORD *)((char *)v190 + 3);
  v200 = v100;
  v201 = v103;
  v202 = v51;
  v203 = v53;
  v204 = v165;
  *(_DWORD *)&v205[3] = *(_DWORD *)((char *)v189 + 3);
  *(_DWORD *)v205 = v189[0];
  v206 = v168;
  *(_DWORD *)&v207[3] = *(_DWORD *)((char *)v188 + 3);
  *(_DWORD *)v207 = v188[0];
  v208 = v112;
  v209 = v113;
  v210 = v114;
  v211 = v115;
  v212 = v166;
  sub_1B117E95C((uint64_t)&v193);
  OUTLINED_FUNCTION_23_2();
}

void sub_1B1179DF4()
{
  uint64_t **v0;
  uint64_t **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
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

  OUTLINED_FUNCTION_106();
  v1 = v0;
  v2 = OUTLINED_FUNCTION_26_1();
  v27 = *(_QWORD *)(v2 - 8);
  v28 = v2;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_5_0();
  v26 = v4;
  OUTLINED_FUNCTION_123(**v1);
  sub_1B1176EC8();
  sub_1B11BB0BC();
  if (qword_1EEF128E0 != -1)
    swift_once();
  v5 = sub_1B11BB098();
  v7 = v6;
  v9 = v8;
  v11 = v10 & 1;
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_87();
  v12 = sub_1B11BB344();
  OUTLINED_FUNCTION_11_0(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v5, v7, v11, v9);
  sub_1B117CED4(v5, v7, v11);
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_104();
  sub_1B1178B14(v26);
  sub_1B1178D60();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  sub_1B11BB338();
  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_43();
}

uint64_t *sub_1B1179F64()
{
  if (qword_1EEF128E0 != -1)
    swift_once();
  return &qword_1EEF13880;
}

uint64_t sub_1B1179FA4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  char v32;
  _BYTE __src[112];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B11BB4A0();
    v31 = (void *)sub_1B11BAF90();
    sub_1B11BA9E4();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_1B11BAC24();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  v32 = v21 & 1;
  *(_BYTE *)(a9 + 16) = v32;
  *(_QWORD *)(a9 + 24) = v20;
  memcpy((void *)(a9 + 32), __src, 0x70uLL);
  sub_1B117E8AC(a16, v22, v32);
  return swift_bridgeObjectRetain();
}

void *sub_1B117A16C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  _BYTE __src[112];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B11BB4A0();
    v23 = (void *)sub_1B11BAF90();
    sub_1B11BA9E4();

  }
  sub_1B11BAC24();
  sub_1B117F254(v13, a9, &qword_1EEF109C8);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109D0);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t sub_1B117A308(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D48);
    v2 = sub_1B11BB578();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v16 = v15[1];
    *(_QWORD *)&v36[0] = *v15;
    *((_QWORD *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1B117ED74(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1B117ED74(v35, v36);
    sub_1B117ED74(v36, &v32);
    result = sub_1B11BB50C();
    v17 = -1 << *(_BYTE *)(v2 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v6 + 8 * (v18 >> 6))) == 0)
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        v23 = v19 == v22;
        if (v19 == v22)
          v19 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v6 + 8 * v19);
        if (v24 != -1)
        {
          v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    v25 = *(_QWORD *)(v2 + 48) + 40 * v20;
    *(_OWORD *)v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 32) = v30;
    result = (uint64_t)sub_1B117ED74(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v20));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v26)
      goto LABEL_36;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_36;
      v12 = *(_QWORD *)(v27 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_36;
        v12 = *(_QWORD *)(v27 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_36;
          v12 = *(_QWORD *)(v27 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v8 = v13;
  }
  v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_1B117ED84();
    return v2;
  }
  v12 = *(_QWORD *)(v27 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v26)
      goto LABEL_36;
    v12 = *(_QWORD *)(v27 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1B117A6A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
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

  OUTLINED_FUNCTION_106();
  v25 = OUTLINED_FUNCTION_26_1();
  v24 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_5_0();
  v23 = v1;
  sub_1B1176EC8();
  swift_bridgeObjectRetain();
  sub_1B11BB0BC();
  if (qword_1EEF128E0 != -1)
    swift_once();
  v2 = sub_1B11BB098();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_126();
  v9 = sub_1B11BB344();
  OUTLINED_FUNCTION_11_0(v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v2, v4, v8, v6);
  sub_1B117CED4(v2, v4, v8);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_104();
  sub_1B1178B14(v23);
  sub_1B1178D60();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  sub_1B11BB338();
  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_43();
}

void sub_1B117A824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
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

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1B11BB320();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_17_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  v15 = OUTLINED_FUNCTION_58_0();
  v16 = *(_QWORD *)sub_1B11757A0();
  *(_QWORD *)v2 = v15;
  *(_QWORD *)(v2 + 8) = v16;
  *(_BYTE *)(v2 + 16) = 0;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109D8);
  sub_1B117A9D0(v8, v6, v4 & 1, v2 + *(int *)(v17 + 44));
  sub_1B11BB344();
  sub_1B117A16C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v1, 0.0, 1, 0.0, 1);
  sub_1B117F494(v2, &qword_1EEF109C8);
  sub_1B11BB314();
  LOBYTE(v6) = sub_1B11BAF9C();
  v18 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF109E0) + 36);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v18, v0, v11);
  *(_BYTE *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED380C48) + 36)) = v6;
  OUTLINED_FUNCTION_21(v1, v10);
  OUTLINED_FUNCTION_97(v0, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  OUTLINED_FUNCTION_12_0(v1);
  OUTLINED_FUNCTION_15();
}

void sub_1B117A9D0(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  uint64_t *v22;
  id v23;
  char v24;
  char v25;
  id v26;
  char v27;
  char v28;
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
  char v40;
  char v41;
  char v42;
  _BYTE v43[152];
  _BYTE v44[152];
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  char v49;
  char v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  id v65;
  char v66;
  char v67;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CA8);
  OUTLINED_FUNCTION_0_0();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v36 - v16;
  if ((a3 & 1) != 0)
  {
    v37 = sub_1B11BAD80();
    v20 = OUTLINED_FUNCTION_124(*a1);
    swift_bridgeObjectRelease();
    v38 = a2;
    v39 = a4;
    v45 = (uint64_t)a1;
    if (v20)
      v21 = 1;
    else
      v21 = 257;
    LOWORD(v46) = v21;
    sub_1B117E7F8();
    sub_1B117E834();
    v22 = a1;
    sub_1B11BAE88();
    v23 = v65;
    v24 = v66;
    v25 = v67;
    v26 = v65;

    v27 = sub_1B11BAFC0();
    sub_1B11757A0();
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_8();
    v28 = sub_1B11BAFA8();
    sub_1B1175794();
    OUTLINED_FUNCTION_25_1();
    v44[0] = 1;
    v43[0] = v25;
    v42 = 1;
    v41 = 0;
    v40 = 0;
    v45 = v37;
    v46 = 0;
    v47 = 1;
    v48 = v23;
    v49 = v24;
    v50 = v25;
    v51 = 0;
    v52 = 1;
    v53 = v27;
    v54 = v4;
    v55 = v5;
    v56 = v6;
    v57 = v7;
    v58 = 0;
    v59 = v28;
    v60 = v29;
    v61 = v30;
    v62 = v31;
    v63 = v32;
    v64 = 0;
    v33 = nullsub_1(&v45);
    OUTLINED_FUNCTION_133(v33, v34, &qword_1EEF10CB0);
    a4 = v39;
  }
  else
  {
    sub_1B117E720((uint64_t)&v45);
    OUTLINED_FUNCTION_133(v18, v19, &qword_1EEF10CB0);
  }
  *(_QWORD *)v17 = sub_1B11BAD8C();
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CB8);
  sub_1B117AC98();
  OUTLINED_FUNCTION_74((uint64_t)&v65, (uint64_t)v43);
  sub_1B117F254((uint64_t)v17, (uint64_t)v15, &qword_1EEF10CA8);
  OUTLINED_FUNCTION_74((uint64_t)v43, (uint64_t)v44);
  OUTLINED_FUNCTION_74((uint64_t)v44, a4);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CC0);
  sub_1B117F254((uint64_t)v15, a4 + *(int *)(v35 + 48), &qword_1EEF10CA8);
  sub_1B117E774((uint64_t)v44);
  OUTLINED_FUNCTION_125((uint64_t)v17);
  OUTLINED_FUNCTION_125((uint64_t)v15);
  OUTLINED_FUNCTION_74((uint64_t)v43, (uint64_t)&v45);
  sub_1B117E774((uint64_t)&v45);
  OUTLINED_FUNCTION_35();
}

void sub_1B117AC98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  void (*v23)(_QWORD);
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  void (*v53)(uint64_t, _QWORD, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[3];
  void (*v73)(uint64_t, uint64_t);
  int v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  void *v79;
  uint64_t *v80;
  _QWORD *v81;
  void (*v82)(uint64_t, _QWORD, uint64_t);
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  _QWORD v91[16];
  uint64_t v92;
  uint64_t v93;
  char v94;
  _BYTE v95[7];
  uint64_t v96;
  char v97;
  _BYTE v98[7];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  _BYTE v104[7];
  char v105;
  _BYTE v106[7];
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  unsigned __int8 v112;
  _BYTE v113[7];
  _BYTE v114[7];
  unsigned __int8 v115;
  _BYTE v116[7];
  _BYTE v117[7];
  unsigned __int8 v118;

  OUTLINED_FUNCTION_80();
  v74 = v5;
  v79 = v6;
  v8 = v7;
  v77 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CD8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_4();
  v88 = v11;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v12);
  v80 = (_QWORD *)((char *)v72 - v13);
  v14 = OUTLINED_FUNCTION_134();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_7();
  v16 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x108);
  v81 = v8;
  v92 = v16();
  v93 = v17;
  v89 = sub_1B1176EC8();
  v18 = sub_1B11BB0BC();
  v20 = v19;
  v22 = v21 & 1;
  sub_1B11BB050();
  v23 = *(void (**)(_QWORD))(v15 + 104);
  LODWORD(v78) = *MEMORY[0x1E0CDD6D8];
  v82 = (void (*)(uint64_t, _QWORD, uint64_t))v23;
  v23(v0);
  sub_1B11BB038();
  swift_release();
  v24 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v90 = v14;
  v24(v0, v14);
  v85 = sub_1B11BB0B0();
  v86 = v25;
  LOBYTE(v8) = v26;
  v87 = v27;
  OUTLINED_FUNCTION_91();
  v28 = v20;
  v29 = v74;
  sub_1B117CED4(v18, v28, v22);
  OUTLINED_FUNCTION_126();
  v84 = sub_1B11BAFA8();
  sub_1B1175794();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8();
  v83 = sub_1B11BAFD8();
  sub_1B11757A0();
  v30 = OUTLINED_FUNCTION_25_1();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v118 = v8 & 1;
  v115 = 0;
  v112 = 0;
  if ((v29 & 0x100) != 0)
  {
    v40 = v81;
    v41 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v81) + 0x120))(v30);
    if (v42)
    {
      v92 = v41;
      v93 = v42;
      v75 = sub_1B11BB0BC();
      v76 = v43;
      v45 = v44;
      v47 = v46 & 1;
      sub_1B11BB044();
      v48 = v90;
      v82(v0, v78, v90);
      sub_1B11BB038();
      swift_release();
      v24(v0, v48);
      v49 = v75;
      v78 = sub_1B11BB0B0();
      v89 = v51;
      v90 = v50;
      LOBYTE(v48) = v52;
      swift_release();
      v24 = (void (*)(uint64_t, uint64_t))(v48 & 1);
      v40 = v81;
      sub_1B117CED4(v49, v45, v47);
      OUTLINED_FUNCTION_96();
      LOBYTE(v45) = sub_1B11BAFD8();
      sub_1B11BAABC();
      v82 = v53;
      v0 = v54;
      v75 = v56;
      v76 = v55;
      v18 = v45;
    }
    else
    {
      v78 = 0;
      v89 = 0;
      v90 = 0;
      OUTLINED_FUNCTION_93();
    }
    v39 = 256;
  }
  else
  {
    v39 = 0;
    v78 = 0;
    OUTLINED_FUNCTION_93();
    v89 = 1;
    v90 = 0;
    v40 = v81;
  }
  v73 = v24;
  v57 = sub_1B11BAD14();
  v58 = *(_QWORD *)sub_1B1175788();
  v59 = (uint64_t)v80;
  *v80 = v57;
  *(_QWORD *)(v59 + 8) = v58;
  *(_BYTE *)(v59 + 16) = 0;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CE0);
  sub_1B117B218(v40, v79, v29 & 0x10001 | v39, v59 + *(int *)(v60 + 44));
  v61 = v118;
  LODWORD(v81) = v118;
  LOBYTE(v57) = v115;
  v74 = v115;
  v62 = v112;
  LODWORD(v79) = v112;
  sub_1B117F254(v59, v88, &qword_1EEF10CD8);
  v91[0] = v85;
  v91[1] = v86;
  LOBYTE(v91[2]) = v61;
  *(_DWORD *)((char *)&v91[2] + 1) = *(_DWORD *)v117;
  HIDWORD(v91[2]) = *(_DWORD *)&v117[3];
  v91[3] = v87;
  LOBYTE(v91[4]) = v84;
  *(_DWORD *)((char *)&v91[4] + 1) = *(_DWORD *)v116;
  HIDWORD(v91[4]) = *(_DWORD *)&v116[3];
  v91[5] = v1;
  v91[6] = v2;
  v91[7] = v3;
  v91[8] = v4;
  LOBYTE(v91[9]) = v57;
  HIDWORD(v91[9]) = *(_DWORD *)&v114[3];
  *(_DWORD *)((char *)&v91[9] + 1) = *(_DWORD *)v114;
  LOBYTE(v91[10]) = v83;
  HIDWORD(v91[10]) = *(_DWORD *)&v113[3];
  *(_DWORD *)((char *)&v91[10] + 1) = *(_DWORD *)v113;
  v91[11] = v32;
  v91[12] = v34;
  v91[13] = v36;
  v91[14] = v38;
  LOBYTE(v91[15]) = v62;
  v63 = v77;
  memcpy(v77, v91, 0x79uLL);
  v64 = v90;
  v63[16] = v78;
  v63[17] = v64;
  v63[18] = v24;
  v65 = v89;
  v63[19] = v89;
  v63[20] = v18;
  v89 = v65;
  v90 = v64;
  v72[1] = v18;
  v72[2] = v0;
  v63[21] = v82;
  v63[22] = v0;
  v66 = v75;
  v63[23] = v76;
  v63[24] = v66;
  *((_BYTE *)v63 + 200) = 0;
  v67 = (uint64_t)v63 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CE8) + 64);
  v68 = v88;
  sub_1B117F254(v88, v67, &qword_1EEF10CD8);
  sub_1B117E870((uint64_t)v91);
  v69 = OUTLINED_FUNCTION_132();
  v70 = v64;
  LOBYTE(v64) = (_BYTE)v73;
  sub_1B117E8BC(v69, v70, (char)v73, v65);
  sub_1B117F494(v59, &qword_1EEF10CD8);
  OUTLINED_FUNCTION_12_0(v68);
  v71 = OUTLINED_FUNCTION_132();
  sub_1B117E90C(v71, v90, v64, v89);
  v92 = v85;
  v93 = v86;
  v94 = (char)v81;
  *(_DWORD *)v95 = *(_DWORD *)v117;
  *(_DWORD *)&v95[3] = *(_DWORD *)&v117[3];
  v96 = v87;
  v97 = v84;
  *(_DWORD *)v98 = *(_DWORD *)v116;
  *(_DWORD *)&v98[3] = *(_DWORD *)&v116[3];
  v99 = v1;
  v100 = v2;
  v101 = v3;
  v102 = v4;
  v103 = v74;
  *(_DWORD *)&v104[3] = *(_DWORD *)&v114[3];
  *(_DWORD *)v104 = *(_DWORD *)v114;
  v105 = v83;
  *(_DWORD *)&v106[3] = *(_DWORD *)&v113[3];
  *(_DWORD *)v106 = *(_DWORD *)v113;
  v107 = v32;
  v108 = v34;
  v109 = v36;
  v110 = v38;
  v111 = (char)v79;
  sub_1B117E95C((uint64_t)&v92);
  OUTLINED_FUNCTION_23_2();
}

void sub_1B117B218(_QWORD *a1@<X0>, void *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
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
  void *v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(void);
  uint64_t (*v48)(void);
  _QWORD *v49;
  void (*v50)(_QWORD *);
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t *v53;
  char *v54;
  uint64_t v55;
  char **p_types;
  uint64_t (*v57)(void);
  uint64_t v58;
  uint64_t (*v59)(void);
  uint64_t v60;
  void *v61;
  uint64_t *v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char **v89;
  void (*v90)(_QWORD *, _QWORD, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t *, uint64_t);
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  id v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char **v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned int v123;
  void *v124;
  void *v125;
  __int16 v126;
  char v127;

  v123 = a3;
  v115 = a1;
  v110 = a4;
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v14);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10CF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10D00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_4();
  v109 = v18;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_55(v20);
  v122 = sub_1B11BAAE0();
  v117 = *(_QWORD **)(v122 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_17_0();
  v22 = sub_1B11BAD5C();
  v114 = *(_QWORD *)(v22 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_57();
  v26 = v25 - v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED380E48);
  v113 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_37();
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D10);
  v116 = *(_QWORD *)(v120 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_7();
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D18);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_102();
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D20);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_57();
  v34 = v33 - v32;
  v121 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10D28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v35);
  v112 = (char *)&v88 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_55(v38);
  v39 = OUTLINED_FUNCTION_136();
  v40 = v115;
  *(_QWORD *)(v39 + 16) = v115;
  *(_QWORD *)(v39 + 24) = a2;
  v41 = v123;
  *(_BYTE *)(v39 + 32) = v123 & 1;
  *(_BYTE *)(v39 + 33) = BYTE1(v41) & 1;
  *(_BYTE *)(v39 + 34) = BYTE2(v41) & 1;
  v124 = v40;
  v125 = a2;
  v98 = v41 & 1;
  v126 = v41 & 0x101;
  v97 = (v41 >> 8) & 1;
  v127 = BYTE2(v41) & 1;
  v115 = v40;
  v99 = a2;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380DA0);
  v43 = sub_1B117EA98();
  v101 = v42;
  v100 = v43;
  sub_1B11BB26C();
  sub_1B11BAD50();
  sub_1B117F464((uint64_t)&unk_1ED380E40);
  v45 = v44;
  sub_1B117CB38((uint64_t)&unk_1ED380DA8);
  v91 = v45;
  v96 = v46;
  sub_1B11BB0E0();
  v47 = *(uint64_t (**)(void))(v114 + 8);
  v104 = v26;
  v114 = v22;
  OUTLINED_FUNCTION_100_0(v47);
  v48 = *(uint64_t (**)(void))(v113 + 8);
  v102 = v4;
  v113 = v27;
  OUTLINED_FUNCTION_100_0(v48);
  v49 = v117;
  v50 = (void (*)(_QWORD *))v117[13];
  v95 = *MEMORY[0x1E0CD8750];
  v51 = v122;
  v50(v7);
  KeyPath = swift_getKeyPath();
  v53 = (uint64_t *)(v6 + *(int *)(v118 + 36));
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380E00);
  v54 = (char *)v53 + *(int *)(v93 + 28);
  v94 = (void (*)(char *, uint64_t *, uint64_t))v49[2];
  v94(v54, v7, v51);
  *v53 = KeyPath;
  v55 = v116;
  p_types = *(char ***)(v116 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))p_types)(v6, v5, v120);
  v57 = (uint64_t (*)(void))v49[1];
  v117 = v7;
  v58 = (uint64_t)v112;
  OUTLINED_FUNCTION_100_0(v57);
  v59 = *(uint64_t (**)(void))(v55 + 8);
  v60 = v111;
  v92 = v5;
  OUTLINED_FUNCTION_100_0(v59);
  sub_1B11BAFA8();
  v61 = sub_1B1175794();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8();
  v62 = &qword_1EEF10D18;
  OUTLINED_FUNCTION_95(v6, v34);
  OUTLINED_FUNCTION_15_1(v34 + *(int *)(v119 + 36));
  v103 = v6;
  OUTLINED_FUNCTION_105(v6);
  sub_1B11BAFB4();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_8();
  sub_1B117F254(v34, v58, &qword_1EEF10D20);
  OUTLINED_FUNCTION_15_1(v58 + *(int *)(v121 + 36));
  v116 = v34;
  v63 = v34;
  v64 = v123;
  sub_1B117F494(v63, &qword_1EEF10D20);
  sub_1B117F224(v58, v60, (uint64_t *)&unk_1EEF10D28);
  if ((v64 & 0x10000) != 0)
  {
    v90 = (void (*)(_QWORD *, _QWORD, uint64_t))v50;
    v66 = v115;
    v67 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v115) + 0x198))();
    if (v67)
    {
      v89 = p_types;
      p_types = &stru_1E62DBFF8.types;
      v68 = (uint64_t)objc_msgSend(v67, sel_respondsToSelector_, sel_suggestionDismissAction);
      if ((v68 & 1) != 0)
      {
        p_types = (char **)OUTLINED_FUNCTION_113_0(v68, sel_suggestionDismissAction);
        OUTLINED_FUNCTION_22_1();
        if (p_types)
        {
          v69 = objc_msgSend(p_types, sel_title);

          v70 = sub_1B11BB3C8();
          v72 = v71;

          v73 = OUTLINED_FUNCTION_136();
          v74 = v99;
          *(_QWORD *)(v73 + 16) = v66;
          *(_QWORD *)(v73 + 24) = v74;
          *(_BYTE *)(v73 + 32) = v98;
          *(_BYTE *)(v73 + 33) = v97;
          *(_BYTE *)(v73 + 34) = (v64 & 0x10000) >> 16;
          MEMORY[0x1E0C80A78](v73);
          *(&v88 - 2) = v70;
          *(&v88 - 1) = v72;
          v75 = v66;
          v76 = v74;
          sub_1B11BB26C();
          swift_bridgeObjectRelease();
          sub_1B11BAD50();
          v77 = v92;
          sub_1B11BB0E0();
          OUTLINED_FUNCTION_83_0((uint64_t)&v125);
          OUTLINED_FUNCTION_83_0((uint64_t)&v124);
          v62 = v117;
          v78 = v122;
          v90(v117, v95, v122);
          v79 = swift_getKeyPath();
          v80 = v103;
          v81 = (uint64_t *)(v103 + *(int *)(v118 + 36));
          v94((char *)v81 + *(int *)(v93 + 28), v62, v78);
          *v81 = v79;
          ((void (*)(uint64_t, uint64_t, uint64_t))v89)(v80, v77, v120);
          OUTLINED_FUNCTION_83_0((uint64_t)&v122);
          OUTLINED_FUNCTION_83_0((uint64_t)&v121);
          sub_1B11BAFA8();
          OUTLINED_FUNCTION_68();
          OUTLINED_FUNCTION_8();
          v82 = v116;
          OUTLINED_FUNCTION_116(v80, v116);
          OUTLINED_FUNCTION_15_1(v82 + *(int *)(v119 + 36));
          OUTLINED_FUNCTION_75(v80);
          sub_1B11BAFB4();
          OUTLINED_FUNCTION_68();
          OUTLINED_FUNCTION_8();
          OUTLINED_FUNCTION_116(v82, v58);
          OUTLINED_FUNCTION_15_1(v58 + *(int *)(v121 + 36));
          OUTLINED_FUNCTION_75(v82);
          LOBYTE(v82) = sub_1B11BAFD8();
          sub_1B11757A0();
          OUTLINED_FUNCTION_25_1();
          OUTLINED_FUNCTION_8();
          p_types = v105;
          OUTLINED_FUNCTION_21(v58, (uint64_t)v105);
          v83 = v107;
          v84 = (char *)p_types + *(int *)(v107 + 36);
          *v84 = v82;
          *((_QWORD *)v84 + 1) = v8;
          *((_QWORD *)v84 + 2) = v9;
          *((_QWORD *)v84 + 3) = v10;
          *((_QWORD *)v84 + 4) = v11;
          v84[40] = 0;
          OUTLINED_FUNCTION_12_0(v58);
          v85 = v106;
          sub_1B117F224((uint64_t)p_types, v106, &qword_1EEF10CF0);
          OUTLINED_FUNCTION_13_1();
LABEL_9:
          __swift_storeEnumTagSinglePayload(v85, v86, 1, v83);
          sub_1B117F224(v85, (uint64_t)v62, &qword_1EEF10CF8);
          v65 = 0;
          goto LABEL_10;
        }
      }
      else
      {
        OUTLINED_FUNCTION_22_1();
      }
    }
    OUTLINED_FUNCTION_13_1();
    v83 = v107;
    v85 = v106;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_13_1();
LABEL_10:
  OUTLINED_FUNCTION_127_0((uint64_t)v62, v65);
  OUTLINED_FUNCTION_94(v60, v58);
  OUTLINED_FUNCTION_21((uint64_t)v62, (uint64_t)v61);
  OUTLINED_FUNCTION_94(v58, (uint64_t)p_types);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D38);
  OUTLINED_FUNCTION_21((uint64_t)v61, (uint64_t)p_types + *(int *)(v87 + 48));
  OUTLINED_FUNCTION_12_0((uint64_t)v62);
  OUTLINED_FUNCTION_128(v60);
  OUTLINED_FUNCTION_12_0((uint64_t)v61);
  OUTLINED_FUNCTION_128(v58);
  OUTLINED_FUNCTION_35();
}

void sub_1B117BB68()
{
  sub_1B117A824();
}

uint64_t sub_1B117BB9C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sub_1B11BB20C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_38_0();
  sub_1B1176C8C(a1);
  if (v5)
  {
    v6 = v5;
    sub_1B11BB1F4();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, *MEMORY[0x1E0CDF6F8], v3);
    sub_1B11BB230();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    v7 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    objc_msgSend(v7, sel_userInterfaceIdiom);

    sub_1B1175620();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109F8);
    v8 = sub_1B117CEE4();
    OUTLINED_FUNCTION_101(v8, v8);
    swift_release();

    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109F0);
    return OUTLINED_FUNCTION_62(v9);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF109F0);
    v11 = OUTLINED_FUNCTION_108();
    return __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
  }
}

uint64_t sub_1B117BD48()
{
  _QWORD **v0;

  return sub_1B117BB9C(*v0);
}

uint64_t sub_1B117BD54(_QWORD *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1B1176BB0(a1);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)nullsub_1(v2);
    v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    objc_msgSend(v4, sel_userInterfaceIdiom);

    sub_1B1175620();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A50);
    v5 = sub_1B117D074();
    OUTLINED_FUNCTION_101(v5, v5);

    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A48);
    return OUTLINED_FUNCTION_62(v6);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A48);
    v8 = OUTLINED_FUNCTION_108();
    return __swift_storeEnumTagSinglePayload(v8, v9, v10, v11);
  }
}

uint64_t sub_1B117BE60()
{
  _QWORD **v0;

  return sub_1B117BD54(*v0);
}

void sub_1B117BE6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A78);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A80);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_36();
  if ((sub_1B1176E24() & 1) != 0)
    sub_1B117565C();
  else
    sub_1B1175614();
  sub_1B11BB32C();
  OUTLINED_FUNCTION_34_0();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10A88);
  OUTLINED_FUNCTION_47_0(v3);
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_129(v4, v5, &qword_1EEF10A80);
  swift_storeEnumTagMultiPayload();
  sub_1B117D188();
  sub_1B11BAE88();
  sub_1B117F494(v0, &qword_1EEF10A80);
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B117BFA4()
{
  return sub_1B11BAB28();
}

uint64_t sub_1B117BFC0()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_linkColor);
  result = MEMORY[0x1B5E17248](v0);
  qword_1EEF13880 = result;
  return result;
}

void sub_1B117BFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v6 = v5;
  v13 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AA0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AA8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_103_0();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AB0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_102();
  if ((v6 & 1) != 0 && v4 == 6)
  {
    sub_1B11BAB04();
    sub_1B117F464((uint64_t)&unk_1EEF10AB8);
    sub_1B11BB110();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v1, v2, v11);
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_82_0();
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v11);
  }
  else
  {
    OUTLINED_FUNCTION_72(v0, v13);
    OUTLINED_FUNCTION_72(v1, v0);
    OUTLINED_FUNCTION_54();
    sub_1B117F464((uint64_t)&unk_1EEF10AB8);
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_82_0();
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v8);
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B117C1C0()
{
  sub_1B117BFFC();
}

void sub_1B117C1CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v6 = v5;
  v13 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AC0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_103_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_36();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10AD0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_17_0();
  if ((v6 & 1) != 0 && v4 == 6)
  {
    OUTLINED_FUNCTION_72(v2, v13);
    *(_WORD *)(v2 + *(int *)(v11 + 36)) = 256;
    OUTLINED_FUNCTION_95(v2, v0);
    OUTLINED_FUNCTION_42_0();
    sub_1B117D20C();
    sub_1B117F464((uint64_t)&unk_1EEF10AE0);
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_105(v2);
  }
  else
  {
    OUTLINED_FUNCTION_72(v1, v13);
    OUTLINED_FUNCTION_72(v0, v1);
    OUTLINED_FUNCTION_54();
    sub_1B117D20C();
    sub_1B117F464((uint64_t)&unk_1EEF10AE0);
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_97(v1, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B117C344()
{
  sub_1B117C1CC();
}

void sub_1B117C350(char a1, uint64_t a2, uint64_t a3)
{
  sub_1B117C35C(a1, a2, a3, (uint64_t)&unk_1E62D4FE8);
}

void sub_1B117C35C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;
  _BYTE v10[8];
  id v11;

  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  v10[0] = a1;
  v11 = v9;
  MEMORY[0x1B5E17224](v10, a2, a4, a3);
  OUTLINED_FUNCTION_131();
}

void sub_1B117C3FC(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_1B117C42C();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1B117C434@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void sub_1B117C45C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117C490@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B11BAC84();
  *a1 = result;
  return result;
}

uint64_t sub_1B117C4B8()
{
  swift_retain();
  return sub_1B11BAC90();
}

unint64_t sub_1B117C4E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B117C5B0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B1177908((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B1177908((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_1B117C5B0(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1B117C6AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_1B11BB548();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1B117C6AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B117C740(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1B117C83C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1B117C83C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B117C740(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1B117C7D8(v2, 0);
      result = sub_1B11BB530();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_1B11BB410();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B117C7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED381AF0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1B117C83C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED381AF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v8] <= v12)
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B117C924()
{
  return sub_1B11BAC48();
}

void sub_1B117C944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B117C958(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD8760], MEMORY[0x1E0CDA508]);
}

void sub_1B117C958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B117C9CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1B11BACE4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B117C9FC()
{
  return sub_1B11BACF0();
}

uint64_t sub_1B117CA28(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_suggestions);

  if (!v2)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v3 = sub_1B11BB440();

  return v3;
}

uint64_t sub_1B117CA90(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_1B117CAB8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_1B117CAEC()
{
  sub_1B1177F7C();
}

uint64_t sub_1B117CAF4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  v3 = v2;
  swift_retain();
  return a1;
}

void sub_1B117CB38(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

unint64_t sub_1B117CB68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF10910;
  if (!qword_1EEF10910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF108F8);
    v2[0] = sub_1B117CBD4();
    v2[1] = sub_1B117CDE0();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10910);
  }
  return result;
}

unint64_t sub_1B117CBD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF10918;
  if (!qword_1EEF10918)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10920);
    v2[0] = sub_1B117CC40();
    v2[1] = sub_1B117CD00();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10918);
  }
  return result;
}

unint64_t sub_1B117CC40()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10928;
  if (!qword_1EEF10928)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10930);
    v2 = sub_1B117CCC4();
    sub_1B117F464((uint64_t)&unk_1EEF10940);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10928);
  }
  return result;
}

unint64_t sub_1B117CCC4()
{
  unint64_t result;

  result = qword_1EEF10938;
  if (!qword_1EEF10938)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BD9F8, &unk_1E62D4E40);
    atomic_store(result, (unint64_t *)&qword_1EEF10938);
  }
  return result;
}

unint64_t sub_1B117CD00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_1EEF10950;
  if (!qword_1EEF10950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10958);
    v4[2] = &unk_1E62D6578;
    v4[3] = sub_1B117CDA4();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B117F464((uint64_t)&unk_1EEF10968);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10950);
  }
  return result;
}

unint64_t sub_1B117CDA4()
{
  unint64_t result;

  result = qword_1EEF10960;
  if (!qword_1EEF10960)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF5B0, &unk_1E62D6578);
    atomic_store(result, (unint64_t *)&qword_1EEF10960);
  }
  return result;
}

unint64_t sub_1B117CDE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF10978;
  if (!qword_1EEF10978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10980);
    sub_1B117CB38((uint64_t)&unk_1EEF10988);
    v3 = v2;
    sub_1B117F464((uint64_t)&unk_1EEF10940);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF10978);
  }
  return result;
}

uint64_t type metadata accessor for SGSuggestionsTableCell(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382BA0);
}

uint64_t type metadata accessor for SectionName(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED383000);
}

uint64_t sub_1B117CEA4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B117CED4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_1B117CEE4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF10A00;
  if (!qword_1EEF10A00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF109F8);
    sub_1B117F274((uint64_t)&unk_1EEF10A08);
    v3[0] = v2;
    v3[1] = sub_1B117D038();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF10A00);
  }
  return result;
}

unint64_t sub_1B117CF70()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF10A18;
  if (!qword_1EEF10A18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10A20);
    sub_1B117EF60((uint64_t)&unk_1EEF10A28);
    v3[0] = v2;
    v3[1] = sub_1B117CFFC();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF10A18);
  }
  return result;
}

unint64_t sub_1B117CFFC()
{
  unint64_t result;

  result = qword_1EEF10A38;
  if (!qword_1EEF10A38)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BDB88, &unk_1E62D5068);
    atomic_store(result, (unint64_t *)&qword_1EEF10A38);
  }
  return result;
}

unint64_t sub_1B117D038()
{
  unint64_t result;

  result = qword_1EEF10A40;
  if (!qword_1EEF10A40)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BDAE8, &unk_1E62D4F70);
    atomic_store(result, (unint64_t *)&qword_1EEF10A40);
  }
  return result;
}

unint64_t sub_1B117D074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF10A58;
  if (!qword_1EEF10A58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10A50);
    v2[0] = sub_1B117D0E0();
    v2[1] = sub_1B117CFFC();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10A58);
  }
  return result;
}

unint64_t sub_1B117D0E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF10A60;
  if (!qword_1EEF10A60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10A68);
    v2[0] = sub_1B117D14C();
    v2[1] = sub_1B117D038();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10A60);
  }
  return result;
}

unint64_t sub_1B117D14C()
{
  unint64_t result;

  result = qword_1EEF10A70;
  if (!qword_1EEF10A70)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE700, &unk_1E62D5898);
    atomic_store(result, (unint64_t *)&qword_1EEF10A70);
  }
  return result;
}

unint64_t sub_1B117D188()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF10A90;
  if (!qword_1EEF10A90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10A80);
    sub_1B117F464((uint64_t)&unk_1EEF10A98);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF10A90);
  }
  return result;
}

unint64_t sub_1B117D20C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF10AD8;
  if (!qword_1EEF10AD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10AD0);
    sub_1B117F464((uint64_t)&unk_1EEF10AE0);
    v3 = v2;
    sub_1B117F464((uint64_t)&unk_1EEF10AE8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF10AD8);
  }
  return result;
}

uint64_t sub_1B117D2A8()
{
  return OUTLINED_FUNCTION_2_0();
}

void sub_1B117D2B4()
{
  sub_1B117CB38((uint64_t)&unk_1EEF10AF8);
}

uint64_t sub_1B117D2E0()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D2EC()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D2F8()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D304()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D310()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D31C()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D328()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B117D334()
{
  return OUTLINED_FUNCTION_2_0();
}

void initializeBufferWithCopyOfBuffer for SGSuggestionTableControllerRepresentable(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117D36C(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return OUTLINED_FUNCTION_63();
}

void sub_1B117D398(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  v5 = v4;
  swift_retain();
  OUTLINED_FUNCTION_5();
}

void sub_1B117D3F0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  OUTLINED_FUNCTION_111(a1, a2);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(void **)(v2 + 16);
  v6 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v5;
  v7 = v5;

  *(_BYTE *)(v3 + 24) = *(_BYTE *)(v2 + 24);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v2 + 48);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_5();
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void sub_1B117D488(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_111(a1, a2);
  swift_bridgeObjectRelease();
  v4 = *(void **)(v3 + 16);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);

  *(_BYTE *)(v3 + 24) = *(_BYTE *)(v2 + 24);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v2 + 48);
  swift_release();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117D4DC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

uint64_t sub_1B117D518(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_119(result, a2);
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      return OUTLINED_FUNCTION_119(result, a2);
  }
  return result;
}

void type metadata accessor for SGListView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B117D568(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    *a1 = *a2;
    OUTLINED_FUNCTION_67_0();
  }
  else
  {
    v5 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_19_2(v5);
    OUTLINED_FUNCTION_115((_QWORD *)((char *)a2 + *(int *)(a3 + 20)));
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B117D5C4(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_27_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

void sub_1B117D608()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_32_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16));
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_115(v2);
  OUTLINED_FUNCTION_5();
}

void sub_1B117D644()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v1 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_32_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 24));
  OUTLINED_FUNCTION_89();
  *v3 = *v2;
  v3[1] = v2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5();
}

void sub_1B117D698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_32_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  *(_OWORD *)(v2 + *(int *)(v0 + 20)) = *(_OWORD *)(v1 + *(int *)(v0 + 20));
  OUTLINED_FUNCTION_5();
}

void sub_1B117D6D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_32_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 40));
  OUTLINED_FUNCTION_89();
  v3 = *v2;
  v4 = v2[1];
  *v5 = v3;
  v5[1] = v4;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B117D720()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B117D72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_27_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_49(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_122_0(*(_QWORD *)(a1 + *(int *)(a3 + 20) + 8));
    OUTLINED_FUNCTION_5();
  }
}

uint64_t sub_1B117D788()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B117D794(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_27_1();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    OUTLINED_FUNCTION_50(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_5();
  }
}

uint64_t sub_1B117D7F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BA99C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1B117D868(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_41();
}

uint64_t OUTLINED_FUNCTION_186()
{
  return swift_bridgeObjectRelease();
}

void sub_1B117D898(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_41();
}

void sub_1B117D8D0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117D8FC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
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
  return OUTLINED_FUNCTION_92(v2);
}

uint64_t sub_1B117D938(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_119(result, a2);
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      return OUTLINED_FUNCTION_119(result, a2);
  }
  return result;
}

void type metadata accessor for SectionHeader()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B117D978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  if ((v4 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_67_0();
  }
  else
  {
    v6 = *(void **)(a2 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
    v7 = v5;
    v8 = v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
    if (OUTLINED_FUNCTION_39() == 1)
    {
      v9 = OUTLINED_FUNCTION_26_1();
      OUTLINED_FUNCTION_18_0(v9);
    }
    else
    {
      OUTLINED_FUNCTION_61_1();
    }
    swift_storeEnumTagMultiPayload();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B117DA24(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_85_0(a1);

  v3 = v2 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
  if (OUTLINED_FUNCTION_118() != 1)
    return OUTLINED_FUNCTION_63();
  v4 = OUTLINED_FUNCTION_26_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

void sub_1B117DA88(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;

  v2 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v2;
  OUTLINED_FUNCTION_107((uint64_t)a1, (uint64_t)a2);
  v4 = v3;
  v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
  if (OUTLINED_FUNCTION_39() == 1)
  {
    v6 = OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_18_0(v6);
  }
  else
  {
    OUTLINED_FUNCTION_61_1();
  }
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_5();
}

void sub_1B117DAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  OUTLINED_FUNCTION_46();
  if (!v12)
  {
    OUTLINED_FUNCTION_75(a1 + *(int *)(a3 + 28));
    OUTLINED_FUNCTION_130_0();
    if (OUTLINED_FUNCTION_39() == 1)
    {
      v13 = OUTLINED_FUNCTION_26_1();
      OUTLINED_FUNCTION_18_0(v13);
    }
    else
    {
      OUTLINED_FUNCTION_61_1();
    }
    OUTLINED_FUNCTION_112();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1B117DB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    v2 = OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_48(v2);
    OUTLINED_FUNCTION_54();
  }
  else
  {
    OUTLINED_FUNCTION_79();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1B117DC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char v7;
  uint64_t v8;

  OUTLINED_FUNCTION_98((void **)a1, (void **)a2);
  v6 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  OUTLINED_FUNCTION_46();
  if (!v7)
  {
    OUTLINED_FUNCTION_125(a1 + *(int *)(a3 + 28));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
    if (OUTLINED_FUNCTION_90() == 1)
    {
      v8 = OUTLINED_FUNCTION_26_1();
      OUTLINED_FUNCTION_48(v8);
      OUTLINED_FUNCTION_54();
    }
    else
    {
      OUTLINED_FUNCTION_79();
    }
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B117DCA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B117DCB0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_122_0(*a1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10B80);
    OUTLINED_FUNCTION_49((uint64_t)a1 + *(int *)(a3 + 28), a2, v6);
  }
}

uint64_t sub_1B117DD0C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B117DD18(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10B80);
    OUTLINED_FUNCTION_50((uint64_t)a1 + *(int *)(a4 + 28), a2, a2, v7);
  }
}

void sub_1B117DD78()
{
  unint64_t v0;

  sub_1B117DDFC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1B117DDFC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEF10BE0)
  {
    sub_1B11BAB94();
    v0 = sub_1B11BAAEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEF10BE0);
  }
}

void sub_1B117DE50(_QWORD *a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v2;
  OUTLINED_FUNCTION_107((uint64_t)a1, (uint64_t)a2);
  v4 = v3;
  v5 = v2;
  OUTLINED_FUNCTION_41();
}

void sub_1B117DE80(id *a1)
{

}

void sub_1B117DEA8(void **a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  OUTLINED_FUNCTION_51(a1, a2);

  v5 = *(void **)(v2 + 8);
  v6 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v5;
  v7 = v5;

  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_5();
}

__n128 __swift_memcpy19_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

void sub_1B117DEF4(id *a1)
{
  _OWORD *v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_85_0(a1);
  v3 = *(void **)(v2 + 8);
  *(_OWORD *)v2 = *v1;

  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117DF20(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 19))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

_QWORD *sub_1B117DF5C(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *((_BYTE *)result + 18) = 0;
    *((_WORD *)result + 8) = 0;
    *result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0)
      *((_BYTE *)result + 19) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_120_0(result, a2);
    }
    *((_BYTE *)result + 19) = 0;
    if (a2)
      return OUTLINED_FUNCTION_120_0(result, a2);
  }
  return result;
}

void type metadata accessor for SGSuggestionsCustomizationBTableCell()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for ImageView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B117DFB8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = v2;
  OUTLINED_FUNCTION_41();
}

void sub_1B117DFE8(id *a1)
{

}

void sub_1B117DFF0(void **a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_51(a1, a2);

  *(_BYTE *)(v3 + 8) = *(_BYTE *)(v2 + 8);
  OUTLINED_FUNCTION_5();
}

void sub_1B117E01C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_98((void **)a1, (void **)a2);
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B117E048(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 9))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

_QWORD *sub_1B117E084(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *((_BYTE *)result + 8) = 0;
    *result = a2 ^ 0x80000000;
    if (a3 < 0)
      *((_BYTE *)result + 9) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_120_0(result, a2);
    }
    *((_BYTE *)result + 9) = 0;
    if (a2)
      return OUTLINED_FUNCTION_120_0(result, a2);
  }
  return result;
}

void type metadata accessor for ImageSGView()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for ImageSizeModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for CustomizationBCellModifier()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B117E0E8(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[16])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
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

uint64_t sub_1B117E134(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for ImageClipShapeModifier()
{
  OUTLINED_FUNCTION_29();
}

unint64_t sub_1B117E184()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EEF10C18;
  if (!qword_1EEF10C18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10C20);
    v2 = sub_1B117CB68();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDFEE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10C18);
  }
  return result;
}

uint64_t sub_1B117E1E8()
{
  return OUTLINED_FUNCTION_2_0();
}

void sub_1B117E224()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF109A8);
  sub_1B11BAC00();
  sub_1B117F464((uint64_t)&unk_1EEF109B8);
  sub_1B117CB38((uint64_t)&unk_1EEF109C0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_81();
}

unint64_t sub_1B117E2B8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10C28;
  if (!qword_1EEF10C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEF109E0);
    v2 = sub_1B117E33C();
    sub_1B117F464((uint64_t)&unk_1ED380C40);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10C28);
  }
  return result;
}

unint64_t sub_1B117E33C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF10C30;
  if (!qword_1EEF10C30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF109D0);
    sub_1B117F464((uint64_t)&unk_1EEF10C38);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CDA228];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF10C30);
  }
  return result;
}

void sub_1B117E3C0()
{
  sub_1B117E428((uint64_t)&unk_1EEF10C48);
}

void sub_1B117E3F4()
{
  sub_1B117E428((uint64_t)&unk_1EEF10C58);
}

void sub_1B117E428(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[3];

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v5 = OUTLINED_FUNCTION_44(0, v4);
    v6[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v6[2] = v2();
    v6[0] = OUTLINED_FUNCTION_2_0();
    atomic_store(MEMORY[0x1B5E17C68](MEMORY[0x1E0CE0798], v5, v6), v1);
  }
  OUTLINED_FUNCTION_81();
}

unint64_t sub_1B117E498()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF10C68;
  if (!qword_1EEF10C68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10C70);
    v2[0] = sub_1B117D188();
    v2[1] = v2[0];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF10C68);
  }
  return result;
}

unint64_t sub_1B117E500()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_1EEF10C78;
  if (!qword_1EEF10C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10C80);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10AA0);
    sub_1B117F464((uint64_t)&unk_1EEF10AB8);
    v4 = v3;
    v5[2] = v2;
    v5[3] = v3;
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF10C78);
  }
  return result;
}

unint64_t sub_1B117E5B4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10C88;
  if (!qword_1EEF10C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10C90);
    v2 = sub_1B117D20C();
    sub_1B117F464((uint64_t)&unk_1EEF10AE0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10C88);
  }
  return result;
}

void sub_1B117E638(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D4FE8, (uint64_t (*)(void))sub_1B117E64C);
}

unint64_t sub_1B117E64C()
{
  unint64_t result;

  result = qword_1EEF10C98;
  if (!qword_1EEF10C98)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BDB38, &unk_1E62D4FE8);
    atomic_store(result, (unint64_t *)&qword_1EEF10C98);
  }
  return result;
}

void get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v4 = *(_QWORD *)(a1 + 8);
  v5 = sub_1B11BABB8();
  v6[0] = v4;
  v6[1] = a3();
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v5, v6);
  OUTLINED_FUNCTION_45_0();
}

void type metadata accessor for UIUserInterfaceIdiom()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED3818C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED3818C0);
  }
}

double sub_1B117E720(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 65280;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 129) = 0u;
  return result;
}

id sub_1B117E750(int a1, int a2, int a3, id a4, __int16 a5)
{
  id result;

  if ((~a5 & 0xFF00) != 0)
    return a4;
  return result;
}

uint64_t sub_1B117E774(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char);
  char v5;

  v2 = OUTLINED_FUNCTION_77(a1);
  v5 = *(_BYTE *)(v1 + 144);
  v3(v2, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136), v5);
  return v1;
}

void sub_1B117E7D4(int a1, int a2, int a3, id a4, __int16 a5)
{
  if ((~a5 & 0xFF00) != 0)

}

unint64_t sub_1B117E7F8()
{
  unint64_t result;

  result = qword_1EEF10CC8;
  if (!qword_1EEF10CC8)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BDA98, &unk_1E62D4F48);
    atomic_store(result, (unint64_t *)&qword_1EEF10CC8);
  }
  return result;
}

unint64_t sub_1B117E834()
{
  unint64_t result;

  result = qword_1EEF10CD0;
  if (!qword_1EEF10CD0)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BDA48, &unk_1E62D4EC8);
    atomic_store(result, (unint64_t *)&qword_1EEF10CD0);
  }
  return result;
}

uint64_t sub_1B117E870(uint64_t a1)
{
  sub_1B117E8AC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B117E8AC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1B117E8BC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_1B117E8DC(result, a2, a3, a4);
  return result;
}

uint64_t sub_1B117E8DC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B117E8AC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B117E90C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_1B117E92C(result, a2, a3, a4);
  return result;
}

uint64_t sub_1B117E92C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B117CED4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B117E95C(uint64_t a1)
{
  sub_1B117CED4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B117E998()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B117E9C4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = (void *)OUTLINED_FUNCTION_40_0(**(_QWORD **)(v0 + 16));
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_suggestionPrimaryAction);
    objc_msgSend(v2, sel_execute);

    OUTLINED_FUNCTION_65();
  }
  else
  {
    OUTLINED_FUNCTION_41();
  }
}

void sub_1B117EA2C()
{
  uint64_t v0;
  uint64_t KeyPath;

  OUTLINED_FUNCTION_123(**(_QWORD **)(v0 + 16));
  sub_1B1176EC8();
  sub_1B11BB0BC();
  OUTLINED_FUNCTION_135();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_53(KeyPath);
  OUTLINED_FUNCTION_59();
}

unint64_t sub_1B117EA98()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED380D98;
  if (!qword_1ED380D98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380DA0);
    sub_1B117F464((uint64_t)&unk_1ED381790);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED380D98);
  }
  return result;
}

void sub_1B117EB1C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t inited;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 16)) + 0x198))();
  if (v2)
  {
    v3 = (uint64_t)objc_msgSend(v2, sel_respondsToSelector_, sel_suggestionDismissAction);
    if ((v3 & 1) != 0)
    {
      v4 = OUTLINED_FUNCTION_113_0(v3, sel_suggestionDismissAction);
      objc_msgSend(v4, sel_execute);

    }
    OUTLINED_FUNCTION_22_1();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B11BD870;
  v6 = (uint64_t *)sub_1B1198478();
  v8 = *v6;
  v7 = v6[1];
  *(_QWORD *)(inited + 32) = v8;
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  v9 = (uint64_t *)sub_1B1198484();
  v11 = *v9;
  v10 = v9[1];
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 64) = v10;
  *(_QWORD *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  v12 = sub_1B11BB374();
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1B119846C();
  swift_bridgeObjectRetain();
  v14 = (void *)sub_1B11BB398();
  OUTLINED_FUNCTION_121();
  v15 = sub_1B117A308(v12);
  OUTLINED_FUNCTION_87();
  sub_1B117ECEC((uint64_t)v14, v1, v15, v13);

  OUTLINED_FUNCTION_69();
}

void sub_1B117EC8C()
{
  uint64_t KeyPath;

  sub_1B1176EC8();
  OUTLINED_FUNCTION_114();
  sub_1B11BB0BC();
  OUTLINED_FUNCTION_135();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_53(KeyPath);
  OUTLINED_FUNCTION_59();
}

void sub_1B117ECEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = (id)sub_1B11BB35C();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);

}

_OWORD *sub_1B117ED74(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B117ED84()
{
  return swift_release();
}

uint64_t sub_1B117ED90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SGSuggestionsTableCell(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B117EDD4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_137();
  v2 = (void *)OUTLINED_FUNCTION_40_0(**(_QWORD **)(v0 + v1));
  if (v2)
  {
    v3 = objc_msgSend(v2, sel_suggestionPrimaryAction);
    objc_msgSend(v3, sel_execute);

    OUTLINED_FUNCTION_65();
  }
  else
  {
    OUTLINED_FUNCTION_41();
  }
}

void sub_1B117EE48()
{
  sub_1B1179DF4();
}

unint64_t sub_1B117EE50()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10D90;
  if (!qword_1EEF10D90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEF11A00);
    v2 = sub_1B117EED4();
    sub_1B117F464((uint64_t)&unk_1EEF11A30);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10D90);
  }
  return result;
}

unint64_t sub_1B117EED4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11A10;
  if (!qword_1EEF11A10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEF10DA0);
    sub_1B117EF60((uint64_t)&unk_1EEF11A20);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11A10);
  }
  return result;
}

void sub_1B117EF60(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[2];

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v5 = OUTLINED_FUNCTION_44(0, v4);
    v6[0] = v3;
    v6[1] = v2;
    atomic_store(MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v5, v6), v1);
  }
  OUTLINED_FUNCTION_45_0();
}

uint64_t objectdestroy_28Tm()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SGSuggestionsTableCell(0) - 8) + 80);
  v2 = (id *)(v0 + ((v1 + 16) & ~v1));

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10990);
  if (OUTLINED_FUNCTION_118() == 1)
  {
    v3 = OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_28(v3);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_1B117F044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t inited;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_137();
  v2 = v0 + v1;
  v3 = (void *)OUTLINED_FUNCTION_40_0(**(_QWORD **)(v0 + v1));
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_suggestionDismissAction) & 1) != 0)
    {
      v5 = objc_msgSend(v4, sel_suggestionDismissAction);
      objc_msgSend(v5, sel_execute);

    }
    swift_unknownObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B11BD870;
  v7 = (uint64_t *)sub_1B1198478();
  v9 = *v7;
  v8 = v7[1];
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(inited + 40) = v8;
  *(_QWORD *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  v10 = (uint64_t *)sub_1B1198484();
  v12 = *v10;
  v11 = v10[1];
  *(_QWORD *)(inited + 56) = v12;
  *(_QWORD *)(inited + 64) = v11;
  *(_QWORD *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  v13 = sub_1B11BB374();
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1B119846C();
  swift_bridgeObjectRetain();
  v15 = (void *)sub_1B11BB398();
  OUTLINED_FUNCTION_96();
  v16 = *(_QWORD *)(v2 + 8);
  v17 = sub_1B117A308(v13);
  OUTLINED_FUNCTION_13_0();
  sub_1B117ECEC((uint64_t)v15, v16, v17, v14);

  OUTLINED_FUNCTION_69();
}

void sub_1B117F1C4()
{
  sub_1B117A6A8();
}

void sub_1B117F1D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_19_2(v3);
  OUTLINED_FUNCTION_41();
}

void sub_1B117F1FC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_28(v2);
  OUTLINED_FUNCTION_41();
}

void sub_1B117F224(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_84(a1, a2, a3);
  OUTLINED_FUNCTION_32_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  OUTLINED_FUNCTION_41();
}

void sub_1B117F254(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_84(a1, a2, a3);
  OUTLINED_FUNCTION_19_2(v3);
  OUTLINED_FUNCTION_41();
}

void sub_1B117F274(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[2];

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v5 = OUTLINED_FUNCTION_44(0, v4);
    v6[0] = v3();
    v6[1] = v2;
    atomic_store(MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v5, v6), v1);
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B117F2C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10E58;
  if (!qword_1EEF10E58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10E08);
    v2 = sub_1B117F344();
    sub_1B117F464((uint64_t)&unk_1EEF10E78);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10E58);
  }
  return result;
}

unint64_t sub_1B117F344()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF10E60;
  if (!qword_1EEF10E60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10E00);
    v2 = sub_1B117F3C8();
    sub_1B117F464((uint64_t)&unk_1ED381298);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF10E60);
  }
  return result;
}

unint64_t sub_1B117F3C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF10E68;
  if (!qword_1EEF10E68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF10DF8);
    sub_1B117CB38((uint64_t)&unk_1EEF10E70);
    v3 = v2;
    sub_1B117F464((uint64_t)&unk_1ED380C28);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF10E68);
  }
  return result;
}

void sub_1B117F464(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

void sub_1B117F494(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_28(v2);
  OUTLINED_FUNCTION_41();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_allocObject();
}

id SGBannerContent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SGBannerContent.init()()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  void **v6;
  void **v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char *v19;
  objc_super v20;

  v1 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_subtitle];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedSubtitle] = 0;
  v2 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images] = 0;
  v3 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion] = 0;
  swift_unknownObjectWeakInit();
  v4 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews] = 0;
  v5 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_listTitle];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundVisualEffectView] = 0;
  v6 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundColor];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundColor] = 0;
  v7 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerDivider];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerDivider] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryAction] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_dismissAction] = 0;
  v19 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols] = 0;
  v8 = (void *)objc_opt_self();
  v9 = v0;
  v10 = objc_msgSend(v8, sel_currentDevice);
  v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  v12 = OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerForVisionDevice;
  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerForVisionDevice] = v11 == (id)6;
  v13 = &v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_title];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0xE000000000000000;
  OUTLINED_FUNCTION_2();
  *(_OWORD *)v1 = xmmword_1B11BDE00;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_accessoryType] = 0;
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v2 = 0;
  swift_bridgeObjectRelease();
  v14 = &v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_actionTitle];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0xE000000000000000;
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v3 = 0;
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryActionButtonWidth] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonWidth] = 0;
  v15 = 1;
  if (v9[v12])
    v15 = 2;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_actionButtonType] = v15;
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v4 = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  v16 = *v6;
  *v6 = 0;

  OUTLINED_FUNCTION_2();
  v17 = *v7;
  *v7 = 0;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20_1();
  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestionCategorySupportsBatchDismissal] = 0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20_1();
  *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonXAnchorOffset] = 0;
  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_prominentActionButton] = 0;
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v19 = 0;

  swift_bridgeObjectRelease();
  v20.receiver = v9;
  v20.super_class = (Class)type metadata accessor for SGBannerContent();
  return objc_msgSendSuper2(&v20, sel_init);
}

void sub_1B117F8B4()
{
  sub_1B117FFFC();
}

void sub_1B117F8CC()
{
  sub_1B1180080();
}

uint64_t sub_1B117F8D8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x108))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B117F918(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x110);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_1B117F96C()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B117F9A8()
{
  sub_1B117FFFC();
}

void sub_1B117F9C0()
{
  sub_1B1180080();
}

uint64_t sub_1B117F9CC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x120))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B117FA0C(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x128);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_1B117FA60()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B117FAAC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B117FB04(id a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void **v4;
  void *v5;
  void *v6;

  v2 = v1;
  if (a1
    && (objc_msgSend(a1, sel_mutableCopy),
        sub_1B11BB500(),
        swift_unknownObjectRelease(),
        sub_1B117C45C(0, (unint64_t *)&unk_1EEF107A0),
        swift_dynamicCast()))
  {
    v3 = v6;
  }
  else
  {
    sub_1B117C45C(0, (unint64_t *)&unk_1EEF107A0);
    v3 = sub_1B1176148();
  }
  v4 = (void **)(v2 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedSubtitle);
  OUTLINED_FUNCTION_2();
  v5 = *v4;
  *v4 = v3;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_25_2();
}

uint64_t sub_1B117FC18@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x138))();
  *a2 = result;
  return result;
}

uint64_t sub_1B117FC58(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x140);
  v4 = *a1;
  return v3(v2);
}

void sub_1B117FCA4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedSubtitle);
  OUTLINED_FUNCTION_2();
  v5 = *v4;
  v3[3] = *v4;
  v6 = v5;
  OUTLINED_FUNCTION_5();
}

void sub_1B117FD0C(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id *v4;
  id v5;

  v2 = *(void **)a1;
  v4 = (id *)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  if ((a2 & 1) != 0)
  {
    v5 = v3;
    sub_1B117FB04(v3);

  }
  else
  {
    sub_1B117FB04(*(id *)(*(_QWORD *)a1 + 24));
  }
  OUTLINED_FUNCTION_16_1(v2);
}

void sub_1B117FD78()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B117FDC0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_accessoryType);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B117FDFC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x150))();
  *a2 = result;
  return result;
}

uint64_t sub_1B117FE3C(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x158))(*a1);
}

void sub_1B117FE78()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B117FEC4()
{
  sub_1B11816A0(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images, (void (*)(_QWORD))MEMORY[0x1E0DEEB18]);
}

void sub_1B117FEF4(uint64_t a1)
{
  sub_1B1181748(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images, (void (*)(uint64_t))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_1B117FF08@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x168))();
  *a2 = result;
  return result;
}

uint64_t sub_1B117FF48(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x170);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void sub_1B117FF88()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B117FFC4(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_1B11BB398();
  OUTLINED_FUNCTION_15_0();
  return OUTLINED_FUNCTION_4_2(a1);
}

void sub_1B117FFF0()
{
  sub_1B117FFFC();
}

void sub_1B117FFFC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1180034(void *a1)
{
  id v2;
  void *v3;

  sub_1B11BB3C8();
  v2 = a1;
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_8_1(v3);
}

void sub_1B1180074()
{
  sub_1B1180080();
}

void sub_1B1180080()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_81();
}

uint64_t sub_1B11800C0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x180))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B1180100(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x188);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_1B1180154()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B11801A0()
{
  sub_1B11816A0(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion, (void (*)(_QWORD))MEMORY[0x1E0DEEED0]);
}

void sub_1B11801E0(uint64_t a1)
{
  sub_1B1181748(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion, (void (*)(uint64_t))MEMORY[0x1E0DEEEC0]);
}

uint64_t sub_1B11801F4@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x198))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180234(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1A0);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void sub_1B1180274()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B11802C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1B5E17D58](v0);
  OUTLINED_FUNCTION_7_0();
}

void sub_1B118031C()
{
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1180368@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1B0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B11803A8(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1B8);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void sub_1B11803E8(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_2();
  v3[3] = MEMORY[0x1B5E17D58](v5);
  OUTLINED_FUNCTION_5();
}

void sub_1B118044C(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_16_1(v3);
}

void sub_1B11804CC()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1180510(double a1)
{
  uint64_t v1;
  double *v3;

  v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryActionButtonWidth);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_12_1();
}

void sub_1B1180550(_QWORD **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1C8))();
}

uint64_t sub_1B1180590(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1D0))(*a1);
}

void sub_1B11805CC()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180618()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B118065C(double a1)
{
  uint64_t v1;
  double *v3;

  v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonWidth);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_12_1();
}

void sub_1B118069C(_QWORD **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1E0))();
}

uint64_t sub_1B11806DC(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1E8))(*a1);
}

void sub_1B1180718()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180764()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11807AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_actionButtonType);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B11807E8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1F8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180828(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x200))(*a1);
}

void sub_1B1180864()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B11808B0(void *a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4)
{
  if (a3())
  {
    sub_1B117C45C(0, a4);
    sub_1B11BB428();
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    a1 = 0;
  }
  return a1;
}

void sub_1B1180914()
{
  sub_1B11816A0(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews, (void (*)(_QWORD))MEMORY[0x1E0DEEB18]);
}

void sub_1B1180944(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7;
  id v9;

  v7 = a3;
  if (a3)
  {
    sub_1B117C45C(0, a4);
    v7 = sub_1B11BB440();
  }
  v9 = a1;
  a6(v7);
  OUTLINED_FUNCTION_8_1(v9);
}

void sub_1B11809AC(uint64_t a1)
{
  sub_1B1181748(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews, (void (*)(uint64_t))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_1B11809C0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x210))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180A00(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x218);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void sub_1B1180A40()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B1180A7C(void *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;

  a3();
  if (v4)
  {
    sub_1B11BB398();
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    a1 = 0;
  }
  return OUTLINED_FUNCTION_4_2(a1);
}

void sub_1B1180AB4()
{
  sub_1B117FFFC();
}

void sub_1B1180ACC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;

  if (a3)
    sub_1B11BB3C8();
  v4 = a1;
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_8_1(v5);
}

void sub_1B1180B1C()
{
  sub_1B1180080();
}

uint64_t sub_1B1180B28@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x228))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B1180B68(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x230);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_1B1180BBC()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180C08()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1180C60()
{
  sub_1B11812B4();
}

uint64_t sub_1B1180C6C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x240))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180CAC(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x248);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1180CF8()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180D44()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1180D9C()
{
  sub_1B11812B4();
}

uint64_t sub_1B1180DA8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x258))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180DE8(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x260);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1180E34()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180E80()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1180ED8()
{
  sub_1B11812B4();
}

uint64_t sub_1B1180EE4@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x270))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1180F24(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x278);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1180F70()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1180FC4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B118100C(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestionCategorySupportsBatchDismissal);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1181048@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x288))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B118108C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x290))(*a1);
}

void sub_1B11810C8()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1181114()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B118116C()
{
  sub_1B11812B4();
}

uint64_t sub_1B1181178@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2A0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B11811B8(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2A8);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1181204()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1181250()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11812A8()
{
  sub_1B11812B4();
}

void sub_1B11812B4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B11812EC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2B8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B118132C(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2C0);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1181378()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B11813C4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1181408(double a1)
{
  uint64_t v1;
  double *v3;

  v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonXAnchorOffset);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_12_1();
}

void sub_1B1181448(_QWORD **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2D0))();
}

uint64_t sub_1B1181488(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2D8))(*a1);
}

void sub_1B11814C4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B1181518()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1181560(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_prominentActionButton);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B118159C@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2E8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B11815E0(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2F0))(*a1);
}

void sub_1B118161C()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B118168C()
{
  sub_1B11816A0(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols, (void (*)(_QWORD))MEMORY[0x1E0DEEB18]);
}

void sub_1B11816A0(_QWORD *a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a1);
  OUTLINED_FUNCTION_2();
  a2(*v4);
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1181734(uint64_t a1)
{
  sub_1B1181748(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols, (void (*)(uint64_t))MEMORY[0x1E0DEEB08]);
}

void sub_1B1181748(uint64_t a1, _QWORD *a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)(v3 + *a2);
  OUTLINED_FUNCTION_2();
  v7 = *v6;
  *v6 = a1;
  a3(v7);
  OUTLINED_FUNCTION_81();
}

uint64_t sub_1B1181790@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x300))();
  *a2 = result;
  return result;
}

uint64_t sub_1B11817D0(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x308);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void sub_1B1181810()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id SGBannerContent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGBannerContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SGBannerContent()
{
  return objc_opt_self();
}

uint64_t sub_1B1181978(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t method lookup function for SGBannerContent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGBannerContent.title.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SGBannerContent.title.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SGBannerContent.title.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGBannerContent.images.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGBannerContent.images.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SGBannerContent.images.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x310))();
}

void type metadata accessor for SGBannerActionButtonType(uint64_t a1)
{
  sub_1B1182108(a1, (unint64_t *)&unk_1ED381690);
}

void type metadata accessor for SGBannerAccessoryType(uint64_t a1)
{
  sub_1B1182108(a1, &qword_1EEF10FB8);
}

void sub_1B1182108(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  OUTLINED_FUNCTION_41();
}

void sub_1B118214C()
{
  qword_1EEF13888 = 0;
}

uint64_t *sub_1B1182158()
{
  if (qword_1ED382B00 != -1)
    swift_once();
  return &qword_1EEF13888;
}

double sub_1B1182198(double *a1, void (*a2)(double *__return_ptr))
{
  double result;
  double v4;

  a2(&v4);
  result = v4;
  *a1 = v4;
  return result;
}

void sub_1B11821D0(_QWORD *a1@<X8>)
{
  sub_1B1182250((void (*)(void))sub_1B1182158, &qword_1EEF13888, a1);
}

void sub_1B11821F0()
{
  qword_1EEF13890 = 0;
}

uint64_t *sub_1B11821FC()
{
  if (qword_1ED382B08 != -1)
    swift_once();
  return &qword_1EEF13890;
}

void sub_1B118223C(_QWORD *a1@<X8>)
{
  sub_1B1182250((void (*)(void))sub_1B11821FC, &qword_1EEF13890, a1);
}

void sub_1B1182250(void (*a1)(void)@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  a1();
  OUTLINED_FUNCTION_2();
  *a3 = *a2;
  OUTLINED_FUNCTION_7_0();
}

void sub_1B118228C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t (*v6)(_QWORD);
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  os_log_type_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_24();
  v21 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1B11BAD08();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(v8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_114_0();
  sub_1B1188820(v14, v15, v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = v6(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v10, v1, v17);
  }
  else
  {
    v18 = sub_1B11BB4A0();
    v19 = sub_1B11BAF90();
    if (os_log_type_enabled(v19, v18))
    {
      v20 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      *(_QWORD *)(v20 + 4) = sub_1B117C4E0(v4, v21, &v22);
      _os_log_impl(&dword_1B1170000, v19, v18, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_161();
    }

    sub_1B11BACFC();
    OUTLINED_FUNCTION_158();
    swift_getAtKeyPath();
    OUTLINED_FUNCTION_155();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v11);
  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1182434()
{
  return sub_1B11BAC6C();
}

void sub_1B1182454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B1183434(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0CDB388], MEMORY[0x1E0CDA5C0]);
}

uint64_t type metadata accessor for AccessibilityAdaptiveStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AccessibilityAdaptiveStack);
}

void sub_1B1182474()
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
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  OUTLINED_FUNCTION_24();
  v16 = v1;
  OUTLINED_FUNCTION_114_0();
  v2 = sub_1B11BB29C();
  OUTLINED_FUNCTION_114_0();
  v3 = sub_1B11BB284();
  v4 = sub_1B11BAE94();
  v5 = sub_1B11BB1E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_122();
  v9 = v7 - v8;
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_101_0();
  v18[0] = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDFCC0], v2);
  v18[1] = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDFB10], v3);
  v11 = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v4, v18);
  sub_1B11BB1DC();
  v17 = v11;
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CDF690], v5, &v17);
  v12 = OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_99_0(v12, v13);
  v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v14(v9, v5);
  OUTLINED_FUNCTION_99_0(v16, v0);
  v15 = OUTLINED_FUNCTION_111_0();
  ((void (*)(uint64_t))v14)(v15);
  OUTLINED_FUNCTION_15();
}

void sub_1B11825C8()
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38[12];

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v3 = v2;
  v38[9] = v4;
  v38[2] = *(_QWORD *)(sub_1B11BB284() - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4();
  v38[4] = v6;
  OUTLINED_FUNCTION_16_0();
  v8 = MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_144(v8, v9, v10, v11, v12, v13, v14, v15, v38[0]);
  v38[0] = *(_QWORD *)(sub_1B11BB29C() - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_83();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_143_0(v18, v19, v20, v21, v22, v23, v24, v25, v38[0]);
  v26 = OUTLINED_FUNCTION_15_2();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_122();
  v30 = v28 - v29;
  MEMORY[0x1E0C80A78](v31);
  v33 = (char *)v38 - v32;
  OUTLINED_FUNCTION_157();
  v34 = sub_1B11BAE94();
  v38[7] = *(_QWORD *)(v34 - 8);
  v38[8] = v34;
  MEMORY[0x1E0C80A78](v34);
  v38[5] = v1;
  v38[6] = (uint64_t)v38 - v35;
  type metadata accessor for AccessibilityAdaptiveStack(0, v3, v1, v36);
  OUTLINED_FUNCTION_59_1();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 104))(v30, *MEMORY[0x1E0CDB340], v26);
  v37 = sub_1B1182928((uint64_t)v33, v30);
  OUTLINED_FUNCTION_104_0(v30);
  OUTLINED_FUNCTION_104_0((uint64_t)v33);
  if (v37)
  {
    sub_1B11BAD8C();
    sub_1B11BB290();
    OUTLINED_FUNCTION_67();
  }
  sub_1B11BAD20();
  sub_1B11BB278();
  OUTLINED_FUNCTION_98_0();
}

void sub_1B1182848()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(v2 - 152);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 160) + 16);
  v4(v3, v1, v0);
  OUTLINED_FUNCTION_160();
  v4(v1, v3, v0);
  OUTLINED_FUNCTION_67();
}

void sub_1B1182888()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_157();
  sub_1B1182D74(v3, v4, v5);
  OUTLINED_FUNCTION_160();
  v1(v2, v0);
  JUMPOUT(0x1B11828B4);
}

void sub_1B11828C0()
{
  OUTLINED_FUNCTION_98_0();
}

void sub_1B11828D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = a1;
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11828E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 120);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v2 - 104), v1, v0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  OUTLINED_FUNCTION_15();
}

void sub_1B118291C()
{
  sub_1B11825C8();
}

BOOL sub_1B1182928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  _DWORD *v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_1B11BAD74();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a1, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = (_DWORD *)MEMORY[0x1E0CDB368];
  v16 = *MEMORY[0x1E0CDB330];
  if (v13 != *MEMORY[0x1E0CDB330])
  {
    if (v13 == *MEMORY[0x1E0CDB368])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x1E0CDB370])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x1E0CDB358])
      goto LABEL_7;
    if (v13 == *MEMORY[0x1E0CDB328])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x1E0CDB338])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x1E0CDB300])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x1E0CDB348])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x1E0CDB340])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x1E0CDB350])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x1E0CDB318])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x1E0CDB320])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a2, v4);
  v17 = v12(v8, v4);
  if (v17 == v16)
  {
    v18 = 0;
  }
  else if (v17 == *v15)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x1E0CDB370])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x1E0CDB358])
    {
      if (v17 == *MEMORY[0x1E0CDB328])
      {
        v18 = 4;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB338])
      {
        v18 = 5;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB300])
      {
        v18 = 6;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB348])
      {
        v18 = 7;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB340])
      {
        v18 = 8;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB350])
      {
        v18 = 9;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB318])
      {
        v18 = 10;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x1E0CDB320])
      {
        v18 = 11;
        return v14 >= v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 >= v18;
}

uint64_t sub_1B1182CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_1B11BAE7C();
  MEMORY[0x1E0C80A78](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1B11BAE88();
}

uint64_t sub_1B1182D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_1B11BAE7C();
  MEMORY[0x1E0C80A78](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1B11BAE88();
}

uint64_t sub_1B1182E3C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B11BAA98();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_133_0();
  return v1;
}

uint64_t sub_1B1182EA4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B1182ED8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 96))(*a1);
}

uint64_t sub_1B1182F04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_188();
  return sub_1B11BAAA4();
}

void sub_1B1182F6C(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B11BAA8C();
  OUTLINED_FUNCTION_5();
}

void sub_1B1182FDC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  OUTLINED_FUNCTION_34();
  free(v1);
}

void sub_1B1183024()
{
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  sub_1B11BAA74();
  swift_endAccess();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1183074(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11620);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, a1, v3);
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  sub_1B11BAA80();
  swift_endAccess();
  v5 = OUTLINED_FUNCTION_90_0();
  return v6(v5);
}

void sub_1B118312C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11620);
  v3[4] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[5] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[6] = malloc(v6);
  v3[7] = malloc(v6);
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  sub_1B11BAA74();
  swift_endAccess();
  OUTLINED_FUNCTION_5();
}

void sub_1B11831D0(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 48);
  v4 = *(void **)(*(_QWORD *)a1 + 56);
  if ((a2 & 1) != 0)
  {
    v5 = v2[4];
    v6 = v2[5];
    v7 = OUTLINED_FUNCTION_158();
    v8(v7);
    sub_1B1183074((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    sub_1B1183074(*(_QWORD *)(*(_QWORD *)a1 + 56));
  }
  free(v4);
  free(v3);
  free(v2);
}

void sub_1B1183258()
{
  swift_allocObject();
  sub_1B1183290();
  OUTLINED_FUNCTION_41();
}

void sub_1B1183290()
{
  OUTLINED_FUNCTION_33_0();
  sub_1B11BAA68();
  swift_endAccess();
  OUTLINED_FUNCTION_81();
}

void BannerUpdateViewModel.deinit()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  OUTLINED_FUNCTION_28(v0);
  OUTLINED_FUNCTION_41();
}

uint64_t BannerUpdateViewModel.__deallocating_deinit()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  OUTLINED_FUNCTION_28(v0);
  return swift_deallocClassInstance();
}

void sub_1B1183364(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_19_1();
  *a1 = sub_1B11BAA50();
  OUTLINED_FUNCTION_5();
}

uint64_t type metadata accessor for SGBannerContainerView(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382B10);
}

uint64_t sub_1B11833A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SGBannerViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BannerUpdateViewModel(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1ED382D60);
}

uint64_t sub_1B1183400()
{
  return sub_1B11BAC3C();
}

void sub_1B1183420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B1183434(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0CD86F8], MEMORY[0x1E0CDA4E8]);
}

void sub_1B1183434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  a5(0);
  OUTLINED_FUNCTION_163();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_5();
}

uint64_t SGBannerContainerView.init(_:store:updateBannerView:)@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  int *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v19;
  uint64_t v20;

  v6 = (int *)OUTLINED_FUNCTION_35_0();
  v7 = v6[6];
  *(_QWORD *)((char *)a3 + v7) = 0;
  *((_BYTE *)a3 + v6[8]) = 1;
  v8 = (_QWORD *)((char *)a3 + v6[9]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  OUTLINED_FUNCTION_42_0();
  v9 = (_QWORD *)((char *)a3 + v6[10]);
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  OUTLINED_FUNCTION_42_0();
  v10 = (char *)a3 + v6[11];
  OUTLINED_FUNCTION_145();
  *v10 = v19;
  *((_QWORD *)v10 + 1) = v20;
  *a3 = a1;
  v11 = *(void **)((char *)a3 + v7);
  *(_QWORD *)((char *)a3 + v7) = a2;
  v12 = a1;
  v13 = a2;

  v14 = (_QWORD *)((char *)a3 + v6[7]);
  OUTLINED_FUNCTION_19_1();
  sub_1B117CB38((uint64_t)&unk_1ED381A20);
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_114_0();
  *v14 = sub_1B11BAB70();
  v14[1] = v15;
  if (a2)
    objc_msgSend(v13, sel_hostApp);
  v16 = (uint64_t)a3 + v6[5];
  v17 = v12;
  sub_1B11AA354(v17, v16);

  return OUTLINED_FUNCTION_133_0();
}

void SGBannerContainerView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  BOOL v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED3812E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED380FF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_36();
  *(_QWORD *)v11 = sub_1B11BAD8C();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810B0);
  sub_1B118383C();
  v14 = sub_1B11BAFC0();
  v15 = sub_1B11BAFD8();
  v16 = sub_1B11BAFCC();
  sub_1B11BAFCC();
  if (sub_1B11BAFCC() != v14)
    v16 = sub_1B11BAFCC();
  sub_1B11BAFCC();
  if (sub_1B11BAFCC() != v15)
    v16 = sub_1B11BAFCC();
  v17 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

  OUTLINED_FUNCTION_124_0();
  v20 = *(void **)(v7 + v19);
  if (v20 && ((v21 = objc_msgSend(v20, sel_hostApp), v18 == (id)6) ? (v22 = v21 == (id)1) : (v22 = 0), v22))
  {
    v3 = 0;
    v23 = 1;
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  else
  {
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    v23 = 0;
  }
  v24 = OUTLINED_FUNCTION_185();
  sub_1B1188820(v24, v25, qword_1ED3812E0);
  v26 = v2 + *(int *)(v12 + 36);
  *(_BYTE *)v26 = v16;
  *(_QWORD *)(v26 + 8) = v3;
  *(_QWORD *)(v26 + 16) = v4;
  *(_QWORD *)(v26 + 24) = v5;
  *(_QWORD *)(v26 + 32) = v6;
  *(_BYTE *)(v26 + 40) = v23;
  OUTLINED_FUNCTION_105((uint64_t)v11);
  sub_1B1188514(v2, a1, qword_1ED380FF8);
}

void sub_1B118383C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  uint64_t **v5;
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
  uint64_t *v17;
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
  char *v40;
  uint64_t v41;
  char *v42;
  BOOL v43;
  uint64_t v44;
  _QWORD *v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  void **v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t *v62;
  uint64_t v63;
  void **v64;
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
  void *v79;
  char v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t);
  uint64_t v91;
  _QWORD *v92;
  void (*v93)(uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t);
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
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t **v134;
  uint64_t v135;
  uint64_t *v136;
  char *v137;
  uint64_t v138;

  OUTLINED_FUNCTION_24();
  v5 = v4;
  v132 = v6;
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381190);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_5_0();
  v119 = v8;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381160);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_5_0();
  v107 = v10;
  v11 = OUTLINED_FUNCTION_10();
  v127 = *(_QWORD *)(v11 - 8);
  v128 = v11;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v12);
  v124 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_29_0();
  v125 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3812C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_5_0();
  v136 = v17;
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381118);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_5_0();
  v133 = v19;
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381208);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_4();
  v112 = v21;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_29_0();
  v114 = v23;
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3812B0);
  v122 = *(_QWORD *)(v138 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x1E0C80A78](v25);
  v129 = (char *)&v106 - v26;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_29_0();
  v121 = v28;
  OUTLINED_FUNCTION_62_0();
  v29 = sub_1B11BB2F0();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_38_0();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381800);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_170();
  v135 = v35;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v36);
  v120 = (char *)&v106 - v37;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v38);
  v40 = (char *)&v106 - v39;
  v117 = OUTLINED_FUNCTION_35_0();
  v41 = *(int *)(v117 + 20);
  v134 = v5;
  v42 = (char *)v5 + v41 + *(int *)(OUTLINED_FUNCTION_19() + 52);
  v43 = v42[16] == 1;
  v130 = v3;
  v131 = v2;
  v115 = v29;
  v109 = v30;
  v108 = v0;
  v126 = v42;
  v110 = v1;
  if (v43)
  {
    sub_1B11BB2E4();
    v44 = *(_QWORD *)v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v0, v1, v29);
    v45 = (_QWORD *)(v0 + *(int *)(v31 + 36));
    *v45 = v44;
    OUTLINED_FUNCTION_108_0((uint64_t)v45);
    v46 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    OUTLINED_FUNCTION_188();
    v46(v1, v29);
    sub_1B1188514(v0, (uint64_t)v40, &qword_1ED3817F8);
    v47 = 0;
  }
  else
  {
    v47 = 1;
  }
  v48 = (void **)v134;
  v49 = v117;
  v117 = v31;
  __swift_storeEnumTagSinglePayload((uint64_t)v40, v47, 1, v31);
  v50 = sub_1B11BAD20();
  v51 = v136;
  *v136 = v50;
  v51[1] = 0;
  *((_BYTE *)v51 + 16) = 0;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810A8);
  sub_1B118402C(v48, (uint64_t)v51 + *(int *)(v52 + 44));
  v53 = *(int *)(v49 + 24);
  v54 = *(void **)((char *)v48 + v53);
  v137 = v40;
  v111 = v53;
  if (v54)
    LODWORD(v123) = objc_msgSend(v54, sel_hostApp) == (id)1;
  else
    LODWORD(v123) = 0;
  v55 = v133;
  v56 = v125;
  OUTLINED_FUNCTION_45_1();
  v57 = *v48;
  v58 = v127;
  v59 = v49;
  v60 = v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v124, v56, v128);
  v61 = v57;
  sub_1B1185C94();
  v62 = v136;
  OUTLINED_FUNCTION_44_0((uint64_t)v136, v55);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v60);
  OUTLINED_FUNCTION_12_0((uint64_t)v62);
  v63 = *(int *)(v59 + 32);
  v64 = v48;
  v65 = v110;
  if (*((_BYTE *)v48 + v63) == 1)
  {
    v66 = v55;
    v67 = v107;
    sub_1B1188820(v66, v107, &qword_1ED381118);
    *(_WORD *)(v67 + *(int *)(v116 + 36)) = 256;
    OUTLINED_FUNCTION_44_0(v67, v119);
    OUTLINED_FUNCTION_42_0();
    sub_1B118822C((uint64_t)&unk_1ED381158);
    sub_1B1188280();
    v68 = v112;
    OUTLINED_FUNCTION_114_0();
    OUTLINED_FUNCTION_169();
    v69 = v67;
    v55 = v133;
    OUTLINED_FUNCTION_12_0(v69);
    v71 = v68;
  }
  else
  {
    sub_1B1188820(v55, v119, &qword_1ED381118);
    OUTLINED_FUNCTION_54();
    sub_1B118822C((uint64_t)&unk_1ED381158);
    sub_1B1188280();
    v72 = v112;
    OUTLINED_FUNCTION_72_0();
    v71 = v72;
  }
  v73 = v121;
  v74 = v122;
  v75 = v118;
  v76 = v115;
  v77 = v114;
  v78 = v111;
  OUTLINED_FUNCTION_107_0(v71, v70, &qword_1ED381208);
  sub_1B117F494(v55, &qword_1ED381118);
  v79 = *(void **)((char *)v64 + v78);
  if (v79)
    v80 = objc_msgSend(v79, sel_hostApp) == (id)1;
  else
    v80 = 0;
  v81 = OUTLINED_FUNCTION_95_0(**v134);
  v82 = sub_1B118831C();
  v83 = v129;
  sub_1B11A19E8(v80, v81, v75, v82);
  sub_1B117F494(v77, &qword_1ED381208);
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v73, v83, v138);
  v84 = v126;
  v85 = v73;
  if (v126[17] == 1)
  {
    sub_1B11BB2E4();
    v86 = *((_QWORD *)v84 + 1);
    v87 = v109;
    v88 = v108;
    v89 = OUTLINED_FUNCTION_111_0();
    v90(v89);
    v91 = v117;
    v92 = (_QWORD *)(v88 + *(int *)(v117 + 36));
    *v92 = v86;
    OUTLINED_FUNCTION_108_0((uint64_t)v92);
    v93 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    OUTLINED_FUNCTION_180();
    v93(v65, v76);
    v94 = (uint64_t)v120;
    OUTLINED_FUNCTION_107_0(v88, v95, &qword_1ED3817F8);
    v96 = 0;
    v97 = v135;
  }
  else
  {
    v96 = 1;
    v97 = v135;
    v94 = (uint64_t)v120;
    v91 = v117;
  }
  __swift_storeEnumTagSinglePayload(v94, v96, 1, v91);
  OUTLINED_FUNCTION_30((uint64_t)v137, v97);
  v98 = v74;
  v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16);
  v100 = v131;
  v101 = v138;
  v99(v131, v85, v138);
  v102 = v130;
  OUTLINED_FUNCTION_30(v94, v130);
  v103 = v132;
  OUTLINED_FUNCTION_30(v97, v132);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381130);
  v99(v103 + *(int *)(v104 + 48), v100, v101);
  OUTLINED_FUNCTION_30(v102, v103 + *(int *)(v104 + 64));
  OUTLINED_FUNCTION_128(v94);
  v105 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v105(v85, v101);
  OUTLINED_FUNCTION_128((uint64_t)v137);
  OUTLINED_FUNCTION_128(v102);
  v105(v100, v101);
  OUTLINED_FUNCTION_128(v135);
  OUTLINED_FUNCTION_15();
}

void sub_1B118402C(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)();
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void **v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  int v47;
  void *v48;
  uint64_t v49;
  void **v50;
  void *v51;
  id v52;
  char v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  char v73;
  _QWORD *v74;
  char v75;
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
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v10 = type metadata accessor for SGBannerContainerView(0);
  v91 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v92 = v11;
  v94 = (uint64_t)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381088);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_122();
  v15 = (void (**)())(v13 - v14);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_102_0();
  v96 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_4();
  v88 = v18;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v84 - v20;
  type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v22);
  v90 = (uint64_t *)((char *)&v84 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v24);
  v26 = (uint64_t *)((char *)&v84 - v25);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381518);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_4();
  v87 = v29;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v30);
  v86 = (uint64_t)&v84 - v31;
  OUTLINED_FUNCTION_16_0();
  v33 = MEMORY[0x1E0C80A78](v32);
  v35 = (char *)&v84 - v34;
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_101_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381520);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_4();
  v97 = v37;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_170();
  v98 = v39;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v40);
  v95 = (char *)&v84 - v41;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v42);
  v43 = a1;
  v45 = (char *)&v84 - v44;
  v46 = (uint64_t)a1 + *(int *)(v10 + 20);
  v47 = *(unsigned __int8 *)(v46 + 1);
  v99 = a2;
  v100 = (uint64_t)&v84 - v44;
  v89 = v10;
  if (v47 == 1)
  {
    v85 = v3;
    v48 = *v43;
    v49 = *(int *)(v10 + 24);
    v50 = v43;
    v51 = *(void **)((char *)v43 + v49);
    sub_1B1186804(v46, (uint64_t)v21, type metadata accessor for SGBannerViewModel);
    v52 = v48;
    if (v51)
      v53 = objc_msgSend(v51, sel_hostApp) == (id)1;
    else
      v53 = 0;
    sub_1B118E9E0((uint64_t)v48, (uint64_t)v51, v53, v26);
    v55 = sub_1B11BAFC0();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    sub_1B1186804((uint64_t)v26, (uint64_t)v35, type metadata accessor for CloseButtonView);
    v56 = &v35[*(int *)(v27 + 36)];
    *v56 = v55;
    v57 = OUTLINED_FUNCTION_165((uint64_t)v56);
    sub_1B117F1FC(v57, type metadata accessor for CloseButtonView);
    v58 = OUTLINED_FUNCTION_90_0();
    sub_1B1188514(v58, v59, &qword_1ED381518);
    v60 = v100;
    sub_1B1188514(v2, v100, &qword_1ED381518);
    v45 = (char *)v60;
    v54 = 0;
    v3 = v85;
  }
  else
  {
    v50 = v43;
    v54 = 1;
  }
  v61 = 1;
  OUTLINED_FUNCTION_149_0((uint64_t)v45, v54);
  v62 = v50;
  v63 = (uint64_t)v50;
  v64 = v94;
  sub_1B1186804(v63, v94, type metadata accessor for SGBannerContainerView);
  v65 = (*(unsigned __int8 *)(v91 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
  v66 = swift_allocObject();
  sub_1B11883D0(v64, v66 + v65, type metadata accessor for SGBannerContainerView);
  v67 = (uint64_t *)((char *)v15 + *(int *)(v93 + 36));
  *v67 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  OUTLINED_FUNCTION_42_0();
  *v15 = sub_1B11883A4;
  v15[1] = (void (*)())v66;
  OUTLINED_FUNCTION_107_0((uint64_t)v15, v68, &qword_1ED381088);
  v69 = (uint64_t)v95;
  if (*(_BYTE *)(v46 + 2) == 1)
  {
    v70 = *v62;
    v71 = *(void **)((char *)v62 + *(int *)(v89 + 24));
    sub_1B1186804(v46, v88, type metadata accessor for SGBannerViewModel);
    v72 = v70;
    if (v71)
      v73 = objc_msgSend(v71, sel_hostApp) == (id)1;
    else
      v73 = 0;
    v74 = v90;
    sub_1B118E9E0((uint64_t)v70, (uint64_t)v71, v73, v90);
    v75 = sub_1B11BAFD8();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    v76 = v87;
    sub_1B1186804((uint64_t)v74, v87, type metadata accessor for CloseButtonView);
    v77 = v76 + *(int *)(v27 + 36);
    *(_BYTE *)v77 = v75;
    *(_QWORD *)(v77 + 8) = v4;
    *(_QWORD *)(v77 + 16) = v5;
    *(_QWORD *)(v77 + 24) = v6;
    *(_QWORD *)(v77 + 32) = v7;
    *(_BYTE *)(v77 + 40) = 0;
    sub_1B117F1FC((uint64_t)v74, type metadata accessor for CloseButtonView);
    v78 = v86;
    OUTLINED_FUNCTION_174(v76, v86);
    OUTLINED_FUNCTION_174(v78, v69);
    v61 = 0;
  }
  OUTLINED_FUNCTION_149_0(v69, v61);
  v79 = v100;
  v80 = v98;
  OUTLINED_FUNCTION_30(v100, v98);
  OUTLINED_FUNCTION_139_0(v3, (uint64_t)v15);
  v81 = v97;
  OUTLINED_FUNCTION_30(v69, v97);
  v82 = v99;
  OUTLINED_FUNCTION_30(v80, v99);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810B8);
  OUTLINED_FUNCTION_139_0((uint64_t)v15, v82 + *(int *)(v83 + 48));
  OUTLINED_FUNCTION_30(v81, v82 + *(int *)(v83 + 64));
  OUTLINED_FUNCTION_128(v69);
  OUTLINED_FUNCTION_75(v3);
  OUTLINED_FUNCTION_128(v79);
  OUTLINED_FUNCTION_128(v81);
  OUTLINED_FUNCTION_75((uint64_t)v15);
  OUTLINED_FUNCTION_128(v80);
  OUTLINED_FUNCTION_35();
}

void sub_1B11845E4(void **a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  _QWORD *v22;
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
  uint64_t v48;
  uint64_t v49;
  void **v50;
  char **p_types;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t (*v58)(uint64_t);
  id v59;
  char v60;
  void *v61;
  id v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  _BYTE *v68;
  uint64_t v69;
  void *v70;
  _BOOL8 v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
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

  type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_29_0();
  v8 = OUTLINED_FUNCTION_62_0();
  v9 = type metadata accessor for SGBannerContainerView(v8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_29_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_5_0();
  v81 = v14;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381700);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_5_0();
  v82 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3812B8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_170();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_29_0();
  v20 = OUTLINED_FUNCTION_62_0();
  type metadata accessor for IconView(v20);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_4();
  v74 = v22;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_29_0();
  v75 = v24;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381608);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_5_0();
  v78 = v26;
  v27 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_170();
  v77 = v30;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_29_0();
  v76 = v32;
  v33 = OUTLINED_FUNCTION_62_0();
  type metadata accessor for BannerIconSGView(v33);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_85();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_102_0();
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381628);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_7();
  v37 = OUTLINED_FUNCTION_15_2();
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_103_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381630);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0();
  v41 = MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_143_0(v41, v42, v43, v44, v45, v46, v47, v48, v72);
  v49 = v9;
  v50 = a1;
  OUTLINED_FUNCTION_59_1();
  LOBYTE(a1) = sub_1B11BAD68();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v3, v37);
  p_types = (char **)(&stru_1E62DBFF8 + 8);
  if ((a1 & 1) != 0)
  {
    v52 = 1;
    v53 = v81;
    v54 = v84;
  }
  else
  {
    v73 = v2;
    v55 = (uint64_t)v50 + *(int *)(v49 + 20);
    v56 = *v50;
    if (*(_QWORD *)(v55 + *(int *)(v27 + 48) + 80))
    {
      sub_1B1186804(v55, v76, type metadata accessor for SGBannerViewModel);
      v57 = *(void **)((char *)v50 + *(int *)(v49 + 24));
      v53 = v81;
      v58 = (uint64_t (*)(uint64_t))v79;
      v59 = v56;
      if (v57)
        v60 = objc_msgSend(v57, sel_hostApp, v73) == (id)1;
      else
        v60 = 0;
      sub_1B118CC7C((uint64_t)v56, v60, v1);
      sub_1B11883D0((uint64_t)v1, v4, type metadata accessor for BannerIconSGView);
      sub_1B1186804(v4, v78, type metadata accessor for BannerIconSGView);
      OUTLINED_FUNCTION_42_0();
      sub_1B117CB38((uint64_t)&unk_1ED3817E8);
      sub_1B117CB38((uint64_t)&unk_1ED3817F0);
      OUTLINED_FUNCTION_176();
      OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_138();
      sub_1B117F1FC(v4, type metadata accessor for BannerIconSGView);
      v54 = v84;
    }
    else
    {
      sub_1B1186804(v55, v77, type metadata accessor for SGBannerViewModel);
      v61 = *(void **)((char *)v50 + *(int *)(v49 + 24));
      v53 = v81;
      v62 = v56;
      if (v61)
        v63 = objc_msgSend(v61, sel_hostApp, v73) == (id)1;
      else
        v63 = 0;
      v54 = v84;
      sub_1B118BED8((uint64_t)v56, v63, v74);
      v58 = type metadata accessor for IconView;
      sub_1B11883D0((uint64_t)v74, v75, type metadata accessor for IconView);
      v65 = OUTLINED_FUNCTION_90_0();
      sub_1B1186804(v65, v66, type metadata accessor for IconView);
      OUTLINED_FUNCTION_54();
      sub_1B117CB38((uint64_t)&unk_1ED3817E8);
      sub_1B117CB38((uint64_t)&unk_1ED3817F0);
      OUTLINED_FUNCTION_176();
      OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_72_0();
      sub_1B117F1FC(v75, type metadata accessor for IconView);
    }
    OUTLINED_FUNCTION_107_0((uint64_t)v58, v64, &qword_1ED381628);
    v52 = 0;
    p_types = &stru_1E62DBFF8.types;
  }
  __swift_storeEnumTagSinglePayload(v54, v52, 1, v80);
  *(_QWORD *)v53 = sub_1B11BAD8C();
  *(_QWORD *)(v53 + 8) = 0;
  *(_BYTE *)(v53 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816B8);
  sub_1B1184FA0();
  v67 = sub_1B11BAFB4();
  sub_1B11BAABC();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_139_0(v53, v82);
  v68 = (_BYTE *)(v82 + *(int *)(v83 + 36));
  *v68 = v67;
  v69 = OUTLINED_FUNCTION_165((uint64_t)v68);
  OUTLINED_FUNCTION_75(v69);
  v70 = *(void **)((char *)v50 + *(int *)(v49 + 24));
  if (v70)
    v71 = objc_msgSend(v70, p_types[240]) == (id)1;
  else
    v71 = 0;
  sub_1B11883FC((uint64_t)&unk_1ED381120);
  sub_1B11A1A74(v71);
}

void sub_1B1184CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;

  OUTLINED_FUNCTION_75(v1);
  v10 = *(_QWORD *)(v9 - 208);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v10 + 32))(*(_QWORD *)(v9 - 184), v2, *(_QWORD *)(v9 - 176));
  v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v12 = OUTLINED_FUNCTION_95_0(**v8);
  sub_1B1186804((uint64_t)v8, v3, type metadata accessor for SGBannerContainerView);
  if (v12 == 1)
  {
    sub_1B117F1FC(v3, type metadata accessor for SGBannerContainerView);
LABEL_6:
    v21 = 1;
    v23 = *(_QWORD *)(v9 - 256);
    v22 = *(_QWORD *)(v9 - 248);
    v24 = *(_QWORD *)(v9 - 264);
    v25 = *(_QWORD *)(v9 - 272);
    v26 = *(_QWORD *)(v9 - 280);
    goto LABEL_9;
  }
  v13 = *(_BYTE *)(v3 + *(int *)(v6 + 20) + 3);
  sub_1B117F1FC(v3, type metadata accessor for SGBannerContainerView);
  if ((v13 & 1) == 0)
    goto LABEL_6;
  v14 = *v8;
  v15 = (*(uint64_t (**)(void))((*v11 & **v8) + 0x180))();
  v16 = *(uint64_t **)((char *)v8 + v4);
  *(_QWORD *)(v9 - 192) = v17;
  v18 = v15;
  v19 = v14;
  if (v16)
    v20 = objc_msgSend(v16, *(SEL *)(v5 + 1920)) == (id)1;
  else
    v20 = 0;
  v27 = *(_QWORD *)(v9 - 360);
  v28 = (char *)v8 + *(int *)(v6 + 44);
  v29 = *v28;
  v30 = *((_QWORD *)v28 + 1);
  *(_BYTE *)(v9 - 160) = v29;
  *(_QWORD *)(v9 - 152) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380FA8);
  sub_1B11BB260();
  v31 = *(_QWORD *)(v9 - 144);
  v32 = *(_QWORD *)(v9 - 136);
  v33 = *(unsigned __int8 *)(v9 - 128);
  sub_1B1186804(v0, v27, type metadata accessor for SGBannerViewModel);
  v46 = v27;
  v34 = *(_QWORD *)(v9 - 344);
  sub_1B118DD34(v18, *(_QWORD *)(v9 - 192), (uint64_t)v14, (uint64_t)v16, v20, v31, v32, v33, v46);
  v35 = *(_QWORD *)(v9 - 352);
  sub_1B11883D0(v34, v35, type metadata accessor for PrimaryActionButtonView);
  v25 = *(_QWORD *)(v9 - 272);
  sub_1B11883D0(v35, v25, type metadata accessor for PrimaryActionButtonView);
  v21 = 0;
  v23 = *(_QWORD *)(v9 - 256);
  v22 = *(_QWORD *)(v9 - 248);
  v24 = *(_QWORD *)(v9 - 264);
  v26 = *(_QWORD *)(v9 - 280);
  v10 = *(_QWORD *)(v9 - 208);
  v7 = *(_QWORD *)(v9 - 168);
LABEL_9:
  __swift_storeEnumTagSinglePayload(v25, v21, 1, v24);
  v36 = v7;
  v37 = *(_QWORD *)(v9 - 216);
  OUTLINED_FUNCTION_44_0(v36, v37);
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v40 = *(_QWORD *)(v9 - 184);
  v39 = *(_QWORD *)(v9 - 176);
  v38(v26, v40, v39);
  sub_1B1188820(v25, v23, &qword_1ED3816B0);
  v41 = OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_44_0(v41, v42);
  v43 = v10;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811C8);
  v38(v22 + *(int *)(v44 + 48), v26, v39);
  sub_1B1188820(v23, v22 + *(int *)(v44 + 64), &qword_1ED3816B0);
  OUTLINED_FUNCTION_125(v25);
  v45 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v45(v40, v39);
  OUTLINED_FUNCTION_12_0(*(_QWORD *)(v9 - 168));
  OUTLINED_FUNCTION_125(v23);
  v45(v26, v39);
  OUTLINED_FUNCTION_12_0(v37);
  OUTLINED_FUNCTION_35();
}

void sub_1B1184FA0()
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_24();
  v6 = v5;
  v23 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381610);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_36();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_120();
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381738);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v22 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381740);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_47();
  sub_1B11851F4();
  v17 = *(int *)(OUTLINED_FUNCTION_35_0() + 32);
  if (*(_BYTE *)(v6 + v17) == 1)
  {
    sub_1B1188820(v2, v0, &qword_1ED3817B0);
    *(_WORD *)(v0 + *(int *)(v9 + 36)) = 256;
    v18 = OUTLINED_FUNCTION_90_0();
    sub_1B1188820(v18, v19, v20);
    OUTLINED_FUNCTION_42_0();
    sub_1B118822C((uint64_t)&unk_1ED3816F0);
    sub_1B1188464();
    OUTLINED_FUNCTION_128_0();
    sub_1B11BAE88();
    sub_1B117F494(v0, &qword_1ED3816F8);
  }
  else
  {
    sub_1B1188820(v2, v1, &qword_1ED3817B0);
    OUTLINED_FUNCTION_54();
    sub_1B118822C((uint64_t)&unk_1ED3816F0);
    sub_1B1188464();
    OUTLINED_FUNCTION_128_0();
    sub_1B11BAE88();
  }
  OUTLINED_FUNCTION_174(v4, (uint64_t)v15);
  sub_1B117F494(v2, &qword_1ED3817B0);
  v21 = MEMORY[0x1E0C80A78](*(unsigned __int8 *)(v6 + v17));
  *(&v22 - 2) = v6;
  sub_1B1185564(v21, (uint64_t)sub_1B118850C, v3);
  OUTLINED_FUNCTION_128((uint64_t)v15);
  sub_1B1188514(v3, v23, &qword_1ED381740);
  OUTLINED_FUNCTION_15();
}

void sub_1B11851F4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD **v2;
  _QWORD **v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  char v49;
  __int16 v50;
  int v51;
  uint64_t v52;
  char v53;
  __int16 v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int16 v72;

  OUTLINED_FUNCTION_24();
  v3 = v2;
  v67 = v4;
  v5 = (int *)OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_102();
  type metadata accessor for TitleView(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_4();
  v66 = v9;
  OUTLINED_FUNCTION_16_0();
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v65 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_144(v14, v15, v16, v17, v18, v19, v20, v21, v65);
  v22 = *v3;
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **v3) + 0x108))();
  v23 = (uint64_t)v3 + v5[5];
  sub_1B1186804(v23, v1, type metadata accessor for SGBannerViewModel);
  v24 = *(_QWORD **)((char *)v3 + v5[6]);
  v25 = v22;
  if (v24)
    objc_msgSend(v24, sel_hostApp);
  v26 = OUTLINED_FUNCTION_158();
  sub_1B118D1D0(v26, v27, (uint64_t)v22, v28, v29);
  v30 = v68;
  sub_1B11883D0((uint64_t)v13, v68, type metadata accessor for TitleView);
  if (*(_BYTE *)(v23 + 4) == 1)
  {
    sub_1B1175C8C(v22);
    v32 = v31;
    v34 = v33;
    v35 = *((unsigned __int8 *)v3 + v5[8]);
    v36 = *(unsigned __int8 *)(v23 + 5);
    v37 = v22;
    if (v24)
      v38 = objc_msgSend(v24, sel_hostApp) == (id)1;
    else
      v38 = 0;
    v43 = v66;
    v42 = v67;
    v69 = sub_1B118D228(v32, v34 & 1, v35, v36, (uint64_t)v22, v38);
    v70 = v51 & 0x10101;
    v71 = v52;
    v72 = v53 & 1;
    sub_1B11887A8();
    sub_1B11887E4();
    OUTLINED_FUNCTION_105_0();
    OUTLINED_FUNCTION_126_0();
    if (v49)
      v55 = 0;
    else
      v55 = 256;
    LOWORD(v0) = v55 | v54;
    v30 = v68;
  }
  else
  {
    v39 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v40 = OUTLINED_FUNCTION_95_0(*v22);
    sub_1B1186804((uint64_t)v3, v0, type metadata accessor for SGBannerContainerView);
    if (v40 == 1)
    {
      v41 = *(_BYTE *)(v0 + v5[5] + 3);
      sub_1B117F1FC(v0, type metadata accessor for SGBannerContainerView);
      v43 = v66;
      v42 = v67;
      if ((v41 & 1) != 0)
      {
        v22 = *v3;
        (*(void (**)(void))((*v39 & **v3) + 0x180))();
        v44 = v22;
        v45 = OUTLINED_FUNCTION_90_0();
        v69 = nullsub_1(v45);
        v70 = v46;
        v71 = v47;
        v72 = 256;
        sub_1B11887A8();
        sub_1B11887E4();
        OUTLINED_FUNCTION_105_0();
        OUTLINED_FUNCTION_126_0();
        if (v49)
          v50 = 0;
        else
          v50 = 256;
        LOWORD(v0) = v50 | v48;
      }
      else
      {
        OUTLINED_FUNCTION_171();
      }
    }
    else
    {
      sub_1B117F1FC(v0, type metadata accessor for SGBannerContainerView);
      OUTLINED_FUNCTION_171();
      v43 = v66;
      v42 = v67;
    }
  }
  OUTLINED_FUNCTION_50_0(v30, v43);
  OUTLINED_FUNCTION_50_0(v43, v42);
  v56 = v42 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED381510) + 48);
  *(_QWORD *)v56 = v22;
  *(_QWORD *)(v56 + 8) = v3;
  *(_QWORD *)(v56 + 16) = v5;
  *(_WORD *)(v56 + 24) = v0;
  v57 = OUTLINED_FUNCTION_187();
  sub_1B1188720(v57, v58, v59, v60);
  OUTLINED_FUNCTION_52_0(v30);
  v61 = OUTLINED_FUNCTION_187();
  sub_1B1188764(v61, v62, v63, v64);
  OUTLINED_FUNCTION_52_0(v43);
  OUTLINED_FUNCTION_15();
}

void sub_1B1185564(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;

  v4 = v3;
  v18[0] = a2;
  v18[1] = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381738);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381728);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817A0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    ((void (*)(uint64_t))v18[0])(v4);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v15, v12);
    swift_storeEnumTagMultiPayload();
    v16 = sub_1B1188540();
    v19 = v6;
    v20 = v16;
    swift_getOpaqueTypeConformance2();
    sub_1B11BAE88();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    sub_1B1188820(v4, (uint64_t)v8, &qword_1ED381738);
    sub_1B1188820((uint64_t)v8, (uint64_t)v11, &qword_1ED381738);
    swift_storeEnumTagMultiPayload();
    v17 = sub_1B1188540();
    v19 = v6;
    v20 = v17;
    swift_getOpaqueTypeConformance2();
    sub_1B11BAE88();
    sub_1B117F494((uint64_t)v8, &qword_1ED381738);
  }
}

void sub_1B1185774()
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
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  OUTLINED_FUNCTION_24();
  v34 = v1;
  v37 = v5;
  v38 = v4;
  v7 = v6;
  v9 = v8;
  v31 = v11;
  v32 = v10;
  v33 = v12;
  v36 = v13;
  v14 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_84_0();
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v31 - v17;
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_101_0();
  v22 = sub_1B11BAE94();
  v35 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v31 - v23;
  if ((v33 & 1) != 0)
  {
    v32(v34);
    OUTLINED_FUNCTION_99_0(v2, v0);
    v25 = *(void (**)(uint64_t))(v20 + 8);
    OUTLINED_FUNCTION_181();
    OUTLINED_FUNCTION_99_0(v0, v2);
    sub_1B1182CB0(v0, v7);
    OUTLINED_FUNCTION_181();
    v26 = OUTLINED_FUNCTION_111_0();
    v25(v26);
  }
  else
  {
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v27(v18, v34, v9);
    v27((char *)v3, (uint64_t)v18, v9);
    sub_1B1182D74(v3, v7, v9);
    v28 = *(void (**)(uint64_t))(v14 + 8);
    v29 = OUTLINED_FUNCTION_166();
    v28(v29);
    ((void (*)(char *, uint64_t))v28)(v18, v9);
  }
  v39[0] = v37;
  v39[1] = v38;
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v22, v39);
  v30 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v36, v24, v22);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v22);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1185950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = OUTLINED_FUNCTION_35_0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x1E0C80A78](v0);
  v3 = OUTLINED_FUNCTION_111_0();
  sub_1B1186804(v3, v4, type metadata accessor for SGBannerContainerView);
  v5 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v6 = swift_allocObject();
  sub_1B11883D0((uint64_t)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for SGBannerContainerView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381738);
  sub_1B1188540();
  sub_1B11BB0EC();
  return OUTLINED_FUNCTION_34();
}

void sub_1B1185A44(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = sub_1B11BAD80();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11030);
  sub_1B1185A84();
  OUTLINED_FUNCTION_41();
}

void sub_1B1185A84()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_24();
  v22 = v2;
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_85();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - v6;
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v21 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (uint64_t *)((char *)&v21 - v12);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (uint64_t *)((char *)&v21 - v15);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_102_0();
  sub_1B11ACF08();
  OUTLINED_FUNCTION_19_1();
  swift_allocObject();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_55_0(v1);
  sub_1B11AC9B8();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_55_0(v16);
  sub_1B11ACB20();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_55_0(v13);
  v17 = OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_50_0(v17, v18);
  OUTLINED_FUNCTION_50_0((uint64_t)v16, (uint64_t)v7);
  OUTLINED_FUNCTION_50_0((uint64_t)v13, v0);
  v19 = v22;
  OUTLINED_FUNCTION_50_0((uint64_t)v10, v22);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11078);
  OUTLINED_FUNCTION_50_0((uint64_t)v7, v19 + *(int *)(v20 + 48));
  OUTLINED_FUNCTION_50_0(v0, v19 + *(int *)(v20 + 64));
  OUTLINED_FUNCTION_52_0((uint64_t)v13);
  OUTLINED_FUNCTION_52_0((uint64_t)v16);
  OUTLINED_FUNCTION_52_0((uint64_t)v1);
  OUTLINED_FUNCTION_52_0(v0);
  OUTLINED_FUNCTION_52_0((uint64_t)v7);
  OUTLINED_FUNCTION_52_0((uint64_t)v10);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1185C34()
{
  OUTLINED_FUNCTION_189();
  return sub_1B11BABDC();
}

uint64_t sub_1B1185C64()
{
  OUTLINED_FUNCTION_189();
  return sub_1B11BABD0();
}

void sub_1B1185C94()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  _BYTE *v7;
  _BYTE *v8;
  int *v9;
  _BYTE *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_103();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  *v7 = v5;
  v9 = (int *)OUTLINED_FUNCTION_88_0();
  v10 = &v8[v9[5]];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_75_0();
  v21 = v11;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v10, v4, v0);
  *(_QWORD *)&v8[v9[6]] = v2;
  objc_opt_self();
  v12 = v2;
  v13 = OUTLINED_FUNCTION_142();
  v14 = objc_msgSend(v13, sel_userInterfaceIdiom);

  v8[v9[7]] = v14 == (id)6;
  v15 = OUTLINED_FUNCTION_142();
  v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  *(_QWORD *)&v8[v9[8]] = v16;
  if ((v6 & 1) != 0)
  {

    v17 = 1;
LABEL_7:
    v19 = v21;
    goto LABEL_8;
  }
  if (v14 != (id)6)
  {

    v17 = 0;
    goto LABEL_7;
  }
  v18 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v12) + 0x1F8);
  v19 = v21;
  if (v18() == 2)
  {

    v17 = 1;
  }
  else
  {
    v20 = v18();

    v17 = v20 == 3;
  }
LABEL_8:
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v4, v0);
  v8[v9[9]] = v17;
  OUTLINED_FUNCTION_112_0();
}

void sub_1B1185E10()
{
  unsigned __int8 *v0;
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
  int *v13;
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
  unsigned __int8 *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, _QWORD);
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, _QWORD);
  _QWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, _QWORD);
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  OUTLINED_FUNCTION_24();
  v73 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_5_0();
  v70 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381248);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_5_0();
  v69 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381188);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_5_0();
  v67 = v11;
  v12 = OUTLINED_FUNCTION_62_0();
  v13 = (int *)type metadata accessor for BannerViewBackgroundModifier(v12);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_5_0();
  v66 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_5_0();
  v68 = v17;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_5_0();
  v71 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811A8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381180);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_102();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_17_0();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_103_0();
  v25 = v0;
  v26 = *(_QWORD **)&v0[v13[6]];
  v27 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v28 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v26) + 0x258))();
  if (!v28)
  {
    v36 = (void *)(*(uint64_t (**)(void))((*v27 & *v26) + 0x240))();
    if (v36)
    {
      v37 = v36;
      v38 = sub_1B11BB338();
      v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381288);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_183(v71, v41);
      v42 = (_QWORD *)(v71 + *(int *)(v72 + 36));
      *v42 = v37;
      v42[1] = v38;
      v42[2] = v40;
      sub_1B1188820(v71, v3, &qword_1ED3810F8);
      OUTLINED_FUNCTION_54();
      sub_1B11866C8();
      sub_1B118662C();
      OUTLINED_FUNCTION_169();
      sub_1B1188820(v4, v2, &qword_1ED3811E8);
      OUTLINED_FUNCTION_42_0();
      sub_1B1186764();
      OUTLINED_FUNCTION_138_0();
      sub_1B11BAE88();

      OUTLINED_FUNCTION_125(v4);
      v34 = OUTLINED_FUNCTION_111_0();
      goto LABEL_14;
    }
    if (v25[v13[9]] != 1)
    {
      v58 = OUTLINED_FUNCTION_178();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381288);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_183(v1, v59);
      v60 = (uint64_t *)(v1 + *(int *)(v23 + 36));
      *v60 = v58;
      OUTLINED_FUNCTION_108_0((uint64_t)v60);
      v61 = &qword_1ED3810E8;
      OUTLINED_FUNCTION_30(v1, v70);
      OUTLINED_FUNCTION_54();
      sub_1B1186608();
      OUTLINED_FUNCTION_173();
      OUTLINED_FUNCTION_72_0();
      OUTLINED_FUNCTION_44_0(v69, v2);
      OUTLINED_FUNCTION_54();
      sub_1B1186764();
      OUTLINED_FUNCTION_138_0();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_12_0(v69);
      v34 = v1;
LABEL_13:
      v35 = v61;
      goto LABEL_14;
    }
    v43 = *v25;
    sub_1B1186804((uint64_t)v25, v66, type metadata accessor for BannerViewBackgroundModifier);
    if (v43 == 1)
    {
      v44 = *(_QWORD *)(v66 + v13[8]);
      sub_1B117F1FC(v66, type metadata accessor for BannerViewBackgroundModifier);
      v45 = v2;
      v46 = v73;
      v47 = v69;
      if (v44 == 6)
      {
        v48 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 18);
        v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v48);

        v50 = sub_1B11BB338();
        v52 = v51;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381288);
        OUTLINED_FUNCTION_113();
        v53(v71, v73);
        v54 = (_QWORD *)(v71 + *(int *)(v72 + 36));
        *v54 = v49;
        v54[1] = v50;
        v54[2] = v52;
        OUTLINED_FUNCTION_44_0(v71, v67);
        OUTLINED_FUNCTION_42_0();
        sub_1B118662C();
        sub_1B11866C8();
        v55 = v68;
        OUTLINED_FUNCTION_138();
        v56 = v71;
        v57 = &qword_1ED3810F8;
LABEL_12:
        sub_1B117F494(v56, v57);
        v61 = &qword_1ED3811F8;
        OUTLINED_FUNCTION_30(v55, v70);
        OUTLINED_FUNCTION_42_0();
        sub_1B1186608();
        OUTLINED_FUNCTION_173();
        OUTLINED_FUNCTION_72_0();
        OUTLINED_FUNCTION_44_0(v47, v45);
        OUTLINED_FUNCTION_54();
        sub_1B1186764();
        OUTLINED_FUNCTION_138_0();
        OUTLINED_FUNCTION_138();
        OUTLINED_FUNCTION_12_0(v47);
        v34 = v55;
        goto LABEL_13;
      }
    }
    else
    {
      sub_1B117F1FC(v66, type metadata accessor for BannerViewBackgroundModifier);
      v45 = v2;
      v46 = v73;
      v47 = v69;
    }
    v62 = OUTLINED_FUNCTION_178();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381288);
    v63 = OUTLINED_FUNCTION_164();
    v64(v63, v46);
    v65 = (uint64_t *)(v1 + *(int *)(v23 + 36));
    *v65 = v62;
    OUTLINED_FUNCTION_108_0((uint64_t)v65);
    OUTLINED_FUNCTION_30(v1, v67);
    OUTLINED_FUNCTION_54();
    sub_1B118662C();
    OUTLINED_FUNCTION_173();
    v55 = v68;
    OUTLINED_FUNCTION_72_0();
    v56 = v1;
    v57 = &qword_1ED3810E8;
    goto LABEL_12;
  }
  v29 = v28;
  v30 = MEMORY[0x1B5E17248]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381288);
  v31 = OUTLINED_FUNCTION_164();
  OUTLINED_FUNCTION_183(v31, v32);
  v33 = (uint64_t *)(v1 + *(int *)(v23 + 36));
  *v33 = v30;
  OUTLINED_FUNCTION_108_0((uint64_t)v33);
  OUTLINED_FUNCTION_44_0(v1, v3);
  OUTLINED_FUNCTION_42_0();
  sub_1B11866C8();
  sub_1B118662C();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_139_0(v4, v2);
  OUTLINED_FUNCTION_42_0();
  sub_1B1186764();
  OUTLINED_FUNCTION_138_0();
  OUTLINED_FUNCTION_169();

  OUTLINED_FUNCTION_75(v4);
  v34 = v1;
  v35 = &qword_1ED3810E8;
LABEL_14:
  sub_1B117F494(v34, v35);
  OUTLINED_FUNCTION_15();
}

id sub_1B1186518()
{
  id *v0;

  return *v0;
}

uint64_t sub_1B1186530()
{
  return sub_1B11BAE04();
}

uint64_t sub_1B1186570()
{
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE64();
}

uint64_t sub_1B11865A0()
{
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE10();
}

void sub_1B11865D0()
{
  sub_1B11881B4();
  sub_1B11BAE58();
  __break(1u);
}

uint64_t type metadata accessor for BannerViewBackgroundModifier(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED3820B0);
}

void sub_1B1186608()
{
  sub_1B1186788((uint64_t)&unk_1ED3811F0);
}

unint64_t sub_1B118662C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED3810F0;
  if (!qword_1ED3810F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3810F8);
    sub_1B11884E0((uint64_t)&unk_1ED381280);
    v3 = v2;
    sub_1B11884E0((uint64_t)&unk_1ED381818);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED3810F0);
  }
  return result;
}

unint64_t sub_1B11866C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED3810E0;
  if (!qword_1ED3810E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3810E8);
    sub_1B11884E0((uint64_t)&unk_1ED381280);
    v3 = v2;
    sub_1B11884E0((uint64_t)&unk_1ED381828);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED3810E0);
  }
  return result;
}

void sub_1B1186764()
{
  sub_1B1186788((uint64_t)&unk_1ED3811E0);
}

void sub_1B1186788(uint64_t a1)
{
  uint64_t *v1;
  void (*v2)(void);
  void (*v3)(void);
  void (*v4)(void);
  void (*v5)(void);

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v4 = v3;
    v5 = v2;
    OUTLINED_FUNCTION_115_0(0, v1);
    v5();
    v4();
    OUTLINED_FUNCTION_67();
  }
  OUTLINED_FUNCTION_45_0();
}

void sub_1B11867E0()
{
  sub_1B1186788((uint64_t)&unk_1ED381240);
}

void sub_1B1186804(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_135_0(a1, a2, a3);
  OUTLINED_FUNCTION_61(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1186830()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B1186864()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1B1186870()
{
  return OUTLINED_FUNCTION_2_0();
}

unint64_t sub_1B1186880()
{
  unint64_t result;

  result = qword_1EEF11038;
  if (!qword_1EEF11038)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE0E8, &unk_1E62D5458);
    atomic_store(result, (unint64_t *)&qword_1EEF11038);
  }
  return result;
}

uint64_t sub_1B11868BC()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11868C8()
{
  return OUTLINED_FUNCTION_2_0();
}

unint64_t sub_1B11868D8()
{
  unint64_t result;

  result = qword_1EEF11040;
  if (!qword_1EEF11040)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE1F8, &unk_1E62D5478);
    atomic_store(result, (unint64_t *)&qword_1EEF11040);
  }
  return result;
}

uint64_t sub_1B1186914()
{
  return MEMORY[0x1E0CE0788];
}

void type metadata accessor for CloseButtonWidthPreferenceKey()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for ActionButtonWidthPreferenceKey()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B1186938()
{
  return swift_allocateGenericValueMetadata();
}

void sub_1B1186940(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_162(a1, (unint64_t *)&qword_1ED381898, (void (*)(uint64_t))MEMORY[0x1E0CDB388]);
  if (v1 <= 0x3F)
    swift_initStructMetadata();
  OUTLINED_FUNCTION_148();
}

void sub_1B11869BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_64_0(v4);
  }
  else
  {
    v5 = a2[1];
    *a1 = v4;
    a1[1] = v5;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_39() == 1)
    {
      v6 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_18_0(v6);
    }
    else
    {
      OUTLINED_FUNCTION_61_1();
    }
    OUTLINED_FUNCTION_185();
    swift_storeEnumTagMultiPayload();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B1186A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = OUTLINED_FUNCTION_15_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void sub_1B1186AC0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_39() == 1)
  {
    v4 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_18_0(v4);
  }
  else
  {
    OUTLINED_FUNCTION_61_1();
  }
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_5();
}

void sub_1B1186B2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  OUTLINED_FUNCTION_155();
  if (a1 != a2)
  {
    OUTLINED_FUNCTION_75((uint64_t)a1 + *(int *)(a3 + 36));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_39() == 1)
    {
      v7 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_18_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_61_1();
    }
    OUTLINED_FUNCTION_112();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1B1186BBC(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;

  *a1 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    v2 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_48(v2);
    OUTLINED_FUNCTION_54();
  }
  else
  {
    OUTLINED_FUNCTION_79();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1B1186C24(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    OUTLINED_FUNCTION_125((uint64_t)a1 + *(int *)(a3 + 36));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_90() == 1)
    {
      v6 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_48(v6);
      OUTLINED_FUNCTION_54();
    }
    else
    {
      OUTLINED_FUNCTION_79();
    }
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B1186CB0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1186CBC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_122_0(*a1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
    OUTLINED_FUNCTION_49((uint64_t)a1 + *(int *)(a3 + 36), a2, v6);
  }
}

uint64_t sub_1B1186D18()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B1186D24()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_152();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
    v5 = OUTLINED_FUNCTION_109_0(*(int *)(v4 + 36));
    OUTLINED_FUNCTION_50(v5, v6, v7, v8);
  }
}

void sub_1B1186D70()
{
  unint64_t v0;

  sub_1B1188174(319, (unint64_t *)&qword_1ED381AD8, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
  OUTLINED_FUNCTION_148();
}

uint64_t method lookup function for BannerUpdateViewModel()
{
  return swift_lookUpClassMethod();
}

void initializeBufferWithCopyOfBuffer for SGBannerContainerView(void **a1, void **a2, uint64_t a3)
{
  int v3;
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void *v42;
  int *v43;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) == 0)
  {
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    *(_DWORD *)v6 = *(_DWORD *)((char *)a2 + v5);
    v6[4] = *((_BYTE *)a2 + v5 + 4);
    *(_WORD *)(v6 + 5) = *(_WORD *)((char *)a2 + v5 + 5);
    v8 = *(uint64_t *)((char *)a2 + v5 + 16);
    *((_QWORD *)v6 + 1) = *(void **)((char *)a2 + v5 + 8);
    *((_QWORD *)v6 + 2) = v8;
    v43 = (int *)OUTLINED_FUNCTION_19();
    v9 = v43[12];
    v10 = &v6[v9];
    v11 = &v7[v9];
    *v10 = v7[v9];
    *(_WORD *)(v10 + 1) = *(_WORD *)&v7[v9 + 1];
    *(_OWORD *)(v10 + 8) = *(_OWORD *)&v7[v9 + 8];
    v12 = *(void **)&v7[v9 + 32];
    *((_QWORD *)v10 + 3) = *(_QWORD *)&v7[v9 + 24];
    *((_QWORD *)v10 + 4) = v12;
    v14 = *(void **)&v7[v9 + 40];
    v13 = *(_QWORD *)&v7[v9 + 48];
    *((_QWORD *)v10 + 5) = v14;
    *((_QWORD *)v10 + 6) = v13;
    v16 = (char *)*((_QWORD *)v11 + 7);
    v15 = *((_QWORD *)v11 + 8);
    *((_QWORD *)v10 + 7) = v16;
    *((_QWORD *)v10 + 8) = v15;
    v18 = (char *)*((_QWORD *)v11 + 9);
    v17 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v10 + 9) = v18;
    *((_QWORD *)v10 + 10) = v17;
    v19 = *((_QWORD *)v11 + 12);
    v42 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v10 + 11) = v42;
    *((_QWORD *)v10 + 12) = v19;
    v20 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
    v40 = &v11[v20];
    v41 = &v10[v20];
    v21 = OUTLINED_FUNCTION_56_0();
    v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
    v23 = v4;
    swift_bridgeObjectRetain();
    v24 = v12;
    v25 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = v17;
    v27 = v42;
    v22(v41, v40, v21);
    v28 = v43[13];
    v29 = &v6[v28];
    v30 = &v7[v28];
    v31 = *((_QWORD *)v30 + 1);
    *(_QWORD *)v29 = *(_QWORD *)v30;
    *((_QWORD *)v29 + 1) = v31;
    *((_WORD *)v29 + 8) = *((_WORD *)v30 + 8);
    v32 = v43[14];
    v33 = &v6[v32];
    OUTLINED_FUNCTION_41_1(v32);
    OUTLINED_FUNCTION_191();
    OUTLINED_FUNCTION_131_0();
    swift_retain();
    v22(v16, v18, v21);
    OUTLINED_FUNCTION_134_0();
    v33[v34] = v35;
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_131_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v36 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1(v36);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
    OUTLINED_FUNCTION_137_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v37 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_6_1(v37);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
    OUTLINED_FUNCTION_24_1();
    *(_QWORD *)(v39 + 8) = *(_QWORD *)(v38 + 8);
  }
  OUTLINED_FUNCTION_131_0();
  OUTLINED_FUNCTION_60_0();
}

uint64_t destroy for SGBannerContainerView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  v5 = OUTLINED_FUNCTION_19();
  v6 = (id *)&v4[*(int *)(v5 + 48)];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = (uint64_t)v6 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_104_0(v7);
  swift_release();
  swift_release();
  v8 = &v4[*(int *)(v5 + 56)];
  v9 = OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_104_0((uint64_t)&v8[*(int *)(v9 + 56)]);

  OUTLINED_FUNCTION_150();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v10 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_1(v10);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v11 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_11_1(v11);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  return swift_release();
}

void initializeWithCopy for SGBannerContainerView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int *v38;

  v37 = *a2;
  *a1 = *a2;
  v3 = *(int *)(a3 + 20);
  v4 = (char *)a1 + v3;
  v5 = (char *)a2 + v3;
  *(_DWORD *)v4 = *(_DWORD *)((char *)a2 + v3);
  v4[4] = *((_BYTE *)a2 + v3 + 4);
  *(_WORD *)(v4 + 5) = *(_WORD *)((char *)a2 + v3 + 5);
  v6 = *(uint64_t *)((char *)a2 + v3 + 16);
  *((_QWORD *)v4 + 1) = *(void **)((char *)a2 + v3 + 8);
  *((_QWORD *)v4 + 2) = v6;
  v38 = (int *)OUTLINED_FUNCTION_19();
  v7 = v38[12];
  v8 = &v4[v7];
  v9 = &v5[v7];
  *v8 = v5[v7];
  *(_WORD *)(v8 + 1) = *(_WORD *)&v5[v7 + 1];
  *(_OWORD *)(v8 + 8) = *(_OWORD *)&v5[v7 + 8];
  v10 = *(void **)&v5[v7 + 32];
  *((_QWORD *)v8 + 3) = *(_QWORD *)&v5[v7 + 24];
  *((_QWORD *)v8 + 4) = v10;
  v12 = *(void **)&v5[v7 + 40];
  v11 = *(_QWORD *)&v5[v7 + 48];
  *((_QWORD *)v8 + 5) = v12;
  *((_QWORD *)v8 + 6) = v11;
  v13 = *((_QWORD *)v9 + 8);
  *((_QWORD *)v8 + 7) = *((_QWORD *)v9 + 7);
  *((_QWORD *)v8 + 8) = v13;
  v15 = *((_QWORD *)v9 + 9);
  v14 = (void *)*((_QWORD *)v9 + 10);
  *((_QWORD *)v8 + 9) = v15;
  *((_QWORD *)v8 + 10) = v14;
  v17 = (void *)*((_QWORD *)v9 + 11);
  v16 = *((_QWORD *)v9 + 12);
  *((_QWORD *)v8 + 11) = v17;
  *((_QWORD *)v8 + 12) = v16;
  v18 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v35 = (uint64_t)&v9[v18];
  v36 = (uint64_t)&v8[v18];
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  v19 = v37;
  swift_bridgeObjectRetain();
  v20 = v10;
  v21 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = v14;
  v23 = v17;
  OUTLINED_FUNCTION_100(v36, v35);
  v24 = v38[13];
  v25 = &v4[v24];
  v26 = &v5[v24];
  v27 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *((_QWORD *)v25 + 1) = v27;
  *((_WORD *)v25 + 8) = *((_WORD *)v26 + 8);
  v28 = v38[14];
  v29 = &v4[v28];
  OUTLINED_FUNCTION_41_1(v28);
  OUTLINED_FUNCTION_191();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_100(v15, (uint64_t)v12);
  OUTLINED_FUNCTION_134_0();
  v29[v30] = v31;
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_131_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_13_2() == 1)
  {
    v32 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_6_1(v32);
  }
  else
  {
    OUTLINED_FUNCTION_31_0();
  }
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_137_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_13_2() == 1)
  {
    v33 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_6_1(v33);
  }
  else
  {
    OUTLINED_FUNCTION_31_0();
  }
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_151(v34);
  OUTLINED_FUNCTION_60_0();
}

void assignWithCopy for SGBannerContainerView()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void **v5;
  void *v6;
  void *v7;
  id v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;

  OUTLINED_FUNCTION_103();
  v47 = v4;
  OUTLINED_FUNCTION_106_0();
  v6 = *v5;
  *v5 = v7;
  v8 = v7;

  OUTLINED_FUNCTION_14_1();
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(v3 + 8);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = (int *)OUTLINED_FUNCTION_19();
  v10 = v9[12];
  v11 = v2 + v10;
  v12 = (_QWORD *)(v3 + v10);
  *(_BYTE *)v11 = *(_BYTE *)(v3 + v10);
  *(_BYTE *)(v11 + 1) = *(_BYTE *)(v3 + v10 + 1);
  *(_BYTE *)(v11 + 2) = *(_BYTE *)(v3 + v10 + 2);
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v3 + v10 + 8);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v3 + v10 + 16);
  *(_QWORD *)(v11 + 24) = *(_QWORD *)(v3 + v10 + 24);
  v13 = *(void **)(v2 + v10 + 32);
  v14 = *(void **)(v3 + v10 + 32);
  *(_QWORD *)(v11 + 32) = v14;
  v15 = v14;

  v16 = *(void **)(v11 + 40);
  v17 = (void *)v12[5];
  *(_QWORD *)(v11 + 40) = v17;
  v18 = v17;

  *(_QWORD *)(v11 + 48) = v12[6];
  *(_QWORD *)(v11 + 56) = v12[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 64) = v12[8];
  *(_QWORD *)(v11 + 72) = v12[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = *(void **)(v11 + 80);
  v20 = (void *)v12[10];
  *(_QWORD *)(v11 + 80) = v20;
  v21 = v20;

  v22 = *(void **)(v11 + 88);
  v23 = (void *)v12[11];
  *(_QWORD *)(v11 + 88) = v23;
  v24 = v23;

  *(_QWORD *)(v11 + 96) = v12[12];
  v25 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v26 = v11 + v25;
  v27 = (uint64_t)v12 + v25;
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_100(v26, v27);
  v28 = v9[13];
  v29 = v2 + v28;
  v30 = v3 + v28;
  *(_QWORD *)(v2 + v28) = *(_QWORD *)(v3 + v28);
  swift_retain();
  swift_release();
  *(_QWORD *)(v29 + 8) = *(_QWORD *)(v30 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(v29 + 16) = *(_BYTE *)(v30 + 16);
  *(_BYTE *)(v29 + 17) = *(_BYTE *)(v30 + 17);
  v31 = v9[14];
  v32 = (_QWORD *)(v2 + v31);
  v33 = v3 + v31;
  *v32 = *(_QWORD *)(v3 + v31);
  v32[1] = *(_QWORD *)(v3 + v31 + 8);
  v32[2] = *(_QWORD *)(v3 + v31 + 16);
  v32[3] = *(_QWORD *)(v3 + v31 + 24);
  v32[4] = *(_QWORD *)(v3 + v31 + 32);
  v32[5] = *(_QWORD *)(v3 + v31 + 40);
  v32[6] = *(_QWORD *)(v3 + v31 + 48);
  v32[7] = *(_QWORD *)(v3 + v31 + 56);
  v32[8] = *(_QWORD *)(v3 + v31 + 64);
  v32[9] = *(_QWORD *)(v3 + v31 + 72);
  v34 = (int *)OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_100((uint64_t)v32 + v34[14], v33 + v34[14]);
  *(_QWORD *)((char *)v32 + v34[15]) = *(_QWORD *)(v33 + v34[15]);
  *((_BYTE *)v32 + v34[16]) = *(_BYTE *)(v33 + v34[16]);
  v35 = v47[6];
  v36 = *(void **)(v0 + v35);
  v37 = *(void **)(v1 + v35);
  *(_QWORD *)(v0 + v35) = v37;
  v38 = v37;

  v39 = v47[7];
  v40 = (_QWORD *)(v0 + v39);
  v41 = (_QWORD *)(v1 + v39);
  *v40 = *v41;
  v40[1] = v41[1];
  swift_retain();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_179();
  if (!v42)
  {
    v43 = v0 + v47[9];
    OUTLINED_FUNCTION_105(v43);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v44 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1(v44);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
    OUTLINED_FUNCTION_137_0();
    OUTLINED_FUNCTION_105(v43);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v45 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_6_1(v45);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
  }
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_151(v46);
  swift_release();
  OUTLINED_FUNCTION_112_0();
}

void initializeWithTake for SGBannerContainerView()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_24();
  v6 = v5;
  OUTLINED_FUNCTION_106_0();
  *v7 = v8;
  v10 = *(int *)(v9 + 20);
  v11 = (char *)v7 + v10;
  v13 = v12 + v10;
  *(_DWORD *)v11 = *(_DWORD *)(v12 + v10);
  v11[4] = *(_BYTE *)(v12 + v10 + 4);
  *(_WORD *)(v11 + 5) = *(_WORD *)(v12 + v10 + 5);
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(v12 + v10 + 8);
  v14 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_97_0(v14);
  *(_WORD *)(v3 + 1) = *(_WORD *)(v4 + 1);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v4 + 8);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v4 + 24);
  v15 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v3 + 48) = v15;
  v16 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v4 + 64);
  *(_OWORD *)(v3 + 80) = v16;
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_130();
  v17 = *(int *)(v2 + 52);
  v18 = &v11[v17];
  v19 = v13 + v17;
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *((_WORD *)v18 + 8) = *(_WORD *)(v19 + 16);
  v20 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v20);
  OUTLINED_FUNCTION_91_0();
  v21 = v6[7];
  *(_QWORD *)(v0 + v6[6]) = *(_QWORD *)(v1 + v6[6]);
  *(_OWORD *)(v0 + v21) = *(_OWORD *)(v1 + v21);
  *(_BYTE *)(v0 + v6[8]) = *(_BYTE *)(v1 + v6[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_34_1() == 1)
  {
    v22 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_7_1(v22);
    OUTLINED_FUNCTION_54();
  }
  else
  {
    OUTLINED_FUNCTION_20_2();
  }
  OUTLINED_FUNCTION_177();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_34_1() == 1)
  {
    v23 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_7_1(v23);
    OUTLINED_FUNCTION_54();
  }
  else
  {
    OUTLINED_FUNCTION_20_2();
  }
  *(_OWORD *)(v0 + v6[11]) = *(_OWORD *)(v1 + v6[11]);
  OUTLINED_FUNCTION_15();
}

void assignWithTake for SGBannerContainerView()
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
  void **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_24();
  v8 = v7;
  OUTLINED_FUNCTION_106_0();
  v10 = *v9;
  *v9 = v11;

  OUTLINED_FUNCTION_14_1();
  v12 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(v5 + 8) = *(_QWORD *)(v6 + 8);
  *(_QWORD *)(v5 + 16) = v12;
  swift_bridgeObjectRelease();
  v13 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_97_0(v13);
  *(_BYTE *)(v3 + 1) = *(_BYTE *)(v4 + 1);
  *(_BYTE *)(v3 + 2) = *(_BYTE *)(v4 + 2);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v4 + 8);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v4 + 24);
  v14 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v4 + 32);

  v15 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v4 + 40);

  v16 = *(_QWORD *)(v4 + 56);
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v4 + 48);
  *(_QWORD *)(v3 + 56) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v4 + 72);
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(v4 + 64);
  *(_QWORD *)(v3 + 72) = v17;
  swift_bridgeObjectRelease();
  v18 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(v4 + 80);

  v19 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(v4 + 88);

  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_130();
  v20 = *(int *)(v2 + 52);
  v21 = v5 + v20;
  v22 = v6 + v20;
  *(_QWORD *)(v5 + v20) = *(_QWORD *)(v6 + v20);
  swift_release();
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  swift_release();
  *(_BYTE *)(v21 + 16) = *(_BYTE *)(v22 + 16);
  *(_BYTE *)(v21 + 17) = *(_BYTE *)(v22 + 17);
  v23 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v23);
  OUTLINED_FUNCTION_91_0();
  v24 = *(int *)(v8 + 24);
  v25 = *(void **)(v0 + v24);
  *(_QWORD *)(v0 + v24) = *(_QWORD *)(v1 + v24);

  v26 = *(int *)(v8 + 28);
  v27 = (_QWORD *)(v0 + v26);
  v28 = (uint64_t *)(v1 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_release();
  OUTLINED_FUNCTION_179();
  if (!v31)
  {
    OUTLINED_FUNCTION_177();
    OUTLINED_FUNCTION_154();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_34_1() == 1)
    {
      v32 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_7_1(v32);
      OUTLINED_FUNCTION_54();
    }
    else
    {
      OUTLINED_FUNCTION_20_2();
    }
    OUTLINED_FUNCTION_177();
    OUTLINED_FUNCTION_154();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_34_1() == 1)
    {
      v33 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_7_1(v33);
      OUTLINED_FUNCTION_54();
    }
    else
    {
      OUTLINED_FUNCTION_20_2();
    }
  }
  OUTLINED_FUNCTION_24_1();
  *(_QWORD *)(v35 + 8) = *(_QWORD *)(v34 + 8);
  swift_release();
  OUTLINED_FUNCTION_15();
}

uint64_t getEnumTagSinglePayload for SGBannerContainerView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1187A60(unint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_122_0(*a1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_117_0();
    if (v9)
    {
      v7 = v6;
      v8 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11050);
      OUTLINED_FUNCTION_117_0();
      if (v9)
      {
        v7 = v10;
        v8 = a3[9];
      }
      else
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
        v8 = a3[10];
      }
    }
    OUTLINED_FUNCTION_49((uint64_t)a1 + v8, a2, v7);
  }
}

uint64_t storeEnumTagSinglePayload for SGBannerContainerView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B1187B00()
{
  int v0;
  _QWORD *v1;
  int *v2;
  int *v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_152();
  if (v4)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v3 = v2;
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_116_0();
    if (v4)
    {
      v5 = v3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11050);
      OUTLINED_FUNCTION_116_0();
      if (v6)
      {
        v5 = v3[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
        v5 = v3[10];
      }
    }
    v7 = OUTLINED_FUNCTION_109_0(v5);
    OUTLINED_FUNCTION_50(v7, v8, v9, v10);
  }
}

void sub_1B1187B88()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  type metadata accessor for SGBannerViewModel(319);
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_162(v1, (unint64_t *)&qword_1ED3818A8, (void (*)(uint64_t))MEMORY[0x1E0CD86F8]);
    if (v2 <= 0x3F)
    {
      OUTLINED_FUNCTION_167();
      OUTLINED_FUNCTION_162(v3, (unint64_t *)&qword_1ED381898, (void (*)(uint64_t))MEMORY[0x1E0CDB388]);
      if (v4 <= 0x3F)
      {
        OUTLINED_FUNCTION_167();
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1B1187C68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B11BAAEC();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_41();
}

void type metadata accessor for SGBannerContainerView_Previews()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B1187CBC(_BYTE *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  if ((*(_DWORD *)(*((_QWORD *)a3 - 1) + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_64_0(*a2);
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    OUTLINED_FUNCTION_177();
    v6 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
    v7 = a3[6];
    v8 = a3[7];
    v9 = *(void **)((char *)a2 + v7);
    *(_QWORD *)&a1[v7] = v9;
    a1[v8] = *((_BYTE *)a2 + v8);
    v10 = a3[9];
    *(_QWORD *)&a1[a3[8]] = *(uint64_t *)((char *)a2 + a3[8]);
    a1[v10] = *((_BYTE *)a2 + v10);
    v11 = v9;
  }
  OUTLINED_FUNCTION_22();
}

void sub_1B1187D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11_1(v4);

}

void sub_1B1187D90(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_81_0();
  *(_QWORD *)(v3 + v5) = *(_QWORD *)(v2 + v5);
  *(_BYTE *)(v3 + v6) = *(_BYTE *)(v2 + v6);
  v8 = v7;
  OUTLINED_FUNCTION_22();
}

void sub_1B1187DDC(_BYTE *a1, _BYTE *a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24));
  v6 = v2[6];
  v7 = *(void **)(v3 + v6);
  v8 = *(void **)(v4 + v6);
  *(_QWORD *)(v4 + v6) = v7;
  v9 = v7;

  *(_BYTE *)(v4 + v2[7]) = *(_BYTE *)(v3 + v2[7]);
  *(_QWORD *)(v4 + v2[8]) = *(_QWORD *)(v3 + v2[8]);
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_22();
}

void sub_1B1187E3C(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_7_1(v4);
  OUTLINED_FUNCTION_81_0();
  *(_QWORD *)(v3 + v5) = *(_QWORD *)(v2 + v5);
  *(_BYTE *)(v3 + v6) = *(_BYTE *)(v2 + v6);
  OUTLINED_FUNCTION_22();
}

void sub_1B1187E78(_BYTE *a1, _BYTE *a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40));
  v6 = v2[6];
  v7 = *(void **)(v4 + v6);
  *(_QWORD *)(v4 + v6) = *(_QWORD *)(v3 + v6);

  v8 = v2[8];
  *(_BYTE *)(v4 + v2[7]) = *(_BYTE *)(v3 + v2[7]);
  *(_QWORD *)(v4 + v8) = *(_QWORD *)(v3 + v8);
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B1187ED0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1187EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_117_0();
  if (v7)
  {
    OUTLINED_FUNCTION_49(a1 + *(int *)(a3 + 20), a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_122_0(*(_QWORD *)(a1 + *(int *)(a3 + 24)));
    OUTLINED_FUNCTION_5();
  }
}

uint64_t sub_1B1187F30()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B1187F3C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_116_0();
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_109_0(*(int *)(a4 + 20));
    OUTLINED_FUNCTION_50(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
    OUTLINED_FUNCTION_5();
  }
}

uint64_t sub_1B1187F90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BAAD4();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_167();
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for VisualEffectView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B118802C()
{
  sub_1B11BB29C();
  sub_1B11BB284();
  sub_1B11BAE94();
  sub_1B11BB1E8();
  OUTLINED_FUNCTION_98_0();
}

void sub_1B118809C()
{
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11880AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  a12 = a1;
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v12, &a11);
  OUTLINED_FUNCTION_67();
}

void sub_1B11880D8()
{
  OUTLINED_FUNCTION_81();
}

void sub_1B11880E0()
{
  sub_1B11883FC((uint64_t)&unk_1ED381128);
}

void sub_1B1188114()
{
  sub_1B11884E0((uint64_t)&unk_1EEF11058);
}

void sub_1B1188140()
{
  sub_1B1186788((uint64_t)&unk_1ED381230);
}

void sub_1B1188174(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(a1, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
  OUTLINED_FUNCTION_41();
}

unint64_t sub_1B11881B4()
{
  unint64_t result;

  result = qword_1EEF11068;
  if (!qword_1EEF11068)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE168, &unk_1E62D5478);
    atomic_store(result, (unint64_t *)&qword_1EEF11068);
  }
  return result;
}

unint64_t sub_1B11881F0()
{
  unint64_t result;

  result = qword_1EEF11070;
  if (!qword_1EEF11070)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE0A0, &unk_1E62D5458);
    atomic_store(result, (unint64_t *)&qword_1EEF11070);
  }
  return result;
}

void sub_1B118822C(uint64_t a1)
{
  uint64_t *v1;
  void (*v2)(void);
  void (*v3)(void);

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v3 = v2;
    OUTLINED_FUNCTION_115_0(0, v1);
    v3();
    OUTLINED_FUNCTION_98_0();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B1188280()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED381110;
  if (!qword_1ED381110)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381118);
    sub_1B11884E0((uint64_t)&unk_1ED3812C0);
    v3 = v2;
    sub_1B117CB38((uint64_t)&unk_1ED381090);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED381110);
  }
  return result;
}

unint64_t sub_1B118831C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381200;
  if (!qword_1ED381200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381208);
    sub_1B118822C((uint64_t)&unk_1ED381158);
    v3[0] = v2;
    v3[1] = sub_1B1188280();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381200);
  }
  return result;
}

void sub_1B11883A4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_137();
  sub_1B11845E4((void **)(v0 + v1));
}

void sub_1B11883D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_135_0(a1, a2, a3);
  OUTLINED_FUNCTION_61(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_41();
}

void sub_1B11883FC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v3 = v2;
    OUTLINED_FUNCTION_115_0(0, v1);
    sub_1B11884E0(v3);
    OUTLINED_FUNCTION_67();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B1188464()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1ED3817A8;
  if (!qword_1ED3817A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3817B0);
    sub_1B11884E0((uint64_t)&unk_1ED3817C0);
    v3 = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDF690], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_1ED3817A8);
  }
  return result;
}

void sub_1B11884E0(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_115_0(0, v1);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B118850C()
{
  return sub_1B1185950();
}

void sub_1B1188514(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_84(a1, a2, a3);
  OUTLINED_FUNCTION_61(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_41();
}

unint64_t sub_1B1188540()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381730;
  if (!qword_1ED381730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381738);
    sub_1B118822C((uint64_t)&unk_1ED3816F0);
    v3[0] = v2;
    v3[1] = sub_1B1188464();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381730);
  }
  return result;
}

void sub_1B11885C8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  type metadata accessor for SGBannerContainerView(0);
  OUTLINED_FUNCTION_137();
  v2 = *(_QWORD **)(v0 + v1);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x198))();
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_suggestionPrimaryAction);
    objc_msgSend(v5, sel_execute);

    swift_unknownObjectRelease();
  }
  else
  {
    v6 = (void *)(*(uint64_t (**)(void))((*v3 & *v2) + 0x2A0))();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_execute);

    }
    else
    {
      OUTLINED_FUNCTION_180();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380FA8);
      sub_1B11BB248();
      sub_1B11BB254();
      OUTLINED_FUNCTION_133_0();
    }
  }
}

uint64_t sub_1B1188720(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  if (HIBYTE(a4) != 255)
    return (uint64_t)sub_1B1188738(a1, a2, a3);
  return a1;
}

id sub_1B1188738(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

void sub_1B1188764(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  if (HIBYTE(a4) != 255)
    sub_1B118877C(a1, a2, a3);
}

void sub_1B118877C(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();

}

unint64_t sub_1B11887A8()
{
  unint64_t result;

  result = qword_1ED380F80;
  if (!qword_1ED380F80)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE7A0, &unk_1E62D5918);
    atomic_store(result, (unint64_t *)&qword_1ED380F80);
  }
  return result;
}

unint64_t sub_1B11887E4()
{
  unint64_t result;

  result = qword_1ED380F88;
  if (!qword_1ED380F88)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE7F0, &unk_1E62D59A8);
    atomic_store(result, (unint64_t *)&qword_1ED380F88);
  }
  return result;
}

void sub_1B1188820(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_84(a1, a2, a3);
  OUTLINED_FUNCTION_61(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_41();
}

void OUTLINED_FUNCTION_138_0()
{
  sub_1B11867E0();
}

id OUTLINED_FUNCTION_142()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 2248));
}

void OUTLINED_FUNCTION_143_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 168) = (char *)&a9 - v9;
}

void OUTLINED_FUNCTION_144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 152) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_145()
{
  return sub_1B11BB23C();
}

uint64_t OUTLINED_FUNCTION_149_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_150()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_151@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

void OUTLINED_FUNCTION_154()
{
  uint64_t v0;
  uint64_t *v1;

  sub_1B117F494(v0, v1);
}

uint64_t OUTLINED_FUNCTION_155()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_156(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_158()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_160()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

void OUTLINED_FUNCTION_162(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1B1187C68(319, a2, a3);
}

uint64_t OUTLINED_FUNCTION_164()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_165@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_166()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_169()
{
  return sub_1B11BAE88();
}

unint64_t OUTLINED_FUNCTION_173()
{
  return sub_1B11866C8();
}

void OUTLINED_FUNCTION_174(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188514(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_175()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(v0 + 36)) = *(_BYTE *)(v1 + *(int *)(v0 + 36));
  return v2;
}

uint64_t OUTLINED_FUNCTION_178()
{
  return sub_1B1175B40();
}

void OUTLINED_FUNCTION_179()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + *(int *)(v2 + 32)) = *(_BYTE *)(v1 + *(int *)(v2 + 32));
}

uint64_t OUTLINED_FUNCTION_180()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_181()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_183@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_187()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_189()
{
  return sub_1B11881F0();
}

uint64_t sub_1B1188A5C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate;
  OUTLINED_FUNCTION_2();
  return MEMORY[0x1B5E17D58](v1);
}

uint64_t sub_1B1188AEC()
{
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_1B1188B40@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1188B80(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x88);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B1188BC0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_2();
  v3[3] = MEMORY[0x1B5E17D58](v5);
  return sub_1B1188C2C;
}

void sub_1B1188C2C(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    OUTLINED_FUNCTION_22_1();
  }
  free(v3);
}

void SGContactSuggestion.__allocating_init(sgContact:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  SGContactSuggestion.init(sgContact:)(a1);
  OUTLINED_FUNCTION_41();
}

id SGContactSuggestion.init(sgContact:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  objc_super v15;

  v3 = OUTLINED_FUNCTION_56_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v7 = &v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_kStringKeyLabeledValueFormat];
  *(_QWORD *)v7 = 0xD00000000000002BLL;
  *((_QWORD *)v7 + 1) = 0x80000001B11C0580;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact] = a1;
  v8 = v1;
  v9 = a1;
  sub_1B11758DC();
  swift_bridgeObjectRetain();
  sub_1B11BA9FC();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v8[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger], v6, v3);
  v10 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  v8[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice] = v11 == (id)6;
  v12 = (objc_class *)type metadata accessor for SGContactSuggestion();
  v15.receiver = v8;
  v15.super_class = v12;
  v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

uint64_t sub_1B1188E7C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  id v9;
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
  unint64_t v20;
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
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
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
  __n128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __n128 v66;
  uint64_t v67;
  id v69;
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
  __n128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __n128 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;

  v0 = OUTLINED_FUNCTION_7_2();
  if (!(_DWORD)v0)
  {
    v3 = currentUIContext();
    if (!v3)
    {
      v31 = OUTLINED_FUNCTION_9(0, sel_state);
      if ((_DWORD)v31 != 1)
      {
        v69 = OUTLINED_FUNCTION_9((uint64_t)v31, sel_contact);
        sub_1B119EC40((uint64_t)&v91);

        sub_1B119EF08(v93);
        OUTLINED_FUNCTION_60_1();
        v78 = OUTLINED_FUNCTION_40_1(v70, v71, v72, v73, v74, v75, v76, v77, v87, v91, v92.n128_i64[0], v92.n128_i64[1], v93, v94, v95, v96);
        OUTLINED_FUNCTION_9_2(v92, v78, v79, v80, v81, v82, v83, v84, v85, v90, v91, *((uint64_t *)&v91 + 1), v92.n128_i64[0], v92.n128_i64[1], v93, v86);
        return OUTLINED_FUNCTION_185();
      }
      OUTLINED_FUNCTION_47_1();
      OUTLINED_FUNCTION_59_0(v32 - 11);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
      v33 = OUTLINED_FUNCTION_4_0();
      *(_OWORD *)(v33 + 16) = xmmword_1B11BE3D0;
      v34 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v33 + 56) = MEMORY[0x1E0DEB418];
      *(_QWORD *)(v33 + 64) = v34;
      *(_QWORD *)(v33 + 32) = 1;
      OUTLINED_FUNCTION_55_1();
      OUTLINED_FUNCTION_60_1();
      goto LABEL_17;
    }
    v4 = OUTLINED_FUNCTION_9(v3, sel_contact);
    OUTLINED_FUNCTION_49_1((uint64_t)v4);

    v6 = OUTLINED_FUNCTION_9(v5, sel_state);
    v7 = (int)v6;
    v8 = OUTLINED_FUNCTION_9((uint64_t)v6, sel_contact);
    v9 = objc_msgSend(v8, sel_name);

    if (v7 == 1)
    {
      if (v9)
      {
        OUTLINED_FUNCTION_27(46);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
        v18 = OUTLINED_FUNCTION_4_0();
        *(_OWORD *)(v18 + 16) = xmmword_1B11BD870;
        v96 = v91;
        v19 = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
        v20 = sub_1B118A610();
        v28 = OUTLINED_FUNCTION_15_3(v20, v21, v22, v23, v24, v25, v26, v27, v87, v91);
        v29 = OUTLINED_FUNCTION_9(v28, sel_fullName);
LABEL_16:
        v45 = v29;
        v46 = sub_1B11BB3C8();
        v48 = v47;

        *(_QWORD *)(v18 + 96) = v19;
        *(_QWORD *)(v18 + 104) = v8;
        *(_QWORD *)(v18 + 72) = v46;
        *(_QWORD *)(v18 + 80) = v48;
        v49 = sub_1B118A5E8((uint64_t)&v96);
        OUTLINED_FUNCTION_9_2(v92, v49, v50, v51, v52, v53, v54, v55, v56, v88, v91, *((uint64_t *)&v91 + 1), v92.n128_i64[0], v92.n128_i64[1], v93, v57);
        OUTLINED_FUNCTION_55_1();
        OUTLINED_FUNCTION_30_0();
LABEL_17:
        OUTLINED_FUNCTION_96();
        swift_bridgeObjectRelease();
        return OUTLINED_FUNCTION_185();
      }
    }
    else if (v9)
    {
      OUTLINED_FUNCTION_47_1();
      OUTLINED_FUNCTION_59_0(v35 + 4);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
      v18 = OUTLINED_FUNCTION_4_0();
      *(_OWORD *)(v18 + 16) = xmmword_1B11BD870;
      v96 = v91;
      v19 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      v36 = sub_1B118A610();
      v44 = OUTLINED_FUNCTION_15_3(v36, v37, v38, v39, v40, v41, v42, v43, v87, v91);
      v29 = OUTLINED_FUNCTION_9(v44, sel_fullName);
      goto LABEL_16;
    }
    v58 = OUTLINED_FUNCTION_40_1(v10, v11, v12, v13, v14, v15, v16, v17, v87, v91, v92.n128_i64[0], v92.n128_i64[1], v93, v94, v95, v96);
    OUTLINED_FUNCTION_9_2(v92, v58, v59, v60, v61, v62, v63, v64, v65, v89, v91, *((uint64_t *)&v91 + 1), v92.n128_i64[0], v92.n128_i64[1], v93, v66);
    return OUTLINED_FUNCTION_185();
  }
  if (OUTLINED_FUNCTION_9((uint64_t)v0, sel_state) == 1)
  {
    OUTLINED_FUNCTION_47_1();
    v2 = v1 - 5;
  }
  else if (OUTLINED_FUNCTION_7_2() == 2)
  {
    v2 = 0xD00000000000002ELL;
  }
  else if (OUTLINED_FUNCTION_7_2() == 1)
  {
    OUTLINED_FUNCTION_47_1();
    v2 = v30 + 3;
  }
  else
  {
    if (OUTLINED_FUNCTION_7_2() != 3)
      return OUTLINED_FUNCTION_185();
    OUTLINED_FUNCTION_47_1();
    v2 = v67 + 11;
  }
  sub_1B1175A30(v2);
  OUTLINED_FUNCTION_60_1();
  return OUTLINED_FUNCTION_185();
}

void sub_1B1189228(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_33(a1, &qword_1EEF110A8);
  sub_1B119E164();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v6 + 16) = v1;
  v7 = v1;
  sub_1B11892A0(v3, v5, (uint64_t)sub_1B118A670, v6);
  OUTLINED_FUNCTION_22();
}

id sub_1B11892A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];

  v6 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B1189368;
  v10[3] = &block_descriptor_13;
  v7 = _Block_copy(v10);
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_actionWithTitle_handler_, v6, v7);

  _Block_release(v7);
  swift_release();
  return v8;
}

void sub_1B1189368(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_1B11893E0()
{
  sub_1B1189400("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0);
}

void sub_1B11893F0()
{
  sub_1B1189400("SGContactSuggestion: Contact delegate for confirming suggested contact", 1);
}

void sub_1B1189400(const char *a1, char a2)
{
  char *v2;
  os_log_type_t v3;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = v2;
  v7 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v2) + 0x80))();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void **)&v2[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController];
    if (v9)
    {
      v10 = &v2[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger];
      v13 = v9;
      sub_1B11BA9F0();
      v11 = OUTLINED_FUNCTION_31_2();
      if (OUTLINED_FUNCTION_10_1(v11))
      {
        v12 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v12 = 0;
        OUTLINED_FUNCTION_6_2(&dword_1B1170000, v10, v3, a1, v12);
        OUTLINED_FUNCTION_161();
      }

      objc_msgSend(v6, sel_confirm_suggestion_completion_, a2 & 1, *(_QWORD *)&v6[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact], 0);
      objc_msgSend(v8, sel_suggestion_actionFinished_, v6, 1);
      objc_msgSend(v8, sel_dismissViewController_, v13);
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1B1189568(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  char *v45;
  void *v47;
  char *v48;
  void *v49;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v4 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  v5 = objc_msgSend(v4, sel_cnContactIdentifier);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
    v6 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v6 + 16) = xmmword_1B11BD3A0;
    *(_QWORD *)(v6 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeys);
    sub_1B11BB44C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11120);
    v7 = (void *)OUTLINED_FUNCTION_54_1();
    OUTLINED_FUNCTION_87();
    aBlock[0] = 0;
    v8 = objc_msgSend(a1, sel_unifiedContactWithIdentifier_keysToFetch_error_, v5, v7, aBlock);

    if (v8)
    {
      v9 = aBlock[0];
      objc_msgSend(v8, sel_mutableCopy);

      sub_1B11BB500();
      v10 = swift_unknownObjectRelease();
      OUTLINED_FUNCTION_33(v10, (unint64_t *)&unk_1EEF11128);
      v5 = 0;
      if (swift_dynamicCast())
        v11 = v49;
      else
        v11 = 0;
    }
    else
    {
      v12 = aBlock[0];
      sub_1B11BA918();

      swift_willThrow();
      OUTLINED_FUNCTION_19_0();
      v11 = 0;
      v5 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  if ((OUTLINED_FUNCTION_63_0() & 1) != 0 && v11)
  {
    v13 = (void *)objc_opt_self();
    v14 = v11;
    v15 = OUTLINED_FUNCTION_29_1();
    v16 = OUTLINED_FUNCTION_42_1(v13, sel_contactFromSuggestedContact_);
    OUTLINED_FUNCTION_58_1();
    v18 = OUTLINED_FUNCTION_56_1(v17, sel_givenName);

    if (!v18)
    {
      sub_1B11BB3C8();
      v2 = v19;
      v18 = (id)sub_1B11BB398();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v14, sel_setGivenName_, v18);

    v20 = v14;
    v21 = OUTLINED_FUNCTION_29_1();
    v22 = OUTLINED_FUNCTION_42_1(v13, sel_contactFromSuggestedContact_);
    OUTLINED_FUNCTION_58_1();
    v24 = OUTLINED_FUNCTION_56_1(v23, sel_familyName);

    if (!v24)
    {
      sub_1B11BB3C8();
      v24 = (id)sub_1B11BB398();
      OUTLINED_FUNCTION_96();
    }
    objc_msgSend(v20, sel_setFamilyName_, v24);

    v5 = 0;
  }
  if ((OUTLINED_FUNCTION_63_0() & 2) != 0)
  {
    v25 = OUTLINED_FUNCTION_29_1();
    v26 = sub_1B118AC38(v25);
    if (v27)
    {
      v28 = v27;
      if (v11)
      {
        v29 = v26;
        objc_allocWithZone(MEMORY[0x1E0C99D50]);
        v30 = v11;
        v31 = sub_1B118A4D8(v29, v28, 0);
        OUTLINED_FUNCTION_50_1((uint64_t)v31, sel_setImageData_);

      }
      else
      {
        OUTLINED_FUNCTION_87();
      }
    }
  }
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973D0]), sel_init);
  v33 = v32;
  if (v11)
    objc_msgSend(v32, sel_updateContact_, v11);
  v34 = OUTLINED_FUNCTION_4_0();
  *(_BYTE *)(v34 + 16) = 1;
  aBlock[0] = 0;
  v35 = objc_msgSend(a1, sel_executeSaveRequest_error_, v33, aBlock);
  if ((_DWORD)v35)
  {
    v36 = aBlock[0];
  }
  else
  {
    v47 = v4;
    v37 = aBlock[0];
    OUTLINED_FUNCTION_48_0();

    swift_willThrow();
    v38 = &v48[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger];
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_51_0();
    sub_1B11BA9F0();
    v39 = OUTLINED_FUNCTION_31_2();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_4_1();
      v41 = (_QWORD *)OUTLINED_FUNCTION_4_1();
      *(_DWORD *)v40 = 138412290;
      OUTLINED_FUNCTION_51_0();
      v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v42;
      sub_1B11BB4E8();
      *v41 = v42;
      OUTLINED_FUNCTION_16_2();
      OUTLINED_FUNCTION_16_2();
      _os_log_impl(&dword_1B1170000, v38, v39, "SGContactSuggestion: error saving contact %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_161();
    }
    OUTLINED_FUNCTION_16_2();

    OUTLINED_FUNCTION_16_2();
    OUTLINED_FUNCTION_16_2();
    v4 = v47;
    *(_BYTE *)(v34 + 16) = 0;
  }
  v43 = (_QWORD *)OUTLINED_FUNCTION_4_0();
  v43[2] = v48;
  v43[3] = v34;
  aBlock[4] = sub_1B118ACE0;
  aBlock[5] = v43;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1B1189BF0;
  aBlock[3] = &block_descriptor_0;
  v44 = _Block_copy(aBlock);
  v45 = v48;
  swift_retain();
  swift_release();
  objc_msgSend(v45, sel_confirm_suggestion_completion_, v35, v4, v44);

  _Block_release(v44);
  return swift_release();
}

void sub_1B1189BF0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_1B1189C44()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id result;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  v2 = OUTLINED_FUNCTION_62_1();
  if (!OUTLINED_FUNCTION_8_2())
    goto LABEL_11;
  if (objc_msgSend(v1, sel_state) == 1 || OUTLINED_FUNCTION_8_2() == 2)
    goto LABEL_4;
  v3 = OUTLINED_FUNCTION_8_2();
  if ((_DWORD)v3 != 1)
  {
    if (OUTLINED_FUNCTION_8_2() == 3)
    {
      OUTLINED_FUNCTION_27(60);
      OUTLINED_FUNCTION_30_0();
      return (id)OUTLINED_FUNCTION_185();
    }
LABEL_11:
    v9 = OUTLINED_FUNCTION_62_1();
    OUTLINED_FUNCTION_49_1((uint64_t)v9);

    OUTLINED_FUNCTION_9_2(v20, v10, v11, v12, v13, v14, v15, v16, v17, v19, v20.n128_i64[0], v20.n128_i64[1], v21, v22, v23, v18);
    return (id)OUTLINED_FUNCTION_185();
  }
  v4 = OUTLINED_FUNCTION_9((uint64_t)v3, sel_name);

  if (!v4)
  {
LABEL_4:

    return (id)OUTLINED_FUNCTION_185();
  }
  result = OUTLINED_FUNCTION_9(v5, sel_name);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, sel_fullName);

    sub_1B11BB3C8();
    OUTLINED_FUNCTION_30_0();

    return (id)OUTLINED_FUNCTION_185();
  }
  __break(1u);
  return result;
}

void sub_1B1189DF0(uint64_t a1)
{
  char *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  OUTLINED_FUNCTION_33(a1, &qword_1EEF110A8);
  v2 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact], sel_contact);
  sub_1B119DC40(v2);
  v4 = v3;
  v6 = v5;

  v7 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v7 + 16) = v1;
  v8 = v1;
  sub_1B11892A0(v4, v6, (uint64_t)sub_1B118AE74, v7);
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B1189EB8()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice))
    return 4;
  else
    return 0;
}

Class sub_1B1189EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_1B118AC38(objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), sel_contact));
  if (!v2)
    return SGContactSuggestion.contactImage()().super.isa;
  OUTLINED_FUNCTION_33(v1, &qword_1ED380C50);
  return (Class)sub_1B1189F74();
}

id sub_1B1189F74()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithContentsOfFile_, v1);

  return v2;
}

unint64_t sub_1B118A00C()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice))
    return 0xD000000000000012;
  else
    return 0;
}

uint64_t sub_1B118A04C()
{
  return swift_unknownObjectRetain();
}

void sub_1B118A074()
{
  sub_1B11758D0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_41();
}

id sub_1B118A0D8()
{
  return sub_1B1175A30(0xD00000000000001ELL);
}

id sub_1B118A100(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();
  OUTLINED_FUNCTION_53_0();
  v5 = (void *)OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_28_0();
  return OUTLINED_FUNCTION_2_1(v5);
}

void sub_1B118A13C(uint64_t a1)
{
  uint64_t v1;

  if (!((unint64_t)a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_9;
    goto LABEL_8;
  }
  if (a1 < 0)
    v1 = a1;
  else
    v1 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  sub_1B11BB56C();
  OUTLINED_FUNCTION_15_0();
  if (!v1)
LABEL_8:
    OUTLINED_FUNCTION_27(47);
LABEL_9:
  OUTLINED_FUNCTION_41();
}

void sub_1B118A1BC(unint64_t a1)
{
  OUTLINED_FUNCTION_27(38);
  OUTLINED_FUNCTION_61_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  *(_OWORD *)(OUTLINED_FUNCTION_4_0() + 16) = xmmword_1B11BE3D0;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_22_0();
    sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_17(MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_22();
}

id sub_1B118A2E0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF10E80);
  v6 = sub_1B11BB440();
  v7 = a1;
  a4(v6);

  OUTLINED_FUNCTION_87();
  v8 = (void *)sub_1B11BB398();
  OUTLINED_FUNCTION_96();
  return OUTLINED_FUNCTION_2_1(v8);
}

id sub_1B118A380()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(getContactSuggestion(*(void **)(v0
                                                                          + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact)));
}

id SGContactSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SGContactSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SGContactSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGContactSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B118A4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithContentsOfFile_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_1B11BA918();

    swift_willThrow();
  }
  return v6;
}

uint64_t type metadata accessor for SGContactSuggestion()
{
  uint64_t result;

  result = qword_1ED3823C8;
  if (!qword_1ED3823C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B118A5E8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1B118A610()
{
  unint64_t result;

  result = qword_1EEF110A0;
  if (!qword_1EEF110A0)
  {
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEF110A0);
  }
  return result;
}

uint64_t sub_1B118A64C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B118A670()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  void *v32;
  void *v33;
  os_log_type_t v34;
  uint8_t *v35;
  NSObject *v36;
  void *v37;
  os_log_type_t v38;
  uint8_t *v39;
  NSObject *v40;
  id v41[5];

  v1 = *(_QWORD **)(v0 + 16);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_retrieveContactStore);
  v4 = *(void **)((char *)v1 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  v5 = OUTLINED_FUNCTION_24_2();
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (v5 == 2 && objc_msgSend(v4, sel_updatedFields) == 3)
    (*(void (**)(id))((*v6 & *v1) + 0xD8))(v3);
  v7 = OUTLINED_FUNCTION_32_2();
  sub_1B118AC38(v7);
  if (v8)
  {
    OUTLINED_FUNCTION_60_1();
    v9 = OUTLINED_FUNCTION_32_2();
    v10 = OUTLINED_FUNCTION_42_1(v2, sel_contactFromSuggestedContact_);
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_56_1(v11, sel_mutableCopy);

    sub_1B11BB500();
    v12 = swift_unknownObjectRelease();
    OUTLINED_FUNCTION_33(v12, (unint64_t *)&unk_1EEF11128);
    swift_dynamicCast();
    v13 = v40;
    v14 = objc_allocWithZone(MEMORY[0x1E0C99D50]);
    v15 = OUTLINED_FUNCTION_185();
    v17 = sub_1B118A4D8(v15, v16, 0);
    OUTLINED_FUNCTION_50_1((uint64_t)v17, sel_setImageData_);
  }
  else
  {
    v17 = OUTLINED_FUNCTION_32_2();
    v13 = objc_msgSend(v2, sel_contactFromSuggestedContact_, v17);
  }

  if (OUTLINED_FUNCTION_24_2() == 1)
  {
    if (!v13)
    {
      v13 = OUTLINED_FUNCTION_21_2();
      v34 = sub_1B11BB4AC();
      if (os_log_type_enabled(v13, v34))
      {
        v35 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v35 = 0;
        OUTLINED_FUNCTION_6_2(&dword_1B1170000, v13, v34, "SGContactSuggestion: Contact is nil while initializing view controller for unknown contact", v35);
        OUTLINED_FUNCTION_161();
      }
      goto LABEL_29;
    }
    v18 = (void *)objc_opt_self();
    v19 = OUTLINED_FUNCTION_42_1(v18, sel_viewControllerForUnknownContact_);
    OUTLINED_FUNCTION_21_2();
    v20 = OUTLINED_FUNCTION_31_2();
    if (OUTLINED_FUNCTION_10_1(v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_WORD *)v21 = 0;
      OUTLINED_FUNCTION_6_2(&dword_1B1170000, v17, (os_log_type_t)v2, "SGContactSuggestion: Viewcontroller for presenting new contact suggestion initialized", v21);
      OUTLINED_FUNCTION_161();
    }
LABEL_18:

    if (v19)
    {
      v31 = v19;
      objc_msgSend(v31, sel_setContactStore_, v3);
      objc_msgSend(v31, sel_setDelegate_, v1);
      objc_msgSend(v31, sel_setModalPresentationStyle_, -1);
      v32 = (void *)OUTLINED_FUNCTION_18_2();
      if (v32)
      {
        objc_msgSend(v32, sel_presentViewController_, v31);

        OUTLINED_FUNCTION_22_1();
LABEL_30:

        OUTLINED_FUNCTION_11_2();
        return;
      }

    }
LABEL_29:

    goto LABEL_30;
  }
  if (OUTLINED_FUNCTION_24_2() != 2)
  {
    v33 = (void *)OUTLINED_FUNCTION_18_2();
    if (v33)
    {
      objc_msgSend(v33, sel_suggestion_actionFinished_, v1, 0);
      OUTLINED_FUNCTION_22_1();
    }
    goto LABEL_29;
  }
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  v23 = objc_msgSend(v4, sel_cnContactIdentifier);
  if (v23)
  {
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
    v25 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v25 + 16) = xmmword_1B11BD3A0;
    *(_QWORD *)(v25 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeys);
    sub_1B11BB44C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11120);
    v26 = (void *)OUTLINED_FUNCTION_54_1();
    OUTLINED_FUNCTION_87();
    v41[0] = 0;
    v27 = objc_msgSend(v22, sel_unifiedContactWithIdentifier_keysToFetch_error_, v24, v26, v41);

    v17 = v41[0];
    if (!v27)
    {
      v36 = v41[0];
      v37 = (void *)OUTLINED_FUNCTION_48_0();

      swift_willThrow();
      OUTLINED_FUNCTION_21_2();
      v38 = OUTLINED_FUNCTION_46_0();
      if (OUTLINED_FUNCTION_41_2(v38))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v39 = 0;
        OUTLINED_FUNCTION_6_2(&dword_1B1170000, v17, (os_log_type_t)v37, "SGContactSuggestion: Encountered exception while fetching contact from contactStore", v39);
        OUTLINED_FUNCTION_161();
      }

      goto LABEL_29;
    }
    if (v13)
    {
      v28 = v41[0];
      v19 = objc_msgSend(v2, sel_viewControllerForUpdatingContact_additionalContact_, v27, v13);
      OUTLINED_FUNCTION_21_2();
      v29 = OUTLINED_FUNCTION_31_2();
      if (OUTLINED_FUNCTION_10_1(v29))
      {
        v30 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v30 = 0;
        OUTLINED_FUNCTION_6_2(&dword_1B1170000, v17, (os_log_type_t)v2, "SGContactSuggestion: Viewcontroller for presenting contact suggestion update initialized", v30);
        OUTLINED_FUNCTION_161();
      }

      goto LABEL_18;
    }
  }
  else
  {

    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1B118AC38(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_photoPath);

  if (!v2)
    return 0;
  v3 = sub_1B11BB3C8();

  return v3;
}

uint64_t sub_1B118ACA4()
{
  return swift_deallocObject();
}

uint64_t sub_1B118ACB4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1B118ACE0(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  unsigned __int8 *v4;
  NSObject *v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = *(uint64_t **)(v1 + 16);
  v4 = (unsigned __int8 *)(*(_QWORD *)(v1 + 24) + 16);
  v5 = ((char *)v3 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger);
  v6 = a1;
  v7 = a1;
  sub_1B11BA9F0();
  v8 = OUTLINED_FUNCTION_46_0();
  if (os_log_type_enabled(v5, v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_4_1();
    v10 = (_QWORD *)OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v9 = 138412290;
    if (a1)
    {
      v11 = a1;
      v12 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_25_3();
    }
    else
    {
      OUTLINED_FUNCTION_25_3();
      v12 = 0;
    }
    *v10 = v12;
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_19_0();
    _os_log_impl(&dword_1B1170000, v5, v8, "SGContactSuggestion: error confirming realcontact: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_161();
  }

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_2();
  *v4 = 0;
  v13 = OUTLINED_FUNCTION_37_1(*v3);
  if (v13)
  {
    v14 = (void *)v13;
    OUTLINED_FUNCTION_2();
    objc_msgSend(v14, sel_suggestion_actionFinished_, v3, *v4);
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_11_2();
}

void *sub_1B118AE74()
{
  uint64_t v0;
  os_log_type_t v1;
  _QWORD *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *result;

  v2 = *(_QWORD **)(v0 + 16);
  v3 = ((char *)v2 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger);
  sub_1B11BA9F0();
  v4 = OUTLINED_FUNCTION_31_2();
  if (OUTLINED_FUNCTION_41_2(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_6_2(&dword_1B1170000, v3, v1, "SGContactSuggestion: Contact delegate for dismissing suggested contact", v5);
    OUTLINED_FUNCTION_161();
  }

  objc_msgSend(v2, sel_confirm_suggestion_completion_, 0, *(_QWORD *)((char *)v2 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), 0);
  result = (void *)OUTLINED_FUNCTION_37_1(*v2);
  if (result)
  {
    objc_msgSend(result, sel_suggestion_actionFinished_, v2, 1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B118AF54()
{
  return type metadata accessor for SGContactSuggestion();
}

uint64_t sub_1B118AF5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BAA08();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SGContactSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGContactSuggestion.__allocating_init(sgContact:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionPrimaryAction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionSubtitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDismissAction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionImage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionIconSFSymbol()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategory()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryId()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryImage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryTitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategorySubtitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryIconSFSymbol()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGContactSuggestion.realtimeSuggestion()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t type metadata accessor for IconView(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1ED382220);
}

void sub_1B118B26C()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
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
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
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
  id v52[4];
  uint64_t v53;
  _BYTE v54[16];
  id v55[2];

  OUTLINED_FUNCTION_67_1();
  v51 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381810);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_5_0();
  v45 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381620);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_5_0();
  v50 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381658);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381688);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_17_0();
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381560);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_47();
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381590);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_36();
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_141();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_29_0();
  v48 = v20;
  v21 = OUTLINED_FUNCTION_251();
  v22 = (char *)v0 + *(int *)(v21 + 20);
  v23 = &v22[*(int *)(OUTLINED_FUNCTION_19() + 48)];
  if (v23[2] == 1)
  {
    *v4 = sub_1B11BB338();
    v4[1] = v24;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF112F0);
    sub_1B118B7D4(v0, (uint64_t)v4 + *(int *)(v25 + 44));
    v26 = sub_1B11BAFC0();
    OUTLINED_FUNCTION_235();
    OUTLINED_FUNCTION_8();
    sub_1B1188820((uint64_t)v4, v3, &qword_1ED381688);
    v27 = v3 + *(int *)(v46 + 36);
    *(_BYTE *)v27 = v26;
    *(_QWORD *)(v27 + 8) = v5;
    *(_QWORD *)(v27 + 16) = v6;
    *(_QWORD *)(v27 + 24) = v7;
    *(_QWORD *)(v27 + 32) = v8;
    *(_BYTE *)(v27 + 40) = 0;
    OUTLINED_FUNCTION_131_1((uint64_t)v4);
    v28 = sub_1B11BAFD8();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    sub_1B1188820(v3, v1, &qword_1ED381560);
    v29 = v1 + *(int *)(v47 + 36);
    *(_BYTE *)v29 = v28;
    *(_QWORD *)(v29 + 8) = v5;
    *(_QWORD *)(v29 + 16) = v6;
    *(_QWORD *)(v29 + 24) = v7;
    *(_QWORD *)(v29 + 32) = v8;
    *(_BYTE *)(v29 + 40) = 0;
    OUTLINED_FUNCTION_131_1(v3);
    v30 = sub_1B11BAFB4();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    v31 = &qword_1ED381590;
    OUTLINED_FUNCTION_224(v1, v2);
    v32 = v2 + *(int *)(v49 + 36);
    *(_BYTE *)v32 = v30;
    *(_QWORD *)(v32 + 8) = v5;
    *(_QWORD *)(v32 + 16) = v6;
    *(_QWORD *)(v32 + 24) = v7;
    *(_QWORD *)(v32 + 32) = v8;
    *(_BYTE *)(v32 + 40) = 0;
    OUTLINED_FUNCTION_169_0(v1);
    OUTLINED_FUNCTION_234(v2);
    OUTLINED_FUNCTION_44_0(v48, v50);
    OUTLINED_FUNCTION_42_0();
    sub_1B118BC80((uint64_t)&unk_1ED3815B8);
    sub_1B118BE0C();
    OUTLINED_FUNCTION_221();
    OUTLINED_FUNCTION_138();
    v33 = v48;
LABEL_5:
    OUTLINED_FUNCTION_87_0(v33);
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381650);
    OUTLINED_FUNCTION_42_2((uint64_t)v31, v42, v43, v41);
    sub_1B1188514((uint64_t)v31, v51, &qword_1ED381658);
    OUTLINED_FUNCTION_35();
    return;
  }
  if (v23[1] == 1)
  {
    v34 = v0;
    v35 = (void *)*((_QWORD *)v23 + 5);
    v36 = *v34;
    v37 = *((_BYTE *)v34 + *(int *)(v21 + 24));
    v39 = *((_QWORD *)v23 + 8);
    v38 = *((_QWORD *)v23 + 9);
    OUTLINED_FUNCTION_223();
    v40 = v35;
    sub_1B118BBA4(v35, v36, v37, v39, v38, (uint64_t)v52);
    sub_1B11BB338();
    OUTLINED_FUNCTION_129_0();
    OUTLINED_FUNCTION_106_1();
    sub_1B11BAFC0();
    OUTLINED_FUNCTION_235();
    sub_1B11758A0();
    OUTLINED_FUNCTION_201();
    OUTLINED_FUNCTION_113_1();
    v31 = (uint64_t *)MEMORY[0x1E0CD9758];
    sub_1B118BC80((uint64_t)&unk_1ED381708);
    OUTLINED_FUNCTION_196();
    swift_bridgeObjectRelease();
    sub_1B1188514((uint64_t)v52, (uint64_t)v55, &qword_1EEF112E0);
    sub_1B118BD00(v55);

    sub_1B1188514((uint64_t)&v53, (uint64_t)v54, &qword_1EEF112E8);
    sub_1B118A5E8((uint64_t)v54);
    OUTLINED_FUNCTION_44_0(v45, v50);
    OUTLINED_FUNCTION_54();
    sub_1B118BC80((uint64_t)&unk_1ED3815B8);
    sub_1B118BE0C();
    OUTLINED_FUNCTION_221();
    OUTLINED_FUNCTION_138();
    v33 = v45;
    goto LABEL_5;
  }
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381650);
  OUTLINED_FUNCTION_50_2(v51, 1, 1, v44);
}

void sub_1B118B7D4(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  id v60;
  char v61;
  _QWORD v62[6];
  __int128 v63;
  _QWORD v64[2];
  id v65;
  char v66;
  _QWORD v67[3];
  __int128 v68;
  _BYTE v69[16];
  id v70;
  _BYTE v71[16];
  id v72[2];

  v50 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11520);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_4();
  v49 = v4;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_29_0();
  v47 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11528);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_4();
  v48 = v8;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v44 - v10;
  v12 = OUTLINED_FUNCTION_251();
  v13 = (char *)a1 + *(int *)(v12 + 20);
  v14 = &v13[*(int *)(OUTLINED_FUNCTION_19() + 48)];
  v15 = (void *)*((_QWORD *)v14 + 5);
  v16 = *a1;
  v17 = *((_BYTE *)a1 + *(int *)(v12 + 24));
  v46 = v17;
  v18 = *((_QWORD *)v14 + 8);
  v19 = *((_QWORD *)v14 + 9);
  OUTLINED_FUNCTION_226();
  v20 = v15;
  v21 = v16;
  sub_1B118BBA4(v15, v21, v17, v18, v19, (uint64_t)v59);
  v22 = v59[0];
  v23 = v59[1];
  v24 = v60;
  v25 = v61;
  v45 = v62;
  v26 = v62[0];
  v27 = v62[1];
  sub_1B11BB338();
  OUTLINED_FUNCTION_129_0();
  OUTLINED_FUNCTION_106_1();
  v51 = v22;
  v52 = v23;
  v53 = v24;
  v54 = v25;
  v55 = v26;
  v56 = v27;
  OUTLINED_FUNCTION_208(v62[2]);
  v57 = v63;
  sub_1B11758AC();
  OUTLINED_FUNCTION_230();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816C8);
  sub_1B118BC5C();
  sub_1B11BB0F8();
  OUTLINED_FUNCTION_229();
  sub_1B1188514((uint64_t)v59, (uint64_t)v72, &qword_1EEF112E0);
  sub_1B118BD00(v72);

  sub_1B1188514((uint64_t)v45, (uint64_t)v71, &qword_1EEF112E8);
  sub_1B118A5E8((uint64_t)v71);
  v28 = (void *)*((_QWORD *)v14 + 4);
  v29 = *((_QWORD *)v14 + 6);
  v30 = *((_QWORD *)v14 + 7);
  OUTLINED_FUNCTION_201();
  v31 = v21;
  v32 = v28;
  sub_1B118BBA4(v28, v31, v46, v29, v30, (uint64_t)v64);
  v33 = v64[0];
  v34 = v64[1];
  v35 = v65;
  LOBYTE(v30) = v66;
  v36 = v67[0];
  v37 = v67[1];
  sub_1B11BB338();
  OUTLINED_FUNCTION_129_0();
  OUTLINED_FUNCTION_106_1();
  v51 = v33;
  v52 = v34;
  v53 = v35;
  v54 = v30;
  v55 = v36;
  v56 = v37;
  OUTLINED_FUNCTION_208(v67[2]);
  v38 = *((_OWORD *)v14 + 1);
  v57 = v68;
  v58 = v38;
  sub_1B11758B8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_113_1();
  sub_1B118BC80((uint64_t)&unk_1EEF11538);
  v39 = v47;
  sub_1B11BB0F8();
  OUTLINED_FUNCTION_96();
  sub_1B1188514((uint64_t)v64, (uint64_t)&v70, &qword_1EEF112E0);
  sub_1B118BD00(&v70);

  sub_1B1188514((uint64_t)v67, (uint64_t)v69, &qword_1EEF112E8);
  sub_1B118A5E8((uint64_t)v69);
  v40 = v48;
  OUTLINED_FUNCTION_174_0((uint64_t)v11, v48);
  v41 = v49;
  OUTLINED_FUNCTION_44_0(v39, v49);
  v42 = v50;
  OUTLINED_FUNCTION_174_0(v40, v50);
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11540);
  OUTLINED_FUNCTION_44_0(v41, v42 + *(int *)(v43 + 48));
  OUTLINED_FUNCTION_87_0(v39);
  OUTLINED_FUNCTION_170_0((uint64_t)v11);
  OUTLINED_FUNCTION_87_0(v41);
  OUTLINED_FUNCTION_170_0(v40);
  OUTLINED_FUNCTION_43();
}

void sub_1B118BBA4(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v12 = (void *)objc_opt_self();
  OUTLINED_FUNCTION_222();
  v13 = a1;
  v14 = a2;
  v15 = objc_msgSend(v12, sel_mainScreen);
  objc_msgSend(v15, sel_scale);
  v17 = v16;
  OUTLINED_FUNCTION_13_0();

  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = v17;
  *(_QWORD *)(a6 + 16) = v14;
  *(_BYTE *)(a6 + 24) = a3;
  *(_QWORD *)(a6 + 32) = a4;
  *(_QWORD *)(a6 + 40) = a5;
  OUTLINED_FUNCTION_43();
}

void sub_1B118BC5C()
{
  sub_1B118BC80((uint64_t)&unk_1ED3816C0);
}

void sub_1B118BC80(uint64_t a1)
{
  void (*v1)(void);
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_44(0, v2);
    v1();
    OUTLINED_FUNCTION_214();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B118BCC4()
{
  unint64_t result;

  result = qword_1ED3816A8;
  if (!qword_1ED3816A8)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE8E0, &unk_1E62D5A28);
    atomic_store(result, (unint64_t *)&qword_1ED3816A8);
  }
  return result;
}

id *sub_1B118BD00(id *a1)
{

  return a1;
}

unint64_t sub_1B118BD28()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381588;
  if (!qword_1ED381588)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381590);
    sub_1B118BDB4((uint64_t)&unk_1ED381558);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381588);
  }
  return result;
}

void sub_1B118BDB4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_44(0, v1);
    v2 = OUTLINED_FUNCTION_173_0();
    sub_1B1193240(v2);
    OUTLINED_FUNCTION_214();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B118BE0C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381808;
  if (!qword_1ED381808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381810);
    sub_1B118BC80((uint64_t)&unk_1ED381708);
    v3[0] = v2;
    v3[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381808);
  }
  return result;
}

unint64_t sub_1B118BE98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED3812A8;
  if (!qword_1ED3812A8)
  {
    v1 = sub_1B11BAF84();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDCFB8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED3812A8);
  }
  return result;
}

void sub_1B118BED8(uint64_t a1@<X0>, char a2@<W2>, _QWORD *a3@<X8>)
{
  sub_1B118CC88(a1, a2, type metadata accessor for IconView, a3);
}

uint64_t type metadata accessor for BannerIconSGView(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382190);
}

void sub_1B118BEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t **v24;
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
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t **v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  void *v84;
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
  uint64_t **v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  char v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;

  OUTLINED_FUNCTION_67_1();
  a23 = v27;
  a24 = v32;
  v113 = v33;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF112F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v35);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11300);
  OUTLINED_FUNCTION_155_0(v36, (uint64_t)&a11);
  v101 = v37;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v39);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11308);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_55((uint64_t)&v100 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0));
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11310);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11318);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_55((uint64_t)&v100 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11320);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v46);
  v48 = (uint64_t *)((char *)&v100 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0));
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11328);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v50);
  OUTLINED_FUNCTION_38_0();
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11330);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v51);
  OUTLINED_FUNCTION_7();
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11338);
  OUTLINED_FUNCTION_0_0();
  v53 = MEMORY[0x1E0C80A78](v52);
  v55 = (char *)&v100 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v53);
  OUTLINED_FUNCTION_29_0();
  v57 = OUTLINED_FUNCTION_157_0(v56);
  v58 = (char *)v24 + *(int *)(v57 + 20);
  v59 = &v58[*(int *)(OUTLINED_FUNCTION_19() + 48)];
  if (v59[2] == 1)
  {
    *v48 = sub_1B11BB338();
    v48[1] = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11398);
    sub_1B118C750((uint64_t)v24, v61, v62, v63, v64, v65, v66, v67, v100, v101, v102, v103, v104, v105, v106, (uint64_t)v107, v108, v109, v110,
      v111);
    v68 = sub_1B11BAFC0();
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_8();
    sub_1B1188820((uint64_t)v48, v26, &qword_1EEF11320);
    v69 = v26 + *(int *)(v49 + 36);
    *(_BYTE *)v69 = v68;
    *(_QWORD *)(v69 + 8) = v28;
    *(_QWORD *)(v69 + 16) = v29;
    *(_QWORD *)(v69 + 24) = v30;
    *(_QWORD *)(v69 + 32) = v31;
    *(_BYTE *)(v69 + 40) = 0;
    sub_1B1193558((uint64_t)v48, &qword_1EEF11320);
    sub_1B11BAFD8();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_139_0(v26, v25);
    OUTLINED_FUNCTION_48_1(v25 + *(int *)(v106 + 36));
    sub_1B1193558(v26, &qword_1EEF11328);
    sub_1B11BAFB4();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_139_0(v25, (uint64_t)v55);
    OUTLINED_FUNCTION_44_1((uint64_t)&v55[*(int *)(v108 + 36)]);
    v70 = v107;
    sub_1B1188514((uint64_t)v55, (uint64_t)v107, &qword_1EEF11338);
    OUTLINED_FUNCTION_30((uint64_t)v70, v110);
    OUTLINED_FUNCTION_42_0();
    sub_1B118BC80((uint64_t)&unk_1EEF11348);
    sub_1B118C614();
    OUTLINED_FUNCTION_246();
    OUTLINED_FUNCTION_138();
    OUTLINED_FUNCTION_122_1((uint64_t)v70);
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11340);
    OUTLINED_FUNCTION_42_2(v25, v72, v73, v71);
    v74 = v25;
  }
  else
  {
    v106 = v57;
    v107 = v24;
    if (v59[1] != 1)
    {
      v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11340);
      OUTLINED_FUNCTION_50_2(v113, 1, 1, v95);
      return;
    }
    v75 = (void *)*((_QWORD *)v59 + 10);
    if (v75)
    {
      v76 = v75;
      sub_1B11BB338();
      OUTLINED_FUNCTION_129_0();
      OUTLINED_FUNCTION_106_1();
      v77 = v127;
      v78 = v128;
      v79 = v129;
      v80 = v130;
      v82 = v131;
      v81 = v132;
      v83 = sub_1B11BAFC0();
      OUTLINED_FUNCTION_194();
      v84 = v76;
      v114 = v76;
      v115 = v77;
      v116 = v78;
      v117 = v79;
      v118 = v80;
      v119 = v82;
      v120 = v81;
      v121 = v83;
      v122 = v85;
      v123 = v86;
      v124 = v87;
      v125 = v88;
      v126 = 0;
      v89 = *(_QWORD *)sub_1B11758A0();
      OUTLINED_FUNCTION_201();
      OUTLINED_FUNCTION_113_1();
      sub_1B118BC80((uint64_t)&unk_1EEF11378);
      v90 = v103;
      OUTLINED_FUNCTION_196();
      swift_bridgeObjectRelease();
      LOBYTE(v76) = *((_BYTE *)v107 + *(int *)(v106 + 24));
      v91 = OUTLINED_FUNCTION_95_0(**v107);
      sub_1B118C6A0();
      OUTLINED_FUNCTION_246();
      sub_1B11A19F4((char)v76, v91, v102, v92);

      sub_1B1193558(v90, &qword_1EEF112F8);
      v93 = v105;
      OUTLINED_FUNCTION_239(v105, v89, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v101 + 32));
      v94 = 0;
    }
    else
    {
      v94 = 1;
      v93 = v105;
      v90 = v104;
    }
    __swift_storeEnumTagSinglePayload(v93, v94, 1, v90);
    OUTLINED_FUNCTION_30(v93, v110);
    OUTLINED_FUNCTION_54();
    sub_1B118BC80((uint64_t)&unk_1EEF11348);
    sub_1B118C614();
    v96 = v112;
    sub_1B11BAE88();
    OUTLINED_FUNCTION_122_1(v93);
    v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11340);
    OUTLINED_FUNCTION_42_2(v96, v98, v99, v97);
    v74 = v96;
  }
  sub_1B1188514(v74, v113, &qword_1EEF11318);
  OUTLINED_FUNCTION_35();
}

unint64_t sub_1B118C588()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11350;
  if (!qword_1EEF11350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11330);
    sub_1B118BDB4((uint64_t)&unk_1EEF11358);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11350);
  }
  return result;
}

unint64_t sub_1B118C614()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_1EEF11368;
  if (!qword_1EEF11368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11308);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF112F8);
    v2[2] = sub_1B118C6A0();
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CE0798], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF11368);
  }
  return result;
}

unint64_t sub_1B118C6A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11370;
  if (!qword_1EEF11370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF112F8);
    sub_1B118BC80((uint64_t)&unk_1EEF11378);
    v3[0] = v2;
    v3[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11370);
  }
  return result;
}

void sub_1B118C72C()
{
  sub_1B118BC80((uint64_t)&unk_1EEF11388);
}

void sub_1B118C750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t **v24;
  uint64_t **v25;
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
  char *v45;
  char *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  char v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  char v106;
  __int128 v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  char v111;
  __int128 v112;

  OUTLINED_FUNCTION_24();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v94 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_103_0();
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v29);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114D8);
  v91 = *(_QWORD *)(v30 - 8);
  OUTLINED_FUNCTION_1();
  v32 = MEMORY[0x1E0C80A78](v31);
  v34 = (char *)&v82 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_55(v35);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_38_0();
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114E8);
  OUTLINED_FUNCTION_155_0(v38, (uint64_t)&a16);
  v95 = v39;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_4();
  v89 = v41;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_29_0();
  v44 = OUTLINED_FUNCTION_157_0(v43);
  v45 = (char *)v25 + *(int *)(v44 + 20);
  v46 = &v45[*(int *)(OUTLINED_FUNCTION_19() + 48)];
  v47 = (void *)*((_QWORD *)v46 + 10);
  if (v47 && (v48 = (void *)*((_QWORD *)v46 + 11)) != 0)
  {
    v85 = v34;
    v49 = v47;
    v86 = v49;
    v82 = v48;
    sub_1B11BB338();
    OUTLINED_FUNCTION_129_0();
    OUTLINED_FUNCTION_106_1();
    v96 = v49;
    v97 = v103;
    v98 = v104;
    v99 = v105;
    v100 = v106;
    v101 = v107;
    v50 = (uint64_t *)sub_1B11758AC();
    v84 = v20;
    v51 = *v50;
    OUTLINED_FUNCTION_223();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11390);
    v83 = v30;
    sub_1B118C72C();
    OUTLINED_FUNCTION_196();
    OUTLINED_FUNCTION_121();
    v52 = *((_BYTE *)v25 + *(int *)(v44 + 24));
    v53 = *v25;
    v54 = OUTLINED_FUNCTION_180_0(*v53);
    sub_1B1193460();
    OUTLINED_FUNCTION_246();
    sub_1B11A19F4(v52, v54, v36, v55);
    sub_1B1193558(v21, &qword_1EEF114E0);
    OUTLINED_FUNCTION_242();
    v57 = v51;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v92, v51, v93);
    v58 = v82;
    sub_1B11BB338();
    OUTLINED_FUNCTION_129_0();
    OUTLINED_FUNCTION_106_1();
    v96 = v58;
    v97 = v108;
    v82 = v58;
    v98 = v109;
    v99 = v110;
    v100 = v111;
    v101 = v112;
    v102 = *((_OWORD *)v46 + 1);
    sub_1B11758B8();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_113_1();
    sub_1B118BC80((uint64_t)&unk_1EEF11508);
    v59 = v87;
    sub_1B11BB0F8();

    OUTLINED_FUNCTION_96();
    v60 = OUTLINED_FUNCTION_180_0(*v53);
    v61 = sub_1B11934CC();
    v62 = v85;
    sub_1B11A19F4(v52, v60, v88, v61);
    sub_1B1193558(v59, &qword_1EEF114D0);
    v63 = v91;
    v64 = v90;
    v65 = v83;
    (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v90, v62, v83);
    OUTLINED_FUNCTION_242();
    v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16);
    v68 = v57;
    v69 = v57;
    v70 = v92;
    v71 = v93;
    v67(v69, v92, v93);
    v72 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
    v72(v62, v64, v65);
    v73 = v84;
    v67(v84, v68, v71);
    v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11518);
    v72((char *)(v73 + *(int *)(v74 + 48)), (uint64_t)v62, v65);

    v75 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v75(v64, v65);
    OUTLINED_FUNCTION_242();
    v77 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
    v77(v70, v71);
    v75((uint64_t)v62, v65);
    v77(v68, v71);
    v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114F0);
    OUTLINED_FUNCTION_42_2(v73, v79, v80, v78);
    sub_1B1188514(v73, v94, &qword_1EEF114C8);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114F0);
    OUTLINED_FUNCTION_73_0(v94, 1, 1, v81);
  }
}

void sub_1B118CC7C(uint64_t a1@<X0>, char a2@<W2>, _QWORD *a3@<X8>)
{
  sub_1B118CC88(a1, a2, type metadata accessor for BannerIconSGView, a3);
}

void sub_1B118CC88(uint64_t a1@<X0>, char a2@<W2>, uint64_t (*a3)(_QWORD)@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v6;

  *a4 = a1;
  v6 = a3(0);
  OUTLINED_FUNCTION_236(v6, (uint64_t)a4 + *(int *)(v6 + 20), type metadata accessor for SGBannerViewModel);
  *((_BYTE *)a4 + *(int *)(v6 + 24)) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B118CCDC()
{
  OUTLINED_FUNCTION_121_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE64();
}

uint64_t sub_1B118CD0C()
{
  OUTLINED_FUNCTION_121_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE10();
}

void sub_1B118CD3C()
{
  sub_1B11933FC();
  sub_1B11BAE58();
  __break(1u);
}

uint64_t type metadata accessor for TitleView(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382230);
}

void sub_1B118CD74()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
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

  OUTLINED_FUNCTION_67_1();
  v50 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_7();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381720);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_36();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381678);
  v44 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_137_1(v9, v34);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381550);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_184();
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381580);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_140(v12, v35);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_5_0();
  v40 = v14;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_5_0();
  v46 = v16;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_139_1(v18, v36);
  sub_1B1176EC8();
  OUTLINED_FUNCTION_114();
  v19 = sub_1B11BB0BC();
  v21 = v20;
  v23 = v22 & 1;
  sub_1B1175870();
  OUTLINED_FUNCTION_222();
  sub_1B11BB0F8();
  OUTLINED_FUNCTION_13_0();
  sub_1B117CED4(v19, v21, v23);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_44_0(v2, v1);
  v25 = v1 + *(int *)(v37 + 36);
  *(_QWORD *)v25 = KeyPath;
  *(_QWORD *)(v25 + 8) = 3;
  *(_BYTE *)(v25 + 16) = 0;
  OUTLINED_FUNCTION_87_0(v2);
  v26 = OUTLINED_FUNCTION_95_0(**(_QWORD **)(v0 + 16));
  v27 = sub_1B118F85C();
  sub_1B11A196C(v26, v37, v27);
  sub_1B1193558(v1, &qword_1ED381720);
  v28 = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v3, v38, v45);
  v29 = v3 + *(int *)(v41 + 36);
  *(_QWORD *)v29 = v28;
  *(_BYTE *)(v29 + 8) = 1;
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v38, v45);
  LODWORD(v28) = sub_1B11BAEDC();
  OUTLINED_FUNCTION_44_0(v3, v39);
  *(_DWORD *)(v39 + *(int *)(v43 + 36)) = v28;
  OUTLINED_FUNCTION_87_0(v3);
  v30 = sub_1B11BAD8C();
  OUTLINED_FUNCTION_139_0(v39, v40);
  v31 = (uint64_t *)(v40 + *(int *)(v42 + 36));
  *v31 = v30;
  v31[1] = (uint64_t)sub_1B118D1AC;
  v31[2] = 0;
  sub_1B1193558(v39, &qword_1ED381580);
  sub_1B11BAFA8();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_19();
  sub_1B11BAABC();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_224(v40, v46);
  OUTLINED_FUNCTION_48_1(v46 + *(int *)(v47 + 36));
  OUTLINED_FUNCTION_169_0(v40);
  sub_1B11BAFC0();
  sub_1B11BAABC();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_174_0(v46, v48);
  OUTLINED_FUNCTION_48_1(v48 + *(int *)(v49 + 36));
  OUTLINED_FUNCTION_170_0(v46);
  sub_1B11BAFD8();
  sub_1B11BAABC();
  v32 = OUTLINED_FUNCTION_84_1();
  OUTLINED_FUNCTION_139_0(v32, v50);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815F0);
  OUTLINED_FUNCTION_44_1(v50 + *(int *)(v33 + 36));
  OUTLINED_FUNCTION_35();
}

uint64_t sub_1B118D1AC()
{
  uint64_t v0;

  v0 = sub_1B11BAD8C();
  return MEMORY[0x1B5E16C48](v0);
}

void sub_1B118D1D0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W4>, _QWORD *a5@<X8>)
{
  uint64_t v7;

  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  v7 = type metadata accessor for TitleView(0);
  OUTLINED_FUNCTION_236(v7, (uint64_t)a5 + *(int *)(v7 + 24), type metadata accessor for SGBannerViewModel);
  *((_BYTE *)a5 + *(int *)(v7 + 28)) = a4;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B118D228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  if (v9 == (id)6 && (a6 & 1) == 0)
  {
    OUTLINED_FUNCTION_113_1();
    sub_1B1193240((uint64_t)&unk_1EEF113A0);
    v10 = sub_1B11BB380();
    v12 = v11;
    OUTLINED_FUNCTION_229();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10858);
    a1 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(a1 + 16) = xmmword_1B11BE3D0;
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v12;
  }
  return a1;
}

uint64_t sub_1B118D360(uint64_t a1, int a2, void *a3, char a4)
{
  uint64_t v8;
  id v9;

  swift_getKeyPath();
  v8 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v8 + 16) = a1;
  *(_BYTE *)(v8 + 24) = a2 & 1;
  *(_BYTE *)(v8 + 25) = BYTE1(a2) & 1;
  *(_BYTE *)(v8 + 26) = BYTE2(a2) & 1;
  *(_QWORD *)(v8 + 32) = a3;
  *(_BYTE *)(v8 + 40) = a4;
  swift_bridgeObjectRetain_n();
  v9 = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113A8);
  sub_1B1193240((uint64_t)&unk_1EEF113B0);
  sub_1B118F9FC();
  return sub_1B11BB2FC();
}

void sub_1B118D480()
{
  uint64_t *v0;
  uint64_t *v1;
  unsigned int v2;
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
  char v13;
  char v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v16 = HIWORD(v2) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113E0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114C0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113D8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_137_1(v9, v15);
  v17 = *v1;
  v18 = v1[1];
  sub_1B1176EC8();
  OUTLINED_FUNCTION_114();
  v10 = sub_1B11BB0BC();
  v12 = v11;
  v14 = v13 & 1;
  sub_1B1185774();
  sub_1B117CED4(v10, v12, v14);
  OUTLINED_FUNCTION_229();
  sub_1B117587C();
  OUTLINED_FUNCTION_222();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11400);
  sub_1B118FC34();
  sub_1B11BB0F8();
  OUTLINED_FUNCTION_13_0();
  sub_1B1193438(v17, v18, v19);
  sub_1B118FBC8();
  sub_1B11A1A50(v16);
}

void sub_1B118D690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_1B1193558(v1, &qword_1EEF113E8);
  v5 = OUTLINED_FUNCTION_95_0(**(_QWORD **)(v4 - 192));
  *(_QWORD *)(v4 - 128) = v2;
  *(_QWORD *)(v4 - 120) = v0;
  v6 = OUTLINED_FUNCTION_2_0();
  v7 = *(_QWORD *)(v4 - 264);
  sub_1B11A1998(v5, *(_QWORD *)(v4 - 216), v6);
  OUTLINED_FUNCTION_97(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 200) + 8));
  KeyPath = swift_getKeyPath();
  v9 = *(_QWORD *)(v4 - 224);
  v10 = *(_QWORD *)(v4 - 256);
  v11 = *(_QWORD *)(v4 - 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v10, v7, v11);
  v12 = v10 + *(int *)(*(_QWORD *)(v4 - 232) + 36);
  *(_QWORD *)v12 = KeyPath;
  *(_BYTE *)(v12 + 8) = 1;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113C8);
  sub_1B118FAEC();
  sub_1B118FA68();
  sub_1B1185774();
  sub_1B1193558(v10, &qword_1EEF113D8);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B118D7C4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v0 = sub_1B11BB08C();
  return OUTLINED_FUNCTION_200(v0, v1, v2, v3);
}

void sub_1B118D804(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t *v5;

  KeyPath = swift_getKeyPath();
  sub_1B1188820(a1, a2, &qword_1EEF113D8);
  v5 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF113C8) + 36));
  *v5 = KeyPath;
  v5[1] = 0x4000000000000000;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B118D864()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  if (*(_BYTE *)(v0 + 9))
    v1 = 256;
  else
    v1 = 0;
  v2 = v1 | *(unsigned __int8 *)(v0 + 8);
  if (*(_BYTE *)(v0 + 10))
    v3 = 0x10000;
  else
    v3 = 0;
  return sub_1B118D360(*(_QWORD *)v0, v2 | v3, *(void **)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_1B118D8A0(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  id v7;

  v6 = (_QWORD *)OUTLINED_FUNCTION_4_0();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  OUTLINED_FUNCTION_114();
  v7 = a3;
  sub_1B11BB26C();
  OUTLINED_FUNCTION_74_1();
}

void sub_1B118D92C()
{
  uint64_t v0;

  sub_1B118D8A0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t sub_1B118D938@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B11BACCC();
  *a1 = result;
  return result;
}

uint64_t sub_1B118D960()
{
  swift_retain();
  return sub_1B11BACD8();
}

uint64_t sub_1B118D988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_1B11BAD08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1188820(v2, (uint64_t)v10, &qword_1ED381890);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1B11BAD74();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_1B11BB4A0();
    v14 = sub_1B11BAF90();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_1B117C4E0(0xD000000000000013, 0x80000001B11C0560, &v18);
      _os_log_impl(&dword_1B1170000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E17CEC](v16, -1, -1);
      MEMORY[0x1B5E17CEC](v15, -1, -1);
    }

    sub_1B11BACFC();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1B118DB98(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_1B11BAD08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_1B11BB4A0();
    v9 = sub_1B11BAF90();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_1B117C4E0(0x6C616E6F6974704FLL, 0xEE003E746E6F463CLL, &v14);
      _os_log_impl(&dword_1B1170000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E17CEC](v11, -1, -1);
      MEMORY[0x1B5E17CEC](v10, -1, -1);
    }

    sub_1B11BACFC();
    swift_getAtKeyPath();
    j__swift_release(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_1B118DD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
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
  int *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  OUTLINED_FUNCTION_103();
  v30 = v9;
  v29 = v10;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  *(_QWORD *)(v23 + 24) = 0;
  v25 = (int *)type metadata accessor for PrimaryActionButtonView(0);
  v26 = v24 + v25[11];
  *(_QWORD *)v26 = swift_getKeyPath();
  *(_BYTE *)(v26 + 8) = 0;
  v27 = (uint64_t *)(v24 + v25[12]);
  *v27 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  OUTLINED_FUNCTION_42_0();
  *(_QWORD *)v24 = v22;
  *(_QWORD *)(v24 + 8) = v20;
  *(_QWORD *)(v24 + 16) = v18;

  *(_QWORD *)(v24 + 24) = v16;
  *(_BYTE *)(v24 + 32) = v14;
  sub_1B11883D0(a9, v24 + v25[8], type metadata accessor for SGBannerViewModel);
  *(_QWORD *)(v24 + v25[9]) = 0;
  v28 = v24 + v25[10];
  *(_QWORD *)v28 = v12;
  *(_QWORD *)(v28 + 8) = v29;
  *(_BYTE *)(v28 + 16) = v30;
}

double sub_1B118DE3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  double result;

  v1 = OUTLINED_FUNCTION_15_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_36();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0CDB340], v1);
  v3 = OUTLINED_FUNCTION_90_0();
  v5 = sub_1B1182928(v3, v4);
  v6 = OUTLINED_FUNCTION_173_0();
  v7(v6);
  result = 0.0;
  if (v5)
    return *(double *)sub_1B11755D8();
  return result;
}

void sub_1B118DECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
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
  char *v39;
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
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74[2];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
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
  unint64_t v95;

  OUTLINED_FUNCTION_67_1();
  a23 = v26;
  a24 = v27;
  v28 = v24;
  v91 = v29;
  v30 = OUTLINED_FUNCTION_15_2();
  v89 = *(_QWORD *)(v30 - 8);
  v90 = v30;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_138_1(v32, v74[0]);
  v33 = sub_1B11BAAE0();
  OUTLINED_FUNCTION_155_0(v33, (uint64_t)&a17);
  v81 = v34;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_5_0();
  v79 = v36;
  v92 = type metadata accessor for PrimaryActionButtonView(0);
  v37 = *(_QWORD *)(v92 - 8);
  v38 = *(_QWORD *)(v37 + 64);
  MEMORY[0x1E0C80A78](v92);
  v39 = (char *)v74 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D80);
  OUTLINED_FUNCTION_155_0(v40, (uint64_t)&v95);
  v76 = v41;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_184();
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CA8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v44);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D60);
  OUTLINED_FUNCTION_155_0(v45, (uint64_t)&a10);
  v78 = v46;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v48);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380C88);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v49);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v50);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v51);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v53);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_55(v54);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380C68);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v55);
  OUTLINED_FUNCTION_55((uint64_t)v74 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CB8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v57);
  OUTLINED_FUNCTION_55((uint64_t)v74 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CE8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v59);
  OUTLINED_FUNCTION_140(v60, v74[0]);
  sub_1B1186804(v24, (uint64_t)v39, type metadata accessor for PrimaryActionButtonView);
  v61 = *(unsigned __int8 *)(v37 + 80);
  v62 = (v61 + 16) & ~v61;
  v85 = v62 + v38;
  v84 = v61 | 7;
  v63 = swift_allocObject();
  v86 = v62;
  sub_1B11883D0((uint64_t)v39, v63 + v62, type metadata accessor for PrimaryActionButtonView);
  v93 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D68);
  v64 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380DA0);
  v65 = sub_1B117EA98();
  v94 = v64;
  v95 = v65;
  OUTLINED_FUNCTION_2_0();
  sub_1B11BB26C();
  v80 = v39;
  sub_1B1186804(v24, (uint64_t)v39, type metadata accessor for PrimaryActionButtonView);
  v66 = swift_allocObject();
  sub_1B11883D0((uint64_t)v39, v66 + v62, type metadata accessor for PrimaryActionButtonView);
  v67 = sub_1B11BB338();
  v69 = v68;
  v70 = v76;
  v71 = v74[0];
  OUTLINED_FUNCTION_239(v74[0], v25, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v76 + 16));
  v72 = (_QWORD *)(v71 + *(int *)(v75 + 36));
  *v72 = sub_1B118E874;
  v72[1] = 0;
  v72[2] = sub_1B1190104;
  v72[3] = v66;
  v72[4] = v67;
  v72[5] = v69;
  OUTLINED_FUNCTION_97(v25, *(uint64_t (**)(uint64_t, uint64_t))(v70 + 8));
  v73 = *(unsigned __int8 *)(v28 + *(int *)(v92 + 32) + 6);
  sub_1B1190144();
  sub_1B11A1A2C(v73);
}

void sub_1B118E2EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t *v9;
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

  sub_1B1193558(v1, &qword_1ED380CA8);
  v4 = *(_QWORD *)(v3 - 320);
  v5 = *(_QWORD *)(v3 - 336);
  v6 = *(_QWORD *)(v3 - 304);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v5, *MEMORY[0x1E0CD8750], v6);
  KeyPath = swift_getKeyPath();
  v8 = *(_QWORD *)(v3 - 400);
  v9 = (uint64_t *)(v8 + *(int *)(*(_QWORD *)(v3 - 384) + 36));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380E00);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v9 + *(int *)(v10 + 28), v5, v6);
  *v9 = KeyPath;
  v11 = *(_QWORD *)(v3 - 368);
  v12 = *(_QWORD *)(v3 - 360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v8, v0, v12);
  OUTLINED_FUNCTION_97(v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v12);
  sub_1B1175894();
  sub_1B119022C();
  OUTLINED_FUNCTION_226();
  v13 = *(_QWORD *)(v3 - 376);
  OUTLINED_FUNCTION_90_0();
  sub_1B11BB0F8();
  OUTLINED_FUNCTION_28_0();
  sub_1B1193558(v8, &qword_1ED380C88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CF8);
  sub_1B11902D8();
  sub_1B1190344();
  OUTLINED_FUNCTION_246();
  sub_1B1185774();
  sub_1B1193558(v13, &qword_1ED380CC8);
  sub_1B11BAFD8();
  OUTLINED_FUNCTION_19();
  sub_1B11BAABC();
  v14 = OUTLINED_FUNCTION_84_1();
  v15 = v4;
  v16 = *(_QWORD *)(v3 - 344);
  OUTLINED_FUNCTION_174_0(v14, v16);
  OUTLINED_FUNCTION_48_1(v16 + *(int *)(*(_QWORD *)(v3 - 296) + 36));
  OUTLINED_FUNCTION_170_0(v15);
  sub_1B11BAFC0();
  sub_1B11BAABC();
  v17 = OUTLINED_FUNCTION_84_1();
  v18 = *(_QWORD *)(v3 - 288);
  OUTLINED_FUNCTION_139_0(v17, v18);
  OUTLINED_FUNCTION_44_1(v18 + *(int *)(*(_QWORD *)(v3 - 256) + 36));
  sub_1B11BAFB4();
  v19 = *(_QWORD *)(v3 - 200);
  v20 = *(_QWORD *)(v3 - 232);
  sub_1B118D988(v20);
  sub_1B118DE3C();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 224) + 8))(v20, *(_QWORD *)(v3 - 216));
  sub_1B11BAABC();
  OUTLINED_FUNCTION_8();
  v21 = *(_QWORD *)(v3 - 248);
  OUTLINED_FUNCTION_44_0(v18, v21);
  OUTLINED_FUNCTION_48_1(v21 + *(int *)(*(_QWORD *)(v3 - 240) + 36));
  OUTLINED_FUNCTION_87_0(v18);
  v22 = v2 + *(int *)(v19 + 40);
  v23 = *(_QWORD *)v22;
  v24 = *(_QWORD *)(v22 + 8);
  LOBYTE(v22) = *(_BYTE *)(v22 + 16);
  *(_QWORD *)(v3 - 168) = v23;
  *(_QWORD *)(v3 - 160) = v24;
  *(_BYTE *)(v3 - 152) = v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED380E30);
  sub_1B11BB2CC();
  v25 = *(_QWORD *)(v3 - 328);
  sub_1B1186804(v2, v25, type metadata accessor for PrimaryActionButtonView);
  swift_allocObject();
  OUTLINED_FUNCTION_242();
  sub_1B11883D0(v25, v26 + v27, type metadata accessor for PrimaryActionButtonView);
  sub_1B118BC80((uint64_t)&unk_1ED380CE0);
  sub_1B11904F0();
  OUTLINED_FUNCTION_90_0();
  sub_1B11BB140();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_133_0();
  OUTLINED_FUNCTION_131_1(v21);
  OUTLINED_FUNCTION_35();
}

void sub_1B118E698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_24();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D68);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_139_1(v3, v14);
  sub_1B1176EC8();
  OUTLINED_FUNCTION_223();
  v4 = sub_1B11BB0BC();
  v6 = v5;
  v8 = v7;
  v9 = (uint64_t *)(v1 + *(int *)(type metadata accessor for PrimaryActionButtonView(0) + 44));
  v10 = *v9;
  v11 = *((unsigned __int8 *)v9 + 8);
  j__swift_retain(*v9, v11);
  v12 = sub_1B118DB98(v10, v11);
  j__swift_release(v10, v11);
  if (!v12)
    sub_1B11BAFE4();
  sub_1B11BB008();
  sub_1B11BB020();
  swift_release();
  sub_1B11BB0B0();
  sub_1B117CED4(v4, v6, v8 & 1);
  swift_release();
  OUTLINED_FUNCTION_121();
  swift_getKeyPath();
  v13 = *(unsigned __int8 *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380DA0);
  sub_1B117EA98();
  sub_1B11A19C4(v13);
}

void sub_1B118E838()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B117CED4(v3, v0, v1);
  OUTLINED_FUNCTION_133_0();
  swift_bridgeObjectRelease();
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v4 - 168) + 32))(*(_QWORD *)(v4 - 152), v2, *(_QWORD *)(v4 - 160));
  OUTLINED_FUNCTION_15();
}

void sub_1B118E878(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_7();
  KeyPath = swift_getKeyPath();
  v5 = sub_1B11BB320();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v5);
  v6 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CF8) + 36));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380E10);
  OUTLINED_FUNCTION_30(v1, (uint64_t)v6 + *(int *)(v7 + 28));
  *v6 = KeyPath;
  v8 = OUTLINED_FUNCTION_173_0();
  sub_1B1188820(v8, v9, v10);
  OUTLINED_FUNCTION_122_1(v1);
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B118E93C()
{
  return sub_1B11BACB4();
}

uint64_t sub_1B118E95C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF114B8);
  MEMORY[0x1E0C80A78](v2);
  sub_1B1188820(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EEF114B8);
  return sub_1B11BACC0();
}

void sub_1B118E9E0(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W3>, _QWORD *a4@<X8>)
{
  uint64_t v6;

  *a4 = a1;
  a4[1] = a2;
  v6 = type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_236(v6, (uint64_t)a4 + *(int *)(v6 + 24), type metadata accessor for SGBannerViewModel);
  *((_BYTE *)a4 + *(int *)(v6 + 28)) = a3;
  OUTLINED_FUNCTION_5();
}

void sub_1B118EA30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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
  uint64_t *v18;
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
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
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
  id v68;
  uint64_t v69;

  OUTLINED_FUNCTION_24();
  v50 = v0;
  v67 = v5;
  v6 = sub_1B11BAD44();
  v65 = *(_QWORD *)(v6 - 8);
  v66 = v6;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_5_0();
  v64 = v8;
  v9 = type metadata accessor for CloseButtonView(0);
  v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
  v60 = *(_QWORD *)(v9 - 8);
  v61 = v10;
  MEMORY[0x1E0C80A78](v9);
  v57 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380FA0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_103_0();
  v13 = sub_1B11BB224();
  OUTLINED_FUNCTION_190();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_47();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381108);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  v18 = (uint64_t *)((char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381150);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_36();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D70);
  v58 = *(_QWORD *)(v20 - 8);
  v59 = v20;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_138_1(v22, v50);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380C98);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_5_0();
  v54 = v24;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380CD8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_4();
  v55 = v26;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_29_0();
  v62 = v28;
  swift_bridgeObjectRetain();
  v29 = sub_1B11BB200();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v4, *MEMORY[0x1E0CDF7D8], v13);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)v2 + *(int *)(v52 + 28), v4, v13);
  *v2 = KeyPath;
  OUTLINED_FUNCTION_30((uint64_t)v2, (uint64_t)v18 + *(int *)(v15 + 36));
  *v18 = v29;
  swift_retain();
  OUTLINED_FUNCTION_122_1((uint64_t)v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v13);
  OUTLINED_FUNCTION_155();
  LODWORD(v15) = sub_1B11BAEE8();
  OUTLINED_FUNCTION_224((uint64_t)v18, v1);
  *(_DWORD *)(v1 + *(int *)(v51 + 36)) = v15;
  OUTLINED_FUNCTION_169_0((uint64_t)v18);
  v31 = v50;
  v32 = v57;
  sub_1B1186804(v50, v57, type metadata accessor for CloseButtonView);
  v33 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  v34 = OUTLINED_FUNCTION_210();
  sub_1B11883D0(v32, v34 + v33, type metadata accessor for CloseButtonView);
  sub_1B119059C((uint64_t)&unk_1ED381148);
  v35 = v53;
  sub_1B11BB0EC();
  swift_release();
  sub_1B1193558(v1, &qword_1ED381150);
  sub_1B1186804(v31, v32, type metadata accessor for CloseButtonView);
  v36 = OUTLINED_FUNCTION_210();
  sub_1B11883D0(v32, v36 + v33, type metadata accessor for CloseButtonView);
  v37 = sub_1B11BB338();
  v39 = v38;
  v41 = v58;
  v40 = v59;
  v42 = v54;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v54, v35, v59);
  v43 = (_QWORD *)(v42 + *(int *)(v56 + 36));
  *v43 = sub_1B118E874;
  v43[1] = 0;
  v43[2] = sub_1B11907B4;
  v43[3] = v36;
  v43[4] = v37;
  v43[5] = v39;
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v35, v40);
  sub_1B11BAD38();
  sub_1B11907FC();
  v44 = v55;
  sub_1B11BB128();
  OUTLINED_FUNCTION_124_1(v65);
  sub_1B1193558(v42, &qword_1ED380C98);
  sub_1B1175888();
  OUTLINED_FUNCTION_226();
  v45 = v62;
  OUTLINED_FUNCTION_90_0();
  sub_1B11BABA0();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_131_1(v44);
  v68 = sub_1B1175A30(0xD00000000000001ELL);
  v69 = v46;
  sub_1B1176EC8();
  sub_1B11BB0BC();
  LOBYTE(v40) = v47 & 1;
  sub_1B11BABAC();
  v48 = OUTLINED_FUNCTION_90_0();
  sub_1B117CED4(v48, v49, v40);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_131_1(v45);
  OUTLINED_FUNCTION_15();
}

void sub_1B118EF1C(uint64_t *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)OUTLINED_FUNCTION_40_0(*a1);
  if (v3)
  {
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_suggestionDismissAction) & 1) != 0)
    {
      v4 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionDismissAction);
      if (v4)
      {
        v11 = v4;
        objc_msgSend(v4, sel_execute);
        swift_unknownObjectRelease_n();
LABEL_9:

        return;
      }
      OUTLINED_FUNCTION_225();
    }
    OUTLINED_FUNCTION_225();
  }
  OUTLINED_FUNCTION_114_1();
  v6 = (void *)(*(uint64_t (**)(void))(v5 + 696))();
  if (v6)
  {
    v11 = v6;
    objc_msgSend(v6, sel_execute);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_114_1();
  if (((*(uint64_t (**)(void))(v7 + 648))() & 1) != 0)
  {
    OUTLINED_FUNCTION_114_1();
    v9 = (void *)(*(uint64_t (**)(void))(v8 + 432))();
    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v9, sel_respondsToSelector_, sel_suggestionBatchDismissal))
      {
        if ((objc_msgSend(v10, sel_respondsToSelector_, sel_suggestionBatchDismissal) & 1) != 0)
          objc_msgSend(v10, sel_suggestionBatchDismissal);
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    objc_msgSend(a2, sel_dismissAllSuggestions);
  }
}

void sub_1B118F0A0(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1B11BB1A0();
  sub_1B11BAB40();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_5();
}

void sub_1B118F0D8()
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
  char *v13;
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
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
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
  char *v52;
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

  OUTLINED_FUNCTION_24();
  v60 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11418);
  v7 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  v54 = v7;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_5_0();
  v55 = v9;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11420);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_141();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v50 - v12;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11428);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11430);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_5_0();
  v58 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11438);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_47();
  v18 = sub_1B11BB20C();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_17_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11440);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_7();
  if (*(_QWORD *)(v0 + 40))
  {
    v56 = v20;
    OUTLINED_FUNCTION_79_0();
    v21 = sub_1B11BB200();
    OUTLINED_FUNCTION_165_0(v21, *MEMORY[0x1E0CDF6F8]);
    OUTLINED_FUNCTION_175_0();
    sub_1B11BB230();
    OUTLINED_FUNCTION_133_0();
    OUTLINED_FUNCTION_164_0();
    sub_1B11BAD98();
    v22 = sub_1B11BADA4();
    OUTLINED_FUNCTION_42_2(v4, v23, v24, v22);
    v25 = sub_1B11BB218();
    OUTLINED_FUNCTION_38();
    sub_1B1193558(v4, &qword_1EEF11438);
    v26 = sub_1B11BB1AC();
    v27 = sub_1B11BB188();
    v61 = v25;
    v62 = v26;
    v63 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11460);
    sub_1B1190934();
    sub_1B11BB11C();
    swift_release();
    OUTLINED_FUNCTION_52_1();
    OUTLINED_FUNCTION_133_0();
    OUTLINED_FUNCTION_30(v2, v1);
    OUTLINED_FUNCTION_42_0();
    sub_1B11908C8();
    sub_1B11909B8();
    v28 = v58;
    sub_1B11BAE88();
    OUTLINED_FUNCTION_122_1(v2);
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11448);
    OUTLINED_FUNCTION_42_2(v28, v30, v31, v29);
    v32 = v28;
LABEL_5:
    sub_1B1188514(v32, v60, &qword_1EEF11430);
    OUTLINED_FUNCTION_15();
    return;
  }
  v51 = v3;
  v52 = v13;
  v33 = v55;
  v34 = *(void **)v0;
  if (*(_QWORD *)v0)
  {
    v56 = v20;
    v35 = v34;
    v36 = sub_1B11BB1F4();
    OUTLINED_FUNCTION_165_0(v36, *MEMORY[0x1E0CDF6F8]);
    OUTLINED_FUNCTION_175_0();
    v37 = sub_1B11BB230();
    swift_release();
    OUTLINED_FUNCTION_164_0();
    v61 = v37;
    v38 = *(_BYTE *)(v0 + 24);
    v39 = OUTLINED_FUNCTION_95_0(**(_QWORD **)(v0 + 16));
    v40 = MEMORY[0x1E0CDF840];
    v41 = MEMORY[0x1E0CDF820];
    v42 = v33;
    sub_1B11A19F4(v38, v39, MEMORY[0x1E0CDF840], MEMORY[0x1E0CDF820]);
    swift_release();
    v61 = v40;
    v62 = v41;
    OUTLINED_FUNCTION_2_0();
    v43 = v51;
    sub_1B11BB11C();
    OUTLINED_FUNCTION_97(v42, *(uint64_t (**)(uint64_t, uint64_t))(v54 + 8));
    v44 = (uint64_t)v52;
    OUTLINED_FUNCTION_234(v43);
    OUTLINED_FUNCTION_44_0(v44, v1);
    OUTLINED_FUNCTION_54();
    sub_1B11908C8();
    sub_1B11909B8();
    v45 = v58;
    sub_1B11BAE88();

    OUTLINED_FUNCTION_87_0(v44);
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11448);
    OUTLINED_FUNCTION_42_2(v45, v47, v48, v46);
    v32 = v45;
    goto LABEL_5;
  }
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11448);
  OUTLINED_FUNCTION_73_0(v60, 1, 1, v49);
}

void sub_1B118F524(uint64_t a1)
{
  sub_1B118F58C(a1, (SEL *)&selRef_systemBackgroundColor, &qword_1ED383128);
}

_QWORD *sub_1B118F538()
{
  if (qword_1ED381E10 != -1)
    swift_once();
  return &qword_1ED383128;
}

void sub_1B118F578(uint64_t a1)
{
  sub_1B118F58C(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1ED383110);
}

void sub_1B118F58C(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  *a3 = MEMORY[0x1B5E17248](v4);
  OUTLINED_FUNCTION_41();
}

_QWORD *sub_1B118F5CC()
{
  if (qword_1ED381BE8 != -1)
    swift_once();
  return &qword_1ED383110;
}

void sub_1B118F60C()
{
  sub_1B118F6C8();
}

void *sub_1B118F620()
{
  if (qword_1ED381C70 != -1)
    swift_once();
  return &unk_1ED383118;
}

void sub_1B118F660()
{
  sub_1B118F780();
}

void *sub_1B118F674()
{
  if (qword_1ED3820C8 != -1)
    swift_once();
  return &unk_1ED383120;
}

void sub_1B118F6B4()
{
  sub_1B118F6C8();
}

void sub_1B118F6C8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_156_0();
  OUTLINED_FUNCTION_190();
  MEMORY[0x1E0C80A78](v1);
  v2 = OUTLINED_FUNCTION_115_1();
  OUTLINED_FUNCTION_189_0(v2, *MEMORY[0x1E0CDD6D8]);
  OUTLINED_FUNCTION_250();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_185_0();
  v3 = sub_1B11BAFFC();
  swift_release();
  *v0 = v3;
  OUTLINED_FUNCTION_22();
}

void *sub_1B118F740()
{
  if (qword_1ED3823C0 != -1)
    swift_once();
  return &unk_1EEF138A0;
}

void sub_1B118F780()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_156_0();
  OUTLINED_FUNCTION_190();
  MEMORY[0x1E0C80A78](v1);
  v2 = OUTLINED_FUNCTION_115_1();
  OUTLINED_FUNCTION_189_0(v2, *MEMORY[0x1E0CDD6D8]);
  v3 = OUTLINED_FUNCTION_250();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_185_0();
  *v0 = v3;
  OUTLINED_FUNCTION_22();
}

void sub_1B118F7E4()
{
  uint64_t v0;

  sub_1B11BB044();
  sub_1B11BB014();
  v0 = sub_1B11BB020();
  OUTLINED_FUNCTION_133_0();
  qword_1EEF138A8 = v0;
  OUTLINED_FUNCTION_41();
}

uint64_t *sub_1B118F81C()
{
  if (qword_1ED3823E0 != -1)
    swift_once();
  return &qword_1EEF138A8;
}

unint64_t sub_1B118F85C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED381718;
  if (!qword_1ED381718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381720);
    v2 = sub_1B118F8E0();
    sub_1B1193240((uint64_t)&unk_1ED381790);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED381718);
  }
  return result;
}

unint64_t sub_1B118F8E0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_1ED3816E0;
  if (!qword_1ED3816E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3816E8);
    v2 = sub_1B118BE98();
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED3816E0);
  }
  return result;
}

uint64_t sub_1B118F94C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B11BAC9C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1B118F978()
{
  return sub_1B11BACA8();
}

uint64_t sub_1B118F99C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1B118F9C8()
{
  sub_1B118D480();
}

unint64_t sub_1B118F9FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF113B8;
  if (!qword_1EEF113B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113A8);
    v2[0] = sub_1B118FA68();
    v2[1] = sub_1B118FAEC();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF113B8);
  }
  return result;
}

unint64_t sub_1B118FA68()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF113C0;
  if (!qword_1EEF113C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113C8);
    v2 = sub_1B118FAEC();
    sub_1B1193240((uint64_t)&unk_1EEF11408);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF113C0);
  }
  return result;
}

unint64_t sub_1B118FAEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_1EEF113D0;
  if (!qword_1EEF113D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113D8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113E0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113E8);
    sub_1B118FBC8();
    v5[2] = v2;
    v5[3] = swift_getOpaqueTypeConformance2();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B1193240((uint64_t)&unk_1ED381778);
    v5[0] = OpaqueTypeConformance2;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF113D0);
  }
  return result;
}

unint64_t sub_1B118FBC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF113F0;
  if (!qword_1EEF113F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF113E8);
    v2[0] = sub_1B118FC34();
    v2[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF113F0);
  }
  return result;
}

unint64_t sub_1B118FC34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF113F8;
  if (!qword_1EEF113F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11400);
    v2[0] = MEMORY[0x1E0CDDD58];
    v2[1] = MEMORY[0x1E0CDDD58];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF113F8);
  }
  return result;
}

uint64_t sub_1B118FC90()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1B118FCBC()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  v1 = *(uint64_t **)(v0 + 32);
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (void *)OUTLINED_FUNCTION_40_0(*v1);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_suggestionPrimaryAction);
    swift_unknownObjectRelease();
  }
  else
  {
    v4 = (id)(*(uint64_t (**)(void))((*v2 & *v1) + 0x2A0))();
  }
  objc_msgSend(v4, sel_execute);

}

uint64_t sub_1B118FD54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  sub_1B1176EC8();
  OUTLINED_FUNCTION_114();
  v2 = sub_1B11BB0BC();
  v4 = v3;
  v6 = v5 & 1;
  sub_1B11BB044();
  v7 = sub_1B11BB0B0();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  OUTLINED_FUNCTION_52_1();
  sub_1B117CED4(v2, v4, v6);
  result = OUTLINED_FUNCTION_96();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t type metadata accessor for PrimaryActionButtonView(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382670);
}

void sub_1B118FE40()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;

  type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_137();
  v2 = (void *)OUTLINED_FUNCTION_40_0(**(_QWORD **)(v0 + v1 + 16));
  if (v2)
  {
    v5 = objc_msgSend(v2, sel_suggestionPrimaryAction);
    OUTLINED_FUNCTION_225();
    objc_msgSend(v5, sel_execute);
LABEL_5:

    return;
  }
  OUTLINED_FUNCTION_114_1();
  v4 = (void *)(*(uint64_t (**)(void))(v3 + 672))();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_execute);
    goto LABEL_5;
  }
  swift_retain();
  OUTLINED_FUNCTION_171_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED380E30);
  MEMORY[0x1B5E17380](&v6);
  sub_1B11BB2C0();
  OUTLINED_FUNCTION_133_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_74_1();
}

void sub_1B118FF6C()
{
  sub_1B118E698();
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_103();
  v2 = type metadata accessor for PrimaryActionButtonView(0);
  v3 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80));
  swift_bridgeObjectRelease();

  v4 = v3 + *(int *)(v2 + 32);
  swift_bridgeObjectRelease();
  v5 = OUTLINED_FUNCTION_19();
  v6 = (id *)(v4 + *(int *)(v5 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = (char *)v6 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  v9 = *(void (**)(char *, uint64_t))(v8 + 8);
  v9(v7, v1);
  swift_release();
  swift_release();
  v10 = *(int *)(v5 + 56);
  v11 = OUTLINED_FUNCTION_58();
  v9((char *)(v4 + v10 + *(int *)(v11 + 56)), v1);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_241(v3 + *(int *)(v2 + 44));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_118() == 1)
  {
    v12 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_124_1(*(_QWORD *)(v12 - 8));
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_1B1190104()
{
  double *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_187_0();
  (*(void (**)(double))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v1 + 16)) + 0x1D0))(*v0);
  OUTLINED_FUNCTION_41();
}

unint64_t sub_1B1190144()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED380CA0;
  if (!qword_1ED380CA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CA8);
    sub_1B1193240((uint64_t)&unk_1ED380D78);
    v3 = v2;
    sub_1B1193240((uint64_t)&unk_1ED380DB0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED380CA0);
  }
  return result;
}

uint64_t sub_1B11901E0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B11BAC54();
  *a1 = v3;
  return result;
}

uint64_t sub_1B1190208()
{
  return sub_1B11BAC60();
}

unint64_t sub_1B119022C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_1ED380C80;
  if (!qword_1ED380C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380C88);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CA8);
    v4[3] = sub_1B1190144();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B1193240((uint64_t)&unk_1ED380DF0);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED380C80);
  }
  return result;
}

unint64_t sub_1B11902D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1ED380CC0;
  if (!qword_1ED380CC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CC8);
    v2[0] = sub_1B119022C();
    v2[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1ED380CC0);
  }
  return result;
}

unint64_t sub_1B1190344()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED380CF0;
  if (!qword_1ED380CF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CF8);
    v2 = sub_1B11902D8();
    sub_1B1193240((uint64_t)&unk_1ED380E08);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED380CF0);
  }
  return result;
}

void sub_1B11903CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_123_1();
  OUTLINED_FUNCTION_137();
  v2 = v0 + v1;
  OUTLINED_FUNCTION_244();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED380E30);
  OUTLINED_FUNCTION_240();
  v3 = *(id *)(v2 + 16);
  sub_1B1195DC4();
  OUTLINED_FUNCTION_200(v4, v5, v6, v7);
  OUTLINED_FUNCTION_74_1();
}

void sub_1B119043C()
{
  sub_1B118BC80((uint64_t)&unk_1ED380CB0);
}

void sub_1B1190460()
{
  sub_1B118BC80((uint64_t)&unk_1ED380C60);
}

unint64_t sub_1B1190484()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1ED380D20;
  if (!qword_1ED380D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380D28);
    v2[0] = sub_1B1190344();
    v2[1] = sub_1B11902D8();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1ED380D20);
  }
  return result;
}

unint64_t sub_1B11904F0()
{
  unint64_t result;

  result = qword_1ED380F90;
  if (!qword_1ED380F90)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BECC8, &type metadata for SGSuggestionTableControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1ED380F90);
  }
  return result;
}

uint64_t type metadata accessor for CloseButtonView(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1ED382180);
}

uint64_t sub_1B1190540()
{
  return sub_1B11BAC30();
}

void sub_1B1190560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B117C958(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDF7E8], MEMORY[0x1E0CDA4B0]);
}

void sub_1B1190578()
{
  uint64_t v0;

  type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_187_0();
  sub_1B118EF1C(*(uint64_t **)v0, *(void **)(v0 + 8));
}

void sub_1B119059C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v4 = OUTLINED_FUNCTION_248(0, v3);
    v5 = v2();
    sub_1B1193240((uint64_t)&unk_1ED381758);
    v7[0] = v5;
    v7[1] = v6;
    atomic_store(MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v4, v7), v1);
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B1190608()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381100;
  if (!qword_1ED381100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381108);
    sub_1B1193240((uint64_t)&unk_1ED380F98);
    v3[0] = MEMORY[0x1E0CDF820];
    v3[1] = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381100);
  }
  return result;
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  id *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for CloseButtonView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 24);
  swift_bridgeObjectRelease();
  v5 = OUTLINED_FUNCTION_19();
  v6 = (id *)&v4[*(int *)(v5 + 48)];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = (char *)v6 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v8 = OUTLINED_FUNCTION_56_0();
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_release();
  swift_release();
  v10 = *(int *)(v5 + 56);
  v11 = OUTLINED_FUNCTION_58();
  v9(&v4[v10 + *(int *)(v11 + 56)], v8);
  return swift_deallocObject();
}

void sub_1B11907B4(double *a1)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_137();
  (*(void (**)(double))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v1 + v3)) + 0x1E8))(*a1);
  OUTLINED_FUNCTION_41();
}

unint64_t sub_1B11907FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_1ED380C90;
  if (!qword_1ED380C90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380C98);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381150);
    sub_1B119059C((uint64_t)&unk_1ED381148);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B1193240((uint64_t)&unk_1ED3815F8);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v6);
    atomic_store(result, (unint64_t *)&qword_1ED380C90);
  }
  return result;
}

unint64_t sub_1B11908C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF11450;
  if (!qword_1EEF11450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11440);
    v2[0] = sub_1B1190934();
    v2[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF11450);
  }
  return result;
}

unint64_t sub_1B1190934()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11458;
  if (!qword_1EEF11458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11460);
    sub_1B1193240((uint64_t)&unk_1EEF11468);
    v3[0] = MEMORY[0x1E0CDF820];
    v3[1] = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11458);
  }
  return result;
}

unint64_t sub_1B11909B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1EEF11478;
  if (!qword_1EEF11478)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11420);
    v2[2] = MEMORY[0x1E0CDF840];
    v2[3] = MEMORY[0x1E0CDF820];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF11478);
  }
  return result;
}

uint64_t sub_1B1190A48()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A54()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A64()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A70()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A7C()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A88()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190A94()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190AA0()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B1190AC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B1190AD4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

#error "1B1190BA4: call analysis failed (funcsize=94)"

uint64_t sub_1B1190C60(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_85_0(a1);
  OUTLINED_FUNCTION_132_0();
  v1 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_72_1(v1);
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_204();
  OUTLINED_FUNCTION_203();
  OUTLINED_FUNCTION_57_0();
  v2 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_39_1(v2);
  OUTLINED_FUNCTION_88_1();
  OUTLINED_FUNCTION_197();
  v3 = OUTLINED_FUNCTION_58();
  v4 = OUTLINED_FUNCTION_117_1(v3);
  return OUTLINED_FUNCTION_43_1(v4, v5, v6);
}

_QWORD *sub_1B1190CD0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;

  v48 = (void *)*a2;
  *a1 = *a2;
  OUTLINED_FUNCTION_80_0((uint64_t)a1, (uint64_t)a2, *(int *)(a3 + 20));
  v47 = v7;
  *(_QWORD *)(v4 + 8) = v8;
  *(_QWORD *)(v4 + 16) = v7;
  v49 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_85_1(v49);
  v9 = (void *)v6[4];
  v5[3] = v6[3];
  v5[4] = v9;
  v11 = (void *)v6[5];
  v10 = v6[6];
  v5[5] = v11;
  v5[6] = v10;
  v12 = v6[8];
  v5[7] = v6[7];
  v5[8] = v12;
  v13 = (void *)v6[10];
  v5[9] = v6[9];
  v5[10] = v13;
  v15 = (void *)v6[11];
  v14 = v6[12];
  v5[11] = v15;
  v5[12] = v14;
  v16 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v43 = (uint64_t)v6 + v16;
  v45 = (uint64_t)v5 + v16;
  v17 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_212(v17, v18, v19, v20, v21, v22, v23, v24, v43, v45, v47, v48);
  swift_bridgeObjectRetain();
  v25 = v9;
  v26 = v11;
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_79_0();
  v27 = v13;
  v28 = v15;
  OUTLINED_FUNCTION_100(v46, v44);
  v29 = *(int *)(v49 + 52);
  v30 = v4 + v29;
  v31 = v3 + v29;
  v32 = *(_QWORD *)(v31 + 8);
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_QWORD *)(v30 + 8) = v32;
  *(_WORD *)(v30 + 16) = *(_WORD *)(v31 + 16);
  v33 = *(int *)(v49 + 56);
  v34 = (_OWORD *)(v4 + v33);
  v35 = (_OWORD *)(v3 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  v37 = v35[3];
  v34[2] = v35[2];
  v34[3] = v37;
  v34[4] = v35[4];
  v38 = (int *)OUTLINED_FUNCTION_58();
  v39 = v38[14];
  v40 = (uint64_t)v34 + v39;
  v41 = (uint64_t)v35 + v39;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_100(v40, v41);
  *(_QWORD *)((char *)v34 + v38[15]) = *(_QWORD *)((char *)v35 + v38[15]);
  *((_BYTE *)v34 + v38[16]) = *((_BYTE *)v35 + v38[16]);
  result = a1;
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return result;
}

void sub_1B1190E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_81_1(v15, v16);

  OUTLINED_FUNCTION_3_1(*(int *)(v10 + 20));
  OUTLINED_FUNCTION_96();
  v17 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_3(v17);

  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_60_2();

  OUTLINED_FUNCTION_59_2();
  *(_QWORD *)(v13 + 96) = *(_QWORD *)(v14 + 96);
  v18 = v13 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v19 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_31_3(v19);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_52_1();
  v20 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_35_2(v20);
  *(_QWORD *)(v10 + v11[15]) = *(_QWORD *)(v18 + v11[15]);
  *(_BYTE *)(v10 + v11[16]) = *(_BYTE *)(v18 + v11[16]);
  OUTLINED_FUNCTION_32_3(*(int *)(a10 + 24));
  OUTLINED_FUNCTION_112_0();
}

void sub_1B1190F10()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v7 = OUTLINED_FUNCTION_195(v5, v6);
  v9 = *(int *)(v8 + 20);
  v10 = (char *)v7 + v9;
  v12 = v11 + v9;
  *(_DWORD *)v10 = *(_DWORD *)(v11 + v9);
  v10[4] = *(_BYTE *)(v11 + v9 + 4);
  *(_WORD *)(v10 + 5) = *(_WORD *)(v11 + v9 + 5);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + v9 + 8);
  v13 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_3(v13);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  v14 = v0[13];
  v15 = &v10[v14];
  v16 = v12 + v14;
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *((_WORD *)v15 + 8) = *(_WORD *)(v16 + 16);
  v17 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v17);
  *(_QWORD *)(v1 + v0[15]) = *(_QWORD *)(v2 + v0[15]);
  *(_BYTE *)(v1 + v0[16]) = *(_BYTE *)(v2 + v0[16]);
  OUTLINED_FUNCTION_32_3(*(int *)(v4 + 24));
  OUTLINED_FUNCTION_15();
}

void sub_1B1190FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_93_0(v4, v5);
  OUTLINED_FUNCTION_8_3(*(int *)(v0 + 20));
  v6 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9_3(v6);
  OUTLINED_FUNCTION_62_2();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_61_2();
  *(_QWORD *)(v2 + 96) = *(_QWORD *)(v3 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_64_1();
  *(_BYTE *)(v2 + 16) = *(_BYTE *)(v3 + 16);
  *(_BYTE *)(v2 + 17) = *(_BYTE *)(v3 + 17);
  v7 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v7);
  *(_QWORD *)(v2 + *(int *)(v1 + 60)) = *(_QWORD *)(v3 + *(int *)(v1 + 60));
  *(_BYTE *)(v2 + *(int *)(v1 + 64)) = *(_BYTE *)(v3 + *(int *)(v1 + 64));
  OUTLINED_FUNCTION_32_3(*(int *)(v0 + 24));
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B119106C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B119107C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B119108C()
{
  unint64_t v0;

  OUTLINED_FUNCTION_198();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_149();
    swift_initStructMetadata();
  }
  OUTLINED_FUNCTION_7_0();
}

void type metadata accessor for BannerIconSGViewRepresentable()
{
  OUTLINED_FUNCTION_29();
}

#error "1B11911E8: call analysis failed (funcsize=96)"

uint64_t sub_1B1191284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_199();
  OUTLINED_FUNCTION_186();

  OUTLINED_FUNCTION_132_0();
  v1 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_72_1(v1);
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_204();
  OUTLINED_FUNCTION_203();
  OUTLINED_FUNCTION_57_0();
  v2 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_39_1(v2);
  OUTLINED_FUNCTION_88_1();
  OUTLINED_FUNCTION_197();
  v3 = OUTLINED_FUNCTION_58();
  v4 = OUTLINED_FUNCTION_117_1(v3);
  return OUTLINED_FUNCTION_43_1(v4, v5, v6);
}

#error "1B11913B8: call analysis failed (funcsize=84)"

void sub_1B1191450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_57_2(v15, v16);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_179_0();

  OUTLINED_FUNCTION_3_1(*(int *)(v10 + 24));
  OUTLINED_FUNCTION_96();
  v17 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_3(v17);

  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_60_2();

  OUTLINED_FUNCTION_59_2();
  *(_QWORD *)(v13 + 96) = *(_QWORD *)(v14 + 96);
  v18 = v13 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v19 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_31_3(v19);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_52_1();
  v20 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_35_2(v20);
  *(_QWORD *)(v10 + v11[15]) = *(_QWORD *)(v18 + v11[15]);
  *(_BYTE *)(v10 + v11[16]) = *(_BYTE *)(v18 + v11[16]);
  OUTLINED_FUNCTION_32_3(*(int *)(a10 + 28));
  OUTLINED_FUNCTION_112_0();
}

void sub_1B1191518()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
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

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_162_0(v1, v2);
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v3 + 16);
  v6 = *(int *)(v5 + 24);
  v7 = v4 + v6;
  v8 = v3 + v6;
  *(_DWORD *)v7 = *(_DWORD *)(v3 + v6);
  *(_BYTE *)(v7 + 4) = *(_BYTE *)(v3 + v6 + 4);
  *(_WORD *)(v7 + 5) = *(_WORD *)(v3 + v6 + 5);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v3 + v6 + 8);
  v9 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_3(v9);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  v10 = *(int *)(v0 + 52);
  v11 = v7 + v10;
  v12 = v8 + v10;
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_WORD *)(v11 + 16) = *(_WORD *)(v12 + 16);
  v13 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v13);
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_15();
}

void sub_1B11915B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_94_0(v3, v4);
  OUTLINED_FUNCTION_178_0();
  OUTLINED_FUNCTION_8_3(*(int *)(v0 + 24));
  v5 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9_3(v5);
  OUTLINED_FUNCTION_62_2();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_61_2();
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(v2 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_64_1();
  *(_BYTE *)(v1 + 16) = *(_BYTE *)(v2 + 16);
  *(_BYTE *)(v1 + 17) = *(_BYTE *)(v2 + 17);
  v6 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v6);
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B119163C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1191648()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_118_0();
  if (v2)
  {
    OUTLINED_FUNCTION_122_0(*(_QWORD *)(v0 + 8));
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_19();
    v4 = OUTLINED_FUNCTION_211(*(int *)(v3 + 24));
    OUTLINED_FUNCTION_49(v4, v5, v6);
  }
}

uint64_t sub_1B1191690()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B119169C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_152();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_19();
    v5 = OUTLINED_FUNCTION_109_0(*(int *)(v4 + 24));
    OUTLINED_FUNCTION_50(v5, v6, v7, v8);
  }
}

void sub_1B11916E0()
{
  sub_1B1192BFC();
}

void sub_1B11916F8(_QWORD *a1, _QWORD *a2)
{
  OUTLINED_FUNCTION_195(a1, a2);
  swift_retain();
  OUTLINED_FUNCTION_41();
}

void sub_1B1191720(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_77(a1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_143(*(id *)(v1 + 16));
}

void sub_1B1191740(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  v2 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v2;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  v3 = v2;
  OUTLINED_FUNCTION_41();
}

void sub_1B119178C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_199();
  *(_QWORD *)v1 = *v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_111_1();
  v3 = *(void **)(v1 + 16);
  OUTLINED_FUNCTION_233(v4);

  *(_BYTE *)(v1 + 24) = *(_BYTE *)(v0 + 24);
  OUTLINED_FUNCTION_5();
}

void sub_1B11917D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_111_1();
  OUTLINED_FUNCTION_231(v4);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1191818(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 25))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

uint64_t sub_1B1191854(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SubtitleView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B11918A8(uint64_t a1)
{
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_143(*(id *)(a1 + 16));
}

void sub_1B11918C8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  OUTLINED_FUNCTION_41();
}

void sub_1B11918FC(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28_0();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  OUTLINED_FUNCTION_233(v4);

  OUTLINED_FUNCTION_5();
}

void sub_1B119194C(uint64_t a1, uint64_t a2)
{
  void *v4;

  OUTLINED_FUNCTION_195((_QWORD *)a1, (_QWORD *)a2);
  OUTLINED_FUNCTION_186();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1191984(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

uint64_t sub_1B11919C0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for EmbeddedActionButtonView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B1191A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  id v22;
  id v23;
  id v24;
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
  id v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;

  OUTLINED_FUNCTION_215();
  if ((v3 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_101_1();
  }
  else
  {
    v4 = v2;
    v5 = *(_QWORD *)(v1 + 8);
    *(_QWORD *)v0 = *(_QWORD *)v1;
    *(_QWORD *)(v0 + 8) = v5;
    v72 = *(void **)(v1 + 16);
    v73 = *(void **)(v1 + 24);
    *(_QWORD *)(v0 + 16) = v72;
    *(_QWORD *)(v0 + 24) = v73;
    *(_BYTE *)(v0 + 32) = *(_BYTE *)(v1 + 32);
    v6 = *(int *)(v2 + 32);
    v7 = v0 + v6;
    v8 = v1 + v6;
    OUTLINED_FUNCTION_109_1();
    *(_QWORD *)(v7 + 8) = v9;
    *(_QWORD *)(v7 + 16) = v10;
    v74 = OUTLINED_FUNCTION_19();
    v11 = *(int *)(v74 + 48);
    v12 = v7 + v11;
    v13 = (_QWORD *)(v8 + v11);
    *(_BYTE *)v12 = *(_BYTE *)(v8 + v11);
    *(_WORD *)(v12 + 1) = *(_WORD *)(v8 + v11 + 1);
    *(_OWORD *)(v12 + 8) = *(_OWORD *)(v8 + v11 + 8);
    v14 = *(void **)(v8 + v11 + 32);
    *(_QWORD *)(v12 + 24) = *(_QWORD *)(v8 + v11 + 24);
    *(_QWORD *)(v12 + 32) = v14;
    v16 = *(void **)(v8 + v11 + 40);
    v15 = *(_QWORD *)(v8 + v11 + 48);
    *(_QWORD *)(v12 + 40) = v16;
    *(_QWORD *)(v12 + 48) = v15;
    v17 = v13[8];
    *(_QWORD *)(v12 + 56) = v13[7];
    *(_QWORD *)(v12 + 64) = v17;
    v68 = v16;
    v70 = (void *)v13[10];
    *(_QWORD *)(v12 + 72) = v13[9];
    *(_QWORD *)(v12 + 80) = v70;
    v18 = v13[12];
    v71 = (void *)v13[11];
    *(_QWORD *)(v12 + 88) = v71;
    *(_QWORD *)(v12 + 96) = v18;
    v19 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
    v62 = (uint64_t)v13 + v19;
    v65 = v12 + v19;
    v20 = OUTLINED_FUNCTION_56_0();
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v22 = v72;
    v23 = v73;
    swift_bridgeObjectRetain();
    v24 = v14;
    OUTLINED_FUNCTION_108_1((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31, v20, (uint64_t)v21, v62, v65, v68);
    OUTLINED_FUNCTION_79_0();
    v32 = OUTLINED_FUNCTION_112_1();
    OUTLINED_FUNCTION_128_1(v32, v33, v34, v35, v36, v37, v38, v39, v58, v60, v63, v66, v69, v70);
    v40 = v71;
    v21(v67, v64, v20);
    OUTLINED_FUNCTION_45_2(v8 + *(int *)(v74 + 52));
    v42 = (_OWORD *)(v7 + v41);
    v43 = v8 + v41;
    v44 = *(_OWORD *)(v8 + v41 + 16);
    *v42 = *(_OWORD *)(v8 + v41);
    v42[1] = v44;
    v45 = *(_OWORD *)(v8 + v41 + 48);
    v42[2] = *(_OWORD *)(v8 + v41 + 32);
    v42[3] = v45;
    v42[4] = *(_OWORD *)(v8 + v41 + 64);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_125_0();
    v47 = (char *)v42 + v46;
    v48 = v43 + v46;
    OUTLINED_FUNCTION_51_1();
    OUTLINED_FUNCTION_110();
    v61(v47, v48, v59);
    *(_QWORD *)((char *)v42 + *(int *)(v8 + 60)) = *(_QWORD *)(v43 + *(int *)(v8 + 60));
    *((_BYTE *)v42 + *(int *)(v8 + 64)) = *(_BYTE *)(v43 + *(int *)(v8 + 64));
    OUTLINED_FUNCTION_104_1(*(int *)(v4 + 36));
    v50 = *(_QWORD *)(v49 + 8);
    *(_QWORD *)v51 = *(_QWORD *)v49;
    *(_QWORD *)(v51 + 8) = v50;
    *(_BYTE *)(v51 + 16) = *(_BYTE *)(v49 + 16);
    v52 = *(int *)(v4 + 44);
    v53 = v0 + v52;
    v54 = (uint64_t *)(v1 + v52);
    v55 = *v54;
    v56 = *((unsigned __int8 *)v54 + 8);
    swift_retain();
    swift_retain();
    j__swift_retain(v55, v56);
    *(_QWORD *)v53 = v55;
    *(_BYTE *)(v53 + 8) = v56;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_103_1() == 1)
    {
      v57 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_49_2(v57);
    }
    else
    {
      OUTLINED_FUNCTION_142_0();
    }
    OUTLINED_FUNCTION_173_0();
    swift_storeEnumTagMultiPayload();
  }
  OUTLINED_FUNCTION_89_0();
}

uint64_t sub_1B1191C5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_186();

  v5 = a1 + a2[8];
  swift_bridgeObjectRelease();
  v6 = OUTLINED_FUNCTION_19();
  v7 = (id *)(v5 + *(int *)(v6 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v8 = (char *)v7 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_75_0();
  v10 = *(void (**)(char *, uint64_t))(v9 + 8);
  v10(v8, v2);
  swift_release();
  swift_release();
  v11 = v5 + *(int *)(v6 + 56);
  v12 = OUTLINED_FUNCTION_58();
  v10((char *)(v11 + *(int *)(v12 + 56)), v2);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_241(a1 + a2[11]);
  v13 = a1 + a2[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_118() != 1)
    return swift_release();
  v14 = OUTLINED_FUNCTION_15_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

void sub_1B1191DC4(uint64_t a1, uint64_t a2, int *a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v72 = *(void **)(a2 + 16);
  v73 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v72;
  *(_QWORD *)(a1 + 24) = v73;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  OUTLINED_FUNCTION_109_1();
  *(_QWORD *)(v8 + 8) = v10;
  *(_QWORD *)(v8 + 16) = v11;
  v74 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_176_0();
  v13 = (_QWORD *)(v9 + v12);
  OUTLINED_FUNCTION_130_1();
  v14 = (void *)v13[4];
  v3[3] = v13[3];
  v3[4] = v14;
  v16 = (void *)v13[5];
  v15 = v13[6];
  v3[5] = v16;
  v3[6] = v15;
  v17 = v13[8];
  v3[7] = v13[7];
  v3[8] = v17;
  v18 = (void *)v13[10];
  v3[9] = v13[9];
  v3[10] = v18;
  v69 = v18;
  v71 = (void *)v13[11];
  v19 = v13[12];
  v3[11] = v71;
  v3[12] = v19;
  v20 = *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v63 = (uint64_t)v13 + v20;
  v66 = (uint64_t)v3 + v20;
  v21 = OUTLINED_FUNCTION_56_0();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  v23 = v72;
  v24 = v73;
  OUTLINED_FUNCTION_219();
  v25 = v14;
  v26 = v16;
  OUTLINED_FUNCTION_79_0();
  v27 = OUTLINED_FUNCTION_112_1();
  v35 = OUTLINED_FUNCTION_108_1(v27, v28, v29, v30, v31, v32, v33, v34, v59, (uint64_t)v22, v63, v66, v69);
  OUTLINED_FUNCTION_128_1((uint64_t)v35, v36, v37, v38, v39, v40, v41, v42, v60, v61, v64, v67, v70, v71);
  v22(v68, v65, v21);
  OUTLINED_FUNCTION_177_0(v9 + *(int *)(v74 + 52));
  v44 = (_OWORD *)(v8 + v43);
  v45 = v9 + v43;
  v46 = *(_OWORD *)(v9 + v43 + 16);
  *v44 = *(_OWORD *)(v9 + v43);
  v44[1] = v46;
  v47 = *(_OWORD *)(v9 + v43 + 48);
  v44[2] = *(_OWORD *)(v9 + v43 + 32);
  v44[3] = v47;
  v44[4] = *(_OWORD *)(v9 + v43 + 64);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_125_0();
  v49 = (char *)v44 + v48;
  v50 = v45 + v48;
  OUTLINED_FUNCTION_171_0();
  OUTLINED_FUNCTION_51_1();
  v62(v49, v50, v21);
  *(_QWORD *)((char *)v44 + *(int *)(v9 + 60)) = *(_QWORD *)(v45 + *(int *)(v9 + 60));
  *((_BYTE *)v44 + *(int *)(v9 + 64)) = *(_BYTE *)(v45 + *(int *)(v9 + 64));
  OUTLINED_FUNCTION_104_1(a3[9]);
  v52 = *(_QWORD *)(v51 + 8);
  *(_QWORD *)v53 = *(_QWORD *)v51;
  *(_QWORD *)(v53 + 8) = v52;
  *(_BYTE *)(v53 + 16) = *(_BYTE *)(v51 + 16);
  v54 = a3[11];
  v55 = a1 + v54;
  v56 = (uint64_t *)(a2 + v54);
  v57 = *v56;
  LOBYTE(v21) = *((_BYTE *)v56 + 8);
  swift_retain();
  OUTLINED_FUNCTION_171_0();
  OUTLINED_FUNCTION_249();
  *(_QWORD *)v55 = v57;
  *(_BYTE *)(v55 + 8) = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_103_1() == 1)
  {
    v58 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_49_2(v58);
  }
  else
  {
    OUTLINED_FUNCTION_142_0();
  }
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_89_0();
}

void sub_1B1191FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int *a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  int *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_57_2(v17, v18);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_179_0();

  v19 = *(int **)(v10 + 24);
  v20 = *(void **)(v11 + 24);
  *(_QWORD *)(v10 + 24) = v20;
  v21 = v20;

  *(_BYTE *)(v10 + 32) = *(_BYTE *)(v11 + 32);
  OUTLINED_FUNCTION_3_1(*(int *)(v12 + 32));
  OUTLINED_FUNCTION_96();
  v22 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_3(v22);

  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_60_2();

  OUTLINED_FUNCTION_59_2();
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(v16 + 96);
  v23 = v15 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v24 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_31_3(v24);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_52_1();
  v25 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_35_2(v25);
  *(_QWORD *)(v12 + v19[15]) = *(_QWORD *)(v23 + v19[15]);
  *(_BYTE *)(v12 + v19[16]) = *(_BYTE *)(v23 + v19[16]);
  *(_QWORD *)(v10 + a10[9]) = *(_QWORD *)(v11 + a10[9]);
  v26 = a10[10];
  v27 = v10 + v26;
  v28 = v11 + v26;
  *(_QWORD *)(v10 + v26) = *(_QWORD *)(v11 + v26);
  swift_retain();
  OUTLINED_FUNCTION_155();
  *(_QWORD *)(v27 + 8) = *(_QWORD *)(v28 + 8);
  swift_retain();
  OUTLINED_FUNCTION_155();
  *(_BYTE *)(v27 + 16) = *(_BYTE *)(v28 + 16);
  v29 = a10[11];
  v30 = (uint64_t *)(v10 + v29);
  v31 = (uint64_t *)(v11 + v29);
  v32 = *v31;
  LOBYTE(v28) = *((_BYTE *)v31 + 8);
  OUTLINED_FUNCTION_249();
  v33 = *v30;
  v34 = *((unsigned __int8 *)v30 + 8);
  *v30 = v32;
  *((_BYTE *)v30 + 8) = v28;
  j__swift_release(v33, v34);
  if (v10 != v11)
  {
    OUTLINED_FUNCTION_87_0(v10 + a10[12]);
    OUTLINED_FUNCTION_113_1();
    if (OUTLINED_FUNCTION_103_1() == 1)
    {
      v35 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_49_2(v35);
    }
    else
    {
      OUTLINED_FUNCTION_142_0();
    }
    OUTLINED_FUNCTION_228();
  }
  OUTLINED_FUNCTION_112_0();
}

void sub_1B1192184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
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

  OUTLINED_FUNCTION_24();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)v5 = *(_OWORD *)v3;
  *(_OWORD *)(v5 + 16) = v7;
  *(_BYTE *)(v5 + 32) = *(_BYTE *)(v3 + 32);
  v8 = *(int *)(v1 + 32);
  v9 = v5 + v8;
  v10 = v3 + v8;
  *(_DWORD *)v9 = *(_DWORD *)(v3 + v8);
  *(_BYTE *)(v9 + 4) = *(_BYTE *)(v3 + v8 + 4);
  *(_WORD *)(v9 + 5) = *(_WORD *)(v3 + v8 + 5);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v3 + v8 + 8);
  v11 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_3(v11);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  v12 = *(int *)(v0 + 52);
  v13 = v9 + v12;
  v14 = v10 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  v15 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v15);
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_104_1(v16);
  *(_OWORD *)v18 = *(_OWORD *)v17;
  *(_BYTE *)(v18 + 16) = *(_BYTE *)(v17 + 16);
  v19 = *(int *)(v2 + 44);
  v20 = v6 + v19;
  v21 = v4 + v19;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v20 = *(_QWORD *)v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
  if (OUTLINED_FUNCTION_161_0() == 1)
  {
    v22 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_119_0(v22);
    OUTLINED_FUNCTION_54();
  }
  else
  {
    OUTLINED_FUNCTION_135_1();
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B119229C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_94_0(v5, v6);
  OUTLINED_FUNCTION_178_0();
  v7 = *(void **)(v0 + 24);
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);

  *(_BYTE *)(v0 + 32) = *(_BYTE *)(v1 + 32);
  OUTLINED_FUNCTION_8_3(v2[8]);
  v8 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9_3(v8);
  OUTLINED_FUNCTION_62_2();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_61_2();
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_64_1();
  *(_BYTE *)(v3 + 16) = *(_BYTE *)(v4 + 16);
  *(_BYTE *)(v3 + 17) = *(_BYTE *)(v4 + 17);
  v9 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v9);
  OUTLINED_FUNCTION_107_1();
  *(_QWORD *)(v0 + v10) = *(_QWORD *)(v1 + v10);
  v12 = v0 + v11;
  v13 = v1 + v11;
  *(_QWORD *)(v0 + v11) = *(_QWORD *)(v1 + v11);
  swift_release();
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  swift_release();
  *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
  v14 = v2[11];
  v15 = (uint64_t *)(v0 + v14);
  v16 = (uint64_t *)(v1 + v14);
  v17 = *v16;
  LOBYTE(v16) = *((_BYTE *)v16 + 8);
  v18 = *v15;
  v19 = *((unsigned __int8 *)v15 + 8);
  *v15 = v17;
  *((_BYTE *)v15 + 8) = (_BYTE)v16;
  j__swift_release(v18, v19);
  if (v0 != v1)
  {
    OUTLINED_FUNCTION_169_0(v0 + v2[12]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381890);
    if (OUTLINED_FUNCTION_161_0() == 1)
    {
      v20 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_119_0(v20);
      OUTLINED_FUNCTION_54();
    }
    else
    {
      OUTLINED_FUNCTION_135_1();
    }
  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B11923F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1192404()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_118_0();
  if (v3)
  {
    OUTLINED_FUNCTION_122_0(*(_QWORD *)(v0 + 8));
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v4 = v2;
    if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_19() - 8) + 84) == v1)
    {
      v5 = *(int *)(v4 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
      v5 = *(int *)(v4 + 48);
    }
    v6 = OUTLINED_FUNCTION_211(v5);
    OUTLINED_FUNCTION_49(v6, v7, v8);
  }
}

uint64_t sub_1B1192474()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B1192480()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_152();
  if (v4)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v5 = v3;
    if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_19() - 8) + 84) == v2)
    {
      v6 = *(int *)(v5 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11048);
      v6 = *(int *)(v5 + 48);
    }
    v7 = OUTLINED_FUNCTION_109_0(v6);
    OUTLINED_FUNCTION_50(v7, v8, v9, v10);
  }
}

void sub_1B11924F0()
{
  unint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_198();
  if (v0 <= 0x3F)
  {
    sub_1B11925B4();
    if (v1 <= 0x3F)
    {
      OUTLINED_FUNCTION_149();
      swift_initStructMetadata();
    }
  }
}

void sub_1B11925B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED381898)
  {
    sub_1B11BAD74();
    v0 = sub_1B11BAAEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED381898);
  }
}

#error "1B11926E8: call analysis failed (funcsize=99)"

uint64_t sub_1B1192794(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_85_0(a1);

  OUTLINED_FUNCTION_132_0();
  v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_72_1(v2);
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_204();
  OUTLINED_FUNCTION_203();
  OUTLINED_FUNCTION_57_0();
  v3 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_39_1(v3);
  OUTLINED_FUNCTION_88_1();
  OUTLINED_FUNCTION_197();
  v4 = OUTLINED_FUNCTION_58();
  v5 = OUTLINED_FUNCTION_117_1(v4);
  return OUTLINED_FUNCTION_43_1(v5, v6, v7);
}

#error "1B119289C: call analysis failed (funcsize=78)"

void sub_1B1192944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  int *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_81_1(v17, v18);

  v19 = *(int **)(v10 + 8);
  v20 = *(void **)(v11 + 8);
  *(_QWORD *)(v10 + 8) = v20;
  v21 = v20;

  OUTLINED_FUNCTION_3_1(*(int *)(v12 + 24));
  OUTLINED_FUNCTION_96();
  v22 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6_3(v22);

  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_60_2();

  OUTLINED_FUNCTION_59_2();
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(v16 + 96);
  v23 = v15 + *(int *)(OUTLINED_FUNCTION_57_0() + 68);
  v24 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_31_3(v24);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_52_1();
  v25 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_35_2(v25);
  *(_QWORD *)(v12 + v19[15]) = *(_QWORD *)(v23 + v19[15]);
  *(_BYTE *)(v12 + v19[16]) = *(_BYTE *)(v23 + v19[16]);
  OUTLINED_FUNCTION_32_3(*(int *)(a10 + 28));
  OUTLINED_FUNCTION_112_0();
}

void sub_1B1192A18()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
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

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_162_0(v1, v2);
  v4 = *(int *)(v3 + 24);
  v6 = v5 + v4;
  v8 = v7 + v4;
  *(_DWORD *)v6 = *(_DWORD *)(v7 + v4);
  *(_BYTE *)(v6 + 4) = *(_BYTE *)(v7 + v4 + 4);
  *(_WORD *)(v6 + 5) = *(_WORD *)(v7 + v4 + 5);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(v7 + v4 + 8);
  v9 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_3(v9);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  v10 = *(int *)(v0 + 52);
  v11 = v6 + v10;
  v12 = v8 + v10;
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_WORD *)(v11 + 16) = *(_WORD *)(v12 + 16);
  v13 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v13);
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_15();
}

void sub_1B1192AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_93_0(v5, v6);
  v7 = *(void **)(v0 + 8);
  *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);

  OUTLINED_FUNCTION_8_3(*(int *)(v2 + 24));
  v8 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9_3(v8);
  OUTLINED_FUNCTION_62_2();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_61_2();
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 + 96);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_64_1();
  *(_BYTE *)(v3 + 16) = *(_BYTE *)(v4 + 16);
  *(_BYTE *)(v3 + 17) = *(_BYTE *)(v4 + 17);
  v9 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_70(v9);
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1192B40()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B1192B4C()
{
  unint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_118_0();
  if (v2)
  {
    OUTLINED_FUNCTION_122_0(*v0);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_19();
    v4 = OUTLINED_FUNCTION_211(*(int *)(v3 + 24));
    OUTLINED_FUNCTION_49(v4, v5, v6);
  }
}

uint64_t sub_1B1192B94()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B1192BA0()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_152();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_19();
    v5 = OUTLINED_FUNCTION_109_0(*(int *)(v4 + 24));
    OUTLINED_FUNCTION_50(v5, v6, v7, v8);
  }
}

void sub_1B1192BE4()
{
  sub_1B1192BFC();
}

void sub_1B1192BFC()
{
  unint64_t v0;

  OUTLINED_FUNCTION_198();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_149();
    swift_initStructMetadata();
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1192C5C(id *a1)
{

  return swift_bridgeObjectRelease();
}

void sub_1B1192C8C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = v2;
  v7 = v4;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_5();
}

void sub_1B1192CD8()
{
  uint64_t v0;
  uint64_t v1;
  void **v2;
  void *v3;
  _QWORD *v4;
  id v5;
  id v6;
  void *v7;

  OUTLINED_FUNCTION_199();
  v3 = *v2;
  OUTLINED_FUNCTION_195(v2, v4);
  v6 = v5;

  *(_QWORD *)(v1 + 8) = *(_QWORD *)(v0 + 8);
  v7 = *(void **)(v1 + 16);
  OUTLINED_FUNCTION_233(*(void **)(v0 + 16));

  *(_BYTE *)(v1 + 24) = *(_BYTE *)(v0 + 24);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5();
}

void sub_1B1192D44(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  OUTLINED_FUNCTION_231(*(_QWORD *)(a2 + 16));
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1192D9C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_92(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_92(v2);
}

uint64_t sub_1B1192DD8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for IconImageView()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B1192E30()
{
  sub_1B1192F24((uint64_t)&unk_1ED381660);
}

unint64_t sub_1B1192E64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381648;
  if (!qword_1ED381648)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381650);
    sub_1B118BC80((uint64_t)&unk_1ED3815B8);
    v3[0] = v2;
    v3[1] = sub_1B118BE0C();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381648);
  }
  return result;
}

void sub_1B1192EF0()
{
  sub_1B1192F24((uint64_t)&unk_1EEF11480);
}

void sub_1B1192F24(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v5 = OUTLINED_FUNCTION_44(0, v4);
    v6 = v3();
    atomic_store(MEMORY[0x1B5E17C68](v2, v5, &v6), v1);
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B1192F6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11488;
  if (!qword_1EEF11488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11340);
    sub_1B118BC80((uint64_t)&unk_1EEF11348);
    v3[0] = v2;
    v3[1] = sub_1B118C614();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11488);
  }
  return result;
}

void sub_1B1192FF8()
{
  sub_1B118BC80((uint64_t)&unk_1ED3815E8);
}

void sub_1B119302C()
{
  sub_1B118BC80((uint64_t)&unk_1ED3815D8);
}

void sub_1B1193050()
{
  sub_1B118BC80((uint64_t)&unk_1ED3815C8);
}

unint64_t sub_1B1193074()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED3815A8;
  if (!qword_1ED3815A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3815B0);
    sub_1B119059C((uint64_t)&unk_1ED381578);
    v3[0] = v2;
    v3[1] = sub_1B11931A4();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED3815A8);
  }
  return result;
}

unint64_t sub_1B11930F8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_1ED381548;
  if (!qword_1ED381548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381550);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381720);
    v4[3] = sub_1B118F85C();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B1193240((uint64_t)&unk_1ED381778);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED381548);
  }
  return result;
}

unint64_t sub_1B11931A4()
{
  unint64_t result;

  result = qword_1ED381290;
  if (!qword_1ED381290)
  {
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDC878], MEMORY[0x1E0CDC890]);
    atomic_store(result, (unint64_t *)&qword_1ED381290);
  }
  return result;
}

void sub_1B11931E0()
{
  sub_1B1192F24((uint64_t)&unk_1EEF11490);
}

void sub_1B1193214()
{
  sub_1B1193240((uint64_t)&unk_1ED380FB0);
}

void sub_1B1193240(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v4 = OUTLINED_FUNCTION_248(0, v3);
    atomic_store(MEMORY[0x1B5E17C68](v2, v4), v1);
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1193270()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CE8);
  sub_1B118BC80((uint64_t)&unk_1ED380CE0);
  sub_1B11904F0();
  return OUTLINED_FUNCTION_2_0();
}

unint64_t sub_1B11932F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1ED380CD0;
  if (!qword_1ED380CD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380CD8);
    v2[0] = sub_1B11907FC();
    v2[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1ED380CD0);
  }
  return result;
}

void sub_1B119335C()
{
  sub_1B1192F24((uint64_t)&unk_1EEF114A0);
}

unint64_t sub_1B1193390()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF114A8;
  if (!qword_1EEF114A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11448);
    v2[0] = sub_1B11908C8();
    v2[1] = sub_1B11909B8();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF114A8);
  }
  return result;
}

unint64_t sub_1B11933FC()
{
  unint64_t result;

  result = qword_1EEF114B0;
  if (!qword_1EEF114B0)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BE670, &unk_1E62D5898);
    atomic_store(result, (unint64_t *)&qword_1EEF114B0);
  }
  return result;
}

uint64_t sub_1B1193438(uint64_t a1, uint64_t a2, char a3)
{
  sub_1B117CED4(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_1B1193460()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF114F8;
  if (!qword_1EEF114F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF114E0);
    sub_1B118C72C();
    v3[0] = v2;
    v3[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF114F8);
  }
  return result;
}

unint64_t sub_1B11934CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11510;
  if (!qword_1EEF11510)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF114D0);
    sub_1B118BC80((uint64_t)&unk_1EEF11508);
    v3[0] = v2;
    v3[1] = sub_1B118BE98();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11510);
  }
  return result;
}

void sub_1B1193558(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_124_1(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_41();
}

void OUTLINED_FUNCTION_137_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_138_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_139_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_140(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_148_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  return a9(v10, v11, v9);
}

uint64_t OUTLINED_FUNCTION_155_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_156_0()
{
  return sub_1B11BB02C();
}

uint64_t OUTLINED_FUNCTION_157_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for BannerIconSGView(0);
}

uint64_t OUTLINED_FUNCTION_161_0()
{
  return swift_getEnumCaseMultiPayload();
}

__n128 OUTLINED_FUNCTION_162_0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_163_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return a11;
}

uint64_t OUTLINED_FUNCTION_164_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_165_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

void OUTLINED_FUNCTION_169_0(uint64_t a1)
{
  uint64_t *v1;

  sub_1B1193558(a1, v1);
}

void OUTLINED_FUNCTION_170_0(uint64_t a1)
{
  uint64_t *v1;

  sub_1B1193558(a1, v1);
}

uint64_t OUTLINED_FUNCTION_171_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_173_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_174_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188820(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_175_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_177_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v1 = *(_QWORD *)a1;
  *(_QWORD *)(v1 + 8) = v2;
  *(_WORD *)(v1 + 16) = *(_WORD *)(a1 + 16);
}

void OUTLINED_FUNCTION_178_0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);

}

id OUTLINED_FUNCTION_179_0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v0 + 16) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_180_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x1F8))();
}

uint64_t OUTLINED_FUNCTION_185_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_189_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_194()
{
  return sub_1B11BAABC();
}

_QWORD *OUTLINED_FUNCTION_195(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_196()
{
  return sub_1B11BB0F8();
}

uint64_t OUTLINED_FUNCTION_197()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_198()
{
  return type metadata accessor for SGBannerViewModel(319);
}

void OUTLINED_FUNCTION_203()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_204()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_205()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_206()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_207()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_208(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 104) = a1;
  *(_BYTE *)(v4 + 112) = v1;
  *(_QWORD *)(v4 + 120) = v2;
  *(_BYTE *)(v4 + 128) = v3;
}

uint64_t OUTLINED_FUNCTION_210()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_211@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

id OUTLINED_FUNCTION_212(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  return a12;
}

void OUTLINED_FUNCTION_214()
{
  JUMPOUT(0x1B5E17C68);
}

uint64_t OUTLINED_FUNCTION_216()
{
  return type metadata accessor for PrimaryActionButtonView(0);
}

uint64_t OUTLINED_FUNCTION_219()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_221()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_222()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_223()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_224(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B1188820(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_226()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_228()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_229()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_231(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

_QWORD *OUTLINED_FUNCTION_232(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

id OUTLINED_FUNCTION_233@<X0>(void *a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return a1;
}

void OUTLINED_FUNCTION_234(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_1B1188514(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_235()
{
  return sub_1B11BAABC();
}

void OUTLINED_FUNCTION_236(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_1B11883D0(v3, a2, a3);
}

uint64_t OUTLINED_FUNCTION_239@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 256));
}

uint64_t OUTLINED_FUNCTION_240()
{
  return sub_1B11BB2CC();
}

uint64_t OUTLINED_FUNCTION_241@<X0>(uint64_t a1@<X8>)
{
  return j__swift_release(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t OUTLINED_FUNCTION_247()
{
  return type metadata accessor for TitleView(0);
}

uint64_t OUTLINED_FUNCTION_249()
{
  uint64_t v0;
  uint64_t v1;

  return j__swift_retain(v0, v1);
}

uint64_t OUTLINED_FUNCTION_250()
{
  return sub_1B11BB038();
}

uint64_t OUTLINED_FUNCTION_251()
{
  return type metadata accessor for IconView(0);
}

id sub_1B1193978(id a1)
{
  return OUTLINED_FUNCTION_4_2(a1);
}

void sub_1B1193980()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B11939B0()
{
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193A04()
{
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1193A50@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1193A90(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x98);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void sub_1B1193AD0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B1193B18(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_5();
}

void sub_1B1193B30(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1B1193B9C()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_state);
  OUTLINED_FUNCTION_2();
  return *v1;
}

void sub_1B1193BDC(int a1)
{
  uint64_t v1;
  _DWORD *v3;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_state);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193C18()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

id sub_1B1193C54()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderHelpers);
  OUTLINED_FUNCTION_2();
  return OUTLINED_FUNCTION_11(*v1);
}

void sub_1B1193C8C(void *a1)
{
  sub_1B1194014(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderHelpers);
}

void sub_1B1193C98()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

void sub_1B1193CD4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderBundleURL;
  OUTLINED_FUNCTION_2();
  sub_1B1193D18(v3, a1);
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1193D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B1193D60()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_2();
  v0 = OUTLINED_FUNCTION_70_0();
  sub_1B1193DA8(v0, v1);
  swift_endAccess();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B1193DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1B1193DF0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

void sub_1B1193E2C()
{
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193E68(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderDictionary);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193EAC()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

void sub_1B1193EE8()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_56_0();
  v0 = OUTLINED_FUNCTION_70_0();
  v1(v0);
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193F38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger;
  OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1193F94()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

id sub_1B1193FD0()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_realtimeOrderSuggestion);
  OUTLINED_FUNCTION_2();
  return OUTLINED_FUNCTION_11(*v1);
}

void sub_1B1194008(void *a1)
{
  sub_1B1194014(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_realtimeOrderSuggestion);
}

void sub_1B1194014(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  OUTLINED_FUNCTION_2();
  v5 = *v4;
  *v4 = a1;

  OUTLINED_FUNCTION_7_0();
}

void sub_1B1194054()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B1194090()
{
  uint64_t *v0;
  void *v1;

  v1 = (void *)OUTLINED_FUNCTION_5_2(*v0);
  return sub_1B1195774(v1);
}

void SGWalletOrderSuggestion.__allocating_init(realtimeWalletOrder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  SGWalletOrderSuggestion.init(realtimeWalletOrder:)(a1);
  OUTLINED_FUNCTION_41();
}

uint64_t SGWalletOrderSuggestion.init(realtimeWalletOrder:)(void *a1)
{
  char *v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  unsigned int v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  objc_class *ObjCClassFromMetadata;
  NSString *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  objc_class *v55;
  id v56;
  uint64_t v57;
  os_log_t v58;
  int v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;
  __int128 v71;
  uint64_t v72;
  _OWORD v73[2];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v68 = sub_1B11BA924();
  v65 = *(_QWORD *)(v68 - 8);
  MEMORY[0x1E0C80A78](v68);
  v67 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4();
  v64 = v5;
  MEMORY[0x1E0C80A78](v6);
  v66 = (char *)&v57 - v7;
  v8 = OUTLINED_FUNCTION_56_0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_4();
  v69 = v10;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v57 - v12;
  swift_unknownObjectWeakInit();
  v14 = (uint64_t)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderBundleURL];
  v15 = OUTLINED_FUNCTION_27_2();
  v63 = v14;
  v62 = v15;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  v16 = (uint64_t *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderDictionary];
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderDictionary] = 0;
  v17 = v1;
  v18 = objc_msgSend(a1, sel_state);
  *(_DWORD *)&v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_state] = v18;
  sub_1B11758DC();
  OUTLINED_FUNCTION_114();
  sub_1B11BA9FC();
  v19 = &v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger];
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger], v13, v8);
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(a1, sel_walletOrderDictData);
  v22 = sub_1B11BA96C();
  v24 = v23;

  v25 = (void *)sub_1B11BA960();
  sub_1B11957E0(v22, v24);
  *(_QWORD *)&v73[0] = 0;
  v26 = objc_msgSend(v20, sel_JSONObjectWithData_options_error_, v25, 0, v73);

  if (v26)
  {
    v27 = *(id *)&v73[0];
    sub_1B11BB500();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11580);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v28 = v71;
      OUTLINED_FUNCTION_2();
      *v16 = v28;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v29 = *(id *)&v73[0];
    OUTLINED_FUNCTION_43_2();

    swift_willThrow();
    OUTLINED_FUNCTION_2();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v69, v19, v8);
    OUTLINED_FUNCTION_44_2();
    OUTLINED_FUNCTION_44_2();
    v30 = sub_1B11BA9F0();
    v31 = sub_1B11BB494();
    v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      v33 = OUTLINED_FUNCTION_4_1();
      v60 = (_QWORD *)OUTLINED_FUNCTION_4_1();
      v61 = OUTLINED_FUNCTION_4_1();
      *(_QWORD *)&v73[0] = v61;
      *(_DWORD *)v33 = 136315394;
      v57 = v33 + 4;
      OUTLINED_FUNCTION_45_3();
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      v35 = NSStringFromClass(ObjCClassFromMetadata);
      v36 = sub_1B11BB3C8();
      v59 = v32;
      v37 = v36;
      v58 = v30;
      v39 = v38;

      *(_QWORD *)&v71 = sub_1B117C4E0(v37, v39, (uint64_t *)v73);
      sub_1B11BB4E8();
      OUTLINED_FUNCTION_87();
      *(_WORD *)(v33 + 12) = 2112;
      OUTLINED_FUNCTION_44_2();
      v40 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v71 = v40;
      sub_1B11BB4E8();
      *v60 = v40;
      OUTLINED_FUNCTION_14_3();
      OUTLINED_FUNCTION_14_3();
      _os_log_impl(&dword_1B1170000, v58, (os_log_type_t)v59, "%s - Encountered Error while resolving orderDictionary: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
      OUTLINED_FUNCTION_34_2();
      OUTLINED_FUNCTION_161();
    }
    OUTLINED_FUNCTION_14_3();
    OUTLINED_FUNCTION_14_3();
    OUTLINED_FUNCTION_14_3();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v69, v8);
  }
  OUTLINED_FUNCTION_2();
  v41 = *v16;
  if (*v16)
  {
    OUTLINED_FUNCTION_114();
    sub_1B1194820(0x68746150656C6966, 0xE800000000000000, v41, &v71);
    result = OUTLINED_FUNCTION_87();
    if (!v72)
    {
      __break(1u);
      return result;
    }
    sub_1B117ED74(&v71, v73);
    swift_dynamicCast();
    v43 = v62;
    __swift_storeEnumTagSinglePayload(v64, 1, 1, v62);
    (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v67, *MEMORY[0x1E0CAFD78], v68);
    v44 = (uint64_t)v66;
    OUTLINED_FUNCTION_185();
    sub_1B11BA948();
    __swift_storeEnumTagSinglePayload(v44, 0, 1, v43);
    v45 = v63;
    OUTLINED_FUNCTION_2();
    sub_1B1193DA8(v44, v45);
    swift_endAccess();
  }
  sub_1B117C45C(0, (unint64_t *)&unk_1EEF11570);
  v46 = objc_msgSend(a1, sel_walletOrderData);
  v47 = sub_1B11BA96C();
  v49 = v48;

  v50 = sub_1B1194870(v47, v49);
  if (!v50)
    __break(1u);
  *(_QWORD *)&v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderHelpers] = v50;
  *(_QWORD *)&v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_realtimeOrderSuggestion] = a1;
  v51 = (void *)objc_opt_self();
  v52 = a1;
  v53 = objc_msgSend(v51, sel_currentDevice);
  v54 = objc_msgSend(v53, sel_userInterfaceIdiom);

  v17[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_bannerForVisionDevice] = v54 == (id)6;
  v55 = (objc_class *)OUTLINED_FUNCTION_45_3();
  v70.receiver = v17;
  v70.super_class = v55;
  v56 = objc_msgSendSuper2(&v70, sel_init);

  return (uint64_t)v56;
}

double sub_1B1194820@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1B1195630(a1, a2), (v7 & 1) != 0))
  {
    sub_1B1177908(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

id sub_1B1194870(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1B11BA960();
  v6 = objc_msgSend(v4, sel_initWithOrderData_, v5);
  sub_1B11957E0(a1, a2);

  return v6;
}

void sub_1B1194924()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  if (currentUIContext())
  {
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
  }
  else
  {
    OUTLINED_FUNCTION_27(39);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v1 = OUTLINED_FUNCTION_7_4();
    *(_OWORD *)(v1 + 16) = xmmword_1B11BE3D0;
    v2 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v1 + 64) = v2;
    *(_QWORD *)(v1 + 32) = 1;
    OUTLINED_FUNCTION_70_0();
    sub_1B11BB3A4();
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_5();
  }
}

void sub_1B1194A24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    OUTLINED_FUNCTION_27(29);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v5 = OUTLINED_FUNCTION_7_4();
    *(_OWORD *)(v5 + 16) = xmmword_1B11BE3D0;
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v5 + 64) = sub_1B118A610();
    *(_QWORD *)(v5 + 32) = v3;
    *(_QWORD *)(v5 + 40) = v4;
    sub_1B11BB3A4();
    OUTLINED_FUNCTION_96();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_22();
}

void sub_1B1194B40()
{
  uint64_t *v0;
  void *v1;
  id v2;

  v1 = (void *)OUTLINED_FUNCTION_5_2(*v0);
  v2 = objc_msgSend(v1, sel_attributedSubtitle);

  OUTLINED_FUNCTION_41();
}

id sub_1B1194BB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B117C45C(0, &qword_1EEF110A8);
  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_35_3();
  swift_unknownObjectWeakInit();
  return sub_1B11892A0(v1, v3, (uint64_t)sub_1B1195880, v4);
}

void sub_1B1194C7C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OUTLINED_FUNCTION_27_2();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_36();
  v7 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1B11958F8((uint64_t)v4);
  }
  else
  {
    v8 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v1, v4, v5);
    v9 = (void *)(*(uint64_t (**)(uint64_t))((*v7 & *v0) + 0xC0))(v8);
    v10 = (void *)sub_1B11BA930();
    v11 = OUTLINED_FUNCTION_35_3();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1B1195C88;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B1194E1C;
    aBlock[3] = &block_descriptor_1;
    v12 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_saveOrderForURL_completion_, v10, v12);
    _Block_release(v12);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  }
  OUTLINED_FUNCTION_60();
}

void sub_1B1194E1C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1B1194E7C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  id v11;
  void (*v12)(uint64_t, _BYTE *, uint64_t);
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _BYTE v19[16];
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_36();
  v3 = OUTLINED_FUNCTION_27_2();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v19[-v8];
  v10 = (void *)OUTLINED_FUNCTION_5_2(*v0);
  v11 = objc_msgSend(v10, sel_orderDeepLink);

  if (!v11)
  {
    OUTLINED_FUNCTION_127_0(v1, 1);
    goto LABEL_7;
  }
  sub_1B11BA93C();

  v12 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32);
  v12(v1, v7, v3);
  OUTLINED_FUNCTION_127_0(v1, 0);
  if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
  {
LABEL_7:
    sub_1B11958F8(v1);
    sub_1B1194C7C();
LABEL_10:
    OUTLINED_FUNCTION_60();
    return;
  }
  v12((uint64_t)v9, (_BYTE *)v1, v3);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)sub_1B11BA930();
    v20[0] = 0;
    v16 = objc_msgSend(v14, sel_openURL_configuration_error_, v15, 0, v20);

    v17 = v20[0];
    if (v16)
    {

    }
    else
    {
      v18 = (void *)OUTLINED_FUNCTION_43_2();

      swift_willThrow();
    }
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_1B119509C()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_bannerForVisionDevice))
    return 4;
  else
    return 0;
}

void sub_1B11950D4()
{
  sub_1B11758C4();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_41();
}

void sub_1B1195104()
{
  uint64_t v0;
  uint64_t *v1;
  id v2;
  id v3;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_2(*v1), sel_walletLogo);
  OUTLINED_FUNCTION_23();
  if (v0)
    OUTLINED_FUNCTION_41();
  else
    v3 = objc_msgSend((id)objc_opt_self(), sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E0D19A70]);
}

id sub_1B11951AC()
{
  return OUTLINED_FUNCTION_27(33);
}

void sub_1B11951D0(unint64_t a1)
{
  uint64_t v1;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_1B11BB56C();
    OUTLINED_FUNCTION_13_0();
    if (!v1)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
LABEL_3:
    OUTLINED_FUNCTION_27(47);
LABEL_5:
  OUTLINED_FUNCTION_41();
}

void sub_1B1195254(unint64_t a1)
{
  OUTLINED_FUNCTION_27(42);
  OUTLINED_FUNCTION_61_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  *(_OWORD *)(OUTLINED_FUNCTION_7_4() + 16) = xmmword_1B11BE3D0;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_22_0();
    sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_17(MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_22();
}

void sub_1B1195394()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = currentUIContext();
  switch(OUTLINED_FUNCTION_30_2(*v0))
  {
    case 1u:
      v2 = 0xD00000000000001CLL;
      v3 = 0xD000000000000025;
      goto LABEL_4;
    case 2u:
    case 4u:
      if (v1)
        v4 = 0xD000000000000026;
      else
        v4 = 0xD00000000000001DLL;
      goto LABEL_10;
    case 3u:
      v2 = 0xD00000000000001BLL;
      v3 = 0xD000000000000029;
LABEL_4:
      if (v1)
        v4 = v3;
      else
        v4 = v2;
LABEL_10:
      sub_1B1175A30(v4);
      OUTLINED_FUNCTION_45();
      break;
    default:
      break;
  }
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_5();
}

id sub_1B11954C0()
{
  return OUTLINED_FUNCTION_27(31);
}

uint64_t sub_1B11954D8()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

id SGWalletOrderSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SGWalletOrderSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SGWalletOrderSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_45_3();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B1195630(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B11BB5A8();
  sub_1B11BB3E0();
  v4 = sub_1B11BB5C0();
  return sub_1B1195694(a1, a2, v4);
}

unint64_t sub_1B1195694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B11BB59C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B11BB59C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1B1195774(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_merchantName);

  if (!v2)
    return 0;
  v3 = sub_1B11BB3C8();

  return v3;
}

uint64_t sub_1B11957E0(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for SGWalletOrderSuggestion()
{
  uint64_t result;

  result = qword_1ED381E00;
  if (!qword_1ED381E00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B119585C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B1195880()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B11958A8(uint64_t *a1)
{
  unsigned int v2;

  if (a1)
  {
    v2 = OUTLINED_FUNCTION_30_2(*a1);
    if (v2 >= 2 && (v2 - 3 < 2 || v2 == 2))
      sub_1B1194E7C();
    else
      sub_1B1194C7C();

  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B11958F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B1195938()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B1195BEC();
  if (v0 <= 0x3F)
  {
    sub_1B11BAA08();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SGWalletOrderSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.__allocating_init(realtimeWalletOrder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategory()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionSubtitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionAttributedSubtitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionPrimaryAction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryId()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryImage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryTitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategorySubtitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.realtimeSuggestion()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

void sub_1B1195BEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEF115B8)
  {
    sub_1B11BA954();
    v0 = sub_1B11BB4DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEF115B8);
  }
}

void type metadata accessor for SGRealtimeWalletOrderState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EEF115C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEF115C0);
  }
}

void sub_1B1195C88(int a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_2();
  v3 = (_QWORD *)MEMORY[0x1B5E17D58](v1 + 16);
  if (v3)
  {
    v4 = v3;
    if ((a1 - 1) <= 1)
    {
      v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x90))();
      if (v5)
      {
        objc_msgSend(v5, sel_suggestionWasUpdated_, v4);
        swift_unknownObjectRelease();
      }
    }

  }
  OUTLINED_FUNCTION_7_0();
}

void sub_1B1195D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  uint64_t v6;

  v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a5) + 0x1B0))();
  if (v5)
  {
    v6 = (uint64_t)objc_msgSend(v5, sel_respondsToSelector_, sel_tableViewController);
    if ((v6 & 1) == 0 || !OUTLINED_FUNCTION_9(v6, sel_tableViewController))
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F20]), sel_init);
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_41();
  }
  else
  {
    objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F20]), sel_init);
  }
}

void sub_1B1195DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1B1195D18(a1, a2, a3, 0, *(_QWORD **)(v3 + 24));
}

uint64_t sub_1B1195DE4()
{
  return sub_1B11BAF30();
}

uint64_t sub_1B1195E1C()
{
  OUTLINED_FUNCTION_66_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAF6C();
}

uint64_t sub_1B1195E4C()
{
  OUTLINED_FUNCTION_66_0();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAF3C();
}

void sub_1B1195E7C()
{
  sub_1B119A494();
  sub_1B11BAF60();
  __break(1u);
}

id sub_1B1195EA0()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B1195EC8()
{
  sub_1B1195FC4();
}

void sub_1B1195ED4()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_41();
}

void sub_1B1195F0C()
{
  id *v0;
  id v1;

  OUTLINED_FUNCTION_1_0();
  v1 = *v0;
  OUTLINED_FUNCTION_26();
}

void sub_1B1195F40()
{
  sub_1B1195FC4();
}

void sub_1B1195F4C()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_41();
}

void sub_1B1195F84()
{
  id *v0;
  id v1;

  OUTLINED_FUNCTION_1_0();
  v1 = *v0;
  OUTLINED_FUNCTION_26();
}

void sub_1B1195FB8()
{
  sub_1B1195FC4();
}

void sub_1B1195FC4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_26();
}

void sub_1B1196000()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_41();
}

void sub_1B1196038()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B1196058()
{
  OUTLINED_FUNCTION_26();
}

void sub_1B1196064()
{
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_26();
}

void sub_1B11960B0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_presenterDelegate;
  v3[4] = v1;
  v3[5] = v4;
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B11960F4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_5();
}

id sub_1B119610C()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B1196134()
{
  sub_1B1195FC4();
}

void sub_1B1196140()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_41();
}

id sub_1B1196178()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B11961A0()
{
  sub_1B1195FC4();
}

void sub_1B11961AC()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_41();
}

void SGSuggestionTableController.__allocating_init(store:delegate:suggestionPresenter:suggestionList:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(a1, a2, a3, a4);
  OUTLINED_FUNCTION_22();
}

id SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  id v8;
  id v9;
  objc_super v11;

  *(_QWORD *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_store] = a1;
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionPresenter] = a3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionList] = a4;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  v8 = a1;
  v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);

  OUTLINED_FUNCTION_10_0();
  return v9;
}

uint64_t type metadata accessor for SGSuggestionTableController()
{
  return objc_opt_self();
}

void sub_1B1196398()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController] = 0;
  swift_unknownObjectWeakInit();

  sub_1B11BB560();
  __break(1u);
}

void SGSuggestionTableController.__deallocating_deinit()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  objc_super v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v2 = (void *)OUTLINED_FUNCTION_19_6();
  sub_1B11BB3C8();
  v3 = (void *)OUTLINED_FUNCTION_113_2();

  OUTLINED_FUNCTION_96();
  objc_msgSend(v1, sel_removeObserver_, v3);

  OUTLINED_FUNCTION_130_2(&_suggestionViewControllerPresenter);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  objc_msgSendSuper2(&v4, sel_dealloc);
  OUTLINED_FUNCTION_59();
}

void sub_1B1196568(void *a1)
{
  _QWORD *v1;
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
  _QWORD *v13;
  uint64_t (*v14)(void);
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  type metadata accessor for SGSuggestionsTableView(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_122();
  v6 = v4 - v5;
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v21 - v11;
  v13 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v14 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v15 = a1;
  v16 = v14();
  v17 = (*(uint64_t (**)(uint64_t))((*v13 & *v1) + 0xB0))(v16);
  if (v17)
  {
    v18 = (void *)v17;
    sub_1B11BADD4();

    sub_1B11996E8(v6, (uint64_t)v10);
    sub_1B11996E8((uint64_t)v10, (uint64_t)v12);
    v19 = (void *)*((_QWORD *)v12 + 1);
    v20 = v15;

    *((_QWORD *)v12 + 1) = v15;
    sub_1B119972C((uint64_t)v12);
  }
  OUTLINED_FUNCTION_60();
}

void sub_1B119669C()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t (*v5)(void);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void (*v34)(void *);
  id v35;
  uint64_t v36;
  void (*v37)(void *);
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _QWORD v81[6];
  objc_super v82;

  OUTLINED_FUNCTION_24();
  v2 = v0;
  type metadata accessor for SGSuggestionsTableView(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_36();
  v82.receiver = v0;
  v82.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  v4 = objc_msgSendSuper2(&v82, sel_viewDidLoad);
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8);
  v6 = (void *)((uint64_t (*)(id))v5)(v4);
  sub_1B1199768(v6);
  v8 = v7;
  v9 = swift_bridgeObjectRelease();
  if (v8)
  {
    v10 = (void *)((uint64_t (*)(uint64_t))v5)(v9);
    sub_1B1199768(v10);
    if (v11)
    {
      v12 = (void *)OUTLINED_FUNCTION_113_2();
      OUTLINED_FUNCTION_96();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v2, sel_setTitle_, v12);

  }
  else
  {
    v13 = sub_1B1175A30(0xD000000000000014);
    sub_1B11997D4((uint64_t)v13, v14, v2);
  }
  v15 = (void *)v5();
  objc_msgSend(v15, sel_supportsDismissAll);

  v16 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  if (v17 == (id)6)
  {
    if (sub_1B1177C0C())
    {
      v18 = sub_1B1177994();
      v19 = OUTLINED_FUNCTION_9((uint64_t)v18, sel_navigationItem);
      v20 = v19;
      v21 = sel_setLeftBarButtonItem_;
    }
    else
    {
      OUTLINED_FUNCTION_51_2();
      OUTLINED_FUNCTION_98_1();
      v25 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
      v26 = v2;
      v18 = OUTLINED_FUNCTION_27_3();
      v19 = objc_msgSend(v1, sel_navigationItem);
      v20 = v19;
      v21 = sel_setRightBarButtonItem_;
    }
    objc_msgSend(v19, v21, v18);
  }
  else
  {
    v22 = sub_1B1176E24();
    if ((v22 & 1) != 0)
      goto LABEL_15;
    OUTLINED_FUNCTION_51_2();
    OUTLINED_FUNCTION_98_1();
    v23 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
    v24 = v2;
    v20 = OUTLINED_FUNCTION_27_3();
    v18 = objc_msgSend(v1, sel_navigationItem);
    objc_msgSend(v18, sel_setRightBarButtonItem_, v20);
  }

LABEL_15:
  v27 = OUTLINED_FUNCTION_9(v22, sel_navigationController);
  if (v27)
  {
    v28 = v27;
    v29 = objc_msgSend(v27, sel_navigationBar);

    objc_msgSend(v29, sel_setShadowImage_, 0);
  }
  sub_1B1177C0C();
  OUTLINED_FUNCTION_68_1();
  (*(void (**)(void))(v30 + 128))();
  OUTLINED_FUNCTION_89_1();
  OUTLINED_FUNCTION_67_2();
  OUTLINED_FUNCTION_97_1();
  sub_1B1196E38();
  v31 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF115F8));
  v32 = (void *)sub_1B11BADBC();
  OUTLINED_FUNCTION_68_1();
  v34 = *(void (**)(void *))(v33 + 184);
  v35 = v32;
  v34(v32);
  OUTLINED_FUNCTION_68_1();
  v37 = *(void (**)(void *))(v36 + 160);
  v38 = v35;
  v37(v32);
  objc_msgSend(v2, sel_addChildViewController_, v38);
  v39 = OUTLINED_FUNCTION_14_4();
  if (!v39)
  {
    __break(1u);
    goto LABEL_30;
  }
  v40 = v39;
  objc_msgSend(v39, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v42 = OUTLINED_FUNCTION_9(v41, sel_view);
  if (!v42)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v43 = v42;
  v44 = OUTLINED_FUNCTION_14_4();
  if (!v44)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v45 = v44;
  objc_msgSend(v43, sel_addSubview_, v44);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_1B11BEB80;
  v47 = OUTLINED_FUNCTION_14_4();
  if (!v47)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v48 = objc_msgSend(v47, sel_leadingAnchor);
  OUTLINED_FUNCTION_122_2();
  v50 = OUTLINED_FUNCTION_9(v49, sel_view);
  if (!v50)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v51 = v50;
  v52 = objc_msgSend(v50, sel_leadingAnchor);
  OUTLINED_FUNCTION_101_2();
  v53 = OUTLINED_FUNCTION_37_3();
  OUTLINED_FUNCTION_82_1();

  *(_QWORD *)(v46 + 32) = v51;
  v54 = OUTLINED_FUNCTION_14_4();
  if (!v54)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v55 = objc_msgSend(v54, sel_trailingAnchor);
  OUTLINED_FUNCTION_122_2();
  v57 = OUTLINED_FUNCTION_9(v56, sel_view);
  if (!v57)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v58 = v57;
  v59 = objc_msgSend(v57, sel_trailingAnchor);
  OUTLINED_FUNCTION_101_2();
  v60 = OUTLINED_FUNCTION_37_3();
  OUTLINED_FUNCTION_82_1();

  *(_QWORD *)(v46 + 40) = v58;
  v61 = OUTLINED_FUNCTION_14_4();
  if (!v61)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v62 = objc_msgSend(v61, sel_topAnchor);
  OUTLINED_FUNCTION_122_2();
  v64 = OUTLINED_FUNCTION_9(v63, sel_view);
  if (!v64)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v65 = v64;
  v66 = objc_msgSend(v64, sel_topAnchor);
  OUTLINED_FUNCTION_101_2();
  v67 = OUTLINED_FUNCTION_37_3();
  OUTLINED_FUNCTION_82_1();

  *(_QWORD *)(v46 + 48) = v65;
  v68 = OUTLINED_FUNCTION_14_4();
  if (!v68)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v69 = objc_msgSend(v68, sel_bottomAnchor);
  OUTLINED_FUNCTION_82_1();
  v71 = OUTLINED_FUNCTION_9(v70, sel_view);
  if (v71)
  {
    v72 = v71;
    v73 = (void *)objc_opt_self();
    v74 = objc_msgSend(v72, sel_bottomAnchor);

    v75 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v74);
    *(_QWORD *)(v46 + 56) = v75;
    sub_1B11BB44C();
    sub_1B117C45C(0, (unint64_t *)&qword_1ED3818B8);
    v76 = (void *)sub_1B11BB428();
    OUTLINED_FUNCTION_87();
    objc_msgSend(v73, sel_activateConstraints_, v76, v46);

    v77 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v78 = (void *)sub_1B11BB398();
    v79 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v81[4] = sub_1B119985C;
    v81[5] = v79;
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 1107296256;
    v81[2] = sub_1B1196FF8;
    v81[3] = &block_descriptor_2;
    v80 = _Block_copy(v81);
    swift_release();
    objc_msgSend(v77, sel_addObserverForName_object_queue_usingBlock_, v78, 0, 0, v80);
    _Block_release(v80);
    swift_unknownObjectRelease();

    objc_msgSend(v38, sel_didMoveToParentViewController_, v2);
    OUTLINED_FUNCTION_15();
    return;
  }
LABEL_39:
  __break(1u);
}

void sub_1B1196E0C()
{
  OUTLINED_FUNCTION_72_2();
  sub_1B1197B00();
  OUTLINED_FUNCTION_41();
}

void sub_1B1196E38()
{
  char v0;
  char v1;
  char v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_36_2();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0;
  v9 = (uint64_t *)(v7 + *(int *)(v8 + 32));
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  swift_storeEnumTagMultiPayload();
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v11 = (void *)OUTLINED_FUNCTION_52_2();
  sub_1B11BB4C4();

  if (v5)
  {
    v12 = *(void **)(v7 + 8);
    v13 = v5;

    *(_QWORD *)(v7 + 8) = v5;
    v14 = (uint64_t *)(v7 + *(int *)(v8 + 36));
    type metadata accessor for SectionHeadersUpdateModel(0);
    sub_1B11998CC(&qword_1EEF11608, (void (*)(uint64_t))type metadata accessor for SectionHeadersUpdateModel);
    swift_retain();
    *v14 = sub_1B11BAB70();
    v14[1] = v15;
    OUTLINED_FUNCTION_139();
    v16 = OUTLINED_FUNCTION_67_2();
    sub_1B1198038();

    OUTLINED_FUNCTION_123_0();
    *(_QWORD *)v7 = v16;
  }
  else
  {
    OUTLINED_FUNCTION_89_1();
    OUTLINED_FUNCTION_67_2();
    OUTLINED_FUNCTION_97_1();
    v17 = (uint64_t *)(v7 + *(int *)(v8 + 36));
    sub_1B11998CC(&qword_1EEF11608, (void (*)(uint64_t))type metadata accessor for SectionHeadersUpdateModel);
    v18 = sub_1B11BAB70();
    v20 = v19;
    swift_release();
    *v17 = v18;
    v17[1] = v20;
  }
  *(_BYTE *)(v7 + 16) = v3 & 1;
  *(_BYTE *)(v7 + 17) = v1 & 1;
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B1196FF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_1B11BA8D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_1B11BA8C4();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1B11970C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_39_3((uint64_t)v16.super_class, sel_viewWillAppear_, v1, v2, v3, v4, v5, v6, v16);
  v7 = objc_msgSend(v0, sel_isMovingToParentViewController);
  if ((_DWORD)v7)
  {
    _suggestionViewControllerPresenter = (uint64_t)v0;
    swift_unknownObjectRelease();
    v7 = v0;
  }
  v8 = OUTLINED_FUNCTION_113_0((uint64_t)v7, sel_navigationController);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_setToolbarHidden_animated_, 1, 0);

  }
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEDD8];
  v11 = OUTLINED_FUNCTION_31_4(*v0);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)OUTLINED_FUNCTION_32_4(*v0);
    if (v13)
    {
      if ((OUTLINED_FUNCTION_129_1(v13) & 1) != 0)
      {
        if ((OUTLINED_FUNCTION_128_2() & 1) == 0)
        {

          OUTLINED_FUNCTION_225();
          goto LABEL_12;
        }
        v14 = OUTLINED_FUNCTION_47_2();
        v15 = (void *)v10(v14);
        OUTLINED_FUNCTION_80_1((uint64_t)v15, sel_suggestionPresenter_willPresentViewController_);

        OUTLINED_FUNCTION_38_2();
      }
      else
      {
        OUTLINED_FUNCTION_225();
      }
    }

  }
LABEL_12:
  OUTLINED_FUNCTION_59();
}

void sub_1B119720C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_39_3((uint64_t)v13.super_class, sel_viewDidAppear_, v1, v2, v3, v4, v5, v6, v13);
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEDD8];
  v8 = OUTLINED_FUNCTION_31_4(*v0);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)OUTLINED_FUNCTION_32_4(*v0);
    if (v10)
    {
      if ((OUTLINED_FUNCTION_129_1(v10) & 1) != 0)
      {
        if ((OUTLINED_FUNCTION_128_2() & 1) == 0)
        {

          OUTLINED_FUNCTION_225();
          goto LABEL_8;
        }
        v11 = OUTLINED_FUNCTION_47_2();
        v12 = (void *)v7(v11);
        OUTLINED_FUNCTION_80_1((uint64_t)v12, sel_suggestionPresenter_didPresentViewController_);

        OUTLINED_FUNCTION_38_2();
      }
      else
      {
        OUTLINED_FUNCTION_225();
      }
    }

  }
LABEL_8:
  OUTLINED_FUNCTION_59();
}

void sub_1B11972F0(uint64_t a1)
{
  _QWORD *v1;
  id v2;
  void *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v2 = OUTLINED_FUNCTION_113_0(a1, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, sel_isBeingDismissed))
    {
      _suggestionViewControllerPresenter = 0;

      OUTLINED_FUNCTION_65_1();
    }
    else
    {

    }
  }
  if (_suggestionViewControllerPresenter && objc_msgSend(v1, sel_isMovingFromParentViewController))
  {
    _suggestionViewControllerPresenter = 0;
    swift_unknownObjectRelease();
  }
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEDD8];
  v5 = OUTLINED_FUNCTION_31_4(*v1);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)OUTLINED_FUNCTION_32_4(*v1);
    if (v7)
    {
      if ((OUTLINED_FUNCTION_118_1(v7) & 1) != 0)
      {
        if ((OUTLINED_FUNCTION_117_2() & 1) == 0)
        {

          OUTLINED_FUNCTION_65_1();
          goto LABEL_15;
        }
        v8 = OUTLINED_FUNCTION_46_1();
        v9 = (void *)v4(v8);
        OUTLINED_FUNCTION_94_1((uint64_t)v9, sel_suggestionPresenter_willDismissViewController_);

        OUTLINED_FUNCTION_38_2();
      }
      else
      {
        OUTLINED_FUNCTION_65_1();
      }
    }

  }
LABEL_15:
  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_39_3((uint64_t)v16.super_class, sel_viewWillDisappear_, v10, v11, v12, v13, v14, v15, v16);
  OUTLINED_FUNCTION_43_3();
}

void sub_1B119744C()
{
  uint64_t *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEDD8];
  v2 = OUTLINED_FUNCTION_31_4(*v0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)OUTLINED_FUNCTION_32_4(*v0);
    if (v4)
    {
      if ((OUTLINED_FUNCTION_118_1(v4) & 1) != 0)
      {
        if ((OUTLINED_FUNCTION_117_2() & 1) == 0)
        {

          OUTLINED_FUNCTION_65_1();
          goto LABEL_8;
        }
        v5 = OUTLINED_FUNCTION_46_1();
        v6 = (void *)v1(v5);
        OUTLINED_FUNCTION_94_1((uint64_t)v6, sel_suggestionPresenter_didDismissViewController_);

        OUTLINED_FUNCTION_38_2();
      }
      else
      {
        OUTLINED_FUNCTION_65_1();
      }
    }

  }
LABEL_8:
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_39_3((uint64_t)v13.super_class, sel_viewDidDisappear_, v7, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_43_3();
}

void sub_1B1197534(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  SEL v6;
  void *v7;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_msgSend(a1, sel_setModalPresentationStyle_, 7);
    objc_msgSend(v1, sel_presentViewController_animated_completion_, a1, 1, 0);
    return;
  }
  v3 = OUTLINED_FUNCTION_9(0, sel_modalPresentationStyle);
  v4 = OUTLINED_FUNCTION_113_0((uint64_t)v3, sel_navigationController);
  if (v3 == (id)-1)
  {
    if (v4)
    {
LABEL_7:
      OUTLINED_FUNCTION_74_2();
      objc_msgSend(v5, v6);
      OUTLINED_FUNCTION_8_1(v7);
      return;
    }
  }
  else if (v4)
  {
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_45_0();
}

void sub_1B119764C(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  SEL v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v2 = OUTLINED_FUNCTION_113_0((uint64_t)a1, sel_navigationController);
  v3 = objc_msgSend(a1, sel_navigationController);
  v4 = v3;
  if (!v2)
  {
    if (!v3)
      goto LABEL_6;
LABEL_9:

LABEL_10:
    v9 = OUTLINED_FUNCTION_9((uint64_t)v3, sel_navigationController);
    if (v9)
    {
      v10 = objc_msgSend(v9, sel_presentedViewController);
      OUTLINED_FUNCTION_116_1();
      if (v4)
      {

        v12 = OUTLINED_FUNCTION_9(v11, sel_navigationController);
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(v12, sel_presentedViewController);

          if (v14)
          {
            objc_msgSend(v14, sel_dismissViewControllerAnimated_completion_, 0, 0);
            goto LABEL_15;
          }
        }
      }
    }
    goto LABEL_16;
  }
  if (!v3)
  {
    v4 = v2;
    goto LABEL_9;
  }
  sub_1B117C45C(0, (unint64_t *)&unk_1EEF11610);
  v5 = v2;
  v6 = sub_1B11BB4D0();

  if ((v6 & 1) == 0)
    goto LABEL_10;
LABEL_6:
  if (OUTLINED_FUNCTION_9((uint64_t)v3, sel_navigationController))
  {
    OUTLINED_FUNCTION_74_2();

LABEL_15:
    return;
  }
LABEL_16:
  OUTLINED_FUNCTION_59();
}

uint64_t sub_1B1197808()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

id sub_1B119785C()
{
  void *v0;

  OUTLINED_FUNCTION_130_2(&_suggestionViewControllerPresenter);
  return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void SGSuggestionTableController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  uint64_t v6;

  v4 = v3;
  if (a2)
  {
    v6 = OUTLINED_FUNCTION_113_2();
    OUTLINED_FUNCTION_96();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);
  OUTLINED_FUNCTION_116_1();

  OUTLINED_FUNCTION_5();
}

void SGSuggestionTableController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1B119793C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_133_0();
  return v1;
}

void sub_1B1197998()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_188();
  OUTLINED_FUNCTION_75_1();
  OUTLINED_FUNCTION_45_0();
}

void sub_1B11979E8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t KeyPath;

  v1 = OUTLINED_FUNCTION_104_2();
  *v0 = v1;
  v1[4] = swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  v1[6] = OUTLINED_FUNCTION_50_3(KeyPath);
  OUTLINED_FUNCTION_5();
}

void sub_1B1197A40()
{
  sub_1B1197DBC((uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI25SectionHeadersUpdateModel__updateSectionHeaders, &qword_1ED3817E0);
}

void sub_1B1197A54(uint64_t a1)
{
  sub_1B1197E28(a1, &qword_1EEF11620, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI25SectionHeadersUpdateModel__updateSectionHeaders, &qword_1ED3817E0);
}

void sub_1B1197A70()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = OUTLINED_FUNCTION_103_2();
  *v0 = v2;
  v2[3] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11620);
  v4 = OUTLINED_FUNCTION_41_3(v3);
  v2[7] = OUTLINED_FUNCTION_100_1((uint64_t)v4);
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  sub_1B11BAA74();
  swift_endAccess();
  OUTLINED_FUNCTION_5();
}

void sub_1B1197AF4(uint64_t a1, char a2)
{
  sub_1B1197F68(a1, a2, (void (*)(void *))sub_1B1197A54);
}

uint64_t sub_1B1197B00()
{
  uint64_t v0;

  OUTLINED_FUNCTION_33_0();
  sub_1B11BAA68();
  swift_endAccess();
  return v0;
}

void SectionHeadersUpdateModel.deinit()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  OUTLINED_FUNCTION_28(v0);
  OUTLINED_FUNCTION_41();
}

uint64_t SectionHeadersUpdateModel.__deallocating_deinit()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3817E0);
  OUTLINED_FUNCTION_28(v0);
  OUTLINED_FUNCTION_119_1();
  return swift_deallocClassInstance();
}

void sub_1B1197BD4(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_89_1();
  *a1 = sub_1B11BAA50();
  OUTLINED_FUNCTION_5();
}

void sub_1B1197C04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_133_0();
  OUTLINED_FUNCTION_26();
}

uint64_t sub_1B1197C5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_1B1197C8C(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 104);
  v4 = *a1;
  return v3(v2);
}

void sub_1B1197CC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_188();
  OUTLINED_FUNCTION_75_1();
  OUTLINED_FUNCTION_45_0();
}

void sub_1B1197D18()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t KeyPath;

  v1 = OUTLINED_FUNCTION_104_2();
  *v0 = v1;
  v1[4] = swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  v1[6] = OUTLINED_FUNCTION_50_3(KeyPath);
  OUTLINED_FUNCTION_5();
}

void sub_1B1197D6C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_16_1(v1);
}

void sub_1B1197DA8()
{
  sub_1B1197DBC((uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper__store, &qword_1EEF11630);
}

void sub_1B1197DBC(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_1B11BAA74();
  swift_endAccess();
  OUTLINED_FUNCTION_81();
}

void sub_1B1197E0C(uint64_t a1)
{
  sub_1B1197E28(a1, &qword_1EEF11638, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper__store, &qword_1EEF11630);
}

void sub_1B1197E28(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_38_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v4, a1, v7);
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1B11BAA80();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  OUTLINED_FUNCTION_60();
}

void sub_1B1197ED8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = OUTLINED_FUNCTION_103_2();
  *v0 = v2;
  v2[3] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11638);
  v4 = OUTLINED_FUNCTION_41_3(v3);
  v2[7] = OUTLINED_FUNCTION_100_1((uint64_t)v4);
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11630);
  sub_1B11BAA74();
  swift_endAccess();
  OUTLINED_FUNCTION_5();
}

void sub_1B1197F5C(uint64_t a1, char a2)
{
  sub_1B1197F68(a1, a2, (void (*)(void *))sub_1B1197E0C);
}

void sub_1B1197F68(uint64_t a1, char a2, void (*a3)(void *))
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 48);
  v6 = *(void **)(*(_QWORD *)a1 + 56);
  if ((a2 & 1) != 0)
  {
    v7 = v4[4];
    v8 = v4[5];
    (*(void (**)(_QWORD, void *, uint64_t))(v8 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 48), v6, v7);
    a3(v5);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3(*(void **)(*(_QWORD *)a1 + 56));
  }
  free(v6);
  free(v5);
  free(v4);
}

void sub_1B1198000()
{
  OUTLINED_FUNCTION_72_2();
  sub_1B1198038();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B1198038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;

  OUTLINED_FUNCTION_24();
  v3 = v2;
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11630);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_103_0();
  v8 = v0 + OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper__store;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11628);
  sub_1B11BAA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v1, v6);
  OUTLINED_FUNCTION_33_0();
  v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v10 = v5;
  v9(v8, v6);
  sub_1B11BAA68();
  swift_endAccess();

  *(_QWORD *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper_updateSectionHeaders) = v3;
  return v0;
}

void sub_1B119813C()
{
  uint64_t v0;
  uint64_t (*v1)(_BYTE *);
  void (*v2)(_BYTE *, _QWORD);
  BOOL *v3;
  _BYTE v4[32];

  v1 = *(uint64_t (**)(_BYTE *))(**(_QWORD **)(v0
                                                       + OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper_updateSectionHeaders)
                                         + 104);
  OUTLINED_FUNCTION_188();
  v2 = (void (*)(_BYTE *, _QWORD))v1(v4);
  *v3 = !*v3;
  v2(v4, 0);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_139();
  sub_1B11998CC(&qword_1EEF11640, (void (*)(uint64_t))type metadata accessor for SGSuggestionStoreWrapper);
  sub_1B11BAA50();
  sub_1B11BAA5C();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_81();
}

uint64_t sub_1B11981E0()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11630);
  OUTLINED_FUNCTION_28(v0);
  OUTLINED_FUNCTION_114_2();
  OUTLINED_FUNCTION_119_1();
  return swift_deallocClassInstance();
}

void sub_1B1198228(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_139();
  *a1 = sub_1B11BAA50();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B1198258@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_1B11BAD08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B119AB7C(v2, (uint64_t)v10, &qword_1ED3818A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1B11BAAD4();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_1B11BB4A0();
    v14 = sub_1B11BAF90();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_1B117C4E0(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      _os_log_impl(&dword_1B1170000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E17CEC](v16, -1, -1);
      MEMORY[0x1B5E17CEC](v15, -1, -1);
    }

    sub_1B11BACFC();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void *sub_1B119846C()
{
  return &unk_1E62D5BC0;
}

void *sub_1B1198478()
{
  return &unk_1E62D5BD0;
}

void *sub_1B1198484()
{
  return &unk_1E62D5BE0;
}

void sub_1B1198490()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v2 = (void *)v0[1];
  if (v2)
    v3 = (unint64_t)objc_msgSend(v2, sel_count);
  else
    v3 = 0;
  if (!*v0)
    goto LABEL_10;
  v4 = (void *)OUTLINED_FUNCTION_121_1();
  if (!v4)
    goto LABEL_10;
  v5 = objc_msgSend(v4, sel_items);
  OUTLINED_FUNCTION_116_1();
  sub_1B117C45C(0, &qword_1EEF11648);
  v6 = sub_1B11BB440();

  if (v6 >> 62)
  {
    OUTLINED_FUNCTION_114();
    v7 = sub_1B11BB56C();
    OUTLINED_FUNCTION_87();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  OUTLINED_FUNCTION_87();
  if (!(v7 | v3))
  {
    v8 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v9 = (void *)OUTLINED_FUNCTION_19_6();
    OUTLINED_FUNCTION_108_2((uint64_t)v9, sel_postNotificationName_object_, (uint64_t)v9);

    OUTLINED_FUNCTION_8_1(v9);
  }
  else
  {
LABEL_10:
    OUTLINED_FUNCTION_45_0();
  }
}

void sub_1B11985B8()
{
  id v0;
  void *v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = (void *)OUTLINED_FUNCTION_19_6();
  OUTLINED_FUNCTION_108_2((uint64_t)v1, sel_postNotificationName_object_, (uint64_t)v1);

  OUTLINED_FUNCTION_3(v1);
}

void sub_1B119861C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11650);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11658);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11660);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11668);
  sub_1B119A9E4(&qword_1EEF11670, &qword_1EEF11668);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_0();
  sub_1B11BAB64();
  sub_1B119A9E4(qword_1EEF11678, &qword_1EEF11650);
  sub_1B11A5BC4();
}

void sub_1B1198728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
  OUTLINED_FUNCTION_15();
}

void sub_1B1198744()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[18];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v21[17] = v2;
  v22 = OUTLINED_FUNCTION_10();
  v21[16] = *(_QWORD *)(v22 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_5_0();
  v21[15] = v4;
  v21[11] = *(_QWORD *)(OUTLINED_FUNCTION_13_3() - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_5_0();
  v21[10] = v6;
  v24 = OUTLINED_FUNCTION_36_2();
  v7 = *(_QWORD *)(v24 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v24);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11998);
  v21[7] = *(_QWORD *)(v9 - 8);
  v21[8] = v9;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_103_0();
  v21[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11668);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_5_0();
  v21[6] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11660);
  v14 = *(_QWORD *)(v13 - 8);
  v21[13] = v13;
  v21[14] = v14;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_5_0();
  v21[12] = v16;
  sub_1B119A4D0(v1, (uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *(unsigned __int8 *)(v7 + 80);
  v18 = (v17 + 16) & ~v17;
  v23 = v18;
  v21[4] = v17 | 7;
  v21[5] = v18 + v8;
  v19 = swift_allocObject();
  sub_1B11996E8((uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119A0);
  sub_1B119A9E4(&qword_1EEF119A8, &qword_1EEF119A0);
  v25 = nullsub_1(sub_1B119A518);
  v26 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119B0);
  sub_1B119A9E4(&qword_1EEF119B8, &qword_1EEF119B0);
  sub_1B11A5BE4();
}

void sub_1B1198958()
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
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)();
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_34();
  v5 = *(int *)(*(_QWORD *)(v4 - 112) + 40);
  v6 = v0;
  *(_QWORD *)(v4 - 248) = v0;
  v7 = v0 + v5;
  v9 = *(_QWORD *)(v4 - 192);
  v8 = *(_QWORD *)(v4 - 184);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v10(v9, v7, v2);
  *(_QWORD *)(v4 - 256) = v3;
  sub_1B119A4D0(v6, v3);
  v11 = swift_allocObject();
  sub_1B11996E8(v3, v11 + *(_QWORD *)(v4 - 120));
  v12 = *(_QWORD *)(v4 - 224);
  v13 = *(_QWORD *)(v4 - 216);
  v14 = v1;
  v15 = *(_QWORD *)(v4 - 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v14, v15);
  v16 = *(_QWORD *)(v4 - 200);
  v10(v12 + *(int *)(v16 + 52), v9, v2);
  v17 = (void (**)())(v12 + *(int *)(v16 + 56));
  *v17 = sub_1B119A608;
  v17[1] = (void (*)())v11;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v2);
  (*(void (**)(_QWORD, uint64_t))(v13 + 8))(*(_QWORD *)(v4 - 264), v15);
  v18 = *(_QWORD *)(v4 - 256);
  sub_1B119A4D0(*(_QWORD *)(v4 - 248), v18);
  v19 = swift_allocObject();
  sub_1B11996E8(v18, v19 + *(_QWORD *)(v4 - 120));
  sub_1B119A9E4(&qword_1EEF11670, &qword_1EEF11668);
  v21 = v20;
  v22 = *(_QWORD *)(v4 - 176);
  sub_1B11A5B08((uint64_t)sub_1B119A644, v19, v16);
  OUTLINED_FUNCTION_34();
  sub_1B117F494(v12, &qword_1EEF11668);
  v23 = *(_QWORD *)(v4 - 152);
  sub_1B1198258(v23);
  *(_QWORD *)(v4 - 104) = v16;
  *(_QWORD *)(v4 - 96) = v21;
  v24 = OUTLINED_FUNCTION_2_0();
  v25 = *(_QWORD *)(v4 - 168);
  sub_1B11A5B3C(v23, v25, v24);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 144) + 8))(v23, *(_QWORD *)(v4 - 128));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 160) + 8))(v22, v25);
  OUTLINED_FUNCTION_15();
}

void sub_1B1198B30()
{
  uint64_t v0;
  uint64_t v1;
  void **v2;
  void **v3;
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
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
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
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD v56[2];
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;

  OUTLINED_FUNCTION_24();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_122();
  v9 = v7 - v8;
  MEMORY[0x1E0C80A78](v10);
  v62 = (char *)v56 - v11;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119C8);
  v12 = *(_QWORD *)(v60 - 8);
  MEMORY[0x1E0C80A78](v60);
  v14 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_36();
  v16 = type metadata accessor for SGSuggestionsTableView(0);
  v64 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v65 = v17;
  v66 = (uint64_t)v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119D8);
  v18 = *(_QWORD *)(v59 - 8);
  MEMORY[0x1E0C80A78](v59);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119E0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_122();
  v22 = v20 - v21;
  MEMORY[0x1E0C80A78](v23);
  v61 = (uint64_t)v56 - v24;
  v25 = (uint64_t)v3;
  v26 = *v3;
  v63 = v5;
  if (v26)
    v26 = (void *)OUTLINED_FUNCTION_121_1();
  sub_1B11761B8(v26);
  v28 = v27;

  v29 = v28[2];
  if (v29 < 2)
  {
    if (v29 != 1)
    {
      swift_bridgeObjectRelease();
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119E8);
      v41 = v61;
      OUTLINED_FUNCTION_73(v61, 1, v42, v40);
      goto LABEL_12;
    }
    v36 = v28[4];
    v35 = v28[5];
    OUTLINED_FUNCTION_114();
    v37 = swift_bridgeObjectRelease();
    v57 = v56;
    MEMORY[0x1E0C80A78](v37);
    v56[1] = &v56[-6];
    v56[-4] = v25;
    v56[-3] = v36;
    v55 = v35;
    if ((*(_BYTE *)(v25 + 17) & 1) != 0)
    {
      v38 = 0;
      v39 = 0;
    }
    else
    {
      OUTLINED_FUNCTION_114();
      v38 = nullsub_1(v36);
    }
    v67 = (_QWORD *)v38;
    v68 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11A40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11A48);
    sub_1B119A7AC(&qword_1EEF11A50, &qword_1EEF11A40, (uint64_t (*)(void))sub_1B119A6B0, MEMORY[0x1E0CE0798]);
    sub_1B119A6EC();
    sub_1B11BB308();
    OUTLINED_FUNCTION_87();
    v43 = v60;
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v0, v14, v60);
    swift_storeEnumTagMultiPayload();
    sub_1B119A7AC(&qword_1EEF11A70, &qword_1EEF119D8, (uint64_t (*)(void))sub_1B119A80C, MEMORY[0x1E0CDFEE8]);
    sub_1B119A80C();
    sub_1B11BAE88();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v43);
  }
  else
  {
    v67 = v28;
    swift_getKeyPath();
    v30 = v66;
    sub_1B119A4D0(v25, v66);
    v31 = *(unsigned __int8 *)(v64 + 80);
    v57 = (_QWORD *)v9;
    v32 = (v31 + 16) & ~v31;
    v33 = swift_allocObject();
    sub_1B11996E8(v30, v33 + v32);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A80);
    sub_1B119A9E4(&qword_1EEF113B0, (uint64_t *)&unk_1EEF11A80);
    v55 = sub_1B119A80C();
    sub_1B11BB2FC();
    v34 = v59;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v0, v1, v59);
    swift_storeEnumTagMultiPayload();
    sub_1B119A7AC(&qword_1EEF11A70, &qword_1EEF119D8, (uint64_t (*)(void))sub_1B119A80C, MEMORY[0x1E0CDFEE8]);
    v9 = (uint64_t)v57;
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v34);
  }
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119E8);
  OUTLINED_FUNCTION_73(v22, 0, v45, v44);
  v41 = v61;
  sub_1B119A8A4(v22, v61);
LABEL_12:
  v47 = (uint64_t)v62;
  v46 = v63;
  if (*(_BYTE *)(v25 + 16) == 1)
  {
    v48 = v66;
    sub_1B119A4D0(v25, v66);
    v49 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    v50 = swift_allocObject();
    sub_1B11996E8(v48, v50 + v49);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A00);
    sub_1B117EE50();
    sub_1B11BB26C();
    v51 = 0;
  }
  else
  {
    v51 = 1;
  }
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119F0);
  OUTLINED_FUNCTION_73(v47, v51, v53, v52);
  sub_1B119AB7C(v41, v22, &qword_1EEF119E0);
  sub_1B119AB7C(v47, v9, &qword_1EEF119C0);
  sub_1B119AB7C(v22, v46, &qword_1EEF119E0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119F8);
  sub_1B119AB7C(v9, v46 + *(int *)(v54 + 48), &qword_1EEF119C0);
  sub_1B117F494(v47, &qword_1EEF119C0);
  sub_1B117F494(v41, &qword_1EEF119E0);
  sub_1B117F494(v9, &qword_1EEF119C0);
  sub_1B117F494(v22, &qword_1EEF119E0);
  OUTLINED_FUNCTION_15();
}

void sub_1B1199158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _DWORD __src[36];
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  _DWORD v26[5];
  _QWORD v27[18];

  OUTLINED_FUNCTION_24();
  v1 = v0;
  v27[0] = sub_1B1175A30(0xD000000000000015);
  v27[1] = v2;
  sub_1B1176EC8();
  v3 = sub_1B11BB0BC();
  v5 = v4;
  v7 = v6 & 1;
  sub_1B1179F64();
  swift_retain();
  v8 = sub_1B11BB098();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_1B117CED4(v3, v5, v7);
  OUTLINED_FUNCTION_96();
  v15 = sub_1B11BB344();
  sub_1B1179FA4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v15, v16, v8, v10, v12 & 1, v14);
  sub_1B117CED4(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  memcpy(v27, __src, sizeof(v27));
  sub_1B1175644();
  sub_1B11BB338();
  sub_1B11BAB34();
  v17 = v21;
  LOBYTE(v5) = v22;
  v18 = v23;
  v19 = v24;
  *(_DWORD *)(v1 + 153) = __src[0];
  *(_DWORD *)(v1 + 156) = *(_DWORD *)((char *)__src + 3);
  *(_DWORD *)(v1 + 169) = v26[0];
  *(_DWORD *)(v1 + 172) = *(_DWORD *)((char *)v26 + 3);
  memcpy((void *)v1, v27, 0x90uLL);
  *(_QWORD *)(v1 + 144) = v17;
  *(_BYTE *)(v1 + 152) = v5;
  *(_QWORD *)(v1 + 160) = v18;
  *(_BYTE *)(v1 + 168) = v19;
  *(_OWORD *)(v1 + 176) = v25;
  *(_BYTE *)(v1 + 192) = 0;
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B119932C(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  int v20;
  id v21;
  id v22;
  id v23;

  v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x210))();
  if (v2
    && (v2 >> 62 ? (v3 = OUTLINED_FUNCTION_112_2()) : (v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)),
        swift_bridgeObjectRelease(),
        v3))
  {
    v4 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_83_2();
    v6 = (*(uint64_t (**)(void))(v5 + 360))();
    if (v6)
    {
      if (v6 >> 62)
        v7 = OUTLINED_FUNCTION_112_2();
      else
        v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
      v4 = v7 != 0;
    }
    else
    {
      v4 = 0;
    }
  }
  OUTLINED_FUNCTION_83_2();
  v9 = (*(uint64_t (**)(void))(v8 + 288))();
  if (v10)
  {
    v11 = v9;
    v12 = v10;
    swift_bridgeObjectRelease();
    v13 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0)
      v13 = v11 & 0xFFFFFFFFFFFFLL;
    v14 = (v13 != 0) << 8;
  }
  else
  {
    v14 = 0;
  }
  OUTLINED_FUNCTION_83_2();
  v16 = (void *)(*(uint64_t (**)(void))(v15 + 408))();
  if (!v16)
    goto LABEL_27;
  v17 = v16;
  if ((objc_msgSend(v16, sel_respondsToSelector_, sel_suggestionListSupportsDismissal) & 1) == 0)
  {
    if (!objc_msgSend(v17, sel_respondsToSelector_, sel_suggestionDismissAction))
      goto LABEL_34;
    v21 = objc_msgSend((id)OUTLINED_FUNCTION_31(), sel_performSelector_, sel_suggestionDismissAction);
    v22 = v17;
    if (v21)
    {

LABEL_29:
      swift_unknownObjectRelease();
      goto LABEL_30;
    }
    if ((objc_msgSend(v22, sel_respondsToSelector_, sel_suggestionDismissAction) & 1) != 0)
    {
      v23 = objc_msgSend((id)OUTLINED_FUNCTION_31(), sel_suggestionDismissAction);

      OUTLINED_FUNCTION_38_2();
      if (v23)
        goto LABEL_30;
    }
    else
    {
LABEL_34:
      OUTLINED_FUNCTION_10_0();

    }
    v20 = 0;
    return v14 | v4 | v20;
  }
  if ((objc_msgSend(v17, sel_respondsToSelector_, sel_suggestionList) & 1) == 0)
  {
    OUTLINED_FUNCTION_10_0();
LABEL_27:

LABEL_30:
    v20 = 0x10000;
    return v14 | v4 | v20;
  }
  v18 = objc_msgSend((id)OUTLINED_FUNCTION_31(), sel_suggestionList);
  if ((objc_msgSend(v18, sel_respondsToSelector_, sel_suggestionListSupportsDismissal) & 1) == 0)
  {
    OUTLINED_FUNCTION_38_2();

    goto LABEL_29;
  }
  v19 = objc_msgSend(v18, sel_suggestionListSupportsDismissal);
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_38_2();

  if (v19)
    v20 = 0x10000;
  else
    v20 = 0;
  return v14 | v4 | v20;
}

id sub_1B11995A8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  v6 = v5;
  if (a2)
  {
    v10 = (void *)sub_1B11BB398();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = a4[3];
  if (v11)
  {
    v12 = __swift_project_boxed_opaque_existential_0(a4, a4[3]);
    v13 = *(_QWORD *)(v11 - 8);
    MEMORY[0x1E0C80A78](v12);
    v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    v16 = sub_1B11BB590();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(v6, sel_initWithTitle_style_target_action_, v10, a3, v16, a5);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t type metadata accessor for SGSuggestionsTableView(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1EEF12F80);
}

uint64_t sub_1B11996E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B119972C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B1199768(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_listTitle);

  if (!v2)
    return 0;
  v3 = sub_1B11BB3C8();

  return v3;
}

void sub_1B11997D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1B11BB398();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTitle_, v4);

}

uint64_t type metadata accessor for SectionHeadersUpdateModel(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1EEF12F60);
}

uint64_t sub_1B1199838()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B119985C()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39_2();
}

void sub_1B1199884(_QWORD *a1)
{
  if (a1)
  {
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x138))();

  }
  OUTLINED_FUNCTION_26();
}

uint64_t type metadata accessor for SGSuggestionStoreWrapper(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1EEF12F70);
}

void sub_1B11998CC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

void sub_1B1199900()
{
  sub_1B1198744();
}

uint64_t sub_1B119990C()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for SGSuggestionTableControllerRepresentable()
{
  uint64_t v0;

  OUTLINED_FUNCTION_102_1();
  swift_release();
  OUTLINED_FUNCTION_143(*(id *)(v0 + 24));
}

void initializeWithCopy for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  OUTLINED_FUNCTION_188();
  v4 = v3;
  OUTLINED_FUNCTION_5();
}

void assignWithCopy for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  OUTLINED_FUNCTION_34();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  OUTLINED_FUNCTION_34();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  OUTLINED_FUNCTION_5();
}

void assignWithTake for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  OUTLINED_FUNCTION_41();
}

uint64_t getEnumTagSinglePayload for SGSuggestionTableControllerRepresentable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SGSuggestionTableControllerRepresentable(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SGSuggestionTableControllerRepresentable()
{
  return &type metadata for SGSuggestionTableControllerRepresentable;
}

uint64_t method lookup function for SGSuggestionTableController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGSuggestionTableController.__allocating_init(store:delegate:suggestionPresenter:suggestionList:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SGSuggestionTableController.update(suggestionStore:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGSuggestionTableController.present(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGSuggestionTableController.dismiss(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

void sub_1B1199B34()
{
  unint64_t v0;

  sub_1B1199BA0();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_167();
    swift_updateClassMetadata2();
  }
  OUTLINED_FUNCTION_148();
}

uint64_t method lookup function for SectionHeadersUpdateModel()
{
  return swift_lookUpClassMethod();
}

void sub_1B1199BA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED381AD8)
  {
    v0 = sub_1B11BAAB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED381AD8);
  }
}

void sub_1B1199BE8()
{
  unint64_t v0;

  sub_1B1199C54();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_167();
    swift_updateClassMetadata2();
  }
  OUTLINED_FUNCTION_148();
}

void sub_1B1199C54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEF11810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11628);
    v0 = sub_1B11BAAB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEF11810);
  }
}

void sub_1B1199CAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    swift_retain();
  }
  else
  {
    v8 = (void *)a2[1];
    a1[1] = (uint64_t)v8;
    OUTLINED_FUNCTION_45_4(v5, (uint64_t)a2);
    v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v10 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1(v10);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
    v11 = *(int *)(a3 + 36);
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_61_3();
    OUTLINED_FUNCTION_92_1();
  }
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B1199D70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_102_1();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v4 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_1(v4);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  swift_release();
  v5 = v2 + *(int *)(a2 + 40);
  v6 = OUTLINED_FUNCTION_13_3();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

void sub_1B1199DFC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_44_3();
  v4 = *v3;
  v5 = (void *)v3[1];
  *v0 = *v3;
  v0[1] = (uint64_t)v5;
  OUTLINED_FUNCTION_45_4(v4, (uint64_t)v3);
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_13_2() == 1)
  {
    v7 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_6_1(v7);
  }
  else
  {
    OUTLINED_FUNCTION_31_0();
  }
  OUTLINED_FUNCTION_28_1();
  v8 = *(int *)(v2 + 36);
  v9 = (uint64_t *)((char *)v0 + v8);
  v10 = (_QWORD *)(v1 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_61_3();
  OUTLINED_FUNCTION_92_1();
  OUTLINED_FUNCTION_22();
}

void sub_1B1199E8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  OUTLINED_FUNCTION_44_3();
  *v0 = *v3;
  swift_retain();
  swift_release();
  v4 = (void *)v0[1];
  v5 = *(void **)(v1 + 8);
  v0[1] = v5;
  v6 = v5;

  OUTLINED_FUNCTION_73_1();
  if (!v7)
  {
    sub_1B117F494((uint64_t)v0 + *(int *)(v2 + 32), &qword_1ED3818A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_13_2() == 1)
    {
      v8 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_31_0();
    }
    OUTLINED_FUNCTION_28_1();
  }
  v9 = *(int *)(v2 + 36);
  v10 = (_QWORD *)((char *)v0 + v9);
  v11 = (_QWORD *)(v1 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_retain();
  swift_release();
  v12 = OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24));
  OUTLINED_FUNCTION_22();
}

void sub_1B1199F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_44_3();
  *(_OWORD *)v4 = *(_OWORD *)v3;
  *(_WORD *)(v4 + 16) = *(_WORD *)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_34_1() == 1)
  {
    v5 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_7_1(v5);
    OUTLINED_FUNCTION_91_1();
  }
  else
  {
    OUTLINED_FUNCTION_20_2();
  }
  *(_OWORD *)(v0 + *(int *)(v2 + 36)) = *(_OWORD *)(v1 + *(int *)(v2 + 36));
  v6 = OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32));
  OUTLINED_FUNCTION_22();
}

void sub_1B119A014()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_44_3();
  *v0 = *v3;
  swift_release();
  v4 = (void *)v0[1];
  v0[1] = *(_QWORD *)(v1 + 8);

  OUTLINED_FUNCTION_73_1();
  if (!v5)
  {
    sub_1B117F494((uint64_t)v0 + *(int *)(v2 + 32), &qword_1ED3818A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
    if (OUTLINED_FUNCTION_34_1() == 1)
    {
      v6 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_7_1(v6);
      OUTLINED_FUNCTION_91_1();
    }
    else
    {
      OUTLINED_FUNCTION_20_2();
    }
  }
  v7 = *(int *)(v2 + 36);
  v8 = (_QWORD *)((char *)v0 + v7);
  v9 = (uint64_t *)(v1 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_release();
  v12 = OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40));
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B119A0E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B119A0F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11050);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a3[8];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v7 = OUTLINED_FUNCTION_13_3();
    v8 = a3[10];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + a3[9] + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1B119A190()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B119A19C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11050);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a4[8];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[9] + 8) = (a2 - 1);
      OUTLINED_FUNCTION_5();
      return;
    }
    v9 = OUTLINED_FUNCTION_13_3();
    v10 = a4[10];
  }
  __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
}

void sub_1B119A230()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B119A2CC();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_167();
    sub_1B11BB4B8();
    if (v1 <= 0x3F)
    {
      OUTLINED_FUNCTION_167();
      swift_initStructMetadata();
    }
  }
}

void sub_1B119A2CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED3818A8)
  {
    sub_1B11BAAD4();
    v0 = sub_1B11BAAEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED3818A8);
  }
}

uint64_t getEnumTagSinglePayload for SGSuggestionsTableCellModel(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  unsigned int v4;
  BOOL v5;

  if (!a2)
  {
    v3 = -1;
    return (v3 + 1);
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        goto LABEL_5;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }
  v4 = *(unsigned __int8 *)a1;
  v5 = v4 >= 2;
  v3 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5)
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SGSuggestionsTableCellModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for SGSuggestionsTableCellModel()
{
  return &type metadata for SGSuggestionsTableCellModel;
}

uint64_t sub_1B119A434()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11650);
  sub_1B119A9E4(qword_1EEF11678, &qword_1EEF11650);
  return OUTLINED_FUNCTION_2_0();
}

unint64_t sub_1B119A494()
{
  unint64_t result;

  result = qword_1EEF11990;
  if (!qword_1EEF11990)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BEC50, &type metadata for SGSuggestionTableControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EEF11990);
  }
  return result;
}

uint64_t sub_1B119A4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B119A518()
{
  OUTLINED_FUNCTION_30_3();
  sub_1B1198B30();
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_36_2() - 8) + 80);
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818A0);
  if (OUTLINED_FUNCTION_54_0() == 1)
  {
    v2 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_1(v2);
  }
  else
  {
    OUTLINED_FUNCTION_123_0();
  }
  swift_release();
  v3 = OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_28(v3);
  return swift_deallocObject();
}

void sub_1B119A608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_30_3();
  v3 = *(_QWORD *)(v0 + v2);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 176))(v1);
  sub_1B1198490();
  OUTLINED_FUNCTION_41();
}

void sub_1B119A644()
{
  OUTLINED_FUNCTION_36_2();
  sub_1B11985B8();
}

void sub_1B119A660()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  OUTLINED_FUNCTION_30_3();
  v2 = *(void **)(v0 + v1 + 8);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, sel_dismissAllSuggestions);
    sub_1B1198490();
    OUTLINED_FUNCTION_3(v3);
  }
  else
  {
    OUTLINED_FUNCTION_148();
  }
}

unint64_t sub_1B119A6B0()
{
  unint64_t result;

  result = qword_1EEF11A58;
  if (!qword_1EEF11A58)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BD958, &unk_1E62D4DC0);
    atomic_store(result, (unint64_t *)&qword_1EEF11A58);
  }
  return result;
}

unint64_t sub_1B119A6EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_1EEF11A60;
  if (!qword_1EEF11A60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11A48);
    v2[1] = &unk_1E62D4D30;
    v2[2] = sub_1B119A770();
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CE0798], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF11A60);
  }
  return result;
}

unint64_t sub_1B119A770()
{
  unint64_t result;

  result = qword_1EEF11A68;
  if (!qword_1EEF11A68)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BD8D0, &unk_1E62D4D30);
    atomic_store(result, (unint64_t *)&qword_1EEF11A68);
  }
  return result;
}

void sub_1B119A7AC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  if (!*a1)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v8 = a3();
    atomic_store(MEMORY[0x1B5E17C68](a4, v7, &v8), a1);
  }
  OUTLINED_FUNCTION_26();
}

unint64_t sub_1B119A80C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_1EEF11A78;
  if (!qword_1EEF11A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF119C8);
    sub_1B119A7AC(&qword_1EEF11A50, &qword_1EEF11A40, (uint64_t (*)(void))sub_1B119A6B0, MEMORY[0x1E0CE0798]);
    v3[0] = v2;
    v3[1] = sub_1B119A6EC();
    v3[2] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDFF98], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11A78);
  }
  return result;
}

uint64_t sub_1B119A8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF119E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B119A8F0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_36_2() - 8) + 80);
  v4 = v1 + ((v3 + 16) & ~v3);
  v5 = *a1;
  if ((*(_BYTE *)(v4 + 17) & 1) == 0)
  {
    swift_bridgeObjectRetain();
    nullsub_1(v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11A40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11A48);
  sub_1B119A7AC(&qword_1EEF11A50, &qword_1EEF11A40, (uint64_t (*)(void))sub_1B119A6B0, MEMORY[0x1E0CE0798]);
  sub_1B119A6EC();
  return sub_1B11BB308();
}

void sub_1B119A9E4(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B119AA18@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14;

  v3 = v1[2];
  if (*(_QWORD *)v3 && (v4 = *(void **)(v3 + 8)) != 0)
  {
    v6 = v1[3];
    v5 = v1[4];
    v7 = *(_BYTE *)(v3 + 17);
    swift_retain_n();
    v8 = v4;
    OUTLINED_FUNCTION_114();
    sub_1B1177D60(v6, v5, (uint64_t)v8, v7, (uint64_t)&v14);
    v9 = sub_1B119A770();
    sub_1B117C350(v7, (uint64_t)&unk_1E62D4D30, v9);

    OUTLINED_FUNCTION_34();
    sub_1B119AB3C((uint64_t)&v14);
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A90);
    return OUTLINED_FUNCTION_73(a1, 0, v11, v10);
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11A90);
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v13);
  }
}

uint64_t sub_1B119AB3C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  swift_release();

  swift_bridgeObjectRelease();
  return a1;
}

void sub_1B119AB7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_70_0();
  v4(v3);
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B119ABD4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_0();
  return MEMORY[0x1B5E17D58](v0);
}

void sub_1B119AC54()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_22_4();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1B119AC8C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x78))();
  *a2 = result;
  return result;
}

uint64_t sub_1B119ACCC(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x80);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void sub_1B119AD0C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_2();
  v3[3] = MEMORY[0x1B5E17D58](v5);
  OUTLINED_FUNCTION_5();
}

id sub_1B119AD70()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return *v0;
}

void sub_1B119ADA0(void *a1)
{
  void **v1;
  void *v3;

  OUTLINED_FUNCTION_1_3();
  v3 = *v1;
  *v1 = a1;

  OUTLINED_FUNCTION_7_0();
}

void sub_1B119ADD4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B119AE10()
{
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_22_4();
}

uint64_t sub_1B119AE4C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_1_3();
  *v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_1B119AE94()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_41();
}

void SGReminderSuggestion.__allocating_init(realtimeReminder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  SGReminderSuggestion.init(realtimeReminder:)(a1);
  OUTLINED_FUNCTION_41();
}

id SGReminderSuggestion.init(realtimeReminder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  objc_super v21;

  v3 = OUTLINED_FUNCTION_56_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  swift_unknownObjectWeakInit();
  v8 = &v1[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_reminderNotes];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = v1;
  result = objc_msgSend(a1, sel_reminder);
  if (result)
  {
    *(_QWORD *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_reminder] = result;
    OUTLINED_FUNCTION_13_4((uint64_t)result, (SEL *)&selRef_notes);
    v12 = v11;
    v13 = swift_bridgeObjectRelease();
    if (v12)
    {
      OUTLINED_FUNCTION_13_4(v13, (SEL *)&selRef_notes);
      v15 = v14;
      v17 = v16;
      OUTLINED_FUNCTION_2();
      *(_QWORD *)v8 = v15;
      *((_QWORD *)v8 + 1) = v17;
      swift_bridgeObjectRelease();
    }
    sub_1B11758DC();
    swift_bridgeObjectRetain();
    sub_1B11BA9FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(&v9[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_logger], v7, v3);
    v18 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

    v9[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_bannerForVisionDevice] = v19 == (id)6;
    v21.receiver = v9;
    v21.super_class = (Class)type metadata accessor for SGReminderSuggestion();
    v20 = objc_msgSendSuper2(&v21, sel_init);

    return v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1B119B11C(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_33(a1, &qword_1EEF11AB8);
  v2 = (void *)OUTLINED_FUNCTION_8_0(*v1);
  v3 = objc_msgSend(v2, sel_title);

  v4 = sub_1B11BB3C8();
  v6 = v5;

  sub_1B119B9E0(v4, v6, (SEL *)&selRef_initWithString_);
  OUTLINED_FUNCTION_5();
}

void sub_1B119B1D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  SEL *v5;

  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
  if (v1)
  {
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_33(v2, &qword_1EEF11AB8);
    v3 = OUTLINED_FUNCTION_70_0();
    sub_1B119B9E0(v3, v4, v5);
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B119B2DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)OUTLINED_FUNCTION_8_0(*v1);
  v4 = objc_msgSend(v3, sel_dueDateComponents);

  if (v4)
  {
    OUTLINED_FUNCTION_33_3();

    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = OUTLINED_FUNCTION_35_4();
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v6);
}

uint64_t sub_1B119B388()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)(id);
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  CLLocationCoordinate2D v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  sub_1B11BA990();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_120();
  v4 = (void *)OUTLINED_FUNCTION_21_3(*v1);
  v5 = objc_msgSend(v4, sel_dueLocation);

  if (!v5)
    return 0;
  OUTLINED_FUNCTION_33(v6, &qword_1EEF11AC0);
  v8 = OUTLINED_FUNCTION_20(v7, sel_latitude);
  v10 = v9;
  OUTLINED_FUNCTION_20((uint64_t)v8, sel_longitude);
  v12 = CLLocationCoordinate2DMake(v10, v11);
  v14 = OUTLINED_FUNCTION_20(v13, sel_accuracy);
  v16 = v15;
  v17 = OUTLINED_FUNCTION_20((uint64_t)v14, sel_accuracy);
  v19 = v18;
  v20 = (void *)v2(v17);
  v21 = objc_msgSend(v20, sel_creationDate);

  sub_1B11BA984();
  sub_1B119B4E0(v0, v12.latitude, v12.longitude, 0.0, v16, v19);
  OUTLINED_FUNCTION_24_3();
  return v0;
}

id sub_1B119B4E0(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v13 = (void *)sub_1B11BA978();
  v14 = objc_msgSend(v12, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, v13, a2, a3, a4, a5, a6);

  v15 = sub_1B11BA990();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  return v14;
}

void sub_1B119B5F4()
{
  void *v0;
  uint64_t *v1;
  id v2;
  id v3;
  void *v4;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(*v1), sel_dueLocation);
  OUTLINED_FUNCTION_23();
  if (v0)
  {
    v3 = objc_msgSend(v0, sel_label);
    if (v3)
    {
      v4 = v3;
      sub_1B11BB3C8();

    }
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B119B71C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1B11BA954();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

void sub_1B119B778()
{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v3 = objc_msgSend((id)OUTLINED_FUNCTION_21_3(*v1), sel_sourceURL);
  OUTLINED_FUNCTION_24_3();
  if (v0)
  {
    v4 = (void *)v2();
    v5 = objc_msgSend(v4, sel_origin);

    v6 = objc_msgSend(v5, sel_type);
    if (v6 == (id)1
      || (v8 = (void *)v2(),
          v9 = objc_msgSend(v8, sel_origin),
          v8,
          v10 = objc_msgSend(v9, sel_type),
          v9,
          v10 == (id)4))
    {
      OUTLINED_FUNCTION_33(v7, &qword_1EEF11AC8);
      v11 = sub_1B11BB3C8();
      sub_1B119B9E0(v11, v12, (SEL *)&selRef_initWithActivityType_);
      v14 = v13;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11AD0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B11BE3D0;
      v16 = MEMORY[0x1E0DEA968];
      v17 = sub_1B11BB518();
      OUTLINED_FUNCTION_13_4(v17, (SEL *)&selRef_absoluteString);
      *(_QWORD *)(inited + 96) = v16;
      if (v19)
        v20 = v18;
      else
        v20 = 0;
      v21 = 0xE000000000000000;
      if (v19)
        v21 = v19;
      *(_QWORD *)(inited + 72) = v20;
      *(_QWORD *)(inited + 80) = v21;
      v22 = sub_1B11BB374();
      sub_1B119C67C(v22, v14);

    }
    else
    {

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1B119B9E0(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4;
  void *v5;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, *a3, v5);

  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B119BA50()
{
  return 1;
}

void sub_1B119BA80()
{
  uint64_t *v0;
  void *v1;

  v1 = (void *)OUTLINED_FUNCTION_8_0(*v0);
  objc_msgSend(v1, sel_dueLocationTrigger);

  OUTLINED_FUNCTION_41();
}

void sub_1B119BAD4(uint64_t a1, char a2)
{
  void *v2;
  uint64_t *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t aBlock[6];

  v5 = v2;
  v6 = sub_1B11BA9F0();
  v7 = sub_1B11BB4AC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = OUTLINED_FUNCTION_4_1();
    aBlock[0] = OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v8 = 136315394;
    v9 = (void *)OUTLINED_FUNCTION_15_5(*v5);
    v10 = objc_msgSend(v9, sel_loggingIdentifier);

    v11 = sub_1B11BB3C8();
    v13 = v12;

    sub_1B117C4E0(v11, v13, aBlock);
    OUTLINED_FUNCTION_19_7();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    if ((a2 & 1) != 0)
      v14 = 32;
    else
      v14 = 7630670;
    if ((a2 & 1) != 0)
      v15 = 0xE100000000000000;
    else
      v15 = 0xE300000000000000;
    sub_1B117C4E0(v14, v15, aBlock);
    OUTLINED_FUNCTION_19_7();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B1170000, v6, v7, "SGReminderSuggestion - SGReminder %s ViewController dismissed. %s confirming reminder", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_161();
  }

  objc_msgSend(v5, sel_dismissViewController_finished_, a1, a2 & 1);
  if ((a2 & 1) != 0)
  {
    v16 = objc_msgSend((id)objc_opt_self(), sel_serviceForReminders);
    v17 = (void *)OUTLINED_FUNCTION_15_5(*v5);
    v18 = OUTLINED_FUNCTION_4_0();
    *(_QWORD *)(v18 + 16) = v5;
    aBlock[4] = (uint64_t)sub_1B119C70C;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1B1189BF0;
    aBlock[3] = (uint64_t)&block_descriptor_3;
    v19 = _Block_copy(aBlock);
    v20 = v5;
    swift_release();
    objc_msgSend(v16, sel_confirmRealtimeReminder_withCompletion_, v17, v19);
    _Block_release(v19);
    swift_unknownObjectRelease();

  }
}

void sub_1B119BE04()
{
  uint64_t v0;

  if (currentUIContext())
    v0 = 0xD000000000000023;
  else
    v0 = 0xD00000000000001ALL;
  sub_1B1175A30(v0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

id sub_1B119BE78()
{
  return objc_msgSend((id)objc_opt_self(), sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E0D19A58]);
}

uint64_t sub_1B119BEB0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
  v4 = v3;
  (*(void (**)(void))((*v1 & *v0) + 0x138))();
  OUTLINED_FUNCTION_23_0();
  if (v4 && v0)
  {
    sub_1B1175A30(0xD00000000000003CLL);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v5 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v5 + 16) = xmmword_1B11BD870;
    v6 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
    v7 = sub_1B118A610();
    *(_QWORD *)(v5 + 32) = v2;
    *(_QWORD *)(v5 + 40) = v4;
    *(_QWORD *)(v5 + 96) = v6;
    *(_QWORD *)(v5 + 104) = v7;
    *(_QWORD *)(v5 + 64) = v7;
    *(_QWORD *)(v5 + 72) = v1;
    *(_QWORD *)(v5 + 80) = v0;
    sub_1B11BB3A4();
    OUTLINED_FUNCTION_23_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_70_0();
}

void sub_1B119BFC0()
{
  void *v0;
  _QWORD *v1;
  uint64_t (*v2)(void);
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x90);
  v3 = objc_msgSend((id)v2(), sel_dueLocation);
  OUTLINED_FUNCTION_24_3();
  if (v0)
  {
    v4 = (void *)v2();
    v5 = objc_msgSend(v4, sel_dueLocationTrigger);

    if (v5)
    {
      if (v5 == 2)
      {
        sub_1B1175A30(0xD000000000000029);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
        v6 = OUTLINED_FUNCTION_4_0();
        *(_OWORD *)(v6 + 16) = xmmword_1B11BE3D0;
        OUTLINED_FUNCTION_13_4(v6, (SEL *)&selRef_label);
        if (!v8)
        {
          __break(1u);
          return;
        }
        goto LABEL_10;
      }
      if (v5 == 1)
      {
        sub_1B1175A30(0xD00000000000002CLL);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
        v6 = OUTLINED_FUNCTION_4_0();
        *(_OWORD *)(v6 + 16) = xmmword_1B11BE3D0;
        OUTLINED_FUNCTION_13_4(v6, (SEL *)&selRef_label);
        if (!v8)
        {
          __break(1u);
          goto LABEL_7;
        }
LABEL_10:
        v9 = v7;
        v10 = v8;
        *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v6 + 64) = sub_1B118A610();
        *(_QWORD *)(v6 + 32) = v9;
        *(_QWORD *)(v6 + 40) = v10;
        sub_1B11BB3A4();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
LABEL_7:

  }
}

id sub_1B119C174()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  void (*v27)(uint64_t, char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  id result;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  char *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;

  v1 = v0;
  v50 = sub_1B11BA990();
  v46 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  OUTLINED_FUNCTION_57();
  v47 = v3 - v2;
  v4 = sub_1B11BA9D8();
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11B50);
  OUTLINED_FUNCTION_0_0();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v51 = (uint64_t)&v45 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11AE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_57();
  v16 = v15 - v14;
  v17 = OUTLINED_FUNCTION_35_4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v52 = (char *)&v45 - v23;
  v24 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90);
  v25 = (void *)v24(v22);
  v26 = objc_msgSend(v25, sel_dueDateComponents);

  if (!v26)
  {
    OUTLINED_FUNCTION_26_2(v16, 1);
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_33_3();

  v27 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 32);
  v27(v16, v21, v17);
  OUTLINED_FUNCTION_26_2(v16, 0);
  if (__swift_getEnumTagSinglePayload(v16, 1, v17) == 1)
  {
LABEL_6:
    v33 = &qword_1EEF11AE0;
    v32 = v16;
    goto LABEL_7;
  }
  v28 = v18;
  v29 = v52;
  v27((uint64_t)v52, (char *)v16, v17);
  sub_1B11BA9CC();
  v30 = v51;
  sub_1B11BA9C0();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v7, v49);
  sub_1B119CA34(v30, (uint64_t)v11);
  v31 = v50;
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v50) == 1)
  {
    sub_1B119CA7C(v30, &qword_1EEF11B50);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v17);
    v32 = (uint64_t)v11;
    v33 = &qword_1EEF11B50;
LABEL_7:
    sub_1B119CA7C(v32, v33);
    return 0;
  }
  v36 = v46;
  v37 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v46 + 32))(v47, v11, v31);
  v38 = (void *)v24(v37);
  v39 = objc_msgSend(v38, sel_isAllDay);

  v40 = (void *)objc_opt_self();
  v41 = v28;
  if (v39)
  {
    result = objc_msgSend(v40, sel_reminderAllDayDateFormatter);
    v42 = v52;
    if (result)
      goto LABEL_13;
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v40, sel_reminderDateTimeFormatter);
    v42 = v52;
    if (result)
    {
LABEL_13:
      v43 = (void *)OUTLINED_FUNCTION_17_3();
      v44 = OUTLINED_FUNCTION_30_4((uint64_t)v43, sel_stringFromDate_);

      v34 = sub_1B11BB3C8();
      (*(void (**)(_QWORD *, uint64_t))(v36 + 8))(v1, v31);
      sub_1B119CA7C(v51, &qword_1EEF11B50);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v17);
      return (id)v34;
    }
  }
  __break(1u);
  return result;
}

id SGReminderSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SGReminderSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SGReminderSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGReminderSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SGReminderSuggestion()
{
  uint64_t result;

  result = qword_1EEF12F98;
  if (!qword_1EEF12F98)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B119C67C(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_1B11BB35C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserInfo_, v3);

}

uint64_t sub_1B119C6E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B119C70C(void *a1)
{
  uint64_t v1;
  id v3;
  _QWORD *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  if (a1)
  {
    v3 = *(id *)(v1 + 16);
    OUTLINED_FUNCTION_28_3();
    v4 = v3;
    OUTLINED_FUNCTION_28_3();
    v5 = sub_1B11BA9F0();
    v6 = sub_1B11BB494();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = OUTLINED_FUNCTION_4_1();
      v18 = (_QWORD *)OUTLINED_FUNCTION_4_1();
      v19 = OUTLINED_FUNCTION_4_1();
      *(_DWORD *)v7 = 136315650;
      v8 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x90);
      v9 = (void *)v8();
      v10 = objc_msgSend(v9, sel_loggingIdentifier);

      v11 = sub_1B11BB3C8();
      v13 = v12;

      sub_1B117C4E0(v11, v13, &v19);
      sub_1B11BB4E8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v7 + 12) = 2112;
      v14 = (void *)v8();
      v15 = objc_msgSend(v14, sel_recordId);

      sub_1B11BB4E8();
      *v18 = v15;

      *(_WORD *)(v7 + 22) = 2080;
      OUTLINED_FUNCTION_28_3();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B20);
      v16 = sub_1B11BB3D4();
      sub_1B117C4E0(v16, v17, &v19);
      sub_1B11BB4E8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_31_5();
      OUTLINED_FUNCTION_31_5();
      _os_log_impl(&dword_1B1170000, v5, v6, "SGReminderSuggestion - SGReminder %s\nUnable to confirm reminder with recordId: %@ err: %s", (uint8_t *)v7, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_161();
    }

    OUTLINED_FUNCTION_31_5();
  }
}

void sub_1B119C9E8(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_1B11BB3C8();
    OUTLINED_FUNCTION_23_0();

  }
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B119CA34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B119CA7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B119CAB4()
{
  return type metadata accessor for SGReminderSuggestion();
}

uint64_t sub_1B119CABC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BAA08();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SGReminderSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SGReminderSuggestion.__allocating_init(realtimeReminder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SGReminderSuggestion.title.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.notes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.dueDateComponents.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.location.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.locationString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.url.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.userActivity.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.wantsExtendedDetailOnlyView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SGReminderSuggestion.locationProximity.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SGReminderSuggestion.reminderCreationViewController(_:didCreateReminder:error:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

void sub_1B119CCD4(uint64_t a1)
{
  OUTLINED_FUNCTION_3_2(a1, OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
}

void sub_1B119CCE0(uint64_t a1)
{
  OUTLINED_FUNCTION_3_2(a1, OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
}

void SGBannerContentHostingView.__allocating_init(banner:)()
{
  void *v0;

  OUTLINED_FUNCTION_11_3();
  SGBannerContentHostingView.init(banner:)(v0);
  OUTLINED_FUNCTION_41();
}

char *SGBannerContentHostingView.init(banner:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  char *result;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  objc_super v47;

  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v6 = (_QWORD *)(v5 - v4);
  v7 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController] = 0;
  v8 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore] = 0;
  v9 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel;
  OUTLINED_FUNCTION_19_1();
  v10 = v1;
  OUTLINED_FUNCTION_13_5();
  *(_QWORD *)&v1[v9] = v11;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner] = a1;
  v12 = *(void **)&v1[v8];
  v13 = v12;
  v14 = a1;
  swift_retain();
  SGBannerContainerView.init(_:store:updateBannerView:)(v14, v12, v6);
  v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED3818B0));
  v16 = sub_1B11BADBC();
  v17 = *(void **)&v1[v7];
  *(_QWORD *)&v1[v7] = v16;

  v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints] = 0;
  v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds] = 0;

  v47.receiver = v10;
  v47.super_class = (Class)type metadata accessor for SGBannerContentHostingView();
  result = (char *)objc_msgSendSuper2(&v47, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v19 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  v20 = *(void **)&result[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController];
  if (!v20)
  {
    __break(1u);
    goto LABEL_12;
  }
  v21 = result;
  v22 = result;
  v23 = v20;
  OUTLINED_FUNCTION_15_6();

  result = *(char **)&v21[v19];
  if (!result)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  v24 = objc_msgSend(result, sel_view);
  if (v24)
  {
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED381AE0);
    if (swift_dynamicCastClass())
      OUTLINED_FUNCTION_16_3();

  }
  result = *(char **)&v21[v19];
  if (!result)
    goto LABEL_13;
  v26 = objc_msgSend(result, sel_view);
  if (v26)
  {
    v27 = v26;
    objc_msgSend(v22, sel_bounds);
    objc_msgSend(v27, sel_setFrame_);
    objc_msgSend(v27, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v28 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v27, sel_setBackgroundColor_, v28);

    objc_msgSend(v22, sel_addSubview_, v27);
    v29 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_1B11BEB80;
    v31 = OUTLINED_FUNCTION_4_3(v30, sel_leadingAnchor);
    v32 = OUTLINED_FUNCTION_20((uint64_t)v31, sel_leadingAnchor);
    v33 = OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_8_4();

    *(_QWORD *)(v30 + 32) = v7;
    v35 = OUTLINED_FUNCTION_4_3(v34, sel_trailingAnchor);
    v36 = OUTLINED_FUNCTION_20((uint64_t)v35, sel_trailingAnchor);
    v37 = OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_8_4();

    *(_QWORD *)(v30 + 40) = v7;
    v39 = OUTLINED_FUNCTION_4_3(v38, sel_topAnchor);
    v40 = OUTLINED_FUNCTION_20((uint64_t)v39, sel_topAnchor);
    v41 = OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_8_4();

    *(_QWORD *)(v30 + 48) = v7;
    v43 = OUTLINED_FUNCTION_4_3(v42, sel_bottomAnchor);
    v44 = OUTLINED_FUNCTION_20((uint64_t)v43, sel_bottomAnchor);
    v45 = OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_8_4();

    *(_QWORD *)(v30 + 56) = v7;
    sub_1B11BB44C();
    sub_1B119D12C();
    v46 = (void *)sub_1B11BB428();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_activateConstraints_, v46);

  }
  return v22;
}

uint64_t type metadata accessor for SGBannerContentHostingView()
{
  return objc_opt_self();
}

unint64_t sub_1B119D12C()
{
  unint64_t result;

  result = qword_1ED3818B8;
  if (!qword_1ED3818B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED3818B8);
  }
  return result;
}

void sub_1B119D188()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore] = 0;
  v1 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel;
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_13_5();
  *(_QWORD *)&v0[v1] = v2;

  sub_1B11BB560();
  __break(1u);
}

void sub_1B119D234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_BYTE *);
  void (*v6)(_BYTE *, _QWORD);
  BOOL *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(_BYTE *, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[32];

  type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_57();
  v4 = v3 - v2;
  v5 = *(uint64_t (**)(_BYTE *))(**(_QWORD **)(v0
                                                       + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel)
                                         + 104);
  swift_retain();
  v6 = (void (*)(_BYTE *, _QWORD))v5(v16);
  *v7 = !*v7;
  v6(v16, 0);
  swift_release();
  v8 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
  if (v8)
    objc_msgSend(v8, sel_hostApp);
  v9 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (v9)
  {
    v10 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
    v11 = v9;
    sub_1B11AA354(v10, v4);
    v12 = (void (*)(_BYTE *, _QWORD))sub_1B11BADC8();
    v14 = v13;
    v15 = OUTLINED_FUNCTION_35_0();
    sub_1B11833A8(v4, v14 + *(int *)(v15 + 20));
    v12(v16, 0);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1B119D39C(void *a1)
{
  _QWORD *v1;

  sub_1B119CCD4((uint64_t)a1);
  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x138))();
}

void sub_1B119D408(void *a1)
{
  id v2;

  v2 = a1;
  sub_1B119CCE0((uint64_t)a1);
}

void sub_1B119D468()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints) = 1;
}

void sub_1B119D49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;

  v1 = v0;
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v5 = (_QWORD *)(v4 - v3);
  v6 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  v7 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v8 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
  v9 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
  v10 = v9;
  swift_retain();
  v11 = v7;
  SGBannerContainerView.init(_:store:updateBannerView:)(v8, v9, v5);
  v12 = v11;
  sub_1B11BADE0();

  v13 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints) == 1)
  {
    v14 = *(void **)(v1 + v6);
    if (!v14)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    v15 = OUTLINED_FUNCTION_10_2(v14);
    if (!v15)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    v12 = v15;
    objc_msgSend(v15, sel_invalidateIntrinsicContentSize);

    *(_BYTE *)(v1 + v13) = 0;
    *(_BYTE *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds) = 0;
  }
  v16 = *(void **)(v1 + v6);
  if (!v16)
    goto LABEL_18;
  v17 = v16;
  OUTLINED_FUNCTION_15_6();

  v18 = *(void **)(v1 + v6);
  if (!v18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v19 = OUTLINED_FUNCTION_10_2(v18);
  if (v19)
  {
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED381AE0);
    if (swift_dynamicCastClass())
      OUTLINED_FUNCTION_16_3();

  }
  v21 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds) & 1) == 0)
  {
    v22 = *(void **)(v1 + v6);
    if (v22)
    {
      v23 = OUTLINED_FUNCTION_10_2(v22);
      if (v23)
      {
        v24 = v23;
        objc_msgSend(v23, sel_sizeToFit);

        *(_BYTE *)(v1 + v21) = 1;
        return;
      }
LABEL_23:
      __break(1u);
      return;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
}

double sub_1B119D684()
{
  uint64_t v0;
  _QWORD *v1;
  double (*v2)(void);
  _QWORD *v3;
  double v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double (*v11)(void);
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;

  v1 = *(_QWORD **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
  v2 = *(double (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1E0);
  v3 = v1;
  v4 = v2();

  if (v4 == 0.0)
  {
    OUTLINED_FUNCTION_14_5();
    v6 = *(uint64_t (**)(void))(v5 + 336);
    v8 = v7;
    v9 = v6();

    if (!v9)
      v4 = *(double *)sub_1B11755FC();
  }
  OUTLINED_FUNCTION_14_5();
  v11 = *(double (**)(void))(v10 + 456);
  v13 = v12;
  v14 = v11();

  v15 = v4 + v14 + *(double *)sub_1B11755B4();
  v16 = v15 + *(double *)sub_1B11755C0();
  return v16 + *(double *)sub_1B11755CC();
}

void sub_1B119D7D4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_view);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, sel_intrinsicContentSize);

      OUTLINED_FUNCTION_17_4();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id SGBannerContentHostingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void SGBannerContentHostingView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SGBannerContentHostingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGBannerContentHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SGBannerContentHostingView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGBannerContentHostingView.__allocating_init(banner:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.updateBannerViews()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.update(banner:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.setSuggestion(store:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.invalidateBannerView()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.reload()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.actionButtonLeadingEdgeOffset()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

unint64_t sub_1B119DA04(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

unint64_t sub_1B119DA14@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1B119DA04(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B119DA3C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_1B1175904(*v1);
  *a1 = result;
  return result;
}

Swift::Void __swiftcall SGContactSuggestion.contactViewController(_:didCompleteWith:)(CNContactViewController *_, CNContact_optional didCompleteWith)
{
  _QWORD *v2;
  _QWORD *v3;
  Class isa;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;

  v3 = v2;
  isa = didCompleteWith.value.super.isa;
  if (didCompleteWith.value.super.isa)
  {
    v6 = sub_1B11BA9F0();
    v7 = sub_1B11BB4AC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_4_1();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B1170000, v6, v7, "SGContactSuggestion: Contact delegate for confirming contact", v8, 2u);
      OUTLINED_FUNCTION_161();
    }

    objc_msgSend(v3, sel_confirm_suggestion_completion_, 1, *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), 0);
  }
  v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x80))();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_suggestion_actionFinished_, v3, isa != 0);
    objc_msgSend(v10, sel_dismissViewController_, _);
    swift_unknownObjectRelease();
  }
}

UIImage __swiftcall SGContactSuggestion.contactImage()()
{
  return (UIImage)objc_msgSend((id)objc_opt_self(), sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E0D19A00]);
}

void sub_1B119DC40(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _BOOL8 v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = objc_msgSend(a1, sel_emailAddresses);
  OUTLINED_FUNCTION_33((uint64_t)v1, &qword_1EEF11B30);
  v2 = sub_1B11BB440();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = OUTLINED_FUNCTION_28_0();
  v5 = OUTLINED_FUNCTION_9(v4, sel_phones);
  OUTLINED_FUNCTION_33((uint64_t)v5, &qword_1EEF11B38);
  v6 = sub_1B11BB440();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B11BB56C();
    OUTLINED_FUNCTION_96();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = OUTLINED_FUNCTION_96();
  v9 = OUTLINED_FUNCTION_9(v8, sel_postalAddresses);
  OUTLINED_FUNCTION_33((uint64_t)v9, (unint64_t *)&unk_1EEF11B40);
  v10 = OUTLINED_FUNCTION_17_5();

  if (v10 >> 62)
  {
    OUTLINED_FUNCTION_16_4();
    v11 = OUTLINED_FUNCTION_41_4();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v12 = OUTLINED_FUNCTION_121();
  v13 = OUTLINED_FUNCTION_9(v12, sel_birthday);

  v14 = v13 != 0;
  v15 = v3 + v7;
  if (__OFADD__(v3, v7))
  {
    __break(1u);
    goto LABEL_27;
  }
  v16 = __OFADD__(v15, v11);
  v17 = v15 + v11;
  if (v16)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v16 = __OFADD__(v17, v14);
  v18 = v17 + v14;
  if (!v16)
  {
    if (v18 > 1)
    {
      v19 = OUTLINED_FUNCTION_35_5();
      sub_1B1175A30(v19);
      return;
    }
    if (v3 < 1)
    {
      if (v7 < 1)
      {
        if (v11 < 1)
        {
          if (!v13)
          {
            v3 = 0xE000000000000000;
            goto LABEL_21;
          }
          v20 = 0xD000000000000030;
        }
        else
        {
          v20 = 0xD00000000000002FLL;
        }
      }
      else
      {
        v20 = 0xD000000000000033;
      }
    }
    else
    {
      v20 = 0xD00000000000002DLL;
    }
    OUTLINED_FUNCTION_59_0(v20);
    OUTLINED_FUNCTION_23_0();
LABEL_21:
    OUTLINED_FUNCTION_59_0(0xD00000000000002CLL);
    OUTLINED_FUNCTION_23_4();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v21 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v21 + 16) = xmmword_1B11BE3D0;
    *(_QWORD *)(v21 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v21 + 64) = sub_1B118A610();
    *(_QWORD *)(v21 + 32) = v13;
    *(_QWORD *)(v21 + 40) = v3;
    sub_1B11BB3A4();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_70_0();
    OUTLINED_FUNCTION_22();
    return;
  }
LABEL_28:
  __break(1u);
}

void SGContactSuggestion.confirm(_:suggestion:completion:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = objc_msgSend((id)objc_opt_self(), sel_serviceForContacts);
  v9 = (_QWORD *)OUTLINED_FUNCTION_4_0();
  v9[2] = v4;
  v9[3] = a3;
  v9[4] = a4;
  OUTLINED_FUNCTION_36_3((uint64_t)sub_1B1189BF0, MEMORY[0x1E0C809B0], 1107296256, v11, v12);
  OUTLINED_FUNCTION_45_5();
  v10 = OUTLINED_FUNCTION_40_2();
  if ((a1 & 1) != 0)
  {
    OUTLINED_FUNCTION_24_4(v10, sel_confirmContact_withCompletion_);
    swift_unknownObjectRelease();
    _Block_release(a1);
  }
  else
  {
    OUTLINED_FUNCTION_24_4(v10, sel_rejectContact_withCompletion_);
    _Block_release(a1);
    swift_unknownObjectRelease();
  }
}

void sub_1B119E118(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1B11BA90C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_1B119E164()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = currentUIContext();
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), sel_state) == 1)v2 = 0xD00000000000001ALL;
  else
    v2 = 0xD00000000000001DLL;
  if (v1)
    v3 = 0xD000000000000022;
  else
    v3 = v2;
  sub_1B1175A30(v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

id sub_1B119E21C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id result;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;

  v6 = sub_1B11BA8F4();
  v50 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_57();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11AE0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_57();
  v14 = v13 - v12;
  v15 = sub_1B11BA9A8();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_57();
  v19 = v18 - v17;
  v20 = sub_1B11BA9D8();
  v47 = *(_QWORD *)(v20 - 8);
  v48 = v20;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_57();
  v24 = v23 - v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11B50);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_57();
  v28 = v27 - v26;
  v49 = sub_1B11BA990();
  v44 = *(_QWORD *)(v49 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_57();
  v43 = v31 - v30;
  v52 = a2;
  v53 = a3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_33_4();
  v32 = OUTLINED_FUNCTION_27(32);
  v45 = v33;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v19, *MEMORY[0x1E0CB0EF8], v15);
  sub_1B11BA9B4();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
  v34 = objc_msgSend(a1, sel_birthday);
  if (!v34)
  {
    __break(1u);
    goto LABEL_10;
  }
  v35 = v34;
  v36 = objc_msgSend(v34, sel_dateComponents);

  if (!v36)
  {
LABEL_10:
    result = (id)OUTLINED_FUNCTION_37_4(v14, 1);
    goto LABEL_11;
  }
  sub_1B11BA8E8();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v14, v10, v6);
  OUTLINED_FUNCTION_37_4(v14, 0);
  result = (id)__swift_getEnumTagSinglePayload(v14, 1, v6);
  if ((_DWORD)result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  sub_1B11BA9C0();
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v24, v48);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v14, v6);
  if (__swift_getEnumTagSinglePayload(v28, 1, v49) == 1)
  {
    sub_1B119F3F0(v28);
    v38 = v45;
    result = (id)sub_1B11BB3F8();
    v39 = a4;
LABEL_8:
    *(_QWORD *)v39 = v32;
    *(_QWORD *)(v39 + 8) = v38;
    *(_QWORD *)(v39 + 16) = v52;
    *(_QWORD *)(v39 + 24) = v53;
    *(_BYTE *)(v39 + 32) = 4;
    return result;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v43, v28, v49);
  result = objc_msgSend((id)objc_opt_self(), sel_birthdayFormatter);
  if (result)
  {
    v40 = result;
    v41 = (void *)sub_1B11BA978();
    v42 = objc_msgSend(v40, sel_stringFromDate_, v41);

    sub_1B11BB3C8();
    sub_1B11BB3F8();
    OUTLINED_FUNCTION_121();
    result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v49);
    v38 = v45;
    v39 = a4;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_1B119E5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  OUTLINED_FUNCTION_28_4();
  v13 = OUTLINED_FUNCTION_29_3();
  v14 = OUTLINED_FUNCTION_20(v13, sel_emailAddresses);
  OUTLINED_FUNCTION_33((uint64_t)v14, &qword_1EEF11B30);
  v15 = OUTLINED_FUNCTION_17_5();

  if (!(v15 >> 62))
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v16)
      goto LABEL_3;
LABEL_10:
    OUTLINED_FUNCTION_28_0();
    __break(1u);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v16 = OUTLINED_FUNCTION_41_4();
  OUTLINED_FUNCTION_28_0();
  if (!v16)
    goto LABEL_10;
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
LABEL_11:
    v17 = (id)MEMORY[0x1B5E17608](0, v15);
    goto LABEL_6;
  }
  if (!*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  v17 = *(id *)(v15 + 32);
LABEL_6:
  v18 = v17;
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_27(29);
  OUTLINED_FUNCTION_23_4();
  v19 = v18;
  sub_1B119F430(v19, (SEL *)&selRef_label);
  v21 = v20;
  v22 = objc_msgSend(v19, sel_emailAddress);
  v23 = sub_1B11BB3C8();
  v25 = v24;

  if (v21)
  {
    v26 = (void *)objc_opt_self();
    v27 = (void *)sub_1B11BB398();
    OUTLINED_FUNCTION_21_4();
    v28 = objc_msgSend(v26, sel_localizedStringForLabel_, v27);

    v29 = sub_1B11BB3C8();
    v35 = v30;
    v36 = v29;

    OUTLINED_FUNCTION_52_3(OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_kStringKeyLabeledValueFormat);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v31 = v15;
    v32 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v32 + 16) = xmmword_1B11BD870;
    v33 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v32 + 56) = MEMORY[0x1E0DEA968];
    v34 = sub_1B118A610();
    *(_QWORD *)(v32 + 32) = v36;
    *(_QWORD *)(v32 + 40) = v35;
    *(_QWORD *)(v32 + 96) = v33;
    *(_QWORD *)(v32 + 104) = v34;
    *(_QWORD *)(v32 + 64) = v34;
    *(_QWORD *)(v32 + 72) = v23;
    *(_QWORD *)(v32 + 80) = v25;
    sub_1B11BB3A4();
    OUTLINED_FUNCTION_21_4();
    v15 = v31;
    swift_bridgeObjectRelease();
  }
  sub_1B11BB3F8();
  swift_bridgeObjectRelease();

  *(_QWORD *)v12 = v15;
  *(_QWORD *)(v12 + 8) = v16;
  *(_QWORD *)(v12 + 16) = a11;
  *(_QWORD *)(v12 + 24) = a12;
  *(_BYTE *)(v12 + 32) = 2;
  OUTLINED_FUNCTION_1_4();
}

void sub_1B119E814(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v5 = a2;
  swift_bridgeObjectRetain();
  v8 = objc_msgSend(a1, sel_phones);
  OUTLINED_FUNCTION_33((uint64_t)v8, &qword_1EEF11B38);
  v9 = OUTLINED_FUNCTION_17_5();

  if (!(v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_12:
    OUTLINED_FUNCTION_121();
    __break(1u);
LABEL_13:
    OUTLINED_FUNCTION_47_3();
  }
  OUTLINED_FUNCTION_16_4();
  v16 = OUTLINED_FUNCTION_41_4();
  OUTLINED_FUNCTION_121();
  if (!v16)
    goto LABEL_12;
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
    goto LABEL_13;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(id *)(v9 + 32);
    OUTLINED_FUNCTION_121();
    v11 = OUTLINED_FUNCTION_27(29);
    v13 = v12;
    v14 = objc_msgSend(v10, sel_phoneNumber);
    if (!v14)
    {
      sub_1B11BB3C8();
      v14 = (id)sub_1B11BB398();
      OUTLINED_FUNCTION_21_4();
    }
    v15 = objc_msgSend((id)objc_opt_self(), sel_formattedStringForPhone_, v14);

    if (v15)
    {
      sub_1B11BB3C8();

      sub_1B11BB3F8();
      swift_bridgeObjectRelease();

      v5 = a2;
      v4 = a3;
    }
    else
    {

    }
    *(_QWORD *)a4 = v11;
    *(_QWORD *)(a4 + 8) = v13;
    *(_QWORD *)(a4 + 16) = v5;
    *(_QWORD *)(a4 + 24) = v4;
    *(_BYTE *)(a4 + 32) = 3;
  }
  else
  {
    __break(1u);
  }
}

void sub_1B119E9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  OUTLINED_FUNCTION_28_4();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  OUTLINED_FUNCTION_29_3();
  v20 = objc_msgSend(v19, sel_postalAddresses);
  OUTLINED_FUNCTION_33((uint64_t)v20, (unint64_t *)&unk_1EEF11B40);
  v21 = sub_1B11BB440();

  if (!(v21 >> 62))
  {
    if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    OUTLINED_FUNCTION_121();
    __break(1u);
LABEL_11:
    OUTLINED_FUNCTION_47_3();
  }
  swift_bridgeObjectRetain();
  v41 = sub_1B11BB56C();
  OUTLINED_FUNCTION_121();
  if (!v41)
    goto LABEL_10;
LABEL_3:
  if ((v21 & 0xC000000000000001) != 0)
    goto LABEL_11;
  if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v22 = *(id *)(v21 + 32);
    OUTLINED_FUNCTION_121();
    v23 = v22;
    sub_1B119F430(v23, (SEL *)&selRef_label);
    v25 = v24;
    OUTLINED_FUNCTION_33_4();
    v26 = OUTLINED_FUNCTION_27(31);
    v42 = v27;
    v43 = v26;
    v28 = objc_msgSend(v13, sel_mailingAddressFromPostalAddress_, v23);
    v29 = sub_1B11BB3C8();
    v31 = v30;

    if (v25)
    {
      v32 = (void *)objc_opt_self();
      v33 = (void *)sub_1B11BB398();
      swift_bridgeObjectRelease();
      v34 = objc_msgSend(v32, sel_localizedStringForLabel_, v33);

      v35 = sub_1B11BB3C8();
      v37 = v36;

      OUTLINED_FUNCTION_52_3(OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_kStringKeyLabeledValueFormat);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
      v38 = OUTLINED_FUNCTION_4_0();
      *(_OWORD *)(v38 + 16) = xmmword_1B11BD870;
      v39 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v38 + 56) = MEMORY[0x1E0DEA968];
      v40 = sub_1B118A610();
      *(_QWORD *)(v38 + 32) = v35;
      *(_QWORD *)(v38 + 40) = v37;
      *(_QWORD *)(v38 + 96) = v39;
      *(_QWORD *)(v38 + 104) = v40;
      *(_QWORD *)(v38 + 64) = v40;
      *(_QWORD *)(v38 + 72) = v29;
      *(_QWORD *)(v38 + 80) = v31;
      sub_1B11BB3A4();
      OUTLINED_FUNCTION_28_0();
      swift_bridgeObjectRelease();
      sub_1B11BB3F8();
      OUTLINED_FUNCTION_121();

      v17 = a11;
      v15 = a12;
    }
    else
    {

      OUTLINED_FUNCTION_21_4();
    }
    *(_QWORD *)v12 = v43;
    *(_QWORD *)(v12 + 8) = v42;
    *(_QWORD *)(v12 + 16) = v17;
    *(_QWORD *)(v12 + 24) = v15;
    *(_BYTE *)(v12 + 32) = 1;
    OUTLINED_FUNCTION_1_4();
  }
  else
  {
    __break(1u);
  }
}

void sub_1B119EC40(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
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
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
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
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;

  v48 = 0;
  v49 = 0xE000000000000000;
  v3 = (id)currentUIContext();
  if (!v3)
  {
    v3 = OUTLINED_FUNCTION_20(0, sel_name);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, sel_fullName);
      v6 = OUTLINED_FUNCTION_49_3();
      v8 = v7;

      v48 = v6;
      v49 = v8;
      sub_1B11BB3F8();

    }
  }
  v9 = (unint64_t)OUTLINED_FUNCTION_20((uint64_t)v3, sel_birthday);

  if (v9)
  {
    v11 = (void *)OUTLINED_FUNCTION_50_4();
    sub_1B119E21C(v11, v12, v13, v14);
LABEL_9:
    swift_bridgeObjectRelease();
    v24 = v54;
    v25 = v52;
    v26 = v53;
    v27 = v50;
    v28 = v51;
LABEL_10:
    *(_QWORD *)a1 = v27;
    *(_QWORD *)(a1 + 8) = v28;
    *(_QWORD *)(a1 + 16) = v25;
    *(_QWORD *)(a1 + 24) = v26;
    *(_BYTE *)(a1 + 32) = v24;
    return;
  }
  v15 = OUTLINED_FUNCTION_20(v10, sel_emailAddresses);
  OUTLINED_FUNCTION_33((uint64_t)v15, &qword_1EEF11B30);
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_48_2();
  if (MEMORY[0x10])
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      OUTLINED_FUNCTION_87();
      v16 = OUTLINED_FUNCTION_30_5();
      sub_1B119E5C0(v16, v17, v18, v19, v20, v21, v22, v23, v47, v48, v49, v50);
      goto LABEL_9;
    }
    __break(1u);
    OUTLINED_FUNCTION_7_5();
    v35 = OUTLINED_FUNCTION_38_1();
    OUTLINED_FUNCTION_87();
    if (!v35)
    {
LABEL_15:
      v36 = OUTLINED_FUNCTION_87();
      v37 = OUTLINED_FUNCTION_20(v36, sel_postalAddresses);
      OUTLINED_FUNCTION_33((uint64_t)v37, (unint64_t *)&unk_1EEF11B40);
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_48_2();
      if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_16;
LABEL_19:
      OUTLINED_FUNCTION_87();
      v27 = 0;
      v24 = 0;
      v28 = 0xE000000000000000;
      v25 = v48;
      v26 = v49;
      goto LABEL_10;
    }
  }
  else
  {
    v29 = OUTLINED_FUNCTION_87();
    v30 = OUTLINED_FUNCTION_20(v29, sel_phones);
    OUTLINED_FUNCTION_33((uint64_t)v30, &qword_1EEF11B38);
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_48_2();
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_15;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    OUTLINED_FUNCTION_87();
    v31 = (void *)OUTLINED_FUNCTION_50_4();
    sub_1B119E814(v31, v32, v33, v34);
    goto LABEL_9;
  }
  __break(1u);
  OUTLINED_FUNCTION_7_5();
  v46 = OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_87();
  if (!v46)
    goto LABEL_19;
LABEL_16:
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    OUTLINED_FUNCTION_87();
    v38 = OUTLINED_FUNCTION_30_5();
    sub_1B119E9D4(v38, v39, v40, v41, v42, v43, v44, v45, v47, v48, v49, v50);
    goto LABEL_9;
  }
  __break(1u);
}

void sub_1B119EF08(char a1)
{
  __asm { BR              X9 }
}

id sub_1B119EF30()
{
  uint64_t v0;

  OUTLINED_FUNCTION_33_4();
  return sub_1B1175A30(v0);
}

void SGContactSuggestion.mailingAddressFromPostalAddress(_:)(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  v1 = a1;
  sub_1B119F430(objc_msgSend(a1, sel_components), (SEL *)&selRef_street);
  v3 = v2;
  swift_bridgeObjectRelease();
  if (v3)
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97378]), sel_init);
    v5 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v5, (SEL *)&selRef_street);
    if (v6)
    {
      v7 = (void *)OUTLINED_FUNCTION_10_3();
      v8 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v8, sel_setStreet_);

    }
    v9 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v9, (SEL *)&selRef_city);
    if (v10)
    {
      v11 = (void *)OUTLINED_FUNCTION_10_3();
      v12 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v12, sel_setCity_);

    }
    v13 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v13, (SEL *)&selRef_state);
    if (v14)
    {
      v15 = (void *)OUTLINED_FUNCTION_10_3();
      v16 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v16, sel_setState_);

    }
    v17 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v17, (SEL *)&selRef_postalCode);
    if (v18)
    {
      v19 = (void *)OUTLINED_FUNCTION_10_3();
      v20 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v20, sel_setPostalCode_);

    }
    v21 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v21, (SEL *)&selRef_subLocality);
    if (v22)
    {
      v23 = (void *)OUTLINED_FUNCTION_10_3();
      v24 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v24, sel_setSubLocality_);

    }
    v25 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v25, (SEL *)&selRef_subAdministrativeArea);
    if (v26)
    {
      v27 = (void *)OUTLINED_FUNCTION_10_3();
      v28 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_4_4(v28, sel_setSubAdministrativeArea_);

    }
    v29 = OUTLINED_FUNCTION_2_2();
    sub_1B119F430(v29, (SEL *)&selRef_isoCountryCode);
    if (v30)
    {
      v1 = v30;
      v31 = (void *)sub_1B11BB398();
      OUTLINED_FUNCTION_87();
      objc_msgSend(v4, sel_setISOCountryCode_, v31);

    }
    v32 = objc_msgSend((id)objc_opt_self(), sel_stringFromPostalAddress_style_, v4, 0);
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_23_4();

  }
  else
  {
    v33 = objc_msgSend(v1, sel_address);
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_23_4();
  }

  OUTLINED_FUNCTION_22();
}

void sub_1B119F250(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B119F27C(a1, (int)"Error: rejectContact failed: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

uint64_t sub_1B119F25C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_1B119F270(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B119F27C(a1, (int)"Error: confirmContact failed: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_1B119F27C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *format, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;

  OUTLINED_FUNCTION_28_4();
  a23 = v25;
  a24 = v27;
  v29 = v28;
  v30 = *(void (**)(uint64_t))(v24 + 24);
  if (!v28)
  {
    if (!v30)
      goto LABEL_6;
LABEL_5:
    swift_retain();
    v30(v29);
    sub_1B119F7D0((uint64_t)v30);
    goto LABEL_6;
  }
  v31 = v26;
  OUTLINED_FUNCTION_42_3();
  OUTLINED_FUNCTION_42_3();
  v32 = sub_1B11BA9F0();
  v33 = sub_1B11BB494();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_4_1();
    a12 = OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v34 = 136315138;
    OUTLINED_FUNCTION_42_3();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11B20);
    v35 = sub_1B11BB3D4();
    sub_1B117C4E0(v35, v36, &a12);
    sub_1B11BB4E8();
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_19_0();
    _os_log_impl(&dword_1B1170000, v32, v33, v31, v34, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_161();
  }

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_19_0();
  if (v30)
    goto LABEL_5;
LABEL_6:
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_1B119F3F0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11B50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B119F430(void *a1, SEL *a2)
{
  id v3;

  v3 = objc_msgSend(a1, *a2);

  if (v3)
  {
    sub_1B11BB3C8();

  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_1B119F494()
{
  unint64_t result;

  result = qword_1EEF11B58;
  if (!qword_1EEF11B58)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF010, &type metadata for SGContactCategoryType);
    atomic_store(result, (unint64_t *)&qword_1EEF11B58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SGContactCategoryType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SGContactCategoryType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B119F5A4 + 4 * byte_1B11BF00A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B119F5D8 + 4 * byte_1B11BF005[v4]))();
}

uint64_t sub_1B119F5D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B119F5E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B119F5E8);
  return result;
}

uint64_t sub_1B119F5F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B119F5FCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B119F600(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B119F608(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SGContactCategoryType()
{
  return &type metadata for SGContactCategoryType;
}

uint64_t destroy for SGContactCategory()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for SGContactCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_41();
}

uint64_t assignWithCopy for SGContactCategory(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28_0();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28_0();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

void assignWithTake for SGContactCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  OUTLINED_FUNCTION_41();
}

uint64_t getEnumTagSinglePayload for SGContactCategory(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for SGContactCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SGContactCategory()
{
  return &type metadata for SGContactCategory;
}

uint64_t sub_1B119F7D0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1B119F7E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1B119F804(uint64_t a1)
{
  uint64_t v1;

  sub_1B119E118(a1, *(_QWORD *)(v1 + 16));
}

void sub_1B119F814()
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
  uint64_t (*v44)(uint64_t, _QWORD);
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t KeyPath;
  uint64_t (*v54)(uint64_t, _QWORD);
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
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

  OUTLINED_FUNCTION_24();
  v3 = v2;
  v78 = v4;
  v83 = v5;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381540);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_42_4(v7, v62);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381198);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_5_0();
  v69 = v9;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381218);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_43_4(v11, v62);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810D8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_17_0();
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381140);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_57();
  v16 = v15 - v14;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381170);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_122();
  v20 = v18 - v19;
  MEMORY[0x1E0C80A78](v21);
  v65 = (uint64_t)&v62 - v22;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_5_0();
  v81 = v24;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_5_0();
  v76 = v26;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381618);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_41_5(v28, v62);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381640);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_44_4(v30, v62);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381258);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_17_6(v32, v62);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381530);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381570);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_57();
  v37 = v36 - v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3815A0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1E0C80A78](v40);
  switch(v3)
  {
    case 0:
      OUTLINED_FUNCTION_56_2();
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_3_3(v41);
      OUTLINED_FUNCTION_68_2();
      sub_1B118F620();
      swift_getKeyPath();
      OUTLINED_FUNCTION_18_4();
      OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_94(v37, v1);
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_94(v3, v73);
      goto LABEL_8;
    case 1:
      OUTLINED_FUNCTION_56_2();
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_3_3(v48);
      OUTLINED_FUNCTION_68_2();
      sub_1B118F674();
      swift_getKeyPath();
      OUTLINED_FUNCTION_18_4();
      OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_94(v37, v1);
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_94(v3, v73);
      goto LABEL_8;
    case 2:
      OUTLINED_FUNCTION_56_2();
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_3_3(v49);
      OUTLINED_FUNCTION_68_2();
      sub_1B118F81C();
      swift_getKeyPath();
      OUTLINED_FUNCTION_18_4();
      OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_94(v37, v1);
      *(_QWORD *)(v1 + *(int *)(v38 + 36)) = 0x3FE0000000000000;
      OUTLINED_FUNCTION_20_4(v37);
      OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_94(v3, v73);
      goto LABEL_8;
    case 3:
      OUTLINED_FUNCTION_56_2();
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_3_3(v50);
      OUTLINED_FUNCTION_68_2();
      sub_1B118F740();
      swift_getKeyPath();
      OUTLINED_FUNCTION_18_4();
      OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_34_3();
      OUTLINED_FUNCTION_94(v37, v1);
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_94(v3, v73);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      sub_1B11A2114((uint64_t)&unk_1ED381598);
      OUTLINED_FUNCTION_21_5();
      OUTLINED_FUNCTION_21(v37, v76);
      swift_storeEnumTagMultiPayload();
      sub_1B11A1C8C();
      v47 = v77;
      sub_1B11BAE88();
      OUTLINED_FUNCTION_13(v37);
      OUTLINED_FUNCTION_21(v47, v81);
      goto LABEL_9;
    case 4:
      v52 = sub_1B11BB194();
      KeyPath = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_12_2(v0, v54);
      v55 = (uint64_t *)(v0 + *(int *)(v63 + 36));
      *v55 = KeyPath;
      v55[1] = v52;
      v56 = *(_QWORD *)sub_1B118F740();
      v57 = swift_getKeyPath();
      sub_1B117F254(v0, v16, &qword_1ED3810D8);
      v58 = (uint64_t *)(v16 + *(int *)(v64 + 36));
      *v58 = v57;
      v58[1] = v56;
      swift_retain();
      sub_1B119CA7C(v0, &qword_1ED3810D8);
      OUTLINED_FUNCTION_21(v16, v20);
      *(_QWORD *)(v20 + *(int *)(v67 + 36)) = 0x3FF0000000000000;
      OUTLINED_FUNCTION_13(v16);
      v59 = v20;
      v60 = v65;
      OUTLINED_FUNCTION_31_6(v59, v65);
      OUTLINED_FUNCTION_94(v60, v69);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1A98();
      sub_1B11A1BD4();
      v61 = v71;
      OUTLINED_FUNCTION_72_0();
      OUTLINED_FUNCTION_21(v61, v81);
      OUTLINED_FUNCTION_54();
      sub_1B11A1C70();
      sub_1B11A1E28();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13(v61);
      v51 = v60;
      goto LABEL_10;
    default:
      v42 = *(_QWORD *)sub_1B118F674();
      v43 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381670);
      OUTLINED_FUNCTION_113();
      v3 = v66;
      OUTLINED_FUNCTION_12_2(v66, v44);
      v45 = v69;
      v46 = (uint64_t *)(v3 + *(int *)(v70 + 36));
      *v46 = v43;
      v46[1] = v42;
      OUTLINED_FUNCTION_94(v3, v45);
      OUTLINED_FUNCTION_54();
      sub_1B11A1A98();
      sub_1B11A1BD4();
      swift_retain();
      v47 = v71;
      OUTLINED_FUNCTION_49_4();
      OUTLINED_FUNCTION_21(v47, v81);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      sub_1B11A1C70();
      sub_1B11A1E28();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13(v47);
      v51 = v3;
LABEL_10:
      OUTLINED_FUNCTION_20_4(v51);
      OUTLINED_FUNCTION_15();
      return;
  }
}

void sub_1B11A003C()
{
  sub_1B119F814();
}

void sub_1B11A0044()
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
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t KeyPath;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, _QWORD);
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
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
  uint64_t v96;

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v91 = v5;
  v96 = v6;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_5_0();
  v79 = v8;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_42_4(v10, v74);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BD0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_122();
  v77 = v12 - v13;
  MEMORY[0x1E0C80A78](v14);
  v80 = (uint64_t)&v74 - v15;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BD8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_43_4(v17, v74);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_41_5(v19, v74);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BE8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_47();
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_122();
  v25 = v23 - v24;
  MEMORY[0x1E0C80A78](v26);
  v76 = (uint64_t)&v74 - v27;
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11BF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_5_0();
  v95 = v29;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_44_4(v31, v74);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_57();
  v35 = v34 - v33;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_38_0();
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C18);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_17_6(v38, v74);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C20);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_184();
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v42);
  v44 = (char *)&v74 - v43;
  switch(v45)
  {
    case 0:
    case 1:
      v46 = *(_QWORD *)sub_1B118F674();
      KeyPath = swift_getKeyPath();
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C30);
      OUTLINED_FUNCTION_12_2(v2, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v48 - 8) + 16));
      v49 = (uint64_t *)(v2 + *(int *)(v92 + 36));
      *v49 = KeyPath;
      v49[1] = v46;
      swift_retain();
      LODWORD(v46) = sub_1B11BAEE8();
      v50 = OUTLINED_FUNCTION_63_2();
      sub_1B117F254(v50, v51, &qword_1EEF11C20);
      *(_DWORD *)(v4 + *(int *)(v40 + 36)) = v46;
      sub_1B119CA7C(v2, &qword_1EEF11C20);
      sub_1B11A2618(v4, (uint64_t)v44, &qword_1EEF11C28);
      sub_1B117F254((uint64_t)v44, v35, &qword_1EEF11C28);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1E94();
      sub_1B11A1F18();
      sub_1B11BAE88();
      OUTLINED_FUNCTION_21(v0, v88);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1E70();
      sub_1B11A1FB4();
      v52 = v90;
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13(v0);
      OUTLINED_FUNCTION_21(v52, v95);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1E4C();
      OUTLINED_FUNCTION_67_3();
      sub_1B11BAE88();
      OUTLINED_FUNCTION_13(v52);
      v53 = (uint64_t)v44;
      v54 = &qword_1EEF11C28;
      break;
    case 2:
      v59 = *sub_1B118F81C();
      v60 = swift_getKeyPath();
      v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C30);
      OUTLINED_FUNCTION_12_2(v2, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v61 - 8) + 16));
      v62 = (uint64_t *)(v2 + *(int *)(v92 + 36));
      *v62 = v60;
      v62[1] = v59;
      v63 = &qword_1EEF11C20;
      OUTLINED_FUNCTION_94(v2, v35);
      OUTLINED_FUNCTION_54();
      sub_1B11A1E94();
      sub_1B11A1F18();
      swift_retain();
      sub_1B11BAE88();
      OUTLINED_FUNCTION_21(v0, v88);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_72_3();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13(v0);
      OUTLINED_FUNCTION_21(v59, v95);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1E4C();
      OUTLINED_FUNCTION_67_3();
      sub_1B11BAE88();
      OUTLINED_FUNCTION_13(v59);
      v53 = v2;
      goto LABEL_8;
    case 3:
      v64 = sub_1B11BAEF4();
      v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C30);
      OUTLINED_FUNCTION_3_3(v65);
      *(_DWORD *)(v1 + *(int *)(v20 + 36)) = v64;
      sub_1B118F81C();
      swift_getKeyPath();
      sub_1B117F254(v1, v25, &qword_1EEF11BE8);
      OUTLINED_FUNCTION_11_4((_QWORD *)(v25 + *(int *)(v81 + 36)));
      OUTLINED_FUNCTION_65_2(v1);
      v63 = &qword_1EEF11BF0;
      v66 = v76;
      OUTLINED_FUNCTION_31_6(v25, v76);
      OUTLINED_FUNCTION_94(v66, v83);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1FD8();
      sub_1B11A20F8();
      v67 = v85;
      goto LABEL_7;
    case 4:
      v68 = sub_1B11BB194();
      v69 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C30);
      OUTLINED_FUNCTION_113();
      v70 = v79;
      OUTLINED_FUNCTION_12_2(v79, v71);
      v72 = (uint64_t *)(v70 + *(int *)(v74 + 36));
      *v72 = v69;
      v72[1] = v68;
      sub_1B118F81C();
      swift_getKeyPath();
      v44 = v78;
      OUTLINED_FUNCTION_62_3(v70);
      OUTLINED_FUNCTION_11_4(&v44[*(int *)(v75 + 36)]);
      OUTLINED_FUNCTION_65_2(v70);
      v73 = v77;
      OUTLINED_FUNCTION_94((uint64_t)v44, v77);
      *(_QWORD *)(v73 + *(int *)(v84 + 36)) = 0x3FE0000000000000;
      OUTLINED_FUNCTION_20_4((uint64_t)v44);
      v63 = &qword_1EEF11BD0;
      v66 = v80;
      OUTLINED_FUNCTION_31_6(v73, v80);
      OUTLINED_FUNCTION_94(v66, v83);
      OUTLINED_FUNCTION_54();
      sub_1B11A1FD8();
      sub_1B11A20F8();
      v67 = v85;
LABEL_7:
      OUTLINED_FUNCTION_72_0();
      OUTLINED_FUNCTION_21(v67, v88);
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_72_3();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13(v67);
      OUTLINED_FUNCTION_21((uint64_t)v44, v95);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A1E4C();
      sub_1B11A1F18();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_13((uint64_t)v44);
      v53 = v66;
LABEL_8:
      v54 = v63;
      break;
    default:
      v55 = *(_QWORD *)sub_1B118F674();
      v56 = swift_getKeyPath();
      v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C30);
      OUTLINED_FUNCTION_12_2(v2, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v57 - 8) + 16));
      v58 = (uint64_t *)(v2 + *(int *)(v92 + 36));
      *v58 = v56;
      v58[1] = v55;
      OUTLINED_FUNCTION_21(v2, v95);
      OUTLINED_FUNCTION_54();
      sub_1B11A1E4C();
      sub_1B11A1F18();
      swift_retain();
      OUTLINED_FUNCTION_49_4();
      v53 = v2;
      v54 = &qword_1EEF11C20;
      break;
  }
  sub_1B119CA7C(v53, v54);
  OUTLINED_FUNCTION_15();
}

void sub_1B11A08CC()
{
  sub_1B11A0044();
}

void sub_1B11A08D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_24();
  v17 = v3;
  v19 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D48);
  v20 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_5_0();
  v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_184();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380C78);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_17_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380D18);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_36();
  v12 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v13 = objc_msgSend(v12, sel_userInterfaceIdiom);

  if (v13 == (id)6)
  {
    if ((v17 & 1) != 0)
      sub_1B11BB1AC();
    else
      sub_1B11BB194();
    v14 = OUTLINED_FUNCTION_38_3();
    *(_QWORD *)(v2 + *(int *)(v9 + 36)) = v12;
    OUTLINED_FUNCTION_73_2(v14, v15, &qword_1ED380C78);
    OUTLINED_FUNCTION_63_2();
    swift_storeEnumTagMultiPayload();
    sub_1B11A22BC();
    sub_1B11BAE88();
    sub_1B119CA7C(v2, &qword_1ED380C78);
    OUTLINED_FUNCTION_21(v0, v1);
    OUTLINED_FUNCTION_42_0();
    sub_1B11A227C((uint64_t)&unk_1ED380D10);
    sub_1B11A2D6C((uint64_t)&unk_1ED380D40);
    OUTLINED_FUNCTION_47_4();
    sub_1B11BAE88();
    OUTLINED_FUNCTION_13(v0);
  }
  else
  {
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v16(v18, v19, v5);
    v16(v1, v18, v5);
    OUTLINED_FUNCTION_54();
    sub_1B11A227C((uint64_t)&unk_1ED380D10);
    sub_1B11A2D6C((uint64_t)&unk_1ED380D40);
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_72_0();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v5);
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B11A0B9C()
{
  sub_1B11A08D4();
}

void sub_1B11A0BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[3];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_24();
  v33 = v6;
  v34 = v5;
  v30 = v7;
  v31 = v8;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811A0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_36();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381278);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_102();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381178);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_47();
  sub_1B11BB2D8();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_103_0();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v29 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3811D8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_54_3();
  if (v34 == 3)
  {
    v29[0] = (uint64_t)v19;
    v29[1] = v21;
    v29[2] = v12;
    v34 = v15;
    v23 = v31;
    v24 = v22;
    if ((v30 & 1) != 0)
    {
      v25 = *MEMORY[0x1E0CDB0C0];
      v26 = sub_1B11BAD2C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v2, v25, v26);
      v27 = v0 + *(int *)(v34 + 36);
      sub_1B11A2478(v2, v27);
      *(_WORD *)(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810A0) + 36)) = 256;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v0, v23, v10);
      sub_1B11A24BC(v2);
      v28 = v29[0];
      sub_1B11A2618(v0, v29[0], &qword_1ED3810C8);
      sub_1B117F254(v28, v3, &qword_1ED3810C8);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A23DC();
      sub_1B11A2D6C((uint64_t)&unk_1ED381270);
      OUTLINED_FUNCTION_30_6();
      sub_1B119CA7C(v28, &qword_1ED3810C8);
    }
    else
    {
      OUTLINED_FUNCTION_55_3(v4, v31);
      OUTLINED_FUNCTION_55_3(v3, v4);
      OUTLINED_FUNCTION_54();
      sub_1B11A23DC();
      sub_1B11A2D6C((uint64_t)&unk_1ED381270);
      OUTLINED_FUNCTION_30_6();
      OUTLINED_FUNCTION_60_3();
    }
    OUTLINED_FUNCTION_94(v24, v1);
    OUTLINED_FUNCTION_42_0();
    sub_1B11A2358();
    sub_1B11A2D6C((uint64_t)&unk_1ED381270);
    sub_1B11BAE88();
    OUTLINED_FUNCTION_20_4(v24);
  }
  else
  {
    OUTLINED_FUNCTION_55_3(v4, v31);
    OUTLINED_FUNCTION_55_3(v1, v4);
    OUTLINED_FUNCTION_54();
    sub_1B11A2358();
    sub_1B11A2D6C((uint64_t)&unk_1ED381270);
    OUTLINED_FUNCTION_39_4();
    OUTLINED_FUNCTION_60_3();
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B11A0EFC()
{
  sub_1B11A0BA4();
}

void sub_1B11A0F08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  OUTLINED_FUNCTION_24();
  v37 = v5;
  v38 = v6;
  v36 = v7;
  v40 = v8;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C90);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_38_0();
  sub_1B11BB2D8();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_17_0();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11C98);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v31 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11CA0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_103_0();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11CA8);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_102();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11CB0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_54_3();
  if (v38 == 3)
  {
    v32 = v0;
    v33 = v16;
    v34 = v22;
    v35 = v11;
    v31 = v21;
    v38 = v1;
    if ((v36 & 1) != 0)
    {
      v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
      v23(v2, v37, v18);
      v23(v32, v2, v18);
      OUTLINED_FUNCTION_42_0();
      sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
      sub_1B11A257C();
      v24 = v34;
      OUTLINED_FUNCTION_39_4();
      OUTLINED_FUNCTION_50_5();
    }
    else
    {
      v26 = *MEMORY[0x1E0CDB0C0];
      v27 = sub_1B11BAD2C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v3, v26, v27);
      v28 = v4 + *(int *)(v35 + 36);
      sub_1B11A2478(v3, v28);
      *(_WORD *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED3810A0) + 36)) = 256;
      v29 = OUTLINED_FUNCTION_63_2();
      v30(v29);
      sub_1B11A24BC(v3);
      sub_1B11A2618(v4, (uint64_t)v15, &qword_1EEF11C98);
      OUTLINED_FUNCTION_62_3((uint64_t)v15);
      OUTLINED_FUNCTION_54();
      sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
      sub_1B11A257C();
      v24 = v34;
      OUTLINED_FUNCTION_39_4();
      OUTLINED_FUNCTION_65_2((uint64_t)v15);
    }
    OUTLINED_FUNCTION_94(v24, v38);
    OUTLINED_FUNCTION_42_0();
    sub_1B11A24F8();
    sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
    OUTLINED_FUNCTION_138();
    OUTLINED_FUNCTION_20_4(v24);
  }
  else
  {
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v25(v2, v37, v18);
    v25(v1, v2, v18);
    OUTLINED_FUNCTION_54();
    sub_1B11A24F8();
    sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
    OUTLINED_FUNCTION_39_4();
    OUTLINED_FUNCTION_50_5();
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B11A1294()
{
  sub_1B11A0F08();
}

void sub_1B11A12A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v20;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  OUTLINED_FUNCTION_24();
  v4 = v3;
  v40 = v5;
  v46 = v6;
  v44 = sub_1B11BAD5C();
  v38 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_184();
  v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED380E20);
  v39 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v37 - v8;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380DC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_17_6(v11, v37);
  v12 = sub_1B11BAF0C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_36();
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380E18);
  v14 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_122();
  v17 = v15 - v16;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v37 - v19;
  if ((v4 & 1) != 0)
  {
    sub_1B11BAF00();
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380DE0);
    sub_1B11A2D6C((uint64_t)&unk_1ED380DD8);
    v23 = v22;
    sub_1B117CB38((uint64_t)&unk_1ED380DE8);
    v25 = v24;
    sub_1B11BB0E0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v12);
    v26 = v17;
    v27 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(v20, v26, v42);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v43, v20, v27);
    OUTLINED_FUNCTION_42_0();
    v47 = v21;
    v48 = v12;
    v49 = v23;
    v50 = v25;
    OUTLINED_FUNCTION_2_0();
    sub_1B117CB38((uint64_t)&unk_1ED380DA8);
    v47 = v21;
    v48 = v44;
    v49 = v23;
    v50 = v28;
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_138();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v27);
  }
  else
  {
    sub_1B11BAD50();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380DE0);
    sub_1B11A2D6C((uint64_t)&unk_1ED380DD8);
    v31 = v30;
    sub_1B117CB38((uint64_t)&unk_1ED380DA8);
    v37 = v32;
    v33 = v44;
    sub_1B11BB0E0();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v2, v33);
    v34 = v39;
    v35 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v9, v0, v45);
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v43, v9, v35);
    OUTLINED_FUNCTION_54();
    sub_1B117CB38((uint64_t)&unk_1ED380DE8);
    v47 = v29;
    v48 = v12;
    v49 = v31;
    v50 = v36;
    OUTLINED_FUNCTION_2_0();
    v47 = v29;
    v48 = v33;
    v49 = v31;
    v50 = v37;
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_72_0();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B11A166C()
{
  sub_1B11A12A0();
}

uint64_t sub_1B11A1674@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t KeyPath;
  void (*v7)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11CD0);
  OUTLINED_FUNCTION_113();
  v7(a3, a1);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11CD8);
  v9 = a3 + *(int *)(result + 36);
  v10 = 3;
  if ((a2 & 1) != 0)
    v10 = 1;
  *(_QWORD *)v9 = KeyPath;
  *(_QWORD *)(v9 + 8) = v10;
  *(_BYTE *)(v9 + 16) = 0;
  return result;
}

uint64_t sub_1B11A16F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;

  return sub_1B11A1674(a1, *v2, a2);
}

void *sub_1B11A16FC@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  double v6;
  char v7;
  double v8;
  char v9;
  double v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  _BYTE __src[112];

  sub_1B11BB344();
  if ((a1 & 1) != 0)
  {
    v4 = OUTLINED_FUNCTION_33_5();
    return sub_1B11A17B8(*(double *)&v4, v5, v6, v7, v8, v9, v10, v11, v12, 0.0, 1, INFINITY, 0);
  }
  else
  {
    OUTLINED_FUNCTION_33_5();
    sub_1B11BAC24();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381750);
    OUTLINED_FUNCTION_19_2(v14);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816D8);
    return memcpy((void *)(a2 + *(int *)(v15 + 36)), __src, 0x70uLL);
  }
}

void *sub_1B11A17B8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE __src[112];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B11BB4A0();
    v23 = (void *)sub_1B11BAF90();
    sub_1B11BA9E4();

  }
  sub_1B11BAC24();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a9, v13, v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED3816D8);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void *sub_1B11A1964@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return sub_1B11A16FC(*v1, a1);
}

void sub_1B11A196C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a1;
  MEMORY[0x1B5E17224](&v3, a2, &unk_1E62D6178, a3);
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A1998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a1;
  MEMORY[0x1B5E17224](&v3, a2, &unk_1E62D61A0, a3);
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A19C4(uint64_t a1)
{
  OUTLINED_FUNCTION_64_2(a1);
  OUTLINED_FUNCTION_48_3();
}

void sub_1B11A19E0()
{
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A19E8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B11A1A00(a1, a2, a3, a4, (uint64_t)&unk_1E62D62A0);
}

void sub_1B11A19F4(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B11A1A00(a1, a2, a3, a4, (uint64_t)&unk_1E62D6320);
}

void sub_1B11A1A00(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BYTE v5[8];
  uint64_t v6;

  v5[0] = a1;
  v6 = a2;
  MEMORY[0x1B5E17224](v5, a3, a5);
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A1A2C(uint64_t a1)
{
  OUTLINED_FUNCTION_64_2(a1);
  OUTLINED_FUNCTION_48_3();
}

void sub_1B11A1A48()
{
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A1A50(uint64_t a1)
{
  OUTLINED_FUNCTION_64_2(a1);
  OUTLINED_FUNCTION_48_3();
}

void sub_1B11A1A6C()
{
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A1A74(uint64_t a1)
{
  OUTLINED_FUNCTION_64_2(a1);
  OUTLINED_FUNCTION_48_3();
}

void sub_1B11A1A90()
{
  OUTLINED_FUNCTION_32_5();
}

void sub_1B11A1A98()
{
  sub_1B11A2114((uint64_t)&unk_1ED381168);
}

unint64_t sub_1B11A1AB4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED381138;
  if (!qword_1ED381138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381140);
    v2 = sub_1B11A1B38();
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED381138);
  }
  return result;
}

unint64_t sub_1B11A1B38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED3810D0;
  if (!qword_1ED3810D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3810D8);
    sub_1B11A2D6C((uint64_t)&unk_1ED381668);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381298);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED3810D0);
  }
  return result;
}

unint64_t sub_1B11A1BD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED381538;
  if (!qword_1ED381538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381540);
    sub_1B11A2D6C((uint64_t)&unk_1ED381668);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED381538);
  }
  return result;
}

void sub_1B11A1C70()
{
  sub_1B11A227C((uint64_t)&unk_1ED381250);
}

unint64_t sub_1B11A1C8C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED381638;
  if (!qword_1ED381638)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381640);
    sub_1B11A2114((uint64_t)&unk_1ED381598);
    v3[0] = v2;
    v3[1] = v2;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED381638);
  }
  return result;
}

unint64_t sub_1B11A1D08()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED381568;
  if (!qword_1ED381568)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381570);
    v2 = sub_1B11A1D8C();
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED381568);
  }
  return result;
}

unint64_t sub_1B11A1D8C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED381528;
  if (!qword_1ED381528)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381530);
    sub_1B11A2D6C((uint64_t)&unk_1ED381668);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381758);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED381528);
  }
  return result;
}

void sub_1B11A1E28()
{
  sub_1B11A28D0((uint64_t)&unk_1ED381210);
}

void sub_1B11A1E4C()
{
  sub_1B11A28D0((uint64_t)&unk_1EEF11C38);
}

void sub_1B11A1E70()
{
  sub_1B11A28D0((uint64_t)&unk_1EEF11C40);
}

unint64_t sub_1B11A1E94()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11C48;
  if (!qword_1EEF11C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11C28);
    v2 = sub_1B11A1F18();
    sub_1B11A2D6C((uint64_t)&unk_1ED381758);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11C48);
  }
  return result;
}

unint64_t sub_1B11A1F18()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11C50;
  if (!qword_1EEF11C50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11C20);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11C58);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11C50);
  }
  return result;
}

void sub_1B11A1FB4()
{
  sub_1B11A28D0((uint64_t)&unk_1EEF11C60);
}

unint64_t sub_1B11A1FD8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11C68;
  if (!qword_1EEF11C68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11BF0);
    v2 = sub_1B11A205C();
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11C68);
  }
  return result;
}

unint64_t sub_1B11A205C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11C70;
  if (!qword_1EEF11C70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11BE8);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11C58);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381758);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11C70);
  }
  return result;
}

void sub_1B11A20F8()
{
  sub_1B11A2114((uint64_t)&unk_1EEF11C78);
}

void sub_1B11A2114(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_248(0, v1);
    OUTLINED_FUNCTION_70_2();
    OUTLINED_FUNCTION_71();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B11A215C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11C80;
  if (!qword_1EEF11C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11BC8);
    v2 = sub_1B11A21E0();
    sub_1B11A2D6C((uint64_t)&unk_1ED381768);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11C80);
  }
  return result;
}

unint64_t sub_1B11A21E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11C88;
  if (!qword_1EEF11C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11BC0);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11C58);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381298);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11C88);
  }
  return result;
}

void sub_1B11A227C(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_248(0, v1);
    OUTLINED_FUNCTION_70_2();
    OUTLINED_FUNCTION_71();
  }
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B11A22BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED380C70;
  if (!qword_1ED380C70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380C78);
    sub_1B11A2D6C((uint64_t)&unk_1ED380D40);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED380D50);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED380C70);
  }
  return result;
}

unint64_t sub_1B11A2358()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED3811D0;
  if (!qword_1ED3811D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3811D8);
    v2 = sub_1B11A23DC();
    sub_1B11A2D6C((uint64_t)&unk_1ED381270);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED3811D0);
  }
  return result;
}

unint64_t sub_1B11A23DC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED3810C0;
  if (!qword_1ED3810C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3810C8);
    sub_1B11A2D6C((uint64_t)&unk_1ED381270);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381098);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED3810C0);
  }
  return result;
}

uint64_t sub_1B11A2478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B11BB2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B11A24BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B11BB2D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B11A24F8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11CB8;
  if (!qword_1EEF11CB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11CB0);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
    v3[0] = v2;
    v3[1] = sub_1B11A257C();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11CB8);
  }
  return result;
}

unint64_t sub_1B11A257C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11CC8;
  if (!qword_1EEF11CC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11C98);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381098);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11CC8);
  }
  return result;
}

void sub_1B11A2618(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_84(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A264C()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A2658()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A2664()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A2670()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A267C()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A2688()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A2694()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A26A0()
{
  return OUTLINED_FUNCTION_2_0();
}

void type metadata accessor for TitleFontStyleModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for SubtitleFontStyleModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for PlatformActionButtonForegroundColor()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for BannerShapeModifier()
{
  OUTLINED_FUNCTION_29();
}

_BYTE *sub_1B11A26E8(_BYTE *result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *((_QWORD *)result + 1) = 0;
    if (a3 >= 0xFF)
      result[16] = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      result[16] = 0;
    if (a2)
      return OUTLINED_FUNCTION_66_1(result, a2);
  }
  return result;
}

void type metadata accessor for IconShapeModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for ButtonStyleModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for LineLimitModifier()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B11A2744(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_1B11A27DC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B11A2828 + 4 * byte_1B11BF124[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B11A285C + 4 * byte_1B11BF11F[v4]))();
}

uint64_t sub_1B11A285C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11A2864(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B11A286CLL);
  return result;
}

_BYTE *sub_1B11A2870(_BYTE *result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B11A2878);
  return OUTLINED_FUNCTION_66_1(result, a2);
}

uint64_t sub_1B11A287C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11A2884(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for FrameParameterModifier()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B11A289C()
{
  sub_1B11A28D0((uint64_t)&unk_1ED381260);
}

void sub_1B11A28D0(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  void (*v3)(void);
  void (*v4)(void);
  uint64_t v5;
  _QWORD v6[2];

  if (!OUTLINED_FUNCTION_77(a1))
  {
    v4 = v3;
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    v4();
    v6[0] = v4;
    v6[1] = OUTLINED_FUNCTION_70_2();
    atomic_store(MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v5, v6), v1);
  }
  OUTLINED_FUNCTION_45_0();
}

void sub_1B11A292C()
{
  sub_1B11A28D0((uint64_t)&unk_1EEF11CE0);
}

unint64_t sub_1B11A2964()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1ED380D30;
  if (!qword_1ED380D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380D38);
    sub_1B11A227C((uint64_t)&unk_1ED380D10);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED380D40);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1ED380D30);
  }
  return result;
}

unint64_t sub_1B11A2A04()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1ED381220;
  if (!qword_1ED381220)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED381228);
    v2 = sub_1B11A2358();
    sub_1B11A2D6C((uint64_t)&unk_1ED381270);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1ED381220);
  }
  return result;
}

unint64_t sub_1B11A2A8C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11CF0;
  if (!qword_1EEF11CF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11CF8);
    v2 = sub_1B11A24F8();
    sub_1B11A2D6C((uint64_t)&unk_1EEF11CC0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11CF0);
  }
  return result;
}

unint64_t sub_1B11A2B14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  result = qword_1ED380DC8;
  if (!qword_1ED380DC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380DD0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED380DE0);
    sub_1B11BAF0C();
    sub_1B11A2D6C((uint64_t)&unk_1ED380DD8);
    v4 = v3;
    sub_1B117CB38((uint64_t)&unk_1ED380DE8);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v6 = sub_1B11BAD5C();
    sub_1B117CB38((uint64_t)&unk_1ED380DA8);
    v8[2] = v2;
    v8[3] = v6;
    v8[4] = v4;
    v8[5] = v7;
    v8[0] = OpaqueTypeConformance2;
    v8[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v8);
    atomic_store(result, (unint64_t *)&qword_1ED380DC8);
  }
  return result;
}

unint64_t sub_1B11A2C48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11D00;
  if (!qword_1EEF11D00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11CD8);
    sub_1B11A2D6C((uint64_t)&unk_1EEF11D08);
    v3 = v2;
    sub_1B11A2D6C((uint64_t)&unk_1ED381790);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11D00);
  }
  return result;
}

unint64_t sub_1B11A2CE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED3816D0;
  if (!qword_1ED3816D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED3816D8);
    sub_1B11A2D6C((uint64_t)&unk_1ED381748);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CDA228];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED3816D0);
  }
  return result;
}

void sub_1B11A2D6C(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_77(a1))
  {
    OUTLINED_FUNCTION_248(0, v1);
    OUTLINED_FUNCTION_117();
  }
  OUTLINED_FUNCTION_41();
}

void sub_1B11A2D94(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6178, (uint64_t (*)(void))sub_1B11A2DA8);
}

unint64_t sub_1B11A2DA8()
{
  unint64_t result;

  result = qword_1ED3813F8[0];
  if (!qword_1ED3813F8[0])
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF1C0, &unk_1E62D6178);
    atomic_store(result, qword_1ED3813F8);
  }
  return result;
}

void sub_1B11A2DE4(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D61A0, (uint64_t (*)(void))sub_1B11A2DF8);
}

unint64_t sub_1B11A2DF8()
{
  unint64_t result;

  result = qword_1EEF11D10;
  if (!qword_1EEF11D10)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF210, &unk_1E62D61A0);
    atomic_store(result, (unint64_t *)&qword_1EEF11D10);
  }
  return result;
}

void sub_1B11A2E34(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6220, (uint64_t (*)(void))sub_1B11A2E48);
}

unint64_t sub_1B11A2E48()
{
  unint64_t result;

  result = qword_1ED380C58;
  if (!qword_1ED380C58)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF260, &unk_1E62D6220);
    atomic_store(result, (unint64_t *)&qword_1ED380C58);
  }
  return result;
}

void sub_1B11A2E84(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D62A0, (uint64_t (*)(void))sub_1B11A2E98);
}

unint64_t sub_1B11A2E98()
{
  unint64_t result;

  result = qword_1EEF11D18;
  if (!qword_1EEF11D18)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF2B0, &unk_1E62D62A0);
    atomic_store(result, (unint64_t *)&qword_1EEF11D18);
  }
  return result;
}

void sub_1B11A2ED4(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6320, (uint64_t (*)(void))sub_1B11A2EE8);
}

unint64_t sub_1B11A2EE8()
{
  unint64_t result;

  result = qword_1EEF11D20;
  if (!qword_1EEF11D20)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF300, &unk_1E62D6320);
    atomic_store(result, (unint64_t *)&qword_1EEF11D20);
  }
  return result;
}

void sub_1B11A2F24(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D63A0, (uint64_t (*)(void))sub_1B11A2F38);
}

unint64_t sub_1B11A2F38()
{
  unint64_t result;

  result = qword_1ED380D88;
  if (!qword_1ED380D88)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF350, &unk_1E62D63A0);
    atomic_store(result, (unint64_t *)&qword_1ED380D88);
  }
  return result;
}

void sub_1B11A2F74(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6420, (uint64_t (*)(void))sub_1B11A2F88);
}

unint64_t sub_1B11A2F88()
{
  unint64_t result;

  result = qword_1EEF11D28;
  if (!qword_1EEF11D28)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF3A0, &unk_1E62D6420);
    atomic_store(result, (unint64_t *)&qword_1EEF11D28);
  }
  return result;
}

void sub_1B11A2FC4(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1E62D64A0, (uint64_t (*)(void))sub_1B11A2FD8);
}

unint64_t sub_1B11A2FD8()
{
  unint64_t result;

  result = qword_1EEF11D30;
  if (!qword_1EEF11D30)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF3F0, &unk_1E62D64A0);
    atomic_store(result, (unint64_t *)&qword_1EEF11D30);
  }
  return result;
}

uint64_t sub_1B11A3014(void *a1)
{
  sub_1B119932C(a1);
  return OUTLINED_FUNCTION_22_4();
}

void sub_1B11A304C()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
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
  _QWORD v17[2];

  OUTLINED_FUNCTION_67_1();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v17[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D38);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D40);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_103_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D48);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_36();
  v13 = sub_1B11BAD8C();
  v14 = *(_QWORD *)sub_1B117568C();
  *(_QWORD *)v0 = v13;
  *(_QWORD *)(v0 + 8) = v14;
  *(_BYTE *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D50);
  v15 = sub_1B11BAD14();
  v16 = *(_QWORD *)sub_1B1175680();
  *(_QWORD *)v10 = v15;
  *((_QWORD *)v10 + 1) = v16;
  v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D58);
  sub_1B11A323C(v6, v4, v2 & 1);
}

void sub_1B11A323C(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FD0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FD8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_18_5();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_29_0();
  if ((a3 & 1) != 0)
  {
    v9 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x210))();
    swift_bridgeObjectRelease();
    v10 = a1;
    if (v9)
      sub_1B11791A8();
    else
      sub_1B117F4C4();
    sub_1B117E7F8();
    sub_1B117E834();
    OUTLINED_FUNCTION_72_0();
  }
  sub_1B11BAD8C();
  sub_1B1175698();
  sub_1B11A366C();
  sub_1B11BAFD8();
  sub_1B1175668();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8();
  v11 = sub_1B11BAD14();
  v12 = *(_QWORD *)sub_1B1175674();
  *(_QWORD *)v3 = v11;
  *(_QWORD *)(v3 + 8) = v12;
  *(_BYTE *)(v3 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FE0);
  sub_1B11A39F8();
}

void sub_1B11A345C()
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
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v10 = sub_1B11BAFB4();
  sub_1B117568C();
  OUTLINED_FUNCTION_25_1();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  sub_1B11A6CBC(v4, v2, &qword_1EEF11FD0);
  v19 = v2 + *(int *)(*(_QWORD *)(v0 + 80) + 36);
  *(_BYTE *)v19 = v10;
  *(_QWORD *)(v19 + 8) = v12;
  *(_QWORD *)(v19 + 16) = v14;
  *(_QWORD *)(v19 + 24) = v16;
  *(_QWORD *)(v19 + 32) = v18;
  *(_BYTE *)(v19 + 40) = 0;
  sub_1B119CA7C(v4, &qword_1EEF11FD0);
  *(_QWORD *)(v0 + 8) = v3;
  sub_1B1188514(v2, v3, &qword_1EEF11FD8);
  v20 = *(unsigned __int8 *)(v0 + 144);
  *(_DWORD *)(v0 + 72) = v20;
  v21 = *(unsigned __int8 *)(v0 + 136);
  *(_DWORD *)(v0 + 80) = v21;
  v22 = *(unsigned __int8 *)(v0 + 128);
  *(_DWORD *)(v0 + 24) = v22;
  v23 = OUTLINED_FUNCTION_46_2();
  sub_1B11A6CBC(v23, v24, &qword_1EEF11FD8);
  *(_QWORD *)v1 = v5;
  v25 = *(_DWORD *)(v0 + 68);
  *(_WORD *)(v1 + 8) = v25;
  v26 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 152) = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 160) = v26;
  *(_BYTE *)(v0 + 168) = v20;
  v28 = *(_QWORD *)(v0 + 40);
  v27 = *(_QWORD *)(v0 + 48);
  v29 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 176) = v27;
  *(_QWORD *)(v0 + 184) = v29;
  *(_BYTE *)(v0 + 192) = v21;
  v30 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 200) = v28;
  *(_QWORD *)(v0 + 208) = v30;
  v31 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 216) = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 224) = v31;
  *(_QWORD *)(v0 + 232) = *(_QWORD *)(v0 + 96);
  *(_WORD *)(v0 + 240) = 256;
  v32 = *(_DWORD *)(v0 + 28);
  *(_BYTE *)(v0 + 248) = v32;
  *(_QWORD *)(v0 + 256) = v6;
  *(_QWORD *)(v0 + 264) = v7;
  *(_QWORD *)(v0 + 272) = v8;
  *(_QWORD *)(v0 + 280) = v9;
  *(_BYTE *)(v0 + 288) = v22;
  memcpy((void *)(v1 + 16), (const void *)(v0 + 152), 0x89uLL);
  *(_QWORD *)(v1 + 160) = 0;
  *(_BYTE *)(v1 + 168) = 1;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FE8);
  sub_1B11A6CBC(v2, v1 + *(int *)(v33 + 80), &qword_1EEF11FD8);
  v34 = *(void **)(v0 + 16);
  sub_1B11A6A9C(v34, v25);
  sub_1B11A6AB4(v0 + 152);
  sub_1B119CA7C(*(_QWORD *)(v0 + 8), &qword_1EEF11FD8);
  sub_1B119CA7C(v2, &qword_1EEF11FD8);
  *(_QWORD *)(v0 + 296) = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 304) = v26;
  *(_BYTE *)(v0 + 312) = *(_DWORD *)(v0 + 72);
  v35 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 320) = v27;
  *(_QWORD *)(v0 + 328) = v35;
  *(_BYTE *)(v0 + 336) = *(_DWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 344) = v28;
  *(_QWORD *)(v0 + 352) = v30;
  v36 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 360) = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 368) = v36;
  *(_QWORD *)(v0 + 376) = *(_QWORD *)(v0 + 96);
  *(_WORD *)(v0 + 384) = 256;
  *(_BYTE *)(v0 + 392) = v32;
  *(_QWORD *)(v0 + 400) = v6;
  *(_QWORD *)(v0 + 408) = v7;
  *(_QWORD *)(v0 + 416) = v8;
  *(_QWORD *)(v0 + 424) = v9;
  *(_BYTE *)(v0 + 432) = *(_DWORD *)(v0 + 24);
  sub_1B11A6B2C(v0 + 296);
  sub_1B11A6BA4(v34, v25);
}

void sub_1B11A366C()
{
  uint64_t v0;
  __int16 v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
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
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  unsigned int v50;
  void (*v51)(uint64_t);
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;

  OUTLINED_FUNCTION_24();
  v57 = v1;
  v3 = v2;
  v58 = v4;
  v5 = sub_1B11BB02C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_47();
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x108))();
  sub_1B1176EC8();
  v7 = sub_1B11BB0BC();
  v9 = v8;
  v11 = v10 & 1;
  sub_1B11BAFF0();
  v50 = *MEMORY[0x1E0CDD6D8];
  v51 = *(void (**)(uint64_t))(v6 + 104);
  v51(v0);
  sub_1B11BB038();
  swift_release();
  v53 = v0;
  v55 = v5;
  v49 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v49(v0, v5);
  sub_1B11BAFFC();
  swift_release();
  v12 = sub_1B11BB0B0();
  v14 = v13;
  LOBYTE(v6) = v15;
  swift_release();
  sub_1B117CED4(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_1B11BAEDC();
  v16 = sub_1B11BB0A4();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_1B117CED4(v12, v14, v6 & 1);
  v23 = swift_bridgeObjectRelease();
  if ((v57 & 0x100) != 0)
  {
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x120))(v23);
    if (v28)
    {
      v29 = sub_1B11BB0BC();
      v31 = v30;
      v33 = v32 & 1;
      sub_1B11BAFF0();
      ((void (*)(uint64_t, _QWORD, uint64_t))v51)(v53, v50, v55);
      sub_1B11BB038();
      swift_release();
      v49(v53, v55);
      v34 = sub_1B11BB0B0();
      v54 = v35;
      v56 = v34;
      v37 = v36;
      swift_release();
      v52 = v37 & 1;
      sub_1B117CED4(v29, v31, v33);
      swift_bridgeObjectRelease();
      sub_1B11BAEF4();
      v24 = sub_1B11BB0A4();
      v25 = v38;
      v27 = v39;
      v26 = v40 & 1;
      sub_1B117CED4(v56, v54, v52);
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
    }
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 1;
  }
  *(_QWORD *)v58 = v16;
  *(_QWORD *)(v58 + 8) = v18;
  *(_BYTE *)(v58 + 16) = v20 & 1;
  *(_QWORD *)(v58 + 24) = v22;
  *(_QWORD *)(v58 + 32) = v24;
  *(_QWORD *)(v58 + 40) = v25;
  *(_QWORD *)(v58 + 48) = v26;
  *(_QWORD *)(v58 + 56) = v27;
  sub_1B117E8AC(v16, v18, v20 & 1);
  swift_bridgeObjectRetain();
  v41 = OUTLINED_FUNCTION_70_3();
  sub_1B11A6B1C(v41, v42, v43, v44);
  v45 = OUTLINED_FUNCTION_70_3();
  sub_1B11A6B94(v45, v46, v47, v48);
  sub_1B117CED4(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15();
}

void sub_1B11A39F8()
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
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
  void *v14;
  int v15;

  OUTLINED_FUNCTION_67_1();
  v15 = v0;
  v14 = v1;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF12000);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_122();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_29_0();
  sub_1B11BAAE0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED380FB8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF12008);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_184();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF12010);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_122();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_29_0();
  v13 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v13 + 16) = v3;
  *(_QWORD *)(v13 + 24) = v14;
  *(_BYTE *)(v13 + 32) = v15 & 1;
  *(_BYTE *)(v13 + 33) = BYTE1(v15) & 1;
  *(_BYTE *)(v13 + 34) = BYTE2(v15) & 1;
  v3;
  v14;
  sub_1B11BB26C();
  sub_1B119A9E4(&qword_1ED380FB0, qword_1ED380FB8);
  sub_1B11A1A2C(0);
}

void sub_1B11A3C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  _QWORD *v19;
  void (*v20)(uint64_t);
  uint64_t KeyPath;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  id v40;
  unsigned int v41;
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;

  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 200) + 8);
  *(_QWORD *)(v17 - 280) = v9;
  *(_QWORD *)(v17 - 200) = v12;
  *(_QWORD *)(v17 - 320) = v18;
  v18(v9, v12);
  v19 = *(_QWORD **)(v17 - 184);
  v20 = (void (*)(uint64_t))v19[13];
  *(_DWORD *)(v17 - 340) = *MEMORY[0x1E0CD8750];
  *(_QWORD *)(v17 - 336) = v20;
  v20(v11);
  KeyPath = swift_getKeyPath();
  *(_QWORD *)(v17 - 288) = v13;
  v22 = (uint64_t *)(v15 + *(int *)(v13 + 36));
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED380E00);
  *(_QWORD *)(v17 - 352) = v23;
  v24 = (void (*)(char *, uint64_t, uint64_t))v19[2];
  v24((char *)v22 + *(int *)(v23 + 28), v11, v10);
  *v22 = KeyPath;
  v25 = *(_QWORD *)(v17 - 192);
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v26(v15, v16, v14);
  v27 = (void (*)(uint64_t, uint64_t))v19[1];
  v28 = *(_QWORD *)(v17 - 208);
  *(_QWORD *)(v17 - 184) = v27;
  v27(v11, v10);
  v29 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
  *(_QWORD *)(v17 - 176) = v14;
  v30 = v14;
  v31 = *(_DWORD *)(v17 - 168);
  v29(v16, v30);
  sub_1B1188514(v15, v28, &qword_1EEF12010);
  if ((v31 & 0x10000) != 0)
  {
    *(_QWORD *)(v17 - 192) = v26;
    v37 = *(_QWORD **)(v17 - 248);
    v38 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v37) + 0x198))();
    if (v38)
    {
      v39 = v38;
      *(_QWORD *)(v17 - 360) = v24;
      if ((objc_msgSend(v38, sel_respondsToSelector_, sel_suggestionDismissAction) & 1) != 0)
      {
        v40 = objc_msgSend(v39, sel_suggestionDismissAction);
        OUTLINED_FUNCTION_22_1();
        if (v40)
        {
          v41 = v31 & 0x10000;
          v42 = v40;
          v43 = v37;
          v44 = HIWORD(v41);
          v45 = objc_msgSend(v42, sel_title);

          *(_QWORD *)(v17 - 376) = sub_1B11BB3C8();
          v46 = OUTLINED_FUNCTION_4_0();
          *(_QWORD *)(v17 - 168) = v15;
          *(_QWORD *)(v17 - 368) = &a9;
          v47 = *(void **)(v17 - 304);
          *(_QWORD *)(v46 + 16) = v43;
          *(_QWORD *)(v46 + 24) = v47;
          *(_BYTE *)(v46 + 32) = *(_DWORD *)(v17 - 308);
          *(_BYTE *)(v46 + 33) = *(_DWORD *)(v17 - 324);
          *(_BYTE *)(v46 + 34) = v44;
          MEMORY[0x1E0C80A78](v46);
          v48 = v43;
          v49 = v47;
          sub_1B11BB26C();
          swift_bridgeObjectRelease();
          sub_1B11A1A2C(0);
        }
      }
      else
      {
        OUTLINED_FUNCTION_22_1();
      }
    }
    v34 = *(_QWORD *)(v17 - 224);
    v33 = *(_QWORD *)(v17 - 216);
    v35 = *(_QWORD *)(v17 - 240);
    v36 = *(_QWORD *)(v17 - 232);
    v50 = *(_QWORD *)(v17 - 264);
    __swift_storeEnumTagSinglePayload(v50, 1, 1, *(_QWORD *)(v17 - 256));
    sub_1B1188514(v50, v36, &qword_1EEF11FF8);
    v32 = 0;
  }
  else
  {
    v32 = 1;
    v34 = *(_QWORD *)(v17 - 224);
    v33 = *(_QWORD *)(v17 - 216);
    v35 = *(_QWORD *)(v17 - 240);
    v36 = *(_QWORD *)(v17 - 232);
  }
  __swift_storeEnumTagSinglePayload(v36, v32, 1, v35);
  sub_1B11A6CBC(v28, v15, &qword_1EEF12010);
  v51 = OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_22_5(v51, v52);
  OUTLINED_FUNCTION_41_6();
  sub_1B11A6CBC(v53, v54, v55);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF12018);
  OUTLINED_FUNCTION_22_5(v34, v33 + *(int *)(v56 + 48));
  OUTLINED_FUNCTION_13(v36);
  sub_1B119CA7C(v28, &qword_1EEF12010);
  OUTLINED_FUNCTION_13(v34);
  sub_1B119CA7C(v15, &qword_1EEF12010);
  OUTLINED_FUNCTION_35();
}

void sub_1B11A4138()
{
  sub_1B11A304C();
}

void sub_1B11A416C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24();
  v0 = sub_1B11BB068();
  sub_1B11BB080();
  sub_1B11BAE94();
  sub_1B11BB1E8();
  OUTLINED_FUNCTION_31_7();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_18_5();
  MEMORY[0x1E0C80A78](v2);
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CDD898], v0);
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11A424C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 - 128) = v2;
  *(_QWORD *)(v3 - 120) = a1;
  v4 = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3 - 128);
  sub_1B11BB1DC();
  *(_QWORD *)(v3 - 136) = v4;
  OUTLINED_FUNCTION_27_4();
}

void sub_1B11A4298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void);
  void (*v6)(uint64_t, uint64_t);

  v5 = *(void (**)(void))(v3 + 16);
  OUTLINED_FUNCTION_61_4();
  v5();
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v2, v0);
  ((void (*)(_QWORD, uint64_t, uint64_t))v5)(*(_QWORD *)(v4 - 200), v1, v0);
  v6(v1, v0);
  OUTLINED_FUNCTION_15();
}

void sub_1B11A42E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_24();
  sub_1B11BB080();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_122();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29_0();
  v2 = sub_1B11BB068();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_122();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_61_4();
  v4 = sub_1B11BAE94();
  MEMORY[0x1E0C80A78](v4);
  if ((sub_1B1176E24() & 1) != 0)
  {
    sub_1B11BB05C();
    OUTLINED_FUNCTION_67();
  }
  sub_1B11BB074();
  OUTLINED_FUNCTION_27_4();
}

void sub_1B11A44E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(v2 - 240);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 16);
  v4(v3, v1, v0);
  OUTLINED_FUNCTION_58_2();
  v4(v1, v3, v0);
  OUTLINED_FUNCTION_67();
}

void sub_1B11A4520()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_61_4();
  sub_1B1182D74(v3, v4, v5);
  OUTLINED_FUNCTION_58_2();
  v1(v2, v0);
  JUMPOUT(0x1B11A4548);
}

void sub_1B11A4554()
{
  OUTLINED_FUNCTION_27_4();
}

void sub_1B11A4564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = v1;
  *(_QWORD *)(v2 - 128) = a1;
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11A457C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 216);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v2 - 200), v1, v0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  OUTLINED_FUNCTION_15();
}

void sub_1B11A45B0()
{
  sub_1B11A42E0();
}

uint64_t sub_1B11A45BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_18_5();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_53_2();
  v9();
  v10 = OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_51_3(v10, v11);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  v12(v3, a2);
  OUTLINED_FUNCTION_51_3(a3, v4);
  return v12(v4, a2);
}

void sub_1B11A465C()
{
  sub_1B11A416C();
}

void sub_1B11A466C()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_24();
  v5 = v4;
  v25 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D70);
  OUTLINED_FUNCTION_31_7();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D78);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_103_0();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D80);
  v10 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v11 = OUTLINED_FUNCTION_16_5();
  if ((v11 & 1) != 0)
  {
    v23[1] = v23;
    MEMORY[0x1E0C80A78](v11);
    v23[0] = v5;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D88);
    sub_1B119A9E4(&qword_1EEF11D90, &qword_1EEF11D70);
    v14 = v13;
    v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D98);
    sub_1B119A9E4(&qword_1EEF11DA0, &qword_1EEF11D98);
    v26 = v15;
    v27 = v16;
    v17 = OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_41_6();
    sub_1B11BB14C();
    v18 = v24;
    OUTLINED_FUNCTION_59_4(v0, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    OUTLINED_FUNCTION_39_5();
    v26 = v7;
    v27 = v12;
    v28 = v14;
    v29 = v17;
    OUTLINED_FUNCTION_7_6();
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v18);
  }
  else
  {
    v19 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_41_6();
    v19();
    OUTLINED_FUNCTION_51_3(v0, v1);
    OUTLINED_FUNCTION_38_4();
    v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D88);
    sub_1B119A9E4(&qword_1EEF11D90, &qword_1EEF11D70);
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D98);
    sub_1B119A9E4(&qword_1EEF11DA0, &qword_1EEF11D98);
    v26 = v7;
    v27 = v20;
    v28 = v22;
    v29 = OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_7_6();
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v7);
  }
  OUTLINED_FUNCTION_15();
}

void sub_1B11A4904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B11BAEAC();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_103_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11D98);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_47();
  sub_1B11BAEA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FB0);
  sub_1B119A9E4(&qword_1EEF11FB8, &qword_1EEF11FB0);
  sub_1B11BAC18();
  sub_1B119A9E4(&qword_1EEF11DA0, &qword_1EEF11D98);
  MEMORY[0x1B5E16F9C](v0, v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  OUTLINED_FUNCTION_60();
}

void sub_1B11A4A18()
{
  sub_1B11A4904();
}

void sub_1B11A4A20()
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
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;

  OUTLINED_FUNCTION_67_1();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED380FB8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_38_0();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_85();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_53_2();
  v14 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v14 + 16) = v6;
  *(_QWORD *)(v14 + 24) = v4;
  swift_retain();
  sub_1B11BB26C();
  LOBYTE(v4) = sub_1B11BAFD8();
  sub_1B1175674();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v0, v2, v9);
  v15 = (_BYTE *)(v0 + *(int *)(v11 + 36));
  *v15 = v4;
  OUTLINED_FUNCTION_17_7((uint64_t)v15);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  sub_1B1188514(v0, v1, &qword_1EEF11FC0);
  OUTLINED_FUNCTION_22_5(v1, v0);
  *(_QWORD *)v8 = 0;
  *(_BYTE *)(v8 + 8) = 1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11FC8);
  OUTLINED_FUNCTION_22_5(v0, v8 + *(int *)(v16 + 48));
  OUTLINED_FUNCTION_13(v1);
  OUTLINED_FUNCTION_13(v0);
  OUTLINED_FUNCTION_35();
}

void sub_1B11A4BA0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  sub_1B1175A30(0xD000000000000021);
  sub_1B1176EC8();
  v0 = sub_1B11BB0BC();
  OUTLINED_FUNCTION_200(v0, v1, v2, v3);
  OUTLINED_FUNCTION_148();
}

void sub_1B11A4BF8()
{
  sub_1B11A466C();
}

void sub_1B11A4C00()
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_24();
  v24 = v4;
  v26 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DA8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_37();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DB0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_7();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DB8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_184();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_85();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v23 - v14;
  if ((sub_1B1176E24() & 1) != 0)
  {
    sub_1B119A9E4(&qword_1EEF11DD0, &qword_1EEF11DA8);
    v23 = v16;
    sub_1B11BB134();
    v17 = *sub_1B118F538();
    swift_retain();
    v18 = sub_1B11BAF9C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v1, v3, v9);
    v19 = v1 + *(int *)(v11 + 36);
    *(_QWORD *)v19 = v17;
    *(_BYTE *)(v19 + 8) = v18;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v9);
    sub_1B1188514(v1, (uint64_t)v15, &qword_1EEF11DC0);
    OUTLINED_FUNCTION_22_5((uint64_t)v15, v2);
    swift_storeEnumTagMultiPayload();
    sub_1B11A4E38();
    OUTLINED_FUNCTION_65_3();
    sub_1B11BAE88();
    OUTLINED_FUNCTION_13((uint64_t)v15);
  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v20(v0, v24, v6);
    v20(v2, v0, v6);
    swift_storeEnumTagMultiPayload();
    sub_1B11A4E38();
    sub_1B119A9E4(&qword_1EEF11DD0, &qword_1EEF11DA8);
    OUTLINED_FUNCTION_65_3();
    sub_1B11BAE88();
    v21 = OUTLINED_FUNCTION_22_4();
    v22(v21);
  }
  OUTLINED_FUNCTION_15();
}

unint64_t sub_1B11A4E38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_1EEF11DC8;
  if (!qword_1EEF11DC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11DC0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11DA8);
    sub_1B119A9E4(&qword_1EEF11DD0, &qword_1EEF11DA8);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_1B119A9E4(&qword_1ED380C28, (uint64_t *)&unk_1ED380C30);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v6);
    atomic_store(result, (unint64_t *)&qword_1EEF11DC8);
  }
  return result;
}

void sub_1B11A4F04()
{
  sub_1B11A4C00();
}

void sub_1B11A4F18()
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
  double v10;
  double v11;
  double v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_24();
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DD8);
  OUTLINED_FUNCTION_31_7();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DE8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v9);
  if ((OUTLINED_FUNCTION_16_5() & 1) != 0)
  {
    v10 = *(double *)sub_1B11756D4();
    v11 = *(double *)sub_1B11756C8();
    v12 = *(double *)sub_1B11756BC();
    sub_1B11BB338();
    sub_1B11A515C(v10, 0, 0.0, 1, v11, 0, v12, 0, v2, 0.0, 1, INFINITY, 0);
    OUTLINED_FUNCTION_22_5(v2, v0);
    OUTLINED_FUNCTION_39_5();
    sub_1B11A50D8();
    sub_1B119A9E4(&qword_1EEF11DF8, &qword_1EEF11DD8);
    OUTLINED_FUNCTION_49_5();
    sub_1B11BAE88();
    OUTLINED_FUNCTION_13(v2);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v13(v1, v5, v6);
    v13(v0, v1, v6);
    OUTLINED_FUNCTION_38_4();
    sub_1B11A50D8();
    sub_1B119A9E4(&qword_1EEF11DF8, &qword_1EEF11DD8);
    OUTLINED_FUNCTION_49_5();
    OUTLINED_FUNCTION_72_0();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v6);
  }
  OUTLINED_FUNCTION_15();
}

unint64_t sub_1B11A50D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11DF0;
  if (!qword_1EEF11DF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11DE8);
    sub_1B119A9E4(&qword_1EEF11DF8, &qword_1EEF11DD8);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CDA228];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11DF0);
  }
  return result;
}

void *sub_1B11A515C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE __src[112];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1B11BB4A0();
    v23 = (void *)sub_1B11BAF90();
    sub_1B11BA9E4();

  }
  sub_1B11BAC24();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a9, v13, v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11DE8);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void sub_1B11A530C()
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
  void (*v11)(uint64_t, uint64_t, uint64_t);
  char v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_67_1();
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_103_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_7();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E10);
  OUTLINED_FUNCTION_31_7();
  MEMORY[0x1E0C80A78](v10);
  if ((OUTLINED_FUNCTION_16_5() & 1) != 0)
  {
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v11(v2, v5, v9);
    v11(v0, v2, v9);
    OUTLINED_FUNCTION_39_5();
    sub_1B119A9E4(&qword_1EEF11E18, &qword_1EEF11E10);
    sub_1B11A54C0();
    OUTLINED_FUNCTION_41_6();
    sub_1B11BAE88();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v9);
  }
  else
  {
    v12 = sub_1B11BAFA8();
    sub_1B11BAABC();
    OUTLINED_FUNCTION_8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v9);
    v13 = (_BYTE *)(v1 + *(int *)(v6 + 36));
    *v13 = v12;
    OUTLINED_FUNCTION_17_7((uint64_t)v13);
    v14 = OUTLINED_FUNCTION_46_2();
    sub_1B11A6CBC(v14, v15, &qword_1EEF11E00);
    OUTLINED_FUNCTION_38_4();
    sub_1B119A9E4(&qword_1EEF11E18, &qword_1EEF11E10);
    sub_1B11A54C0();
    OUTLINED_FUNCTION_41_6();
    sub_1B11BAE88();
    sub_1B119CA7C(v1, &qword_1EEF11E00);
  }
  OUTLINED_FUNCTION_35();
}

unint64_t sub_1B11A54C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11E20;
  if (!qword_1EEF11E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11E00);
    sub_1B119A9E4(&qword_1EEF11E18, &qword_1EEF11E10);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11E20);
  }
  return result;
}

void sub_1B11A5544()
{
  sub_1B11A530C();
}

void sub_1B11A554C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;

  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_37();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E30);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_38_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E38);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_122();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_53_2();
  if ((sub_1B1176E24() & 1) != 0)
  {
    v7 = *(_QWORD *)sub_1B118F620();
    KeyPath = swift_getKeyPath();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E40);
    OUTLINED_FUNCTION_28_5(v9);
    v10 = (uint64_t *)(v1 + *(int *)(v3 + 36));
    *v10 = KeyPath;
    v10[1] = v7;
    swift_retain();
    sub_1B11BB1B8();
  }
  else
  {
    v11 = sub_1B11BB044();
    v12 = swift_getKeyPath();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E40);
    OUTLINED_FUNCTION_28_5(v13);
    v14 = (uint64_t *)(v1 + *(int *)(v3 + 36));
    *v14 = v12;
    v14[1] = v11;
    sub_1B11BB1C4();
  }
  swift_getKeyPath();
  OUTLINED_FUNCTION_43_5();
  OUTLINED_FUNCTION_29_4();
  OUTLINED_FUNCTION_57_3();
  OUTLINED_FUNCTION_45_6();
  swift_storeEnumTagMultiPayload();
  sub_1B11A5BF4();
  sub_1B11BAE88();
  sub_1B119CA7C(v0, &qword_1EEF11E38);
  OUTLINED_FUNCTION_15();
}

void sub_1B11A573C()
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
  char *v21;
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

  OUTLINED_FUNCTION_24();
  v43 = v2;
  v41 = sub_1B11BAEC4();
  v36 = *(_QWORD *)(v41 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_184();
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E60);
  v37 = *(_QWORD *)(v42 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_122();
  v7 = v5 - v6;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v36 - v9;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E68);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_5_0();
  v40 = v12;
  v13 = sub_1B11BABE8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_36();
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E70);
  v15 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_122();
  v18 = v16 - v17;
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v36 - v20;
  if ((sub_1B1176E24() & 1) != 0)
  {
    sub_1B11BB350();
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E78);
    sub_1B119A9E4(&qword_1EEF11E80, &qword_1EEF11E78);
    v24 = v23;
    sub_1B11998CC(qword_1EEF11E88, (void (*)(uint64_t))MEMORY[0x1E0CD9E78]);
    v26 = v25;
    sub_1B11BB164();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v13);
    v27 = v39;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v21, v18, v39);
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v40, v21, v27);
    swift_storeEnumTagMultiPayload();
    v44 = v22;
    v45 = v13;
    v46 = v24;
    v47 = v26;
    OUTLINED_FUNCTION_7_6();
    v44 = v22;
    v45 = v41;
    v46 = v24;
    v47 = MEMORY[0x1E0CDBD50];
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_72_0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v27);
  }
  else
  {
    sub_1B11BAEB8();
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF11E78);
    sub_1B119A9E4(&qword_1EEF11E80, &qword_1EEF11E78);
    v30 = v29;
    v31 = MEMORY[0x1E0CDBD50];
    v32 = v41;
    sub_1B11BB170();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v1, v32);
    v33 = v37;
    v34 = v42;
    OUTLINED_FUNCTION_59_4((uint64_t)v10, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 32));
    OUTLINED_FUNCTION_59_4(v40, (uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 16));
    swift_storeEnumTagMultiPayload();
    sub_1B11998CC(qword_1EEF11E88, (void (*)(uint64_t))MEMORY[0x1E0CD9E78]);
    v44 = v28;
    v45 = v13;
    v46 = v30;
    v47 = v35;
    OUTLINED_FUNCTION_7_6();
    v44 = v28;
    v45 = v32;
    v46 = v30;
    v47 = v31;
    OUTLINED_FUNCTION_7_6();
    sub_1B11BAE88();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_1B11A5AD4(uint64_t a1, uint64_t a2, double a3)
{
  double v4;

  v4 = a3;
  return MEMORY[0x1B5E17224](&v4, a1, &unk_1E62D66A0, a2);
}

uint64_t sub_1B11A5B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  return MEMORY[0x1B5E17224](v4, a3, &unk_1E62D6658);
}

void sub_1B11A5B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v7 = type metadata accessor for CatalystContentBackgroundModifier();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_113();
  v9(v3, a1);
  MEMORY[0x1B5E17224](v3, a2, v7, a3);
  sub_1B11A5D4C(v3);
  OUTLINED_FUNCTION_60();
}

void sub_1B11A5BC4()
{
  OUTLINED_FUNCTION_20_5();
}

void sub_1B11A5BD4()
{
  OUTLINED_FUNCTION_20_5();
}

void sub_1B11A5BE4()
{
  OUTLINED_FUNCTION_20_5();
}

unint64_t sub_1B11A5BF4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11E48;
  if (!qword_1EEF11E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11E38);
    v2 = sub_1B11A5C78();
    sub_1B119A9E4(&qword_1ED381298, &qword_1ED3812A0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11E48);
  }
  return result;
}

unint64_t sub_1B11A5C78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_1EEF11E50;
  if (!qword_1EEF11E50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11E30);
    sub_1B119A9E4(&qword_1EEF11E58, &qword_1EEF11E40);
    v3 = v2;
    sub_1B119A9E4(&qword_1ED381768, &qword_1ED381770);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EEF11E50);
  }
  return result;
}

uint64_t type metadata accessor for CatalystContentBackgroundModifier()
{
  uint64_t result;

  result = qword_1EEF13560;
  if (!qword_1EEF13560)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B11A5D4C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CatalystContentBackgroundModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B11A5D88()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5D94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B11A5DC8()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5DD4()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5DE0()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5DEC()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5DF8()
{
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B11A5E04()
{
  return OUTLINED_FUNCTION_2_0();
}

void sub_1B11A5E10(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  v4 = v2;
  v5 = v3;
  OUTLINED_FUNCTION_41();
}

_BYTE *sub_1B11A5E4C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return OUTLINED_FUNCTION_56();
}

void sub_1B11A5EA0(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A5ED8(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 19))
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

void type metadata accessor for SGSuggestionsCatalystTableCell()
{
  OUTLINED_FUNCTION_29();
}

uint64_t type metadata accessor for CatalystTableListViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CatalystTableListViewModel);
}

void sub_1B11A5F3C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A5F64()
{
  return swift_release();
}

void sub_1B11A5F6C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_41();
}

void sub_1B11A5FA0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A5FCC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
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

_QWORD *sub_1B11A600C(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0)
      *((_BYTE *)result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_120_0(result, a2);
    }
    *((_BYTE *)result + 16) = 0;
    if (a2)
      return OUTLINED_FUNCTION_120_0(result, a2);
  }
  return result;
}

void type metadata accessor for CatalystToolBarModifier()
{
  OUTLINED_FUNCTION_29();
}

uint64_t sub_1B11A604C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_163();
  v0 = OUTLINED_FUNCTION_22_4();
  return OUTLINED_FUNCTION_64(v0, v1, v2, v3);
}

uint64_t sub_1B11A6074(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_10();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

void sub_1B11A60A4()
{
  uint64_t (*v0)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_26_3(v0);
  OUTLINED_FUNCTION_41();
}

void sub_1B11A60CC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_26_3(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 24));
  OUTLINED_FUNCTION_41();
}

void sub_1B11A60F8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_26_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 32));
  OUTLINED_FUNCTION_41();
}

void sub_1B11A6128()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_26_3(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 40));
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A6154()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B11A6160(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_10_5();
  return __swift_getEnumTagSinglePayload(v2, a2, v4);
}

uint64_t sub_1B11A618C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B11A6198(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_10_5();
  return __swift_storeEnumTagSinglePayload(v2, a2, a2, v4);
}

uint64_t sub_1B11A61C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BAAD4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for NavigationViewFrameSizeModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for TopImagePaddingModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for SectionFontNameModifier()
{
  OUTLINED_FUNCTION_29();
}

void type metadata accessor for FormListStyleModifier()
{
  OUTLINED_FUNCTION_29();
}

unint64_t sub_1B11A6264()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11F10;
  if (!qword_1EEF11F10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D68);
    sub_1B119A9E4(&qword_1EEF11F18, &qword_1EEF11D48);
    v3[0] = v2;
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11F10);
  }
  return result;
}

void sub_1B11A62E8()
{
  uint64_t v0;

  v0 = sub_1B11BB068();
  sub_1B11BB080();
  OUTLINED_FUNCTION_41_6();
  sub_1B11BAE94();
  sub_1B11BB1E8();
  MEMORY[0x1B5E17C68](MEMORY[0x1E0CDD898], v0);
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11A637C()
{
  OUTLINED_FUNCTION_27_4();
}

void sub_1B11A6390()
{
  OUTLINED_FUNCTION_67();
}

unint64_t sub_1B11A63BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  result = qword_1EEF11F20;
  if (!qword_1EEF11F20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F28);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D70);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D88);
    sub_1B119A9E4(&qword_1EEF11D90, &qword_1EEF11D70);
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11D98);
    sub_1B119A9E4(&qword_1EEF11DA0, &qword_1EEF11D98);
    v6[2] = v2;
    v6[3] = v3;
    v6[4] = v5;
    v6[5] = swift_getOpaqueTypeConformance2();
    v6[0] = swift_getOpaqueTypeConformance2();
    v6[1] = v5;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v6);
    atomic_store(result, (unint64_t *)&qword_1EEF11F20);
  }
  return result;
}

unint64_t sub_1B11A64D0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11F30;
  if (!qword_1EEF11F30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F38);
    v2 = sub_1B11A4E38();
    sub_1B119A9E4(&qword_1EEF11DD0, &qword_1EEF11DA8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11F30);
  }
  return result;
}

unint64_t sub_1B11A6558()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEF11F40;
  if (!qword_1EEF11F40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F48);
    v2 = sub_1B11A50D8();
    sub_1B119A9E4(&qword_1EEF11DF8, &qword_1EEF11DD8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1EEF11F40);
  }
  return result;
}

unint64_t sub_1B11A65E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEF11F50;
  if (!qword_1EEF11F50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F58);
    sub_1B119A9E4(&qword_1EEF11E18, &qword_1EEF11E10);
    v3[0] = v2;
    v3[1] = sub_1B11A54C0();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEF11F50);
  }
  return result;
}

unint64_t sub_1B11A6668()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEF11F60;
  if (!qword_1EEF11F60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F68);
    v2[0] = sub_1B11A5BF4();
    v2[1] = v2[0];
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEF11F60);
  }
  return result;
}

unint64_t sub_1B11A66D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t OpaqueTypeConformance2;
  _QWORD v7[6];

  result = qword_1EEF11F70;
  if (!qword_1EEF11F70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11F78);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF11E78);
    sub_1B11BABE8();
    v3 = (void (*)(uint64_t))MEMORY[0x1E0CD9E78];
    sub_1B119A9E4(&qword_1EEF11E80, &qword_1EEF11E78);
    v5 = v4;
    sub_1B11998CC(qword_1EEF11E88, v3);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v7[2] = v2;
    v7[3] = sub_1B11BAEC4();
    v7[4] = v5;
    v7[5] = MEMORY[0x1E0CDBD50];
    v7[0] = OpaqueTypeConformance2;
    v7[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDB8A0], v1, v7);
    atomic_store(result, (unint64_t *)&qword_1EEF11F70);
  }
  return result;
}

void sub_1B11A67E8(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1E62D66A0, (void (*)(void))sub_1B11A67FC);
}

unint64_t sub_1B11A67FC()
{
  unint64_t result;

  result = qword_1EEF11F80;
  if (!qword_1EEF11F80)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF740, &unk_1E62D66A0);
    atomic_store(result, (unint64_t *)&qword_1EEF11F80);
  }
  return result;
}

void sub_1B11A6838(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6658, (void (*)(void))sub_1B11A684C);
}

unint64_t sub_1B11A684C()
{
  unint64_t result;

  result = qword_1EEF11F88;
  if (!qword_1EEF11F88)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF650, &unk_1E62D6658);
    atomic_store(result, (unint64_t *)&qword_1EEF11F88);
  }
  return result;
}

void sub_1B11A6888()
{
  type metadata accessor for CatalystContentBackgroundModifier();
  sub_1B11BABB8();
  sub_1B11998CC(&qword_1EEF11F90, (void (*)(uint64_t))type metadata accessor for CatalystContentBackgroundModifier);
  OUTLINED_FUNCTION_184_0();
}

void sub_1B11A68F0()
{
  OUTLINED_FUNCTION_45_0();
}

void sub_1B11A68F8(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1E62D6680, (void (*)(void))sub_1B11A690C);
}

unint64_t sub_1B11A690C()
{
  unint64_t result;

  result = qword_1EEF11F98;
  if (!qword_1EEF11F98)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF6F0, &unk_1E62D6680);
    atomic_store(result, (unint64_t *)&qword_1EEF11F98);
  }
  return result;
}

void sub_1B11A6948(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1E62D66C8, (void (*)(void))sub_1B11A695C);
}

unint64_t sub_1B11A695C()
{
  unint64_t result;

  result = qword_1EEF11FA0;
  if (!qword_1EEF11FA0)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF790, &unk_1E62D66C8);
    atomic_store(result, (unint64_t *)&qword_1EEF11FA0);
  }
  return result;
}

void sub_1B11A6998(uint64_t a1)
{
  get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1E62D66E8, (void (*)(void))sub_1B11A69F8);
}

void get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  sub_1B11BABB8();
  a3();
  OUTLINED_FUNCTION_27_4();
}

void sub_1B11A69F0()
{
  OUTLINED_FUNCTION_45_0();
}

unint64_t sub_1B11A69F8()
{
  unint64_t result;

  result = qword_1EEF11FA8;
  if (!qword_1EEF11FA8)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF7E0, &unk_1E62D66E8);
    atomic_store(result, (unint64_t *)&qword_1EEF11FA8);
  }
  return result;
}

void sub_1B11A6A34()
{
  sub_1B11A4A20();
}

uint64_t sub_1B11A6A3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B11A6A60()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B11A6A80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B11A45BC(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

id sub_1B11A6A9C(id result, __int16 a2)
{
  if (HIBYTE(a2) != 255)
    return result;
  return result;
}

uint64_t sub_1B11A6AB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  sub_1B117E8AC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_1B11A6B1C(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1B11A6B1C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_1B117E8DC(result, a2, a3, a4);
  return result;
}

uint64_t sub_1B11A6B2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  sub_1B117CED4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_1B11A6B94(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1B11A6B94(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_1B117E92C(result, a2, a3, a4);
  return result;
}

void sub_1B11A6BA4(id a1, __int16 a2)
{
  if (HIBYTE(a2) != 255)

}

uint64_t sub_1B11A6BBC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void *sub_1B11A6BE8()
{
  uint64_t v0;
  void *result;
  id v2;

  result = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 16)) + 0x198))();
  if (result)
  {
    v2 = objc_msgSend(result, sel_suggestionPrimaryAction);
    objc_msgSend(v2, sel_execute);

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1B11A6C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 16)) + 0x180))();
  sub_1B1176EC8();
  v1 = sub_1B11BB0BC();
  OUTLINED_FUNCTION_200(v1, v2, v3, v4);
  OUTLINED_FUNCTION_148();
}

void sub_1B11A6CBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_84(a1, a2, a3);
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_61(v3);
  OUTLINED_FUNCTION_41();
}

void sub_1B11A6CE0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t inited;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 16)) + 0x198))();
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, sel_respondsToSelector_, sel_suggestionDismissAction) & 1) != 0)
    {
      v4 = objc_msgSend(v3, sel_suggestionDismissAction);
      objc_msgSend(v4, sel_execute);

    }
    OUTLINED_FUNCTION_22_1();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEF10D40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B11BD870;
  v6 = (uint64_t *)sub_1B1198478();
  v8 = *v6;
  v7 = v6[1];
  *(_QWORD *)(inited + 32) = v8;
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  v9 = (uint64_t *)sub_1B1198484();
  v11 = *v9;
  v10 = v9[1];
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 64) = v10;
  *(_QWORD *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  v12 = sub_1B11BB374();
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1B119846C();
  swift_bridgeObjectRetain();
  v14 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  v15 = sub_1B117A308(v12);
  swift_bridgeObjectRelease();
  sub_1B117ECEC((uint64_t)v14, v1, v15, v13);

}

uint64_t sub_1B11A6E6C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  sub_1B1176EC8();
  swift_bridgeObjectRetain();
  v0 = sub_1B11BB0BC();
  return OUTLINED_FUNCTION_200(v0, v1, v2, v3);
}

void sub_1B11A6EFC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1B5E17D58](v0);
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A6F6C()
{
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A6FB8(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_2();
  v3[3] = MEMORY[0x1B5E17D58](v5);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B11A701C()
{
  unsigned int *v0;

  OUTLINED_FUNCTION_1_0();
  return *v0;
}

void sub_1B11A704C(int a1)
{
  uint64_t v1;
  _DWORD *v3;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_state);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A7088()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A70B8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_1_0();
  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B11A70F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_identifier);
  OUTLINED_FUNCTION_2();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_1B11A7150()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B11A7180()
{
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A71AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passDictionary);
  OUTLINED_FUNCTION_2();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A71F0()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void sub_1B11A7220()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_56_0();
  v0 = OUTLINED_FUNCTION_70_0();
  v1(v0);
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A7270(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger;
  OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_56_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_7_0();
}

void sub_1B11A72CC()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B11A72FC()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B11A7324(void *a1)
{
  sub_1B1194014(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_realtime);
}

void sub_1B11A7330()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B11A7360()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B11A7388(void *a1)
{
  sub_1B1194014(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passViewManager);
}

void sub_1B11A7394()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

void SGWalletPassSuggestion.__allocating_init(realtimeWalletPass:)()
{
  void *v0;

  OUTLINED_FUNCTION_11_3();
  SGWalletPassSuggestion.init(realtimeWalletPass:)(v0);
  OUTLINED_FUNCTION_41();
}

id SGWalletPassSuggestion.init(realtimeWalletPass:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  char *v18;
  void (*v19)(char *, char *, uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  objc_class *ObjCClassFromMetadata;
  NSString *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  objc_class *v46;
  id v47;
  _QWORD v49[2];
  _QWORD *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  objc_super v55;
  id v56[4];
  uint64_t v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v3 = OUTLINED_FUNCTION_56_0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v52 = (char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v49 - v7;
  swift_unknownObjectWeakInit();
  v9 = (uint64_t *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passDictionary];
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passDictionary] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_realtime] = a1;
  v10 = v1;
  v11 = a1;
  v12 = objc_msgSend(v11, sel_state);
  *(_DWORD *)&v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_state] = (_DWORD)v12;
  v13 = OUTLINED_FUNCTION_9((uint64_t)v12, sel_identifier);
  v14 = sub_1B11BB3C8();
  v16 = v15;

  v17 = (uint64_t *)&v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_identifier];
  *v17 = v14;
  v17[1] = v16;
  sub_1B11758DC();
  swift_bridgeObjectRetain();
  sub_1B11BA9FC();
  v18 = &v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger];
  v19 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v53 = v3;
  v19(&v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger], v8, v3);
  v20 = (void *)objc_opt_self();
  v21 = OUTLINED_FUNCTION_9((uint64_t)v20, sel_walletPassDictionaryData);
  v22 = sub_1B11BA96C();
  v24 = v23;

  v25 = (void *)sub_1B11BA960();
  sub_1B11957E0(v22, v24);
  v56[0] = 0;
  v26 = objc_msgSend(v20, sel_JSONObjectWithData_options_error_, v25, 0, v56);

  if (v26)
  {
    v27 = v56[0];
    sub_1B11BB500();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF11580);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v28 = v57[0];
      OUTLINED_FUNCTION_2();
      *v9 = v28;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v29 = v56[0];
    sub_1B11BA918();

    swift_willThrow();
    OUTLINED_FUNCTION_2();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v52, v18, v53);
    OUTLINED_FUNCTION_33_6();
    OUTLINED_FUNCTION_33_6();
    v30 = sub_1B11BA9F0();
    v31 = sub_1B11BB494();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = OUTLINED_FUNCTION_4_1();
      v50 = (_QWORD *)OUTLINED_FUNCTION_4_1();
      v51 = OUTLINED_FUNCTION_4_1();
      v57[0] = v51;
      *(_DWORD *)v32 = 136315394;
      v49[1] = v32 + 4;
      OUTLINED_FUNCTION_49_6();
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      v34 = NSStringFromClass(ObjCClassFromMetadata);
      v35 = sub_1B11BB3C8();
      v37 = v36;

      v54 = sub_1B117C4E0(v35, v37, v57);
      sub_1B11BB4E8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2112;
      OUTLINED_FUNCTION_33_6();
      v38 = _swift_stdlib_bridgeErrorToNSError();
      v54 = v38;
      sub_1B11BB4E8();
      *v50 = v38;
      OUTLINED_FUNCTION_16_6();
      OUTLINED_FUNCTION_16_6();
      _os_log_impl(&dword_1B1170000, v30, v31, "%s - Encountered Error while resolving passDictionary: %@", (uint8_t *)v32, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
      OUTLINED_FUNCTION_34_2();
      OUTLINED_FUNCTION_161();
    }
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_16_6();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v52, v53);
  }
  sub_1B117C45C(0, (unint64_t *)&unk_1EEF12040);
  v40 = OUTLINED_FUNCTION_9(v39, sel_walletPassData);
  v41 = sub_1B11BA96C();
  v43 = v42;

  *(_QWORD *)&v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passViewManager] = sub_1B11A7930(v41, v43);
  v44 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v45 = objc_msgSend(v44, sel_userInterfaceIdiom);

  v10[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_bannerForVisionDevice] = v45 == (id)6;
  v46 = (objc_class *)OUTLINED_FUNCTION_49_6();
  v55.receiver = v10;
  v55.super_class = v46;
  v47 = objc_msgSendSuper2(&v55, sel_init);

  return v47;
}

id sub_1B11A7930(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1B11BA960();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_1B11957E0(a1, a2);

  return v6;
}

void sub_1B11A79E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (currentUIContext())
  {
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
  }
  else
  {
    switch((*(unsigned int (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))())
    {
      case 1u:
      case 3u:
        v1 = 0xD000000000000025;
        goto LABEL_7;
      case 2u:
        v1 = 0xD000000000000027;
        goto LABEL_7;
      case 4u:
        v1 = 0xD000000000000028;
LABEL_7:
        sub_1B1175A30(v1);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
        v2 = OUTLINED_FUNCTION_4_0();
        *(_OWORD *)(v2 + 16) = xmmword_1B11BE3D0;
        v3 = MEMORY[0x1E0DEB490];
        *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEB418];
        *(_QWORD *)(v2 + 64) = v3;
        *(_QWORD *)(v2 + 32) = 1;
        sub_1B11BB3A4();
        OUTLINED_FUNCTION_28_0();
        OUTLINED_FUNCTION_96();
        break;
      default:
        break;
    }
  }
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_5();
}

id sub_1B11A7B5C()
{
  _QWORD *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  __int128 v12;
  void *v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  result = (id)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
  if (result)
  {
    sub_1B1194820(0x7470697263736564, 0xEB000000006E6F69, (uint64_t)result, &v15);
    OUTLINED_FUNCTION_87();
    if (v16)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v2 = (void *)OUTLINED_FUNCTION_46_3();
        v3 = objc_msgSend(v2, sel_passStyle);

        v4 = sub_1B11BB3C8();
        v6 = v5;

        *(_QWORD *)&v15 = v4;
        *((_QWORD *)&v15 + 1) = v6;
        swift_bridgeObjectRetain();
        sub_1B11BB3F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1B11BB3F8();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_28_0();
        v7 = v15;
        v8 = (void *)OUTLINED_FUNCTION_46_3();
        objc_msgSend(v8, sel_passTimeInterval);
        v10 = v9;

        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v10);
        v15 = v7;
        swift_bridgeObjectRetain();
        sub_1B11BB3F8();
        OUTLINED_FUNCTION_28_0();
        v12 = v15;
        result = objc_msgSend((id)objc_opt_self(), sel_fullDayFormatter);
        if (result)
        {
          v13 = result;
          v14 = objc_msgSend(result, sel_stringFromDate_, v11);

          sub_1B11BB3C8();
          v15 = v12;
          swift_bridgeObjectRetain();
          sub_1B11BB3F8();

          OUTLINED_FUNCTION_28_0();
          swift_bridgeObjectRelease();
          return (id)v15;
        }
        else
        {
          __break(1u);
        }
        return result;
      }
    }
    else
    {
      sub_1B11A90BC((uint64_t)&v15);
    }
    return 0;
  }
  return result;
}

id sub_1B11A7E10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  sub_1B117C45C(0, &qword_1EEF110A8);
  v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v4 + 16) = v0;
  v5 = v0;
  return sub_1B11892A0(v1, v3, (uint64_t)sub_1B11A9120, v4);
}

void sub_1B11A7EB0(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  objc_class *ObjCClassFromMetadata;
  NSString *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;

  v2 = (_QWORD *)OUTLINED_FUNCTION_56_0();
  v3 = *(v2 - 1);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a1) + 0xF0))(v4);
  v8 = sub_1B11BA9F0();
  v9 = sub_1B11BB488();
  if (os_log_type_enabled(v8, v9))
  {
    v21[3] = v2;
    v10 = (uint8_t *)OUTLINED_FUNCTION_4_1();
    v11 = OUTLINED_FUNCTION_4_1();
    v21[2] = v3;
    v22 = v11;
    *(_DWORD *)v10 = 136315138;
    v21[1] = v10 + 4;
    OUTLINED_FUNCTION_49_6();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v13 = NSStringFromClass(ObjCClassFromMetadata);
    v14 = sub_1B11BB3C8();
    v16 = v15;

    v21[4] = sub_1B117C4E0(v14, v16, &v22);
    sub_1B11BB4E8();
    OUTLINED_FUNCTION_28_0();
    _os_log_impl(&dword_1B1170000, v8, v9, "%s - SGWalletPassSuggestion primary action initiated", v10, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_161();
  }

  v17 = (*(uint64_t (**)(char *, _QWORD *))(v3 + 8))(v6, v2);
  v18 = (*(uint64_t (**)(uint64_t))((*v7 & *a1) + 0xA8))(v17);
  if ((v18 - 1) < 2)
  {
    if (!OUTLINED_FUNCTION_20_6())
      return;
    v19 = objc_msgSend((id)OUTLINED_FUNCTION_12_3(), sel_addPassViewController);
    OUTLINED_FUNCTION_23();
    if (!a1)
    {
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_10;
  }
  if (v18 == 3 && OUTLINED_FUNCTION_20_6())
  {
    OUTLINED_FUNCTION_12_3();
    v20 = objc_allocWithZone((Class)type metadata accessor for PKViewPassController());
    a1 = OUTLINED_FUNCTION_48_4();
LABEL_10:
    objc_msgSend(v2, sel_presentViewController_, a1);
    swift_unknownObjectRelease();

  }
}

void sub_1B11A8128()
{
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_48_4();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11A816C()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_bannerForVisionDevice))
    return 4;
  else
    return 0;
}

void sub_1B11A81A4()
{
  sub_1B11758C4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_41();
}

void sub_1B11A81D8()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
  v3 = objc_msgSend(v2, sel_icon);

  if (v3)
    OUTLINED_FUNCTION_5();
  else
    (*(void (**)(void))((*v1 & *v0) + 0x1B0))();
}

id sub_1B11A827C()
{
  return OUTLINED_FUNCTION_27(26);
}

void sub_1B11A82A0(unint64_t a1)
{
  uint64_t v1;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_1B11BB56C();
    OUTLINED_FUNCTION_13_0();
    if (!v1)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
LABEL_3:
    sub_1B1175A30(0xD00000000000002FLL);
LABEL_5:
  OUTLINED_FUNCTION_41();
}

void sub_1B11A8328(unint64_t a1)
{
  OUTLINED_FUNCTION_25_4();
  OUTLINED_FUNCTION_61_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  *(_OWORD *)(OUTLINED_FUNCTION_4_0() + 16) = xmmword_1B11BE3D0;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_22_0();
    sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_17(MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B11A846C()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

void sub_1B11A84B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = OUTLINED_FUNCTION_56_0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = currentUIContext();
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  switch((*(unsigned int (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))())
  {
    case 0u:
      (*(void (**)(void))((*v6 & *v0) + 0xF0))();
      v7 = sub_1B11BA9F0();
      v8 = sub_1B11BB494();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)OUTLINED_FUNCTION_4_1();
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B1170000, v7, v8, "Error: Encountered Wallet Pass with \"Unknown\" state", v9, 2u);
        OUTLINED_FUNCTION_161();
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
    case 1u:
      v10 = 0xD00000000000001ALL;
      v11 = 0xD000000000000024;
      goto LABEL_10;
    case 2u:
    case 4u:
      if (v5)
        v12 = 0xD000000000000025;
      else
        v12 = 0xD00000000000001DLL;
      goto LABEL_13;
    case 3u:
      v10 = 0xD00000000000001BLL;
      v11 = 0xD000000000000028;
LABEL_10:
      if (v5)
        v12 = v11;
      else
        v12 = v10;
LABEL_13:
      sub_1B1175A30(v12);
      OUTLINED_FUNCTION_28_0();
      break;
    default:
      break;
  }
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_22();
}

id sub_1B11A86B4()
{
  return objc_msgSend((id)objc_opt_self(), sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E0D19A78]);
}

id sub_1B11A86EC()
{
  return OUTLINED_FUNCTION_27(30);
}

id SGWalletPassSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SGWalletPassSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SGWalletPassSuggestion.__deallocating_deinit()
{
  return sub_1B11A8F18(0, type metadata accessor for SGWalletPassSuggestion);
}

id sub_1B11A87FC()
{
  id *v0;

  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_11(*v0);
}

void sub_1B11A8824(void *a1)
{
  sub_1B1194014(a1, &OBJC_IVAR____TtC17CoreSuggestionsUI20PKViewPassController_passViewManager);
}

void sub_1B11A8830()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_41();
}

id sub_1B11A8860(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI20PKViewPassController_passViewManager] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for PKViewPassController();
  return objc_msgSendSuper2(&v3, sel_initWithNibName_bundle_, 0, 0);
}

void sub_1B11A88A4()
{
  sub_1B11BB560();
  __break(1u);
}

void sub_1B11A8908()
{
  _QWORD *v0;
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  _QWORD v58[4];
  objc_super v59;

  v1 = (objc_class *)type metadata accessor for PKViewPassController();
  v59.receiver = v0;
  v59.super_class = v1;
  v2 = objc_msgSendSuper2(&v59, sel_viewDidLoad);
  v3 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))(v2);
  v4 = objc_msgSend(v3, sel_title);

  v5 = sub_1B11BB3C8();
  v7 = v6;

  sub_1B11997D4(v5, v7, v0);
  v8 = sub_1B1175A30(0xD000000000000021);
  v10 = v9;
  v58[3] = v1;
  v58[0] = v0;
  objc_allocWithZone(MEMORY[0x1E0DC34F0]);
  v11 = v0;
  v12 = sub_1B11995A8((uint64_t)v8, v10, 2, v58, (uint64_t)sel_dismissalPressed_);
  v13 = OUTLINED_FUNCTION_9((uint64_t)v12, sel_navigationItem);
  objc_msgSend(v13, sel_setRightBarButtonItem_, v12, v58[0]);

  v15 = OUTLINED_FUNCTION_9(v14, sel_navigationController);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, sel_navigationBar);

    objc_msgSend(v17, sel_setShadowImage_, 0);
  }
  v58[0] = OUTLINED_FUNCTION_46_3();
  v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEF12068));
  v19 = (void *)sub_1B11BADBC();
  objc_msgSend(v11, sel_addChildViewController_, v19);
  v20 = OUTLINED_FUNCTION_5_3();
  if (!v20)
  {
    __break(1u);
    goto LABEL_16;
  }
  v21 = v20;
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v23 = OUTLINED_FUNCTION_9(v22, sel_view);
  if (!v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v24 = v23;
  v25 = OUTLINED_FUNCTION_5_3();
  if (!v25)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v26 = v25;
  objc_msgSend(v24, sel_addSubview_, v25);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
  v27 = OUTLINED_FUNCTION_4_0();
  *(_OWORD *)(v27 + 16) = xmmword_1B11BEB80;
  v28 = OUTLINED_FUNCTION_5_3();
  if (!v28)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v29 = objc_msgSend(v28, sel_leadingAnchor);
  OUTLINED_FUNCTION_41_7();
  v31 = OUTLINED_FUNCTION_9(v30, sel_view);
  if (!v31)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_leadingAnchor);
  OUTLINED_FUNCTION_42_5();
  v34 = OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_101_2();

  *(_QWORD *)(v27 + 32) = v32;
  v35 = OUTLINED_FUNCTION_5_3();
  if (!v35)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v36 = objc_msgSend(v35, sel_trailingAnchor);
  OUTLINED_FUNCTION_41_7();
  v38 = OUTLINED_FUNCTION_9(v37, sel_view);
  if (!v38)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, sel_trailingAnchor);
  OUTLINED_FUNCTION_42_5();
  v41 = OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_101_2();

  *(_QWORD *)(v27 + 40) = v39;
  v42 = OUTLINED_FUNCTION_5_3();
  if (!v42)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v43 = objc_msgSend(v42, sel_topAnchor);
  OUTLINED_FUNCTION_41_7();
  v45 = OUTLINED_FUNCTION_9(v44, sel_view);
  if (!v45)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v46 = v45;
  v47 = objc_msgSend(v45, sel_topAnchor);
  OUTLINED_FUNCTION_42_5();
  v48 = OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_101_2();

  *(_QWORD *)(v27 + 48) = v46;
  v49 = OUTLINED_FUNCTION_5_3();
  if (!v49)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v50 = objc_msgSend(v49, sel_bottomAnchor);
  OUTLINED_FUNCTION_101_2();
  v52 = OUTLINED_FUNCTION_9(v51, sel_view);
  if (v52)
  {
    v53 = v52;
    v54 = (void *)objc_opt_self();
    v55 = objc_msgSend(v53, sel_bottomAnchor);

    v56 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v55);
    *(_QWORD *)(v27 + 56) = v56;
    v58[0] = v27;
    sub_1B11BB44C();
    sub_1B117C45C(0, (unint64_t *)&qword_1ED3818B8);
    v57 = (void *)sub_1B11BB428();
    OUTLINED_FUNCTION_87();
    objc_msgSend(v54, sel_activateConstraints_, v57);

    objc_msgSend(v19, sel_didMoveToParentViewController_, v11);
    return;
  }
LABEL_25:
  __break(1u);
}

CoreSuggestionsUI::PKPassHostingView __swiftcall PKPassHostingView.init(_:)(CoreSuggestionsUI::PKPassHostingView result)
{
  Class *v1;

  *v1 = result.passViewController.super.isa;
  return result;
}

uint64_t sub_1B11A8E3C()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

id sub_1B11A8EA4()
{
  void *v0;

  return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1B11A8EBC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1B11A8F0C(uint64_t a1)
{
  return sub_1B11A8F18(a1, type metadata accessor for PKViewPassController);
}

id sub_1B11A8F18(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_1B11A8F58(int a1, id a2)
{
  id result;

  result = objc_msgSend(a2, sel_passView);
  if (!result)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  return result;
}

id sub_1B11A8FA0(int a1)
{
  id *v1;

  return sub_1B11A8F58(a1, *v1);
}

uint64_t sub_1B11A8FA8()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE64();
}

uint64_t sub_1B11A8FD8()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_127();
  return sub_1B11BAE10();
}

void sub_1B11A9008()
{
  sub_1B11A94CC();
  sub_1B11BAE58();
  __break(1u);
}

id PKPassHostingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  id v4;

  v4 = *v1;
  *(_QWORD *)a1 = sub_1B11BAD20();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
  *(_QWORD *)(a1 + 56) = v4;
  return v4;
}

uint64_t type metadata accessor for SGWalletPassSuggestion()
{
  uint64_t result;

  result = qword_1EEF13710;
  if (!qword_1EEF13710)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B11A90BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12050);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B11A90FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B11A9120()
{
  uint64_t v0;

  sub_1B11A7EB0(*(_QWORD **)(v0 + 16));
}

uint64_t type metadata accessor for PKViewPassController()
{
  return objc_opt_self();
}

unint64_t sub_1B11A914C()
{
  unint64_t result;

  result = qword_1EEF12070;
  if (!qword_1EEF12070)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BFA3C, &type metadata for PKPassViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EEF12070);
  }
  return result;
}

uint64_t sub_1B11A9188()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B11A9198()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B11BAA08();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SGWalletPassSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.__allocating_init(realtimeWalletPass:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategory()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionSubtitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionPrimaryAction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryId()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryImage()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryTitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategorySubtitle(forItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryActionButtonType()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.realtimeSuggestion()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

ValueMetadata *type metadata accessor for PKPassViewRepresentable()
{
  return &type metadata for PKPassViewRepresentable;
}

ValueMetadata *type metadata accessor for PKPassHostingView()
{
  return &type metadata for PKPassHostingView;
}

unint64_t sub_1B11A9440()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEF12128;
  if (!qword_1EEF12128)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEF12130);
    result = MEMORY[0x1B5E17C68](MEMORY[0x1E0CDFB10], v1);
    atomic_store(result, (unint64_t *)&qword_1EEF12128);
  }
  return result;
}

void type metadata accessor for SGRealtimeWalletPassState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EEF12138)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEF12138);
  }
}

unint64_t sub_1B11A94CC()
{
  unint64_t result;

  result = qword_1EEF12148;
  if (!qword_1EEF12148)
  {
    result = MEMORY[0x1B5E17C68](&unk_1B11BF9AC, &type metadata for PKPassViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EEF12148);
  }
  return result;
}

void sub_1B11A950C(void *a1@<X0>, _QWORD *a2@<X8>)
{
  double v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  _QWORD *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  double *v24;
  double *v25;
  double v26;
  double *v27;
  double *v28;
  double *v29;
  double v30;
  double (*v31)(void);
  double v32;
  _QWORD *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  uint64_t *v38;
  _QWORD *v39;
  double *v40;
  double *v41;
  uint64_t v42;
  double *v43;
  double *v44;
  double *v45;
  double *v46;
  uint64_t v47;
  double v48;
  double v49;
  double *v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  double v56;
  uint64_t v57;

  v5 = OUTLINED_FUNCTION_58();
  v6 = *(int *)(v5 + 60);
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  *(_QWORD *)((char *)a2 + v6) = v9;
  v10 = *(int *)(v5 + 64);
  v11 = objc_msgSend(v7, sel_currentDevice);
  v12 = objc_msgSend(v11, sel_userInterfaceIdiom);

  *((_BYTE *)a2 + v10) = v12 == (id)6;
  sub_1B11758DC();
  swift_bridgeObjectRetain();
  v13 = *(_QWORD *)sub_1B11758E8();
  OUTLINED_FUNCTION_230();
  sub_1B11BA9FC();
  v14 = a1;
  v15 = sub_1B11BA9F0();
  v16 = sub_1B11BB4AC();
  v17 = OUTLINED_FUNCTION_40_4(v16);
  v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (v17)
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_4_1();
    v20 = OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v19 = 136315138;
    v57 = v20;
    v21 = OUTLINED_FUNCTION_26_4();
    v22 = sub_1B1176D68(v21);
    sub_1B117C4E0(v22, v23, &v57);
    sub_1B11BB4E8();

    OUTLINED_FUNCTION_87();
    _os_log_impl(&dword_1B1170000, v15, (os_log_type_t)v13, "SGBannerPaddingParams: Action Button: %s", v19, 0xCu);
    OUTLINED_FUNCTION_54_4();
    OUTLINED_FUNCTION_161();
  }

  switch(OUTLINED_FUNCTION_26_4())
  {
    case 0:
      v24 = (double *)sub_1B11755C0();
      v25 = (double *)OUTLINED_FUNCTION_52_4(v24);
      v26 = *v25;
      a2[1] = *(_QWORD *)v25;
      v27 = (double *)sub_1B117559C();
      OUTLINED_FUNCTION_65_4(v27);
      v28 = (double *)sub_1B11755A8();
      OUTLINED_FUNCTION_64_3(v28);
      v29 = (double *)sub_1B11755B4();
      v30 = OUTLINED_FUNCTION_66_2(v29);
      a2[3] = 0;
      a2[7] = 0;
      v31 = *(double (**)(void))((*v18 & *v14) + 0x2D0);
      if (((double (*)(double))v31)(v30) <= 0.0)
        v32 = *v24;
      else
        v32 = v31() + *v24;
      goto LABEL_14;
    case 1:
      *a2 = 0;
      a2[9] = 0;
      v33 = sub_1B11755D8();
      a2[1] = *v33;
      a2[2] = *(_QWORD *)sub_1B11756E0();
      a2[4] = *v33;
      a2[3] = *(_QWORD *)sub_1B11756EC();
      a2[5] = 0;
      a2[7] = 0;
      a2[8] = 0;
      v34 = OUTLINED_FUNCTION_27_6();
      if (v35 <= 0.0)
      {
        v42 = *(_QWORD *)sub_1B11755C0();
LABEL_18:

        a2[6] = v42;
      }
      else
      {
        v36 = ((double (*)(uint64_t))v15)(v34);
        v37 = *(double *)sub_1B11755C0();

        *((double *)a2 + 6) = v36 + v37;
      }
      return;
    case 2:
      v38 = (uint64_t *)sub_1B11756F8();
      v39 = OUTLINED_FUNCTION_52_4(v38);
      a2[1] = *v39;
      a2[2] = *(_QWORD *)sub_1B1175704();
      a2[4] = *v39;
      v40 = (double *)sub_1B1175710();
      OUTLINED_FUNCTION_64_3(v40);
      v41 = (double *)sub_1B117571C();
      OUTLINED_FUNCTION_66_2(v41);
      a2[7] = 0;
      a2[3] = 0;
      v42 = *v38;
      goto LABEL_18;
    case 3:
      *a2 = *(_QWORD *)sub_1B1175740();
      a2[9] = 0;
      v43 = (double *)sub_1B1175770();
      v26 = *v43;
      a2[1] = *(_QWORD *)v43;
      v44 = (double *)sub_1B117574C();
      OUTLINED_FUNCTION_65_4(v44);
      v45 = (double *)sub_1B1175758();
      OUTLINED_FUNCTION_64_3(v45);
      v46 = (double *)sub_1B1175764();
      OUTLINED_FUNCTION_66_2(v46);
      a2[7] = *(_QWORD *)sub_1B1175734();
      a2[3] = 0;
      v47 = OUTLINED_FUNCTION_27_6();
      v49 = v48;
      v32 = 0.0;
      if (v49 > 0.0)
        ((void (*)(uint64_t, double))v15)(v47, 0.0);
LABEL_14:
      *((double *)a2 + 6) = v32;
      v53 = (*(uint64_t (**)(void))((*v18 & *v14) + 0x120))();
      v55 = sub_1B11A99D4(v53, v54, 1u);
      OUTLINED_FUNCTION_87();
      if ((v55 & 1) != 0)
      {

      }
      else
      {
        *((double *)a2 + 1) = v26 + *(double *)sub_1B11755E4();
        v56 = *(double *)sub_1B11755F0();

        *((double *)a2 + 4) = v2 + v56;
      }
      return;
    case 4:
      *a2 = *(_QWORD *)sub_1B11757C4();
      a2[9] = *(_QWORD *)sub_1B1175608();
      a2[1] = *(_QWORD *)sub_1B11757DC();
      a2[2] = *(_QWORD *)sub_1B11757D0();
      a2[4] = *(_QWORD *)sub_1B11757E8();
      v50 = (double *)sub_1B1175858();
      OUTLINED_FUNCTION_64_3(v50);
      v51 = (double *)sub_1B1175864();
      OUTLINED_FUNCTION_66_2(v51);
      a2[7] = *sub_1B117580C();
      v52 = *(_QWORD *)sub_1B117584C();

      a2[6] = v52;
      a2[3] = 0;
      return;
    default:

      *((_OWORD *)a2 + 3) = 0u;
      *((_OWORD *)a2 + 4) = 0u;
      *((_OWORD *)a2 + 1) = 0u;
      *((_OWORD *)a2 + 2) = 0u;
      *(_OWORD *)a2 = 0u;
      return;
  }
}

uint64_t sub_1B11A99D4(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  int v4;
  uint64_t result;
  unint64_t v6;
  int v8;
  int v9;
  int v10;

  if (a2)
  {
    v3 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v3 = a1 & 0xFFFFFFFFFFFFLL;
    v4 = (v3 != 0) & a3;
    swift_bridgeObjectRetain();
    while (1)
    {
      result = sub_1B11BB404();
      if (!v6)
      {
        v10 = 256;
LABEL_23:
        swift_bridgeObjectRelease();
        return v10 | v4;
      }
      if (!((v6 & 0x2000000000000000) != 0 ? HIBYTE(v6) & 0xF : result & 0xFFFFFFFFFFFFLL))
        break;
      if ((v6 & 0x1000000000000000) != 0)
      {
        v8 = sub_1B11BB524();
      }
      else
      {
        if ((v6 & 0x2000000000000000) == 0 && (result & 0x1000000000000000) == 0)
          sub_1B11BB548();
        v8 = sub_1B11BB554();
      }
      v9 = v8;
      OUTLINED_FUNCTION_13_0();
      if ((v9 - 14) > 0xFFFFFFFB)
      {
        v10 = 0;
        goto LABEL_23;
      }
      v10 = 0;
      if ((v9 - 8232) < 2 || v9 == 133)
        goto LABEL_23;
    }
    __break(1u);
  }
  else
  {
    v10 = 0;
    v4 = 0;
    return v10 | v4;
  }
  return result;
}

void sub_1B11A9B04(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  BOOL v9;
  _QWORD *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int16 v39;
  char v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  id *v48;
  uint64_t v49[3];
  BOOL v50;

  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  v47 = (_QWORD *)(a2 + 64);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  v48 = (id *)(a2 + 32);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  *(_BYTE *)a2 = v5 == (id)6;
  v6 = *((_QWORD *)sub_1B11758DC() + 1);
  OUTLINED_FUNCTION_201();
  sub_1B11758E8();
  type metadata accessor for SGBannerIconParams(0);
  swift_bridgeObjectRetain();
  v7 = sub_1B11BA9FC();
  *(_WORD *)(a2 + 1) = 0;
  v8 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x1F8);
  v50 = ((uint64_t (*)(uint64_t))v8)(v7) == 0;
  *(_QWORD *)(a2 + 96) = 0;
  if (v5 == (id)6)
  {
    *(_QWORD *)(a2 + 96) = *(_QWORD *)sub_1B117577C();
    v9 = v8() == 3 || v8() == 4;
    v50 = v9;
  }
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  v10 = a1;
  v11 = sub_1B11BA9F0();
  v12 = sub_1B11BB4AC();
  if (OUTLINED_FUNCTION_40_4(v12))
  {
    v13 = OUTLINED_FUNCTION_4_1();
    v49[0] = OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v13 = 136315394;
    v14 = v8();
    v15 = sub_1B1176D68(v14);
    sub_1B117C4E0(v15, v16, v49);
    sub_1B11BB4E8();

    OUTLINED_FUNCTION_87();
    *(_WORD *)(v13 + 12) = 1024;
    sub_1B11BB4E8();
    _os_log_impl(&dword_1B1170000, v11, (os_log_type_t)v6, "SGBanner Type: %s Supports: %{BOOL}d", (uint8_t *)v13, 0x12u);
    OUTLINED_FUNCTION_54_4();
    OUTLINED_FUNCTION_161();
  }

  swift_beginAccess();
  if (!v50)
  {

    return;
  }
  OUTLINED_FUNCTION_37_5();
  v18 = OUTLINED_FUNCTION_31_8(*(uint64_t (**)(void))(v17 + 528));
  if (!v18)
  {

    v23 = 0;
    *(_QWORD *)(a2 + 80) = 0;
    goto LABEL_27;
  }
  v19 = v18;
  v20 = v18 & 0xFFFFFFFFFFFFFF8;
  if (v18 >> 62)
  {
    OUTLINED_FUNCTION_114();
    v21 = OUTLINED_FUNCTION_38_1();
    OUTLINED_FUNCTION_87();
    if (v21 >= 1)
    {
      OUTLINED_FUNCTION_114();
      if (OUTLINED_FUNCTION_38_1())
        goto LABEL_13;
      OUTLINED_FUNCTION_87();
      __break(1u);
    }
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  v21 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v21)
    goto LABEL_21;
  OUTLINED_FUNCTION_114();
LABEL_13:
  if ((v19 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_46_4();
  if (!*(_QWORD *)(v20 + 16))
  {
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    OUTLINED_FUNCTION_46_4();
  }
  v22 = *(id *)(v19 + 32);
  OUTLINED_FUNCTION_87();
LABEL_22:

  *(_QWORD *)(a2 + 80) = v22;
  if (v21 <= 1)
  {
    OUTLINED_FUNCTION_87();
    v23 = 0;
LABEL_27:

    *(_QWORD *)(a2 + 88) = v23;
    OUTLINED_FUNCTION_37_5();
    v25 = OUTLINED_FUNCTION_31_8(*(uint64_t (**)(void))(v24 + 360));
    if (!v25)
    {

      v30 = 0;
      *(_QWORD *)(a2 + 40) = 0;
LABEL_44:

      *v48 = v30;
      OUTLINED_FUNCTION_37_5();
      v32 = (_QWORD *)OUTLINED_FUNCTION_31_8(*(uint64_t (**)(void))(v31 + 768));
      if (!v32)
      {
        swift_bridgeObjectRelease();
        v37 = 0;
        v38 = 0;
        *v47 = 0;
        v47[1] = 0;
LABEL_53:
        swift_bridgeObjectRelease();
        *(_QWORD *)(a2 + 48) = v37;
        *(_QWORD *)(a2 + 56) = v38;
        v39 = sub_1B11AA0B0(v10);
        v40 = v39 > 0xFFu;
        *(_BYTE *)(a2 + 1) = v39 & 1;
        *(_BYTE *)(a2 + 2) = v40;
        v41 = v8();
        v42 = sub_1B11AA1D4(v41, v40);
        v44 = v43;
        v46 = v45;

        *(double *)(a2 + 8) = v42;
        *(_QWORD *)(a2 + 16) = v44;
        *(_QWORD *)(a2 + 24) = v46;
        return;
      }
      v33 = v32;
      v34 = v32[2];
      if (v34)
      {
        v36 = v32[4];
        v35 = v32[5];
        swift_bridgeObjectRetain();
      }
      else
      {
        v36 = 0;
        v35 = 0;
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(a2 + 64) = v36;
      *(_QWORD *)(a2 + 72) = v35;
      if (v34 < 2)
      {
        OUTLINED_FUNCTION_87();
        v37 = 0;
        v38 = 0;
        goto LABEL_53;
      }
      if (v33[2] >= 2uLL)
      {
        v37 = v33[6];
        v38 = v33[7];
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_87();
        goto LABEL_53;
      }
      __break(1u);
      goto LABEL_61;
    }
    v26 = v25;
    v27 = v25 & 0xFFFFFFFFFFFFFF8;
    if (v25 >> 62)
    {
      OUTLINED_FUNCTION_114();
      v28 = OUTLINED_FUNCTION_38_1();
      OUTLINED_FUNCTION_87();
      if (v28 >= 1)
      {
        OUTLINED_FUNCTION_114();
        if (OUTLINED_FUNCTION_38_1())
        {
LABEL_31:
          if ((v26 & 0xC000000000000001) != 0)
            OUTLINED_FUNCTION_46_4();
          if (*(_QWORD *)(v27 + 16))
          {
            v29 = *(id *)(v26 + 32);
            OUTLINED_FUNCTION_87();
            goto LABEL_39;
          }
          goto LABEL_57;
        }
        OUTLINED_FUNCTION_87();
        __break(1u);
      }
    }
    else
    {
      v28 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v28)
      {
        OUTLINED_FUNCTION_114();
        goto LABEL_31;
      }
    }
    v29 = 0;
LABEL_39:

    *(_QWORD *)(a2 + 40) = v29;
    if (v28 <= 1)
    {
      OUTLINED_FUNCTION_87();
      v30 = 0;
    }
    else
    {
      if ((v26 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_46_4();
      if (*(_QWORD *)(v27 + 16) <= 1uLL)
        goto LABEL_62;
      v30 = *(id *)(v26 + 40);
      OUTLINED_FUNCTION_87();
    }
    goto LABEL_44;
  }
  if ((v19 & 0xC000000000000001) != 0)
    goto LABEL_58;
  if (*(_QWORD *)(v20 + 16) > 1uLL)
  {
    v23 = *(id *)(v19 + 40);
    OUTLINED_FUNCTION_87();
    goto LABEL_27;
  }
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
}

uint64_t sub_1B11AA0B0(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x210))();
  if (v3)
  {
    if (v3 >> 62)
      v4 = OUTLINED_FUNCTION_112_2();
    else
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v3 = OUTLINED_FUNCTION_13_0();
    v5 = v4 > 1;
    if (v4 > 0)
      goto LABEL_11;
  }
  else
  {
    v5 = 0;
  }
  v6 = (*(uint64_t (**)(unint64_t))((*v2 & *a1) + 0x168))(v3);
  if (!v6
    || (v6 >> 62 ? (v7 = OUTLINED_FUNCTION_112_2()) : (v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)),
        OUTLINED_FUNCTION_13_0(),
        v5 = v7 > 1,
        v7 <= 0))
  {
    v9 = (*(uint64_t (**)(void))((*v2 & *a1) + 0x300))();
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 16);
      swift_bridgeObjectRelease();
      v8 = v10 != 0;
      v5 = v10 > 1;
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_15;
  }
LABEL_11:
  v8 = 1;
LABEL_15:
  if (v5)
    v11 = 256;
  else
    v11 = 0;
  return v11 | v8;
}

double sub_1B11AA1D4(uint64_t a1, char a2)
{
  double *v2;
  _QWORD *v3;
  double v4;

  if ((a2 & 1) != 0)
  {
    if (a1 == 4)
    {
      v2 = (double *)sub_1B11757F4();
    }
    else if (a1 == 3)
    {
      v2 = (double *)sub_1B1175728();
    }
    else if (a1)
    {
      v2 = (double *)sub_1B117556C();
    }
    else
    {
      v2 = (double *)sub_1B1175578();
    }
    v4 = *v2;
    sub_1B1175584();
    sub_1B1175590();
  }
  else
  {
    if (a1 == 4)
    {
      v3 = sub_1B11757F4();
    }
    else if (a1 == 3)
    {
      v3 = sub_1B1175728();
    }
    else
    {
      v3 = sub_1B117556C();
    }
    return *(double *)v3;
  }
  return v4;
}

uint64_t sub_1B11AA26C(_QWORD *a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x270))();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, sel_position);
    if ((v4 & 1) != 0)
    {
      v5 = OUTLINED_FUNCTION_62_5();
      v6 = MEMORY[0x1B5E17248](v5);
    }
    else
    {
      v6 = sub_1B11BB194();
    }
    v7 = v6;
    if ((v4 & 2) != 0)
    {
      v8 = OUTLINED_FUNCTION_62_5();
      MEMORY[0x1B5E17248](v8);
    }
    else
    {
      sub_1B11BB194();
    }

  }
  else
  {
    sub_1B11BB194();
    v7 = sub_1B11BB194();
  }

  return v7;
}

void sub_1B11AA354(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned __int16 v25;
  char v26;
  BOOL v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;

  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = (uint64_t (*)(void))objc_msgSend(v4, sel_userInterfaceIdiom);

  *(_BYTE *)a2 = v5 == (uint64_t (*)(void))6;
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v7 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *a1) + 0x180))();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  *(_BYTE *)(a2 + 3) = v10 != 0;
  *(_QWORD *)(a2 + 8) = 0x6B72616D78;
  *(_QWORD *)(a2 + 16) = 0xE500000000000000;
  OUTLINED_FUNCTION_36_4();
  v12 = *(uint64_t (**)(void))(v11 + 336);
  v13 = v12();
  if (v5 != (uint64_t (*)(void))6)
  {
    if (v13 == 1)
    {
      if (OUTLINED_FUNCTION_13_6())
        v15 = v5() == 1;
      else
        v15 = 1;
    }
    else
    {
      v15 = 0;
    }
    *(_BYTE *)(a2 + 2) = v15;
    v20 = v12();
    v19 = 0;
    v21 = !v15;
    if (v20 != 1)
      v21 = 0;
    *(_BYTE *)(a2 + 1) = v21;
    v14 = *(_QWORD *)((*v6 & *a1) + 0x1F8);
    goto LABEL_22;
  }
  if (v13 == 1)
    v14 = OUTLINED_FUNCTION_13_6() == 2 || MEMORY[6]() == 4;
  else
    v14 = 0;
  *(_BYTE *)(a2 + 2) = v14;
  v16 = v12();
  v17 = v14 ^ 1;
  if (v16 != 1)
    v17 = 0;
  *(_BYTE *)(a2 + 1) = v17;
  if (OUTLINED_FUNCTION_13_6() != 4)
  {
    v19 = 3;
LABEL_22:
    v18 = ((uint64_t (*)(void))v14)() == v19;
    goto LABEL_23;
  }
  v18 = 1;
LABEL_23:
  OUTLINED_FUNCTION_36_4();
  v23 = (*(uint64_t (**)(void))(v22 + 288))();
  v25 = sub_1B11A99D4(v23, v24, v18);
  v26 = v25;
  v27 = v25 > 0xFFu;
  OUTLINED_FUNCTION_96();
  *(_BYTE *)(a2 + 4) = v26 & 1;
  *(_BYTE *)(a2 + 5) = v27;
  OUTLINED_FUNCTION_36_4();
  *(_BYTE *)(a2 + 6) = (*(uint64_t (**)(void))(v28 + 744))() & 1;
  v29 = (int *)OUTLINED_FUNCTION_19();
  v30 = a2 + v29[12];
  v31 = a1;
  sub_1B11A9B04(v31, v30);
  v32 = v31;
  v33 = sub_1B11AA26C(v32);
  v34 = a2 + v29[13];
  *(_QWORD *)v34 = v33;
  *(_QWORD *)(v34 + 8) = v35;
  *(_BYTE *)(v34 + 16) = v36 & 1;
  *(_BYTE *)(v34 + 17) = v37 & 1;
  sub_1B11A950C(v32, (_QWORD *)(a2 + v29[14]));
}

uint64_t type metadata accessor for SGBannerPaddingParams(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382D70);
}

uint64_t type metadata accessor for SGBannerIconParams(uint64_t a1)
{
  return sub_1B117CEA4(a1, qword_1ED382CC0);
}

uint64_t type metadata accessor for SGBannerViewModel(uint64_t a1)
{
  return sub_1B117CEA4(a1, (uint64_t *)&unk_1ED382CB0);
}

void sub_1B11AA5E0(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_51_4();
  if ((v5 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_64_0(*(_QWORD *)a2);
  }
  else
  {
    v6 = v4;
    v7 = *(_OWORD *)(a2 + 16);
    *v2 = *(_OWORD *)a2;
    v2[1] = v7;
    v8 = *(_OWORD *)(a2 + 48);
    v2[2] = *(_OWORD *)(a2 + 32);
    v2[3] = v8;
    v2[4] = *(_OWORD *)(a2 + 64);
    v9 = OUTLINED_FUNCTION_56_0();
    OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16));
    v10 = *(int *)(v6 + 64);
    *(_QWORD *)((char *)v2 + *(int *)(v6 + 60)) = *(_QWORD *)(a2 + *(int *)(v6 + 60));
    *((_BYTE *)v2 + v10) = *(_BYTE *)(a2 + v10);
  }
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B11AA668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_56_0();
  v0 = OUTLINED_FUNCTION_60_4();
  return OUTLINED_FUNCTION_35_6(v0, v1, v2);
}

void sub_1B11AA68C(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_22();
}

void sub_1B11AA6C0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = *a2;
  OUTLINED_FUNCTION_34_4((uint64_t)a1, (uint64_t)a2);
  v7[4] = v6[4];
  v7[5] = v6[5];
  v7[6] = v6[6];
  v7[7] = v6[7];
  v7[8] = v6[8];
  v7[9] = v6[9];
  v8 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24));
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 60)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 60));
  *((_BYTE *)a1 + *(int *)(a3 + 64)) = *((_BYTE *)a2 + *(int *)(a3 + 64));
  OUTLINED_FUNCTION_22();
}

void sub_1B11AA760(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32));
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_22();
}

void sub_1B11AA794(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 40));
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_1B11AA7C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B11AA7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_56_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_49(a1 + *(int *)(a3 + 56), a2, v6);
  else
    OUTLINED_FUNCTION_5();
}

uint64_t sub_1B11AA84C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B11AA858(uint64_t a1, char a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_56_0() - 8) + 84) == a3)
  {
    v7 = OUTLINED_FUNCTION_109_0(*(int *)(a4 + 56));
    OUTLINED_FUNCTION_50(v7, v8, v9, v10);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 64)) = a2 + 1;
    OUTLINED_FUNCTION_5();
  }
}

void sub_1B11AA8B4()
{
  unint64_t v0;

  sub_1B11BAA08();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_149();
    swift_initStructMetadata();
  }
  OUTLINED_FUNCTION_68_3();
}

void sub_1B11AA938()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_51_4();
  if ((v3 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_64_0(*(_QWORD *)v2);
  }
  else
  {
    *(_BYTE *)v0 = *(_BYTE *)v2;
    *(_WORD *)(v0 + 1) = *(_WORD *)(v2 + 1);
    *(_OWORD *)(v0 + 8) = *(_OWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 32);
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v2 + 24);
    *(_QWORD *)(v0 + 32) = v4;
    v6 = *(void **)(v2 + 40);
    v5 = *(_QWORD *)(v2 + 48);
    *(_QWORD *)(v0 + 40) = v6;
    *(_QWORD *)(v0 + 48) = v5;
    v7 = *(_QWORD *)(v2 + 64);
    *(_QWORD *)(v0 + 56) = *(_QWORD *)(v2 + 56);
    *(_QWORD *)(v0 + 64) = v7;
    v8 = *(void **)(v2 + 80);
    *(_QWORD *)(v0 + 72) = *(_QWORD *)(v2 + 72);
    *(_QWORD *)(v0 + 80) = v8;
    OUTLINED_FUNCTION_61_5();
    *(_QWORD *)(v0 + 88) = v1;
    *(_QWORD *)(v0 + 96) = v9;
    OUTLINED_FUNCTION_56_0();
    OUTLINED_FUNCTION_44_5();
    v10 = v6;
    OUTLINED_FUNCTION_114();
    swift_bridgeObjectRetain();
    v11 = v8;
    v12 = v1;
    OUTLINED_FUNCTION_41_8((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  }
  OUTLINED_FUNCTION_112_0();
}

uint64_t sub_1B11AA9E0()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_199();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_56_0();
  v2 = OUTLINED_FUNCTION_60_4();
  return OUTLINED_FUNCTION_35_6(v2, v3, v4);
}

void sub_1B11AAA38(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_29_5(a1, a2);
  v4 = v3[4];
  v5[3] = v3[3];
  v5[4] = v4;
  v7 = (void *)v3[5];
  v6 = v3[6];
  v5[5] = v7;
  v5[6] = v6;
  v8 = v3[8];
  v5[7] = v3[7];
  v5[8] = v8;
  v9 = (void *)v3[10];
  v5[9] = v3[9];
  v5[10] = v9;
  OUTLINED_FUNCTION_61_5();
  *(_QWORD *)(v10 + 88) = v2;
  *(_QWORD *)(v10 + 96) = v11;
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_44_5();
  v12 = v7;
  OUTLINED_FUNCTION_114();
  swift_bridgeObjectRetain();
  v13 = v9;
  v14 = v2;
  OUTLINED_FUNCTION_41_8((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  OUTLINED_FUNCTION_112_0();
}

void sub_1B11AAAB8(_BYTE *a1, _BYTE *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v4 = OUTLINED_FUNCTION_18_6(a1, a2);
  OUTLINED_FUNCTION_34_4((uint64_t)v4, v5);
  v7 = *(void **)(v6 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v6 + 32) = v9;
  v10 = v9;

  v11 = (void *)v2[5];
  v12 = (void *)v3[5];
  v2[5] = v12;
  v13 = v12;

  v2[6] = v3[6];
  v2[7] = v3[7];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  v2[8] = v3[8];
  v2[9] = v3[9];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  v14 = (void *)v2[10];
  v15 = (void *)v3[10];
  v2[10] = v15;
  v16 = v15;

  v17 = (void *)v2[11];
  v18 = (void *)v3[11];
  v2[11] = v18;
  v19 = v18;

  v2[12] = v3[12];
  v20 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24));
  OUTLINED_FUNCTION_5();
}

void sub_1B11AAB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29_5(a1, a2);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v2 + 24);
  v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v3 + 48) = v4;
  v5 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v3 + 80) = v5;
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v2 + 96);
  v6 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

void sub_1B11AABEC(_BYTE *a1, _BYTE *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = OUTLINED_FUNCTION_18_6(a1, a2);
  *(_OWORD *)(v4 + 8) = *(_OWORD *)(v5 + 8);
  *((_QWORD *)v4 + 3) = *(_QWORD *)(v5 + 24);
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = *(_QWORD *)(v5 + 32);

  v7 = (void *)v2[5];
  v2[5] = v3[5];

  v8 = v3[7];
  v2[6] = v3[6];
  v2[7] = v8;
  swift_bridgeObjectRelease();
  v9 = v3[9];
  v2[8] = v3[8];
  v2[9] = v9;
  swift_bridgeObjectRelease();
  v10 = (void *)v2[10];
  v2[10] = v3[10];

  v11 = (void *)v2[11];
  v2[11] = v3[11];

  v2[12] = v3[12];
  v12 = OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_59_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1B11AACA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B11AACB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483646)
  {
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_56_0();
    OUTLINED_FUNCTION_49(a1 + *(int *)(a3 + 68), a2, v6);
  }
}

uint64_t sub_1B11AAD1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B11AAD28(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 2147483646)
  {
    *(_QWORD *)(a1 + 32) = a2;
    OUTLINED_FUNCTION_5();
  }
  else
  {
    OUTLINED_FUNCTION_56_0();
    v5 = OUTLINED_FUNCTION_109_0(*(int *)(a4 + 68));
    OUTLINED_FUNCTION_50(v5, v6, v7, v8);
  }
}

void sub_1B11AAD78()
{
  unint64_t v0;

  sub_1B11BAA08();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_149();
    swift_initStructMetadata();
  }
  OUTLINED_FUNCTION_68_3();
}

uint64_t sub_1B11AAE14()
{
  swift_release();
  return swift_release();
}

void sub_1B11AAE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_41();
}

void sub_1B11AAE74()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_199();
  *v1 = *v2;
  swift_retain();
  swift_release();
  v1[1] = *(_QWORD *)(v0 + 8);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_50_6();
  OUTLINED_FUNCTION_5();
}

void sub_1B11AAEC4()
{
  _OWORD *v0;
  _OWORD *v1;

  OUTLINED_FUNCTION_199();
  swift_release();
  *v1 = *v0;
  swift_release();
  OUTLINED_FUNCTION_50_6();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B11AAEF8(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 18))
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

uint64_t sub_1B11AAF38(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SGBannerDividerParams()
{
  OUTLINED_FUNCTION_29();
}

void sub_1B11AAF84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  OUTLINED_FUNCTION_51_4();
  if ((v6 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_64_0(*(_QWORD *)a2);
  }
  else
  {
    v7 = v5;
    *(_DWORD *)v2 = *(_DWORD *)a2;
    *(_BYTE *)(v2 + 4) = *(_BYTE *)(a2 + 4);
    *(_WORD *)(v2 + 5) = *(_WORD *)(a2 + 5);
    v8 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v2 + 16) = v8;
    v9 = *(int *)(v5 + 48);
    v10 = (_QWORD *)(v2 + v9);
    v11 = (_QWORD *)(a2 + v9);
    OUTLINED_FUNCTION_22_6();
    v13 = (void *)v11[5];
    v12 = v11[6];
    v10[5] = v13;
    v10[6] = v12;
    v14 = v11[8];
    v10[7] = v11[7];
    v10[8] = v14;
    v15 = (void *)v11[10];
    v10[9] = v11[9];
    v10[10] = v15;
    v16 = v11[12];
    v31 = (void *)v11[11];
    v10[11] = v31;
    v10[12] = v16;
    v17 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
    v29 = (uint64_t)v11 + v17;
    v30 = (uint64_t)v10 + v17;
    OUTLINED_FUNCTION_56_0();
    swift_bridgeObjectRetain();
    v18 = v3;
    v19 = v13;
    OUTLINED_FUNCTION_201();
    OUTLINED_FUNCTION_230();
    v20 = v15;
    v21 = v31;
    OUTLINED_FUNCTION_57_4((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
    OUTLINED_FUNCTION_2_3(*(int *)(v7 + 52));
    swift_retain();
    OUTLINED_FUNCTION_38_5();
    OUTLINED_FUNCTION_30_7();
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_1B11AB090(uint64_t a1, uint64_t a2)
{
  id *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(char *, uint64_t);

  swift_bridgeObjectRelease();
  v4 = (id *)(a1 + *(int *)(a2 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = (char *)v4 + *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  v6 = OUTLINED_FUNCTION_56_0();
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v10(v5, v6);
  swift_release();
  swift_release();
  v7 = a1 + *(int *)(a2 + 56);
  v8 = v7 + *(int *)(OUTLINED_FUNCTION_58() + 56);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v6);
}

void sub_1B11AB168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = OUTLINED_FUNCTION_24_5(a1, a2);
  v6 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v4 + 16) = v6;
  v8 = *(int *)(v7 + 48);
  v9 = (_QWORD *)(v4 + v8);
  v10 = (_QWORD *)(v5 + v8);
  OUTLINED_FUNCTION_22_6();
  v12 = (void *)v10[5];
  v11 = v10[6];
  v9[5] = v12;
  v9[6] = v11;
  v13 = v10[8];
  v9[7] = v10[7];
  v9[8] = v13;
  v14 = (void *)v10[10];
  v9[9] = v10[9];
  v9[10] = v14;
  v16 = (void *)v10[11];
  v15 = v10[12];
  v9[11] = v16;
  v9[12] = v15;
  v17 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  v29 = (uint64_t)v10 + v17;
  v30 = (uint64_t)v9 + v17;
  OUTLINED_FUNCTION_56_0();
  swift_bridgeObjectRetain();
  v18 = v3;
  v19 = v12;
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_230();
  v20 = v14;
  v21 = v16;
  OUTLINED_FUNCTION_57_4((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  OUTLINED_FUNCTION_2_3(*(int *)(a3 + 52));
  swift_retain();
  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_1_4();
}

void sub_1B11AB244(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(uint64_t, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int *v33;

  v5 = OUTLINED_FUNCTION_3_4(a1, a2);
  *((_QWORD *)v5 + 1) = *(_QWORD *)(v6 + 8);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v6 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  v7 = v4[12];
  v8 = v2 + v7;
  v9 = (_QWORD *)(v3 + v7);
  *(_BYTE *)v8 = *(_BYTE *)(v3 + v7);
  *(_BYTE *)(v8 + 1) = *(_BYTE *)(v3 + v7 + 1);
  *(_BYTE *)(v8 + 2) = *(_BYTE *)(v3 + v7 + 2);
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v3 + v7 + 8);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v3 + v7 + 16);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v3 + v7 + 24);
  v10 = *(void **)(v2 + v7 + 32);
  v11 = *(void **)(v3 + v7 + 32);
  *(_QWORD *)(v8 + 32) = v11;
  v12 = v11;

  v13 = *(void **)(v8 + 40);
  v14 = (void *)v9[5];
  *(_QWORD *)(v8 + 40) = v14;
  v15 = v14;

  *(_QWORD *)(v8 + 48) = v9[6];
  *(_QWORD *)(v8 + 56) = v9[7];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  *(_QWORD *)(v8 + 64) = v9[8];
  *(_QWORD *)(v8 + 72) = v9[9];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  v16 = *(void **)(v8 + 80);
  v17 = (void *)v9[10];
  *(_QWORD *)(v8 + 80) = v17;
  v18 = v17;

  v19 = *(void **)(v8 + 88);
  v20 = (void *)v9[11];
  *(_QWORD *)(v8 + 88) = v20;
  v21 = v20;

  *(_QWORD *)(v8 + 96) = v9[12];
  v22 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  v23 = v8 + v22;
  v24 = (char *)v9 + v22;
  v25 = OUTLINED_FUNCTION_56_0();
  v26 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 24);
  v26(v23, v24, v25);
  v27 = v4[13];
  v28 = v2 + v27;
  v29 = v3 + v27;
  *(_QWORD *)(v2 + v27) = *(_QWORD *)(v3 + v27);
  swift_retain();
  swift_release();
  *(_QWORD *)(v28 + 8) = *(_QWORD *)(v29 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(v28 + 16) = *(_BYTE *)(v29 + 16);
  *(_BYTE *)(v28 + 17) = *(_BYTE *)(v29 + 17);
  v30 = v4[14];
  v31 = (_QWORD *)(v2 + v30);
  v32 = v3 + v30;
  *v31 = *(_QWORD *)(v3 + v30);
  v31[1] = *(_QWORD *)(v3 + v30 + 8);
  v31[2] = *(_QWORD *)(v3 + v30 + 16);
  v31[3] = *(_QWORD *)(v3 + v30 + 24);
  v31[4] = *(_QWORD *)(v3 + v30 + 32);
  v31[5] = *(_QWORD *)(v3 + v30 + 40);
  v31[6] = *(_QWORD *)(v3 + v30 + 48);
  v31[7] = *(_QWORD *)(v3 + v30 + 56);
  v31[8] = *(_QWORD *)(v3 + v30 + 64);
  v31[9] = *(_QWORD *)(v3 + v30 + 72);
  v33 = (int *)type metadata accessor for SGBannerPaddingParams(0);
  v26((uint64_t)v31 + v33[14], (char *)(v32 + v33[14]), v25);
  *(_QWORD *)((char *)v31 + v33[15]) = *(_QWORD *)(v32 + v33[15]);
  *((_BYTE *)v31 + v33[16]) = *(_BYTE *)(v32 + v33[16]);
  OUTLINED_FUNCTION_60();
}

void sub_1B11AB468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = OUTLINED_FUNCTION_24_5(a1, a2);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(v7 + 8);
  v9 = *(int *)(v8 + 48);
  v10 = v6 + v9;
  *(_BYTE *)v10 = *(_BYTE *)(v7 + v9);
  *(_WORD *)(v10 + 1) = *(_WORD *)(v7 + v9 + 1);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v7 + v9 + 8);
  *(_QWORD *)(v10 + 24) = *(_QWORD *)(v7 + v9 + 24);
  v11 = *(_OWORD *)(v7 + v9 + 48);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v7 + v9 + 32);
  *(_OWORD *)(v10 + 48) = v11;
  v12 = *(_OWORD *)(v7 + v9 + 80);
  *(_OWORD *)(v10 + 64) = *(_OWORD *)(v7 + v9 + 64);
  *(_OWORD *)(v10 + 80) = v12;
  *(_QWORD *)(v10 + 96) = *(_QWORD *)(v7 + v9 + 96);
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_43_6();
  v13 = *(int *)(a3 + 52);
  v14 = v3 + v13;
  v15 = v4 + v13;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_WORD *)(v14 + 16) = *(_WORD *)(v15 + 16);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_60();
}

void sub_1B11AB530(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_3_4(a1, a2);
  v6 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v2 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(v4 + 48);
  v8 = v2 + v7;
  v9 = (_QWORD *)(v3 + v7);
  *(_BYTE *)v8 = *(_BYTE *)(v3 + v7);
  *(_BYTE *)(v8 + 1) = *(_BYTE *)(v3 + v7 + 1);
  *(_BYTE *)(v8 + 2) = *(_BYTE *)(v3 + v7 + 2);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v3 + v7 + 8);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v3 + v7 + 24);
  v10 = *(void **)(v2 + v7 + 32);
  *(_QWORD *)(v8 + 32) = v9[4];

  v11 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9[5];

  v12 = v9[7];
  *(_QWORD *)(v8 + 48) = v9[6];
  *(_QWORD *)(v8 + 56) = v12;
  swift_bridgeObjectRelease();
  v13 = v9[9];
  *(_QWORD *)(v8 + 64) = v9[8];
  *(_QWORD *)(v8 + 72) = v13;
  swift_bridgeObjectRelease();
  v14 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v9[10];

  v15 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = v9[11];

  *(_QWORD *)(v8 + 96) = v9[12];
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_43_6();
  v16 = *(int *)(v4 + 52);
  v17 = v2 + v16;
  v18 = v3 + v16;
  *(_QWORD *)(v2 + v16) = *(_QWORD *)(v3 + v16);
  swift_release();
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  swift_release();
  *(_BYTE *)(v17 + 16) = *(_BYTE *)(v18 + 16);
  *(_BYTE *)(v17 + 17) = *(_BYTE *)(v18 + 17);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B11AB678()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B11AB684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v6 = type metadata accessor for SGBannerIconParams(0);
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 48);
    }
    else
    {
      v7 = OUTLINED_FUNCTION_58();
      v8 = *(int *)(a3 + 56);
    }
    OUTLINED_FUNCTION_49(a1 + v8, a2, v7);
  }
}

uint64_t sub_1B11AB708()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B11AB714(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 16) = (a2 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    if (*(_DWORD *)(*(_QWORD *)(type metadata accessor for SGBannerIconParams(0) - 8) + 84) == a3)
    {
      v5 = *(int *)(a4 + 48);
    }
    else
    {
      OUTLINED_FUNCTION_58();
      v5 = *(int *)(a4 + 56);
    }
    v6 = OUTLINED_FUNCTION_109_0(v5);
    OUTLINED_FUNCTION_50(v6, v7, v8, v9);
  }
}

uint64_t sub_1B11AB78C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for SGBannerIconParams(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for SGBannerPaddingParams(319);
    if (v2 <= 0x3F)
    {
      OUTLINED_FUNCTION_149();
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

Swift::Void __swiftcall SGReminderSuggestion.dismissViewController(_:finished:)(UIViewController *_, Swift::Bool finished)
{
  uint64_t *v2;
  void *v5;
  void *v6;

  v5 = (void *)OUTLINED_FUNCTION_17_8(*v2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_dismissViewController_, _);
    objc_msgSend(v6, sel_suggestion_actionFinished_, v2, finished);
    swift_unknownObjectRelease();
  }
}

Swift::String __swiftcall SGReminderSuggestion.suggestionTitle()()
{
  uint64_t *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::String result;

  if (currentUIContext())
  {
    v1 = (void *)OUTLINED_FUNCTION_8_0(*v0);
    v2 = objc_msgSend(v1, sel_title);

    sub_1B11BB3C8();
    OUTLINED_FUNCTION_53_0();
  }
  else
  {
    OUTLINED_FUNCTION_27(36);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
    v3 = OUTLINED_FUNCTION_4_0();
    *(_OWORD *)(v3 + 16) = xmmword_1B11BE3D0;
    OUTLINED_FUNCTION_6_5((_QWORD *)v3, MEMORY[0x1E0DEB418]);
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_5();
  result._object = v5;
  result._countAndFlagsBits = v4;
  return result;
}

SGSuggestionAction __swiftcall SGReminderSuggestion.suggestionPrimaryAction()()
{
  void *v0;
  _QWORD *v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  _QWORD *v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  SGSuggestionAction result;

  v1 = v0;
  v2 = sub_1B11BA9F0();
  v3 = sub_1B11BB488();
  v4 = os_log_type_enabled(v2, v3);
  v5 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (v4)
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_4_1();
    v7 = OUTLINED_FUNCTION_4_1();
    *(_DWORD *)v6 = 136315138;
    v22 = v7;
    v8 = (void *)(*(uint64_t (**)(void))((*v5 & *v1) + 0x90))();
    v9 = objc_msgSend(v8, sel_loggingIdentifier);

    v10 = sub_1B11BB3C8();
    v12 = v11;

    sub_1B117C4E0(v10, v12, &v22);
    sub_1B11BB4E8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B1170000, v2, v3, "SGReminderSuggestion - SGReminder %s primary action initialized", v6, 0xCu);
    OUTLINED_FUNCTION_27_7();
    OUTLINED_FUNCTION_161();
  }

  OUTLINED_FUNCTION_33(v13, &qword_1EEF110A8);
  v14 = (*(uint64_t (**)(void))((*v5 & *v1) + 0x118))();
  v16 = v15;
  v17 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v17 + 16) = v1;
  v18 = v1;
  v19 = (objc_class *)sub_1B11892A0(v14, v16, (uint64_t)sub_1B11AC570, v17);
  result._handler = v21;
  result._title = v20;
  result.super.isa = v19;
  return result;
}

UIImage_optional __swiftcall SGReminderSuggestion.suggestionImage()()
{
  uint64_t *v0;
  objc_class *v1;
  Swift::Bool v2;
  UIImage_optional result;

  v1 = (objc_class *)OUTLINED_FUNCTION_10_6(*v0);
  result.value.super.isa = v1;
  result.is_nil = v2;
  return result;
}

SGSuggestionAction_optional __swiftcall SGReminderSuggestion.suggestionDismissAction()()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  Swift::Bool v10;
  SGSuggestionAction_optional result;

  OUTLINED_FUNCTION_33(v0, &qword_1EEF110A8);
  v2 = OUTLINED_FUNCTION_27(35);
  v4 = v3;
  v5 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v5 + 16) = v1;
  v6 = v1;
  v7 = (objc_class *)sub_1B11892A0((uint64_t)v2, v4, (uint64_t)sub_1B11AC5FC, v5);
  result.value._handler = v9;
  result.value._title = v8;
  result.value.super.isa = v7;
  result.is_nil = v10;
  return result;
}

Swift::String_optional __swiftcall SGReminderSuggestion.suggestionSubtitle()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  OUTLINED_FUNCTION_27(36);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  v0 = OUTLINED_FUNCTION_4_0();
  *(_OWORD *)(v0 + 16) = xmmword_1B11BE3D0;
  OUTLINED_FUNCTION_6_5((_QWORD *)v0, MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_5();
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

NSAttributedString_optional __swiftcall SGReminderSuggestion.suggestionAttributedSubtitle()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  objc_class *v17;
  NSAttributedString_optional result;

  v2 = v1;
  OUTLINED_FUNCTION_33(v0, (unint64_t *)&unk_1EEF107A0);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = (void *)OUTLINED_FUNCTION_8_0(*v1);
  v5 = objc_msgSend(v4, sel_title);

  sub_1B11BB3C8();
  v6 = (objc_class *)sub_1B11AC00C();
  OUTLINED_FUNCTION_33((uint64_t)v6, &qword_1EEF11AB8);
  v7 = sub_1B11AC00C();
  OUTLINED_FUNCTION_22_7();

  v8 = (*(uint64_t (**)(void))((*v3 & *v2) + 0x128))();
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12160);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B11BE3D0;
    v13 = sub_1B11BB398();
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 32) = v13;
    *(_QWORD *)(inited + 40) = 5457241;
    *(_QWORD *)(inited + 48) = 0xE300000000000000;
    type metadata accessor for Key(0);
    sub_1B11AC734(&qword_1EEF10848, (uint64_t)&unk_1B11BFCE0);
    v14 = sub_1B11BB374();
    v15 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
    v16 = sub_1B11AC498(v10, v11, v14);
    OUTLINED_FUNCTION_22_7();

  }
  v17 = v6;
  result.is_nil = v9;
  result.value.super.isa = v17;
  return result;
}

id sub_1B11AC00C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1B11BB398();
  OUTLINED_FUNCTION_13_0();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

uint64_t SGReminderSuggestion.suggestionActionButtonType()()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_bannerForVisionDevice))
    return 4;
  else
    return 0;
}

uint64_t SGReminderSuggestion.suggestionCategory()()
{
  return swift_unknownObjectRetain();
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryId()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  sub_1B11758C4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_41();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

UIImage __swiftcall SGReminderSuggestion.suggestionCategoryImage()()
{
  uint64_t *v0;

  return (UIImage)OUTLINED_FUNCTION_10_6(*v0);
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryTitle()()
{
  id v0;
  void *v1;
  Swift::String result;

  v0 = sub_1B1175A30(0xD00000000000001FLL);
  result._object = v1;
  result._countAndFlagsBits = (uint64_t)v0;
  return result;
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryTitle(forItems:)(Swift::OpaquePointer forItems)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::String result;

  if ((unint64_t)forItems._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_1B11BB56C();
    OUTLINED_FUNCTION_13_0();
    if (!v1)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (*(_QWORD *)(((unint64_t)forItems._rawValue & 0xFFFFFFFFFFFFF8) + 0x10))
LABEL_3:
    OUTLINED_FUNCTION_27(47);
LABEL_5:
  OUTLINED_FUNCTION_41();
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::String_optional __swiftcall SGReminderSuggestion.suggestionCategorySubtitle(forItems:)(Swift::OpaquePointer forItems)
{
  uint64_t v2;
  void *v3;
  Swift::String_optional result;

  OUTLINED_FUNCTION_27(39);
  OUTLINED_FUNCTION_61_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  *(_OWORD *)(OUTLINED_FUNCTION_4_0() + 16) = xmmword_1B11BE3D0;
  if ((unint64_t)forItems._rawValue >> 62)
  {
    OUTLINED_FUNCTION_22_0();
    sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_17(MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_22();
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryLocalizedCount(ofItems:)(Swift::OpaquePointer ofItems)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  OUTLINED_FUNCTION_27(39);
  OUTLINED_FUNCTION_61_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF12150);
  *(_OWORD *)(OUTLINED_FUNCTION_4_0() + 16) = xmmword_1B11BE3D0;
  if ((unint64_t)ofItems._rawValue >> 62)
  {
    OUTLINED_FUNCTION_22_0();
    sub_1B11BB56C();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_17(MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_22();
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void SGReminderSuggestion.realtimeSuggestion()()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  id v3;

  v2 = (void *)OUTLINED_FUNCTION_8_0(*v1);
  v3 = getReminderSuggestion(v2);
  OUTLINED_FUNCTION_23();
  if (v0)
    OUTLINED_FUNCTION_41();
  else
    __break(1u);
}

id sub_1B11AC498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_1B11BB398();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1B11AC734(&qword_1EEF10848, (uint64_t)&unk_1B11BFCE0);
    v6 = (void *)sub_1B11BB35C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

uint64_t sub_1B11AC54C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B11AC570()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  id v3;

  v1 = *(uint64_t **)(v0 + 16);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D86F30]), sel_initWithDelegate_, v1);
  objc_msgSend(v3, sel_setModalPresentationStyle_, 3);
  v2 = (void *)OUTLINED_FUNCTION_17_8(*v1);
  if (v2)
  {
    objc_msgSend(v2, sel_presentViewController_, v3);
    swift_unknownObjectRelease();
  }

}

uint64_t sub_1B11AC5FC()
{
  uint64_t v0;
  uint64_t *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  _QWORD v9[6];

  v1 = *(uint64_t **)(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(), sel_serviceForReminders);
  v3 = (void *)OUTLINED_FUNCTION_8_0(*v1);
  v4 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v4 + 16) = v1;
  v9[4] = sub_1B11AC770;
  v9[5] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1B1189BF0;
  v9[3] = &block_descriptor_5;
  v5 = _Block_copy(v9);
  v6 = v1;
  swift_release();
  objc_msgSend(v2, sel_rejectRealtimeReminder_withCompletion_, v3, v5);
  _Block_release(v5);

  v7 = (void *)OUTLINED_FUNCTION_17_8(*v6);
  if (v7)
  {
    objc_msgSend(v7, sel_suggestion_actionFinished_, v6, 1);
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

void sub_1B11AC734(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    type metadata accessor for Key(255);
    atomic_store(MEMORY[0x1B5E17C68](a2, v4), a1);
  }
  OUTLINED_FUNCTION_41();
}

void sub_1B11AC770(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  id v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;

  if (a1)
  {
    v76 = *(id *)(v1 + 16);
    v2 = sub_1B11BA9F0();
    v3 = sub_1B11BB494();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = OUTLINED_FUNCTION_4_1();
      v5 = (_QWORD *)OUTLINED_FUNCTION_4_1();
      v83 = OUTLINED_FUNCTION_4_1();
      *(_DWORD *)v4 = 136315394;
      v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v76) + 0x90);
      v7 = (void *)v6();
      v8 = objc_msgSend(v7, sel_loggingIdentifier);

      v9 = sub_1B11BB3C8();
      v11 = v10;

      sub_1B117C4E0(v9, v11, &v83);
      OUTLINED_FUNCTION_19_8();
      v12 = swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_5(v12, v13, v14, v15, v16, v17, v18, v19, v70, v76);
      OUTLINED_FUNCTION_4_5(v20, v21, v22, v23, v24, v25, v26, v27, v71, v77);
      *(_WORD *)(v4 + 12) = 2112;
      v28 = (void *)v6();
      v29 = objc_msgSend(v28, sel_recordId);

      v30 = OUTLINED_FUNCTION_19_8();
      *v5 = v29;
      OUTLINED_FUNCTION_4_5(v30, v31, v32, v33, v34, v35, v36, v37, v72, v78);
      OUTLINED_FUNCTION_4_5(v38, v39, v40, v41, v42, v43, v44, v45, v73, v79);
      _os_log_impl(&dword_1B1170000, v2, v3, "SGReminderSuggestionBase: Unable to reject SGReminder %s with recordId: %@", (uint8_t *)v4, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEF110B0);
      OUTLINED_FUNCTION_27_7();
      OUTLINED_FUNCTION_161();
    }

    OUTLINED_FUNCTION_4_5(v46, v47, v48, v49, v50, v51, v52, v53, v70, v76);
    OUTLINED_FUNCTION_4_5(v54, v55, v56, v57, v58, v59, v60, v61, v74, v80);
    OUTLINED_FUNCTION_4_5(v62, v63, v64, v65, v66, v67, v68, v69, v75, v81);

  }
}

void sub_1B11AC9B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  __n128 *v7;
  uint64_t v8;
  void (*v9)(uint64_t);

  OUTLINED_FUNCTION_17_9();
  v0 = (uint64_t *)OUTLINED_FUNCTION_16_7();
  (*(void (**)(unint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))(0xD000000000000012, 0x80000001B11C1CA0);
  v1 = OUTLINED_FUNCTION_0_4(*v0);
  OUTLINED_FUNCTION_16(v1, &qword_1EEF11AB8);
  OUTLINED_FUNCTION_7_7();
  v2 = OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_16(v2, &qword_1ED380C50);
  OUTLINED_FUNCTION_9_4();
  v3 = sub_1B1177BAC();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_redColor);
    v6 = objc_msgSend(v4, sel_imageWithTintColor_, v5);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
    v7 = (__n128 *)OUTLINED_FUNCTION_14_8();
    OUTLINED_FUNCTION_8_6(v7, (__n128)xmmword_1B11BD3A0);
    OUTLINED_FUNCTION_3_5();
    OUTLINED_FUNCTION_10_7();
    v8 = OUTLINED_FUNCTION_12_5();
    v9(v8);
    OUTLINED_FUNCTION_2_4(*v0);

    OUTLINED_FUNCTION_59();
  }
  else
  {
    __break(1u);
  }
}

uint64_t *sub_1B11ACB20()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *result;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  const char *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v0 = sub_1B11BAA08();
  v35 = *(_QWORD *)(v0 - 8);
  v36 = v0;
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_17_9();
  v3 = (uint64_t *)OUTLINED_FUNCTION_16_7();
  sub_1B11758DC();
  swift_bridgeObjectRetain();
  sub_1B11758E8();
  swift_bridgeObjectRetain();
  sub_1B11BA9FC();
  v4 = MEMORY[0x1E0DEEDD8];
  (*(void (**)(unint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x110))(0xD000000000000013, 0x80000001B11C1CF0);
  v5 = OUTLINED_FUNCTION_0_4(*v3);
  OUTLINED_FUNCTION_16(v5, &qword_1EEF11AB8);
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_1_5();
  v7 = (*(uint64_t (**)(void))(v6 + 320))();
  OUTLINED_FUNCTION_16(v7, &qword_1ED380C50);
  OUTLINED_FUNCTION_9_4();
  result = (uint64_t *)sub_1B1177BAC();
  if (result)
  {
    v9 = result;
    v10 = (void *)objc_opt_self();
    v11 = objc_msgSend(v10, sel_redColor);
    v12 = OUTLINED_FUNCTION_15_7(v9, sel_imageWithTintColor_renderingMode_, (uint64_t)v11);

    v13 = v12;
    result = (uint64_t *)sub_1B1177BAC();
    if (result)
    {
      v14 = result;
      v15 = objc_msgSend(v10, sel_greenColor);
      v16 = OUTLINED_FUNCTION_15_7(v14, sel_imageWithTintColor_renderingMode_, (uint64_t)v15);

      v17 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
      v18 = v16;
      v19 = objc_msgSend(v17, sel_init);
      objc_msgSend(v19, sel_addObject_, v13);

      objc_msgSend(v19, sel_addObject_, v18);
      OUTLINED_FUNCTION_1_5();
      v20 = OUTLINED_FUNCTION_12_5();
      v21(v20);
      OUTLINED_FUNCTION_1_5();
      (*(void (**)(uint64_t))(v22 + 344))(1);
      v37 = 0;
      v23 = v19;
      sub_1B11BB434();

      v24 = v37;
      OUTLINED_FUNCTION_1_5();
      if ((*(uint64_t (**)(void))(v25 + 360))())
      {
        v26 = v36;
        if (v24)
        {
          swift_bridgeObjectRetain();
          v27 = swift_bridgeObjectRetain();
          v4 = sub_1B11AD09C(v27, v24);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          if ((v4 & 1) == 0)
          {
LABEL_11:
            v28 = sub_1B11BA9F0();
            v32 = sub_1B11BB488();
            if (OUTLINED_FUNCTION_11_5(v32))
            {
              v30 = (uint8_t *)OUTLINED_FUNCTION_3_0();
              *(_WORD *)v30 = 0;
              v31 = "Unable to assign image in preview code";
              goto LABEL_13;
            }
            goto LABEL_14;
          }
LABEL_8:
          v28 = sub_1B11BA9F0();
          v29 = sub_1B11BB47C();
          if (OUTLINED_FUNCTION_11_5(v29))
          {
            v30 = (uint8_t *)OUTLINED_FUNCTION_3_0();
            *(_WORD *)v30 = 0;
            v31 = "Multiple Test Event";
LABEL_13:
            _os_log_impl(&dword_1B1170000, v28, v4, v31, v30, 2u);
            MEMORY[0x1B5E17CEC](v30, -1, -1);
          }
LABEL_14:
          v33 = v35;

          (*(void (**)(char *, uint64_t))(v33 + 8))(v2, v26);
          return v3;
        }
      }
      else
      {
        v26 = v36;
        if (!v24)
          goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1B11ACF08()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  __n128 *v8;

  OUTLINED_FUNCTION_17_9();
  v0 = (uint64_t *)OUTLINED_FUNCTION_16_7();
  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(uint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))(0x776F6C4620797542, 0xEB00000000737265);
  v2 = OUTLINED_FUNCTION_0_4(*v0);
  OUTLINED_FUNCTION_16(v2, &qword_1EEF11AB8);
  OUTLINED_FUNCTION_7_7();
  v3 = OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_16(v3, &qword_1ED380C50);
  v4 = sub_1B1177BAC();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend((id)objc_opt_self(), sel_redColor);
    v7 = OUTLINED_FUNCTION_15_7(v5, sel_imageWithTintColor_renderingMode_, (uint64_t)v6);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED381B00);
    v8 = (__n128 *)OUTLINED_FUNCTION_14_8();
    OUTLINED_FUNCTION_8_6(v8, (__n128)xmmword_1B11BD3A0);
    OUTLINED_FUNCTION_3_5();
    OUTLINED_FUNCTION_10_7();
    (*(void (**)(uint64_t, unint64_t))((*v1 & *v0) + 0x188))(0x2E64646120202020, 0xEA00000000002E2ELL);
    OUTLINED_FUNCTION_2_4(*v0);

    OUTLINED_FUNCTION_59();
  }
  else
  {
    __break(1u);
  }
}

id sub_1B11AD09C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  id v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;

  v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    v5 = sub_1B11BB56C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1B11BB56C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6)
    goto LABEL_25;
  if (!v5)
    goto LABEL_24;
  v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0)
    v7 = a1;
  if (!v4)
    v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = a2 & 0xFFFFFFFFFFFFFF8;
  v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0)
    v8 = a2;
  if ((unint64_t)a2 >> 62)
    v9 = v8;
  if (v7 == v9)
  {
LABEL_24:
    v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0)
    goto LABEL_43;
  v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
LABEL_44:
    result = (id)MEMORY[0x1B5E17608](0, a1);
  else
    result = *(id *)(a1 + 32);
  v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x1B5E17608](0, a2);
LABEL_22:
    v12 = v11;
    sub_1B1176E90(0, &qword_1ED380C50);
    v13 = sub_1B11BB4D0();

    if ((v13 & 1) != 0)
    {
      if (v5 != 1)
      {
        v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20)
            v16 = (id)MEMORY[0x1B5E17608](v15 - 4, a1);
          else
            v16 = *(id *)(a1 + 8 * v15);
          v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v17 = (id)MEMORY[0x1B5E17608](v15 - 4, a2);
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            v17 = *(id *)(a2 + 8 * v15);
          }
          v18 = v17;
          v14 = sub_1B11BB4D0();

          if ((v14 & 1) != 0)
          {
            v19 = 2 - v5 + v15++;
            if (v19 != 5)
              continue;
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SGBannerContainerPreviewData()
{
  return &type metadata for SGBannerContainerPreviewData;
}

uint64_t sub_1B11AD30C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_1B11AD62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSGMailClientUtilClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreSuggestionsInternalsLibraryCore_frameworkLibrary)
  {
    CoreSuggestionsInternalsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreSuggestionsInternalsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SGMailClientUtil");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getSGMailClientUtilClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B11AEB60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B11AEEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getEKEventViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  EventKitUILibrary();
  result = objc_getClass("EKEventViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKEventViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_23(v3);
  }
  return result;
}

void EventKitUILibrary()
{
  void *v0;

  if (!EventKitUILibraryCore_frameworkLibrary)
  {
    EventKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!EventKitUILibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

SGWalletOrderSuggestionHelpers *__getEKEventEditViewControllerClass_block_invoke(uint64_t a1)
{
  SGWalletOrderSuggestionHelpers *result;
  SGWalletOrderSuggestionHelpers *v3;
  SEL v4;
  id v5;

  EventKitUILibrary();
  result = (SGWalletOrderSuggestionHelpers *)objc_getClass("EKEventEditViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKEventEditViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SGWalletOrderSuggestionHelpers *)abort_report_np();
    return -[SGWalletOrderSuggestionHelpers initWithOrderData:](v3, v4, v5);
  }
  return result;
}

void sub_1B11AF49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11AF7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11AF8D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getFKSaveOrderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  FinanceKitUILibrary();
  result = objc_getClass("FKSaveOrder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFKSaveOrderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke(v3);
  }
  return result;
}

void FinanceKitUILibrary()
{
  void *v0;

  if (!FinanceKitUILibraryCore_frameworkLibrary)
  {
    FinanceKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FinanceKitUILibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getFKOrderImportPreviewControllerProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  FinanceKitUILibrary();
  result = objc_getClass("FKOrderImportPreviewControllerProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFKOrderImportPreviewControllerProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke(v3);
  }
  return result;
}

Class __getFKSuggestionsOrderBannerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id v6;

  FinanceKitUILibrary();
  result = objc_getClass("FKSuggestionsOrderBanner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFKSuggestionsOrderBannerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[SGContactSuggestionHelpers viewControllerForUpdatingContact:additionalContact:](v3, v4, v5, v6);
  }
  return result;
}

uint64_t currentUIContext()
{
  return _currentContext;
}

uint64_t dispatchInContext(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = _currentContext;
  if (_currentContext == a1)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  _currentContext = a1;
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  _currentContext = v2;
  return result;
}

id suggestionImage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v1, "suggestionImage"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    && _currentContext)
  {
    objc_msgSend(v1, "suggestionCategory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionCategoryImage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id suggestionImageSGView(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "suggestionImageSGView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "suggestionCategory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestionCategoryImageSGView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void runOnMainThread(void *a1)
{
  void *v1;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  if (objc_msgSend(v1, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void runOnMainThreadSync(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      block[2]();
    else
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    v1 = block;
  }

}

id getReminderSuggestion(void *a1)
{
  return a1;
}

id getContactSuggestion(void *a1)
{
  return a1;
}

id getRealtimeSuggestion(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "realtimeSuggestion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *SGUserInterfaceIdiomToNSString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("Unspecified");
  else
    return *(&off_1E62D6C20 + a1);
}

void sub_1B11B056C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11B0910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11B09D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKAddPassesViewControllerClass_block_invoke(uint64_t a1)
{
  PassKitUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKAddPassesViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKAddPassesViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitUILibrary();
  }
}

void PassKitUILibrary()
{
  void *v0;

  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitUILibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getPKPassViewClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PassKitUILibrary();
  result = objc_getClass("PKPassView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPassViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return __getPKPassClass_block_invoke(v3);
  }
  return result;
}

Class __getPKPassClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitLibraryCore_frameworkLibrary)
  {
    PassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPass");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getPKPassClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *timeStringForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
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

  v1 = a1;
  objc_msgSend(v1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isAllDay") & 1) == 0)
  {
    if (v3)
    {
      if (isMultiDayEvent(v1))
      {
        +[SGUIDateFormatting multiDayDateFormatter](SGUIDateFormatting, "multiDayDateFormatter");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringFromDate:", v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = &stru_1E62D74E0;
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMultiEventsTimeFormat"), &stru_1E62D74E0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      +[SGUIDateFormatting singleDayTimeFormatter](SGUIDateFormatting, "singleDayTimeFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[SGUIDateFormatting singleDayTimeFormatter](SGUIDateFormatting, "singleDayTimeFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromDate:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerSingleEventTimeFormat%1$@%2$@"), &stru_1E62D74E0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v18, v11, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[SGUIDateFormatting fullDayTimeFormatter](SGUIDateFormatting, "fullDayTimeFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v4 = v12;
    v5 = v4;
    goto LABEL_9;
  }
  v4 = &stru_1E62D74E0;
  v5 = &stru_1E62D74E0;
LABEL_9:

  return v5;
}

BOOL isMultiDayEvent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  _BOOL8 v5;

  v1 = a1;
  objc_msgSend(v1, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4 >= 86400.0;

  return v5;
}

id dateStringForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = a1;
  objc_msgSend(v1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isAllDay"))
  {
    +[SGUIDateFormatting allDayFormatter](SGUIDateFormatting, "allDayFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
LABEL_6:
    objc_msgSend(v4, "stringFromDate:", v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!isMultiDayEvent(v1))
  {
    +[SGUIDateFormatting allDayFormatter](SGUIDateFormatting, "allDayFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDoesRelativeDateFormatting:", 1);
    v4 = v5;
    goto LABEL_6;
  }
  +[SGUIDateFormatting singleDayDateFormatter](SGUIDateFormatting, "singleDayDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerSingleEventMultiDayFormat%1$@%2$@"), &stru_1E62D74E0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

uint64_t SGSuggestionEventTrailingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  v4 = a3;
  getRealtimeSuggestion(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getRealtimeSuggestion(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    v8 = v7;
    v9 = 0;
    if (v5 && v7)
    {
      objc_msgSend(v5, "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v11, "compare:", v13);
    }

  }
  else
  {
    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_1B1170000, v14, OS_LOG_TYPE_FAULT, "Unsupported SGRealtimeEvent Class found. Returning...", v16, 2u);
    }

    v9 = 0;
  }

  return v9;
}

void sub_1B11B54CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B11B5824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id serialQueue()
{
  if (serialQueue__pasOnceToken2[0] != -1)
    dispatch_once(serialQueue__pasOnceToken2, &__block_literal_global_670);
  return (id)serialQueue__pasExprOnceResult;
}

void __serialQueue_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1B5E17818]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.suggestions.CoreSuggestionsUI", 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)serialQueue__pasExprOnceResult;
  serialQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void sub_1B11B75B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B11B96E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKICSPreviewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!EventKitUILibraryCore_frameworkLibrary_893)
  {
    EventKitUILibraryCore_frameworkLibrary_893 = _sl_dlopen();
    if (!EventKitUILibraryCore_frameworkLibrary_893)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("EKICSPreviewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getEKICSPreviewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__933(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__934(uint64_t a1)
{

}

uint64_t sub_1B11BA8C4()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1B11BA8D0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1B11BA8DC()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1B11BA8E8()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1B11BA8F4()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1B11BA900()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1B11BA90C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B11BA918()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B11BA924()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1B11BA930()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B11BA93C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B11BA948()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1B11BA954()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B11BA960()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B11BA96C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B11BA978()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B11BA984()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B11BA990()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B11BA99C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B11BA9A8()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1B11BA9B4()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1B11BA9C0()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1B11BA9CC()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1B11BA9D8()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1B11BA9E4()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B11BA9F0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B11BA9FC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B11BAA08()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B11BAA14()
{
  return MEMORY[0x1E0DC1A90]();
}

uint64_t sub_1B11BAA20()
{
  return MEMORY[0x1E0DC1F18]();
}

uint64_t sub_1B11BAA2C()
{
  return MEMORY[0x1E0DC2A48]();
}

uint64_t sub_1B11BAA38()
{
  return MEMORY[0x1E0DC2A50]();
}

uint64_t sub_1B11BAA44()
{
  return MEMORY[0x1E0DC2A58]();
}

uint64_t sub_1B11BAA50()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1B11BAA5C()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1B11BAA68()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1B11BAA74()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1B11BAA80()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1B11BAA8C()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1B11BAA98()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1B11BAAA4()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1B11BAAB0()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1B11BAABC()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1B11BAAC8()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1B11BAAD4()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1B11BAAE0()
{
  return MEMORY[0x1E0CD8760]();
}

uint64_t sub_1B11BAAEC()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1B11BAAF8()
{
  return MEMORY[0x1E0CD88C0]();
}

uint64_t sub_1B11BAB04()
{
  return MEMORY[0x1E0CD8C38]();
}

uint64_t sub_1B11BAB10()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_1B11BAB1C()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_1B11BAB28()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_1B11BAB34()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1B11BAB40()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_1B11BAB4C()
{
  return MEMORY[0x1E0CD9048]();
}

uint64_t sub_1B11BAB58()
{
  return MEMORY[0x1E0CD9050]();
}

uint64_t sub_1B11BAB64()
{
  return MEMORY[0x1E0CD94A8]();
}

uint64_t sub_1B11BAB70()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1B11BAB7C()
{
  return MEMORY[0x1E0CD96D8]();
}

uint64_t sub_1B11BAB88()
{
  return MEMORY[0x1E0CD97C0]();
}

uint64_t sub_1B11BAB94()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_1B11BABA0()
{
  return MEMORY[0x1E0CD9B20]();
}

uint64_t sub_1B11BABAC()
{
  return MEMORY[0x1E0CD9B30]();
}

uint64_t sub_1B11BABB8()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1B11BABC4()
{
  return MEMORY[0x1E0CD9C78]();
}

uint64_t sub_1B11BABD0()
{
  return MEMORY[0x1E0CD9C80]();
}

uint64_t sub_1B11BABDC()
{
  return MEMORY[0x1E0CD9C88]();
}

uint64_t sub_1B11BABE8()
{
  return MEMORY[0x1E0CD9E78]();
}

uint64_t sub_1B11BABF4()
{
  return MEMORY[0x1E0CD9F70]();
}

uint64_t sub_1B11BAC00()
{
  return MEMORY[0x1E0CD9F78]();
}

uint64_t sub_1B11BAC0C()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1B11BAC18()
{
  return MEMORY[0x1E0CDA140]();
}

uint64_t sub_1B11BAC24()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1B11BAC30()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_1B11BAC3C()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1B11BAC48()
{
  return MEMORY[0x1E0CDA4F8]();
}

uint64_t sub_1B11BAC54()
{
  return MEMORY[0x1E0CDA530]();
}

uint64_t sub_1B11BAC60()
{
  return MEMORY[0x1E0CDA540]();
}

uint64_t sub_1B11BAC6C()
{
  return MEMORY[0x1E0CDA5A8]();
}

uint64_t sub_1B11BAC78()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_1B11BAC84()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1B11BAC90()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1B11BAC9C()
{
  return MEMORY[0x1E0CDA668]();
}

uint64_t sub_1B11BACA8()
{
  return MEMORY[0x1E0CDA670]();
}

uint64_t sub_1B11BACB4()
{
  return MEMORY[0x1E0CDA720]();
}

uint64_t sub_1B11BACC0()
{
  return MEMORY[0x1E0CDA728]();
}

uint64_t sub_1B11BACCC()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1B11BACD8()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1B11BACE4()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_1B11BACF0()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_1B11BACFC()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1B11BAD08()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1B11BAD14()
{
  return MEMORY[0x1E0CDACB8]();
}

uint64_t sub_1B11BAD20()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1B11BAD2C()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1B11BAD38()
{
  return MEMORY[0x1E0CDB268]();
}

uint64_t sub_1B11BAD44()
{
  return MEMORY[0x1E0CDB288]();
}

uint64_t sub_1B11BAD50()
{
  return MEMORY[0x1E0CDB2B0]();
}

uint64_t sub_1B11BAD5C()
{
  return MEMORY[0x1E0CDB2B8]();
}

uint64_t sub_1B11BAD68()
{
  return MEMORY[0x1E0CDB310]();
}

uint64_t sub_1B11BAD74()
{
  return MEMORY[0x1E0CDB388]();
}

uint64_t sub_1B11BAD80()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1B11BAD8C()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1B11BAD98()
{
  return MEMORY[0x1E0CDB550]();
}

uint64_t sub_1B11BADA4()
{
  return MEMORY[0x1E0CDB558]();
}

uint64_t sub_1B11BADB0()
{
  return MEMORY[0x1E0CDB5E0]();
}

uint64_t sub_1B11BADBC()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1B11BADC8()
{
  return MEMORY[0x1E0CDB610]();
}

uint64_t sub_1B11BADD4()
{
  return MEMORY[0x1E0CDB618]();
}

uint64_t sub_1B11BADE0()
{
  return MEMORY[0x1E0CDB628]();
}

uint64_t sub_1B11BADEC()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_1B11BADF8()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1B11BAE04()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_1B11BAE10()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1B11BAE1C()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1B11BAE28()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1B11BAE34()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1B11BAE40()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1B11BAE4C()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1B11BAE58()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1B11BAE64()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1B11BAE70()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1B11BAE7C()
{
  return MEMORY[0x1E0CDB848]();
}

uint64_t sub_1B11BAE88()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1B11BAE94()
{
  return MEMORY[0x1E0CDB880]();
}

uint64_t sub_1B11BAEA0()
{
  return MEMORY[0x1E0CDBB00]();
}

uint64_t sub_1B11BAEAC()
{
  return MEMORY[0x1E0CDBB10]();
}

uint64_t sub_1B11BAEB8()
{
  return MEMORY[0x1E0CDBD58]();
}

uint64_t sub_1B11BAEC4()
{
  return MEMORY[0x1E0CDBD70]();
}

uint64_t sub_1B11BAED0()
{
  return MEMORY[0x1E0CDBE08]();
}

uint64_t sub_1B11BAEDC()
{
  return MEMORY[0x1E0CDBF98]();
}

uint64_t sub_1B11BAEE8()
{
  return MEMORY[0x1E0CDBFA0]();
}

uint64_t sub_1B11BAEF4()
{
  return MEMORY[0x1E0CDBFA8]();
}

uint64_t sub_1B11BAF00()
{
  return MEMORY[0x1E0CDCDB0]();
}

uint64_t sub_1B11BAF0C()
{
  return MEMORY[0x1E0CDCDC0]();
}

uint64_t sub_1B11BAF18()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1B11BAF24()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1B11BAF30()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1B11BAF3C()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1B11BAF48()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1B11BAF54()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1B11BAF60()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1B11BAF6C()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1B11BAF78()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1B11BAF84()
{
  return MEMORY[0x1E0CDCFD0]();
}

uint64_t sub_1B11BAF90()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1B11BAF9C()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1B11BAFA8()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1B11BAFB4()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1B11BAFC0()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1B11BAFCC()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1B11BAFD8()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1B11BAFE4()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1B11BAFF0()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_1B11BAFFC()
{
  return MEMORY[0x1E0CDD4E0]();
}

uint64_t sub_1B11BB008()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_1B11BB014()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_1B11BB020()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_1B11BB02C()
{
  return MEMORY[0x1E0CDD6F8]();
}

uint64_t sub_1B11BB038()
{
  return MEMORY[0x1E0CDD740]();
}

uint64_t sub_1B11BB044()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_1B11BB050()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_1B11BB05C()
{
  return MEMORY[0x1E0CDD878]();
}

uint64_t sub_1B11BB068()
{
  return MEMORY[0x1E0CDD880]();
}

uint64_t sub_1B11BB074()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1B11BB080()
{
  return MEMORY[0x1E0CDD938]();
}

uint64_t sub_1B11BB08C()
{
  return MEMORY[0x1E0CDDB48]();
}

uint64_t sub_1B11BB098()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1B11BB0A4()
{
  return MEMORY[0x1E0CDDB98]();
}

uint64_t sub_1B11BB0B0()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1B11BB0BC()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1B11BB0C8()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1B11BB0D4()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1B11BB0E0()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_1B11BB0EC()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_1B11BB0F8()
{
  return MEMORY[0x1E0CDE2A8]();
}

uint64_t sub_1B11BB104()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1B11BB110()
{
  return MEMORY[0x1E0CDE600]();
}

uint64_t sub_1B11BB11C()
{
  return MEMORY[0x1E0CDE960]();
}

uint64_t sub_1B11BB128()
{
  return MEMORY[0x1E0CDEBA8]();
}

uint64_t sub_1B11BB134()
{
  return MEMORY[0x1E0CDEC48]();
}

uint64_t sub_1B11BB140()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_1B11BB14C()
{
  return MEMORY[0x1E0CDF0D8]();
}

uint64_t sub_1B11BB158()
{
  return MEMORY[0x1E0CDF128]();
}

uint64_t sub_1B11BB164()
{
  return MEMORY[0x1E0CDF260]();
}

uint64_t sub_1B11BB170()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_1B11BB17C()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1B11BB188()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1B11BB194()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_1B11BB1A0()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1B11BB1AC()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1B11BB1B8()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_1B11BB1C4()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_1B11BB1D0()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1B11BB1DC()
{
  return MEMORY[0x1E0CDF670]();
}

uint64_t sub_1B11BB1E8()
{
  return MEMORY[0x1E0CDF678]();
}

uint64_t sub_1B11BB1F4()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_1B11BB200()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1B11BB20C()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1B11BB218()
{
  return MEMORY[0x1E0CDF758]();
}

uint64_t sub_1B11BB224()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1B11BB230()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1B11BB23C()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1B11BB248()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1B11BB254()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1B11BB260()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1B11BB26C()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1B11BB278()
{
  return MEMORY[0x1E0CDFAE0]();
}

uint64_t sub_1B11BB284()
{
  return MEMORY[0x1E0CDFAF0]();
}

uint64_t sub_1B11BB290()
{
  return MEMORY[0x1E0CDFC88]();
}

uint64_t sub_1B11BB29C()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1B11BB2A8()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_1B11BB2B4()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1B11BB2C0()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1B11BB2CC()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1B11BB2D8()
{
  return MEMORY[0x1E0CDFE18]();
}

uint64_t sub_1B11BB2E4()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1B11BB2F0()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1B11BB2FC()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_1B11BB308()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1B11BB314()
{
  return MEMORY[0x1E0CE0170]();
}

uint64_t sub_1B11BB320()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_1B11BB32C()
{
  return MEMORY[0x1E0CE01D8]();
}

uint64_t sub_1B11BB338()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1B11BB344()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_1B11BB350()
{
  return MEMORY[0x1E0CE0458]();
}

uint64_t sub_1B11BB35C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B11BB368()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B11BB374()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B11BB380()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B11BB38C()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1B11BB398()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B11BB3A4()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1B11BB3B0()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B11BB3BC()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B11BB3C8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B11BB3D4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B11BB3E0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B11BB3EC()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B11BB3F8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B11BB404()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1B11BB410()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B11BB41C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B11BB428()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B11BB434()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1B11BB440()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B11BB44C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B11BB458()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B11BB464()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B11BB470()
{
  return MEMORY[0x1E0DC2AA8]();
}

uint64_t sub_1B11BB47C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B11BB488()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B11BB494()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B11BB4A0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B11BB4AC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B11BB4B8()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1B11BB4C4()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1B11BB4D0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B11BB4DC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B11BB4E8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B11BB4F4()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1B11BB500()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B11BB50C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B11BB518()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B11BB524()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1B11BB530()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B11BB53C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B11BB548()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B11BB554()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1B11BB560()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B11BB56C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B11BB578()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B11BB584()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B11BB590()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B11BB59C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B11BB5A8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B11BB5B4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B11BB5C0()
{
  return MEMORY[0x1E0DEDF40]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

uint64_t sgEventsLogHandle()
{
  return MEMORY[0x1E0D19E10]();
}

uint64_t sgLogHandle()
{
  return MEMORY[0x1E0D19E20]();
}

uint64_t sgRemindersLogHandle()
{
  return MEMORY[0x1E0D19E58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

