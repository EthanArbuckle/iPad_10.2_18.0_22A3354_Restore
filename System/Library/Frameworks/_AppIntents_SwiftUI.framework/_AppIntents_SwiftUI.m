uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E304D88]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_22CBF7974();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = v0;
  return sub_22CBF732C();
}

uint64_t OUTLINED_FUNCTION_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_0_3()
{
  void *v0;

}

id OUTLINED_FUNCTION_0_4@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  *v1 = *(_QWORD *)a1;
  v1[1] = v3;
  v1[2] = v4;
  v1[3] = v5;
  return v2;
}

id OUTLINED_FUNCTION_0_5@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *a1;
  v3 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v6 = (void *)a1[4];
  *v1 = v2;
  v1[1] = v3;
  v1[2] = v5;
  v1[3] = v4;
  v1[4] = v6;
  return v6;
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, *(_QWORD *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *(_QWORD *)(v5 - 184);
  *(_QWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v6;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1 + v1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_allocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E304D94](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_22CBF7464();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_22CBF750C();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_22CBF7F68();
}

uint64_t OUTLINED_FUNCTION_7_5@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  return sub_22CBE91A8(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

void OUTLINED_FUNCTION_7_6()
{
  uint64_t v0;

  sub_22CBED3DC(v0 + 152);
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return sub_22CBF7E78();
}

void OUTLINED_FUNCTION_7_9(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_22CBE1FAC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_22CBF7F68();
}

uint64_t OUTLINED_FUNCTION_2_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 152) = a5;
  *(_QWORD *)(v7 - 144) = a6;
  *(_QWORD *)(v7 - 168) = a3;
  *(_QWORD *)(v7 - 160) = a4;
  *(_QWORD *)(v7 - 136) = a2;
  *(_QWORD *)(v7 - 128) = result;
  *(_QWORD *)(v7 - 176) = a7;
  return result;
}

void OUTLINED_FUNCTION_2_5()
{
  JUMPOUT(0x22E304E0CLL);
}

uint64_t OUTLINED_FUNCTION_2_6@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))((char *)&a2 - a1, v3, v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_22CBF7AA0();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16);
  *(_QWORD *)(v3 - 208) = v2;
  return v4(v1, *(_QWORD *)(v3 - 136), v0);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_22CBF77F4();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t (*a1)(void))
{
  return a1();
}

id OUTLINED_FUNCTION_1_4()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_1_5(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_7()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0();
}

id OUTLINED_FUNCTION_1_8(id a1)
{
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
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

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t IntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = *(_QWORD *)(a5 - 8);
  v7[10] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_22CBD9A14()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_22CBD9A6C;
  v2 = OUTLINED_FUNCTION_25();
  return IntentParameter.requestConfirmation<A>(for:dialog:view:)(v2, v3, v4, v5, v6);
}

uint64_t sub_22CBD9A6C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33(v5);
  OUTLINED_FUNCTION_35(*(_QWORD *)(v3 + 72));
  if (v1)
  {
    OUTLINED_FUNCTION_6_0();
    return OUTLINED_FUNCTION_1_0();
  }
  else
  {
    OUTLINED_FUNCTION_8();
    return OUTLINED_FUNCTION_18(a1 & 1, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_22CBD9AD4()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_21_0(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_39(a1, a2, a3, a4, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  v6[8] = OUTLINED_FUNCTION_0();
  v7 = OUTLINED_FUNCTION_23();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = OUTLINED_FUNCTION_0();
  v6[12] = *(_QWORD *)(v5 - 8);
  v6[13] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBD9B74()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_11(v0[12]);
  v0[14] = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  v1 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22CBD9C14;
  OUTLINED_FUNCTION_25();
  return sub_22CBF7404();
}

uint64_t sub_22CBD9C14()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_38();
  *v4 = *v3;
  *(_QWORD *)(v2 + 128) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v2 + 64);
  if (!v1)
    *(_BYTE *)(v2 + 136) = v0 & 1;
  sub_22CBD9D38(v5);
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_22CBD9C7C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_2_0(*(unsigned __int8 *)(v0 + 136), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBD9CBC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_2_0(0, *(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_22CBD9CFC()
{
  unint64_t result;

  result = qword_255C3B348;
  if (!qword_255C3B348)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for AnyView, MEMORY[0x24BDF4780]);
    atomic_store(result, (unint64_t *)&qword_255C3B348);
  }
  return result;
}

uint64_t sub_22CBD9D38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t IntentParameter.requestValue<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = *(_QWORD *)(a5 - 8);
  v7[10] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_22CBD9DC0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_22CBD9E1C;
  v2 = OUTLINED_FUNCTION_37();
  return IntentParameter.requestValue<A>(_:view:)(v2, v3, v4, v5, v6);
}

uint64_t sub_22CBD9E1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33(v2);
  OUTLINED_FUNCTION_4();
  if (v0)
  {
    OUTLINED_FUNCTION_6_0();
    return OUTLINED_FUNCTION_15();
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_22CBD9E78()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameter.requestValue<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_39(a1, a2, a3, a4, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  v6[8] = OUTLINED_FUNCTION_0();
  v7 = OUTLINED_FUNCTION_23();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = OUTLINED_FUNCTION_0();
  v6[12] = *(_QWORD *)(v5 - 8);
  v6[13] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBD9F14()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_11(v0[12]);
  v0[14] = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  v1 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22CBD9FB8;
  OUTLINED_FUNCTION_37();
  return sub_22CBF73EC();
}

uint64_t sub_22CBD9FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  sub_22CBD9D38(v2);
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBDA020()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBDA05C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameter.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  void (*v8)(void);

  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_31();
  v8();
  IntentParameter.needsValueError<A>(_:view:)(a1, v4, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v4, a4);
}

void IntentParameter.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_23();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v12 = v11 - v10;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14 - v13, a2, a3);
  sub_22CBF7D1C();
  sub_22CBD9CFC();
  swift_retain();
  sub_22CBF7470();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v12, v8);
  __swift_storeEnumTagSinglePayload(v7, 0, 1, v8);
  sub_22CBF73F8();
  swift_release();
  sub_22CBD9D38(v7);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  OUTLINED_FUNCTION_7();
}

uint64_t IntentParameterContext.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  v8[10] = *(_QWORD *)(a6 - 8);
  v8[11] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_22CBDA2F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_22CBDA348;
  v2 = OUTLINED_FUNCTION_25();
  return IntentParameterContext.requestConfirmation<A>(for:dialog:view:)(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22CBDA348(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_32(v5);
  OUTLINED_FUNCTION_35(*(_QWORD *)(v3 + 80));
  if (v1)
  {
    OUTLINED_FUNCTION_6_0();
    return OUTLINED_FUNCTION_1_0();
  }
  else
  {
    OUTLINED_FUNCTION_8();
    return OUTLINED_FUNCTION_18(a1 & 1, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_22CBDA3B0()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_21_0(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameterContext.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_30(a1, a2, a3, a4, a5, a6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  v7[9] = OUTLINED_FUNCTION_0();
  v8 = OUTLINED_FUNCTION_23();
  v7[10] = v8;
  v7[11] = *(_QWORD *)(v8 - 8);
  v7[12] = OUTLINED_FUNCTION_0();
  v7[13] = *(_QWORD *)(v6 - 8);
  v7[14] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBDA450()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_11(v0[13]);
  v0[15] = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  v1 = (_QWORD *)swift_task_alloc();
  v0[16] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22CBDA4F4;
  OUTLINED_FUNCTION_25();
  return sub_22CBF74AC();
}

uint64_t sub_22CBDA4F4()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_38();
  *v4 = *v3;
  *(_QWORD *)(v2 + 136) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v2 + 72);
  if (!v1)
    *(_BYTE *)(v2 + 144) = v0 & 1;
  sub_22CBD9D38(v5);
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_22CBDA55C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_2_0(*(unsigned __int8 *)(v0 + 144), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBDA59C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_2_0(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameterContext.requestValue<A>(dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  v8[10] = *(_QWORD *)(a6 - 8);
  v8[11] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_22CBDA624()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_22CBDA680;
  v2 = OUTLINED_FUNCTION_37();
  return IntentParameterContext.requestValue<A>(dialog:view:)(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22CBDA680()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_32(v2);
  OUTLINED_FUNCTION_4();
  if (v0)
  {
    OUTLINED_FUNCTION_6_0();
    return OUTLINED_FUNCTION_15();
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_22CBDA6DC()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t IntentParameterContext.requestValue<A>(dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_30(a1, a2, a3, a4, a5, a6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  v7[9] = OUTLINED_FUNCTION_0();
  v7[10] = *(_QWORD *)(v6 - 8);
  v7[11] = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBDA760()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[9];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[10] + 16))(v0[11], v0[4], v0[6]);
  v0[12] = sub_22CBF7D1C();
  sub_22CBD9CFC();
  swift_retain();
  sub_22CBF7470();
  v2 = OUTLINED_FUNCTION_23();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = v3;
  *v3 = v0;
  v3[1] = sub_22CBDA840;
  OUTLINED_FUNCTION_37();
  return sub_22CBF7494();
}

uint64_t sub_22CBDA840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  sub_22CBD9D38(v2);
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CBDA8A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  return OUTLINED_FUNCTION_20(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBDA8D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8();
  return OUTLINED_FUNCTION_20(*(uint64_t (**)(void))(v0 + 8));
}

void IntentParameterContext.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);

  v8 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v11 = v10 - v9;
  v12();
  IntentParameterContext.needsValueError<A>(_:view:)(a1, v11, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, a5);
  OUTLINED_FUNCTION_7();
}

void IntentParameterContext.needsValueError<A>(_:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v9 = v8 - v7;
  v10 = OUTLINED_FUNCTION_23();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_31();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13 - v12, a2, a4);
  sub_22CBF7D1C();
  sub_22CBD9CFC();
  swift_retain();
  sub_22CBF7470();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v4, v10);
  __swift_storeEnumTagSinglePayload(v9, 0, 1, v10);
  sub_22CBF74A0();
  swift_release();
  sub_22CBD9D38(v9);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v10);
  OUTLINED_FUNCTION_7();
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_22CBDB0E0(a1, &qword_255C3B380);
}

uint64_t initializeBufferWithCopyOfBuffer for ShortcutsLink(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_22CBDAB64(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22CBDAB84(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_22CBDB0E0(a1, &qword_253F87610);
}

uint64_t sub_22CBDABC4()
{
  uint64_t *v0;

  return sub_22CBDAD54(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22CBDABE8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22CBF7DB8();
  *a2 = 0;
  return result;
}

uint64_t sub_22CBDAC60(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22CBF7DC4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22CBDACDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22CBDAD00();
  *a1 = result;
  return result;
}

uint64_t sub_22CBDAD00()
{
  uint64_t v0;

  sub_22CBF7DD0();
  v0 = sub_22CBF7DAC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22CBDAD34()
{
  uint64_t *v0;

  return sub_22CBDAD54(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22CBDAD54(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_22CBF7DD0();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22CBDAD8C()
{
  return sub_22CBDAD94();
}

uint64_t sub_22CBDAD94()
{
  sub_22CBF7DD0();
  sub_22CBF7DE8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22CBDADD4()
{
  return sub_22CBDADDC();
}

uint64_t sub_22CBDADDC()
{
  uint64_t v0;

  sub_22CBF7DD0();
  sub_22CBF801C();
  sub_22CBF7DE8();
  v0 = sub_22CBF8034();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22CBDAE4C()
{
  return sub_22CBDAE58();
}

uint64_t sub_22CBDAE58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22CBF7DD0();
  v2 = v1;
  if (v0 == sub_22CBF7DD0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22CBF7FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22CBDAEDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22CBF7DAC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22CBDAF20@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22CBDAF48(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22CBDAF4C()
{
  sub_22CBDB000(&qword_255C3B3A0, (uint64_t)&unk_22CBF9F6C);
  sub_22CBDB000(&qword_255C3B3A8, (uint64_t)&unk_22CBF9EC0);
  return sub_22CBF7F80();
}

uint64_t sub_22CBDAFB8()
{
  return sub_22CBDB000(&qword_255C3B388, (uint64_t)&unk_22CBF9E84);
}

uint64_t sub_22CBDAFDC()
{
  return sub_22CBDB000(&qword_255C3B390, (uint64_t)&unk_22CBF9E58);
}

uint64_t sub_22CBDB000(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    result = MEMORY[0x22E304DA0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22CBDB040()
{
  return sub_22CBDB000(&qword_255C3B398, (uint64_t)&unk_22CBF9EF4);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22CBDB070(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22CBDB090(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_22CBDB0E0(a1, &qword_253F87070);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_22CBDB0E0(a1, &qword_253F87078);
}

void sub_22CBDB0E0(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a1 + 16))(v1, *(_QWORD *)(v2 + 32), v3);
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_22CBF7D1C();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_22CBF747C();
}

void OUTLINED_FUNCTION_24()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_22CBF7470();
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t OUTLINED_FUNCTION_30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_32@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = *v2;
  *(_QWORD *)(v3 + 104) = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = *v2;
  *(_QWORD *)(v3 + 96) = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

unint64_t OUTLINED_FUNCTION_36()
{
  return sub_22CBD9CFC();
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void OUTLINED_FUNCTION_38()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_39(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = result;
  v6[3] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_release();
}

void sub_22CBDB318(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_50();
  v4 = v2 - v3;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_60((uint64_t)v9 - v5);
  if ((swift_dynamicCast() & 1) != 0)
  {
    OUTLINED_FUNCTION_45();
    v6 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_60(v4);
    v7 = sub_22CBF7D1C();
    v9[4] = MEMORY[0x24BDF4780];
    v9[5] = sub_22CBD9CFC();
    v9[1] = v7;
    sub_22CBF7470();
    OUTLINED_FUNCTION_45();
    v6 = 0;
  }
  v8 = OUTLINED_FUNCTION_23();
  __swift_storeEnumTagSinglePayload(a1, v6, 1, v8);
  OUTLINED_FUNCTION_41();
}

void static IntentResult.result<A>(view:)()
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

  OUTLINED_FUNCTION_9_0();
  v4 = v3;
  v6 = v5;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_49();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  v7 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_46();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_57(v2, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  sub_22CBDB318(v1);
  v8 = OUTLINED_FUNCTION_18_0();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v8);
  sub_22CBDE0A0(&qword_255C3B3B8, (void (*)(uint64_t))MEMORY[0x24BDB5ED0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3C0);
  sub_22CBDE884(&qword_255C3B3C8, &qword_255C3B3C0);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_63();
  sub_22CBDB604();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

unint64_t sub_22CBDB5C8()
{
  unint64_t result;

  result = qword_255C3B3D0;
  if (!qword_255C3B3D0)
  {
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDB6688], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_255C3B3D0);
  }
  return result;
}

unint64_t sub_22CBDB604()
{
  unint64_t result;

  result = qword_255C3B3D8;
  if (!qword_255C3B3D8)
  {
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDB6678], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_255C3B3D8);
  }
  return result;
}

uint64_t sub_22CBDB640()
{
  sub_22CBF7488();
  sub_22CBDE0A0(&qword_255C3B3B8, (void (*)(uint64_t))MEMORY[0x24BDB5ED0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3C0);
  sub_22CBDE884(&qword_255C3B3C8, &qword_255C3B3C0);
  return sub_22CBF7F08();
}

uint64_t static IntentResult.result<A>(content:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void);

  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_21();
  v5();
  static IntentResult.result<A>(view:)();
  return OUTLINED_FUNCTION_59(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void static IntentResult.result<A, B>(value:view:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_11_0(v1);
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_38_0();
  v2 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_14_0(v0, 1, 1, v2);
  sub_22CBDB604();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B>(value:content:)()
{
  sub_22CBDC29C();
}

void static IntentResult.result<A, B, C>(value:opensIntent:view:)()
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
  char *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_9_0();
  v27 = v5;
  v28 = v4;
  v7 = v6;
  v9 = v8;
  v26 = v10;
  v23 = v11;
  v24 = v12;
  v29 = v13;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_2_1();
  v25 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_31();
  v15 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_21();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_4_0();
  v22 = v1;
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v22 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))((char *)&v22 - v18, v23, v9);
  OUTLINED_FUNCTION_68((uint64_t)v19);
  OUTLINED_FUNCTION_58(v3, v24, v20);
  OUTLINED_FUNCTION_28_0(v3);
  OUTLINED_FUNCTION_57(v0, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  sub_22CBDB318(v1);
  v21 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_14_0(v2, 1, 1, v21);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B, C>(value:opensIntent:content:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_48();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_35_0();
  v4();
  OUTLINED_FUNCTION_52();
  static IntentResult.result<A, B, C>(value:opensIntent:view:)();
  OUTLINED_FUNCTION_59(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B, C>(value:opensIntent:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  char *v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
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

  OUTLINED_FUNCTION_9_0();
  v60 = v25;
  v61 = v26;
  v28 = v27;
  v30 = v29;
  v55 = v31;
  v56 = v32;
  v54 = v33;
  v58 = v34;
  v59 = a21;
  v57 = a22;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_31();
  v37 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_21();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_46();
  v53 = v24;
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v52 - v41;
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v43);
  v45 = (char *)&v52 - v44;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))((char *)&v52 - v44, v54, v30);
  OUTLINED_FUNCTION_68((uint64_t)v45);
  OUTLINED_FUNCTION_58((uint64_t)v42, v55, v46);
  OUTLINED_FUNCTION_28_0((uint64_t)v42);
  OUTLINED_FUNCTION_42(v22, v56, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16));
  sub_22CBDB318(v24);
  v47 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_62();
  v48(v23, v58, v47);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_14_0(v49, v50, v51, v47);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

#error "22CBDBD98: call analysis failed (funcsize=38)"

void static IntentResult.result<A, B>(value:dialog:view:)()
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
  char *v11;
  uint64_t v12;
  _QWORD v13[9];
  char v14;

  OUTLINED_FUNCTION_9_0();
  v13[0] = v1;
  v13[1] = v2;
  v13[2] = v3;
  v13[3] = v4;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_25_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_31();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v13 - v10;
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_11_0((uint64_t)v11);
  v14 = 1;
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_37_0();
  v12 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_30_0(v12);
  OUTLINED_FUNCTION_14_0(v0, 0, 1, 1);
  sub_22CBDB604();
  OUTLINED_FUNCTION_13_0();
  sub_22CBDB640();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

#error "22CBDBF30: call analysis failed (funcsize=9)"

void _s10AppIntents12IntentResultP01_aB8_SwiftUIE6result5value6dialog017suggestedFollowUpB04viewAA0cD9ContainerVyqd__s5NeverOAA012_SnippetViewN0VAA0C6DialogVGqd___AqA0aC0_pdqd_0_tARRszAA01_C5ValueRd__0eF00Q0Rd_0_r0_lFZ_0()
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  OUTLINED_FUNCTION_9_0();
  v27 = v1;
  v28 = v2;
  v4 = v3;
  v6 = v5;
  v29 = v7;
  v30 = v8;
  v10 = v9;
  v31 = v11;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_0();
  v14 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v26 - v22;
  OUTLINED_FUNCTION_58((uint64_t)&v26 - v22, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
  OUTLINED_FUNCTION_28_0((uint64_t)v23);
  v32 = 1;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v27, v4);
  sub_22CBDB318((uint64_t)v20);
  v24 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_62();
  v25(v0, v29, v24);
  OUTLINED_FUNCTION_11_0(v0);
  OUTLINED_FUNCTION_23();
  sub_22CBDB604();
  OUTLINED_FUNCTION_13_0();
  sub_22CBDB640();
  swift_bridgeObjectRetain();
  sub_22CBF7464();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B>(opensIntent:view:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_11_0(v1);
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_38_0();
  v7 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_14_0(v0, 1, 1, v7);
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_13_0();
  sub_22CBDB640();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B>(opensIntent:content:)()
{
  sub_22CBDC29C();
}

void sub_22CBDC29C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
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
  void (*v14)(void);

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36_0();
  v14();
  v2(v12, v0, v10, v8, v6, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v8);
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A, B>(opensIntent:dialog:view:)()
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
  _QWORD v15[9];
  char v16;

  OUTLINED_FUNCTION_9_0();
  v15[0] = v1;
  v15[1] = v2;
  v15[2] = v3;
  v15[3] = v4;
  v6 = v5;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_25_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_31();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v15 - v12;
  v16 = 1;
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_11_0((uint64_t)v13);
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_37_0();
  v14 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_30_0(v14);
  OUTLINED_FUNCTION_14_0(v0, 0, 1, v6);
  sub_22CBDB5C8();
  OUTLINED_FUNCTION_13_0();
  sub_22CBDB640();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

#error "22CBDC4A0: call analysis failed (funcsize=9)"

void sub_22CBDC4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t))
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(void);
  uint64_t v28;

  OUTLINED_FUNCTION_9_0();
  v23 = v22;
  OUTLINED_FUNCTION_48();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_36_0();
  v27();
  v28 = OUTLINED_FUNCTION_52();
  a21(v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v21, v23);
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A>(dialog:view:)()
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
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_9_0();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_49();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6();
  v11 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_4_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_42(v2, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  sub_22CBDB318(v1);
  v14 = OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_57(v0, v8, v15);
  OUTLINED_FUNCTION_67();
  __swift_storeEnumTagSinglePayload(v16, v17, v18, v14);
  sub_22CBDE0A0(&qword_255C3B3B8, (void (*)(uint64_t))MEMORY[0x24BDB5ED0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3C0);
  sub_22CBDE884(&qword_255C3B3C8, &qword_255C3B3C0);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_63();
  sub_22CBDB604();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_7();
}

void static IntentResult.result<A>(dialog:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);

  v5 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_0();
  v6();
  static IntentResult.result<A>(dialog:view:)();
  OUTLINED_FUNCTION_59(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_41();
}

uint64_t sub_22CBDC76C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_22CBDEC0C(v0+ OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType, &qword_255C3B3E8);
  return swift_deallocClassInstance();
}

uint64_t sub_22CBDC7AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B438);
  v1 = sub_22CBF76EC();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22CBF9FD0;
  sub_22CBF76E0();
  sub_22CBF76BC();
  sub_22CBF76D4();
  sub_22CBF76C8();
  *(_QWORD *)(v0 + 16) = sub_22CBDDE08(v2);
  v3 = v0
     + OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType;
  sub_22CBF76BC();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v1);
  return v0;
}

uint64_t sub_22CBDC884()
{
  return nullsub_1();
}

uint64_t sub_22CBDC8A8()
{
  return sub_22CBF7AC4();
}

uint64_t AnyView.archiveDataWithSnippetEnvironment(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3E8);
  v3[7] = swift_task_alloc();
  sub_22CBF7E84();
  v3[8] = sub_22CBF7E78();
  v3[9] = sub_22CBF7E6C();
  v3[10] = v4;
  return swift_task_switch();
}

uint64_t sub_22CBDC954()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v1 = v0[7];
  v2 = (int *)v0[4];
  type metadata accessor for AppViewArchivingDelegate();
  OUTLINED_FUNCTION_65();
  v3 = sub_22CBDC7AC();
  v0[11] = v3;
  v0[2] = sub_22CBF7D1C();
  v0[3] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3F0);
  OUTLINED_FUNCTION_65();
  swift_retain();
  v0[12] = sub_22CBF79EC();
  sub_22CBF79D4();
  swift_bridgeObjectRetain();
  sub_22CBF79C8();
  sub_22CBDEBD0(v3+ OBJC_IVAR____TtC19_AppIntents_SwiftUIP33_97ACBAA1CA7D953A93338B906A5780EF24AppViewArchivingDelegate_defaultImageType, v1, &qword_255C3B3E8);
  sub_22CBF79BC();
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  *v4 = v0;
  v4[1] = sub_22CBDCA70;
  return v6();
}

uint64_t sub_22CBDCA70(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22CBDCAC8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 112);
  swift_release();
  if (!v1)
  {
    v3 = 0;
LABEL_6:
    v5 = 0x4074000000000000;
    v7 = 0x406E000000000000;
    goto LABEL_7;
  }
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  v3 = v2;
  if (!v2)
  {
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  objc_msgSend(v2, sel_size);
  v5 = v4;
  v7 = v6;
LABEL_7:
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 48);
  sub_22CBF79E0();
  v10 = (_QWORD *)swift_task_alloc();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v3;
  v10[5] = v5;
  v10[6] = v7;
  v11 = sub_22CBF79B0();
  v13 = v12;
  swift_release();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v11, v13);
}

uint64_t type metadata accessor for AppViewArchivingDelegate()
{
  uint64_t result;

  result = qword_255C3B408;
  if (!qword_255C3B408)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22CBDCC64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B420);
  sub_22CBDCEB0();
  sub_22CBF7D1C();
  sub_22CBF79F8();
  sub_22CBF79A4();
  return sub_22CBF79E0();
}

uint64_t sub_22CBDCD00(uint64_t a1)
{
  uint64_t v1;

  return sub_22CBDCC64(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_22CBDCD10(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22CBDCD74;
  return AnyView.archiveDataWithSnippetEnvironment(_:)(a1, a2, v6);
}

uint64_t sub_22CBDCD74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_22CBDCDD8()
{
  return type metadata accessor for AppViewArchivingDelegate();
}

void sub_22CBDCDE0()
{
  unint64_t v0;

  sub_22CBDCE5C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_22CBDCE5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255C3B418)
  {
    sub_22CBF76EC();
    v0 = sub_22CBF7ED8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255C3B418);
  }
}

unint64_t sub_22CBDCEB0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_255C3B428;
  if (!qword_255C3B428)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B420);
    v2 = sub_22CBDCF1C();
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255C3B428);
  }
  return result;
}

unint64_t sub_22CBDCF1C()
{
  unint64_t result;

  result = qword_255C3B430;
  if (!qword_255C3B430)
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFA0C0, &type metadata for ApplySnippetEnvironmentModifier);
    atomic_store(result, (unint64_t *)&qword_255C3B430);
  }
  return result;
}

void sub_22CBDCF58(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t KeyPath;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
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
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
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
  _QWORD v140[2];
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;

  v182 = a1;
  v185 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B458);
  v183 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v8);
  v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B460);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22CBF7758();
  v180 = *(_QWORD *)(v12 - 8);
  v181 = v12;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2_1();
  v179 = v14;
  v15 = sub_22CBF7A10();
  v177 = *(_QWORD *)(v15 - 8);
  v178 = v15;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2_1();
  v176 = v17;
  v18 = sub_22CBF7740();
  v174 = *(_QWORD *)(v18 - 8);
  v175 = v18;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_2_1();
  v173 = v20;
  v166 = sub_22CBF77E8();
  v163 = *(_QWORD *)(v166 - 8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B468);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v24);
  v152 = sub_22CBF77DC();
  v151 = *(_QWORD *)(v152 - 8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87290);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_4_0();
  v28 = sub_22CBF76A4();
  v148 = *(_QWORD *)(v28 - 8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_50();
  v32 = v30 - v31;
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)v140 - v34;
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B470);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_6();
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B478);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v38);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B480);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v41);
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B488);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v43);
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B490);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v45);
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B498);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v47);
  v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4A0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_17_0(v49);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4A8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_2_1();
  v168 = v51;
  v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_2_1();
  v170 = v53;
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_2_1();
  v171 = v55;
  v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_2_1();
  v172 = v57;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_50();
  MEMORY[0x24BDAC7A8](v60);
  if (!a2)
  {
    v72 = v183;
    v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v183 + 16);
    v74 = v144;
    v73(v144, v182, v6);
    v73((uint64_t)v11, v74, v6);
    swift_storeEnumTagMultiPayload();
    sub_22CBDE23C();
    sub_22CBDE884(&qword_255C3B530, &qword_255C3B458);
    sub_22CBF7A58();
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v74, v6);
    return;
  }
  v140[1] = v39;
  v141 = v62;
  v142 = (uint64_t)v140 - v61;
  v143 = v11;
  v144 = v6;
  KeyPath = swift_getKeyPath();
  v64 = a2;
  v65 = objc_msgSend(v64, sel_locale);
  if (!v65)
  {
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v28);
    v67 = v148;
    goto LABEL_7;
  }
  v66 = v65;
  sub_22CBF768C();

  v67 = v148;
  v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 32);
  v68(v4, v32, v28);
  OUTLINED_FUNCTION_67();
  __swift_storeEnumTagSinglePayload(v69, v70, v71, v28);
  if (__swift_getEnumTagSinglePayload(v4, 1, v28) == 1)
  {
LABEL_7:
    sub_22CBF7698();
    sub_22CBDEC0C(v4, &qword_253F87290);
    goto LABEL_8;
  }
  v68((uint64_t)v35, v4, v28);
LABEL_8:
  OUTLINED_FUNCTION_22_0();
  v76 = (uint64_t *)(v3 + v75);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B540);
  OUTLINED_FUNCTION_42((uint64_t)v76 + *(int *)(v77 + 28), (uint64_t)v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16));
  *v76 = KeyPath;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v183 + 16))(v3, v182, v144);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v35, v28);
  v78 = swift_getKeyPath();
  v79 = v150;
  sub_22CBDDB88();
  OUTLINED_FUNCTION_22_0();
  v80 = v145;
  v82 = (uint64_t *)(v145 + v81);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B550);
  v84 = OUTLINED_FUNCTION_56(v83);
  v85 = v151;
  v86 = v152;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v151 + 16))(v84, v79, v152);
  *v82 = v78;
  OUTLINED_FUNCTION_23_0(v3, v80);
  (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v79, v86);
  OUTLINED_FUNCTION_29_0(v3);
  v87 = swift_getKeyPath();
  v88 = v157;
  OUTLINED_FUNCTION_40_0((SEL *)&selRef_legibilityWeight, MEMORY[0x24BDED788], (void (*)(_QWORD))MEMORY[0x24BDED790]);
  sub_22CBF7800();
  OUTLINED_FUNCTION_67();
  __swift_storeEnumTagSinglePayload(v89, v90, v91, v92);
  OUTLINED_FUNCTION_22_0();
  v93 = v154;
  v95 = (uint64_t *)(v154 + v94);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B560);
  sub_22CBDEBD0(v88, (uint64_t)v95 + *(int *)(v96 + 28), &qword_255C3B468);
  *v95 = v87;
  OUTLINED_FUNCTION_23_0(v80, v93);
  sub_22CBDEC0C(v88, &qword_255C3B468);
  OUTLINED_FUNCTION_29_0(v80);
  v97 = swift_getKeyPath();
  v98 = v162;
  OUTLINED_FUNCTION_40_0((SEL *)&selRef_layoutDirection, MEMORY[0x24BDED100], (void (*)(_QWORD))MEMORY[0x24BDED130]);
  OUTLINED_FUNCTION_22_0();
  v99 = v156;
  v101 = (uint64_t *)(v156 + v100);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B570);
  v103 = OUTLINED_FUNCTION_56(v102);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v163 + 16))(v103, v98, v166);
  *v101 = v97;
  OUTLINED_FUNCTION_23_0(v93, v99);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_29_0(v93);
  v104 = swift_getKeyPath();
  OUTLINED_FUNCTION_40_0((SEL *)&selRef_colorScheme, MEMORY[0x24BDEB400], (void (*)(_QWORD))MEMORY[0x24BDEB418]);
  OUTLINED_FUNCTION_22_0();
  v105 = v159;
  v107 = (uint64_t *)(v159 + v106);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B580);
  v109 = OUTLINED_FUNCTION_56(v108);
  OUTLINED_FUNCTION_24_0(v109);
  *v107 = v104;
  OUTLINED_FUNCTION_23_0(v99, v105);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_29_0(v99);
  v110 = swift_getKeyPath();
  OUTLINED_FUNCTION_40_0((SEL *)&selRef_colorSchemeContrast, MEMORY[0x24BDEEDE8], (void (*)(_QWORD))MEMORY[0x24BDEEE00]);
  OUTLINED_FUNCTION_22_0();
  v111 = v161;
  v113 = (uint64_t *)(v161 + v112);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B590);
  v115 = OUTLINED_FUNCTION_56(v114);
  OUTLINED_FUNCTION_24_0(v115);
  *v113 = v110;
  OUTLINED_FUNCTION_23_0(v105, v111);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_29_0(v105);
  v116 = swift_getKeyPath();
  objc_msgSend(v64, sel_displayScale);
  v118 = v117;
  v119 = v165;
  sub_22CBDEBD0(v111, v165, &qword_255C3B498);
  OUTLINED_FUNCTION_22_0();
  v121 = (uint64_t *)(v119 + v120);
  *v121 = v116;
  v121[1] = v118;
  sub_22CBDEC0C(v111, &qword_255C3B498);
  v122 = swift_getKeyPath();
  OUTLINED_FUNCTION_40_0((SEL *)&selRef_displayGamut, MEMORY[0x24BDEBA38], (void (*)(_QWORD))MEMORY[0x24BDEBA48]);
  OUTLINED_FUNCTION_22_0();
  v123 = v168;
  v125 = (uint64_t *)(v168 + v124);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B5B0);
  v127 = OUTLINED_FUNCTION_56(v126);
  OUTLINED_FUNCTION_24_0(v127);
  *v125 = v122;
  OUTLINED_FUNCTION_23_0(v119, v123);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_29_0(v119);
  v128 = swift_getKeyPath();
  LOBYTE(v125) = OUTLINED_FUNCTION_47(v128, sel_accessibilityDifferentiateWithoutColor);
  v129 = v170;
  OUTLINED_FUNCTION_44(v123, v170);
  OUTLINED_FUNCTION_22_0();
  v131 = v129 + v130;
  *(_QWORD *)v131 = v128;
  *(_BYTE *)(v131 + 8) = (_BYTE)v125;
  sub_22CBDEC0C(v123, &qword_255C3B4A8);
  v132 = swift_getKeyPath();
  OUTLINED_FUNCTION_47(v132, sel_accessibilityInvertColors);
  v133 = v171;
  OUTLINED_FUNCTION_44(v129, v171);
  OUTLINED_FUNCTION_33_0(v133 + *(int *)(v167 + 36));
  v134 = swift_getKeyPath();
  LOBYTE(v125) = OUTLINED_FUNCTION_47(v134, sel_accessibilityReduceMotion);
  v135 = v172;
  OUTLINED_FUNCTION_44(v133, v172);
  v136 = v135 + *(int *)(v169 + 36);
  *(_QWORD *)v136 = v134;
  *(_BYTE *)(v136 + 8) = (_BYTE)v125;
  sub_22CBDEC0C(v133, &qword_255C3B4B8);
  v137 = swift_getKeyPath();
  OUTLINED_FUNCTION_47(v137, sel_accessibilityReduceTransparency);
  v138 = v141;
  OUTLINED_FUNCTION_44(v135, v141);
  OUTLINED_FUNCTION_33_0(v138 + *(int *)(v58 + 36));
  v139 = v142;
  sub_22CBDEB88(v138, v142);
  OUTLINED_FUNCTION_23_0(v139, (uint64_t)v143);
  swift_storeEnumTagMultiPayload();
  sub_22CBDE23C();
  sub_22CBDE884(&qword_255C3B530, &qword_255C3B458);
  sub_22CBF7A58();

  OUTLINED_FUNCTION_29_0(v139);
}

