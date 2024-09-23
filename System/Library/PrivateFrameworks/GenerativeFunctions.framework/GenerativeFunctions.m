uint64_t sub_23CA1E588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[2];

  v18[1] = a6;
  v12 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v6, a3);
  sub_23CA4B534();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v15;
  v16[6] = a1;
  v16[7] = a2;
  swift_retain();
  return sub_23CA4B5C4();
}

uint64_t sub_23CA1E6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;

  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  v7[5] = a1;
  v7[6] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[11] = AssociatedTypeWitness;
  v9 = sub_23CA4B5F4();
  v7[12] = v9;
  v7[13] = *(_QWORD *)(v9 - 8);
  v7[14] = swift_task_alloc();
  v7[15] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_getAssociatedTypeWitness();
  v7[18] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_23CA1E79C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_23CA1E83C;
  return sub_23CA4B4D4();
}

uint64_t sub_23CA1E83C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_23CA1E8A8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;

  v2 = v0 + 11;
  v1 = v0[11];
  v3 = v0[14];
  v4 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v3, 1, v1);
  v5 = v0[16];
  if (v4 == 1)
  {
    v6 = v0 + 13;
    v2 = v0 + 12;
    v7 = 1;
    v8 = v3;
LABEL_6:
    v11 = v0[9];
    v12 = v0[5];
    (*(void (**)(uint64_t, _QWORD))(*v6 + 8))(v8, *v2);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v12, v7, 1, v11);
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  v6 = v0 + 15;
  v7 = v0[20];
  v9 = (void (*)(uint64_t))v0[6];
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v0[15] + 32))(v0[16], v3, v1);
  v9(v5);
  if (!v7)
  {
    v8 = v0[16];
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[16], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_23CA1E9E4()
{
  uint64_t v0;

  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA1EA2C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23CA1EA58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23CA1EAE4;
  return sub_23CA1E6A0(a1, v7, v9, v8, v4, v5, v6);
}

uint64_t sub_23CA1EAE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void GenerativeConfigurationProtocol.with<A>(model:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23CA21590();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v3, a1);
  sub_23CA215FC(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  swift_getAssociatedTypeWitness();
  sub_23CA1EC3C((uint64_t)v9, a1, a3);
}

void sub_23CA1EC3C(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_23CA1EC98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23CA215FC(v2 + *(int *)(a1 + 52), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32));
}

void GenerativeConfigurationProtocol.with<A>(model:modelType:)(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  GenerativeConfigurationProtocol.with<A>(model:)(a1, a2, a3);
}

uint64_t GenerativeConfigurationProtocol.withModel<A>(model:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t (*v7)(void);
  uint64_t result;

  MEMORY[0x24BDAC7A8]();
  sub_23CA21590();
  result = v7();
  if (!v3)
    GenerativeConfigurationProtocol.with<A>(model:)(a1, a2, a3);
  return result;
}

uint64_t GenerativeConfigurationRunnable.model.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA21408(*(_QWORD *)(a1 + 24), a2);
}

uint64_t GenerativeConfigurationRunnable.model.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 40))(v2 + *(int *)(a2 + 52), a1);
}

uint64_t (*GenerativeConfigurationRunnable.model.modify())()
{
  return nullsub_1;
}

uint64_t GenerativeConfigurationRunnable<>.prompt.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA21408(*(_QWORD *)(a1 + 16), a2);
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  sub_23CA21620(a1, a2);
  v3 = sub_23CA21418();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

{
  _QWORD *v2;
  uint64_t v3;

  sub_23CA21620(a1, a2);
  v3 = sub_23CA21418();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA1EE2C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA1EF2C();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  sub_23CA21518(v1);
  return sub_23CA21420();
}

uint64_t sub_23CA1EE74()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1EEB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA21660();
  sub_23CA21510();
  sub_23CA214A0();
  sub_23CA2118C();
  sub_23CA21634();
  v0 = sub_23CA211F0();
  return sub_23CA210F4(v0, v1, v2);
}

uint64_t sub_23CA1EEF8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA1EF2C()
{
  return sub_23CA21104();
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA212CC();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA212A4();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA21290();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA212F4();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA212B8();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21204();
  sub_23CA21084();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA211AC(v0);
  sub_23CA210A4(v1);
  return sub_23CA212E0();
}

uint64_t sub_23CA1EF88()
{
  uint64_t v0;

  sub_23CA21238();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA21448(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA21418();
  v6[11] = v7;
  v6[12] = *(_QWORD *)(v7 - 8);
  v6[13] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA21448(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA21418();
  v6[11] = v7;
  v6[12] = *(_QWORD *)(v7 - 8);
  v6[13] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F000()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA215D4();
  sub_23CA1EF2C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  sub_23CA21470(v1);
  return sub_23CA21420();
}

uint64_t sub_23CA1F044()
{
  sub_23CA21258();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F080()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_23CA2164C();
  sub_23CA21510();
  sub_23CA214A0();
  sub_23CA2118C();
  v0 = (_QWORD *)sub_23CA213E0();
  v1 = sub_23CA211C4(v0);
  return sub_23CA21308(v1, v2, v3, v4, v5, v6);
}

uint64_t sub_23CA1F0D8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_23CA211BC(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_23CA1F120()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return sub_23CA20FB8();
}

{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA1F1A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  v2 = sub_23CA215E8(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)(v2, v3);
}

uint64_t sub_23CA1F1E4()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23CA21360();
  sub_23CA4B1BC();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  v1 = sub_23CA211F0();
  return sub_23CA210F4(v1, v2, v3);
}

uint64_t sub_23CA1F258()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA1F278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA212CC();
}

uint64_t sub_23CA1F2E8()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA20FFC();
  if (!v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F324()
{
  uint64_t v0;

  sub_23CA1F3D0(*(_QWORD *)(v0 + 16));
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

_QWORD *sub_23CA1F350(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *sub_23CA1F394(uint64_t *a1)
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

uint64_t sub_23CA1F3D0(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x24262A250);
  return result;
}

uint64_t sub_23CA1F418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA212A4();
}

uint64_t sub_23CA1F488()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA20FFC();
  if (!v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  sub_23CA214F8(a1, a2, a3, a4, a5, a6, a7);
  v8 = sub_23CA4B168();
  v7[8] = v8;
  v7[9] = *(_QWORD *)(v8 - 8);
  v7[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v7;
  uint64_t v8;

  sub_23CA214F8(a1, a2, a3, a4, a5, a6, a7);
  v8 = sub_23CA4B198();
  v7[8] = v8;
  v7[9] = *(_QWORD *)(v8 - 8);
  v7[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F508()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  sub_23CA21170(v1);
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)();
}

uint64_t sub_23CA1F548()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F584()
{
  uint64_t (*v0)(void);

  sub_23CA21614();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t sub_23CA1F5BC()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21324();
  sub_23CA21110();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21438(v0);
  sub_23CA20FC4(v1);
  sub_23CA21278();
  return sub_23CA4B228();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_23CA21324();
  sub_23CA21394(v1);
  v2 = sub_23CA4B168();
  v0[3] = v2;
  v0[4] = *(_QWORD *)(v2 - 8);
  v3 = sub_23CA20FEC();
  sub_23CA21560(v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  sub_23CA20FC4(v4);
  sub_23CA21278();
  return sub_23CA4B0FC();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21324();
  sub_23CA21110();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21438(v0);
  sub_23CA20FC4(v1);
  sub_23CA21278();
  return sub_23CA4B0F0();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_23CA21324();
  sub_23CA21394(v1);
  v2 = sub_23CA4B198();
  v0[3] = v2;
  v0[4] = *(_QWORD *)(v2 - 8);
  v3 = sub_23CA20FEC();
  sub_23CA21560(v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  sub_23CA20FC4(v4);
  sub_23CA21278();
  return sub_23CA4B0E4();
}

{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21324();
  sub_23CA21110();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21438(v0);
  sub_23CA20FC4(v1);
  sub_23CA21278();
  return sub_23CA4B0D8();
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(type:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA214E0(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA4B168();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA213B8(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA4B168();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA214E0(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA4B198();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v6;
  uint64_t v7;

  sub_23CA213B8(a1, a2, a3, a4, a5, a6);
  v7 = sub_23CA4B198();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F67C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21640(v0);
  v2 = sub_23CA21548(v1);
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v2, v3, v4, v5);
}

uint64_t sub_23CA1F6BC()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F6F8()
{
  uint64_t (*v0)(void);

  sub_23CA21614();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t sub_23CA1F730()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_23CA20FB8();
}

{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA1F774()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA214B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  sub_23CA2133C(v1);
  return sub_23CA4B228();
}

uint64_t sub_23CA1F7CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_23CA1F87C()
{
  sub_23CA21218();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1F8B8()
{
  uint64_t (*v0)(void);

  sub_23CA4B15C();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t sub_23CA1F8F4()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA1F96C()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  sub_23CA21170(v1);
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)();
}

uint64_t sub_23CA1F9AC()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t GenerativeConfigurationRunnable<>.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  sub_23CA21578(a1, a2, a3, a4);
  v5 = sub_23CA21418();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

{
  _QWORD *v4;
  uint64_t v5;

  sub_23CA21578(a1, a2, a3, a4);
  v5 = sub_23CA21418();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1FA8C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA1FB7C();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21640(v0);
  sub_23CA21530(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA1FADC()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1FB18()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA215C0();
  swift_getAssociatedConformanceWitness();
  sub_23CA4B1A4();
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA2131C();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA211BC(v1);
}

uint64_t sub_23CA1FB7C()
{
  return sub_23CA21104();
}

uint64_t sub_23CA1FBEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA21290();
}

uint64_t sub_23CA1FCB0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA1FD7C();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  sub_23CA21518(v1);
  return sub_23CA2142C();
}

uint64_t sub_23CA1FCF8()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1FD34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA21660();
  sub_23CA21510();
  sub_23CA2148C();
  sub_23CA2118C();
  sub_23CA21634();
  v0 = sub_23CA211F0();
  return sub_23CA210F4(v0, v1, v2);
}

uint64_t sub_23CA1FD7C()
{
  return sub_23CA21104();
}

uint64_t sub_23CA1FE2C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA215D4();
  sub_23CA1FD7C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  sub_23CA21470(v1);
  return sub_23CA2142C();
}

uint64_t sub_23CA1FE70()
{
  sub_23CA21258();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1FEAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_23CA2164C();
  sub_23CA21510();
  sub_23CA2148C();
  sub_23CA2118C();
  v0 = (_QWORD *)sub_23CA213E0();
  v1 = sub_23CA211C4(v0);
  return sub_23CA21308(v1, v2, v3, v4, v5, v6);
}

uint64_t sub_23CA1FF58()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  v2 = sub_23CA215E8(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)(v2, v3);
}

uint64_t sub_23CA1FF9C()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA1FFD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23CA21360();
  sub_23CA4B1A4();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  v1 = sub_23CA211F0();
  return sub_23CA210F4(v1, v2, v3);
}

uint64_t sub_23CA20024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA212F4();
}

uint64_t sub_23CA200A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA212B8();
}

uint64_t sub_23CA2016C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2025C();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21640(v0);
  sub_23CA21530(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA201BC()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA201F8()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA215C0();
  swift_getAssociatedConformanceWitness();
  sub_23CA4B204();
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA2131C();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA211BC(v1);
}

uint64_t sub_23CA2025C()
{
  return sub_23CA21104();
}

uint64_t sub_23CA202CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA21204();
  sub_23CA2101C();
  v0 = sub_23CA210E0();
  sub_23CA21464(v0);
  v1 = sub_23CA21148();
  sub_23CA21164(v1);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA2119C(v2);
  sub_23CA21064(v3);
  return sub_23CA212E0();
}

uint64_t sub_23CA20380()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_23CA213FC(v1);
  *v2 = v0;
  v2[1] = sub_23CA203D4;
  return GenerativeConfigurationRunnable<>.run<A>(returning:)();
}

uint64_t sub_23CA203D4()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA20410()
{
  uint64_t (*v0)(void);

  sub_23CA21608();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t GenerativeConfigurationRunnable<>.run<A>(returning:)()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA21324();
  sub_23CA215A8();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21438(v0);
  sub_23CA20FC4(v1);
  sub_23CA21278();
  return sub_23CA4B1E0();
}

uint64_t sub_23CA204EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA21640(v0);
  v2 = sub_23CA21548(v1);
  return GenerativeConfigurationRunnable<>.run<A>(returning:)(v2, v3, v4, v5);
}

uint64_t sub_23CA2052C()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA20568()
{
  uint64_t (*v0)(void);

  sub_23CA21608();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t sub_23CA205B8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA214B4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  sub_23CA2133C(v1);
  return sub_23CA4B1E0();
}

uint64_t sub_23CA20680()
{
  sub_23CA21218();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA206BC()
{
  uint64_t (*v0)(void);

  sub_23CA4B18C();
  sub_23CA21138();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v0);
}

uint64_t sub_23CA20744()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA213FC(v0);
  sub_23CA21170(v1);
  return GenerativeConfigurationRunnable<>.run<A>(type:returning:)();
}

uint64_t sub_23CA20784()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA20810()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23CA20818()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23CA208A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8;
  v10 = *(_QWORD *)(v6 + 64) + v8;
  v11 = *(_DWORD *)(v6 + 80) | v8;
  v12 = v11;
  v13 = v11 & 0x100000;
  if (v12 > 7 || v13 != 0 || (v10 & (unint64_t)~v9) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v17, ((unint64_t)a2 + v10) & v17, v5);
  }
  return v4;
}

uint64_t sub_23CA20974(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 32) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_23CA209CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_23CA20A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_23CA20AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_23CA20B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_23CA20B7C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;

  v5 = *(_QWORD *)(a3 + 32);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v6 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(unsigned __int8 *)(v9 + 80);
  v14 = v12 + v13;
  v15 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_23;
  v16 = (v14 & ~v13) + *(_QWORD *)(v9 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v8 >= v10)
        {
          v10 = v8;
        }
        else
        {
          a1 = (v14 + a1) & ~v13;
          v5 = v6;
        }
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, v10, v5);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_23;
LABEL_14:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if (!(_DWORD)v16)
    return v11 + v20 + 1;
  if (v16 <= 3)
    v21 = v16;
  else
    v21 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23CA20C58 + 4 * byte_23CA4C700[v21 - 1]))();
}

void sub_23CA20CCC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v12 = ((a3 - v7 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v7 < a2)
  {
    v11 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v13 = v11 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X14 }
}

void type metadata accessor for GenerativeConfigurationRunnable()
{
  JUMPOUT(0x24262A160);
}

uint64_t dispatch thunk of GenerativeResultDecodable.init(promptOutput:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  sub_23CA215A8();
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 8) + *(_QWORD *)(v6 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23CA1EF88;
  return v9(v5, v4, v3, v1, v0);
}

uint64_t sub_23CA20F80()
{
  return swift_task_switch();
}

uint64_t sub_23CA20F8C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA20F98()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 96) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA20FB8()
{
  return swift_task_switch();
}

uint64_t sub_23CA20FC4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *a1 = v3;
  a1[1] = v1;
  *(_QWORD *)(v5 + 16) = v2;
  return v4;
}

uint64_t sub_23CA20FEC()
{
  return swift_task_alloc();
}

uint64_t sub_23CA20FFC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  return swift_task_dealloc();
}

_QWORD *sub_23CA2101C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 32) + *(int *)(*(_QWORD *)(v0 + 24) + 52));
  return sub_23CA1F350(v1, v1[3]);
}

uint64_t sub_23CA21054(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA21064(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_23CA210A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = v1;
  return v3;
}

uint64_t sub_23CA210C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 88) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA210E0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA210F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_23CA21104()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA21138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23CA21148()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23CA21158@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t *sub_23CA21164(uint64_t a1)
{
  uint64_t *v1;

  v1[4] = a1;
  return sub_23CA1F394(v1);
}

uint64_t sub_23CA21170(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 80);
}

uint64_t sub_23CA2118C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23CA2119C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t sub_23CA211AC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t sub_23CA211BC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA211C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 32);
}

uint64_t sub_23CA211F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA21218()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA21238()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA21258()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 120) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA21290()
{
  return sub_23CA4B240();
}

uint64_t sub_23CA212A4()
{
  return sub_23CA4B210();
}

uint64_t sub_23CA212B8()
{
  return sub_23CA4B1D4();
}

uint64_t sub_23CA212CC()
{
  return sub_23CA4B1C8();
}

uint64_t sub_23CA212E0()
{
  return sub_23CA4B1F8();
}

uint64_t sub_23CA212F4()
{
  return sub_23CA4B1B0();
}

uint64_t sub_23CA21308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6();
}

uint64_t sub_23CA2131C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2133C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  *a1 = v2;
  a1[1] = v1;
  result = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v4 + 16) = v3;
  return result;
}

uint64_t sub_23CA21360()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  sub_23CA1F350((_QWORD *)(v0 + 16), v1);
  return v1;
}

uint64_t sub_23CA21394(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return 0;
}

uint64_t sub_23CA213B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[6] = a6;
  v7[7] = v6;
  v7[4] = a4;
  v7[5] = a5;
  v7[2] = a1;
  v7[3] = a3;
  return sub_23CA4B114();
}

uint64_t sub_23CA213D4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_23CA213E0()
{
  return swift_task_alloc();
}

uint64_t sub_23CA213FC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = result;
  return result;
}

uint64_t sub_23CA21408@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2);
}

uint64_t sub_23CA21418()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA21420()
{
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA2142C()
{
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA21438(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t sub_23CA21448(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = result;
  v7[5] = a3;
  v7[10] = *(_QWORD *)(a3 + 24);
  return result;
}

uint64_t sub_23CA21464(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t sub_23CA21470(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 104);
}

uint64_t sub_23CA2148C()
{
  return sub_23CA4B1A4();
}

uint64_t sub_23CA214A0()
{
  return sub_23CA4B1BC();
}

_QWORD *sub_23CA214B4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 48) + *(int *)(*(_QWORD *)(v0 + 24) + 52));
  return sub_23CA1F350(v1, v1[3]);
}

uint64_t sub_23CA214E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = v6;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return 0;
}

uint64_t sub_23CA214F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[6] = a7;
  v8[7] = v7;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  v8[3] = a4;
  return 0;
}

uint64_t sub_23CA21510()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23CA21518(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 80);
}

uint64_t sub_23CA21530(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 72);
}

uint64_t sub_23CA21548(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 72);
}

uint64_t sub_23CA21560(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t sub_23CA21578(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[4] = a4;
  v5[5] = v4;
  v5[2] = result;
  v5[3] = a3;
  v5[6] = *(_QWORD *)(a3 + 24);
  return result;
}

uint64_t sub_23CA215C0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_23CA215D4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t sub_23CA215E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_23CA215FC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_23CA21608()
{
  return sub_23CA4B18C();
}

uint64_t sub_23CA21614()
{
  return sub_23CA4B15C();
}

uint64_t sub_23CA21620(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = result;
  v3[7] = *(_QWORD *)(result + 24);
  return result;
}

uint64_t sub_23CA21634()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA21640(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = result;
  return result;
}

uint64_t sub_23CA2164C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t sub_23CA21660()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t CompletionPrompt.tokenCount<A>(with:)()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = swift_task_alloc();
  sub_23CA4B2D0();
  sub_23CA217E8(&qword_2543121E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0], MEMORY[0x24BE7A7D8]);
  sub_23CA2182C((uint64_t)sub_23CA21704);
  return sub_23CA4B258();
}

uint64_t sub_23CA21704(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t ChatMessagesPrompt.tokenCount<A>(with:)()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = swift_task_alloc();
  sub_23CA4B2F4();
  sub_23CA217E8(qword_256BED058, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0], MEMORY[0x24BE7A8A8]);
  sub_23CA2182C((uint64_t)sub_23CA21828);
  return sub_23CA4B21C();
}

uint64_t sub_23CA217E8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24262A1B4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA2182C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v2;
  v3[1] = a1;
  return v1;
}

uint64_t StreamSignal.valueOrThrow()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  v7 = *(_QWORD *)(a1 + 16);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v6, 1, v7) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a2, v6, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  v10 = type metadata accessor for StreamSignal.StreamSignalError(0, v7, v8, v9);
  MEMORY[0x24262A1B4](&unk_23CA4C870, v10);
  swift_allocError();
  return swift_willThrow();
}

uint64_t type metadata accessor for StreamSignal.StreamSignalError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StreamSignal.StreamSignalError);
}

uint64_t sub_23CA2195C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23CA21964()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_23CA219BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_23CA21A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return result;
}

void *sub_23CA21AD8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23CA21B68(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, 1, v5);
  v7 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *sub_23CA21C40(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23CA21CD0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a1, 1, v5);
  v7 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t sub_23CA21DA8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v15;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = v6 - 1;
  if (!(_DWORD)v6)
    v7 = 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (!(_DWORD)v6)
    ++v8;
  if (!a2)
    return 0;
  v9 = a2 - v7;
  if (a2 > v7)
  {
    v10 = 8 * v8;
    if (v8 > 3)
      goto LABEL_8;
    v12 = ((v9 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      v11 = *(_DWORD *)(a1 + v8);
      if (v11)
        goto LABEL_15;
    }
    else
    {
      if (v12 <= 0xFF)
      {
        if (v12 < 2)
          goto LABEL_22;
LABEL_8:
        v11 = *(unsigned __int8 *)(a1 + v8);
        if (!*(_BYTE *)(a1 + v8))
          goto LABEL_22;
LABEL_15:
        v13 = (v11 - 1) << v10;
        if (v8 > 3)
          v13 = 0;
        if ((_DWORD)v8)
        {
          if (v8 > 3)
            LODWORD(v8) = 4;
          __asm { BR              X12 }
        }
        return v7 + v13 + 1;
      }
      v11 = *(unsigned __int16 *)(a1 + v8);
      if (*(_WORD *)(a1 + v8))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v6 < 2)
    return 0;
  v15 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, v6, v4);
  if (v15 >= 2)
    return v15 - 1;
  else
    return 0;
}

void sub_23CA21ED4(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  size_t v11;
  char v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (!v8)
    v9 = 0;
  v10 = *(_QWORD *)(v7 + 64);
  if (v8)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = 8 * v11;
  v13 = a3 >= v9;
  v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        v6 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v6 = 2;
      }
      else
      {
        v6 = v15 > 1;
      }
    }
    else
    {
      v6 = 1u;
    }
  }
  if (v9 < a2)
  {
    v16 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v17 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v17;
          *((_BYTE *)a1 + 2) = BYTE2(v17);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v17;
        }
        else
        {
          *(_BYTE *)a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void sub_23CA22068()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23CA22070()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_23CA22094(uint64_t a1, uint64_t a2)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, *(_QWORD *)(a2 + 16));
}

uint64_t sub_23CA220A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, 1, *(_QWORD *)(a3 + 16));
}

uint64_t type metadata accessor for StreamSignal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StreamSignal);
}

uint64_t _s19GenerativeFunctions58_GenerativeFunctionOverridableInternals_ChatMessagesPromptV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t sub_23CA22110(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23CA22150 + 4 * byte_23CA4C79E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23CA22170 + 4 * byte_23CA4C7A3[v4]))();
}

_BYTE *sub_23CA22150(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23CA22170(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA22178(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA22180(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA22188(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA22190(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23CA2219C()
{
  return 0;
}

void sub_23CA221A4()
{
  JUMPOUT(0x24262A1B4);
}

uint64_t sub_23CA221B4()
{
  return 1;
}

uint64_t sub_23CA221BC()
{
  return sub_23CA4B738();
}

uint64_t sub_23CA221E0()
{
  sub_23CA4B72C();
  sub_23CA4B738();
  return sub_23CA4B744();
}

uint64_t sub_23CA22220()
{
  return sub_23CA221B4();
}

uint64_t sub_23CA22228()
{
  return sub_23CA221E0();
}

uint64_t sub_23CA22230()
{
  return sub_23CA221BC();
}

uint64_t sub_23CA22238()
{
  sub_23CA4B72C();
  sub_23CA221BC();
  return sub_23CA4B744();
}

uint64_t sub_23CA22288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24262A160](a1, v6, a5);
}

uint64_t dispatch thunk of static _GenerativeFunctionExtractable.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static _GenerativeFunctionExtractable.syntaxTree.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA22A60((void (*)(_QWORD))MEMORY[0x24BE7A7E0], a1);
}

uint64_t _GenerativeFunctionOverridableInternals_CompletionPrompt.init(prompt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA22AA0(a1, (void (*)(_QWORD))MEMORY[0x24BE7A7E0], a2);
}

uint64_t sub_23CA222DC()
{
  return 0;
}

uint64_t sub_23CA222E8()
{
  return 0x74706D6F7270;
}

void sub_23CA22300()
{
  sub_23CA226EC();
}

uint64_t sub_23CA22320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23CA22670(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23CA22348()
{
  return sub_23CA222DC();
}

uint64_t sub_23CA22360@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23CA221B4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23CA22388()
{
  sub_23CA224D4();
  return sub_23CA4B774();
}

uint64_t sub_23CA223B0()
{
  sub_23CA224D4();
  return sub_23CA4B780();
}

void _GenerativeFunctionOverridableInternals_CompletionPrompt.encode(to:)(_QWORD *a1)
{
  uint64_t v2;

  sub_23CA22494(&qword_256BED160);
  sub_23CA23274();
  MEMORY[0x24BDAC7A8](v2);
  sub_23CA1F350(a1, a1[3]);
  sub_23CA224D4();
  sub_23CA231D4();
  sub_23CA4B2D0();
  sub_23CA229B0(&qword_256BED170, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0], MEMORY[0x24BE7A7F0]);
  sub_23CA230F4();
  sub_23CA231AC();
  sub_23CA231F4();
}

uint64_t sub_23CA22494(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24262A19C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23CA224D4()
{
  unint64_t result;

  result = qword_256BED168;
  if (!qword_256BED168)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CC24, &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED168);
  }
  return result;
}

void _GenerativeFunctionOverridableInternals_CompletionPrompt.init(from:)(uint64_t a1@<X8>)
{
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
  uint64_t v11;

  sub_23CA23294(a1);
  v3 = sub_23CA4B2D0();
  v4 = sub_23CA23208(v3);
  MEMORY[0x24BDAC7A8](v4);
  sub_23CA23190(v5, v11);
  sub_23CA22494(&qword_256BED178);
  sub_23CA23260();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23CA23174();
  v8 = type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt(v7);
  MEMORY[0x24BDAC7A8](v8);
  sub_23CA1F350(v1, v1[3]);
  sub_23CA224D4();
  sub_23CA23144();
  if (!v2)
  {
    sub_23CA229B0(&qword_256BED180, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0], MEMORY[0x24BE7A7F8]);
    sub_23CA230D4();
    sub_23CA231C0();
    v9 = sub_23CA23118();
    sub_23CA23288(v9, v10, type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt);
  }
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v1);
  sub_23CA2315C();
}

uint64_t type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BED1B0);
}

void sub_23CA22630(uint64_t a1@<X8>)
{
  _GenerativeFunctionOverridableInternals_CompletionPrompt.init(from:)(a1);
}

void sub_23CA22644(_QWORD *a1)
{
  _GenerativeFunctionOverridableInternals_CompletionPrompt.encode(to:)(a1);
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.prompt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA22A60((void (*)(_QWORD))MEMORY[0x24BE7A8B0], a1);
}

uint64_t _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(prompt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA22AA0(a1, (void (*)(_QWORD))MEMORY[0x24BE7A8B0], a2);
}

uint64_t sub_23CA22670(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23CA4B6D8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23CA226EC()
{
  sub_23CA4B72C();
  sub_23CA232B4();
  sub_23CA4B744();
  sub_23CA232A8();
}

void sub_23CA2271C()
{
  sub_23CA4B72C();
  sub_23CA232B4();
  sub_23CA4B744();
  sub_23CA232A8();
}

uint64_t sub_23CA22748()
{
  sub_23CA22854();
  return sub_23CA4B774();
}

uint64_t sub_23CA22770()
{
  sub_23CA22854();
  return sub_23CA4B780();
}

void _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.encode(to:)(_QWORD *a1)
{
  uint64_t v2;

  sub_23CA22494(&qword_256BED188);
  sub_23CA23274();
  MEMORY[0x24BDAC7A8](v2);
  sub_23CA1F350(a1, a1[3]);
  sub_23CA22854();
  sub_23CA231D4();
  sub_23CA4B2F4();
  sub_23CA229B0(&qword_256BED198, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0], MEMORY[0x24BE7A8C0]);
  sub_23CA230F4();
  sub_23CA231AC();
  sub_23CA231F4();
}

unint64_t sub_23CA22854()
{
  unint64_t result;

  result = qword_256BED190;
  if (!qword_256BED190)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CBD4, &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED190);
  }
  return result;
}

void _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(from:)(uint64_t a1@<X8>)
{
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
  uint64_t v11;

  sub_23CA23294(a1);
  v3 = sub_23CA4B2F4();
  v4 = sub_23CA23208(v3);
  MEMORY[0x24BDAC7A8](v4);
  sub_23CA23190(v5, v11);
  sub_23CA22494(&qword_256BED1A0);
  sub_23CA23260();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23CA23174();
  v8 = type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(v7);
  MEMORY[0x24BDAC7A8](v8);
  sub_23CA1F350(v1, v1[3]);
  sub_23CA22854();
  sub_23CA23144();
  if (!v2)
  {
    sub_23CA229B0(&qword_256BED1A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0], MEMORY[0x24BE7A8C8]);
    sub_23CA230D4();
    sub_23CA231C0();
    v9 = sub_23CA23118();
    sub_23CA23288(v9, v10, type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt);
  }
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v1);
  sub_23CA2315C();
}

uint64_t type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BED1C0);
}

void sub_23CA229B0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24262A1B4](a3, v5), a1);
  }
  sub_23CA23110();
}

void sub_23CA229EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  sub_23CA23110();
}

void sub_23CA22A2C(uint64_t a1@<X8>)
{
  _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.init(from:)(a1);
}

void sub_23CA22A40(_QWORD *a1)
{
  _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.encode(to:)(a1);
}

uint64_t _GenerativeFunctionInternals_Metadata.functionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA22A60((void (*)(_QWORD))MEMORY[0x24BE3B708], a1);
}

uint64_t sub_23CA22A60@<X0>(void (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  a1(0);
  sub_23CA231E8();
  return sub_23CA230CC(a2, v2, v5, *(uint64_t (**)(void))(v4 + 16));
}

uint64_t _GenerativeFunctionInternals_Metadata.init(functionIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA22AA0(a1, (void (*)(_QWORD))MEMORY[0x24BE3B708], a2);
}

uint64_t sub_23CA22AA0@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  a2(0);
  sub_23CA231E8();
  return sub_23CA230CC(a3, a1, v6, *(uint64_t (**)(void))(v5 + 32));
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22C28(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t destroy for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2)
{
  return sub_23CA22C5C(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void initializeWithCopy for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void assignWithCopy for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void initializeWithTake for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void assignWithTake for _GenerativeFunctionOverridableInternals_CompletionPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D3C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22B28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA23240();
  v0 = sub_23CA23220();
  return sub_23CA230C4(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_CompletionPrompt()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA23240();
  v0 = sub_23CA23130();
  return sub_23CA230BC(v0, v1, v2, v3);
}

uint64_t sub_23CA22B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22E04(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0]);
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22C28(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t destroy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2)
{
  return sub_23CA22C5C(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void initializeWithCopy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void assignWithCopy for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void initializeWithTake for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void assignWithTake for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D3C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA23250();
  v0 = sub_23CA23220();
  return sub_23CA230C4(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22BF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA23250();
  v0 = sub_23CA23130();
  return sub_23CA230BC(v0, v1, v2, v3);
}

uint64_t sub_23CA22C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22E04(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0]);
}

uint64_t initializeBufferWithCopyOfBuffer for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22C28(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

uint64_t sub_23CA22C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(void);
  uint64_t v7;

  sub_23CA230AC(a1, a2, a3, a4);
  sub_23CA231E8();
  return sub_23CA230CC(v5, v4, v7, *v6);
}

uint64_t destroy for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2)
{
  return sub_23CA22C5C(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

uint64_t sub_23CA22C5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

void initializeWithCopy for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

void sub_23CA22C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  sub_23CA230AC(a1, a2, a3, a4);
  sub_23CA231E8();
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16));
  sub_23CA23110();
}

void assignWithCopy for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

void sub_23CA22CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  sub_23CA230AC(a1, a2, a3, a4);
  sub_23CA231E8();
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24));
  sub_23CA23110();
}

void initializeWithTake for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

void sub_23CA22D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = sub_23CA230AC(a1, a2, a3, a4);
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  sub_23CA23110();
}

void assignWithTake for _GenerativeFunctionInternals_Metadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA22D3C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE3B708]);
}

void sub_23CA22D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  sub_23CA230AC(a1, a2, a3, a4);
  sub_23CA231E8();
  sub_23CA21158(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  sub_23CA23110();
}

uint64_t getEnumTagSinglePayload for _GenerativeFunctionInternals_Metadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA23230();
  v0 = sub_23CA23220();
  return sub_23CA230C4(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for _GenerativeFunctionInternals_Metadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA22D98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA23230();
  v0 = sub_23CA23130();
  return sub_23CA230BC(v0, v1, v2, v3);
}

uint64_t type metadata accessor for _GenerativeFunctionInternals_Metadata(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BED1D0);
}

uint64_t sub_23CA22DC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23CA22DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA22E04(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE3B708]);
}

uint64_t sub_23CA22E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v5;

  result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys()
{
  return &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys;
}

uint64_t _s19GenerativeFunctions58_GenerativeFunctionOverridableInternals_ChatMessagesPromptV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23CA22EC4 + 4 * byte_23CA4C8E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23CA22EE4 + 4 * byte_23CA4C8E5[v4]))();
}

_BYTE *sub_23CA22EC4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23CA22EE4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA22EEC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA22EF4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA22EFC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA22F04(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys()
{
  return &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys;
}

unint64_t sub_23CA22F24()
{
  unint64_t result;

  result = qword_256BED1E0;
  if (!qword_256BED1E0)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CAF4, &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED1E0);
  }
  return result;
}

unint64_t sub_23CA22F64()
{
  unint64_t result;

  result = qword_256BED1E8;
  if (!qword_256BED1E8)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CBAC, &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED1E8);
  }
  return result;
}

unint64_t sub_23CA22FA4()
{
  unint64_t result;

  result = qword_256BED1F0;
  if (!qword_256BED1F0)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CB1C, &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED1F0);
  }
  return result;
}

unint64_t sub_23CA22FE4()
{
  unint64_t result;

  result = qword_256BED1F8;
  if (!qword_256BED1F8)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CB44, &type metadata for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED1F8);
  }
  return result;
}

unint64_t sub_23CA23024()
{
  unint64_t result;

  result = qword_256BED200;
  if (!qword_256BED200)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CA64, &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED200);
  }
  return result;
}

unint64_t sub_23CA23064()
{
  unint64_t result;

  result = qword_256BED208;
  if (!qword_256BED208)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4CA8C, &type metadata for _GenerativeFunctionOverridableInternals_CompletionPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256BED208);
  }
  return result;
}

uint64_t sub_23CA230AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t sub_23CA230BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, a3, a4);
}

uint64_t sub_23CA230C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, a3);
}

uint64_t sub_23CA230CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_23CA230D4()
{
  return sub_23CA4B6B4();
}

uint64_t sub_23CA230F4()
{
  return sub_23CA4B6C0();
}

uint64_t sub_23CA23118()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v1 - 104) + 32))(v0, *(_QWORD *)(v1 - 88), *(_QWORD *)(v1 - 72));
}

uint64_t sub_23CA23130()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA23144()
{
  return sub_23CA4B750();
}

uint64_t sub_23CA23174()
{
  return 0;
}

void sub_23CA23190(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23CA231AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23CA231C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23CA231D4()
{
  return sub_23CA4B75C();
}

uint64_t sub_23CA23208(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = result;
  *(_QWORD *)(v1 - 104) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t sub_23CA23220()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA23230()
{
  return sub_23CA4B174();
}

uint64_t sub_23CA23240()
{
  return sub_23CA4B2D0();
}

uint64_t sub_23CA23250()
{
  return sub_23CA4B2F4();
}

void sub_23CA23288(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23CA229EC(v3, *(_QWORD *)(v4 - 96), a3);
}

uint64_t sub_23CA23294@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return 0;
}

uint64_t sub_23CA232B4()
{
  return sub_23CA4B738();
}

uint64_t static _GenerativeFunctionOverrideHelpers._generateGenerativeFunctionOverride(promptBody:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA23328(a1, a2, a3, type metadata accessor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0], &qword_256BED210, (uint64_t)&protocol conformance descriptor for _GenerativeFunctionOverridableInternals_ChatMessagesPrompt);
}

{
  return sub_23CA23328(a1, a2, a3, type metadata accessor for _GenerativeFunctionOverridableInternals_CompletionPrompt, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0], &qword_256BED218, (uint64_t)&protocol conformance descriptor for _GenerativeFunctionOverridableInternals_CompletionPrompt);
}

uint64_t sub_23CA23328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(_QWORD), unint64_t *a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v19 = a2;
  v13 = a4(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  v16 = a5(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, a1, v16);
  sub_23CA4B09C();
  swift_allocObject();
  sub_23CA4B090();
  sub_23CA217E8(a6, a4, a7);
  sub_23CA4B084();
  sub_23CA23980();
  if (v7)
    return swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  return v19;
}

uint64_t sub_23CA23468(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA23958();
  sub_23CA4B36C();
  sub_23CA23944();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:bindingConfigurations:)(v0, v1, v2);
  return sub_23CA2390C();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23CA23958();
  sub_23CA22494(&qword_256BED220);
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_23CA23934();
  sub_23CA23934();
  v3 = sub_23CA23944();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)(v3, v2, v0, v1, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingVariables:bindingConfigurations:)(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  _QWORD v16[4];

  v16[2] = a3;
  v16[3] = a2;
  v16[1] = a1;
  v3 = sub_23CA4B360();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23CA4B2D0();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0];
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v16 - v13;
  sub_23CA4B2C4();
  sub_23CA217E8(&qword_2543121E0, v8, MEMORY[0x24BE7A7D8]);
  sub_23CA4B330();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23CA4B33C();
  v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  v15(v12, v7);
  sub_23CA4B348();
  v15(v14, v7);
  sub_23CA2391C();
}

void static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD v19[6];

  v19[4] = a5;
  v19[5] = a4;
  v19[2] = a2;
  v19[3] = a3;
  v19[1] = a1;
  v5 = sub_23CA4B360();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23CA4B2F4();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v19 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v19 - v17;
  sub_23CA4B2E8();
  sub_23CA217E8(qword_256BED058, v10, MEMORY[0x24BE7A8A8]);
  sub_23CA23974();
  sub_23CA4B330();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23CA23974();
  sub_23CA4B354();
  sub_23CA2396C((uint64_t)v13);
  sub_23CA23974();
  sub_23CA4B33C();
  sub_23CA2396C((uint64_t)v16);
  sub_23CA23974();
  sub_23CA4B348();
  sub_23CA2396C((uint64_t)v18);
  sub_23CA2391C();
}

uint64_t static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;

  v8 = sub_23CA4B36C();
  static _GenerativeFunctionOverrideHelpers._configurePrompt(_:withOverride:bindingChatMessagesPrompts:bindingVariables:bindingConfigurations:)(a1, a2, a3, v8, a4);
  return sub_23CA2390C();
}

ValueMetadata *type metadata accessor for _GenerativeFunctionOverrideHelpers()
{
  return &type metadata for _GenerativeFunctionOverrideHelpers;
}

uint64_t sub_23CA2390C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA23934()
{
  return sub_23CA4B36C();
}

uint64_t sub_23CA23944()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA2396C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA23980()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  return sub_23CA23468(v1, v0);
}

uint64_t sub_23CA23990()
{
  sub_23CA4B72C();
  sub_23CA221BC();
  return sub_23CA4B744();
}

uint64_t static GenerativeStream.makeStream(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  return sub_23CA20FB8();
}

uint64_t sub_23CA239DC()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;

  sub_23CA243C8();
  v2 = (_QWORD *)swift_task_alloc();
  v1[11] = (uint64_t)v2;
  *v2 = v1;
  v2[1] = sub_23CA23A34;
  return static GenerativeStream.makeStream(_:sanitizer:)(v1[7], v1[8], v0, v1[9], v1[10]);
}

uint64_t sub_23CA23A34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA243E0();
  sub_23CA2438C();
  *(_QWORD *)(v3 + 96) = v1;
  swift_task_dealloc();
  sub_23CA23C6C(v0);
  if (!v1)
    return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t static GenerativeStream.makeStream(_:sanitizer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = a5;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  sub_23CA23CAC(&qword_256BED240);
  sub_23CA4B5D0();
  v5[12] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA23AF0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  sub_23CA23CF0(*(_QWORD *)(v1 + 72), v1 + 16);
  type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  sub_23CA24424();
  *(_QWORD *)(v1 + 104) = sub_23CA243B8();
  sub_23CA24418();
  if (v0)
  {
    swift_release();
    sub_23CA243FC();
    return sub_23CA24340(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 112) = v3;
    *v3 = v1;
    v3[1] = sub_23CA23B90;
    return sub_23CA2434C(*(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88));
  }
}

uint64_t sub_23CA23B90()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 120) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA23BDC()
{
  uint64_t v0;

  sub_23CA4B108();
  sub_23CA243FC();
  return sub_23CA24340(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA23C34()
{
  uint64_t v0;

  swift_release();
  sub_23CA243FC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA23C6C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA22494(&qword_256BED238);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA23CAC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24262A1A8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23CA23CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23CA22494(&qword_256BED238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static GenerativeStream.makeSingleElementStream(_:produces:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = a5;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA23D50()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23CA243C8();
  v2 = (_QWORD *)swift_task_alloc();
  v1[12] = (uint64_t)v2;
  *v2 = v1;
  v2[1] = sub_23CA23DA8;
  return static GenerativeStream.makeSingleElementStream(_:produces:sanitizer:)(v1[7], v1[8], v3, v0, v1[10], v1[11]);
}

uint64_t sub_23CA23DA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA243E0();
  sub_23CA2438C();
  *(_QWORD *)(v3 + 104) = v1;
  swift_task_dealloc();
  sub_23CA23C6C(v0);
  if (!v1)
    return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA23DFC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static GenerativeStream.makeSingleElementStream(_:produces:sanitizer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[11] = a5;
  v6[12] = a6;
  v6[9] = a2;
  v6[10] = a4;
  v6[8] = a1;
  sub_23CA4B5F4();
  v6[13] = sub_23CA20FEC();
  sub_23CA23CAC(&qword_256BED240);
  sub_23CA24404();
  v7 = sub_23CA4B5D0();
  v6[14] = v7;
  v6[15] = *(_QWORD *)(v7 - 8);
  v6[16] = sub_23CA20FEC();
  sub_23CA24404();
  v8 = sub_23CA4B5B8();
  v6[17] = v8;
  v6[18] = *(_QWORD *)(v8 - 8);
  v6[19] = sub_23CA20FEC();
  sub_23CA21048();
  return swift_task_switch();
}

uint64_t sub_23CA23EB8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  sub_23CA23CF0(*(_QWORD *)(v1 + 80), v1 + 16);
  type metadata accessor for StreamingObjectTokenStreamProcessor(0);
  sub_23CA24424();
  *(_QWORD *)(v1 + 160) = sub_23CA243B8();
  sub_23CA24418();
  if (v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_23CA24384();
    return sub_23CA24340(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 168) = v3;
    *v3 = v1;
    v3[1] = sub_23CA23F70;
    return sub_23CA2434C(*(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96));
  }
}

uint64_t sub_23CA23F70()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 176) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA23FBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[15];
  v1 = v0[16];
  v3 = v0[14];
  sub_23CA4B4F8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[23] = v4;
  *v4 = v0;
  v4[1] = sub_23CA2404C;
  sub_23CA21048();
  return sub_23CA4B5A0();
}

uint64_t sub_23CA2404C()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 192) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA24098()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);

  v1 = v0[13];
  v2 = v0[11];
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v1, 1, v2) == 1)
  {
    v3 = v0[12];
    (*(void (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[19], v0[17]);
    v5 = _s21GenerativeStreamErrorOMa(0, v2, v3, v4);
    MEMORY[0x24262A1B4](&unk_23CA4CD50, v5);
    swift_allocError();
    swift_willThrow();
    swift_release();
  }
  else
  {
    v6 = v0[24];
    v7 = *(_QWORD *)(v2 - 8);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v7 + 32))(v0[8], v1, v2);
    sub_23CA4B528();
    if (!v6)
    {
      sub_23CA243A8();
      swift_release();
      sub_23CA24384();
      swift_task_dealloc();
      swift_task_dealloc();
      v10 = (uint64_t (*)(void))v0[1];
      return v10();
    }
    v8 = v0[11];
    v9 = v0[8];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
    sub_23CA243A8();
  }
  sub_23CA2435C();
  sub_23CA24384();
  sub_23CA243F4();
  v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_23CA241F8()
{
  uint64_t v0;

  swift_release();
  sub_23CA2435C();
  sub_23CA24384();
  sub_23CA243F4();
  return sub_23CA24340(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA24238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_23CA2435C();
  sub_23CA24384();
  sub_23CA243F4();
  return sub_23CA24340(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t _s21GenerativeStreamErrorOMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&_s21GenerativeStreamErrorOMn);
}

uint64_t sub_23CA2429C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23CA242A4(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23CA242E4 + 4 * asc_23CA4CCB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23CA24304 + 4 * byte_23CA4CCB5[v4]))();
}

_BYTE *sub_23CA242E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23CA24304(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA2430C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA24314(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23CA2431C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23CA24324(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23CA24330()
{
  JUMPOUT(0x24262A1B4);
}

uint64_t sub_23CA24340(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA2434C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3D404(a1, a2, a3, a4);
}

uint64_t sub_23CA2435C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2436C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA24378()
{
  return swift_task_switch();
}

uint64_t sub_23CA24384()
{
  return swift_task_dealloc();
}

void sub_23CA2438C()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
}

void sub_23CA24398()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_23CA243A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23CA243B8()
{
  uint64_t v0;

  return StreamingObjectTokenStreamProcessor.init(_:)(v0);
}

double sub_23CA243C8()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

void sub_23CA243E0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_23CA243F4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA243FC()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA24404()
{
  return 0;
}

uint64_t sub_23CA24418()
{
  uint64_t v0;

  return sub_23CA3C408(v0);
}

uint64_t sub_23CA24424()
{
  return swift_allocObject();
}

uint64_t *initializeBufferWithCopyOfBuffer for JsonObjectFieldContainer(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *(_QWORD *)a2;
    *a1 = *(_QWORD *)a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v12 = sub_23CA4B0CC();
      (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        return a1;
      }
      v8 = *(_QWORD *)a2;
      v9 = *((_QWORD *)a2 + 1);
      v10 = a2[16];
      sub_23CA24558(v8, v9, v10);
      *a1 = v8;
      a1[1] = v9;
      *((_BYTE *)a1 + 16) = v10;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23CA24558(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for JsonObjectFieldContainer(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v3 = sub_23CA4B0CC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    return sub_23CA245D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  }
  return result;
}

uint64_t sub_23CA245D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *initializeWithCopy for JsonObjectFieldContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v10 = sub_23CA4B0CC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_23CA24558(v7, v8, v9);
    *a1 = v7;
    a1[1] = v8;
    *((_BYTE *)a1 + 16) = v9;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for JsonObjectFieldContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_23CA247FC((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v10 = sub_23CA4B0CC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = *a2;
      v8 = a2[1];
      v9 = *((_BYTE *)a2 + 16);
      sub_23CA24558(v7, v8, v9);
      *a1 = v7;
      a1[1] = v8;
      *((_BYTE *)a1 + 16) = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23CA247FC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JsonObjectFieldContainer();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for JsonObjectFieldContainer()
{
  uint64_t result;

  result = qword_256BED2D8;
  if (!qword_256BED2D8)
    return swift_getSingletonMetadata();
  return result;
}

void *initializeWithTake for JsonObjectFieldContainer(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_23CA4B0CC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for JsonObjectFieldContainer(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23CA247FC((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_23CA4B0CC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23CA24A14()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23CA24A24()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23CA4B0CC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void JsonStreamDescriptor.fieldType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t JsonStreamDescriptor.fields.getter()
{
  return swift_bridgeObjectRetain();
}

GenerativeFunctions::JsonStreamDescriptor __swiftcall JsonStreamDescriptor.init(fieldType:fields:)(GenerativeFunctions::JsonObjectFieldType fieldType, Swift::OpaquePointer fields)
{
  uint64_t v2;
  GenerativeFunctions::JsonStreamDescriptor result;

  *(_BYTE *)v2 = *(_BYTE *)fieldType;
  *(Swift::OpaquePointer *)(v2 + 8) = fields;
  result.fields = fields;
  result.fieldType = fieldType;
  return result;
}

uint64_t static JsonStreamDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  int64_t v29;
  _BYTE v30[8];
  uint64_t v31;
  _BYTE v32[8];
  uint64_t v33;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(v2 + 16) != *(_QWORD *)(v3 + 16))
    return 0;
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_23CA24D08(v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    return 0;
  v6 = v2 + 64;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v2 + 64);
  v29 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v11 << 6);
      goto LABEL_22;
    }
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v14 >= v29)
      goto LABEL_29;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_29;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_29;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_21:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_22:
    if (!*(_QWORD *)(v3 + 16))
      goto LABEL_25;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v13);
    v18 = *(_QWORD *)(v2 + 56) + 16 * v13;
    v19 = *(_BYTE *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v22 = *v17;
    v21 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = sub_23CA25154(v22, v21);
    if ((v24 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_23CA25670();
      swift_bridgeObjectRelease();
      return 0;
    }
    v25 = *(_QWORD *)(v3 + 56) + 16 * v23;
    v26 = *(_BYTE *)v25;
    v27 = *(_QWORD *)(v25 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v32[0] = v19;
    v33 = v20;
    v30[0] = v26;
    v31 = v27;
    v28 = static JsonStreamDescriptor.== infix(_:_:)(v32, v30);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
LABEL_25:
      sub_23CA25670();
      return 0;
    }
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_29:
    sub_23CA25670();
    return 1;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_29;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_21;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23CA24D08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];

  sub_23CA25634(a2, v35);
  v3 = v35[0];
  v32 = v35[1];
  v4 = v35[2];
  v5 = v35[3];
  v6 = v35[4];
  sub_23CA25634(a1, v36);
  v7 = v36[0];
  v8 = v36[3];
  v9 = v36[4];
  v33 = (unint64_t)(v36[2] + 64) >> 6;
  v34 = (unint64_t)(v4 + 64) >> 6;
  v31 = v36[1];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v6)
    {
      v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_4;
    }
    v23 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v23 >= v34)
    {
      v6 = 0;
      v15 = 0;
      v14 = 0;
      goto LABEL_5;
    }
    v24 = *(_QWORD *)(v32 + 8 * v23);
    if (v24)
      goto LABEL_20;
    v27 = v5 + 2;
    if (v5 + 2 >= v34)
    {
      v6 = 0;
      v15 = 0;
      v14 = 0;
      ++v5;
      goto LABEL_5;
    }
    v24 = *(_QWORD *)(v32 + 8 * v27);
    if (v24)
      goto LABEL_29;
    if (v5 + 3 >= v34)
    {
LABEL_49:
      v6 = 0;
      v15 = 0;
      v14 = 0;
      v5 = v27;
      goto LABEL_5;
    }
    v24 = *(_QWORD *)(v32 + 8 * (v5 + 3));
    if (v24)
    {
      v23 = v5 + 3;
LABEL_20:
      v6 = (v24 - 1) & v24;
      v12 = __clz(__rbit64(v24)) + (v23 << 6);
      v5 = v23;
LABEL_4:
      v13 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v12);
      v15 = *v13;
      v14 = v13[1];
      result = swift_bridgeObjectRetain();
      goto LABEL_5;
    }
    v27 = v5 + 4;
    if (v5 + 4 >= v34)
    {
      v6 = 0;
      v15 = 0;
      v14 = 0;
      v5 += 3;
    }
    else
    {
      v24 = *(_QWORD *)(v32 + 8 * v27);
      if (v24)
      {
LABEL_29:
        v23 = v27;
        goto LABEL_20;
      }
      v23 = v5 + 5;
      if (v5 + 5 >= v34)
        goto LABEL_49;
      v24 = *(_QWORD *)(v32 + 8 * v23);
      if (v24)
        goto LABEL_20;
      v29 = v5 + 6;
      while (v29 < v34)
      {
        v24 = *(_QWORD *)(v32 + 8 * v29++);
        if (v24)
        {
          v23 = v29 - 1;
          goto LABEL_20;
        }
      }
      v6 = 0;
      v15 = 0;
      v14 = 0;
      v5 = v34 - 1;
    }
LABEL_5:
    if (v9)
    {
      v16 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v17 = v16 | (v8 << 6);
      goto LABEL_7;
    }
    v25 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_71;
    if (v25 >= v33)
    {
      v9 = 0;
      v20 = 0;
      v19 = 0;
      goto LABEL_8;
    }
    v26 = *(_QWORD *)(v31 + 8 * v25);
    if (v26)
      goto LABEL_24;
    v28 = v8 + 2;
    if (v8 + 2 >= v33)
    {
      v9 = 0;
      v20 = 0;
      v19 = 0;
      ++v8;
      goto LABEL_8;
    }
    v26 = *(_QWORD *)(v31 + 8 * v28);
    if (v26)
      goto LABEL_32;
    if (v8 + 3 >= v33)
    {
LABEL_58:
      v9 = 0;
      v20 = 0;
      v19 = 0;
      v8 = v28;
      goto LABEL_8;
    }
    v26 = *(_QWORD *)(v31 + 8 * (v8 + 3));
    if (v26)
    {
      v25 = v8 + 3;
LABEL_24:
      v9 = (v26 - 1) & v26;
      v17 = __clz(__rbit64(v26)) + (v25 << 6);
      v8 = v25;
LABEL_7:
      v18 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      v20 = *v18;
      v19 = v18[1];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    v28 = v8 + 4;
    if (v8 + 4 >= v33)
    {
      v9 = 0;
      v20 = 0;
      v19 = 0;
      v8 += 3;
    }
    else
    {
      v26 = *(_QWORD *)(v31 + 8 * v28);
      if (v26)
      {
LABEL_32:
        v25 = v28;
        goto LABEL_24;
      }
      v25 = v8 + 5;
      if (v8 + 5 >= v33)
        goto LABEL_58;
      v26 = *(_QWORD *)(v31 + 8 * v25);
      if (v26)
        goto LABEL_24;
      v30 = v8 + 6;
      while (v30 < v33)
      {
        v26 = *(_QWORD *)(v31 + 8 * v30++);
        if (v26)
        {
          v25 = v30 - 1;
          goto LABEL_24;
        }
      }
      v9 = 0;
      v20 = 0;
      v19 = 0;
      v8 = v33 - 1;
    }
LABEL_8:
    if (!v14)
    {
      swift_release();
      swift_release();
      if (!v19)
        return 1;
      goto LABEL_66;
    }
    if (!v19)
    {
      swift_release();
      swift_release();
LABEL_66:
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v15 == v20 && v14 == v19)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v22 = sub_23CA4B6D8();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        swift_release();
        swift_release();
        return 0;
      }
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

unint64_t sub_23CA25154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23CA4B72C();
  swift_bridgeObjectRetain();
  sub_23CA4B3F0();
  swift_bridgeObjectRelease();
  v4 = sub_23CA4B744();
  return sub_23CA253DC(a1, a2, v4);
}

uint64_t initializeBufferWithCopyOfBuffer for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for JsonStreamField()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for JsonStreamField(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for JsonStreamDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonStreamField(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JsonStreamField(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for JsonStreamDescriptor()
{
  return &type metadata for JsonStreamDescriptor;
}

unint64_t sub_23CA25314(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23CA4B72C();
  sub_23CA4B3F0();
  v4 = sub_23CA4B744();
  return sub_23CA253DC(a1, a2, v4);
}

unint64_t sub_23CA25378(uint64_t a1)
{
  uint64_t v2;

  sub_23CA4B0CC();
  sub_23CA255F4(&qword_256BED2E8, MEMORY[0x24BDCEA88]);
  v2 = sub_23CA4B378();
  return sub_23CA254BC(a1, v2);
}

unint64_t sub_23CA253DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23CA4B6D8() & 1) == 0)
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
      while (!v14 && (sub_23CA4B6D8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23CA254BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_23CA4B0CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_23CA255F4(&qword_256BED2F0, MEMORY[0x24BDCEA98]);
      v14 = sub_23CA4B3C0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_23CA255F4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23CA4B0CC();
    result = MEMORY[0x24262A1B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA25634@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_23CA25670()
{
  return swift_release();
}

uint64_t JsonObjectFieldType.hash(into:)()
{
  return sub_23CA4B738();
}

BOOL static JsonObjectFieldType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void JsonObjectFieldType.hashValue.getter()
{
  sub_23CA28110();
  sub_23CA4B738();
  sub_23CA280F4();
  sub_23CA232A8();
}

uint64_t sub_23CA256F0()
{
  sub_23CA4B72C();
  sub_23CA4B738();
  return sub_23CA4B744();
}

void static JsonValueContainer.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_23CA25774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v13;
  uint64_t v14;

  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_23CA24558(v0, v1, v5);
    v6 = sub_23CA28040();
    v8 = sub_23CA28020(v6, v7, v4);
    sub_23CA245D8(v8, v9, v5);
    v10 = 0;
  }
  else
  {
    if (v2 == v0 && v3 == v1)
    {
      v10 = 1;
    }
    else
    {
      sub_23CA28040();
      v10 = sub_23CA28018();
    }
    sub_23CA24558(v0, v1, 0);
    sub_23CA24558(v2, v3, 0);
    v13 = sub_23CA28020(v2, v3, 0);
    sub_23CA245D8(v13, v14, 0);
  }
  return v10 & 1;
}

void static JsonStreamEvent.== infix(_:_:)(uint64_t a1, char *a2)
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
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  _QWORD v49[20];
  uint64_t v50;
  char *v51;

  v50 = a1;
  v51 = a2;
  v49[0] = sub_23CA280A0();
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v2);
  sub_23CA2804C();
  v49[14] = v3;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v4);
  v49[15] = (char *)v49 - v5;
  v6 = sub_23CA2806C();
  v49[18] = *(_QWORD *)(v6 - 8);
  v49[19] = v6;
  MEMORY[0x24BDAC7A8](v6);
  sub_23CA2804C();
  v49[11] = v7;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v8);
  sub_23CA27FC0();
  v49[12] = v9;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v10);
  sub_23CA27FC0();
  v49[13] = v11;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v12);
  sub_23CA27FC0();
  v49[8] = v13;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v14);
  sub_23CA27FC0();
  v49[9] = v15;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v16);
  sub_23CA27FC0();
  v49[10] = v17;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v18);
  sub_23CA27FC0();
  v49[4] = v19;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v20);
  sub_23CA27FC0();
  v49[3] = v21;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v22);
  sub_23CA27FC0();
  v49[7] = v23;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v24);
  sub_23CA27FC0();
  v49[6] = v25;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v26);
  sub_23CA27FC0();
  v49[5] = v27;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v28);
  sub_23CA27FC0();
  v49[2] = v29;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v30);
  v49[1] = (char *)v49 - v31;
  type metadata accessor for JsonStreamEvent(0);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v32);
  sub_23CA2804C();
  v49[17] = v33;
  sub_23CA27FB4();
  MEMORY[0x24BDAC7A8](v34);
  sub_23CA27FC0();
  v49[16] = v35;
  sub_23CA27FB4();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v38 = MEMORY[0x24BDAC7A8](v37);
  v39 = MEMORY[0x24BDAC7A8](v38);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v41 = MEMORY[0x24BDAC7A8](v40);
  v42 = MEMORY[0x24BDAC7A8](v41);
  MEMORY[0x24BDAC7A8](v42);
  sub_23CA22494(&qword_256BED2F8);
  sub_23CA280A8();
  v44 = MEMORY[0x24BDAC7A8](v43);
  v46 = (char *)v49 + *(int *)(v44 + 48) - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA26528(v50, (uint64_t)v49 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0));
  v47 = (uint64_t)v51;
  v51 = v46;
  sub_23CA26528(v47, (uint64_t)v46);
  v48 = (char *)sub_23CA25C3C + 4 * word_23CA4CE36[sub_23CA27FE0()];
  __asm { BR              X10 }
}

uint64_t sub_23CA25C3C()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23CA26528(v2, v1);
  if (sub_23CA27FA4())
  {
    sub_23CA28060();
    v4(v1, *(_QWORD *)(v3 - 168));
    sub_23CA2656C(v2);
    v0 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(v3 - 176);
    v6 = *(_QWORD *)(v3 - 168);
    sub_23CA28004(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v5 + 32));
    sub_23CA280FC();
    sub_23CA27FF0();
    v7 = ((uint64_t (*)(uint64_t, uint64_t))v5)(v1, v6);
    sub_23CA280D8(v7, type metadata accessor for JsonStreamEvent);
  }
  return v0 & 1;
}

uint64_t static JsonStreamField.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23CA4B6D8();
}

uint64_t static JsonFieldValueEvent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  __int128 v16;
  char v17;

  if ((sub_23CA4B0B4() & 1) == 0)
    goto LABEL_9;
  v4 = (int *)sub_23CA280A0();
  v5 = v4[5];
  v6 = *(_QWORD *)(a1 + v5);
  v7 = *(_QWORD *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (v10 = sub_23CA28018(), v11 = 0, (v10 & 1) != 0))
  {
    v12 = v4[6];
    v13 = *(_BYTE *)(a1 + v12 + 16);
    v16 = *(_OWORD *)(a1 + v12);
    v17 = v13;
    static JsonValueContainer.== infix(_:_:)((uint64_t)&v16);
    if ((v14 & 1) != 0)
    {
      v11 = *(_BYTE *)(a1 + v4[7]) ^ *(_BYTE *)(a2 + v4[7]) ^ 1;
      return v11 & 1;
    }
LABEL_9:
    v11 = 0;
  }
  return v11 & 1;
}

uint64_t type metadata accessor for JsonFieldValueEvent(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BED338);
}

uint64_t type metadata accessor for JsonStreamEvent(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BED328);
}

uint64_t sub_23CA26528(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JsonStreamEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CA2656C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA22494(&qword_256BED2F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA265AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for JsonFieldValueEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t JsonFieldValueEvent.objectID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23CA2806C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t JsonFieldValueEvent.field.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for JsonFieldValueEvent(0) + 20));
  v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t JsonFieldValueEvent.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = v1 + *(int *)(sub_23CA280A0() + 24);
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_BYTE *)(v3 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  return sub_23CA24558(v4, v5, v6);
}

uint64_t JsonFieldValueEvent.isArrayElement.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(sub_23CA280A0() + 28));
}

int *JsonFieldValueEvent.init(objectID:field:value:isArrayElement:)@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  int *result;
  _QWORD *v14;
  uint64_t v15;

  v6 = *a1;
  v7 = a1[1];
  v8 = *a2;
  v9 = a2[1];
  v10 = *((_BYTE *)a2 + 16);
  sub_23CA2806C();
  v11 = sub_23CA28104();
  v12(v11);
  result = (int *)type metadata accessor for JsonFieldValueEvent(0);
  v14 = (_QWORD *)(a4 + result[5]);
  *v14 = v6;
  v14[1] = v7;
  v15 = a4 + result[6];
  *(_QWORD *)v15 = v8;
  *(_QWORD *)(v15 + 8) = v9;
  *(_BYTE *)(v15 + 16) = v10;
  *(_BYTE *)(a4 + result[7]) = a3;
  return result;
}

GenerativeFunctions::JsonStreamField __swiftcall JsonStreamField.init(name:)(GenerativeFunctions::JsonStreamField name)
{
  GenerativeFunctions::JsonStreamField *v1;

  *v1 = name;
  return name;
}

void static JsonStreamField.root.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t JsonStreamField.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23CA28098();
  return v1;
}

uint64_t JsonStreamField.hash(into:)()
{
  sub_23CA28098();
  sub_23CA4B3F0();
  return swift_bridgeObjectRelease();
}

void JsonStreamField.hashValue.getter()
{
  sub_23CA28110();
  sub_23CA28098();
  sub_23CA280B8();
  sub_23CA28090();
  sub_23CA280F4();
  sub_23CA232A8();
}

void sub_23CA267F8()
{
  sub_23CA4B72C();
  sub_23CA28098();
  sub_23CA280B8();
  sub_23CA28090();
  sub_23CA280F4();
  sub_23CA232A8();
}

unint64_t sub_23CA26830()
{
  unint64_t result;

  result = qword_256BED318;
  if (!qword_256BED318)
  {
    result = MEMORY[0x24262A1B4](&protocol conformance descriptor for JsonObjectFieldType, &type metadata for JsonObjectFieldType);
    atomic_store(result, (unint64_t *)&qword_256BED318);
  }
  return result;
}

unint64_t sub_23CA26870()
{
  unint64_t result;

  result = qword_256BED320;
  if (!qword_256BED320)
  {
    result = MEMORY[0x24262A1B4](&protocol conformance descriptor for JsonStreamField, &type metadata for JsonStreamField);
    atomic_store(result, (unint64_t *)&qword_256BED320);
  }
  return result;
}

void type metadata accessor for JsonNull()
{
  sub_23CA28088();
}

_BYTE *initializeBufferWithCopyOfBuffer for JsonObjectFieldType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JsonObjectFieldType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JsonObjectFieldType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23CA2699C + 4 * byte_23CA4CE4D[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23CA269D0 + 4 * byte_23CA4CE48[v4]))();
}

uint64_t sub_23CA269D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CA269D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23CA269E0);
  return result;
}

uint64_t sub_23CA269EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23CA269F4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23CA269F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CA26A00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23CA26A0C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23CA26A14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for JsonObjectFieldType()
{
  sub_23CA28088();
}

uint64_t destroy for JsonValueContainer(uint64_t a1)
{
  return sub_23CA245D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s19GenerativeFunctions18JsonValueContainerOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA24558(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA24558(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23CA245D8(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for JsonValueContainer(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JsonValueContainer(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23CA245D8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonValueContainer(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4)
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

uint64_t storeEnumTagSinglePayload for JsonValueContainer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23CA26BB4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_23CA26BCC(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

void type metadata accessor for JsonValueContainer()
{
  sub_23CA28088();
}

uint64_t initializeBufferWithCopyOfBuffer for JsonStreamEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23CA26C4C + 4 * byte_23CA4CE52[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for JsonStreamEvent(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 5:
    case 6:
      v3 = sub_23CA4B0CC();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 2:
    case 3:
      v4 = sub_23CA4B0CC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      sub_23CA22494(&qword_256BED310);
      goto LABEL_5;
    case 4:
      v8 = sub_23CA4B0CC();
      v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
      v9(a1, v8);
      v10 = a1 + *(int *)(sub_23CA22494(&qword_256BED308) + 48);
      v9(v10, v8);
      v11 = type metadata accessor for JsonFieldValueEvent(0);
      swift_bridgeObjectRelease();
      result = sub_23CA245D8(*(_QWORD *)(v10 + *(int *)(v11 + 24)), *(_QWORD *)(v10 + *(int *)(v11 + 24) + 8), *(_BYTE *)(v10 + *(int *)(v11 + 24) + 16));
      break;
    case 7:
    case 8:
      v5 = sub_23CA4B0CC();
      v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
      v6(a1, v5);
      v7 = sub_23CA22494(&qword_256BED300);
      v6(a1 + *(int *)(v7 + 48), v5);
LABEL_5:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for JsonStreamEvent()
{
  char *v0;

  v0 = (char *)sub_23CA2715C + 4 * byte_23CA4CE64[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23CA2715C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for JsonStreamEvent(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23CA23468(result, type metadata accessor for JsonStreamEvent);
    v2 = (char *)&loc_23CA2735C + 4 * byte_23CA4CE6D[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for JsonStreamEvent()
{
  char *v0;

  v0 = (char *)sub_23CA27550 + 4 * byte_23CA4CE76[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23CA27550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for JsonStreamEvent(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23CA23468(result, type metadata accessor for JsonStreamEvent);
    v2 = (char *)&loc_23CA2771C + 4 * byte_23CA4CE7F[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23CA27880()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  result = sub_23CA4B0CC();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8) + 64;
    v9 = v2;
    v10 = v2;
    swift_getTupleTypeLayout2();
    v11 = &v8;
    swift_getTupleTypeLayout2();
    v12 = &v7;
    result = type metadata accessor for JsonFieldValueEvent(319);
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v13 = &v6;
      v14 = v2;
      v15 = v2;
      swift_getTupleTypeLayout3();
      v16 = &v5;
      swift_getTupleTypeLayout3();
      v17 = &v4;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for JsonFieldValueEvent(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23CA4B0CC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = *(_QWORD *)((char *)a2 + v9);
    v15 = *(_QWORD *)((char *)a2 + v9 + 8);
    v16 = *((_BYTE *)a2 + v9 + 16);
    swift_bridgeObjectRetain();
    sub_23CA24558(v14, v15, v16);
    *(_QWORD *)v13 = v14;
    *((_QWORD *)v13 + 1) = v15;
    v13[16] = v16;
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return a1;
}

uint64_t destroy for JsonFieldValueEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  return sub_23CA245D8(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 16));
}

uint64_t initializeWithCopy for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = *(_QWORD *)(a2 + v8);
  v14 = *(_QWORD *)(a2 + v8 + 8);
  v15 = *(_BYTE *)(a2 + v8 + 16);
  swift_bridgeObjectRetain();
  sub_23CA24558(v13, v14, v15);
  *(_QWORD *)v12 = v13;
  *(_QWORD *)(v12 + 8) = v14;
  *(_BYTE *)(v12 + 16) = v15;
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithCopy for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)v12;
  v14 = *(_QWORD *)(v12 + 8);
  v15 = *(_BYTE *)(v12 + 16);
  sub_23CA24558(*(_QWORD *)v12, v14, v15);
  v16 = *(_QWORD *)v11;
  v17 = *(_QWORD *)(v11 + 8);
  *(_QWORD *)v11 = v13;
  *(_QWORD *)(v11 + 8) = v14;
  v18 = *(_BYTE *)(v11 + 16);
  *(_BYTE *)(v11 + 16) = v15;
  sub_23CA245D8(v16, v17, v18);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for JsonFieldValueEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_BYTE *)(v14 + 16);
  v16 = *(_QWORD *)v13;
  v17 = *(_QWORD *)(v13 + 8);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v18 = *(_BYTE *)(v13 + 16);
  *(_BYTE *)(v13 + 16) = v15;
  sub_23CA245D8(v16, v17, v18);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonFieldValueEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA27D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_23CA2806C();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for JsonFieldValueEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA27DFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_23CA2806C();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23CA27E70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23CA4B0CC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for JsonStreamField(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for JsonStreamField(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for JsonStreamField(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for JsonStreamField()
{
  sub_23CA28088();
}

uint64_t sub_23CA27FA4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23CA27FCC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_23CA27FD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_23CA27FE0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23CA27FE8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA27FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23CA28004@<X0>(uint64_t (*a1)(_QWORD, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(*(_QWORD *)(v1 - 256), v2, v3);
}

uint64_t sub_23CA28018()
{
  return sub_23CA4B6D8();
}

uint64_t sub_23CA28020(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_23CA245D8(a1, a2, a3);
  return v3;
}

uint64_t sub_23CA28038()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA28040()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA2806C()
{
  return sub_23CA4B0CC();
}

uint64_t sub_23CA28074@<X0>(uint64_t (*a1)(_QWORD, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(*(_QWORD *)(v1 - 256), v2, v3);
}

uint64_t sub_23CA28090()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA28098()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA280A0()
{
  return type metadata accessor for JsonFieldValueEvent(0);
}

uint64_t sub_23CA280B8()
{
  return sub_23CA4B3F0();
}

uint64_t sub_23CA280C8(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  return sub_23CA23468(a1, v1);
}

uint64_t sub_23CA280D0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA280D8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  return sub_23CA23468(v2, a2);
}

uint64_t sub_23CA280E0()
{
  return sub_23CA4B0B4();
}

uint64_t sub_23CA280EC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t sub_23CA280F4()
{
  return sub_23CA4B744();
}

uint64_t sub_23CA280FC()
{
  return sub_23CA4B0B4();
}

uint64_t sub_23CA28104()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA28110()
{
  return sub_23CA4B72C();
}

uint64_t sub_23CA2811C(uint64_t a1)
{
  uint64_t v1;

  return sub_23CA26528(a1, v1);
}

uint64_t sub_23CA28124()
{
  return sub_23CA4B0B4();
}

uint64_t sub_23CA2812C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void sub_23CA28134()
{
  qword_256BED348 = 0x24746F6F7224;
  unk_256BED350 = 0xE600000000000000;
}

uint64_t sub_23CA28154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v1 + 16 * v2 + 16);
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_23CA281B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 120);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = sub_23CA4B0CC();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, v3+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, v7, 1, v6);
}

uint64_t sub_23CA28250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 120);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = v4 - 1;
    v6 = sub_23CA4B0CC();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, v3+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * v5, v6);
    v7 = a1;
    v8 = 0;
    v9 = v6;
  }
  else
  {
    v9 = sub_23CA4B0CC();
    v7 = a1;
    v8 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v7, v8, 1, v9);
}

uint64_t sub_23CA2830C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  sub_23CA21048();
  return swift_task_switch();
}

uint64_t sub_23CA28328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 88);
  v3 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v3;
  v4 = *(_BYTE *)(v1 + 104);
  v5 = *(_BYTE *)(v1 + 80);
  *(_BYTE *)(v1 + 80) = v4;
  sub_23CA2B7A8(v2, v3, v4);
  v6 = sub_23CA2C19C();
  sub_23CA2B724(v6, v7, v5);
  sub_23CA2BCE8();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v8;
  *v8 = v0;
  v8[1] = sub_23CA283CC;
  return sub_23CA2C798(v0 + 40);
}

uint64_t sub_23CA283CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_endAccess();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA2842C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_BYTE *)(v0 + 56);
  v3 = *(_QWORD *)(v1 + 88);
  v4 = *(_QWORD *)(v1 + 96);
  *(_OWORD *)(v1 + 88) = *(_OWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v1 + 104);
  *(_BYTE *)(v1 + 104) = v2;
  sub_23CA2B724(v3, v4, v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23CA28474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  _DWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  swift_endAccess();
  if (qword_256BECF00 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v2 = sub_23CA2BEDC();
  sub_23CA2B764(v2, (uint64_t)qword_256BEF048);
  MEMORY[0x24262A124](v1);
  MEMORY[0x24262A124](v1);
  v3 = sub_23CA4B2A0();
  v4 = sub_23CA4B5E8();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 88);
  if (v5)
  {
    v7 = (_DWORD *)sub_23CA2BCB4();
    v8 = (_QWORD *)sub_23CA2BCB4();
    *v7 = 138412290;
    MEMORY[0x24262A124](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v9;
    sub_23CA2C1BC();
    *v8 = v9;
    sub_23CA2C10C();
  }
  sub_23CA2C10C();
}

uint64_t sub_23CA28620()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_23CA2866C;
  return sub_23CA28760(0);
}

uint64_t sub_23CA2866C()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 32) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA286B8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  sub_23CA1F350((_QWORD *)(*(_QWORD *)(v0 + 16) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48));
  v1 = sub_23CA2C160();
  v2(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2870C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_23CA1F350((_QWORD *)(*(_QWORD *)(v0 + 16) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48));
  sub_23CA2BEB4();
  MEMORY[0x24262A118](v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA28760(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 312) = v1;
  *(_BYTE *)(v2 + 257) = a1;
  sub_23CA22494(&qword_256BED368);
  *(_QWORD *)(v2 + 320) = swift_task_alloc();
  *(_QWORD *)(v2 + 328) = swift_task_alloc();
  *(_QWORD *)(v2 + 336) = swift_task_alloc();
  *(_QWORD *)(v2 + 344) = type metadata accessor for JsonStreamEvent(0);
  *(_QWORD *)(v2 + 352) = swift_task_alloc();
  *(_QWORD *)(v2 + 360) = swift_task_alloc();
  *(_QWORD *)(v2 + 368) = swift_task_alloc();
  v3 = sub_23CA4B0CC();
  *(_QWORD *)(v2 + 376) = v3;
  *(_QWORD *)(v2 + 384) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 392) = swift_task_alloc();
  *(_QWORD *)(v2 + 400) = swift_task_alloc();
  *(_QWORD *)(v2 + 408) = swift_task_alloc();
  *(_QWORD *)(v2 + 416) = swift_task_alloc();
  *(_QWORD *)(v2 + 424) = swift_task_alloc();
  *(_QWORD *)(v2 + 432) = swift_task_alloc();
  *(_QWORD *)(v2 + 440) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA28890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  void (*v24)(uint64_t);
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
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  unint64_t v52;
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
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  void (*v84)(uint64_t, uint64_t, uint64_t);
  void (*v85)(unint64_t);
  uint64_t v86;
  unint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t *v97;
  uint64_t *v98;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 448) = v2;
  v3 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)(v0 + 456) = v3;
  v4 = *(unsigned __int8 *)(v1 + 80);
  *(_BYTE *)(v0 + 258) = v4;
  if ((v4 - 5) < 2)
  {
    sub_23CA2C0DC();
    sub_23CA4B648();
    *(_QWORD *)(v0 + 264) = 0;
    *(_QWORD *)(v0 + 272) = 0xE000000000000000;
    sub_23CA4B420();
    *(_QWORD *)(v0 + 240) = v2;
    *(_QWORD *)(v0 + 248) = v3;
    *(_BYTE *)(v0 + 256) = v4;
    sub_23CA4B66C();
    sub_23CA2B724(v2, v3, v4);
    v11 = *(_QWORD *)(v0 + 264);
    v10 = *(_QWORD *)(v0 + 272);
    sub_23CA2B904();
    v96 = sub_23CA2BC74();
    *v12 = v11;
    v12[1] = v10;
    sub_23CA2BE88(v96, (uint64_t)v12);
    swift_task_dealloc();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    sub_23CA2BDB0();
    sub_23CA2BDC8();
    sub_23CA2BDC0();
    sub_23CA2BDB8();
    sub_23CA2131C();
    sub_23CA2BF98();
    sub_23CA2BE30();
    sub_23CA2C1F0();
    v9 = *(uint64_t (**)(void))(v0 + 8);
    return sub_23CA2BD40(v9);
  }
  if (v4 != 7)
  {
    if (v4 == 255)
    {
      if (qword_256BECF00 != -1)
        swift_once();
      v5 = sub_23CA2BEDC();
      sub_23CA2B764(v5, (uint64_t)qword_256BEF048);
      v6 = sub_23CA4B2A0();
      v7 = sub_23CA4B5DC();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)sub_23CA2BCB4();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_23CA1D000, v6, v7, "Reached end of stream", v8, 2u);
        sub_23CA2BBDC();
      }

      sub_23CA2BCF4();
      sub_23CA2131C();
      sub_23CA24384();
      sub_23CA243F4();
      sub_23CA2BD80();
      sub_23CA2BD5C();
      sub_23CA2BDB0();
      sub_23CA2BDC8();
      sub_23CA2BDC0();
      sub_23CA2BDB8();
      sub_23CA2BE30();
      sub_23CA2C1F0();
      swift_task_dealloc();
      v9 = (uint64_t (*)(void))sub_23CA213D4();
      return sub_23CA2BD40(v9);
    }
    goto LABEL_16;
  }
  if (!(v2 ^ 2 | v3))
  {
    v23 = *(_QWORD *)(v0 + 336);
    sub_23CA2C1C4();
    sub_23CA3BCE4(*(_QWORD *)(v1 + 120), v23);
    v24 = *(void (**)(uint64_t))(v1 + 136);
    sub_23CA2C0EC();
    v25 = swift_retain();
    v24(v25);
    swift_release();
    v26 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 16);
    *(_QWORD *)(v0 + 496) = v26;
    v98 = (uint64_t *)(v1 + 120);
    if (v26)
    {
      v27 = *(_QWORD *)(v0 + 376);
      v29 = *(_QWORD *)(v0 + 328);
      v28 = *(_QWORD *)(v0 + 336);
      v30 = sub_23CA2C13C();
      sub_23CA2B7BC(v30, v0 + 56);
      v93 = *(_QWORD *)(v0 + 88);
      v94 = *(_QWORD *)(v0 + 80);
      sub_23CA1F350((_QWORD *)(v0 + 56), v94);
      sub_23CA2B800(v28, v29);
      result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v29, 1, v27);
      if ((_DWORD)result == 1)
      {
        __break(1u);
      }
      else
      {
        v31 = *(_QWORD *)(v0 + 408);
        v33 = *(_QWORD *)(v0 + 376);
        v32 = *(_QWORD *)(v0 + 384);
        v34 = *(_QWORD *)(v0 + 360);
        v35 = *(_QWORD *)(v0 + 328);
        v36 = sub_23CA22494(&qword_256BED300);
        v37 = v34 + *(int *)(v36 + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v34, v35, v33);
        v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
        v38(v37, v31, v33);
        result = sub_23CA28154();
        if (v39)
        {
          v40 = *(_QWORD *)(v0 + 360);
          v41 = (uint64_t *)(v40 + *(int *)(v36 + 64));
          *v41 = result;
          v41[1] = v39;
          swift_storeEnumTagMultiPayload();
          (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v40, v94);
          sub_23CA2B848(v40);
          _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 56);
LABEL_36:
          *(_QWORD *)(v0 + 504) = v38;
          sub_23CA2BC60();
          sub_23CA46B50();
          sub_23CA2C124(*v98);
          v90 = sub_23CA2BE08(v37 + 1);
          ((void (*)(unint64_t))v38)(v90);
          sub_23CA2BF40();
          v91 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 512) = v91;
          *v91 = v0;
          v91[1] = sub_23CA29508;
          sub_23CA2BE6C();
          return sub_23CA2A624();
        }
      }
      __break(1u);
      return result;
    }
    if (qword_256BECF00 != -1)
      swift_once();
    v60 = *(_QWORD *)(v0 + 400);
    v59 = *(_QWORD *)(v0 + 408);
    v62 = *(_QWORD *)(v0 + 376);
    v61 = *(_QWORD *)(v0 + 384);
    v63 = sub_23CA2BEDC();
    v37 = sub_23CA2B764(v63, (uint64_t)qword_256BEF048);
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16);
    v38(v60, v59, v62);
    v64 = sub_23CA4B2A0();
    v65 = sub_23CA4B5DC();
    v66 = v65;
    if (os_log_type_enabled(v64, v65))
    {
      v67 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      *(_DWORD *)v67 = 136315138;
      sub_23CA2B8C4();
      v68 = sub_23CA4B6CC();
      *(_QWORD *)(v0 + 280) = sub_23CA2C194(v68, v69, v70, v71, v72, v73, v74, v75);
      sub_23CA4B600();
      swift_bridgeObjectRelease();
      sub_23CA2C06C();
      sub_23CA2BEA0(&dword_23CA1D000, v64, (os_log_type_t)v66, "Starting to parse all fields for array with id=%s", v67);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    sub_23CA2C06C();

    v89 = sub_23CA2BDD0();
    ((void (*)(uint64_t))v38)(v89);
    sub_23CA2C1D0();
    swift_storeEnumTagMultiPayload();
    sub_23CA2BEE4();
    sub_23CA2B848(v66);
    goto LABEL_36;
  }
  if (v2 | v3)
  {
LABEL_16:
    sub_23CA2C0DC();
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 528) = v21;
    sub_23CA2C09C(v21, (uint64_t)sub_23CA298E0);
    sub_23CA2BE6C();
    return sub_23CA2A934(v22);
  }
  v14 = *(void (**)(uint64_t))(v1 + 136);
  sub_23CA2C0EC();
  v15 = swift_retain();
  v14(v15);
  swift_release();
  v16 = (uint64_t *)(v1 + 120);
  sub_23CA2C1C4();
  v17 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 16);
  *(_QWORD *)(v0 + 464) = v17;
  if (v17)
  {
    v18 = sub_23CA28154();
    v97 = (uint64_t *)(v1 + 120);
    if (v19)
    {
      v20 = v19;
      v92 = v18;
    }
    else
    {
      if (qword_256BECEF0 != -1)
        swift_once();
      v20 = unk_256BED350;
      v92 = qword_256BED348;
      swift_bridgeObjectRetain();
    }
    v76 = *(_QWORD *)(v0 + 440);
    v49 = *(_QWORD *)(v0 + 376);
    v77 = *(_QWORD *)(v0 + 384);
    v78 = *(_QWORD *)(v0 + 368);
    v79 = (_QWORD *)sub_23CA2C13C();
    v81 = *(_QWORD *)(v80 + 48);
    v82 = *(_QWORD *)(v80 + 56);
    sub_23CA1F350(v79, v81);
    v83 = (uint64_t *)(v78 + *(int *)(sub_23CA22494(&qword_256BED310) + 48));
    v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16);
    v84(v78, v76, v49);
    *v83 = v92;
    v83[1] = v20;
    v85 = (void (*)(unint64_t))v84;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 8))(v78, v81, v82);
    v16 = v97;
  }
  else
  {
    if (qword_256BECF00 != -1)
      swift_once();
    v43 = *(_QWORD *)(v0 + 432);
    v42 = *(_QWORD *)(v0 + 440);
    v45 = *(_QWORD *)(v0 + 376);
    v44 = *(_QWORD *)(v0 + 384);
    v46 = sub_23CA2BEDC();
    sub_23CA2B764(v46, (uint64_t)qword_256BEF048);
    v95 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
    v95(v43, v42, v45);
    v47 = sub_23CA4B2A0();
    v48 = sub_23CA4B5DC();
    v49 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      v50 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      *(_DWORD *)v50 = 136315138;
      sub_23CA2B8C4();
      v51 = sub_23CA4B6CC();
      *(_QWORD *)(v0 + 304) = sub_23CA2C194(v51, v52, v53, v54, v55, v56, v57, v58);
      sub_23CA4B600();
      swift_bridgeObjectRelease();
      sub_23CA2C0B4();
      sub_23CA2BEA0(&dword_23CA1D000, v47, (os_log_type_t)v49, "Starting to parse all fields for object with id=%s", v50);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    sub_23CA2C0B4();

    v86 = sub_23CA2BDD0();
    v85 = (void (*)(unint64_t))v95;
    ((void (*)(uint64_t))v95)(v86);
    sub_23CA2C1D0();
    swift_storeEnumTagMultiPayload();
    sub_23CA2BEE4();
  }
  *(_QWORD *)(v0 + 472) = v85;
  sub_23CA2B848(*(_QWORD *)(v0 + 368));
  sub_23CA2BCE8();
  sub_23CA46B50();
  sub_23CA2C124(*v16);
  v87 = sub_23CA2BE08(v49 + 1);
  v85(v87);
  sub_23CA2BF40();
  v88 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 480) = v88;
  sub_23CA2C09C(v88, (uint64_t)sub_23CA29198);
  sub_23CA2BE6C();
  return sub_23CA29AF8();
}

uint64_t sub_23CA29198()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 488) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA291E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,uint64_t a23,uint64_t a24)
{
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(void);
  uint64_t v58;

  sub_23CA2BD64();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  v27 = v24[58];
  v28 = v24[53];
  v29 = v24[48];
  sub_23CA2BC60();
  sub_23CA2A550(v28);
  sub_23CA2BF40();
  v30 = *(void (**)(uint64_t))(v29 + 8);
  sub_23CA2C000();
  if (v27)
  {
    v31 = sub_23CA28154();
    if (v32)
    {
      v33 = v32;
      v58 = v31;
    }
    else
    {
      if (qword_256BECEF0 != -1)
        swift_once();
      v33 = unk_256BED350;
      v58 = qword_256BED348;
      swift_bridgeObjectRetain();
    }
    v46 = (void (*)(uint64_t, uint64_t, uint64_t))v24[59];
    v47 = v24[55];
    v49 = v24[46];
    v48 = v24[47];
    v50 = (_QWORD *)sub_23CA2C13C();
    v52 = *(_QWORD *)(v51 + 48);
    v53 = *(_QWORD *)(v51 + 56);
    sub_23CA1F350(v50, v52);
    v54 = (uint64_t *)(v49 + *(int *)(sub_23CA22494(&qword_256BED310) + 48));
    v46(v49, v47, v48);
    *v54 = v58;
    v54[1] = v33;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 8))(v49, v52, v53);
    sub_23CA2B848(v49);
    v55 = sub_23CA2C19C();
    v30(v55);
  }
  else
  {
    v34 = v24[46];
    v35 = (_QWORD *)sub_23CA2C13C();
    sub_23CA2BF70(v35, v36);
    sub_23CA2C19C();
    swift_storeEnumTagMultiPayload();
    sub_23CA2BF28();
    sub_23CA2B848(v34);
    if (qword_256BECF00 != -1)
      swift_once();
    v37 = sub_23CA2BEDC();
    sub_23CA2B764(v37, (uint64_t)qword_256BEF048);
    sub_23CA2C028();
    v38 = sub_23CA4B2A0();
    v39 = sub_23CA4B5DC();
    v40 = os_log_type_enabled(v38, v39);
    v41 = v24[52];
    v42 = v24[47];
    if (v40)
    {
      v43 = (uint8_t *)sub_23CA2BCB4();
      a13 = sub_23CA2BCB4();
      *(_DWORD *)v43 = 136315138;
      sub_23CA2B8C4();
      v44 = sub_23CA4B6CC();
      v24[37] = sub_23CA46BF8(v44, v45, &a13);
      sub_23CA4B600();
      sub_23CA2BFA0();
      ((void (*)(uint64_t, uint64_t))v30)(v41, v42);
      sub_23CA2BEA0(&dword_23CA1D000, v38, v39, "Consumed all fields for object with id=%s", v43);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }

    ((void (*)(uint64_t, uint64_t))v30)(v41, v42);
    sub_23CA2C000();
  }
  sub_23CA2BE38();
  swift_task_dealloc();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2BFE4();
  sub_23CA2BF98();
  sub_23CA2BE30();
  v56 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA2BBE8(v56);
}

uint64_t sub_23CA29508()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 520) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA29554()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t, uint64_t);
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
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);

  v1 = v0[62];
  v2 = v0[53];
  v3 = v0[48];
  v4 = v0[39];
  sub_23CA2BC60();
  sub_23CA2A550(v2);
  sub_23CA2BF40();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  sub_23CA2C000();
  v6 = (_QWORD *)(v4 + 24);
  if (!v1)
  {
    v24 = v0[46];
    sub_23CA2BF70(v6, v0[39]);
    sub_23CA2C19C();
    swift_storeEnumTagMultiPayload();
    sub_23CA2BF28();
    sub_23CA2B848(v24);
    if (qword_256BECF00 != -1)
      swift_once();
    v25 = sub_23CA2BEDC();
    sub_23CA2B764(v25, (uint64_t)qword_256BEF048);
    sub_23CA2C028();
    v26 = sub_23CA4B2A0();
    v27 = sub_23CA4B5DC();
    v28 = sub_23CA2C1A8(v26);
    v29 = v0[49];
    v30 = v0[47];
    v31 = v0[42];
    if (v28)
    {
      v32 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      *(_DWORD *)v32 = 136315138;
      sub_23CA2B8C4();
      v33 = sub_23CA4B6CC();
      v0[36] = sub_23CA2C194(v33, v34, v35, v36, v37, v38, v39, v40);
      sub_23CA2C1BC();
      swift_bridgeObjectRelease();
      v5(v29, v30);
      sub_23CA2BEA0(&dword_23CA1D000, v26, v27, "Consumed all fields for array with id=%s", v32);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }

    v5(v29, v30);
    v41 = sub_23CA2C1D0();
    ((void (*)(uint64_t))v5)(v41);
    sub_23CA2B884(v31);
    goto LABEL_10;
  }
  v45 = (void (*)(uint64_t))v5;
  v7 = v0[47];
  v8 = v0[42];
  v9 = v0[40];
  sub_23CA2B7BC((uint64_t)v6, (uint64_t)(v0 + 2));
  v43 = v0[6];
  v44 = v0[5];
  sub_23CA1F350(v0 + 2, v44);
  sub_23CA2B800(v8, v9);
  result = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v9, 1, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v11 = (void (*)(uint64_t, uint64_t, uint64_t))v0[63];
    v12 = v0[51];
    v14 = v0[47];
    v13 = v0[48];
    v15 = v0[44];
    v16 = v0[40];
    v17 = sub_23CA22494(&qword_256BED300);
    v18 = v15 + *(int *)(v17 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v15, v16, v14);
    v11(v18, v12, v14);
    result = sub_23CA28154();
    if (v19)
    {
      v20 = v0[44];
      v21 = v0[42];
      v22 = (uint64_t *)(v20 + *(int *)(v17 + 64));
      *v22 = result;
      v22[1] = v19;
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v20, v44);
      sub_23CA2B848(v20);
      v23 = sub_23CA2C1D0();
      v45(v23);
      sub_23CA2B884(v21);
      _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)(v0 + 2));
LABEL_10:
      sub_23CA2BCF4();
      sub_23CA2131C();
      sub_23CA24384();
      sub_23CA243F4();
      sub_23CA2BD80();
      sub_23CA2BD5C();
      sub_23CA2BDB0();
      sub_23CA2BDC8();
      sub_23CA2BDC0();
      sub_23CA2BDB8();
      sub_23CA2BE30();
      sub_23CA2C1F0();
      swift_task_dealloc();
      v42 = (uint64_t (*)(void))sub_23CA213D4();
      return v42();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA298E0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 536) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2992C()
{
  uint64_t (*v0)(void);

  sub_23CA2C154();
  sub_23CA2BE38();
  swift_task_dealloc();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  swift_task_dealloc();
  sub_23CA2BFE4();
  sub_23CA2BF98();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA2BD24(v0);
}

uint64_t sub_23CA299A8()
{
  uint64_t v0;

  sub_23CA2BD64();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 384) + 8))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 376));
  sub_23CA2BC04();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2131C();
  sub_23CA2BFE4();
  sub_23CA2BF98();
  sub_23CA2BE30();
  return sub_23CA2BBE8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA29A18()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA2BD64();
  v1 = *(_QWORD *)(v0 + 336);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 384) + 8))(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 376));
  sub_23CA2B884(v1);
  sub_23CA2BC04();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2131C();
  sub_23CA2BFE4();
  sub_23CA2BF98();
  sub_23CA2BE30();
  return sub_23CA2BBE8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA29A94()
{
  uint64_t v0;

  sub_23CA2BD64();
  sub_23CA2C154();
  sub_23CA2BC04();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2131C();
  sub_23CA2BFE4();
  sub_23CA2BF98();
  sub_23CA2BE30();
  return sub_23CA2BBE8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA29AF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v1 + 80) = v0;
  v2 = sub_23CA4B2B8();
  *(_QWORD *)(v1 + 88) = v2;
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 104) = swift_task_alloc();
  *(_QWORD *)(v1 + 112) = swift_task_alloc();
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 32) = 7;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 120) = v3;
  *v3 = v1;
  v3[1] = sub_23CA29B90;
  return sub_23CA2B0B4(v1 + 16);
}

uint64_t sub_23CA29B90()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 128) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA29BDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  sub_23CA2BD64();
  v30 = v1;
  v31 = v2;
  v29 = v0;
  if (qword_256BECF00 != -1)
    swift_once();
  v3 = v0[14];
  v4 = v0[11];
  v5 = v0[12];
  v6 = sub_23CA2B764(v4, (uint64_t)qword_256BEF048);
  v0[17] = v6;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[18] = v7;
  v7(v3, v6, v4);
  swift_retain_n();
  v8 = sub_23CA4B2A0();
  v9 = sub_23CA4B5DC();
  v10 = sub_23CA2C1A8(v8);
  v11 = v0[14];
  v12 = v0[11];
  v13 = v0[12];
  if (v10)
  {
    v14 = (uint8_t *)sub_23CA2BCB4();
    v28 = sub_23CA2BCB4();
    *(_DWORD *)v14 = 136315138;
    v15 = sub_23CA28154();
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      v15 = 0x3E746F6F723CLL;
      v17 = 0xE600000000000000;
    }
    v0[9] = sub_23CA46BF8(v15, v17, &v28);
    sub_23CA2C1BC();
    sub_23CA2BFD0();
    sub_23CA2BFA0();
    sub_23CA2BEA0(&dword_23CA1D000, v8, v9, "Starting object in %s", v14);
    sub_23CA2BE98();
    sub_23CA2BBDC();
  }

  sub_23CA2BFD0();
  v18 = *(_QWORD *)(v13 + 8);
  v19 = sub_23CA2C160();
  ((void (*)(uint64_t))v18)(v19);
  v0[19] = v18;
  sub_23CA2BECC();
  if (!v21 & v20)
  {
    sub_23CA2B724(v11, v18, 0xFFu);
    sub_23CA2BEA8(1);
    goto LABEL_13;
  }
  sub_23CA2BD9C();
  if (!v21)
  {
    sub_23CA2BB74();
LABEL_12:
    sub_23CA2B738(v11, v18, v12);
    sub_23CA2BB30(1);
LABEL_13:
    v23 = (_QWORD *)swift_task_alloc();
    v0[20] = v23;
    v24 = sub_23CA2C16C(v23, (uint64_t)sub_23CA29E98);
    return ((uint64_t (*)(uint64_t))sub_23CA2B36C)(v24);
  }
  if ((v22 & 0x1C) != 0 || v11 ^ 1 | v18)
    goto LABEL_12;
  sub_23CA2B738(v11, v18, 7u);
  sub_23CA2BAEC(1);
  sub_23CA2BFC0((__n128)xmmword_23CA4D150);
  v26 = (_QWORD *)swift_task_alloc();
  v0[22] = v26;
  v27 = sub_23CA2BF48(v26, (uint64_t)sub_23CA2A2E0);
  return sub_23CA2B0B4(v27);
}

uint64_t sub_23CA29E98()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    sub_23CA24384();
    return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
  }
  else
  {
    sub_23CA21048();
    return sub_23CA24378();
  }
}

uint64_t sub_23CA29EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  switch(*(_BYTE *)(v1 + 80))
  {
    case 0:
      sub_23CA2B7A8(v2, v3, 0);
      sub_23CA2B7A8(v2, v3, 0);
      v4 = sub_23CA2BBB4(v2, v3, 0);
      v6 = 0;
      goto LABEL_12;
    case 1:
      sub_23CA2B7A8(v2, v3, 1u);
      sub_23CA2B7A8(v2, v3, 1u);
      v4 = sub_23CA2BBB4(v2, v3, 1u);
      v6 = 1;
      goto LABEL_12;
    case 2:
      v7 = sub_23CA2BBB4(v2, v3, 2u);
      sub_23CA2B724(v7, v8, 2u);
      sub_23CA2B724(v2, v3, 2u);
      v9 = v2;
      v10 = v3;
      v11 = 2;
      goto LABEL_10;
    case 3:
      v12 = sub_23CA2BBB4(v2, v3, 3u);
      sub_23CA2B724(v12, v13, 3u);
      sub_23CA2B724(v2, v3, 3u);
      v9 = v2;
      v10 = v3;
      v11 = 3;
      goto LABEL_10;
    case 4:
      v14 = sub_23CA2BBB4(v2, v3, 4u);
      sub_23CA2B724(v14, v15, 4u);
      sub_23CA2B724(v2, v3, 4u);
      v9 = v2;
      v10 = v3;
      v11 = 4;
LABEL_10:
      sub_23CA2B738(v9, v10, v11);
      goto LABEL_13;
    case 5:
      sub_23CA2B7A8(v2, v3, 5u);
      sub_23CA2B7A8(v2, v3, 5u);
      v4 = sub_23CA2BBB4(v2, v3, 5u);
      v6 = 5;
      goto LABEL_12;
    case 6:
      sub_23CA2B7A8(v2, v3, 6u);
      sub_23CA2B7A8(v2, v3, 6u);
      v4 = sub_23CA2BBB4(v2, v3, 6u);
      v6 = 6;
      goto LABEL_12;
    case 7:
      __asm { BR              X9 }
      return result;
    default:
      sub_23CA2C07C();
      v4 = 4;
      v5 = 0;
      v6 = 7;
LABEL_12:
      sub_23CA2B724(v4, v5, v6);
LABEL_13:
      sub_23CA2C1DC((__n128)xmmword_23CA4D150);
      v16 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v16;
      v17 = sub_23CA2BF48(v16, (uint64_t)sub_23CA2A2E0);
      return sub_23CA2BEFC(v17);
  }
}

uint64_t sub_23CA2A170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA2B738(v0, v1, 7u);
  sub_23CA2BAEC(4);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 168) = v3;
  *v3 = v2;
  v3[1] = sub_23CA2A1B4;
  return sub_23CA2BF08();
}

uint64_t sub_23CA2A1B4()
{
  sub_23CA24398();
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A1E8()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  _QWORD *v7;
  char v8;
  _QWORD *v10;
  uint64_t v11;

  sub_23CA2BECC();
  if (!v5 & v4)
  {
    sub_23CA2B724(v0, v1, 0xFFu);
    sub_23CA2BEA8(1);
    goto LABEL_6;
  }
  sub_23CA2BD9C();
  if (!v5)
  {
    sub_23CA2BB74();
LABEL_5:
    sub_23CA2B738(v0, v1, v2);
    sub_23CA2BB30(1);
LABEL_6:
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 160) = v7;
    v8 = sub_23CA2C16C(v7, (uint64_t)sub_23CA29E98);
    return sub_23CA2B36C(v8);
  }
  if ((v6 & 0x1C) != 0 || v0 ^ 1 | v1)
    goto LABEL_5;
  sub_23CA2B738(v0, v1, 7u);
  sub_23CA2BAEC(1);
  sub_23CA2BFC0((__n128)xmmword_23CA4D150);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 176) = v10;
  v11 = sub_23CA2BF48(v10, (uint64_t)sub_23CA2A2E0);
  return sub_23CA2BCD8(v11);
}

uint64_t sub_23CA2A2E0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 184) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A32C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 144))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 88));
  swift_retain_n();
  v1 = sub_23CA4B2A0();
  v2 = sub_23CA4B5DC();
  if (sub_23CA2C1A8(v1))
  {
    v3 = (uint8_t *)sub_23CA2BCB4();
    v12 = sub_23CA2BCB4();
    *(_DWORD *)v3 = 136315138;
    v4 = sub_23CA28154();
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      v4 = 0x3E746F6F723CLL;
      v6 = 0xE600000000000000;
    }
    *(_QWORD *)(v0 + 64) = sub_23CA46BF8(v4, v6, &v12);
    sub_23CA4B600();
    swift_bridgeObjectRelease();
    sub_23CA2BFD0();
    sub_23CA2BEA0(&dword_23CA1D000, v1, v2, "Ending object in %s", v3);
    sub_23CA2BE98();
    sub_23CA2BBDC();
  }
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 88);
  swift_release_n();

  v7(v8, v9);
  swift_task_dealloc();
  sub_23CA2131C();
  v10 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA2BD24(v10);
}

uint64_t sub_23CA2A4B8()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA24384();
  return sub_23CA2436C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA2A4E8()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA24384();
  return sub_23CA2436C(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA2A518()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v0 + 16))
  {
    sub_23CA49B28();
    if (!v1)
      sub_23CA49958(*(_QWORD *)(*(_QWORD *)v0 + 16) - 1);
  }
  else
  {
    __break(1u);
  }
}

void sub_23CA2A550(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_23CA22494(&qword_256BED368);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    sub_23CA49B74((uint64_t)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v6 = sub_23CA4B0CC();
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v5, 1, v6) == 1)
    {
      sub_23CA2B884((uint64_t)v5);
      sub_23CA499D8(*(_QWORD *)(*(_QWORD *)v1 + 16) - 1, a1);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, v5, v6);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23CA2A624()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 64) = v0;
  *(_OWORD *)(v1 + 16) = xmmword_23CA4D160;
  *(_BYTE *)(v1 + 32) = 7;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 72) = v2;
  *v2 = v1;
  v2[1] = sub_23CA2A688;
  return sub_23CA2B0B4(v1 + 16);
}

uint64_t sub_23CA2A688()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v1 + 80) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A6D4()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t v10;

  sub_23CA2BECC();
  if (!v5 & v4)
  {
    sub_23CA2B724(v0, v1, 0xFFu);
    sub_23CA2BEA8(3);
    goto LABEL_6;
  }
  sub_23CA2BD9C();
  if (!v5)
  {
    sub_23CA2BB74();
LABEL_5:
    sub_23CA2B738(v0, v1, v2);
    sub_23CA2BB30(3);
LABEL_6:
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 88) = v7;
    sub_23CA2C180(v7, (uint64_t)sub_23CA2A7C0);
    return sub_23CA2BE5C();
  }
  if ((v6 & 0x1C) != 0 || v0 ^ 3 | v1)
    goto LABEL_5;
  sub_23CA2B738(v0, v1, 7u);
  sub_23CA2BAEC(3);
  sub_23CA2BFC0((__n128)xmmword_23CA4D170);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 104) = v9;
  v10 = sub_23CA2BF5C(v9, (uint64_t)sub_23CA2A8D8);
  return sub_23CA2BCD8(v10);
}

uint64_t sub_23CA2A7C0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2BC34();
  if (v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v8;

  v1 = v0[8];
  if (*(_BYTE *)(v1 + 80) == 7
    && ((v3 = v1 + 64, v2 = *(_QWORD *)(v1 + 64), !*(_QWORD *)(v3 + 8)) ? (v4 = v2 == 4) : (v4 = 0), v4))
  {
    sub_23CA2B77C(4, 0, 7u);
    v8 = (_QWORD *)swift_task_alloc();
    v0[12] = v8;
    *v8 = v0;
    v8[1] = sub_23CA2A8A4;
    return sub_23CA2BF08();
  }
  else
  {
    sub_23CA2C1DC((__n128)xmmword_23CA4D170);
    v5 = (_QWORD *)swift_task_alloc();
    v0[13] = v5;
    v6 = sub_23CA2BF5C(v5, (uint64_t)sub_23CA2A8D8);
    return sub_23CA2BEFC(v6);
  }
}

uint64_t sub_23CA2A8A4()
{
  sub_23CA24398();
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A8D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA24398();
  sub_23CA2438C();
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2A924()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2A92C()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2A934(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 33) = a1;
  *(_QWORD *)(v2 + 64) = type metadata accessor for JsonStreamEvent(0);
  *(_QWORD *)(v2 + 72) = swift_task_alloc();
  sub_23CA22494(&qword_256BED368);
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v3 = sub_23CA4B0CC();
  *(_QWORD *)(v2 + 96) = v3;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA2AA00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
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
  unsigned __int8 v62;
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
  _QWORD *v73;
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
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t, uint64_t);
  int *v102;
  uint64_t *v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  void (*v112)(uint64_t, uint64_t);
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
  _BYTE v125[5];
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v1 = sub_23CA28154();
  if (!v2)
  {
    sub_23CA2B904();
    sub_23CA2BC74();
    sub_23CA2C148();
    v11 = "Got a value token without a field name to map to";
    v13 = v12 + 30;
LABEL_7:
    *v10 = v13;
    v10[1] = (unint64_t)(v11 - 32) | 0x8000000000000000;
    goto LABEL_8;
  }
  v3 = v2;
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(unsigned __int8 *)(v4 + 80);
  if (v5 == 255)
  {
    sub_23CA2BFA0();
    sub_23CA2B904();
    sub_23CA2BC74();
    sub_23CA2C148();
    v11 = "No current token available to be parsed";
    v13 = v14 + 21;
    goto LABEL_7;
  }
  v6 = v1;
  v8 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(v4 + 72);
  sub_23CA281B8(*(_QWORD *)(v0 + 88));
  if (sub_23CA2C03C() == 1)
  {
    sub_23CA2B884(*(_QWORD *)(v0 + 88));
    sub_23CA2C114();
    sub_23CA4B648();
    sub_23CA2C0FC();
    sub_23CA2C05C();
    sub_23CA2BFA0();
    sub_23CA2B904();
    v9 = sub_23CA2BC74();
    *v10 = v136;
    v10[1] = v137;
LABEL_8:
    sub_23CA2C130(v9, (uint64_t)v10);
    goto LABEL_9;
  }
  v16 = *(_QWORD *)(v0 + 80);
  v17 = *(_QWORD *)(v0 + 56);
  v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 32);
  v18(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  sub_23CA28250(v16);
  v19 = sub_23CA2C03C();
  v20 = *(_QWORD *)(v0 + 96);
  if (v19 != 1)
  {
    v18(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 96));
    switch(v5)
    {
      case 1:
        v25 = *(_QWORD *)(v0 + 120);
        v120 = *(_QWORD *)(v0 + 112);
        v26 = *(_QWORD *)(v0 + 96);
        v27 = *(_QWORD *)(v0 + 104);
        sub_23CA2BC80();
        v28 = v17 + *(int *)(sub_23CA22494(&qword_256BED308) + 48);
        v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
        v29(v17, v25, v26);
        v29(v28, v120, v26);
        v30 = sub_23CA280A0();
        v31 = sub_23CA2C0C4(v30);
        *(_QWORD *)v32 = v8;
        *(_QWORD *)(v32 + 8) = v7;
        *(_BYTE *)(v32 + 16) = 0;
        sub_23CA2BC44(v31, v33, v34, v35, v36, v37, v38, v39, v113, v116, v120, *(int *)v125, v125[4]);
        v40 = sub_23CA2BD88();
        sub_23CA2B7A8(v40, v41, 1u);
        v42 = sub_23CA2B77C(v8, v7, 1u);
        sub_23CA2C04C(v42, v43, v44, v45, v46, v47, v48, v49, v114, v117, v121, v126, v128, v130, (uint64_t)v131, v133);
        sub_23CA2B724(v8, v7, 1u);
        goto LABEL_18;
      case 2:
        v122 = *(_QWORD *)(v0 + 112);
        sub_23CA2BC80();
        sub_23CA22494(&qword_256BED308);
        sub_23CA2BCBC();
        sub_23CA2BF20(v20, v122);
        v50 = sub_23CA280A0();
        v51 = sub_23CA2C00C(v50);
        *(_BYTE *)(v52 + 16) = 2;
        sub_23CA2BC44(v51, v53, v54, v55, v56, v57, v58, v59, v113, v116, v122, *(int *)v125, v125[4]);
        v60 = sub_23CA2BD88();
        v62 = 2;
        goto LABEL_17;
      case 3:
        v124 = *(_QWORD *)(v0 + 112);
        sub_23CA2BC80();
        sub_23CA22494(&qword_256BED308);
        sub_23CA2BCBC();
        sub_23CA2BF20(v20, v124);
        v63 = sub_23CA280A0();
        v64 = sub_23CA2C00C(v63);
        *(_BYTE *)(v65 + 16) = 3;
        sub_23CA2BC44(v64, v66, v67, v68, v69, v70, v71, v72, v113, v116, v124, *(int *)v125, v125[4]);
        v60 = sub_23CA2BD88();
        v62 = 3;
        goto LABEL_17;
      case 4:
        v73 = *(_QWORD **)(v0 + 56);
        v125[4] = *(_BYTE *)(v0 + 33);
        v119 = *(_QWORD *)(v0 + 112);
        v133 = v73[6];
        v128 = v73[7];
        v130 = *(_QWORD *)(v0 + 64);
        v131 = sub_23CA1F350(v73 + 3, v133);
        sub_23CA22494(&qword_256BED308);
        sub_23CA2BCBC();
        sub_23CA2BF20(v20, v119);
        v74 = sub_23CA280A0();
        v75 = sub_23CA2C0C4(v74);
        *(_QWORD *)v76 = v8 & 1;
        *(_QWORD *)(v76 + 8) = 0;
        *(_BYTE *)(v76 + 16) = 1;
        sub_23CA2BC44(v75, v77, v78, v79, v80, v81, v82, v83, v113, v119, v8 & 1, *(int *)v125, v125[4]);
        v60 = sub_23CA2BD88();
        v62 = 4;
LABEL_17:
        v84 = sub_23CA2B7A8(v60, v61, v62);
        sub_23CA2C04C(v84, v85, v86, v87, v88, v89, v90, v91, v115, v118, v123, v127, v128, v130, (uint64_t)v131, v133);
        goto LABEL_18;
      case 7:
        if (v8 != 5 || v7)
          goto LABEL_22;
        v94 = *(_QWORD *)(v0 + 112);
        v93 = *(_QWORD *)(v0 + 120);
        v96 = *(_QWORD *)(v0 + 96);
        v95 = *(_QWORD *)(v0 + 104);
        v97 = *(_QWORD *)(v0 + 72);
        v98 = *(_QWORD **)(v0 + 56);
        v129 = *(_BYTE *)(v0 + 33);
        v99 = v98[7];
        v134 = v98[6];
        sub_23CA1F350(v98 + 3, v134);
        v100 = v97 + *(int *)(sub_23CA22494(&qword_256BED308) + 48);
        v101 = *(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16);
        v101(v97, v93, v96);
        v101(v100, v94, v96);
        v102 = (int *)sub_23CA280A0();
        v103 = (uint64_t *)(v100 + v102[5]);
        *v103 = v6;
        v103[1] = v3;
        v104 = v100 + v102[6];
        *(_QWORD *)v104 = 0;
        *(_QWORD *)(v104 + 8) = 0;
        *(_BYTE *)(v104 + 16) = 4;
        *(_BYTE *)(v100 + v102[7]) = v129;
        swift_storeEnumTagMultiPayload();
        v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 8);
        sub_23CA2B7A8(5, 0, 7u);
        v105(v97, v134, v99);
LABEL_18:
        sub_23CA2B848(*(_QWORD *)(v0 + 72));
        v92 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 128) = v92;
        *v92 = v0;
        v92[1] = sub_23CA2B004;
        return sub_23CA2830C();
      default:
LABEL_22:
        v106 = *(_QWORD *)(v0 + 104);
        v132 = *(_QWORD *)(v0 + 112);
        v135 = *(_QWORD *)(v0 + 120);
        v107 = *(_QWORD *)(v0 + 96);
        sub_23CA2B7A8(v8, v7, v5);
        sub_23CA2BFA0();
        sub_23CA2C114();
        sub_23CA4B648();
        *(_QWORD *)(v0 + 40) = v136;
        *(_QWORD *)(v0 + 48) = v137;
        sub_23CA4B420();
        *(_QWORD *)(v0 + 16) = v8;
        *(_QWORD *)(v0 + 24) = v7;
        *(_BYTE *)(v0 + 32) = v5;
        sub_23CA4B66C();
        v108 = *(_QWORD *)(v0 + 40);
        v109 = *(_QWORD *)(v0 + 48);
        sub_23CA2B904();
        v110 = sub_23CA2BC74();
        *v111 = v108;
        v111[1] = v109;
        sub_23CA2BE88(v110, (uint64_t)v111);
        sub_23CA2B724(v8, v7, v5);
        v112 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
        v112(v132, v107);
        v112(v135, v107);
        goto LABEL_9;
    }
  }
  v21 = *(_QWORD *)(v0 + 120);
  v22 = *(_QWORD *)(v0 + 104);
  sub_23CA2B884(*(_QWORD *)(v0 + 80));
  sub_23CA2C114();
  sub_23CA4B648();
  sub_23CA2C148();
  sub_23CA2C0FC();
  sub_23CA2C05C();
  sub_23CA2BFA0();
  sub_23CA2B904();
  v23 = sub_23CA2BC74();
  *v24 = v136;
  v24[1] = v137;
  sub_23CA2C130(v23, (uint64_t)v24);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v20);
LABEL_9:
  swift_task_dealloc();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2B004()
{
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2B040()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[15];
  v2 = v0[12];
  v3 = *(void (**)(uint64_t))(v0[13] + 8);
  v4 = sub_23CA2C160();
  v3(v4);
  ((void (*)(uint64_t, uint64_t))v3)(v1, v2);
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  v5 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA2BF14(v5);
}

uint64_t sub_23CA2B0B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = v1;
  *(_OWORD *)(v2 + 128) = *(_OWORD *)a1;
  *(_BYTE *)(v2 + 33) = *(_BYTE *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_23CA2B0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned __int8 v8;
  char v9;
  char v10;
  _QWORD *v11;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  unint64_t v31;
  unsigned __int8 v32;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v1 + 128);
  v4 = *(_QWORD *)(v1 + 136);
  v5 = *(_QWORD *)(v2 + 64);
  v6 = *(_QWORD *)(v2 + 72);
  v7 = *(unsigned __int8 *)(v2 + 80);
  v8 = *(_BYTE *)(v1 + 33);
  if (v7 == 255)
  {
    sub_23CA2B77C(*(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136), *(_BYTE *)(v1 + 33));
    sub_23CA2C07C();
    sub_23CA2B724(v3, v4, v8);
  }
  else
  {
    v27 = *(_QWORD *)(v2 + 64);
    v28 = v6;
    v29 = v7;
    v30 = v3;
    v31 = v4;
    v32 = v8;
    sub_23CA2C08C();
    sub_23CA2C08C();
    static JsonToken.== infix(_:_:)((uint64_t)&v27);
    v10 = v9;
    sub_23CA2B738(v27, v28, v29);
    sub_23CA2B724(v5, v6, v7);
    if ((v10 & 1) != 0)
    {
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 144) = v11;
      *v11 = v1;
      v11[1] = sub_23CA2B340;
      sub_23CA2BE6C();
      return sub_23CA2830C();
    }
  }
  v13 = *(unsigned __int8 *)(v2 + 80);
  v14 = *(_BYTE *)(v1 + 33);
  v16 = *(_QWORD *)(v1 + 128);
  v15 = *(_QWORD *)(v1 + 136);
  if (v13 == 255)
  {
    v17 = (uint64_t *)(v1 + 88);
    v30 = 0;
    v31 = 0xE000000000000000;
    sub_23CA4B648();
    v22 = v30;
    *(_QWORD *)(v1 + 96) = v31;
    v21 = (uint64_t *)(v1 + 96);
    *(_QWORD *)(v1 + 88) = v22;
    sub_23CA2BFA8();
    *(_QWORD *)(v1 + 16) = v16;
    *(_QWORD *)(v1 + 24) = v15;
    *(_BYTE *)(v1 + 32) = v14;
    sub_23CA4B66C();
    sub_23CA2C1B0();
  }
  else
  {
    v17 = (uint64_t *)(v1 + 104);
    v19 = *(_QWORD *)(v2 + 64);
    v18 = *(_QWORD *)(v2 + 72);
    v30 = 0;
    v31 = 0xE000000000000000;
    sub_23CA2B77C(v19, v18, v13);
    sub_23CA4B648();
    v20 = v30;
    *(_QWORD *)(v1 + 112) = v31;
    v21 = (uint64_t *)(v1 + 112);
    *(_QWORD *)(v1 + 104) = v20;
    sub_23CA2BFA8();
    *(_QWORD *)(v1 + 40) = v16;
    *(_QWORD *)(v1 + 48) = v15;
    *(_BYTE *)(v1 + 56) = v14;
    sub_23CA2BFEC();
    sub_23CA2C148();
    sub_23CA2C1B0();
    *(_QWORD *)(v1 + 64) = v19;
    *(_QWORD *)(v1 + 72) = v18;
    *(_BYTE *)(v1 + 80) = v13;
    sub_23CA2BFEC();
    sub_23CA2B724(v19, v18, v13);
  }
  v23 = *v17;
  v24 = *v21;
  sub_23CA2B904();
  v25 = sub_23CA2BC74();
  *v26 = v23;
  v26[1] = v24;
  sub_23CA2BE88(v25, (uint64_t)v26);
  return sub_23CA2BD40(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA2B340()
{
  uint64_t (*v0)(void);

  sub_23CA24398();
  sub_23CA2BC34();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA20F8C(v0);
}

uint64_t sub_23CA2B36C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = v1;
  *(_BYTE *)(v2 + 81) = a1;
  return swift_task_switch();
}

uint64_t sub_23CA2B388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(v0 + 112) = v2;
  v3 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)(v0 + 120) = v3;
  v4 = *(unsigned __int8 *)(v1 + 80);
  if (v4 == 255)
  {
    sub_23CA2B904();
    sub_23CA2BC74();
    *(_QWORD *)v9 = 0xD000000000000035;
    v10 = 0x800000023CA4F4E0;
  }
  else
  {
    if (!*(_BYTE *)(v1 + 80))
    {
      v5 = sub_23CA2C160();
      sub_23CA2B77C(v5, v6, 0);
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v7;
      *v7 = v0;
      v7[1] = sub_23CA2B524;
      return sub_23CA2830C();
    }
    sub_23CA2B77C(v2, v3, v4);
    sub_23CA4B648();
    *(_QWORD *)(v0 + 88) = 0;
    *(_QWORD *)(v0 + 96) = 0xE000000000000000;
    sub_23CA4B420();
    *(_QWORD *)(v0 + 64) = v2;
    *(_QWORD *)(v0 + 72) = v3;
    *(_BYTE *)(v0 + 80) = v4;
    sub_23CA4B66C();
    sub_23CA2B724(v2, v3, v4);
    v11 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 96);
    sub_23CA2B904();
    sub_23CA2BC74();
    *(_QWORD *)v9 = v11;
  }
  *(_QWORD *)(v9 + 8) = v10;
  *(_BYTE *)(v9 + 16) = 1;
  swift_willThrow();
  return sub_23CA2BF14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA2B524()
{
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2B560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  sub_23CA2BC60();
  sub_23CA46B44();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 112) + 16);
  sub_23CA46BA0(v4);
  v5 = *(_QWORD *)(v3 + 112);
  *(_QWORD *)(v5 + 16) = v4 + 1;
  v6 = v5 + 16 * v4;
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v1;
  sub_23CA2BF40();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v7;
  *v7 = v0;
  v7[1] = sub_23CA2B600;
  return sub_23CA28760(*(_BYTE *)(v0 + 81));
}

uint64_t sub_23CA2B600()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2BC34();
  if (v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2B644()
{
  uint64_t (*v0)(void);

  sub_23CA2BC60();
  sub_23CA2A518();
  sub_23CA2BF40();
  swift_bridgeObjectRelease();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA2436C(v0);
}

uint64_t sub_23CA2B688()
{
  uint64_t v0;

  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 24);
  sub_23CA2B724(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  sub_23CA2B724(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_BYTE *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_23CA2B6E4()
{
  sub_23CA2B688();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for JsonStreamParser()
{
  return objc_opt_self();
}

uint64_t sub_23CA2B724(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_23CA2B738(a1, a2, a3);
  return a1;
}

uint64_t sub_23CA2B738(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u && ((1 << a3) & 0x63) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23CA2B764(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23CA2B77C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u && ((1 << a3) & 0x63) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23CA2B7A8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_23CA2B77C(a1, a2, a3);
  return a1;
}

uint64_t sub_23CA2B7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23CA2B800(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23CA22494(&qword_256BED368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CA2B848(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for JsonStreamEvent(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA2B884(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA22494(&qword_256BED368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23CA2B8C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BED380;
  if (!qword_256BED380)
  {
    v1 = sub_23CA4B0CC();
    result = MEMORY[0x24262A1B4](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, &qword_256BED380);
  }
  return result;
}

unint64_t sub_23CA2B904()
{
  unint64_t result;

  result = qword_256BED390;
  if (!qword_256BED390)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4D220, &type metadata for JsonStreamParser.ParserError);
    atomic_store(result, &qword_256BED390);
  }
  return result;
}

uint64_t sub_23CA2B944()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for JsonStreamParser.ParserError()
{
  return sub_23CA2B95C();
}

uint64_t sub_23CA2B95C()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19GenerativeFunctions16JsonStreamParserC11ParserErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23CA2B944();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonStreamParser.ParserError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23CA2B944();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23CA2B95C();
  return a1;
}

uint64_t assignWithTake for JsonStreamParser.ParserError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23CA2B95C();
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonStreamParser.ParserError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JsonStreamParser.ParserError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23CA2BAC8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23CA2BAD0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JsonStreamParser.ParserError()
{
  return &type metadata for JsonStreamParser.ParserError;
}

uint64_t sub_23CA2BAEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_23CA2B738(a1, 0, 7u);
  sub_23CA2B724(v1, v2, 7u);
  sub_23CA2B724(v1, v2, 7u);
  return sub_23CA2B738(v1, v2, 7u);
}

uint64_t sub_23CA2BB30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;

  sub_23CA2B738(a1, 0, 7u);
  sub_23CA2B724(v1, v2, v3);
  sub_23CA2B724(v1, v2, v3);
  return sub_23CA2B738(v1, v2, v3);
}

uint64_t sub_23CA2BB74()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  sub_23CA2B7A8(v0, v1, v2);
  sub_23CA2B7A8(v0, v1, v2);
  sub_23CA2B77C(v0, v1, v2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA2BBB4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;

  sub_23CA2B738(a1, a2, a3);
  sub_23CA2B738(4, 0, 7u);
  return v3;
}

void sub_23CA2BBDC()
{
  JUMPOUT(0x24262A250);
}

uint64_t sub_23CA2BBE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA2BC04()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BC34()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA2BC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, char a13)
{
  uint64_t v13;

  *(_BYTE *)(v13 + *(int *)(a1 + 28)) = a13;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23CA2BC60()
{
  return swift_beginAccess();
}

uint64_t sub_23CA2BC74()
{
  return swift_allocError();
}

_QWORD *sub_23CA2BC80()
{
  uint64_t v0;

  return sub_23CA1F350((_QWORD *)(*(_QWORD *)(v0 + 56) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 48));
}

uint64_t sub_23CA2BCB4()
{
  return swift_slowAlloc();
}

uint64_t sub_23CA2BCBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v2, v1);
}

uint64_t sub_23CA2BCD8(uint64_t a1)
{
  return sub_23CA2B0B4(a1);
}

uint64_t sub_23CA2BCE8()
{
  return swift_beginAccess();
}

uint64_t sub_23CA2BCF4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BD24(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA2BD40(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA2BD5C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BD80()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BD88()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA2BDB0()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BDB8()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BDC0()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BDC8()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BDD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 368);
  sub_23CA1F350((_QWORD *)(*(_QWORD *)(v0 + 312) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 312) + 48));
  return v1;
}

unint64_t sub_23CA2BE08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v1 + 16) = a1;
  return v1
       + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
       + *(_QWORD *)(v3 + 72) * v2;
}

uint64_t sub_23CA2BE30()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BE38()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 440);
}

uint64_t sub_23CA2BE5C()
{
  return sub_23CA28760();
}

uint64_t sub_23CA2BE88(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_23CA2BE98()
{
  return swift_arrayDestroy();
}

void sub_23CA2BEA0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_23CA2BEA8(uint64_t a1)
{
  return sub_23CA2B724(a1, 0, 7u);
}

uint64_t sub_23CA2BEB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 24))(v0, v1, v2);
}

uint64_t sub_23CA2BEDC()
{
  return sub_23CA4B2B8();
}

uint64_t sub_23CA2BEE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
}

uint64_t sub_23CA2BEFC(uint64_t a1)
{
  return sub_23CA2B0B4(a1);
}

uint64_t sub_23CA2BF08()
{
  return sub_23CA2830C();
}

uint64_t sub_23CA2BF14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA2BF20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_23CA2BF28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
}

uint64_t sub_23CA2BF40()
{
  return swift_endAccess();
}

uint64_t sub_23CA2BF48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_23CA2BF5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_23CA2BF70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  sub_23CA1F350(a1, *(_QWORD *)(a2 + 48));
  return v5(v4, v3, v2);
}

uint64_t sub_23CA2BF98()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BFA0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA2BFA8()
{
  return sub_23CA4B420();
}

void sub_23CA2BFC0(__n128 a1)
{
  char v1;
  uint64_t v2;

  *(__n128 *)(v2 + 40) = a1;
  *(_BYTE *)(v2 + 56) = v1;
}

uint64_t sub_23CA2BFD0()
{
  return swift_release_n();
}

uint64_t sub_23CA2BFDC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2BFE4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2BFEC()
{
  return sub_23CA4B66C();
}

uint64_t sub_23CA2C000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t sub_23CA2C00C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v5 = (_QWORD *)(v4 + *(int *)(result + 20));
  *v5 = v3;
  v5[1] = v1;
  v6 = (_QWORD *)(v4 + *(int *)(result + 24));
  *v6 = v2;
  v6[1] = 0;
  return result;
}

uint64_t sub_23CA2C028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t sub_23CA2C03C()
{
  uint64_t v0;
  uint64_t v1;

  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v1, 1, v0);
}

uint64_t sub_23CA2C04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  return v17(v16, a16, v18);
}

uint64_t sub_23CA2C05C()
{
  return sub_23CA4B420();
}

uint64_t sub_23CA2C06C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23CA2C07C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23CA2B724(v0, v1, 0xFFu);
}

uint64_t sub_23CA2C08C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  return sub_23CA2B77C(v0, v1, v2);
}

uint64_t sub_23CA2C09C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(unsigned __int8 *)(v2 + 257);
}

uint64_t sub_23CA2C0B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23CA2C0C4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(result + 20));
  *v4 = v2;
  v4[1] = v1;
  return result;
}

uint64_t sub_23CA2C0DC()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23CA2B77C(v2, v1, v0);
}

uint64_t sub_23CA2C0EC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23CA2B7A8(v1, v0, 7u);
}

uint64_t sub_23CA2C0FC()
{
  return sub_23CA4B420();
}

void sub_23CA2C10C()
{
  JUMPOUT(0x24262A118);
}

uint64_t sub_23CA2C124@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA46BAC(*(_QWORD *)(a1 + 16));
}

uint64_t sub_23CA2C130(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_23CA2C13C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 312) + 24;
}

uint64_t sub_23CA2C154()
{
  uint64_t v0;

  return sub_23CA2B724(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 456), *(_BYTE *)(v0 + 258));
}

uint64_t sub_23CA2C160()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA2C16C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return 0;
}

uint64_t sub_23CA2C180@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return 1;
}

uint64_t sub_23CA2C194(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_23CA46BF8(a1, a2, (uint64_t *)va);
}

uint64_t sub_23CA2C19C()
{
  uint64_t v0;

  return v0;
}

BOOL sub_23CA2C1A8(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_23CA2C1B0()
{
  return sub_23CA4B420();
}

uint64_t sub_23CA2C1BC()
{
  return sub_23CA4B600();
}

uint64_t sub_23CA2C1C4()
{
  return swift_beginAccess();
}

uint64_t sub_23CA2C1D0()
{
  uint64_t v0;

  return v0;
}

void sub_23CA2C1DC(__n128 a1)
{
  uint64_t v1;

  *(__n128 *)(v1 + 40) = a1;
  *(_BYTE *)(v1 + 56) = 7;
}

uint64_t sub_23CA2C1F0()
{
  return swift_task_dealloc();
}

void static JsonToken.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_23CA2C238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  int v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_23CA2B77C(v0, v1, v5);
    v8 = sub_23CA2C770();
    v10 = sub_23CA2C758(v8, v9, v4);
    sub_23CA2B738(v10, v11, v5);
    v7 = 0;
  }
  else
  {
    if (v3 == v0 && v2 == v1)
      v7 = 1;
    else
      v7 = sub_23CA2C740();
    sub_23CA2B77C(v0, v1, 0);
    sub_23CA2B77C(v3, v2, 0);
    v12 = sub_23CA2C758(v3, v2, 0);
    sub_23CA2B738(v12, v13, 0);
  }
  return v7 & 1;
}

void sub_23CA2C4B0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 1 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  JUMPOUT(0x23CA2C490);
}

void sub_23CA2C4D8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 2 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  sub_23CA2B738(2, 0, 7u);
  JUMPOUT(0x23CA2C494);
}

void sub_23CA2C4F4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 3 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  sub_23CA2B738(3, 0, 7u);
  JUMPOUT(0x23CA2C494);
}

void sub_23CA2C510()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 4 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  sub_23CA2B738(4, 0, 7u);
  JUMPOUT(0x23CA2C494);
}

void sub_23CA2C52C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 5 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  sub_23CA2B738(5, 0, 7u);
  JUMPOUT(0x23CA2C494);
}

void sub_23CA2C548()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  if (v2 != 7 || v0 != 6 || v1 != 0)
    JUMPOUT(0x23CA2C344);
  sub_23CA2C730();
  JUMPOUT(0x23CA2C560);
}

uint64_t destroy for JsonToken(uint64_t a1)
{
  return sub_23CA2B738(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s19GenerativeFunctions9JsonTokenOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA2B77C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonToken(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA2B77C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23CA2B738(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for JsonToken(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23CA2B738(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonToken(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xF9 && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 7)
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

uint64_t storeEnumTagSinglePayload for JsonToken(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23CA2C6F0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_23CA2C708(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(_QWORD *)result = a2 - 7;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for JsonToken()
{
  return &type metadata for JsonToken;
}

uint64_t sub_23CA2C730()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23CA2B738(v1, v0, 7u);
}

uint64_t sub_23CA2C740()
{
  return sub_23CA4B6D8();
}

uint64_t sub_23CA2C758(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;

  sub_23CA2B738(a1, a2, a3);
  return v3;
}

uint64_t sub_23CA2C770()
{
  uint64_t v0;

  return v0;
}

ValueMetadata *type metadata accessor for JsonTokenizer()
{
  return &type metadata for JsonTokenizer;
}

uint64_t sub_23CA2C78C()
{
  return MEMORY[0x24BEE3F20];
}

uint64_t sub_23CA2C798(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = v1;
  sub_23CA21048();
  return swift_task_switch();
}

uint64_t sub_23CA2C7B4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2DC10();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v1;
  sub_23CA2DBF8(v1, (uint64_t)sub_23CA2C7F8);
  return sub_23CA2DE68();
}

uint64_t sub_23CA2C7F8()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA24398();
  sub_23CA2BC34();
  if (v0)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2C83C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  *(_QWORD *)(v0 + 208) = **(_QWORD **)(v0 + 192);
  *(_QWORD *)(v0 + 216) = v1;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2C860()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0[26] + v0[27]);
  v0[28] = *v1;
  v0[29] = v1[1];
  swift_bridgeObjectRetain();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2C8A4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v12;
  _QWORD *v13;
  BOOL v18;
  _QWORD *v19;
  BOOL v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;

  if (!*(_QWORD *)(v0 + 232))
  {
    v8 = *(_QWORD **)(v0 + 184);
    *v8 = 0;
    v8[1] = 0;
    *(_BYTE *)(*(_QWORD *)(v0 + 184) + 16) = -1;
    sub_23CA2DBD4();
    __asm { BR              X0 }
  }
  if (qword_256BECEF8 != -1)
    swift_once();
  v1 = sub_23CA4B2B8();
  sub_23CA2B764(v1, (uint64_t)qword_256BEF030);
  swift_bridgeObjectRetain_n();
  v2 = sub_23CA4B2A0();
  v3 = sub_23CA4B5DC();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 232);
  if (v4)
  {
    v6 = *(_QWORD *)(v0 + 224);
    v7 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 176) = sub_23CA46BF8(v6, v5, &v28);
    sub_23CA4B600();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23CA1D000, v2, v3, "#JsonTokenizer next character is %s", v7, 0xCu);
    swift_arrayDestroy();
    sub_23CA2BBDC();
  }

  swift_bridgeObjectRelease_n();
  v10 = *(_QWORD *)(v0 + 232);
  if (*(_QWORD *)(v0 + 224) == 123 && v10 == 0xE100000000000000)
  {
    v12 = 0;
    goto LABEL_14;
  }
  if ((sub_23CA28018() & 1) != 0)
  {
    v12 = 0;
LABEL_14:
    swift_bridgeObjectRelease();
    *(_BYTE *)(v0 + 416) = 7;
    *(_QWORD *)(v0 + 392) = v12;
    *(_QWORD *)(v0 + 400) = 0;
    sub_23CA2DC10();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v13;
    sub_23CA2DBF8(v13, (uint64_t)sub_23CA2D480);
    sub_23CA2DBD4();
    return sub_23CA2E7B8();
  }
  if (*(_QWORD *)(v0 + 224) == 125 && v10 == 0xE100000000000000)
  {
    v12 = 1;
    goto LABEL_14;
  }
  if ((sub_23CA28018() & 1) != 0)
  {
    v12 = 1;
    goto LABEL_14;
  }
  if (*(_QWORD *)(v0 + 224) == 91 && v10 == 0xE100000000000000)
  {
    v12 = 2;
    goto LABEL_14;
  }
  if ((sub_23CA28018() & 1) != 0)
  {
    v12 = 2;
    goto LABEL_14;
  }
  if (*(_QWORD *)(v0 + 224) == 93 && v10 == 0xE100000000000000)
  {
    v12 = 3;
    goto LABEL_14;
  }
  if ((sub_23CA28018() & 1) != 0)
  {
    v12 = 3;
    goto LABEL_14;
  }
  v18 = *(_QWORD *)(v0 + 224) == 34 && v10 == 0xE100000000000000;
  if (v18 || (sub_23CA28018() & 1) != 0)
  {
    sub_23CA2DC78();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v19;
    sub_23CA2DBF8(v19, (uint64_t)sub_23CA2CCE0);
    sub_23CA2DBD4();
    return sub_23CA2DFAC();
  }
  else
  {
    if (*(_QWORD *)(v0 + 224) == 44 && v10 == 0xE100000000000000)
    {
      v12 = 4;
      goto LABEL_14;
    }
    if ((sub_23CA28018() & 1) != 0)
    {
      v12 = 4;
      goto LABEL_14;
    }
    v21 = *(_QWORD *)(v0 + 224) == 45 && v10 == 0xE100000000000000;
    if (v21 || (sub_23CA28018() & 1) != 0)
    {
      sub_23CA2DC10();
      v22 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 304) = v22;
      sub_23CA2DBF8(v22, (uint64_t)sub_23CA2CEB0);
      sub_23CA2DBD4();
      return sub_23CA2E98C(v23, v24);
    }
    else if ((sub_23CA4B3A8() & 1) != 0)
    {
      sub_23CA2DC10();
      v25 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 352) = v25;
      *v25 = v0;
      v25[1] = sub_23CA2D160;
      sub_23CA2DBD4();
      return sub_23CA2EBFC(v26);
    }
    else
    {
      sub_23CA2DC78();
      v27 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 368) = v27;
      sub_23CA2DBF8(v27, (uint64_t)sub_23CA2D28C);
      sub_23CA2DBD4();
      return sub_23CA2F408();
    }
  }
}

uint64_t sub_23CA2CCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 248) = a1;
  *(_QWORD *)(v4 + 256) = a2;
  sub_23CA2DC70();
  if (v2)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v4 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2CD3C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  *(_QWORD *)(v0 + 264) = **(_QWORD **)(v0 + 192);
  *(_QWORD *)(v0 + 272) = v1;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2CD60()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0[33] + v0[34]);
  v0[35] = *v1;
  v0[36] = v1[1];
  swift_bridgeObjectRetain();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2CDA4()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v1 + 288);
  if (v2)
  {
    if (v2 == 0xE100000000000000 && *(_QWORD *)(v1 + 280) == 58)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      sub_23CA2DC10();
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 296) = v3;
      sub_23CA2DBF8(v3, (uint64_t)sub_23CA2CE4C);
      return sub_23CA2DC28();
    }
    sub_23CA28018();
    sub_23CA2DC34();
    if ((v0 & 1) != 0)
      goto LABEL_6;
  }
  v5 = *(_QWORD *)(v1 + 256);
  v6 = *(_QWORD **)(v1 + 184);
  *v6 = *(_QWORD *)(v1 + 248);
  v6[1] = v5;
  *(_BYTE *)(*(_QWORD *)(v1 + 184) + 16) = 1;
  return sub_23CA2436C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA2CE4C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA2DC04(v2);
  if (v0)
  {
    swift_bridgeObjectRelease();
    return sub_23CA2436C(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    sub_23CA21048();
    return sub_23CA24378();
  }
}

uint64_t sub_23CA2CE98()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[32];
  v2 = (_QWORD *)v0[23];
  *v2 = v0[31];
  v2[1] = v1;
  *(_BYTE *)(v0[23] + 16) = 0;
  return sub_23CA2DC1C();
}

uint64_t sub_23CA2CEB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23CA2DBC4();
  v3 = *v2;
  *(_QWORD *)(v0 + 312) = v4;
  *(_QWORD *)(v0 + 320) = v5;
  sub_23CA2DC70();
  if (v1)
  {
    sub_23CA2DC58();
    return sub_23CA2436C(*(uint64_t (**)(void))(v3 + 8));
  }
  else
  {
    sub_23CA21048();
    return sub_23CA24378();
  }
}

uint64_t sub_23CA2CF08()
{
  char v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  if (*(_QWORD *)(v1 + 320) && (sub_23CA4B3A8(), sub_23CA2DC34(), (v0 & 1) != 0))
  {
    sub_23CA2DC10();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 328) = v2;
    sub_23CA2DBF8(v2, (uint64_t)sub_23CA2CF78);
    return sub_23CA2DC28();
  }
  else
  {
    *(_OWORD *)*(_QWORD *)(v1 + 184) = *(_OWORD *)(v1 + 224);
    v4 = (uint64_t (*)(void))sub_23CA2DC40();
    return sub_23CA2436C(v4);
  }
}

uint64_t sub_23CA2CF78()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA2DC04(v2);
  if (v0)
  {
    sub_23CA2DC58();
    return sub_23CA2436C(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    sub_23CA21048();
    return sub_23CA24378();
  }
}

uint64_t sub_23CA2CFC0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2DC10();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v1;
  *v1 = v0;
  v1[1] = sub_23CA2D014;
  return sub_23CA2EBFC(v0 + 136);
}

uint64_t sub_23CA2D014()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  sub_23CA2DBC4();
  *v3 = *v2;
  *(_QWORD *)(v0 + 344) = v1;
  swift_task_dealloc();
  if (v1)
    sub_23CA2DC58();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA2D068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  _QWORD v11[2];
  char v12;

  if (!*(_QWORD *)(v0 + 160))
  {
    v4 = *(_QWORD *)(v0 + 224);
    v3 = *(_QWORD *)(v0 + 232);
    v5 = *(_QWORD **)(v0 + 184);
    sub_23CA2DB20(v0 + 136);
    *v5 = v4;
    v5[1] = v3;
    v2 = (uint64_t (*)(void))sub_23CA2DC40();
    return v2();
  }
  v1 = *(_QWORD *)(v0 + 344);
  swift_bridgeObjectRelease();
  sub_23CA2DC84();
  sub_23CA1F350((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_23CA2DC60(v0 + 96, -1, (uint64_t)v11);
  if (v1)
  {
    _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 96);
    v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  v7 = v11[0];
  v8 = v11[1];
  v9 = v12;
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 96);
  *(_BYTE *)(v0 + 416) = v9;
  *(_QWORD *)(v0 + 392) = v7;
  *(_QWORD *)(v0 + 400) = v8;
  sub_23CA2DC10();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 408) = v10;
  sub_23CA2DBF8(v10, (uint64_t)sub_23CA2D480);
  return sub_23CA2E7B8();
}

uint64_t sub_23CA2D160()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  sub_23CA2DBC4();
  *v3 = *v2;
  *(_QWORD *)(v0 + 360) = v1;
  swift_task_dealloc();
  if (v1)
    sub_23CA2DC58();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA2D1B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char v6;
  uint64_t v7;
  _QWORD v9[2];
  char v10;

  if (!v0[10])
  {
    v3 = v0[28];
    v4 = v0[29];
    v5 = (_QWORD *)v0[23];
    sub_23CA2DB20((uint64_t)(v0 + 7));
    *v5 = v3;
    v6 = 5;
LABEL_6:
    v5[1] = v4;
    *(_BYTE *)(v0[23] + 16) = v6;
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  v1 = v0[45];
  swift_bridgeObjectRelease();
  sub_23CA2DC84();
  sub_23CA1F350(v0 + 2, v0[5]);
  sub_23CA2DC60((uint64_t)(v0 + 2), 1, (uint64_t)v9);
  if (!v1)
  {
    v5 = (_QWORD *)v0[23];
    v7 = v9[0];
    v4 = v9[1];
    v6 = v10;
    _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)(v0 + 2));
    *v5 = v7;
    goto LABEL_6;
  }
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)(v0 + 2));
  v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_23CA2D28C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 376) = a1;
  *(_QWORD *)(v4 + 384) = a2;
  sub_23CA2DC70();
  if (v2)
    return sub_23CA20F8C(*(uint64_t (**)(void))(v4 + 8));
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2D2E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  BOOL v7;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v1 = sub_23CA4B3D8();
  v3 = v1 == 1819047278 && v2 == 0xE400000000000000;
  if (v3 || (v4 = v1, v5 = v2, (sub_23CA28018() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_OWORD *)*(_QWORD *)(v0 + 184) = xmmword_23CA4D2F0;
    v6 = 7;
  }
  else
  {
    v7 = v4 == 1702195828 && v5 == 0xE400000000000000;
    if (v7 || (sub_23CA28018() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_OWORD *)*(_QWORD *)(v0 + 184) = xmmword_23CA4D150;
    }
    else
    {
      if (v4 == 0x65736C6166 && v5 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_23CA28018();
        sub_23CA2DC34();
        v10 = *(_QWORD *)(v0 + 384);
        if ((v4 & 1) == 0)
        {
          v11 = *(_QWORD **)(v0 + 184);
          *v11 = *(_QWORD *)(v0 + 376);
          v11[1] = v10;
          v6 = 6;
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      v12 = *(_QWORD **)(v0 + 184);
      *v12 = 0;
      v12[1] = 0;
    }
    v6 = 4;
  }
LABEL_14:
  *(_BYTE *)(*(_QWORD *)(v0 + 184) + 16) = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2D480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA2DBC4();
  sub_23CA2DC04(v3);
  if (v1)
  {
    sub_23CA2B738(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 400), *(_BYTE *)(v0 + 416));
    return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
  }
  else
  {
    sub_23CA21048();
    return sub_23CA24378();
  }
}

uint64_t sub_23CA2D4D0()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 184) = *(_OWORD *)(v0 + 392);
  *(_BYTE *)(*(_QWORD *)(v0 + 184) + 16) = *(_BYTE *)(v0 + 416);
  return sub_23CA2DC1C();
}

uint64_t sub_23CA2D4F0()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2D4F8()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2D500(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  v2 = sub_23CA22494(&qword_256BED400);
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2D558()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[5];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[4] + 16))(v1, v0[2], v0[3]);
  type metadata accessor for JsonTokenStream();
  swift_allocObject();
  v0[6] = sub_23CA2F6E4(v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  sub_23CA2DBF8(v2, (uint64_t)sub_23CA2D5D8);
  return sub_23CA2DC90();
}

uint64_t sub_23CA2D5D8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23CA24398();
  *v2 = *v1;
  *(_QWORD *)(v3 + 64) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA2D628()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48));
}

uint64_t sub_23CA2D670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2D6D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  double v6;
  char v7;
  _QWORD *v8;
  double v9;
  _BYTE v10[40];

  sub_23CA2B7BC(a1, (uint64_t)v10);
  sub_23CA22494(&qword_256BED3E8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *(_QWORD *)&v6 = *(_QWORD *)&v9 * a2;
    if ((unsigned __int128)(*(uint64_t *)&v9 * (__int128)a2) >> 64 == (*(_QWORD *)&v9 * a2) >> 63)
    {
      v7 = 2;
LABEL_6:
      result = _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v10);
      *(double *)a3 = v6;
      *(_QWORD *)(a3 + 8) = 0;
      *(_BYTE *)(a3 + 16) = v7;
      return result;
    }
    __break(1u);
  }
  else
  {
    if (swift_dynamicCast())
    {
      v6 = v9 * (double)a2;
      v7 = 3;
      goto LABEL_6;
    }
    sub_23CA4B648();
    sub_23CA4B420();
    sub_23CA4B66C();
    sub_23CA2DB78();
    swift_allocError();
    *v8 = 0;
    v8[1] = 0xE000000000000000;
    swift_willThrow();
    return _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v10);
  }
  return result;
}

uint64_t sub_23CA2D848@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  j__swift_retain();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA2D878(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23CA2D8C8;
  return sub_23CA2C798(a1);
}

uint64_t sub_23CA2D8C8()
{
  uint64_t v0;

  sub_23CA24398();
  sub_23CA2BC34();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA2D8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = a4;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256BED3D0 + dword_256BED3D0);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_23CA2D978;
  return v10(a1, a2, a3);
}

uint64_t sub_23CA2D978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA2DBC4();
  sub_23CA2DC04(v3);
  if (v1)
    **(_QWORD **)(v0 + 16) = v1;
  return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_23CA2D9C0()
{
  unint64_t result;

  result = qword_256BED3C8;
  if (!qword_256BED3C8)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4D314, &type metadata for JsonTokenizer);
    atomic_store(result, (unint64_t *)&qword_256BED3C8);
  }
  return result;
}

uint64_t sub_23CA2D9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v5;

  v3[3] = a2;
  v3[4] = a3;
  v5 = (_QWORD *)swift_task_alloc();
  v3[5] = v5;
  *v5 = v3;
  v5[1] = sub_23CA2DA50;
  return sub_23CA2C798(a1);
}

uint64_t sub_23CA2DA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;

  sub_23CA2DBC4();
  v3 = *v2;
  *v4 = v3;
  *(_QWORD *)(v0 + 48) = v1;
  swift_task_dealloc();
  if (!v1)
    return sub_23CA2436C(*(uint64_t (**)(void))(v3 + 8));
  if (*(_QWORD *)(v0 + 24))
  {
    swift_getObjectType();
    sub_23CA4B4C8();
  }
  return sub_23CA24378();
}

uint64_t sub_23CA2DAD0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 48);
  sub_23CA22494(&qword_256BED240);
  swift_willThrowTypedImpl();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA2DB20(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA22494(&qword_256BED3E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA2DB60(__int128 *a1, uint64_t a2)
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

unint64_t sub_23CA2DB78()
{
  unint64_t result;

  result = qword_256BED3F0;
  if (!qword_256BED3F0)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4D3C4, &type metadata for JsonTokenizer.JsonTokenizerError);
    atomic_store(result, &qword_256BED3F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for JsonTokenizer.JsonTokenizerError()
{
  return &type metadata for JsonTokenizer.JsonTokenizerError;
}

void sub_23CA2DBC4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_23CA2DBF0()
{
  return swift_task_switch();
}

_QWORD *sub_23CA2DBF8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_23CA2DC04@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t sub_23CA2DC1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2DC28()
{
  return sub_23CA2E7B8();
}

uint64_t sub_23CA2DC34()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA2DC40()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 184) + 16) = 5;
  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_23CA2DC58()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA2DC60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23CA2D6D0(a1, a2, a3);
}

uint64_t sub_23CA2DC70()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA2DC78()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA2DC84()
{
  uint64_t v0;
  __int128 *v1;

  return sub_23CA2DB60(v1, v0);
}

uint64_t sub_23CA2DC90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_23CA22494(&qword_256BED510);
  *(_QWORD *)(v1 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA2DCEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started;
  v0[4] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started;
  v3 = v0[2];
  v2 = v0[3];
  if ((*(_BYTE *)(v3 + v1) & 1) != 0)
  {
    swift_task_dealloc();
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return v4();
  }
  else
  {
    v6 = sub_23CA4B4EC();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v2, 1, 1, v6);
    v7 = sub_23CA33198();
    v8 = (_QWORD *)sub_23CA33AC4();
    v8[2] = v3;
    v8[3] = v7;
    v8[4] = v3;
    swift_retain_n();
    *(_QWORD *)(v3 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_streamingTask) = sub_23CA3BDC8(v2, (uint64_t)&unk_256BED528, (uint64_t)v8);
    swift_release();
    v9 = (_QWORD *)swift_task_alloc();
    v0[5] = v9;
    sub_23CA33934(v9, (uint64_t)sub_23CA2DDE0);
    return sub_23CA3351C();
  }
}

uint64_t sub_23CA2DDE0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA2DC04(v2);
  if (!v0)
    return sub_23CA24378();
  swift_task_dealloc();
  return sub_23CA2436C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA2DE30()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + *(_QWORD *)(v0 + 32)) = 1;
  swift_task_dealloc();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA20F8C(v1);
}

uint64_t sub_23CA2DE68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2DE7C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  *(_QWORD *)(v1 + 24) = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_23CA33A58();
  if (v0 && (sub_23CA28098(), v2 = sub_23CA33AFC(), sub_23CA28090(), (v2 & 1) != 0))
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 32) = v3;
    sub_23CA33934(v3, (uint64_t)sub_23CA2DEF4);
    return sub_23CA3351C();
  }
  else
  {
    v5 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA2436C(v5);
  }
}

uint64_t sub_23CA2DEF4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA2DC04(v2);
  if (v0)
    return sub_23CA2436C(*(uint64_t (**)(void))(v1 + 8));
  else
    return sub_23CA24378();
}

uint64_t sub_23CA2DF3C()
{
  _QWORD *v0;
  char v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  if (*(_QWORD *)(v0[2] + v0[3] + 8) && (sub_23CA28098(), v1 = sub_23CA33AFC(), sub_23CA28090(), (v1 & 1) != 0))
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[4] = v2;
    sub_23CA33934(v2, (uint64_t)sub_23CA2DEF4);
    return sub_23CA3351C();
  }
  else
  {
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA2436C(v4);
  }
}

uint64_t sub_23CA2DFAC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  *(_QWORD *)(v1 + 72) = *v0;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2DFC8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  v2 = sub_23CA33658(v1, (uint64_t)sub_23CA2E008);
  return sub_23CA300A0(v2, v3);
}

uint64_t sub_23CA2E008()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  sub_23CA2DC04(&v3);
  if (v0)
    return sub_23CA2436C((uint64_t (*)(void))v1[1]);
  else
    return sub_23CA24378();
}

uint64_t sub_23CA2E058()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v11;
  uint64_t (*v12)();

  v0[2] = 0;
  v1 = v0[8];
  v0[3] = 0xE000000000000000;
  v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v0[11] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v3 = (uint64_t *)(v1 + v2);
  v4 = v3[1];
  if (!v4 || (v5 = *v3, sub_23CA33B90(), v6) && v5 == 34 || (sub_23CA33524() & 1) != 0)
  {
    v7 = (_QWORD *)swift_task_alloc();
    v0[24] = v7;
    v8 = sub_23CA33658(v7, (uint64_t)sub_23CA2E724);
    return sub_23CA33638(v8, v9);
  }
  else
  {
    if (v4 == 0xE100000000000000 && v5 == 92 || (sub_23CA33524() & 1) != 0)
    {
      v11 = (_QWORD *)swift_task_alloc();
      v0[12] = v11;
      v12 = sub_23CA2E18C;
    }
    else
    {
      v0[4] = 0;
      v0[5] = 0xE000000000000000;
      sub_23CA33648();
      sub_23CA339E4();
      sub_23CA28038();
      sub_23CA337FC();
      sub_23CA28038();
      v11 = (_QWORD *)swift_task_alloc();
      v0[22] = v11;
      v12 = sub_23CA2E5A0;
    }
    sub_23CA33824(v11, (uint64_t)v12);
    return sub_23CA3351C();
  }
}

uint64_t sub_23CA2E18C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA337A4();
  sub_23CA33784(v2);
  *(_QWORD *)(v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
    sub_23CA338A0();
  sub_23CA338CC();
  return sub_23CA3350C();
}

uint64_t sub_23CA2E1E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  BOOL v3;
  _QWORD *v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  sub_23CA33ACC();
  if (v0)
  {
    v3 = *v2 == 117 && v0 == 0xE100000000000000;
    if (v3 || (sub_23CA33B4C(), (sub_23CA33524() & 1) != 0))
    {
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 112) = v4;
      v5 = sub_23CA2E30C;
LABEL_8:
      sub_23CA33824(v4, (uint64_t)v5);
      return sub_23CA335C0();
    }
    v8 = *(_QWORD *)(v1 + 104);
    sub_23CA33648();
    v9 = sub_23CA33B4C();
    sub_23CA311E0(v9, v10);
    if (!v8)
    {
      sub_23CA28038();
      sub_23CA4B420();
      swift_bridgeObjectRelease();
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 160) = v4;
      v5 = sub_23CA2E548;
      goto LABEL_8;
    }
    sub_23CA33A64();
    sub_23CA28038();
  }
  else
  {
    sub_23CA33A64();
    sub_23CA31F88();
    sub_23CA2BC74();
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0;
    *(_BYTE *)(v7 + 16) = 2;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23CA2E30C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  sub_23CA2DBC4();
  sub_23CA33784(v3);
  *(_QWORD *)(v0 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    return sub_23CA24378();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v5;
    *v5 = v2;
    v5[1] = sub_23CA2E390;
    return sub_23CA301CC();
  }
}

uint64_t sub_23CA2E390()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA337A4();
  v1[17] = v2;
  v1[18] = v3;
  v1[19] = v0;
  swift_task_dealloc();
  if (v0)
    sub_23CA338A0();
  sub_23CA338CC();
  return sub_23CA3350C();
}

uint64_t sub_23CA2E3F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v11;
  uint64_t (*v12)();

  v2 = v1[18];
  if (v2)
  {
    v1[6] = v1[17];
    v1[7] = v2;
    sub_23CA4B498();
    v0 = v3;
    sub_23CA4B420();
    sub_23CA28038();
  }
  sub_23CA33ACC();
  if (!v0 || (v5 = *v4, sub_23CA33B90(), v6) && v5 == 34 || (sub_23CA33524() & 1) != 0)
  {
    v7 = (_QWORD *)swift_task_alloc();
    v1[24] = v7;
    v8 = sub_23CA33658(v7, (uint64_t)sub_23CA2E724);
    return sub_23CA33638(v8, v9);
  }
  else
  {
    if (v0 == 0xE100000000000000 && v5 == 92 || (sub_23CA33524() & 1) != 0)
    {
      v11 = (_QWORD *)swift_task_alloc();
      v1[12] = v11;
      v12 = sub_23CA2E18C;
    }
    else
    {
      v1[4] = 0;
      v1[5] = 0xE000000000000000;
      sub_23CA33648();
      sub_23CA339E4();
      sub_23CA28038();
      sub_23CA337FC();
      sub_23CA28038();
      v11 = (_QWORD *)swift_task_alloc();
      v1[22] = v11;
      v12 = sub_23CA2E5A0;
    }
    sub_23CA33824(v11, (uint64_t)v12);
    return sub_23CA3351C();
  }
}

uint64_t sub_23CA2E548()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA337A4();
  sub_23CA33784(v2);
  *(_QWORD *)(v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
    sub_23CA338A0();
  sub_23CA338CC();
  return sub_23CA3350C();
}

uint64_t sub_23CA2E5A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA337A4();
  sub_23CA33784(v2);
  *(_QWORD *)(v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
    sub_23CA338A0();
  sub_23CA338CC();
  return sub_23CA3350C();
}

uint64_t sub_23CA2E5F8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v9)();

  v1 = (uint64_t *)(v0[8] + v0[11]);
  v2 = v1[1];
  if (!v2 || (v3 = *v1, v2 == 0xE100000000000000) && v3 == 34 || (sub_23CA33524() & 1) != 0)
  {
    v4 = (_QWORD *)swift_task_alloc();
    v0[24] = v4;
    v5 = sub_23CA33658(v4, (uint64_t)sub_23CA2E724);
    return sub_23CA33638(v5, v6);
  }
  else
  {
    if (v2 == 0xE100000000000000 && v3 == 92 || (sub_23CA33524() & 1) != 0)
    {
      v8 = (_QWORD *)swift_task_alloc();
      v0[12] = v8;
      v9 = sub_23CA2E18C;
    }
    else
    {
      v0[4] = 0;
      v0[5] = 0xE000000000000000;
      sub_23CA336E0();
      sub_23CA33B4C();
      sub_23CA4B390();
      sub_23CA2BFA0();
      sub_23CA337FC();
      sub_23CA28038();
      v8 = (_QWORD *)swift_task_alloc();
      v0[22] = v8;
      v9 = sub_23CA2E5A0;
    }
    sub_23CA33824(v8, (uint64_t)v9);
    return sub_23CA3351C();
  }
}

uint64_t sub_23CA2E724()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA337A4();
  sub_23CA33784(v2);
  *(_QWORD *)(v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    sub_23CA338A0();
  sub_23CA338CC();
  return sub_23CA3350C();
}

uint64_t sub_23CA2E77C()
{
  uint64_t v0;

  return sub_23CA338A8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA2E788()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E790()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E798()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E7A0()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E7A8()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E7B0()
{
  return sub_23CA2BFDC();
}

uint64_t sub_23CA2E7B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2E7CC()
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
  uint64_t *v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(void);
  _QWORD *v16;

  sub_23CA33A1C();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition);
  sub_23CA2C1C4();
  sub_23CA336E0();
  v4 = sub_23CA338B8();
  sub_23CA2BFA0();
  v5 = *(_QWORD *)(v0 + 40);
  if (v3 >= v4)
  {
    if ((*(_BYTE *)(v5 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) & 1) != 0)
    {
      v14 = (_QWORD *)(v5 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
      *v14 = 0;
      v14[1] = 0;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v16;
    sub_23CA3396C(v16, (uint64_t)sub_23CA2E8F0);
    return sub_23CA33704(1);
  }
  else
  {
    sub_23CA28098();
    sub_23CA4B408();
    v6 = sub_23CA4B480();
    v8 = v7;
    sub_23CA28090();
    v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
    *v9 = v6;
    v9[1] = v8;
    result = swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v1 + v2);
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (!v12)
    {
      *(_QWORD *)(v1 + v2) = v13;
LABEL_6:
      v15 = (uint64_t (*)(void))sub_23CA213D4();
      return sub_23CA33568(v15);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23CA2E8F0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v2 = *v1;
  v5 = *v1;
  sub_23CA2DC04(&v5);
  if (v0)
    return sub_23CA2436C((uint64_t (*)(void))v1[1]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 56) = v4;
  *v4 = v1;
  v4[1] = sub_23CA2E958;
  return sub_23CA3351C();
}

uint64_t sub_23CA2E958()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  sub_23CA24398();
  v1 = *v0;
  sub_23CA33650(&v3);
  return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA2E98C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v2;
  return sub_23CA2DBF0();
}

void sub_23CA2E9A4()
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
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  sub_23CA33A1C();
  v1 = *(_QWORD *)(v0 + 72);
  v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) == 1)
  {
    sub_23CA2C1C4();
    sub_23CA336E0();
    v4 = sub_23CA338B8();
    sub_23CA2BFA0();
    v5 = 0;
    v6 = 0;
    if (v3 >= v4)
    {
LABEL_12:
      (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v5, v6);
      return;
    }
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v1 + v2);
    v9 = __OFADD__(v8, v7);
    v10 = v8 + v7;
    if (v9)
      goto LABEL_15;
    if (!__OFSUB__(v10, 1))
      goto LABEL_11;
    __break(1u);
  }
  v11 = *(_QWORD *)(v0 + 64);
  v12 = v3 + v11;
  if (__OFADD__(v3, v11))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_23CA2C1C4();
  sub_23CA336E0();
  v13 = sub_23CA338B8();
  sub_23CA2BFA0();
  if (v12 >= v13)
  {
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v18;
    *v18 = v0;
    v18[1] = sub_23CA2EB30;
    sub_23CA33704(*(_QWORD *)(v0 + 64));
    return;
  }
  v14 = *(_QWORD *)(v0 + 64);
  v15 = *(_QWORD *)(v1 + v2);
  v9 = __OFADD__(v15, v14);
  v16 = v15 + v14;
  if (!v9)
  {
    if (!__OFSUB__(v16, 1))
    {
LABEL_11:
      sub_23CA28098();
      sub_23CA4B408();
      v5 = sub_23CA4B480();
      v6 = v17;
      sub_23CA28090();
      goto LABEL_12;
    }
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_23CA2EB30()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v2 = *v1;
  v5 = *v1;
  sub_23CA2DC04(&v5);
  if (v0)
    return sub_23CA2436C((uint64_t (*)(void))v1[1]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 88) = v4;
  *v4 = v1;
  v4[1] = sub_23CA2EBA4;
  return sub_23CA2E98C(*(_QWORD *)(v2 + 64), *(unsigned __int8 *)(v2 + 96));
}

uint64_t sub_23CA2EBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_23CA24398();
  v6 = *v3;
  v7 = sub_23CA33650(&v10);
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_23CA2EBFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return sub_23CA2DBF0();
}

void sub_23CA2EC10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  int64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v23;
  uint64_t v24;
  unsigned __int8 v25;
  char v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t (*v41)(void);
  char v42;

  *(_QWORD *)(v2 + 48) = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_23CA33A58();
  v4 = MEMORY[0x24BEE4AF8];
  if (!v1)
  {
LABEL_15:
    if (!*(_QWORD *)(v4 + 16))
    {
      v20 = *(_QWORD *)(v2 + 32);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v20 + 32) = 0;
      *(_OWORD *)v20 = 0u;
      *(_OWORD *)(v20 + 16) = 0u;
LABEL_73:
      v41 = (uint64_t (*)(void))sub_23CA213D4();
      sub_23CA3375C(v41);
      return;
    }
    v14 = v2 + 16;
    *(_QWORD *)(v2 + 16) = v4;
    sub_23CA22494(&qword_256BED490);
    sub_23CA338C4();
    sub_23CA33608();
    sub_23CA338D8();
    if (!v18)
    {
      sub_23CA28090();
      goto LABEL_72;
    }
    if ((v14 & 0x1000000000000000) != 0)
    {
      v0 = sub_23CA33B58(v15, v16, v17, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_23CA328C4);
      LOBYTE(v4) = v42;
      goto LABEL_62;
    }
    if ((v14 & 0x2000000000000000) == 0)
    {
      if ((v15 & 0x1000000000000000) != 0)
        v19 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v19 = (unsigned __int8 *)sub_23CA4B660();
      v0 = (uint64_t)sub_23CA328C4(v19, v16, 10);
      LOBYTE(v4) = v26 & 1;
LABEL_62:
      sub_23CA28090();
      if ((v4 & 1) == 0)
      {
        v35 = *(uint64_t **)(v2 + 32);
        v36 = MEMORY[0x24BEE17A0];
        v35[3] = MEMORY[0x24BEE1768];
        v35[4] = v36;
        *v35 = v0;
        goto LABEL_73;
      }
LABEL_72:
      v40 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)(v40 + 32) = 0;
      *(_OWORD *)v40 = 0u;
      *(_OWORD *)(v40 + 16) = 0u;
      goto LABEL_73;
    }
    sub_23CA33B64();
    if (v23)
    {
      if (!v21)
        goto LABEL_77;
      if (v21 != 1)
      {
        sub_23CA335F4();
        if (!(!v23 & v11))
        {
          v0 = v28;
          if (v27 == 2)
            goto LABEL_61;
          sub_23CA33734();
          if (!(!v23 & v11))
          {
            sub_23CA33B24();
            if (!v23)
            {
              sub_23CA33858();
              while (1)
              {
                sub_23CA336A0();
                if (!v23 & v11)
                  goto LABEL_47;
                sub_23CA335E0();
                if (!v23)
                  goto LABEL_47;
                v0 = v30 + v29;
                if (__OFADD__(v30, v29))
                  goto LABEL_47;
                sub_23CA336C0();
                if (v23)
                  goto LABEL_62;
              }
            }
            goto LABEL_61;
          }
        }
      }
    }
    else
    {
      if (v22 == 45)
      {
        if (v21)
        {
          if (v21 == 1)
            goto LABEL_47;
          sub_23CA335F4();
          if (!v23 & v11)
            goto LABEL_47;
          if (v24 == 2)
          {
            LOBYTE(v4) = 0;
            v0 = -(uint64_t)v25;
            goto LABEL_62;
          }
          sub_23CA33AB0();
          if (!v23 & v11)
            goto LABEL_47;
          sub_23CA3397C();
          if (!v23)
          {
            sub_23CA33858();
            while (1)
            {
              sub_23CA336A0();
              if (!v23 & v11)
                goto LABEL_47;
              sub_23CA335E0();
              if (!v23)
                goto LABEL_47;
              v0 = v38 - v37;
              if (__OFSUB__(v38, v37))
                goto LABEL_47;
              sub_23CA336C0();
              if (v23)
                goto LABEL_62;
            }
          }
LABEL_61:
          LOBYTE(v4) = 0;
          goto LABEL_62;
        }
        __break(1u);
LABEL_77:
        __break(1u);
        return;
      }
      if (v21)
      {
        sub_23CA33734();
        if (!(!v23 & v11))
        {
          v0 = v32;
          if (v31 == 1)
            goto LABEL_61;
          sub_23CA335F4();
          if (!(!v23 & v11))
          {
            sub_23CA33B10();
            if (!v23)
            {
              while (1)
              {
                sub_23CA336A0();
                if (!v23 & v11)
                  goto LABEL_47;
                sub_23CA335E0();
                if (!v23)
                  goto LABEL_47;
                v0 = v34 + v33;
                if (__OFADD__(v34, v33))
                  goto LABEL_47;
                sub_23CA336C0();
                if (v23)
                  goto LABEL_62;
              }
            }
            goto LABEL_61;
          }
        }
      }
    }
LABEL_47:
    v0 = 0;
    LOBYTE(v4) = 1;
    goto LABEL_62;
  }
  v0 = *v3;
  sub_23CA28098();
  if ((sub_23CA4B3A8() & 1) == 0 && (v1 != 0xE100000000000000 || v0 != 46) && (sub_23CA33524() & 1) == 0)
  {
    sub_23CA28090();
    goto LABEL_15;
  }
  if (v1 != 0xE100000000000000 || v0 != 46)
  {
    v8 = sub_23CA33524();
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v8 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_9:
    v5 = sub_23CA33894(0, *(_QWORD *)(v4 + 16) + 1, v6, v7, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
LABEL_11:
  *(_BYTE *)(v2 + 80) = v8 & 1;
  v9 = v5[2];
  sub_23CA33A40();
  if (v11)
  {
    v39 = sub_23CA33834(v10);
    v5 = sub_23CA32024((_QWORD *)v39, v4, 1, (uint64_t)v5, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  *(_QWORD *)(v2 + 56) = v5;
  v5[2] = v4;
  v12 = &v5[2 * v9];
  v12[4] = v0;
  v12[5] = v1;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 64) = v13;
  sub_23CA3396C(v13, (uint64_t)sub_23CA2EFC8);
  sub_23CA33770();
}

uint64_t sub_23CA2EFC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA2DBC4();
  sub_23CA33784(v3);
  *(_QWORD *)(v0 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    return sub_23CA24378();
  swift_bridgeObjectRelease();
  return sub_23CA2436C(*(uint64_t (**)(void))(v2 + 8));
}

void sub_23CA2F020()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  char v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unsigned __int8 v34;
  uint64_t v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unsigned __int8 v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(void);
  char v51;

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 40) + *(_QWORD *)(v0 + 48));
  v2 = v1[1];
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(unsigned __int8 *)(v0 + 80);
  if (!v2)
  {
LABEL_22:
    if (!*(_QWORD *)(v4 + 16))
    {
LABEL_26:
      v22 = *(_QWORD *)(v0 + 32);
      sub_23CA28090();
      *(_QWORD *)(v22 + 32) = 0;
      *(_OWORD *)v22 = 0u;
      *(_OWORD *)(v22 + 16) = 0u;
      goto LABEL_86;
    }
    if (v5)
      goto LABEL_24;
    v23 = v0 + 16;
    *(_QWORD *)(v0 + 16) = v4;
    sub_23CA22494(&qword_256BED490);
    sub_23CA33A88();
    sub_23CA337B4();
    sub_23CA338D8();
    if (!v27)
    {
      sub_23CA28090();
LABEL_84:
      v19 = *(_QWORD *)(v0 + 32);
      goto LABEL_85;
    }
    if ((v4 & 0x1000000000000000) != 0)
    {
      v23 = sub_23CA33B58(v24, v25, v26, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_23CA328C4);
      LOBYTE(v3) = v51;
      goto LABEL_74;
    }
    if ((v4 & 0x2000000000000000) == 0)
    {
      if ((v24 & 0x1000000000000000) != 0)
        v28 = (unsigned __int8 *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v28 = (unsigned __int8 *)sub_23CA4B660();
      v29 = sub_23CA328C4(v28, v25, 10);
      if (v3)
      {
        sub_23CA33880();
        return;
      }
      v23 = (uint64_t)v29;
      LOBYTE(v3) = v30 & 1;
LABEL_74:
      sub_23CA28090();
      if ((v3 & 1) == 0)
      {
        v43 = *(uint64_t **)(v0 + 32);
        v44 = MEMORY[0x24BEE17A0];
        v43[3] = MEMORY[0x24BEE1768];
        v43[4] = v44;
        *v43 = v23;
        goto LABEL_86;
      }
      goto LABEL_84;
    }
    sub_23CA33B64();
    if (v7)
    {
      if (!v31)
        goto LABEL_90;
      if (v31 != 1)
      {
        sub_23CA335F4();
        if (!(!v7 & v13))
        {
          v23 = v36;
          if (v35 == 2)
            goto LABEL_73;
          sub_23CA33734();
          if (!(!v7 & v13))
          {
            sub_23CA33B24();
            if (!v7)
            {
              sub_23CA33858();
              while (1)
              {
                sub_23CA336A0();
                if (!v7 & v13)
                  goto LABEL_59;
                sub_23CA335E0();
                if (!v7)
                  goto LABEL_59;
                v23 = v38 + v37;
                if (__OFADD__(v38, v37))
                  goto LABEL_59;
                sub_23CA336C0();
                if (v7)
                  goto LABEL_74;
              }
            }
            goto LABEL_73;
          }
        }
      }
    }
    else
    {
      if (v32 == 45)
      {
        if (v31)
        {
          if (v31 == 1)
            goto LABEL_59;
          sub_23CA335F4();
          if (!v7 & v13)
            goto LABEL_59;
          if (v33 == 2)
          {
            LOBYTE(v3) = 0;
            v23 = -(uint64_t)v34;
            goto LABEL_74;
          }
          sub_23CA33AB0();
          if (!v7 & v13)
            goto LABEL_59;
          sub_23CA3397C();
          if (!v7)
          {
            sub_23CA33858();
            while (1)
            {
              sub_23CA336A0();
              if (!v7 & v13)
                goto LABEL_59;
              sub_23CA335E0();
              if (!v7)
                goto LABEL_59;
              v23 = v46 - v45;
              if (__OFSUB__(v46, v45))
                goto LABEL_59;
              sub_23CA336C0();
              if (v7)
                goto LABEL_74;
            }
          }
LABEL_73:
          LOBYTE(v3) = 0;
          goto LABEL_74;
        }
        __break(1u);
LABEL_90:
        __break(1u);
        return;
      }
      if (v31)
      {
        sub_23CA33734();
        if (!(!v7 & v13))
        {
          v23 = v40;
          if (v39 == 1)
            goto LABEL_73;
          sub_23CA335F4();
          if (!(!v7 & v13))
          {
            sub_23CA33B10();
            if (!v7)
            {
              while (1)
              {
                sub_23CA336A0();
                if (!v7 & v13)
                  goto LABEL_59;
                sub_23CA335E0();
                if (!v7)
                  goto LABEL_59;
                v23 = v42 + v41;
                if (__OFADD__(v42, v41))
                  goto LABEL_59;
                sub_23CA336C0();
                if (v7)
                  goto LABEL_74;
              }
            }
            goto LABEL_73;
          }
        }
      }
    }
LABEL_59:
    v23 = 0;
    LOBYTE(v3) = 1;
    goto LABEL_74;
  }
  v6 = *v1;
  sub_23CA33648();
  sub_23CA33B4C();
  if ((sub_23CA4B3A8() & 1) != 0)
  {
    if (v5)
      goto LABEL_15;
    goto LABEL_12;
  }
  sub_23CA33B90();
  if ((!v7 || v6 != 46) && (sub_23CA33524() & 1) == 0)
  {
    sub_23CA28038();
    goto LABEL_22;
  }
  if ((v5 & 1) != 0)
  {
    sub_23CA28038();
    if (!*(_QWORD *)(v4 + 16))
      goto LABEL_26;
LABEL_24:
    *(_QWORD *)(v0 + 24) = v4;
    sub_23CA22494(&qword_256BED490);
    sub_23CA33A88();
    v16 = sub_23CA337B4();
    v18 = sub_23CA2FF38(v16, v17);
    v19 = *(_QWORD *)(v0 + 32);
    if ((v20 & 1) == 0)
    {
      v21 = MEMORY[0x24BEE1408];
      *(_QWORD *)(v19 + 24) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(v19 + 32) = v21;
      *(_QWORD *)v19 = v18;
LABEL_86:
      v50 = (uint64_t (*)(void))sub_23CA213D4();
      sub_23CA3375C(v50);
      return;
    }
LABEL_85:
    *(_QWORD *)(v19 + 32) = 0;
    *(_OWORD *)v19 = 0u;
    *(_OWORD *)(v19 + 16) = 0u;
    goto LABEL_86;
  }
LABEL_12:
  sub_23CA33B90();
  if (!v7 || v6 != 46)
  {
    v10 = sub_23CA33524();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_16;
LABEL_20:
    v4 = (unint64_t)sub_23CA337E4(0, *(_QWORD *)(v4 + 16) + 1, v8, v9, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
    goto LABEL_16;
  }
LABEL_15:
  v10 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_20;
LABEL_16:
  *(_BYTE *)(v0 + 80) = v10 & 1;
  v11 = *(_QWORD *)(v4 + 16);
  sub_23CA33A40();
  if (v13)
  {
    v47 = sub_23CA33834(v12);
    v4 = (unint64_t)sub_23CA337E4((_QWORD *)v47, v10, v48, v49, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  *(_QWORD *)(v0 + 56) = v4;
  *(_QWORD *)(v4 + 16) = v10;
  v14 = (_QWORD *)(v4 + 16 * v11);
  v14[4] = v6;
  v14[5] = v2;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v15;
  sub_23CA3396C(v15, (uint64_t)sub_23CA2EFC8);
  sub_23CA33770();
}

uint64_t sub_23CA2F408()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA2F41C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;

  v1[4] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  sub_23CA33A58();
  if (!v0)
    goto LABEL_9;
  v3 = *v2;
  sub_23CA28098();
  if ((sub_23CA4B39C() & 1) == 0)
  {
    sub_23CA28090();
LABEL_9:
    v1[2] = MEMORY[0x24BEE4AF8];
    sub_23CA22494(&qword_256BED490);
    sub_23CA338C4();
    sub_23CA33608();
    sub_23CA33A34();
    return sub_23CA33790(v12, v13, v14);
  }
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_23CA33894(0, v4[2] + 1, v5, v6, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  v8 = v4[2];
  v7 = v4[3];
  if (v8 >= v7 >> 1)
  {
    v15 = sub_23CA33834(v7);
    v4 = sub_23CA33894((_QWORD *)v15, v8 + 1, v16, v17, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  v1[5] = v4;
  v4[2] = v8 + 1;
  v9 = &v4[2 * v8];
  v9[4] = v3;
  v9[5] = v0;
  v10 = (_QWORD *)swift_task_alloc();
  v1[6] = v10;
  *v10 = v1;
  v10[1] = sub_23CA2F560;
  return sub_23CA335C0();
}

uint64_t sub_23CA2F560()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  sub_23CA2DC04(&v3);
  if (!v0)
    return sub_23CA24378();
  swift_bridgeObjectRelease();
  return sub_23CA2436C((uint64_t (*)(void))v1[1]);
}

uint64_t sub_23CA2F5B8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;

  v1 = (uint64_t *)(v0[3] + v0[4]);
  v2 = v1[1];
  v3 = (_QWORD *)v0[5];
  if (!v2)
    goto LABEL_9;
  v4 = *v1;
  sub_23CA28098();
  if ((sub_23CA4B39C() & 1) == 0)
  {
    sub_23CA28090();
LABEL_9:
    v0[2] = v3;
    sub_23CA22494(&qword_256BED490);
    sub_23CA338C4();
    sub_23CA33608();
    sub_23CA33A34();
    return sub_23CA33790(v12, v13, v14);
  }
  if ((sub_23CA33B08() & 1) == 0)
    v3 = sub_23CA33678(0, v3[2] + 1, v5, v6, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  v8 = v3[2];
  v7 = v3[3];
  if (v8 >= v7 >> 1)
  {
    v15 = sub_23CA33834(v7);
    v3 = sub_23CA33678((_QWORD *)v15, v8 + 1, v16, v17, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  v0[5] = v3;
  v3[2] = v8 + 1;
  v9 = &v3[2 * v8];
  v9[4] = v4;
  v9[5] = v2;
  v10 = (_QWORD *)swift_task_alloc();
  v0[6] = v10;
  *v10 = v0;
  v10[1] = sub_23CA2F560;
  return sub_23CA335C0();
}

uint64_t sub_23CA2F6E4(uint64_t a1)
{
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v2 = sub_23CA22494(&qword_256BED548);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_23CA339F4();
  v6 = v5 - v4;
  v7 = sub_23CA22494(&qword_256BED4E8);
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  sub_23CA339F4();
  v10 = v9 - v8;
  v21 = sub_23CA22494(&qword_256BED4C8);
  v11 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  sub_23CA339F4();
  v14 = v13 - v12;
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_readPosition) = 0;
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_buffer);
  *v15 = 0;
  v15[1] = 0xE000000000000000;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_streamingTask) = 0;
  v16 = (_QWORD *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
  *v16 = 0;
  v16[1] = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_started) = 0;
  v17 = v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_sourceStream;
  v18 = sub_23CA22494(&qword_256BED400);
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, a1, v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEE6CA0], v2);
  sub_23CA4B540();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  sub_23CA33B44(v6, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStream, v14, v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v1 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStreamContinuation, v10, v24);
  return v1;
}

uint64_t sub_23CA2F8E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23CA334A8;
  return sub_23CA2F930();
}

uint64_t sub_23CA2F930()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[19] = v0;
  v2 = sub_23CA22494(&qword_256BED538);
  v1[20] = v2;
  v1[21] = *(_QWORD *)(v2 - 8);
  v1[22] = swift_task_alloc();
  v3 = sub_23CA22494(&qword_256BED540);
  v1[23] = v3;
  v1[24] = *(_QWORD *)(v3 - 8);
  v1[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA2F9C0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (qword_256BECEF8 != -1)
    swift_once();
  v1 = sub_23CA2BEDC();
  v0[26] = sub_23CA2B764(v1, (uint64_t)qword_256BEF030);
  v2 = (void *)sub_23CA33A80();
  v3 = sub_23CA4B5DC();
  if (sub_23CA337D4(v3))
  {
    *(_WORD *)sub_23CA2BCB4() = 0;
    sub_23CA33740(&dword_23CA1D000, v4, v5, "Source stream consumer task starting");
    sub_23CA2BBDC();
  }

  v0[13] = 0;
  v0[14] = 0xE000000000000000;
  sub_23CA22494(&qword_256BED400);
  sub_23CA4B4F8();
  v6 = sub_23CA33198();
  v7 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_inputStreamContinuation;
  v0[27] = v6;
  v0[28] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v0[29] = v8;
  *v8 = v0;
  v8[1] = sub_23CA2FB00;
  return sub_23CA4B5A0();
}

uint64_t sub_23CA2FB00()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2DBC4();
  sub_23CA2DC04(v1);
  if (v0)
    swift_bridgeObjectRelease();
  return sub_23CA24378();
}

uint64_t sub_23CA2FB58()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  if (v2)
  {
    v19 = *(_QWORD *)(v0 + 88);
    v3 = HIBYTE(v2) & 0xF;
    *(_QWORD *)(v0 + 16) = v1;
    *(_QWORD *)(v0 + 24) = v2;
    if ((v2 & 0x2000000000000000) == 0)
      v3 = v1 & 0xFFFFFFFFFFFFLL;
    *(_QWORD *)(v0 + 32) = 0;
    *(_QWORD *)(v0 + 40) = v3;
    sub_23CA336E0();
    for (i = sub_23CA4B42C(); v5; i = sub_23CA4B42C())
    {
      v6 = *(_QWORD *)(v0 + 168);
      v7 = *(_QWORD *)(v0 + 176);
      v8 = *(_QWORD *)(v0 + 160);
      *(_QWORD *)(v0 + 72) = i;
      *(_QWORD *)(v0 + 80) = v5;
      sub_23CA22494(&qword_256BED4E8);
      sub_23CA4B570();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    }
    sub_23CA33A64();
    MEMORY[0x242629BF0](v19, v2);
    sub_23CA2BFA0();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v9;
    *v9 = v0;
    v9[1] = sub_23CA2FD78;
    return sub_23CA4B5A0();
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 152);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    *(_QWORD *)(v0 + 136) = 0;
    sub_23CA22494(&qword_256BED4E8);
    sub_23CA33A90();
    *(_BYTE *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete) = 1;
    v13 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 112);
    v14 = (_QWORD *)(v11 + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_buffer);
    sub_23CA33754();
    *v14 = v13;
    v14[1] = v12;
    swift_bridgeObjectRelease();
    v15 = (void *)sub_23CA4B2A0();
    v16 = sub_23CA4B5DC();
    if (sub_23CA337D4(v16))
    {
      *(_WORD *)sub_23CA2BCB4() = 0;
      sub_23CA33740(&dword_23CA1D000, v17, v18, "Source stream is now completely consumed");
      sub_23CA2BBDC();
    }

    sub_23CA33AA4();
    sub_23CA2131C();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23CA2FD78()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2DBC4();
  sub_23CA2DC04(v1);
  if (v0)
    swift_bridgeObjectRelease();
  return sub_23CA24378();
}

void sub_23CA2FDD0()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[24] + 8))(v0[25], v0[23]);
  sub_23CA339CC();
}

void sub_23CA2FE0C()
{
  NSObject *v0;
  os_log_type_t v1;
  _DWORD *v2;

  sub_23CA4B2A0();
  v1 = sub_23CA33670();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (_DWORD *)sub_23CA2BCB4();
    sub_23CA2BCB4();
    *v2 = 138412290;
    sub_23CA339CC();
  }
  sub_23CA338B0();
}

void sub_23CA2FEFC()
{
  sub_23CA22494(&qword_256BED4E8);
  sub_23CA33A90();
  sub_23CA338B0();
}

uint64_t sub_23CA2FF10()
{
  uint64_t v0;

  sub_23CA33AA4();
  sub_23CA2131C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23CA2FF38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _BYTE *v7;
  char v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_23CA4B63C();
    swift_bridgeObjectRelease();
    v6 = v9;
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      v6 = (v3 > 0x20u || ((0x100003E01uLL >> v3) & 1) == 0)
        && (v7 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
        && *v7 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v4 = sub_23CA4B660();
      }
      v6 = sub_23CA330F0(v4, v5, (void (*)(uint64_t *__return_ptr))sub_23CA3315C);
      swift_bridgeObjectRelease();
    }
  }
  if ((v6 & 1) != 0)
    return 0;
  else
    return 0;
}

uint64_t sub_23CA300A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_23CA2DBF0();
}

uint64_t sub_23CA300B8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter);
  v3 = *v1;
  v2 = v1[1];
  if (v2
    && (v3 == *(_QWORD *)(v0 + 16) ? (v4 = v2 == *(_QWORD *)(v0 + 24)) : (v4 = 0), v4 || (sub_23CA4B6D8() & 1) != 0))
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v5;
    *v5 = v0;
    v5[1] = sub_23CA30198;
    return sub_23CA335C0();
  }
  else
  {
    sub_23CA31F88();
    sub_23CA2BC74();
    *(_QWORD *)v7 = v3;
    *(_QWORD *)(v7 + 8) = v2;
    *(_BYTE *)(v7 + 16) = 0;
    sub_23CA336E0();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23CA30198()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  sub_23CA24398();
  v1 = *v0;
  sub_23CA33650(&v3);
  return sub_23CA20F8C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA301CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  return swift_task_switch();
}

uint64_t sub_23CA301E4()
{
  NSObject *v0;
  int64_t v1;
  _QWORD *v2;
  os_log_type_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  _QWORD *v43;
  uint64_t v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;

  sub_23CA2BD64();
  v5 = v2[12];
  v6 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v2[13] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_currentCharacter;
  v7 = *(_QWORD *)(v5 + v6 + 8);
  if (v7)
  {
    v8 = *(_QWORD *)(v5 + v6) == 34 && v7 == 0xE100000000000000;
    if (v8 || (sub_23CA33524() & 1) != 0)
    {
      if (qword_256BECEF8 != -1)
        swift_once();
      v9 = sub_23CA2BEDC();
      sub_23CA2B764(v9, (uint64_t)qword_256BEF030);
      sub_23CA33A80();
      v10 = sub_23CA33670();
      if (sub_23CA337D4(v10))
      {
        *(_WORD *)sub_23CA2BCB4() = 0;
        sub_23CA33740(&dword_23CA1D000, v11, v12, "Unexpected use of unicode escape sequence");
        sub_23CA2BBDC();
      }
      goto LABEL_11;
    }
  }
  v2[9] = MEMORY[0x24BEE4AF8];
  v2[14] = 0;
  sub_23CA33A58();
  if (v0)
  {
    sub_23CA28098();
    v18 = MEMORY[0x24BEE4AF8];
    if ((sub_23CA33B08() & 1) == 0)
      sub_23CA33678(0, *(_QWORD *)(v18 + 16) + 1, v19, v20, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
    sub_23CA33A40();
    if (v22)
    {
      v58 = sub_23CA33834(v21);
      sub_23CA33678((_QWORD *)v58, v1, v59, v60, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
    }
    sub_23CA33A04();
    v23 = (_QWORD *)swift_task_alloc();
    v2[16] = v23;
    v24 = sub_23CA33954(v23, (uint64_t)sub_23CA307F0);
    return sub_23CA33684(v24, v25);
  }
  else
  {
    if (*(_QWORD *)(v17 + 16) > 3uLL)
    {
      v2[5] = v17;
      sub_23CA22494(&qword_256BED490);
      sub_23CA31FC4();
      v36 = sub_23CA4B48C();
      v38 = v37;
      swift_bridgeObjectRetain();
      sub_23CA319A8(v36, v38, 16);
      if ((v39 & 1) != 0)
      {
        if (qword_256BECEF8 != -1)
          swift_once();
        v44 = sub_23CA2BEDC();
        v0 = sub_23CA2B764(v44, (uint64_t)qword_256BEF030);
        sub_23CA336E0();
        sub_23CA4B2A0();
        v45 = sub_23CA33670();
        if (sub_23CA33618(v45))
        {
          v46 = (uint8_t *)sub_23CA2BCB4();
          sub_23CA2BCB4();
          sub_23CA33918();
          *(_DWORD *)v46 = 136315138;
          v47 = sub_23CA336E0();
          v2[6] = sub_23CA339BC(v47, v48, v49, v50);
          sub_23CA337C4();
          sub_23CA33B78();
          sub_23CA2BEA0(&dword_23CA1D000, v0, v3, "Failed to parse unicode sequence %s", v46);
          sub_23CA33628();
          sub_23CA2BBDC();
        }
      }
      else
      {
        v40 = sub_23CA4B768();
        if ((v40 & 0x100000000) == 0)
        {
          v41 = v40;
          result = sub_23CA2BFA0();
          if ((v41 & 0xFFFFFF80) != 0)
          {
            sub_23CA334B0();
            if (v41 >= 0x800)
              v42 = v61;
          }
          else
          {
            if (v41 > 0xFF)
            {
              __break(1u);
              return result;
            }
            v42 = (v41 + 1);
          }
          v2[8] = (v42 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v42) >> 3)) & 7)));
          MEMORY[0x242629BC0](v2 + 8);
          goto LABEL_12;
        }
        if (qword_256BECEF8 != -1)
          swift_once();
        v51 = sub_23CA2BEDC();
        v0 = sub_23CA2B764(v51, (uint64_t)qword_256BEF030);
        sub_23CA336E0();
        sub_23CA4B2A0();
        v52 = sub_23CA33670();
        if (sub_23CA336D0(v52))
        {
          v53 = (uint8_t *)sub_23CA2BCB4();
          sub_23CA2BCB4();
          sub_23CA33A74();
          *(_DWORD *)v53 = 136315138;
          v54 = sub_23CA336E0();
          v2[7] = sub_23CA339BC(v54, v55, v56, v57);
          sub_23CA4B600();
          sub_23CA33B78();
          sub_23CA2BEA0(&dword_23CA1D000, v0, v4, "Failed to parse unicode sequence %s", v53);
          sub_23CA2BE98();
          sub_23CA2BBDC();
        }
      }
      sub_23CA336FC();
LABEL_11:

LABEL_12:
      sub_23CA33A34();
      return sub_23CA33530(v13, v14, v15);
    }
    if (qword_256BECEF8 != -1)
      swift_once();
    v26 = sub_23CA2BEDC();
    v27 = sub_23CA2B764(v26, (uint64_t)qword_256BEF030);
    sub_23CA33A9C();
    sub_23CA4B2A0();
    v28 = sub_23CA33670();
    if (sub_23CA336D0(v28))
    {
      v29 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      sub_23CA33A74();
      *(_DWORD *)v29 = 136315138;
      v2[10] = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_23CA22494(&qword_256BED490);
      sub_23CA31FC4();
      v30 = sub_23CA4B48C();
      v2[11] = sub_23CA33AF4(v30, v31, v32, v33, v34, v35);
      sub_23CA4B600();
      swift_bridgeObjectRelease();
      sub_23CA336FC();
      sub_23CA2BEA0(&dword_23CA1D000, v27, v4, "Incomplete unicode sequence: %s", v29);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    sub_23CA336FC();

    sub_23CA2C1C4();
    sub_23CA33A6C();
    if (!v27)
      goto LABEL_12;
    v43 = (_QWORD *)swift_task_alloc();
    v2[22] = v43;
    sub_23CA33944(v43, (uint64_t)sub_23CA31180);
    return sub_23CA3354C();
  }
}

uint64_t sub_23CA307F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA2DBC4();
  v0[17] = v2;
  v0[18] = v3;
  v0[19] = v1;
  swift_task_dealloc();
  if (v1)
    sub_23CA33B84();
  return sub_23CA24378();
}

uint64_t sub_23CA30858()
{
  _QWORD *v0;
  os_log_type_t v1;
  os_log_type_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t (*v18)();
  char v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t result;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  unsigned int v43;

  sub_23CA2BD64();
  v3 = v0[18];
  if (!v3)
    goto LABEL_11;
  if (v3 == 0xE100000000000000 && v0[17] == 34)
  {
    sub_23CA28090();
    goto LABEL_6;
  }
  v4 = sub_23CA33524();
  sub_23CA28090();
  if ((v4 & 1) == 0)
  {
LABEL_11:
    v17 = (_QWORD *)swift_task_alloc();
    v0[20] = v17;
    v18 = sub_23CA30C90;
LABEL_20:
    sub_23CA33944(v17, (uint64_t)v18);
    return sub_23CA3354C();
  }
LABEL_6:
  v5 = v0[15];
  if (*(_QWORD *)(v5 + 16) <= 3uLL)
  {
    if (qword_256BECEF8 != -1)
      swift_once();
    v6 = sub_23CA2BEDC();
    v7 = sub_23CA2B764(v6, (uint64_t)qword_256BEF030);
    sub_23CA33A9C();
    sub_23CA4B2A0();
    v8 = sub_23CA33670();
    if (sub_23CA33618(v8))
    {
      v9 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      sub_23CA33918();
      *(_DWORD *)v9 = 136315138;
      v0[10] = v5;
      swift_bridgeObjectRetain();
      sub_23CA22494(&qword_256BED490);
      sub_23CA31FC4();
      v10 = sub_23CA338F0();
      v16 = sub_23CA33AF4(v10, v11, v12, v13, v14, v15);
      sub_23CA33868(v16);
      swift_bridgeObjectRelease();
      sub_23CA336FC();
      sub_23CA2BEA0(&dword_23CA1D000, v7, v1, "Incomplete unicode sequence: %s", v9);
      sub_23CA33628();
      sub_23CA2BBDC();
    }
    sub_23CA336FC();

    sub_23CA2C1C4();
    sub_23CA33A6C();
    if (v7)
    {
      v17 = (_QWORD *)swift_task_alloc();
      v0[22] = v17;
      v18 = sub_23CA31180;
      goto LABEL_20;
    }
    goto LABEL_30;
  }
  v0[5] = v5;
  sub_23CA22494(&qword_256BED490);
  sub_23CA338C4();
  sub_23CA33608();
  sub_23CA33994();
  sub_23CA339D4();
  if ((v19 & 1) != 0)
  {
    if (qword_256BECEF8 != -1)
      swift_once();
    v24 = sub_23CA2BEDC();
    v25 = sub_23CA2B764(v24, (uint64_t)qword_256BEF030);
    sub_23CA33648();
    sub_23CA4B2A0();
    v26 = sub_23CA33670();
    if (sub_23CA33618(v26))
    {
      v27 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      sub_23CA33918();
      *(_DWORD *)v27 = 136315138;
      v28 = sub_23CA33648();
      v0[6] = sub_23CA336B0(v28, v29, v30, v31);
      sub_23CA337C4();
      sub_23CA337F0();
      sub_23CA2BEA0(&dword_23CA1D000, v25, v1, "Failed to parse unicode sequence %s", v27);
      sub_23CA33628();
      sub_23CA2BBDC();
    }
    goto LABEL_29;
  }
  v20 = sub_23CA4B768();
  if ((v20 & 0x100000000) != 0)
  {
    if (qword_256BECEF8 != -1)
      swift_once();
    v32 = sub_23CA2BEDC();
    v25 = sub_23CA2B764(v32, (uint64_t)qword_256BEF030);
    sub_23CA33648();
    sub_23CA4B2A0();
    v33 = sub_23CA33670();
    if (sub_23CA336D0(v33))
    {
      v34 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      sub_23CA33A74();
      *(_DWORD *)v34 = 136315138;
      v35 = sub_23CA33648();
      v39 = sub_23CA336B0(v35, v36, v37, v38);
      sub_23CA33840(v39);
      sub_23CA337F0();
      sub_23CA2BEA0(&dword_23CA1D000, v25, v2, "Failed to parse unicode sequence %s", v34);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
LABEL_29:
    sub_23CA336FC();

LABEL_30:
    sub_23CA33A34();
    return sub_23CA33530(v40, v41, v42);
  }
  v21 = v20;
  result = sub_23CA28038();
  if ((v21 & 0xFFFFFF80) != 0)
  {
    sub_23CA334B0();
    if (v21 >= 0x800)
      v23 = v43;
LABEL_17:
    sub_23CA33580(v23);
  }
  if (v21 <= 0xFF)
  {
    v23 = (v21 + 1);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA30C90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 168) = v1;
  swift_task_dealloc();
  if (v1)
    sub_23CA33B84();
  return sub_23CA24378();
}

uint64_t sub_23CA30CE8()
{
  int64_t v0;
  _QWORD *v1;
  os_log_type_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  _QWORD *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(void);
  _BOOL8 v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;

  sub_23CA2BD64();
  v4 = v1[15];
  if (v1[14] == 3 || (++v1[14], !*(_QWORD *)(v1[12] + v1[13] + 8)))
  {
    if (*(_QWORD *)(v4 + 16) <= 3uLL)
    {
      if (qword_256BECEF8 != -1)
        swift_once();
      v13 = sub_23CA2BEDC();
      v14 = sub_23CA2B764(v13, (uint64_t)qword_256BEF030);
      sub_23CA33A9C();
      sub_23CA4B2A0();
      v15 = sub_23CA33670();
      if (sub_23CA33618(v15))
      {
        v16 = (uint8_t *)sub_23CA2BCB4();
        sub_23CA2BCB4();
        sub_23CA33918();
        *(_DWORD *)v16 = 136315138;
        v1[10] = v4;
        sub_23CA33648();
        sub_23CA22494(&qword_256BED490);
        sub_23CA31FC4();
        v17 = sub_23CA338F0();
        v23 = sub_23CA33AF4(v17, v18, v19, v20, v21, v22);
        sub_23CA33868(v23);
        swift_bridgeObjectRelease();
        sub_23CA336FC();
        sub_23CA2BEA0(&dword_23CA1D000, v14, v2, "Incomplete unicode sequence: %s", v16);
        sub_23CA33628();
        sub_23CA2BBDC();
      }
      sub_23CA336FC();

      sub_23CA2C1C4();
      sub_23CA33A6C();
      if (v14)
      {
        v28 = (_QWORD *)swift_task_alloc();
        v1[22] = v28;
        sub_23CA33944(v28, (uint64_t)sub_23CA31180);
        return sub_23CA3354C();
      }
      goto LABEL_29;
    }
    v1[5] = v4;
    sub_23CA22494(&qword_256BED490);
    sub_23CA338C4();
    sub_23CA33608();
    sub_23CA33994();
    sub_23CA339D4();
    if ((v24 & 1) != 0)
    {
      if (qword_256BECEF8 != -1)
        swift_once();
      v29 = sub_23CA2BEDC();
      v30 = sub_23CA2B764(v29, (uint64_t)qword_256BEF030);
      sub_23CA33648();
      sub_23CA4B2A0();
      v31 = sub_23CA33670();
      if (sub_23CA33618(v31))
      {
        v32 = (uint8_t *)sub_23CA2BCB4();
        sub_23CA2BCB4();
        sub_23CA33918();
        *(_DWORD *)v32 = 136315138;
        v33 = sub_23CA33648();
        v1[6] = sub_23CA336B0(v33, v34, v35, v36);
        sub_23CA337C4();
        sub_23CA337F0();
        sub_23CA2BEA0(&dword_23CA1D000, v30, v2, "Failed to parse unicode sequence %s", v32);
        sub_23CA33628();
        sub_23CA2BBDC();
      }
      goto LABEL_28;
    }
    v25 = sub_23CA4B768();
    if ((v25 & 0x100000000) != 0)
    {
      if (qword_256BECEF8 == -1)
        goto LABEL_26;
    }
    else
    {
      v26 = v25;
      sub_23CA28038();
      if ((v26 & 0xFFFFFF80) != 0)
      {
        sub_23CA334B0();
        if (v26 >= 0x800)
          v27 = v51;
LABEL_18:
        sub_23CA33580(v27);
      }
      if (v26 <= 0xFF)
      {
        v27 = (v26 + 1);
        goto LABEL_18;
      }
      __break(1u);
    }
    swift_once();
LABEL_26:
    v37 = sub_23CA2BEDC();
    v30 = sub_23CA2B764(v37, (uint64_t)qword_256BEF030);
    sub_23CA33648();
    sub_23CA4B2A0();
    v38 = sub_23CA33670();
    if (sub_23CA336D0(v38))
    {
      v39 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      sub_23CA33A74();
      *(_DWORD *)v39 = 136315138;
      v40 = sub_23CA33648();
      v44 = sub_23CA336B0(v40, v41, v42, v43);
      sub_23CA33840(v44);
      sub_23CA337F0();
      sub_23CA2BEA0(&dword_23CA1D000, v30, v3, "Failed to parse unicode sequence %s", v39);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
LABEL_28:
    sub_23CA336FC();

LABEL_29:
    sub_23CA33A34();
    return sub_23CA33530(v45, v46, v47);
  }
  sub_23CA28098();
  if ((sub_23CA33B08() & 1) == 0)
    sub_23CA33678(0, *(_QWORD *)(v4 + 16) + 1, v5, v6, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  sub_23CA33A40();
  if (v8)
  {
    v48 = sub_23CA33834(v7);
    sub_23CA33678((_QWORD *)v48, v0, v49, v50, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  sub_23CA33A04();
  v9 = (_QWORD *)swift_task_alloc();
  v1[16] = v9;
  v10 = sub_23CA33954(v9, (uint64_t)sub_23CA307F0);
  return sub_23CA33684(v10, v11);
}

uint64_t sub_23CA31180()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 184) = v1;
  swift_task_dealloc();
  return sub_23CA24378();
}

uint64_t sub_23CA311D0()
{
  uint64_t v0;

  return sub_23CA338A8(0, 0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA311E0(uint64_t a1, unint64_t a2)
{
  BOOL v2;
  uint64_t v5;
  BOOL v6;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1 == 110 && a2 == 0xE100000000000000;
  if (v2 || (sub_23CA4B6D8() & 1) != 0)
    return 10;
  v6 = a1 == 116 && a2 == 0xE100000000000000;
  if (v6 || (sub_23CA4B6D8() & 1) != 0)
    return 9;
  v8 = a1 == 98 && a2 == 0xE100000000000000;
  if (v8 || (sub_23CA4B6D8() & 1) != 0)
    return 8;
  v9 = a1 == 102 && a2 == 0xE100000000000000;
  if (v9 || (sub_23CA4B6D8() & 1) != 0)
    return 12;
  v10 = a1 == 114 && a2 == 0xE100000000000000;
  if (v10 || (sub_23CA4B6D8() & 1) != 0)
    return 13;
  v5 = 34;
  v11 = a1 == 34 && a2 == 0xE100000000000000;
  if (!v11 && (sub_23CA4B6D8() & 1) == 0)
  {
    v5 = 92;
    v12 = a1 == 92 && a2 == 0xE100000000000000;
    if (!v12 && (sub_23CA4B6D8() & 1) == 0)
    {
      if (qword_256BECEF8 != -1)
        swift_once();
      v13 = sub_23CA4B2B8();
      sub_23CA2B764(v13, (uint64_t)qword_256BEF030);
      swift_bridgeObjectRetain_n();
      v14 = sub_23CA4B2A0();
      v15 = sub_23CA4B5E8();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        v17 = swift_slowAlloc();
        v18 = v17;
        *(_DWORD *)v16 = 136315138;
        swift_bridgeObjectRetain();
        sub_23CA46BF8(a1, a2, &v18);
        sub_23CA4B600();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23CA1D000, v14, v15, "Unknown json escape sequence of type \\%s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24262A250](v17, -1, -1);
        MEMORY[0x24262A250](v16, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return 0;
    }
  }
  return v5;
}

uint64_t sub_23CA314E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  v3 = sub_23CA22494(&qword_256BED4C0);
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA3154C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  _QWORD *v6;

  sub_23CA33A1C();
  v1 = v0[10];
  v2 = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete;
  v0[14] = OBJC_IVAR____TtC19GenerativeFunctions15JsonTokenStream_complete;
  if ((*(_BYTE *)(v1 + v2) & 1) != 0)
    goto LABEL_2;
  v5 = v0[9];
  sub_23CA22494(&qword_256BED4C8);
  sub_23CA4B4F8();
  if (v5 < 1)
  {
    if ((*(_BYTE *)(v0[10] + v0[14]) & 1) != 0)
    {
      sub_23CA33924();
      swift_bridgeObjectRelease();
    }
    else
    {
      v0[7] = MEMORY[0x24BEE4AF8];
      sub_23CA22494(&qword_256BED490);
      sub_23CA31FC4();
      sub_23CA4B48C();
      sub_23CA33754();
      sub_23CA4B420();
      swift_endAccess();
      swift_bridgeObjectRelease();
      sub_23CA33924();
    }
LABEL_2:
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA33568(v3);
  }
  v0[15] = MEMORY[0x24BEE4AF8];
  v6 = (_QWORD *)swift_task_alloc();
  v0[16] = v6;
  sub_23CA33900(v6);
  return sub_23CA3371C();
}

uint64_t sub_23CA316A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 136) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  return sub_23CA24378();
}

uint64_t sub_23CA31708()
{
  NSObject *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void);
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;

  sub_23CA33A1C();
  v2 = v1[5];
  v3 = v1[6];
  if (!v3)
  {
    swift_bridgeObjectRelease();
    if (qword_256BECF00 != -1)
      swift_once();
    v15 = sub_23CA2BEDC();
    sub_23CA2B764(v15, (uint64_t)qword_256BEF048);
    sub_23CA33A80();
    v16 = sub_23CA33670();
    if (os_log_type_enabled(v0, v16))
    {
      v17 = v1[9];
      v18 = (uint8_t *)sub_23CA2BCB4();
      *(_DWORD *)v18 = 134217984;
      v1[8] = v17;
      sub_23CA4B600();
      sub_23CA2BEA0(&dword_23CA1D000, v0, v16, "Async iteration ended prematurely while awaiting for %ld characters to be buffered in", v18);
      sub_23CA2BBDC();
    }
    v20 = v1[12];
    v19 = v1[13];

    v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
    v22 = v19;
    goto LABEL_16;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = (_QWORD *)v1[15];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v7 = sub_23CA337E4(0, v7[2] + 1, v5, v6, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  v9 = v7[2];
  v8 = v7[3];
  v10 = v9 + 1;
  if (v9 >= v8 >> 1)
  {
    v26 = sub_23CA33834(v8);
    v7 = sub_23CA337E4((_QWORD *)v26, v9 + 1, v27, v28, &qword_256BED4A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA322F0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA325D4);
  }
  v11 = v1[9];
  v7[2] = v10;
  v12 = &v7[2 * v9];
  v12[4] = v2;
  v12[5] = v3;
  if (v10 < v11)
  {
    v1[15] = v7;
    v13 = (_QWORD *)swift_task_alloc();
    v1[16] = v13;
    sub_23CA33900(v13);
    return sub_23CA3371C();
  }
  v23 = v1[13];
  v24 = v1[12];
  if ((*(_BYTE *)(v1[10] + v1[14]) & 1) == 0)
  {
    v1[7] = v7;
    sub_23CA22494(&qword_256BED490);
    sub_23CA33A88();
    sub_23CA337B4();
    sub_23CA33754();
    sub_23CA4B420();
    swift_endAccess();
    sub_23CA28038();
    v21 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8);
    v22 = v23;
LABEL_16:
    sub_23CA33B44(v22, v21);
    goto LABEL_17;
  }
  sub_23CA33B44(v1[13], *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  sub_23CA28090();
LABEL_17:
  swift_task_dealloc();
  v25 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA33568(v25);
}

uint64_t sub_23CA3196C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  sub_23CA2131C();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA319A8(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 *v17;
  unsigned int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 *v25;
  unsigned int v26;
  char v27;
  uint64_t v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  unsigned __int8 *v32;
  unsigned int v33;
  char v34;
  uint64_t v35;
  char v36;
  _QWORD v37[3];

  if ((unint64_t)(a3 - 37) < 0xFFFFFFFFFFFFFFDDLL)
  {
    __break(1u);
LABEL_74:
    swift_bridgeObjectRelease();
    return 0;
  }
  v4 = HIBYTE(a2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
    goto LABEL_74;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v8 = (unsigned __int8 *)sub_23CA4B660();
      v9 = (uint64_t)sub_23CA328C4(v8, v5, a3);
      v11 = v10 & 1;
      goto LABEL_11;
    }
    v37[0] = result;
    v37[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (v4)
      {
        v21 = v4 - 1;
        if (v21)
        {
          v13 = 0;
          v22 = a3 + 48;
          v23 = a3 + 55;
          v24 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            v22 = 58;
          }
          else
          {
            v24 = 97;
            v23 = 65;
          }
          v25 = (unsigned __int8 *)v37 + 1;
          v11 = 1;
          do
          {
            v26 = *v25;
            if (v26 < 0x30 || v26 >= v22)
            {
              if (v26 < 0x41 || v26 >= v23)
              {
                v9 = 0;
                if (v26 < 0x61 || v26 >= v24)
                  goto LABEL_11;
                v27 = -87;
              }
              else
              {
                v27 = -55;
              }
            }
            else
            {
              v27 = -48;
            }
            v28 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63)
              goto LABEL_72;
            v13 = v28 + (v26 + v27);
            if (__OFADD__(v28, (v26 + v27)))
              goto LABEL_72;
            ++v25;
            --v21;
          }
          while (v21);
LABEL_71:
          v11 = 0;
          v9 = v13;
          goto LABEL_11;
        }
        goto LABEL_72;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v4)
        {
          v13 = 0;
          v29 = a3 + 48;
          v30 = a3 + 55;
          v31 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            v29 = 58;
          }
          else
          {
            v31 = 97;
            v30 = 65;
          }
          v32 = (unsigned __int8 *)v37;
          v11 = 1;
          while (1)
          {
            v33 = *v32;
            if (v33 < 0x30 || v33 >= v29)
            {
              if (v33 < 0x41 || v33 >= v30)
              {
                v9 = 0;
                if (v33 < 0x61 || v33 >= v31)
                  goto LABEL_11;
                v34 = -87;
              }
              else
              {
                v34 = -55;
              }
            }
            else
            {
              v34 = -48;
            }
            v35 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63)
              goto LABEL_72;
            v13 = v35 + (v33 + v34);
            if (__OFADD__(v35, (v33 + v34)))
              goto LABEL_72;
            ++v32;
            if (!--v4)
              goto LABEL_71;
          }
        }
        goto LABEL_72;
      }
      if (v4)
      {
        v12 = v4 - 1;
        if (v12)
        {
          v13 = 0;
          v14 = a3 + 48;
          v15 = a3 + 55;
          v16 = a3 + 87;
          if ((unint64_t)a3 > 0xA)
          {
            v14 = 58;
          }
          else
          {
            v16 = 97;
            v15 = 65;
          }
          v17 = (unsigned __int8 *)v37 + 1;
          v11 = 1;
          while (1)
          {
            v18 = *v17;
            if (v18 < 0x30 || v18 >= v14)
            {
              if (v18 < 0x41 || v18 >= v15)
              {
                v9 = 0;
                if (v18 < 0x61 || v18 >= v16)
                  goto LABEL_11;
                v19 = -87;
              }
              else
              {
                v19 = -55;
              }
            }
            else
            {
              v19 = -48;
            }
            v20 = v13 * a3;
            if ((unsigned __int128)(v13 * (__int128)a3) >> 64 != (v13 * a3) >> 63)
              break;
            v13 = v20 - (v18 + v19);
            if (__OFSUB__(v20, (v18 + v19)))
              break;
            ++v17;
            if (!--v12)
              goto LABEL_71;
          }
        }
LABEL_72:
        v9 = 0;
        v11 = 1;
        goto LABEL_11;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  v9 = sub_23CA33000(result, a2, a3, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_23CA33494);
  v11 = v36;
LABEL_11:
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    return 0;
  else
    return v9;
}

void sub_23CA31CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23CA22494(&qword_256BED400);
  sub_23CA336E8(v0);
  v1 = sub_23CA22494(&qword_256BED4C8);
  sub_23CA336E8(v1);
  v2 = sub_23CA22494(&qword_256BED4E8);
  sub_23CA336E8(v2);
  sub_23CA33B38();
  swift_release();
  sub_23CA33B38();
  swift_defaultActor_destroy();
  sub_23CA23110();
}

uint64_t sub_23CA31D74()
{
  sub_23CA31CD8();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23CA31D8C()
{
  return type metadata accessor for JsonTokenStream();
}

uint64_t type metadata accessor for JsonTokenStream()
{
  uint64_t result;

  result = qword_256BED440;
  if (!qword_256BED440)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23CA31DCC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23CA31EF8(319, &qword_256BED450, MEMORY[0x24BEE0D00], (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
  if (v0 <= 0x3F)
  {
    sub_23CA31EF8(319, &qword_256BED458, MEMORY[0x24BEE0718], (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
    if (v1 <= 0x3F)
    {
      sub_23CA31EF8(319, &qword_256BED460, MEMORY[0x24BEE0718], (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6CD0]);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_23CA31EF8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_23CA23CAC(&qword_256BED240);
    v9 = a4(a1, a3, v8, MEMORY[0x24BEE3F20]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_23CA31F64()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA31F70()
{
  return sub_23CA31F64();
}

unint64_t sub_23CA31F88()
{
  unint64_t result;

  result = qword_256BED480;
  if (!qword_256BED480)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4D4D8, &type metadata for JsonTokenStream.TokenizerError);
    atomic_store(result, &qword_256BED480);
  }
  return result;
}

unint64_t sub_23CA31FC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BED498;
  if (!qword_256BED498)
  {
    v1 = sub_23CA23CAC(&qword_256BED490);
    result = MEMORY[0x24262A1B4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, &qword_256BED498);
  }
  return result;
}

_QWORD *sub_23CA32008(_QWORD *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_23CA32024(a1, a2, a3, a4, &qword_256BED4F8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_23CA323E4, (void (*)(uint64_t, uint64_t, _QWORD *))sub_23CA32658);
}

_QWORD *sub_23CA32024(_QWORD *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  char v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;

  v10 = (char)result;
  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
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
  if (v14)
  {
    sub_23CA22494(a5);
    v15 = (_QWORD *)sub_23CA33AC4();
    v16 = j__malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v17 = v15 + 4;
  if ((v10 & 1) != 0)
  {
    a7(a4 + 32, v13, v17);
    *(_QWORD *)(a4 + 16) = 0;
    sub_23CA28038();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

uint64_t sub_23CA32114(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_23CA3213C(a1, a2, a3, a4, &qword_256BED500, (void (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_23CA32128(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_23CA3213C(a1, a2, a3, a4, &qword_256BED4F0, (void (*)(_QWORD))type metadata accessor for ObjectStreamingSupport);
}

uint64_t sub_23CA3213C(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23CA22494(a5);
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = j__malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_24:
    sub_23CA335CC();
    sub_23CA33A4C();
    result = sub_23CA4B690();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    sub_23CA326E0(a4 + v20, v11, v21, a6);
    *(_QWORD *)(a4 + 16) = 0;
    sub_23CA28038();
  }
  else
  {
    sub_23CA324D8(0, v11, v21, a4, (uint64_t (*)(_QWORD))a6);
  }
  return (uint64_t)v16;
}

uint64_t sub_23CA322F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_23CA4B6A8();
  __break(1u);
  return result;
}

uint64_t sub_23CA323E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_23CA4B6A8();
  __break(1u);
  return result;
}

uint64_t sub_23CA324D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      sub_23CA28038();
      return v14;
    }
  }
  sub_23CA335CC();
  sub_23CA33A4C();
  result = sub_23CA4B6A8();
  __break(1u);
  return result;
}

char *sub_23CA325D4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23CA4B6A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_23CA32658(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_23CA335CC();
    __src = (char *)sub_23CA3380C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_23CA326BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23CA326E0(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_23CA326C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23CA326E0(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE3B5D8]);
}

uint64_t sub_23CA326D4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23CA326E0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for ObjectStreamingSupport);
}

uint64_t sub_23CA326E0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    sub_23CA335CC();
    result = sub_23CA3380C();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    sub_23CA33AE0();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    sub_23CA33AE0();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

void sub_23CA327AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (v2)
  {
    sub_23CA22494(&qword_256BED4B0);
    v4 = (_QWORD *)sub_23CA33AC4();
    v5 = j__malloc_size(v4);
    v4[2] = a1;
    v4[3] = 2 * v5 - 64;
  }
  sub_23CA23110();
}

void sub_23CA32808(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = sub_23CA4B474();
    sub_23CA339A4(v4);
  }
  else
  {
    v3 = MEMORY[0x242629C2C](15, a1 >> 16);
    sub_23CA339A4(v3);
  }
  sub_23CA23110();
}

_BYTE *sub_23CA3285C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unsigned __int8 *sub_23CA328C4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v5 = a2 - 1;
      if (a2 != 1)
      {
        v6 = a3 + 48;
        v7 = a3 + 55;
        v8 = a3 + 87;
        if (a3 > 10)
        {
          v6 = 58;
        }
        else
        {
          v8 = 97;
          v7 = 65;
        }
        if (result)
        {
          v9 = 0;
          for (i = result + 1; ; ++i)
          {
            v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
                v12 = -87;
              }
              else
              {
                v12 = -55;
              }
            }
            else
            {
              v12 = -48;
            }
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
              return 0;
            if (!--v5)
              return (unsigned __int8 *)v9;
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA32B40()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23CA32B9C();
  v4 = sub_23CA32BD0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23CA32B9C()
{
  return sub_23CA4B4A4();
}

uint64_t sub_23CA32BD0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    sub_23CA32D14(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      sub_23CA327AC(v9, 0);
      v12 = v11;
      sub_23CA32E00(v16, v11 + 32, v10, a1, a2, a3, a4);
      v14 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v14 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v12 = MEMORY[0x24BEE4AF8];
    }
    v15 = MEMORY[0x242629BC0](v12 + 32, *(_QWORD *)(v12 + 16));
    swift_release();
    return v15;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x242629BC0);
LABEL_9:
      sub_23CA4B660();
      goto LABEL_12;
    }
    v16[0] = a3;
    v16[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x242629BC0]((char *)v16 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_23CA32D14(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a1;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    sub_23CA32808(a1, a3, a4);
    v7 = v10;
  }
  if ((a2 & 0xC) == v9)
  {
    sub_23CA32808(a2, a3, a4);
    a2 = v11;
    if ((a4 & 0x1000000000000000) == 0)
      return;
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return;
  }
  v12 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v12 = a3 & 0xFFFFFFFFFFFFLL;
  if (v12 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v12 >= a2 >> 16)
  {
    sub_23CA4B45C();
    return;
  }
  __break(1u);
}

void sub_23CA32E00(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v11 = a4;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v29 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = a4;
LABEL_33:
    *a1 = a4;
    a1[1] = a5;
    a1[2] = a6;
    a1[3] = a7;
    a1[4] = v11;
    return;
  }
  v13 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v23 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v24 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v25 = v16;
  v28 = a3 - 1;
  v11 = a4;
  while (1)
  {
    v17 = v11;
    if ((v11 & 0xC) == v15)
      sub_23CA32808(v11, a6, a7);
    if (v17 >> 14 < v29 || v17 >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      v21 = sub_23CA4B468();
    }
    else
    {
      v19 = v17 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v30[0] = a6;
        v30[1] = v24;
        v21 = *((_BYTE *)v30 + v19);
      }
      else
      {
        v20 = v23;
        if ((a6 & 0x1000000000000000) == 0)
          v20 = sub_23CA4B660();
        v21 = *(_BYTE *)(v20 + v19);
      }
    }
    if ((v11 & 0xC) == v15)
    {
      sub_23CA32808(v11, a6, a7);
      v11 = v22;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v25 <= v11 >> 16)
      goto LABEL_35;
    v11 = sub_23CA4B444();
LABEL_31:
    *(_BYTE *)(a2 + v13) = v21;
    if (v28 != v13)
    {
      ++v13;
      if (v10 != v11 >> 14)
        continue;
    }
    goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_23CA33000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v15 = a1;
  v16 = a2;
  swift_bridgeObjectRetain();
  v7 = sub_23CA4B498();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = &v15;
    goto LABEL_7;
  }
  v7 = sub_23CA32B40();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (_QWORD *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (_QWORD *)sub_23CA4B660();
  }
LABEL_7:
  v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_23CA330F0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  uint64_t v3;
  char v4;
  uint64_t var2;

  if (a1)
  {
    a3(&var2);
    if (!v3)
      v4 = var2;
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, _QWORD, _QWORD))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3)
      v4 = BYTE1(var2);
  }
  return v4 & 1;
}

_BYTE *sub_23CA33144@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_23CA3285C(a1, a2);
}

_QWORD *sub_23CA3315C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
    *a1 = v5;
  return result;
}

unint64_t sub_23CA33198()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BED520;
  if (!qword_256BED520)
  {
    v1 = type metadata accessor for JsonTokenStream();
    result = MEMORY[0x24262A1B4](&unk_23CA4D4A0, v1);
    atomic_store(result, (unint64_t *)&qword_256BED520);
  }
  return result;
}

uint64_t sub_23CA331D8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23CA33204()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23CA33270;
  return sub_23CA2F8E8();
}

uint64_t sub_23CA33270()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  sub_23CA24398();
  v1 = *v0;
  sub_23CA33650(&v3);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23CA332B0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for JsonTokenStream.TokenizerError(uint64_t a1)
{
  return sub_23CA332D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23CA332D8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s19GenerativeFunctions15JsonTokenStreamC14TokenizerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA332B0(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JsonTokenStream.TokenizerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA332B0(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23CA332D8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for JsonTokenStream.TokenizerError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23CA332D8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JsonTokenStream.TokenizerError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for JsonTokenStream.TokenizerError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23CA33454(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23CA3346C(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for JsonTokenStream.TokenizerError()
{
  return &type metadata for JsonTokenStream.TokenizerError;
}

unsigned __int8 *sub_23CA33494(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA328C4(a1, a2, a3);
}

uint64_t sub_23CA3350C()
{
  return swift_task_switch();
}

uint64_t sub_23CA3351C()
{
  return sub_23CA2E7B8();
}

uint64_t sub_23CA33524()
{
  return sub_23CA4B6D8();
}

uint64_t sub_23CA33530(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_23CA3354C()
{
  return sub_23CA2E7B8();
}

uint64_t sub_23CA33568(uint64_t (*a1)(void))
{
  return a1();
}

void sub_23CA33580(unsigned int a1@<W8>)
{
  uint64_t *v1;

  *v1 = (a1 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(a1) >> 3)) & 7)));
  JUMPOUT(0x242629BC0);
}

uint64_t sub_23CA335C0()
{
  return sub_23CA2E7B8();
}

uint64_t sub_23CA33608()
{
  return sub_23CA4B48C();
}

BOOL sub_23CA33618(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_23CA33628()
{
  return swift_arrayDestroy();
}

uint64_t sub_23CA33638(uint64_t a1, uint64_t a2)
{
  return sub_23CA300A0(a1, a2);
}

uint64_t sub_23CA33648()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA33650@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t sub_23CA33658@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return 34;
}

uint64_t sub_23CA33670()
{
  return sub_23CA4B5E8();
}

_QWORD *sub_23CA33678(_QWORD *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v7;

  return sub_23CA32024(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t sub_23CA33684(uint64_t a1, char a2)
{
  return sub_23CA2E98C(a1, a2);
}

uint64_t sub_23CA336B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  unint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return sub_23CA46BF8(v5, v4, (uint64_t *)va);
}

BOOL sub_23CA336D0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_23CA336E0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA336E8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_23CA336FC()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23CA33704(uint64_t a1)
{
  return sub_23CA314E8(a1);
}

uint64_t sub_23CA3371C()
{
  return sub_23CA4B5AC();
}

void sub_23CA33740(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t sub_23CA33754()
{
  return swift_beginAccess();
}

uint64_t sub_23CA3375C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA33770()
{
  return sub_23CA2E7B8();
}

void sub_23CA33784(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23CA33790(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_23CA337A4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_23CA337B4()
{
  return sub_23CA4B48C();
}

uint64_t sub_23CA337C4()
{
  return sub_23CA4B600();
}

BOOL sub_23CA337D4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

_QWORD *sub_23CA337E4(_QWORD *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v7;

  return sub_23CA32024(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t sub_23CA337F0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23CA337FC()
{
  return sub_23CA4B420();
}

uint64_t sub_23CA3380C()
{
  return sub_23CA4B6A8();
}

_QWORD *sub_23CA33824@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

BOOL sub_23CA33834@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_23CA33840(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_23CA4B600();
}

uint64_t sub_23CA33868(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
  return sub_23CA4B600();
}

_QWORD *sub_23CA33894(_QWORD *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v7;

  return sub_23CA32024(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t sub_23CA338A0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA338A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_23CA338B0()
{
  JUMPOUT(0x24262A118);
}

uint64_t sub_23CA338B8()
{
  return sub_23CA4B3FC();
}

unint64_t sub_23CA338C4()
{
  return sub_23CA31FC4();
}

uint64_t sub_23CA338F0()
{
  return sub_23CA4B48C();
}

uint64_t sub_23CA33900(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_23CA33924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

_QWORD *sub_23CA33934@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

_QWORD *sub_23CA33944@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_23CA33954@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return 1;
}

_QWORD *sub_23CA3396C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_23CA33994()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_23CA339A4(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t sub_23CA339BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  unint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return sub_23CA46BF8(v5, v4, (uint64_t *)va);
}

void sub_23CA339CC()
{
  JUMPOUT(0x24262A124);
}

uint64_t sub_23CA339D4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23CA319A8(v1, v0, 16);
}

uint64_t sub_23CA339E4()
{
  return sub_23CA4B390();
}

void sub_23CA33A04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v3 + 120) = v0;
  *(_QWORD *)(v0 + 16) = v2;
  v6 = v0 + 16 * v5;
  *(_QWORD *)(v6 + 32) = v4;
  *(_QWORD *)(v6 + 40) = v1;
  *(_QWORD *)(v3 + 72) = v0;
}

uint64_t sub_23CA33A64()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA33A6C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA33A80()
{
  return sub_23CA4B2A0();
}

unint64_t sub_23CA33A88()
{
  return sub_23CA31FC4();
}

uint64_t sub_23CA33A90()
{
  return sub_23CA4B57C();
}

uint64_t sub_23CA33A9C()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_23CA33AA4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA33AC4()
{
  return swift_allocObject();
}

uint64_t sub_23CA33AE0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA33AF4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_23CA46BF8(a1, a2, (uint64_t *)va);
}

uint64_t sub_23CA33AFC()
{
  return sub_23CA4B384();
}

uint64_t sub_23CA33B08()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23CA33B38()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA33B44@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23CA33B4C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA33B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v4;

  return sub_23CA33000(a1, v4, 10, a4);
}

uint64_t sub_23CA33B78()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23CA33B84()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA33B9C(uint64_t a1)
{
  return sub_23CA33C3C(a1, qword_256BEF030);
}

uint64_t sub_23CA33BC0(uint64_t a1)
{
  return sub_23CA33C3C(a1, qword_256BEF048);
}

uint64_t *sub_23CA33BDC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_23CA33C1C(uint64_t a1)
{
  return sub_23CA33C3C(a1, qword_256BEF060);
}

uint64_t sub_23CA33C3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23CA4B2B8();
  sub_23CA33BDC(v3, a2);
  sub_23CA2B764(v3, (uint64_t)a2);
  return sub_23CA4B2AC();
}

uint64_t sub_23CA33CB0()
{
  uint64_t v0;

  v0 = sub_23CA4B30C();
  sub_23CA33BDC(v0, qword_256BED550);
  sub_23CA2B764(v0, (uint64_t)qword_256BED550);
  return sub_23CA4B318();
}

void ChatLanguageModelProviding.respond(to:parameters:)()
{
  _QWORD *v0;
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

  sub_23CA35944();
  v8 = sub_23CA35BC4(v1, v2, v3, v4, v5, v6, v7);
  v0[26] = v8;
  v0[27] = *(_QWORD *)(v8 - 8);
  v0[28] = sub_23CA35930();
  v0[29] = sub_23CA35A44();
  v0[30] = sub_23CA35A44();
  v10 = sub_23CA35E3C(qword_256BED058, v9, MEMORY[0x24BE7A8A8]);
  sub_23CA3584C(v10);
}

uint64_t sub_23CA33D74(uint64_t a1)
{
  _QWORD *v1;

  v1[34] = sub_23CA35808(a1);
  v1[35] = sub_23CA35B54();
  v1[36] = sub_23CA35A74();
  v1[37] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA357D8();
}

#error "23CA33ECC: call analysis failed (funcsize=57)"

uint64_t sub_23CA33F44()
{
  uint64_t v0;

  sub_23CA35BE4();
  sub_23CA35D9C(*(_QWORD *)(v0 + 264));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA33F90()
{
  uint64_t (*v0)(void);

  sub_23CA35944();
  sub_23CA35E58();
  swift_task_dealloc();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA357EC(v0);
}

uint64_t sub_23CA33FE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA35B9C();
  sub_23CA35D9C(*(_QWORD *)(v1 + 264));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35DE4();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

uint64_t sub_23CA34044()
{
  uint64_t v0;

  sub_23CA35E58();
  sub_23CA35C90();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA340A0()
{
  uint64_t v0;

  sub_23CA35C90();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA340F8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA22494(qword_2543121F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_23CA34138(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

void ChatLanguageModelProviding.respond<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;

  v7 = sub_23CA35CF4(a1, a2, a3, a4, a5, a6);
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0];
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = sub_23CA20FEC();
  v9 = sub_23CA217E8(qword_256BED058, v8, MEMORY[0x24BE7A8A8]);
  v6[15] = v9;
  sub_23CA35828(v9);
}

uint64_t sub_23CA341AC(uint64_t a1)
{
  _QWORD *v1;

  v1[16] = a1;
  v1[17] = *(_QWORD *)(a1 - 8);
  v1[18] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA3350C();
}

uint64_t sub_23CA341D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA35BBC();
  if (!v0)
    sub_23CA35868(*(_QWORD *)(v1 + 144));
  swift_task_dealloc();
  sub_23CA2131C();
  v2 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA35AF8(v2);
}

uint64_t sub_23CA3423C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA33B44(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35AC0();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 152) = v3;
  *v3 = v1;
  v3[1] = sub_23CA342A4;
  sub_23CA35C04();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA342A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35B7C();
  sub_23CA35CB8(*(_QWORD *)(v1 + 136));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA3350C();
  }
  else
  {
    sub_23CA24384();
    sub_23CA2131C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA24340(v3);
  }
}

uint64_t sub_23CA34304()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA24384();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

void ChatLanguageModelProviding.respond<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;

  v6 = sub_23CA35D3C(a1, a2, a3, a4, a5);
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0];
  *(_QWORD *)(v5 + 88) = v6;
  v8 = sub_23CA217E8(qword_256BED058, v7, MEMORY[0x24BE7A8A8]);
  *(_QWORD *)(v5 + 96) = v8;
  sub_23CA35828(v8);
}

uint64_t sub_23CA34380(uint64_t a1)
{
  _QWORD *v1;

  v1[13] = a1;
  v1[14] = *(_QWORD *)(a1 - 8);
  v1[15] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA343AC()
{
  uint64_t v0;

  sub_23CA35944();
  sub_23CA35868(*(_QWORD *)(v0 + 120));
}

uint64_t sub_23CA343D8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA35AC0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA35E4C(v0);
  sub_23CA35958(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA34418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA35944();
  sub_23CA358D0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35F38();
    return sub_23CA357EC(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_23CA34464()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

void ChatLanguageModelProvidingStreamable.streamResponse(to:parameters:)()
{
  _QWORD *v0;
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

  sub_23CA35944();
  v8 = sub_23CA35BC4(v1, v2, v3, v4, v5, v6, v7);
  v0[26] = v8;
  v0[27] = *(_QWORD *)(v8 - 8);
  v0[28] = sub_23CA35930();
  v0[29] = sub_23CA35A44();
  v0[30] = sub_23CA35A44();
  v10 = sub_23CA35E3C(qword_256BED058, v9, MEMORY[0x24BE7A8A8]);
  sub_23CA3584C(v10);
}

uint64_t sub_23CA344F4(uint64_t a1)
{
  _QWORD *v1;

  v1[34] = sub_23CA35808(a1);
  v1[35] = sub_23CA35B54();
  v1[36] = sub_23CA35A74();
  v1[37] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA357D8();
}

#error "23CA3464C: call analysis failed (funcsize=57)"

uint64_t sub_23CA346C4()
{
  uint64_t v0;

  sub_23CA35BE4();
  sub_23CA35D9C(*(_QWORD *)(v0 + 264));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA34710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA35B9C();
  sub_23CA35D9C(*(_QWORD *)(v1 + 264));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35DE4();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

void ChatLanguageModelProvidingStreamable.streamResponse<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;

  v7 = sub_23CA35CF4(a1, a2, a3, a4, a5, a6);
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0];
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = sub_23CA20FEC();
  v9 = sub_23CA217E8(qword_256BED058, v8, MEMORY[0x24BE7A8A8]);
  v6[15] = v9;
  sub_23CA35828(v9);
}

uint64_t sub_23CA347D0(uint64_t a1)
{
  _QWORD *v1;

  v1[16] = a1;
  v1[17] = *(_QWORD *)(a1 - 8);
  v1[18] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA3350C();
}

uint64_t sub_23CA347F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA35BBC();
  if (!v0)
    sub_23CA35868(*(_QWORD *)(v1 + 144));
  swift_task_dealloc();
  sub_23CA2131C();
  v2 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA35AF8(v2);
}

uint64_t sub_23CA34860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_23CA33B44(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35AAC();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 152) = v3;
  *v3 = v1;
  v3[1] = sub_23CA348C8;
  sub_23CA35C04();
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA348C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35B7C();
  sub_23CA35CB8(*(_QWORD *)(v1 + 136));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA3350C();
  }
  else
  {
    sub_23CA24384();
    sub_23CA2131C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA24340(v3);
  }
}

void ChatLanguageModelProvidingStreamable.streamResponse<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;

  v6 = sub_23CA35D3C(a1, a2, a3, a4, a5);
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0];
  *(_QWORD *)(v5 + 88) = v6;
  v8 = sub_23CA217E8(qword_256BED058, v7, MEMORY[0x24BE7A8A8]);
  *(_QWORD *)(v5 + 96) = v8;
  sub_23CA35828(v8);
}

uint64_t sub_23CA3496C(uint64_t a1)
{
  _QWORD *v1;

  v1[13] = a1;
  v1[14] = *(_QWORD *)(a1 - 8);
  v1[15] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA34998()
{
  uint64_t v0;

  sub_23CA35944();
  sub_23CA35868(*(_QWORD *)(v0 + 120));
}

uint64_t sub_23CA349C4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA35AAC();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA35E4C(v0);
  sub_23CA35958(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA34A04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23CA35944();
  sub_23CA358D0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35F38();
    return sub_23CA357EC(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t CompletionLanguageModelProviding.complete(prompt:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  sub_23CA35F18(a1, a2, a3, a4, a5, a6, a7);
  v8 = sub_23CA35E60();
  v7[10] = v8;
  v7[11] = *(_QWORD *)(v8 - 8);
  v7[12] = sub_23CA20FEC();
  v9 = sub_23CA35D94();
  v7[13] = v9;
  v7[14] = *(_QWORD *)(v9 - 8);
  v7[15] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA34ABC()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  _QWORD *v4;

  sub_23CA35BBC();
  if (!v0)
  {
    sub_23CA35F0C();
    v3 = swift_task_alloc();
    v4 = (_QWORD *)sub_23CA35E4C(v3);
    sub_23CA35D74(v4);
    sub_23CA35C80();
  }
  sub_23CA35F2C();
  sub_23CA2131C();
  v1 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA24340(v1);
}

uint64_t sub_23CA34B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(void);

  sub_23CA35E70();
  sub_23CA359B4();
  sub_23CA35A38(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA35800();
  }
  else
  {
    sub_23CA35EC8();
    sub_23CA2131C();
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA211BC(v4);
  }
}

uint64_t sub_23CA34BAC()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA24384();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA34BE4()
{
  _QWORD *v0;
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

  sub_23CA35944();
  v6 = sub_23CA35C10(v1, v2, v3, v4, v5);
  v0[24] = v6;
  v0[25] = *(_QWORD *)(v6 - 8);
  v7 = sub_23CA20FEC();
  v8 = sub_23CA35F00(v7);
  v0[27] = v8;
  v0[28] = *(_QWORD *)(v8 - 8);
  v0[29] = sub_23CA35930();
  v0[30] = sub_23CA35A44();
  v10 = sub_23CA35E3C(&qword_2543121E0, v9, MEMORY[0x24BE7A7D8]);
  sub_23CA3584C(v10);
}

uint64_t sub_23CA34C54(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[34] = sub_23CA35808(a1);
  v1[35] = sub_23CA35B54();
  v2 = sub_23CA35A74();
  v1[36] = v2;
  v1[37] = *(_QWORD *)(v2 - 8);
  v1[38] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA357D8();
}

#error "23CA34D5C: call analysis failed (funcsize=35)"

uint64_t sub_23CA34DD8()
{
  uint64_t v0;

  sub_23CA35A84();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA34E28()
{
  uint64_t (*v0)(void);

  sub_23CA35944();
  sub_23CA35E58();
  swift_task_dealloc();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA357EC(v0);
}

uint64_t sub_23CA34E78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA35A4C();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35DF8();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

uint64_t sub_23CA34ED8()
{
  uint64_t v0;

  sub_23CA35E58();
  sub_23CA35E20();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA34F2C()
{
  uint64_t v0;

  sub_23CA35E20();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CompletionLanguageModelProviding.complete<A>(prompt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = sub_23CA35C54(a1, a2, a3, a4, a5, a6);
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = sub_23CA20FEC();
  v8 = sub_23CA35D94();
  v6[12] = v8;
  v6[13] = *(_QWORD *)(v8 - 8);
  v6[14] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA34FD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  _QWORD *v4;

  sub_23CA35BBC();
  if (!v0)
  {
    sub_23CA35DD0();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 120) = v4;
    sub_23CA35D54(v4);
    sub_23CA35C80();
  }
  swift_task_dealloc();
  sub_23CA2131C();
  v2 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA24340(v2);
}

uint64_t sub_23CA35048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(void);

  sub_23CA35E70();
  sub_23CA359E0();
  sub_23CA35A38(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA35800();
  }
  else
  {
    sub_23CA35EBC();
    sub_23CA2131C();
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA211BC(v4);
  }
}

uint64_t sub_23CA350C0()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA24384();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CompletionLanguageModelProviding.complete<A>(prompt:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  sub_23CA21048();
  return swift_task_switch();
}

uint64_t sub_23CA35114()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  *(_QWORD *)(v0 + 16) = 0x6F77206F6C6C6568;
  *(_QWORD *)(v0 + 24) = 0xEB00000000646C72;
  sub_23CA4B150();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA20F8C(v1);
}

uint64_t CompletionLanguageModelProvidingStreamable.streamCompletion(of:parameters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  sub_23CA35F18(a1, a2, a3, a4, a5, a6, a7);
  v8 = sub_23CA35E60();
  v7[10] = v8;
  v7[11] = *(_QWORD *)(v8 - 8);
  v7[12] = sub_23CA20FEC();
  v9 = sub_23CA35D94();
  v7[13] = v9;
  v7[14] = *(_QWORD *)(v9 - 8);
  v7[15] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA351D8()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  _QWORD *v4;

  sub_23CA35BBC();
  if (!v0)
  {
    sub_23CA35F0C();
    v3 = swift_task_alloc();
    v4 = (_QWORD *)sub_23CA35E4C(v3);
    sub_23CA35D74(v4);
    sub_23CA35C70();
  }
  sub_23CA35F2C();
  sub_23CA2131C();
  v1 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA24340(v1);
}

uint64_t sub_23CA35250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(void);

  sub_23CA35E70();
  sub_23CA359B4();
  sub_23CA35A38(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA35800();
  }
  else
  {
    sub_23CA35EC8();
    sub_23CA2131C();
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA211BC(v4);
  }
}

void sub_23CA352C8()
{
  _QWORD *v0;
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

  sub_23CA35944();
  v6 = sub_23CA35C10(v1, v2, v3, v4, v5);
  v0[24] = v6;
  v0[25] = *(_QWORD *)(v6 - 8);
  v7 = sub_23CA20FEC();
  v8 = sub_23CA35F00(v7);
  v0[27] = v8;
  v0[28] = *(_QWORD *)(v8 - 8);
  v0[29] = sub_23CA35930();
  v0[30] = sub_23CA35A44();
  v10 = sub_23CA35E3C(&qword_2543121E0, v9, MEMORY[0x24BE7A7D8]);
  sub_23CA3584C(v10);
}

uint64_t sub_23CA35338(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[34] = sub_23CA35808(a1);
  v1[35] = sub_23CA35B54();
  v2 = sub_23CA35A74();
  v1[36] = v2;
  v1[37] = *(_QWORD *)(v2 - 8);
  v1[38] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA357D8();
}

#error "23CA35440: call analysis failed (funcsize=35)"

uint64_t sub_23CA354BC()
{
  uint64_t v0;

  sub_23CA35A84();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA3550C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA35A4C();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA35DF8();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

uint64_t CompletionLanguageModelProvidingStreamable.streamCompletion<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = sub_23CA35C54(a1, a2, a3, a4, a5, a6);
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = sub_23CA20FEC();
  v8 = sub_23CA35D94();
  v6[12] = v8;
  v6[13] = *(_QWORD *)(v8 - 8);
  v6[14] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA355C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  _QWORD *v4;

  sub_23CA35BBC();
  if (!v0)
  {
    sub_23CA35DD0();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 120) = v4;
    sub_23CA35D54(v4);
    sub_23CA35C70();
  }
  swift_task_dealloc();
  sub_23CA2131C();
  v2 = (uint64_t (*)(void))sub_23CA35C48();
  return sub_23CA24340(v2);
}

uint64_t sub_23CA35638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(void);

  sub_23CA35E70();
  sub_23CA359E0();
  sub_23CA35A38(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA35800();
  }
  else
  {
    sub_23CA35EBC();
    sub_23CA2131C();
    v4 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA211BC(v4);
  }
}

void CompletionLanguageModelProvidingStreamable.streamCompletion<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;

  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a2;
  v6[8] = a3;
  v6[6] = a1;
  v7 = sub_23CA4B2D0();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0];
  v6[11] = v7;
  v9 = sub_23CA217E8(&qword_2543121E0, v8, MEMORY[0x24BE7A7D8]);
  v6[12] = v9;
  sub_23CA35828(v9);
}

uint64_t sub_23CA35708(uint64_t a1)
{
  _QWORD *v1;

  v1[13] = a1;
  v1[14] = *(_QWORD *)(a1 - 8);
  v1[15] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA35734()
{
  uint64_t v0;

  sub_23CA35944();
  sub_23CA35868(*(_QWORD *)(v0 + 120));
}

uint64_t sub_23CA35760()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA1FB7C();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA35E4C(v0);
  sub_23CA35958(v1);
  return GenerativeConfigurationRunnable<>.run(returning:)();
}

uint64_t sub_23CA357D8()
{
  return swift_task_switch();
}

uint64_t sub_23CA357EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA35800()
{
  return swift_task_switch();
}

uint64_t sub_23CA35808(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 256) = a1;
  *(_QWORD *)(v1 + 264) = *(_QWORD *)(a1 - 8);
  return swift_task_alloc();
}

void sub_23CA35828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v2;
  v3[5] = a1;
  type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_23CA35840@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_23CA3584C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v3[31] = a1;
  v3[14] = v1;
  v3[15] = v2;
  v3[16] = v1;
  v3[17] = a1;
  type metadata accessor for GenerativeConfigurationRunnable();
}

void sub_23CA35868(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  GenerativeConfigurationProtocol.with<A>(model:)(v1, v2, a1);
}

uint64_t sub_23CA35878()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 208);
  v4 = *(_QWORD *)(v1 + 192);
  v5 = *(_QWORD *)(v1 + 152);
  sub_23CA34138(v0, (_OWORD *)(v1 + 16));
  sub_23CA1F350((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v5, v4);
}

uint64_t sub_23CA358D0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA358F4()
{
  _OWORD *v0;

  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return sub_23CA340F8((uint64_t)v0);
}

uint64_t sub_23CA35930()
{
  return swift_task_alloc();
}

uint64_t sub_23CA35958(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 48);
}

uint64_t sub_23CA35978()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA34138(v0, (_OWORD *)(v1 + 16));
  sub_23CA1F350((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  return v2();
}

uint64_t sub_23CA359B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA359E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 128) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35A0C()
{
  return sub_23CA4B30C();
}

uint64_t sub_23CA35A38@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23CA35A44()
{
  return swift_task_alloc();
}

uint64_t sub_23CA35A4C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 336) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35A74()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA35A84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 320) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35AAC()
{
  return sub_23CA2025C();
}

uint64_t sub_23CA35AC0()
{
  return sub_23CA1FD7C();
}

uint64_t sub_23CA35AD4()
{
  return sub_23CA4B30C();
}

uint64_t sub_23CA35AF8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA35B10()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[37] + 16))(v0[38], v0[20], v0[36]);
}

uint64_t sub_23CA35B34()
{
  return sub_23CA4B324();
}

uint64_t sub_23CA35B54()
{
  return swift_task_alloc();
}

uint64_t sub_23CA35B5C()
{
  return sub_23CA4B324();
}

uint64_t sub_23CA35B7C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 160) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35B9C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 328) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35BBC()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t sub_23CA35BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[24] = a7;
  v8[25] = v7;
  v8[22] = a5;
  v8[23] = a6;
  v8[20] = a3;
  v8[21] = a4;
  v8[18] = a1;
  v8[19] = a2;
  return sub_23CA4B2F4();
}

uint64_t sub_23CA35BE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 312) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA35C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[22] = a5;
  v6[23] = v5;
  v6[20] = a3;
  v6[21] = a4;
  v6[18] = a1;
  v6[19] = a2;
  return sub_23CA4B300();
}

uint64_t sub_23CA35C48()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_23CA35C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  return sub_23CA4B5F4();
}

void sub_23CA35C70()
{
  sub_23CA352C8();
}

void sub_23CA35C80()
{
  sub_23CA34BE4();
}

uint64_t sub_23CA35C90()
{
  return swift_task_dealloc();
}

void sub_23CA35C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  GenerativeConfigurationProtocol.with<A>(model:)(v2, v0, v1);
}

uint64_t sub_23CA35CB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void sub_23CA35CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;

  GenerativeConfigurationProtocol.with<A>(model:)(v11, v12, a11);
}

void sub_23CA35CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;

  GenerativeConfigurationProtocol.with<A>(model:)(v12, v11, a11);
}

uint64_t sub_23CA35CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[10] = a6;
  v7[11] = v6;
  v7[8] = a3;
  v7[9] = a4;
  v7[6] = a1;
  v7[7] = a2;
  return sub_23CA4B2F4();
}

uint64_t sub_23CA35D0C()
{
  return swift_dynamicCast();
}

uint64_t sub_23CA35D24()
{
  return swift_dynamicCast();
}

uint64_t sub_23CA35D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a2;
  v6[8] = a3;
  v6[6] = a1;
  return sub_23CA4B2F4();
}

uint64_t sub_23CA35D54(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t sub_23CA35D74(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t sub_23CA35D94()
{
  return sub_23CA4B300();
}

uint64_t sub_23CA35D9C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_23CA35DA4()
{
  _OWORD *v0;

  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return sub_23CA340F8((uint64_t)v0);
}

uint64_t sub_23CA35DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a9 + 8))(v9, v10);
}

uint64_t sub_23CA35DD0()
{
  uint64_t v0;
  uint64_t v1;

  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v0, 1, 1, *(_QWORD *)(v1 + 48));
}

uint64_t sub_23CA35DE4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35DF8()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v0, v2);
}

uint64_t sub_23CA35E20()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35E34(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA35E3C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_23CA217E8(a1, v3, a3);
}

uint64_t sub_23CA35E44()
{
  return sub_23CA4B2DC();
}

uint64_t sub_23CA35E4C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = result;
  return result;
}

uint64_t sub_23CA35E58()
{
  uint64_t v0;

  return _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
}

uint64_t sub_23CA35E60()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA35E88()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA35E9C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA35EB0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t sub_23CA35EBC()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35EC8()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35ED4()
{
  uint64_t v0;

  return v0;
}

_QWORD *sub_23CA35EE8(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *result = v2;
  result[1] = v1;
  return result;
}

_QWORD *sub_23CA35EF4(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *result = v2;
  result[1] = v1;
  return result;
}

uint64_t sub_23CA35F00(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 208) = a1;
  return sub_23CA4B2D0();
}

uint64_t sub_23CA35F0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_23CA35F18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = result;
  v8[3] = a2;
  return result;
}

uint64_t sub_23CA35F2C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA35F38()
{
  return swift_task_dealloc();
}

uint64_t CompletionPrompt.overestimatedTokenCount<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA35FA8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0], &qword_2543121E0, MEMORY[0x24BE7A7D8], MEMORY[0x24BE3B950]);
}

uint64_t ChatMessagesPrompt.overestimatedTokenCount<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA35FA8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0], qword_256BED058, MEMORY[0x24BE7A8A8], MEMORY[0x24BE3B948]);
}

uint64_t sub_23CA35FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;

  v13 = a4(0);
  v14 = sub_23CA217E8(a5, a4, a6);
  return a7(v7, v13, v14, a2, a3);
}

uint64_t sub_23CA36040()
{
  uint64_t v0;

  v0 = sub_23CA4B30C();
  sub_23CA33BDC(v0, qword_256BED5D8);
  sub_23CA2B764(v0, (uint64_t)qword_256BED5D8);
  return sub_23CA4B318();
}

uint64_t CompletionPromptRunConfig.Typed.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t CompletionPromptRunConfig.Typed.completionParameters.getter()
{
  return sub_23CA37CF4();
}

uint64_t CompletionPromptRunConfig.Typed.run(returning:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_23CA3B010(a1);
  v2 = sub_23CA21418();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA36118()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA361E4();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AFB0(v0);
  sub_23CA3AE24(v1, v2, v3);
}

uint64_t sub_23CA36158()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA36194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23CA3B0B8();
  sub_23CA21510();
  sub_23CA214A0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA24384();
  v1 = sub_23CA211F0();
  return sub_23CA210F4(v1, v2, v3);
}

uint64_t sub_23CA361E4()
{
  return swift_getAssociatedTypeWitness();
}

void CompletionPromptRunConfig.Typed.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23CA3AED8(a1, a2, a3);
  *(_QWORD *)(v3 + 168) = v4;
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(v4 - 8);
  v5 = sub_23CA20FEC();
  sub_23CA3ADF4(v5);
  sub_23CA3AF58(&qword_2543121E0, v6, MEMORY[0x24BE7A7D8]);
  sub_23CA3AA74(v7);
}

uint64_t sub_23CA36254(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = sub_23CA3A76C();
  v2 = sub_23CA35B54();
  sub_23CA3ADE4(v2);
  v3 = sub_23CA3ADBC();
  v1[31] = v3;
  v1[32] = *(_QWORD *)(v3 - 8);
  v1[33] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA362B4()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA2BD64();
  sub_23CA3A868();
  sub_23CA22494(&qword_2543121E8);
  if (sub_23CA3AB54())
  {
    sub_23CA3A830();
    if (qword_256BECF18 != -1)
      swift_once();
    v0 = sub_23CA3A980();
    sub_23CA3AA30(v0, (uint64_t)qword_256BED5D8);
    sub_23CA3A920();
  }
  sub_23CA3A9C4();
  sub_23CA3B008(v1, qword_2543121F0);
  sub_23CA3AAAC();
}

uint64_t sub_23CA363B0()
{
  uint64_t v0;

  sub_23CA3A808();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA36400()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA3A7E0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA3AC30();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

uint64_t CompletionPromptRunConfig.Typed.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  sub_23CA3AE74(a1, a2, a3, a4, a5);
  v6 = sub_23CA21418();
  v5[11] = v6;
  v5[12] = *(_QWORD *)(v6 - 8);
  v5[13] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA364AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA361E4();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AF1C(v0);
  sub_23CA3AE24(v1, v2, v3);
}

uint64_t sub_23CA364EC()
{
  sub_23CA21258();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA36528()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_23CA35944();
  sub_23CA3AF70();
  sub_23CA21510();
  sub_23CA214A0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  v1 = (_QWORD *)sub_23CA213E0();
  v2 = sub_23CA3AD2C(v1);
  return sub_23CA21308(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_23CA36580()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t CompletionPromptRunConfig.TypedStreamable.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t CompletionPromptRunConfig.TypedStreamable.completionParameters.getter()
{
  return sub_23CA37CF4();
}

uint64_t CompletionPromptRunConfig.TypedStreamable.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  sub_23CA3AF00(a1, a2, a3);
  v4 = sub_23CA21418();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA36644()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA36720();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AFE0(v0);
  CompletionPromptRunConfig.TypedStreamable.run(returning:)(v1, v2, v3);
}

uint64_t sub_23CA3668C()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA366C8()
{
  uint64_t (*v0)(void);

  sub_23CA3B084();
  swift_getAssociatedConformanceWitness();
  sub_23CA4B1A4();
  sub_23CA3AF60();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA3A6E4(v0);
}

uint64_t sub_23CA36720()
{
  return swift_getAssociatedTypeWitness();
}

void CompletionPromptRunConfig.TypedStreamable.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23CA3AED8(a1, a2, a3);
  *(_QWORD *)(v3 + 168) = v4;
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(v4 - 8);
  v5 = sub_23CA20FEC();
  sub_23CA3ADF4(v5);
  sub_23CA3AF58(&qword_2543121E0, v6, MEMORY[0x24BE7A7D8]);
  sub_23CA3AA74(v7);
}

uint64_t sub_23CA36790(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = sub_23CA3A76C();
  v2 = sub_23CA35B54();
  sub_23CA3ADE4(v2);
  v3 = sub_23CA3ADBC();
  v1[31] = v3;
  v1[32] = *(_QWORD *)(v3 - 8);
  v1[33] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA367F0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA2BD64();
  sub_23CA3A868();
  sub_23CA22494(&qword_2543121E8);
  if (sub_23CA3AB54())
  {
    sub_23CA3A830();
    if (qword_256BECF18 != -1)
      swift_once();
    v0 = sub_23CA3A980();
    sub_23CA3AA30(v0, (uint64_t)qword_256BED5D8);
    sub_23CA3A920();
  }
  sub_23CA3A9C4();
  sub_23CA3B008(v1, qword_2543121F0);
  sub_23CA3AAAC();
}

uint64_t sub_23CA368EC()
{
  uint64_t v0;

  sub_23CA3A808();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA21048();
  return sub_23CA35800();
}

uint64_t sub_23CA3693C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  swift_task_dealloc();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v1);
}

uint64_t sub_23CA36984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  sub_23CA35944();
  sub_23CA3A7E0();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v0)
  {
    sub_23CA21048();
    return sub_23CA357D8();
  }
  else
  {
    sub_23CA3AC30();
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA357EC(v3);
  }
}

uint64_t sub_23CA369DC()
{
  uint64_t v0;

  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  sub_23CA3AF48();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA36A1C()
{
  uint64_t v0;

  sub_23CA3AF48();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CompletionPromptRunConfig.Untyped.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t CompletionPromptRunConfig.Untyped.run(returning:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA36A74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  v2 = sub_23CA215E8(v1);
  return CompletionPromptRunConfig.Untyped.run(returning:)(v2, v3);
}

uint64_t CompletionPromptRunConfig.Untyped.run(returning:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23CA3AEB0(a1, a2);
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = sub_23CA20FEC();
  v3[25] = sub_23CA22494(&qword_256BED628);
  v3[26] = sub_23CA3A76C();
  v3[27] = sub_23CA35B54();
  v5 = *(_QWORD *)(v2 + 16);
  v3[28] = v5;
  v3[29] = *(_QWORD *)(v5 - 8);
  v3[30] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

#error "23CA36BC0: call analysis failed (funcsize=93)"

uint64_t sub_23CA36CD4()
{
  sub_23CA3A940();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA36D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = sub_23CA3B0AC();
  sub_23CA38904(v1, &qword_256BED628);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v2 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v2);
}

uint64_t sub_23CA36D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA3AC70();
  sub_23CA3AD0C(v2, &qword_256BED628);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA36DAC()
{
  sub_23CA3A960();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA36DE8()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA38904(*(_QWORD *)(v0 + 208), &qword_256BED628);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v1);
}

uint64_t sub_23CA36E2C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23CA3AD04();
  sub_23CA3AF40(v1, &qword_256BED628);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CompletionPromptRunConfig.UntypedStreamable.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void CompletionPromptRunConfig.UntypedStreamable.model.getter(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_23CA38E98(v2 + *(int *)(a1 + 28), a2);
}

uint64_t CompletionPromptRunConfig.UntypedStreamable.run(returning:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23CA3AEB0(a1, a2);
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = sub_23CA20FEC();
  v3[25] = sub_23CA22494(&qword_256BED638);
  v3[26] = sub_23CA3A76C();
  v3[27] = sub_23CA35B54();
  v5 = *(_QWORD *)(v2 + 16);
  v3[28] = v5;
  v3[29] = *(_QWORD *)(v5 - 8);
  v3[30] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

#error "23CA36FAC: call analysis failed (funcsize=93)"

uint64_t sub_23CA370C0()
{
  sub_23CA3A940();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA370FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = sub_23CA3B0AC();
  sub_23CA38904(v1, &qword_256BED638);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v2 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v2);
}

uint64_t sub_23CA37148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA3AC70();
  sub_23CA3AD0C(v2, &qword_256BED638);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA37198()
{
  sub_23CA3A960();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA371D4()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA38904(*(_QWORD *)(v0 + 208), &qword_256BED638);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v1);
}

uint64_t sub_23CA37218()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23CA3AD04();
  sub_23CA3AF40(v1, &qword_256BED638);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

#error "23CA37294: call analysis failed (funcsize=14)"

void CompletionPrompt.withModel<A>(modelType:model:completionParameters:)(uint64_t (*a1)(void)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  sub_23CA3AF38(a1, a2, a3, a4, a5);
  sub_23CA3AC28();
}

{
  sub_23CA3AF38(a1, a2, a3, a4, a5);
  sub_23CA3AC28();
}

void CompletionPrompt.with<A, B>(model:modelType:)()
{
  sub_23CA374FC();
  sub_23CA3AC28();
}

{
  sub_23CA374FC();
  sub_23CA3AC28();
}

void CompletionPrompt.withModel<A, B>(modelType:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_23CA38C84(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))CompletionPrompt.with<A, B>(model:modelType:));
}

{
  sub_23CA38C84(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))CompletionPrompt.with<A, B>(model:modelType:));
}

#error "23CA37358: call analysis failed (funcsize=14)"

void sub_23CA37364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD);
  void (*v24)(_QWORD);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t AssociatedTypeWitness;
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

  sub_23CA3AE5C();
  v24 = v23;
  v44 = v26;
  v45 = v25;
  v41 = v21;
  v42 = v27;
  v29 = v28;
  v43 = v30;
  v46 = a21;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(AssociatedTypeWitness - 8);
  sub_23CA3B114();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v41 - v35;
  v37 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v34);
  sub_23CA3AD14();
  v24(0);
  sub_23CA3AC10();
  MEMORY[0x24BDAC7A8](v38);
  (*(void (**)(char *, uint64_t))(v39 + 16))((char *)&v41 - v40, v41);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v22, v42, v29);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v36, v43, AssociatedTypeWitness);
  sub_23CA38024();
  sub_23CA2391C();
}

void sub_23CA374FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(_QWORD);
  void (*v4)(_QWORD);
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];

  sub_23CA3AE5C();
  v24[2] = v1;
  v24[3] = v2;
  v4 = v3;
  v24[0] = v6;
  v24[1] = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  sub_23CA4B5F4();
  sub_23CA3B114();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - v15;
  v17 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v14);
  sub_23CA339F4();
  v20 = v19 - v18;
  v4(0);
  sub_23CA3AC10();
  MEMORY[0x24BDAC7A8](v21);
  (*(void (**)(char *, uint64_t))(v22 + 16))((char *)v24 - v23, v0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v20, v12, v10);
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v16, 1, 1, v8);
  sub_23CA38024();
  sub_23CA2391C();
}

void CompletionPrompt.with<A>(model:completionParameters:modelType:)()
{
  sub_23CA376C0();
}

{
  sub_23CA376C0();
}

void CompletionPrompt.withModel<A>(modelType:model:completionParameters:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4, uint64_t a5)
{
  sub_23CA38DC4(a1, a2, a3, a4, a5, (void (*)(_QWORD *, uint64_t, uint64_t))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

{
  sub_23CA38DC4(a1, a2, a3, a4, a5, (void (*)(_QWORD *, uint64_t, uint64_t))CompletionPrompt.with<A>(model:completionParameters:modelType:));
}

void CompletionPrompt.with<A>(model:modelType:)()
{
  sub_23CA377A4();
}

{
  sub_23CA377A4();
}

_QWORD *CompletionPrompt.withModel<A>(modelType:model:)(_QWORD *(*a1)(_QWORD *__return_ptr), uint64_t a2, uint64_t a3)
{
  return sub_23CA38EF4(a1, a2, a3, (void (*)(_QWORD *, uint64_t))CompletionPrompt.with<A>(model:modelType:));
}

{
  return sub_23CA38EF4(a1, a2, a3, (void (*)(_QWORD *, uint64_t))CompletionPrompt.with<A>(model:modelType:));
}

void sub_23CA376C0()
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
  uint64_t (*v13)(_QWORD);
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
  void (*v24)(char *, uint64_t);
  uint64_t v25;

  sub_23CA3AE5C();
  v25 = v3;
  sub_23CA3AE94();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_23CA339F4();
  v9 = v8 - v7;
  sub_23CA3AC08(v10, v11, v12, v13);
  sub_23CA3AC10();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v23 = sub_23CA3AFC8(v15, v16, v17, v18, v19, v20, v21, v22, v25);
  v24(v23, v0);
  sub_23CA3B028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, v2, v1);
  sub_23CA3893C();
  sub_23CA2391C();
}

void sub_23CA377A4()
{
  uint64_t v0;
  void (*v1)(_QWORD);
  void (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  sub_23CA3AE5C();
  v2 = v1;
  v4 = v3;
  sub_23CA4B5F4();
  sub_23CA3B114();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - v6;
  v2(0);
  sub_23CA3AC10();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v17 = sub_23CA3AFC8(v9, v10, v11, v12, v13, v14, v15, v16, v19);
  v18(v17, v0);
  sub_23CA3B028();
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v7, 1, 1, v4);
  sub_23CA3893C();
  sub_23CA2391C();
}

uint64_t ChatMessagesPromptRunConfig.Typed.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t ChatMessagesPromptRunConfig.Typed.chatParameters.getter()
{
  return sub_23CA37CF4();
}

uint64_t ChatMessagesPromptRunConfig.Typed.run(returning:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_23CA3B010(a1);
  v2 = sub_23CA21418();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA37908()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA379D4();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AFB0(v0);
  sub_23CA3AE30(v1, v2, v3);
}

uint64_t sub_23CA37948()
{
  sub_23CA20F98();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA37984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23CA3B0B8();
  sub_23CA21510();
  sub_23CA2148C();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23CA24384();
  v1 = sub_23CA211F0();
  return sub_23CA210F4(v1, v2, v3);
}

uint64_t sub_23CA379D4()
{
  return swift_getAssociatedTypeWitness();
}

void ChatMessagesPromptRunConfig.Typed.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23CA3AEEC(a1, a2, a3);
  *(_QWORD *)(v3 + 168) = v4;
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(v4 - 8);
  v5 = sub_23CA20FEC();
  sub_23CA3ADF4(v5);
  sub_23CA3AF58(qword_256BED058, v6, MEMORY[0x24BE7A8A8]);
  sub_23CA3AA74(v7);
}

uint64_t sub_23CA37A44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = sub_23CA3A76C();
  v2 = sub_23CA35B54();
  sub_23CA3ADE4(v2);
  v3 = sub_23CA3ADBC();
  v1[31] = v3;
  v1[32] = *(_QWORD *)(v3 - 8);
  v1[33] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA37AA4()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA2BD64();
  sub_23CA3A868();
  sub_23CA22494(&qword_2543121E8);
  if (sub_23CA3AB54())
  {
    sub_23CA3A830();
    if (qword_256BECF18 != -1)
      swift_once();
    v0 = sub_23CA3A980();
    sub_23CA3AA30(v0, (uint64_t)qword_256BED5D8);
    sub_23CA3A920();
  }
  sub_23CA3A9C4();
  sub_23CA3B008(v1, qword_2543121F0);
  sub_23CA3AAAC();
}

uint64_t ChatMessagesPromptRunConfig.Typed.run<A>(returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  sub_23CA3AE74(a1, a2, a3, a4, a5);
  v6 = sub_23CA21418();
  v5[11] = v6;
  v5[12] = *(_QWORD *)(v6 - 8);
  v5[13] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA37BF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA379D4();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AF1C(v0);
  sub_23CA3AE30(v1, v2, v3);
}

uint64_t sub_23CA37C34()
{
  sub_23CA21258();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA37C70()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_23CA35944();
  sub_23CA3AF70();
  sub_23CA21510();
  sub_23CA2148C();
  sub_23CA35840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  v1 = (_QWORD *)sub_23CA213E0();
  v2 = sub_23CA3AD2C(v1);
  return sub_23CA21308(v2, v3, v4, v5, v6, v7);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t _s19GenerativeFunctions25CompletionPromptRunConfigO5TypedV5modelxvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA3ACEC(a1, a2);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.chatParameters.getter()
{
  return sub_23CA37CF4();
}

uint64_t sub_23CA37CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23CA21418();
  v0 = sub_23CA3AF98();
  return sub_23CA230CC(v0, v1, v2, v3);
}

uint64_t ChatMessagesPromptRunConfig.TypedStreamable.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  sub_23CA3AF00(a1, a2, a3);
  v4 = sub_23CA21418();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA37D7C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23CA37E58();
  v0 = (_QWORD *)swift_task_alloc();
  v1 = sub_23CA3AFE0(v0);
  ChatMessagesPromptRunConfig.TypedStreamable.run(returning:)(v1, v2, v3);
}

uint64_t sub_23CA37DC4()
{
  sub_23CA210C0();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA37E00()
{
  uint64_t (*v0)(void);

  sub_23CA3B084();
  swift_getAssociatedConformanceWitness();
  sub_23CA4B204();
  sub_23CA3AF60();
  sub_23CA2131C();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA3A6E4(v0);
}

uint64_t sub_23CA37E58()
{
  return swift_getAssociatedTypeWitness();
}

void ChatMessagesPromptRunConfig.TypedStreamable.run(returning:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_23CA3AEEC(a1, a2, a3);
  *(_QWORD *)(v3 + 168) = v4;
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(v4 - 8);
  v5 = sub_23CA20FEC();
  sub_23CA3ADF4(v5);
  sub_23CA3AF58(qword_256BED058, v6, MEMORY[0x24BE7A8A8]);
  sub_23CA3AA74(v7);
}

uint64_t sub_23CA37EC8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[26] = a1;
  v1[27] = *(_QWORD *)(a1 - 8);
  v1[28] = sub_23CA3A76C();
  v2 = sub_23CA35B54();
  sub_23CA3ADE4(v2);
  v3 = sub_23CA3ADBC();
  v1[31] = v3;
  v1[32] = *(_QWORD *)(v3 - 8);
  v1[33] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

void sub_23CA37F28()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA2BD64();
  sub_23CA3A868();
  sub_23CA22494(&qword_2543121E8);
  if (sub_23CA3AB54())
  {
    sub_23CA3A830();
    if (qword_256BECF18 != -1)
      swift_once();
    v0 = sub_23CA3A980();
    sub_23CA3AA30(v0, (uint64_t)qword_256BED5D8);
    sub_23CA3A920();
  }
  sub_23CA3A9C4();
  sub_23CA3B008(v1, qword_2543121F0);
  sub_23CA3AAAC();
}

uint64_t sub_23CA38024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t);
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;

  sub_23CA3AE5C();
  v7 = v6;
  sub_23CA3AE94();
  v9 = v8(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v5, v4, v9);
  v10 = v7(0, v1, v0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v5 + *(int *)(v10 + 36), v3, v1);
  v11 = v5 + *(int *)(v10 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v11, v2, AssociatedTypeWitness);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.run(returning:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return sub_23CA20FB8();
}

uint64_t sub_23CA38108()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  v2 = sub_23CA215E8(v1);
  return ChatMessagesPromptRunConfig.Untyped.run(returning:)(v2, v3);
}

uint64_t ChatMessagesPromptRunConfig.Untyped.run(returning:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23CA3AEC4(a1, a2);
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = sub_23CA20FEC();
  v3[25] = sub_23CA22494(&qword_256BED678);
  v3[26] = sub_23CA3A76C();
  v3[27] = sub_23CA35B54();
  v5 = *(_QWORD *)(v2 + 16);
  v3[28] = v5;
  v3[29] = *(_QWORD *)(v5 - 8);
  v3[30] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

#error "23CA38254: call analysis failed (funcsize=93)"

uint64_t sub_23CA38368()
{
  sub_23CA3A940();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA383A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = sub_23CA3B0AC();
  sub_23CA38904(v1, &qword_256BED678);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v2 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v2);
}

uint64_t sub_23CA383F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA3AC70();
  sub_23CA3AD0C(v2, &qword_256BED678);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA38440()
{
  sub_23CA3A960();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA3847C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA38904(*(_QWORD *)(v0 + 208), &qword_256BED678);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v1);
}

uint64_t sub_23CA384C0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23CA3AD04();
  sub_23CA3AF40(v1, &qword_256BED678);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ChatMessagesPromptRunConfig.UntypedStreamable.prompt.getter(uint64_t a1)
{
  return sub_23CA38518(a1, (void (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t sub_23CA38518(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  a2(0);
  v2 = sub_23CA3AF98();
  return sub_23CA230CC(v2, v3, v4, v5);
}

uint64_t _s19GenerativeFunctions25CompletionPromptRunConfigO7UntypedV20completionParametersxvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA3ACEC(a1, a2);
}

uint64_t ChatMessagesPromptRunConfig.UntypedStreamable.run(returning:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23CA3AEC4(a1, a2);
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = sub_23CA20FEC();
  v3[25] = sub_23CA22494(&qword_256BED688);
  v3[26] = sub_23CA3A76C();
  v3[27] = sub_23CA35B54();
  v5 = *(_QWORD *)(v2 + 16);
  v3[28] = v5;
  v3[29] = *(_QWORD *)(v5 - 8);
  v3[30] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA35800();
}

#error "23CA3864C: call analysis failed (funcsize=93)"

uint64_t sub_23CA38760()
{
  sub_23CA3A940();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA3879C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = sub_23CA3B0AC();
  sub_23CA38904(v1, &qword_256BED688);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v2 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v2);
}

uint64_t sub_23CA387E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23CA3AC70();
  sub_23CA3AD0C(v2, &qword_256BED688);
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23CA38838()
{
  sub_23CA3A960();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA38874()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_23CA38904(*(_QWORD *)(v0 + 208), &qword_256BED688);
  sub_23CA3A900();
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA21054(v1);
}

uint64_t sub_23CA388B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23CA3AD04();
  sub_23CA3AF40(v1, &qword_256BED688);
  sub_23CA3A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  return sub_23CA3A6E4(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA38904(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23CA22494(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_23CA23110();
}

uint64_t sub_23CA3893C()
{
  void (*v0)(uint64_t, uint64_t);
  void (*v1)(uint64_t, uint64_t);
  uint64_t (*v2)(_QWORD, uint64_t);
  uint64_t (*v3)(_QWORD, uint64_t);
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
  uint64_t (*v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;

  sub_23CA3B098();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = sub_23CA3B120(v10, v8, v6, v4, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v11, v15);
  v16 = v3(0, v5);
  v1(v9, v13 + *(int *)(v16 + 28));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v13 + *(int *)(v16 + 32), v7, v5);
}

#error "23CA38A08: call analysis failed (funcsize=14)"

void ChatMessagesPrompt.withModel<A>(modelType:model:chatParameters:)(uint64_t (*a1)(void)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  sub_23CA3AF38(a1, a2, a3, a4, a5);
  sub_23CA3AC28();
}

{
  sub_23CA3AF38(a1, a2, a3, a4, a5);
  sub_23CA3AC28();
}

void ChatMessagesPrompt.with<A, B>(model:modelType:)()
{
  sub_23CA374FC();
  sub_23CA3AC28();
}

{
  sub_23CA374FC();
  sub_23CA3AC28();
}

void ChatMessagesPrompt.withModel<A, B>(modelType:model:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_23CA38C84(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))ChatMessagesPrompt.with<A, B>(model:modelType:));
}

{
  sub_23CA38C84(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))ChatMessagesPrompt.with<A, B>(model:modelType:));
}

#error "23CA38ACC: call analysis failed (funcsize=14)"

void sub_23CA38B08(uint64_t (*a1)(void)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(uint64_t, char *))
{
  uint64_t AssociatedTypeWitness;
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
  _QWORD v21[3];
  void (*v22)(uint64_t);
  uint64_t v23;

  v21[1] = a5;
  v21[2] = a3;
  v22 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  sub_23CA3B114();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v21 - v13;
  v15 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  sub_23CA339F4();
  v18 = v17 - v16;
  v19 = v23;
  v20 = a1();
  if (!v19)
  {
    v23 = AssociatedTypeWitness;
    v22(v20);
    a7(v18, v14);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v23);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, a4);
  }
  sub_23CA2315C();
}

void sub_23CA38C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);

  MEMORY[0x24BDAC7A8](a1);
  sub_23CA3AD14();
  v9();
  if (!v7)
  {
    a7(v8);
    sub_23CA3AFF8();
  }
  sub_23CA2315C();
}

void ChatMessagesPrompt.with<A>(model:chatParameters:modelType:)()
{
  sub_23CA376C0();
}

{
  sub_23CA376C0();
}

void ChatMessagesPrompt.withModel<A>(modelType:model:chatParameters:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4, uint64_t a5)
{
  sub_23CA38DC4(a1, a2, a3, a4, a5, (void (*)(_QWORD *, uint64_t, uint64_t))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

{
  sub_23CA38DC4(a1, a2, a3, a4, a5, (void (*)(_QWORD *, uint64_t, uint64_t))ChatMessagesPrompt.with<A>(model:chatParameters:modelType:));
}

void ChatMessagesPrompt.with<A>(model:modelType:)()
{
  sub_23CA377A4();
}

{
  sub_23CA377A4();
}

_QWORD *ChatMessagesPrompt.withModel<A>(modelType:model:)(_QWORD *(*a1)(_QWORD *__return_ptr), uint64_t a2, uint64_t a3)
{
  return sub_23CA38EF4(a1, a2, a3, (void (*)(_QWORD *, uint64_t))ChatMessagesPrompt.with<A>(model:modelType:));
}

{
  return sub_23CA38EF4(a1, a2, a3, (void (*)(_QWORD *, uint64_t))ChatMessagesPrompt.with<A>(model:modelType:));
}

void sub_23CA38DC4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4, uint64_t a5, void (*a6)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *(*v10)(_QWORD *__return_ptr);
  _QWORD *v11;
  _QWORD v12[5];
  void (*v13)(_QWORD *);

  v13 = a3;
  MEMORY[0x24BDAC7A8](a1);
  sub_23CA3AD14();
  v11 = v10(v12);
  if (!v6)
  {
    v13(v11);
    a6(v12, v7, a5);
    sub_23CA3AFF8();
    _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v12);
  }
  sub_23CA2315C();
}

void sub_23CA38E98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_23CA23110();
}

_QWORD *sub_23CA38EF4(_QWORD *(*a1)(_QWORD *__return_ptr), uint64_t a2, uint64_t a3, void (*a4)(_QWORD *, uint64_t))
{
  uint64_t v4;
  _QWORD *result;
  _QWORD v8[5];

  result = a1(v8);
  if (!v4)
  {
    a4(v8, a3);
    return (_QWORD *)_s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v8);
  }
  return result;
}

uint64_t dispatch thunk of PromptRunResultDecodable.init(promptOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 8) + *(_QWORD *)(a5 + 8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23CA38FFC;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_23CA38FFC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v2 + 8));
}

ValueMetadata *type metadata accessor for CompletionPromptRunConfig()
{
  return &type metadata for CompletionPromptRunConfig;
}

uint64_t sub_23CA3904C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23CA39054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA39654(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0]);
}

_QWORD *sub_23CA39070(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23CA39718(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t sub_23CA3908C(uint64_t a1, uint64_t a2)
{
  return sub_23CA39890(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA390A8()
{
  sub_23CA39964();
}

void sub_23CA390C4()
{
  sub_23CA399CC();
}

void sub_23CA390E0()
{
  sub_23CA39A34();
}

void sub_23CA390FC()
{
  sub_23CA39A9C();
}

void sub_23CA39118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA39B04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA39134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA39D24(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t type metadata accessor for CompletionPromptRunConfig.Typed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompletionPromptRunConfig.Typed);
}

uint64_t sub_23CA3915C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA39654(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0]);
}

_QWORD *sub_23CA39178(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23CA39718(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t sub_23CA39194(uint64_t a1, uint64_t a2)
{
  return sub_23CA39890(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA391B0()
{
  sub_23CA39964();
}

void sub_23CA391CC()
{
  sub_23CA399CC();
}

void sub_23CA391E8()
{
  sub_23CA39A34();
}

void sub_23CA39204()
{
  sub_23CA39A9C();
}

void sub_23CA39220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA39B04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA3923C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA39D24(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t type metadata accessor for CompletionPromptRunConfig.TypedStreamable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompletionPromptRunConfig.TypedStreamable);
}

uint64_t sub_23CA39264()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23CA3926C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA3A01C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0]);
}

void sub_23CA39278()
{
  sub_23CA3A084();
}

uint64_t sub_23CA39284(uint64_t a1, uint64_t a2)
{
  return sub_23CA3944C(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA39290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A188(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA3929C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A1F0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t *sub_23CA392A8(uint64_t *result, uint64_t *a2)
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

void sub_23CA39410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A234(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA3941C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA394C4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t sub_23CA39428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA3A2B0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

void sub_23CA39434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA3A474(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A7E0]);
}

uint64_t type metadata accessor for CompletionPromptRunConfig.Untyped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompletionPromptRunConfig.Untyped);
}

uint64_t sub_23CA3944C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v5 = a3(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  v7 = (a1 + *(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v7);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v7 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

void sub_23CA394C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  __int128 *v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  sub_23CA3ABA4(a1, a2, a3, a4);
  sub_23CA3B0E4();
  sub_23CA3AD7C(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40));
  v6 = sub_23CA3AE3C();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v6);
  v7 = *v4;
  v8 = v4[1];
  *(_QWORD *)(v5 + 32) = *((_QWORD *)v4 + 4);
  *(_OWORD *)v5 = v7;
  *(_OWORD *)(v5 + 16) = v8;
  v9 = sub_23CA3AB6C();
  (*(void (**)(uint64_t))(v10 + 40))(v9);
  sub_23CA3AD70();
}

uint64_t type metadata accessor for CompletionPromptRunConfig.UntypedStreamable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompletionPromptRunConfig.UntypedStreamable);
}

ValueMetadata *type metadata accessor for ChatMessagesPromptRunConfig()
{
  return &type metadata for ChatMessagesPromptRunConfig;
}

uint64_t sub_23CA39530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA39654(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0]);
}

_QWORD *sub_23CA3954C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23CA39718(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t sub_23CA39568(uint64_t a1, uint64_t a2)
{
  return sub_23CA39890(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39584()
{
  sub_23CA39964();
}

void sub_23CA395A0()
{
  sub_23CA399CC();
}

void sub_23CA395BC()
{
  sub_23CA39A34();
}

void sub_23CA395D8()
{
  sub_23CA39A9C();
}

void sub_23CA395F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA39B04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA39D24(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.Typed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChatMessagesPromptRunConfig.Typed);
}

uint64_t sub_23CA39638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA39654(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0]);
}

uint64_t sub_23CA39654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t AssociatedTypeWitness;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  AssociatedTypeWitness = sub_23CA3B078(a1, a2, a3, a4);
  if (v5 <= 0x3F)
  {
    AssociatedTypeWitness = sub_23CA3B048();
    if (v6 <= 0x3F)
    {
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      if (v7 <= 0x3F)
      {
        sub_23CA3AD54();
        return 0;
      }
    }
  }
  return AssociatedTypeWitness;
}

_QWORD *sub_23CA396FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23CA39718(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

_QWORD *sub_23CA39718(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;

  v23 = sub_23CA3AC08((uint64_t)a1, (uint64_t)a2, a3, a4);
  v5 = *(_QWORD *)(v23 - 8);
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v5 + 64) + v8;
  v10 = *(_QWORD **)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = v13;
  v22 = v10;
  if ((v8 | *(_BYTE *)(v5 + 80) | v13) <= 7u
    && (((unint64_t)v10 + v13 + (v9 & ~(unint64_t)v8)) & ~(unint64_t)v13)
     + *(_QWORD *)(v12 + 64) <= 0x18
    && ((v8 | *(_DWORD *)(v5 + 80) | v13) & 0x100000) == 0)
  {
    v17 = ~(unint64_t)v8;
    v21 = AssociatedTypeWitness;
    v10 = a1;
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, v23);
    v18 = ((unint64_t)a1 + v9) & v17;
    v19 = ((unint64_t)a2 + v9) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v18, v19, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(((unint64_t)v22 + v14 + v18) & ~v14, ((unint64_t)v22 + v14 + v19) & ~v14, v21);
  }
  else
  {
    *a1 = *a2;
    sub_23CA3AF88();
  }
  return v10;
}

uint64_t sub_23CA39874(uint64_t a1, uint64_t a2)
{
  return sub_23CA39890(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t sub_23CA39890(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;

  v5 = a3(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v8 = (*(_QWORD *)(v6 + 64) + a1 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t, _QWORD))(v7 + 8))(v8, *(_QWORD *)(a2 + 16));
  v9 = *(_QWORD *)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))((v8 + v9 + *(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
}

void sub_23CA39948()
{
  sub_23CA39964();
}

void sub_23CA39964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23CA3B098();
  sub_23CA3AA90(v2, v3, v4, v5);
  sub_23CA3B0D8();
  sub_23CA3ADB0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16));
  sub_23CA3A8D8();
  sub_23CA3AC80(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v6 = sub_23CA3AA58();
  v7 = sub_23CA3AA0C(v6);
  (*(void (**)(uint64_t))(v8 + 16))(v7);
  sub_23CA3AAE8();
}

void sub_23CA399B0()
{
  sub_23CA399CC();
}

void sub_23CA399CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23CA3B098();
  sub_23CA3AA90(v2, v3, v4, v5);
  sub_23CA3B0D8();
  sub_23CA3ADB0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 24));
  sub_23CA3A8D8();
  sub_23CA3AC80(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 24));
  v6 = sub_23CA3AA58();
  v7 = sub_23CA3AA0C(v6);
  (*(void (**)(uint64_t))(v8 + 24))(v7);
  sub_23CA3AAE8();
}

void sub_23CA39A18()
{
  sub_23CA39A34();
}

void sub_23CA39A34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23CA3B098();
  sub_23CA3AA90(v2, v3, v4, v5);
  sub_23CA3B0D8();
  sub_23CA3ADB0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32));
  sub_23CA3A8D8();
  sub_23CA3AC80(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32));
  v6 = sub_23CA3AA58();
  v7 = sub_23CA3AA0C(v6);
  (*(void (**)(uint64_t))(v8 + 32))(v7);
  sub_23CA3AAE8();
}

void sub_23CA39A80()
{
  sub_23CA39A9C();
}

void sub_23CA39A9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23CA3B098();
  sub_23CA3AA90(v2, v3, v4, v5);
  sub_23CA3B0D8();
  sub_23CA3ADB0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 40));
  sub_23CA3A8D8();
  sub_23CA3AC80(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 40));
  v6 = sub_23CA3AA58();
  v7 = sub_23CA3AA0C(v6);
  (*(void (**)(uint64_t))(v8 + 40))(v7);
  sub_23CA3AAE8();
}

void sub_23CA39AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA39B04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v7 = *(_QWORD *)(sub_23CA3AC08(a1, a2, a3, a4) - 8);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_DWORD *)(v8 + 84) <= *(_DWORD *)(v7 + 84))
    v9 = *(_DWORD *)(v7 + 84);
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v10 + 84) <= v9)
    v11 = v9;
  else
    v11 = *(_DWORD *)(v10 + 84);
  if (!v5)
    goto LABEL_26;
  if (v5 > v11)
  {
    v12 = ((*(_QWORD *)(v8 + 64)
          + *(unsigned __int8 *)(v10 + 80)
          + ((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + *(_QWORD *)(v10 + 64);
    if (v12 > 3)
      goto LABEL_29;
    v13 = ((v5 - v11 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v13))
    {
      if (!*(_DWORD *)(a1 + v12))
        goto LABEL_24;
      goto LABEL_17;
    }
    if (v13 > 0xFF)
    {
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_24;
      goto LABEL_17;
    }
    if (v13 >= 2)
    {
LABEL_29:
      if (!*(_BYTE *)(a1 + v12))
        goto LABEL_24;
LABEL_17:
      if ((_DWORD)v12)
      {
        if (v12 <= 3)
          v14 = v12;
        else
          v14 = 4;
        __asm { BR              X12 }
      }
      goto LABEL_26;
    }
  }
LABEL_24:
  if (v11)
  {
    sub_23CA3AD88();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v15, v16, v17);
    return;
  }
LABEL_26:
  sub_23CA3AD88();
}

void sub_23CA39D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA39D24(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;

  v6 = a3;
  v7 = a2;
  v9 = *(_QWORD *)(sub_23CA3B120(a1, a2, a3, a4, a5) - 8);
  v10 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v10 + 84) <= *(_DWORD *)(v9 + 84))
    v11 = *(_DWORD *)(v9 + 84);
  else
    v11 = *(_DWORD *)(v10 + 84);
  v12 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v12 + 84) <= v11)
    v13 = v11;
  else
    v13 = *(_DWORD *)(v12 + 84);
  v14 = ((*(_QWORD *)(v10 + 64)
        + *(unsigned __int8 *)(v12 + 80)
        + ((*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
      + *(_QWORD *)(v12 + 64);
  v15 = 8 * v14;
  if (v6 <= v13)
  {
    v17 = 0;
    v16 = a1;
  }
  else
  {
    v16 = a1;
    if (v14 <= 3)
    {
      v19 = ((v6 - v13 + ~(-1 << v15)) >> v15) + 1;
      if (HIWORD(v19))
      {
        v17 = 4u;
      }
      else if (v19 >= 0x100)
      {
        v17 = 2;
      }
      else
      {
        v17 = v19 > 1;
      }
    }
    else
    {
      v17 = 1u;
    }
  }
  if (v13 < v7)
  {
    v18 = ~v13 + v7;
    if (v14 < 4)
    {
      if ((_DWORD)v14)
      {
        v20 = v18 & ~(-1 << v15);
        sub_23CA3B054();
        if ((_DWORD)v14 == 3)
        {
          *(_WORD *)v16 = v20;
          *(_BYTE *)(v16 + 2) = BYTE2(v20);
        }
        else if ((_DWORD)v14 == 2)
        {
          *(_WORD *)v16 = v20;
        }
        else
        {
          *(_BYTE *)v16 = v20;
        }
      }
    }
    else
    {
      sub_23CA3B054();
      *(_DWORD *)v16 = v18;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.TypedStreamable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChatMessagesPromptRunConfig.TypedStreamable);
}

uint64_t sub_23CA39FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA3A01C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39FB0()
{
  sub_23CA3A084();
}

uint64_t sub_23CA39FBC(uint64_t a1, uint64_t a2)
{
  return sub_23CA3944C(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A188(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A1F0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA3A234(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA39FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA394C4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t sub_23CA39FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA3A2B0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

void sub_23CA3A004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CA3A474(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE7A8B0]);
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.Untyped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChatMessagesPromptRunConfig.Untyped);
}

uint64_t sub_23CA3A01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = sub_23CA3B078(a1, a2, a3, a4);
  if (v5 <= 0x3F)
  {
    result = sub_23CA3B048();
    if (v6 <= 0x3F)
    {
      sub_23CA3AD54();
      return 0;
    }
  }
  return result;
}

void sub_23CA3A084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, unint64_t);

  sub_23CA3B098();
  v1 = v0;
  v3 = (_QWORD *)v2;
  v5 = (_QWORD *)v4;
  v7 = sub_23CA3AC08(v4, v2, v0, v6);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = v11;
  if (((*(_DWORD *)(v8 + 80) | v11) & 0x100000) != 0
    || ((v13 = *(_QWORD *)(v8 + 64),
         ((((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + v11 + 40) & ~(unint64_t)v11)
       + *(_QWORD *)(v10 + 64) <= 0x18)
      ? (v14 = (v11 | *(_DWORD *)(v8 + 80) & 0xF8u) > 7)
      : (v14 = 1),
        v14))
  {
    *v5 = *v3;
    sub_23CA3AF88();
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v8 + 16))(v5, v3, v7);
    v15 = ((unint64_t)v5 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    v16 = ((unint64_t)v3 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
    v17 = sub_23CA3B034(*(_QWORD *)(v16 + 32));
    v18(v17, v16);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((v15 + v12 + 40) & ~v12, (v16 + v12 + 40) & ~v12, v9);
  }
  sub_23CA3AAE8();
}

void sub_23CA3A188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, unint64_t);
  uint64_t v11;
  uint64_t v12;

  sub_23CA3ABA4(a1, a2, a3, a4);
  sub_23CA3B0E4();
  sub_23CA3AD7C(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16));
  v7 = *(_QWORD *)(v6 + 64) + 7;
  v8 = (v7 + v4) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(((v7 + v5) & 0xFFFFFFFFFFFFFFF8) + 24) = *(_QWORD *)(v8 + 24);
  v9 = sub_23CA3B034(*(_QWORD *)(v8 + 32));
  v10(v9, v8);
  v11 = sub_23CA3AB6C();
  (*(void (**)(uint64_t))(v12 + 16))(v11);
  sub_23CA3AD70();
}

void sub_23CA3A1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  sub_23CA3ABA4(a1, a2, a3, a4);
  sub_23CA3B0E4();
  sub_23CA3AD7C(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24));
  v6 = (uint64_t *)sub_23CA3AE3C();
  sub_23CA392A8(v6, v4);
  v7 = sub_23CA3AB6C();
  (*(void (**)(uint64_t))(v8 + 24))(v7);
  sub_23CA3AD70();
}

void sub_23CA3A234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  sub_23CA3ABA4(a1, a2, a3, a4);
  sub_23CA3B0E4();
  sub_23CA3AD7C(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32));
  v8 = *(_QWORD *)(v7 + 64) + 7;
  v9 = (v8 + v6) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + v5) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_QWORD *)(v10 + 32);
  v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(_QWORD *)(v9 + 32) = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(v4 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 32))((*(unsigned __int8 *)(v13 + 80) + 40 + v9) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (*(unsigned __int8 *)(v13 + 80) + 40 + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  sub_23CA3AD70();
}

uint64_t sub_23CA3A2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v19;
  unsigned int v21;
  int v22;
  int v23;
  unint64_t v24;
  unint64_t v25;

  v5 = a2;
  v7 = sub_23CA3AC08(a1, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int *)(v11 + 84);
  if (v9 <= v12)
    v13 = *(_DWORD *)(v11 + 84);
  else
    v13 = *(_DWORD *)(v8 + 84);
  if (v13 <= 0x7FFFFFFF)
    v14 = 0x7FFFFFFF;
  else
    v14 = v13;
  if (!v5)
    return 0;
  v15 = *(_QWORD *)(v8 + 64);
  v16 = *(unsigned __int8 *)(v11 + 80);
  if (v5 <= v14)
    goto LABEL_27;
  v17 = ((v16 + ((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~v16) + *(_QWORD *)(v11 + 64);
  v18 = 8 * v17;
  if (v17 <= 3)
  {
    v21 = ((v5 - v14 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v21))
    {
      v19 = *(_DWORD *)(a1 + v17);
      if (!v19)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v21 > 0xFF)
    {
      v19 = *(unsigned __int16 *)(a1 + v17);
      if (!*(_WORD *)(a1 + v17))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v21 < 2)
    {
LABEL_27:
      if ((_DWORD)v9 == v14)
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, v9, v7);
      v24 = (a1 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
      if ((v13 & 0x80000000) != 0)
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((v24 + v16 + 40) & ~v16, v12, v10);
      v25 = *(_QWORD *)(v24 + 24);
      if (v25 >= 0xFFFFFFFF)
        LODWORD(v25) = -1;
      return (v25 + 1);
    }
  }
  v19 = *(unsigned __int8 *)(a1 + v17);
  if (!*(_BYTE *)(a1 + v17))
    goto LABEL_27;
LABEL_18:
  v22 = (v19 - 1) << v18;
  if (v17 > 3)
    v22 = 0;
  if ((_DWORD)v17)
  {
    if (v17 <= 3)
      v23 = v17;
    else
      v23 = 4;
    __asm { BR              X12 }
  }
  return v14 + v22 + 1;
}

void sub_23CA3A474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  char v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v6 = a3;
  v7 = a2;
  v9 = *(_QWORD *)(sub_23CA3B120(a1, a2, a3, a4, a5) - 8);
  v10 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v10 + 84))
    v11 = *(_DWORD *)(v10 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  else
    v12 = v11;
  v13 = ((*(unsigned __int8 *)(v10 + 80) + ((*(_QWORD *)(v9 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + *(_QWORD *)(v10 + 64);
  v14 = 8 * v13;
  if (v6 <= v12)
  {
    v15 = 0;
  }
  else if (v13 <= 3)
  {
    v17 = ((v6 - v12 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      v15 = 4u;
    }
    else if (v17 >= 0x100)
    {
      v15 = 2;
    }
    else
    {
      v15 = v17 > 1;
    }
  }
  else
  {
    v15 = 1u;
  }
  if (v12 < v7)
  {
    v16 = ~v12 + v7;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v18 = v16 & ~(-1 << v14);
        sub_23CA3B060();
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v18;
          *(_BYTE *)(a1 + 2) = BYTE2(v18);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *(_BYTE *)a1 = v18;
        }
      }
    }
    else
    {
      sub_23CA3B060();
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X17 }
}

uint64_t type metadata accessor for ChatMessagesPromptRunConfig.UntypedStreamable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA22288(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChatMessagesPromptRunConfig.UntypedStreamable);
}

uint64_t sub_23CA3A6E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t *sub_23CA3A6F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v7;

  v4 = (_QWORD *)(v1 + *(int *)(v2 + 28));
  v7 = *(_OWORD *)(v4 + 3);
  sub_23CA1F350(v4, v4[3]);
  v5 = v0 + *(int *)(v3 + 52);
  *(_OWORD *)(v5 + 24) = v7;
  return sub_23CA1F394((uint64_t *)v5);
}

uint64_t *sub_23CA3A734()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  __int128 v6;

  v4 = (_QWORD *)(v0 + *(int *)(v1 + 28));
  v6 = *(_OWORD *)(v4 + 3);
  sub_23CA1F350(v4, v4[3]);
  *(_OWORD *)(v2 + 136) = v6;
  return sub_23CA1F394(v3);
}

uint64_t sub_23CA3A76C()
{
  return swift_task_alloc();
}

_QWORD *sub_23CA3A780()
{
  __int128 *v0;
  uint64_t v1;

  sub_23CA34138(v0, (_OWORD *)(v1 + 16));
  return sub_23CA1F350((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23CA3A7B8()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[29] + 16))(v0[30], v0[21] + *(int *)(v0[20] + 32), v0[28]);
}

uint64_t sub_23CA3A7E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 296) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA3A808()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 280) = v0;
  return swift_task_dealloc();
}

_QWORD *sub_23CA3A830()
{
  uint64_t v0;
  __int128 *v1;

  sub_23CA34138(v1, (_OWORD *)(v0 + 16));
  return sub_23CA1F350((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
}

uint64_t sub_23CA3A868()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[32] + 16))(v0[33], v0[20] + *(int *)(v0[19] + 40), v0[31]);
}

uint64_t sub_23CA3A890()
{
  return sub_23CA4B30C();
}

uint64_t sub_23CA3A8B4()
{
  return sub_23CA4B324();
}

uint64_t sub_23CA3A900()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA3A910()
{
  return swift_task_dealloc();
}

void sub_23CA3A920()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  GenerativeConfigurationProtocol.with<A>(model:)(v0, v2, v1);
}

uint64_t sub_23CA3A940()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 256) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA3A960()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 272) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23CA3A980()
{
  return sub_23CA4B30C();
}

uint64_t sub_23CA3A9A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v2;
  v3[1] = a1;
  return v1;
}

double sub_23CA3A9C4()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t sub_23CA3A9E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_23CA3AA0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return (v2 + v3 + v1) & ~v3;
}

uint64_t sub_23CA3AA30(uint64_t a1, uint64_t a2)
{
  sub_23CA2B764(a1, a2);
  return sub_23CA4B324();
}

uint64_t sub_23CA3AA58()
{
  return swift_getAssociatedTypeWitness();
}

void sub_23CA3AA74(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[25] = a1;
  v2[14] = v1;
  v2[15] = v3;
  v2[16] = v1;
  v2[17] = a1;
  type metadata accessor for GenerativeConfigurationRunnable();
}

uint64_t sub_23CA3AA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

void sub_23CA3AAAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  GenerativeConfigurationProtocol.with<A>(model:)(v2, v1, v0);
}

double sub_23CA3AAC8()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

_QWORD *sub_23CA3AAFC()
{
  _QWORD *v0;
  uint64_t v1;

  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v1);
  return sub_23CA1F350(v0, v0[3]);
}

void sub_23CA3AB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;

  sub_23CA38E98(v14, v15 + *(int *)(a14 + 52));
}

uint64_t sub_23CA3AB3C()
{
  return swift_dynamicCast();
}

uint64_t sub_23CA3AB54()
{
  return swift_dynamicCast();
}

uint64_t sub_23CA3AB6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80);
  return (v2 + 40 + v1) & ~v2;
}

uint64_t sub_23CA3AB90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v1, v2);
}

uint64_t sub_23CA3ABA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t sub_23CA3ABB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v2, v1);
}

uint64_t sub_23CA3ABCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

uint64_t sub_23CA3ABE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

uint64_t sub_23CA3ABF4()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA3AC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t sub_23CA3AC30()
{
  return swift_task_dealloc();
}

_QWORD *sub_23CA3AC40()
{
  _QWORD *v0;

  return sub_23CA1F350(v0, v0[3]);
}

uint64_t sub_23CA3AC60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_23CA3AC70()
{
  uint64_t v0;

  return sub_23CA1F3D0(*(_QWORD *)(v0 + 152));
}

uint64_t sub_23CA3AC80@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v1, v2);
}

uint64_t sub_23CA3AC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23CA3ACA0()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23CA3ACB0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 144);
}

uint64_t sub_23CA3ACC4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA3ACD8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA3ACEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v3 + v2);
}

uint64_t sub_23CA3AD04()
{
  uint64_t v0;

  return sub_23CA1F3D0(*(_QWORD *)(v0 + 152));
}

void sub_23CA3AD0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23CA38904(v2, a2);
}

uint64_t sub_23CA3AD2C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 32);
}

uint64_t sub_23CA3AD54()
{
  return swift_initStructMetadata();
}

uint64_t sub_23CA3AD7C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t *sub_23CA3ADA4(uint64_t a1)
{
  uint64_t *v1;

  v1[4] = a1;
  return sub_23CA1F394(v1);
}

uint64_t sub_23CA3ADB0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23CA3ADBC()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_23CA3ADE4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 232) = result;
  *(_QWORD *)(v2 + 240) = *(_QWORD *)(v1 + 24);
  return result;
}

uint64_t sub_23CA3ADF4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 184) = result;
  *(_QWORD *)(v2 + 192) = *(_QWORD *)(v1 + 16);
  return result;
}

_QWORD *sub_23CA3AE04(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *result = v2;
  result[1] = v1;
  return result;
}

uint64_t sub_23CA3AE14(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(_QWORD *)(a15 + 24) = result;
  return result;
}

void sub_23CA3AE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CompletionPromptRunConfig.Typed.run(returning:)(a1, a2, a3);
}

void sub_23CA3AE30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ChatMessagesPromptRunConfig.Typed.run(returning:)(a1, a2, a3);
}

unint64_t sub_23CA3AE3C()
{
  uint64_t v0;
  uint64_t v1;

  return (*(_QWORD *)(v1 + 64) + 7 + v0) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_23CA3AE74(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[4] = result;
  v6[9] = *(_QWORD *)(a3 + 24);
  v6[10] = *(_QWORD *)(a3 + 16);
  return result;
}

uint64_t sub_23CA3AEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return sub_23CA4B2D0();
}

uint64_t sub_23CA3AEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return sub_23CA4B2F4();
}

uint64_t sub_23CA3AED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[19] = a3;
  v4[20] = v3;
  v4[18] = a1;
  return sub_23CA4B2D0();
}

uint64_t sub_23CA3AEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[19] = a3;
  v4[20] = v3;
  v4[18] = a1;
  return sub_23CA4B2F4();
}

uint64_t sub_23CA3AF00(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[3] = a3;
  v4[4] = v3;
  v4[2] = result;
  v4[5] = *(_QWORD *)(a3 + 24);
  v4[6] = *(_QWORD *)(a3 + 16);
  return result;
}

uint64_t sub_23CA3AF1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 104);
}

void sub_23CA3AF38(uint64_t (*a1)(void)@<X1>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  void (*v5)(uint64_t, char *);
  uint64_t v6;

  sub_23CA38B08(a1, a2, a3, a4, a5, v6, v5);
}

void sub_23CA3AF40(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23CA38904(v2, a2);
}

uint64_t sub_23CA3AF48()
{
  return swift_task_dealloc();
}

void sub_23CA3AF58(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23CA229B0(a1, v3, a3);
}

uint64_t sub_23CA3AF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23CA3AF70()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t sub_23CA3AF88()
{
  return swift_retain();
}

uint64_t sub_23CA3AF98()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA3AFB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 80);
}

char *sub_23CA3AFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return (char *)&a9 - v9;
}

uint64_t sub_23CA3AFE0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 72);
}

uint64_t sub_23CA3AFF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

void sub_23CA3B008(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23CA38904(v2, a2);
}

uint64_t sub_23CA3B010(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v2[4] = result;
  v2[5] = v1;
  v2[6] = *(_QWORD *)(result + 24);
  v2[7] = *(_QWORD *)(result + 16);
  return result;
}

void sub_23CA3B028()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA38E98(v0, v1 - 120);
}

uint64_t sub_23CA3B034@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return v1;
}

uint64_t sub_23CA3B048()
{
  return swift_checkMetadataState();
}

void sub_23CA3B054()
{
  void *v0;
  size_t v1;

  bzero(v0, v1);
}

void sub_23CA3B060()
{
  void *v0;
  size_t v1;

  bzero(v0, v1);
}

uint64_t sub_23CA3B06C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 264) = result;
  return result;
}

uint64_t sub_23CA3B078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  return a4(319);
}

uint64_t sub_23CA3B084()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_23CA3B0AC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 216);
}

uint64_t sub_23CA3B0B8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

_QWORD *sub_23CA3B0CC(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *result = v2;
  result[1] = v1;
  return result;
}

uint64_t sub_23CA3B0F0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 248) = result;
  return result;
}

uint64_t sub_23CA3B0FC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 272) = result;
  return result;
}

uint64_t sub_23CA3B108(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 288) = result;
  return result;
}

uint64_t sub_23CA3B120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(0);
}

uint64_t CompletionPrompt.render<A>(with:)()
{
  uint64_t v0;

  sub_23CA3B270();
  *(_QWORD *)(v0 + 16) = swift_task_alloc();
  sub_23CA4B2D0();
  sub_23CA217E8(&qword_2543121E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A7E0], MEMORY[0x24BE7A7D8]);
  sub_23CA3B24C((uint64_t)sub_23CA1EAE4);
  return sub_23CA4B234();
}

uint64_t ChatMessagesPrompt.render<A>(with:)()
{
  uint64_t v0;

  sub_23CA3B270();
  *(_QWORD *)(v0 + 16) = swift_task_alloc();
  sub_23CA4B2F4();
  sub_23CA217E8(qword_256BED058, (uint64_t (*)(uint64_t))MEMORY[0x24BE7A8B0], MEMORY[0x24BE7A8A8]);
  sub_23CA3B24C((uint64_t)sub_23CA3B248);
  return sub_23CA4B1EC();
}

uint64_t sub_23CA3B24C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

uint64_t sub_23CA3B284(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void (*v69)(uint64_t, unint64_t, uint64_t);
  char *v70;
  unsigned int (*v71)(char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v4 = sub_23CA22494(&qword_256BEDA28);
  MEMORY[0x24BDAC7A8](v4);
  sub_23CA3BB68();
  v65 = v5;
  v6 = sub_23CA4B288();
  v73 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_23CA2804C();
  v64 = v7;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v57 - v9;
  v76 = sub_23CA4B138();
  v74 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  sub_23CA3BB68();
  v75 = v11;
  v12 = sub_23CA4B144();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  sub_23CA2804C();
  v72 = v14;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)&v57 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v57 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v57 - v21;
  sub_23CA4B270();
  v71 = *(unsigned int (**)(char *, uint64_t))(v13 + 88);
  if (v71(v22, v12) != *MEMORY[0x24BE3B620])
  {
    sub_23CA3BB7C((uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    return 0;
  }
  v62 = *(void (**)(char *, uint64_t))(v13 + 96);
  v62(v22, v12);
  v23 = *(_QWORD *)(*(_QWORD *)v22 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRetain();
  v24 = sub_23CA3B7C4(v23, a1, a2);
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_29:
    if (!v27[2])
    {
      sub_23CA22494(&qword_256BED4F8);
      v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = xmmword_23CA4D810;
      *(_QWORD *)(v55 + 32) = a1;
      *(_QWORD *)(v55 + 40) = a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v55;
    }
    return (uint64_t)v27;
  }
  v70 = v20;
  v58 = a1;
  v59 = a2;
  v26 = v24 + ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80));
  v66 = *(_QWORD *)(v74 + 72);
  v69 = *(void (**)(uint64_t, unint64_t, uint64_t))(v74 + 16);
  v68 = *MEMORY[0x24BE3B5F8];
  v57 = v24;
  swift_bridgeObjectRetain();
  v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v67 = v13;
  v28 = v6;
  v29 = v10;
  v60 = v10;
  v61 = v28;
  while (1)
  {
    v69(v75, v26, v76);
    v30 = v70;
    sub_23CA4B12C();
    sub_23CA4B27C();
    v31 = v72;
    sub_23CA4B270();
    v32 = v71((char *)v31, v12);
    if (v32 == v68)
    {
      v62((char *)v31, v12);
      v33 = swift_projectBox();
      v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
      v35 = v65;
      v34(v65, v33, v12);
      v36 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v63, v35, v12);
      swift_release();
      v34((uint64_t)v30, (uint64_t)v36, v12);
      v37 = v64;
      sub_23CA4B27C();
      v38 = sub_23CA4B264();
      v39 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
      v40 = v37;
      v28 = v61;
      v39(v40, v61);
      v41 = (uint64_t)v36;
      v29 = v60;
      sub_23CA3BB7C(v41, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    }
    else
    {
      sub_23CA3BB7C(v31, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
      v38 = sub_23CA4B264();
      v39 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
    }
    v42 = v29;
    v43 = v28;
    v39((uint64_t)v29, v28);
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v75, v76);
    v44 = *(_QWORD *)(v38 + 16);
    v45 = v27[2];
    v46 = v45 + v44;
    if (__OFADD__(v45, v44))
      break;
    isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || v46 > v27[3] >> 1)
    {
      if (v45 <= v46)
        v48 = v45 + v44;
      else
        v48 = v45;
      v27 = sub_23CA32008(isUniquelyReferenced_nonNull_native, v48, 1, (uint64_t)v27);
    }
    v28 = v43;
    v29 = v42;
    if (*(_QWORD *)(v38 + 16))
    {
      v49 = v27[2];
      v13 = v67;
      if ((v27[3] >> 1) - v49 < v44)
        goto LABEL_34;
      v50 = (unint64_t)&v27[2 * v49 + 4];
      if (v38 + 32 < v50 + 16 * v44 && v50 < v38 + 32 + 16 * v44)
        goto LABEL_36;
      swift_arrayInitWithCopy();
      if (v44)
      {
        v52 = v27[2];
        v53 = __OFADD__(v52, v44);
        v54 = v52 + v44;
        if (v53)
          goto LABEL_35;
        v27[2] = v54;
      }
    }
    else
    {
      v13 = v67;
      if (v44)
        goto LABEL_33;
    }
    swift_bridgeObjectRelease();
    v26 += v66;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      a1 = v58;
      a2 = v59;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  sub_23CA335CC();
  sub_23CA3BB58();
  result = sub_23CA3BB4C();
  __break(1u);
  return result;
}

uint64_t sub_23CA3B7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v26 = a3;
  v30 = sub_23CA4B138();
  v6 = *(_QWORD *)(v30 - 8);
  v7 = MEMORY[0x24BDAC7A8](v30);
  v29 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v24 - v10;
  v12 = MEMORY[0x24BEE4AF8];
  v31 = MEMORY[0x24BEE4AF8];
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12;
  }
  v24[1] = v3;
  v25 = a1;
  v13 = 0;
  v14 = v26;
  v27 = a2;
  while (v13 < *(_QWORD *)(a1 + 16))
  {
    v15 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v16 = *(_QWORD *)(v6 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, a1 + v15 + v16 * v13, v30);
    if (sub_23CA4B120() == a2 && v17 == v14)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v29, v11, v30);
      v21 = v31;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23CA4806C(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v31;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_23CA4806C(v22 > 1, v23 + 1, 1);
        v21 = v31;
      }
      *(_QWORD *)(v21 + 16) = v23 + 1;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v20)(v21 + v15 + v23 * v16, v29, v30);
      v31 = v21;
      a1 = v25;
      v14 = v26;
      goto LABEL_16;
    }
    v19 = sub_23CA4B6D8();
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      goto LABEL_11;
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v30);
LABEL_16:
    ++v13;
    a2 = v27;
    if (v28 == v13)
    {
      v12 = v31;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA3B9DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    sub_23CA335CC();
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy();
    sub_23CA335CC();
    sub_23CA3BB58();
  }
  result = sub_23CA3BB4C();
  __break(1u);
  return result;
}

uint64_t sub_23CA3BA80(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if (a2 < 0)
  {
    sub_23CA335CC();
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_23CA4B138() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
    sub_23CA335CC();
    sub_23CA3BB58();
  }
  result = sub_23CA3BB4C();
  __break(1u);
  return result;
}

uint64_t sub_23CA3BB4C()
{
  return sub_23CA4B6A8();
}

uint64_t sub_23CA3BB7C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void StreamingObjectTokenStreamProcessor.__allocating_init(_:)(uint64_t a1)
{
  swift_allocObject();
  StreamingObjectTokenStreamProcessor.init(_:)(a1);
  sub_23CA23110();
}

uint64_t sub_23CA3BBBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_23CA25314(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(a3 + 56);
    v10 = type metadata accessor for FieldStreamingSupport(0);
    sub_23CA47334(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v8, a4, type metadata accessor for FieldStreamingSupport);
    v11 = a4;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v13 = type metadata accessor for FieldStreamingSupport(0);
    v11 = a4;
    v12 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v11, v12, 1, v13);
}

uint64_t sub_23CA3BC50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_23CA25378(a1), (v6 & 1) != 0))
  {
    v7 = v5;
    v8 = *(_QWORD *)(a2 + 56);
    v9 = type metadata accessor for ObjectStreamingSupport(0);
    sub_23CA47334(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v7, a3, type metadata accessor for ObjectStreamingSupport);
    v10 = a3;
    v11 = 0;
    v12 = v9;
  }
  else
  {
    v12 = type metadata accessor for ObjectStreamingSupport(0);
    v10 = a3;
    v11 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v10, v11, 1, v12);
}

uint64_t sub_23CA3BCE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v5 = v3 - 1;
    v6 = sub_23CA2806C();
    sub_23CA4A768();
    sub_23CA4A6B0(a2, a1 + v7 + *(_QWORD *)(v8 + 72) * v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
    return sub_23CA4A3E8(a2, 0, 1, v6);
  }
  else
  {
    v10 = sub_23CA2806C();
    return sub_23CA4A3E8(a2, 1, 1, v10);
  }
}

uint64_t sub_23CA3BD5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6CA0];
  sub_23CA23CAC(&qword_256BED240);
  v3 = sub_23CA4B564();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_23CA3BDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v6 = sub_23CA4AD34();
  v7 = sub_23CA4A298(a1, 1, v6);
  if (v8)
  {
    sub_23CA4A6B8(v7, &qword_256BED510);
  }
  else
  {
    sub_23CA4B4E0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23CA4B4C8();
    swift_unknownObjectRelease();
  }
  v9 = sub_23CA33AC4();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23CA3BEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a2;
  *(_BYTE *)(v2 + 40) = *(_BYTE *)(a2 + 16);
  sub_23CA21048();
  return swift_task_switch();
}

uint64_t sub_23CA3BF28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_BYTE *)(v0 + 40);
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = v2;
  *(_BYTE *)(v3 + 16) = v4;
  sub_23CA24558(v1, v2, v4);
  v5 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA20F8C(v5);
}

uint64_t sub_23CA3BF60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23CA3BFB8;
  return sub_23CA3BEFC(a1, a2);
}

uint64_t sub_23CA3BFB8()
{
  uint64_t v0;

  sub_23CA2BC34();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA3BFEC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_23CA4A80C();
}

uint64_t sub_23CA3BFF8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return sub_23CA4A80C();
}

uint64_t StreamingObjectTokenStreamProcessor.__allocating_init()()
{
  uint64_t v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  _UNKNOWN **v4;

  v3 = &type metadata for NoOpStreamSanitizer;
  v4 = &off_250DA59A0;
  sub_23CA473A8();
  v0 = swift_allocObject();
  StreamingObjectTokenStreamProcessor.init(_:)((uint64_t)v2);
  return v0;
}

uint64_t StreamingObjectTokenStreamProcessor.init(_:)(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  ValueMetadata *v20;
  _UNKNOWN **v21;

  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  v3 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  v4 = sub_23CA22494(&qword_256BEDA38);
  sub_23CA4A268(v3, v5, v6, v4);
  v7 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation;
  v8 = sub_23CA22494(&qword_256BEDA48);
  sub_23CA4A268(v7, v9, v10, v8);
  v11 = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap;
  type metadata accessor for StreamSupport();
  v12 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v12 + 112) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + v11) = v12;
  sub_23CA49D10(a1, (uint64_t)&v17, &qword_256BED238);
  if (v18)
  {
    sub_23CA4A504(v13, &qword_256BED238);
    sub_23CA2DB60(&v17, (uint64_t)&v19);
  }
  else
  {
    v20 = &type metadata for NoOpStreamSanitizer;
    v21 = &off_250DA59A0;
    v14 = sub_23CA2C160();
    sub_23CA49D50(v14, v15);
    sub_23CA49D50((uint64_t)&v17, &qword_256BED238);
  }
  sub_23CA2DB60(&v19, v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer);
  return v1;
}

uint64_t type metadata accessor for StreamingObjectTokenStreamProcessor(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BEDB70);
}

uint64_t type metadata accessor for StreamSupport()
{
  return objc_opt_self();
}

uint64_t sub_23CA3C1B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_23CA22494(&qword_256BED400);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  sub_23CA4A580();
  sub_23CA22494(&qword_256BEDA60);
  swift_allocBox();
  sub_23CA22494(&qword_256BEDA68);
  sub_23CA4B4F8();
  sub_23CA4AC90();
  sub_23CA4B5C4();
  sub_23CA3C408(v0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return swift_release();
}

uint64_t sub_23CA3C2A0(uint64_t a1)
{
  _QWORD *v1;

  v1[7] = a1;
  v1[8] = sub_23CA22494(&qword_256BEDA60);
  v1[9] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_23CA3C2F8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2BCE8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_23CA3C35C;
  return sub_23CA4B504();
}

uint64_t sub_23CA3C35C()
{
  sub_23CA24398();
  sub_23CA2BC34();
  swift_endAccess();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA3C39C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  *(_OWORD *)*(_QWORD *)(v0 + 56) = *(_OWORD *)(v0 + 40);
  v1 = (uint64_t (*)(void))sub_23CA213D4();
  return v1();
}

uint64_t sub_23CA3C3B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = swift_task_alloc();
  v4 = (_QWORD *)sub_23CA4A524(v3);
  *v4 = v1;
  v4[1] = sub_23CA49FE4;
  return sub_23CA3C2A0(a1);
}

uint64_t sub_23CA3C408(uint64_t a1)
{
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
  char *v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;

  v57 = a1;
  v54 = sub_23CA22494(&qword_256BED400);
  v60 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v58 = v4;
  v59 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA22494(&qword_256BED510);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v5);
  sub_23CA3BB68();
  v63 = v6;
  sub_23CA22494(&qword_256BEDA80);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v7);
  sub_23CA3BB68();
  v55 = v8;
  sub_23CA22494(&qword_256BEDA88);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v9);
  sub_23CA339F4();
  v12 = v11 - v10;
  v13 = sub_23CA22494(&qword_256BEDA90);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  sub_23CA4A36C();
  v15 = sub_23CA22494(&qword_256BEDA48);
  v16 = *(_QWORD *)(v15 - 8);
  v61 = v15;
  v62 = v16;
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v56 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v64 = (char *)&v47 - v19;
  v20 = sub_23CA22494(&qword_256BEDA38);
  MEMORY[0x24BDAC7A8](v20);
  sub_23CA339F4();
  v25 = v24 - v23;
  if (*(_QWORD *)(v1 + 16))
  {
    sub_23CA3C840();
    swift_allocError();
    *(_OWORD *)v26 = xmmword_23CA4D150;
    *(_BYTE *)(v26 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    v28 = v1;
    v53 = v21;
    v49 = v2;
    v29 = v22;
    v51 = v22;
    v30 = v25;
    type metadata accessor for JsonStreamEvent(0);
    v52 = v28;
    v31 = v54;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v3, *MEMORY[0x24BEE6CA0], v13);
    v50 = v30;
    sub_23CA4B540();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
    v32 = v53;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v12, v30, v53);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v12, 0, 1, v32);
    sub_23CA4A718();
    sub_23CA3C87C(v12, v30, &qword_256BEDA88);
    swift_endAccess();
    v33 = v61;
    v48 = *(void (**)(uint64_t, char *, uint64_t))(v62 + 16);
    v34 = v55;
    v35 = v64;
    v48(v55, v64, v61);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v34, 0, 1, v33);
    sub_23CA4A718();
    sub_23CA3C87C(v34, v30, &qword_256BEDA80);
    swift_endAccess();
    v36 = sub_23CA4B4EC();
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v63, 1, 1, v36);
    v38 = v59;
    v37 = v60;
    v39 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v57, v31);
    v40 = v56;
    v48((uint64_t)v56, v35, v33);
    v41 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v42 = v62;
    v43 = (v58 + *(unsigned __int8 *)(v62 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = 0;
    *(_QWORD *)(v44 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v44 + v41, v38, v39);
    v45 = v61;
    (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v44 + v43, v40, v61);
    v46 = sub_23CA3CEBC(v63, (uint64_t)&unk_256BEDAA8, v44);
    sub_23CA3BFEC(v46);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v64, v45);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v50, v53);
  }
}

unint64_t sub_23CA3C840()
{
  unint64_t result;

  result = qword_256BEDA98;
  if (!qword_256BEDA98)
  {
    result = MEMORY[0x24262A1B4](&unk_23CA4DA0C, &type metadata for TokenStreamingError);
    atomic_store(result, &qword_256BEDA98);
  }
  return result;
}

void sub_23CA3C87C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23CA4A984(a1, a2, a3);
  sub_23CA4A50C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  sub_23CA23110();
}

uint64_t sub_23CA3C8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[4] = a4;
  v5[5] = a5;
  v6 = sub_23CA22494(&qword_256BEDA48);
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v7 = sub_23CA22494(&qword_256BED400);
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA3C938()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  sub_23CA35944();
  if (qword_256BECF00 != -1)
    swift_once();
  v1 = sub_23CA2BEDC();
  v2 = sub_23CA2B764(v1, (uint64_t)qword_256BEF048);
  v0[12] = v2;
  v3 = (void *)v2;
  sub_23CA4B2A0();
  v4 = sub_23CA4A498();
  if (sub_23CA337D4(v4))
  {
    *(_WORD *)sub_23CA2BCB4() = 0;
    sub_23CA33740(&dword_23CA1D000, v5, v6, "Starting streaming task");
    sub_23CA2BBDC();
  }
  v8 = v0[10];
  v7 = v0[11];
  v9 = v0[4];

  sub_23CA4A6B0(v7, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  v10 = (_QWORD *)swift_task_alloc();
  v0[13] = v10;
  *v10 = v0;
  v10[1] = sub_23CA3CA28;
  sub_23CA4ABE8();
  return sub_23CA2D500(v11);
}

uint64_t sub_23CA3CA28(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v6 = *v2;
  v4 = v6;
  sub_23CA33784(&v6);
  *(_QWORD *)(v4 + 112) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 120) = a1;
  sub_23CA21048();
  return sub_23CA4A310();
}

uint64_t sub_23CA3CA8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23CA35944();
  v2 = v0[7];
  v1 = v0[8];
  v3 = v0[5];
  type metadata accessor for JsonStreamParser();
  sub_23CA33AC4();
  sub_23CA4AA60(v1, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  v4 = (_QWORD *)sub_23CA4A4BC();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_23CA3CB18;
  sub_23CA4ABE8();
  return v8(v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_23CA3CB18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  sub_23CA2DBC4();
  sub_23CA33784(v4);
  *(_QWORD *)(v1 + 136) = a1;
  swift_task_dealloc();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 144) = v5;
  *v5 = v2;
  v5[1] = sub_23CA3CB74;
  return sub_23CA28620();
}

uint64_t sub_23CA3CB74()
{
  sub_23CA24398();
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA3CBA8()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = *(void **)(v0 + 96);
  sub_23CA4B2A0();
  v2 = sub_23CA4A498();
  if (sub_23CA4A414(v2))
  {
    *(_WORD *)sub_23CA2BCB4() = 0;
    sub_23CA4A8A8(&dword_23CA1D000, v3, v4, "Finished streaming task");
    sub_23CA2BBDC();
  }
  swift_release();

  sub_23CA4ADA4();
  sub_23CA2131C();
  v5 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA211BC(v5);
}

void sub_23CA3CC2C()
{
  sub_23CA35E70();
  sub_23CA339CC();
}

void sub_23CA3CC54()
{
  NSObject *v0;
  os_log_type_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t v7;

  sub_23CA4B2A0();
  v3 = sub_23CA33670();
  if (sub_23CA4A414(v3))
  {
    v4 = *(_QWORD *)(v2 + 112);
    v5 = (uint8_t *)sub_23CA2BCB4();
    v6 = (_QWORD *)sub_23CA2BCB4();
    *(_DWORD *)v5 = 138412290;
    MEMORY[0x24262A124](v4);
    v7 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v2 + 24) = v7;
    sub_23CA4B600();
    *v6 = v7;
    MEMORY[0x24262A118](v4);
    MEMORY[0x24262A118](v4);
    sub_23CA2BEA0(&dword_23CA1D000, v0, v1, "Finished streaming task with error %@", v5);
    sub_23CA22494(qword_256BED3B0);
    sub_23CA2BE98();
    sub_23CA2BBDC();
  }
  sub_23CA338B0();
}

uint64_t sub_23CA3CD6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_23CA3AE5C();
  v2 = *(_QWORD *)(sub_23CA22494(&qword_256BED400) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(sub_23CA22494(&qword_256BEDA48) - 8);
  sub_23CA4A688();
  sub_23CA4A624(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA33B44(v0 + v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_23CA4AB64();
  return sub_23CA4A2D8();
}

uint64_t sub_23CA3CDEC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23CA35944();
  sub_23CA22494(&qword_256BED400);
  sub_23CA22494(&qword_256BEDA48);
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_23CA4A524(v0);
  sub_23CA4A8C4(v1);
  sub_23CA4ABE8();
  return sub_23CA3C8A8(v2, v3, v4, v5, v6);
}

uint64_t AsyncThrowingStream.Continuation<>.completeWithError(_:)()
{
  MEMORY[0x24262A124]();
  sub_23CA22494(&qword_256BEDA48);
  return sub_23CA4ACEC();
}

uint64_t sub_23CA3CEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_23CA4B4EC();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v5) == 1)
  {
    sub_23CA49D50(a1, &qword_256BED510);
  }
  else
  {
    sub_23CA4B4E0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23CA4B4C8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23CA3CFE4()
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
  char *v12;
  uint64_t v13;
  char *v14;
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
  _QWORD v29[16];
  uint64_t v30;
  uint64_t v31;

  sub_23CA3AE5C();
  v30 = v3;
  v31 = v4;
  v5 = v0;
  sub_23CA22494(&qword_256BEDA88);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v6);
  sub_23CA4A36C();
  v7 = sub_23CA22494(&qword_256BEDA48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_23CA4A580();
  sub_23CA22494(&qword_256BEDA80);
  sub_23CA280A8();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v29 - v13;
  sub_23CA22494(&qword_256BED510);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v15);
  sub_23CA339F4();
  v18 = v17 - v16;
  v19 = sub_23CA4AD34();
  sub_23CA4A268(v18, v20, v21, v19);
  v22 = (_QWORD *)sub_23CA33AC4();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v5;
  swift_retain();
  sub_23CA3BDC8(v18, (uint64_t)&unk_256BEDAB8, (uint64_t)v22);
  swift_release();
  if (*(_QWORD *)(v5 + 24))
  {
    sub_23CA4A32C();
    sub_23CA22494(&qword_256BED240);
    sub_23CA4B510();
    sub_23CA4A40C();
  }
  sub_23CA3BFF8(0);
  if (*(_QWORD *)(v5 + 16))
  {
    sub_23CA4A32C();
    sub_23CA22494(&qword_256BED240);
    sub_23CA4B510();
    sub_23CA4A40C();
  }
  v23 = v5 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation;
  sub_23CA33754();
  sub_23CA49D10(v23, (uint64_t)v14, &qword_256BEDA80);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v14, 1, v7))
  {
    sub_23CA49D50((uint64_t)v14, &qword_256BEDA80);
  }
  else
  {
    sub_23CA4A6B0(v2, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
    sub_23CA49D50((uint64_t)v14, &qword_256BEDA80);
    v29[0] = 0;
    sub_23CA4B57C();
    sub_23CA33B44(v2, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  }
  v24 = sub_23CA22494(&qword_256BEDA38);
  sub_23CA4A268(v1, v25, v26, v24);
  v27 = v5 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  sub_23CA2BCE8();
  sub_23CA3C87C(v1, v27, &qword_256BEDA88);
  swift_endAccess();
  sub_23CA4A6A4((uint64_t)v12, 1);
  sub_23CA2BCE8();
  sub_23CA3C87C((uint64_t)v12, v23, &qword_256BEDA80);
  swift_endAccess();
  return sub_23CA3BFEC(0);
}

uint64_t sub_23CA3D2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_23CA3D2E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  sub_23CA4A32C();
  sub_23CA4A518();
  return sub_23CA20F80();
}

uint64_t sub_23CA3D324()
{
  uint64_t v0;

  sub_23CA467EC(0);
  sub_23CA4A40C();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA3D354()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23CA3D380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)sub_23CA4A524(v2);
  v4 = sub_23CA4A8C4(v3);
  return sub_23CA3D2CC(v4, v5, v6, v1);
}

uint64_t AsyncThrowingStream.Continuation<>.complete()()
{
  sub_23CA22494(&qword_256BEDA48);
  return sub_23CA4ACEC();
}

uint64_t sub_23CA3D404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[4] = a4;
  v5[5] = v4;
  v5[2] = a1;
  v5[3] = a3;
  sub_23CA22494(&qword_256BED510);
  v5[6] = sub_23CA20FEC();
  sub_23CA23CAC(&qword_256BED240);
  sub_23CA4AD20();
  v6 = sub_23CA4B564();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = sub_23CA20FEC();
  sub_23CA4AD20();
  v7 = sub_23CA4B588();
  v5[10] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 + 64);
  v5[13] = sub_23CA4A424();
  v5[14] = sub_23CA35B54();
  v9 = sub_23CA4AD18();
  v5[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[16] = v10;
  v5[17] = *(_QWORD *)(v10 + 64);
  v5[18] = sub_23CA4A424();
  v5[19] = sub_23CA35B54();
  sub_23CA21048();
  return sub_23CA4A310();
}

uint64_t sub_23CA3D4E0()
{
  _QWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
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

  v1 = v0[5];
  if (*(_QWORD *)(v1 + 24))
  {
    sub_23CA3C840();
    sub_23CA2BC74();
    *v2 = xmmword_23CA4D150;
    sub_23CA4A1F0((uint64_t)v2, 3);
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    sub_23CA2BDB0();
    sub_23CA2BDC8();
    v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v4 = v0[19];
    v29 = v0[18];
    v27 = v0[16];
    v21 = v0[15];
    v23 = v0[13];
    v25 = v0[17];
    v28 = v0[11];
    v5 = v0[9];
    v22 = v0[10];
    v19 = v0[8];
    v20 = v0[7];
    v26 = v0[6];
    v6 = v0[3];
    v24 = v0[4];
    swift_getAssociatedTypeWitness();
    sub_23CA4AC30();
    swift_getAssociatedConformanceWitness();
    sub_23CA4B294();
    sub_23CA3BD5C(v5);
    sub_23CA4B540();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v5, v20);
    v7 = sub_23CA4AD34();
    sub_23CA4A268(v26, v8, v9, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v29, v4, v21);
    v10 = sub_23CA4A960();
    v11(v10);
    v12 = (*(unsigned __int8 *)(v27 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    v13 = (v25 + *(unsigned __int8 *)(v28 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    v14 = (char *)swift_allocObject();
    *((_QWORD *)v14 + 2) = 0;
    *((_QWORD *)v14 + 3) = 0;
    *((_QWORD *)v14 + 4) = v6;
    *((_QWORD *)v14 + 5) = v24;
    *((_QWORD *)v14 + 6) = v1;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(&v14[v12], v29, v21);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(&v14[v13], v23, v22);
    swift_retain();
    v15 = sub_23CA3CEBC(v26, (uint64_t)&unk_256BEDAD0, (uint64_t)v14);
    sub_23CA3BFF8(v15);
    v16 = sub_23CA4A784();
    v17(v16);
    sub_23CA4A9D4(v4, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
    sub_23CA2BD80();
    sub_23CA2BD5C();
    sub_23CA2131C();
    sub_23CA243F4();
    sub_23CA4AB8C();
    sub_23CA2BDC0();
    v3 = (uint64_t (*)(void))sub_23CA213D4();
  }
  return v3();
}

uint64_t sub_23CA3D7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8[48] = a7;
  v8[49] = a8;
  v8[46] = a5;
  v8[47] = a6;
  v8[45] = a4;
  v9 = sub_23CA4B2B8();
  v8[50] = v9;
  v8[51] = *(_QWORD *)(v9 - 8);
  v8[52] = swift_task_alloc();
  v8[53] = sub_23CA22494(&qword_256BEDC20);
  v8[54] = swift_task_alloc();
  v8[55] = type metadata accessor for JsonFieldValueEvent(0);
  v8[56] = swift_task_alloc();
  v8[57] = swift_task_alloc();
  v8[58] = swift_task_alloc();
  v8[59] = swift_task_alloc();
  v8[60] = type metadata accessor for JsonObjectFieldContainer();
  v8[61] = swift_task_alloc();
  v8[62] = swift_task_alloc();
  v10 = sub_23CA22494(&qword_256BEDC28);
  v8[63] = v10;
  v8[64] = *(_QWORD *)(v10 - 8);
  v8[65] = swift_task_alloc();
  sub_23CA22494(&qword_256BEDAE0);
  v8[66] = swift_task_alloc();
  v8[67] = swift_task_alloc();
  v8[68] = swift_task_alloc();
  v11 = type metadata accessor for FieldStreamingSupport(0);
  v8[69] = v11;
  v8[70] = *(_QWORD *)(v11 - 8);
  v8[71] = swift_task_alloc();
  v8[72] = swift_task_alloc();
  v8[73] = swift_task_alloc();
  sub_23CA22494(&qword_256BEDAE8);
  v8[74] = swift_task_alloc();
  v8[75] = swift_task_alloc();
  v8[76] = swift_task_alloc();
  v8[77] = sub_23CA22494(&qword_256BED368);
  v8[78] = swift_task_alloc();
  v8[79] = swift_task_alloc();
  v8[80] = swift_task_alloc();
  v8[81] = swift_task_alloc();
  v8[82] = swift_task_alloc();
  v8[83] = swift_task_alloc();
  v8[84] = swift_task_alloc();
  v8[85] = swift_task_alloc();
  v8[86] = swift_task_alloc();
  v8[87] = swift_task_alloc();
  v8[88] = swift_task_alloc();
  v8[89] = swift_task_alloc();
  v8[90] = swift_task_alloc();
  v8[91] = swift_task_alloc();
  v8[92] = swift_task_alloc();
  v8[93] = sub_23CA23CAC(&qword_256BED240);
  v12 = sub_23CA4B54C();
  v8[94] = v12;
  v8[95] = *(_QWORD *)(v12 - 8);
  v8[96] = swift_task_alloc();
  v8[97] = swift_task_alloc();
  v13 = type metadata accessor for ObjectStreamingSupport(0);
  v8[98] = v13;
  v8[99] = *(_QWORD *)(v13 - 8);
  v8[100] = swift_task_alloc();
  v8[101] = swift_task_alloc();
  v8[102] = swift_task_alloc();
  v8[103] = swift_task_alloc();
  v8[104] = swift_task_alloc();
  v8[105] = swift_task_alloc();
  v8[106] = swift_task_alloc();
  v8[107] = swift_task_alloc();
  v8[108] = swift_task_alloc();
  v8[109] = swift_task_alloc();
  v8[110] = swift_task_alloc();
  v8[111] = swift_task_alloc();
  v14 = sub_23CA4B0CC();
  v8[112] = v14;
  v8[113] = *(_QWORD *)(v14 - 8);
  v8[114] = swift_task_alloc();
  v8[115] = swift_task_alloc();
  v8[116] = swift_task_alloc();
  v8[117] = swift_task_alloc();
  v8[118] = swift_task_alloc();
  v8[119] = swift_task_alloc();
  v8[120] = swift_task_alloc();
  v8[121] = swift_task_alloc();
  v8[122] = swift_task_alloc();
  v8[123] = swift_task_alloc();
  v8[124] = swift_task_alloc();
  v8[125] = swift_task_alloc();
  v8[126] = swift_task_alloc();
  v8[127] = swift_task_alloc();
  v8[128] = swift_task_alloc();
  v8[129] = swift_task_alloc();
  v8[130] = swift_task_alloc();
  v8[131] = swift_task_alloc();
  v8[132] = swift_task_alloc();
  v8[133] = swift_task_alloc();
  v8[134] = swift_task_alloc();
  v8[135] = swift_task_alloc();
  v8[136] = swift_task_alloc();
  v8[137] = swift_task_alloc();
  v8[138] = swift_task_alloc();
  v8[139] = swift_task_alloc();
  v8[140] = type metadata accessor for JsonStreamEvent(0);
  v8[141] = swift_task_alloc();
  v8[142] = swift_task_alloc();
  v8[143] = swift_task_alloc();
  v8[144] = swift_task_alloc();
  sub_23CA22494(&qword_256BEDC30);
  v8[145] = swift_task_alloc();
  v15 = sub_23CA22494(&qword_256BEDA38);
  v8[146] = v15;
  v8[147] = *(_QWORD *)(v15 - 8);
  v8[148] = swift_task_alloc();
  v16 = sub_23CA22494(&qword_256BEDC38);
  v8[149] = v16;
  v8[150] = *(_QWORD *)(v16 - 8);
  v8[151] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23CA3DDC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[148];
  v2 = v0[147];
  v3 = MEMORY[0x24BEE4AF8];
  v0[32] = MEMORY[0x24BEE4AF8];
  v0[43] = MEMORY[0x24BEE4B08];
  v0[39] = v3;
  sub_23CA437F8(v1);
  sub_23CA4B4F8();
  sub_23CA4ABE0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v0[152] = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer;
  v0[153] = OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap;
  v4 = (_QWORD *)swift_task_alloc();
  v0[154] = v4;
  *v4 = v0;
  v4[1] = sub_23CA3DE9C;
  sub_23CA4ADC4();
  return sub_23CA4B5A0();
}

uint64_t sub_23CA3DE9C()
{
  uint64_t v0;

  sub_23CA24398();
  sub_23CA2BC34();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA3DEF8()
{
  uint64_t *v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  _OWORD *v44;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t *v49;
  uint64_t v50;

  v1 = v0;
  v2 = v0 + 32;
  v3 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v0[145], 1, v0[140]);
  v49 = v0;
  if ((_DWORD)v3 != 1)
  {
    sub_23CA4AD70(v3, v0[144], type metadata accessor for JsonStreamEvent);
    if (qword_256BECF08 != -1)
      swift_once();
    v26 = sub_23CA2B764(v0[50], (uint64_t)qword_256BEF060);
    sub_23CA4AD78((uint64_t)v26, v27, type metadata accessor for JsonStreamEvent);
    v28 = v26;
    sub_23CA4B2A0();
    v29 = sub_23CA4A498();
    v30 = os_log_type_enabled(v26, v29);
    v31 = v0[143];
    if (v30)
    {
      v32 = v0[142];
      v33 = sub_23CA2BCB4();
      sub_23CA2BCB4();
      *(_DWORD *)v33 = 136315138;
      sub_23CA4A908(v31, v32);
      sub_23CA2C19C();
      v34 = sub_23CA4B3CC();
      *(_QWORD *)(v33 + 4) = sub_23CA4A5C0(v34, v35);
      sub_23CA2BFA0();
      sub_23CA44E1C(v31, type metadata accessor for JsonStreamEvent);
      sub_23CA2BEA0(&dword_23CA1D000, v28, v29, "Received stream event %s", (uint8_t *)v33);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    sub_23CA4A7A4(v30, type metadata accessor for JsonStreamEvent);

    sub_23CA47334(v0[144], v0[141], type metadata accessor for JsonStreamEvent);
    v36 = (char *)&loc_23CA3E2BC + *((int *)qword_23CA41030 + swift_getEnumCaseMultiPayload());
    __asm { BR              X10 }
  }
  (*(void (**)(uint64_t, uint64_t))(v0[150] + 8))(v0[151], v0[149]);
  sub_23CA4A5D0();
  sub_23CA4A364();
  if (*(_QWORD *)(v0[32] + 16))
  {
    if (qword_256BECF08 != -1)
      swift_once();
    v5 = v0[51];
    v4 = v1[52];
    v6 = sub_23CA2B764(v1[50], (uint64_t)qword_256BEF060);
    sub_23CA4AA60(v4, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    v7 = sub_23CA4B2A0();
    v8 = sub_23CA4B5E8();
    if (os_log_type_enabled(v7, v8))
    {
      v47 = v8;
      v9 = (uint8_t *)sub_23CA2BCB4();
      sub_23CA2BCB4();
      v48 = v9;
      *(_DWORD *)v9 = 136315138;
      sub_23CA4A518();
      sub_23CA33754();
      v10 = *v2;
      v11 = v1;
      v12 = *(_QWORD *)(*v2 + 16);
      v13 = MEMORY[0x24BEE4AF8];
      if (v12)
      {
        v46 = v7;
        v14 = v11[113];
        v50 = MEMORY[0x24BEE4AF8];
        sub_23CA4A82C();
        sub_23CA48088(0, v12, 0);
        v15 = v10 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
        v16 = *(_QWORD *)(v14 + 72);
        v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
        do
        {
          v18 = v49[127];
          v19 = v49[113];
          v17(v18, v15, v49[112]);
          v20 = sub_23CA4B0A8();
          v22 = v21;
          sub_23CA33B44(v18, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
          v13 = v50;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_23CA48088(0, *(_QWORD *)(v50 + 16) + 1, 1);
            v13 = v50;
          }
          v24 = *(_QWORD *)(v13 + 16);
          v23 = *(_QWORD *)(v13 + 24);
          if (v24 >= v23 >> 1)
          {
            sub_23CA48088((char *)(v23 > 1), v24 + 1, 1);
            v13 = v50;
          }
          *(_QWORD *)(v13 + 16) = v24 + 1;
          v25 = v13 + 16 * v24;
          *(_QWORD *)(v25 + 32) = v20;
          *(_QWORD *)(v25 + 40) = v22;
          v15 += v16;
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
        v7 = v46;
      }
      v49[27] = v13;
      sub_23CA22494(&qword_256BEDC40);
      sub_23CA49C08(&qword_256BEDC48, &qword_256BEDC40);
      sub_23CA4B3B4();
      swift_bridgeObjectRelease();
      v40 = sub_23CA4A784();
      v49[28] = sub_23CA46BF8(v40, v41, v42);
      sub_23CA4B600();
      sub_23CA4A8BC();
      sub_23CA2BEA0(&dword_23CA1D000, v7, v47, "An object remained incomplete in the stack, object_id=%s", v48);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    v38 = v1[51];
    v37 = v1[52];
    v39 = v1[50];

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
    sub_23CA3C840();
    v43 = sub_23CA2BC74();
    *v44 = xmmword_23CA4D160;
    sub_23CA4A1F0((uint64_t)v44, 3);
    v1[176] = v43;
    if (qword_256BECF08 != -1)
      swift_once();
    sub_23CA2B764(v1[50], (uint64_t)qword_256BEF060);
    sub_23CA339CC();
  }
  v0[175] = *(_QWORD *)(v0[45] + v0[153]);
  sub_23CA4A32C();
  sub_23CA4A518();
  sub_23CA4A450();
  return swift_task_switch();
}

uint64_t sub_23CA41054()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA4AD04(*(_QWORD *)(v0 + 1112), *(_QWORD *)(v0 + 888));
  v1 = sub_23CA4A40C();
  sub_23CA4A608(v1, type metadata accessor for ObjectStreamingSupport);
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA410A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  sub_23CA35E70();
  sub_23CA47334(v0[111], v0[109], type metadata accessor for ObjectStreamingSupport);
  v2 = v0[39];
  if ((sub_23CA4A4A0() & 1) == 0)
    v2 = sub_23CA4A3C0();
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23CA4A3F4(v3 > 1, v4 + 1);
  v0[158] = v2;
  sub_23CA4A530();
  sub_23CA4402C(v5, v6, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A790();
  v0[5] = sub_23CA473A8();
  sub_23CA49890(&qword_256BEDC18, (void (*)(uint64_t))type metadata accessor for StreamingObjectTokenStreamProcessor);
  v0[6] = v7;
  v0[2] = v1;
  sub_23CA4AC90();
  v8 = (_QWORD *)sub_23CA4AB4C();
  v0[159] = v8;
  *v8 = v0;
  v8[1] = sub_23CA411A8;
  sub_23CA4ABA4();
  return sub_23CA4A4EC();
}

uint64_t sub_23CA411A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 1280) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_23CA4AB9C();
  }
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  sub_23CA4A9F8();
  v5 = *(_QWORD *)(v0 + 1152);
  v1 = *(_QWORD *)(v0 + 760);
  sub_23CA4AB0C();
  sub_23CA4AABC();
  v2 = sub_23CA4A4D0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23CA4A4DC(v2, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A6C0();
  sub_23CA44E1C(v5, type metadata accessor for JsonStreamEvent);
  v3 = (_QWORD *)swift_task_alloc();
  sub_23CA4A5E0(v3);
  return sub_23CA4A47C();
}

uint64_t sub_23CA412AC()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA4AD04(*(_QWORD *)(v0 + 1064), *(_QWORD *)(v0 + 856));
  v1 = sub_23CA4A40C();
  sub_23CA4A608(v1, type metadata accessor for ObjectStreamingSupport);
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA412F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  sub_23CA35E70();
  sub_23CA47334(v0[107], v0[106], type metadata accessor for ObjectStreamingSupport);
  v2 = v0[39];
  if ((sub_23CA4A4A0() & 1) == 0)
    v2 = sub_23CA4A3C0();
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23CA4A3F4(v3 > 1, v4 + 1);
  v0[165] = v2;
  sub_23CA4A530();
  sub_23CA4402C(v5, v6, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A790();
  v0[10] = sub_23CA473A8();
  sub_23CA49890(&qword_256BEDC18, (void (*)(uint64_t))type metadata accessor for StreamingObjectTokenStreamProcessor);
  v0[11] = v7;
  v0[7] = v1;
  sub_23CA4AC90();
  v8 = (_QWORD *)sub_23CA4AB4C();
  v0[166] = v8;
  *v8 = v0;
  v8[1] = sub_23CA41400;
  sub_23CA4ABA4();
  return sub_23CA4A4EC();
}

uint64_t sub_23CA41400()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 1336) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_23CA4AB9C();
  }
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  sub_23CA4A9F8();
  v5 = *(_QWORD *)(v0 + 1152);
  v1 = *(_QWORD *)(v0 + 760);
  sub_23CA4AB0C();
  sub_23CA4AABC();
  v2 = sub_23CA4A4D0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23CA4A4DC(v2, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A6C0();
  sub_23CA44E1C(v5, type metadata accessor for JsonStreamEvent);
  v3 = (_QWORD *)swift_task_alloc();
  sub_23CA4A5E0(v3);
  return sub_23CA4A47C();
}

uint64_t sub_23CA41504()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA4AD04(*(_QWORD *)(v0 + 1064), *(_QWORD *)(v0 + 832));
  v1 = sub_23CA4A40C();
  sub_23CA4A608(v1, type metadata accessor for ObjectStreamingSupport);
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41550()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);

  sub_23CA4A9DC();
  sub_23CA47334(*(_QWORD *)(v0 + 832), *(_QWORD *)(v0 + 824), type metadata accessor for ObjectStreamingSupport);
  v1 = *(_QWORD *)(v0 + 312);
  if ((sub_23CA4A4A0() & 1) == 0)
    v1 = sub_23CA4A3C0();
  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  if (v3 >= v2 >> 1)
    v1 = sub_23CA4A3F4(v2 > 1, v3 + 1);
  v4 = *(_QWORD *)(v0 + 1344);
  v5 = *(unsigned __int8 *)(v0 + 164);
  v6 = *(_QWORD *)(v0 + 824);
  *(_QWORD *)(v1 + 16) = v3 + 1;
  sub_23CA4402C(v6, v1 + ((v5 + 32) & ~v5) + v4 * v3, type metadata accessor for ObjectStreamingSupport);
  *(_QWORD *)(v0 + 312) = v1;
  v7 = *(_QWORD *)(v0 + 256);
  if ((sub_23CA4A4A0() & 1) == 0)
    v7 = sub_23CA4A3A8();
  v9 = *(_QWORD *)(v7 + 16);
  v8 = *(_QWORD *)(v7 + 24);
  v10 = v9 + 1;
  if (v9 >= v8 >> 1)
  {
    v20 = sub_23CA32114(v8 > 1, v9 + 1, 1, v7);
    v10 = v9 + 1;
    v7 = v20;
  }
  v26 = *(void (**)(uint64_t, uint64_t))(v0 + 1304);
  v25 = *(_QWORD *)(v0 + 1152);
  v11 = *(_QWORD *)(v0 + 1064);
  v12 = *(_QWORD *)(v0 + 896);
  v24 = *(_QWORD *)(v0 + 840);
  v23 = *(_QWORD *)(v0 + 832);
  v13 = *(_QWORD *)(v0 + 520);
  v21 = *(_QWORD *)(v0 + 512);
  v14 = *(_QWORD *)(v0 + 496);
  v22 = *(_QWORD *)(v0 + 504);
  v15 = v7
      + ((*(unsigned __int8 *)(v0 + 140) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 140))
      + *(_QWORD *)(v0 + 1288) * v9;
  *(_QWORD *)(v7 + 16) = v10;
  v16 = v11;
  sub_23CA4A7C8(v15, v11);
  *(_QWORD *)(v0 + 256) = v7;
  sub_23CA4A7C8(v14, v16);
  swift_storeEnumTagMultiPayload();
  sub_23CA22494(&qword_256BEDB08);
  sub_23CA4B570();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v13, v22);
  sub_23CA44E1C(v23, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A958(v17, type metadata accessor for FieldStreamingSupport);
  sub_23CA44E1C(v24, type metadata accessor for ObjectStreamingSupport);
  v26(v16, v12);
  sub_23CA44E1C(v25, type metadata accessor for JsonStreamEvent);
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1392) = v18;
  *v18 = v0;
  v18[1] = sub_23CA41924;
  sub_23CA21048();
  sub_23CA4AA2C();
  return sub_23CA4B5A0();
}

uint64_t sub_23CA417A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 1384) = v1;
  swift_task_dealloc();
  sub_23CA4A9C4();
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_23CA4AB9C();
  }
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *(_QWORD *)(v0 + 1152);
  v1 = *(_QWORD *)(v0 + 904);
  v12 = *(_QWORD *)(v0 + 896);
  v13 = *(_QWORD *)(v0 + 1024);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 144) = v2;
  *(_QWORD *)(v0 + 152) = v3;
  v4 = *(_BYTE *)(v0 + 136);
  *(_BYTE *)(v0 + 160) = v4;
  sub_23CA33648();
  sub_23CA4A8EC();
  sub_23CA42E18(v5, v6, v7);
  v8 = sub_23CA28038();
  sub_23CA4A77C(v8, type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A4DC(v9, type metadata accessor for JsonFieldValueEvent);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v13, v12);
  sub_23CA44E1C(v14, type metadata accessor for JsonStreamEvent);
  sub_23CA245D8(v2, v3, v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1392) = v10;
  *v10 = v0;
  v10[1] = sub_23CA41924;
  sub_23CA21048();
  return sub_23CA4B5A0();
}

uint64_t sub_23CA41924()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA2DBC4();
  sub_23CA2DC04(v1);
  if (v0)
  {
    sub_23CA4AB9C();
    sub_23CA28090();
  }
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41974()
{
  sub_23CA467EC(0);
  sub_23CA4A40C();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA419AC()
{
  uint64_t v0;

  sub_23CA4A27C();
  *(_QWORD *)(v0 + 232) = 0;
  sub_23CA4AB0C();
  sub_23CA4ACE0();
  swift_bridgeObjectRelease();
  sub_23CA49FE8();
  sub_23CA2BDC8();
  sub_23CA2BDB0();
  sub_23CA2BD5C();
  sub_23CA2BD80();
  sub_23CA243F4();
  sub_23CA24384();
  sub_23CA2131C();
  sub_23CA2BDB8();
  sub_23CA2BDC0();
  swift_task_dealloc();
  sub_23CA2BE30();
  swift_task_dealloc();
  sub_23CA4AC08();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_23CA4AB8C();
  sub_23CA4ABC4();
  sub_23CA4AC3C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_23CA4A1B8(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA41C48()
{
  uint64_t v0;

  sub_23CA467EC(*(_QWORD *)(v0 + 1408));
  sub_23CA338B0();
}

uint64_t sub_23CA41C70()
{
  sub_23CA4A40C();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA41C88()
{
  uint64_t v0;

  sub_23CA4A27C();
  *(_QWORD *)(v0 + 272) = *(_QWORD *)(v0 + 1408);
  sub_23CA4AB0C();
  sub_23CA4ACE0();
  swift_bridgeObjectRelease();
  sub_23CA49FE8();
  sub_23CA2BDC8();
  sub_23CA2BDB0();
  sub_23CA2BD5C();
  sub_23CA2BD80();
  sub_23CA243F4();
  sub_23CA24384();
  sub_23CA2131C();
  sub_23CA2BDB8();
  sub_23CA2BDC0();
  swift_task_dealloc();
  sub_23CA2BE30();
  swift_task_dealloc();
  sub_23CA4AC08();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_23CA4AB8C();
  sub_23CA4ABC4();
  sub_23CA4AC3C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_23CA4A1B8(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA41F28()
{
  _QWORD *v0;

  sub_23CA4A27C();
  (*(void (**)(_QWORD, _QWORD))(v0[150] + 8))(v0[151], v0[149]);
  v0[176] = v0[37];
  if (qword_256BECF08 != -1)
    swift_once();
  sub_23CA2B764(v0[50], (uint64_t)qword_256BEF060);
  sub_23CA339CC();
}

void sub_23CA4206C()
{
  uint64_t *v0;
  uint64_t v1;

  sub_23CA4A27C();
  sub_23CA4A754();
  sub_23CA44E1C(v0[111], type metadata accessor for ObjectStreamingSupport);
  v1 = sub_23CA4ADB8();
  sub_23CA4A958(v1, type metadata accessor for JsonStreamEvent);
  sub_23CA4A46C();
  v0[176] = v0[160];
  if (qword_256BECF08 != -1)
    swift_once();
  sub_23CA2B764(v0[50], (uint64_t)qword_256BEF060);
  sub_23CA339CC();
}

void sub_23CA421D0()
{
  uint64_t *v0;
  uint64_t v1;

  sub_23CA4A27C();
  sub_23CA4A754();
  sub_23CA44E1C(v0[107], type metadata accessor for ObjectStreamingSupport);
  v1 = sub_23CA4ADB8();
  sub_23CA4A958(v1, type metadata accessor for JsonStreamEvent);
  sub_23CA4A46C();
  v0[176] = v0[167];
  if (qword_256BECF08 != -1)
    swift_once();
  sub_23CA2B764(v0[50], (uint64_t)qword_256BEF060);
  sub_23CA339CC();
}

void sub_23CA42334()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23CA4A27C();
  sub_23CA4A754();
  v1 = v0[128];
  v2 = v0[113];
  sub_23CA44E1C(v0[100], type metadata accessor for ObjectStreamingSupport);
  sub_23CA4A4DC(v3, type metadata accessor for JsonFieldValueEvent);
  v4 = sub_23CA4ABE0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_23CA4A958(v4, type metadata accessor for JsonStreamEvent);
  sub_23CA4A46C();
  v0[176] = v0[173];
  if (qword_256BECF08 != -1)
    swift_once();
  sub_23CA2B764(v0[50], (uint64_t)qword_256BEF060);
  sub_23CA339CC();
}

uint64_t sub_23CA424B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23CA3AE5C();
  sub_23CA4AD18();
  sub_23CA4AAEC();
  sub_23CA23CAC(&qword_256BED240);
  v4 = *(_QWORD *)(sub_23CA4B588() - 8);
  sub_23CA4A688();
  swift_release();
  sub_23CA33B44(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_23CA4A624(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_23CA4AB64();
  return sub_23CA4A2D8();
}

uint64_t sub_23CA4253C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  sub_23CA35E70();
  v3 = v2;
  v5 = v0[4];
  v4 = v0[5];
  v6 = *(_QWORD *)(sub_23CA4AD18() - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = v7 + *(_QWORD *)(v6 + 64);
  sub_23CA23CAC(&qword_256BED240);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_23CA4B588() - 8) + 80);
  v10 = (v8 + v9) & ~v9;
  v11 = v0[2];
  v12 = v0[3];
  v13 = v0[6];
  v14 = (uint64_t)v0 + v7;
  v15 = (uint64_t)v0 + v10;
  v16 = swift_task_alloc();
  v17 = (_QWORD *)sub_23CA4A524(v16);
  *v17 = v1;
  v17[1] = sub_23CA49FE4;
  return sub_23CA3D7B4(v3, v11, v12, v13, v14, v15, v5, v4);
}

uint64_t sub_23CA42618@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = sub_23CA22494(&qword_256BED368);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23CA4B0CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, v6);
  sub_23CA49B74((uint64_t)v5);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v5, 1, v6) == 1)
  {
    sub_23CA49D50((uint64_t)v5, &qword_256BED368);
    sub_23CA499D8(*(_QWORD *)(*(_QWORD *)v1 + 16) - 1, a1);
  }
  else
  {
    v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v11(v9, v5, v6);
    v11((char *)a1, v9, v6);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v6);
}

uint64_t sub_23CA4276C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v3 = sub_23CA22494(&qword_256BEDAE8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ObjectStreamingSupport(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, v6);
  sub_23CA49C3C((uint64_t)v5);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v5, 1, v6) == 1)
  {
    sub_23CA49D50((uint64_t)v5, &qword_256BEDAE8);
    sub_23CA49A6C(*(_QWORD *)(*(_QWORD *)v1 + 16) - 1, a1);
  }
  else
  {
    sub_23CA4402C((uint64_t)v5, (uint64_t)v8, type metadata accessor for ObjectStreamingSupport);
    sub_23CA4402C((uint64_t)v8, a1, type metadata accessor for ObjectStreamingSupport);
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v6);
}

void sub_23CA428C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  __int128 v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  int64_t v49;
  uint64_t *v50;
  uint64_t v51;

  v3 = type metadata accessor for FieldStreamingSupport(0);
  v46 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23CA22494(&qword_256BEDBD8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (int64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (int64_t *)((char *)&v39 - v10);
  v12 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for ObjectStreamingSupport(0) + 20));
  v13 = *(_QWORD *)(v12 + 64);
  v40 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v39 = v41 - 1;
  v47 = v12;
  swift_bridgeObjectRetain();
  v49 = 0;
  *(_QWORD *)&v17 = 136315394;
  v43 = v17;
  v42 = MEMORY[0x24BEE4AD8] + 8;
  v50 = v11;
  v44 = v5;
  v45 = v3;
  v48 = v9;
  if (!v16)
    goto LABEL_6;
LABEL_4:
  v18 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  v19 = v18 | (v49 << 6);
  while (2)
  {
    v20 = *(_QWORD *)(v47 + 56);
    v21 = (_QWORD *)(*(_QWORD *)(v47 + 48) + 16 * v19);
    v22 = v21[1];
    *v9 = *v21;
    v9[1] = v22;
    v23 = v20 + *(_QWORD *)(v46 + 72) * v19;
    v24 = sub_23CA22494(&qword_256BEDBE0);
    sub_23CA47334(v23, (uint64_t)v9 + *(int *)(v24 + 48), type metadata accessor for FieldStreamingSupport);
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v9, 0, 1, v24);
    swift_bridgeObjectRetain();
    v11 = v50;
    while (1)
    {
      sub_23CA48024((uint64_t)v9, (uint64_t)v11);
      v29 = sub_23CA22494(&qword_256BEDBE0);
      if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v11, 1, v29) == 1)
      {
        swift_release();
        return;
      }
      v31 = *v11;
      v30 = v11[1];
      sub_23CA4402C((uint64_t)v11 + *(int *)(v29 + 48), (uint64_t)v5, type metadata accessor for FieldStreamingSupport);
      if (qword_256BECF08 != -1)
        swift_once();
      v32 = sub_23CA4B2B8();
      sub_23CA2B764(v32, (uint64_t)qword_256BEF060);
      MEMORY[0x24262A124](a1);
      MEMORY[0x24262A124](a1);
      swift_bridgeObjectRetain();
      v33 = sub_23CA4B2A0();
      v34 = sub_23CA4B5DC();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = (_QWORD *)swift_slowAlloc();
        v37 = swift_slowAlloc();
        v51 = v37;
        *(_DWORD *)v35 = v43;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v35 + 4) = sub_23CA46BF8(v31, v30, &v51);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 12) = 2112;
        if (a1)
        {
          MEMORY[0x24262A124](a1);
          v38 = _swift_stdlib_bridgeErrorToNSError();
        }
        else
        {
          v38 = 0;
        }
        *(_QWORD *)(v35 + 14) = v38;
        *v36 = v38;
        MEMORY[0x24262A118](a1);
        MEMORY[0x24262A118](a1);
        _os_log_impl(&dword_23CA1D000, v33, v34, "Terminating stream for %s with error=%@", (uint8_t *)v35, 0x16u);
        sub_23CA22494(qword_256BED3B0);
        swift_arrayDestroy();
        MEMORY[0x24262A250](v36, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x24262A250](v37, -1, -1);
        MEMORY[0x24262A250](v35, -1, -1);

        v5 = v44;
        v9 = v48;
        v11 = v50;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        MEMORY[0x24262A118](a1);
        MEMORY[0x24262A118](a1);

        v9 = v48;
      }
      v51 = a1;
      MEMORY[0x24262A124](a1);
      sub_23CA22494(&qword_256BEDB08);
      sub_23CA4B57C();
      sub_23CA44E1C((uint64_t)v5, type metadata accessor for FieldStreamingSupport);
      if (v16)
        goto LABEL_4;
LABEL_6:
      v25 = v49 + 1;
      if (__OFADD__(v49, 1))
      {
        __break(1u);
        goto LABEL_37;
      }
      if (v25 < v41)
      {
        v26 = *(_QWORD *)(v40 + 8 * v25);
        if (v26)
          goto LABEL_9;
        v27 = v49 + 2;
        ++v49;
        if (v25 + 1 < v41)
        {
          v26 = *(_QWORD *)(v40 + 8 * v27);
          if (v26)
            goto LABEL_12;
          v49 = v25 + 1;
          if (v25 + 2 < v41)
          {
            v26 = *(_QWORD *)(v40 + 8 * (v25 + 2));
            if (v26)
            {
              v25 += 2;
              goto LABEL_9;
            }
            v27 = v25 + 3;
            v49 = v25 + 2;
            if (v25 + 3 < v41)
              break;
          }
        }
      }
LABEL_23:
      v28 = sub_23CA22494(&qword_256BEDBE0);
      _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v9, 1, 1, v28);
      v16 = 0;
    }
    v26 = *(_QWORD *)(v40 + 8 * v27);
    if (v26)
    {
LABEL_12:
      v25 = v27;
LABEL_9:
      v16 = (v26 - 1) & v26;
      v19 = __clz(__rbit64(v26)) + (v25 << 6);
      v49 = v25;
      continue;
    }
    break;
  }
  while (1)
  {
    v25 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v25 >= v41)
    {
      v49 = v39;
      goto LABEL_23;
    }
    v26 = *(_QWORD *)(v40 + 8 * v25);
    ++v27;
    if (v26)
      goto LABEL_9;
  }
LABEL_37:
  __break(1u);
}

void sub_23CA42E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;

  v6 = sub_23CA22494(&qword_256BEDC28);
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for JsonObjectFieldContainer();
  v9 = MEMORY[0x24BDAC7A8](v28);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - v12;
  v14 = sub_23CA22494(&qword_256BEDAE0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FieldStreamingSupport(0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)a3;
  v29 = *(_QWORD *)(a3 + 8);
  v30 = *(unsigned __int8 *)(a3 + 16);
  v21 = *(_QWORD *)(v27 + *(int *)(type metadata accessor for ObjectStreamingSupport(0) + 20));
  swift_bridgeObjectRetain();
  v27 = a1;
  sub_23CA3BBBC(a1, a2, v21, (uint64_t)v16);
  swift_bridgeObjectRelease();
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v16, 1, v17) == 1)
  {
    sub_23CA49D50((uint64_t)v16, &qword_256BEDAE0);
    v33 = 0;
    v34 = 0xE000000000000000;
    v24 = v29;
    v25 = v30;
    sub_23CA24558(v20, v29, v30);
    sub_23CA4B648();
    v36 = v33;
    v37 = v34;
    sub_23CA4B420();
    sub_23CA4B420();
    sub_23CA4B420();
    v33 = v20;
    v34 = v24;
    v35 = v25;
    sub_23CA4B66C();
    sub_23CA4B69C();
    __break(1u);
  }
  else
  {
    sub_23CA4402C((uint64_t)v16, (uint64_t)v19, type metadata accessor for FieldStreamingSupport);
    v22 = v29;
    *(_QWORD *)v13 = v20;
    *((_QWORD *)v13 + 1) = v22;
    v23 = v30;
    v13[16] = v30;
    swift_storeEnumTagMultiPayload();
    sub_23CA47334((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    sub_23CA24558(v20, v22, v23);
    sub_23CA22494(&qword_256BEDB08);
    sub_23CA4B570();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
    sub_23CA44E1C((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    sub_23CA44E1C((uint64_t)v19, type metadata accessor for FieldStreamingSupport);
  }
}

uint64_t sub_23CA43170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(_QWORD);
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(_QWORD);
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t result;
  _QWORD v51[2];
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  sub_23CA3AE5C();
  v68 = v0;
  v69 = v1;
  v3 = v2;
  v58 = sub_23CA4A88C();
  v53 = *(_QWORD *)(v58 - 8);
  sub_23CA4A400();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)v51 - v8;
  v9 = sub_23CA22494(&qword_256BEDBF8);
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  sub_23CA4A400();
  MEMORY[0x24BDAC7A8](v10);
  sub_23CA3BB68();
  v54 = v11;
  v12 = sub_23CA22494(&qword_256BEDB08);
  v64 = *(_QWORD *)(v12 - 8);
  v65 = v12;
  sub_23CA4A400();
  MEMORY[0x24BDAC7A8](v13);
  sub_23CA3BB68();
  v63 = v14;
  v15 = sub_23CA22494(&qword_256BEDAF8);
  v61 = *(_QWORD *)(v15 - 8);
  v62 = v15;
  sub_23CA4A400();
  MEMORY[0x24BDAC7A8](v16);
  sub_23CA3BB68();
  v60 = v17;
  v18 = *(_QWORD *)(v3 + 16);
  if (!v18)
    return MEMORY[0x24BEE4B00];
  v52 = *MEMORY[0x24BEE6CA0];
  sub_23CA33648();
  v19 = MEMORY[0x24BEE4B00];
  v51[1] = v3;
  for (i = (uint64_t *)(v3 + 40); ; i += 2)
  {
    v22 = *(i - 1);
    v21 = *i;
    v23 = *(_QWORD *)(v19 + 16);
    sub_23CA4A82C();
    if (v23)
    {
      sub_23CA336E0();
      sub_23CA4ACC8(v22);
      v25 = v24;
      sub_23CA2BFA0();
      if ((v25 & 1) != 0)
      {
        sub_23CA4AC88();
        goto LABEL_15;
      }
    }
    v59 = v18;
    type metadata accessor for JsonObjectFieldContainer();
    v66 = (char *)v22;
    v27 = v54;
    v26 = v55;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v55 + 104))(v54, v52, v56);
    v28 = v60;
    v29 = v63;
    sub_23CA4B540();
    sub_23CA4ABD8(v27, *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
    v30 = sub_23CA33AC4();
    *(_QWORD *)(v30 + 16) = v66;
    *(_QWORD *)(v30 + 24) = v21;
    sub_23CA4A82C();
    v31 = v65;
    sub_23CA4B558();
    v32 = (uint64_t)v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v57, v28, v62);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v32 + *(int *)(v58 + 20), v29, v31);
    v33 = (uint64_t)v7;
    v7 = v66;
    sub_23CA4402C(v32, v33, type metadata accessor for FieldStreamingSupport);
    swift_isUniquelyReferenced_nonNull_native();
    v67 = v19;
    v34 = sub_23CA4ACC8((uint64_t)v7);
    if (__OFADD__(*(_QWORD *)(v19 + 16), (v35 & 1) == 0))
      break;
    v36 = v34;
    v37 = v35;
    sub_23CA22494(&qword_256BEDC00);
    if ((sub_23CA4B678() & 1) != 0)
    {
      v38 = sub_23CA25314((uint64_t)v7, v21);
      if ((v37 & 1) != (v39 & 1))
        goto LABEL_21;
      v36 = v38;
    }
    v19 = v67;
    if ((v37 & 1) != 0)
    {
      v40 = sub_23CA4A6EC();
      sub_23CA498F0(v40, v41, v42);
    }
    else
    {
      *(_QWORD *)(v67 + 8 * (v36 >> 6) + 64) |= 1 << v36;
      v43 = (_QWORD *)(*(_QWORD *)(v19 + 48) + 16 * v36);
      *v43 = v7;
      v43[1] = v21;
      v44 = sub_23CA4A6EC();
      sub_23CA4402C(v44, v45, v46);
      v47 = *(_QWORD *)(v19 + 16);
      v48 = __OFADD__(v47, 1);
      v49 = v47 + 1;
      if (v48)
        goto LABEL_20;
      *(_QWORD *)(v19 + 16) = v49;
      sub_23CA4A82C();
    }
    sub_23CA4AC88();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
    v18 = v59;
LABEL_15:
    if (!--v18)
    {
      swift_bridgeObjectRelease();
      return v19;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_23CA4B6F0();
  __break(1u);
  return result;
}

void sub_23CA4351C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_256BECF08 != -1)
    swift_once();
  v5 = sub_23CA4B2B8();
  sub_23CA2B764(v5, (uint64_t)qword_256BEF060);
  swift_bridgeObjectRetain_n();
  v6 = sub_23CA4B2A0();
  v7 = sub_23CA4B5DC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v10 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_23CA46BF8(a2, a3, &v10);
    sub_23CA4B600();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23CA1D000, v6, v7, "Terminating stream for %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24262A250](v9, -1, -1);
    MEMORY[0x24262A250](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_23CA436B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_23CA22494(&qword_256BEDAE8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ObjectStreamingSupport(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v10) == 1)
  {
    sub_23CA49D50(a1, &qword_256BEDAE8);
    sub_23CA49498(a2, (uint64_t)v6);
    v11 = sub_23CA4B0CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a2, v11);
    sub_23CA49D50((uint64_t)v6, &qword_256BEDAE8);
  }
  else
  {
    sub_23CA4402C(a1, (uint64_t)v9, type metadata accessor for ObjectStreamingSupport);
    sub_23CA49610((uint64_t)v9, a2);
    v12 = sub_23CA4B0CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
  }
}

void sub_23CA437F8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_23CA22494(&qword_256BEDA88);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v4);
  sub_23CA4A36C();
  v5 = v1 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream;
  sub_23CA33754();
  sub_23CA49D10(v5, v2, &qword_256BEDA88);
  v6 = sub_23CA22494(&qword_256BEDA38);
  sub_23CA4A298(v2, 1, v6);
  if (v7)
  {
    sub_23CA49D50(v2, &qword_256BEDA88);
    type metadata accessor for JsonStreamEvent(0);
    sub_23CA4B5C4();
  }
  else
  {
    sub_23CA4A6B0(a1, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32));
  }
  sub_23CA3AD70();
}

uint64_t sub_23CA438D8()
{
  return swift_task_switch();
}

uint64_t sub_23CA438EC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23CA3C840();
  sub_23CA2BC74();
  *v1 = 0;
  v1[1] = 0;
  sub_23CA4A1F0((uint64_t)v1, 3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t StreamingObjectTokenStreamProcessor.deinit()
{
  uint64_t v0;

  swift_release();
  sub_23CA4AD48();
  sub_23CA49D50(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStream, &qword_256BEDA88);
  sub_23CA49D50(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_parserStreamContinuation, &qword_256BEDA80);
  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_sanitizer);
  return v0;
}

uint64_t StreamingObjectTokenStreamProcessor.__deallocating_deinit()
{
  StreamingObjectTokenStreamProcessor.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23CA439D4(uint64_t a1)
{
  return sub_23CA3C408(a1);
}

uint64_t sub_23CA439F4()
{
  return sub_23CA3C1B8();
}

uint64_t sub_23CA43A14()
{
  return sub_23CA3CFE4();
}

uint64_t sub_23CA43A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23CA49FE4;
  return sub_23CA3D404(a1, v9, a3, a4);
}

uint64_t StreamingObjectTokenStreamProcessor.stream<A>(parentObjectID:field:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8[10] = a7;
  v8[11] = v7;
  v8[8] = a4;
  v8[9] = a6;
  v8[6] = a2;
  v8[7] = a3;
  v8[5] = a1;
  sub_23CA22494(&qword_256BEDAE0);
  v8[12] = sub_23CA20FEC();
  v9 = sub_23CA4A88C();
  v8[13] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[14] = v10;
  v8[15] = *(_QWORD *)(v10 + 64);
  v8[16] = sub_23CA4A424();
  v8[17] = sub_23CA35B54();
  sub_23CA22494(&qword_256BEDAE8);
  v8[18] = sub_23CA20FEC();
  v11 = sub_23CA2806C();
  v8[19] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v8[20] = v12;
  v8[21] = *(_QWORD *)(v12 + 64);
  v8[22] = sub_23CA4A424();
  v8[23] = sub_23CA35B54();
  v8[24] = type metadata accessor for ObjectStreamingSupport(0);
  v8[25] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA43B70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[23];
  v2 = v0[19];
  v3 = v0[20];
  v4 = v0[6];
  v0[26] = *(_QWORD *)(v0[11]
                     + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[27] = v5;
  v5(v1, v4, v2);
  sub_23CA4A32C();
  sub_23CA4A518();
  return sub_23CA20F80();
}

uint64_t sub_23CA43BC8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 208);
  sub_23CA33754();
  *(_QWORD *)(v0 + 224) = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  sub_23CA4A40C();
  sub_23CA21048();
  return sub_23CA20F80();
}

void sub_23CA43C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = sub_23CA28104();
  sub_23CA3BC50(v2, v3, v4);
  sub_23CA28090();
  v5 = sub_23CA2C19C();
  v6(v5);
  sub_23CA4A1D4(v1);
  if (v15)
  {
    sub_23CA49D50(*(_QWORD *)(v0 + 144), &qword_256BEDAE8);
    sub_23CA4A340();
    sub_23CA4B648();
    sub_23CA2C1B0();
    sub_23CA49890(&qword_256BED380, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    sub_23CA4B6CC();
    sub_23CA4A39C();
    sub_23CA28038();
    sub_23CA3C840();
    sub_23CA2BC74();
    *(_QWORD *)v7 = v38;
    *(_QWORD *)(v7 + 8) = v39;
    *(_BYTE *)(v7 + 16) = 1;
    sub_23CA4A274();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 200);
    v10 = *(_QWORD *)(v0 + 96);
    sub_23CA4402C(*(_QWORD *)(v0 + 144), v8, type metadata accessor for ObjectStreamingSupport);
    v11 = *(_QWORD *)(v8 + *(int *)(v9 + 20));
    sub_23CA28098();
    sub_23CA4ADB0();
    v12 = sub_23CA4AA78();
    sub_23CA3BBBC(v12, v13, v11, v14);
    sub_23CA4A8BC();
    sub_23CA28090();
    sub_23CA4A1D4(v10);
    if (!v15)
    {
      v18 = *(_QWORD *)(v0 + 176);
      v29 = *(_QWORD *)(v0 + 152);
      v19 = *(_QWORD *)(v0 + 136);
      v20 = *(_QWORD *)(v0 + 128);
      v30 = v20;
      v31 = *(_QWORD *)(v0 + 160);
      v33 = *(_QWORD *)(v0 + 168);
      v32 = *(_QWORD *)(v0 + 112);
      v35 = *(_QWORD *)(v0 + 64);
      v36 = *(_QWORD *)(v0 + 88);
      v21 = *(_QWORD *)(v0 + 48);
      v34 = *(_QWORD *)(v0 + 56);
      v37 = *(_OWORD *)(v0 + 72);
      sub_23CA4402C(*(_QWORD *)(v0 + 96), v19, type metadata accessor for FieldStreamingSupport);
      sub_23CA22494(&qword_256BEDAF0);
      v22 = swift_allocBox();
      sub_23CA22494(&qword_256BEDAF8);
      sub_23CA4B4F8();
      sub_23CA4A83C(v18, v21);
      sub_23CA47334(v19, v20, type metadata accessor for FieldStreamingSupport);
      v23 = (*(unsigned __int8 *)(v31 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      v24 = (v33 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
      v25 = (*(unsigned __int8 *)(v32 + 80) + v24 + 8) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = v37;
      *(_QWORD *)(v26 + 32) = v22;
      *(_QWORD *)(v26 + 40) = v34;
      *(_QWORD *)(v26 + 48) = v35;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 32))(v26 + v23, v18, v29);
      *(_QWORD *)(v26 + v24) = v36;
      sub_23CA4402C(v30, v26 + v25, type metadata accessor for FieldStreamingSupport);
      sub_23CA33648();
      swift_retain();
      swift_retain();
      sub_23CA4B5C4();
      sub_23CA4A8F8(v19);
      sub_23CA4A608(v27, type metadata accessor for ObjectStreamingSupport);
      swift_release();
      sub_23CA24384();
      sub_23CA4AB8C();
      sub_23CA243F4();
      sub_23CA4AC3C();
      sub_23CA2131C();
      sub_23CA2BDB8();
      sub_23CA4ABC4();
      sub_23CA213D4();
      goto LABEL_8;
    }
    sub_23CA49D50(*(_QWORD *)(v0 + 96), &qword_256BEDAE0);
    sub_23CA4A350();
    sub_23CA4A61C();
    sub_23CA336E0();
    sub_23CA4B420();
    sub_23CA2BFA0();
    sub_23CA3C840();
    sub_23CA2BC74();
    *(_QWORD *)v16 = 0xD00000000000002BLL;
    *(_QWORD *)(v16 + 8) = 0x800000023CA4F9D0;
    *(_BYTE *)(v16 + 16) = 1;
    v17 = sub_23CA4A274();
    sub_23CA4A608(v17, type metadata accessor for ObjectStreamingSupport);
  }
  swift_task_dealloc();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
LABEL_8:
  sub_23CA4A450();
  __asm { BR              X0 }
}

uint64_t type metadata accessor for FieldStreamingSupport(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BEDBA8);
}

uint64_t type metadata accessor for ObjectStreamingSupport(uint64_t a1)
{
  return sub_23CA22DC8(a1, (uint64_t *)&unk_256BEDB98);
}

void sub_23CA4402C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23CA4A65C(a1, a2, a3);
  sub_23CA4A50C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23CA23110();
}

uint64_t sub_23CA44058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v8[24] = a8;
  v8[25] = v11;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a1;
  v8[19] = a3;
  v9 = sub_23CA4B0CC();
  v8[26] = v9;
  v8[27] = *(_QWORD *)(v9 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  sub_23CA22494(&qword_256BEDC08);
  v8[33] = swift_task_alloc();
  v8[34] = type metadata accessor for JsonObjectFieldContainer();
  v8[35] = swift_task_alloc();
  v8[36] = swift_task_alloc();
  v8[37] = swift_task_alloc();
  v8[38] = swift_task_alloc();
  v8[39] = sub_23CA22494(&qword_256BEDAF0);
  v8[40] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_23CA44190()
{
  _QWORD *v0;

  sub_23CA2BCE8();
  v0 = (_QWORD *)swift_task_alloc();
  sub_23CA4A994(v0);
  return sub_23CA4A70C();
}

uint64_t sub_23CA441D8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 336) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_endAccess();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA4422C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,uint64_t a25,uint64_t a26)
{
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  os_log_type_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD);
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t EnumCaseMultiPayload;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(void);
  uint64_t v79;

  sub_23CA4A9DC();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  v29 = sub_23CA4A298(v26[33], 1, v26[34]);
  if (v30)
  {
    sub_23CA4A6B8(v29, &qword_256BEDC08);
    if (qword_256BECF08 != -1)
      swift_once();
    v31 = v26[32];
    v32 = v26[27];
    v33 = v26[21];
    v34 = sub_23CA2BEDC();
    sub_23CA2B764(v34, (uint64_t)qword_256BEF060);
    sub_23CA4AA60(v31, (uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 16));
    sub_23CA33A9C();
    sub_23CA4B2A0();
    v35 = sub_23CA4AB04();
    v36 = sub_23CA4A3E0(v33);
    v37 = v26[32];
    v38 = v26[27];
    v39 = v26[20];
    if (v36)
    {
      v40 = v26[19];
      v79 = v26[27];
      v41 = sub_23CA2BCB4();
      a13 = sub_23CA2BCB4();
      *(_DWORD *)v41 = 136315394;
      sub_23CA33648();
      v26[16] = sub_23CA46BF8(v40, v39, &a13);
      sub_23CA4AC50();
      sub_23CA4A5C8();
      *(_WORD *)(v41 + 12) = 2080;
      sub_23CA49890(&qword_256BED380, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v42 = sub_23CA4A844();
      v26[15] = sub_23CA33AF4(v42, v43, v44, v45, v46, v47);
      sub_23CA4B600();
      swift_bridgeObjectRelease();
      sub_23CA4ABD8(v37, *(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
      sub_23CA4AAA4(&dword_23CA1D000, v33, v35, "Stream for field %s owned by %s is terminated", (uint8_t *)v41);
      sub_23CA4AA9C();
      sub_23CA2BBDC();
    }
    sub_23CA336FC();
    sub_23CA4ABD8(v37, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));

    sub_23CA4AB14();
    sub_23CA4A268(v26[18], v75, v76, v26[24]);
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA243F4();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    sub_23CA2BDB0();
    sub_23CA2BDC8();
    sub_23CA2BDC0();
    sub_23CA2BDB8();
    sub_23CA2BE30();
    v77 = (uint64_t (*)(void))sub_23CA213D4();
    return sub_23CA4A434(v77);
  }
  else
  {
    sub_23CA4AD70(v29, v26[38], (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    if (qword_256BECF08 != -1)
      swift_once();
    v48 = v26[37];
    v49 = sub_23CA2BEDC();
    sub_23CA2B764(v49, (uint64_t)qword_256BEF060);
    v50 = sub_23CA2C160();
    sub_23CA47334(v50, v51, v52);
    sub_23CA33A9C();
    sub_23CA4B2A0();
    v53 = sub_23CA4AB04();
    v54 = sub_23CA4A3E0(v48);
    v55 = v26[37];
    if (v54)
    {
      v56 = v26[36];
      v57 = v26[19];
      v58 = v26[20];
      v59 = sub_23CA2BCB4();
      a13 = sub_23CA2BCB4();
      *(_DWORD *)v59 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v59 + 4) = sub_23CA46BF8(v57, v58, &a13);
      sub_23CA4A5C8();
      *(_WORD *)(v59 + 12) = 2080;
      sub_23CA47334(v55, v56, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
      v60 = sub_23CA4B3CC();
      *(_QWORD *)(v59 + 14) = sub_23CA33AF4(v60, v61, v62, v63, v64, v65);
      sub_23CA28090();
      sub_23CA44E1C(v55, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
      sub_23CA4AAA4(&dword_23CA1D000, v48, v53, "Field Stream %s got: %s", (uint8_t *)v59);
      sub_23CA4AA9C();
      sub_23CA2BBDC();
    }
    v66 = sub_23CA336FC();
    sub_23CA4A4DC(v66, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);

    sub_23CA47334(v26[38], v26[35], (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    sub_23CA4A960();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23CA445D8 + 4 * byte_23CA4D830[EnumCaseMultiPayload]))(EnumCaseMultiPayload, v68, v69, v70, v71, v72, v73, v74, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  }
}

uint64_t sub_23CA44B00()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23CA24398();
  *v2 = *v1;
  *(_QWORD *)(v3 + 352) = v0;
  swift_task_dealloc();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA44B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23CA4A27C();
  v1 = sub_23CA4A878();
  sub_23CA4A77C(v1, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
  sub_23CA4AB14();
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(*(_QWORD *)(v0 + 144), 0, 1, *(_QWORD *)(v0 + 192));
  sub_23CA2131C();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  swift_task_dealloc();
  v2 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA4A1B8(v2);
}

uint64_t sub_23CA44BCC()
{
  uint64_t v0;

  sub_23CA4A27C();
  swift_endAccess();
  sub_23CA4A384();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2131C();
  return sub_23CA4A1B8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA44C2C()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA4A27C();
  v1 = sub_23CA4A878();
  sub_23CA4A77C(v1, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
  sub_23CA4A384();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  sub_23CA2BDC8();
  sub_23CA2BDC0();
  sub_23CA2BDB8();
  sub_23CA2131C();
  return sub_23CA4A1B8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA44C94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23CA3AE5C();
  sub_23CA2806C();
  sub_23CA4AAEC();
  sub_23CA4A88C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23CA4A624(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_release();
  v3 = sub_23CA22494(&qword_256BEDAF8);
  sub_23CA336E8(v3);
  v4 = sub_23CA22494(&qword_256BEDB08);
  sub_23CA336E8(v4);
  sub_23CA4AB64();
  return sub_23CA4A2D8();
}

uint64_t sub_23CA44D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(sub_23CA2806C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_23CA4A88C() - 8) + 80);
  v7 = v5 + v6 + 8;
  v8 = *(_QWORD *)(v0 + 48);
  v9 = v0 + v4;
  v10 = *(_QWORD *)(v0 + v5);
  v11 = v0 + (v7 & ~v6);
  v12 = swift_task_alloc();
  v13 = (_QWORD *)sub_23CA4A524(v12);
  *v13 = v1;
  v13[1] = sub_23CA49FE4;
  v14 = sub_23CA4AD50();
  return sub_23CA44058(v14, v15, v16, v8, v9, v10, v11, v2);
}

void sub_23CA44E1C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_23CA336E8(v2);
  sub_23CA23110();
}

uint64_t StreamingObjectTokenStreamProcessor.stream<A>(objectID:field:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[10] = a6;
  v7[11] = v6;
  v7[8] = a4;
  v7[9] = a5;
  v7[6] = a2;
  v7[7] = a3;
  v7[5] = a1;
  v8 = sub_23CA2806C();
  v7[12] = v8;
  v7[13] = *(_QWORD *)(v8 - 8);
  v7[14] = sub_23CA20FEC();
  v9 = sub_23CA22494(&qword_256BEDAF8);
  v7[15] = v9;
  v7[16] = *(_QWORD *)(v9 - 8);
  v7[17] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA44EB4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 144) = *(_QWORD *)(*(_QWORD *)(v0 + 88)
                                    + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  sub_23CA4A32C();
  sub_23CA4A518();
  return sub_23CA20F80();
}

uint64_t sub_23CA44EF4()
{
  uint64_t *v0;

  sub_23CA462C4(v0[6], v0[7], v0[8], v0[17]);
  v0[19] = 0;
  sub_23CA4A40C();
  sub_23CA21048();
  return sub_23CA4A310();
}

uint64_t sub_23CA44F50(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_log_type_t type, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,uint64_t a25,uint64_t a26)
{
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t (*v52)(void);
  os_log_type_t typea;

  sub_23CA4A9DC();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  if (qword_256BECF08 != -1)
    swift_once();
  v29 = v26[12];
  v30 = sub_23CA2BEDC();
  sub_23CA2B764(v30, (uint64_t)qword_256BEF060);
  v31 = sub_23CA4A784();
  sub_23CA4AA60(v31, v32, v33);
  sub_23CA33A9C();
  sub_23CA4B2A0();
  v34 = sub_23CA4AB94();
  v35 = sub_23CA4A3E0(v29);
  v37 = v26[13];
  v36 = v26[14];
  if (v35)
  {
    v38 = v26[8];
    v39 = v26[7];
    typea = v34;
    v40 = sub_23CA2BCB4();
    a15 = sub_23CA2BCB4();
    *(_DWORD *)v40 = 136315650;
    swift_bridgeObjectRetain();
    v26[2] = sub_23CA46BF8(v39, v38, &a15);
    sub_23CA4AC50();
    sub_23CA4A5C8();
    *(_WORD *)(v40 + 12) = 2080;
    sub_23CA49890(&qword_256BED380, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    v41 = sub_23CA4B6CC();
    v26[3] = sub_23CA46BF8(v41, v42, &a15);
    sub_23CA4B600();
    swift_bridgeObjectRelease();
    sub_23CA4A9D4(v36, *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8));
    *(_WORD *)(v40 + 22) = 2080;
    v43 = sub_23CA4B78C();
    v26[4] = sub_23CA46BF8(v43, v44, &a15);
    sub_23CA4A9BC();
    sub_23CA4AA70();
    _os_log_impl(&dword_23CA1D000, v29, typea, "Created stream for field name %s with objectID %s of type %s", (uint8_t *)v40, 0x20u);
    sub_23CA4AD84();
    sub_23CA2BBDC();
  }
  sub_23CA336FC();
  sub_23CA4A9D4(v36, *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8));

  v46 = v26[16];
  v45 = v26[17];
  v47 = v26[10];
  v48 = v26[7];
  v49 = v26[8];
  sub_23CA22494(&qword_256BEDAF0);
  v50 = swift_allocBox();
  sub_23CA4B4F8();
  v51 = (_QWORD *)sub_23CA33AC4();
  v51[2] = v47;
  v51[3] = v50;
  v51[4] = v48;
  v51[5] = v49;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23CA4B5C4();
  sub_23CA33B44(v45, *(uint64_t (**)(uint64_t, uint64_t))(v46 + 8));
  swift_release();
  sub_23CA2131C();
  sub_23CA4AC08();
  v52 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA4A434(v52);
}

uint64_t sub_23CA45220()
{
  uint64_t v0;

  swift_task_dealloc();
  sub_23CA2131C();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23CA45254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a1;
  v5[13] = a3;
  v6 = sub_23CA4B5F4();
  v5[16] = v6;
  v5[17] = *(_QWORD *)(v6 - 8);
  v5[18] = swift_task_alloc();
  sub_23CA22494(&qword_256BEDC08);
  v5[19] = swift_task_alloc();
  v5[20] = type metadata accessor for JsonObjectFieldContainer();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = sub_23CA22494(&qword_256BEDAF0);
  v5[26] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_23CA4534C()
{
  _QWORD *v0;

  sub_23CA2BCE8();
  v0 = (_QWORD *)swift_task_alloc();
  sub_23CA4AA14(v0);
  return sub_23CA4A70C();
}

uint64_t sub_23CA45394()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23CA2DBC4();
  sub_23CA33784(v2);
  *(_QWORD *)(v0 + 224) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_endAccess();
  sub_23CA21048();
  return sub_23CA24378();
}

uint64_t sub_23CA453E8()
{
  os_log_type_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  _QWORD *v31;
  uint64_t v32[11];
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  sub_23CA4A9F8();
  v34 = v2;
  v35 = v3;
  v33 = v1;
  v4 = sub_23CA4A298(v1[19], 1, v1[20]);
  if (v5)
  {
    sub_23CA4A6B8(v4, &qword_256BEDC08);
    if (qword_256BECF08 != -1)
      swift_once();
    v6 = sub_23CA2BEDC();
    v7 = sub_23CA2B764(v6, (uint64_t)qword_256BEF060);
    sub_23CA33A9C();
    v8 = v7;
    sub_23CA4B2A0();
    v9 = sub_23CA4A498();
    v10 = sub_23CA4A414(v9);
    v11 = v1[14];
    if (v10)
    {
      v12 = v1[13];
      v13 = (uint8_t *)sub_23CA2BCB4();
      v32[0] = sub_23CA2BCB4();
      *(_DWORD *)v13 = 136315138;
      sub_23CA4ADB0();
      v1[11] = sub_23CA46BF8(v12, v11, v32);
      sub_23CA4AC80();
      sub_23CA4A5C8();
      sub_23CA2BEA0(&dword_23CA1D000, v8, v0, "Field Stream %s is terminating", v13);
      sub_23CA2BE98();
      sub_23CA2BBDC();
    }
    sub_23CA336FC();

    goto LABEL_14;
  }
  sub_23CA4AD70(v4, v1[24], (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
  if (qword_256BECF08 != -1)
    swift_once();
  v14 = v1[23];
  v15 = sub_23CA2BEDC();
  v16 = sub_23CA2B764(v15, (uint64_t)qword_256BEF060);
  sub_23CA4AD78(v16, v17, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
  sub_23CA33A9C();
  v18 = v16;
  sub_23CA4B2A0();
  v19 = sub_23CA4A498();
  v20 = sub_23CA337D4(v19);
  v21 = v1[23];
  if (v20)
  {
    v22 = v1[22];
    v24 = v1[13];
    v23 = v1[14];
    v25 = sub_23CA2BCB4();
    v32[0] = sub_23CA2BCB4();
    *(_DWORD *)v25 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v25 + 4) = sub_23CA46BF8(v24, v23, v32);
    sub_23CA4A5C8();
    *(_WORD *)(v25 + 12) = 2080;
    sub_23CA47334(v21, v22, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    v26 = sub_23CA4B3CC();
    *(_QWORD *)(v25 + 14) = sub_23CA46BF8(v26, v27, v32);
    swift_bridgeObjectRelease();
    sub_23CA44E1C(v21, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
    sub_23CA4AAA4(&dword_23CA1D000, v18, (os_log_type_t)v14, "Field Stream %s got: %s", (uint8_t *)v25);
    sub_23CA4AA9C();
    sub_23CA2BBDC();
  }
  sub_23CA336FC();
  sub_23CA44E1C(v21, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);

  sub_23CA47334(v1[24], v1[21], (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
  if (!swift_getEnumCaseMultiPayload())
    __asm { BR              X12 }
  v28 = v1[21];
  sub_23CA4ABB4(v1[24]);
  sub_23CA4ABB4(v28);
  if ((sub_23CA4B51C() & 1) != 0)
  {
LABEL_14:
    _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(v1[12], 1, 1, v1[15]);
    sub_23CA2131C();
    sub_23CA24384();
    sub_23CA2BD80();
    sub_23CA2BD5C();
    sub_23CA2BDB0();
    sub_23CA2BDC8();
    v29 = (uint64_t (*)(void))sub_23CA213D4();
    return v29();
  }
  sub_23CA2BCE8();
  v31 = (_QWORD *)swift_task_alloc();
  sub_23CA4AA14(v31);
  return sub_23CA4B5AC();
}

uint64_t sub_23CA459D0()
{
  uint64_t v0;

  swift_endAccess();
  sub_23CA4A910();
  sub_23CA24384();
  sub_23CA243F4();
  sub_23CA2BD80();
  sub_23CA2BD5C();
  sub_23CA2BDB0();
  return sub_23CA211BC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t StreamingObjectTokenStreamProcessor.enumStream<A>(objectID:field:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v8 = sub_23CA22494(&qword_256BEDAF8);
  v7[9] = v8;
  v7[10] = *(_QWORD *)(v8 - 8);
  v7[11] = sub_23CA20FEC();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA45A80()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(*(_QWORD *)(v0 + 64)
                                   + OBJC_IVAR____TtC19GenerativeFunctions35StreamingObjectTokenStreamProcessor_objectStreamMap);
  sub_23CA4A32C();
  sub_23CA4A518();
  return sub_23CA20F80();
}

uint64_t sub_23CA45AC0()
{
  uint64_t *v0;

  sub_23CA462C4(v0[3], v0[4], v0[5], v0[11]);
  v0[13] = 0;
  sub_23CA4A40C();
  sub_23CA21048();
  return sub_23CA4A310();
}

uint64_t sub_23CA45B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  __int128 v10;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = sub_23CA33AC4();
  v10 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 + 16) = v10;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v2;
  sub_23CA49C08(&qword_256BEDB38, &qword_256BEDAF8);
  v7 = v6;
  sub_23CA336E0();
  sub_23CA1E588((uint64_t)sub_23CA47318, v5, v1, v10, v7, v4);
  swift_release();
  sub_23CA4A46C();
  sub_23CA2131C();
  v8 = (uint64_t (*)(void))sub_23CA213D4();
  return v8();
}

uint64_t sub_23CA45BE8()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_23CA20F8C(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23CA45C14(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
  char *v9;
  _QWORD v10[10];

  v10[9] = a3;
  v10[0] = a4;
  v10[1] = a2;
  v5 = sub_23CA4B5F4();
  MEMORY[0x24BDAC7A8](v5);
  v6 = type metadata accessor for JsonObjectFieldContainer();
  MEMORY[0x24BDAC7A8](v6);
  sub_23CA47334(a1, (uint64_t)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v9 = (char *)sub_23CA45CF8 + 4 * byte_23CA4D83A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23CA45CF8()
{
  uint64_t v0;
  uint64_t v1;

  sub_23CA3C840();
  swift_allocError();
  *(_QWORD *)v1 = 0xD000000000000029;
  *(_QWORD *)(v1 + 8) = 0x800000023CA4FB00;
  *(_BYTE *)(v1 + 16) = 2;
  swift_willThrow();
  sub_23CA44E1C(v0, (uint64_t (*)(_QWORD))type metadata accessor for JsonObjectFieldContainer);
}

uint64_t sub_23CA45FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v14;
  uint64_t v15;

  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_23CA49FE4;
  return StreamingObjectTokenStreamProcessor.stream<A>(parentObjectID:field:of:)(a1, a2, a3, a4, v15, a6, a7);
}

uint64_t sub_23CA46070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23CA49FE4;
  return StreamingObjectTokenStreamProcessor.enumStream<A>(objectID:field:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23CA46104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23CA49FE4;
  return StreamingObjectTokenStreamProcessor.stream<A>(objectID:field:of:)(a1, a2, a3, a4, a5, a6);
}

void sub_23CA46198(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_23CA22494(&qword_256BEDAE8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23CA4B0CC();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  sub_23CA47334(a2, (uint64_t)v8, type metadata accessor for ObjectStreamingSupport);
  v13 = type metadata accessor for ObjectStreamingSupport(0);
  _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0((uint64_t)v8, 0, 1, v13);
  swift_beginAccess();
  sub_23CA436B8((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
  sub_23CA47334(a2, a3, type metadata accessor for ObjectStreamingSupport);
}

uint64_t sub_23CA462C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
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
  unint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v38 = a4;
  v44 = a2;
  v45 = a3;
  v6 = type metadata accessor for ObjectStreamingSupport(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v39 = (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v38 - v9;
  v11 = sub_23CA22494(&qword_256BEDAE8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v41 = (uint64_t)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v38 - v14;
  v16 = sub_23CA22494(&qword_256BEDAE0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23CA22494(&qword_256BEDAF8);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = (uint64_t *)(v4 + 112);
  swift_beginAccess();
  v23 = *(_QWORD *)(v4 + 112);
  swift_bridgeObjectRetain();
  v42 = a1;
  sub_23CA3BC50(a1, v23, (uint64_t)v15);
  swift_bridgeObjectRelease();
  v24 = _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v15, 1, v6);
  v43 = v6;
  if (v24)
  {
    sub_23CA49D50((uint64_t)v15, &qword_256BEDAE8);
  }
  else
  {
    sub_23CA47334((uint64_t)v15, (uint64_t)v10, type metadata accessor for ObjectStreamingSupport);
    sub_23CA49D50((uint64_t)v15, &qword_256BEDAE8);
    v25 = *(_QWORD *)&v10[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain();
    sub_23CA44E1C((uint64_t)v10, type metadata accessor for ObjectStreamingSupport);
    v26 = v45;
    swift_bridgeObjectRetain();
    sub_23CA3BBBC(v44, v26, v25, (uint64_t)v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = type metadata accessor for FieldStreamingSupport(0);
    if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0((uint64_t)v18, 1, v27) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v22, v18, v19);
      sub_23CA44E1C((uint64_t)v18, type metadata accessor for FieldStreamingSupport);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v38, v22, v19);
    }
    sub_23CA49D50((uint64_t)v18, &qword_256BEDAE0);
  }
  v46 = 0;
  v47 = 0xE000000000000000;
  sub_23CA4B648();
  sub_23CA4B420();
  sub_23CA4B0CC();
  sub_23CA49890(&qword_256BED380, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v28 = v42;
  sub_23CA4B6CC();
  sub_23CA4B420();
  swift_bridgeObjectRelease();
  sub_23CA4B420();
  sub_23CA4B420();
  sub_23CA4B420();
  v29 = *v40;
  swift_bridgeObjectRetain();
  v30 = v41;
  sub_23CA3BC50(v28, v29, v41);
  swift_bridgeObjectRelease();
  v31 = v43;
  if (_s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(v30, 1, v43))
  {
    sub_23CA49D50(v30, &qword_256BEDAE8);
    v32 = 0;
  }
  else
  {
    v33 = v39;
    sub_23CA47334(v30, v39, type metadata accessor for ObjectStreamingSupport);
    sub_23CA49D50(v30, &qword_256BEDAE8);
    v32 = *(_QWORD *)(v33 + *(int *)(v31 + 20));
    swift_bridgeObjectRetain();
    sub_23CA44E1C(v33, type metadata accessor for ObjectStreamingSupport);
  }
  v48 = v32;
  sub_23CA22494(&qword_256BEDC10);
  sub_23CA4B3CC();
  sub_23CA4B420();
  swift_bridgeObjectRelease();
  v34 = v46;
  v35 = v47;
  sub_23CA3C840();
  swift_allocError();
  *(_QWORD *)v36 = v34;
  *(_QWORD *)(v36 + 8) = v35;
  *(_BYTE *)(v36 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_23CA46764()
{
  sub_23CA4AD48();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23CA4678C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23CA35944();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_23CA4A524(v1);
  *v2 = v0;
  v2[1] = sub_23CA49FE4;
  sub_23CA4AD50();
  sub_23CA4ABE8();
  return sub_23CA45254(v3, v4, v5, v6, v7);
}

void sub_23CA467EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;

  v3 = type metadata accessor for ObjectStreamingSupport(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v7 = *(_QWORD *)(v1 + 112);
  v8 = v7 + 64;
  v9 = 1 << *(_BYTE *)(v7 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v7 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  v13 = 0;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    sub_23CA47334(*(_QWORD *)(v7 + 56) + *(_QWORD *)(v4 + 72) * i, (uint64_t)v6, type metadata accessor for ObjectStreamingSupport);
    sub_23CA428C4(a1);
    sub_23CA44E1C((uint64_t)v6, type metadata accessor for ObjectStreamingSupport);
    if (v11)
      goto LABEL_4;
LABEL_5:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v12)
      goto LABEL_23;
    v17 = *(_QWORD *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v12)
        goto LABEL_23;
      v17 = *(_QWORD *)(v8 + 8 * v13);
      if (!v17)
      {
        v13 = v16 + 2;
        if (v16 + 2 >= v12)
          goto LABEL_23;
        v17 = *(_QWORD *)(v8 + 8 * v13);
        if (!v17)
        {
          v13 = v16 + 3;
          if (v16 + 3 >= v12)
            goto LABEL_23;
          v17 = *(_QWORD *)(v8 + 8 * v13);
          if (!v17)
            break;
        }
      }
    }
LABEL_20:
    v11 = (v17 - 1) & v17;
  }
  v18 = v16 + 4;
  if (v18 >= v12)
  {
LABEL_23:
    swift_release();
    return;
  }
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
  {
    v13 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v13 >= v12)
      goto LABEL_23;
    v17 = *(_QWORD *)(v8 + 8 * v13);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_23CA469C8()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

void AsyncThrowingStream.Continuation<>.emit(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);

  type metadata accessor for JsonStreamEvent(0);
  sub_23CA280A8();
  MEMORY[0x24BDAC7A8](v3);
  sub_23CA4A36C();
  v4 = sub_23CA22494(&qword_256BEDB40);
  MEMORY[0x24BDAC7A8](v4);
  sub_23CA4A580();
  sub_23CA47334(a1, v1, type metadata accessor for JsonStreamEvent);
  sub_23CA22494(&qword_256BEDA48);
  sub_23CA4B570();
  v5 = sub_23CA4AA78();
  v6(v5);
  sub_23CA3AAE8();
}

uint64_t sub_23CA46AAC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23CA46B10;
  return v6(a1);
}

uint64_t sub_23CA46B10()
{
  uint64_t (*v0)(void);

  sub_23CA2BC34();
  v0 = (uint64_t (*)(void))sub_23CA213D4();
  return sub_23CA20F8C(v0);
}

void sub_23CA46B44()
{
  sub_23CA46B5C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23CA32008);
}

void sub_23CA46B50()
{
  sub_23CA46B5C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23CA32114);
}

void sub_23CA46B5C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_23CA4ABFC();
  *v1 = v2;
  if (!(_DWORD)v4)
    *v1 = a1(v4, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  sub_23CA3AD70();
}

uint64_t sub_23CA46BA0(uint64_t a1)
{
  return sub_23CA46BB8(a1, (uint64_t (*)(BOOL))sub_23CA32008);
}

uint64_t sub_23CA46BAC(uint64_t a1)
{
  return sub_23CA46BB8(a1, (uint64_t (*)(BOOL))sub_23CA32114);
}

uint64_t sub_23CA46BB8(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_23CA46BF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  sub_23CA21048();
  v9 = sub_23CA46CC0(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_23CA4991C((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_23CA4991C((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    sub_23CA336E0();
  }
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0((uint64_t)v15);
  return v10;
}

uint64_t sub_23CA46CC0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_23CA46E14((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23CA4B60C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23CA46ED8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23CA4B660();
    if (!v8)
    {
      result = sub_23CA4B690();
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

void *sub_23CA46E14(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23CA4B6A8();
  __break(1u);
  return result;
}

uint64_t sub_23CA46ED8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23CA46F6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23CA470DC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23CA470DC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23CA46F6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23CA4B438();
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
  sub_23CA327AC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23CA4B654();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_23CA4B6A8();
  __break(1u);
LABEL_14:
  result = sub_23CA4B690();
  __break(1u);
  return result;
}

char *sub_23CA470DC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_23CA22494(&qword_256BED4B0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
    sub_23CA47274(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23CA471B0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23CA471B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23CA4B6A8();
  __break(1u);
  return result;
}

char *sub_23CA47274(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23CA4B6A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_23CA472F4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23CA47318(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_23CA45C14(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

void sub_23CA47334(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23CA4A65C(a1, a2, a3);
  sub_23CA4A50C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23CA23110();
}

uint64_t dispatch thunk of _StreamSanitizer._sanitize(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23CA35944();
  sub_23CA3B270();
  v0 = sub_23CA4A4BC();
  v1 = (_QWORD *)sub_23CA4A524(v0);
  sub_23CA4A6CC(v1);
  sub_23CA4ABE8();
  return v6(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23CA473A8()
{
  return type metadata accessor for StreamingObjectTokenStreamProcessor(0);
}

void sub_23CA473B0()
{
  unint64_t v0;
  unint64_t v1;

  sub_23CA4751C(319, &qword_256BEDB88, &qword_256BEDA38);
  if (v0 <= 0x3F)
  {
    sub_23CA4751C(319, &qword_256BEDB90, &qword_256BEDA48);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for StreamingObjectTokenStreamProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.startStreaming(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.stopStreaming()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of StreamingObjectTokenStreamProcessor.stream<A>(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23CA35944();
  sub_23CA3B270();
  v0 = sub_23CA4A4BC();
  v1 = (_QWORD *)sub_23CA4A524(v0);
  sub_23CA4A6CC(v1);
  sub_23CA4ABE8();
  return v6(v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_23CA4751C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_23CA23CAC(a3);
    v4 = sub_23CA4B5F4();
    if (!v5)
      atomic_store(v4, a2);
  }
  sub_23CA23110();
}

uint64_t *sub_23CA47564(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23CA4B0CC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23CA475F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA47634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23CA47694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23CA47700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23CA4775C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23CA4B0CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23CA477C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA477CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_23CA2806C();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return sub_23CA4A748(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_23CA47838()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23CA47844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  sub_23CA4AC98();
  v4 = sub_23CA2806C();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == v3)
  {
    sub_23CA4A3E8(v1, v0, v0, v4);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
    sub_23CA3AD70();
  }
}

uint64_t sub_23CA47898()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23CA4B0CC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23CA4790C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23CA22494(&qword_256BEDAF8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23CA22494(&qword_256BEDB08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_23CA479BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23CA22494(&qword_256BEDAF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23CA22494(&qword_256BEDB08);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_23CA47A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23CA22494(&qword_256BEDAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23CA22494(&qword_256BEDB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_23CA47AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23CA22494(&qword_256BEDAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23CA22494(&qword_256BEDB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_23CA47B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23CA22494(&qword_256BEDAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23CA22494(&qword_256BEDB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_23CA47BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23CA22494(&qword_256BEDAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23CA22494(&qword_256BEDB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23CA47C30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA47C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23CA22494(&qword_256BEDAF8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = sub_23CA22494(&qword_256BEDB08);
    v8 = a1 + *(int *)(a3 + 20);
  }
  return sub_23CA4A748(v8, a2, v7);
}

uint64_t sub_23CA47CA4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23CA47CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23CA4AC98();
  v4 = sub_23CA22494(&qword_256BEDAF8);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == v3)
  {
    v5 = v4;
    v6 = v1;
  }
  else
  {
    v5 = sub_23CA22494(&qword_256BEDB08);
    v6 = v1 + *(int *)(v2 + 20);
  }
  return sub_23CA4A3E8(v6, v0, v0, v5);
}

void sub_23CA47D14()
{
  unint64_t v0;
  unint64_t v1;

  sub_23CA47DB8(319, &qword_256BEDBB8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
  if (v0 <= 0x3F)
  {
    sub_23CA47DB8(319, &qword_256BEDBC0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6CD0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23CA47DB8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for JsonObjectFieldContainer();
    v7 = sub_23CA23CAC(&qword_256BED240);
    v8 = a3(a1, v6, v7, MEMORY[0x24BEE3F20]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_23CA47E30(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for TokenStreamingError(uint64_t a1)
{
  return sub_23CA47E58(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23CA47E58(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s19GenerativeFunctions19TokenStreamingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA47E30(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TokenStreamingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23CA47E30(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23CA47E58(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for TokenStreamingError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23CA47E58(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStreamingError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3)
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

uint64_t storeEnumTagSinglePayload for TokenStreamingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23CA47FD4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23CA47FEC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TokenStreamingError()
{
  return &type metadata for TokenStreamingError;
}

ValueMetadata *type metadata accessor for NoOpStreamSanitizer()
{
  return &type metadata for NoOpStreamSanitizer;
}

uint64_t sub_23CA48024(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23CA22494(&qword_256BEDBD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

size_t sub_23CA4806C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23CA480A4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23CA48088(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23CA481E4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_23CA480A4(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23CA22494(&qword_256BEDC50);
  v10 = *(_QWORD *)(sub_23CA4B138() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_23CA4B138() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_23CA326C8(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23CA3BA80(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_23CA481E4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_23CA22494(&qword_256BED4F8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23CA32658(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23CA3B9DC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_23CA482C4(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23CA4B0CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23CA49890(&qword_256BED2E8, v11);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23CA4B378();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23CA49890(&qword_256BED2F0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v21 = sub_23CA4B3C0();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23CA49294((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23CA48520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t *v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = sub_23CA4B0CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23CA49890(&qword_256BED2E8, v11);
  swift_bridgeObjectRetain();
  v29 = a1;
  v12 = sub_23CA4B378();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v26 = v3;
    v27 = a2;
    v15 = ~v13;
    v16 = *(_QWORD *)(v7 + 72);
    v28 = v7;
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v17(v9, *(_QWORD *)(v10 + 48) + v16 * v14, v6);
      sub_23CA49890(&qword_256BED2F0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v18 = sub_23CA4B3C0();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
      if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v19 = 1;
        a2 = v27;
        return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, v19, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    v20 = v26;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v20;
    v30 = *v20;
    *v20 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23CA48750();
      v22 = v30;
    }
    v23 = *(_QWORD *)(v22 + 48) + v16 * v14;
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v28 + 32))(v27, v23, v6);
    sub_23CA49004(v14);
    *v20 = v30;
    swift_bridgeObjectRelease();
    v19 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v19 = 1;
  }
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, v19, 1, v6);
}

void *sub_23CA48750()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_23CA4B0CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA22494(&qword_256BEDC58);
  v6 = *v0;
  v7 = sub_23CA4B624();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23CA48978()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23CA4B0CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  sub_23CA22494(&qword_256BEDC58);
  v7 = sub_23CA4B630();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v21 * i, v2);
    sub_23CA49890(&qword_256BED2E8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    result = sub_23CA4B378();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v25 * v21, v5, v2);
    ++*(_QWORD *)(v8 + 16);
    if (v12)
      goto LABEL_6;
LABEL_7:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_36;
    if (v18 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v32 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v32 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v12 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v32 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23CA48C9C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23CA4B0CC();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_23CA22494(&qword_256BEDC58);
  v6 = sub_23CA4B630();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = v5;
      v21 = *(_QWORD *)(v5 + 48);
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v23(v4, v21 + v22 * i, v2);
      sub_23CA49890(&qword_256BED2E8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      result = sub_23CA4B378();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(*(_QWORD *)(v7 + 48) + v27 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v20;
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_38;
      if (v17 >= v34)
        goto LABEL_32;
      v18 = v35[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v34)
          goto LABEL_32;
        v18 = v35[v14];
        if (!v18)
        {
          v14 = v17 + 2;
          if (v17 + 2 >= v34)
            goto LABEL_32;
          v18 = v35[v14];
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v34)
            {
LABEL_32:
              swift_release();
              v1 = v33;
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 > 63)
                sub_23CA49278(0, (unint64_t)(v32 + 63) >> 6, v35);
              else
                *v35 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v14 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_39;
                if (v14 >= v34)
                  goto LABEL_32;
                v18 = v35[v14];
                ++v19;
                if (v18)
                  goto LABEL_20;
              }
            }
            v14 = v19;
          }
        }
      }
LABEL_20:
      v11 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23CA49004(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v3 = sub_23CA4B0CC();
  v32 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v29 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_23CA4B618();
    v31 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v32 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v32 + 16);
      while (1)
      {
        v15 = v14 * v10;
        v30(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_23CA49890(&qword_256BED2E8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
        v16 = sub_23CA4B378();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_24;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_24;
        }
        v20 = *(_QWORD *)(v7 + 48);
        v21 = v14 * a1;
        v22 = v20 + v14 * a1;
        v23 = v20 + v15 + v14;
        if (v14 * a1 < v15 || v22 >= v23)
          break;
        a1 = v10;
        if (v21 != v15)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        v10 = (v10 + 1) & v11;
        if (((*(_QWORD *)(v31 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
          goto LABEL_25;
      }
      swift_arrayInitWithTakeFrontToBack();
LABEL_23:
      a1 = v10;
      goto LABEL_24;
    }
LABEL_25:
    *(_QWORD *)(v31 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v29;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v25 = *v1;
  v26 = *(_QWORD *)(*v1 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v25 + 16) = v28;
    ++*(_DWORD *)(v25 + 36);
  }
  return result;
}

uint64_t sub_23CA49278(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_23CA49294(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23CA4B0CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23CA48C9C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23CA48750();
      goto LABEL_12;
    }
    sub_23CA48978();
  }
  v12 = *v3;
  sub_23CA49890(&qword_256BED2E8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v13 = sub_23CA4B378();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23CA49890(&qword_256BED2F0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v18 = sub_23CA4B3C0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23CA4B6E4();
  __break(1u);
  return result;
}

uint64_t sub_23CA49498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23CA25378(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_23CA22494(&qword_256BEDBE8);
    sub_23CA4B678();
    v8 = *(_QWORD *)(v15 + 48);
    v9 = sub_23CA4B0CC();
    v10 = (void (*)(uint64_t))MEMORY[0x24BDCEA58];
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v6, v9);
    v11 = *(_QWORD *)(v15 + 56);
    v12 = type metadata accessor for ObjectStreamingSupport(0);
    sub_23CA4402C(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v6, a2, type metadata accessor for ObjectStreamingSupport);
    sub_23CA49890(&qword_256BED2E8, v10);
    sub_23CA4B684();
    *v3 = v15;
    swift_bridgeObjectRelease();
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, 0, 1, v12);
  }
  else
  {
    v14 = type metadata accessor for ObjectStreamingSupport(0);
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a2, 1, 1, v14);
  }
}

uint64_t sub_23CA49610(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_23CA4967C(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

void sub_23CA4967C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (_QWORD **)v2;
  v6 = sub_23CA4B0CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v2;
  v11 = sub_23CA25378(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v11;
  v14 = v12;
  sub_23CA22494(&qword_256BEDBE8);
  if ((sub_23CA4B678() & 1) == 0)
    goto LABEL_5;
  v15 = sub_23CA25378(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    sub_23CA4B6F0();
    __break(1u);
    return;
  }
  v13 = v15;
LABEL_5:
  v17 = *v3;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    v19 = type metadata accessor for ObjectStreamingSupport(0);
    sub_23CA498F0(a1, v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v13, type metadata accessor for ObjectStreamingSupport);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    sub_23CA497D8(v13, (uint64_t)v9, a1, v17);
  }
}

void sub_23CA497D8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23CA4B0CC();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for ObjectStreamingSupport(0);
  sub_23CA4402C(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, type metadata accessor for ObjectStreamingSupport);
  v12 = a4[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a4[2] = v14;
}

void sub_23CA49890(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    sub_23CA4ACD4();
  }
  sub_23CA23110();
}

uint64_t sub_23CA498C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23CA498E8(uint64_t a1)
{
  uint64_t v1;

  sub_23CA4351C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_23CA498F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_23CA4A65C(a1, a2, a3);
  sub_23CA4A50C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  sub_23CA23110();
}

uint64_t sub_23CA4991C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23CA49958(unint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_23CA4A820();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_23CA49CE8(v1);
    v1 = result;
  }
  v5 = *(_QWORD *)(v1 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    v6 = v5 - 1;
    v7 = v1 + 16 * a1;
    v8 = *(_QWORD *)(v7 + 32);
    sub_23CA32658((char *)(v7 + 48), v5 - 1 - a1, (char *)(v7 + 32));
    *(_QWORD *)(v1 + 16) = v6;
    *v2 = v1;
    return v8;
  }
  return result;
}

void sub_23CA499D8(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if ((sub_23CA4A820() & 1) == 0)
    v2 = sub_23CA49CFC(v2);
  v6 = *(_QWORD *)(v2 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    sub_23CA2806C();
    sub_23CA4A768();
    v9 = *(_QWORD *)(v8 + 72);
    v10 = v2 + v7 + v9 * a1;
    (*(void (**)(uint64_t, unint64_t))(v8 + 32))(a2, v10);
    sub_23CA326BC(v10 + v9, v6 - 1 - a1, v10);
    *(_QWORD *)(v2 + 16) = v6 - 1;
    *v3 = v2;
    sub_23CA3AAE8();
  }
}

uint64_t sub_23CA49A6C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = sub_23CA49D3C(v5);
    v5 = result;
  }
  v7 = *(_QWORD *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    v8 = *(_QWORD *)(type metadata accessor for ObjectStreamingSupport(0) - 8);
    v9 = *(_QWORD *)(v8 + 72);
    v10 = v5 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + v9 * a1;
    sub_23CA4402C(v10, a2, type metadata accessor for ObjectStreamingSupport);
    result = sub_23CA326D4(v10 + v9, v7 - 1 - a1, v10);
    *(_QWORD *)(v5 + 16) = v7 - 1;
    *v2 = v5;
  }
  return result;
}

void sub_23CA49B28()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  if ((sub_23CA4A820() & 1) == 0)
    v0 = sub_23CA49CE8((uint64_t)v0);
  v2 = v0[2];
  if (v2)
  {
    v0[2] = v2 - 1;
    *v1 = v0;
    sub_23CA23110();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23CA49B74@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_23CA4ABFC();
  if ((result & 1) == 0)
  {
    result = sub_23CA49CFC(v2);
    v2 = result;
  }
  v5 = *(_QWORD *)(v2 + 16);
  if (v5)
  {
    v6 = v5 - 1;
    v7 = sub_23CA2806C();
    sub_23CA4A768();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(a1, v2 + v8 + *(_QWORD *)(v9 + 72) * v6, v7);
    *(_QWORD *)(v2 + 16) = v6;
    *v1 = v2;
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23CA49C08(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    sub_23CA23CAC(a2);
    sub_23CA4ACD4();
  }
  sub_23CA23110();
}

uint64_t sub_23CA49C3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = sub_23CA49D3C(v3);
    v3 = result;
  }
  v5 = *(_QWORD *)(v3 + 16);
  if (v5)
  {
    v6 = v5 - 1;
    v7 = type metadata accessor for ObjectStreamingSupport(0);
    sub_23CA4402C(v3+ ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72) * v6, a1, type metadata accessor for ObjectStreamingSupport);
    *(_QWORD *)(v3 + 16) = v6;
    *v1 = v3;
    return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 0, 1, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_23CA49CE8(uint64_t a1)
{
  return sub_23CA32008(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_23CA49CFC(uint64_t a1)
{
  return sub_23CA32114(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_23CA49D10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23CA4A984(a1, a2, a3);
  sub_23CA4A50C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23CA23110();
}

uint64_t sub_23CA49D3C(uint64_t a1)
{
  return sub_23CA32128(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_23CA49D50(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_23CA22494(a2);
  sub_23CA336E8(v2);
  sub_23CA23110();
}

uint64_t sub_23CA49D78()
{
  sub_23CA4AD48();
  return swift_deallocObject();
}

uint64_t sub_23CA49D98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)sub_23CA4A524(v5);
  *v6 = v2;
  v6[1] = sub_23CA49FE4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256BEDC60 + dword_256BEDC60))(a1, v4);
}

uint64_t sub_23CA49E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t *v6;

  v3[7] = a1;
  v3[8] = a3;
  v5 = sub_23CA22494(&qword_256BEDA48);
  v3[5] = v5;
  v3[6] = (uint64_t)&off_250DA6458;
  v6 = sub_23CA1F394(v3 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v6, a2, v5);
  return swift_task_switch();
}

uint64_t sub_23CA49E84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[7];
  v1 = v0[8];
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
  *(_BYTE *)(v1 + 80) = -1;
  *(_QWORD *)(v1 + 88) = 0;
  *(_QWORD *)(v1 + 96) = 0;
  *(_BYTE *)(v1 + 104) = -1;
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 112) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 120) = v3;
  *(_QWORD *)(v1 + 128) = v3;
  *(_QWORD *)(v1 + 136) = sub_23CA28308;
  *(_QWORD *)(v1 + 144) = 0;
  *(_QWORD *)(v1 + 16) = v2;
  sub_23CA2B7BC((uint64_t)(v0 + 2), v1 + 24);
  sub_23CA4A32C();
  v4 = (_QWORD *)sub_23CA4AB4C();
  v0[9] = v4;
  *v4 = v0;
  v4[1] = sub_23CA49F14;
  return sub_23CA2830C();
}

uint64_t sub_23CA49F14()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v4 = *v0;
  v1 = v4;
  sub_23CA2DC04(&v4);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_23CA49F70;
  return sub_23CA2830C();
}

uint64_t sub_23CA49F70()
{
  sub_23CA24398();
  sub_23CA2BC34();
  sub_23CA21048();
  return sub_23CA20F80();
}

uint64_t sub_23CA49FA4()
{
  uint64_t v0;

  swift_release();
  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(v0 + 16);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

uint64_t sub_23CA49FE8()
{
  _QWORD *v0;
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

  v2 = v0[80];
  *(_QWORD *)(v1 - 256) = v0[81];
  *(_QWORD *)(v1 - 248) = v2;
  v3 = v0[78];
  *(_QWORD *)(v1 - 240) = v0[79];
  *(_QWORD *)(v1 - 232) = v3;
  v4 = v0[75];
  *(_QWORD *)(v1 - 224) = v0[76];
  *(_QWORD *)(v1 - 216) = v4;
  v5 = v0[73];
  *(_QWORD *)(v1 - 208) = v0[74];
  *(_QWORD *)(v1 - 200) = v5;
  v6 = v0[71];
  *(_QWORD *)(v1 - 192) = v0[72];
  *(_QWORD *)(v1 - 184) = v6;
  v7 = v0[67];
  *(_QWORD *)(v1 - 176) = v0[68];
  *(_QWORD *)(v1 - 168) = v7;
  v8 = v0[65];
  *(_QWORD *)(v1 - 160) = v0[66];
  *(_QWORD *)(v1 - 152) = v8;
  v9 = v0[61];
  *(_QWORD *)(v1 - 144) = v0[62];
  *(_QWORD *)(v1 - 136) = v9;
  v10 = v0[58];
  *(_QWORD *)(v1 - 128) = v0[59];
  *(_QWORD *)(v1 - 120) = v10;
  v11 = v0[56];
  *(_QWORD *)(v1 - 112) = v0[57];
  *(_QWORD *)(v1 - 104) = v11;
  v12 = v0[52];
  *(_QWORD *)(v1 - 96) = v0[54];
  *(_QWORD *)(v1 - 88) = v12;
  return swift_task_dealloc();
}

uint64_t sub_23CA4A1B8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA4A1D4(uint64_t a1)
{
  uint64_t v1;

  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, 1, v1);
}

uint64_t sub_23CA4A1F0@<X0>(uint64_t a1@<X1>, char a2@<W8>)
{
  *(_BYTE *)(a1 + 16) = a2;
  return swift_willThrow();
}

uint64_t sub_23CA4A240()
{
  return swift_task_switch();
}

uint64_t sub_23CA4A25C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4A268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, 1, 1, a4);
}

uint64_t sub_23CA4A274()
{
  return swift_willThrow();
}

uint64_t sub_23CA4A298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, a3);
}

uint64_t sub_23CA4A2BC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 264) = a1;
  return sub_23CA4B600();
}

uint64_t sub_23CA4A2D8()
{
  return swift_deallocObject();
}

uint64_t sub_23CA4A2F0()
{
  return swift_bridgeObjectRelease();
}

void sub_23CA4A2FC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_23CA4A310()
{
  return swift_task_switch();
}

BOOL sub_23CA4A31C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_23CA4A32C()
{
  return swift_retain();
}

void sub_23CA4A340()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
}

uint64_t sub_23CA4A350()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
  return sub_23CA4B648();
}

uint64_t sub_23CA4A364()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4A384()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4A39C()
{
  return sub_23CA4B420();
}

uint64_t sub_23CA4A3A8()
{
  uint64_t v0;

  return sub_23CA32114(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
}

uint64_t sub_23CA4A3C0()
{
  uint64_t v0;

  return sub_23CA32128(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
}

unint64_t sub_23CA4A3D8()
{
  return sub_23CA3C840();
}

BOOL sub_23CA4A3E0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_23CA4A3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, a3, a4);
}

uint64_t sub_23CA4A3F4(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_23CA32128(a1, a2, 1, v2);
}

uint64_t sub_23CA4A40C()
{
  return swift_release();
}

BOOL sub_23CA4A414(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_23CA4A424()
{
  return swift_task_alloc();
}

uint64_t sub_23CA4A434(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23CA4A46C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23CA4A47C()
{
  return sub_23CA4B5A0();
}

uint64_t sub_23CA4A498()
{
  return sub_23CA4B5DC();
}

uint64_t sub_23CA4A4A0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23CA4A4BC()
{
  return swift_task_alloc();
}

uint64_t sub_23CA4A4D0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_23CA4A4DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A4E4()
{
  return sub_23CA4B420();
}

uint64_t sub_23CA4A4EC()
{
  return sub_23CA4B180();
}

void sub_23CA4A504(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23CA49D50(v2, a2);
}

uint64_t sub_23CA4A50C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_23CA4A524(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void sub_23CA4A530()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

uint64_t sub_23CA4A5C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_23CA46BF8(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t sub_23CA4A5C8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23CA4A5D0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4A5D8()
{
  return sub_23CA4B2A0();
}

uint64_t sub_23CA4A5E0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 1392) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 1160);
}

void sub_23CA4A608(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A61C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4A624@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23CA4A62C()
{
  return sub_23CA4B6CC();
}

uint64_t sub_23CA4A65C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

void sub_23CA4A66C()
{
  void *v0;

}

uint64_t sub_23CA4A678(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA4A680(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_23CA4A688()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23CA4A6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, 1, v2);
}

uint64_t sub_23CA4A6B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_23CA4A6B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23CA49D50(v2, a2);
}

uint64_t sub_23CA4A6C0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t sub_23CA4A6CC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = v1;
  return v3;
}

uint64_t sub_23CA4A6EC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4A70C()
{
  return sub_23CA4B5AC();
}

uint64_t sub_23CA4A718()
{
  return swift_beginAccess();
}

uint64_t sub_23CA4A730(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void sub_23CA4A738(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_QWORD *)(v2 - 88) = (v1 - 32) | 0x8000000000000000;
}

uint64_t sub_23CA4A748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s19GenerativeFunctions24JsonObjectFieldContainerOwet_0(a1, a2, a3);
}

void sub_23CA4A77C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A784()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4A790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v2 + 312) = v0;
  return v5(v3, v1, v4);
}

void sub_23CA4A7A4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_23CA4A7D0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
  return sub_23CA4B648();
}

uint64_t sub_23CA4A80C()
{
  return swift_release();
}

void sub_23CA4A814(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A820()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23CA4A82C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA4A834(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_23CA4A83C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_23CA4A844()
{
  return sub_23CA4B6CC();
}

uint64_t sub_23CA4A850(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s19GenerativeFunctions24JsonObjectFieldContainerOwst_0(a1, a2, 1, v2);
}

unint64_t sub_23CA4A85C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return v1
       + ((*(unsigned __int8 *)(a1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(a1 + 80))
       + *(_QWORD *)(a1 + 72) * v2;
}

uint64_t sub_23CA4A878()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[27] + 8))(v0[31], v0[26]);
}

uint64_t sub_23CA4A88C()
{
  return type metadata accessor for FieldStreamingSupport(0);
}

uint64_t sub_23CA4A894()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_23CA4A89C()
{
  return sub_23CA4B0B4();
}

void sub_23CA4A8A8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_23CA4A8BC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4A8C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

BOOL sub_23CA4A8DC(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_23CA4A8F8(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23CA44E1C(a1, v1);
}

uint64_t sub_23CA4A900(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void sub_23CA4A908(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23CA47334(a1, a2, v2);
}

uint64_t sub_23CA4A910()
{
  return swift_task_dealloc();
}

unint64_t sub_23CA4A930()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 96);
  *(_QWORD *)(v0 - 88) = v1;
  return 0xD000000000000056;
}

uint64_t sub_23CA4A948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return *(_QWORD *)(v2 + 56) + *(_QWORD *)(a2 + 72) * a1;
}

void sub_23CA4A958(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

uint64_t sub_23CA4A960()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4A984(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23CA22494(a3);
}

uint64_t sub_23CA4A994(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 328) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 264);
}

uint64_t sub_23CA4A9AC()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t sub_23CA4A9BC()
{
  return sub_23CA4B600();
}

uint64_t sub_23CA4A9C4()
{
  uint64_t v0;

  return sub_23CA245D8(*(_QWORD *)(v0 + 1360), *(_QWORD *)(v0 + 1368), *(_BYTE *)(v0 + 137));
}

uint64_t sub_23CA4A9D4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23CA4AA14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 216) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 152);
}

uint64_t sub_23CA4AA60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_23CA4AA68(uint64_t a1)
{
  uint64_t *v1;

  sub_23CA49D50(a1, v1);
}

uint64_t sub_23CA4AA70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4AA78()
{
  uint64_t v0;

  return v0;
}

void sub_23CA4AA84(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = 1;
}

uint64_t sub_23CA4AA9C()
{
  return swift_arrayDestroy();
}

void sub_23CA4AAA4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t sub_23CA4AAAC()
{
  return sub_23CA4B6CC();
}

uint64_t sub_23CA4AABC()
{
  return sub_23CA4B570();
}

uint64_t sub_23CA4AADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23CA4AB04()
{
  return sub_23CA4B5DC();
}

uint64_t sub_23CA4AB0C()
{
  return sub_23CA4B588();
}

uint64_t sub_23CA4AB2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_23CA4AB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t sub_23CA4AB4C()
{
  return swift_task_alloc();
}

uint64_t sub_23CA4AB54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23CA4AB64()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4AB74()
{
  uint64_t v0;

  return sub_23CA49CFC(v0);
}

uint64_t sub_23CA4AB8C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4AB94()
{
  return sub_23CA4B5DC();
}

uint64_t sub_23CA4AB9C()
{
  return swift_bridgeObjectRelease();
}

void sub_23CA4ABB4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23CA44E1C(a1, v1);
}

void sub_23CA4ABBC(uint64_t a1)
{
  uint64_t *v1;

  sub_23CA49D50(a1, v1);
}

uint64_t sub_23CA4ABC4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4ABCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return a19;
}

uint64_t sub_23CA4ABD8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23CA4ABE0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_23CA4ABFC()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_23CA4AC08()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4AC10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

void sub_23CA4AC1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 96);
  *(_QWORD *)(v0 - 88) = v1;
}

uint64_t sub_23CA4AC30()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4AC3C()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4AC44()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t sub_23CA4AC50()
{
  return sub_23CA4B600();
}

uint64_t sub_23CA4AC64()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_23CA4AC6C@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_23CA4AC80()
{
  return sub_23CA4B600();
}

uint64_t sub_23CA4AC88()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA4AC90()
{
  return swift_retain();
}

void sub_23CA4ACAC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23CA44E1C(v2, a2);
}

void sub_23CA4ACB4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = v3;
}

unint64_t sub_23CA4ACC8(uint64_t a1)
{
  uint64_t v1;

  return sub_23CA25314(a1, v1);
}

void sub_23CA4ACD4()
{
  JUMPOUT(0x24262A1B4);
}

uint64_t sub_23CA4ACE0()
{
  return sub_23CA4B57C();
}

uint64_t sub_23CA4ACEC()
{
  return sub_23CA4B57C();
}

uint64_t sub_23CA4ACF8()
{
  return sub_23CA4B6CC();
}

void sub_23CA4AD04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23CA46198(a1, a2, v2);
}

uint64_t sub_23CA4AD0C(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_23CA32114(a1, a2, 1, v2);
}

uint64_t sub_23CA4AD18()
{
  return sub_23CA4B288();
}

uint64_t sub_23CA4AD20()
{
  return 0;
}

uint64_t sub_23CA4AD34()
{
  return sub_23CA4B4EC();
}

uint64_t sub_23CA4AD3C()
{
  uint64_t v0;

  return sub_23CA42618(v0);
}

uint64_t sub_23CA4AD48()
{
  return swift_release();
}

uint64_t sub_23CA4AD50()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23CA4AD64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23CA48520(v1, a1);
}

void sub_23CA4AD70(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23CA4402C(v3, a2, a3);
}

void sub_23CA4AD78(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23CA47334(v4, v3, a3);
}

uint64_t sub_23CA4AD84()
{
  return swift_arrayDestroy();
}

uint64_t sub_23CA4ADA4()
{
  return swift_task_dealloc();
}

uint64_t sub_23CA4ADB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CA4ADB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t TokenStreamProcessorCloser.init(streamer:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA2DB60(a1, a2);
}

Swift::Void __swiftcall TokenStreamProcessorCloser.stopStream()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  sub_23CA1F350(v0, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

uint64_t dispatch thunk of TokenStreamProcessor.startStreaming(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of TokenStreamProcessor.stopStreaming()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TokenStreamProcessor.stream<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 32)
                                                                                     + *(_QWORD *)(a6 + 32));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23CA1EAE4;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t initializeBufferWithCopyOfBuffer for TokenStreamProcessorCloser(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for TokenStreamProcessorCloser(uint64_t *a1, uint64_t *a2)
{
  sub_23CA392A8(a1, a2);
  return a1;
}

__n128 initializeWithTake for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TokenStreamProcessorCloser(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  _s19GenerativeFunctions26TokenStreamProcessorCloserVwxx_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenStreamProcessorCloser(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for TokenStreamProcessorCloser(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenStreamProcessorCloser()
{
  return &type metadata for TokenStreamProcessorCloser;
}

uint64_t sub_23CA4B084()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23CA4B090()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23CA4B09C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23CA4B0A8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23CA4B0B4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23CA4B0C0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23CA4B0CC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23CA4B0D8()
{
  return MEMORY[0x24BE3B0C8]();
}

uint64_t sub_23CA4B0E4()
{
  return MEMORY[0x24BE3B0D8]();
}

uint64_t sub_23CA4B0F0()
{
  return MEMORY[0x24BE3B0E8]();
}

uint64_t sub_23CA4B0FC()
{
  return MEMORY[0x24BE3B0F8]();
}

uint64_t sub_23CA4B108()
{
  return MEMORY[0x24BE3B498]();
}

uint64_t sub_23CA4B114()
{
  return MEMORY[0x24BE3B4A0]();
}

uint64_t sub_23CA4B120()
{
  return MEMORY[0x24BE3B5C0]();
}

uint64_t sub_23CA4B12C()
{
  return MEMORY[0x24BE3B5C8]();
}

uint64_t sub_23CA4B138()
{
  return MEMORY[0x24BE3B5D8]();
}

uint64_t sub_23CA4B144()
{
  return MEMORY[0x24BE3B648]();
}

uint64_t sub_23CA4B150()
{
  return MEMORY[0x24BE3B6A0]();
}

uint64_t sub_23CA4B15C()
{
  return MEMORY[0x24BE3B6A8]();
}

uint64_t sub_23CA4B168()
{
  return MEMORY[0x24BE3B6B0]();
}

uint64_t sub_23CA4B174()
{
  return MEMORY[0x24BE3B708]();
}

uint64_t sub_23CA4B180()
{
  return MEMORY[0x24BE3B728]();
}

uint64_t sub_23CA4B18C()
{
  return MEMORY[0x24BE3B748]();
}

uint64_t sub_23CA4B198()
{
  return MEMORY[0x24BE3B750]();
}

uint64_t sub_23CA4B1A4()
{
  return MEMORY[0x24BE3B770]();
}

uint64_t sub_23CA4B1B0()
{
  return MEMORY[0x24BE3B788]();
}

uint64_t sub_23CA4B1BC()
{
  return MEMORY[0x24BE3B7A0]();
}

uint64_t sub_23CA4B1C8()
{
  return MEMORY[0x24BE3B7B8]();
}

uint64_t sub_23CA4B1D4()
{
  return MEMORY[0x24BE3B7D0]();
}

uint64_t sub_23CA4B1E0()
{
  return MEMORY[0x24BE3B7F0]();
}

uint64_t sub_23CA4B1EC()
{
  return MEMORY[0x24BE3B800]();
}

uint64_t sub_23CA4B1F8()
{
  return MEMORY[0x24BE3B820]();
}

uint64_t sub_23CA4B204()
{
  return MEMORY[0x24BE3B838]();
}

uint64_t sub_23CA4B210()
{
  return MEMORY[0x24BE3B840]();
}

uint64_t sub_23CA4B21C()
{
  return MEMORY[0x24BE3B860]();
}

uint64_t sub_23CA4B228()
{
  return MEMORY[0x24BE3B870]();
}

uint64_t sub_23CA4B234()
{
  return MEMORY[0x24BE3B880]();
}

uint64_t sub_23CA4B240()
{
  return MEMORY[0x24BE3B898]();
}

uint64_t sub_23CA4B24C()
{
  return MEMORY[0x24BE3B8B8]();
}

uint64_t sub_23CA4B258()
{
  return MEMORY[0x24BE3B8C0]();
}

uint64_t sub_23CA4B264()
{
  return MEMORY[0x24BE3B958]();
}

uint64_t sub_23CA4B270()
{
  return MEMORY[0x24BE3B968]();
}

uint64_t sub_23CA4B27C()
{
  return MEMORY[0x24BE3B970]();
}

uint64_t sub_23CA4B288()
{
  return MEMORY[0x24BE3B9A0]();
}

uint64_t sub_23CA4B294()
{
  return MEMORY[0x24BE3BA00]();
}

uint64_t sub_23CA4B2A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23CA4B2AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23CA4B2B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23CA4B2C4()
{
  return MEMORY[0x24BE7A7C0]();
}

uint64_t sub_23CA4B2D0()
{
  return MEMORY[0x24BE7A7E0]();
}

uint64_t sub_23CA4B2DC()
{
  return MEMORY[0x24BE7A800]();
}

uint64_t sub_23CA4B2E8()
{
  return MEMORY[0x24BE7A898]();
}

uint64_t sub_23CA4B2F4()
{
  return MEMORY[0x24BE7A8B0]();
}

uint64_t sub_23CA4B300()
{
  return MEMORY[0x24BE7AB88]();
}

uint64_t sub_23CA4B30C()
{
  return MEMORY[0x24BE7ACA8]();
}

uint64_t sub_23CA4B318()
{
  return MEMORY[0x24BE7ACB0]();
}

uint64_t sub_23CA4B324()
{
  return MEMORY[0x24BE7ACE8]();
}

uint64_t sub_23CA4B330()
{
  return MEMORY[0x24BE7ACF0]();
}

uint64_t sub_23CA4B33C()
{
  return MEMORY[0x24BE7ACF8]();
}

uint64_t sub_23CA4B348()
{
  return MEMORY[0x24BE7AD10]();
}

uint64_t sub_23CA4B354()
{
  return MEMORY[0x24BE7AD20]();
}

uint64_t sub_23CA4B360()
{
  return MEMORY[0x24BE7AD30]();
}

uint64_t sub_23CA4B36C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23CA4B378()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23CA4B384()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_23CA4B390()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_23CA4B39C()
{
  return MEMORY[0x24BEE06F0]();
}

uint64_t sub_23CA4B3A8()
{
  return MEMORY[0x24BEE06F8]();
}

uint64_t sub_23CA4B3B4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23CA4B3C0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23CA4B3CC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23CA4B3D8()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23CA4B3E4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23CA4B3F0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23CA4B3FC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23CA4B408()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_23CA4B414()
{
  return MEMORY[0x24BEE0BA0]();
}

uint64_t sub_23CA4B420()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23CA4B42C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_23CA4B438()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23CA4B444()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23CA4B450()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23CA4B45C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23CA4B468()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23CA4B474()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23CA4B480()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23CA4B48C()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23CA4B498()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23CA4B4A4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23CA4B4B0()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_23CA4B4BC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23CA4B4C8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23CA4B4D4()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_23CA4B4E0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23CA4B4EC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23CA4B4F8()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23CA4B504()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t sub_23CA4B510()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23CA4B51C()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_23CA4B528()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_23CA4B534()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23CA4B540()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t sub_23CA4B54C()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t sub_23CA4B558()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_23CA4B564()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t sub_23CA4B570()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_23CA4B57C()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_23CA4B588()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_23CA4B594()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_23CA4B5A0()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_23CA4B5AC()
{
  return MEMORY[0x24BEE6CF8]();
}

uint64_t sub_23CA4B5B8()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_23CA4B5C4()
{
  return MEMORY[0x24BEE6D20]();
}

uint64_t sub_23CA4B5D0()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_23CA4B5DC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23CA4B5E8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23CA4B5F4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23CA4B600()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23CA4B60C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23CA4B618()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23CA4B624()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23CA4B630()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23CA4B63C()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23CA4B648()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23CA4B654()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23CA4B660()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23CA4B66C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23CA4B678()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23CA4B684()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23CA4B690()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23CA4B69C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23CA4B6A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23CA4B6B4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23CA4B6C0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23CA4B6CC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23CA4B6D8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23CA4B6E4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23CA4B6F0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23CA4B6FC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23CA4B708()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23CA4B714()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23CA4B720()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23CA4B72C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23CA4B738()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23CA4B744()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23CA4B750()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23CA4B75C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23CA4B768()
{
  return MEMORY[0x24BEE4810]();
}

uint64_t sub_23CA4B774()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23CA4B780()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23CA4B78C()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