uint64_t sub_22CBDDB88()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  objc_msgSend(v0, sel_dynamicTypeSize);
  sub_22CBF77DC();
  v1 = OUTLINED_FUNCTION_55();
  return v2(v1);
}

uint64_t sub_22CBDDC74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B468);
  MEMORY[0x24BDAC7A8](v2);
  sub_22CBDEBD0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255C3B468);
  return sub_22CBF78B4();
}

uint64_t sub_22CBDDCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_22CBDDD70(SEL *a1, uint64_t a2, void (*a3)(_QWORD))
{
  void *v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  objc_msgSend(v3, *a1);
  a3(0);
  v5 = OUTLINED_FUNCTION_55();
  return v6(v5);
}

uint64_t sub_22CBDDDE8()
{
  return sub_22CBF777C();
}

void sub_22CBDDE00(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void **v2;

  sub_22CBDCF58(a1, *v2, a2);
}

uint64_t sub_22CBDDE08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_22CBF76EC();
  v31 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  if (!*(_QWORD *)(a1 + 16))
  {
    v9 = MEMORY[0x24BEE4B08];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B440);
  result = sub_22CBF7F14();
  v9 = result;
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v9;
  }
  v10 = 0;
  v30 = result + 56;
  v11 = *(unsigned __int8 *)(v31 + 80);
  v26 = a1;
  v27 = a1 + ((v11 + 32) & ~v11);
  while (v10 < *(_QWORD *)(a1 + 16))
  {
    v12 = *(_QWORD *)(v31 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v13(v7, v27 + v12 * v10, v2);
    sub_22CBDE0A0(&qword_255C3B448, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
    v14 = sub_22CBF7D88();
    v15 = -1 << *(_BYTE *)(v9 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
    v19 = 1 << v16;
    if (((1 << v16) & v18) != 0)
    {
      v29 = v10;
      v20 = ~v15;
      while (1)
      {
        v13(v5, *(_QWORD *)(v9 + 48) + v16 * v12, v2);
        sub_22CBDE0A0(&qword_255C3B450, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
        v21 = sub_22CBF7DA0();
        v22 = *(void (**)(char *, uint64_t))(v31 + 8);
        v22(v5, v2);
        if ((v21 & 1) != 0)
          break;
        v16 = (v16 + 1) & v20;
        v17 = v16 >> 6;
        v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
        v19 = 1 << v16;
        if ((v18 & (1 << v16)) == 0)
        {
          a1 = v26;
          v10 = v29;
          goto LABEL_10;
        }
      }
      result = ((uint64_t (*)(char *, uint64_t))v22)(v7, v2);
      a1 = v26;
      v10 = v29;
    }
    else
    {
LABEL_10:
      *(_QWORD *)(v30 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32))(*(_QWORD *)(v9 + 48) + v16 * v12, v7, v2);
      v23 = *(_QWORD *)(v9 + 16);
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_18;
      *(_QWORD *)(v9 + 16) = v25;
    }
    if (++v10 == v28)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void sub_22CBDE0A0(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_10();
}

void **initializeBufferWithCopyOfBuffer for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for ApplySnippetEnvironmentModifier(id *a1)
{

}

void **assignWithCopy for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for ApplySnippetEnvironmentModifier(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ApplySnippetEnvironmentModifier(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApplySnippetEnvironmentModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApplySnippetEnvironmentModifier()
{
  return &type metadata for ApplySnippetEnvironmentModifier;
}

uint64_t sub_22CBDE22C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22CBDE23C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4D0;
  if (!qword_255C3B4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4C8);
    v2 = sub_22CBDE2C0();
    sub_22CBDE884(&qword_255C3B5B8, &qword_255C3B5C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4D0);
  }
  return result;
}

unint64_t sub_22CBDE2C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4D8;
  if (!qword_255C3B4D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4C0);
    v2 = sub_22CBDE344();
    sub_22CBDE884(&qword_255C3B5B8, &qword_255C3B5C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4D8);
  }
  return result;
}

unint64_t sub_22CBDE344()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4E0;
  if (!qword_255C3B4E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4B8);
    v2 = sub_22CBDE3C8();
    sub_22CBDE884(&qword_255C3B5B8, &qword_255C3B5C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4E0);
  }
  return result;
}

unint64_t sub_22CBDE3C8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4E8;
  if (!qword_255C3B4E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4B0);
    v2 = sub_22CBDE44C();
    sub_22CBDE884(&qword_255C3B5B8, &qword_255C3B5C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4E8);
  }
  return result;
}

unint64_t sub_22CBDE44C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4F0;
  if (!qword_255C3B4F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4A8);
    v2 = sub_22CBDE4D0();
    sub_22CBDE884(&qword_255C3B5A8, &qword_255C3B5B0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4F0);
  }
  return result;
}

unint64_t sub_22CBDE4D0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B4F8;
  if (!qword_255C3B4F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B4A0);
    v2 = sub_22CBDE554();
    sub_22CBDE884(&qword_255C3B598, &qword_255C3B5A0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B4F8);
  }
  return result;
}

unint64_t sub_22CBDE554()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B500;
  if (!qword_255C3B500)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B498);
    v2 = sub_22CBDE5D8();
    sub_22CBDE884(&qword_255C3B588, &qword_255C3B590);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B500);
  }
  return result;
}

unint64_t sub_22CBDE5D8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B508;
  if (!qword_255C3B508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B490);
    v2 = sub_22CBDE65C();
    sub_22CBDE884(&qword_255C3B578, &qword_255C3B580);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B508);
  }
  return result;
}

unint64_t sub_22CBDE65C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B510;
  if (!qword_255C3B510)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B488);
    v2 = sub_22CBDE6E0();
    sub_22CBDE884(&qword_255C3B568, &qword_255C3B570);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B510);
  }
  return result;
}

unint64_t sub_22CBDE6E0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B518;
  if (!qword_255C3B518)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B480);
    v2 = sub_22CBDE764();
    sub_22CBDE884(&qword_255C3B558, &qword_255C3B560);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B518);
  }
  return result;
}

unint64_t sub_22CBDE764()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B520;
  if (!qword_255C3B520)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B478);
    v2 = sub_22CBDE7E8();
    sub_22CBDE884(&qword_255C3B548, &qword_255C3B550);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B520);
  }
  return result;
}

unint64_t sub_22CBDE7E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255C3B528;
  if (!qword_255C3B528)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B470);
    sub_22CBDE884(&qword_255C3B530, &qword_255C3B458);
    v3 = v2;
    sub_22CBDE884(&qword_255C3B538, &qword_255C3B540);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255C3B528);
  }
  return result;
}

void sub_22CBDE884(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_10();
}

void sub_22CBDE8B8()
{
  sub_22CBF7944();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDE8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDCEEA8], MEMORY[0x24BDEE3D8]);
}

void sub_22CBDE8F8()
{
  sub_22CBF7878();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDE914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDECF50], MEMORY[0x24BDEE028]);
}

void sub_22CBDE938()
{
  sub_22CBF78A8();
  OUTLINED_FUNCTION_10();
}

void sub_22CBDE958()
{
  sub_22CBF789C();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDE974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

void sub_22CBDE998()
{
  sub_22CBF7848();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDE9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

void sub_22CBDE9D8()
{
  sub_22CBF78C0();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDE9F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEEE00], MEMORY[0x24BDEE208]);
}

void sub_22CBDEA18()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_54();
  sub_22CBF7860();
  *v0 = v1;
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEA38()
{
  sub_22CBF786C();
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEA58()
{
  sub_22CBF7854();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDEA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBDDCF4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEBA48], MEMORY[0x24BDEDF60]);
}

void sub_22CBDEA98()
{
  uint64_t v0;

  OUTLINED_FUNCTION_54();
  v0 = sub_22CBF7914();
  OUTLINED_FUNCTION_71(v0);
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEAB8(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_70(a1);
  sub_22CBF7920();
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEAD4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_54();
  v0 = sub_22CBF78CC();
  OUTLINED_FUNCTION_71(v0);
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEAF4(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_70(a1);
  sub_22CBF78D8();
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEB10()
{
  uint64_t v0;

  OUTLINED_FUNCTION_54();
  v0 = sub_22CBF78E4();
  OUTLINED_FUNCTION_71(v0);
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEB30(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_70(a1);
  sub_22CBF78F0();
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEB4C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_54();
  v0 = sub_22CBF78FC();
  OUTLINED_FUNCTION_71(v0);
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEB6C(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_70(a1);
  sub_22CBF7908();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBDEB88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B4C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22CBDEBD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void (*v5)(uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_62();
  v5(a2, a1);
  OUTLINED_FUNCTION_10();
}

void sub_22CBDEC0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_10();
}

unint64_t sub_22CBDEC48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255C3B5C8;
  if (!qword_255C3B5C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B5D0);
    v2 = sub_22CBDE23C();
    sub_22CBDE884(&qword_255C3B530, &qword_255C3B458);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255C3B5C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_22CBF7ED8();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

double OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(_QWORD *)(v0 - 96) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
  return sub_22CBF747C();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

void OUTLINED_FUNCTION_17_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_22CBF7374();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_22CBF7488();
}

void OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22CBDEBD0(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(a1, v3, v1);
}

void OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 1;
  *(_BYTE *)(v0 - 82) = 1;
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

void OUTLINED_FUNCTION_29_0(uint64_t a1)
{
  uint64_t *v1;

  sub_22CBDEC0C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, *(_QWORD *)(v2 - 144), a1);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void OUTLINED_FUNCTION_33_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t *v3;
  uint64_t v4;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2;
  sub_22CBDEC0C(v4, v3);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v0, *(_QWORD *)(v3 - 160), v1);
}

void OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;

  sub_22CBDB318(v0);
}

void OUTLINED_FUNCTION_38_0()
{
  uint64_t v0;

  sub_22CBDB318(v0);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v0, *(_QWORD *)(v3 - 152), v1);
}

uint64_t OUTLINED_FUNCTION_40_0(SEL *a1, uint64_t a2, void (*a3)(_QWORD))
{
  return sub_22CBDDD70(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_42@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_22CBF7ED8();
}

void OUTLINED_FUNCTION_44(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22CBDEBD0(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

id OUTLINED_FUNCTION_47(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_53()
{
  uint64_t v0;

  return v0 - 81;
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 28);
}

uint64_t OUTLINED_FUNCTION_57@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_59@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

unint64_t OUTLINED_FUNCTION_63()
{
  return sub_22CBDB5C8();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_22CBDB640();
}

void OUTLINED_FUNCTION_66()
{
  JUMPOUT(0x22E304DA0);
}

uint64_t OUTLINED_FUNCTION_68(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_22CBF7F08();
}

uint64_t OUTLINED_FUNCTION_70(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_71(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_22CBF7ED8();
}

id sub_22CBDF080()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2480]), sel_init);
  qword_253F871F8 = (uint64_t)result;
  return result;
}

id static CSSearchableItemAttributeSetKey.defaultValue.getter()
{
  if (qword_253F87200 != -1)
    swift_once();
  return (id)qword_253F871F8;
}

id sub_22CBDF0F0@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = static CSSearchableItemAttributeSetKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22CBDF114()
{
  sub_22CBE0AB8(&qword_255C3B5E8, (uint64_t (*)(uint64_t))sub_22CBE08CC, MEMORY[0x24BEE5BE0]);
  return sub_22CBF77AC();
}

BOOL static DisplayLocation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void DisplayLocation.hash(into:)()
{
  sub_22CBF8028();
  OUTLINED_FUNCTION_10();
}

void DisplayLocation.hashValue.getter()
{
  OUTLINED_FUNCTION_8_1();
  sub_22CBF8028();
  sub_22CBF8034();
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_22CBDF1F4()
{
  sub_22CBF801C();
  sub_22CBF8028();
  return sub_22CBF8034();
}

uint64_t static SearchString.defaultValue.getter()
{
  return 0;
}

void sub_22CBDF240(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_22CBDF24C()
{
  return sub_22CBF77AC();
}

void static DisplayLocationKey.defaultValue.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22CBDF268()
{
  sub_22CBDF750();
  return sub_22CBF77AC();
}

uint64_t EnvironmentValues.attributeSet.getter()
{
  uint64_t v1;

  sub_22CBDF2EC();
  OUTLINED_FUNCTION_5_1();
  return v1;
}

unint64_t sub_22CBDF2EC()
{
  unint64_t result;

  result = qword_253F87208;
  if (!qword_253F87208)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for CSSearchableItemAttributeSetKey, &type metadata for CSSearchableItemAttributeSetKey);
    atomic_store(result, (unint64_t *)&qword_253F87208);
  }
  return result;
}

void EnvironmentValues.attributeSet.setter()
{
  sub_22CBDF2EC();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10_1();
}

void (*EnvironmentValues.attributeSet.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_22CBDF2EC();
  OUTLINED_FUNCTION_5_1();
  return sub_22CBDF3A0;
}

void sub_22CBDF3A0(uint64_t a1, char a2)
{
  id v2;
  id v4;

  v2 = *(id *)a1;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)a1;
  if ((a2 & 1) != 0)
  {
    v4 = v2;
    OUTLINED_FUNCTION_0_1();

  }
  else
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_12_0();
  }
}

uint64_t EnvironmentValues.displayLocation.getter()
{
  sub_22CBDF434();
  return sub_22CBF7968();
}

unint64_t sub_22CBDF434()
{
  unint64_t result;

  result = qword_253F871F0;
  if (!qword_253F871F0)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for DisplayLocationKey, &type metadata for DisplayLocationKey);
    atomic_store(result, (unint64_t *)&qword_253F871F0);
  }
  return result;
}

void EnvironmentValues.displayLocation.setter()
{
  sub_22CBDF434();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10_1();
}

void EnvironmentValues.displayLocation.modify(_QWORD *a1)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = sub_22CBDF434();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_12_0();
}

void sub_22CBDF4F0(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
}

uint64_t EnvironmentValues.searchString.getter()
{
  uint64_t v1;

  sub_22CBDF550();
  OUTLINED_FUNCTION_5_1();
  return v1;
}

unint64_t sub_22CBDF550()
{
  unint64_t result;

  result = qword_253F871E8;
  if (!qword_253F871E8)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for SearchString, &type metadata for SearchString);
    atomic_store(result, (unint64_t *)&qword_253F871E8);
  }
  return result;
}

void EnvironmentValues.searchString.setter()
{
  sub_22CBDF550();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10_1();
}

void EnvironmentValues.searchString.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_22CBDF550();
  OUTLINED_FUNCTION_5_1();
  v4 = v3[3];
  *v3 = v3[2];
  v3[1] = v4;
  OUTLINED_FUNCTION_12_0();
}

void sub_22CBDF620(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_0_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_1();
  }
  free(v2);
}

uint64_t static ViewCodableError.== infix(_:_:)()
{
  return 1;
}

void ViewCodableError.hash(into:)()
{
  sub_22CBF8028();
  OUTLINED_FUNCTION_10();
}

void ViewCodableError.hashValue.getter()
{
  OUTLINED_FUNCTION_8_1();
  sub_22CBF8028();
  sub_22CBF8034();
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_22CBDF6E0()
{
  return 1;
}

void sub_22CBDF6E8()
{
  ViewCodableError.hashValue.getter();
}

void sub_22CBDF6FC()
{
  ViewCodableError.hash(into:)();
}

uint64_t sub_22CBDF710()
{
  sub_22CBF801C();
  sub_22CBF8028();
  return sub_22CBF8034();
}

unint64_t sub_22CBDF750()
{
  unint64_t result;

  result = qword_255C3B5D8;
  if (!qword_255C3B5D8)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for DisplayLocation, &type metadata for DisplayLocation);
    atomic_store(result, (unint64_t *)&qword_255C3B5D8);
  }
  return result;
}

unint64_t sub_22CBDF790()
{
  unint64_t result;

  result = qword_255C3B5E0;
  if (!qword_255C3B5E0)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for ViewCodableError, &type metadata for ViewCodableError);
    atomic_store(result, (unint64_t *)&qword_255C3B5E0);
  }
  return result;
}

void type metadata accessor for CSSearchableItemAttributeSetKey()
{
  OUTLINED_FUNCTION_3_2();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayLocation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DisplayLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22CBDF8E0 + 4 * byte_22CBFA355[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22CBDF914 + 4 * byte_22CBFA350[v4]))();
}

uint64_t sub_22CBDF914(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22CBDF91C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22CBDF924);
  return result;
}

uint64_t sub_22CBDF930(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22CBDF938);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22CBDF93C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22CBDF944(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22CBDF950(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22CBDF958(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for DisplayLocation()
{
  OUTLINED_FUNCTION_3_2();
}

void type metadata accessor for SearchString()
{
  OUTLINED_FUNCTION_3_2();
}

void type metadata accessor for DisplayLocationKey()
{
  OUTLINED_FUNCTION_3_2();
}

uint64_t getEnumTagSinglePayload for ViewCodableError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ViewCodableError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22CBDFA18 + 4 * byte_22CBFA35A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22CBDFA38 + 4 * byte_22CBFA35F[v4]))();
}

_BYTE *sub_22CBDFA18(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22CBDFA38(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22CBDFA40(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22CBDFA48(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22CBDFA50(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22CBDFA58(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_22CBDFA64()
{
  return 0;
}

void type metadata accessor for ViewCodableError()
{
  OUTLINED_FUNCTION_3_2();
}

_QWORD *sub_22CBDFA78(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = a2[6];
    v4[5] = a2[5];
    v4[6] = v8;
    v9 = *(int *)(a3 + 20);
    v10 = (char *)v4 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = sub_22CBF7434();
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return v4;
}

uint64_t sub_22CBDFB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_22CBF7434();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
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

uint64_t sub_22CBDFBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_22CBF7434();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

uint64_t *sub_22CBDFC38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22CBF7434();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t sub_22CBDFE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v5 = *(int *)(a3 + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_22CBF7434();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22CBDFE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22CBF7434();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_22CBDFF0C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CBDFF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_22CBF7434();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_22CBDFF8C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22CBDFF98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 24) = (a2 - 1);
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    v7 = sub_22CBF7434();
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t type metadata accessor for SharedIndexedViewFormatDecodable()
{
  uint64_t result;

  result = qword_253F87088;
  if (!qword_253F87088)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22CBE0034()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22CBF7434();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22CBE00A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v9;
  uint64_t v10[4];
  __int128 v11;

  swift_getDynamicType();
  result = sub_22CBF7F50();
  if (v7)
  {
    v10[3] = a2;
    v11 = *(_OWORD *)(a3 + 8);
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v10);
    v9 = *(_QWORD *)(a2 - 8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(boxed_opaque_existential_2Tm, a1, a2);
    sub_22CBF73B0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_22CBE0150(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[24];
  uint64_t v34;
  _BYTE v35[40];
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;

  v27 = a2;
  v4 = sub_22CBF73E0();
  v28 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_3_1();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87268);
  v11 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_9();
  v36 = 0;
  v37 = 0;
  v12 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_22CBE0AB8(&qword_253F87210, (uint64_t (*)(uint64_t))MEMORY[0x24BDB53C0], MEMORY[0x24BDB53D0]);
  sub_22CBF8040();
  if (v2)
    goto LABEL_7;
  v26 = v11;
  v13 = *(void (**)(char *, _QWORD, uint64_t))(v28 + 104);
  v13(v10, *MEMORY[0x24BDB53B8], v4);
  v14 = v29;
  sub_22CBF7F8C();
  OUTLINED_FUNCTION_14_1((uint64_t)v10);
  v13(v8, *MEMORY[0x24BDB53B0], v4);
  sub_22CBF7F98();
  v16 = v15;
  OUTLINED_FUNCTION_14_1((uint64_t)v8);
  if (!v16
    || (v17 = sub_22CBF7F38(), swift_bridgeObjectRelease(), !v17)
    || (v18 = dynamic_cast_existential_1_conditional(v17)) == 0)
  {
    sub_22CBE0AF8();
    swift_allocError();
    swift_willThrow();
    v24 = OUTLINED_FUNCTION_7_1();
    v25(v24, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v20 = v18;
  v21 = v19;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v34);
  v31 = v20;
  v32 = v21;
  __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v30);
  sub_22CBF7FBC();
  v22 = OUTLINED_FUNCTION_7_1();
  v23(v22, v14);
  sub_22CBE0C00(&v30, (uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  sub_22CBE0C18((uint64_t)v35, v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  sub_22CBE0820((uint64_t)v35);
LABEL_8:
  OUTLINED_FUNCTION_2();
}

void sub_22CBE0468(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_22CBE0150(a1, a2);
}

void sub_22CBE047C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  __int128 v28;
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _QWORD *v51;

  v38 = a2;
  v39 = sub_22CBF7434();
  v37 = *(_QWORD *)(v39 - 8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9();
  v41 = v5 - v4;
  v6 = sub_22CBF756C();
  v42 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_3_1();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v34 - v10;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87270);
  v11 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_9();
  v14 = v13 - v12;
  v15 = type metadata accessor for SharedIndexedViewFormatDecodable();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_9();
  v19 = v18 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22CBE0AB8(&qword_253F87220, (uint64_t (*)(uint64_t))MEMORY[0x24BDB6540], MEMORY[0x24BDB6550]);
  v43 = v14;
  v44 = v6;
  v20 = (uint64_t)v51;
  sub_22CBF8040();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v35 = v15;
    v36 = v11;
    v22 = v40;
    v21 = v41;
    v23 = v19;
    v51 = a1;
    v24 = v42;
    v25 = *(void (**)(char *, _QWORD, uint64_t))(v42 + 104);
    v26 = v44;
    v25(v45, *MEMORY[0x24BDB6530], v44);
    sub_22CBE07E4();
    sub_22CBF7FA4();
    v27 = *(void (**)(char *, uint64_t))(v24 + 8);
    v27(v45, v26);
    v28 = v48;
    v29 = v23;
    *(_OWORD *)v23 = v47;
    *(_OWORD *)(v23 + 16) = v28;
    *(_OWORD *)(v23 + 32) = v49;
    *(_QWORD *)(v23 + 48) = v50;
    v30 = v22;
    v25(v22, *MEMORY[0x24BDB6538], v26);
    sub_22CBE0AB8(&qword_253F87218, (uint64_t (*)(uint64_t))MEMORY[0x24BDB57B8], MEMORY[0x24BDB57C8]);
    v31 = v21;
    v32 = v39;
    sub_22CBF7FA4();
    v33 = v36;
    v27(v30, v44);
    OUTLINED_FUNCTION_4_1(*(uint64_t (**)(uint64_t, _QWORD))(v33 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v29 + *(int *)(v35 + 20), v31, v32);
    sub_22CBE084C(v29, v38);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_22CBE0890(v29);
  }
  OUTLINED_FUNCTION_2();
}

void sub_22CBE07AC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_22CBE047C(a1, a2);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_22CBE07E4()
{
  unint64_t result;

  result = qword_253F87228;
  if (!qword_253F87228)
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFA648, &unk_24F76ADC8);
    atomic_store(result, (unint64_t *)&qword_253F87228);
  }
  return result;
}

uint64_t sub_22CBE0820(uint64_t a1)
{
  sub_22CBE0908(a1);
  return a1;
}

uint64_t sub_22CBE084C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharedIndexedViewFormatDecodable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBE0890(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SharedIndexedViewFormatDecodable();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22CBE08CC()
{
  unint64_t result;

  result = qword_255C3B5F0;
  if (!qword_255C3B5F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C3B5F0);
  }
  return result;
}

uint64_t sub_22CBE0908(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22CBE092C(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_22CBE0974(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t sub_22CBE09D8(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22CBE0A20(uint64_t a1, int a2)
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

uint64_t sub_22CBE0A60(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ViewDecodable()
{
  OUTLINED_FUNCTION_3_2();
}

uint64_t sub_22CBE0AB8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E304DA0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22CBE0AF8()
{
  unint64_t result;

  result = qword_255C3B5F8;
  if (!qword_255C3B5F8)
  {
    result = MEMORY[0x22E304DA0](&protocol conformance descriptor for ViewCodableError, &type metadata for ViewCodableError);
    atomic_store(result, (unint64_t *)&qword_255C3B5F8);
  }
  return result;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_2Tm(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x22E304E0CLL);
  return result;
}

uint64_t sub_22CBE0C00(__int128 *a1, uint64_t a2)
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

uint64_t sub_22CBE0C18(uint64_t a1, uint64_t a2)
{
  sub_22CBE092C(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_22CBF7968();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_22CBF7974();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_22CBF801C();
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void Toggle.init<A>(isOn:intent:label:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  char *v18;
  id v19;
  _DWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v22 = a3;
  v23 = a4;
  v20[3] = a1;
  v21 = a9;
  v14 = *(_QWORD *)(a6 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_22CBF732C();
  sub_22CBE0E38();
  if (swift_dynamicCast())
  {
    v16 = v24;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a6);
    v17 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v18 = (char *)swift_allocObject();
    *((_QWORD *)v18 + 2) = a5;
    *((_QWORD *)v18 + 3) = a6;
    *((_QWORD *)v18 + 4) = a7;
    *((_QWORD *)v18 + 5) = a8;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v18[v17], (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
    v19 = v16;
    sub_22CBF7D10();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a2, a6);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    sub_22CBF7F68();
    __break(1u);
  }
}

unint64_t sub_22CBE0E38()
{
  unint64_t result;

  result = qword_253F87628[0];
  if (!qword_253F87628[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_253F87628);
  }
  return result;
}

uint64_t sub_22CBE0E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;

  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22CBF7E9C();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a3);
  sub_22CBF7E84();
  v17 = sub_22CBF7E78();
  v18 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v19 = (char *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  *((_QWORD *)v19 + 2) = v17;
  *((_QWORD *)v19 + 3) = v20;
  *((_QWORD *)v19 + 4) = a2;
  *((_QWORD *)v19 + 5) = a3;
  *((_QWORD *)v19 + 6) = a4;
  *((_QWORD *)v19 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v18], v12, a3);
  sub_22CBE8BA0((uint64_t)v15, (uint64_t)&unk_255C3B610, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_22CBE0FD0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_22CBE1028()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_22CBE0E74((uint64_t)v0 + ((v2 + 48) & ~v2), v0[2], v1, v0[4], v0[5]);
}

uint64_t sub_22CBE1048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_22CBF7E84();
  v8[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

uint64_t sub_22CBE10B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  sub_22CBE8A80(v2, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void Toggle<>.init<A>(_:isOn:intent:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v23 = a8;
  v17 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v20, v21);
  v25 = a1;
  v26 = a2;
  v27 = a3;
  v28 = a4;
  Toggle.init<A>(isOn:intent:label:)(a5, (uint64_t)v19, (uint64_t)sub_22CBE1284, (uint64_t)v24, MEMORY[0x24BDF1FA8], a7, MEMORY[0x24BDF1F80], v23, a9);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a6, a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE11F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_22CBF7B6C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22CBE1284@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBE11F0(a1);
}

void Toggle<>.init<A, B>(_:isOn:intent:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v16 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v18 = &v21[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v20);
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a1;
  Toggle.init<A>(isOn:intent:label:)(a2, (uint64_t)v18, (uint64_t)sub_22CBE1414, (uint64_t)v21, MEMORY[0x24BDF1FA8], a5, MEMORY[0x24BDF1F80], a7, a8);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, a5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE1384@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = sub_22CBF7B84();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_22CBE1414@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22CBE1384(*(_QWORD *)(v1 + 48), a1);
}

uint64_t sub_22CBE1424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22CBE1490(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = v1[7];
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v9 = v1[2];
  v10 = v1[3];
  v11 = (uint64_t)v1 + ((v8 + 64) & ~v8);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_22CBE1534;
  return sub_22CBE1048(a1, v9, v10, v11, v4, v5, v6, v7);
}

uint64_t sub_22CBE1534()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t getEnumTagSinglePayload for WrappedLabelStyle(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WrappedLabelStyle(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WrappedLabelStyle()
{
  return &type metadata for WrappedLabelStyle;
}

uint64_t sub_22CBE15D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22CBE15E8@<X0>(uint64_t a1@<X0>, double *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  char *v10;
  uint64_t v11;
  uint64_t result;

  v10 = (char *)a2 + *(int *)(type metadata accessor for WrappedLabelStyleView() + 28);
  v11 = sub_22CBF7AA0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, a1, v11);
  *a2 = a3;
  a2[1] = a4;
  a2[2] = a5;
  return result;
}

uint64_t sub_22CBE1664@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double *v2;

  return sub_22CBE15E8(a1, a2, *v2, v2[1], v2[2]);
}

uint64_t type metadata accessor for WrappedLabelStyleView()
{
  uint64_t result;

  result = qword_253F872E8;
  if (!qword_253F872E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_22CBE16A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v5 = *(int *)(a3 + 28);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_22CBF7AA0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_22CBE1738(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 28);
  v3 = sub_22CBF7AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t sub_22CBE1770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_22CBF7AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_22CBE17D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = *(int *)(a3 + 28);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_22CBF7AA0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

uint64_t sub_22CBE1840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_22CBF7AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_22CBE18A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_22CBF7AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_22CBE1908()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CBE1914(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_3_3();
  return __swift_getEnumTagSinglePayload(v2, a2, v4);
}

uint64_t sub_22CBE1944()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CBE1950(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_3_3();
  return __swift_storeEnumTagSinglePayload(v2, a2, a2, v4);
}

uint64_t sub_22CBE1984()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22CBF7AA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_22CBE1A00()
{
  sub_22CBE1FAC(&qword_253F872E0, (uint64_t (*)(uint64_t))type metadata accessor for WrappedLabelStyleView, (uint64_t)&unk_22CBFA6E8);
}

uint64_t sub_22CBE1A2C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22CBE1A3C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_22CBF798C();
  v4 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87308);
  sub_22CBE1A84(a1 + *(int *)(v5 + 44));
}

void sub_22CBE1A84(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  char v25;
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
  char *v36;
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
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v57 = a1;
  v55 = sub_22CBF7A88();
  v53 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v51 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F873E0);
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v50 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87330);
  v3 = MEMORY[0x24BDAC7A8](v49);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v56 = (uint64_t)&v45 - v6;
  v7 = sub_22CBF7A70();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87318);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87368);
  v14 = MEMORY[0x24BDAC7A8](v46);
  v48 = (uint64_t)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v45 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v47 = (uint64_t)&v45 - v19;
  type metadata accessor for WrappedLabelStyleView();
  sub_22CBF7A7C();
  sub_22CBF7D40();
  sub_22CBF7788();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  v20 = &v13[*(int *)(v11 + 36)];
  v21 = v59;
  *(_OWORD *)v20 = v58;
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v60;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v22 = sub_22CBF7B00();
  v23 = sub_22CBF7AE8();
  v24 = sub_22CBF7AF4();
  v25 = sub_22CBF7B0C();
  sub_22CBF7B0C();
  if (sub_22CBF7B0C() != v22)
    v25 = sub_22CBF7B0C();
  sub_22CBF7B0C();
  if (sub_22CBF7B0C() != v23)
    v25 = sub_22CBF7B0C();
  sub_22CBF7B0C();
  if (sub_22CBF7B0C() != v24)
    v25 = sub_22CBF7B0C();
  sub_22CBF7734();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  sub_22CBE2014((uint64_t)v13, (uint64_t)v18, &qword_253F87318);
  v34 = &v18[*(int *)(v46 + 36)];
  *v34 = v25;
  *((_QWORD *)v34 + 1) = v27;
  *((_QWORD *)v34 + 2) = v29;
  *((_QWORD *)v34 + 3) = v31;
  *((_QWORD *)v34 + 4) = v33;
  v34[40] = 0;
  sub_22CBDEC0C((uint64_t)v13, &qword_253F87318);
  v35 = v47;
  sub_22CBE1FE8((uint64_t)v18, v47, &qword_253F87368);
  v36 = v51;
  sub_22CBF7A94();
  sub_22CBE1FAC(&qword_255C3B618, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0220], MEMORY[0x24BDF0218]);
  v37 = v50;
  v38 = v55;
  sub_22CBF7BF0();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v36, v38);
  v39 = v52;
  v40 = v54;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v5, v37, v54);
  *(_WORD *)&v5[*(int *)(v49 + 36)] = 256;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v37, v40);
  v41 = v56;
  sub_22CBE1FE8((uint64_t)v5, v56, &qword_253F87330);
  v42 = v48;
  sub_22CBE2014(v35, v48, &qword_253F87368);
  sub_22CBE2014(v41, (uint64_t)v5, &qword_253F87330);
  v43 = v57;
  sub_22CBE2014(v42, v57, &qword_253F87368);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87370);
  sub_22CBE2014((uint64_t)v5, v43 + *(int *)(v44 + 48), &qword_253F87330);
  sub_22CBDEC0C(v41, &qword_253F87330);
  sub_22CBDEC0C(v35, &qword_253F87368);
  sub_22CBDEC0C((uint64_t)v5, &qword_253F87330);
  sub_22CBDEC0C(v42, &qword_253F87368);
}

uint64_t sub_22CBE1F90()
{
  return sub_22CBF7BE4();
}

void sub_22CBE1FAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x22E304DA0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_10();
}

void sub_22CBE1FE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1(a1, a2, a3);
  OUTLINED_FUNCTION_2_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_10();
}

void sub_22CBE2014(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1(a1, a2, a3);
  OUTLINED_FUNCTION_2_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_10();
}

unint64_t sub_22CBE2044()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F87410;
  if (!qword_253F87410)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87418);
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_253F87410);
  }
  return result;
}

void View.accessibilityAction<A, B>(intent:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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
  void *v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD v48[5];
  uint64_t v49;
  void *v50;

  OUTLINED_FUNCTION_9_0();
  v49 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v48[3] = v28;
  v48[4] = v29;
  v31 = v30;
  v48[2] = v32;
  v33 = *(_QWORD *)(v24 - 8);
  v34 = *(_QWORD *)(v33 + 64);
  v35 = MEMORY[0x24BDAC7A8](v30);
  v36 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_37_1(v35, v37, v38, v39, v40, v41, v42, v43);
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  v44 = v50;
  OUTLINED_FUNCTION_42((uint64_t)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 16));
  v45 = (*(unsigned __int8 *)(v33 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v46 = (_QWORD *)swift_allocObject();
  v46[2] = v27;
  v46[3] = v25;
  v47 = v49;
  v46[4] = v23;
  v46[5] = v47;
  v46[6] = v48[1];
  v46[7] = a21;
  OUTLINED_FUNCTION_42((uint64_t)v46 + v45, (uint64_t)v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 32));
  sub_22CBF7BFC();
  swift_release();

  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE21E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v25 = a6;
  v26 = a7;
  v12 = *(_QWORD *)(a3 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22CBF7E9C();
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a3);
  sub_22CBF7E84();
  v19 = sub_22CBF7E78();
  v20 = (*(unsigned __int8 *)(v12 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = (char *)swift_allocObject();
  v22 = MEMORY[0x24BEE6930];
  *((_QWORD *)v21 + 2) = v19;
  *((_QWORD *)v21 + 3) = v22;
  *((_QWORD *)v21 + 4) = a2;
  *((_QWORD *)v21 + 5) = a3;
  *((_QWORD *)v21 + 6) = a4;
  *((_QWORD *)v21 + 7) = a5;
  v23 = v26;
  *((_QWORD *)v21 + 8) = v25;
  *((_QWORD *)v21 + 9) = v23;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[v20], v14, a3);
  sub_22CBE8BA0((uint64_t)v17, (uint64_t)&unk_255C3B728, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_22CBE2354()
{
  uint64_t v0;

  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_8_2(v0);
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_11_1();
}

uint64_t sub_22CBE237C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_22CBE21E4((uint64_t)v0 + ((v2 + 64) & ~v2), v0[2], v1, v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_22CBE23A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;

  v6[3] = a6;
  v6[4] = v8;
  v6[2] = a4;
  sub_22CBF7E84();
  v6[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

#error "22CBE2444: call analysis failed (funcsize=12)"

void sub_22CBE2454()
{
  sub_22CBE2534();
}

uint64_t sub_22CBE2468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[3] = a6;
  v8[4] = a8;
  v8[2] = a4;
  sub_22CBF7E84();
  v8[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

#error "22CBE2510: call analysis failed (funcsize=15)"

void sub_22CBE2520()
{
  sub_22CBE2534();
}

void sub_22CBE2534()
{
  sub_22CBE2EB0();
}

#error "22CBE25A4: call analysis failed (funcsize=15)"

void sub_22CBE25B4()
{
  sub_22CBE2534();
}

uint64_t sub_22CBE25C8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

#error "22CBE2608: call analysis failed (funcsize=13)"

uint64_t sub_22CBE2618()
{
  return sub_22CBE3380(&unk_24F76BC68, &unk_255C3B6E8);
}

uint64_t sub_22CBE262C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;

  v7[3] = a7;
  v7[4] = v9;
  v7[2] = a4;
  sub_22CBF7E84();
  v7[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

void ModifiedContent<>.accessibilityAction<A>(_:intent:)()
{
  sub_22CBE33FC();
  OUTLINED_FUNCTION_10_1();
}

{
  sub_22CBE33FC();
  OUTLINED_FUNCTION_10_1();
}

void sub_22CBE26E0()
{
  sub_22CBE27B8();
}

uint64_t sub_22CBE26F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a4;
  sub_22CBF7E84();
  v7[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

#error "22CBE2794: call analysis failed (funcsize=13)"

void sub_22CBE27A4()
{
  sub_22CBE27B8();
}

void sub_22CBE27B8()
{
  sub_22CBE38C8();
}

#error "22CBE2820: call analysis failed (funcsize=13)"

void sub_22CBE2830()
{
  sub_22CBE27B8();
}

uint64_t sub_22CBE2844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a4;
  sub_22CBF7E84();
  v7[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

#error "22CBE28E4: call analysis failed (funcsize=13)"

void sub_22CBE28F4()
{
  sub_22CBE3D94();
}

uint64_t sub_22CBE2908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;

  v7[3] = a7;
  v7[4] = v9;
  v7[2] = a4;
  sub_22CBF7E84();
  v7[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

#error "22CBE29AC: call analysis failed (funcsize=12)"

void sub_22CBE29B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t, void *, uint64_t, _QWORD *, uint64_t, uint64_t))
{
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
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  OUTLINED_FUNCTION_9_0();
  v42 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v41 = v33;
  v34 = *(_QWORD *)(v27 - 8);
  v35 = MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_32_1(v35, v36, v37, v38);
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_57(v21, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16));
  v39 = (*(unsigned __int8 *)(v34 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v40 = (_QWORD *)swift_allocObject();
  v40[2] = v30;
  v40[3] = v28;
  v40[4] = v26;
  v40[5] = v24;
  OUTLINED_FUNCTION_57((uint64_t)v40 + v39, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 32));
  a21(v41, v43, v42, v40, v30, v26);
  OUTLINED_FUNCTION_51();

  OUTLINED_FUNCTION_7();
}

void sub_22CBE2ADC()
{
  sub_22CBE2534();
}

#error "22CBE2B28: call analysis failed (funcsize=15)"

void sub_22CBE2B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void (*a24)(uint64_t, uint64_t, _QWORD, uint64_t, void *, uint64_t, _QWORD *, uint64_t, uint64_t))
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
  int v33;
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
  void *v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, _QWORD, uint64_t, void *, uint64_t, _QWORD *, uint64_t, uint64_t);
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;

  OUTLINED_FUNCTION_9_0();
  v56 = v24;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v54 = v31;
  v55 = v32;
  v51 = v33;
  v52 = v35;
  v53 = v34;
  v36 = *(_QWORD *)(v27 - 8);
  v37 = *(_QWORD *)(v36 + 64);
  v38 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v50 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_49_0(v38, v40, v41, v42, v43, v44, v45);
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  v50 = a24;
  v46 = v57;
  OUTLINED_FUNCTION_42((uint64_t)&v50 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0), v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 16));
  v47 = (*(unsigned __int8 *)(v36 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v48 = (_QWORD *)OUTLINED_FUNCTION_40_1();
  v49 = v56;
  v48[2] = v56;
  v48[3] = v28;
  v48[4] = v26;
  v48[5] = a21;
  OUTLINED_FUNCTION_42((uint64_t)v48 + v47, (uint64_t)v39, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 32));
  v50(v53, v54, v51 & 1, v55, v46, a23, v48, v49, v26);
  swift_release();

  OUTLINED_FUNCTION_7();
}

void sub_22CBE2C8C()
{
  sub_22CBE2534();
}

#error "22CBE2CD8: call analysis failed (funcsize=15)"

void sub_22CBE2CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void (*a24)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t, void *))
{
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
  char *v35;
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
  char v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t, void *);
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;

  OUTLINED_FUNCTION_9_0();
  v62 = v24;
  v60 = v26;
  v61 = v25;
  v28 = v27;
  v30 = v29;
  v31 = *(_QWORD *)(v27 - 8);
  v32 = *(_QWORD *)(v31 + 64);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&v56 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_49_0(v34, v36, v37, v38, v39, v40, v41);
  v59 = v42;
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  v57 = a23;
  v58 = a24;
  v56 = v63;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_48_0();
  v43 = OUTLINED_FUNCTION_39_1();
  v45 = v44;
  v47 = v46;
  v49 = v48 & 1;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))((char *)&v56 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v28);
  v50 = (*(unsigned __int8 *)(v31 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v51 = (char *)swift_allocObject();
  v52 = v62;
  *((_QWORD *)v51 + 2) = v62;
  *((_QWORD *)v51 + 3) = v28;
  v53 = v35;
  v54 = v61;
  v55 = v59;
  *((_QWORD *)v51 + 4) = v61;
  *((_QWORD *)v51 + 5) = v55;
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v51[v50], v53, v28);
  v58(v43, v45, v49, v47, v54, v57, v51, v52, v54);
  sub_22CBE25C8(v43, v45, v49);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

void sub_22CBE2EB0()
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
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_9_0();
  v22 = v1;
  v23 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  v14 = OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_30_1(v0, v15, v16, v14);
  OUTLINED_FUNCTION_23_1((uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  OUTLINED_FUNCTION_44_0();
  v17 = OUTLINED_FUNCTION_47_0();
  v18 = (*(unsigned __int8 *)(v11 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (_QWORD *)OUTLINED_FUNCTION_50_0();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v17;
  v19[3] = v20;
  v19[4] = v8;
  v19[5] = v6;
  v21 = v22;
  v19[6] = v4;
  v19[7] = v21;
  OUTLINED_FUNCTION_23_1((uint64_t)v19 + v18, (uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  sub_22CBE8BA0(v0, v23, (uint64_t)v19);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_8_2(v0);
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_11_1();
}

void sub_22CBE2FE0()
{
  sub_22CBE2534();
}

#error "22CBE3024: call analysis failed (funcsize=13)"

void sub_22CBE3030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, uint64_t, uint64_t))
{
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;

  OUTLINED_FUNCTION_9_0();
  v65 = v23;
  v25 = v24;
  v64 = v26;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_46_0();
  v38 = v36 - v37;
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_9();
  v44 = v43 - v42;
  OUTLINED_FUNCTION_37_1(v45, v46, v47, v48, v49, v50, v51, v52);
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_42(v44, v34, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
  v53 = sub_22CBF7B84();
  v54 = v25;
  v56 = v55;
  v62 = v57;
  v59 = v58 & 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v38, v32, v28);
  v60 = (*(unsigned __int8 *)(v35 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v61 = (char *)swift_allocObject();
  *((_QWORD *)v61 + 2) = v65;
  *((_QWORD *)v61 + 3) = v30;
  *((_QWORD *)v61 + 4) = v28;
  *((_QWORD *)v61 + 5) = v64;
  *((_QWORD *)v61 + 6) = v54;
  *((_QWORD *)v61 + 7) = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(&v61[v60], v38, v28);
  a23(v53, v56, v59, v62, v66, a22, v61, v65, v64);
  sub_22CBE25C8(v53, v56, v59);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

void sub_22CBE320C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_9_0();
  v49 = v21;
  v50 = v22;
  v48 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v51 = a21;
  v32 = *(_QWORD *)(v24 - 8);
  v33 = *(_QWORD *)(v32 + 64);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v48 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_9();
  v38 = v37 - v36;
  v39 = sub_22CBF7E9C();
  OUTLINED_FUNCTION_30_1(v38, v40, v41, v39);
  OUTLINED_FUNCTION_23_1((uint64_t)v34, v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 16));
  OUTLINED_FUNCTION_44_0();
  v42 = OUTLINED_FUNCTION_47_0();
  v43 = (*(unsigned __int8 *)(v32 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v44 = (_QWORD *)OUTLINED_FUNCTION_40_1();
  v45 = MEMORY[0x24BEE6930];
  v44[2] = v42;
  v44[3] = v45;
  v44[4] = v29;
  v44[5] = v27;
  v46 = v48;
  v44[6] = v25;
  v44[7] = v46;
  v47 = v50;
  v44[8] = v49;
  v44[9] = v47;
  OUTLINED_FUNCTION_23_1((uint64_t)v44 + v43, (uint64_t)v34, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 32));
  sub_22CBE8BA0(v38, v51, (uint64_t)v44);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_2(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8));
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_11_1();
}

uint64_t sub_22CBE336C()
{
  return sub_22CBE3380(&unk_24F76BB28, &unk_255C3B668);
}

#error "22CBE33B8: call analysis failed (funcsize=17)"

void sub_22CBE33FC()
{
  uint64_t v0;
  void (*v1)(uint64_t, void *, uint64_t, _QWORD *, uint64_t);
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
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _QWORD *, uint64_t);
  void *v22;

  OUTLINED_FUNCTION_9_0();
  v21 = v1;
  v19 = v2;
  v20 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *(_QWORD *)(v6 - 8);
  v13 = MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_32_1(v13, v14, v15, v16);
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_57(v0, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  v17 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v18 = (_QWORD *)OUTLINED_FUNCTION_40_1();
  v18[2] = *(_QWORD *)(v9 + 16);
  v18[3] = v7;
  v18[4] = v5;
  OUTLINED_FUNCTION_57((uint64_t)v18 + v17, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
  v21(v19, v22, v20, v18, v9);
  OUTLINED_FUNCTION_51();

  OUTLINED_FUNCTION_7();
}

void sub_22CBE3518()
{
  sub_22CBE27B8();
}

#error "22CBE355C: call analysis failed (funcsize=13)"

void sub_22CBE3568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, _QWORD, uint64_t, void *, uint64_t, char *, uint64_t))
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD v49[2];
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;

  OUTLINED_FUNCTION_9_0();
  v54 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v52 = v30;
  v53 = v31;
  v50 = v32;
  v51 = v33;
  v49[1] = v34;
  v35 = *(_QWORD *)(v26 - 8);
  v36 = *(_QWORD *)(v35 + 64);
  v37 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)v49 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_49_0(v37, v39, v40, v41, v42, v43, v44);
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  v45 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))((char *)v49 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v27);
  v46 = (*(unsigned __int8 *)(v35 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v47 = (char *)OUTLINED_FUNCTION_50_0();
  v48 = v54;
  *((_QWORD *)v47 + 2) = *(_QWORD *)(v54 + 16);
  *((_QWORD *)v47 + 3) = v27;
  *((_QWORD *)v47 + 4) = v25;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v47[v46], v38, v27);
  a23(v51, v52, v50 & 1, v53, v45, a22, v47, v48);
  swift_release();

  OUTLINED_FUNCTION_7();
}

void sub_22CBE36C0()
{
  sub_22CBE27B8();
}

#error "22CBE3704: call analysis failed (funcsize=13)"

void sub_22CBE3710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, _QWORD *, uint64_t))
{
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, _QWORD *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;

  OUTLINED_FUNCTION_9_0();
  v58 = v23;
  v25 = v24;
  v27 = v26;
  v57 = v28;
  v29 = *(_QWORD *)(v24 - 8);
  v30 = *(_QWORD *)(v29 + 64);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v52 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_49_0(v32, v34, v35, v36, v37, v38, v39);
  v56 = v40;
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  v54 = a22;
  v55 = a23;
  v53 = v59;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_48_0();
  v41 = OUTLINED_FUNCTION_39_1();
  v43 = v42;
  v45 = v44;
  v47 = v46 & 1;
  OUTLINED_FUNCTION_43_0((uint64_t)&v52 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 16));
  v48 = (*(unsigned __int8 *)(v29 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v49 = (_QWORD *)swift_allocObject();
  v50 = v58;
  v49[2] = *(_QWORD *)(v58 + 16);
  v49[3] = v25;
  v49[4] = v56;
  OUTLINED_FUNCTION_43_0((uint64_t)v49 + v48, (uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32));
  v51 = v53;
  v55(v41, v43, v47, v45, v53, v54, v49, v50);
  sub_22CBE25C8(v41, v43, v47);
  OUTLINED_FUNCTION_51();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

void sub_22CBE38C8()
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
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_9_0();
  v21 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *(_QWORD *)(v4 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  v13 = OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_30_1(v0, v14, v15, v13);
  OUTLINED_FUNCTION_23_1((uint64_t)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  OUTLINED_FUNCTION_44_0();
  v16 = OUTLINED_FUNCTION_47_0();
  v17 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (_QWORD *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  v18[2] = v16;
  v18[3] = v19;
  v18[4] = v7;
  v18[5] = v5;
  v18[6] = v3;
  OUTLINED_FUNCTION_23_1((uint64_t)v18 + v17, (uint64_t)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  sub_22CBE8BA0(v0, v21, (uint64_t)v18);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_8_2(v0);
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_11_1();
}

void sub_22CBE39FC()
{
  sub_22CBE27B8();
}

#error "22CBE3A40: call analysis failed (funcsize=13)"

void sub_22CBE3A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, _QWORD *, uint64_t))
{
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
  char v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;

  OUTLINED_FUNCTION_9_0();
  v54 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_46_0();
  v36 = v34 - v35;
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_9();
  v42 = v41 - v40;
  v53 = v43;
  sub_22CBF732C();
  OUTLINED_FUNCTION_19_1();
  if (!OUTLINED_FUNCTION_6_2())
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_57(v42, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 16));
  v44 = sub_22CBF7B84();
  v46 = v45;
  v52 = v47;
  v49 = v48 & 1;
  OUTLINED_FUNCTION_43_0(v36, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 16));
  v50 = (*(unsigned __int8 *)(v33 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v51 = (_QWORD *)swift_allocObject();
  v51[2] = *(_QWORD *)(v54 + 16);
  v51[3] = v28;
  v51[4] = v26;
  v51[5] = v24;
  v51[6] = v53;
  OUTLINED_FUNCTION_43_0((uint64_t)v51 + v50, v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 32));
  a22(v44, v46, v49, v52, v55, a21, v51, v54);
  sub_22CBE25C8(v44, v46, v49);
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

void sub_22CBE3C2C()
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
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_9_0();
  v27 = v0;
  v28 = v1;
  v26 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_46_0();
  v14 = v12 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_9();
  v18 = v17 - v16;
  v19 = sub_22CBF7E9C();
  OUTLINED_FUNCTION_30_1(v18, v20, v21, v19);
  OUTLINED_FUNCTION_23_1(v14, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  OUTLINED_FUNCTION_44_0();
  v22 = OUTLINED_FUNCTION_47_0();
  v23 = (*(unsigned __int8 *)(v11 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v24 = (_QWORD *)swift_allocObject();
  v25 = MEMORY[0x24BEE6930];
  v24[2] = v22;
  v24[3] = v25;
  v24[4] = v8;
  v24[5] = v6;
  v24[6] = v4;
  v24[7] = v26;
  v24[8] = v27;
  OUTLINED_FUNCTION_23_1((uint64_t)v24 + v23, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  sub_22CBE8BA0(v18, v28, (uint64_t)v24);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_2(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8));
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_11_1();
}

void sub_22CBE3D80()
{
  sub_22CBE3D94();
}

void sub_22CBE3D94()
{
  sub_22CBE3C2C();
}

uint64_t sub_22CBE3DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22CBE3E18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_13_1();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_17_1();
  return sub_22CBE2908(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_22CBE3E8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE26F4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE3EDC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE26F4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE3F2C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE26F4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE3F7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_13_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_12_1(v1);
  OUTLINED_FUNCTION_17_1();
  return sub_22CBE262C(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE3FEC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22CBE4040()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22CBE4094()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t objectdestroy_51Tm()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_25_1();
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBE4120()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_13_1();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_17_1();
  return sub_22CBE2908(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_22CBE4194()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE2844(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE41E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE26F4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_55Tm()
{
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_25_1();
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBE4264()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_3_4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_5_2(v1);
  OUTLINED_FUNCTION_29_1();
  return sub_22CBE26F4(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_67Tm()
{
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_25_1();
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBE42EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_13_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_12_1(v1);
  OUTLINED_FUNCTION_17_1();
  return sub_22CBE262C(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_22CBE435C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22CBE43B0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t objectdestroy_71Tm()
{
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_25_1();
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBE4434()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_4_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2(v1);
  *v2 = v0;
  v2[1] = sub_22CBE4524;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28_1();
  return sub_22CBE2468(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22CBE4484()
{
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_25_1();
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBE44B4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_13_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  OUTLINED_FUNCTION_12_1(v1);
  OUTLINED_FUNCTION_17_1();
  return sub_22CBE23A0(v2, v3, v4, v5, v6, v7);
}

uint64_t OUTLINED_FUNCTION_5_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v3 + (v2 & ~v1));
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_12_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = v4;
  a1[1] = v1;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v3;
  return v2;
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

unint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_22CBE0E38();
}

void OUTLINED_FUNCTION_22_1()
{
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_23_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_22CBF7E9C();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t OUTLINED_FUNCTION_37_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 - 168) = a8;
  return sub_22CBF732C();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_22CBF7B6C();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_22CBF7E84();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_22CBF7E78();
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return a7;
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_release();
}

void View.suggestedIntent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v19 = a4;
  v9 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SuggestedIntent(0, v12, v14, v13);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v19 - v17;
  OUTLINED_FUNCTION_43_0((uint64_t)v11, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  sub_22CBE48FC((uint64_t)v11, a3, a5, (uint64_t)v18);
  MEMORY[0x22E3045C0](v18, a2, v15, v19);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for SuggestedIntent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SuggestedIntent);
}

void sub_22CBE48FC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_21();
  type metadata accessor for SuggestedIntent(0, a2, a3, v10);
  v11 = OUTLINED_FUNCTION_7_3();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v11);
  sub_22CBE5640(v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a4, a1, a2);
  OUTLINED_FUNCTION_3_5();
}

void sub_22CBE49A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for SuggestedIntent(255, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 24), a4);
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_15_3();
}

void sub_22CBE49DC()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t sub_22CBE4A04()
{
  return swift_allocateGenericValueMetadata();
}

void sub_22CBE4A0C()
{
  unint64_t v0;
  unint64_t v1;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_22CBE55B4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_22CBE4A94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_22CBF750C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10 & 0xF8 | 7;
  v12 = v7 + v11;
  v13 = (v7 + v11) & ~v11;
  if (*(_DWORD *)(v9 + 84))
    v14 = *(_QWORD *)(v9 + 64);
  else
    v14 = *(_QWORD *)(v9 + 64) + 1;
  v15 = v13 + ((v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v16 = *(_DWORD *)(v6 + 80) & 0xF8 | v11;
  v17 = (*(_DWORD *)(v6 + 80) | v10) & 0x100000;
  if ((_DWORD)v16 != 7 || v17 != 0 || v15 > 0x18)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v16 + 16) & ~v16));
  }
  else
  {
    v21 = v8;
    v22 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v23 = (const void *)(((unint64_t)a2 + v12) & v22);
    if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v21))
    {
      memcpy((void *)(((unint64_t)a1 + v12) & v22), v23, v14);
    }
    else
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v9 + 16))(((unint64_t)a1 + v12) & v22, v23, v21);
      __swift_storeEnumTagSinglePayload(((unint64_t)a1 + v12) & v22, 0, 1, v21);
    }
    *(_QWORD *)((v14 + 7 + (((unint64_t)a1 + v12) & v22)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v23 + v14 + 7) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_22CBE4BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = sub_22CBF750C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8 | 7;
  v8 = (v4 + a1 + v7) & ~v7;
  if (!__swift_getEnumTagSinglePayload(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_22CBE4C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  size_t v15;
  size_t v16;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22CBF750C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  if (__swift_getEnumTagSinglePayload(v12, 1, v7))
  {
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
    if (v13)
      v15 = v14;
    else
      v15 = v14 + 1;
    memcpy((void *)v11, (const void *)v12, v15);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
    __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
  }
  if (v13)
    v16 = v14;
  else
    v16 = v14 + 1;
  *(_QWORD *)(((v11 | 7) + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((v12 | 7) + v16) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_22CBE4DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  size_t v15;
  uint64_t v16;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22CBF750C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v7);
  v14 = __swift_getEnumTagSinglePayload(v12, 1, v7);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v7);
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  if (*(_DWORD *)(v8 + 84))
    v15 = *(_QWORD *)(v8 + 64);
  else
    v15 = *(_QWORD *)(v8 + 64) + 1;
  memcpy((void *)v11, (const void *)v12, v15);
LABEL_10:
  if (*(_DWORD *)(v8 + 84))
    v16 = *(_QWORD *)(v8 + 64);
  else
    v16 = *(_QWORD *)(v8 + 64) + 1;
  *(_QWORD *)(((v11 | 7) + v16) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((v12 | 7) + v16) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22CBE4EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  size_t v15;
  size_t v16;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22CBF750C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  if (__swift_getEnumTagSinglePayload(v12, 1, v7))
  {
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
    if (v13)
      v15 = v14;
    else
      v15 = v14 + 1;
    memcpy((void *)v11, (const void *)v12, v15);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
    __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
  }
  if (v13)
    v16 = v14;
  else
    v16 = v14 + 1;
  *(_QWORD *)(((v11 | 7) + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((v12 | 7) + v16) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22CBE4FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  size_t v15;
  uint64_t v16;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = sub_22CBF750C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v7);
  v14 = __swift_getEnumTagSinglePayload(v12, 1, v7);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload(v11, 0, 1, v7);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  if (*(_DWORD *)(v8 + 84))
    v15 = *(_QWORD *)(v8 + 64);
  else
    v15 = *(_QWORD *)(v8 + 64) + 1;
  memcpy((void *)v11, (const void *)v12, v15);
LABEL_10:
  if (*(_DWORD *)(v8 + 84))
    v16 = *(_QWORD *)(v8 + 64);
  else
    v16 = *(_QWORD *)(v8 + 64) + 1;
  *(_QWORD *)(((v11 | 7) + v16) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((v12 | 7) + v16) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_22CBE514C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v23;
  unsigned int EnumTagSinglePayload;
  unint64_t v25;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = sub_22CBF750C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if ((_DWORD)v10)
    v11 = v10 - 1;
  else
    v11 = 0;
  if (v11 <= 0x7FFFFFFE)
    v12 = 2147483646;
  else
    v12 = v11;
  if (v12 <= v7)
    v13 = v7;
  else
    v13 = v12;
  if ((_DWORD)v10)
    v14 = *(_QWORD *)(v9 + 64);
  else
    v14 = *(_QWORD *)(v9 + 64) + 1;
  if (!a2)
    return 0;
  v15 = v8;
  v16 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  v17 = *(_QWORD *)(v6 + 64) + v16;
  v18 = v14 + 7;
  if (v13 < a2)
  {
    if ((((v18 & 0xFFFFFFFFFFFFFFF8) + (v17 & ~v16) + 8) & 0xFFFFFFF8) != 0)
      v19 = 2;
    else
      v19 = a2 - v13 + 1;
    if (v19 >= 0x10000)
      v20 = 4;
    else
      v20 = 2;
    if (v19 < 0x100)
      v20 = 1;
    if (v19 >= 2)
      v21 = v20;
    else
      v21 = 0;
    __asm { BR              X0 }
  }
  if (v7 >= v12)
    return __swift_getEnumTagSinglePayload(a1, v7, v5);
  v23 = (v17 + a1) & ~v16;
  if (v11 < 0x7FFFFFFE)
  {
    v25 = *(_QWORD *)((v18 + v23) & 0xFFFFFFFFFFFFF8);
    if (v25 >= 0xFFFFFFFF)
      LODWORD(v25) = -1;
    if ((v25 + 1) >= 2)
      return v25;
    else
      return 0;
  }
  else
  {
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v23, v10, v15);
    if (EnumTagSinglePayload >= 2)
      return EnumTagSinglePayload - 1;
    else
      return 0;
  }
}

void sub_22CBE5308(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  unsigned int v21;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = 0;
  v10 = *(_QWORD *)(sub_22CBF750C() - 8);
  v11 = *(_DWORD *)(v10 + 84);
  v12 = v11 - 1;
  if (!v11)
    v12 = 0;
  if (v12 <= 0x7FFFFFFE)
    v13 = 2147483646;
  else
    v13 = v12;
  if (v13 <= v8)
    v14 = v8;
  else
    v14 = v13;
  v15 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v17 = *(_QWORD *)(v10 + 64);
  if (v11)
    v18 = v17;
  else
    v18 = v17 + 1;
  v16 = *(_QWORD *)(v7 + 64) + v15;
  if (v14 < a3)
  {
    if ((((_DWORD)v18 + 7) & 0xFFFFFFF8) + (v16 & ~(_DWORD)v15) == -8)
      v19 = a3 - v14 + 1;
    else
      v19 = 2;
    if (v19 >= 0x10000)
      v20 = 4;
    else
      v20 = 2;
    if (v19 < 0x100)
      v20 = 1;
    if (v19 >= 2)
      v9 = v20;
    else
      v9 = 0;
  }
  if (a2 > v14)
  {
    if ((((_DWORD)v18 + 7) & 0xFFFFFFF8) + (v16 & ~(_DWORD)v15) != -8)
    {
      v21 = ~v14 + a2;
      bzero(a1, ((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + (v16 & ~v15) + 8);
      *a1 = v21;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

void sub_22CBE5440(size_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unsigned int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  _QWORD *v29;

  *(_BYTE *)(v19 + v22) = 0;
  if (!(_DWORD)v18)
    return;
  if (v21 >= v14)
  {
    v26 = v19;
    v27 = v18;
    a2 = v21;
    a3 = v20;
LABEL_7:
    __swift_storeEnumTagSinglePayload(v26, v27, a2, a3);
    return;
  }
  v23 = (_DWORD *)((v16 + v19) & v17);
  if (v14 < v18)
  {
    v24 = (a1 + 7) & 0xFFFFFFF8;
    if (v24 != -8)
    {
      v25 = ~v14 + v18;
      bzero(v23, (v24 + 8));
      *v23 = v25;
    }
    return;
  }
  if (a4 < 0x7FFFFFFE)
  {
    v29 = (_QWORD *)(((unint64_t)v23 + v15) & 0xFFFFFFFFFFFFFFF8);
    if (v18 > 0x7FFFFFFE)
    {
      *v29 = 0;
      *(_DWORD *)v29 = v18 - 0x7FFFFFFF;
    }
    else
    {
      *v29 = v18;
    }
    return;
  }
  if (a4 >= v18)
  {
    v27 = (v18 + 1);
    v26 = (uint64_t)v23;
    goto LABEL_7;
  }
  if ((_DWORD)a1)
  {
    if (a1 <= 3)
      v28 = a1;
    else
      v28 = 4;
    bzero(v23, a1);
    __asm { BR              X10 }
  }
}

void sub_22CBE5598()
{
  __int16 v0;
  _WORD *v1;

  *v1 = v0;
}

void sub_22CBE55A0()
{
  int v0;
  uint64_t v1;

  *(_WORD *)v1 = v0;
  *(_BYTE *)(v1 + 2) = BYTE2(v0);
}

void sub_22CBE55B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255C3B7B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3B7B8);
    v0 = sub_22CBF7CD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255C3B7B0);
  }
}

uint64_t sub_22CBE560C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22CBE5640(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_21();
  sub_22CBE66C0(a1, v1);
  sub_22CBF7CB0();
  sub_22CBE6574(a1, &qword_255C3B7B8);
  OUTLINED_FUNCTION_3_5();
}

uint64_t sub_22CBE56B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C0);
  return sub_22CBF7CBC();
}

void sub_22CBE56F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_21();
  sub_22CBE66C0(a1, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C0);
  sub_22CBF7CC8();
  sub_22CBE6574(a1, &qword_255C3B7B8);
  OUTLINED_FUNCTION_3_5();
}

void sub_22CBE5774(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  v4 = v3;
  v22 = a1;
  v26 = a3;
  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x22E304DA0](&unk_22CBFA788);
  v18 = sub_22CBF7A64();
  v8 = OUTLINED_FUNCTION_22_2();
  v24 = *(_QWORD *)(v8 - 8);
  v20 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v27 = (char *)v16 - v9;
  v23 = OUTLINED_FUNCTION_22_2();
  v25 = *(_QWORD *)(v23 - 8);
  v10 = MEMORY[0x24BDAC7A8](v23);
  v19 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v21 = (char *)v16 - v12;
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  OUTLINED_FUNCTION_43_0((uint64_t)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v4, v17);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16[1] = v13 + v7;
  v14 = swift_allocObject();
  v15 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v14 + 24) = v15;
  OUTLINED_FUNCTION_20_2(v14 + v13);
  OUTLINED_FUNCTION_15_3();
}

void sub_22CBE58FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);

  sub_22CBF7C2C();
  swift_release();
  OUTLINED_FUNCTION_43_0(v2, *(_QWORD *)(v5 - 200), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 - 208));
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v3;
  *(_QWORD *)(v7 + 24) = v1;
  OUTLINED_FUNCTION_20_2(v7 + v4);
  v8 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v5 - 96) = a1;
  *(_QWORD *)(v5 - 88) = v8;
  v9 = MEMORY[0x24BDED308];
  v10 = *(_QWORD *)(v5 - 176);
  v11 = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v10, v5 - 96);
  v12 = *(_QWORD *)(v5 - 184);
  v13 = *(_QWORD *)(v5 - 120);
  sub_22CBF7BD8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 144) + 8))(v13, v10);
  *(_QWORD *)(v5 - 112) = v11;
  *(_QWORD *)(v5 - 104) = v8;
  v14 = *(_QWORD *)(v5 - 152);
  MEMORY[0x22E304DA0](v9, v14, v5 - 112);
  v15 = *(_QWORD *)(v5 - 168);
  sub_22CBF2AA4(v12, v14, v15);
  v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 136) + 8);
  v16(v12, v14);
  sub_22CBF1730(v15, v14, *(_QWORD *)(v5 - 128));
  v16(v15, v14);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE5A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;

  v7 = type metadata accessor for SuggestedIntent(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C8);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_22CBFA7E0;
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v14 + 32) = 0xD000000000000028;
  *(_QWORD *)(v14 + 40) = 0x800000022CBFC770;
  sub_22CBF8010();
  swift_bridgeObjectRelease();
  v15 = sub_22CBF7E9C();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_22CBF7E84();
  v16 = sub_22CBF7E78();
  v17 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v18 = (char *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  *((_QWORD *)v18 + 2) = v16;
  *((_QWORD *)v18 + 3) = v19;
  *((_QWORD *)v18 + 4) = a2;
  *((_QWORD *)v18 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v17], v10, v7);
  sub_22CBE5E18((uint64_t)v13, (uint64_t)&unk_255C3B7E8, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_22CBE5C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  v6[5] = swift_task_alloc();
  sub_22CBF7E84();
  v6[6] = sub_22CBF7E78();
  v6[7] = sub_22CBF7E6C();
  v6[8] = v7;
  return swift_task_switch();
}

uint64_t sub_22CBE5C94()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD, _QWORD);

  sub_22CBF7530();
  v0[9] = sub_22CBF7524();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_3();
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_22CBE5D00;
  return v3(v0[5], v0[2], v0[3], v0[4]);
}

uint64_t sub_22CBE5D00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBE5D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = OUTLINED_FUNCTION_7_3();
  v3 = __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  OUTLINED_FUNCTION_14_3(v3, v4, v5, v6);
  sub_22CBE56F0(v1);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_11_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE5DD4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_11_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE5E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_22CBF7E9C();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_22CBE6574(a1, &qword_255C3B600);
  }
  else
  {
    sub_22CBF7E90();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22CBF7E6C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_22CBE5F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  MEMORY[0x24BDAC7A8](v5);
  v28 = (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CBF750C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C8);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22CBFA7E0;
  *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v17 + 32) = 0xD00000000000002ALL;
  *(_QWORD *)(v17 + 40) = 0x800000022CBFC740;
  sub_22CBF8010();
  swift_bridgeObjectRelease();
  type metadata accessor for SuggestedIntent(0, a2, a3, v18);
  sub_22CBE56B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
    return sub_22CBE6574((uint64_t)v9, &qword_255C3B7B8);
  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v20(v16, v9, v10);
  v21 = sub_22CBF7E9C();
  v22 = v28;
  __swift_storeEnumTagSinglePayload(v28, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  sub_22CBF7E84();
  v23 = sub_22CBF7E78();
  v24 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v25 = swift_allocObject();
  v26 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v25 + 16) = v23;
  *(_QWORD *)(v25 + 24) = v26;
  v20((char *)(v25 + v24), v14, v10);
  sub_22CBE5E18(v22, (uint64_t)&unk_255C3B7D8, v25);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t sub_22CBE61C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  sub_22CBF7E84();
  v4[3] = sub_22CBF7E78();
  v4[4] = sub_22CBF7E6C();
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_22CBE6234()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  sub_22CBF7530();
  v0[6] = sub_22CBF7524();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_3();
  v0[7] = v1;
  *v1 = v0;
  v1[1] = sub_22CBE629C;
  return v3(v0[2]);
}

uint64_t sub_22CBE629C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBE6300()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE632C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE636C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBE63FC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22CBE5A38, a2, a3, a4);
}

uint64_t objectdestroyTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_21_2(a1, a2, *(_QWORD *)(v4 + 24), a4);
  OUTLINED_FUNCTION_5_3();
  v5 = OUTLINED_FUNCTION_7_3();
  if (!OUTLINED_FUNCTION_9_1(v5))
    OUTLINED_FUNCTION_10_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C0);
  OUTLINED_FUNCTION_19_2();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22CBE63F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBE63FC(sub_22CBE5F40, a2, a3, a4);
}

uint64_t sub_22CBE63FC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  type metadata accessor for SuggestedIntent(0, v5, v6, a4);
  OUTLINED_FUNCTION_17_2();
  return a1(v4 + v7, v5, v6);
}

uint64_t sub_22CBE6450()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_7_3();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22CBE64C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_17_2();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v7 = v1 + v6;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_22CBE6534;
  return sub_22CBE61C8(a1, v4, v5, v7);
}

uint64_t sub_22CBE6534()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_22CBE6574(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22CBE65B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_21_2(a1, a2, *(_QWORD *)(v4 + 40), a4);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_3();
  v5 = OUTLINED_FUNCTION_7_3();
  if (!OUTLINED_FUNCTION_9_1(v5))
    OUTLINED_FUNCTION_10_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C0);
  OUTLINED_FUNCTION_19_2();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22CBE662C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v7 = v4[4];
  v8 = v4[5];
  v9 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_14_3(a1, a2, a3, a4) - 8) + 80);
  v10 = v4[2];
  v11 = v4[3];
  v12 = (uint64_t)v4 + ((v9 + 48) & ~v9);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v13;
  *v13 = v5;
  v13[1] = sub_22CBE67F0;
  return sub_22CBE5C00(a1, v10, v11, v12, v7, v8);
}

uint64_t sub_22CBE66C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E304D28](a1, v6, a5);
}

void sub_22CBE6734(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for SuggestedIntent(255, *a1, a1[1], a4);
  OUTLINED_FUNCTION_16_1();
}

void sub_22CBE6764()
{
  sub_22CBF7A64();
  OUTLINED_FUNCTION_13_2();
  sub_22CBF77F4();
  OUTLINED_FUNCTION_16_1();
}

void sub_22CBE67A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  a11 = a1;
  a12 = MEMORY[0x24BDF0910];
  MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v12, &a11);
  OUTLINED_FUNCTION_15_3();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1 + v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_22CBF77F4();
}

uint64_t OUTLINED_FUNCTION_14_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for SuggestedIntent(0, v4, v5, a4);
}

void OUTLINED_FUNCTION_15_3()
{
  JUMPOUT(0x22E304DA0);
}

void OUTLINED_FUNCTION_16_1()
{
  JUMPOUT(0x22E304DA0);
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_21_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for SuggestedIntent(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_22CBF77F4();
}

uint64_t sub_22CBE68DC(uint64_t a1)
{
  return sub_22CBE6904(a1, qword_253F880D0, MEMORY[0x24BE5F948]);
}

uint64_t sub_22CBE68F0(uint64_t a1)
{
  return sub_22CBE6904(a1, qword_255C3C6C0, MEMORY[0x24BE5F940]);
}

uint64_t sub_22CBE6904(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = sub_22CBF7710();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  result = *a3;
  if (*a3)
  {
    sub_22CBF7E00();
    result = *MEMORY[0x24BE5F950];
    if (*MEMORY[0x24BE5F950])
    {
      sub_22CBF7E00();
      return sub_22CBF7704();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t AppIntent.requestConfirmation<A>(conditions:actionName:dialog:showDialogAsPrompt:content:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v9 + 80) = v15;
  *(_QWORD *)(v9 + 88) = v8;
  *(_QWORD *)(v9 + 64) = a8;
  *(_QWORD *)(v9 + 72) = v14;
  *(_QWORD *)(v9 + 48) = a6;
  *(_QWORD *)(v9 + 56) = a7;
  *(_BYTE *)(v9 + 208) = a4;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a5;
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7F8);
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 112) = OUTLINED_FUNCTION_0();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B800);
  *(_QWORD *)(v9 + 120) = v11;
  *(_QWORD *)(v9 + 128) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 136) = OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  *(_QWORD *)(v9 + 144) = OUTLINED_FUNCTION_0();
  v12 = OUTLINED_FUNCTION_18_0();
  *(_QWORD *)(v9 + 152) = v12;
  *(_QWORD *)(v9 + 160) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 168) = OUTLINED_FUNCTION_0();
  return swift_task_switch();
}

uint64_t sub_22CBE6AA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = v0[18];
  v2 = v0[19];
  sub_22CBE6E54(v0[4], v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    v3 = v0[8];
    v5 = v0[5];
    v4 = v0[6];
    v6 = v0[2];
    sub_22CBE6E9C(v0[18]);
    sub_22CBE6F64(v6, v5, v4, v3);
    v7 = (_QWORD *)swift_task_alloc();
    v0[24] = v7;
    sub_22CBE6FEC(&qword_255C3B808, &qword_255C3B7F8);
    *v7 = v0;
    v7[1] = sub_22CBE6D1C;
  }
  else
  {
    v8 = v0[21];
    v9 = v0[8];
    v11 = v0[5];
    v10 = v0[6];
    v12 = v0[2];
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[20] + 32))(v8, v0[18], v0[19]);
    sub_22CBE6EDC(v12, v8, v11, v10, v9);
    v13 = (_QWORD *)swift_task_alloc();
    v0[22] = v13;
    sub_22CBE6FEC(&qword_255C3B810, &qword_255C3B800);
    *v13 = v0;
    v13[1] = sub_22CBE6C44;
  }
  return sub_22CBF7320();
}

uint64_t sub_22CBE6C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_59(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  return swift_task_switch();
}

uint64_t sub_22CBE6CC4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_4();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_16_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22CBE6D1C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*v1 + 104);
  v2 = *(_QWORD *)(*v1 + 112);
  v4 = *v1;
  *(_QWORD *)(v4 + 200) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_59(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_16_2();
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_22CBE6DD8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_16_2();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE6E18()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_16_2();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBE6E54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBE6E9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_22CBE6EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  void (*v10)(void);

  v9 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_31();
  v10();
  sub_22CBE7198(a1, a2, v5, a5);
  OUTLINED_FUNCTION_59(v5, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  OUTLINED_FUNCTION_41();
}

void sub_22CBE6F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);

  v6 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_9();
  v9 = v8 - v7;
  v10();
  sub_22CBE702C(a1, v9, a4);
  OUTLINED_FUNCTION_59(v9, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_41();
}

uint64_t sub_22CBE6FEC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDB5E58], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_22CBE702C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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

  v6 = sub_22CBF7488();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_13_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_49();
  v9 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_9();
  v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9();
  v17 = v16 - v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v13, a2, a3);
  sub_22CBDB318(v17);
  v18 = OUTLINED_FUNCTION_18_0();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v18);
  OUTLINED_FUNCTION_15_4(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 16));
  sub_22CBF747C();
  sub_22CBDB5C8();
  sub_22CBDB604();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7();
}

void sub_22CBE7198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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

  v8 = sub_22CBF7488();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_13_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B3B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_49();
  v11 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_9();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_31();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v15, a3, a4);
  sub_22CBDB318(v5);
  v17 = OUTLINED_FUNCTION_18_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v4, a2, v17);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v17);
  OUTLINED_FUNCTION_15_4(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 16));
  sub_22CBF747C();
  sub_22CBDB5C8();
  sub_22CBDB604();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;

  return v0 - 81;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_22CBF7464();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[20] + 8))(v0[21], v0[19]);
}

uint64_t OUTLINED_FUNCTION_15_4@<X0>(uint64_t (*a1)(uint64_t, _QWORD, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, *(_QWORD *)(v3 - 144), v2);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_task_dealloc();
}

void PlaybackButton.init<A>(interval:state:intent:systemImage:alignment:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
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

  v10 = OUTLINED_FUNCTION_2_4(a1, a2, a3, a4, a5, a6, a7);
  v11 = MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_5(v11, v12, v13, v14, v15, v16, v17, v18, v22);
  OUTLINED_FUNCTION_17_3();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B818);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0_2();
  sub_22CBE0E38();
  if (OUTLINED_FUNCTION_6_2())
  {
    sub_22CBE769C(v24, v9, &qword_255C3B818);
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_23_1(v23, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    OUTLINED_FUNCTION_15_5();
    v21 = swift_allocObject();
    OUTLINED_FUNCTION_4_4(v21);
    OUTLINED_FUNCTION_13_4();
    sub_22CBF77C4();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_10_5();
    sub_22CBE6574(v24, &qword_255C3B818);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_7_4();
    __break(1u);
  }
}

void sub_22CBE74DC()
{
  sub_22CBE787C((uint64_t)&unk_24F76BEA0, (uint64_t)&unk_255C3B838);
}

uint64_t sub_22CBE74F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_22CBF7E84();
  v6[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

void PlaybackButton.init<A>(interval:state:intent:playSystemImage:pauseSystemImage:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
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

  v10 = OUTLINED_FUNCTION_2_4(a1, a2, a3, a4, a5, a6, a7);
  v11 = MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_5(v11, v12, v13, v14, v15, v16, v17, v18, v22);
  OUTLINED_FUNCTION_17_3();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_12_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87450);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0_2();
  sub_22CBE0E38();
  if (OUTLINED_FUNCTION_6_2())
  {
    sub_22CBE769C(v24, v9, &qword_253F87450);
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_23_1(v23, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    OUTLINED_FUNCTION_15_5();
    v21 = swift_allocObject();
    OUTLINED_FUNCTION_4_4(v21);
    OUTLINED_FUNCTION_13_4();
    sub_22CBF77D0();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_10_5();
    sub_22CBE6574(v24, &qword_253F87450);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_7_4();
    __break(1u);
  }
}

uint64_t sub_22CBE769C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_22CBE76E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = *(_QWORD *)(a2 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_22CBF7E9C();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  OUTLINED_FUNCTION_23_1((uint64_t)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  sub_22CBF7E84();
  v15 = sub_22CBF7E78();
  v16 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v15;
  v17[3] = v18;
  v17[4] = a2;
  v17[5] = a3;
  OUTLINED_FUNCTION_23_1((uint64_t)v17 + v16, (uint64_t)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
  sub_22CBE8BA0((uint64_t)v13, a5, (uint64_t)v17);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

void sub_22CBE7868()
{
  sub_22CBE787C((uint64_t)&unk_24F76BE78, (uint64_t)&unk_255C3B828);
}

void sub_22CBE787C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  sub_22CBE76E0(v2 + ((v5 + 32) & ~v5), v4, *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_22CBE78B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_22CBF7E84();
  v6[5] = sub_22CBF7E78();
  sub_22CBF7E6C();
  return swift_task_switch();
}

uint64_t sub_22CBE7924()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_8_4(v1);
  return sub_22CBE78B0(v2, v3, v4, v5, v6, v7);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22CBE79EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_8_4(v1);
  return sub_22CBE74F0(v2, v3, v4, v5, v6, v7);
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 192) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_22CBF77B8();
}

uint64_t OUTLINED_FUNCTION_8_4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 208) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  uint64_t v0;

  return v0;
}

uint64_t Scene._handle<A>(intent:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22CBE80CC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_24F76BEC8, (uint64_t)sub_22CBE8330, (void (*)(uint64_t, _QWORD *, uint64_t, uint64_t))sub_22CBEA614);
}

uint64_t sub_22CBE7B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31[5];

  v4 = type metadata accessor for _AppIntentExecution();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CBF7680();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  sub_22CBF72F0();
  sub_22CBF72D8();
  sub_22CBF72E4();
  swift_release();
  if (v30)
  {
    sub_22CBE0C00(&v29, (uint64_t)v31);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, a1, v7);
    sub_22CBE8550((uint64_t)v31, (uint64_t)&v29);
    v14 = (uint64_t)&v6[*(int *)(v4 + 20)];
    *(_QWORD *)(v14 + 32) = 0;
    *(_OWORD *)v14 = 0u;
    *(_OWORD *)(v14 + 16) = 0u;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v13, v7);
    sub_22CBE6574(v14, &qword_255C3B850);
    sub_22CBE0C00(&v29, v14);
    sub_22CBE8444((uint64_t)v6, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    v15 = a2;
    v16 = 0;
  }
  else
  {
    sub_22CBE6574((uint64_t)&v29, &qword_255C3B850);
    if (qword_255C3B2D0 != -1)
      swift_once();
    v17 = sub_22CBF7710();
    __swift_project_value_buffer(v17, (uint64_t)qword_255C3C6C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
    v18 = sub_22CBF76F8();
    v19 = sub_22CBF7EB4();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v28 = a2;
      v22 = v21;
      v31[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v27 = v20 + 4;
      sub_22CBE8510();
      v23 = sub_22CBF7FB0();
      *(_QWORD *)&v29 = sub_22CBEE074(v23, v24, v31);
      sub_22CBF7EE4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      _os_log_impl(&dword_22CBD7000, v18, v19, "Failed to find contents for %s", v20, 0xCu);
      swift_arrayDestroy();
      v25 = v22;
      a2 = v28;
      MEMORY[0x22E304E0C](v25, -1, -1);
      MEMORY[0x22E304E0C](v20, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }

    v15 = a2;
    v16 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v15, v16, 1, v4);
}

uint64_t sub_22CBE7EAC(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *);
  _BYTE v27[40];

  v25 = a3;
  v26 = a2;
  v23[1] = a5;
  v24 = sub_22CBF723C();
  v7 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)v23 - v8;
  v10 = sub_22CBF7ED8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v23 - v13;
  v15 = *(_QWORD *)(a4 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v23 - v19;
  v21 = type metadata accessor for _AppIntentExecution();
  sub_22CBE84C8(v5 + *(int *)(v21 + 20), (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B850);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, a4);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v14, a4);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, a4);
    sub_22CBF7230();
    v26(v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, a4);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
}

uint64_t View._handle<A>(intent:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22CBE80CC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&unk_24F76BEF0, (uint64_t)sub_22CBE8330, (void (*)(uint64_t, _QWORD *, uint64_t, uint64_t))sub_22CBEA620);
}

uint64_t sub_22CBE80CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, _QWORD *, uint64_t, uint64_t))
{
  _QWORD *v16;

  if (qword_253F874E8 != -1)
    swift_once();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a4;
  v16[3] = a5;
  v16[4] = a6;
  v16[5] = a7;
  v16[6] = a2;
  v16[7] = a3;
  swift_retain();
  a10(a9, v16, a4, a6);
  return swift_release();
}

uint64_t sub_22CBE81A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(char *))
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *);

  v24 = a8;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B848);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for _AppIntentExecution();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBE7B70(a1, (uint64_t)v17);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
    return sub_22CBE6574((uint64_t)v17, &qword_255C3B848);
  v22 = sub_22CBE8444((uint64_t)v17, (uint64_t)v20);
  MEMORY[0x24BDAC7A8](v22);
  *(&v23 - 6) = a4;
  *(&v23 - 5) = a5;
  *(&v23 - 4) = a6;
  *(&v23 - 3) = a7;
  *(&v23 - 2) = a2;
  *(&v23 - 1) = a3;
  sub_22CBE7EAC(a5, v24, (uint64_t)(&v23 - 8), a5, a7);
  return sub_22CBE848C((uint64_t)v20);
}

uint64_t sub_22CBE830C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22CBE8330(uint64_t a1)
{
  return sub_22CBE833C(a1, (void (*)(char *))sub_22CBE8488);
}

uint64_t sub_22CBE833C(uint64_t a1, void (*a2)(char *))
{
  uint64_t *v2;

  return sub_22CBE81A8(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_22CBE8360()
{
  return get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm();
}

unint64_t sub_22CBE836C()
{
  unint64_t result;

  result = qword_255C3B840;
  if (!qword_255C3B840)
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFA884, &type metadata for Definition);
    atomic_store(result, (unint64_t *)&qword_255C3B840);
  }
  return result;
}

uint64_t sub_22CBE83A8()
{
  return get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm();
}

uint64_t get_witness_table_7SwiftUI5SceneRz10AppIntents0D6IntentRd__r__lqd0__AaBHD3_AaBPAAE25onConnectionOptionPayload_7performQrqd__m_y0J0Qyd__ct5UIKit07UIScenehI10DefinitionRd__lFQOyx_01_de1_aB00N0OQo_HOTm()
{
  sub_22CBE836C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for _AppIntentExecution()
{
  uint64_t result;

  result = qword_255C3B860;
  if (!qword_255C3B860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22CBE8444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _AppIntentExecution();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBE848C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _AppIntentExecution();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22CBE84C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22CBE8510()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C3B858;
  if (!qword_255C3B858)
  {
    v1 = sub_22CBF7680();
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_255C3B858);
  }
  return result;
}

uint64_t sub_22CBE8550(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22CBE8594()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t *sub_22CBE85B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22CBF7680();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 24);
    if (v11)
    {
      v12 = *((_QWORD *)v10 + 4);
      *((_QWORD *)v9 + 3) = v11;
      *((_QWORD *)v9 + 4) = v12;
      (**(void (***)(void))(v11 - 8))();
    }
    else
    {
      v14 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v14;
      *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
    }
  }
  return a1;
}

uint64_t sub_22CBE866C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_22CBF7680();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = a1 + *(int *)(a2 + 20);
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_1(result);
  return result;
}

uint64_t sub_22CBE86C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = sub_22CBF7680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 24);
  if (v10)
  {
    v11 = *(_QWORD *)(v9 + 32);
    *(_QWORD *)(v8 + 24) = v10;
    *(_QWORD *)(v8 + 32) = v11;
    (**(void (***)(void))(v10 - 8))();
  }
  else
  {
    v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  }
  return a1;
}

uint64_t sub_22CBE8750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v6 = sub_22CBF7680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *((_QWORD *)v9 + 3);
  if (!*(_QWORD *)(a1 + v7 + 24))
  {
    if (v10)
    {
      *(_QWORD *)(v8 + 24) = v10;
      *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
      (**(void (***)(uint64_t, __int128 *))(v10 - 8))(v8, v9);
      return a1;
    }
LABEL_7:
    v11 = *v9;
    v12 = v9[1];
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    *(_OWORD *)v8 = v11;
    *(_OWORD *)(v8 + 16) = v12;
    return a1;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_1(v8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v8, (uint64_t *)v9);
  return a1;
}

uint64_t sub_22CBE880C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = sub_22CBF7680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  return a1;
}

uint64_t sub_22CBE8878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v6 = sub_22CBF7680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  if (*(_QWORD *)(a1 + v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v9 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(a2 + v7 + 32);
  return a1;
}

uint64_t sub_22CBE88F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CBE8900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = sub_22CBF7680();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t sub_22CBE8988()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CBE8994(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_22CBF7680();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  return result;
}

uint64_t sub_22CBE8A0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22CBF7680();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22CBE8A80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_30_1(v11, v13, v14, v12);
  OUTLINED_FUNCTION_19_3((uint64_t)v7, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  sub_22CBF7E84();
  v15 = sub_22CBF7E78();
  v16 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v15;
  v17[3] = v18;
  v17[4] = a1;
  v17[5] = a2;
  OUTLINED_FUNCTION_19_3((uint64_t)v17 + v16, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
  sub_22CBE8BA0(v11, (uint64_t)&unk_255C3B8A0, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_22CBE8BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = OUTLINED_FUNCTION_28_2();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22CBE9ED8(a1, &qword_255C3B600);
  }
  else
  {
    sub_22CBF7E90();
    OUTLINED_FUNCTION_24_2(a1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8));
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22CBF7E6C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void Button.init<A>(intent:label:)()
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
  void *v16;
  unint64_t v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[8];

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v20[1] = v8;
  v20[2] = v9;
  v11 = v10;
  v20[0] = v12;
  v13 = *(_QWORD *)(v4 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBF732C();
  sub_22CBE0E38();
  if (OUTLINED_FUNCTION_6_2())
  {
    v16 = (void *)v20[3];
    OUTLINED_FUNCTION_19_3((uint64_t)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
    v17 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v7;
    v18[3] = v5;
    v18[4] = v3;
    v18[5] = v1;
    OUTLINED_FUNCTION_19_3((uint64_t)v18 + v17, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
    v19 = v16;
    sub_22CBF7D04();

    OUTLINED_FUNCTION_13_5(v11, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_11_4();
    __break(1u);
  }
}

void sub_22CBE8E3C()
{
  sub_22CBE9378();
}

void Button<>.init<A>(_:intent:)()
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

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v5 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v0, v7, v8);
  Button.init<A>(intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

void Button<>.init<A, B>(_:intent:)()
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

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_5();
  (*(void (**)(uint64_t))(v9 + 16))(v0);
  Button.init<A>(intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v2);
  OUTLINED_FUNCTION_24_2(v8, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8));
  OUTLINED_FUNCTION_7();
}

void Button.init<A>(role:intent:label:)()
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
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v30 = v3;
  v31 = v4;
  v6 = v5;
  v8 = v7;
  v28 = v10;
  v29 = v9;
  v12 = v11;
  v14 = v13;
  v15 = *(_QWORD *)(v5 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4_0();
  v27 = v2;
  sub_22CBF732C();
  sub_22CBE0E38();
  if (OUTLINED_FUNCTION_6_2())
  {
    v19 = v32;
    sub_22CBE91A8(v14, v0);
    OUTLINED_FUNCTION_23_1((uint64_t)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
    v20 = *(unsigned __int8 *)(v15 + 80);
    v26 = v14;
    v21 = (v20 + 48) & ~v20;
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v8;
    v22[3] = v6;
    v23 = v27;
    v22[4] = v31;
    v22[5] = v23;
    OUTLINED_FUNCTION_23_1((uint64_t)v22 + v21, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    v24 = v19;
    sub_22CBF7CEC();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v6);
    sub_22CBE9ED8(v26, &qword_255C3B870);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_11_4();
    __break(1u);
  }
}

uint64_t sub_22CBE91A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22CBE91F0()
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
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_9_0();
  v22 = v1;
  v23 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B600);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_5();
  v14 = OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_30_1(v0, v15, v16, v14);
  OUTLINED_FUNCTION_23_1((uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  sub_22CBF7E84();
  v17 = sub_22CBF7E78();
  v18 = (*(unsigned __int8 *)(v11 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v17;
  v19[3] = v20;
  v19[4] = v8;
  v19[5] = v6;
  v21 = v22;
  v19[6] = v4;
  v19[7] = v21;
  OUTLINED_FUNCTION_23_1((uint64_t)v19 + v18, (uint64_t)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  sub_22CBE8BA0(v0, v23, (uint64_t)v19);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

void sub_22CBE9364()
{
  sub_22CBE9378();
}

void sub_22CBE9378()
{
  sub_22CBE91F0();
}

void Button<>.init<A>(_:role:intent:)()
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

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v5 = v4;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4_0();
  sub_22CBE91A8(v5, v0);
  OUTLINED_FUNCTION_26_2(v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  Button.init<A>(role:intent:label:)();
  OUTLINED_FUNCTION_24_2(v3, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  sub_22CBE9ED8(v5, &qword_255C3B870);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE94B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22CBE11F0(a1);
}

void Button<>.init<A, B>(_:role:intent:)()
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

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_21_3();
  sub_22CBE91A8(v7, v1);
  OUTLINED_FUNCTION_26_2(v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  Button.init<A>(role:intent:label:)();
  OUTLINED_FUNCTION_24_2(v5, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  sub_22CBE9ED8(v7, &qword_255C3B870);
  OUTLINED_FUNCTION_13_5(v9, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE95D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v5 + 16))(v4 - v3);
  result = sub_22CBF7B84();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(_QWORD *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_22CBE965C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22CBE95D4(*(_QWORD *)(v1 + 48), a1);
}

void Button<>.init<A>(_:systemImage:role:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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

  OUTLINED_FUNCTION_9_0();
  v23 = v22;
  v25 = v24;
  v26 = *(_QWORD *)(a21 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_8_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_9();
  sub_22CBE91A8(v25, v30 - v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v21, v23, a21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F0);
  sub_22CBE984C();
  Button.init<A>(role:intent:label:)();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v23, a21);
  sub_22CBE9ED8(v25, &qword_255C3B870);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE97B8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_22CBF7C80();
}

uint64_t sub_22CBE9838()
{
  return sub_22CBE97B8();
}

unint64_t sub_22CBE984C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F873E8;
  if (!qword_253F873E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F873F0);
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDF41A8], v1);
    atomic_store(result, (unint64_t *)&qword_253F873E8);
  }
  return result;
}

void Button<>.init<A, B>(_:systemImage:role:intent:)()
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

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v12 = v3;
  v6 = v5;
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9();
  sub_22CBE91A8(v4, v11 - v10);
  OUTLINED_FUNCTION_17_4(v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F0);
  sub_22CBE984C();
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_22CBE9ED8(v12, &qword_255C3B870);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_5(v6, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE99B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  return sub_22CBF7C8C();
}

uint64_t sub_22CBE9A58()
{
  uint64_t v0;

  return sub_22CBE99B4(*(_QWORD *)(v0 + 48));
}

void Button<>.init<A>(_:image:role:intent:)()
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
  void (*v12)(uint64_t);
  uint64_t v13;

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  v3 = v2;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_7_5(v11, v13);
  OUTLINED_FUNCTION_17_4(v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F0);
  sub_22CBE984C();
  Button.init<A>(role:intent:label:)();
  OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_22CBE9ED8(v1, &qword_255C3B870);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_2();
  sub_22CBF76B0();
  OUTLINED_FUNCTION_23_2();
  v12(v3);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE9B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = sub_22CBF76B0();
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_22CBF7C98();
}

uint64_t sub_22CBE9C4C()
{
  uint64_t v0;

  return sub_22CBE9B8C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void Button<>.init<A, B>(_:image:role:intent:)()
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
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_9_0();
  v14 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_8_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B870);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_7_5(v11, v13);
  OUTLINED_FUNCTION_17_4(v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F0);
  sub_22CBE984C();
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  sub_22CBE9ED8(v5, &qword_255C3B870);
  sub_22CBF76B0();
  OUTLINED_FUNCTION_23_2();
  v12(v7);
  OUTLINED_FUNCTION_13_5(v14, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBE9D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_22CBF76B0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  return sub_22CBF7CA4();
}

uint64_t sub_22CBE9E68()
{
  uint64_t *v0;

  return sub_22CBE9D74(v0[6], v0[7], v0[2]);
}

uint64_t sub_22CBE9E7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_2();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  v2 = OUTLINED_FUNCTION_5_6(v1);
  return sub_22CBE1048(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_22CBE9ED8(uint64_t a1, uint64_t *a2)
{
  void (*v3)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_23_2();
  v3(a1);
  return a1;
}

uint64_t sub_22CBE9F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  v7 = sub_22CBF7ED8();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  sub_22CBF7E84();
  v6[12] = sub_22CBF7E78();
  v6[13] = sub_22CBF7E6C();
  v6[14] = v8;
  return swift_task_switch();
}

uint64_t sub_22CBEA01C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_22CBEA078;
  return sub_22CBF7314();
}

uint64_t sub_22CBEA078()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[10] + 8))(v2[11], v2[9]);
  return swift_task_switch();
}

uint64_t sub_22CBEA0EC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEA11C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 128);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B7C8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22CBFA7E0;
  sub_22CBF7F20();
  swift_getDynamicType();
  v3 = sub_22CBF804C();
  v5 = v4;
  swift_bridgeObjectRelease();
  sub_22CBF7DF4();
  swift_getErrorValue();
  sub_22CBF7FD4();
  sub_22CBF7DF4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v5;
  sub_22CBF8010();
  OUTLINED_FUNCTION_25_2();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22CBEA270(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22CBEA2D4;
  return v6(a1);
}

uint64_t sub_22CBEA2D4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEA2FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22CBEA320(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_14_2(v5);
  *v6 = v2;
  v6[1] = sub_22CBEA38C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255C3B888 + dword_255C3B888))(a1, v4);
}

uint64_t sub_22CBEA38C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEA3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_5(v0 + v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBEA3F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[4];
  v5 = v1[5];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v7 = v1[2];
  v8 = v1[3];
  v9 = (uint64_t)v1 + ((v6 + 48) & ~v6);
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_14_2(v10);
  *v11 = v2;
  v11[1] = sub_22CBEA38C;
  return sub_22CBE9F0C(a1, v7, v8, v9, v4, v5);
}

uint64_t objectdestroy_5Tm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 40) - 8);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_5(v0 + v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return OUTLINED_FUNCTION_7_2();
}

uint64_t sub_22CBEA4D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_2();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_14_2(v0);
  v2 = OUTLINED_FUNCTION_5_6(v1);
  return sub_22CBE2468(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t OUTLINED_FUNCTION_5_6(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_22CBF7F68();
}

uint64_t OUTLINED_FUNCTION_13_5@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_17_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_19_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_24_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return sub_22CBF7E9C();
}

void OUTLINED_FUNCTION_29_2()
{
  Button.init<A>(role:intent:label:)();
}

uint64_t sub_22CBEA614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBEA62C(a1, a2, a3, a4, MEMORY[0x24BDF41C8]);
}

uint64_t sub_22CBEA620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22CBEA62C(a1, a2, a3, a4, MEMORY[0x24BDF32B8]);
}

uint64_t sub_22CBEA62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(ValueMetadata *, uint64_t, uint64_t, uint64_t, ValueMetadata *, uint64_t, unint64_t))
{
  unint64_t v9;

  v9 = sub_22CBE836C();
  return a5(&type metadata for Definition, a1, a2, a3, &type metadata for Definition, a4, v9);
}

uint64_t (*sub_22CBEA6A0(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_unknownObjectRetain();
  return sub_22CBEAD78;
}

ValueMetadata *type metadata accessor for Definition()
{
  return &type metadata for Definition;
}

uint64_t sub_22CBEA70C()
{
  return sub_22CBEA754(&qword_255C3B920, MEMORY[0x24BDCEAA8]);
}

uint64_t sub_22CBEA730()
{
  return sub_22CBEA754(&qword_255C3B928, MEMORY[0x24BDCEA70]);
}

uint64_t sub_22CBEA754(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_22CBF7680();
    result = MEMORY[0x22E304DA0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22CBEA794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(a1, a2, ObjectType, a4);
}

uint64_t sub_22CBEA7E4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v4;

  v4 = a1;
  a3(&v4);
  return swift_release();
}

uint64_t (*sub_22CBEA818())@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v0;
  uint64_t (*v1)();
  uint64_t v2;

  v1 = off_253F87120;
  v0 = unk_253F87128;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  swift_retain();
  return sub_22CBEA948;
}

uint64_t sub_22CBEA878@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD, _QWORD)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = a2(*a1, a1[1]);
  v6 = v5;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v4;
  *(_QWORD *)(result + 24) = v6;
  *a3 = sub_22CBEA950;
  a3[1] = result;
  return result;
}

uint64_t sub_22CBEA8DC(void (**a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t *);

  v5 = *a1;
  swift_retain();
  return sub_22CBEA7E4(a2, a3, v5);
}

uint64_t sub_22CBEA924()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22CBEA948@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_22CBEA878(a1, *(uint64_t (**)(_QWORD, _QWORD))(v2 + 16), a2);
}

uint64_t sub_22CBEA950(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_22CBEA974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_22CBEA990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B938);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22CBFA840;
  sub_22CBEABFC();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  swift_retain();
  v5 = sub_22CBEAC58((uint64_t)sub_22CBEAC38, v4);
  sub_22CBE836C();
  v6 = sub_22CBF771C();

  *(_QWORD *)(v3 + 32) = v6;
  sub_22CBF7E30();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

unint64_t sub_22CBEABFC()
{
  unint64_t result;

  result = qword_255C3B940;
  if (!qword_255C3B940)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C3B940);
  }
  return result;
}

uint64_t sub_22CBEAC38()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_22CBEAC58(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  _QWORD v5[6];

  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_22CBEACEC;
  v5[3] = &block_descriptor;
  v2 = _Block_copy(v5);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_responderWithHandler_, v2);
  _Block_release(v2);
  swift_release();
  return v3;
}

void sub_22CBEACEC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_22CBEAD54()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22CBEAD78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22CBEA794(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_22CBEAD88()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_10();
}

void sub_22CBEADA4(id *a1)
{
  id v1;

  v1 = *a1;
  EnvironmentValues.attributeSet.setter();
  OUTLINED_FUNCTION_10();
}

void sub_22CBEADC8(_BYTE *a1@<X8>)
{
  char v2;

  EnvironmentValues.displayLocation.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_5_7();
}

void sub_22CBEADF8()
{
  EnvironmentValues.displayLocation.setter();
  OUTLINED_FUNCTION_5_7();
}

void sub_22CBEAE24()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_9_3();
  v0[1] = v1;
  OUTLINED_FUNCTION_10();
}

void sub_22CBEAE40()
{
  swift_bridgeObjectRetain();
  EnvironmentValues.searchString.setter();
}

void DisplayRepresentation.init<A>(content:)(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);

  v30 = a3;
  v33 = a1;
  v27 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87080);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_1();
  v26 = v7;
  v25 = sub_22CBF7644();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_1();
  v24[1] = v9;
  v10 = sub_22CBF7434();
  v28 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBF73BC();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_22CBF7560();
  v31 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_6();
  v15 = *(_QWORD *)(a2 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v24 - v21;
  v33(v20);
  sub_22CBF75CC();
  OUTLINED_FUNCTION_65();
  sub_22CBF75C0();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v22, a2);
  v33 = (void (*)(uint64_t))a2;
  sub_22CBE00A8((uint64_t)v19, a2, v30);
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v12, *MEMORY[0x24BDB57B0], v29);
  sub_22CBF7554();
  sub_22CBE0AB8(qword_253F87460, (uint64_t (*)(uint64_t))MEMORY[0x24BDB6520], MEMORY[0x24BDB6528]);
  v23 = v32;
  sub_22CBF75B4();
  if (v23)
  {
    OUTLINED_FUNCTION_6_5();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v4, v14);
  }
  else
  {
    sub_22CBF7638();
    v32 = v14;
    __swift_storeEnumTagSinglePayload(v26, 1, 1, v25);
    sub_22CBF7458();
    OUTLINED_FUNCTION_6_5();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v4, v32);
  }
  (*(void (**)(char *, void (*)(uint64_t)))(v15 + 8))(v22, v33);
  OUTLINED_FUNCTION_2();
}

void static DisplayRepresentation.view(from:attributeSet:displayLocation:searchString:)(uint64_t a1@<X2>, unsigned __int8 *a2@<X3>, uint64_t a3@<X4>, unint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  void *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD v20[2];
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[2];
  uint64_t v24[3];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28[3];
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];
  unint64_t v32;

  v32 = a4;
  type metadata accessor for SharedIndexedViewFormatDecodable();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6();
  v18 = *a2;
  sub_22CBF75A8();
  OUTLINED_FUNCTION_65();
  sub_22CBF759C();
  sub_22CBE0AB8(&qword_253F87230, (uint64_t (*)(uint64_t))type metadata accessor for SharedIndexedViewFormatDecodable, (uint64_t)&unk_22CBFA610);
  sub_22CBF7590();
  if (v5)
  {
    OUTLINED_FUNCTION_6_5();
    sub_22CBE0AF8();
    swift_allocError();
    swift_willThrow();

  }
  else
  {
    sub_22CBE8550(v6, (uint64_t)v31);
    v11 = v31[4];
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    swift_getKeyPath();
    v24[0] = a1;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87260);
    v29 = sub_22CBF77F4();
    v27[0] = *(_QWORD *)(v11 + 24);
    v27[1] = sub_22CBEB524(&qword_253F87258, &qword_253F87260);
    v30 = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v29, v27);
    __swift_allocate_boxed_opaque_existential_2Tm(v28);
    sub_22CBF7BCC();
    swift_release();
    v12 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    swift_getKeyPath();
    v13 = v18;
    if (v18 == 3)
      v13 = 1;
    LOBYTE(v21) = v13;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87240);
    v25 = OUTLINED_FUNCTION_3_7();
    v23[0] = v12;
    v23[1] = sub_22CBEB524(&qword_253F87238, &qword_253F87240);
    v26 = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v25, v23);
    __swift_allocate_boxed_opaque_existential_2Tm(v24);
    sub_22CBF7BCC();
    swift_release();
    v14 = v26;
    __swift_project_boxed_opaque_existential_1(v24, v25);
    swift_getKeyPath();
    v15 = a3;
    if (v32)
    {
      v16 = v32;
    }
    else
    {
      v15 = 0;
      v16 = 0xE000000000000000;
    }
    v21 = v15;
    v22 = v16;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87250);
    v17 = OUTLINED_FUNCTION_3_7();
    a5[3] = v17;
    v20[0] = v14;
    v20[1] = sub_22CBEB524(&qword_253F87248, &qword_253F87250);
    a5[4] = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v17, v20);
    __swift_allocate_boxed_opaque_existential_2Tm(a5);
    swift_bridgeObjectRetain();
    sub_22CBF7BCC();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    sub_22CBE0890(v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  OUTLINED_FUNCTION_2();
}

void sub_22CBEB4DC()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_10();
}

void sub_22CBEB504()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_9_3();
  v0[1] = v1;
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBEB524(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDF1028], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return EnvironmentValues.searchString.getter();
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return EnvironmentValues.attributeSet.getter();
}

id sub_22CBEB590()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id result;

  if (qword_255C3B310 != -1)
    swift_once();
  v0 = qword_255C3B318;
  v1 = (id)qword_255C3C6F8;
  if (v0 != -1)
    swift_once();
  v2 = (void *)qword_255C3C700;
  v3 = (void *)objc_opt_self();
  v4 = v2;
  result = objc_msgSend(v3, sel_clearColor);
  qword_255C3B9C0 = (uint64_t)v1;
  *(_QWORD *)algn_255C3B9C8 = v4;
  qword_255C3B9D0 = (uint64_t)result;
  qword_255C3B9D8 = 0;
  return result;
}

id static ShortcutsLinkStyle.automatic.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B2D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3B9C0);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

id sub_22CBEB6B0()
{
  uint64_t v0;
  id v1;
  id v2;
  id result;

  if (qword_255C3B318 != -1)
    swift_once();
  v0 = qword_255C3B310;
  v1 = (id)qword_255C3C700;
  if (v0 != -1)
    swift_once();
  v2 = (id)qword_255C3C6F8;
  result = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.3);
  qword_255C3B9E0 = (uint64_t)v1;
  *(_QWORD *)algn_255C3B9E8 = v2;
  qword_255C3B9F0 = (uint64_t)result;
  unk_255C3B9F8 = 0x3FF0000000000000;
  return result;
}

id static ShortcutsLinkStyle.automaticOutline.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B2E0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3B9E0);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

id sub_22CBEB7C0()
{
  void *v0;
  id v1;
  id v2;
  id result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_whiteColor);
  v2 = objc_msgSend(v0, sel_blackColor);
  result = objc_msgSend(v0, sel_clearColor);
  qword_255C3BA00 = (uint64_t)v1;
  *(_QWORD *)algn_255C3BA08 = v2;
  qword_255C3BA10 = (uint64_t)result;
  unk_255C3BA18 = 0;
  return result;
}

id static ShortcutsLinkStyle.light.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B2E8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3BA00);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

void sub_22CBEB8A4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_whiteColor);
  v2 = objc_msgSend(v0, sel_blackColor);
  v3 = objc_msgSend(v0, sel_blackColor);
  v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.3);

  qword_255C3BA20 = (uint64_t)v1;
  *(_QWORD *)algn_255C3BA28 = v2;
  qword_255C3BA30 = (uint64_t)v4;
  unk_255C3BA38 = 0x3FF0000000000000;
}

id static ShortcutsLinkStyle.lightOutline.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B2F0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3BA20);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

id sub_22CBEB9B0()
{
  void *v0;
  id v1;
  id v2;
  id result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_blackColor);
  v2 = objc_msgSend(v0, sel_whiteColor);
  result = objc_msgSend(v0, sel_clearColor);
  qword_255C3BA40 = (uint64_t)v1;
  *(_QWORD *)algn_255C3BA48 = v2;
  qword_255C3BA50 = (uint64_t)result;
  unk_255C3BA58 = 0;
  return result;
}

id static ShortcutsLinkStyle.dark.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B2F8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3BA40);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

void sub_22CBEBA94()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_blackColor);
  v2 = objc_msgSend(v0, sel_whiteColor);
  v3 = objc_msgSend(v0, sel_whiteColor);
  v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.3);

  qword_255C3BA60 = (uint64_t)v1;
  *(_QWORD *)algn_255C3BA68 = v2;
  qword_255C3BA70 = (uint64_t)v4;
  unk_255C3BA78 = 0x3FF0000000000000;
}

id static ShortcutsLinkStyle.darkOutline.getter()
{
  void *v0;
  id v1;
  void *v3;

  if (qword_255C3B300 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4((uint64_t)&qword_255C3BA60);
  v1 = v0;
  return OUTLINED_FUNCTION_1_5(v3);
}

uint64_t ShortcutsLink.init(action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = a1;
  *(_QWORD *)(a3 + 48) = a2;
  return result;
}

uint64_t ShortcutsLink.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  __int128 v43;
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
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  __int128 v61;
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
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  char v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _OWORD v89[2];
  char v90;

  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F872F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_1();
  v72 = v3;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BA80);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_1();
  v64 = v5;
  v75 = sub_22CBF7830();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9();
  v9 = (char *)(v8 - v7);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BA88);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_1();
  v63 = v11;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BA90);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_1();
  v68 = v13;
  v14 = sub_22CBF7818();
  v62 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9();
  v17 = v16 - v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BA98);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_9();
  v22 = v21 - v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAA0);
  v70 = *(_QWORD *)(v23 - 8);
  v71 = v23;
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_9();
  v65 = v25 - v24;
  v26 = v1[1];
  v85 = *v1;
  v86 = v26;
  v87 = v1[2];
  v88 = *((_QWORD *)v1 + 6);
  v27 = swift_allocObject();
  v28 = v1[1];
  *(_OWORD *)(v27 + 16) = *v1;
  *(_OWORD *)(v27 + 32) = v28;
  *(_OWORD *)(v27 + 48) = v1[2];
  *(_QWORD *)(v27 + 64) = *((_QWORD *)v1 + 6);
  OUTLINED_FUNCTION_6_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAA8);
  sub_22CBED020();
  sub_22CBF7CF8();
  sub_22CBF780C();
  sub_22CBDE884(&qword_255C3BAD8, &qword_255C3BA98);
  sub_22CBDE0A0(&qword_255C3BAE0, (void (*)(uint64_t))MEMORY[0x24BDED868]);
  sub_22CBF7BC0();
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v17, v14);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v18);
  v29 = &v9[*(int *)(v75 + 20)];
  v30 = *MEMORY[0x24BDEEB68];
  LODWORD(v62) = *MEMORY[0x24BDEEB68];
  v31 = sub_22CBF7A04();
  v32 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104);
  v32(v29, v30, v31);
  __asm { FMOV            V0.2D, #13.0 }
  v61 = _Q0;
  *(_OWORD *)v9 = _Q0;
  v89[0] = v85;
  v89[1] = v86;
  v90 = v87;
  v82 = v85;
  v83 = v86;
  v84 = v87;
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_10_7();
  sub_22CBED3DC((uint64_t)&v79);
  OUTLINED_FUNCTION_11_5();
  OUTLINED_FUNCTION_8_6();
  v38 = (void *)v79;
  v39 = v80;

  v40 = MEMORY[0x22E3045D8](v39);
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_5();
  OUTLINED_FUNCTION_8_6();

  sub_22CBF774C();
  sub_22CBED644((uint64_t)v9, v63);
  v41 = *(double *)&v79 * 0.5;
  sub_22CBED644((uint64_t)v9, v64);
  *(double *)(v64 + *(int *)(sub_22CBF7824() + 20)) = v41;
  v42 = v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAE8) + 36);
  v43 = v80;
  *(_OWORD *)v42 = v79;
  *(_OWORD *)(v42 + 16) = v43;
  *(_QWORD *)(v42 + 32) = v81;
  *(_QWORD *)(v64 + *(int *)(v67 + 52)) = v40;
  *(_WORD *)(v64 + *(int *)(v67 + 56)) = 256;
  v44 = sub_22CBF7D40();
  v46 = v45;
  v47 = v63 + *(int *)(v66 + 68);
  v48 = (uint64_t *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAF0) + 36));
  *v48 = v44;
  v48[1] = v46;
  sub_22CBED688(v64, v47);
  sub_22CBED6D0((uint64_t)v9);
  v32(&v9[*(int *)(v75 + 20)], v62, v31);
  *(_OWORD *)v9 = v61;
  OUTLINED_FUNCTION_6_6();
  sub_22CBED5DC((uint64_t)v89);
  OUTLINED_FUNCTION_7_6();
  sub_22CBED5DC((uint64_t)v89);
  OUTLINED_FUNCTION_8_6();

  v49 = MEMORY[0x22E3045D8]();
  sub_22CBED644((uint64_t)v9, v72);
  *(_QWORD *)(v72 + *(int *)(v73 + 52)) = v49;
  *(_WORD *)(v72 + *(int *)(v73 + 56)) = 256;
  sub_22CBED6D0((uint64_t)v9);
  v50 = sub_22CBF7D40();
  v52 = v51;
  v53 = v68 + *(int *)(v69 + 36);
  sub_22CBED70C(v72, v53, &qword_253F872F8);
  v54 = (uint64_t *)(v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAF8) + 36));
  *v54 = v50;
  v54[1] = v52;
  sub_22CBED70C(v63, v68, &qword_255C3BA88);
  sub_22CBDEC0C(v72, &qword_253F872F8);
  sub_22CBDEC0C(v63, &qword_255C3BA88);
  v55 = sub_22CBF7D40();
  v57 = v56;
  v58 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB00) + 36);
  sub_22CBED70C(v68, v58, &qword_255C3BA90);
  v59 = (uint64_t *)(v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB08) + 36));
  *v59 = v55;
  v59[1] = v57;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(a1, v65, v71);
  sub_22CBDEC0C(v68, &qword_255C3BA90);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 8))(v65, v71);
}

void sub_22CBEC224(uint64_t a1)
{
  (*(void (**)(void))(a1 + 40))();
  sub_22CBECB54();
}

uint64_t sub_22CBEC254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v26 = a2;
  v25 = sub_22CBF7830();
  MEMORY[0x24BDAC7A8](v25);
  v4 = (_OWORD *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB38);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a1;
  v27 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB48);
  sub_22CBEE82C();
  sub_22CBEE890();
  sub_22CBF7C74();
  v29 = xmmword_22CBFA970;
  v30 = 0x4024000000000000;
  sub_22CBDE884(&qword_255C3BAC0, &qword_255C3BAB8);
  sub_22CBED100();
  sub_22CBF7BB4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = (char *)v4 + *(int *)(v25 + 20);
  v14 = *MEMORY[0x24BDEEB68];
  v15 = sub_22CBF7A04();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __asm { FMOV            V0.2D, #13.0 }
  *v4 = _Q0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAA8);
  v22 = v26;
  v23 = v26 + *(int *)(v21 + 36);
  sub_22CBED644((uint64_t)v4, v23);
  *(_WORD *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C3BAD0) + 36)) = 256;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v22, v12, v9);
  sub_22CBED6D0((uint64_t)v4);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_22CBEC4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[6];
  _OWORD v35[2];
  char v36;

  *(_QWORD *)&v35[0] = sub_22CBEC6B4();
  *((_QWORD *)&v35[0] + 1) = v3;
  sub_22CBEE928();
  v4 = sub_22CBF7B84();
  v6 = v5;
  v8 = v7 & 1;
  sub_22CBF7B3C();
  v9 = sub_22CBF7B60();
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_22CBE25C8(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_22CBF7B24();
  v14 = sub_22CBF7B48();
  v16 = v15;
  v18 = v17 & 1;
  sub_22CBE25C8(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  v19 = *(_OWORD *)(a1 + 16);
  v35[0] = *(_OWORD *)a1;
  v35[1] = v19;
  v36 = *(_BYTE *)(a1 + 32);
  sub_22CBECFA4(a1);
  sub_22CBED5DC((uint64_t)v35);
  sub_22CBED3DC((uint64_t)v34);
  sub_22CBED5DC((uint64_t)v35);
  sub_22CBED604(a1);
  v21 = (void *)v34[0];
  v20 = v34[1];

  MEMORY[0x22E3045D8](v20);
  v22 = sub_22CBF7B54();
  v24 = v23;
  LOBYTE(v11) = v25;
  v27 = v26;
  swift_release();
  sub_22CBE25C8(v14, v16, v18);
  swift_bridgeObjectRelease();
  LOBYTE(v20) = sub_22CBF7B18();
  result = sub_22CBF7734();
  *(_QWORD *)a2 = v22;
  *(_QWORD *)(a2 + 8) = v24;
  *(_BYTE *)(a2 + 16) = v11 & 1;
  *(_QWORD *)(a2 + 24) = v27;
  *(_BYTE *)(a2 + 32) = v20;
  *(_QWORD *)(a2 + 40) = v29;
  *(_QWORD *)(a2 + 48) = v30;
  *(_QWORD *)(a2 + 56) = v31;
  *(_QWORD *)(a2 + 64) = v32;
  *(_BYTE *)(a2 + 72) = 0;
  return result;
}

uint64_t sub_22CBEC6B4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v0 = (void *)objc_opt_self();
  sub_22CBEEB14(objc_msgSend(v0, sel_mainBundle), (SEL *)&selRef_localizedInfoDictionary);
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    sub_22CBEEB14(objc_msgSend(v0, sel_mainBundle), (SEL *)&selRef_infoDictionary);
    v2 = v3;
    if (!v3)
    {
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      goto LABEL_9;
    }
  }
  result = *MEMORY[0x24BDBD298];
  if (*MEMORY[0x24BDBD298])
  {
    v5 = sub_22CBF7DD0();
    v7 = v6;
    swift_bridgeObjectRetain();
    sub_22CBECB04(v5, v7, v2, &v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v15 + 1))
    {
      swift_bridgeObjectRelease();
      sub_22CBEEBBC(&v14, &v16);
      goto LABEL_10;
    }
    sub_22CBECB04(0xD000000000000013, 0x800000022CBFCB90, v2, &v16);
    swift_bridgeObjectRelease();
LABEL_9:
    sub_22CBDEC0C((uint64_t)&v14, &qword_255C3BB68);
LABEL_10:
    v8 = MEMORY[0x24BEE0D00];
    if (*((_QWORD *)&v17 + 1))
    {
      if (swift_dynamicCast())
      {
        v10 = *((_QWORD *)&v14 + 1);
        v9 = v14;
LABEL_15:
        type metadata accessor for AppSwiftUIBridge();
        v11 = objc_msgSend(v0, sel_bundleForClass_, swift_getObjCClassFromMetadata());
        sub_22CBF7614();

        __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB70);
        v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_22CBFA7E0;
        *(_QWORD *)(v12 + 56) = v8;
        *(_QWORD *)(v12 + 64) = sub_22CBEEB80();
        *(_QWORD *)(v12 + 32) = v9;
        *(_QWORD *)(v12 + 40) = v10;
        v13 = sub_22CBF7DDC();
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    else
    {
      sub_22CBDEC0C((uint64_t)&v16, &qword_255C3BB68);
    }
    v9 = 0;
    v10 = 0xE000000000000000;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_22CBEC94C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  _OWORD v17[2];
  char v18;

  v4 = sub_22CBF7C5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(a1 + 16);
  v17[0] = *(_OWORD *)a1;
  v17[1] = v8;
  v18 = *(_BYTE *)(a1 + 32);
  sub_22CBECFA4(a1);
  sub_22CBED5DC((uint64_t)v17);
  sub_22CBED3DC((uint64_t)v16);
  sub_22CBED5DC((uint64_t)v17);
  sub_22CBED604(a1);
  v9 = (void *)v16[1];
  v10 = (void *)v16[2];
  v11 = (void *)v16[0];
  sub_22CBEE8EC();
  type metadata accessor for AppSwiftUIBridge();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v14 = sub_22CBF3E1C(0x74756374726F6853, 0xE900000000000073, v13, 0);

  if (v14)
  {
    v15 = v14;
    sub_22CBF7C44();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
    v14 = (void *)sub_22CBF7C68();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *a2 = v14;
}

double sub_22CBECB04@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_22CBEE964(a1, a2), (v7 & 1) != 0))
  {
    sub_22CBEE298(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_22CBECB54()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB80);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22CBF7674();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  sub_22CBEEAA8(v7);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_22CBF7F20();
  swift_bridgeObjectRelease();
  v11 = 0xD000000000000019;
  v12 = 0x800000022CBFCBB0;
  sub_22CBF7DF4();
  swift_bridgeObjectRelease();
  sub_22CBF7668();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_22CBDEC0C((uint64_t)v2, &qword_255C3BB80);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v8 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v9 = (void *)sub_22CBF765C();
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_22CBDE0A0(&qword_255C3B3A0, type metadata accessor for OpenExternalURLOptionsKey);
    sub_22CBF7D7C();
    v10 = (void *)sub_22CBF7D64();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_openURL_options_completionHandler_, v9, v10, 0);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t View.shortcutsLinkStyle(_:)()
{
  swift_getKeyPath();
  sub_22CBF7BCC();
  return swift_release();
}

uint64_t sub_22CBECE48()
{
  sub_22CBEEBCC();
  return sub_22CBF7968();
}

double sub_22CBECE7C@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  double v5;

  sub_22CBECE48();
  result = v5;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(double *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22CBECEC8(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  v3 = *(id *)a1;
  v4 = v1;
  v5 = v2;
  return sub_22CBED13C();
}

uint64_t sub_22CBECF24()
{
  uint64_t v0;

  sub_22CBECF58(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  swift_release();
  return swift_deallocObject();
}

void sub_22CBECF58(void *a1, void *a2, void *a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {

  }
  else
  {
    swift_release();
  }
}

void sub_22CBECF94()
{
  uint64_t v0;

  sub_22CBEC224(v0 + 16);
}

uint64_t sub_22CBECF9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22CBEC254(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_22CBECFA4(uint64_t a1)
{
  sub_22CBECFE4(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  swift_retain();
  return a1;
}

id sub_22CBECFE4(void *a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v6;
  id v7;

  if ((a5 & 1) == 0)
    return (id)swift_retain();
  v6 = a1;
  v7 = a2;
  return a3;
}

unint64_t sub_22CBED020()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[6];

  result = qword_255C3BAB0;
  if (!qword_255C3BAB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BAA8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BAB8);
    sub_22CBDE884(&qword_255C3BAC0, &qword_255C3BAB8);
    v6[2] = v2;
    v6[3] = &type metadata for WrappedLabelStyle;
    v6[4] = v3;
    v6[5] = sub_22CBED100();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_22CBDE884(&qword_255C3BAC8, &qword_255C3BAD0);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_255C3BAB0);
  }
  return result;
}

unint64_t sub_22CBED100()
{
  unint64_t result;

  result = qword_253F872D8;
  if (!qword_253F872D8)
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFA694, &type metadata for WrappedLabelStyle);
    atomic_store(result, (unint64_t *)&qword_253F872D8);
  }
  return result;
}

uint64_t sub_22CBED13C()
{
  sub_22CBEEBCC();
  return sub_22CBF7974();
}

id sub_22CBED188()
{
  void *v0;
  id v1;
  id v2;
  id v4;

  if (qword_255C3B2D8 != -1)
    swift_once();
  v0 = *(void **)algn_255C3B9C8;
  v4 = (id)qword_255C3B9D0;
  qword_255C3C6D8 = qword_255C3B9C0;
  unk_255C3C6E0 = *(_QWORD *)algn_255C3B9C8;
  qword_255C3C6E8 = qword_255C3B9D0;
  qword_255C3C6F0 = qword_255C3B9D8;
  v1 = (id)qword_255C3B9C0;
  v2 = v0;
  return v4;
}

uint64_t *sub_22CBED208()
{
  if (qword_255C3B308 != -1)
    swift_once();
  return &qword_255C3C6D8;
}

id sub_22CBED248@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v9;

  sub_22CBED208();
  v2 = (void *)qword_255C3C6D8;
  v3 = (void *)unk_255C3C6E0;
  v4 = qword_255C3C6E8;
  v9 = (id)qword_255C3C6E8;
  v5 = qword_255C3C6F0;
  *a1 = qword_255C3C6D8;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  v6 = v2;
  v7 = v3;
  return v9;
}

id sub_22CBED2A4()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  result = sub_22CBEDF9C((uint64_t)sub_22CBED2E4, 0);
  qword_255C3C6F8 = (uint64_t)result;
  return result;
}

id sub_22CBED2E4(void *a1)
{
  unint64_t v1;
  char **v2;

  v1 = (unint64_t)objc_msgSend(a1, sel_userInterfaceStyle);
  if (v1 > 2)
    v2 = &selRef_blackColor;
  else
    v2 = off_24F76C128[v1];
  return objc_msgSend((id)objc_opt_self(), *v2);
}

id sub_22CBED340()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  result = sub_22CBEDF9C((uint64_t)sub_22CBED380, 0);
  qword_255C3C700 = (uint64_t)result;
  return result;
}

id sub_22CBED380(void *a1)
{
  unint64_t v1;
  char **v2;

  v1 = (unint64_t)objc_msgSend(a1, sel_userInterfaceStyle);
  if (v1 > 2)
    v2 = &selRef_whiteColor;
  else
    v2 = off_24F76C140[v1];
  return objc_msgSend((id)objc_opt_self(), *v2);
}

void sub_22CBED3DC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;

  v3 = sub_22CBF795C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)v1;
  if (*(_BYTE *)(v1 + 32) == 1)
  {
    v8 = *(_QWORD *)(v1 + 24);
    *(_QWORD *)a1 = v7;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
    *(_QWORD *)(a1 + 24) = v8;
    sub_22CBED5DC(v1);
  }
  else
  {
    sub_22CBED5DC(v1);
    v9 = sub_22CBF7EC0();
    v10 = sub_22CBF7ADC();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15[1] = v7;
      v14 = v13;
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      v15[0] = v12 + 4;
      v15[2] = sub_22CBEE074(0xD000000000000012, 0x800000022CBFA9E0, &v16);
      sub_22CBF7EE4();
      _os_log_impl(&dword_22CBD7000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E304E0C](v14, -1, -1);
      MEMORY[0x22E304E0C](v12, -1, -1);
    }

    sub_22CBF7950();
    swift_getAtKeyPath();
    sub_22CBED5DC(v1);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

void sub_22CBED5DC(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = OUTLINED_FUNCTION_14_4(a1);
  v2(v1);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBED604(uint64_t a1)
{
  sub_22CBECF58(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  swift_release();
  return a1;
}

uint64_t sub_22CBED644(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22CBF7830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBED688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBED6D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22CBF7830();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_22CBED70C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBED74C()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for ShortcutsLinkStyle(id *a1)
{

}

_QWORD *initializeWithCopy for ShortcutsLinkStyle(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  v7 = v3;
  v8 = v4;
  v9 = v6;
  return a1;
}

uint64_t assignWithCopy for ShortcutsLinkStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for ShortcutsLinkStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutsLinkStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for ShortcutsLinkStyle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ShortcutsLinkStyle()
{
  OUTLINED_FUNCTION_3_2();
}

uint64_t destroy for ShortcutsLink(uint64_t a1)
{
  sub_22CBECF58(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return swift_release();
}

uint64_t initializeWithCopy for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  sub_22CBECFE4(*(void **)a2, v5, v6, v7, v8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  sub_22CBECFE4(*(void **)a2, v5, v6, v7, v8);
  v9 = *(void **)a1;
  v10 = *(void **)(a1 + 8);
  v11 = *(void **)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  sub_22CBECF58(v9, v10, v11, v12, v13);
  v14 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ShortcutsLink(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  __int128 v10;

  v4 = *(_BYTE *)(a2 + 32);
  v5 = *(void **)a1;
  v6 = *(void **)(a1 + 8);
  v7 = *(void **)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_BYTE *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_BYTE *)(a1 + 32) = v4;
  sub_22CBECF58(v5, v6, v7, v8, v9);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutsLink(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ShortcutsLink(uint64_t result, int a2, int a3)
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

void type metadata accessor for ShortcutsLink()
{
  OUTLINED_FUNCTION_3_2();
}

unint64_t sub_22CBEDB54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t OpaqueTypeConformance2;
  uint64_t v9;
  _QWORD v10[6];

  result = qword_255C3BB10;
  if (!qword_255C3BB10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BB00);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BA98);
    v3 = sub_22CBF7818();
    v4 = (void (*)(uint64_t))MEMORY[0x24BDED868];
    sub_22CBDE884(&qword_255C3BAD8, &qword_255C3BA98);
    v6 = v5;
    sub_22CBDE0A0(&qword_255C3BAE0, v4);
    v10[2] = v2;
    v10[3] = v3;
    v10[4] = v6;
    v10[5] = v7;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_22CBDE884(&qword_255C3BB18, &qword_255C3BB08);
    v10[0] = OpaqueTypeConformance2;
    v10[1] = v9;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v10);
    atomic_store(result, (unint64_t *)&qword_255C3BB10);
  }
  return result;
}

uint64_t sub_22CBEDC5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BB20);
  v2 = sub_22CBF77F4();
  sub_22CBDE884(&qword_255C3BB28, &qword_255C3BB20);
  v5[0] = v1;
  v5[1] = v3;
  return MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v2, v5);
}

void sub_22CBEDCDC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v3 = sub_22CBF795C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9();
  v7 = v6 - v5;
  if (*(_BYTE *)(v1 + 40) == 1)
  {
    v9 = *(_QWORD *)(v1 + 24);
    v8 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)a1 = *(_QWORD *)v1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
    *(_QWORD *)(a1 + 24) = v9;
    *(_QWORD *)(a1 + 32) = v8;
    OUTLINED_FUNCTION_15_6();
  }
  else
  {
    OUTLINED_FUNCTION_15_6();
    v10 = sub_22CBF7EC0();
    v11 = sub_22CBF7ADC();
    v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      sub_22CBEE074(0xD000000000000010, 0x800000022CBFC850, &v14);
      sub_22CBF7EE4();
      _os_log_impl(&dword_22CBD7000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_5();
    }

    sub_22CBF7950();
    swift_getAtKeyPath();
    OUTLINED_FUNCTION_15_6();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  }
}

id sub_22CBEDEB8(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v9;
  id v10;
  id v11;
  id v12;

  if ((a6 & 1) == 0)
    return (id)swift_retain();
  v9 = a5;
  v10 = a1;
  v11 = a2;
  v12 = a3;
  return a4;
}

void sub_22CBEDF20(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = OUTLINED_FUNCTION_14_4(a1);
  v2(v1);
  OUTLINED_FUNCTION_10();
}

void sub_22CBEDF48(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  if ((a6 & 1) != 0)
  {

  }
  else
  {
    swift_release();
  }
}

id sub_22CBEDF9C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[6];

  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_22CBEE024;
  v6[3] = &block_descriptor_0;
  v3 = _Block_copy(v6);
  v4 = objc_msgSend(v2, sel_initWithDynamicProvider_, v3);
  _Block_release(v3);
  swift_release();
  return v4;
}

id sub_22CBEE024(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_22CBEE074(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_22CBEE144(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22CBEE298((uint64_t)v12, *a3);
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
      sub_22CBEE298((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22CBEE144(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_22CBEE2D4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22CBF7EF0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_22CBEE398(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_22CBF7F44();
    if (!v8)
    {
      result = sub_22CBF7F5C();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22CBEE298(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_22CBEE2D4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22CBF7F74();
  __break(1u);
  return result;
}

uint64_t sub_22CBEE398(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22CBEE42C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22CBEE600(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22CBEE600((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22CBEE42C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_22CBF7E0C();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_22CBEE59C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_22CBF7F2C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_22CBF7F74();
  __break(1u);
LABEL_14:
  result = sub_22CBF7F5C();
  __break(1u);
  return result;
}

_QWORD *sub_22CBEE59C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22CBEE600(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BB30);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_22CBEE798(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22CBEE6D4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22CBEE6D4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22CBF7F74();
  __break(1u);
  return result;
}

char *sub_22CBEE798(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22CBF7F74();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_22CBEE81C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22CBEC4C0(*(_QWORD *)(v1 + 16), a1);
}

void sub_22CBEE824(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_22CBEC94C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_22CBEE82C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255C3BB50;
  if (!qword_255C3BB50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BB40);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255C3BB50);
  }
  return result;
}

unint64_t sub_22CBEE890()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255C3BB58;
  if (!qword_255C3BB58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BB48);
    v2 = MEMORY[0x24BDF40E8];
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255C3BB58);
  }
  return result;
}

unint64_t sub_22CBEE8EC()
{
  unint64_t result;

  result = qword_255C3BB60;
  if (!qword_255C3BB60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C3BB60);
  }
  return result;
}

unint64_t sub_22CBEE928()
{
  unint64_t result;

  result = qword_253F87430;
  if (!qword_253F87430)
  {
    result = MEMORY[0x22E304DA0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F87430);
  }
  return result;
}

unint64_t sub_22CBEE964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22CBF801C();
  sub_22CBF7DE8();
  v4 = sub_22CBF8034();
  return sub_22CBEE9C8(a1, a2, v4);
}

unint64_t sub_22CBEE9C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22CBF7FC8() & 1) == 0)
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
      while (!v14 && (sub_22CBF7FC8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22CBEEAA8(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_22CBF7DD0();

  return v3;
}

void sub_22CBEEB14(void *a1, SEL *a2)
{
  id v3;

  v3 = objc_msgSend(a1, *a2);

  if (v3)
  {
    sub_22CBF7D70();

  }
  OUTLINED_FUNCTION_10();
}

unint64_t sub_22CBEEB80()
{
  unint64_t result;

  result = qword_255C3BB78;
  if (!qword_255C3BB78)
  {
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255C3BB78);
  }
  return result;
}

_OWORD *sub_22CBEEBBC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_22CBEEBCC()
{
  unint64_t result;

  result = qword_255C3BB88[0];
  if (!qword_255C3BB88[0])
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFAA48, &unk_24F76B148);
    atomic_store(result, qword_255C3BB88);
  }
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void type metadata accessor for ShortcutsLinkStyleKey()
{
  OUTLINED_FUNCTION_3_2();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  uint64_t v0;

  return sub_22CBECFA4(v0 - 208);
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  uint64_t v0;

  return sub_22CBED604(v0 - 208);
}

void OUTLINED_FUNCTION_10_7()
{
  uint64_t v0;

  sub_22CBED5DC(v0 - 144);
}

void OUTLINED_FUNCTION_11_5()
{
  uint64_t v0;

  sub_22CBED5DC(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_14_4(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_15_6()
{
  uint64_t v0;

  sub_22CBEDF20(v0);
}

void _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);

  v10 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_9();
  v13 = v12 - v11;
  v14();
  _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(a1, a2, v13, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, a6);
  OUTLINED_FUNCTION_7();
}

void _ProjectedIntentParameter.requestConfirmation<A>(for:dialog:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3B340);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9();
  v10 = v9 - v8;
  v11 = sub_22CBF747C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_9();
  v15 = v14 - v13;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18 - v17, a3, a5);
  sub_22CBF7D1C();
  sub_22CBD9CFC();
  swift_retain();
  sub_22CBF7470();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v15, v11);
  __swift_storeEnumTagSinglePayload(v10, 0, 1, v11);
  sub_22CBF7518();
  swift_release();
  sub_22CBD9D38(v10);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  OUTLINED_FUNCTION_7();
}

uint64_t static AppManager.registerSwiftUIHooks()()
{
  uint64_t result;

  if (qword_253F874E8 != -1)
    return swift_once();
  return result;
}

void sub_22CBEEEC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  type metadata accessor for AppSwiftUIBridge();
  v0 = swift_allocObject();
  sub_22CBF7368();
  sub_22CBF7350();
  sub_22CBF1004(&qword_253F87600, v1, (void (*)(uint64_t))type metadata accessor for AppSwiftUIBridge);
  swift_retain();
  sub_22CBF735C();
  OUTLINED_FUNCTION_6_5();
  swift_release();
  if (qword_253F87608 != -1)
    swift_once();
  v2 = sub_22CBF7710();
  __swift_project_value_buffer(v2, (uint64_t)qword_253F880D0);
  v3 = sub_22CBF76F8();
  v4 = sub_22CBF7EA8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22CBD7000, v3, v4, "Instantiated AppSwiftUIBridge", v5, 2u);
    MEMORY[0x22E304E0C](v5, -1, -1);
  }

  qword_253F880C8 = v0;
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_22CBEEFF8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_44_0();
  *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_22_3();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBEF03C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_4();
  v1 = OUTLINED_FUNCTION_20_3();
  return OUTLINED_FUNCTION_5_8(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEF07C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16[2] = a1;
  v16[0] = a2;
  v20 = sub_22CBF7398();
  v19 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22CBF72CC();
  v17 = *(_QWORD *)(v4 - 8);
  v18 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CBF73D4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87458);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CBF726C();
  sub_22CBF7284();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC50);
  type metadata accessor for CGRect(0);
  sub_22CBF7A1C();
  sub_22CBF7380();
  sub_22CBF73C8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v20);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v18);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = sub_22CBF7440();
  result = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(_QWORD, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v16[0], v13, v14);
  __break(1u);
  return result;
}

uint64_t sub_22CBEF2AC()
{
  uint64_t v0;
  uint64_t v2;

  sub_22CBF7A4C();
  v2 = MEMORY[0x24BEE4AF8];
  sub_22CBF7A34();
  sub_22CBF7A40();
  swift_release();
  if (v0)
    swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_22CBEF34C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_44_0();
  *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_22_3();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBEF390()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_4();
  v1 = OUTLINED_FUNCTION_20_3();
  return OUTLINED_FUNCTION_5_8(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEF3D0()
{
  uint64_t v0;

  v0 = sub_22CBF7398();
  MEMORY[0x24BDAC7A8](v0);
  sub_22CBF72A8();
  sub_22CBF7308();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC08);
  sub_22CBF7D58();
  swift_getObjectType();
  type metadata accessor for CGRect(0);
  sub_22CBF7A1C();
  sub_22CBF7380();
  return sub_22CBF744C();
}

uint64_t sub_22CBEF500(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 64) = a4;
  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  OUTLINED_FUNCTION_44_0();
  *(_QWORD *)(v4 + 56) = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_22_3();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBEF550()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;

  v1 = *(_BYTE *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 48);
  v5 = *(_OWORD *)(v0 + 32);
  swift_release();
  sub_22CBF7A4C();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  sub_22CBF7A34();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1 & 1;
  *(_OWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 48) = v0 + 16;
  sub_22CBF7A40();
  OUTLINED_FUNCTION_6_5();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_22CBEF60C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v32 = a7;
  v36 = a3;
  v37 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC08);
  v33 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v31 = (uint64_t)&v31 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC10);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v34 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v35 = (uint64_t)&v31 - v16;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC18);
  sub_22CBDE884(&qword_255C3BC20, &qword_255C3BC18);
  sub_22CBF7A28();
  v17 = *(_QWORD *)(v38 + 16);
  if (v17)
  {
    v18 = v38 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
    v19 = *(_QWORD *)(v33 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_22CBED70C(v18, (uint64_t)v11, &qword_255C3BC08);
      if ((a4 & 1) != 0)
      {
        v20 = sub_22CBF72A8();
        v21 = v37;
      }
      else
      {
        v20 = sub_22CBF7D58();
        v21 = v36;
      }
      if (v20 == v21)
        break;
      sub_22CBDEC0C((uint64_t)v11, &qword_255C3BC08);
      v18 += v19;
      if (!--v17)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    v23 = v35;
    sub_22CBF0F74((uint64_t)v11, v35);
    v22 = 0;
  }
  else
  {
LABEL_9:
    v22 = 1;
    v23 = v35;
  }
  v24 = (uint64_t)v34;
  __swift_storeEnumTagSinglePayload(v23, v22, 1, v8);
  swift_bridgeObjectRelease();
  sub_22CBED70C(v23, v24, &qword_255C3BC10);
  if (__swift_getEnumTagSinglePayload(v24, 1, v8) == 1)
  {
    sub_22CBDEC0C(v23, &qword_255C3BC10);
    sub_22CBDEC0C(v24, &qword_255C3BC10);
  }
  else
  {
    v25 = v31;
    sub_22CBF0F74(v24, v31);
    v26 = sub_22CBF72B4();
    v28 = v27;
    sub_22CBDEC0C(v25, &qword_255C3BC08);
    sub_22CBDEC0C(v23, &qword_255C3BC10);
    v29 = v32;
    v30 = *v32;
    *v32 = v26;
    v29[1] = v28;
    sub_22CBF0FBC(v30);
  }
}

uint64_t sub_22CBEF8F0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_44_0();
  *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_22_3();
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_22CBEF934()
{
  uint64_t v0;

  OUTLINED_FUNCTION_21_4();
  return OUTLINED_FUNCTION_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CBEF95C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[3] = a1;
  v2 = sub_22CBF7398();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0();
  v3 = sub_22CBF72CC();
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 - 8);
  v1[9] = OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87458);
  v1[10] = OUTLINED_FUNCTION_0();
  v4 = sub_22CBF7440();
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v5 = sub_22CBF73D4();
  v1[15] = v5;
  v1[16] = *(_QWORD *)(v5 - 8);
  v1[17] = OUTLINED_FUNCTION_0();
  return swift_task_switch();
}

uint64_t sub_22CBEFA38()
{
  uint64_t v0;
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, unint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_22CBF7500();
  sub_22CBF74E8();
  v1 = swift_bridgeObjectRetain();
  sub_22CBF0CD4(v1);
  OUTLINED_FUNCTION_11_6();
  v2 = sub_22CBF74F4();
  swift_release();
  OUTLINED_FUNCTION_6_5();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 128);
    v26 = *(_QWORD *)(v0 + 64);
    v27 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 40);
    v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v28 = v4;
    v23 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    v24 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    v29 = MEMORY[0x24BEE4AF8];
    do
    {
      v32 = v3;
      v6 = *(_QWORD *)(v0 + 136);
      v7 = *(_QWORD *)(v0 + 120);
      v8 = *(_QWORD *)(v0 + 80);
      v9 = *(_QWORD *)(v0 + 72);
      v10 = *(_QWORD *)(v0 + 48);
      v11 = *(_QWORD *)(v0 + 56);
      v30 = *(_QWORD *)(v0 + 32);
      v31 = *(_QWORD *)(v0 + 88);
      v23(v6, v5, v7);
      *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
      sub_22CBF1004(&qword_255C3BBD0, 255, (void (*)(uint64_t))MEMORY[0x24BDB4CD8]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BBD8);
      sub_22CBDE884(&qword_255C3BBE0, &qword_255C3BBD8);
      sub_22CBF7F08();
      sub_22CBF738C();
      sub_22CBF73C8();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v10, v30);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v9, v11);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v6, v7);
      if (__swift_getEnumTagSinglePayload(v8, 1, v31) == 1)
      {
        sub_22CBDEC0C(*(_QWORD *)(v0 + 80), &qword_253F87458);
      }
      else
      {
        v12 = *(_QWORD *)(v0 + 104);
        v13 = *(_QWORD *)(v0 + 112);
        v14 = *(_QWORD *)(v0 + 88);
        v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
        v15(v13, *(_QWORD *)(v0 + 80), v14);
        v15(v12, v13, v14);
        v16 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v16 = sub_22CBF0754(0, *(_QWORD *)(v29 + 16) + 1, 1, v29, &qword_255C3BBE8, (void (*)(_QWORD))MEMORY[0x24BDB5D08]);
        v18 = *(_QWORD *)(v16 + 16);
        v17 = *(_QWORD *)(v16 + 24);
        if (v18 >= v17 >> 1)
          v16 = sub_22CBF0754(v17 > 1, v18 + 1, 1, v16, &qword_255C3BBE8, (void (*)(_QWORD))MEMORY[0x24BDB5D08]);
        v19 = *(_QWORD *)(v0 + 104);
        v20 = *(_QWORD *)(v0 + 88);
        *(_QWORD *)(v16 + 16) = v18 + 1;
        v29 = v16;
        v15(v16+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(_QWORD *)(v27 + 72) * v18, v19, v20);
      }
      v5 += v24;
      v3 = v32 - 1;
    }
    while (v32 != 1);
    swift_bridgeObjectRelease_n();
    v21 = v29;
  }
  else
  {
    OUTLINED_FUNCTION_11_6();
    v21 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

uint64_t sub_22CBEFDB8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22CBEFDC8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22CBF1688;
  return sub_22CBEEFF8();
}

uint64_t sub_22CBEFE0C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22CBEFE50;
  return sub_22CBEF34C();
}

uint64_t sub_22CBEFE50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_3();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_22CBEFE88(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  char v8;
  _QWORD *v9;

  v8 = a4 & 1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_22CBEFEF4;
  return sub_22CBEF500(a1, a2, a3, v8);
}

uint64_t sub_22CBEFEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = OUTLINED_FUNCTION_3();
  if (!v2)
  {
    v6 = a1;
    v7 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v6, v7);
}

uint64_t sub_22CBEFF3C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22CBEA38C;
  return sub_22CBEF8F0();
}

uint64_t sub_22CBEFF80(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22CBF1688;
  return sub_22CBEF95C(a1);
}

uint64_t sub_22CBEFFCC()
{
  return sub_22CBF7254();
}

uint64_t sub_22CBEFFD4()
{
  return sub_22CBF7254();
}

uint64_t sub_22CBEFFDC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22CBF1684;
  return sub_22CBF7248();
}

uint64_t sub_22CBF005C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22CBF00C0;
  return sub_22CBEA974(a1, a2, a3);
}

uint64_t sub_22CBF00C0(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t type metadata accessor for AppSwiftUIBridge()
{
  return objc_opt_self();
}

uint64_t sub_22CBF0114()
{
  return sub_22CBF7E3C();
}

uint64_t sub_22CBF0120(uint64_t a1, void (*a2)(void))
{
  uint64_t v2;

  a2();
  v2 = sub_22CBF7E60();
  MEMORY[0x22E304DA0](MEMORY[0x24BEE12C8], v2);
  return sub_22CBF7E48();
}

uint64_t sub_22CBF0194(uint64_t result, uint64_t *a2, void (*a3)(_QWORD))
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v4 = *(_QWORD *)(result + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = v6 + v4;
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v7 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v7)
      v11 = v6 + v4;
    else
      v11 = v6;
    result = sub_22CBF0754(result, v11, 1, v5, a2, a3);
    v5 = result;
  }
  if (!*(_QWORD *)(v10 + 16))
  {
    if (!v4)
      goto LABEL_14;
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(v5 + 16);
  v13 = (*(_QWORD *)(v5 + 24) >> 1) - v12;
  result = ((uint64_t (*)(_QWORD))a3)(0);
  if (v13 < v4)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_8_7();
  result = sub_22CBF0A9C(v10 + v15, v4, v5 + v15 + *(_QWORD *)(v14 + 72) * v12, (uint64_t (*)(_QWORD))a3);
  if (!v4)
  {
LABEL_14:
    result = OUTLINED_FUNCTION_11_6();
    *v3 = v5;
    return result;
  }
  v16 = *(_QWORD *)(v5 + 16);
  v17 = __OFADD__(v16, v4);
  v18 = v16 + v4;
  if (!v17)
  {
    *(_QWORD *)(v5 + 16) = v18;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_22CBF0294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22CBF0114();
  *a1 = result;
  return result;
}

uint64_t sub_22CBF02BC(uint64_t a1)
{
  return sub_22CBF0120(a1, (void (*)(void))sub_22CBF1654);
}

uint64_t sub_22CBF02F4(uint64_t a1)
{
  MEMORY[0x22E304DA0](&unk_22CBFAB58, a1);
  return sub_22CBF7980();
}

void sub_22CBF0328(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a5, a1, a4);
  v11 = type metadata accessor for AppViewAnchor(0, a4, v9, v10);
  *(_QWORD *)(a5 + *(int *)(v11 + 28)) = a2;
  *(_QWORD *)(a5 + *(int *)(v11 + 32)) = a3;
  OUTLINED_FUNCTION_12_0();
}

uint64_t type metadata accessor for AppViewAnchor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppViewAnchor);
}

uint64_t sub_22CBF0390(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC40);
  swift_getObjectType();
  sub_22CBDE884(&qword_255C3BC48, &qword_255C3BC40);
  sub_22CBF7A28();
  swift_unknownObjectRetain();
  v9 = sub_22CBF05C0(v11, a3, a4, a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5D08], (void (*)(BOOL, unint64_t, uint64_t))sub_22CBF0B70, &qword_255C3BC50);
  result = swift_bridgeObjectRelease();
  if (!v4)
    return sub_22CBF0194(v9, &qword_255C3BBE8, (void (*)(_QWORD))MEMORY[0x24BDB5D08]);
  return result;
}

uint64_t sub_22CBF04A8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC18);
  swift_getObjectType();
  sub_22CBDE884(&qword_255C3BC20, &qword_255C3BC18);
  sub_22CBF7A28();
  swift_unknownObjectRetain();
  v9 = sub_22CBF05C0(v11, a3, a4, a1, a2, MEMORY[0x24BDB5D20], (void (*)(BOOL, unint64_t, uint64_t))sub_22CBF0B9C, &qword_255C3BC08);
  result = swift_bridgeObjectRelease();
  if (!v4)
    return sub_22CBF0194(v9, &qword_255C3BC30, MEMORY[0x24BDB5D20]);
  return result;
}

uint64_t sub_22CBF05C0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), void (*a7)(BOOL, unint64_t, uint64_t), uint64_t *a8)
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  void (*v24)(BOOL, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a5;
  v30 = a4;
  v27 = a2;
  v28 = a3;
  v26 = a6(0);
  v12 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v14 = (char *)&v23 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    v31 = MEMORY[0x24BEE4AF8];
    v24 = a7;
    a7(0, v15, 0);
    v16 = v31;
    __swift_instantiateConcreteTypeFromMangledName(a8);
    OUTLINED_FUNCTION_8_7();
    v18 = a1 + v17;
    v25 = *(_QWORD *)(v19 + 72);
    while (1)
    {
      v27(v18, v30, v29);
      if (v8)
        break;
      v31 = v16;
      v21 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      if (v21 >= v20 >> 1)
      {
        v24(v20 > 1, v21 + 1, 1);
        v16 = v31;
      }
      *(_QWORD *)(v16 + 16) = v21 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v21, v14, v26);
      v18 += v25;
      if (!--v15)
        goto LABEL_7;
    }
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
LABEL_7:
    swift_unknownObjectRelease();
  }
  return v16;
}

uint64_t sub_22CBF0754(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (!v14)
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_14_5();
  v15 = (_QWORD *)OUTLINED_FUNCTION_4_6();
  v16 = _swift_stdlib_malloc_size(v15);
  if (!v6 || (v16 - v7 == 0x8000000000000000 ? (v17 = v6 == -1) : (v17 = 0), v17))
  {
LABEL_24:
    OUTLINED_FUNCTION_1_6();
    result = sub_22CBF7F5C();
    __break(1u);
    return result;
  }
  v15[2] = v13;
  v15[3] = 2 * ((uint64_t)(v16 - v7) / v6);
LABEL_19:
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_12_3();
  if ((a1 & 1) != 0)
  {
    sub_22CBF09C8(a4 + v19, v13, v18, a6);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_11_6();
  }
  else
  {
    sub_22CBF08D8(0, v13, v18, a4, a6);
  }
  return (uint64_t)v15;
}

uint64_t sub_22CBF08D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    a5(0);
    OUTLINED_FUNCTION_8_7();
    v11 = *(_QWORD *)(v10 + 72);
    v12 = a4 + v9 + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      OUTLINED_FUNCTION_11_6();
      return v14;
    }
  }
  OUTLINED_FUNCTION_1_6();
  result = OUTLINED_FUNCTION_10_8();
  __break(1u);
  return result;
}

uint64_t sub_22CBF09C8(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_6();
    result = OUTLINED_FUNCTION_10_8();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_17_5();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_17_5();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_22CBF0A9C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_1_6();
  result = OUTLINED_FUNCTION_10_8();
  __break(1u);
  return result;
}

size_t sub_22CBF0B70(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_22CBF0BC8(a1, a2, a3, *v3, &qword_255C3BBE8, (void (*)(_QWORD))MEMORY[0x24BDB5D08]);
  *v3 = result;
  return result;
}

size_t sub_22CBF0B9C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_22CBF0BC8(a1, a2, a3, *v3, &qword_255C3BC30, MEMORY[0x24BDB5D20]);
  *v3 = result;
  return result;
}

size_t sub_22CBF0BC8(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v10 = result;
  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (!v14)
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_14_5();
  v15 = (_QWORD *)OUTLINED_FUNCTION_4_6();
  result = _swift_stdlib_malloc_size(v15);
  if (!v6)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v7 == 0x8000000000000000 && v6 == -1)
    goto LABEL_24;
  v15[2] = v13;
  v15[3] = 2 * ((uint64_t)(result - v7) / v6);
LABEL_19:
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_12_3();
  v19 = a4 + v18;
  if ((v10 & 1) != 0)
  {
    sub_22CBF09C8(v19, v13, v17, a6);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22CBF0A9C(v19, v13, v17, (uint64_t (*)(_QWORD))a6);
  }
  swift_release();
  return (size_t)v15;
}

uint64_t sub_22CBF0CD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BBF0);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  v5 = sub_22CBF0DB4(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_22CBF0F48();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_22CBF0DB4(_QWORD *result, _DWORD *a2, uint64_t a3, uint64_t a4)
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
    *a2++ = *(_DWORD *)(*(_QWORD *)(a4 + 48) + 4 * v12);
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

uint64_t sub_22CBF0F48()
{
  return swift_release();
}

void sub_22CBF0F50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_22CBEF60C(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(uint64_t **)(v2 + 48));
}

uint64_t sub_22CBF0F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CBF0FBC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_22CBF0FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22CBF04A8(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_22CBF0FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22CBF0390(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_22CBF1004(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (!*a1)
  {
    a3(a2);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBF1038()
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

uint64_t *sub_22CBF10C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v10 = *v11;
    *(_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_22CBF1188(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_22CBF11D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_22CBF1240(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22CBF12BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22CBF1328(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_22CBF139C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_22CBF1420 + 4 * byte_22CBFAA80[v11]))();
  }
}

void sub_22CBF14A8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  }
  if (a2 > v6)
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_22CBF159C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
        v9 = a2 ^ 0x80000000;
      else
        v9 = (a2 - 1);
      *v8 = v9;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t sub_22CBF1630()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for AppViewPreferenceKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppViewPreferenceKey);
}

void sub_22CBF1644()
{
  JUMPOUT(0x22E304DA0);
}

uint64_t sub_22CBF1654()
{
  uint64_t v0;
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 24))(&v2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_5_8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_22CBF7E6C();
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return sub_22CBF7F74();
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return sub_22CBEF2AC();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return swift_release();
}

uint64_t sub_22CBF1730@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

#error "22CBF1790: call analysis failed (funcsize=20)"

void sub_22CBF1798()
{
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_7();
}

void View.appEntity<A>(entityType:identifier:state:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v7[2];

  OUTLINED_FUNCTION_9_0();
  v7[0] = v0;
  v2 = v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_22CBF7ED8();
  OUTLINED_FUNCTION_7_8();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v7 - v5;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))((char *)v7 - v5, v2, AssociatedTypeWitness);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, AssociatedTypeWitness);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6Entity_10identifierQrqd__m_2IDQyd__Sgt0dE00dG0Rd__lF_0();
}

void sub_22CBF1880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  OUTLINED_FUNCTION_7();
}

void View.linkIntent<A>(_:perform:)()
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
  uint64_t *v11;
  uint64_t v12;
  char *v13;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  _QWORD v38[6];
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[6];

  OUTLINED_FUNCTION_9_0();
  v49 = v0;
  v52 = v1;
  v53 = v2;
  v4 = v3;
  v6 = v5;
  v54 = v7;
  v9 = v8;
  v40 = v10;
  v51 = v11;
  v39 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_22CBF74DC();
  v15 = sub_22CBF1D6C(&qword_253F87618, MEMORY[0x24BDB6040]);
  v16 = sub_22CBF1D6C(&qword_253F87620, MEMORY[0x24BDB6048]);
  v55[0] = v6;
  v55[1] = v14;
  v50 = v4;
  v55[2] = v4;
  v55[3] = v15;
  v43 = v15;
  v42 = v16;
  v55[4] = v16;
  MEMORY[0x22E304D70](255, v55, MEMORY[0x24BDF3378], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BC58);
  v17 = sub_22CBF77F4();
  v44 = *(_QWORD *)(v17 - 8);
  OUTLINED_FUNCTION_7_8();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v38 - v19;
  v47 = *(_QWORD *)(sub_22CBF77F4() - 8);
  OUTLINED_FUNCTION_7_8();
  MEMORY[0x24BDAC7A8](v21);
  v41 = (char *)v38 - v22;
  v46 = v23;
  v48 = sub_22CBF77F4();
  OUTLINED_FUNCTION_7_8();
  MEMORY[0x24BDAC7A8](v24);
  v45 = (char *)v38 - v25;
  v26 = sub_22CBF72C0();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v38 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v33 = (char *)v38 - v32;
  if (v9)
  {
    v34 = v9;
    v35 = v30;
    v38[3] = v30;
    v38[1] = v20;
    v36 = v31;
    v38[4] = v31;
    swift_retain_n();
    v39 = v17;
    v38[5] = v34;
    sub_22CBF729C();
    swift_checkMetadataState();
    v37 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
    v38[2] = v33;
    v37(v29, v33, v35);
    sub_22CBF74C4();
    sub_22CBF3168();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v13, v49, v6);
  *v51 = sub_22CBF7D1C();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBF1D6C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_22CBF74DC();
    result = MEMORY[0x22E304DA0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22CBF1DB0()
{
  return sub_22CBF1E60(MEMORY[0x24BDB4EB8]);
}

unint64_t sub_22CBF1DBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C3BC60;
  if (!qword_255C3BC60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BC58);
    result = MEMORY[0x22E304DA0](&unk_22CBFAC08, v1);
    atomic_store(result, (unint64_t *)&qword_255C3BC60);
  }
  return result;
}

uint64_t sub_22CBF1E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  sub_22CBF7368();
  sub_22CBF7350();
  a6(a1, a5);
  return swift_release();
}

uint64_t sub_22CBF1E54()
{
  return sub_22CBF1E60(MEMORY[0x24BDB4EB0]);
}

uint64_t sub_22CBF1E60(void (*a1)(uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_22CBF1E00(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

#error "22CBF1ECC: call analysis failed (funcsize=20)"

void sub_22CBF1ED4()
{
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_7();
}

void View.representedAppEntity(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE v6[16];

  OUTLINED_FUNCTION_9_0();
  v1 = v0[3];
  v2 = __swift_project_boxed_opaque_existential_1(v0, v1);
  sub_22CBF7ED8();
  OUTLINED_FUNCTION_3_8();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v6[-v4];
  (*(void (**)(_BYTE *, _QWORD *, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(&v6[-v4], v2, v1);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v1);
  _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0();
}

void sub_22CBF1F88()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5_9();
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(v1 - 88);
  *v0 = sub_22CBF7D1C();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBF1FBC()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_22CBF1FC8()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_22CBF1FD4()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_22CBF1FE0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22CBF1FE8()
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

uint64_t *sub_22CBF2064(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 8) & (unint64_t)~v5) + *(_QWORD *)(v4 + 64) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 8) & ~v5, ((unint64_t)a2 + v5 + 8) & ~v5);
  }
  return v3;
}

uint64_t sub_22CBF2108(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_22CBF2128(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_22CBF2178(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_22CBF21C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_22CBF2218(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_22CBF2268(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v9 = ((v7 + 8) & ~v7) + *(_QWORD *)(v5 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v12 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v12 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v12 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload((a1 + v7 + 8) & ~v7, v6, v4);
      return 0;
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_18;
LABEL_11:
  v13 = (v11 - 1) << v10;
  if (v9 > 3)
    v13 = 0;
  if (!(_DWORD)v9)
    return (v6 + v13 + 1);
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_22CBF2328 + 4 * byte_22CBFABD0[(v9 - 1)]))();
}

void sub_22CBF2384(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t type metadata accessor for AppViewModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppViewModifier);
}

uint64_t sub_22CBF2554()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22CBF2588()
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

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x22E304DA0](&unk_22CBFAC08);
  sub_22CBF7A64();
  type metadata accessor for CGRect(255);
  v5 = type metadata accessor for AppViewAnchor(255, *(_QWORD *)(v1 + 16), v3, v4);
  OUTLINED_FUNCTION_11_7(v5, v6, v7, v8);
  OUTLINED_FUNCTION_15_3();
}

void sub_22CBF262C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 - 152) = a1;
  *(_QWORD *)(v5 - 128) = sub_22CBF7AAC();
  v6 = sub_22CBF77F4();
  *(_QWORD *)(v5 - 120) = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  sub_22CBF7CE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v3, v2);
  v8 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v5 - 144);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v1 + 32))(v9 + v8, v4, v2);
  OUTLINED_FUNCTION_16_1();
}

void sub_22CBF2714(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t);

  sub_22CBF7C08();
  swift_release();
  swift_release();
  v6 = MEMORY[0x22E304DA0](MEMORY[0x24BDF0698], *(_QWORD *)(v4 - 128));
  *(_QWORD *)(v4 - 96) = a1;
  *(_QWORD *)(v4 - 88) = v6;
  MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4 - 96);
  v7 = *(_QWORD *)(v4 - 120);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(v2, v3, v1);
  v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v9(v3, v1);
  v8(*(_QWORD *)(v4 - 104), v2, v1);
  v9(v2, v1);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBF27DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for AppViewAnchor(0, v11, v10, v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v20 - v13;
  v17 = type metadata accessor for AppViewModifier(0, a4, v15, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3 + *(int *)(v17 + 28), a4);
  v18 = sub_22CBF7D4C();
  sub_22CBF0328((uint64_t)v9, v18, a2, a4, (uint64_t)v14);
  sub_22CBF7E60();
  swift_retain();
  return sub_22CBF7E54();
}

uint64_t sub_22CBF28F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AppViewModifier(0, v5, a3, a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4 + *(int *)(v6 + 28) + ((v7 + 24) & ~v7), v5);
  return swift_deallocObject();
}

uint64_t sub_22CBF2964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AppViewModifier(0, v7, a3, a4) - 8) + 80);
  return sub_22CBF27DC(a1, a2, v4 + ((v8 + 24) & ~v8), v7);
}

void sub_22CBF29BC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AppViewModifier(255, *a1, a3, a4);
  OUTLINED_FUNCTION_15_3();
}

void sub_22CBF29F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_22CBF7A64();
  type metadata accessor for CGRect(255);
  v3 = type metadata accessor for AppViewAnchor(255, v0, v1, v2);
  OUTLINED_FUNCTION_11_7(v3, v4, v5, v6);
  OUTLINED_FUNCTION_16_1();
}

void sub_22CBF2A30()
{
  sub_22CBF7AAC();
  sub_22CBF77F4();
  OUTLINED_FUNCTION_15_3();
}

void sub_22CBF2A68()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t sub_22CBF2A78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[8];

  v4[0] = v1;
  v4[1] = a1;
  return MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v2, v4);
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for AppViewPreferenceKey(255, a1, a3, a4);
}

void _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6EntityyQrqd__Sg0dE00dG0Rd__lF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_7_9(&qword_253F87618, v2, MEMORY[0x24BDB6040]);
  OUTLINED_FUNCTION_7_9(&qword_253F87620, v3, MEMORY[0x24BDB6048]);
  OUTLINED_FUNCTION_11_8();
}

void sub_22CBF2BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_253F87578);
  *(_QWORD *)(v12 - 216) = OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_4_7();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_22CBF7ED8();
  OUTLINED_FUNCTION_19_4();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&a9 - v17;
  v19 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_50();
  v22 = v20 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&a9 - v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 16))(v18, *(_QWORD *)(v12 - 176), v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v25, v18, v10);
    swift_checkMetadataState();
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v22, v25, v10);
    sub_22CBF74D0();
    sub_22CBF72FC();
    sub_22CBF38B0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v14);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v12 - 232) + 16))(*(_QWORD *)(v12 - 240), *(_QWORD *)(v12 - 168), v11);
  **(_QWORD **)(v12 - 152) = sub_22CBF7D1C();
  OUTLINED_FUNCTION_7();
}

void _s7SwiftUI4ViewP012_AppIntents_aB0E011representedD6Entity_10identifierQrqd__m_2IDQyd__Sgt0dE00dG0Rd__lF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_7_9(&qword_253F87618, v1, MEMORY[0x24BDB6040]);
  OUTLINED_FUNCTION_7_9(&qword_253F87620, v2, MEMORY[0x24BDB6048]);
  OUTLINED_FUNCTION_11_8();
}

void sub_22CBF2EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t AssociatedTypeWitness;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_253F87578);
  *(_QWORD *)(v13 - 224) = OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_4_7();
  MEMORY[0x24BDAC7A8](v14);
  *(_QWORD *)(v13 - 248) = (char *)&a9 - v15;
  v16 = OUTLINED_FUNCTION_13_6();
  *(_QWORD *)(v13 - 184) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v13 - 176) = v16;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_50();
  v20 = v18 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&a9 - v22;
  *(_QWORD *)(v13 - 208) = v11;
  *(_QWORD *)(v13 - 232) = v12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_22CBF7ED8();
  OUTLINED_FUNCTION_19_4();
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&a9 - v27;
  v29 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_50();
  v32 = v30 - v31;
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&a9 - v34;
  OUTLINED_FUNCTION_19_3((uint64_t)v28, *(_QWORD *)(v13 - 192), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, AssociatedTypeWitness) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v35, v28, AssociatedTypeWitness);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v32, v35, AssociatedTypeWitness);
    sub_22CBF741C();
    swift_checkMetadataState();
    (*(void (**)(uint64_t, char *, _QWORD))(*(_QWORD *)(v13 - 184) + 16))(v20, v23, *(_QWORD *)(v13 - 176));
    sub_22CBF74B8();
    sub_22CBF38B0();
  }
  OUTLINED_FUNCTION_13_5((uint64_t)v28, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v13 - 264) + 16))(*(_QWORD *)(v13 - 272), *(_QWORD *)(v13 - 168), v10);
  **(_QWORD **)(v13 - 152) = sub_22CBF7D1C();
  OUTLINED_FUNCTION_7();
}

void sub_22CBF3168()
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
  _QWORD v17[16];

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  v17[9] = v2;
  v17[10] = v0;
  v3 = v2;
  v17[8] = v4;
  v17[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC58);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_50();
  v17[1] = v6 - v7;
  MEMORY[0x24BDAC7A8](v8);
  v17[7] = (char *)v17 - v9;
  v10 = sub_22CBF72C0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_15_7();
  v11 = OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_12_4(&qword_253F87618, v12, MEMORY[0x24BDB6040]);
  v14 = v13;
  OUTLINED_FUNCTION_12_4(&qword_253F87620, v15, MEMORY[0x24BDB6048]);
  v17[11] = v3;
  v17[12] = v11;
  v17[13] = v1;
  v17[14] = v14;
  v17[15] = v16;
  OUTLINED_FUNCTION_22_4();
}

void sub_22CBF3270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v14 - 176) = a1;
  *(_QWORD *)(v14 - 192) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_4_7();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&a9 - v16;
  v18 = swift_checkMetadataState();
  *(_QWORD *)(v14 - 168) = v12;
  v19 = v11;
  OUTLINED_FUNCTION_17_6(v9, v11);
  *(_QWORD *)(v14 - 120) = sub_22CBF74C4();
  sub_22CBF7C14();
  v20 = *(_QWORD *)(v14 - 184);
  v21 = *(_QWORD **)(v14 - 200);
  swift_release();
  OUTLINED_FUNCTION_17_6(v9, v19);
  *v21 = 0;
  OUTLINED_FUNCTION_17_6((uint64_t)v21 + *(int *)(v20 + 28), v9);
  if (qword_253F874E8 != -1)
    swift_once();
  OUTLINED_FUNCTION_20_4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 168) + 8));
  v22 = (uint64_t)v21;
  v23 = *(_QWORD *)(v14 - 152);
  sub_22CBF3D40(v22, v23, &qword_255C3BC58);
  *(_QWORD *)(v14 - 120) = *(_QWORD *)(v14 - 136);
  *(_QWORD *)(v14 - 112) = v18;
  *(_QWORD *)(v14 - 104) = *(_QWORD *)(v14 - 128);
  *(_QWORD *)(v14 - 96) = v13;
  *(_QWORD *)(v14 - 88) = v10;
  v24 = OUTLINED_FUNCTION_6_9();
  v25 = *(_QWORD *)(v14 - 176);
  MEMORY[0x22E3045C0](v23, v25, v20, v24);
  sub_22CBDEC0C(v23, &qword_255C3BC58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 192) + 8))(v17, v25);
  OUTLINED_FUNCTION_7();
}

void sub_22CBF33F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_7_9(&qword_253F87618, v1, MEMORY[0x24BDB6040]);
  OUTLINED_FUNCTION_7_9(&qword_253F87620, v2, MEMORY[0x24BDB6048]);
  OUTLINED_FUNCTION_11_8();
}

void sub_22CBF349C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_253F87578);
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_4_7();
  MEMORY[0x24BDAC7A8](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC88);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_9();
  v16 = v15 - v14;
  v17 = OUTLINED_FUNCTION_13_6();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_50();
  v21 = v19 - v20;
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&a9 - v23;
  sub_22CBF3CB4(*(_QWORD *)(v11 - 168), v16);
  if (__swift_getEnumTagSinglePayload(v16, 1, v17) != 1)
  {
    OUTLINED_FUNCTION_19_3((uint64_t)v24, v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 32));
    swift_checkMetadataState();
    OUTLINED_FUNCTION_19_3(v21, (uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16));
    sub_22CBF74B8();
    sub_22CBF38B0();
  }
  sub_22CBDEC0C(v16, &qword_255C3BC88);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 192) + 16))(v9, *(_QWORD *)(v11 - 160), v10);
  **(_QWORD **)(v11 - 144) = sub_22CBF7D1C();
  OUTLINED_FUNCTION_7();
}

uint64_t View.appEntityIdentifier<A>(forSelectionType:identifier:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t View.setEntityProvider<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11[5];

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_15_7();
  v11[3] = v2;
  v11[4] = v3;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v11);
  OUTLINED_FUNCTION_21_5((uint64_t)boxed_opaque_existential_2Tm);
  sub_22CBF7548();
  swift_allocObject();
  v5 = sub_22CBF753C();
  sub_22CBF7368();
  sub_22CBF7350();
  sub_22CBF7578();
  OUTLINED_FUNCTION_21_5(v1);
  type metadata accessor for DummyView();
  swift_allocObject();
  OUTLINED_FUNCTION_12_4(&qword_255C3BC68, v6, (uint64_t)&unk_22CBFAC60);
  OUTLINED_FUNCTION_12_4(&qword_255C3BC70, v7, (uint64_t)&unk_22CBFAC98);
  sub_22CBF7584();
  sub_22CBF735C();
  swift_release();
  swift_release();
  v11[0] = v5;
  OUTLINED_FUNCTION_8_8(&qword_255C3BC78, v8, MEMORY[0x24BDB64F0]);
  OUTLINED_FUNCTION_8_8(&qword_255C3BC80, v9, MEMORY[0x24BDB64F8]);
  sub_22CBF7C14();
  return swift_release();
}

uint64_t type metadata accessor for DummyView()
{
  return objc_opt_self();
}

void sub_22CBF38B0()
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
  _QWORD v22[20];

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  v3 = v2;
  v22[12] = v4;
  v22[13] = v5;
  v6 = OUTLINED_FUNCTION_13_6();
  v22[7] = *(_QWORD *)(v6 - 8);
  v22[8] = v6;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_1();
  v22[4] = v8;
  v9 = sub_22CBF7290();
  v10 = *(_QWORD *)(v9 - 8);
  v22[5] = v9;
  v22[6] = v10;
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2_1();
  v22[1] = v12;
  v22[0] = __swift_instantiateConcreteTypeFromMangledName(qword_253F87578);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_50();
  MEMORY[0x24BDAC7A8](v14);
  v22[10] = (char *)v22 - v15;
  v16 = OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_8_8(&qword_253F87618, v17, MEMORY[0x24BDB6040]);
  v19 = v18;
  OUTLINED_FUNCTION_8_8(&qword_253F87620, v20, MEMORY[0x24BDB6048]);
  v22[14] = v3;
  v22[15] = v16;
  v22[16] = v1;
  v22[17] = v19;
  v22[18] = v21;
  OUTLINED_FUNCTION_22_4();
}

void sub_22CBF39DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v15 - 224) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v15 - 216) = a1;
  OUTLINED_FUNCTION_4_7();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&a9 - v17;
  sub_22CBF7410();
  *(_QWORD *)(v15 - 128) = *(_QWORD *)(v15 - 144);
  v19 = swift_checkMetadataState();
  *(_QWORD *)(v15 - 152) = v9;
  *(_QWORD *)(v15 - 144) = v10;
  sub_22CBF7C14();
  v20 = *(_QWORD *)(v15 - 240);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v15 - 184) + 16))(*(_QWORD *)(v15 - 208), v13, *(_QWORD *)(v15 - 176));
  v21 = *(_QWORD *)(v15 - 232);
  v22 = *(_QWORD *)(v15 - 200);
  sub_22CBF7278();
  *(_QWORD *)v14 = 0;
  v23 = *(_QWORD *)(v15 - 192);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(&v14[*(int *)(v20 + 28)], v21, v22);
  if (qword_253F874E8 != -1)
    swift_once();
  OUTLINED_FUNCTION_20_4(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  v24 = *(_QWORD *)(v15 - 160);
  sub_22CBF3D40((uint64_t)v14, v24, qword_253F87578);
  *(_QWORD *)(v15 - 128) = *(_QWORD *)(v15 - 152);
  *(_QWORD *)(v15 - 120) = v19;
  *(_QWORD *)(v15 - 112) = *(_QWORD *)(v15 - 144);
  *(_QWORD *)(v15 - 104) = v12;
  *(_QWORD *)(v15 - 96) = v11;
  v25 = OUTLINED_FUNCTION_6_9();
  MEMORY[0x22E3045C0](v24, *(_QWORD *)(v15 - 216), v20, v25);
  sub_22CBDEC0C(v24, qword_253F87578);
  OUTLINED_FUNCTION_13_5((uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 224) + 8));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBF3B60()
{
  return sub_22CBF73A4();
}

double sub_22CBF3B78()
{
  return 0.0;
}

uint64_t sub_22CBF3B90()
{
  return sub_22CBF3B60();
}

uint64_t sub_22CBF3BB0(uint64_t a1, uint64_t a2)
{
  return sub_22CBF3BBC(a1, a2, (uint64_t (*)(void))sub_22CBF3B78);
}

uint64_t sub_22CBF3BBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_22CBF3BDC()
{
  return sub_22CBDF6E0() & 1;
}

uint64_t sub_22CBF3C00()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_22CBF3C0C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t sub_22CBF3C14()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_22CBF3C20()
{
  uint64_t v0;
  uint64_t v1;

  sub_22CBF7548();
  OUTLINED_FUNCTION_8_8(&qword_255C3BC78, v0, MEMORY[0x24BDB64F0]);
  OUTLINED_FUNCTION_8_8(&qword_255C3BC80, v1, MEMORY[0x24BDB64F8]);
  return OUTLINED_FUNCTION_6_9();
}

uint64_t sub_22CBF3CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22CBF3CFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F87570;
  if (!qword_253F87570)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_253F87578);
    result = MEMORY[0x22E304DA0](&unk_22CBFAC08, v1);
    atomic_store(result, (unint64_t *)&qword_253F87570);
  }
  return result;
}

void sub_22CBF3D40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_10();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return sub_22CBF77F4();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_8_8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_22CBE1FAC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return sub_22CBF74DC();
}

void OUTLINED_FUNCTION_11_8()
{
  JUMPOUT(0x22E304D70);
}

void OUTLINED_FUNCTION_12_4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_22CBE1FAC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  return sub_22CBF7428();
}

uint64_t OUTLINED_FUNCTION_17_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_20_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_21_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

void OUTLINED_FUNCTION_22_4()
{
  JUMPOUT(0x22E304D70);
}

id sub_22CBF3E1C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_22CBF7DAC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v6, a3, a4);

  return v7;
}

id sub_22CBF3E9C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  id v7;
  id result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  v2 = objc_msgSend(v0, sel_secondaryLabelColor);
  v3 = objc_msgSend(v0, sel_labelColor);
  v4 = objc_msgSend(v0, sel_tertiaryLabelColor);
  sub_22CBEE8EC();
  type metadata accessor for AppSwiftUIBridge();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithUserInterfaceStyle_, 1);
  result = sub_22CBF3E1C(0x697269687053, 0xE600000000000000, v6, v7);
  qword_253F872A8 = (uint64_t)v1;
  unk_253F872B0 = v2;
  qword_253F872B8 = (uint64_t)v3;
  unk_253F872C0 = v4;
  qword_253F872C8 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.automatic.getter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v7;

  if (qword_253F872D0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_5(&qword_253F872A8);
  v3 = v0;
  v4 = v1;
  v5 = v2;
  return OUTLINED_FUNCTION_1_8(v7);
}

id sub_22CBF403C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  id result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v4 = objc_msgSend(v1, sel_resolvedColorWithTraitCollection_, v3);

  v5 = objc_msgSend(v0, sel_secondaryLabelColor);
  v6 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v7 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, v6);

  v8 = objc_msgSend(v0, sel_labelColor);
  v9 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v10 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v9);

  v11 = objc_msgSend(v0, sel_tertiaryLabelColor);
  v12 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v13 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v12);

  sub_22CBEE8EC();
  type metadata accessor for AppSwiftUIBridge();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  result = sub_22CBF3E1C(0x697269687053, 0xE600000000000000, v15, objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1));
  qword_255C3BC90 = (uint64_t)v4;
  *(_QWORD *)algn_255C3BC98 = v7;
  qword_255C3BCA0 = (uint64_t)v10;
  unk_255C3BCA8 = v13;
  qword_255C3BCB0 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.light.getter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v7;

  if (qword_255C3B320 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_5(&qword_255C3BC90);
  v3 = v0;
  v4 = v1;
  v5 = v2;
  return OUTLINED_FUNCTION_1_8(v7);
}

id sub_22CBF42F4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  id result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_secondarySystemBackgroundColor);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v4 = objc_msgSend(v1, sel_resolvedColorWithTraitCollection_, v3);

  v5 = objc_msgSend(v0, sel_secondaryLabelColor);
  v6 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v7 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, v6);

  v8 = objc_msgSend(v0, sel_labelColor);
  v9 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v10 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v9);

  v11 = objc_msgSend(v0, sel_tertiaryLabelColor);
  v12 = objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v13 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v12);

  sub_22CBEE8EC();
  type metadata accessor for AppSwiftUIBridge();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  result = sub_22CBF3E1C(0x697269687053, 0xE600000000000000, v15, objc_msgSend(v2, sel_traitCollectionWithUserInterfaceStyle_, 1));
  qword_255C3BCB8 = (uint64_t)v4;
  unk_255C3BCC0 = v7;
  qword_255C3BCC8 = (uint64_t)v10;
  unk_255C3BCD0 = v13;
  qword_255C3BCD8 = (uint64_t)result;
  return result;
}

id static SiriTipViewStyle.dark.getter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v7;

  if (qword_255C3B328 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_5(&qword_255C3BCB8);
  v3 = v0;
  v4 = v1;
  v5 = v2;
  return OUTLINED_FUNCTION_1_8(v7);
}

void SiriTipView.init<A>(intent:isVisible:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  KeyPath = swift_getKeyPath();
  sub_22CBF7368();
  sub_22CBF7350();
  v13 = sub_22CBF7338();
  v15 = v14;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 8))(a1, a5);
  sub_22CBF6388(0, 0);
  *(_QWORD *)a6 = KeyPath;
  *(_OWORD *)(a6 + 8) = 0u;
  *(_OWORD *)(a6 + 24) = 0u;
  *(_BYTE *)(a6 + 40) = 0;
  *(_QWORD *)(a6 + 48) = a2;
  *(_QWORD *)(a6 + 56) = a3;
  *(_BYTE *)(a6 + 64) = a4;
  *(_QWORD *)(a6 + 72) = v13;
  *(_QWORD *)(a6 + 80) = v15;
  OUTLINED_FUNCTION_7();
}

uint64_t SiriTipView.init(phrase:isVisible:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  result = swift_getKeyPath();
  *(_QWORD *)a6 = result;
  *(_OWORD *)(a6 + 8) = 0u;
  if (a2)
    v13 = a1;
  else
    v13 = 0;
  v14 = 0xE000000000000000;
  *(_OWORD *)(a6 + 24) = 0uLL;
  if (a2)
    v14 = a2;
  *(_BYTE *)(a6 + 40) = 0;
  *(_QWORD *)(a6 + 48) = a3;
  *(_QWORD *)(a6 + 56) = a4;
  *(_BYTE *)(a6 + 64) = a5;
  *(_QWORD *)(a6 + 72) = v13;
  *(_QWORD *)(a6 + 80) = v14;
  return result;
}

void SiriTipView.body.getter(uint64_t a1@<X8>)
{
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
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
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[14];
  __int128 v68;
  _OWORD v69[2];
  _BYTE v70[88];
  uint64_t v71[3];
  __int128 v72;
  _OWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77[3];

  v66 = a1;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87398);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_1();
  v63 = v3;
  v57 = sub_22CBF7830();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9();
  v7 = (_OWORD *)(v6 - v5);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F872F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9();
  v11 = v10 - v9;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87310);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_1();
  v61 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87408);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9();
  v17 = v16 - v15;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87360);
  OUTLINED_FUNCTION_0_0();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v60 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v62 = (uint64_t)&v55 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87288);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_9();
  v25 = v24 - v23;
  v26 = sub_22CBF75FC();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_2_1();
  v29 = v28;
  memcpy(v70, v1, sizeof(v70));
  OUTLINED_FUNCTION_10_10((uint64_t)&v70[48], (uint64_t)v71);
  OUTLINED_FUNCTION_10_10((uint64_t)v71, (uint64_t)&v74);
  if (!v75)
    goto LABEL_3;
  v77[0] = v74;
  v67[0] = v74;
  v67[1] = v75;
  LOBYTE(v67[2]) = v76;
  sub_22CBF65D0((uint64_t)v70);
  sub_22CBF6700(v71);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87420);
  MEMORY[0x22E3046C8](&v72, v30);
  sub_22CBF6730((uint64_t)v77);
  swift_release();
  sub_22CBF6698((uint64_t)v70);
  if (v72 == 1)
  {
LABEL_3:
    memcpy(v67, v70, 0x58uLL);
    sub_22CBF4C78(v25);
    if (__swift_getEnumTagSinglePayload(v25, 1, v26) != 1)
    {
      v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
      v55 = v29;
      v56 = v27;
      v31(v29, v25, v26);
      *(_QWORD *)v17 = sub_22CBF7998();
      *(_QWORD *)(v17 + 8) = 0;
      *(_BYTE *)(v17 + 16) = 1;
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87300);
      sub_22CBF53F0(v29, v70, v17 + *(int *)(v32 + 44));
      v33 = (char *)v7 + *(int *)(v57 + 20);
      v34 = *MEMORY[0x24BDEEB68];
      v35 = sub_22CBF7A04();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v33, v34, v35);
      __asm { FMOV            V0.2D, #8.0 }
      *v7 = _Q0;
      v72 = *(_OWORD *)v70;
      v73[0] = *(_OWORD *)&v70[16];
      *(_OWORD *)((char *)v73 + 9) = *(_OWORD *)&v70[25];
      v68 = *(_OWORD *)v70;
      v69[0] = *(_OWORD *)&v70[16];
      *(_OWORD *)((char *)v69 + 9) = *(_OWORD *)&v70[25];
      sub_22CBF65D0((uint64_t)v70);
      sub_22CBF6664((uint64_t)&v72, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDEB8);
      sub_22CBEDCDC((uint64_t)v67);
      sub_22CBF6664((uint64_t)&v72, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDF48);
      sub_22CBF6698((uint64_t)v70);
      v41 = v67[0];
      v42 = (void *)v67[1];
      v43 = (void *)v67[2];
      v44 = (void *)v67[4];

      v45 = MEMORY[0x22E3045D8](v41);
      sub_22CBED644((uint64_t)v7, v11);
      v46 = v58;
      *(_QWORD *)(v11 + *(int *)(v58 + 52)) = v45;
      *(_WORD *)(v11 + *(int *)(v46 + 56)) = 256;
      sub_22CBED6D0((uint64_t)v7);
      sub_22CBF7D40();
      sub_22CBF783C();
      v47 = v61;
      OUTLINED_FUNCTION_11_9(v11, v61);
      memcpy((void *)(v47 + *(int *)(v59 + 36)), v67, 0x70uLL);
      OUTLINED_FUNCTION_12_5(v11);
      v48 = sub_22CBF7D40();
      v50 = v49;
      v51 = (uint64_t)v60;
      v52 = (uint64_t)&v60[*(int *)(v64 + 36)];
      sub_22CBE2014(v47, v52, &qword_253F87310);
      v53 = (uint64_t *)(v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F87390) + 36));
      *v53 = v48;
      v53[1] = v50;
      OUTLINED_FUNCTION_11_9(v17, v51);
      sub_22CBDEC0C(v47, &qword_253F87310);
      OUTLINED_FUNCTION_12_5(v17);
      v54 = v62;
      OUTLINED_FUNCTION_10_10(v51, v62);
      OUTLINED_FUNCTION_11_9(v54, v63);
      swift_storeEnumTagMultiPayload();
      sub_22CBF63B8();
      sub_22CBF7A58();
      OUTLINED_FUNCTION_12_5(v54);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v26);
      goto LABEL_7;
    }
    sub_22CBDEC0C(v25, &qword_253F87288);
  }
  swift_storeEnumTagMultiPayload();
  sub_22CBF63B8();
  sub_22CBF7A58();
LABEL_7:
  OUTLINED_FUNCTION_7();
}

uint64_t sub_22CBF4C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t KeyPath;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void (*v57)(uint64_t *, _QWORD);
  uint64_t v58;
  _QWORD v59[2];
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87290);
  MEMORY[0x24BDAC7A8](v3);
  v72 = (unint64_t)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87440);
  MEMORY[0x24BDAC7A8](v5);
  v73 = (char *)v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87438);
  v7 = MEMORY[0x24BDAC7A8](v76);
  v75 = (uint64_t)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v74 = (uint64_t)v59 - v9;
  v80 = sub_22CBF75FC();
  v78 = *(_QWORD *)(v80 - 8);
  v10 = MEMORY[0x24BDAC7A8](v80);
  v71 = (char *)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v79 = (char *)v59 - v12;
  v13 = *(_QWORD *)(v1 + 80);
  if (!v13)
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v80);
  v14 = *(void **)(v1 + 8);
  v68 = *(void **)v1;
  v16 = *(void **)(v1 + 16);
  v15 = *(void **)(v1 + 24);
  v17 = *(void **)(v1 + 32);
  v18 = *(_BYTE *)(v1 + 40);
  v70 = *(_QWORD *)(v1 + 48);
  v69 = *(_QWORD *)(v1 + 56);
  v77 = *(unsigned __int8 *)(v1 + 64);
  v19 = *(_QWORD *)(v1 + 72);
  v20 = sub_22CBF5E64();
  if (!v21)
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v80);
  v67 = a1;
  v88 = v20;
  v89 = v21;
  v81 = 16421;
  v82 = 0xE200000000000000;
  v65 = v19;
  v86 = v19;
  v87 = v13;
  v66 = sub_22CBEE928();
  sub_22CBF7EFC();
  swift_bridgeObjectRelease();
  sub_22CBF75F0();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  v64 = swift_getKeyPath();
  v23 = v68;
  v88 = (uint64_t)v68;
  v89 = v14;
  v90 = v16;
  v91 = v15;
  v92 = v17;
  v93 = v18;
  sub_22CBEDEB8(v68, v14, v16, v15, v17, v18);
  v24 = v70;
  v25 = v69;
  sub_22CBF6638(v70, v69);
  swift_bridgeObjectRetain();
  sub_22CBEDEB8(v23, v14, v16, v15, v17, v18);
  sub_22CBEDCDC((uint64_t)&v81);
  sub_22CBEDF48(v23, v14, v16, v15, v17, v18);
  v63 = v14;
  v62 = v16;
  v61 = v15;
  v26 = v15;
  v60 = v17;
  v27 = v18;
  sub_22CBEDF48(v23, v14, v16, v26, v17, v18);
  sub_22CBF6388(v24, v25);
  swift_bridgeObjectRelease();
  v29 = (void *)v81;
  v28 = v82;
  v30 = v83;
  v31 = v85;

  v33 = v79;
  v32 = v80;
  v81 = MEMORY[0x22E3045D8](v28);
  v34 = sub_22CBF70C0();
  sub_22CBF75E4();
  v35 = v78;
  v36 = v71;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v71, v33, v32);
  v81 = v65;
  v82 = v13;
  v37 = sub_22CBF76A4();
  v38 = v72;
  __swift_storeEnumTagSinglePayload(v72, 1, 1, v37);
  sub_22CBF7134();
  v39 = (uint64_t)v73;
  sub_22CBF7650();
  sub_22CBDEC0C(v38, &qword_253F87290);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v32);
  if (__swift_getEnumTagSinglePayload(v39, 1, v76) == 1)
  {
    v40 = &qword_253F87440;
    v41 = v39;
  }
  else
  {
    v43 = v74;
    sub_22CBE1FE8(v39, v74, &qword_253F87438);
    sub_22CBE2014(v43, v75, &qword_253F87438);
    v44 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v44);
    v73 = (char *)swift_getKeyPath();
    v45 = v68;
    v72 = v34;
    v46 = v63;
    v47 = v62;
    v59[1] = v13;
    v48 = v61;
    v49 = v60;
    sub_22CBEDEB8(v68, v63, v62, v61, v60, v27);
    v50 = v70;
    v51 = v69;
    sub_22CBF6638(v70, v69);
    swift_bridgeObjectRetain();
    sub_22CBEDEB8(v45, v46, v47, v48, v49, v27);
    sub_22CBEDCDC((uint64_t)&v81);
    sub_22CBEDF48(v45, v46, v47, v48, v49, v27);
    sub_22CBEDF48(v45, v46, v47, v48, v49, v27);
    sub_22CBF6388(v50, v51);
    swift_bridgeObjectRelease();
    v52 = (void *)v81;
    v53 = (void *)v82;
    v54 = v83;
    v55 = v85;

    v33 = v79;
    v32 = v80;
    v86 = MEMORY[0x22E3045D8](v54);
    sub_22CBF7174(&qword_253F87448, &qword_253F87438, MEMORY[0x24BEE1BC0]);
    v56 = v75;
    v57 = (void (*)(uint64_t *, _QWORD))sub_22CBF7608();
    sub_22CBF7620();
    v57(&v81, 0);
    sub_22CBDEC0C(v56, &qword_253F87438);
    v41 = v74;
    v40 = &qword_253F87438;
  }
  sub_22CBDEC0C(v41, v40);
  v58 = v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v67, v33, v32);
  return __swift_storeEnumTagSinglePayload(v58, 0, 1, v32);
}

void sub_22CBF53F0(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char v33;
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
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const void *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  __int128 v69;
  uint64_t v70;
  _BYTE v71[32];

  v64 = a3;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F8);
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87348);
  MEMORY[0x24BDAC7A8](v62);
  v55 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87350);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v63 = (uint64_t)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v60 = (uint64_t)&v55 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F873F0);
  v59 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F873D8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87320);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v61 = (uint64_t)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v55 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v55 - v24;
  v66 = a1;
  v65 = a2;
  sub_22CBF7C74();
  v69 = xmmword_22CBFACD0;
  v70 = 0x401C000000000000;
  sub_22CBF7174((unint64_t *)&qword_253F873E8, &qword_253F873F0, MEMORY[0x24BDF41A8]);
  sub_22CBED100();
  sub_22CBF7BB4();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v13, v11);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v23, v17, v14);
  *(_WORD *)&v23[*(int *)(v18 + 36)] = 256;
  v26 = v17;
  v27 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v26, v14);
  sub_22CBE1FE8((uint64_t)v23, (uint64_t)v25, &qword_253F87320);
  sub_22CBE1FE8((uint64_t)a2 + 48, (uint64_t)v71, &qword_253F87428);
  sub_22CBE1FE8((uint64_t)v71, (uint64_t)&v69, &qword_253F87428);
  if (*((_QWORD *)&v69 + 1))
  {
    v28 = swift_allocObject();
    v29 = memcpy((void *)(v28 + 16), a2, 0x58uLL);
    MEMORY[0x24BDAC7A8](v29);
    *(&v55 - 2) = (char *)a2;
    sub_22CBF65D0((uint64_t)a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F873D0);
    v30 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87380);
    v31 = sub_22CBF6EF4();
    v67 = v30;
    v68 = v31;
    swift_getOpaqueTypeConformance2();
    v32 = v56;
    sub_22CBF7CF8();
    v33 = sub_22CBF7B18();
    sub_22CBF7734();
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = v57;
    v43 = (uint64_t)v55;
    v44 = v58;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v55, v32, v58);
    v45 = v62;
    v46 = v43 + *(int *)(v62 + 36);
    *(_BYTE *)v46 = v33;
    *(_QWORD *)(v46 + 8) = v35;
    *(_QWORD *)(v46 + 16) = v37;
    *(_QWORD *)(v46 + 24) = v39;
    *(_QWORD *)(v46 + 32) = v41;
    *(_BYTE *)(v46 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v44);
    v47 = v60;
    sub_22CBE1FE8(v43, v60, &qword_253F87348);
    v48 = 0;
    v49 = v45;
  }
  else
  {
    v48 = 1;
    v47 = v60;
    v49 = v62;
  }
  __swift_storeEnumTagSinglePayload(v47, v48, 1, v49);
  v50 = v61;
  sub_22CBE2014(v27, v61, &qword_253F87320);
  v51 = v63;
  sub_22CBE2014(v47, v63, &qword_253F87350);
  v52 = v64;
  sub_22CBE2014(v50, v64, &qword_253F87320);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F87328);
  v54 = v52 + *(int *)(v53 + 48);
  *(_QWORD *)v54 = 0;
  *(_BYTE *)(v54 + 8) = 1;
  sub_22CBE2014(v51, v52 + *(int *)(v53 + 64), &qword_253F87350);
  sub_22CBDEC0C(v47, &qword_253F87350);
  sub_22CBDEC0C(v27, &qword_253F87320);
  sub_22CBDEC0C(v51, &qword_253F87350);
  sub_22CBDEC0C(v50, &qword_253F87320);
}

uint64_t sub_22CBF59C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  v4 = sub_22CBF75FC();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v7 = sub_22CBF7B78();
  v9 = v8;
  v11 = v10 & 1;
  sub_22CBF7B3C();
  v12 = sub_22CBF7B60();
  v14 = v13;
  v16 = v15;
  swift_release();
  sub_22CBE25C8(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_22CBF7B30();
  v17 = sub_22CBF7B48();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  sub_22CBE25C8(v12, v14, v16 & 1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v17;
  *(_QWORD *)(a2 + 8) = v19;
  *(_BYTE *)(a2 + 16) = v21 & 1;
  *(_QWORD *)(a2 + 24) = v23;
  return result;
}

uint64_t sub_22CBF5B14@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD v16[5];
  __int128 v17;
  _OWORD v18[2];

  v4 = sub_22CBF7C5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[1];
  v17 = *a1;
  v18[0] = v8;
  *(_OWORD *)((char *)v18 + 9) = *(__int128 *)((char *)a1 + 25);
  sub_22CBF65D0((uint64_t)a1);
  sub_22CBF6664((uint64_t)&v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDEB8);
  sub_22CBEDCDC((uint64_t)v16);
  sub_22CBF6664((uint64_t)&v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDF48);
  sub_22CBF6698((uint64_t)a1);
  v9 = (void *)v16[0];
  v10 = (void *)v16[1];
  v11 = (void *)v16[2];
  v12 = v16[4];

  if (!v12)
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  sub_22CBF7C44();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
  v13 = sub_22CBF7C68();
  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v13;
  return result;
}

uint64_t sub_22CBF5C78(uint64_t result)
{
  if (*(_QWORD *)(result + 56))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F87420);
    sub_22CBF7D34();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_22CBF5CFC(__int128 *a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  _OWORD v19[2];

  v2 = sub_22CBF7C50();
  v3 = a1[1];
  v18 = *a1;
  v19[0] = v3;
  *(_OWORD *)((char *)v19 + 9) = *(__int128 *)((char *)a1 + 25);
  sub_22CBF65D0((uint64_t)a1);
  sub_22CBF6664((uint64_t)&v18, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDEB8);
  sub_22CBEDCDC((uint64_t)&v13);
  sub_22CBF6664((uint64_t)&v18, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22CBEDF48);
  sub_22CBF6698((uint64_t)a1);
  v4 = v13;
  v5 = v14;
  v6 = v16;
  v7 = v17;

  v8 = (void *)MEMORY[0x22E3045D8](v6);
  KeyPath = swift_getKeyPath();
  v10 = sub_22CBF7B3C();
  v11 = swift_getKeyPath();
  v13 = (void *)v2;
  v14 = (void *)KeyPath;
  v15 = v8;
  v16 = v11;
  v17 = (void *)v10;
  sub_22CBF7B30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F87380);
  sub_22CBF6EF4();
  sub_22CBF7BA8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22CBF5E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  sub_22CBF7368();
  sub_22CBF7350();
  v0 = sub_22CBF7344();
  v2 = v1;
  swift_release();
  if (v2)
  {
    type metadata accessor for AppSwiftUIBridge();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    v6 = objc_msgSend(v5, sel_localizations);
    if (!v6)
    {
      sub_22CBF7E24();
      v6 = (id)sub_22CBF7E18();
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BCF8);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_22CBFA7E0;
    *(_QWORD *)(v7 + 32) = v0;
    *(_QWORD *)(v7 + 40) = v2;
    v8 = (void *)sub_22CBF7E18();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v4, sel_preferredLocalizationsFromArray_forPreferences_, v6, v8);

    v10 = sub_22CBF7E24();
    if (*(_QWORD *)(v10 + 16))
    {
      v11 = *(_QWORD *)(v10 + 40);
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = 0;
    }
    swift_bridgeObjectRelease();
    v17 = (void *)sub_22CBF7DAC();
    v18 = (void *)sub_22CBF7DAC();
    if (v11)
    {
      v19 = (void *)sub_22CBF7DAC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = 0;
    }
    v20 = objc_msgSend(v5, sel_localizedStringForKey_value_table_localization_, v17, v18, 0, v19);

    v16 = sub_22CBF7DD0();
  }
  else
  {
    if (qword_253F87608 != -1)
      swift_once();
    v12 = sub_22CBF7710();
    __swift_project_value_buffer(v12, (uint64_t)qword_253F880D0);
    v13 = sub_22CBF76F8();
    v14 = sub_22CBF7ECC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22CBD7000, v13, v14, "Siri language unavailable, hiding tip", v15, 2u);
      MEMORY[0x22E304E0C](v15, -1, -1);
    }

    return 0;
  }
  return v16;
}

uint64_t sub_22CBF615C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BCF0);
  return sub_22CBF7DA0() & 1;
}

uint64_t sub_22CBF61B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C3BCF0);
  return sub_22CBF7D94();
}

void sub_22CBF61F8()
{
  sub_22CBF70C0();
  sub_22CBF762C();
  __break(1u);
}

uint64_t View.siriTipViewStyle(_:)()
{
  swift_getKeyPath();
  sub_22CBF7BCC();
  return swift_release();
}

uint64_t sub_22CBF62A4()
{
  sub_22CBF71B0();
  return sub_22CBF7968();
}

double sub_22CBF62D8@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  sub_22CBF62A4();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_22CBF631C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(id *)(a1 + 32);
  v6 = v1;
  v7 = v2;
  v8 = v3;
  v9 = v4;
  return sub_22CBF6454();
}

uint64_t sub_22CBF6388(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_22CBF63B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_253F87358;
  if (!qword_253F87358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87360);
    sub_22CBF7174(&qword_253F87400, &qword_253F87408, MEMORY[0x24BDF4498]);
    v3 = v2;
    sub_22CBF7174(&qword_253F87388, &qword_253F87390, MEMORY[0x24BDEF370]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_253F87358);
  }
  return result;
}

uint64_t sub_22CBF6454()
{
  sub_22CBF71B0();
  return sub_22CBF7974();
}

id sub_22CBF6498()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;

  if (qword_253F872D0 != -1)
    swift_once();
  v0 = (void *)qword_253F872A8;
  v1 = (void *)unk_253F872B0;
  v2 = (void *)qword_253F872B8;
  v8 = (id)unk_253F872C0;
  qword_253F880A0 = qword_253F872A8;
  *(_QWORD *)algn_253F880A8 = unk_253F872B0;
  qword_253F880B0 = qword_253F872B8;
  unk_253F880B8 = unk_253F872C0;
  qword_253F880C0 = qword_253F872C8;
  v3 = (id)qword_253F872C8;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  return v8;
}

uint64_t *sub_22CBF6528()
{
  if (qword_253F87298 != -1)
    swift_once();
  return &qword_253F880A0;
}

id sub_22CBF6568@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  sub_22CBF6528();
  v2 = (void *)qword_253F880A0;
  v3 = *(void **)algn_253F880A8;
  v5 = (void *)qword_253F880B0;
  v4 = unk_253F880B8;
  v12 = (id)unk_253F880B8;
  v6 = (void *)qword_253F880C0;
  *a1 = qword_253F880A0;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v6;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  v10 = v5;
  return v12;
}

uint64_t sub_22CBF65D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  sub_22CBEDEB8(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(_BYTE *)(a1 + 40));
  sub_22CBF6638(v2, v3);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22CBF6638(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_22CBF6664(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  OUTLINED_FUNCTION_10();
}

uint64_t sub_22CBF6698(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  sub_22CBEDF48(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(_BYTE *)(a1 + 40));
  sub_22CBF6388(v2, v3);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *sub_22CBF6700(uint64_t *a1)
{
  sub_22CBF6638(*a1, a1[1]);
  return a1;
}

uint64_t sub_22CBF6730(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_22CBF6758()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for SiriTipViewStyle(id *a1)
{

}

_QWORD *initializeWithCopy for SiriTipViewStyle(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  return a1;
}

uint64_t assignWithCopy for SiriTipViewStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 24);
  v14 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v13;
  v15 = v13;

  v16 = *(void **)(a1 + 32);
  v17 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v17;
  v18 = v17;

  return a1;
}

uint64_t assignWithTake for SiriTipViewStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTipViewStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 40))
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

uint64_t storeEnumTagSinglePayload for SiriTipViewStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SiriTipViewStyle()
{
  OUTLINED_FUNCTION_3_2();
}

uint64_t destroy for SiriTipView(uint64_t a1)
{
  sub_22CBEDF48(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void **)(a1 + 32), *(_BYTE *)(a1 + 40));
  if (*(_QWORD *)(a1 + 56))
  {
    swift_release();
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriTipView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_22CBEDEB8(*(void **)a2, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a2 + 56);
  if (v10)
  {
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v10;
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    swift_retain();
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  }
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriTipView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  char v19;
  __int128 v20;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_22CBEDEB8(*(void **)a2, v5, v6, v7, v8, v9);
  v10 = *(void **)a1;
  v11 = *(void **)(a1 + 8);
  v12 = *(void **)(a1 + 16);
  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  sub_22CBEDF48(v10, v11, v12, v13, v14, v15);
  v16 = (_OWORD *)(a1 + 48);
  v17 = (_OWORD *)(a2 + 48);
  v18 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v18)
    {
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_retain();
      swift_release();
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      swift_retain();
      swift_release();
      *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    }
    else
    {
      sub_22CBDEC0C(a1 + 48, &qword_253F87420);
      v19 = *(_BYTE *)(a2 + 64);
      *v16 = *v17;
      *(_BYTE *)(a1 + 64) = v19;
    }
  }
  else if (v18)
  {
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    swift_retain();
    swift_retain();
  }
  else
  {
    v20 = *v17;
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    *v16 = v20;
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SiriTipView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a1 + 16);
  v9 = *(void **)(a1 + 24);
  v10 = *(void **)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 40);
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = v5;
  sub_22CBEDF48(v6, v7, v8, v9, v10, v11);
  if (!*(_QWORD *)(a1 + 56))
    goto LABEL_5;
  v13 = *(_QWORD *)(a2 + 56);
  if (!v13)
  {
    sub_22CBDEC0C(a1 + 48, &qword_253F87420);
LABEL_5:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = v13;
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
LABEL_6:
  v14 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTipView(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 88))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 56);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTipView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 0;
    if (a2)
      *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

void type metadata accessor for SiriTipView()
{
  OUTLINED_FUNCTION_3_2();
}

unint64_t sub_22CBF6D98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F873A0;
  if (!qword_253F873A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F873A8);
    v2[0] = sub_22CBF63B8();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F873A0);
  }
  return result;
}

uint64_t sub_22CBF6E04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C3BCE0);
  v2 = sub_22CBF77F4();
  sub_22CBF7174(&qword_255C3BCE8, &qword_255C3BCE0, MEMORY[0x24BDF1028]);
  v5[0] = v1;
  v5[1] = v3;
  return MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v2, v5);
}

uint64_t sub_22CBF6E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22CBF59C4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_22CBF6E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_22CBF5B14(*(__int128 **)(v1 + 16), a1);
}

uint64_t sub_22CBF6E94()
{
  uint64_t v0;

  sub_22CBEDF48(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  if (*(_QWORD *)(v0 + 72))
  {
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22CBF6EE4()
{
  uint64_t v0;

  return sub_22CBF5C78(v0 + 16);
}

uint64_t sub_22CBF6EEC()
{
  uint64_t v0;

  return sub_22CBF5CFC(*(__int128 **)(v0 + 16));
}

unint64_t sub_22CBF6EF4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_253F87378;
  if (!qword_253F87378)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87380);
    v2 = sub_22CBF6F78();
    sub_22CBF7174(&qword_253F873B0, &qword_253F873B8, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_253F87378);
  }
  return result;
}

unint64_t sub_22CBF6F78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253F87338;
  if (!qword_253F87338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F87340);
    sub_22CBF7174(&qword_253F873C0, &qword_253F873C8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253F87338);
  }
  return result;
}

uint64_t sub_22CBF6FFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22CBF7884();
  *a1 = result;
  return result;
}

uint64_t sub_22CBF7024()
{
  swift_retain();
  return sub_22CBF7890();
}

uint64_t sub_22CBF7050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22CBF792C();
  *a1 = result;
  return result;
}

uint64_t sub_22CBF7078()
{
  swift_retain();
  return sub_22CBF7938();
}

void sub_22CBF70A4()
{
  sub_22CBF75D8();
  __break(1u);
}

unint64_t sub_22CBF70C0()
{
  unint64_t result;

  result = qword_253F87278;
  if (!qword_253F87278)
  {
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_253F87278);
  }
  return result;
}

uint64_t sub_22CBF7100()
{
  return 8;
}

uint64_t sub_22CBF710C()
{
  return swift_release();
}

uint64_t sub_22CBF7114(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_22CBF7128(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_22CBF7134()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F87280;
  if (!qword_253F87280)
  {
    v1 = sub_22CBF75FC();
    result = MEMORY[0x22E304DA0](MEMORY[0x24BDCC588], v1);
    atomic_store(result, (unint64_t *)&qword_253F87280);
  }
  return result;
}

void sub_22CBF7174(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x22E304DA0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_10();
}

unint64_t sub_22CBF71B0()
{
  unint64_t result;

  result = qword_253F872A0;
  if (!qword_253F872A0)
  {
    result = MEMORY[0x22E304DA0](&unk_22CBFAE60, &unk_24F76AED8);
    atomic_store(result, (unint64_t *)&qword_253F872A0);
  }
  return result;
}

void type metadata accessor for SiriTipStyleKey()
{
  OUTLINED_FUNCTION_3_2();
}

void OUTLINED_FUNCTION_10_10(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22CBE1FE8(a1, a2, v2);
}

void OUTLINED_FUNCTION_11_9(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22CBE2014(a1, a2, v2);
}

void OUTLINED_FUNCTION_12_5(uint64_t a1)
{
  uint64_t *v1;

  sub_22CBDEC0C(a1, v1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_22CBF7230()
{
  return MEMORY[0x24BDB4B18]();
}

uint64_t sub_22CBF723C()
{
  return MEMORY[0x24BDB4B28]();
}

uint64_t sub_22CBF7248()
{
  return MEMORY[0x24BDB4BA8]();
}

uint64_t sub_22CBF7254()
{
  return MEMORY[0x24BDB4BB8]();
}

uint64_t sub_22CBF7260()
{
  return MEMORY[0x24BDB4BC0]();
}

uint64_t sub_22CBF726C()
{
  return MEMORY[0x24BDB4C00]();
}

uint64_t sub_22CBF7278()
{
  return MEMORY[0x24BDB4C08]();
}

uint64_t sub_22CBF7284()
{
  return MEMORY[0x24BDB4C10]();
}

uint64_t sub_22CBF7290()
{
  return MEMORY[0x24BDB4C18]();
}

uint64_t sub_22CBF729C()
{
  return MEMORY[0x24BDB4C28]();
}

uint64_t sub_22CBF72A8()
{
  return MEMORY[0x24BDB4C30]();
}

uint64_t sub_22CBF72B4()
{
  return MEMORY[0x24BDB4C38]();
}

uint64_t sub_22CBF72C0()
{
  return MEMORY[0x24BDB4C40]();
}

uint64_t sub_22CBF72CC()
{
  return MEMORY[0x24BDB4CD8]();
}

uint64_t sub_22CBF72D8()
{
  return MEMORY[0x24BDB4D18]();
}

uint64_t sub_22CBF72E4()
{
  return MEMORY[0x24BDB4D20]();
}

uint64_t sub_22CBF72F0()
{
  return MEMORY[0x24BDB4D28]();
}

uint64_t sub_22CBF72FC()
{
  return MEMORY[0x24BDB4DB0]();
}

uint64_t sub_22CBF7308()
{
  return MEMORY[0x24BDB4DF0]();
}

uint64_t sub_22CBF7314()
{
  return MEMORY[0x24BDB4E30]();
}

uint64_t sub_22CBF7320()
{
  return MEMORY[0x24BDB4E40]();
}

uint64_t sub_22CBF732C()
{
  return MEMORY[0x24BDB4E88]();
}

uint64_t sub_22CBF7338()
{
  return MEMORY[0x24BDB4EA0]();
}

uint64_t sub_22CBF7344()
{
  return MEMORY[0x24BDB4EA8]();
}

uint64_t sub_22CBF7350()
{
  return MEMORY[0x24BDB4EC0]();
}

uint64_t sub_22CBF735C()
{
  return MEMORY[0x24BDB4ED0]();
}

uint64_t sub_22CBF7368()
{
  return MEMORY[0x24BDB4ED8]();
}

uint64_t sub_22CBF7374()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_22CBF7380()
{
  return MEMORY[0x24BDB51D0]();
}

uint64_t sub_22CBF738C()
{
  return MEMORY[0x24BDB51D8]();
}

uint64_t sub_22CBF7398()
{
  return MEMORY[0x24BDB51E0]();
}

uint64_t sub_22CBF73A4()
{
  return MEMORY[0x24BDB51E8]();
}

uint64_t sub_22CBF73B0()
{
  return MEMORY[0x24BDB5298]();
}

uint64_t sub_22CBF73BC()
{
  return MEMORY[0x24BDB52A0]();
}

uint64_t sub_22CBF73C8()
{
  return MEMORY[0x24BDB5380]();
}

uint64_t sub_22CBF73D4()
{
  return MEMORY[0x24BDB53A0]();
}

uint64_t sub_22CBF73E0()
{
  return MEMORY[0x24BDB53C0]();
}

uint64_t sub_22CBF73EC()
{
  return MEMORY[0x24BDB5448]();
}

uint64_t sub_22CBF73F8()
{
  return MEMORY[0x24BDB5488]();
}

uint64_t sub_22CBF7404()
{
  return MEMORY[0x24BDB54A8]();
}

uint64_t sub_22CBF7410()
{
  return MEMORY[0x24BDB5660]();
}

uint64_t sub_22CBF741C()
{
  return MEMORY[0x24BDB5670]();
}

uint64_t sub_22CBF7428()
{
  return MEMORY[0x24BDB5678]();
}

uint64_t sub_22CBF7434()
{
  return MEMORY[0x24BDB57B8]();
}

uint64_t sub_22CBF7440()
{
  return MEMORY[0x24BDB5D08]();
}

uint64_t sub_22CBF744C()
{
  return MEMORY[0x24BDB5D18]();
}

uint64_t sub_22CBF7458()
{
  return MEMORY[0x24BDB5D48]();
}

uint64_t sub_22CBF7464()
{
  return MEMORY[0x24BDB5E38]();
}

uint64_t sub_22CBF7470()
{
  return MEMORY[0x24BDB5E98]();
}

uint64_t sub_22CBF747C()
{
  return MEMORY[0x24BDB5EA0]();
}

uint64_t sub_22CBF7488()
{
  return MEMORY[0x24BDB5ED0]();
}

uint64_t sub_22CBF7494()
{
  return MEMORY[0x24BDB5F10]();
}

uint64_t sub_22CBF74A0()
{
  return MEMORY[0x24BDB5F20]();
}

uint64_t sub_22CBF74AC()
{
  return MEMORY[0x24BDB5F28]();
}

uint64_t sub_22CBF74B8()
{
  return MEMORY[0x24BDB6030]();
}

uint64_t sub_22CBF74C4()
{
  return MEMORY[0x24BDB6050]();
}

uint64_t sub_22CBF74D0()
{
  return MEMORY[0x24BDB6058]();
}

uint64_t sub_22CBF74DC()
{
  return MEMORY[0x24BDB6060]();
}

uint64_t sub_22CBF74E8()
{
  return MEMORY[0x24BDB6068]();
}

uint64_t sub_22CBF74F4()
{
  return MEMORY[0x24BDB6070]();
}

uint64_t sub_22CBF7500()
{
  return MEMORY[0x24BDB6078]();
}

uint64_t sub_22CBF750C()
{
  return MEMORY[0x24BDB6158]();
}

uint64_t sub_22CBF7518()
{
  return MEMORY[0x24BDB6228]();
}

uint64_t sub_22CBF7524()
{
  return MEMORY[0x24BDB64D0]();
}

uint64_t sub_22CBF7530()
{
  return MEMORY[0x24BDB64D8]();
}

uint64_t sub_22CBF753C()
{
  return MEMORY[0x24BDB6500]();
}

uint64_t sub_22CBF7548()
{
  return MEMORY[0x24BDB6508]();
}

uint64_t sub_22CBF7554()
{
  return MEMORY[0x24BDB6518]();
}

uint64_t sub_22CBF7560()
{
  return MEMORY[0x24BDB6520]();
}

uint64_t sub_22CBF756C()
{
  return MEMORY[0x24BDB6540]();
}

uint64_t sub_22CBF7578()
{
  return MEMORY[0x24BDB65A0]();
}

uint64_t sub_22CBF7584()
{
  return MEMORY[0x24BDB65A8]();
}

uint64_t sub_22CBF7590()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22CBF759C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22CBF75A8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22CBF75B4()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22CBF75C0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22CBF75CC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22CBF75D8()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_22CBF75E4()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_22CBF75F0()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_22CBF75FC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_22CBF7608()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_22CBF7614()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22CBF7620()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_22CBF762C()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_22CBF7638()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_22CBF7644()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_22CBF7650()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_22CBF765C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22CBF7668()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22CBF7674()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22CBF7680()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22CBF768C()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_22CBF7698()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_22CBF76A4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22CBF76B0()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_22CBF76BC()
{
  return MEMORY[0x24BEE6278]();
}

uint64_t sub_22CBF76C8()
{
  return MEMORY[0x24BEE62B8]();
}

uint64_t sub_22CBF76D4()
{
  return MEMORY[0x24BEE62C0]();
}

uint64_t sub_22CBF76E0()
{
  return MEMORY[0x24BEE62D8]();
}

uint64_t sub_22CBF76EC()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_22CBF76F8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22CBF7704()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22CBF7710()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22CBF771C()
{
  return MEMORY[0x24BEBC9A8]();
}

uint64_t sub_22CBF7728()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_22CBF7734()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_22CBF7740()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_22CBF774C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_22CBF7758()
{
  return MEMORY[0x24BDEBA48]();
}

uint64_t sub_22CBF7764()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22CBF7770()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22CBF777C()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22CBF7788()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_22CBF7794()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_22CBF77A0()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_22CBF77AC()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_22CBF77B8()
{
  return MEMORY[0x24BDECA18]();
}

uint64_t sub_22CBF77C4()
{
  return MEMORY[0x24BDECA20]();
}

uint64_t sub_22CBF77D0()
{
  return MEMORY[0x24BDECA28]();
}

uint64_t sub_22CBF77DC()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_22CBF77E8()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_22CBF77F4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22CBF7800()
{
  return MEMORY[0x24BDED790]();
}

uint64_t sub_22CBF780C()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_22CBF7818()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_22CBF7824()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_22CBF7830()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_22CBF783C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_22CBF7848()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_22CBF7854()
{
  return MEMORY[0x24BDEDF58]();
}

uint64_t sub_22CBF7860()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_22CBF786C()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_22CBF7878()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_22CBF7884()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_22CBF7890()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_22CBF789C()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_22CBF78A8()
{
  return MEMORY[0x24BDEE0B8]();
}

uint64_t sub_22CBF78B4()
{
  return MEMORY[0x24BDEE0C0]();
}

uint64_t sub_22CBF78C0()
{
  return MEMORY[0x24BDEE200]();
}

uint64_t sub_22CBF78CC()
{
  return MEMORY[0x24BDEE2E8]();
}

uint64_t sub_22CBF78D8()
{
  return MEMORY[0x24BDEE2F0]();
}

uint64_t sub_22CBF78E4()
{
  return MEMORY[0x24BDEE2F8]();
}

uint64_t sub_22CBF78F0()
{
  return MEMORY[0x24BDEE300]();
}

uint64_t sub_22CBF78FC()
{
  return MEMORY[0x24BDEE348]();
}

uint64_t sub_22CBF7908()
{
  return MEMORY[0x24BDEE350]();
}

uint64_t sub_22CBF7914()
{
  return MEMORY[0x24BDEE378]();
}

uint64_t sub_22CBF7920()
{
  return MEMORY[0x24BDEE380]();
}

uint64_t sub_22CBF792C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22CBF7938()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22CBF7944()
{
  return MEMORY[0x24BDEE3C8]();
}

uint64_t sub_22CBF7950()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22CBF795C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22CBF7968()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_22CBF7974()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_22CBF7980()
{
  return MEMORY[0x24BDEE570]();
}

uint64_t sub_22CBF798C()
{
  return MEMORY[0x24BDEE708]();
}

uint64_t sub_22CBF7998()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_22CBF79A4()
{
  return MEMORY[0x24BDEE770]();
}

uint64_t sub_22CBF79B0()
{
  return MEMORY[0x24BDEE778]();
}

uint64_t sub_22CBF79BC()
{
  return MEMORY[0x24BDEE780]();
}

uint64_t sub_22CBF79C8()
{
  return MEMORY[0x24BDEE788]();
}

uint64_t sub_22CBF79D4()
{
  return MEMORY[0x24BDEE790]();
}

uint64_t sub_22CBF79E0()
{
  return MEMORY[0x24BDEE7A0]();
}

uint64_t sub_22CBF79EC()
{
  return MEMORY[0x24BDEE7B0]();
}

uint64_t sub_22CBF79F8()
{
  return MEMORY[0x24BDEE7C0]();
}

uint64_t sub_22CBF7A04()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_22CBF7A10()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_22CBF7A1C()
{
  return MEMORY[0x24BDEEFA0]();
}

uint64_t sub_22CBF7A28()
{
  return MEMORY[0x24BDEEFA8]();
}

uint64_t sub_22CBF7A34()
{
  return MEMORY[0x24BDEEFB0]();
}

uint64_t sub_22CBF7A40()
{
  return MEMORY[0x24BDEEFB8]();
}

uint64_t sub_22CBF7A4C()
{
  return MEMORY[0x24BDEEFC0]();
}

uint64_t sub_22CBF7A58()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_22CBF7A64()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_22CBF7A70()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_22CBF7A7C()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_22CBF7A88()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_22CBF7A94()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_22CBF7AA0()
{
  return MEMORY[0x24BDF0238]();
}

uint64_t sub_22CBF7AAC()
{
  return MEMORY[0x24BDF0688]();
}

uint64_t sub_22CBF7AB8()
{
  return MEMORY[0x24BDF0938]();
}

uint64_t sub_22CBF7AC4()
{
  return MEMORY[0x24BDF0940]();
}

uint64_t sub_22CBF7AD0()
{
  return MEMORY[0x24BDF0948]();
}

uint64_t sub_22CBF7ADC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22CBF7AE8()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_22CBF7AF4()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_22CBF7B00()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_22CBF7B0C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_22CBF7B18()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_22CBF7B24()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_22CBF7B30()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_22CBF7B3C()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_22CBF7B48()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_22CBF7B54()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_22CBF7B60()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_22CBF7B6C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22CBF7B78()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_22CBF7B84()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22CBF7B90()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22CBF7B9C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22CBF7BA8()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_22CBF7BB4()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_22CBF7BC0()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_22CBF7BCC()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_22CBF7BD8()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_22CBF7BE4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22CBF7BF0()
{
  return MEMORY[0x24BDF27A8]();
}

uint64_t sub_22CBF7BFC()
{
  return MEMORY[0x24BDF3260]();
}

uint64_t sub_22CBF7C08()
{
  return MEMORY[0x24BDF32D8]();
}

uint64_t sub_22CBF7C14()
{
  return MEMORY[0x24BDF3370]();
}

uint64_t sub_22CBF7C20()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_22CBF7C2C()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_22CBF7C38()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_22CBF7C44()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_22CBF7C50()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_22CBF7C5C()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_22CBF7C68()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_22CBF7C74()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_22CBF7C80()
{
  return MEMORY[0x24BDF4160]();
}

uint64_t sub_22CBF7C8C()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_22CBF7C98()
{
  return MEMORY[0x24BDF4178]();
}

uint64_t sub_22CBF7CA4()
{
  return MEMORY[0x24BDF4180]();
}

uint64_t sub_22CBF7CB0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22CBF7CBC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22CBF7CC8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22CBF7CD4()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_22CBF7CE0()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_22CBF7CEC()
{
  return MEMORY[0x24BDF4338]();
}

uint64_t sub_22CBF7CF8()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_22CBF7D04()
{
  return MEMORY[0x24BDF4350]();
}

uint64_t sub_22CBF7D10()
{
  return MEMORY[0x24BDF4680]();
}

uint64_t sub_22CBF7D1C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_22CBF7D28()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_22CBF7D34()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_22CBF7D40()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_22CBF7D4C()
{
  return MEMORY[0x24BDF5258]();
}

uint64_t sub_22CBF7D58()
{
  return MEMORY[0x24BDF5270]();
}

uint64_t sub_22CBF7D64()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22CBF7D70()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22CBF7D7C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_22CBF7D88()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22CBF7D94()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_22CBF7DA0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22CBF7DAC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22CBF7DB8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22CBF7DC4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22CBF7DD0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22CBF7DDC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22CBF7DE8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22CBF7DF4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22CBF7E00()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_22CBF7E0C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22CBF7E18()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22CBF7E24()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22CBF7E30()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22CBF7E3C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_22CBF7E48()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_22CBF7E54()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_22CBF7E60()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22CBF7E6C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22CBF7E78()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22CBF7E84()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22CBF7E90()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22CBF7E9C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22CBF7EA8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22CBF7EB4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22CBF7EC0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22CBF7ECC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22CBF7ED8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22CBF7EE4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22CBF7EF0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22CBF7EFC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22CBF7F08()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22CBF7F14()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22CBF7F20()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22CBF7F2C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22CBF7F38()
{
  return MEMORY[0x24BEE2528]();
}

uint64_t sub_22CBF7F44()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22CBF7F50()
{
  return MEMORY[0x24BEE2CA8]();
}

uint64_t sub_22CBF7F5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22CBF7F68()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22CBF7F74()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22CBF7F80()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22CBF7F8C()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_22CBF7F98()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22CBF7FA4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22CBF7FB0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22CBF7FBC()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_22CBF7FC8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22CBF7FD4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22CBF7FE0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22CBF7FEC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22CBF7FF8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22CBF8004()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22CBF8010()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_22CBF801C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22CBF8028()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22CBF8034()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22CBF8040()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22CBF804C()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

