uint64_t sub_19CFC0FA4(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for JSSource, &qword_1EE43E3F8, (uint64_t)&unk_1E3DEE028, (uint64_t)sub_19CFC327C);
}

uint64_t sub_19CFC0FC8(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v24[2];
  uint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  __int128 v30;
  char v31;

  v9 = v5;
  v11 = a2(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)v24 - v14;
  sub_19CCF8C5C(v9, (uint64_t)v29, a3);
  v16 = v29[0];
  if ((v31 & 1) != 0)
  {
    sub_19CCFECEC(a1, (uint64_t)v15, a2);
    sub_19CCFE8AC((uint64_t)v15, *(_QWORD *)(*(_QWORD *)(v16 + 64) + 40), a2);
    return swift_continuation_throwingResume();
  }
  else
  {
    v18 = v29[1];
    swift_release();
    sub_19CCD14C4(&v30, (uint64_t)v26);
    v25 = a5;
    v20 = v27;
    v19 = v28;
    v24[1] = __swift_project_boxed_opaque_existential_1(v26, v27);
    sub_19CCFECEC(a1, (uint64_t)v15, a2);
    v21 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v16;
    *(_QWORD *)(v22 + 24) = v18;
    sub_19CCFE8AC((uint64_t)v15, v22 + v21, a2);
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8);
    swift_retain();
    v23(v25, v22, v20, v19);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  }
}

uint64_t sub_19CFC1150(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  id v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  __int128 v22;
  char v23;

  v4 = v3;
  sub_19CCF8C5C(v4, (uint64_t)v21, &qword_1ECEB0920);
  v8 = v21[0];
  if ((v23 & 1) != 0)
  {
    sub_19CD3BE5C(a1, a2);
    v9 = *(uint64_t **)(*(_QWORD *)(v8 + 64) + 40);
    *v9 = a1;
    v9[1] = a2;
    v9[2] = (uint64_t)a3;
    v10 = a3;
    return swift_continuation_throwingResume();
  }
  else
  {
    v12 = v21[1];
    swift_release();
    sub_19CCD14C4(&v22, (uint64_t)v18);
    v13 = v19;
    v14 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = v8;
    v15[3] = v12;
    v15[4] = a1;
    v15[5] = a2;
    v15[6] = a3;
    v16 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v14 + 8);
    sub_19CD3BE5C(a1, a2);
    v17 = a3;
    swift_retain();
    v16(sub_19CFC2BCC, v15, v13, v14);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }
}

uint64_t sub_19CFC1290(uint64_t a1)
{
  return sub_19CFC12AC(a1, &qword_1EE43E4B0, (uint64_t)&unk_1E3DEEA78, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC12AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(uint64_t, _QWORD *, uint64_t, uint64_t);
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  __int128 v19;
  char v20;

  v6 = v4;
  sub_19CCF8C5C(v6, (uint64_t)v18, a2);
  v8 = v18[0];
  if ((v20 & 1) != 0)
  {
    **(_QWORD **)(*(_QWORD *)(v18[0] + 64) + 40) = a1;
    swift_retain();
    return swift_continuation_throwingResume();
  }
  else
  {
    v10 = v18[1];
    swift_release();
    sub_19CCD14C4(&v19, (uint64_t)v15);
    v11 = v16;
    v12 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v8;
    v13[3] = v10;
    v13[4] = a1;
    v14 = *(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v12 + 8);
    swift_retain();
    swift_retain();
    v14(a4, v13, v11, v12);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  }
}

uint64_t sub_19CFC13C0(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for JSResponse, &qword_1ECEB1270, (uint64_t)&unk_1E3DEDC40, (uint64_t)sub_19CD46E68);
}

uint64_t sub_19CFC13E4(uint64_t a1)
{
  return sub_19CFC1C70(a1, &qword_1ECEB2208, &qword_1ECEB1278, (uint64_t)&unk_1E3DEE7A8, (uint64_t)sub_19CFC37B8);
}

uint64_t sub_19CFC1408(void *a1)
{
  return sub_19CD4E9E8(a1, &qword_1ECEB12A0, (uint64_t)&unk_1E3DEE190, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC1424(uint64_t a1)
{
  return sub_19CFC0E74(a1, &qword_1EE43E488, (uint64_t)&unk_1E3DEE7F8, (void (*)(_BYTE *, uint64_t))sub_19CCD14C4, (uint64_t)sub_19CD17114);
}

uint64_t sub_19CFC1448(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  __int128 v19;
  char v20;

  sub_19CCF8C5C(v2, (uint64_t)v18, &qword_1EE43E490);
  v5 = v18[0];
  if ((v20 & 1) != 0)
  {
    v14 = a1;
    v15 = a2 & 1;
    sub_19CFC3870(&v14, *(_QWORD *)(*(_QWORD *)(v18[0] + 64) + 40));
    return swift_continuation_throwingResume();
  }
  else
  {
    v7 = v18[1];
    swift_release();
    sub_19CCD14C4(&v19, (uint64_t)&v14);
    v8 = v16;
    v9 = v17;
    __swift_project_boxed_opaque_existential_1(&v14, v16);
    v12 = a1;
    v13 = a2 & 1;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v5;
    *(_QWORD *)(v10 + 24) = v7;
    sub_19CFC3870(&v12, v10 + 32);
    v11 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 8);
    swift_retain();
    v11(sub_19CFC38D0, v10, v8, v9);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v14);
  }
}

uint64_t sub_19CFC1574(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for PageIntentInstrumentation, (uint64_t *)&unk_1EE43E4A0, (uint64_t)&unk_1E3DEE898, (uint64_t)sub_19CFC38D8);
}

uint64_t sub_19CFC1598(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  __int128 v14;
  char v15;

  sub_19CCF8C5C(v1, (uint64_t)v13, &qword_1EE439CD0);
  v3 = v13[0];
  if ((v15 & 1) != 0)
  {
    **(_BYTE **)(*(_QWORD *)(v13[0] + 64) + 40) = a1 & 1;
    return swift_continuation_throwingResume();
  }
  else
  {
    v5 = v13[1];
    swift_release();
    sub_19CCD14C4(&v14, (uint64_t)v10);
    v6 = v11;
    v7 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v3;
    *(_QWORD *)(v8 + 24) = v5;
    *(_BYTE *)(v8 + 32) = a1 & 1;
    v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 8);
    swift_retain();
    v9(sub_19CFC32D8, v8, v6, v7);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
}

uint64_t sub_19CFC16A0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  char v16;

  v2 = v1;
  sub_19CCF8C5C(v2, (uint64_t)v14, &qword_1EE43BB60);
  v4 = v14[0];
  if ((v16 & 1) != 0)
  {
    **(_BYTE **)(*(_QWORD *)(v14[0] + 64) + 40) = a1 & 1;
    return swift_continuation_throwingResume();
  }
  else
  {
    v6 = v14[1];
    swift_release();
    sub_19CCD14C4(&v15, (uint64_t)v11);
    v7 = v12;
    v8 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v4;
    *(_QWORD *)(v9 + 24) = v6;
    *(_BYTE *)(v9 + 32) = a1 & 1;
    v10 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v8 + 8);
    swift_retain();
    v10(sub_19CFC32D8, v9, v7, v8);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  }
}

uint64_t sub_19CFC17B0(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  _OWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void (*v12)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[3];
  __int128 v17;
  char v18;

  sub_19CCF8C5C(v1, (uint64_t)v16, (uint64_t *)&unk_1ECEB0180);
  v3 = v16[0];
  if ((v18 & 1) != 0)
  {
    v4 = a1[1];
    v13 = *a1;
    v14 = v4;
    v15 = a1[2];
    sub_19CCEC5FC((uint64_t)a1);
    v5 = *(_OWORD **)(*(_QWORD *)(v3 + 64) + 40);
    *v5 = v13;
    v5[1] = v14;
    v5[2] = v15;
    return swift_continuation_throwingResume();
  }
  else
  {
    v7 = v16[1];
    swift_release();
    sub_19CCD14C4(&v17, (uint64_t)&v13);
    v8 = *((_QWORD *)&v14 + 1);
    v9 = v15;
    __swift_project_boxed_opaque_existential_1(&v13, *((uint64_t *)&v14 + 1));
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v3;
    *(_QWORD *)(v10 + 24) = v7;
    v11 = a1[1];
    *(_OWORD *)(v10 + 32) = *a1;
    *(_OWORD *)(v10 + 48) = v11;
    *(_OWORD *)(v10 + 64) = a1[2];
    v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 8);
    sub_19CCEC5FC((uint64_t)a1);
    swift_retain();
    v12(sub_19CFC3A0C, v10, v8, v9);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v13);
  }
}

uint64_t sub_19CFC18F4(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  char v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  char v16;

  sub_19CCF8C5C(v1, (uint64_t)v14, &qword_1EE43BE60);
  v3 = v14[0];
  if ((v16 & 1) != 0)
  {
    LOBYTE(v11[0]) = a1;
    sub_19CCC290C((uint64_t)v11, *(_QWORD *)(*(_QWORD *)(v14[0] + 64) + 40), &qword_1EE43BE90);
    return swift_continuation_throwingResume();
  }
  else
  {
    v5 = v14[1];
    swift_release();
    sub_19CCD14C4(&v15, (uint64_t)v11);
    v6 = v12;
    v7 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    v10 = a1;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v3;
    *(_QWORD *)(v8 + 24) = v5;
    sub_19CCC290C((uint64_t)&v10, v8 + 32, &qword_1EE43BE90);
    v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 8);
    swift_retain();
    v9(sub_19CFC32DC, v8, v6, v7);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  }
}

uint64_t sub_19CFC1A1C(uint64_t *a1)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void (*v23)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  char v29;

  v2 = v1;
  v4 = *a1;
  v3 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v8 = a1[4];
  v7 = a1[5];
  v9 = a1[7];
  v21 = a1[6];
  v22 = *((_BYTE *)a1 + 64);
  v11 = a1[9];
  v10 = a1[10];
  v12 = a1[11];
  sub_19CCF8C5C(v2, (uint64_t)v27, (uint64_t *)&unk_1ECEB03A0);
  v13 = v27[0];
  if ((v29 & 1) != 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(v27[0] + 64) + 40);
    *(_QWORD *)v14 = v4;
    *(_QWORD *)(v14 + 8) = v3;
    *(_QWORD *)(v14 + 16) = v5;
    *(_QWORD *)(v14 + 24) = v6;
    *(_QWORD *)(v14 + 32) = v8;
    *(_QWORD *)(v14 + 40) = v7;
    *(_QWORD *)(v14 + 48) = v21;
    *(_QWORD *)(v14 + 56) = v9;
    *(_BYTE *)(v14 + 64) = v22;
    *(_QWORD *)(v14 + 72) = v11;
    *(_QWORD *)(v14 + 80) = v10;
    *(_QWORD *)(v14 + 88) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_continuation_throwingResume();
  }
  else
  {
    v19 = v27[1];
    swift_release();
    sub_19CCD14C4(&v28, (uint64_t)v24);
    v20 = v25;
    v18 = v5;
    v16 = v26;
    __swift_project_boxed_opaque_existential_1(v24, v25);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v13;
    *(_QWORD *)(v17 + 24) = v19;
    *(_QWORD *)(v17 + 32) = v4;
    *(_QWORD *)(v17 + 40) = v3;
    *(_QWORD *)(v17 + 48) = v18;
    *(_QWORD *)(v17 + 56) = v6;
    *(_QWORD *)(v17 + 64) = v8;
    *(_QWORD *)(v17 + 72) = v7;
    *(_QWORD *)(v17 + 80) = v21;
    *(_QWORD *)(v17 + 88) = v9;
    *(_BYTE *)(v17 + 96) = v22;
    *(_QWORD *)(v17 + 104) = v11;
    *(_QWORD *)(v17 + 112) = v10;
    *(_QWORD *)(v17 + 120) = v12;
    v23 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v16 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23(sub_19CFC39A4, v17, v20, v16);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
}

uint64_t sub_19CFC1C0C(void *a1)
{
  return sub_19CD4E9E8(a1, &qword_1EE437390, (uint64_t)&unk_1E3DEE348, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC1C28(uint64_t a1)
{
  return sub_19CFC0E74(a1, (uint64_t *)&unk_1EE440D50, (uint64_t)&unk_1E3DEE6E0, (void (*)(_BYTE *, uint64_t))sub_19CCD14C4, (uint64_t)sub_19CD17114);
}

uint64_t sub_19CFC1C4C(uint64_t a1)
{
  return sub_19CFC1C70(a1, (uint64_t *)&unk_1ECEB3030, &qword_1ECEB0C60, (uint64_t)&unk_1E3DEDC90, (uint64_t)sub_19CFC2EEC);
}

uint64_t sub_19CFC1C70(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  char v29;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10, v13);
  sub_19CCF8C5C(v5, (uint64_t)v27, a3);
  v14 = v27[0];
  if ((v29 & 1) != 0)
  {
    sub_19CCF8C5C(a1, (uint64_t)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
    sub_19CCC290C((uint64_t)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(*(_QWORD *)(v14 + 64) + 40), a2);
    return swift_continuation_throwingResume();
  }
  else
  {
    v16 = v27[1];
    swift_release();
    sub_19CCD14C4(&v28, (uint64_t)v24);
    v23 = a5;
    v18 = v25;
    v17 = v26;
    v22[1] = __swift_project_boxed_opaque_existential_1(v24, v25);
    sub_19CCF8C5C(a1, (uint64_t)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
    v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v14;
    *(_QWORD *)(v20 + 24) = v16;
    sub_19CCC290C((uint64_t)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, a2);
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
    swift_retain();
    v21(v23, v20, v18, v17);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
}

uint64_t sub_19CFC1DF8(void *a1)
{
  return sub_19CD4E9E8(a1, &qword_1ECEB0720, (uint64_t)&unk_1E3DEDCB8, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC1E14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  void (*v15)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  __int128 v25;
  char v26;

  sub_19CCF8C5C(v1, (uint64_t)v24, (uint64_t *)&unk_1EE440D30);
  v3 = v24[0];
  if ((v26 & 1) != 0)
  {
    sub_19CD60F34(a1, (uint64_t)&v19);
    v4 = *(_OWORD **)(*(_QWORD *)(v3 + 64) + 40);
    *v4 = v19;
    v6 = v22;
    v5 = v23;
    v7 = v21;
    v4[1] = v20;
    v4[2] = v7;
    v4[3] = v6;
    v4[4] = v5;
    return swift_continuation_throwingResume();
  }
  else
  {
    v9 = v24[1];
    swift_release();
    sub_19CCD14C4(&v25, (uint64_t)v16);
    v10 = v17;
    v11 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    sub_19CD60F34(a1, (uint64_t)&v19);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v3;
    *(_QWORD *)(v12 + 24) = v9;
    v13 = v22;
    *(_OWORD *)(v12 + 64) = v21;
    *(_OWORD *)(v12 + 80) = v13;
    *(_OWORD *)(v12 + 96) = v23;
    v14 = v20;
    *(_OWORD *)(v12 + 32) = v19;
    *(_OWORD *)(v12 + 48) = v14;
    v15 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v11 + 8);
    swift_retain();
    v15(sub_19CD17118, v12, v10, v11);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
}

uint64_t sub_19CFC1F58(uint64_t a1)
{
  return sub_19CFC0E74(a1, (uint64_t *)&unk_1EE440D40, (uint64_t)&unk_1E3DEE690, (void (*)(_BYTE *, uint64_t))sub_19CCD14C4, (uint64_t)sub_19CD17118);
}

uint64_t sub_19CFC1F7C(void *a1)
{
  return sub_19CD4E9E8(a1, (uint64_t *)&unk_1EE43E440, (uint64_t)&unk_1E3DEE5A0, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC1F98(uint64_t a1)
{
  return sub_19CFC12AC(a1, qword_1EE443B00, (uint64_t)&unk_1E3DEE5F0, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC1FB4(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for DiskJetPackResourceBundle, (uint64_t *)&unk_1EE43B520, (uint64_t)&unk_1E3DEDE70, (uint64_t)sub_19CD4DBD4);
}

uint64_t sub_19CFC1FD8(uint64_t a1)
{
  return sub_19CFC0FC8(a1, type metadata accessor for JetPackAsset, (uint64_t *)&unk_1EE440D00, (uint64_t)&unk_1E3DEE4B0, (uint64_t)sub_19CFC35D0);
}

uint64_t sub_19CFC1FFC(uint64_t a1)
{
  return sub_19CFC2044(a1, (uint64_t *)&unk_1EE440D20, (void (*)(uint64_t, __int128 *))sub_19CCD6834, (uint64_t)&unk_1E3DEE550, (uint64_t)sub_19CD17118);
}

uint64_t sub_19CFC2020(uint64_t a1)
{
  return sub_19CFC2044(a1, (uint64_t *)&unk_1EE440D10, (void (*)(uint64_t, __int128 *))sub_19CCD6780, (uint64_t)&unk_1E3DEE500, (uint64_t)sub_19CD17114);
}

uint64_t sub_19CFC2044(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, __int128 *), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  __int128 v29;
  char v30;

  sub_19CCF8C5C(v5, (uint64_t)v28, a2);
  v9 = v28[0];
  if ((v30 & 1) != 0)
  {
    a3(a1, &v24);
    v10 = *(_QWORD *)(*(_QWORD *)(v9 + 64) + 40);
    v11 = v24;
    v12 = v25;
    v13 = v26;
    *(_QWORD *)(v10 + 48) = v27;
    *(_OWORD *)(v10 + 16) = v12;
    *(_OWORD *)(v10 + 32) = v13;
    *(_OWORD *)v10 = v11;
    return swift_continuation_throwingResume();
  }
  else
  {
    v15 = v28[1];
    swift_release();
    sub_19CCD14C4(&v29, (uint64_t)v21);
    v16 = v22;
    v17 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    a3(a1, &v24);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v9;
    *(_QWORD *)(v18 + 24) = v15;
    v19 = v25;
    *(_OWORD *)(v18 + 32) = v24;
    *(_OWORD *)(v18 + 48) = v19;
    *(_OWORD *)(v18 + 64) = v26;
    *(_QWORD *)(v18 + 80) = v27;
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
    swift_retain();
    v20(a5, v18, v16, v17);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  }
}

uint64_t sub_19CFC2198(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for JSPackageIndex, (uint64_t *)&unk_1EE443AF0, (uint64_t)&unk_1E3DEE3C0, (uint64_t)sub_19CFC3478);
}

uint64_t sub_19CFC21BC(void *a1)
{
  return sub_19CD4E9E8(a1, qword_1EE43B200, (uint64_t)&unk_1E3DEE078, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC21D8(uint64_t a1)
{
  return sub_19CFC022C(a1, &qword_1EE436F90, (uint64_t)&unk_1E3DEE230, (void (*)(uint64_t))MEMORY[0x1E0DEEB18], (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC21FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  char v21;

  v4 = v3;
  sub_19CCF8C5C(v4, (uint64_t)v19, &qword_1EE4371B0);
  v8 = v19[0];
  if ((v21 & 1) != 0)
  {
    sub_19CDC2D64(a1);
    v9 = *(uint64_t **)(*(_QWORD *)(v8 + 64) + 40);
    *v9 = a1;
    v9[1] = a2;
    v9[2] = a3;
    swift_bridgeObjectRetain();
    return swift_continuation_throwingResume();
  }
  else
  {
    v11 = v19[1];
    swift_release();
    sub_19CCD14C4(&v20, (uint64_t)v16);
    v12 = v17;
    v13 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v8;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = a2;
    v14[6] = a3;
    v15 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v13 + 8);
    sub_19CDC2D64(a1);
    swift_bridgeObjectRetain();
    swift_retain();
    v15(sub_19CFC2BCC, v14, v12, v13);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
}

uint64_t sub_19CFC2344(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _QWORD v13[2];
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  __int128 v18;
  char v19;

  v3 = v2;
  sub_19CCF8C5C(v3, (uint64_t)v17, &qword_1EE436F88);
  v6 = v17[0];
  if ((v19 & 1) != 0)
  {
    v14[0] = a1;
    v14[1] = a2;
    sub_19CDC2D64(a1);
    sub_19CCC290C((uint64_t)v14, *(_QWORD *)(*(_QWORD *)(v6 + 64) + 40), (uint64_t *)&unk_1EE4371A0);
    return swift_continuation_throwingResume();
  }
  else
  {
    v8 = v17[1];
    swift_release();
    sub_19CCD14C4(&v18, (uint64_t)v14);
    v9 = v15;
    v10 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v13[0] = a1;
    v13[1] = a2;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v6;
    *(_QWORD *)(v11 + 24) = v8;
    sub_19CCC290C((uint64_t)v13, v11 + 32, (uint64_t *)&unk_1EE4371A0);
    v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v10 + 8);
    sub_19CDC2D64(a1);
    swift_retain();
    v12(sub_19CD18398, v11, v9, v10);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  }
}

uint64_t sub_19CFC248C(uint64_t a1)
{
  return sub_19CFC12AC(a1, (uint64_t *)&unk_1EE43E3E0, (uint64_t)&unk_1E3DEDBF0, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC24A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  char v21;

  v4 = v3;
  sub_19CCF8C5C(v4, (uint64_t)v19, (uint64_t *)&unk_1EE43E3C0);
  v8 = v19[0];
  if ((v21 & 1) != 0)
  {
    v9 = *(_QWORD **)(*(_QWORD *)(v19[0] + 64) + 40);
    *v9 = a1;
    v9[1] = a2;
    v9[2] = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_continuation_throwingResume();
  }
  else
  {
    v11 = v19[1];
    swift_release();
    sub_19CCD14C4(&v20, (uint64_t)v16);
    v12 = v17;
    v13 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v8;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = a2;
    v14[6] = a3;
    v15 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v13 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v15(sub_19CFC2BCC, v14, v12, v13);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
}

uint64_t sub_19CFC25F8(void *a1)
{
  return sub_19CD4E9E8(a1, &qword_1ECEB0700, (uint64_t)&unk_1E3DEDDF8, (uint64_t)sub_19CD1895C);
}

uint64_t sub_19CFC2614(uint64_t a1)
{
  return sub_19CFC022C(a1, &qword_1EE439FA0, (uint64_t)&unk_1E3DEDDA8, (void (*)(uint64_t))MEMORY[0x1E0DEEED0], (uint64_t)sub_19CD44C38);
}

uint64_t sub_19CFC2638(uint64_t a1)
{
  return sub_19CFC0FC8(a1, (uint64_t (*)(_QWORD))type metadata accessor for NetResponse, (uint64_t *)&unk_1EE43BE50, (uint64_t)&unk_1E3DED9C0, (uint64_t)sub_19CFC2A74);
}

uint64_t sub_19CFC265C(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0F10);
  v6 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v7 = swift_allocObject();
  v8 = MEMORY[0x1E0DEE9D8];
  *(_DWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 24) = v8;
  *(_BYTE *)(v6 + 32) = 0;
  v10 = *a1;
  sub_19CE7366C(&v10, a2, a3);
  sub_19CFBA2F4();
  return v6;
}

uint64_t sub_19CFC2704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0F10);
  v9 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  v11 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v9 + 16) = v10;
  *(_QWORD *)(v9 + 24) = v11;
  *(_BYTE *)(v9 + 32) = 0;
  v12 = *(void **)(v4 + 32);
  objc_msgSend(v12, sel_lock);
  sub_19CF4A6B0(v4, a3, a4, a1, a2);
  objc_msgSend(v12, sel_unlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_19CE268A8(a3, a4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19CFBA2F4();
  return v9;
}

uint64_t MetricsEventRecorder._recordAsync(_:on:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0F10);
  v10 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  v12 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v10 + 16) = v11;
  *(_QWORD *)(v10 + 24) = v12;
  *(_BYTE *)(v10 + 32) = 0;
  v14 = *a1;
  (*(void (**)(__int128 *, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8))(&v14, a2, a3, a4, a5);
  sub_19CFBA2F4();
  return v10;
}

uint64_t dispatch thunk of MetricsEventRecorder.record(_:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of MetricsEventRecorder._recordAsync(_:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_19CFC2904(__int128 *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  JetEngine::LintedMetricsEvent v9;
  Swift::String_optional v10;
  __int128 v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0F10);
  v6 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v7 = swift_allocObject();
  v8 = MEMORY[0x1E0DEE9D8];
  *(_DWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 24) = v8;
  *(_BYTE *)(v6 + 32) = 0;
  v12 = *a1;
  v9.fields._rawValue = &v12;
  v9.issues._rawValue = a2;
  v10.value._countAndFlagsBits = a3;
  AMSInMemoryMetricsEventRecorder.record(_:on:)(v9, v10);
  sub_19CFBA2F4();
  return v6;
}

uint64_t sub_19CFC29B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_19CFC2704(*a1, a1[1], a2, a3);
}

uint64_t dispatch thunk of MetricsEventRecorder.flush()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_19CFC29EC()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC29F8()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC2A08()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 56))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_19CFC2A3C()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2A48()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2A54()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2A64()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for MTMetricsIdentifier);
}

uint64_t sub_19CFC2A74()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for NetResponse);
}

uint64_t objectdestroy_25Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for NetResponse();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 32) & ~v2) + *(int *)(v1 + 36);
  v4 = sub_19CFDEDE0();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC2B68(uint64_t (*a1)(__int128 *), uint64_t a2, __int128 *a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  uint64_t v16;

  v3 = *((_QWORD *)a3 + 2);
  v4 = *((_QWORD *)a3 + 3);
  v5 = *((_BYTE *)a3 + 64);
  v6 = *((_QWORD *)a3 + 11);
  v9 = *a3;
  v10 = v3;
  v11 = v4;
  v7 = a3[3];
  v12 = a3[2];
  v13 = v7;
  v14 = v5;
  v15 = *(__int128 *)((char *)a3 + 72);
  v16 = v6;
  return a1(&v9);
}

uint64_t objectdestroy_32Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC2C10()
{
  uint64_t v0;
  uint64_t (*v1)(__int128 *);
  uint64_t v2;
  __int128 v4;
  uint64_t v5;

  v1 = *(uint64_t (**)(__int128 *))(v0 + 16);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = *(_OWORD *)(v0 + 32);
  v5 = v2;
  return v1(&v4);
}

uint64_t objectdestroy_42Tm()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  return swift_deallocObject();
}

uint64_t objectdestroy_49Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC2CC0()
{
  _QWORD *v0;
  uint64_t (*v1)(_QWORD *);
  uint64_t v2;
  _QWORD v4[2];

  v1 = (uint64_t (*)(_QWORD *))v0[2];
  v2 = v0[5];
  v4[0] = v0[4];
  v4[1] = v2;
  return v1(v4);
}

uint64_t sub_19CFC2CF8()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2D04()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t objectdestroy_22Tm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = type metadata accessor for MTMetricsIdentifier();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(v1 + 24);
  v6 = sub_19CFDEF84();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + *(int *)(v1 + 28), v6);
  return swift_deallocObject();
}

uint64_t sub_19CFC2DCC()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_77Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for JSResponse();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 32) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 20);
  v5 = sub_19CFDEA44();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = v3 + *(int *)(v1 + 24);
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1Tm(v3 + *(int *)(v1 + 24));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2208);
  v6(v7 + *(int *)(v8 + 28), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC2EDC()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC2EEC()
{
  return sub_19CD2E3EC((uint64_t *)&unk_1ECEB3030);
}

uint64_t objectdestroy_88Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3030) - 8)
                          + 80);
  v2 = (v1 + 32) & ~v1;
  swift_release();
  v3 = sub_19CFDEDE0();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_19CFC2FA4()
{
  return objectdestroy_102Tm((uint64_t (*)(_QWORD))type metadata accessor for InMemoryJetPackResourceBundle, (void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2FB8()
{
  return objectdestroy_102Tm((uint64_t (*)(_QWORD))type metadata accessor for InMemoryJetPackResourceBundle, (void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC2FCC()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t sub_19CFC2FD8()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t sub_19CFC2FE4()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t sub_19CFC2FF8()
{
  return objectdestroy_102Tm((uint64_t (*)(_QWORD))type metadata accessor for DiskJetPackResourceBundle, (void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC300C()
{
  return objectdestroy_102Tm((uint64_t (*)(_QWORD))type metadata accessor for DiskJetPackResourceBundle, (void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_102Tm(uint64_t (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1(0);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  swift_release();
  v6 = v2 + ((v5 + 32) & ~v5);
  swift_bridgeObjectRelease();
  a2(*(_QWORD *)(v6 + 8));
  v7 = v6 + *(int *)(v4 + 24);
  v8 = sub_19CFDEDE0();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return swift_deallocObject();
}

uint64_t sub_19CFC30E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFC3104()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFC3128()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC313C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for JSIntentResult();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = sub_19CFDEA44();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = v3 + *(int *)(v1 + 20);
  if (*(_QWORD *)(v6 + 24))
    __swift_destroy_boxed_opaque_existential_1Tm(v3 + *(int *)(v1 + 20));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2208);
  v5(v6 + *(int *)(v7 + 28), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC3220()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for JSIntentResult);
}

uint64_t sub_19CFC322C()
{
  return objectdestroy_156Tm((uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

uint64_t sub_19CFC3238()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

uint64_t objectdestroy_159Tm()
{
  uint64_t v0;

  swift_release();
  sub_19CD3BE18(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_19CFC327C()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for JSSource);
}

uint64_t sub_19CFC3290()
{
  return objectdestroy_156Tm((uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

uint64_t sub_19CFC32B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFC32DC()
{
  uint64_t v0;
  uint64_t (*v1)(char *);
  char v3;

  v1 = *(uint64_t (**)(char *))(v0 + 16);
  v3 = *(_BYTE *)(v0 + 32);
  return v1(&v3);
}

uint64_t sub_19CFC3314()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC3320()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t objectdestroy_217Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_214Tm()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_19CFC33B4(id result, uint64_t a2, char a3, uint64_t (*a4)(id))
{
  switch(a3)
  {
    case 0:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 1:
      result = (id)a4(result);
      break;
    case 2:
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void sub_19CFC33EC(id a1, uint64_t a2, char a3, void (*a4)(id))
{
  switch(a3)
  {
    case 0:
      swift_bridgeObjectRelease();
      break;
    case 1:
      a4(a1);
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t objectdestroy_224Tm()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_19CFC3464()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_19CFC3478()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for JSPackageIndex);
}

uint64_t objectdestroy_246Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JSPackageIndex() - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_release();
  v3 = sub_19CFDEDE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC3528()
{
  return objectdestroy_156Tm((uint64_t (*)(_QWORD))MEMORY[0x1E0CADF50]);
}

uint64_t sub_19CFC3534()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))MEMORY[0x1E0CADF50]);
}

uint64_t sub_19CFC3548()
{
  return objectdestroy_156Tm((uint64_t (*)(_QWORD))MEMORY[0x1E0CADF50]);
}

uint64_t objectdestroy_156Tm(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = a1(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t sub_19CFC35D0()
{
  return sub_19CD45B20(type metadata accessor for JetPackAsset);
}

uint64_t objectdestroy_267Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for JetPackAsset(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  v4 = v0 + v3;
  __swift_destroy_boxed_opaque_existential_1Tm(v4);
  v5 = v4 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = v5 + *(int *)(type metadata accessor for JetPackAsset.Metadata(0) + 24);
  v7 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_274Tm()
{
  _QWORD *v0;

  swift_release();
  sub_19CD4C0D4(v0[4], v0[5]);
  if (v0[9])
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 6));
  return swift_deallocObject();
}

uint64_t sub_19CFC3714()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC3720()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_302Tm()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  return swift_deallocObject();
}

uint64_t sub_19CFC377C()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 56) >= 2uLL)
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_19CFC37B8()
{
  return sub_19CD2E3EC(&qword_1ECEB2208);
}

uint64_t objectdestroy_333Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2208);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  if (*(_QWORD *)(v0 + v3 + 24))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + v3);
  v4 = v0 + v3 + *(int *)(v1 + 28);
  v5 = sub_19CFDEA44();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_19CFC3870(uint64_t *a1, uint64_t a2)
{
  __swift_memcpy9_8(a2, a1);
  return a2;
}

uint64_t sub_19CFC38AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFC38D8()
{
  return sub_19CD45B20((uint64_t (*)(_QWORD))type metadata accessor for PageIntentInstrumentation);
}

uint64_t objectdestroy_354Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PageIntentInstrumentation() - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_release();
  if (swift_getEnumCaseMultiPayload() <= 1)
  {
    v3 = sub_19CFDEF84();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);

    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_19CFC39A4()
{
  uint64_t v0;

  return sub_19CFC2B68(*(uint64_t (**)(__int128 *))(v0 + 16), *(_QWORD *)(v0 + 24), (__int128 *)(v0 + 32));
}

uint64_t objectdestroy_361Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_371Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFC3A48()
{
  uint64_t v0;
  uint64_t (*v1)(__int128 *);
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v1 = *(uint64_t (**)(__int128 *))(v0 + 16);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 32);
  v6 = v2;
  v7 = v3;
  v8 = *(_OWORD *)(v0 + 64);
  return v1(&v5);
}

uint64_t objectdestroy_388Tm()
{
  uint64_t v0;

  swift_release();
  sub_19CD3BE18(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));

  return swift_deallocObject();
}

uint64_t sub_19CFC3ACC()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_19CFC3AD8()
{
  return objectdestroy_7Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_166Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for JSSource();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 32) & ~v2) + *(int *)(v1 + 20);
  v4 = sub_19CFDEDE0();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  return swift_deallocObject();
}

_OWORD *sub_19CFC3BA0(uint64_t a1, _OWORD *a2)
{
  __swift_memcpy32_8(a2, a1);
  return a2;
}

uint64_t objectdestroy_413Tm()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 40) >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_19CFC3C24()
{
  uint64_t v0;
  uint64_t (*v1)(_OWORD *);
  __int128 v2;
  _OWORD v4[2];

  v1 = *(uint64_t (**)(_OWORD *))(v0 + 16);
  v2 = *(_OWORD *)(v0 + 48);
  v4[0] = *(_OWORD *)(v0 + 32);
  v4[1] = v2;
  return v1(v4);
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_19CFC3C94()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t *);
  char v2;
  uint64_t v4;
  char v5;

  v1 = *(uint64_t (**)(uint64_t *))(v0 + 16);
  v2 = *(_BYTE *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = v2;
  return v1(&v4);
}

_QWORD *IntentDispatchOptions.init(name:dependencies:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *v3;
  uint64_t v4;

  v4 = *a3;
  v3[3] = a1;
  v3[4] = a2;
  v3[2] = v4;
  return v3;
}

_QWORD *IntentDispatchOptions.__allocating_init(dispatcher:)(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 v8[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2F20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19D0522A0;
  sub_19CCD5B84(a1, (uint64_t)v8);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43DDA8);
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 64) = v3;
  v4 = swift_allocObject();
  *(_QWORD *)(inited + 40) = v4;
  sub_19CCD14C4(v8, v4 + 16);
  sub_19CD249F0();
  *(_QWORD *)&v8[0] = sub_19CFDF3F8();
  sub_19CD23D8C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v5 = *(_QWORD *)&v8[0];
  v6 = (_QWORD *)swift_allocObject();
  v6[3] = 0xD000000000000017;
  v6[4] = 0x800000019D07A6E0;
  v6[2] = v5;
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v6;
}

uint64_t sub_19CFC3E48()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

_QWORD *IntentDispatchOptions.__allocating_init()()
{
  _QWORD *result;
  uint64_t v1;

  sub_19CD249F0();
  v1 = sub_19CFDF3F8();
  sub_19CD23D8C(MEMORY[0x1E0DEE9D8]);
  result = (_QWORD *)swift_allocObject();
  result[3] = 0xD000000000000017;
  result[4] = 0x800000019D07A6E0;
  result[2] = v1;
  return result;
}

uint64_t IntentDispatchOptions.dispatcher.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  if (qword_1ECEB1330 != -1)
    swift_once();
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v2 = swift_bridgeObjectRetain();
  sub_19CDA9050(v2, a1);
  swift_bridgeObjectRelease();
  return swift_task_localValuePop();
}

uint64_t IntentDispatchOptions.withDispatcher(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[40];

  v2 = v1;
  v4 = *v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43DDA8);
  sub_19CCF8C5C(a1, (uint64_t)&v11, qword_1EE437050);
  if (v12)
  {
    sub_19CCD14C4(&v11, (uint64_t)v14);
    v13 = v5;
    *((_QWORD *)&v11 + 1) = swift_allocObject();
    sub_19CCD5B84((uint64_t)v14, *((_QWORD *)&v11 + 1) + 16);
    *(_QWORD *)&v11 = v5;
    v6 = sub_19CD0CDB8((uint64_t *)&v11);
    sub_19CD4C098((uint64_t)&v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  }
  else
  {
    sub_19CCECFE4((uint64_t)&v11, qword_1EE437050);
    v10 = v2[2];
    swift_bridgeObjectRetain();
    DependencyDictionary.remove(dependencyFor:)(v5);
    swift_beginAccess();
    v7 = v2[4];
    *(_QWORD *)&v11 = v2[3];
    *((_QWORD *)&v11 + 1) = v7;
    swift_bridgeObjectRetain();
    sub_19CFDF698();
    sub_19CFE0A90();
    sub_19CFDF698();
    swift_bridgeObjectRelease();
    v8 = v11;
    *(_QWORD *)&v11 = v10;
    return (*(uint64_t (**)(uint64_t, _QWORD, __int128 *))(v4 + 96))(v8, *((_QWORD *)&v11 + 1), &v11);
  }
  return v6;
}

void (*IntentDispatchOptions.jsonContext.getter@<X0>(void (**a1)(uint64_t)@<X8>))(uint64_t)
{
  void (*v1)(uint64_t);
  uint64_t v3;
  void (*result)(uint64_t);
  void (*v5)(uint64_t);

  if (qword_1ECEB1330 != -1)
    swift_once();
  v5 = v1;
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v3 = swift_bridgeObjectRetain();
  sub_19CD33F84(v3, &v5);
  swift_bridgeObjectRelease();
  swift_task_localValuePop();
  result = v5;
  if (!v5)
    result = (void (*)(uint64_t))sub_19CD30650(MEMORY[0x1E0DEE9D8]);
  *a1 = result;
  return result;
}

uint64_t IntentDispatchOptions.withJSONContext(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4[5];

  v1 = *a1;
  v4[4] = (uint64_t)&type metadata for JSONContext;
  v4[0] = (uint64_t)&type metadata for JSONContext;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  v2 = sub_19CD0CDB8(v4);
  sub_19CD4C098((uint64_t)v4);
  return v2;
}

uint64_t IntentDispatchOptions.timeout.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  if (qword_1ECEB1330 != -1)
    swift_once();
  v8 = v1;
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v3 = swift_bridgeObjectRetain();
  sub_19CDA930C(v3, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  result = swift_task_localValuePop();
  v5 = v10;
  v6 = v9;
  v7 = v8;
  if (v10)
    v7 = 0;
  *(_QWORD *)a1 = v7;
  *(_BYTE *)(a1 + 8) = (v5 | v6) & 1;
  return result;
}

uint64_t IntentDispatchOptions.withTimeout(_:)(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v5[2];
  char v6;
  ValueMetadata *v7;

  v1 = *(_QWORD *)a1;
  v2 = *(_BYTE *)(a1 + 8);
  v7 = &type metadata for IntentDispatchTimeout;
  v6 = v2;
  v5[0] = (uint64_t)&type metadata for IntentDispatchTimeout;
  v5[1] = v1;
  v3 = sub_19CD0CDB8(v5);
  sub_19CD4C098((uint64_t)v5);
  return v3;
}

uint64_t IntentDispatchOptions.pageIntentInstrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43CA80);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ECEB1330 != -1)
    swift_once();
  v11[1] = v2;
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v8 = swift_bridgeObjectRetain();
  sub_19CDA95CC(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  swift_task_localValuePop();
  v9 = type metadata accessor for PageIntentInstrumentation();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9) != 1)
    return sub_19CFC4468((uint64_t)v7, a1);
  swift_storeEnumTagMultiPayload();
  return sub_19CCECFE4((uint64_t)v7, &qword_1EE43CA80);
}

uint64_t sub_19CFC4468(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PageIntentInstrumentation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t IntentDispatchOptions.withPageIntentInstrumentation(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43CA80);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CD33A50(a1, (uint64_t)v5);
  v6 = type metadata accessor for PageIntentInstrumentation();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_19CD5D32C((uint64_t)v5);
  sub_19CCECFE4((uint64_t)v5, &qword_1EE43CA80);
  v7 = sub_19CCC9E74((uint64_t)&type metadata for IntentDispatchOptions.BadOrderingCanary);
  swift_release();
  return v7;
}

uint64_t IntentDispatchOptions.pageRenderMetrics.getter()
{
  uint64_t v0;
  uint64_t v1;

  if (qword_1ECEB1330 != -1)
    swift_once();
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_19CCC2F50(v0);
  swift_bridgeObjectRelease();
  swift_task_localValuePop();
  return v1;
}

uint64_t IntentDispatchOptions.withInstrumentationForSecondaryPageData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v18[3];
  char v19;
  ValueMetadata *v20;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43CA80);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v18[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PageIntentInstrumentation();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ECEB1330 != -1)
    swift_once();
  v18[0] = v0;
  type metadata accessor for BaseObjectGraph();
  swift_retain();
  swift_task_localValuePush();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_19CCC2F50(v10);
  swift_bridgeObjectRelease();
  swift_task_localValuePop();
  if (v11)
  {
    v12 = *(_QWORD *)(v11 + 32);
    v13 = v12 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v12 + 16);
    v14 = (os_unfair_lock_s *)(v12 + ((*(unsigned int *)(*(_QWORD *)v12 + 48) + 3) & 0x1FFFFFFFCLL));
    swift_retain();
    os_unfair_lock_lock(v14);
    sub_19CCBE7E4(v13, (uint64_t)v9);
    os_unfair_lock_unlock(v14);
    swift_release();
    swift_storeEnumTagMultiPayload();
    sub_19CD33A50((uint64_t)v9, (uint64_t)v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    sub_19CD5D32C((uint64_t)v4);
    sub_19CCECFE4((uint64_t)v4, &qword_1EE43CA80);
    v15 = sub_19CCC9E74((uint64_t)&type metadata for IntentDispatchOptions.BadOrderingCanary);
    swift_release();
    swift_release();
    sub_19CCC9630((uint64_t)v9);
  }
  else
  {
    v20 = &type metadata for IntentDispatchOptions.BadOrderingCanary;
    v18[2] = 41;
    v19 = 2;
    v18[0] = (uint64_t)&type metadata for IntentDispatchOptions.BadOrderingCanary;
    v18[1] = (uint64_t)"withInstrumentationForSecondaryPageData()";
    v15 = sub_19CD0CDB8(v18);
    sub_19CD4C098((uint64_t)v18);
  }
  return v15;
}

uint64_t IntentDispatchOptions.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t getEnumTagSinglePayload for IntentDispatchOptions.BadOrderingCanary(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IntentDispatchOptions.BadOrderingCanary(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t _CodeByKind_KeyedBy.wrappedValue.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*_CodeByKind_KeyedBy.wrappedValue.modify())()
{
  return nullsub_1;
}

uint64_t _CodeByKind_KeyedBy.description.getter()
{
  uint64_t v0;

  swift_getAssociatedTypeWitness();
  v0 = sub_19CFDF464();
  MEMORY[0x1A1ADBD7C](MEMORY[0x1E0DEA0E8], v0);
  sub_19CFE067C();
  return 0;
}

uint64_t _CodeByKind_KeyedBy.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  _QWORD v21[3];
  _BYTE v22[40];
  _QWORD *v23;

  sub_19CCD5B84(a1, (uint64_t)v22);
  v14 = type metadata accessor for CodeByKind(0, a3, a7, v13);
  MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for CodeByKind<A>, v14);
  v15 = sub_19CFDF494();
  if (v7)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
  }
  else
  {
    v21[1] = a5;
    MEMORY[0x1E0C80A78](v15, v16);
    v21[2] = v17;
    KeyPath = swift_getKeyPath();
    v23 = v21;
    MEMORY[0x1E0C80A78](KeyPath, v19);
    swift_getAssociatedTypeWitness();
    a6 = sub_19CFDF44C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
    swift_release();
  }
  return a6;
}

uint64_t sub_19CFC4B6C()
{
  return swift_getAtKeyPath();
}

uint64_t _CodeByKind_KeyedBy.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;

  swift_getAssociatedTypeWitness();
  v11 = type metadata accessor for CodeByKind(0, a4, a8, v10);
  sub_19CFDF44C();
  MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for CodeByKind<A>, v11);
  sub_19CFDF470();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19CFC4CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v5);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, double))(v9 + 16))((char *)&v11 - v7, a1, v6);
  return CodeByKind.init(wrappedValue:)((uint64_t)v8, a2);
}

uint64_t sub_19CFC4D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_19CFC4CAC(a1, a2);
}

uint64_t sub_19CFC4D7C()
{
  return _CodeByKind_KeyedBy.description.getter();
}

uint64_t sub_19CFC4D90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = _CodeByKind_KeyedBy.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_19CFC4DC8(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return _CodeByKind_KeyedBy.encode(to:)(a1, *v2, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
}

uint64_t _CodeByKind_KeyedBy<>.init(_partiallyFrom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];

  sub_19CCD5B84(a1, (uint64_t)v11);
  v7 = type metadata accessor for CodeByKind(0, a2, a3, v6);
  v8 = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for CodeByKind<A>, v7);
  Dictionary<>.init(_partiallyFrom:)(v11, v7, v8);
  swift_getKeyPath();
  swift_getAssociatedTypeWitness();
  v9 = sub_19CFDF44C();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  swift_release();
  return v9;
}

uint64_t sub_19CFC4EF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = _CodeByKind_KeyedBy<>.init(_partiallyFrom:)(a1, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 56));
  *a3 = result;
  return result;
}

uint64_t _CodeByKind_KeyedBy<>._partiallyEncode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for CodeByKind(0, a3, a4, v7);
  v9 = sub_19CFDF44C();
  v10 = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for CodeByKind<A>, v8);
  Dictionary<>._partiallyEncode(to:)(a1, v9, v8, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_19CFC4FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_19CF6FD8C(a1, a2);
}

uint64_t sub_19CFC5014(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;

  return _CodeByKind_KeyedBy<>._partiallyEncode(to:)(a1, *v2, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 56));
}

uint64_t static _CodeByKind_KeyedBy<>.== infix(_:_:)()
{
  swift_getAssociatedTypeWitness();
  return sub_19CFDF488();
}

uint64_t sub_19CFC50A0()
{
  return static _CodeByKind_KeyedBy<>.== infix(_:_:)() & 1;
}

uint64_t _CodeByKind_KeyedBy<>.hash(into:)()
{
  swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  sub_19CFDF47C();
  return swift_bridgeObjectRelease();
}

uint64_t _CodeByKind_KeyedBy<>.hashValue.getter()
{
  sub_19CFE08C8();
  _CodeByKind_KeyedBy<>.hash(into:)();
  return sub_19CFE0910();
}

uint64_t sub_19CFC51E4()
{
  return _CodeByKind_KeyedBy<>.hashValue.getter();
}

uint64_t sub_19CFC51FC()
{
  return _CodeByKind_KeyedBy<>.hash(into:)();
}

uint64_t sub_19CFC5230()
{
  sub_19CFE08C8();
  _CodeByKind_KeyedBy<>.hash(into:)();
  return sub_19CFE0910();
}

uint64_t sub_19CFC5288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for <> _CodeByKind_KeyedBy<A, B>, a1, &v4);
}

uint64_t sub_19CFC52C0()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for _CodeByKind_KeyedBy()
{
  JUMPOUT(0x1A1ADBCC8);
}

uint64_t sub_19CFC52D4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE436EA8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFC55DC();
  sub_19CFE0A24();
  v14 = 0;
  sub_19CFE0538();
  if (!v4)
  {
    v12[1] = v12[0];
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0750);
    sub_19CF9D2E8((unint64_t *)&qword_1EE436E88, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
    sub_19CFE0568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

unint64_t sub_19CFC5438()
{
  unint64_t result;

  result = sub_19CD2758C(MEMORY[0x1E0DEE9D8]);
  qword_1EE465AB0 = 0xD000000000000011;
  *(_QWORD *)algn_1EE465AB8 = 0x800000019D07A7C0;
  qword_1EE465AC0 = result;
  return result;
}

ValueMetadata *type metadata accessor for SentryRequest()
{
  return &type metadata for SentryRequest;
}

uint64_t sub_19CFC548C()
{
  _BYTE *v0;

  if (*v0)
    return 0x73726564616568;
  else
    return 7107189;
}

uint64_t sub_19CFC54C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_19CFC59A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19CFC54E4()
{
  sub_19CFC55DC();
  return sub_19CFE0A48();
}

uint64_t sub_19CFC550C()
{
  sub_19CFC55DC();
  return sub_19CFE0A54();
}

uint64_t sub_19CFC5534@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_19CFC5620(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_19CFC5560(_QWORD *a1)
{
  uint64_t *v1;

  return sub_19CFC52D4(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_19CFC557C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_19CFE06A0() & 1) != 0)
    return sub_19CDD151C(v2, v3);
  else
    return 0;
}

unint64_t sub_19CFC55DC()
{
  unint64_t result;

  result = qword_1EE436DB0;
  if (!qword_1EE436DB0)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06A518, &type metadata for SentryRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE436DB0);
  }
  return result;
}

uint64_t sub_19CFC5620(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443B88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFC55DC();
  sub_19CFE09E8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    v10[31] = 0;
    v8 = sub_19CFE0490();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0750);
    v10[15] = 1;
    sub_19CF9D2E8(&qword_1EE443850, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    swift_bridgeObjectRetain();
    sub_19CFE04B4();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t storeEnumTagSinglePayload for SentryRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFC584C + 4 * byte_19D06A3C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19CFC5880 + 4 * byte_19D06A3C0[v4]))();
}

uint64_t sub_19CFC5880(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFC5888(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFC5890);
  return result;
}

uint64_t sub_19CFC589C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFC58A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19CFC58A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFC58B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SentryRequest.CodingKeys()
{
  return &type metadata for SentryRequest.CodingKeys;
}

unint64_t sub_19CFC58D0()
{
  unint64_t result;

  result = qword_1EE443B90;
  if (!qword_1EE443B90)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06A4F0, &type metadata for SentryRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE443B90);
  }
  return result;
}

unint64_t sub_19CFC5918()
{
  unint64_t result;

  result = qword_1EE436DC0;
  if (!qword_1EE436DC0)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06A460, &type metadata for SentryRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE436DC0);
  }
  return result;
}

unint64_t sub_19CFC5960()
{
  unint64_t result;

  result = qword_1EE436DB8;
  if (!qword_1EE436DB8)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06A488, &type metadata for SentryRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE436DB8);
  }
  return result;
}

uint64_t sub_19CFC59A4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v2 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73726564616568 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_19CFE06A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id FamilyInfoLookupBagContract.__allocating_init(_:)(uint64_t *a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;
  objc_super v10;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = *a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9JetEngine27FamilyInfoLookupBagContract_backing] = v4;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9JetEngine14URLBagContract_backing] = v4;
  v5 = (objc_class *)type metadata accessor for MescalBagContract();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC9JetEngine17MescalBagContract_backing] = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  swift_unknownObjectRetain_n();
  v7 = v3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9JetEngine14URLBagContract_mescalContract] = objc_msgSendSuper2(&v10, sel_init);

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for URLBagContract();
  return objc_msgSendSuper2(&v9, sel_init);
}

id FamilyInfoLookupBagContract.init(_:)(uint64_t *a1)
{
  char *v1;
  uint64_t v2;
  objc_class *v3;
  char *v4;
  char *v5;
  objc_super v7;
  objc_super v8;

  v2 = *a1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9JetEngine27FamilyInfoLookupBagContract_backing] = *a1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9JetEngine14URLBagContract_backing] = v2;
  v3 = (objc_class *)type metadata accessor for MescalBagContract();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC9JetEngine17MescalBagContract_backing] = v2;
  v8.receiver = v4;
  v8.super_class = v3;
  swift_unknownObjectRetain_n();
  v5 = v1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9JetEngine14URLBagContract_mescalContract] = objc_msgSendSuper2(&v8, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for URLBagContract();
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_19CFC5C88()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9JetEngine27FamilyInfoLookupBagContract_backing);
  v2 = (void *)sub_19CFDF554();
  v3 = objc_msgSend(v1, sel_URLForKey_, v2);

  return v3;
}

uint64_t sub_19CFC5CF8()
{
  return swift_unknownObjectRelease();
}

id FamilyInfoLookupBagContract.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FamilyInfoLookupBagContract();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FamilyInfoLookupBagContract()
{
  return objc_opt_self();
}

uint64_t method lookup function for FamilyInfoLookupBagContract()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FamilyInfoLookupBagContract.familyInfoURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t sub_19CFC5D90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  _QWORD v22[5];
  char v23;

  v10 = sub_19CFDF2E4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CCE5204(0, (unint64_t *)&qword_1ECEB31B0);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E0DEF548], v10);
  v15 = (void *)sub_19CFDFDE8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a1;
  v16[6] = a2;
  v22[0] = MEMORY[0x1E0DEE9D8];
  v23 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4400A8);
  v17 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v18 = swift_allocObject();
  *(_DWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v17 + 16) = v18;
  sub_19CE744EC((uint64_t)v22, v17 + 24);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = sub_19CE744C0;
  v19[3] = v16;
  v19[4] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = a2;
  swift_retain();
  swift_retain();
  OS_dispatch_queue.schedule(task:)((uint64_t)sub_19CE74560, (uint64_t)v19);

  swift_release();
  swift_release();
  return v17;
}

uint64_t sub_19CFC5F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
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
  char *v13;
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
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t inited;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _QWORD v52[6];

  v46 = a1;
  v49 = a2;
  v50 = a3;
  v48 = a4;
  v52[4] = *MEMORY[0x1E0C80C00];
  v4 = sub_19CFDF0F8();
  MEMORY[0x1E0C80A78](v4, v5);
  v43[1] = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_19CFDF110();
  v44 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  MEMORY[0x1E0C80A78](v7, v8);
  v43[0] = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3030);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_19CFDEDE0();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19, v20);
  v47 = (char *)v43 - v21;
  v22 = sub_19CFDEB7C();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22, v24);
  v26 = (char *)v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEB70();
  sub_19CFDEB64();
  swift_bridgeObjectRetain();
  sub_19CFDEB10();
  sub_19CFDEB34();
  sub_19CFDEB28();
  sub_19CFDEAE0();
  sub_19CFDEAF8();
  v50 = v15;
  v27 = v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_19CCECFE4((uint64_t)v13, (uint64_t *)&unk_1ECEB3030);
    sub_19CFDF0EC();
    sub_19CE07B90(MEMORY[0x1E0DEE9D8]);
    sub_19CCC5C88((unint64_t *)&qword_1EE4422F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB15C0], MEMORY[0x1E0CB15B8]);
    v28 = v43[0];
    v29 = v45;
    sub_19CFDEC84();
    sub_19CFDF104();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v28, v29);
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  }
  else
  {
    v49 = v22;
    v31 = v50;
    v32 = v47;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v47, v13, v27);
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v18, v32, v27);
    v33 = v48;
    sub_19CFDE8DC();
    sub_19CFDE888();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443C18);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19D0522A0;
    *(_QWORD *)(inited + 32) = 0x73746E657665;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    *(_QWORD *)(inited + 48) = sub_19CFC70F8(v46);
    v35 = sub_19CE10E3C(inited);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443C20);
    v52[3] = v36;
    v52[0] = v35;
    sub_19CFDE900();
    v37 = (void *)objc_opt_self();
    v51 = (id)*__swift_project_boxed_opaque_existential_1(v52, v36);
    swift_bridgeObjectRetain();
    v38 = sub_19CFE0808();
    v51 = 0;
    v39 = objc_msgSend(v37, sel_dataWithJSONObject_options_error_, v38, 0, &v51);
    swift_unknownObjectRelease();
    v40 = v51;
    if (v39)
    {
      sub_19CFDEE70();

      sub_19CFDE8F4();
    }
    else
    {
      v41 = v40;
      sub_19CFDEC9C();

      swift_willThrow();
      v42 = sub_19CFDE90C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 8))(v33, v42);
    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v27);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v49);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  }
}

void sub_19CFC6464(uint64_t a1, uint64_t a2, void (*a3)(void *), void (*a4)(void *), uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void *a9)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(void *);
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void (**v36)(void *);
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void (*v44)(void *);
  void (*v45)(void *);
  _QWORD aBlock[7];

  v42 = a6;
  v43 = a7;
  v44 = a4;
  v45 = a3;
  v39 = a1;
  v40 = a2;
  v11 = sub_19CFDE858();
  MEMORY[0x1E0C80A78](v11, v12);
  v13 = sub_19CFDE864();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_19CFDE90C();
  v18 = *(_QWORD *)(v41 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x1E0C80A78](v41, v20);
  v21 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v39 - v24;
  if ((sub_19CCF910C() & 1) != 0)
  {
    v26 = v44;
    sub_19CFC5F60(a8, a5, (uint64_t)v43, (uint64_t)v25);
    v43 = a9;
    v28 = (void *)sub_19CFDE8AC();
    v29 = v41;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v25, v41);
    v30 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v31 = (v19 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
    v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    v33 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v33 + v30, v21, v29);
    v34 = (_QWORD *)(v33 + v31);
    v35 = v40;
    *v34 = v39;
    v34[1] = v35;
    v36 = (void (**)(void *))(v33 + v32);
    *v36 = v45;
    v36[1] = v26;
    aBlock[4] = sub_19CFC73C4;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_19CE0192C;
    aBlock[3] = &block_descriptor_40;
    v37 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    v38 = objc_msgSend(v43, sel_dataTaskWithRequest_completionHandler_, v28, v37);
    _Block_release(v37);

    objc_msgSend(v38, sel_resume);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v29);
  }
  else
  {
    sub_19CFDE840();
    sub_19CE07B90(MEMORY[0x1E0DEE9D8]);
    sub_19CCC5C88((unint64_t *)&qword_1EE440480, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_19CFDEC84();
    v27 = (void *)sub_19CFDE81C();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    v45(v27);

  }
}

uint64_t sub_19CFC677C(uint64_t a1, unint64_t a2, int a3, id a4, int a5, void (*a6)(__int128 *), int a7, void (*a8)(_QWORD), uint64_t a9)
{
  id v11;
  char v14;
  id v15;
  unint64_t *v16;
  char v17;
  void *v18;
  uint64_t result;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26[5];
  char v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a2 >> 60 != 15)
  {
    sub_19CD61F18(a1, a2);
    if (qword_1EE43D1E0 != -1)
      swift_once();
    sub_19CD17ABC(qword_1EE465C90, *(uint64_t *)algn_1EE465C98);
    if ((v14 & 1) != 0)
    {
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D80]), sel_init);
      v16 = (unint64_t *)&unk_1ECEB2F00;
    }
    else
    {
      if (qword_1EE43D2D8 != -1)
        swift_once();
      sub_19CD17ABC(qword_1EE465CD0, *(uint64_t *)algn_1EE465CD8);
      if ((v17 & 1) == 0)
      {
        v20 = (void *)objc_opt_self();
        v21 = (void *)sub_19CFDEE58();
        v26[0] = 0;
        v22 = objc_msgSend(v20, sel_JSONObjectWithData_options_error_, v21, 4, v26);

        v23 = v26[0];
        if (!v22)
        {
          v24 = v23;
          v25 = (void *)sub_19CFDEC9C();

          swift_willThrow();
          sub_19CCF4A54(a1, a2);
          v26[0] = v25;
          v27 = 1;
          goto LABEL_14;
        }
        sub_19CFE004C();
        swift_unknownObjectRelease();
        goto LABEL_13;
      }
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D20]), sel_init);
      v16 = (unint64_t *)&qword_1ECEB1710;
    }
    v29 = sub_19CCE5204(0, v16);
    *(_QWORD *)&v28 = v15;
LABEL_13:
    sub_19CD433C0(&v28, &v34);
    v26[3] = &type metadata for FoundationValue;
    v26[4] = &off_1E3DCC5B0;
    v26[0] = (id)swift_allocObject();
    sub_19CD436B0((uint64_t)&v34, (uint64_t)v26[0] + 16);
    sub_19CCF4A54(a1, a2);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v34);
    v27 = 0;
    goto LABEL_14;
  }
  if (!a4)
  {
    result = sub_19CFE0340();
    __break(1u);
    return result;
  }
  v26[0] = a4;
  v27 = 1;
  v11 = a4;
LABEL_14:
  sub_19CCF8C5C((uint64_t)v26, (uint64_t)&v34, &qword_1EE443C10);
  if ((v37 & 1) != 0)
  {
    *(_QWORD *)&v28 = v34;
    v30 = 1;
  }
  else
  {
    v31 = v34;
    v32 = v35;
    v33 = v36;
    sub_19CFC6B5C((uint64_t)&v31, (uint64_t)&v28);
    sub_19CD3E3F8((uint64_t)&v31);
    v30 = 0;
  }
  sub_19CCECFE4((uint64_t)v26, &qword_1EE443C10);
  sub_19CCF8C5C((uint64_t)&v28, (uint64_t)&v34, &qword_1EE443C10);
  if ((v37 & 1) != 0)
  {
    v18 = (void *)v34;
    a8(v34);

  }
  else
  {
    v31 = v34;
    v32 = v35;
    v33 = v36;
    a6(&v31);
    sub_19CD3E3F8((uint64_t)&v31);
  }
  return sub_19CCECFE4((uint64_t)&v28, &qword_1EE443C10);
}

uint64_t sub_19CFC6B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_2Tm;
  unint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[3];
  uint64_t v46;
  unint64_t v47;

  v4 = sub_19CFDF0F8();
  MEMORY[0x1E0C80A78](v4, v5);
  v38 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_19CFDF110();
  v39 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3030);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = a1;
  JSONObject.subscript.getter(27503, 0xE200000000000000, (uint64_t)v45);
  sub_19CCF8C5C((uint64_t)v45, (uint64_t)&v42, &qword_1ECEB1328);
  v15 = v43;
  if (v43)
  {
    v16 = v44;
    __swift_project_boxed_opaque_existential_1(&v42, v43);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 88))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v42);
    sub_19CD3E3F8((uint64_t)v45);
    if (v17 != 2 && (v17 & 1) != 0)
      return sub_19CD3E448(v40, a2);
  }
  else
  {
    sub_19CCECFE4((uint64_t)&v42, &qword_1ECEB1328);
    sub_19CD3E3F8((uint64_t)v45);
  }
  v47 = MEMORY[0x1E0DEE9E0];
  v19 = sub_19CFDF578();
  v21 = v20;
  sub_19CFDE8E8();
  v22 = sub_19CFDEDE0();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v14, 1, v22) == 1)
  {
    sub_19CCECFE4((uint64_t)v14, (uint64_t *)&unk_1ECEB3030);
    sub_19CD143A0(v19, v21, v45);
    sub_19CCECFE4((uint64_t)v45, &qword_1ECEB3370);
  }
  else
  {
    v46 = v22;
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v45);
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_2Tm, v14, v22);
    sub_19CD433C0(v45, &v42);
    v25 = v47;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v41 = v25;
    v47 = 0x8000000000000000;
    sub_19CD13D40(&v42, v19, v21, isUniquelyReferenced_nonNull_native);
    v47 = v41;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v27 = sub_19CFDF578();
  v29 = v28;
  JSONObject.subscript.getter(0x726F727265, 0xE500000000000000, (uint64_t)v45);
  sub_19CCF8C5C((uint64_t)v45, (uint64_t)&v42, &qword_1ECEB1328);
  v30 = v43;
  if (!v43)
  {
    sub_19CCECFE4((uint64_t)&v42, &qword_1ECEB1328);
    sub_19CD3E3F8((uint64_t)v45);
    goto LABEL_13;
  }
  v31 = v44;
  __swift_project_boxed_opaque_existential_1(&v42, v43);
  v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 24))(v30, v31);
  v34 = v33;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v42);
  sub_19CD3E3F8((uint64_t)v45);
  if (!v34)
  {
LABEL_13:
    sub_19CD143A0(v27, v29, v45);
    sub_19CCECFE4((uint64_t)v45, &qword_1ECEB3370);
    goto LABEL_14;
  }
  v43 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v42 = v32;
  *((_QWORD *)&v42 + 1) = v34;
  sub_19CD433C0(&v42, v45);
  v35 = v47;
  v36 = swift_isUniquelyReferenced_nonNull_native();
  v41 = v35;
  v47 = 0x8000000000000000;
  sub_19CD13D40(v45, v27, v29, v36);
  v47 = v41;
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  v37 = v39;
  sub_19CFDF0C8();
  sub_19CCC5C88((unint64_t *)&qword_1EE4422F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB15C0], MEMORY[0x1E0CB15B8]);
  sub_19CFDEC84();
  sub_19CFDF104();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v7);
  return swift_willThrow();
}

uint64_t sub_19CFC6FB0()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  sub_19CFE08D4();
  return sub_19CFE0910();
}

uint64_t sub_19CFC7010()
{
  sub_19CFDF650();
  return sub_19CFE08D4();
}

uint64_t sub_19CFC7044()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  sub_19CFE08D4();
  return sub_19CFE0910();
}

BOOL sub_19CFC70A0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_19CFE06A0();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_19CFC70F8(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443C28);
  result = sub_19CFE03A0();
  v3 = 0;
  v35 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = a1 + 64;
  v4 = v6;
  v7 = 1 << *(_BYTE *)(v5 - 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v4;
  v28 = v5;
  v29 = (unint64_t)(v7 + 63) >> 6;
  v30 = (_QWORD *)result;
  v31 = result + 64;
  if ((v8 & v4) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v11 = v3;
  for (i = v10 | (v3 << 6); ; i = __clz(__rbit64(v14)) + (v15 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v35 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_19CCD5B84(*(_QWORD *)(v35 + 56) + 40 * i, (uint64_t)v32);
    v20 = v33;
    v21 = v34;
    __swift_project_boxed_opaque_existential_1(v32, v33);
    v22 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 16);
    swift_bridgeObjectRetain();
    v23 = v22(v20, v21);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    result = (uint64_t)v30;
    *(_QWORD *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v24 = (_QWORD *)(v30[6] + 16 * i);
    *v24 = v18;
    v24[1] = v19;
    *(_QWORD *)(v30[7] + 8 * i) = v23;
    v25 = v30[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v30[2] = v27;
    v3 = v11;
    if (v9)
      goto LABEL_4;
LABEL_5:
    v13 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_24;
    if (v13 >= v29)
      return result;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v3 + 1;
    if (!v14)
    {
      v15 = v3 + 2;
      if (v3 + 2 >= v29)
        return result;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v3 + 3;
        if (v3 + 3 >= v29)
          return result;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v9 = (v14 - 1) & v14;
    v11 = v15;
  }
  v16 = v3 + 4;
  if (v3 + 4 >= v29)
    return result;
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v29)
      return result;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_19CFC7330()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_19CFDE90C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFC73C4(uint64_t a1, unint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v9 = *(_QWORD *)(sub_19CFDE90C() - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = (*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_19CFC677C(a1, a2, a3, a4, (int)v4 + (int)v10, *(void (**)(__int128 *))(v4 + v11), *(_QWORD *)(v4 + v11 + 8), *(void (**)(_QWORD))(v4 + ((v11 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v4 + ((v11 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_19CFC7460()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_19CFC7484()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_19CFC74B8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

_QWORD *assignWithCopy for MetricsInspectorHTTPServer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for MetricsInspectorHTTPServer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for MetricsInspectorHTTPServer()
{
  return &type metadata for MetricsInspectorHTTPServer;
}

unint64_t sub_19CFC7588()
{
  unint64_t result;

  result = qword_1EE443C30;
  if (!qword_1EE443C30)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06A5D4, &type metadata for MetricsInspectorHTTPServer);
    atomic_store(result, (unint64_t *)&qword_1EE443C30);
  }
  return result;
}

uint64_t sub_19CFC75CC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43CD70);
  v1 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = 0;
  v6[4] = sub_19CFC7758;
  v6[5] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_19CCCBFA0;
  v6[3] = &block_descriptor_41;
  v4 = _Block_copy(v6);
  swift_retain();
  swift_release();
  objc_msgSend(v0, sel_createSnapshotWithCompletion_, v4);
  _Block_release(v4);
  return v1;
}

void sub_19CFC76B4(void *a1, id a2, uint64_t a3)
{
  id v5;
  id v6;

  if (a1)
  {
    v6 = a1;
    sub_19CFC7760(v6, a3);

  }
  else if (a2)
  {
    v5 = a2;
    sub_19CEBD674(a2);

  }
  else
  {
    sub_19CFE0340();
    __break(1u);
  }
}

void sub_19CFC7758(void *a1, void *a2)
{
  uint64_t v2;

  sub_19CFC76B4(a1, a2, v2);
}

void sub_19CFC7760(void *a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  id v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  char v21;
  _BYTE v22[80];

  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a2 + 16) + 16);
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  if (*(_BYTE *)(a2 + 32) == 3)
  {
    os_unfair_lock_unlock(v4);
  }
  else if (*(_BYTE *)(a2 + 32))
  {
    sub_19CFE0340();
    __break(1u);
  }
  else
  {
    v5 = *(_QWORD **)(a2 + 24);
    *(_QWORD *)(a2 + 24) = a1;
    *(_BYTE *)(a2 + 32) = 1;
    sub_19CFC7980(v5, 0);
    v6 = a1;
    sub_19CFC79B8(v5, 0);
    os_unfair_lock_unlock(v4);
    v7 = v5[2];
    if (v7)
    {
      v8 = (uint64_t)(v5 + 4);
      do
      {
        sub_19CFC79F0(v8, (uint64_t)v22);
        sub_19CFC79F0((uint64_t)v22, (uint64_t)v19);
        v9 = v19[0];
        if ((v21 & 1) != 0)
        {
          **(_QWORD **)(*(_QWORD *)(v19[0] + 64) + 40) = v6;
          swift_unknownObjectRetain();
          swift_continuation_throwingResume();
        }
        else
        {
          v10 = v19[1];
          swift_release();
          sub_19CCD14C4(&v20, (uint64_t)v16);
          v11 = v17;
          v12 = v18;
          __swift_project_boxed_opaque_existential_1(v16, v17);
          v13 = (_QWORD *)swift_allocObject();
          v13[2] = v9;
          v13[3] = v10;
          v13[4] = v6;
          v14 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v12 + 8);
          v15 = v6;
          swift_retain();
          v14(sub_19CF30B44, v13, v11, v12);
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        }
        sub_19CFC7A38((uint64_t)v22);
        v8 += 80;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
  }
}

id sub_19CFC7980(id result, char a2)
{
  switch(a2)
  {
    case 0:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 1:
      result = (id)swift_unknownObjectRetain();
      break;
    case 2:
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void sub_19CFC79B8(id a1, char a2)
{
  switch(a2)
  {
    case 0:
      swift_bridgeObjectRelease();
      break;
    case 1:
      swift_unknownObjectRelease();
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t sub_19CFC79F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE439FA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19CFC7A38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE439FA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19CFC7A78()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t static JetpackSignerError.== infix(_:_:)()
{
  return 1;
}

uint64_t JetpackSignerError.hash(into:)()
{
  return sub_19CFE08D4();
}

uint64_t JetpackSignerError.hashValue.getter()
{
  sub_19CFE08C8();
  sub_19CFE08D4();
  return sub_19CFE0910();
}

unint64_t sub_19CFC7B18()
{
  unint64_t result;

  result = qword_1EE443C38;
  if (!qword_1EE443C38)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for JetpackSignerError, &type metadata for JetpackSignerError);
    atomic_store(result, (unint64_t *)&qword_1EE443C38);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for JetpackSignerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_19CFC7B9C + 4 * byte_19D06A650[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_19CFC7BBC + 4 * byte_19D06A655[v4]))();
}

_BYTE *sub_19CFC7B9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_19CFC7BBC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19CFC7BC4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19CFC7BCC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19CFC7BD4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19CFC7BDC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JetpackSignerError()
{
  return &type metadata for JetpackSignerError;
}

ValueMetadata *type metadata accessor for JetpackSigner()
{
  return &type metadata for JetpackSigner;
}

uint64_t sub_19CFC7C08@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  if (result >= 9)
  {
    result = sub_19CFE0340();
    __break(1u);
  }
  else
  {
    *a2 = byte_19D06A846[(int)result];
  }
  return result;
}

BOOL static JSTypedArray.ElementType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JSTypedArray.ElementType.hash(into:)()
{
  return sub_19CFE08D4();
}

uint64_t JSTypedArray.ElementType.hashValue.getter()
{
  sub_19CFE08C8();
  sub_19CFE08D4();
  return sub_19CFE0910();
}

JetEngine::JSTypedArray_optional __swiftcall JSTypedArray.init(_:)(JSValue a1)
{
  Class *v1;
  Class isa;
  Class *v3;
  id TypedArrayType;
  Swift::Bool v5;
  void *v6;
  const OpaqueJSContext *v7;
  JetEngine::JSTypedArray_optional result;

  isa = a1.super.isa;
  v3 = v1;
  TypedArrayType = -[objc_class context](a1.super.isa, sel_context);
  if (TypedArrayType)
  {
    v6 = TypedArrayType;
    v7 = (const OpaqueJSContext *)objc_msgSend(TypedArrayType, sel_JSGlobalContextRef);

    TypedArrayType = (id)JSValueGetTypedArrayType(v7, (JSValueRef)-[objc_class JSValueRef](isa, sel_JSValueRef), 0);
    if ((_DWORD)TypedArrayType == 9 || (_DWORD)TypedArrayType == 10)
    {

      isa = 0;
    }
    *v3 = isa;
  }
  else
  {
    __break(1u);
  }
  result.value.value.super.isa = (Class)TypedArrayType;
  result.is_nil = v5;
  return result;
}

JetEngine::JSTypedArray __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> JSTypedArray.init(count:elementType:in:)(Swift::Int count, JetEngine::JSTypedArray::ElementType elementType, JSContext in)
{
  Class *v3;
  Class *v5;
  uint64_t v6;
  JSObjectRef TypedArray;
  JetEngine::JSTypedArray result;
  Class isa;
  JSValueRef v10;
  uint64_t v11;
  uint64_t v12;
  Class v13;
  void (**v14)(const void *, Class, objc_class *);
  void (**v15)(const void *, Class, objc_class *);
  void (*v16)(const void *, Class, objc_class *);
  objc_class *v17;
  JSValueRef v18[2];

  v5 = v3;
  v18[1] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  v6 = *(char *)elementType;
  v18[0] = 0;
  TypedArray = JSObjectMakeTypedArray((JSContextRef)-[objc_class JSGlobalContextRef](in.super.isa, sel_JSGlobalContextRef), (JSTypedArrayType)dword_19D06A898[v6], count, v18);
  if (TypedArray)
  {
    result.value.super.isa = (Class)objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, TypedArray, in.super.isa);
    if (result.value.super.isa)
    {
      isa = result.value.super.isa;

      *v5 = isa;
      return result;
    }
    __break(1u);
    goto LABEL_9;
  }
  v10 = v18[0];
  sub_19CDC98D8();
  swift_allocError();
  v12 = v11;
  result.value.super.isa = (Class)objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, v10, in.super.isa);
  if (!result.value.super.isa)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v13 = result.value.super.isa;
  v14 = (void (**)(const void *, Class, objc_class *))-[objc_class exceptionHandler](in.super.isa, sel_exceptionHandler);
  if (v14)
  {
    v15 = v14;
    v16 = v14[2];
    v17 = v13;
    v16(v15, in.super.isa, v17);
    _Block_release(v15);

  }
  JSError.init(_:)(v13, v12);
  swift_willThrow();

  return result;
}

void JSTypedArray.init(bytesNoCopy:count:deallocator:elementType:in:)(void *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, void *a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v13;
  _QWORD *v14;
  JSObjectRef TypedArrayWithBytesNoCopy;
  id v16;
  id v17;
  JSValueRef v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(const void *, void *, id);
  void (**v24)(const void *, void *, id);
  void (*v25)(const void *, void *, id);
  id v26;
  JSValueRef v27[2];

  v27[1] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  v13 = *a5;
  type metadata accessor for JSBytesDeallocatorHolder();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v27[0] = 0;
  swift_retain();
  TypedArrayWithBytesNoCopy = JSObjectMakeTypedArrayWithBytesNoCopy((JSContextRef)objc_msgSend(a6, sel_JSGlobalContextRef), (JSTypedArrayType)dword_19D06A898[v13], a1, a2, (JSTypedArrayBytesDeallocator)sub_19CF07288, v14, v27);
  if (TypedArrayWithBytesNoCopy)
  {
    v16 = objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, TypedArrayWithBytesNoCopy, a6);
    if (v16)
    {
      v17 = v16;
      swift_release();

      *a7 = v17;
      return;
    }
    __break(1u);
    goto LABEL_9;
  }
  swift_release();
  v18 = v27[0];
  sub_19CDC98D8();
  swift_allocError();
  v20 = v19;
  v21 = objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, v18, a6);
  if (!v21)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v22 = v21;
  v23 = (void (**)(const void *, void *, id))objc_msgSend(a6, sel_exceptionHandler);
  if (v23)
  {
    v24 = v23;
    v25 = v23[2];
    v26 = v22;
    v25(v24, a6, v26);
    _Block_release(v24);

  }
  JSError.init(_:)(v22, v20);
  swift_willThrow();
  swift_release();

}

void JSTypedArray.init(data:elementType:in:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_19CFC8198()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t result;
  char v8;
  uint64_t v9;

  v6 = (void *)swift_slowAlloc();
  sub_19CFDEEB8();
  v8 = v5;
  JSTypedArray.init(bytesNoCopy:count:deallocator:elementType:in:)(v6, BYTE6(v1), (uint64_t)sub_19CF8AB78, 0, &v8, v4, &v9);
  result = sub_19CD3BE18(v2, v1);
  if (!v3)
    *v0 = v9;
  return result;
}

JetEngine::JSTypedArray __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> JSTypedArray.init(buffer:elementType:in:)(JetEngine::JSArrayBuffer buffer, JetEngine::JSTypedArray::ElementType elementType, JSContext in)
{
  Class *v3;
  Class *v5;
  void *v6;
  uint64_t v7;
  const OpaqueJSContext *v8;
  OpaqueJSValue *v9;
  JSObjectRef TypedArrayWithArrayBuffer;
  JetEngine::JSTypedArray result;
  Class isa;
  JSValueRef v13;
  uint64_t v14;
  uint64_t v15;
  Class v16;
  void (**v17)(const void *, Class, objc_class *);
  void (**v18)(const void *, Class, objc_class *);
  void (*v19)(const void *, Class, objc_class *);
  objc_class *v20;
  JSValueRef v21[2];

  v5 = v3;
  v21[1] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  v6 = *(void **)buffer.value.super.isa;
  v7 = *(char *)elementType;
  v21[0] = 0;
  v8 = (const OpaqueJSContext *)-[objc_class JSGlobalContextRef](in.super.isa, sel_JSGlobalContextRef);
  LODWORD(v7) = dword_19D06A898[v7];
  v9 = (OpaqueJSValue *)objc_msgSend(v6, sel_JSValueRef);

  TypedArrayWithArrayBuffer = JSObjectMakeTypedArrayWithArrayBuffer(v8, (JSTypedArrayType)v7, v9, v21);
  if (TypedArrayWithArrayBuffer)
  {
    result.value.super.isa = (Class)objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, TypedArrayWithArrayBuffer, in.super.isa);
    if (result.value.super.isa)
    {
      isa = result.value.super.isa;

      *v5 = isa;
      return result;
    }
    __break(1u);
    goto LABEL_9;
  }
  v13 = v21[0];
  sub_19CDC98D8();
  swift_allocError();
  v15 = v14;
  result.value.super.isa = (Class)objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, v13, in.super.isa);
  if (!result.value.super.isa)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v16 = result.value.super.isa;
  v17 = (void (**)(const void *, Class, objc_class *))-[objc_class exceptionHandler](in.super.isa, sel_exceptionHandler);
  if (v17)
  {
    v18 = v17;
    v19 = v17[2];
    v20 = v16;
    v19(v18, in.super.isa, v20);
    _Block_release(v18);

  }
  JSError.init(_:)(v16, v15);
  swift_willThrow();

  return result;
}

void JSTypedArray.init(buffer:range:elementType:in:)(id a1@<X4>, void **a2@<X0>, uint64_t a3@<X1>, uint64_t a4@<X2>, char *a5@<X3>, _QWORD *a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  size_t v11;
  void *v13;
  const OpaqueJSContext *v14;
  JSTypedArrayType v15;
  OpaqueJSValue *v16;
  JSObjectRef TypedArrayWithArrayBufferAndOffset;
  id v18;
  id v19;
  JSValueRef v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void (**v25)(const void *, id, id);
  void (**v26)(const void *, id, id);
  void (*v27)(const void *, id, id);
  id v28;
  JSValueRef v29[2];

  v29[1] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  v7 = *a5;
  v8 = qword_19D06A850[v7];
  v9 = a3 * v8;
  if ((unsigned __int128)(a3 * (__int128)v8) >> 64 != (a3 * v8) >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }
  v10 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  v11 = v10 + 1;
  if (__OFADD__(v10, 1))
    goto LABEL_13;
  v13 = *a2;
  v29[0] = 0;
  v14 = (const OpaqueJSContext *)objc_msgSend(a1, sel_JSGlobalContextRef);
  v15 = dword_19D06A898[v7];
  v16 = (OpaqueJSValue *)objc_msgSend(v13, sel_JSValueRef);

  TypedArrayWithArrayBufferAndOffset = JSObjectMakeTypedArrayWithArrayBufferAndOffset(v14, v15, v16, v9, v11, v29);
  if (TypedArrayWithArrayBufferAndOffset)
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, TypedArrayWithArrayBufferAndOffset, a1);
    if (v18)
    {
      v19 = v18;

      *a6 = v19;
      return;
    }
    __break(1u);
    goto LABEL_15;
  }
  v20 = v29[0];
  sub_19CDC98D8();
  swift_allocError();
  v22 = v21;
  v23 = objc_msgSend((id)objc_opt_self(), sel_valueWithJSValueRef_inContext_, v20, a1);
  if (!v23)
  {
LABEL_15:
    __break(1u);
    return;
  }
  v24 = v23;
  v25 = (void (**)(const void *, id, id))objc_msgSend(a1, sel_exceptionHandler);
  if (v25)
  {
    v26 = v25;
    v27 = v25[2];
    v28 = v24;
    v27(v26, a1, v28);
    _Block_release(v26);

  }
  JSError.init(_:)(v24, v22);
  swift_willThrow();

}

id JSTypedArray.value.getter()
{
  id *v0;

  return *v0;
}

id JSTypedArray.count.getter()
{
  id *v0;
  id v1;
  id result;
  void *v3;
  const OpaqueJSContext *v4;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_context);
  if (result)
  {
    v3 = result;
    v4 = (const OpaqueJSContext *)objc_msgSend(result, sel_JSGlobalContextRef);

    return (id)JSObjectGetTypedArrayLength(v4, (JSObjectRef)objc_msgSend(v1, sel_JSValueRef), 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id JSTypedArray.elementType.getter@<X0>(_BYTE *a1@<X8>)
{
  void **v1;
  void *v3;
  id result;
  void *v5;
  const OpaqueJSContext *v6;
  uint64_t TypedArrayType;

  v3 = *v1;
  result = objc_msgSend(v3, sel_context);
  if (result)
  {
    v5 = result;
    v6 = (const OpaqueJSContext *)objc_msgSend(result, sel_JSGlobalContextRef);

    TypedArrayType = JSValueGetTypedArrayType(v6, (JSValueRef)objc_msgSend(v3, sel_JSValueRef), 0);
    return (id)sub_19CFC7C08(TypedArrayType, a1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id JSTypedArray.data.getter()
{
  id *v0;
  id v1;
  id result;
  void *v3;
  const OpaqueJSContext *v4;
  _BYTE *v5;
  void *v6;
  const OpaqueJSContext *v7;
  size_t TypedArrayByteOffset;
  void *v9;
  const OpaqueJSContext *v10;
  size_t TypedArrayByteLength;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_context);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = result;
  v4 = (const OpaqueJSContext *)objc_msgSend(result, sel_JSGlobalContextRef);

  result = JSObjectGetTypedArrayBytesPtr(v4, (JSObjectRef)objc_msgSend(v1, sel_JSValueRef), 0);
  if (result)
  {
    v5 = result;
    result = objc_msgSend(v1, sel_context);
    if (result)
    {
      v6 = result;
      v7 = (const OpaqueJSContext *)objc_msgSend(result, sel_JSGlobalContextRef);

      TypedArrayByteOffset = JSObjectGetTypedArrayByteOffset(v7, (JSObjectRef)objc_msgSend(v1, sel_JSValueRef), 0);
      result = objc_msgSend(v1, sel_context);
      if (result)
      {
        v9 = result;
        v10 = (const OpaqueJSContext *)objc_msgSend(result, sel_JSGlobalContextRef);

        TypedArrayByteLength = JSObjectGetTypedArrayByteLength(v10, (JSObjectRef)objc_msgSend(v1, sel_JSValueRef), 0);
        return (id)sub_19CCC4FA0(&v5[TypedArrayByteOffset], TypedArrayByteLength);
      }
      goto LABEL_9;
    }
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
  }
  return result;
}

uint64_t static JSTypedArray.== infix(_:_:)()
{
  sub_19CD5956C();
  return sub_19CFDFEF0() & 1;
}

uint64_t JSTypedArray.description.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_description);
  v2 = sub_19CFDF578();

  return v2;
}

unint64_t sub_19CFC8928()
{
  unint64_t result;

  result = qword_1EE443C40;
  if (!qword_1EE443C40)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for JSTypedArray.ElementType, &type metadata for JSTypedArray.ElementType);
    atomic_store(result, (unint64_t *)&qword_1EE443C40);
  }
  return result;
}

ValueMetadata *type metadata accessor for JSTypedArray()
{
  return &type metadata for JSTypedArray;
}

uint64_t getEnumTagSinglePayload for JSTypedArray.ElementType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for JSTypedArray.ElementType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFC8A58 + 4 * byte_19D06A73D[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_19CFC8A8C + 4 * asc_19D06A738[v4]))();
}

uint64_t sub_19CFC8A8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFC8A94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFC8A9CLL);
  return result;
}

uint64_t sub_19CFC8AA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFC8AB0);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_19CFC8AB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFC8ABC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JSTypedArray.ElementType()
{
  return &type metadata for JSTypedArray.ElementType;
}

_QWORD *BagLanguageSource.init(bag:timeout:defaultLanguages:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = *result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3 & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_19CFC8AF0()
{
  return swift_task_switch();
}

uint64_t sub_19CFC8B04()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_19CFC8B58()
{
  return swift_task_switch();
}

uint64_t sub_19CFC8B6C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 1840);
  swift_release_n();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_19CFC8BCC()
{
  return swift_task_switch();
}

uint64_t sub_19CFC8BE0()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_19CFC8C34()
{
  return swift_task_switch();
}

uint64_t sub_19CFC8C48()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19CFC8C98()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 1808);
  *(_QWORD *)(v0 + 1832) = v1;
  *(_QWORD *)(*(_QWORD *)(v0 + 1800) + 16) = 0;
  v2 = swift_release();
  v3 = (*(uint64_t (**)(uint64_t))(v0 + 1424))(v2);
  *(_QWORD *)(v0 + 1840) = v3;
  if (v3)

  else
    swift_willThrow();
  return swift_asyncLet_finish();
}

uint64_t sub_19CFC8D30()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 1816);
  *(_QWORD *)(v0 + 1832) = v1;
  *(_QWORD *)(*(_QWORD *)(v0 + 1800) + 16) = 0;
  v2 = swift_release();
  v3 = (*(uint64_t (**)(uint64_t))(v0 + 1424))(v2);
  *(_QWORD *)(v0 + 1840) = v3;
  if (v3)

  else
    swift_willThrow();
  return swift_asyncLet_finish();
}

uint64_t sub_19CFC8DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return swift_task_switch();
}

uint64_t sub_19CFC8DF0(_QWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 153) = a4;
  *(_QWORD *)(v4 + 200) = a2;
  *(_QWORD *)(v4 + 208) = a3;
  *(_QWORD *)(v4 + 216) = *a1;
  return swift_task_switch();
}

uint64_t sub_19CFC8E14()
{
  _QWORD *v0;
  uint64_t v1;

  v0[7] = v0 + 23;
  v0[2] = v0;
  v0[3] = sub_19CFC8E90;
  v0[10] = swift_continuation_init();
  v1 = (uint64_t)(v0 + 10);
  *(_BYTE *)(v1 + 72) = 1;
  sub_19CCF411C();
  sub_19CCECFE4(v1, &qword_1ECEAFFD0);
  return swift_continuation_await();
}

uint64_t sub_19CFC8E90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 240) = v2;
  if (v2)
  {
    swift_willThrow();
  }
  else
  {
    *(_QWORD *)(v1 + 248) = *(_QWORD *)(v1 + 184);
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_19CFC8F0C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 248);
  v2 = *(void **)(v0 + 224);
  v3 = sub_19CFDF578();
  v5 = v4;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v3, v5);
}

uint64_t sub_19CFC8F68()
{
  uint64_t v0;
  char v1;
  void *v2;
  void *v3;

  swift_release();
  swift_getErrorValue();
  v1 = sub_19CD2C1BC(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176));
  v2 = *(void **)(v0 + 240);
  v3 = *(void **)(v0 + 224);
  if ((v1 & 1) != 0)
  {

    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
  else
  {
    swift_willThrow();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19CFC900C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return swift_task_switch();
}

uint64_t BagLanguageSource.locale(forLanguage:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v23 = a1;
  v1 = sub_19CFDF044();
  v21 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_19CFDF08C();
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22, v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19CFDF038();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v20 - v16;
  swift_bridgeObjectRetain();
  sub_19CFDEFB4();
  sub_19CFDF074();
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_19CFDEFC0();
  sub_19CFDF698();
  swift_bridgeObjectRelease();
  sub_19CFDF698();
  sub_19CFDF050();
  sub_19CFE02E0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v1);
  sub_19CFDEFB4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v22);
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  sub_19CCEFD08((uint64_t)v17, v23);
  return ((uint64_t (*)(char *, uint64_t))v18)(v17, v9);
}

uint64_t assignWithCopy for BagLanguageSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BagLanguageSource(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_19CFC92EC()
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(&v3, AssociatedTypeWitness, AssociatedConformanceWitness);
  return v3;
}

uint64_t dispatch thunk of IntentImplementation.intentKind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntentImplementation.perform(_:objectGraph:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19CCBE344;
  return v13(a1, a2, a3, a4, a5);
}

id AllowedFieldValuesTreatmentAction.__allocating_init(field:configuration:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a2)
  {
    v3 = (void *)sub_19CFDF554();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_allocWithZone(v2);
  v5 = (void *)sub_19CFDF3B0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithField_configuration_, v3, v5);

  return v6;
}

id AllowedFieldValuesTreatmentAction.init(field:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  objc_class *ObjectType;
  char *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;
  uint64_t v17[2];
  _BYTE v18[40];
  __int128 v19;
  __int128 v20;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  strcpy((char *)v17, "allowedValues");
  HIWORD(v17[1]) = -4864;
  v8 = v4;
  sub_19CFE00C4();
  if (*(_QWORD *)(a3 + 16) && (v9 = sub_19CD20240((uint64_t)v18), (v10 & 1) != 0))
  {
    sub_19CD436B0(*(_QWORD *)(a3 + 56) + 32 * v9, (uint64_t)&v19);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  sub_19CD20334((uint64_t)v18);
  if (!*((_QWORD *)&v20 + 1))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_19CCECFE4((uint64_t)&v19, &qword_1ECEB3370);
LABEL_11:
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443C88);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v11 = sub_19CE08AF0(v17[0]);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v8[OBJC_IVAR____TtC9JetEngine33AllowedFieldValuesTreatmentAction_allowList] = v11;

  if (a2)
  {
    v12 = (void *)sub_19CFDF554();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v14 = (void *)sub_19CFDF3B0();
  swift_bridgeObjectRelease();
  v16.receiver = v8;
  v16.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v16, sel_initWithField_configuration_, v12, v14);

  if (v13)
  return v13;
}

uint64_t AllowedFieldValuesTreatmentAction.perform(_:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;

  sub_19CD40794(a1, (uint64_t)v7);
  if (!v7[3])
  {
    sub_19CCECFE4((uint64_t)v7, &qword_1ECEB3370);
    v8 = 0u;
    v9 = 0u;
    v10 = 0;
    goto LABEL_8;
  }
  v4 = MEMORY[0x1E0DEC198];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v10 = 0;
    v8 = 0u;
    v9 = 0u;
    goto LABEL_8;
  }
  if (!*((_QWORD *)&v9 + 1))
  {
LABEL_8:
    result = sub_19CCECFE4((uint64_t)&v8, qword_1EE443C98);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return result;
  }
  v11[0] = v8;
  v11[1] = v9;
  v12 = v10;
  if ((sub_19CDC193C((uint64_t)v11, *(_QWORD *)(v2 + OBJC_IVAR____TtC9JetEngine33AllowedFieldValuesTreatmentAction_allowList)) & 1) != 0)
  {
    *(_QWORD *)(a2 + 24) = v4;
    v5 = swift_allocObject();
    sub_19CD23A14((uint64_t)v11, v5 + 16);
    result = sub_19CD20334((uint64_t)v11);
    *(_QWORD *)a2 = v5;
  }
  else
  {
    result = sub_19CD20334((uint64_t)v11);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

id AllowedFieldValuesTreatmentAction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19CFC99E0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t type metadata accessor for AllowedFieldValuesTreatmentAction()
{
  return objc_opt_self();
}

uint64_t sub_19CFC9A28(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0F10);
  v2 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  v4 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 24) = v4;
  *(_BYTE *)(v2 + 32) = 0;
  v13 = sub_19CFC9BEC;
  v14 = v2;
  v5 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 1107296256;
  v11 = sub_19CD0C78C;
  v12 = &block_descriptor_9_1;
  v6 = _Block_copy(&v9);
  swift_retain_n();
  swift_release();
  objc_msgSend(a1, sel_addSuccessBlock_, v6);
  _Block_release(v6);
  v13 = sub_19CF4F30C;
  v14 = v2;
  v9 = v5;
  v10 = 1107296256;
  v11 = sub_19CCDB9F8;
  v12 = &block_descriptor_12_4;
  v7 = _Block_copy(&v9);
  swift_release();
  objc_msgSend(a1, sel_addErrorBlock_, v7);

  _Block_release(v7);
  return v2;
}

uint64_t sub_19CFC9B84()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_19CFC9BA8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = (id)sub_19CFDEC90();
  objc_msgSend(v1, sel_finishWithError_, v2);

}

_QWORD *RunLoopWorkerThread.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)swift_allocObject();
  v4[5] = 0;
  v4[6] = 0;
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v4[7] = MEMORY[0x1E0DEE9D8];
  return v4;
}

Swift::Void __swiftcall RunLoopWorkerThread.PendingTask.cancel()()
{
  __CFRunLoopTimer *v0;
  __CFRunLoopTimer *v1;

  v0 = (__CFRunLoopTimer *)MEMORY[0x1A1ADBF98]();
  if (v0)
  {
    v1 = v0;
    CFRunLoopTimerInvalidate(v0);

  }
}

uint64_t sub_19CFC9CA0()
{
  uint64_t result;

  result = sub_19CFDF554();
  qword_1ECEB0F70 = result;
  return result;
}

id static RunLoopWorkerThread.willStopNotification.getter()
{
  if (qword_1EE43D130 != -1)
    swift_once();
  return (id)qword_1ECEB0F70;
}

_QWORD *RunLoopWorkerThread.init(name:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[5] = 0;
  v2[6] = 0;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v2[7] = MEMORY[0x1E0DEE9D8];
  return v2;
}

uint64_t RunLoopWorkerThread.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_19CFC9D84()
{
  uint64_t v0;
  void *v1;
  _BOOL8 v2;

  v1 = *(void **)(v0 + 32);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + 40) != 0;
  objc_msgSend(v1, sel_unlock);
  return v2;
}

void sub_19CFC9DD0()
{
  sub_19CD08E38(25, 0);
}

id sub_19CFC9DDC()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  __CFRunLoopSource *v4;
  __CFRunLoop *v5;
  void *v6;
  void *v7;

  v1 = (void *)v0[4];
  objc_msgSend(v1, sel_lock);
  v2 = (void *)v0[5];
  if (v2)
  {
    v3 = (void *)v0[6];
    if (v3)
    {
      v4 = v3;
      v5 = v2;
      CFRunLoopSourceInvalidate(v4);
      CFRunLoopStop(v5);
      v6 = (void *)v0[6];
      v0[6] = 0;

      v7 = (void *)v0[5];
      v0[5] = 0;

    }
  }
  swift_beginAccess();
  v0[7] = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
  return objc_msgSend(v1, sel_unlock);
}

void sub_19CFC9EA8(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v3 = v2;
  if (qword_1EE43D130 != -1)
  {
    swift_once();
    v2 = v3;
  }
  objc_msgSend(v2, sel_postNotificationName_object_, qword_1ECEB0F70, a1);

}

uint64_t sub_19CFC9F38@<X0>(uint64_t (*a1)(id)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  void *v11;
  __CFRunLoop *v12;
  void *v13;
  __CFRunLoop *v14;
  id v15;
  uint64_t v16;
  __CFRunLoop *v17;
  char v18;
  id v19;
  uint64_t result;
  dispatch_semaphore_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(id);
  uint64_t v35;

  v34 = a1;
  v35 = a2;
  v33 = a4;
  v6 = sub_19CFDFF5C();
  v32 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v31 - v9;
  v11 = *(void **)(v4 + 32);
  objc_msgSend(v11, sel_lock, v8);
  v12 = CFRunLoopGetCurrent();
  v13 = *(void **)(v4 + 40);
  if (!v12)
  {
    if (v13)
      goto LABEL_8;
    goto LABEL_6;
  }
  v14 = v12;
  if (!v13)
  {

    goto LABEL_8;
  }
  type metadata accessor for CFRunLoop(0);
  sub_19CCC5C88(&qword_1ECEB2470, (uint64_t (*)(uint64_t))type metadata accessor for CFRunLoop, (uint64_t)&unk_19D051DF8);
  v15 = v13;
  v16 = v6;
  v17 = v14;
  v18 = sub_19CFDF134();

  v6 = v16;
  if ((v18 & 1) != 0)
  {
LABEL_6:
    v19 = objc_msgSend(v11, sel_unlock);
    return v34(v19);
  }
LABEL_8:
  objc_msgSend(v11, sel_unlock);
  v21 = dispatch_semaphore_create(0);
  v22 = swift_allocBox();
  v24 = v23;
  v25 = *(_QWORD *)(a3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, a3);
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = a3;
  v26[3] = v22;
  v27 = v35;
  v26[4] = v34;
  v26[5] = v27;
  v26[6] = v21;
  swift_retain();
  swift_retain();
  v28 = v21;
  v29 = v6;
  v30 = v28;
  sub_19CD47F88((uint64_t)sub_19CFCA540, (uint64_t)v26);
  swift_release();
  sub_19CFDFE9C();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v10, v24, v29);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, a3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {

    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v33, v10, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_19CFCA1A8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v7 = sub_19CFDFF5C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v14 - v10;
  v12 = swift_projectBox();
  a2();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v11, 0, 1, a5);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v12, v11, v7);
  return sub_19CFDFEA8();
}

uint64_t sub_19CFCA28C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v16;

  v9 = type metadata accessor for Result(0, a3, a3, a4);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v16 - v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a1;
  v14[4] = a2;
  swift_retain();
  sub_19CFC9F38((uint64_t (*)(id))sub_19CFCA574, (uint64_t)v14, v9, (uint64_t)v13);
  swift_release();
  Result.unwrap()(v9, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

unint64_t sub_19CFCA388()
{
  sub_19CFE010C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19CFDF698();
  swift_bridgeObjectRelease();
  sub_19CFDF698();
  return 0xD000000000000014;
}

id *RunLoopWorkerThread.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RunLoopWorkerThread.__deallocating_deinit()
{
  id *v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_19CFCA4A4()
{
  return sub_19CFCA388();
}

uint64_t sub_19CFCA4C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFCA4E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_19CFCA50C()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_19CFCA540()
{
  uint64_t v0;

  return sub_19CFCA1A8(*(_QWORD *)(v0 + 24), *(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16));
}

uint64_t sub_19CFCA550()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFCA574@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return Result.init(trying:)(*(void (**)(double))(v2 + 24), *(_QWORD *)(v2 + 16), a1, a2);
}

uint64_t method lookup function for RunLoopWorkerThread()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RunLoopWorkerThread.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.isRunning.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.start(qualityOfService:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 216))(a1, a2 & 1);
}

uint64_t dispatch thunk of RunLoopWorkerThread.stop()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.scheduleAfter(delay:execute:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.scheduleSync<A>(task:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of RunLoopWorkerThread.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

void sub_19CFCA610()
{
  uint64_t v0;

  sub_19CFC9EA8(v0);
}

void EventTimeMetricsFieldProvider.category.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

id sub_19CFCA62C(uint64_t a1)
{
  return EventTimeMetricsFieldProvider.addMetricsFields(into:using:)(a1);
}

ValueMetadata *type metadata accessor for EventTimeMetricsFieldProvider()
{
  return &type metadata for EventTimeMetricsFieldProvider;
}

_QWORD *sub_19CFCA650(_QWORD *(*a1)(unsigned int *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  unsigned int v8;
  _QWORD v9[2];
  unsigned int v10;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    result = (_QWORD *)sub_19CFE0100();
    if (!v4)
      return (_QWORD *)v10;
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v9[0] = a3;
    v9[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    result = a1(&v8, v9);
    if (!v4)
      return (_QWORD *)v8;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v6 = sub_19CFE01FC();
    result = a1((unsigned int *)v9, (_QWORD *)v6);
    if (!v4)
      return (_QWORD *)LODWORD(v9[0]);
  }
  return result;
}

uint64_t _Lazy_KeyedBy.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v7 = a1;
  v3 = sub_19CFDF464();
  result = sub_19CDF6428((uint64_t)&v7, v3, v4, v5, &v8);
  *a2 = v8;
  return result;
}

uint64_t _Lazy_KeyedBy.wrappedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_19CFDF464();
  v3 = type metadata accessor for LazyValueWrapper(0, v0, v1, v2);
  swift_retain();
  sub_19CDF67BC(v3, v4, v5, (uint64_t)&v7);
  swift_release();
  return v7;
}

uint64_t sub_19CFCA848@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result;

  type metadata accessor for _Lazy_KeyedBy(0, *(_QWORD *)(a2 + a1 - 24), *(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  result = _Lazy_KeyedBy.wrappedValue.getter();
  *a3 = result;
  return result;
}

uint64_t sub_19CFCA894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for _Lazy_KeyedBy(0, *(_QWORD *)(a4 + a3 - 24), *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
  v4 = swift_bridgeObjectRetain();
  sub_19CFCB2B0(v4);
  return swift_bridgeObjectRelease();
}

uint64_t _Lazy_KeyedBy.wrappedValue.setter(uint64_t a1)
{
  sub_19CFCB2B0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t (*_Lazy_KeyedBy.wrappedValue.modify(uint64_t *a1, uint64_t a2))(uint64_t *a1, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = _Lazy_KeyedBy.wrappedValue.getter();
  return sub_19CFCA944;
}

uint64_t sub_19CFCA944(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = swift_bridgeObjectRetain();
    sub_19CFCB2B0(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_19CFCB2B0(v2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t _Lazy_KeyedBy.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_19CFDF464();
  v3 = type metadata accessor for LazyValueWrapper(0, v0, v1, v2);
  MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for LazyValueWrapper<A>, v3);
  sub_19CFE067C();
  return 0;
}

uint64_t _Lazy_KeyedBy.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9[2];
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v13 = _Lazy_KeyedBy.wrappedValue.getter();
  v2 = sub_19CFDF464();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE441798);
  if (swift_dynamicCast())
  {
    sub_19CCD14C4(v9, (uint64_t)v11);
    __swift_project_boxed_opaque_existential_1(v11, v12);
    sub_19CFDF4B8();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  }
  else
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
    sub_19CCECFE4((uint64_t)v9, &qword_1EE4417A0);
    v8 = sub_19CFE01D8();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43E9B8);
    v6 = _Lazy_KeyedBy.wrappedValue.getter();
    v5[3] = v2;
    *v5 = v6;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_19CFE09B8();
    v11[0] = 0;
    v11[1] = 0xE000000000000000;
    sub_19CFE010C();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v9[0] = 60;
    *((_QWORD *)&v9[0] + 1) = 0xE100000000000000;
    v7 = _Lazy_KeyedBy.wrappedValue.getter();
    v12 = v2;
    v11[0] = v7;
    runtimeType(of:)(v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
    sub_19CFE0A90();
    sub_19CFDF698();
    swift_bridgeObjectRelease();
    sub_19CFDF698();
    sub_19CFE019C();
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v8 - 8) + 104))(v5, *MEMORY[0x1E0DEC4B0]);
    return swift_willThrow();
  }
}

uint64_t sub_19CFCAC54(_QWORD *a1)
{
  return _Lazy_KeyedBy.encode(to:)(a1);
}

uint64_t _Lazy_KeyedBy<>._partiallyEncode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = _Lazy_KeyedBy.wrappedValue.getter();
  Dictionary<>._partiallyEncode(to:)(a1, v6, *(_QWORD *)(a2 + 24), a3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_19CFCACB8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return _Lazy_KeyedBy<>._partiallyEncode(to:)(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t _Lazy_KeyedBy<>.init(deserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _OWORD v15[2];
  uint64_t v16;

  v9 = *a2;
  sub_19CD3E448(a1, (uint64_t)v15);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  v11 = v15[1];
  *(_OWORD *)(v10 + 32) = v15[0];
  *(_OWORD *)(v10 + 48) = v11;
  *(_QWORD *)(v10 + 64) = v16;
  *(_QWORD *)(v10 + 72) = v9;
  v12 = sub_19CFDF464();
  sub_19CDF6380((uint64_t)sub_19CFCB30C, v10, v12, v13, (uint64_t *)v15);
  result = sub_19CD3E3F8(a1);
  *a5 = *(_QWORD *)&v15[0];
  return result;
}

uint64_t sub_19CFCAD90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18[3];
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;

  JSONObject.dictionary.getter((uint64_t)&v21);
  if (*((_QWORD *)&v22 + 1))
  {
    v24[0] = v21;
    v24[1] = v22;
    v25 = v23;
    sub_19CDC61F4((uint64_t)v24, (uint64_t)&v21);
    v18[0] = a1;
    swift_bridgeObjectRetain();
    v9 = Dictionary<>.init(deserializing:using:)((uint64_t)&v21, v18, a2, a3);
    if (v4)
    {
      swift_bridgeObjectRetain();
      sub_19CF8E570(0xD000000000000027, 0x800000019D06E560, a1, (uint64_t)&v21);
      swift_bridgeObjectRelease();
      sub_19CE3C5DC((uint64_t)&v21, (uint64_t)v18);
      v10 = v19;
      if (v19)
      {
        v11 = v20;
        __swift_project_boxed_opaque_existential_1(v18, v19);
        v12 = sub_19CFDF464();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8))(v12, v4, v10, v11);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
      }
      else
      {
        sub_19CCECFE4((uint64_t)v18, qword_1EE43A238);
      }
      swift_willThrow();
      sub_19CCECFE4((uint64_t)&v21, qword_1EE43A238);
      return sub_19CDC6248((uint64_t)v24);
    }
    else
    {
      v17 = v9;
      result = sub_19CDC6248((uint64_t)v24);
      *a4 = v17;
    }
  }
  else
  {
    sub_19CCECFE4((uint64_t)&v21, &qword_1EE43C1C8);
    v13 = type metadata accessor for _Lazy_KeyedBy(0, MEMORY[0x1E0DEA968], a2, MEMORY[0x1E0DEA978]);
    sub_19CDC5494();
    swift_allocError();
    v14 = MEMORY[0x1E0DEE9D8];
    *v15 = v13;
    v15[1] = v14;
    v15[2] = 0;
    v15[3] = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_19CFCAF80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  return _Lazy_KeyedBy<>.init(deserializing:using:)(a1, a2, *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 8), a5);
}

uint64_t _Lazy_KeyedBy<>.init(_partiallyDeserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _OWORD v15[2];
  uint64_t v16;

  v9 = *a2;
  sub_19CD3E448(a1, (uint64_t)v15);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  v11 = v15[1];
  *(_OWORD *)(v10 + 32) = v15[0];
  *(_OWORD *)(v10 + 48) = v11;
  *(_QWORD *)(v10 + 64) = v16;
  *(_QWORD *)(v10 + 72) = v9;
  v12 = sub_19CFDF464();
  sub_19CDF6380((uint64_t)sub_19CFCB330, v10, v12, v13, (uint64_t *)v15);
  result = sub_19CD3E3F8(a1);
  *a5 = *(_QWORD *)&v15[0];
  return result;
}

uint64_t sub_19CFCB05C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result;
  _BYTE v10[40];
  uint64_t v11;

  sub_19CD3E448(a1, (uint64_t)v10);
  v11 = a2;
  swift_bridgeObjectRetain();
  result = Dictionary<>.init(_partiallyDeserializing:using:)((uint64_t)v10, &v11, a3, a4);
  *a5 = result;
  return result;
}

uint64_t sub_19CFCB0D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  return _Lazy_KeyedBy<>.init(_partiallyDeserializing:using:)(a1, a2, *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 8), a5);
}

uint64_t static _Lazy_KeyedBy<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;

  type metadata accessor for _Lazy_KeyedBy(0, a3, a4, a5);
  _Lazy_KeyedBy.wrappedValue.getter();
  _Lazy_KeyedBy.wrappedValue.getter();
  v5 = sub_19CFDF488();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_19CFCB188(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static _Lazy_KeyedBy<>.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t _Lazy_KeyedBy<>.hash(into:)()
{
  _Lazy_KeyedBy.wrappedValue.getter();
  sub_19CFDF47C();
  return swift_bridgeObjectRelease();
}

uint64_t _Lazy_KeyedBy<>.hashValue.getter()
{
  sub_19CFE08C8();
  _Lazy_KeyedBy<>.hash(into:)();
  return sub_19CFE0910();
}

uint64_t sub_19CFCB250()
{
  return _Lazy_KeyedBy<>.hashValue.getter();
}

uint64_t sub_19CFCB258()
{
  return _Lazy_KeyedBy<>.hash(into:)();
}

uint64_t sub_19CFCB260()
{
  sub_19CFE08C8();
  _Lazy_KeyedBy<>.hash(into:)();
  return sub_19CFE0910();
}

void sub_19CFCB2B0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = *v1;
  v9[0] = a1;
  v9[1] = v2;
  v3 = sub_19CFDF464();
  v6 = type metadata accessor for LazyValueWrapper(0, v3, v4, v5);
  sub_19CDF6F58((uint64_t)v9, v6, v7, v8);
}

uint64_t sub_19CFCB30C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_19CFCAD90(v1[9], v1[2], v1[3], a1);
}

uint64_t sub_19CFCB330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_19CFCB05C((uint64_t)(v1 + 4), v1[9], v1[2], v1[3], a1);
}

uint64_t type metadata accessor for _Lazy_KeyedBy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _Lazy_KeyedBy);
}

uint64_t sub_19CFCB35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for <> _Lazy_KeyedBy<A, B>, a1, &v4);
}

uint64_t sub_19CFCB39C()
{
  return 24;
}

__n128 sub_19CFCB3A8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t MetricsLogger.Configuration.recorder.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_19CCD5B84(v1, a1);
}

uint64_t MetricsLogger.Configuration.recorder.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  return sub_19CCD14C4(a1, v1);
}

uint64_t (*MetricsLogger.Configuration.recorder.modify())()
{
  return nullsub_1;
}

uint64_t MetricsLogger.Configuration.eventTopic.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MetricsLogger.Configuration.eventTopic.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*MetricsLogger.Configuration.eventTopic.modify())()
{
  return nullsub_1;
}

double MetricsLogger.Configuration.samplingPercentage.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void MetricsLogger.Configuration.samplingPercentage.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 56) = a1;
}

uint64_t (*MetricsLogger.Configuration.samplingPercentage.modify())()
{
  return nullsub_1;
}

double MetricsLogger.Configuration.samplingDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void MetricsLogger.Configuration.samplingDuration.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*MetricsLogger.Configuration.samplingDuration.modify())()
{
  return nullsub_1;
}

uint64_t sub_19CFCB4B4()
{
  uint64_t result;

  sub_19CD16BB8();
  result = sub_19CFDFEE4();
  qword_1EE465AF8 = result;
  return result;
}

uint64_t MetricsLogger.__allocating_init(loggerName:configuration:)(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_19CCD5B84((uint64_t)a3, v6 + 32);
  v7 = *((_QWORD *)a3 + 6);
  *(double *)(v6 + 72) = a3[5];
  *(_QWORD *)(v6 + 80) = v7;
  v8 = a3[7];
  v9 = a3[8];
  swift_bridgeObjectRetain();
  sub_19CCF5918(6778732, 0xE300000000000000, (uint64_t)&v13, v8, v9);
  sub_19CD5FB04((uint64_t)a3);
  v10 = v14;
  v11 = v15;
  *(_OWORD *)(v6 + 88) = v13;
  *(_QWORD *)(v6 + 104) = v10;
  *(_QWORD *)(v6 + 112) = v11;
  *(_OWORD *)(v6 + 120) = v16;
  return v6;
}

Swift::Void __swiftcall MetricsLogger.log(contentsOf:withLevel:)(Swift::OpaquePointer contentsOf, JetEngine::LogMessageLevel withLevel)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
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
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD v24[11];
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  uint64_t v32;

  v3 = v2;
  v4 = (unsigned __int8 *)withLevel;
  v32 = *MEMORY[0x1E0C80C00];
  v25 = sub_19CFDEDE0();
  v24[8] = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25, v5);
  v24[7] = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v24[10] = (char *)v24 - v9;
  v10 = *v4;
  v11 = *(_QWORD *)(v2 + 104);
  v12 = *(_QWORD *)(v2 + 112);
  v28 = *(_OWORD *)(v2 + 88);
  v29 = v11;
  v30 = v12;
  v31 = *(_OWORD *)(v2 + 120);
  if ((sub_19CDD6458() & 1) != 0)
  {
    v13 = MEMORY[0x1E0DEA968];
    v30 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v28 = 6778732;
    *((_QWORD *)&v28 + 1) = 0xE300000000000000;
    sub_19CD433C0(&v28, &v27);
    v14 = MEMORY[0x1E0DEE9E0];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = v14;
    sub_19CD13D40(&v27, 0x707954746E657665, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
    v16 = v26;
    swift_bridgeObjectRelease();
    if (qword_1EE43A210 != -1)
      swift_once();
    v17 = (void *)qword_1EE465AF8;
    v30 = sub_19CD16BB8();
    *(_QWORD *)&v28 = v17;
    sub_19CD433C0(&v28, &v27);
    v18 = v17;
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v26 = v16;
    sub_19CD13D40(&v27, 0x726556746E657665, 0xEC0000006E6F6973, v19);
    v20 = v26;
    swift_bridgeObjectRelease();
    v21 = *(_QWORD *)(v3 + 16);
    v22 = *(_QWORD *)(v3 + 24);
    v30 = v13;
    *(_QWORD *)&v28 = v21;
    *((_QWORD *)&v28 + 1) = v22;
    sub_19CD433C0(&v28, &v27);
    swift_bridgeObjectRetain();
    v23 = swift_isUniquelyReferenced_nonNull_native();
    v26 = v20;
    sub_19CD13D40(&v27, 0x614E726567676F6CLL, 0xEA0000000000656DLL, v23);
    swift_bridgeObjectRelease();
    __asm { BR              X11 }
  }
}

uint64_t MetricsLogger.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_19CFCC2F0(Swift::OpaquePointer a1, JetEngine::LogMessageLevel a2)
{
  MetricsLogger.log(contentsOf:withLevel:)(a1, a2);
}

void sub_19CFCC310(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
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
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char **v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  unsigned __int8 v71;
  uint64_t v72;
  void *v73;
  unsigned __int8 v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  __int128 v112;
  int64_t v113;
  _QWORD v114[4];
  __int128 v115;
  uint64_t v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3030);
  MEMORY[0x1E0C80A78](v8, v9);
  v104 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v98 - v13;
  v105 = sub_19CFDEDE0();
  v106 = *(_QWORD *)(v105 - 8);
  MEMORY[0x1E0C80A78](v105, v15);
  v101 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v18);
  v100 = (char *)&v98 - v19;
  v113 = a4 >> 1;
  v20 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_53;
  v103 = v14;
  v119 = MEMORY[0x1E0DEE9D8];
  sub_19CD5227C(0, v20 & ~(v20 >> 63), 0);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v102 = a1;
    swift_unknownObjectRetain();
    v21 = MEMORY[0x1E0DEE9B8];
    v22 = &unk_19D052000;
    v108 = a3;
    if (v20)
    {
      v110 = (id)objc_opt_self();
      v23 = 0;
      v99 = a2;
      v24 = a2 + 32 * a3;
      v25 = a3 - v113;
      v26 = &unk_1E3DEF208;
      v109 = v21 + 8;
      v107 = xmmword_19D0522A0;
      v111 = v20;
      while (1)
      {
        if (__OFADD__(v23, 1))
        {
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
        if (!(v25 + v23))
          goto LABEL_50;
        if (a3 + v23 >= v113 || v23 >= v20)
          goto LABEL_51;
        *(_QWORD *)&v112 = v23 + 1;
        sub_19CD436B0(v24, (uint64_t)&v115);
        v118 = v109;
        v27 = swift_allocObject();
        v28 = v27 + 16;
        *(_QWORD *)&v117 = v27;
        sub_19CD436B0((uint64_t)&v115, v27 + 16);
        sub_19CD436B0(v28, (uint64_t)v114);
        v29 = sub_19CFE0808();
        v30 = v110;
        v31 = objc_msgSend(v110, sel_isValidJSONObject_, v29);
        swift_unknownObjectRelease();
        sub_19CD436B0((uint64_t)&v117, (uint64_t)v114);
        if ((v31 & 1) != 0)
          break;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2BA0);
        v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = v107;
        sub_19CD436B0((uint64_t)v114, v32 + 32);
        v33 = v24;
        v34 = v26;
        v35 = a3;
        v36 = v25;
        v37 = v30;
        v38 = (void *)sub_19CFDF854();
        swift_bridgeObjectRelease();
        v39 = v37;
        v25 = v36;
        a3 = v35;
        v26 = v34;
        v24 = v33;
        v40 = objc_msgSend(v39, sel_isValidJSONObject_, v38);

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v114);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v117);
        if ((v40 & 1) != 0)
          goto LABEL_12;
        sub_19CD436B0((uint64_t)&v115, (uint64_t)&v117);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB1F50);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v44 = (void *)v114[0];
          v45 = (void *)sub_19CFDEC90();
          v46 = (id)AMSLogableError();

          v47 = sub_19CFDF578();
          v49 = v48;

          v118 = MEMORY[0x1E0DEA968];
          *(_QWORD *)&v117 = v47;
          *((_QWORD *)&v117 + 1) = v49;
          a3 = v108;
        }
        else
        {
          sub_19CD436B0((uint64_t)&v115, (uint64_t)&v117);
          v50 = (uint64_t)v104;
          v51 = v105;
          v52 = swift_dynamicCast();
          v53 = v106;
          v54 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56);
          if (!v52)
          {
            v54(v50, 1, 1, v51);
LABEL_25:
            sub_19CCECFE4(v50, (uint64_t *)&unk_1ECEB3030);
            sub_19CD436B0((uint64_t)&v115, (uint64_t)&v117);
            v61 = sub_19CFDF5E4();
            v118 = MEMORY[0x1E0DEA968];
            *(_QWORD *)&v117 = v61;
            *((_QWORD *)&v117 + 1) = v62;
            goto LABEL_13;
          }
          v54(v50, 0, 1, v51);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v50, 1, v51) == 1)
            goto LABEL_25;
          v55 = v101;
          (*(void (**)(char *, uint64_t, uint64_t))(v106 + 32))(v101, v50, v51);
          v56 = (void *)sub_19CFDED2C();
          v57 = (id)AMSLogableURL();

          v58 = sub_19CFDF578();
          v60 = v59;

          v118 = MEMORY[0x1E0DEA968];
          *(_QWORD *)&v117 = v58;
          *((_QWORD *)&v117 + 1) = v60;
          (*(void (**)(char *, uint64_t))(v106 + 8))(v55, v105);
        }
LABEL_13:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v115);
        v41 = v119;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_19CD5227C(0, *(_QWORD *)(v41 + 16) + 1, 1);
          v41 = v119;
        }
        v43 = *(_QWORD *)(v41 + 16);
        v42 = *(_QWORD *)(v41 + 24);
        if (v43 >= v42 >> 1)
        {
          sub_19CD5227C(v42 > 1, v43 + 1, 1);
          v41 = v119;
        }
        *(_QWORD *)(v41 + 16) = v43 + 1;
        sub_19CD433C0(&v117, (_OWORD *)(v41 + 32 * v43 + 32));
        ++v23;
        v24 += 32;
        v20 = v111;
        if ((_QWORD)v112 == v111)
        {
          v63 = a3 + v23;
          a2 = v99;
          v22 = (_OWORD *)&unk_19D052000;
          goto LABEL_27;
        }
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v114);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v117);
LABEL_12:
      v118 = MEMORY[0x1E0DEE9B8] + 8;
      *(_QWORD *)&v117 = swift_allocObject();
      sub_19CD436B0((uint64_t)&v115, v117 + 16);
      goto LABEL_13;
    }
    v63 = a3;
LABEL_27:
    v64 = &selRef_removeObserver_;
    if (v63 == v113)
    {
LABEL_28:
      swift_unknownObjectRelease();
      return;
    }
    v65 = a2 + 32 * v63;
    v66 = MEMORY[0x1E0DEE9B8] + 8;
    v112 = v22[42];
    v67 = v63;
    while (1)
    {
      if (v63 < a3 || v67 >= v113)
        goto LABEL_52;
      sub_19CD436B0(v65, (uint64_t)&v117);
      v116 = v66;
      v68 = swift_allocObject();
      v69 = v68 + 16;
      *(_QWORD *)&v115 = v68;
      sub_19CD436B0((uint64_t)&v117, v68 + 16);
      v70 = (void *)objc_opt_self();
      sub_19CD436B0(v69, (uint64_t)v114);
      v71 = objc_msgSend(v70, v64[393], sub_19CFE0808());
      swift_unknownObjectRelease();
      sub_19CD436B0((uint64_t)&v115, (uint64_t)v114);
      if ((v71 & 1) != 0)
        break;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2BA0);
      v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = v112;
      sub_19CD436B0((uint64_t)v114, v72 + 32);
      v73 = (void *)sub_19CFDF854();
      swift_bridgeObjectRelease();
      v74 = objc_msgSend(v70, v64[393], v73);

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v114);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v115);
      if ((v74 & 1) != 0)
        goto LABEL_35;
      sub_19CD436B0((uint64_t)&v117, (uint64_t)&v115);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB1F50);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v78 = (void *)v114[0];
        v79 = (void *)sub_19CFDEC90();
        v80 = (id)AMSLogableError();

        v81 = sub_19CFDF578();
        v83 = v82;

        v116 = MEMORY[0x1E0DEA968];
        *(_QWORD *)&v115 = v81;
        *((_QWORD *)&v115 + 1) = v83;
        v64 = &selRef_removeObserver_;
      }
      else
      {
        sub_19CD436B0((uint64_t)&v117, (uint64_t)&v115);
        v84 = (uint64_t)v103;
        v85 = v105;
        v86 = swift_dynamicCast();
        v87 = v106;
        v88 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56);
        if (!v86)
        {
          v88(v84, 1, 1, v85);
LABEL_48:
          sub_19CCECFE4(v84, (uint64_t *)&unk_1ECEB3030);
          sub_19CD436B0((uint64_t)&v117, (uint64_t)&v115);
          v96 = sub_19CFDF5E4();
          v116 = MEMORY[0x1E0DEA968];
          *(_QWORD *)&v115 = v96;
          *((_QWORD *)&v115 + 1) = v97;
          v64 = &selRef_removeObserver_;
          goto LABEL_36;
        }
        v88(v84, 0, 1, v85);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v84, 1, v85) == 1)
          goto LABEL_48;
        v89 = v100;
        v90 = v105;
        (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v100, v84, v105);
        v91 = (void *)sub_19CFDED2C();
        v92 = (id)AMSLogableURL();

        v93 = sub_19CFDF578();
        v95 = v94;

        v116 = MEMORY[0x1E0DEA968];
        *(_QWORD *)&v115 = v93;
        *((_QWORD *)&v115 + 1) = v95;
        (*(void (**)(char *, uint64_t))(v106 + 8))(v89, v90);
        v64 = &selRef_removeObserver_;
      }
LABEL_36:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v117);
      v75 = v119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19CD5227C(0, *(_QWORD *)(v75 + 16) + 1, 1);
        v75 = v119;
      }
      v77 = *(_QWORD *)(v75 + 16);
      v76 = *(_QWORD *)(v75 + 24);
      if (v77 >= v76 >> 1)
      {
        sub_19CD5227C(v76 > 1, v77 + 1, 1);
        v75 = v119;
      }
      ++v67;
      *(_QWORD *)(v75 + 16) = v77 + 1;
      sub_19CD433C0(&v115, (_OWORD *)(v75 + 32 * v77 + 32));
      v65 += 32;
      a3 = v108;
      if (v113 == v67)
        goto LABEL_28;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v114);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v115);
LABEL_35:
    v116 = MEMORY[0x1E0DEE9B8] + 8;
    *(_QWORD *)&v115 = swift_allocObject();
    sub_19CD436B0((uint64_t)&v117, v115 + 16);
    goto LABEL_36;
  }
LABEL_54:
  __break(1u);
}

uint64_t sub_19CFCCD54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v46[2];
  char *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  _QWORD v51[4];
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3030);
  MEMORY[0x1E0C80A78](v2, v3);
  v47 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19CFDEDE0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v46[0] = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v54 = MEMORY[0x1E0DEE9D8];
  sub_19CD5227C(0, v9, 0);
  v46[1] = a1;
  if (v9)
  {
    v48 = v6;
    v49 = v5;
    v10 = a1 + 32;
    swift_bridgeObjectRetain();
    v11 = (void *)objc_opt_self();
    v12 = MEMORY[0x1E0DEE9B8];
    v13 = MEMORY[0x1E0DEE9B8] + 8;
    v14 = &selRef_removeObserver_;
    v50 = xmmword_19D0522A0;
    while (1)
    {
      v53 = v13;
      v15 = swift_allocObject();
      v16 = v15 + 16;
      *(_QWORD *)&v52 = v15;
      sub_19CD436B0(v10, v15 + 16);
      sub_19CD436B0(v16, (uint64_t)v51);
      v17 = objc_msgSend(v11, v14[393], sub_19CFE0808());
      swift_unknownObjectRelease();
      sub_19CD436B0((uint64_t)&v52, (uint64_t)v51);
      if ((v17 & 1) != 0)
        break;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB2BA0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = v50;
      sub_19CD436B0((uint64_t)v51, v18 + 32);
      v19 = v12;
      v20 = (void *)sub_19CFDF854();
      swift_bridgeObjectRelease();
      v21 = objc_msgSend(v11, v14[393], v20);

      v12 = v19;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v52);
      if ((v21 & 1) != 0)
        goto LABEL_6;
      sub_19CD436B0(v10, (uint64_t)&v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB1F50);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v25 = (void *)v51[0];
        v26 = (void *)sub_19CFDEC90();
        v27 = (id)AMSLogableError();

        v28 = sub_19CFDF578();
        v30 = v29;

        v12 = v19;
        v53 = MEMORY[0x1E0DEA968];

        *(_QWORD *)&v52 = v28;
        *((_QWORD *)&v52 + 1) = v30;
      }
      else
      {
        sub_19CD436B0(v10, (uint64_t)&v52);
        v31 = (uint64_t)v47;
        v32 = v49;
        v33 = swift_dynamicCast();
        v34 = v48;
        v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56);
        if (!v33)
        {
          v35(v31, 1, 1, v32);
LABEL_19:
          sub_19CCECFE4(v31, (uint64_t *)&unk_1ECEB3030);
          sub_19CD436B0(v10, (uint64_t)&v52);
          v43 = sub_19CFDF5E4();
          v53 = MEMORY[0x1E0DEA968];
          *(_QWORD *)&v52 = v43;
          *((_QWORD *)&v52 + 1) = v44;
          goto LABEL_7;
        }
        v35(v31, 0, 1, v32);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v31, 1, v32) == 1)
          goto LABEL_19;
        v36 = v46[0];
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v48 + 32))(v46[0], v31, v49);
        v37 = (void *)sub_19CFDED2C();
        v38 = (id)AMSLogableURL();

        v39 = sub_19CFDF578();
        v41 = v40;

        v53 = MEMORY[0x1E0DEA968];
        *(_QWORD *)&v52 = v39;
        *((_QWORD *)&v52 + 1) = v41;
        v42 = v36;
        v12 = v19;
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v42, v49);
      }
LABEL_7:
      v22 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19CD5227C(0, *(_QWORD *)(v22 + 16) + 1, 1);
        v22 = v54;
      }
      v24 = *(_QWORD *)(v22 + 16);
      v23 = *(_QWORD *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_19CD5227C(v23 > 1, v24 + 1, 1);
        v22 = v54;
      }
      *(_QWORD *)(v22 + 16) = v24 + 1;
      sub_19CD433C0(&v52, (_OWORD *)(v22 + 32 * v24 + 32));
      v10 += 32;
      --v9;
      v14 = &selRef_removeObserver_;
      if (!v9)
        goto LABEL_21;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v52);
LABEL_6:
    v53 = v12 + 8;
    *(_QWORD *)&v52 = swift_allocObject();
    sub_19CD436B0(v10, v52 + 16);
    goto LABEL_7;
  }
  v22 = v54;
  swift_bridgeObjectRetain();
LABEL_21:
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t method lookup function for MetricsLogger()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MetricsLogger.__allocating_init(loggerName:configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t *assignWithCopy for MetricsLogger.Configuration(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  return a1;
}

uint64_t assignWithTake for MetricsLogger.Configuration(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t sub_19CFCD2CC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

void sub_19CFCD2F0(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[2];
  uint64_t v30;

  v7 = sub_19CFE01A8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_19CE35380(0x746E65726170, 0xE600000000000000, 1, a2);
  sub_19CF5D8AC(a1, v12, v29);
  if (v3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *a1;
    v14 = a1[1];
    v15 = *(_QWORD *)(*a1 + 16);
    if (v14 == v15)
    {
      sub_19CE35380(0x65756C6176, 0xE500000000000000, 1, a2);
      swift_bridgeObjectRelease();
      sub_19CFE019C();
      v16 = sub_19CFE01B4();
      swift_allocError();
      v18 = v17;
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v17, v11, v7);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC458], v16);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      swift_bridgeObjectRelease();
    }
    else if (v14 >= v15)
    {
      __break(1u);
    }
    else
    {
      v19 = v29[1];
      v30 = v29[0];
      v20 = (_QWORD *)(v13 + 32 * v14);
      v21 = v20[4];
      v22 = v20[5];
      v23 = v20[7];
      v28 = v20[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[1] = v14 + 1;
      v24 = MEMORY[0x1A1AD9838](v21, v22, v28, v23);
      v26 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a3 = v30;
      a3[1] = v19;
      a3[2] = v24;
      a3[3] = v26;
    }
  }
}

Swift::Bool __swiftcall ShelfID.isChild(of:)(JetEngine::PageID of)
{
  _QWORD *v1;

  if (*v1 == *(_QWORD *)of.value._countAndFlagsBits && v1[1] == *(_QWORD *)(of.value._countAndFlagsBits + 8))
    return 1;
  else
    return sub_19CFE06A0();
}

uint64_t static ShelfID.forShelves(in:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = sub_19CFCDFC8;
  *(_QWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 24) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19CFCD5A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v8 = *a1;
  swift_bridgeObjectRetain();
  sub_19CFE0598();
  sub_19CFDF698();
  result = swift_bridgeObjectRelease();
  *a4 = a2;
  a4[1] = a3;
  a4[2] = 35;
  a4[3] = 0xE100000000000000;
  v10 = v8 + 1;
  if (v8 == -1)
  {
    swift_bridgeObjectRetain();
    sub_19CFB43D4((uint64_t)"JetEngine/ShelfID.swift", 23, 2, 50, a2, a3);
    result = swift_bridgeObjectRelease();
    v10 = 0;
  }
  *a1 = v10;
  return result;
}

JetEngine::ShelfID __swiftcall ShelfID.init(at:in:)(Swift::UInt64 at, JetEngine::PageID in)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  JetEngine::ShelfID result;

  v3 = v2;
  v4 = *(_QWORD *)in.value._countAndFlagsBits;
  v5 = *(_QWORD *)(in.value._countAndFlagsBits + 8);
  sub_19CFE0598();
  sub_19CFDF698();
  v6 = swift_bridgeObjectRelease();
  *v3 = v4;
  v3[1] = v5;
  v3[2] = 35;
  v3[3] = 0xE100000000000000;
  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  result.parent.value._object = v7;
  result.parent.value._countAndFlagsBits = v6;
  return result;
}

JetEngine::ShelfID __swiftcall ShelfID.init(randomIn:)(JetEngine::PageID randomIn)
{
  _QWORD *v1;
  uint64_t *countAndFlagsBits;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[6];
  JetEngine::ShelfID result;

  countAndFlagsBits = (uint64_t *)randomIn.value._countAndFlagsBits;
  v3 = v1;
  v4 = sub_19CFDEFA8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *countAndFlagsBits;
  v10 = countAndFlagsBits[1];
  sub_19CFDEF9C();
  v11 = sub_19CFDEF90();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v21[4] = v11;
  v21[5] = v13;
  v21[2] = 45;
  v21[3] = 0xE100000000000000;
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  sub_19CD41144();
  v14 = sub_19CFE0004();
  v16 = v15;
  v17 = swift_bridgeObjectRelease();
  *v3 = v9;
  v3[1] = v10;
  v3[2] = v14;
  v3[3] = v16;
  result.value._object = v20;
  result.value._countAndFlagsBits = v19;
  result.parent.value._object = v18;
  result.parent.value._countAndFlagsBits = v17;
  return result;
}

uint64_t ShelfID.init<A>(id:kind:in:)@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v7 = *a2;
  v8 = a2[1];
  sub_19CFDF7F4();
  sub_19CFDF698();
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  *a4 = v7;
  a4[1] = v8;
  a4[2] = v10;
  a4[3] = v11;
  return result;
}

uint64_t ShelfID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD v33[4];
  uint64_t *v34;

  v5 = sub_19CFE01A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFE09D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  v10 = sub_19CFE06AC();
  v12 = v11;
  v34 = a2;
  v27 = 45;
  v28 = 0xE100000000000000;
  MEMORY[0x1E0C80A78](v10, v11);
  *(&v24 - 2) = (uint64_t)&v27;
  swift_bridgeObjectRetain();
  v13 = sub_19CD3C1F0(0x7FFFFFFFFFFFFFFFLL, 1, sub_19CD3C68C, (uint64_t)(&v24 - 4), v10, v12);
  swift_bridgeObjectRelease();
  v31 = v13;
  v32 = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v14 = (_QWORD *)sub_19CFE09B8();
  sub_19CFCD2F0(&v31, v14, &v27);
  v25 = v27;
  v26 = v28;
  v16 = v30;
  v24 = v29;
  v17 = v32;
  v18 = *(_QWORD *)(v13 + 16);
  result = swift_bridgeObjectRelease();
  if (v17 == v18)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    v19 = v34;
    v20 = v26;
    *v34 = v25;
    v19[1] = v20;
    v19[2] = v24;
    v19[3] = (uint64_t)v16;
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  v34 = v16;
  if (v17 >= v18)
  {
    __break(1u);
  }
  else
  {
    v32 = v17 + 1;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_19CFE09B8();
    sub_19CFE019C();
    v21 = sub_19CFE01B4();
    swift_allocError();
    v23 = v22;
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v22, v9, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x1E0DEC458], v21);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ShelfID.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFE0A0C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_19CFDF698();
  swift_bridgeObjectRetain();
  sub_19CFDF698();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_19CFE070C();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t ShelfID.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Bool __swiftcall ShelfID.isParent(of:)(JetEngine::ComponentID *of)
{
  uint64_t v1;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v4;
  void *v5;
  BOOL v6;
  char v7;
  Swift::Bool result;

  countAndFlagsBits = of->parent.value._countAndFlagsBits;
  object = of->parent.value._object;
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(void **)(v1 + 24);
  v6 = of->parent.parent.value._countAndFlagsBits == *(_QWORD *)v1
    && of->parent.parent.value._object == *(void **)(v1 + 8);
  if (v6 || (v7 = sub_19CFE06A0(), result = 0, (v7 & 1) != 0))
  {
    if (countAndFlagsBits == v4 && object == v5)
      return 1;
    else
      return sub_19CFE06A0();
  }
  return result;
}

uint64_t ShelfID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19CFDF650();
  return swift_bridgeObjectRelease();
}

uint64_t ShelfID.hashValue.getter()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  sub_19CFDF650();
  return sub_19CFE0910();
}

uint64_t sub_19CFCDE50()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  sub_19CFDF650();
  return sub_19CFE0910();
}

uint64_t sub_19CFCDEB4()
{
  sub_19CFDF650();
  return sub_19CFDF650();
}

uint64_t sub_19CFCDEF0()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  sub_19CFDF650();
  return sub_19CFE0910();
}

uint64_t sub_19CFCDF50@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ShelfID.init(from:)(a1, a2);
}

uint64_t sub_19CFCDF64(_QWORD *a1)
{
  return ShelfID.encode(to:)(a1);
}

uint64_t sub_19CFCDF78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19CFCDFA4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19CFCDFC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_19CFCD5A0(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

unint64_t sub_19CFCDFD4()
{
  unint64_t result;

  result = qword_1EE443D20;
  if (!qword_1EE443D20)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for ShelfID, &type metadata for ShelfID);
    atomic_store(result, (unint64_t *)&qword_1EE443D20);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShelfID()
{
  return &type metadata for ShelfID;
}

unint64_t sub_19CFCE02C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE443D28;
  if (!qword_1EE443D28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE443D30);
    result = MEMORY[0x1A1ADBD7C](MEMORY[0x1E0DEC5E8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE443D28);
  }
  return result;
}

uint64_t static PipelinePhase<>.rateLimitOnFailure(on:withID:using:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  __int128 v12;
  _OWORD v14[2];
  uint64_t v15;

  sub_19CD23A14(a2, (uint64_t)v14);
  type metadata accessor for PersistentPipelineBackoff();
  v11 = swift_allocObject();
  v12 = v14[1];
  *(_OWORD *)(v11 + 16) = v14[0];
  *(_OWORD *)(v11 + 32) = v12;
  *(_QWORD *)(v11 + 48) = v15;
  *(_QWORD *)(v11 + 56) = a3;
  *(_QWORD *)(v11 + 64) = a4;
  swift_retain();
  static PipelinePhase<>.rateLimitOnFailure(on:using:)(a1, v11, (uint64_t)&off_1E3DD44E0, a5, a6);
  return swift_release();
}

uint64_t type metadata accessor for PersistentPipelineBackoff()
{
  return objc_opt_self();
}

id sub_19CFCE144()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)JEUnfairLock), sel_init);
  qword_1ECEB1ED8 = (uint64_t)result;
  return result;
}

void *sub_19CFCE174()
{
  void *result;

  result = (void *)sub_19CE10E48(MEMORY[0x1E0DEE9D8]);
  off_1ECEB1EE0 = result;
  return result;
}

uint64_t sub_19CFCE198@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t);
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  double v18;
  uint64_t result;
  void *v20;

  if (qword_1ECEB1760 != -1)
    swift_once();
  v4 = a1 + 16;
  swift_beginAccess();
  v5 = off_1ECEB1EE0;
  if (*((_QWORD *)off_1ECEB1EE0 + 2) && (v6 = sub_19CD20240(a1 + 16), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(v5[7] + 16 * v6 + 8);
    swift_endAccess();
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    swift_unknownObjectRetain();
    v10(ObjectType, v8);
  }
  else
  {
    v12 = swift_endAccess();
    v13 = (*(uint64_t (**)(uint64_t))(a1 + 56))(v12);
    v15 = v14;
    swift_beginAccess();
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = off_1ECEB1EE0;
    off_1ECEB1EE0 = (_UNKNOWN *)0x8000000000000000;
    sub_19CE17FC4(v13, v15, v4, isUniquelyReferenced_nonNull_native);
    off_1ECEB1EE0 = v20;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v17 = swift_getObjectType();
    v11 = (*(double (**)(uint64_t, uint64_t))(v15 + 8))(v17, v15);
  }
  v18 = v11;
  result = swift_unknownObjectRelease();
  *a2 = v18;
  return result;
}

uint64_t sub_19CFCE32C()
{
  uint64_t v0;

  sub_19CD20334(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

double sub_19CFCE358()
{
  uint64_t v0;
  void *v1;
  double v3;

  if (qword_1ECEB1758 != -1)
    swift_once();
  v1 = (void *)qword_1ECEB1ED8;
  objc_msgSend((id)qword_1ECEB1ED8, sel_lock);
  sub_19CFCE198(v0, &v3);
  objc_msgSend(v1, sel_unlock);
  return v3;
}

id sub_19CFCE3EC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;

  if (qword_1ECEB1758 != -1)
    swift_once();
  v1 = (void *)qword_1ECEB1ED8;
  objc_msgSend((id)qword_1ECEB1ED8, sel_lock);
  if (qword_1ECEB1760 != -1)
    swift_once();
  swift_beginAccess();
  v2 = sub_19CDD3230(v0 + 16);
  v4 = v3;
  swift_endAccess();
  if (v2)
  {
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(ObjectType, v4);
    swift_unknownObjectRelease();
  }
  return objc_msgSend(v1, sel_unlock);
}

void static ImpressionsCalculator.Configuration.tenth.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FB999999999999ALL;
  *(_QWORD *)(a1 + 8) = 12337;
  *(_QWORD *)(a1 + 16) = 0xE200000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

void static ImpressionsCalculator.Configuration.quarter.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FD0000000000000;
  *(_QWORD *)(a1 + 8) = 13618;
  *(_QWORD *)(a1 + 16) = 0xE200000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

void static ImpressionsCalculator.Configuration.threeQuarters.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FE8000000000000;
  *(_QWORD *)(a1 + 8) = 13623;
  *(_QWORD *)(a1 + 16) = 0xE200000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

void static ImpressionsCalculator.Configuration.full.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FF0000000000000;
  *(_QWORD *)(a1 + 8) = 3158065;
  *(_QWORD *)(a1 + 16) = 0xE300000000000000;
  *(_BYTE *)(a1 + 24) = 1;
}

double ImpressionsCalculator.Configuration.impressionableThreshold.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t ImpressionsCalculator.Configuration.groupId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ImpressionsCalculator.Configuration.withImpressionableThreshold(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)(v2 + 8);
  v3 = *(_QWORD *)(v2 + 16);
  v5 = *(_BYTE *)(v2 + 24);
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t ImpressionsCalculator.Configuration.withGroupId(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v4;

  v4 = *(_BYTE *)(v3 + 24);
  *(_QWORD *)a3 = *(_QWORD *)v3;
  *(_QWORD *)(a3 + 8) = a1;
  *(_QWORD *)(a3 + 16) = a2;
  *(_BYTE *)(a3 + 24) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t ImpressionsCalculator.isVisible.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 256);
}

uint64_t sub_19CFCE60C(unsigned __int8 *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;

  v4 = sub_19CFDEF84();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a1) = *a1;
  v9 = *a2;
  result = swift_beginAccess();
  v11 = *(unsigned __int8 *)(v9 + 256);
  *(_BYTE *)(v9 + 256) = (_BYTE)a1;
  if ((_DWORD)a1 != v11)
  {
    v12 = sub_19CD2A25C();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    sub_19CFDEF78();
    sub_19CD29038((uint64_t)v8, v12, v14, v16, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void (*ImpressionsCalculator.isVisible.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = sub_19CFDEF84();
  v3[4] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[5] = v5;
  v3[6] = malloc(*(_QWORD *)(v5 + 64));
  swift_beginAccess();
  *((_BYTE *)v3 + 56) = *(_BYTE *)(v1 + 256);
  return sub_19CFCE77C;
}

void sub_19CFCE77C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;

  v1 = *(_QWORD **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = *(unsigned __int8 *)(*(_QWORD *)a1 + 56);
  v4 = *(unsigned __int8 *)(v2 + 256);
  *(_BYTE *)(v2 + 256) = v3;
  if (((v3 ^ v4) & 1) != 0)
  {
    v6 = v1[5];
    v5 = v1[6];
    v7 = v1[4];
    v8 = sub_19CD2A25C();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    sub_19CFDEF78();
    sub_19CD29038(v5, v8, v10, v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  free((void *)v1[6]);
  free(v1);
}

void (*ImpressionsCalculator.viewBounds.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = sub_19CFDEF84();
  v3[7] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[8] = v5;
  v3[9] = malloc(*(_QWORD *)(v5 + 64));
  v6 = sub_19CFDF32C();
  v3[10] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[11] = v7;
  v3[12] = malloc(*(_QWORD *)(v7 + 64));
  swift_beginAccess();
  return sub_19CFCE8C4;
}

void sub_19CFCE8C4(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;

  v3 = *a1;
  swift_endAccess();
  v4 = (uint64_t *)v3[12];
  if ((a2 & 1) != 0)
  {
LABEL_6:
    v19 = (void *)v3[9];
    free(v4);
    free(v19);
    free(v3);
    return;
  }
  v5 = v3[10];
  v6 = v3[11];
  sub_19CD48F8C();
  *v4 = sub_19CFDFDB8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v6 + 104))(v4, *MEMORY[0x1E0DEF740], v5);
  v7 = sub_19CFDF344();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v4, v5);
  if ((v7 & 1) != 0)
  {
    v8 = v3[6];
    swift_beginAccess();
    if (*(_BYTE *)(v8 + 256) == 1)
    {
      v10 = v3[8];
      v9 = v3[9];
      v11 = v3[7];
      v12 = sub_19CD2A25C();
      v14 = v13;
      v16 = v15;
      v18 = v17;
      sub_19CFDEF78();
      sub_19CD29038(v9, v12, v14, v16, v18);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
    v4 = (uint64_t *)v3[12];
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_19CFCE9F8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;

  v2 = *(_QWORD *)(result + 104);
  if (!v2)
    return result;
  v3 = *(_QWORD *)(result + 88);
  v4 = *(_QWORD *)(result + 96);
  v25 = *(_QWORD *)(result + 120);
  v26 = *(_QWORD *)(result + 80);
  v28 = *(_QWORD *)(result + 128);
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v5 = result;
  result = swift_release();
  if (v5 != v1)
    return result;
  swift_weakAssign();
  result = swift_beginAccess();
  v6 = 0;
  v7 = *(_QWORD *)(v1 + 24);
  v8 = *(_QWORD *)(v7 + 64);
  v27 = v7 + 64;
  v30 = v7;
  v9 = 1 << *(_BYTE *)(v7 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v29 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    v12 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v13 = v12 | (v6 << 6);
LABEL_25:
    v17 = *(_QWORD **)(*(_QWORD *)(v30 + 56) + 8 * v13);
    v19 = v17[9];
    v18 = v17[10];
    result = v17[11];
    v21 = v17[14];
    v20 = v17[15];
    if (result != v4 || v2 != v17[12])
    {
      result = sub_19CFE06A0();
      if ((result & 1) == 0)
        continue;
    }
    if (v18)
    {
      if (v3)
      {
        if (v19 == v26 && v18 == v3)
          goto LABEL_39;
        result = sub_19CFE06A0();
        if ((result & 1) != 0)
          goto LABEL_39;
      }
    }
    else if (!v3)
    {
LABEL_39:
      if (v20)
      {
        if (v28)
        {
          v24 = v21 == v25 && v20 == v28;
          if (v24 || (result = sub_19CFE06A0(), (result & 1) != 0))
          {
LABEL_46:
            swift_bridgeObjectRetain();
            swift_retain();
            sub_19CD2BA80(0);
            swift_release();
            return swift_release();
          }
        }
      }
      else if (!v28)
      {
        goto LABEL_46;
      }
    }
  }
  v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v14 >= v29)
    return result;
  v15 = *(_QWORD *)(v27 + 8 * v14);
  ++v6;
  if (v15)
    goto LABEL_24;
  v6 = v14 + 1;
  if (v14 + 1 >= v29)
    return result;
  v15 = *(_QWORD *)(v27 + 8 * v6);
  if (v15)
    goto LABEL_24;
  v6 = v14 + 2;
  if (v14 + 2 >= v29)
    return result;
  v15 = *(_QWORD *)(v27 + 8 * v6);
  if (v15)
  {
LABEL_24:
    v11 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_25;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
    return result;
  v15 = *(_QWORD *)(v27 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_24;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v29)
      return result;
    v15 = *(_QWORD *)(v27 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_24;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t ImpressionsCalculator.copyElements(from:)(uint64_t a1)
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
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;

  v3 = sub_19CFDEF84();
  v32 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v7 = *(_QWORD *)(a1 + 24);
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v8 + 64;
  v10 = 1 << *(_BYTE *)(v8 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v8 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v15 = 0;
  while (v12)
  {
    v16 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    v17 = v16 | (v15 << 6);
LABEL_20:
    v21 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v17);
    swift_beginAccess();
    *(_BYTE *)(v21 + 161) = 1;
    result = swift_beginAccess();
    v22 = *(_QWORD *)(v21 + 168);
    if (v22)
    {
      result = swift_beginAccess();
      v23 = *(unsigned __int8 *)(v22 + 256);
      *(_BYTE *)(v22 + 256) = 0;
      if (v23 == 1)
      {
        swift_retain();
        swift_retain();
        v24 = sub_19CD2A25C();
        v26 = v25;
        v28 = v27;
        v30 = v29;
        sub_19CFDEF78();
        sub_19CD29038((uint64_t)v6, v24, v26, v28, v30);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v3);
        swift_release();
        result = swift_release();
      }
    }
  }
  v18 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v18 >= v13)
    return swift_release();
  v19 = *(_QWORD *)(v9 + 8 * v18);
  ++v15;
  if (v19)
    goto LABEL_19;
  v15 = v18 + 1;
  if (v18 + 1 >= v13)
    return swift_release();
  v19 = *(_QWORD *)(v9 + 8 * v15);
  if (v19)
    goto LABEL_19;
  v15 = v18 + 2;
  if (v18 + 2 >= v13)
    return swift_release();
  v19 = *(_QWORD *)(v9 + 8 * v15);
  if (v19)
  {
LABEL_19:
    v12 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v15 << 6);
    goto LABEL_20;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    return swift_release();
  v19 = *(_QWORD *)(v9 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_19;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v13)
      return swift_release();
    v19 = *(_QWORD *)(v9 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_19;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t ImpressionsCalculator.removeElement(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  int v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *, char *, _QWORD *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t ObjectType;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  char v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[7];
  __int128 v50;
  uint64_t v51;
  uint64_t v52[8];

  v2 = v1;
  v4 = sub_19CFDEF84();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v38 = *(_OWORD *)(a1 + 56);
  v37 = *(_QWORD *)(a1 + 72);
  v41 = v11;
  v42 = v9;
  v52[0] = v9;
  v52[1] = v10;
  v52[2] = v11;
  v52[3] = v12;
  v39 = v14;
  v40 = v13;
  v52[4] = v13;
  v52[5] = v14;
  v52[6] = v15;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = sub_19CDD3308(v52);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v16)
  {
    swift_beginAccess();
    v18 = *(_QWORD *)(v16 + 168);
    if (v18)
    {
      swift_beginAccess();
      v19 = *(unsigned __int8 *)(v18 + 256);
      *(_BYTE *)(v18 + 256) = 0;
      if (v19 == 1)
      {
        swift_retain();
        v20 = sub_19CD2A25C();
        v22 = v21;
        v24 = v23;
        v26 = v25;
        sub_19CFDEF78();
        sub_19CD29038((uint64_t)v8, v20, v22, v24, v26);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        swift_release();
      }
    }
    v36 = v5;
    v27 = *(_QWORD *)(v2 + 72);
    ObjectType = swift_getObjectType();
    v49[0] = v42;
    v49[1] = v10;
    v49[2] = v41;
    v49[3] = v12;
    v49[4] = v40;
    v49[5] = v39;
    v49[6] = v15;
    v50 = v38;
    v51 = v37;
    sub_19CFDEF78();
    v28 = *(_QWORD *)(v2 + 184);
    v29 = *(_QWORD *)(v2 + 192);
    v30 = *(_BYTE *)(v2 + 200);
    v31 = *(_QWORD *)(v2 + 208);
    v32 = *(_QWORD *)(v2 + 248);
    v43[0] = *(_QWORD *)(v2 + 176);
    v43[1] = v28;
    v43[2] = v29;
    v44 = v30;
    v45 = v31;
    v46 = *(_OWORD *)(v2 + 216);
    v47 = *(_OWORD *)(v2 + 232);
    v48 = v32;
    v42 = v4;
    v33 = *(void (**)(_QWORD *, char *, _QWORD *, uint64_t, uint64_t))(v27 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v49, v8, v43, ObjectType, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v8, v42);
  }
  return result;
}

Swift::Void __swiftcall ImpressionsCalculator.changeImpressionableBounds(_:forElementWithID:)(__C::CGRect _, JetEngine::ImpressionMetrics::ID *forElementWithID)
{
  uint64_t v2;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  Swift::String element;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  _OWORD v33[3];
  void *object;

  height = _.size.height;
  width = _.size.width;
  y = _.origin.y;
  x = _.origin.x;
  v8 = sub_19CFDEF84();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) + 64;
  v13 = sub_19CFDF32C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (uint64_t *)((char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) + 64);
  element = forElementWithID->element;
  v33[0] = forElementWithID->parent;
  v33[1] = element;
  v33[2] = *(_OWORD *)&forElementWithID->index;
  object = forElementWithID->uniqueID.value._object;
  swift_beginAccess();
  v19 = *(_QWORD *)(v2 + 24);
  if (!*(_QWORD *)(v19 + 16))
    goto LABEL_9;
  sub_19CD2AF14((uint64_t)v33);
  v20 = sub_19CD2A4AC((uint64_t *)v33);
  if ((v21 & 1) == 0)
  {
    sub_19CD2AF5C((uint64_t)v33);
LABEL_9:
    swift_endAccess();
    return;
  }
  v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
  swift_endAccess();
  swift_retain();
  sub_19CD2AF5C((uint64_t)v33);
  swift_beginAccess();
  v23 = *(_QWORD *)(v22 + 168);
  if (!v23)
  {
LABEL_10:
    swift_release();
    return;
  }
  swift_beginAccess();
  *(CGFloat *)(v23 + 264) = x;
  *(CGFloat *)(v23 + 272) = y;
  *(CGFloat *)(v23 + 280) = width;
  *(CGFloat *)(v23 + 288) = height;
  sub_19CD48F8C();
  swift_retain();
  *v17 = sub_19CFDFDB8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x1E0DEF740], v13);
  v24 = sub_19CFDF344();
  (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v17, v13);
  if ((v24 & 1) != 0)
  {
    swift_beginAccess();
    if (*(_BYTE *)(v23 + 256) == 1)
    {
      v25 = sub_19CD2A25C();
      v27 = v26;
      v29 = v28;
      v31 = v30;
      sub_19CFDEF78();
      sub_19CD29038((uint64_t)v12, v25, v27, v29, v31);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    swift_release();
    goto LABEL_10;
  }
  __break(1u);
}

Swift::Void __swiftcall ImpressionsCalculator.removeFromParent()()
{
  uint64_t v0;

  if (swift_weakLoadStrong())
  {
    sub_19CFCE9F8(v0);
    swift_release();
  }
}

uint64_t *ImpressionsCalculator.deinit()
{
  uint64_t *v0;

  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_19CD2A71C(v0[10], v0[11], v0[12], v0[13]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Unstable.ImpressionsCalculator.isVisible.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 256);
}

uint64_t sub_19CFCF580(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;

  v4 = sub_19CFDEF84();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a1) = *a1;
  v9 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  result = swift_beginAccess();
  v11 = *(unsigned __int8 *)(v9 + 256);
  *(_BYTE *)(v9 + 256) = (_BYTE)a1;
  if ((_DWORD)a1 != v11)
  {
    v12 = sub_19CD2A25C();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    sub_19CFDEF78();
    sub_19CD29038((uint64_t)v8, v12, v14, v16, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void (*Unstable.ImpressionsCalculator.isVisible.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = sub_19CFDEF84();
  v3[3] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[4] = v5;
  v6 = malloc(*(_QWORD *)(v5 + 64));
  v7 = *(_QWORD *)(v1 + 16);
  v3[5] = v6;
  v3[6] = v7;
  swift_beginAccess();
  *((_BYTE *)v3 + 56) = *(_BYTE *)(v7 + 256);
  return sub_19CFCF6F4;
}

void sub_19CFCF6F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;

  v1 = *(_QWORD **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  v3 = *(unsigned __int8 *)(*(_QWORD *)a1 + 56);
  v4 = *(unsigned __int8 *)(v2 + 256);
  *(_BYTE *)(v2 + 256) = v3;
  if (((v3 ^ v4) & 1) != 0)
  {
    v5 = v1[5];
    v6 = v1[3];
    v7 = v1[4];
    v8 = sub_19CD2A25C();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    sub_19CFDEF78();
    sub_19CD29038(v5, v8, v10, v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  free((void *)v1[5]);
  free(v1);
}

double Unstable.ImpressionsCalculator.viewBounds.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_beginAccess();
  return *(double *)(v1 + 264);
}

void (*Unstable.ImpressionsCalculator.viewBounds.modify(_QWORD *a1))(_OWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _OWORD *v10;
  __int128 v11;

  v3 = malloc(0xA0uLL);
  *a1 = v3;
  v4 = sub_19CFDEF84();
  v3[13] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[14] = v5;
  v3[15] = malloc(*(_QWORD *)(v5 + 64));
  v6 = sub_19CFDF32C();
  v3[16] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[17] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  v9 = *(_QWORD *)(v1 + 16);
  v10 = (_OWORD *)(v9 + 264);
  v3[18] = v8;
  v3[19] = v9;
  swift_beginAccess();
  v11 = v10[1];
  *(_OWORD *)v3 = *v10;
  *((_OWORD *)v3 + 1) = v11;
  return sub_19CFCF888;
}

void sub_19CFCF888(_OWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t *v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;

  v3 = *a1;
  v4 = (uint64_t *)*((_QWORD *)*a1 + 18);
  v5 = (_OWORD *)(*((_QWORD *)*a1 + 19) + 264);
  v6 = *((_QWORD *)*a1 + 16);
  v7 = *((_QWORD *)*a1 + 17);
  v8 = (*a1)[1];
  *v5 = **a1;
  v5[1] = v8;
  sub_19CD48F8C();
  *v4 = sub_19CFDFDB8();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v4, *MEMORY[0x1E0DEF740], v6);
  v9 = sub_19CFDF344();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v4, v6);
  if ((a2 & 1) != 0)
  {
    if ((v9 & 1) != 0)
      goto LABEL_5;
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if ((v9 & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v10 = v3[19];
  swift_beginAccess();
  if (*(_BYTE *)(v10 + 256) == 1)
  {
    v12 = v3[14];
    v11 = v3[15];
    v13 = v3[13];
    v14 = sub_19CD2A25C();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    sub_19CFDEF78();
    sub_19CD29038(v11, v14, v16, v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v21 = (void *)v3[15];
  free((void *)v3[18]);
  free(v21);
  free(v3);
}

uint64_t Unstable.ImpressionsCalculator.increaseImpressionableFrame(forElement:by:isContainer:)(__int128 *a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v6 = *((_QWORD *)a1 + 2);
  v7 = *((_QWORD *)a1 + 3);
  v8 = *((_QWORD *)a1 + 6);
  v9 = *((_QWORD *)a1 + 9);
  v11 = *a1;
  v12 = v6;
  v13 = v7;
  v14 = a1[2];
  v15 = v8;
  v16 = *(__int128 *)((char *)a1 + 56);
  v17 = v9;
  return ImpressionsCalculator.increaseImpressionableFrame(forElement:by:isContainer:)((uint64_t *)&v11, a2, a3, a4, a5, a6);
}

uint64_t Unstable.ImpressionsCalculator.copyElements(from:)(uint64_t a1)
{
  return ImpressionsCalculator.copyElements(from:)(*(_QWORD *)(a1 + 16));
}

uint64_t Unstable.ImpressionsCalculator.removeElement(_:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v1 = *((_QWORD *)a1 + 2);
  v2 = *((_QWORD *)a1 + 3);
  v3 = *((_QWORD *)a1 + 6);
  v4 = *((_QWORD *)a1 + 9);
  v6 = *a1;
  v7 = v1;
  v8 = v2;
  v9 = a1[2];
  v10 = v3;
  v11 = *(__int128 *)((char *)a1 + 56);
  v12 = v4;
  return ImpressionsCalculator.removeElement(_:)((uint64_t)&v6);
}

Swift::Void __swiftcall Unstable.ImpressionsCalculator.removeAllElements()()
{
  ImpressionsCalculator.removeAllElements()();
}

uint64_t Unstable.ImpressionsCalculator.makeChildCalculator(for:)(__int128 *a1)
{
  return sub_19CD281C0(a1, (uint64_t (*)(__int128 *))ImpressionsCalculator.makeChildCalculator(for:));
}

Swift::Void __swiftcall Unstable.ImpressionsCalculator.changeImpressionableBounds(_:forElementWithID:)(__C::CGRect _, JetEngine::ImpressionMetrics::ID *forElementWithID)
{
  uint64_t countAndFlagsBits;
  void *object;
  void *v4;
  JetEngine::ImpressionMetrics::ID v5;

  countAndFlagsBits = forElementWithID->element._countAndFlagsBits;
  object = forElementWithID->element._object;
  v4 = forElementWithID->uniqueID.value._object;
  v5.parent = forElementWithID->parent;
  v5.element._countAndFlagsBits = countAndFlagsBits;
  v5.element._object = object;
  *(_OWORD *)&v5.index = *(_OWORD *)&forElementWithID->index;
  v5.uniqueID.value._object = v4;
  ImpressionsCalculator.changeImpressionableBounds(_:forElementWithID:)(_, &v5);
}

Swift::Void __swiftcall Unstable.ImpressionsCalculator.removeFromParent()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  if (swift_weakLoadStrong())
  {
    sub_19CFCE9F8(v1);
    swift_release();
  }
}

uint64_t Unstable.ImpressionsCalculator.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t sub_19CFCFB84(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v26[24];
  ValueMetadata *v27;
  _UNKNOWN **v28;

  v16 = sub_19CFDEFA8();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16, v18);
  v20 = &v26[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v27 = &type metadata for SystemDateProvider;
  v28 = &off_1E3DCF120;
  swift_weakInit();
  *(_BYTE *)(a7 + 256) = 1;
  *(_OWORD *)(a7 + 264) = 0u;
  *(_OWORD *)(a7 + 280) = 0u;
  *(double *)(a7 + 32) = a8;
  *(_QWORD *)(a7 + 40) = a1;
  *(_QWORD *)(a7 + 48) = a2;
  *(_BYTE *)(a7 + 56) = a3;
  sub_19CD2B9D4(a4, a7 + 80);
  *(_QWORD *)(a7 + 64) = a5;
  *(_QWORD *)(a7 + 72) = a6;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  *(_QWORD *)(a7 + 24) = sub_19CD2B86C(MEMORY[0x1E0DEE9D8]);
  sub_19CCD5B84((uint64_t)v26, a7 + 136);
  sub_19CFDEF9C();
  v21 = sub_19CFDEF90();
  v23 = v22;
  (*(void (**)(_BYTE *, uint64_t))(v17 + 8))(v20, v16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a7 + 176) = a1;
  *(_QWORD *)(a7 + 184) = a2;
  *(_QWORD *)(a7 + 192) = 0;
  *(_BYTE *)(a7 + 200) = 1;
  *(_QWORD *)(a7 + 208) = v21;
  *(_QWORD *)(a7 + 216) = v23;
  *(_OWORD *)(a7 + 224) = 0u;
  *(_OWORD *)(a7 + 240) = 0u;
  return a7;
}

uint64_t _s9JetEngine21ImpressionsCalculatorC23impressionableThreshold7trackerAC12CoreGraphics7CGFloatV_AA0C7Tracker_ptcfC_0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[24];
  ValueMetadata *v16;
  _UNKNOWN **v17;
  _OWORD v18[3];
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB31D0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19D0522A0;
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v6 + 64) = sub_19CD2BA3C();
  *(double *)(v6 + 32) = floor(a3 * 100.0);
  v7 = sub_19CFDF5A8();
  v9 = v8;
  memset(v18, 0, sizeof(v18));
  v19 = 0;
  v16 = &type metadata for SystemDateProvider;
  v17 = &off_1E3DCF120;
  type metadata accessor for ImpressionsCalculator();
  v10 = swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, (uint64_t)&type metadata for SystemDateProvider);
  MEMORY[0x1E0C80A78](v11, v11);
  (*(void (**)(void))(v12 + 16))();
  v13 = sub_19CFCFB84(v7, v9, 1, (uint64_t)v18, a1, a2, v10, a3);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  return v13;
}

uint64_t sub_19CFCFE74@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 256);
  return result;
}

__n128 sub_19CFCFEBC@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1 + 264;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

uint64_t sub_19CFCFF04(double *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm_0(a1, a2, a3, a4, ImpressionsCalculator.viewBounds.setter);
}

uint64_t sub_19CFCFF10@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 256);
  return result;
}

__n128 sub_19CFCFF5C@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16) + 264;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

uint64_t sub_19CFCFFA8(double *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm_0(a1, a2, a3, a4, Unstable.ImpressionsCalculator.viewBounds.setter);
}

uint64_t keypath_set_2Tm_0(double *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(double, double, double, double))
{
  return a5(*a1, a1[1], a1[2], a1[3]);
}

uint64_t method lookup function for ImpressionsCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t assignWithCopy for ImpressionsCalculator.Configuration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for ImpressionsCalculator.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImpressionsCalculator.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImpressionsCalculator.Configuration(uint64_t result, int a2, int a3)
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

uint64_t method lookup function for Unstable.ImpressionsCalculator()
{
  return swift_lookUpClassMethod();
}

void __swiftcall ImpressionsContext.withPosition(_:)(JetEngine::ImpressionsContext *__return_ptr retstr, Swift::Int_optional a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = *(void **)(v2 + 8);
  v4 = *(_QWORD *)(v2 + 32);
  v5 = *(void **)(v2 + 72);
  retstr->groupId._countAndFlagsBits = *(_QWORD *)v2;
  retstr->groupId._object = v3;
  retstr->position.value = a2.value;
  retstr->position.is_nil = a2.is_nil;
  retstr->parentContextID.value._countAndFlagsBits = v4;
  *(_OWORD *)&retstr->parentContextID.value._object = *(_OWORD *)(v2 + 40);
  *(_OWORD *)&retstr->uniqueImpressionID.value._object = *(_OWORD *)(v2 + 56);
  retstr->uniqueParentID.value._object = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

void __swiftcall ImpressionsContext.withGroupId(_:)(JetEngine::ImpressionsContext *__return_ptr retstr, Swift::String a2)
{
  uint64_t v2;
  Swift::Int v3;
  char v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_BYTE *)(v2 + 24);
  v5 = *(_QWORD *)(v2 + 32);
  v6 = *(void **)(v2 + 72);
  retstr->groupId = a2;
  retstr->position.value = v3;
  retstr->position.is_nil = v4;
  retstr->parentContextID.value._countAndFlagsBits = v5;
  *(_OWORD *)&retstr->parentContextID.value._object = *(_OWORD *)(v2 + 40);
  *(_OWORD *)&retstr->uniqueImpressionID.value._object = *(_OWORD *)(v2 + 56);
  retstr->uniqueParentID.value._object = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

void __swiftcall ImpressionsContext.withParentContextID(_:)(JetEngine::ImpressionsContext *__return_ptr retstr, Swift::String_optional a2)
{
  uint64_t v2;
  void *v3;
  Swift::Int v4;
  char v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(v2 + 8);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_BYTE *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(void **)(v2 + 72);
  retstr->groupId._countAndFlagsBits = *(_QWORD *)v2;
  retstr->groupId._object = v3;
  retstr->position.value = v4;
  retstr->position.is_nil = v5;
  retstr->parentContextID = a2;
  retstr->uniqueImpressionID.value._countAndFlagsBits = v6;
  *(_OWORD *)&retstr->uniqueImpressionID.value._object = *(_OWORD *)(v2 + 56);
  retstr->uniqueParentID.value._object = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

uint64_t ImpressionsContext.groupId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ImpressionsContext.position.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void __swiftcall ImpressionsContext.withUniqueImpressionID(_:)(JetEngine::ImpressionsContext *__return_ptr retstr, Swift::String a2)
{
  uint64_t v2;
  void *v3;
  Swift::Int v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = *(void **)(v2 + 8);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_BYTE *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 32);
  v7 = *(void **)(v2 + 40);
  v9 = *(_QWORD *)(v2 + 64);
  v8 = *(void **)(v2 + 72);
  retstr->groupId._countAndFlagsBits = *(_QWORD *)v2;
  retstr->groupId._object = v3;
  retstr->position.value = v4;
  retstr->position.is_nil = v5;
  retstr->parentContextID.value._countAndFlagsBits = v6;
  retstr->parentContextID.value._object = v7;
  retstr->uniqueImpressionID.value = a2;
  retstr->uniqueParentID.value._countAndFlagsBits = v9;
  retstr->uniqueParentID.value._object = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

void __swiftcall ImpressionsContext.withUniqueImpressionParentID(_:)(JetEngine::ImpressionsContext *__return_ptr retstr, Swift::String_optional a2)
{
  uint64_t v2;
  void *v4;
  Swift::Int v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v12;

  v4 = *(void **)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_BYTE *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v7 = *(void **)(v2 + 40);
  v9 = *(void **)(v2 + 56);
  v12 = *(_QWORD *)(v2 + 48);
  if (a2.value._object)
  {
    object = a2.value._object;
    countAndFlagsBits = a2.value._countAndFlagsBits;
  }
  else
  {
    countAndFlagsBits = *(_QWORD *)(v2 + 64);
    object = *(void **)(v2 + 72);
  }
  retstr->groupId._countAndFlagsBits = *(_QWORD *)v2;
  retstr->groupId._object = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  retstr->position.value = v5;
  retstr->position.is_nil = v6;
  retstr->parentContextID.value._countAndFlagsBits = v8;
  retstr->parentContextID.value._object = v7;
  retstr->uniqueImpressionID.value._countAndFlagsBits = v12;
  retstr->uniqueImpressionID.value._object = v9;
  retstr->uniqueParentID.value._countAndFlagsBits = countAndFlagsBits;
  retstr->uniqueParentID.value._object = object;
}

BOOL _s9JetEngine18ImpressionsContextV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _BOOL8 result;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(unsigned __int8 *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 56);
  v21 = *(_QWORD *)(a2 + 48);
  v22 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a2 + 64);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v12 = sub_19CFE06A0(), result = 0, (v12 & 1) != 0))
  {
    if ((v3 & 1) != 0)
    {
      if (!v8)
        return 0;
    }
    else
    {
      if (v2 == v7)
        v14 = v8;
      else
        v14 = 1;
      if ((v14 & 1) != 0)
        return 0;
    }
    if (v5)
    {
      if (!v9)
        return 0;
      if (v4 != v10 || v5 != v9)
      {
        v15 = sub_19CFE06A0();
        result = 0;
        if ((v15 & 1) == 0)
          return result;
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v6)
    {
      if (!v11)
        return 0;
      if (v22 != v21 || v6 != v11)
      {
        v16 = sub_19CFE06A0();
        result = 0;
        if ((v16 & 1) == 0)
          return result;
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v20)
      return v19 && (v18 == v17 && v20 == v19 || (sub_19CFE06A0() & 1) != 0);
    return !v19;
  }
  return result;
}

uint64_t destroy for ImpressionsContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImpressionsContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImpressionsContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ImpressionsContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_19CFD0748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19CFD07A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[5];
  v2 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_19CFD0820;
  return sub_19CE9379C(v0[2], v0[3], v0[5]);
}

uint64_t sub_19CFD0820(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 56) = v1;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v4 + 40), (uint64_t *)&unk_1ECEB2040);
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t MetricsIDService.idFields(forTopic:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  v5[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19CFD0920()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v1 = v0[7];
  v2 = v0[5];
  v3 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 1, 1, v3);
  v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(**(int **)(v2 + 16) + *(_QWORD *)(v2 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  *v4 = v0;
  v4[1] = sub_19CFD09B4;
  return v6(v0[2], v0[3], v0[7], v0[4], v0[5]);
}

uint64_t sub_19CFD09B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 72) = v1;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v4 + 56), (uint64_t *)&unk_1ECEB2040);
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_19CFD0A50()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19CFD0A84(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  *(_BYTE *)(v4 + 64) = *a3;
  return swift_task_switch();
}

uint64_t sub_19CFD0AF0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, char, uint64_t);

  v1 = *(_BYTE *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v6 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t))((char *)&dword_1EE443DA8 + dword_1EE443DA8);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_19CFD0B8C;
  return v6(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v1, *(_QWORD *)(v0 + 40));
}

uint64_t sub_19CFD0B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(v6 + 56) = v2;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v6 + 40), (uint64_t *)&unk_1ECEB2040);
  if (v2)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t MetricsIDService.queryID(forTopic:withType:)(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  *(_QWORD *)(v6 + 56) = swift_task_alloc();
  *(_BYTE *)(v6 + 81) = *a3;
  return swift_task_switch();
}

uint64_t sub_19CFD0CA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  *(_BYTE *)(v0 + 80) = *(_BYTE *)(v0 + 81);
  v3 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 1, 1, v3);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(**(int **)(v2 + 32)
                                                                               + *(_QWORD *)(v2 + 32));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_19CFD0D48;
  return v6(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + 80, *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_19CFD0D48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(v6 + 72) = v2;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v6 + 56), (uint64_t *)&unk_1ECEB2040);
  if (v2)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_19CFD0E00(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v4;
  char v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, char, uint64_t);

  v8 = *a3;
  v11 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t))((char *)&dword_1EE443DA8 + dword_1EE443DA8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_19CD57F90;
  return v11(a1, a2, v8, a4);
}

uint64_t sub_19CFD0E88(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_BYTE *)(v4 + 80) = a3;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v8;
  *v8 = v4;
  v8[1] = sub_19CFD0EF0;
  return sub_19CE9379C(a1, a2, a4);
}

uint64_t sub_19CFD0EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t MetricsIDService.queryID(forTopic:withType:on:)(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_BYTE *)(v6 + 80) = *a3;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16) + *(_QWORD *)(a6 + 16));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 64) = v12;
  *v12 = v6;
  v12[1] = sub_19CFD0FFC;
  return v14(a1, a2, a4, a5, a6);
}

uint64_t sub_19CFD0FFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_19CFD1070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  _BYTE *v6;

  if (*(_BYTE *)(v0 + 80))
    v1 = 0xE800000000000000;
  else
    v1 = 0xE600000000000000;
  if (!*(_QWORD *)(*(_QWORD *)(v0 + 72) + 16)
    || (!*(_BYTE *)(v0 + 80) ? (v2 = 0x644972657375) : (v2 = 0x6449746E65696C63),
        v3 = sub_19CD3FD1C(v2, v1),
        (v4 & 1) == 0))
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_19CD436B0(*(_QWORD *)(*(_QWORD *)(v0 + 72) + 56) + 32 * v3, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_19CCECFE4(v0 + 16, &qword_1ECEB3370);
    goto LABEL_14;
  }
  if (swift_dynamicCast())
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
LABEL_14:
  sub_19CE948A0();
  swift_allocError();
  *v6 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19CFD11BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19CFD121C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[5];
  v2 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_19CFD1294;
  return sub_19CD57750(v0[2], v0[3], v0[5]);
}

uint64_t sub_19CFD1294(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 56) = v1;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v4 + 40), (uint64_t *)&unk_1ECEB2040);
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_19CFD1330(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2040);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  *(_BYTE *)(v4 + 64) = *a3;
  return swift_task_switch();
}

uint64_t sub_19CFD139C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, char, uint64_t);

  v1 = *(_BYTE *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = sub_19CFDEF84();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v6 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t))((char *)&dword_1EE443DC8 + dword_1EE443DC8);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_19CFD1438;
  return v6(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v1, *(_QWORD *)(v0 + 40));
}

uint64_t sub_19CFD1438(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(v6 + 56) = v2;
  swift_task_dealloc();
  sub_19CCECFE4(*(_QWORD *)(v6 + 40), (uint64_t *)&unk_1ECEB2040);
  if (v2)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

BOOL static MetricsIDServiceError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MetricsIDServiceError.hash(into:)()
{
  return sub_19CFE08D4();
}

uint64_t MetricsIDServiceError.hashValue.getter()
{
  sub_19CFE08C8();
  sub_19CFE08D4();
  return sub_19CFE0910();
}

uint64_t sub_19CFD1560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_19CCC1F98;
  return MetricsIDService.idFields(forTopic:)(a1, a2, a3, a4);
}

uint64_t sub_19CFD15D4(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19CD57F90;
  return MetricsIDService.queryID(forTopic:withType:)(a1, a2, a3, a4, a5);
}

uint64_t sub_19CFD1650(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *(_QWORD *)v13 = v6;
  *(_QWORD *)(v13 + 8) = sub_19CCC5B54;
  *(_BYTE *)(v13 + 80) = *a3;
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16) + *(_QWORD *)(a6 + 16));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v13 + 64) = v14;
  *v14 = v13;
  v14[1] = sub_19CFD0FFC;
  return v16(a1, a2, a4, a5, a6);
}

unint64_t sub_19CFD1718()
{
  unint64_t result;

  result = qword_1EE443D50;
  if (!qword_1EE443D50)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for MetricsIDServiceError, &type metadata for MetricsIDServiceError);
    atomic_store(result, (unint64_t *)&qword_1EE443D50);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MetricsIDServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFD17A8 + 4 * byte_19D06AEC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19CFD17DC + 4 * asc_19D06AEC0[v4]))();
}

uint64_t sub_19CFD17DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD17E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFD17ECLL);
  return result;
}

uint64_t sub_19CFD17F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFD1800);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19CFD1804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD180C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MetricsIDServiceError()
{
  return &type metadata for MetricsIDServiceError;
}

uint64_t dispatch thunk of MetricsIDService.idFields(forTopic:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_19CFD1AB8;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of MetricsIDService.idFields(forTopic:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19CE66350;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of MetricsIDService.queryID(forTopic:withType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 24) + *(_QWORD *)(a5 + 24));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19CFD1AB4;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of MetricsIDService.resetID(forTopics:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 40) + *(_QWORD *)(a3 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19CD579FC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of MetricsIDService.performMaintenance()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19CCBE344;
  return v7(a1, a2);
}

id static AccountProvider<>.appleServices.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStore);
}

id ACAccountStore.activeAccount.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  id result;

  result = objc_msgSend(v1, sel_ams_activeiTunesAccount);
  *a1 = result;
  return result;
}

uint64_t ACAccountStore.onActiveAccountChange.getter()
{
  uint64_t v0;

  v0 = *(_QWORD *)(sub_19CFD1B60() + 16);
  swift_retain();
  swift_release();
  sub_19CFD1C50();
  return v0;
}

uint64_t sub_19CFD1B60()
{
  void *v0;
  id v1;
  uint64_t v3;
  _OWORD v4[2];
  _QWORD v5[4];

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &off_1EE443DE0);
  swift_endAccess();
  if (v1)
  {
    sub_19CFE004C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_19CD407DC((uint64_t)v4, (uint64_t)v5);
  if (v5[3])
  {
    type metadata accessor for _ACAccountStoreObserver();
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19CD3F190((uint64_t)v5);
  }
  objc_sync_enter(v0);
  sub_19CFD1C9C(v0, v5);
  objc_sync_exit(v0);
  return v5[0];
}

unint64_t sub_19CFD1C50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE4372D0;
  if (!qword_1EE4372D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE4370F0);
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for AsyncEvent<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1EE4372D0);
  }
  return result;
}

uint64_t sub_19CFD1C9C@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  swift_beginAccess();
  v4 = objc_getAssociatedObject(a1, &off_1EE443DE0);
  swift_endAccess();
  if (v4)
  {
    sub_19CFE004C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_19CD407DC((uint64_t)v11, (uint64_t)v12);
  if (v13)
  {
    type metadata accessor for _ACAccountStoreObserver();
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      v6 = v10;
      goto LABEL_11;
    }
  }
  else
  {
    sub_19CD3F190((uint64_t)v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4370F0);
  v7 = swift_allocObject();
  v8 = sub_19CD51798(v7);
  if (qword_1EE43D750 != -1)
    swift_once();
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  type metadata accessor for _ACAccountStoreObserver();
  swift_allocObject();
  v6 = (void *)sub_19CFD1F14(v8, v9);
  swift_beginAccess();
  swift_retain();
  objc_setAssociatedObject(a1, &off_1EE443DE0, v6, (void *)0x301);
  swift_endAccess();
  result = swift_release();
LABEL_11:
  *a2 = v6;
  return result;
}

uint64_t sub_19CFD1E64()
{
  uint64_t v0;

  v0 = *(_QWORD *)(sub_19CFD1B60() + 16);
  swift_retain();
  swift_release();
  sub_19CFD1C50();
  return v0;
}

id static AccountProvider<>.appleServices(forMediaType:)(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStoreForMediaType_, a1);
}

id sub_19CFD1EE4()
{
  qword_1EE4372F8 = *MEMORY[0x1E0C8F1C0];
  return (id)qword_1EE4372F8;
}

id sub_19CFD1EFC()
{
  qword_1EE4372E0 = *MEMORY[0x1E0CFD770];
  return (id)qword_1EE4372E0;
}

uint64_t sub_19CFD1F14(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v4 = qword_1EE437308;
  swift_retain();
  v5 = a2;
  swift_retain();
  if (v4 != -1)
    swift_once();
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v2, sel_accountStoreDidChange_, qword_1EE4372F8, 0);
  swift_release();
  v6 = qword_1EE4372F0;
  swift_retain();
  if (v6 != -1)
    swift_once();
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v2, sel_accountCookiesDidChange_, qword_1EE4372E0, 0);
  swift_release();
  swift_release();

  return v2;
}

uint64_t sub_19CFD2028()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 24), sel_removeObserver_, v0);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_19CFD2078(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v5 = sub_19CFDEA74();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEA50();
  swift_retain();
  sub_19CE26E70(a4);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t type metadata accessor for _ACAccountStoreObserver()
{
  return objc_opt_self();
}

unint64_t sub_19CFD2140()
{
  return 0xD000000000000017;
}

uint64_t sub_19CFD2160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  a3[3] = a1;
  a3[4] = a2;
  *a3 = v4;
  return swift_bridgeObjectRetain();
}

void sub_19CFD217C()
{
  static IntentModel<>.kind.getter();
}

void static IntentModel<>.kind.getter()
{
  sub_19CFE010C();
  sub_19CFE0A90();
  swift_bridgeObjectRelease();
  sub_19CFDF698();
  sub_19CFE0340();
  __break(1u);
}

uint64_t sub_19CFD2230()
{
  return 0x6E694C7065654424;
}

uint64_t sub_19CFD2258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t *boxed_opaque_existential_2Tm;

  a3[3] = a1;
  a3[4] = a2;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(a3);
  return sub_19CFD231C(v3, (uint64_t)boxed_opaque_existential_2Tm);
}

BOOL static IntentModel._isContinuous.getter()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (swift_conformsToProtocol2())
    v1 = AssociatedTypeWitness;
  else
    v1 = 0;
  return v1 != 0;
}

unint64_t sub_19CFD22CC()
{
  return 0xD000000000000010;
}

uint64_t dispatch thunk of static IntentModel.kind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of IntentModel._canonicalized.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_19CFD22F8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_19CFD231C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Models.DeepLinkIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static PipelinePhase<>.readContentsOfFile()@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_19CFD23AC;
  *(_QWORD *)(result + 24) = 0;
  *a1 = sub_19CFD24BC;
  a1[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

uint64_t sub_19CFD23AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_19CFDEDF8();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EE43C320);
  v3 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 24) = v0;
  *(_QWORD *)(v3 + 32) = v2;
  *(_BYTE *)(v3 + 40) = 1;
  return v3;
}

uint64_t sub_19CFD243C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  (*(void (**)(void))(**(_QWORD **)a1 + 88))();
  v5 = sub_19CFD2534(a2, a3);
  swift_release();
  return v5;
}

uint64_t sub_19CFD2498()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19CFD24BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  (*(void (**)(void))(**(_QWORD **)a1 + 88))();
  v4 = sub_19CFD2534(v2, v3);
  swift_release();
  return v4;
}

uint64_t type metadata accessor for ReadFilePhase()
{
  return objc_opt_self();
}

uint64_t sub_19CFD2534(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v9[4];
  _BYTE v10[48];
  __int128 v11[2];
  _BYTE v12[24];
  ValueMetadata *v13;
  _UNKNOWN **v14;

  v13 = &type metadata for SyncTaskScheduler;
  v14 = &protocol witness table for SyncTaskScheduler;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EE43C320);
  v4 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2570);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  v6 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = v6;
  *(_QWORD *)(v4 + 32) = 0;
  *(_BYTE *)(v4 + 40) = 0;
  sub_19CCD5B84((uint64_t)v12, (uint64_t)v11);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v4;
  sub_19CCD14C4(v11, (uint64_t)(v7 + 5));
  v9[0] = sub_19CFD26B0;
  v9[1] = v7;
  v9[2] = sub_19CDE824C;
  v9[3] = v4;
  sub_19CCD5B84((uint64_t)v12, (uint64_t)v10);
  v10[40] = 0;
  swift_retain_n();
  swift_retain();
  swift_retain();
  sub_19CDBE6E0((uint64_t)v9);
  sub_19CEF4E08((uint64_t)v9);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v4;
}

uint64_t sub_19CFD267C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  return swift_deallocObject();
}

uint64_t sub_19CFD26B0(uint64_t a1)
{
  uint64_t v1;

  return sub_19CF784EC(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v1 + 40);
}

uint64_t dispatch thunk of _IntentReplayDispatcherConfigurationProvider.enableIntentReplay.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _IntentReplayDispatcherConfigurationProvider.memoryOnlyCaching.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _IntentReplayDispatcherConfigurationProvider.cachingServerPort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _IntentReplayDispatcherConfigurationProvider.intentReplayIgnoreList.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of _IntentReplayDispatcherConfigurationProvider.replayableIntentsWithPath.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t static JSRequestIntent.kind.getter()
{
  return 0xD000000000000010;
}

void sub_19CFD2704(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000019D07ACE0;
}

uint64_t JSRequestIntent.init(_:timeout:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *boxed_opaque_existential_2Tm;

  v8 = a1[3];
  v9 = a1[4];
  v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  *(_QWORD *)(a4 + 24) = v8;
  *(_QWORD *)(a4 + 32) = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(a4 + 40) = *(_QWORD *)(v9 + 16);
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)a4);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_2Tm, v10, v8);
  *(_QWORD *)(a4 + 48) = a2;
  *(_BYTE *)(a4 + 56) = a3 & 1;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t assignWithCopy for JSRequestIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_2((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v4;
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_2(uint64_t *result, uint64_t *a2)
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
      result[5] = a2[5];
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

uint64_t assignWithTake for JSRequestIntent(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSRequestIntent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSRequestIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_19CFD2A40(char *a1, char *a2)
{
  return sub_19CE804F0(*a1, *a2);
}

uint64_t sub_19CFD2A4C()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

uint64_t sub_19CFD2ABC()
{
  sub_19CFDF650();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19CFD2B08()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

uint64_t sub_19CFD2B74@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_19CFE0424();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_19CFD2BD0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 25705;
  if (!*v1)
    v2 = 0x646E696B24;
  v3 = 0xE500000000000000;
  if (*v1)
    v3 = 0xE200000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_19CFD2C00()
{
  _BYTE *v0;

  if (*v0)
    return 25705;
  else
    return 0x646E696B24;
}

uint64_t sub_19CFD2C2C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_19CFE0424();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_19CFD2C8C()
{
  sub_19CFD30DC();
  return sub_19CFE0A48();
}

uint64_t sub_19CFD2CB4()
{
  sub_19CFD30DC();
  return sub_19CFE0A54();
}

uint64_t Models.Menu.Child.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  _OWORD v26[2];
  __int128 v27[10];
  char v28;
  __int128 v29[11];
  char v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E00);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v25 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_19CFD30DC();
  sub_19CFE09E8();
  if (!v2)
  {
    v24 = v6;
    LOBYTE(v27[0]) = 0;
    v11 = sub_19CFE0490();
    v13 = v5;
    v16 = v11;
    v17 = v12;
    v18 = v11 == 1835365481 && v12 == 0xE400000000000000;
    if (v18 || (sub_19CFE06A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v19 = v24;
      v14 = (uint64_t)v25;
      sub_19CCD5B84((uint64_t)v25, (uint64_t)v26);
      Models.Menu.Item.init(from:)(v26, (uint64_t)v27);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v13);
      v28 = 0;
LABEL_12:
      sub_19CF936D8(v27, (uint64_t)v29);
      v20 = a2;
LABEL_13:
      sub_19CF936D8(v29, v20);
      return __swift_destroy_boxed_opaque_existential_1Tm(v14);
    }
    v21 = v16 == 0x756E656D627573 && v17 == 0xE700000000000000;
    if (v21 || (sub_19CFE06A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v22 = v24;
      v14 = (uint64_t)v25;
      sub_19CCD5B84((uint64_t)v25, (uint64_t)v26);
      Models.Menu.init(from:)(v26, (unint64_t *)v27);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v13);
      v28 = 1;
      goto LABEL_12;
    }
    v23 = v16 == 0x6574616C706D6574 && v17 == 0xE800000000000000;
    if (v23 || (sub_19CFE06A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v30 = 1;
      sub_19CFD316C();
      sub_19CFE04B4();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v5);
      v27[0] = v26[0];
      v28 = 2;
      sub_19CF936D8(v27, (uint64_t)v29);
      v20 = a2;
      v14 = (uint64_t)v25;
      goto LABEL_13;
    }
    LOBYTE(v26[0]) = 0;
    *(_QWORD *)&v27[0] = 0;
    *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
    sub_19CFE010C();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v27[0] = 0x20646E696B24;
    *((_QWORD *)&v27[0] + 1) = 0xE600000000000000;
    sub_19CFDF698();
    swift_bridgeObjectRelease();
    sub_19CFDF698();
    sub_19CFE01B4();
    swift_allocError();
    sub_19CFD3120();
    sub_19CFE0190();
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v5);
  }
  v14 = (uint64_t)v25;
  return __swift_destroy_boxed_opaque_existential_1Tm(v14);
}

unint64_t sub_19CFD30DC()
{
  unint64_t result;

  result = qword_1EE443E08;
  if (!qword_1EE443E08)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B868, &_s4MenuV5ChildO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443E08);
  }
  return result;
}

unint64_t sub_19CFD3120()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE443E10;
  if (!qword_1EE443E10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE443E00);
    result = MEMORY[0x1A1ADBD7C](MEMORY[0x1E0DED060], v1);
    atomic_store(result, (unint64_t *)&qword_1EE443E10);
  }
  return result;
}

unint64_t sub_19CFD316C()
{
  unint64_t result;

  result = qword_1EE443E18;
  if (!qword_1EE443E18)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ID, &type metadata for Models.Menu.ID);
    atomic_store(result, (unint64_t *)&qword_1EE443E18);
  }
  return result;
}

uint64_t Models.Menu.Item.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _UNKNOWN **v23;
  ValueMetadata *v24;
  _UNKNOWN **v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  ValueMetadata *v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  _OWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _UNKNOWN **v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[3];
  char v60;
  _BYTE v61[40];
  __int128 v62;
  uint64_t v63;
  _DWORD v64[2];
  char v65;
  _BYTE v66[40];
  _OWORD v67[5];
  uint64_t v68;
  _QWORD *v69;

  v51 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E20);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v69 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v10 = sub_19CFD4F34();
  sub_19CFE09E8();
  if (v2)
  {
    v26 = (uint64_t)v69;
  }
  else
  {
    v49 = (id)v10;
    v50 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E30);
    LOBYTE(v67[0]) = 1;
    sub_19CD09560(&qword_1EE443E38, &qword_1EE443E30, sub_19CFD4F78, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    v11 = v4;
    v12 = v52;
    if (*((_QWORD *)&v52 + 1) == 1)
      v13 = 0;
    else
      v13 = v52;
    if (*((_QWORD *)&v52 + 1) == 1)
      v14 = 0;
    else
      v14 = *((_QWORD *)&v52 + 1);
    LOBYTE(v52) = 0;
    v15 = sub_19CFE0490();
    *((_QWORD *)&v46 + 1) = v14;
    v47 = v12;
    v45 = v15;
    *(_QWORD *)&v46 = v13;
    v48 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E50);
    v17 = v8;
    v66[0] = 2;
    sub_19CD09560(&qword_1EE443E58, &qword_1EE443E50, sub_19CFD4F9C, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    if ((_QWORD)v52 == 1)
    {
      sub_19CCECFE4((uint64_t)&v52, &qword_1EE443E70);
      memset(v67, 0, sizeof(v67));
      v68 = 0;
    }
    else
    {
      sub_19CCF8C5C((uint64_t)&v52, (uint64_t)v67, &qword_1EE442CB0);
      sub_19CCECFE4((uint64_t)&v52, &qword_1EE443E50);
    }
    v18 = v69;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E78);
    v66[0] = 4;
    sub_19CD09560(&qword_1EE443E80, &qword_1EE443E78, sub_19CFD5004, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    if (v52 == 3)
      v19 = 2;
    else
      v19 = v52;
    v20 = v18[3];
    v44 = (_UNKNOWN **)v18[4];
    __swift_project_boxed_opaque_existential_1(v18, v20);
    v21 = sub_19CFE09DC();
    v22 = sub_19CF05CE4(0xD000000000000023, 0x800000019D06ECA0, v21);
    v44 = v23;
    swift_bridgeObjectRelease();
    if (v22)
      v24 = (ValueMetadata *)v22;
    else
      v24 = &type metadata for EmptyActionKindTable;
    if (v22)
      v25 = v44;
    else
      v25 = &off_1E3DD1128;
    LOBYTE(v52) = 3;
    decodeActionModel<A, B>(using:container:forKey:)((uint64_t)v24, (uint64_t)v25, (uint64_t)v66);
    if (!*((_QWORD *)&v46 + 1))
    {
      *(_QWORD *)&v46 = _s9JetEngine6ModelsO4MenuV2IDVAGycfC_0();
      *((_QWORD *)&v46 + 1) = v28;
    }
    sub_19CCF8C5C((uint64_t)v67, (uint64_t)&v52, &qword_1EE442CB0);
    v29 = (id)v52;
    HIDWORD(v43) = v19;
    if ((_QWORD)v52)
    {
      v47 = *((_QWORD *)&v52 + 1);
      v30 = v53;
      v64[0] = *(_DWORD *)((char *)&v53 + 1);
      *(_DWORD *)((char *)v64 + 3) = DWORD1(v53);
      v49 = (id)*((_QWORD *)&v53 + 1);
      v31 = *((_QWORD *)&v54 + 1);
      v32 = v54;
      v62 = v55;
      v33 = (ValueMetadata *)*((_QWORD *)&v56 + 1);
      v63 = v56;
      v34 = (_UNKNOWN **)v57;
    }
    else
    {
      v35 = (void *)*MEMORY[0x1E0CFD8F0];
      v36 = (void *)*MEMORY[0x1E0CFD8D8];
      v65 = 1;
      v29 = v35;
      v49 = v36;
      sub_19CCECFE4((uint64_t)&v52, &qword_1EE442CB0);
      v47 = 0;
      v31 = 0;
      v33 = &_s12_EmptySourceVN;
      v34 = &off_1EE4379C0;
      v32 = 0;
      v30 = v65;
    }
    sub_19CCF8C5C((uint64_t)v66, (uint64_t)v61, qword_1EE439B38);
    *((_QWORD *)&v59[2] + 1) = 0;
    *(_OWORD *)((char *)&v59[1] + 8) = 0u;
    *(_OWORD *)((char *)v59 + 8) = 0u;
    v60 = 2;
    v52 = v46;
    *(_QWORD *)&v53 = v45;
    *((_QWORD *)&v53 + 1) = v48;
    *(_QWORD *)&v54 = v29;
    *((_QWORD *)&v54 + 1) = v47;
    LOBYTE(v55) = v30;
    *(_DWORD *)((char *)&v55 + 1) = v64[0];
    DWORD1(v55) = *(_DWORD *)((char *)v64 + 3);
    *((_QWORD *)&v55 + 1) = v49;
    *(_QWORD *)&v56 = v32;
    *((_QWORD *)&v56 + 1) = v31;
    v57 = v62;
    *(_QWORD *)&v58 = v63;
    *((_QWORD *)&v58 + 1) = v33;
    *(_QWORD *)&v59[0] = v34;
    sub_19CFD5D0C((uint64_t)v61, (uint64_t)v59 + 8);
    v37 = (_OWORD *)v51;
    *(_BYTE *)(v51 + 160) = BYTE4(v43);
    v38 = v59[2];
    v37[8] = v59[1];
    v37[9] = v38;
    v39 = v57;
    v37[4] = v56;
    v37[5] = v39;
    v40 = v59[0];
    v37[6] = v58;
    v37[7] = v40;
    v41 = v53;
    *v37 = v52;
    v37[1] = v41;
    v42 = v55;
    v37[2] = v54;
    v37[3] = v42;
    sub_19CCECFE4((uint64_t)v66, qword_1EE439B38);
    sub_19CCECFE4((uint64_t)v67, &qword_1EE442CB0);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v17, v11);
    v26 = (uint64_t)v69;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm(v26);
}

uint64_t Models.Menu.init(from:)@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  char v24;
  id v25;
  __int128 v26;
  ValueMetadata *v27;
  _UNKNOWN **v28;
  void *v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  __int128 v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t *v39;
  __int128 v40;
  unint64_t v41;
  _DWORD v42[2];
  _QWORD v43[2];
  char v44;
  _BYTE v45[7];
  void *v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  ValueMetadata *v50;
  _UNKNOWN **v51;
  _OWORD v52[5];
  uint64_t v53;
  char v54;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443EA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFD5D54();
  sub_19CFE09E8();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E30);
    LOBYTE(v43[0]) = 0;
    sub_19CD09560(&qword_1EE443E38, &qword_1EE443E30, sub_19CFD4F78, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    v39 = a2;
    v10 = v52[0];
    if (*((_QWORD *)&v52[0] + 1) == 1)
      v11 = 0;
    else
      v11 = *(_QWORD *)&v52[0];
    v37 = v11;
    if (*((_QWORD *)&v52[0] + 1) == 1)
      v12 = 0;
    else
      v12 = *((_QWORD *)&v52[0] + 1);
    v38 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE442650);
    LOBYTE(v43[0]) = 1;
    sub_19CD09560((unint64_t *)&qword_1EE4426A8, &qword_1EE442650, (uint64_t (*)(void))sub_19CFD5D98, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    v36 = v10;
    v13 = v52[0];
    if (*((_QWORD *)&v52[0] + 1) == 1)
      v14 = 0;
    else
      v14 = *((_QWORD *)&v52[0] + 1);
    v35 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E50);
    LOBYTE(v40) = 2;
    sub_19CD09560(&qword_1EE443E58, &qword_1EE443E50, sub_19CFD4F9C, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE0484();
    if (v43[0] == 1)
    {
      sub_19CCECFE4((uint64_t)v43, &qword_1EE443E70);
      memset(v52, 0, sizeof(v52));
      v53 = 0;
    }
    else
    {
      sub_19CCF8C5C((uint64_t)v43, (uint64_t)v52, &qword_1EE442CB0);
      sub_19CCECFE4((uint64_t)v43, &qword_1EE443E50);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443EB0);
    LOBYTE(v40) = 3;
    sub_19CD09560(&qword_1EE443EB8, &qword_1EE443EB0, sub_19CFD5DF4, (uint64_t)&protocol conformance descriptor for <A> DiscardOnError<A>);
    sub_19CFE04B4();
    *((_QWORD *)&v36 + 1) = v43[0];
    v16 = v38;
    if (v38)
    {
      v17 = v37;
    }
    else
    {
      v17 = _s9JetEngine6ModelsO4MenuV2IDVAGycfC_0();
      v16 = v18;
    }
    v19 = 0xE000000000000000;
    if (v35)
      v19 = v35;
    v38 = v19;
    if (v35)
      v20 = *((_QWORD *)&v13 + 1) == 1;
    else
      v20 = 1;
    if (v20)
      v21 = 0;
    else
      v21 = v13;
    v37 = v21;
    sub_19CCF8C5C((uint64_t)v52, (uint64_t)v43, &qword_1EE442CB0);
    if (v43[0])
    {
      sub_19CCECFE4((uint64_t)v52, &qword_1EE442CB0);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      v22 = (id)v43[0];
      v23 = v43[1];
      v24 = v44;
      v42[0] = *(_DWORD *)v45;
      *(_DWORD *)((char *)v42 + 3) = *(_DWORD *)&v45[3];
      v25 = v46;
      v26 = v47;
      v40 = v48;
      v27 = v50;
      v41 = v49;
      v28 = v51;
    }
    else
    {
      v29 = (void *)*MEMORY[0x1E0CFD8F0];
      v30 = (void *)*MEMORY[0x1E0CFD8D8];
      v54 = 1;
      v22 = v29;
      v25 = v30;
      sub_19CCECFE4((uint64_t)v52, &qword_1EE442CB0);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      sub_19CCECFE4((uint64_t)v43, &qword_1EE442CB0);
      v23 = 0;
      v26 = 0uLL;
      v27 = &_s12_EmptySourceVN;
      v28 = &off_1EE4379C0;
      v24 = v54;
    }
    v31 = v39;
    *v39 = v17;
    v31[1] = v16;
    v32 = v38;
    v31[2] = v37;
    v31[3] = v32;
    v31[4] = (unint64_t)v22;
    v31[5] = v23;
    *((_BYTE *)v31 + 48) = v24;
    *(_DWORD *)((char *)v31 + 49) = v42[0];
    *((_DWORD *)v31 + 13) = *(_DWORD *)((char *)v42 + 3);
    v31[7] = (unint64_t)v25;
    v33 = v40;
    *((_OWORD *)v31 + 4) = v26;
    *((_OWORD *)v31 + 5) = v33;
    v31[12] = v41;
    v31[13] = (unint64_t)v27;
    v34 = *((_QWORD *)&v36 + 1);
    v31[14] = (unint64_t)v28;
    v31[15] = v34;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t Models.Menu.Child.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  char v37;
  uint64_t v38;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443ED0);
  v38 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFD30DC();
  sub_19CFE0A24();
  sub_19CFD5E5C(v1, (uint64_t)&v26);
  if (!v37)
  {
    v22 = v34;
    v23 = v35;
    v24 = v36;
    v18 = v30;
    v19 = v31;
    v20 = v32;
    v21 = v33;
    v14 = v26;
    v15 = v27;
    v16 = v28;
    v17 = v29;
    v25 = 0;
    v8 = v13;
    sub_19CFE0538();
    if (!v8)
      Models.Menu.Item.encode(to:)(a1);
    sub_19CFD5F00((uint64_t)&v14);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v6, v3);
  }
  if (v37 == 1)
  {
    v18 = v30;
    v19 = v31;
    v20 = v32;
    v21 = v33;
    v14 = v26;
    v15 = v27;
    v16 = v28;
    v17 = v29;
    v25 = 0;
    v7 = v13;
    sub_19CFE0538();
    if (!v7)
      Models.Menu.encode(to:)(a1);
    sub_19CFD5ED4((uint64_t)&v14);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v6, v3);
  }
  v10 = v26;
  LOBYTE(v14) = 0;
  v11 = v13;
  sub_19CFE0538();
  if (!v11)
  {
    v14 = v10;
    v25 = 1;
    sub_19CFD5E90();
    sub_19CFE0568();
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v3);
  return swift_bridgeObjectRelease();
}

uint64_t Models.Menu.Item.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v19[2];
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443EE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFD4F34();
  sub_19CFE0A24();
  v8 = *(_QWORD *)(v1 + 8);
  v19[0] = *(_QWORD *)v1;
  v19[1] = v8;
  v20 = 1;
  sub_19CFD5E90();
  v9 = v18;
  sub_19CFE0568();
  if (v9)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v18 = a1;
  LOBYTE(v19[0]) = 0;
  sub_19CFE0538();
  LOBYTE(v19[0]) = 2;
  sub_19CF5EDDC();
  sub_19CFE0568();
  LOBYTE(v19[0]) = *(_BYTE *)(v1 + 160);
  v20 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443E90);
  sub_19CD09560(&qword_1EE443EE8, &qword_1EE443E90, (uint64_t (*)(void))sub_19CFD5F2C, MEMORY[0x1E0DEE988]);
  sub_19CFE0568();
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  v11 = sub_19CFE09DC();
  v12 = sub_19CF05CE4(0xD000000000000023, 0x800000019D06ECA0, v11);
  v14 = v13;
  swift_bridgeObjectRelease();
  if (v12)
    v15 = (ValueMetadata *)v12;
  else
    v15 = &type metadata for EmptyActionKindTable;
  if (v12)
    v16 = v14;
  else
    v16 = &off_1E3DD1128;
  LOBYTE(v19[0]) = 3;
  encodeActionModel<A, B>(_:using:container:forKey:)(v1 + 120, (uint64_t)v15, (uint64_t)v7, (uint64_t)v19, (uint64_t)v15, (uint64_t)&_s4MenuV4ItemV10CodingKeysON, (uint64_t)v16);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t Models.Menu.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE443EF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19CFD5D54();
  sub_19CFE0A24();
  v10 = v3[1];
  v14 = *v3;
  v15 = v10;
  v13 = 0;
  sub_19CFD5E90();
  sub_19CFE0568();
  if (!v2)
  {
    LOBYTE(v14) = 1;
    sub_19CFE0538();
    LOBYTE(v14) = 2;
    sub_19CF5EDDC();
    sub_19CFE0568();
    v14 = v3[15];
    v13 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE442780);
    sub_19CD09560(&qword_1EE443F00, &qword_1EE442780, (uint64_t (*)(void))sub_19CFD5F70, MEMORY[0x1E0DEAF10]);
    sub_19CFE0568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t Models.Menu.Child.init(deserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23[10];
  char v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v6 = *a2;
  JSONObject.subscript.getter(0x646E696B24, 0xE500000000000000, (uint64_t)v23);
  sub_19CCF8C5C((uint64_t)v23, (uint64_t)v25, &qword_1ECEB1328);
  v7 = v26;
  if (!v26)
  {
    sub_19CCECFE4((uint64_t)v25, &qword_1ECEB1328);
    sub_19CD3E3F8((uint64_t)v23);
    goto LABEL_12;
  }
  v8 = v27;
  __swift_project_boxed_opaque_existential_1(v25, v26);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  sub_19CD3E3F8((uint64_t)v23);
  if (!v11)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    sub_19CDC5494();
    swift_allocError();
    *(_OWORD *)v14 = xmmword_19D060C40;
    v15 = 0x20000001E3DD9B40uLL;
    goto LABEL_13;
  }
  v12 = v9 == 1835365481 && v11 == 0xE400000000000000;
  if (v12 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_19CD3E448(a1, (uint64_t)v25);
    v22 = v6;
    Models.Menu.Item.init(deserializing:using:)((uint64_t)v25, &v22, (uint64_t)v23);
    result = sub_19CD3E3F8(a1);
    if (!v3)
    {
      v24 = 0;
      return sub_19CF936D8(v23, a3);
    }
    return result;
  }
  v17 = v9 == 0x756E656D627573 && v11 == 0xE700000000000000;
  if (!v17 && (sub_19CFE06A0() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (v9 == 0x6574616C706D6574 && v11 == 0xE800000000000000 || (sub_19CFE06A0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      JSONObject.subscript.getter(25705, 0xE200000000000000, (uint64_t)v25);
      v18 = sub_19CF2B1C4();
      if (!v3)
      {
        v20 = v18;
        v21 = v19;
        sub_19CD3E3F8(a1);
        sub_19CD3E3F8((uint64_t)v25);
        *(_QWORD *)&v23[0] = v20;
        *((_QWORD *)&v23[0] + 1) = v21;
        v24 = 2;
        return sub_19CF936D8(v23, a3);
      }
      sub_19CD3E3F8(a1);
      v16 = v25;
      return sub_19CD3E3F8((uint64_t)v16);
    }
    sub_19CDC5494();
    swift_allocError();
    *(_QWORD *)v14 = v9;
    *(_QWORD *)(v14 + 8) = v11;
    v15 = 0x80000001E3DD9B40;
LABEL_13:
    *(_QWORD *)(v14 + 16) = v15;
    *(_QWORD *)(v14 + 24) = 0;
    swift_willThrow();
    v16 = (_QWORD *)a1;
    return sub_19CD3E3F8((uint64_t)v16);
  }
  swift_bridgeObjectRelease();
  sub_19CD3E448(a1, (uint64_t)v25);
  v22 = v6;
  Models.Menu.init(deserializing:using:)((uint64_t)v25, &v22, (uint64_t)v23);
  result = sub_19CD3E3F8(a1);
  if (!v3)
  {
    v24 = 1;
    return sub_19CF936D8(v23, a3);
  }
  return result;
}

uint64_t Models.Menu.Item.init(deserializing:using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[48];
  char v40;
  uint64_t v41[3];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;

  v6 = *a2;
  JSONObject.subscript.getter(0x656C746974, 0xE500000000000000, (uint64_t)&v32);
  sub_19CCF8C5C((uint64_t)&v32, (uint64_t)&v45, &qword_1ECEB1328);
  v7 = *((_QWORD *)&v46 + 1);
  if (!*((_QWORD *)&v46 + 1))
  {
    sub_19CCECFE4((uint64_t)&v45, &qword_1ECEB1328);
    sub_19CD3E3F8((uint64_t)&v32);
    goto LABEL_7;
  }
  v8 = v47;
  __swift_project_boxed_opaque_existential_1(&v45, *((uint64_t *)&v46 + 1));
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v45);
  sub_19CD3E3F8((uint64_t)&v32);
  if (!v11)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    sub_19CDC5494();
    swift_allocError();
    *(_OWORD *)v17 = xmmword_19D068FC0;
    *(_QWORD *)(v17 + 16) = 0x20000001E3DD99B8uLL;
    *(_QWORD *)(v17 + 24) = 0;
    swift_willThrow();
    return sub_19CD3E3F8(a1);
  }
  JSONObject.subscript.getter(25705, 0xE200000000000000, (uint64_t)&v32);
  sub_19CCF8C5C((uint64_t)&v32, (uint64_t)&v45, &qword_1ECEB1328);
  v12 = *((_QWORD *)&v46 + 1);
  if (*((_QWORD *)&v46 + 1))
  {
    v13 = v47;
    __swift_project_boxed_opaque_existential_1(&v45, *((uint64_t *)&v46 + 1));
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 24))(v12, v13);
    v16 = v15;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v45);
    if (v16)
      goto LABEL_11;
  }
  else
  {
    sub_19CCECFE4((uint64_t)&v45, &qword_1ECEB1328);
  }
  v14 = _s9JetEngine6ModelsO4MenuV2IDVAGycfC_0();
  v16 = v19;
LABEL_11:
  sub_19CD3E3F8((uint64_t)&v32);
  JSONObject.subscript.getter(1852793705, 0xE400000000000000, (uint64_t)&v32);
  v44[0] = sub_19CD30650(MEMORY[0x1E0DEE9D8]);
  MediaArtwork.init(deserializing:using:)((uint64_t)&v32, v44, (uint64_t)&v45);
  if (!v3)
  {
    JSONObject.subscript.getter(0x6E6F69746361, 0xE600000000000000, (uint64_t)&v32);
    v41[0] = v6;
    static AnyActionTypes.tryToMakeInstance(byDeserializing:using:)((uint64_t)&v32, v41, (uint64_t)v44);
    sub_19CD3E3F8((uint64_t)&v32);
    swift_bridgeObjectRelease();
    JSONObject.subscript.getter(1701605234, 0xE400000000000000, (uint64_t)&v32);
    sub_19CCF8C5C((uint64_t)&v32, (uint64_t)v41, &qword_1ECEB1328);
    v20 = v42;
    v51 = v9;
    if (v42)
    {
      v21 = v43;
      __swift_project_boxed_opaque_existential_1(v41, v42);
      (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21);
      v23 = v22;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
      if (v23)
      {
        v24 = sub_19CFE0424();
        swift_bridgeObjectRelease();
        if (v24 == 1)
          v25 = 1;
        else
          v25 = 2;
        if (v24)
          v26 = v25;
        else
          v26 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      sub_19CCECFE4((uint64_t)v41, &qword_1ECEB1328);
    }
    v26 = 2;
LABEL_23:
    sub_19CD3E3F8((uint64_t)&v32);
    memset(&v39[8], 0, 40);
    v40 = 2;
    *(_QWORD *)&v32 = v14;
    *((_QWORD *)&v32 + 1) = v16;
    *(_QWORD *)&v33 = v51;
    *((_QWORD *)&v33 + 1) = v11;
    v36 = v47;
    v37 = v48;
    v38 = v49;
    *(_QWORD *)v39 = v50;
    v34 = v45;
    v35 = v46;
    sub_19CFD5D0C((uint64_t)v44, (uint64_t)&v39[8]);
    *(_BYTE *)(a3 + 160) = v26;
    v27 = *(_OWORD *)&v39[32];
    *(_OWORD *)(a3 + 128) = *(_OWORD *)&v39[16];
    *(_OWORD *)(a3 + 144) = v27;
    v28 = v37;
    *(_OWORD *)(a3 + 64) = v36;
    *(_OWORD *)(a3 + 80) = v28;
    v29 = *(_OWORD *)v39;
    *(_OWORD *)(a3 + 96) = v38;
    *(_OWORD *)(a3 + 112) = v29;
    v30 = v33;
    *(_OWORD *)a3 = v32;
    *(_OWORD *)(a3 + 16) = v30;
    v31 = v35;
    *(_OWORD *)(a3 + 32) = v34;
    *(_OWORD *)(a3 + 48) = v31;
    return sub_19CD3E3F8(a1);
  }
  sub_19CD3E3F8(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double Models.Menu.init(deserializing:using:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double result;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  _OWORD v23[5];
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = *a2;
  JSONObject.subscript.getter(25705, 0xE200000000000000, (uint64_t)v23);
  sub_19CCF8C5C((uint64_t)v23, (uint64_t)v25, &qword_1ECEB1328);
  v7 = v26;
  if (v26)
  {
    v8 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
    v11 = v10;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    if (v11)
      goto LABEL_6;
  }
  else
  {
    sub_19CCECFE4((uint64_t)v25, &qword_1ECEB1328);
  }
  v9 = _s9JetEngine6ModelsO4MenuV2IDVAGycfC_0();
  v11 = v12;
LABEL_6:
  sub_19CD3E3F8((uint64_t)v23);
  JSONObject.subscript.getter(0x656C746974, 0xE500000000000000, (uint64_t)v23);
  sub_19CCF8C5C((uint64_t)v23, (uint64_t)v25, &qword_1ECEB1328);
  v13 = v26;
  if (v26)
  {
    v14 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14);
    v17 = v16;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    sub_19CD3E3F8((uint64_t)v23);
    if (v17)
      goto LABEL_11;
  }
  else
  {
    sub_19CCECFE4((uint64_t)v25, &qword_1ECEB1328);
    sub_19CD3E3F8((uint64_t)v23);
  }
  swift_bridgeObjectRelease();
  v15 = 0;
  v17 = 0xE000000000000000;
LABEL_11:
  JSONObject.subscript.getter(1852793705, 0xE400000000000000, (uint64_t)v25);
  v28 = v6;
  swift_bridgeObjectRetain();
  MediaArtwork.init(deserializing:using:)((uint64_t)v25, &v28, (uint64_t)v23);
  if (v3)
  {
    sub_19CD3E3F8(a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    JSONObject.subscript.getter(0x6E6572646C696863, 0xE800000000000000, (uint64_t)v25);
    v19 = sub_19CF45FF4((uint64_t)v25, v6);
    sub_19CD3E3F8(a1);
    *(_QWORD *)a3 = v9;
    *(_QWORD *)(a3 + 8) = v11;
    *(_QWORD *)(a3 + 16) = v15;
    *(_QWORD *)(a3 + 24) = v17;
    v20 = v23[3];
    *(_OWORD *)(a3 + 64) = v23[2];
    *(_OWORD *)(a3 + 80) = v20;
    *(_OWORD *)(a3 + 96) = v23[4];
    v21 = v24;
    result = *(double *)v23;
    v22 = v23[1];
    *(_OWORD *)(a3 + 32) = v23[0];
    *(_OWORD *)(a3 + 48) = v22;
    *(_QWORD *)(a3 + 112) = v21;
    *(_QWORD *)(a3 + 120) = v19;
  }
  return result;
}

uint64_t Models.Menu.Child.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  char v25;

  sub_19CFD5E5C(v0, (uint64_t)&v14);
  if (v25)
  {
    if (v25 == 1)
    {
      v7 = v18;
      v8 = v19;
      v9 = v20;
      v10 = v21;
      v3 = v14;
      v4 = v15;
      v5 = v16;
      v6 = v17;
      v1 = v14;
      swift_bridgeObjectRetain();
      sub_19CFD5ED4((uint64_t)&v3);
    }
    else
    {
      return v14;
    }
  }
  else
  {
    v11 = v22;
    v12 = v23;
    v13 = v24;
    v7 = v18;
    v8 = v19;
    v9 = v20;
    v10 = v21;
    v3 = v14;
    v4 = v15;
    v5 = v16;
    v6 = v17;
    v1 = v14;
    swift_bridgeObjectRetain();
    sub_19CFD5F00((uint64_t)&v3);
  }
  return v1;
}

uint64_t sub_19CFD4E98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Models.Menu.Child.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_19CFD4EBC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Models.Menu.Child.init(from:)(a1, a2);
}

uint64_t sub_19CFD4ED0(_QWORD *a1)
{
  return Models.Menu.Child.encode(to:)(a1);
}

uint64_t sub_19CFD4EE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return Models.Menu.Child.init(deserializing:using:)(a1, a2, a3);
}

id sub_19CFD4EF8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)_JEAtomicCounter), sel_initWithInitialValue_, 0);
  qword_1EE443DF8 = (uint64_t)result;
  return result;
}

unint64_t sub_19CFD4F34()
{
  unint64_t result;

  result = qword_1EE443E28;
  if (!qword_1EE443E28)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B818, &_s4MenuV4ItemV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443E28);
  }
  return result;
}

uint64_t sub_19CFD4F78()
{
  return sub_19CD09560(&qword_1EE443E40, &qword_1EE443E48, (uint64_t (*)(void))sub_19CFD316C, (uint64_t)&protocol conformance descriptor for <A> A?);
}

uint64_t sub_19CFD4F9C()
{
  return sub_19CD09560(&qword_1EE443E60, &qword_1EE442CB0, (uint64_t (*)(void))sub_19CFD4FC0, (uint64_t)&protocol conformance descriptor for <A> A?);
}

unint64_t sub_19CFD4FC0()
{
  unint64_t result;

  result = qword_1EE443E68;
  if (!qword_1EE443E68)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for MediaArtwork, &type metadata for MediaArtwork);
    atomic_store(result, (unint64_t *)&qword_1EE443E68);
  }
  return result;
}

uint64_t sub_19CFD5004()
{
  return sub_19CD09560(&qword_1EE443E88, &qword_1EE443E90, (uint64_t (*)(void))sub_19CFD5028, (uint64_t)&protocol conformance descriptor for <A> A?);
}

unint64_t sub_19CFD5028()
{
  unint64_t result;

  result = qword_1EE443E98;
  if (!qword_1EE443E98)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ItemRole, &type metadata for Models.Menu.ItemRole);
    atomic_store(result, (unint64_t *)&qword_1EE443E98);
  }
  return result;
}

uint64_t Models.Menu.ID.rawValue.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t static Models.Menu.ID.separator.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_19CFD50B8()
{
  sub_19CFD7668();
  return sub_19CFDF83C();
}

uint64_t sub_19CFD5114()
{
  sub_19CFD7668();
  return sub_19CFDF80C();
}

uint64_t Models.Menu.Item.init(id:title:icon:action:role:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X8>)
{
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t result;

  v9 = *a7;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_QWORD *)(a8 + 152) = 0;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_BYTE *)(a8 + 160) = 2;
  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  *(_QWORD *)(a8 + 24) = a4;
  v10 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(a8 + 64) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(a8 + 80) = v10;
  *(_OWORD *)(a8 + 96) = *(_OWORD *)(a5 + 64);
  *(_QWORD *)(a8 + 112) = *(_QWORD *)(a5 + 80);
  v11 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(a8 + 32) = *(_OWORD *)a5;
  *(_OWORD *)(a8 + 48) = v11;
  result = sub_19CFD5D0C(a6, a8 + 120);
  *(_BYTE *)(a8 + 160) = v9;
  return result;
}

uint64_t sub_19CFD51D0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_19CFD51FC + 4 * byte_19D06B0E4[*v0]))(0x656C746974, 0xE500000000000000);
}

uint64_t sub_19CFD51FC()
{
  return 25705;
}

uint64_t sub_19CFD5208()
{
  return 1852793705;
}

uint64_t sub_19CFD5218()
{
  return 0x6E6F69746361;
}

uint64_t sub_19CFD522C()
{
  return 1701605234;
}

uint64_t sub_19CFD523C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_19CFD7450(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19CFD5260()
{
  sub_19CFD4F34();
  return sub_19CFE0A48();
}

uint64_t sub_19CFD5288()
{
  sub_19CFD4F34();
  return sub_19CFE0A54();
}

uint64_t Models.Menu.Item.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Models.Menu.Item.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Models.Menu.Item.id.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.Item.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Models.Menu.Item.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*Models.Menu.Item.title.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.Item.icon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_19CF00C18(v1 + 32, a1);
}

uint64_t Models.Menu.Item.icon.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_19CFA31B8(a1, v1 + 32);
}

uint64_t (*Models.Menu.Item.icon.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.Item.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_19CCF8C5C(v1 + 120, a1, qword_1EE439B38);
}

uint64_t Models.Menu.Item.action.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_19CFD5D0C(a1, v1 + 120);
}

uint64_t (*Models.Menu.Item.action.modify())()
{
  return nullsub_1;
}

void Models.Menu.Item.role.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 160);
}

_BYTE *Models.Menu.Item.role.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 160) = *result;
  return result;
}

uint64_t (*Models.Menu.Item.role.modify())()
{
  return nullsub_1;
}

uint64_t sub_19CFD5418@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Models.Menu.Item.init(from:)(a1, a2);
}

uint64_t sub_19CFD542C(_QWORD *a1)
{
  return Models.Menu.Item.encode(to:)(a1);
}

uint64_t sub_19CFD5440@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return Models.Menu.Item.init(deserializing:using:)(a1, a2, a3);
}

uint64_t Models.Menu.ItemRole.init(rawValue:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_19CFE0424();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t Models.Menu.ItemRole.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7463757274736564;
  else
    return 0x6C65636E6163;
}

uint64_t sub_19CFD54F4(char *a1, char *a2)
{
  return sub_19CE80448(*a1, *a2);
}

uint64_t sub_19CFD5500()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

uint64_t sub_19CFD5584()
{
  sub_19CFDF650();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19CFD55E4()
{
  sub_19CFE08C8();
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

uint64_t sub_19CFD5664@<X0>(char *a1@<X8>)
{
  return Models.Menu.ItemRole.init(rawValue:)(a1);
}

void sub_19CFD5670(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6C65636E6163;
  if (*v1)
    v2 = 0x7463757274736564;
  v3 = 0xE600000000000000;
  if (*v1)
    v3 = 0xEB00000000657669;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_19CFD56B4()
{
  sub_19CFD7624();
  return sub_19CFDF83C();
}

uint64_t sub_19CFD5710()
{
  sub_19CFD7624();
  return sub_19CFDF80C();
}

__n128 Models.Menu.init(id:title:icon:children:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __int128 v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;

  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  v7 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(a7 + 64) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(a7 + 80) = v7;
  *(_OWORD *)(a7 + 96) = *(_OWORD *)(a5 + 64);
  v8 = *(_QWORD *)(a5 + 80);
  result = *(__n128 *)a5;
  v10 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(a7 + 32) = *(_OWORD *)a5;
  *(_OWORD *)(a7 + 48) = v10;
  *(_QWORD *)(a7 + 112) = v8;
  *(_QWORD *)(a7 + 120) = a6;
  return result;
}

void sub_19CFD5788(char *a1)
{
  sub_19CE80584(*a1);
}

void sub_19CFD5794()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_19CFE08C8();
  __asm { BR              X9 }
}

uint64_t sub_19CFD57D4()
{
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

void sub_19CFD5838()
{
  __asm { BR              X10 }
}

uint64_t sub_19CFD5868()
{
  sub_19CFDF650();
  return swift_bridgeObjectRelease();
}

void sub_19CFD58B8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_19CFE08C8();
  __asm { BR              X9 }
}

uint64_t sub_19CFD58F4()
{
  sub_19CFDF650();
  swift_bridgeObjectRelease();
  return sub_19CFE0910();
}

uint64_t sub_19CFD5958@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_19CFD7408();
  *a1 = result;
  return result;
}

uint64_t sub_19CFD5984()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_19CFD59A8 + 4 * byte_19D06B0F5[*v0]))();
}

void sub_19CFD59A8(_QWORD *a1@<X8>)
{
  *a1 = 0x656C746974;
  a1[1] = 0xE500000000000000;
}

void sub_19CFD59C0(_QWORD *a1@<X8>)
{
  *a1 = 1852793705;
  a1[1] = 0xE400000000000000;
}

void sub_19CFD59D4(_QWORD *a1@<X8>)
{
  *a1 = 0x6E6572646C696863;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_19CFD59F0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_19CFD5A14 + 4 * byte_19D06B0F9[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_19CFD5A14()
{
  return 0x656C746974;
}

uint64_t sub_19CFD5A28()
{
  return 1852793705;
}

uint64_t sub_19CFD5A38()
{
  return 0x6E6572646C696863;
}

uint64_t sub_19CFD5A50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_19CFD7408();
  *a1 = result;
  return result;
}

uint64_t sub_19CFD5A74()
{
  sub_19CFD5D54();
  return sub_19CFE0A48();
}

uint64_t sub_19CFD5A9C()
{
  sub_19CFD5D54();
  return sub_19CFE0A54();
}

uint64_t Models.Menu.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Models.Menu.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Models.Menu.id.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Models.Menu.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*Models.Menu.title.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.icon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_19CF00C18(v1 + 32, a1);
}

uint64_t Models.Menu.icon.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_19CFA31B8(a1, v1 + 32);
}

uint64_t (*Models.Menu.icon.modify())()
{
  return nullsub_1;
}

uint64_t Models.Menu.children.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Models.Menu.children.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 120) = a1;
  return result;
}

uint64_t (*Models.Menu.children.modify())()
{
  return nullsub_1;
}

uint64_t sub_19CFD5C08@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  return Models.Menu.init(from:)(a1, a2);
}

uint64_t sub_19CFD5C1C(_QWORD *a1)
{
  return Models.Menu.encode(to:)(a1);
}

double sub_19CFD5C30@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return Models.Menu.init(deserializing:using:)(a1, a2, a3);
}

unint64_t _s9JetEngine6ModelsO4MenuV2IDVAGycfC_0()
{
  sub_19CFE010C();
  swift_bridgeObjectRelease();
  if (qword_1EE43D798 != -1)
    swift_once();
  objc_msgSend((id)qword_1EE443DF8, sel_increment);
  sub_19CFE0598();
  sub_19CFDF698();
  swift_bridgeObjectRelease();
  return 0xD00000000000001ALL;
}

uint64_t sub_19CFD5D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EE439B38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_19CFD5D54()
{
  unint64_t result;

  result = qword_1EE443EA8;
  if (!qword_1EE443EA8)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B7C8, &_s4MenuV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443EA8);
  }
  return result;
}

unint64_t sub_19CFD5D98()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EE4426B0;
  if (!qword_1EE4426B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ECEB2550);
    v2 = MEMORY[0x1E0DEA9A0];
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for <A> A?, v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EE4426B0);
  }
  return result;
}

uint64_t sub_19CFD5DF4()
{
  return sub_19CD09560(&qword_1EE443EC0, &qword_1EE442780, (uint64_t (*)(void))sub_19CFD5E18, (uint64_t)&protocol conformance descriptor for <A> [A]);
}

unint64_t sub_19CFD5E18()
{
  unint64_t result;

  result = qword_1EE443EC8;
  if (!qword_1EE443EC8)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.Child, &type metadata for Models.Menu.Child);
    atomic_store(result, (unint64_t *)&qword_1EE443EC8);
  }
  return result;
}

uint64_t sub_19CFD5E5C(uint64_t a1, uint64_t a2)
{
  _s4MenuV5ChildOwcp(a2, a1);
  return a2;
}

unint64_t sub_19CFD5E90()
{
  unint64_t result;

  result = qword_1EE443ED8;
  if (!qword_1EE443ED8)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ID, &type metadata for Models.Menu.ID);
    atomic_store(result, (unint64_t *)&qword_1EE443ED8);
  }
  return result;
}

uint64_t sub_19CFD5ED4(uint64_t a1)
{
  _s4MenuVwxx(a1);
  return a1;
}

uint64_t sub_19CFD5F00(uint64_t a1)
{
  _s4MenuV4ItemVwxx(a1);
  return a1;
}

unint64_t sub_19CFD5F2C()
{
  unint64_t result;

  result = qword_1EE443EF0;
  if (!qword_1EE443EF0)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ItemRole, &type metadata for Models.Menu.ItemRole);
    atomic_store(result, (unint64_t *)&qword_1EE443EF0);
  }
  return result;
}

unint64_t sub_19CFD5F70()
{
  unint64_t result;

  result = qword_1EE443F08;
  if (!qword_1EE443F08)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.Child, &type metadata for Models.Menu.Child);
    atomic_store(result, (unint64_t *)&qword_1EE443F08);
  }
  return result;
}

unint64_t sub_19CFD5FB8()
{
  unint64_t result;

  result = qword_1EE443F10;
  if (!qword_1EE443F10)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ID, &type metadata for Models.Menu.ID);
    atomic_store(result, (unint64_t *)&qword_1EE443F10);
  }
  return result;
}

unint64_t sub_19CFD6000()
{
  unint64_t result;

  result = qword_1EE443F18;
  if (!qword_1EE443F18)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ID, &type metadata for Models.Menu.ID);
    atomic_store(result, (unint64_t *)&qword_1EE443F18);
  }
  return result;
}

unint64_t sub_19CFD6048()
{
  unint64_t result;

  result = qword_1EE443F20;
  if (!qword_1EE443F20)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ItemRole, &type metadata for Models.Menu.ItemRole);
    atomic_store(result, (unint64_t *)&qword_1EE443F20);
  }
  return result;
}

uint64_t _s4MenuVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  return swift_bridgeObjectRelease();
}

uint64_t _s4MenuVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  id v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v7 = *(void **)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v9 = a2 + 80;
  v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  v11 = v10;
  v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v7;
  v14 = v8;
  v12(a1 + 80, v9, v11);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4MenuVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(void **)(a2 + 56);
  v9 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s4MenuVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Models.Menu()
{
  return &type metadata for Models.Menu;
}

uint64_t _s4MenuV5ChildOwxx(uint64_t a1)
{
  unsigned int v2;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 161);
  if (v2 >= 3)
    v2 = *(_DWORD *)a1 + 3;
  if (v2 == 2)
    return swift_bridgeObjectRelease();
  if (v2 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  result = __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  if (*(_QWORD *)(a1 + 144))
    return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  return result;
}

uint64_t _s4MenuV5ChildOwcp(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  id v25;
  id v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;

  v4 = *(unsigned __int8 *)(a2 + 161);
  if (v4 >= 3)
    v4 = *(_DWORD *)a2 + 3;
  if (v4 == 2)
  {
    v16 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v16;
    v15 = 2;
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    v5 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v6;
    v8 = *(void **)(a2 + 32);
    v7 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v7;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    v9 = *(void **)(a2 + 56);
    *(_QWORD *)(a1 + 56) = v9;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    v10 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 104) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = v8;
    v14 = v9;
    v12(a1 + 80, a2 + 80, v11);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    v15 = 1;
LABEL_7:
    *(_BYTE *)(a1 + 161) = v15;
    swift_bridgeObjectRetain();
    return a1;
  }
  v17 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v17;
  v18 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v18;
  v20 = *(void **)(a2 + 32);
  v19 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v20;
  *(_QWORD *)(a1 + 40) = v19;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v21 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v21;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v22 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v22;
  v23 = v22;
  v24 = **(void (***)(uint64_t, uint64_t, uint64_t))(v22 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25 = v20;
  v26 = v21;
  v24(a1 + 80, a2 + 80, v23);
  v27 = (_OWORD *)(a1 + 120);
  v28 = (_OWORD *)(a2 + 120);
  v29 = *(_QWORD *)(a2 + 144);
  if (v29)
  {
    v30 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v29;
    *(_QWORD *)(a1 + 152) = v30;
    (**(void (***)(_OWORD *, _OWORD *))(v29 - 8))(v27, v28);
  }
  else
  {
    v31 = *(_OWORD *)(a2 + 136);
    *v27 = *v28;
    *(_OWORD *)(a1 + 136) = v31;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  *(_WORD *)(a1 + 160) = *(unsigned __int8 *)(a2 + 160);
  return a1;
}

uint64_t _s4MenuV5ChildOwca(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  id v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  id v19;
  id v20;
  _OWORD *v21;
  __int128 *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  if (a1 == a2)
    return a1;
  v4 = *(unsigned __int8 *)(a1 + 161);
  if (v4 >= 3)
    v4 = *(_DWORD *)a1 + 3;
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
      if (*(_QWORD *)(a1 + 144))
        __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v5 = *(unsigned __int8 *)(a2 + 161);
  if (v5 >= 3)
    v5 = *(_DWORD *)a2 + 3;
  if (v5 == 2)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    v13 = 2;
    goto LABEL_16;
  }
  if (v5 == 1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    v6 = *(void **)(a2 + 32);
    *(_QWORD *)(a1 + 32) = v6;
    v7 = *(_QWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    v8 = *(void **)(a2 + 56);
    *(_QWORD *)(a1 + 56) = v8;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    v9 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 104) = v9;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = v6;
    v12 = v8;
    v10(a1 + 80, a2 + 80, v9);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    v13 = 1;
LABEL_16:
    *(_BYTE *)(a1 + 161) = v13;
    swift_bridgeObjectRetain();
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v14 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v14;
  v15 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v15;
  v16 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v17 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v18 = **(void (***)(uint64_t, uint64_t, uint64_t))(v17 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v14;
  v20 = v16;
  v18(a1 + 80, a2 + 80, v17);
  v21 = (_OWORD *)(a1 + 120);
  v22 = (__int128 *)(a2 + 120);
  v23 = *(_QWORD *)(a2 + 144);
  if (v23)
  {
    *(_QWORD *)(a1 + 144) = v23;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    (**(void (***)(_OWORD *, __int128 *))(v23 - 8))(v21, v22);
  }
  else
  {
    v24 = *v22;
    v25 = *(_OWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    *v21 = v24;
    *(_OWORD *)(a1 + 136) = v25;
  }
  *(_WORD *)(a1 + 160) = *(unsigned __int8 *)(a2 + 160);
  return a1;
}

__n128 __swift_memcpy162_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_WORD *)(a1 + 160) = *((_WORD *)a2 + 80);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t _s4MenuV5ChildOwta(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (a1 == a2)
    return a1;
  v4 = *(unsigned __int8 *)(a1 + 161);
  if (v4 >= 3)
    v4 = *(_DWORD *)a1 + 3;
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
      if (*(_QWORD *)(a1 + 144))
        __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v5 = *(unsigned __int8 *)(a2 + 161);
  if (v5 >= 3)
    v5 = *(_DWORD *)a2 + 3;
  if (v5 == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else if (v5 == 1)
  {
    v6 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v6;
    v7 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v7;
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
  }
  else
  {
    LOBYTE(v5) = 0;
    *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
    v10 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v10;
    v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v11;
    v12 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v12;
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    v14 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v14;
  }
  *(_BYTE *)(a1 + 161) = v5;
  return a1;
}

uint64_t _s4MenuV5ChildOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 162))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 161);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t _s4MenuV5ChildOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 160) = 0;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 162) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 162) = 0;
    if (a2)
      *(_BYTE *)(result + 161) = -(char)a2;
  }
  return result;
}

uint64_t sub_19CFD6A48(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 161);
  if (result >= 3)
    return (*(_DWORD *)a1 + 3);
  return result;
}

uint64_t sub_19CFD6A64(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_BYTE *)(result + 160) = 0;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 161) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Models.Menu.Child()
{
  return &type metadata for Models.Menu.Child;
}

ValueMetadata *type metadata accessor for Models.Menu.ID()
{
  return &type metadata for Models.Menu.ID;
}

uint64_t _s4MenuV4ItemVwxx(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  result = __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  if (*(_QWORD *)(a1 + 144))
    return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  return result;
}

uint64_t _s4MenuV4ItemVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  id v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v7 = *(void **)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v9 = a2 + 80;
  v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  v11 = v10;
  v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v7;
  v14 = v8;
  v12(a1 + 80, v9, v11);
  v15 = (_OWORD *)(a1 + 120);
  v16 = (_OWORD *)(a2 + 120);
  v17 = *(_QWORD *)(a2 + 144);
  if (v17)
  {
    v18 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v17;
    *(_QWORD *)(a1 + 152) = v18;
    (**(void (***)(_OWORD *, _OWORD *))(v17 - 8))(v15, v16);
  }
  else
  {
    v19 = *(_OWORD *)(a2 + 136);
    *v15 = *v16;
    *(_OWORD *)(a1 + 136) = v19;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

uint64_t _s4MenuV4ItemVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(void **)(a2 + 56);
  v9 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  v11 = *(_QWORD *)(a2 + 144);
  if (!*(_QWORD *)(a1 + 144))
  {
    if (v11)
    {
      *(_QWORD *)(a1 + 144) = v11;
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 120, a2 + 120);
      goto LABEL_8;
    }
LABEL_7:
    v12 = *(_OWORD *)(a2 + 120);
    v13 = *(_OWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 120) = v12;
    *(_OWORD *)(a1 + 136) = v13;
    goto LABEL_8;
  }
  if (!v11)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
LABEL_8:
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

__n128 __swift_memcpy161_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_BYTE *)(a1 + 160) = *((_BYTE *)a2 + 160);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t _s4MenuV4ItemVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 144))
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  v9 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v9;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

uint64_t _s4MenuV4ItemVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 161))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s4MenuV4ItemVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 160) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 161) = 1;
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
    *(_BYTE *)(result + 161) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Models.Menu.Item()
{
  return &type metadata for Models.Menu.Item;
}

ValueMetadata *type metadata accessor for Models.Menu.ItemRole()
{
  return &type metadata for Models.Menu.ItemRole;
}

uint64_t _s4MenuV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFD6F68 + 4 * byte_19D06B102[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_19CFD6F9C + 4 * byte_19D06B0FD[v4]))();
}

uint64_t sub_19CFD6F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD6FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFD6FACLL);
  return result;
}

uint64_t sub_19CFD6FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFD6FC0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_19CFD6FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD6FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s4MenuV10CodingKeysOMa()
{
  return &_s4MenuV10CodingKeysON;
}

uint64_t _s4MenuV4ItemV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFD7034 + 4 * byte_19D06B10C[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_19CFD7068 + 4 * byte_19D06B107[v4]))();
}

uint64_t sub_19CFD7068(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD7070(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFD7078);
  return result;
}

uint64_t sub_19CFD7084(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFD708CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_19CFD7090(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD7098(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s4MenuV4ItemV10CodingKeysOMa()
{
  return &_s4MenuV4ItemV10CodingKeysON;
}

uint64_t _s4MenuV8ItemRoleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19CFD7100 + 4 * byte_19D06B116[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19CFD7134 + 4 * byte_19D06B111[v4]))();
}

uint64_t sub_19CFD7134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD713C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19CFD7144);
  return result;
}

uint64_t sub_19CFD7150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19CFD7158);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19CFD715C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19CFD7164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s4MenuV5ChildO10CodingKeysOMa()
{
  return &_s4MenuV5ChildO10CodingKeysON;
}

unint64_t sub_19CFD7184()
{
  unint64_t result;

  result = qword_1EE443F28;
  if (!qword_1EE443F28)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B5F8, &_s4MenuV5ChildO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F28);
  }
  return result;
}

unint64_t sub_19CFD71CC()
{
  unint64_t result;

  result = qword_1EE443F30;
  if (!qword_1EE443F30)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B6B0, &_s4MenuV4ItemV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F30);
  }
  return result;
}

unint64_t sub_19CFD7214()
{
  unint64_t result;

  result = qword_1EE443F38;
  if (!qword_1EE443F38)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B7A0, &_s4MenuV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F38);
  }
  return result;
}

unint64_t sub_19CFD725C()
{
  unint64_t result;

  result = qword_1EE443F40;
  if (!qword_1EE443F40)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B6D8, &_s4MenuV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F40);
  }
  return result;
}

unint64_t sub_19CFD72A4()
{
  unint64_t result;

  result = qword_1EE443F48;
  if (!qword_1EE443F48)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B700, &_s4MenuV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F48);
  }
  return result;
}

unint64_t sub_19CFD72EC()
{
  unint64_t result;

  result = qword_1EE443F50;
  if (!qword_1EE443F50)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B620, &_s4MenuV4ItemV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F50);
  }
  return result;
}

unint64_t sub_19CFD7334()
{
  unint64_t result;

  result = qword_1EE443F58;
  if (!qword_1EE443F58)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B648, &_s4MenuV4ItemV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F58);
  }
  return result;
}

unint64_t sub_19CFD737C()
{
  unint64_t result;

  result = qword_1EE443F60;
  if (!qword_1EE443F60)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B530, &_s4MenuV5ChildO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F60);
  }
  return result;
}

unint64_t sub_19CFD73C4()
{
  unint64_t result;

  result = qword_1EE443F68;
  if (!qword_1EE443F68)
  {
    result = MEMORY[0x1A1ADBD7C](&unk_19D06B558, &_s4MenuV5ChildO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1EE443F68);
  }
  return result;
}

uint64_t sub_19CFD7408()
{
  unint64_t v0;

  v0 = sub_19CFE0424();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_19CFD7450(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1852793705 && a2 == 0xE400000000000000 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000 || (sub_19CFE06A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701605234 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_19CFE06A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

unint64_t sub_19CFD7624()
{
  unint64_t result;

  result = qword_1EE443F70;
  if (!qword_1EE443F70)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ItemRole, &type metadata for Models.Menu.ItemRole);
    atomic_store(result, (unint64_t *)&qword_1EE443F70);
  }
  return result;
}

unint64_t sub_19CFD7668()
{
  unint64_t result;

  result = qword_1EE443F78;
  if (!qword_1EE443F78)
  {
    result = MEMORY[0x1A1ADBD7C](&protocol conformance descriptor for Models.Menu.ID, &type metadata for Models.Menu.ID);
    atomic_store(result, (unint64_t *)&qword_1EE443F78);
  }
  return result;
}

unint64_t PackageEncryptionError.errorDescription.getter()
{
  int *v0;
  int v1;
  int v2;
  unint64_t v4;

  v1 = *v0;
  v2 = *((unsigned __int8 *)v0 + 4);
  if (!*((_BYTE *)v0 + 4))
  {
    sub_19CFE010C();
    swift_bridgeObjectRelease();
    v4 = 0xD00000000000001BLL;
    goto LABEL_10;
  }
  if (v2 == 1)
  {
    sub_19CFE010C();
    swift_bridgeObjectRelease();
    v4 = 0xD00000000000001ELL;
LABEL_10:
    sub_19CFE0598();
    sub_19CFDF698();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (v2 != 2)
  {
LABEL_7:
    v4 = 0;
    sub_19CFE010C();
    sub_19CFDF698();
    sub_19CFE02E0();
    return v4;
  }
  if (v1)
  {
    if (v1 == 1)
      return 0xD000000000000030;
    goto LABEL_7;
  }
  return 0xD000000000000016;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PackageEncryptionError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PackageEncryptionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t sub_19CFD78E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 1u)
    return *(unsigned __int8 *)(a1 + 4);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_19CFD78F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 4) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PackageEncryptionError()
{
  return &type metadata for PackageEncryptionError;
}

uint64_t WritableStateLens.init<A>(contentsOf:in:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v11;

  v11 = *a1;
  a5[3] = type metadata accessor for StateStoreHandle(0, a3, a4, a3);
  a5[4] = (uint64_t)&off_1E3DCDFA8;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(a5);
  return sub_19CE78870(&v11, a2, a3, a4, boxed_opaque_existential_2Tm);
}

_QWORD *WritableStateLens.init(get:set:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _QWORD *result;

  a5[3] = &type metadata for DelegatingStateStoreHandle;
  a5[4] = &off_1E3DD4BB8;
  result = (_QWORD *)swift_allocObject();
  *a5 = result;
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_19CFD7A0C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t WritableStateLens<A>.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v3[3];
  v10 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(v5, a3, v9, v10);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t WritableStateLens<A>.currentValue.getter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[3];
  v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v6 + 8))(*(_QWORD *)(a1 + 16), a2, v5, v6);
}

uint64_t WritableStateLens<A>.updateValue(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  sub_19CCD5B84(v4, (uint64_t)v16);
  v9 = v17;
  v10 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  v12[2] = *(_QWORD *)(a3 + 16);
  v12[3] = a4;
  v13 = v4;
  v14 = a1;
  v15 = a2;
  (*(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v10 + 16))(sub_19CFD7DD4, v12, v9, v10);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
}

uint64_t sub_19CFD7C14(_QWORD *a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *boxed_opaque_existential_2Tm;
  void (*v31)(char *, uint64_t);
  _QWORD v32[2];
  void (*v33)(char *);
  uint64_t v34[7];

  v32[1] = a3;
  v33 = a2;
  v8 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v32 - v13;
  v17 = type metadata accessor for WritableStateLens(0, v16, v15, v16);
  v19 = a1[3];
  v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8);
  v21 = *(_QWORD *)(v17 + 16);
  v32[0] = a5;
  v20(v21, a5, v19, v18);
  v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v22(v10, v14, a4);
  v23 = v34[6];
  v33(v10);
  if (v23 || (sub_19CFDF548() & 1) != 0)
  {
    v24 = *(void (**)(char *, uint64_t))(v8 + 8);
    v24(v10, a4);
    return ((uint64_t (*)(char *, uint64_t))v24)(v14, a4);
  }
  else
  {
    v26 = a1[4];
    v27 = a1;
    v28 = a1[3];
    __swift_project_boxed_opaque_existential_1(v27, v28);
    v29 = *(_QWORD *)(v32[0] + 8);
    v34[3] = a4;
    v34[4] = v29;
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v34);
    v22((char *)boxed_opaque_existential_2Tm, v10, a4);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 24))(v34, v28, v26);
    v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v10, a4);
    v31(v14, a4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  }
}

uint64_t sub_19CFD7DD4()
{
  uint64_t v0;

  return sub_19CFD7C14(*(_QWORD **)(v0 + 32), *(void (**)(char *))(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t WritableStateLens.init(_:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_19CCD14C4(a1, a2);
}

uint64_t type metadata accessor for WritableStateLens(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WritableStateLens);
}

__n128 CodeAnyHashable.init(wrappedValue:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t CodeAnyHashable.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_19CD23A14(v1, a1);
}

uint64_t CodeAnyHashable.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_19CFD7E38(a1, v1);
}

uint64_t sub_19CFD7E38(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 40))(a2, a1);
  return a2;
}

uint64_t (*CodeAnyHashable.wrappedValue.modify())()
{
  return nullsub_1;
}

double CodeAnyHashable.init(from:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  double result;
  __int128 v8;
  _BYTE v9[40];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  MEMORY[0x1E0C80A78](a1, a2);
  sub_19CCD5B84(v6, (uint64_t)v9);
  sub_19CFDFB90();
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
  }
  else
  {
    sub_19CFE00C4();
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
    result = *(double *)&v10;
    v8 = v11;
    *(_OWORD *)a3 = v10;
    *(_OWORD *)(a3 + 16) = v8;
    *(_QWORD *)(a3 + 32) = v12;
  }
  return result;
}

uint64_t CodeAnyHashable.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
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
  char *v14;
  int v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD v22[2];

  v4 = *(_QWORD *)(a2 + 16);
  v5 = sub_19CFDFF5C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)v22 - v8;
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFE00AC();
  v15 = swift_dynamicCast();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v15)
  {
    v16(v9, 0, 1, v4);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v9, v4);
    sub_19CFDF4B8();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v14, v4);
  }
  else
  {
    v16(v9, 1, 1, v4);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v18 = sub_19CFE01D8();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43E9B8);
    v20[3] = MEMORY[0x1E0DEC198];
    v21 = swift_allocObject();
    *v20 = v21;
    sub_19CD23A14(v2, v21 + 16);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_19CFE09B8();
    v22[0] = 0;
    v22[1] = 0xE000000000000000;
    sub_19CFE010C();
    swift_bridgeObjectRelease();
    strcpy((char *)v22, "Value is not <");
    HIBYTE(v22[1]) = -18;
    sub_19CFE0A90();
    sub_19CFDF698();
    swift_bridgeObjectRelease();
    sub_19CFDF698();
    sub_19CFE019C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x1E0DEC4B0], v18);
    return swift_willThrow();
  }
}

uint64_t sub_19CFD8200()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t CodeAnyHashable.hashValue.getter()
{
  sub_19CFE08C8();
  _s9JetEngine15CodeAnyHashableV4hash4intoys6HasherVz_tF_0();
  return sub_19CFE0910();
}

uint64_t sub_19CFD8270()
{
  sub_19CFE08C8();
  CodeAnyHashable.hash(into:)();
  return sub_19CFE0910();
}

void sub_19CFD82A8()
{
  JUMPOUT(0x1A1ADBD7CLL);
}

double sub_19CFD82B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return CodeAnyHashable.init(from:)(a1, *(_QWORD *)(a2 + 16), a3);
}

uint64_t sub_19CFD82D8(_QWORD *a1, uint64_t a2)
{
  return CodeAnyHashable.encode(to:)(a1, a2);
}

void type metadata accessor for CodeAnyHashable()
{
  JUMPOUT(0x1A1ADBCC8);
}

id URLBagContract.init(_:)(uint64_t *a1)
{
  char *v1;
  uint64_t v2;
  objc_class *v3;
  char *v4;
  char *v5;
  objc_super v7;
  objc_super v8;

  v2 = *a1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9JetEngine14URLBagContract_backing] = *a1;
  v3 = (objc_class *)type metadata accessor for MescalBagContract();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC9JetEngine17MescalBagContract_backing] = v2;
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = v1;
  swift_unknownObjectRetain();
  *(_QWORD *)&v5[OBJC_IVAR____TtC9JetEngine14URLBagContract_mescalContract] = objc_msgSendSuper2(&v8, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for URLBagContract();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for URLBagContract()
{
  return objc_opt_self();
}

id sub_19CFD83BC()
{
  return sub_19CFD8580(0x6C72752D64697567, 0xEF78656765722F73, (SEL *)&selRef_arrayForKey_);
}

id sub_19CFD83E8()
{
  return sub_19CFD8580(0xD000000000000011, 0x800000019D07AE50, (SEL *)&selRef_arrayForKey_);
}

id sub_19CFD840C()
{
  return sub_19CFD8580(0xD000000000000018, 0x800000019D07AE70, (SEL *)&selRef_stringForKey_);
}

id sub_19CFD8430()
{
  return sub_19CFD8580(0x4464657473757274, 0xEE00736E69616D6FLL, (SEL *)&selRef_arrayForKey_);
}

uint64_t sub_19CFD845C()
{
  return swift_unknownObjectRetain();
}

id sub_19CFD8464()
{
  return sub_19CFD8580(0xD000000000000015, 0x800000019D07AE90, (SEL *)&selRef_doubleForKey_);
}

id sub_19CFD8488()
{
  return sub_19CFD8580(0xD00000000000001ALL, 0x800000019D07AEB0, (SEL *)&selRef_integerForKey_);
}

id sub_19CFD84AC()
{
  return sub_19CFD8580(0xD000000000000015, 0x800000019D07AED0, (SEL *)&selRef_doubleForKey_);
}

id sub_19CFD84D0()
{
  return sub_19CFD8580(0xD00000000000001ALL, 0x800000019D07AEF0, (SEL *)&selRef_integerForKey_);
}

id sub_19CFD84F4()
{
  return sub_19CFD8580(0xD000000000000014, 0x800000019D07AF10, (SEL *)&selRef_arrayForKey_);
}

id sub_19CFD8518()
{
  return sub_19CFD8580(0xD000000000000017, 0x800000019D07AF30, (SEL *)&selRef_integerForKey_);
}

id sub_19CFD853C()
{
  return sub_19CFD8580(0xD000000000000012, 0x800000019D07AF50, (SEL *)&selRef_URLForKey_);
}

id sub_19CFD8560()
{
  return sub_19CFD8580(0x7363697274656DLL, 0xE700000000000000, (SEL *)&selRef_dictionaryForKey_);
}

id sub_19CFD8580(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(v3 + OBJC_IVAR____TtC9JetEngine14URLBagContract_backing);
  v6 = (void *)sub_19CFDF554();
  v7 = objc_msgSend(v5, *a3, v6);

  return v7;
}

id URLBagContract.__allocating_init(_:)(uint64_t *a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;
  objc_super v10;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = *a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9JetEngine14URLBagContract_backing] = v4;
  v5 = (objc_class *)type metadata accessor for MescalBagContract();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC9JetEngine17MescalBagContract_backing] = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v7 = v3;
  swift_unknownObjectRetain();
  *(_QWORD *)&v7[OBJC_IVAR____TtC9JetEngine14URLBagContract_mescalContract] = objc_msgSendSuper2(&v10, sel_init);

  v9.receiver = v7;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t URLBagContract.mescalContract.getter()
{
  return swift_unknownObjectRetain();
}

id sub_19CFD8880(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  char *v7;
  void *v8;
  id v9;

  v6 = *(void **)&a1[OBJC_IVAR____TtC9JetEngine14URLBagContract_backing];
  v7 = a1;
  v8 = (void *)sub_19CFDF554();
  v9 = objc_msgSend(v6, *a5, v8);

  return v9;
}

id URLBagContract.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void URLBagContract.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id URLBagContract.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for URLBagContract();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for URLBagContract()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of URLBagContract.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of URLBagContract.guidRegexes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of URLBagContract.guidSchemes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of URLBagContract.storefrontSuffix.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of URLBagContract.trustedDomains.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of URLBagContract.metricsContract.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of URLBagContract.tlsSamplingPercentage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of URLBagContract.tlsSamplingSessionDuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of URLBagContract.tfoSamplingPercentage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of URLBagContract.tfoSamplingSessionDuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of URLBagContract.apsEnabledPatterns.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of URLBagContract.apsSamplingPercent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of URLBagContract.metricsURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of URLBagContract.metricsDictionary.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LocalizerFormattingStringsDataSource.formattingString(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_19CFD8B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  uint64_t result;
  _QWORD *v8;
  unint64_t v9;

  v5 = *(_QWORD **)v2;
  v6 = *(_QWORD *)(v2 + 8);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (uint64_t)sub_19CF81ADC(v5);
  v5 = (_QWORD *)result;
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_9;
LABEL_3:
  if (v6 >= v5[2])
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v8 = &v5[2 * v6];
  result = swift_bridgeObjectRelease();
  v8[4] = a1;
  v8[5] = a2;
  *(_QWORD *)v2 = v5;
  if (v5[2] == v6 + 1)
    v9 = 0;
  else
    v9 = v6 + 1;
  *(_QWORD *)(v2 + 8) = v9;
  return result;
}

uint64_t sub_19CFD8C00(uint64_t *a1, uint64_t a2)
{
  return sub_19CFD8C14(a1, a2);
}

uint64_t sub_19CFD8C14(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;

  v4 = *a1;
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((result & 1) == 0)
  {
    result = sub_19CE4A2A0(0, *(_QWORD *)(v4 + 16) + 1, 1);
    v4 = *a1;
  }
  v7 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  if (v7 >= v6 >> 1)
  {
    result = sub_19CE4A2A0(v6 > 1, v7 + 1, 1);
    v4 = *a1;
  }
  *(_QWORD *)(v4 + 16) = v7 + 1;
  *(_QWORD *)(v4 + 8 * v7 + 32) = a2;
  *a1 = v4;
  return result;
}

uint64_t sub_19CFD8CBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[48];
  uint64_t v12;
  uint64_t v13;
  __int128 v14[2];
  _BYTE v15[64];

  sub_19CCD5B84(a1, (uint64_t)v14);
  swift_unknownObjectWeakInit();
  sub_19CCD14C4(v14, (uint64_t)v11);
  swift_unknownObjectWeakAssign();
  v12 = a2;
  v13 = a3;
  sub_19CCC290C((uint64_t)v11, (uint64_t)v15, &qword_1EE444090);
  sub_19CCF8C5C((uint64_t)v15, (uint64_t)v11, &qword_1EE444090);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE444098);
  v8 = swift_allocObject();
  sub_19CCC290C((uint64_t)v11, v8 + 16, &qword_1EE444090);
  v9 = *(_QWORD *)(v4 + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
  sub_19CFD8C14((uint64_t *)(v9 + 16), v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
  swift_release();
  *a4 = v8;
  return sub_19CCECFE4((uint64_t)v15, &qword_1EE444090);
}

uint64_t sub_19CFD8DE4(uint64_t a1)
{
  __int128 v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  sub_19CFD945C(a1, (uint64_t)&v3);
  if (v4)
  {
    sub_19CCD14C4(&v3, (uint64_t)v5);
    __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    sub_19CFDE9A8();
    __asm { BR              X10 }
  }
  return sub_19CCECFE4((uint64_t)&v3, &qword_1EE4417A0);
}

uint64_t sub_19CFD945C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t inited;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v11;
  _BYTE v12[40];

  sub_19CCD5B84(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4440B0);
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B90);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19D052350;
    v4 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 32) = 0x646E696B24;
    *(_QWORD *)(inited + 40) = 0xE500000000000000;
    strcpy((char *)(inited + 48), "metricsEvent");
    *(_BYTE *)(inited + 61) = 0;
    *(_WORD *)(inited + 62) = -5120;
    *(_QWORD *)(inited + 72) = v4;
    *(_QWORD *)(inited + 80) = 1635017060;
    *(_QWORD *)(inited + 88) = 0xE400000000000000;
    v5 = objc_msgSend(v11, sel_dictionaryForPosting);
    v6 = sub_19CFDF3C8();

    *(_QWORD *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0578);
    *(_QWORD *)(inited + 96) = v6;
    v7 = sub_19CD30650(inited);
    *(_QWORD *)(a2 + 24) = &type metadata for JSONObject;
    *(_QWORD *)(a2 + 32) = sub_19CE081CC();
    v8 = (_QWORD *)swift_allocObject();
    v8[5] = &type metadata for FoundationValue;
    v8[6] = &off_1E3DCC5B0;
    v9 = swift_allocObject();
    v8[2] = v9;
    *(_QWORD *)(v9 + 40) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B70);
    *(_QWORD *)(v9 + 16) = v7;

  }
  else
  {
    v8 = 0;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
  }
  *(_QWORD *)a2 = v8;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_19CFD9634()
{
  uint64_t v0;
  id v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = _s9JetEngine19RunLoopWorkerThreadC7currentACSgvgZ_0();
  swift_release();
  if (!v1)
    sub_19CFB01FC("JetEngine/JSDebugObject.swift", 29, 2, 71);
  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9JetEngine13JSDebugObject_newPoints);
  swift_beginAccess();
  v3 = v2[1];
  v4 = swift_bridgeObjectRetain();
  v5 = sub_19CEEEB04(v4, v3);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *v2 = sub_19CD34938(0, 0, *(_QWORD *)(*v2 + 16));
  v2[1] = 0;
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_19CFD9750()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[5];
  uint64_t v6;

  v1 = _s9JetEngine19RunLoopWorkerThreadC7currentACSgvgZ_0();
  if (!v1)
    return sub_19CFB01FC("JetEngine/JSDebugObject.swift", 29, 2, 81);
  v2 = v1;
  v3 = OBJC_IVAR____TtC9JetEngine13JSDebugObject_isDebugPointsEnabled;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC9JetEngine13JSDebugObject_isDebugPointsEnabled) & 1) != 0)
    return swift_release();
  if (qword_1EE43D6F8 != -1)
    swift_once();
  v5[3] = type metadata accessor for RunLoopWorkerThread();
  v5[4] = &protocol witness table for RunLoopWorkerThread;
  v5[0] = v2;
  swift_retain();
  swift_retain();
  sub_19CFD8CBC((uint64_t)v5, (uint64_t)sub_19CFD9874, 0, &v6);
  swift_release();
  swift_release();
  swift_release();
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  *(_BYTE *)(v0 + v3) = 1;
  return result;
}

uint64_t (*sub_19CFD9874(void *a1))(uint64_t a1)
{
  id v2;

  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v2 = a1;
  return sub_19CFD9C98;
}

uint64_t sub_19CFD9934(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_19CFDEBA0();
  v9 = result;
  if (result)
  {
    result = sub_19CFDEBC4();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = sub_19CFDEBB8();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = (uint64_t)sub_19CFD9A8C(v9, v15, a4);
  if (v4)
    return v16;
  return result;
}

uint64_t sub_19CFD99E0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_19CD3BE5C(a1, a2);
  sub_19CFD9AD8(a1, a2);
  sub_19CD3BE18(a1, a2);
  v4 = sub_19CFDF638();
  swift_release();
  return v4;
}

uint64_t sub_19CFD9A54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_19CFDF638();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_QWORD *sub_19CFD9A8C(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

void sub_19CFD9AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_19CFDEEA0();
  MEMORY[0x1E0C80A78](v3, v4);
  __asm { BR              X10 }
}

_QWORD *sub_19CFD9B54()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2910);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_19CD3BE5C(v2, v0);
    v7 = sub_19CFDEE28();
    sub_19CD3BE18(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x19CFD9C28);
    }
  }
  return v4;
}

uint64_t sub_19CFD9C40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_19CFDF638();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_19CFD9C74()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_19CFD9C98(uint64_t a1)
{
  return sub_19CFD8DE4(a1);
}

uint64_t sub_19CFD9CB8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_19CFD9CE4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t dispatch thunk of LocalizedStringsDataSource.fetchLanguages()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19CE66350;
  return v7(a1, a2);
}

uint64_t dispatch thunk of LocalizedStringsDataSource.fetchStrings(withLanguage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19CCBE344;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_19CFD9E08(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v3 = a1;
  v30 = MEMORY[0x1E0DEE9D8];
  sub_19CE4A284(0, v1, 0);
  v2 = v30;
  result = sub_19CDE2C18(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v28 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
    v13 = v12[1];
    v29 = *v12;
    v14 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v15 = v3;
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1)
      result = sub_19CE4A284(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v27;
    v19 = *(_QWORD *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(v24 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v10)
      return v2;
  }
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
  return result;
}

uint64_t sub_19CFDA038(double a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, char *a7, uint64_t a8, int a9)
{
  return sub_19CFDC360(a4, a5, a6, a7, a8, a9, a1);
}

uint64_t sub_19CFDA054(uint64_t a1, double a2)
{
  _QWORD *v2;
  _QWORD *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v28;
  id v29;
  _OWORD v30[2];
  __int128 v31;
  uint64_t v32;

  v3 = v2;
  v5 = objc_msgSend((id)objc_opt_self(), sel_serverTimeFromTimeInterval_, a2);
  v29 = objc_msgSend(v5, sel_unsignedLongLongValue);

  v6 = v3[9];
  swift_beginAccess();
  v7 = v3[4];
  v8 = v3[5];
  v32 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v31 = v7;
  *((_QWORD *)&v31 + 1) = v8;
  sub_19CD433C0(&v31, v30);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_19CD13D40(v30, 25705, 0xE200000000000000, isUniquelyReferenced_nonNull_native);
  v10 = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v11 = swift_bridgeObjectRetain();
  v12 = sub_19CFDAFBC(v11, a1);
  swift_bridgeObjectRelease();
  v13 = v12[2];
  if (v13)
  {
    v28 = v6;
    swift_bridgeObjectRetain();
    v14 = 0;
    v15 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      v16 = v12[v14 + 4];
      v17 = *(_QWORD *)(v16 + 16);
      swift_bridgeObjectRetain();
      if (v17
        && (v18 = sub_19CD3FD1C(100, 0xE100000000000000), (v19 & 1) != 0)
        && (sub_19CD436B0(*(_QWORD *)(v16 + 56) + 32 * v18, (uint64_t)&v31), (swift_dynamicCast() & 1) != 0)
        && *(_QWORD *)&v30[0] >= (unint64_t)v29
        && *(_QWORD *)(v16 + 16)
        && (v20 = sub_19CD3FD1C(115, 0xE100000000000000), (v21 & 1) != 0))
      {
        sub_19CD436B0(*(_QWORD *)(v16 + 56) + 32 * v20, (uint64_t)&v31);
        v22 = swift_dynamicCast();
        if ((v22 & 1) == 0)
          *(_QWORD *)&v30[0] = 0;
        BYTE8(v30[0]) = v22 ^ 1;
      }
      else
      {
        *(_QWORD *)&v30[0] = 0;
        BYTE8(v30[0]) = 1;
      }
      swift_bridgeObjectRelease();
      if ((BYTE8(v30[0]) & 1) == 0)
      {
        v23 = *(_QWORD *)&v30[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_19CED53C4(0, v15[2] + 1, 1, v15);
        v25 = v15[2];
        v24 = v15[3];
        if (v25 >= v24 >> 1)
          v15 = sub_19CED53C4((_QWORD *)(v24 > 1), v25 + 1, 1, v15);
        v15[2] = v25 + 1;
        v15[v25 + 4] = v23;
      }
      ++v14;
    }
    while (v13 != v14);
    swift_bridgeObjectRelease();
    v10 = v28;
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRelease();
  if (v15[2])
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0120);
    *(_QWORD *)&v31 = v15;
    sub_19CD433C0(&v31, v30);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_19CD13D40(v30, 0x6973736572706D69, 0xEF73656D69546E6FLL, v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

uint64_t sub_19CFDA3C8(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  uint64_t v34;

  v3 = v2;
  v6 = *(_QWORD *)(v2 + 72);
  swift_beginAccess();
  v7 = *(_QWORD *)(v3 + 32);
  v8 = *(_QWORD *)(v3 + 40);
  v34 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v33 = v7;
  *((_QWORD *)&v33 + 1) = v8;
  sub_19CD433C0(&v33, v32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_19CD13D40(v32, 25705, 0xE200000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_19CFDAFBC(v10, a1);
  swift_bridgeObjectRelease();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE43AFC8);
  *(_QWORD *)&v33 = v11;
  sub_19CD433C0(&v33, v32);
  swift_bridgeObjectRetain();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_19CD13D40(v32, 0x6E49646577656976, 0xEA00000000006F66, v12);
  v13 = v6;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend((id)objc_opt_self(), sel_serverTimeFromTimeInterval_, a2);
  v15 = objc_msgSend(v14, sel_unsignedLongLongValue);

  v16 = v11[2];
  if (v16)
  {
    v31 = v13;
    swift_bridgeObjectRetain();
    v17 = 0;
    v18 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      v19 = v11[v17 + 4];
      v20 = *(_QWORD *)(v19 + 16);
      swift_bridgeObjectRetain();
      if (v20
        && (v21 = sub_19CD3FD1C(100, 0xE100000000000000), (v22 & 1) != 0)
        && (sub_19CD436B0(*(_QWORD *)(v19 + 56) + 32 * v21, (uint64_t)&v33), (swift_dynamicCast() & 1) != 0)
        && (unint64_t)v15 < *(_QWORD *)&v32[0]
        && *(_QWORD *)(v19 + 16)
        && (v23 = sub_19CD3FD1C(115, 0xE100000000000000), (v24 & 1) != 0))
      {
        sub_19CD436B0(*(_QWORD *)(v19 + 56) + 32 * v23, (uint64_t)&v33);
        v25 = swift_dynamicCast();
        if ((v25 & 1) == 0)
          *(_QWORD *)&v32[0] = 0;
        BYTE8(v32[0]) = v25 ^ 1;
      }
      else
      {
        *(_QWORD *)&v32[0] = 0;
        BYTE8(v32[0]) = 1;
      }
      swift_bridgeObjectRelease();
      if ((BYTE8(v32[0]) & 1) == 0)
      {
        v26 = *(_QWORD *)&v32[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v18 = sub_19CED53C4(0, v18[2] + 1, 1, v18);
        v28 = v18[2];
        v27 = v18[3];
        if (v28 >= v27 >> 1)
          v18 = sub_19CED53C4((_QWORD *)(v27 > 1), v28 + 1, 1, v18);
        v18[2] = v28 + 1;
        v18[v28 + 4] = v26;
      }
      ++v17;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease();
    v13 = v31;
  }
  else
  {
    v18 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRelease();
  if (v18[2])
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB0120);
    *(_QWORD *)&v33 = v18;
    sub_19CD433C0(&v33, v32);
    v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_19CD13D40(v32, 0x6973736572706D69, 0xEF73656D69546E6FLL, v29);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t static ImpressionsTracking.serializeImpressions(on:from:within:in:on:)(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4, uint64_t a5, double a6)
{
  unsigned __int8 v7;

  v7 = *a4;
  return _s9JetEngine19ImpressionsTrackingO09serializeC02on4from6within2inAE9excludingSayypGSS_SayAC17AppearanceJournalCGSdAA0C13TrackerFormatO10Foundation4DateVSayAA17ImpressionMetricsV2IDVGtFZ_0(a1, a2, a3, &v7, a5, MEMORY[0x1E0DEE9D8], a6);
}

uint64_t sub_19CFDA7C0(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t i;
  BOOL v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE437180);
  result = sub_19CFE03A0();
  v6 = (_QWORD *)result;
  v7 = 0;
  v29 = a3;
  v10 = *(_QWORD *)(a3 + 64);
  v9 = a3 + 64;
  v8 = v10;
  v11 = 1 << *(_BYTE *)(v9 - 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v8;
  v25 = v9;
  v26 = (unint64_t)(v11 + 63) >> 6;
  v27 = result + 64;
  if ((v12 & v8) == 0)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v14 | (v7 << 6); ; i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v29 + 48) + 16 * i);
    v20 = *v19;
    v21 = v19[1];
    v31 = *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a1(&v30, &v31);
    result = swift_bridgeObjectRelease();
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (uint64_t)v6;
    }
    *(_QWORD *)(v27 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v22 = (_QWORD *)(v6[6] + 16 * i);
    *v22 = v20;
    v22[1] = v21;
    *(_QWORD *)(v6[7] + 8 * i) = v30;
    v23 = v6[2];
    v16 = __OFADD__(v23, 1);
    v24 = v23 + 1;
    if (v16)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v6[2] = v24;
    if (v13)
      goto LABEL_4;
LABEL_5:
    v16 = __OFADD__(v7++, 1);
    if (v16)
      goto LABEL_27;
    if (v7 >= v26)
      return (uint64_t)v6;
    v17 = *(_QWORD *)(v25 + 8 * v7);
    if (!v17)
      break;
LABEL_15:
    v13 = (v17 - 1) & v17;
  }
  v18 = v7 + 1;
  if (v7 + 1 >= v26)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v25 + 8 * v18);
  if (v17)
    goto LABEL_14;
  v18 = v7 + 2;
  if (v7 + 2 >= v26)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v25 + 8 * v18);
  if (v17)
    goto LABEL_14;
  v18 = v7 + 3;
  if (v7 + 3 >= v26)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v25 + 8 * v18);
  if (v17)
  {
LABEL_14:
    v7 = v18;
    goto LABEL_15;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v26)
      return (uint64_t)v6;
    v17 = *(_QWORD *)(v25 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_19CFDA9FC(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _OWORD v49[3];
  uint64_t v50;

  swift_bridgeObjectRetain();
  v4 = sub_19CE08800(a2);
  swift_bridgeObjectRelease();
  v5 = MEMORY[0x1E0DEE9D8];
  v6 = (_QWORD *)sub_19CE101D0(MEMORY[0x1E0DEE9D8]);
  v7 = sub_19CE10328(v5);
  if (a1 >> 62)
    goto LABEL_44;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; v8 = sub_19CFE0394())
  {
    if (v8 < 1)
    {
      __break(1u);
LABEL_48:
      result = sub_19CFE082C();
      __break(1u);
      return result;
    }
    v46 = v6;
    v9 = 0;
    v6 = (_QWORD *)(a1 & 0xC000000000000001);
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v11 = 1;
    v42 = v4;
    v43 = (_QWORD *)a1;
    v44 = a1 & 0xC000000000000001;
    v45 = v8;
    while (1)
    {
      if (v6)
      {
        v13 = MEMORY[0x1A1ADA390](v9, a1);
      }
      else
      {
        v13 = *(_QWORD *)(a1 + 8 * v9 + 32);
        swift_retain();
      }
      swift_beginAccess();
      v14 = *(_OWORD *)(v13 + 32);
      v49[0] = *(_OWORD *)(v13 + 16);
      v49[1] = v14;
      v49[2] = *(_OWORD *)(v13 + 48);
      v50 = *(_QWORD *)(v13 + 64);
      sub_19CD2AF14((uint64_t)v49);
      v15 = sub_19CDC158C((uint64_t *)v49, v4);
      sub_19CD2AF5C((uint64_t)v49);
      if ((v15 & 1) != 0)
        break;
      swift_retain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = sub_19CED54D8(0, v10[2] + 1, 1, v10);
      v17 = v10[2];
      v16 = v10[3];
      if (v17 >= v16 >> 1)
        v10 = sub_19CED54D8((_QWORD *)(v16 > 1), v17 + 1, 1, v10);
      v10[2] = v17 + 1;
      v18 = &v10[2 * v17];
      v18[4] = v13;
      v18[5] = v11;
      v19 = *(_QWORD *)(v13 + 112);
      if (v19)
      {
        v20 = *(_QWORD *)(v13 + 104);
        swift_retain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v48 = v46;
        sub_19CE16D28(v13, v11, v20, v19, isUniquelyReferenced_nonNull_native);
        v46 = v48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      if (*(_QWORD *)(v7 + 16))
      {
        v23 = *(_QWORD *)(v13 + 32);
        v22 = *(_QWORD *)(v13 + 40);
        swift_bridgeObjectRetain();
        v24 = sub_19CD3FD1C(v23, v22);
        v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        if ((v25 & 1) != 0)
        {
          v6 = *(_QWORD **)(*(_QWORD *)(v7 + 56) + 8 * v24);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      }
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_19CED54D8(0, v6[2] + 1, 1, v6);
      v27 = v6[2];
      v26 = v6[3];
      v47 = v10;
      if (v27 >= v26 >> 1)
        v6 = sub_19CED54D8((_QWORD *)(v26 > 1), v27 + 1, 1, v6);
      v6[2] = v27 + 1;
      v28 = &v6[2 * v27];
      v28[4] = v13;
      v28[5] = v11;
      v29 = *(_QWORD *)(v13 + 32);
      v4 = *(_QWORD *)(v13 + 40);
      swift_bridgeObjectRetain();
      a1 = v7;
      v7 = swift_isUniquelyReferenced_nonNull_native();
      v48 = (_QWORD *)a1;
      v31 = sub_19CD3FD1C(v29, v4);
      v32 = *(_QWORD *)(a1 + 16);
      v33 = (v30 & 1) == 0;
      v34 = v32 + v33;
      if (__OFADD__(v32, v33))
        goto LABEL_41;
      v35 = v30;
      if (*(_QWORD *)(a1 + 24) >= v34)
      {
        if ((v7 & 1) != 0)
        {
          v7 = (unint64_t)v48;
          if ((v30 & 1) == 0)
            goto LABEL_35;
        }
        else
        {
          a1 = (unint64_t)&v48;
          sub_19CE1868C();
          v7 = (unint64_t)v48;
          if ((v35 & 1) == 0)
            goto LABEL_35;
        }
      }
      else
      {
        sub_19CE12DFC(v34, v7);
        a1 = (unint64_t)v48;
        v36 = sub_19CD3FD1C(v29, v4);
        if ((v35 & 1) != (v37 & 1))
          goto LABEL_48;
        v31 = v36;
        v7 = (unint64_t)v48;
        if ((v35 & 1) == 0)
        {
LABEL_35:
          *(_QWORD *)(v7 + 8 * (v31 >> 6) + 64) |= 1 << v31;
          v38 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v31);
          *v38 = v29;
          v38[1] = v4;
          *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v31) = v6;
          v39 = *(_QWORD *)(v7 + 16);
          v12 = __OFADD__(v39, 1);
          v40 = v39 + 1;
          if (v12)
            goto LABEL_43;
          *(_QWORD *)(v7 + 16) = v40;
          swift_bridgeObjectRetain();
          goto LABEL_37;
        }
      }
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v31) = v6;
      swift_bridgeObjectRelease();
LABEL_37:
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = __OFADD__(v11++, 1);
      v6 = (_QWORD *)v44;
      v8 = v45;
      v10 = v47;
      if (v12)
        goto LABEL_42;
      v4 = v42;
      a1 = (unint64_t)v43;
LABEL_6:
      if (v8 == ++v9)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (uint64_t)v10;
      }
    }
    swift_release();
    v12 = __OFADD__(v11++, 1);
    if (!v12)
      goto LABEL_6;
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

unint64_t sub_19CFDAEBC(double a1, double a2)
{
  void *v4;
  id v5;
  _BYTE *v6;
  id v7;
  _BYTE *v8;
  int64_t v9;
  uint64_t inited;
  uint64_t v11;

  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_serverTimeFromTimeInterval_, a1);
  v6 = objc_msgSend(v5, sel_unsignedLongLongValue);

  v7 = objc_msgSend(v4, sel_serverTimeFromTimeInterval_, a2);
  v8 = objc_msgSend(v7, sel_unsignedLongLongValue);

  if (v8 >= v6)
    v9 = v8 - v6;
  else
    v9 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B90);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19D052350;
  *(_QWORD *)(inited + 32) = 115;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  v11 = MEMORY[0x1E0DEE190];
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = 100;
  *(_QWORD *)(inited + 120) = v11;
  *(_QWORD *)(inited + 88) = 0xE100000000000000;
  *(_QWORD *)(inited + 96) = v9;
  return sub_19CD30650(inited);
}

_QWORD *sub_19CFDAFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  _QWORD *v13;
  double v14;
  char v15;
  char v16;
  double v17;
  void *v18;
  id v19;
  _BYTE *v20;
  id v21;
  _BYTE *v22;
  int64_t v23;
  uint64_t inited;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;

  v4 = sub_19CFDEF84();
  MEMORY[0x1E0C80A78](v4, v5);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v38 = v9;
  v39 = a2;
  v40 = v7;
  v41 = v6;
  swift_bridgeObjectRetain();
  v11 = 0.0;
  v12 = a1 + 56;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v14 = 0.0;
  v15 = 1;
  v42 = xmmword_19D052350;
  v16 = 1;
  do
  {
    v17 = *(double *)(v12 - 16);
    if ((*(_BYTE *)(v12 - 24) & 1) != 0)
    {
      if ((v16 & 1) == 0)
        v11 = *(double *)(v12 - 16);
      v15 &= v16;
    }
    else
    {
      if ((v16 & 1) != 0)
      {
        v16 = 0;
        v14 = *(double *)(v12 - 16);
        goto LABEL_6;
      }
      if ((v15 & 1) != 0)
        goto LABEL_13;
      if (v17 - v11 < 0.0166666667)
      {
        v11 = 0.0;
LABEL_13:
        v16 = 0;
        v15 = 1;
        goto LABEL_6;
      }
      if (v11 - v14 <= 0.0166666667)
      {
        v11 = 0.0;
        v16 = 0;
        v15 = 1;
        v14 = *(double *)(v12 - 16);
      }
      else
      {
        v18 = (void *)objc_opt_self();
        swift_bridgeObjectRetain();
        v19 = objc_msgSend(v18, sel_serverTimeFromTimeInterval_, v14);
        v20 = objc_msgSend(v19, sel_unsignedLongLongValue);

        v21 = objc_msgSend(v18, sel_serverTimeFromTimeInterval_, v11);
        v22 = objc_msgSend(v21, sel_unsignedLongLongValue);

        if (v22 >= v20)
          v23 = v22 - v20;
        else
          v23 = 0;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B90);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v42;
        *(_QWORD *)(inited + 32) = 115;
        *(_QWORD *)(inited + 40) = 0xE100000000000000;
        *(_QWORD *)(inited + 48) = v20;
        v25 = MEMORY[0x1E0DEE190];
        *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEE190];
        *(_QWORD *)(inited + 80) = 100;
        *(_QWORD *)(inited + 120) = v25;
        *(_QWORD *)(inited + 88) = 0xE100000000000000;
        *(_QWORD *)(inited + 96) = v23;
        v26 = sub_19CD30650(inited);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_19CED518C(0, v13[2] + 1, 1, v13);
        v28 = v13[2];
        v27 = v13[3];
        if (v28 >= v27 >> 1)
          v13 = sub_19CED518C((_QWORD *)(v27 > 1), v28 + 1, 1, v13);
        v13[2] = v28 + 1;
        v13[v28 + 4] = v26;
        swift_bridgeObjectRelease();
        v11 = 0.0;
        v16 = 0;
        v15 = 1;
        v14 = v17;
      }
    }
LABEL_6:
    v12 += 32;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    v29 = v40;
    v30 = v38;
    v31 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v38, v39, v41);
    if ((v15 & 1) != 0)
    {
      sub_19CFDEF48();
      v33 = v32;
    }
    else
    {
      v33 = v11;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    v34 = sub_19CFDAEBC(v14, v33);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_19CED518C(0, v13[2] + 1, 1, v13);
    v36 = v13[2];
    v35 = v13[3];
    if (v36 >= v35 >> 1)
      v13 = sub_19CED518C((_QWORD *)(v35 > 1), v36 + 1, 1, v13);
    v13[2] = v36 + 1;
    v13[v36 + 4] = v34;
  }
  return v13;
}

uint64_t sub_19CFDB37C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t *i;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  char v30;
  _QWORD *v31;

  v1 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v31 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (uint64_t)v1;
  for (i = (uint64_t *)(a1 + 56); ; i += 4)
  {
    v5 = *((_BYTE *)i - 24);
    v6 = *(i - 2);
    v8 = *(i - 1);
    v7 = *i;
    swift_bridgeObjectRetain_n();
    v10 = sub_19CD3FD1C(v8, v7);
    v11 = v1[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
      break;
    v14 = v9;
    if (v1[3] < v13)
    {
      sub_19CE12DF0(v13, 1);
      v1 = v31;
      v15 = sub_19CD3FD1C(v8, v7);
      if ((v14 & 1) != (v16 & 1))
        goto LABEL_19;
      v10 = v15;
    }
    if ((v14 & 1) != 0)
    {
      v30 = v5;
      swift_bridgeObjectRelease();
      v17 = v1[7];
      v18 = *(_QWORD **)(v17 + 8 * v10);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v17 + 8 * v10) = v18;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v18 = sub_19CD2B57C(0, v18[2] + 1, 1, v18);
        *(_QWORD *)(v17 + 8 * v10) = v18;
      }
      v21 = v18[2];
      v20 = v18[3];
      v22 = v21 + 1;
      if (v21 >= v20 >> 1)
      {
        v23 = sub_19CD2B57C((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
        v22 = v21 + 1;
        v18 = v23;
        *(_QWORD *)(v17 + 8 * v10) = v23;
      }
      v18[2] = v22;
      v4 = &v18[4 * v21];
      *((_BYTE *)v4 + 32) = v30;
      v4[5] = v6;
      v4[6] = v8;
      v4[7] = v7;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECEB04A8);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_19D0522A0;
      *(_BYTE *)(v24 + 32) = v5;
      *(_QWORD *)(v24 + 40) = v6;
      *(_QWORD *)(v24 + 48) = v8;
      *(_QWORD *)(v24 + 56) = v7;
      v1[(v10 >> 6) + 8] |= 1 << v10;
      v25 = (uint64_t *)(v1[6] + 16 * v10);
      *v25 = v8;
      v25[1] = v7;
      *(_QWORD *)(v1[7] + 8 * v10) = v24;
      v26 = v1[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_18;
      v1[2] = v28;
    }
    if (!--v2)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = sub_19CFE082C();
  __break(1u);
  return result;
}

uint64_t sub_19CFDB5B8(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = (_QWORD *)swift_bridgeObjectRetain();
    v8 = v6[4];
    v7 = v6[5];
    v44 = v6;
    v9 = v6[6];
    v10 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_19CD3FD1C(v8, v7);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v16 = v11;
    if (v10[3] < v15)
    {
      sub_19CE12DF0(v15, a2 & 1);
      v17 = sub_19CD3FD1C(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_27:
        result = sub_19CFE082C();
        __break(1u);
        return result;
      }
      v12 = v17;
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      v45 = *(_QWORD *)(v19[7] + 8 * v12);
      swift_bridgeObjectRetain();
      sub_19CDC7730(v9);
      swift_bridgeObjectRelease();
      v20 = v19[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v20 + 8 * v12) = v45;
      v21 = v3 - 1;
      if (v3 == 1)
        return swift_bridgeObjectRelease();
LABEL_16:
      for (i = v44 + 9; ; i += 3)
      {
        v30 = *(i - 2);
        v29 = *(i - 1);
        v31 = *i;
        v32 = (_QWORD *)*a3;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v33 = sub_19CD3FD1C(v30, v29);
        v35 = v32[2];
        v36 = (v34 & 1) == 0;
        v24 = __OFADD__(v35, v36);
        v37 = v35 + v36;
        if (v24)
          break;
        v38 = v34;
        if (v32[3] < v37)
        {
          sub_19CE12DF0(v37, 1);
          v33 = sub_19CD3FD1C(v30, v29);
          if ((v38 & 1) != (v39 & 1))
            goto LABEL_27;
        }
        v40 = (_QWORD *)*a3;
        if ((v38 & 1) != 0)
        {
          v27 = 8 * v33;
          v46 = *(_QWORD *)(v40[7] + 8 * v33);
          swift_bridgeObjectRetain();
          sub_19CDC7730(v31);
          swift_bridgeObjectRelease();
          v28 = v40[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v28 + v27) = v46;
        }
        else
        {
          v40[(v33 >> 6) + 8] |= 1 << v33;
          v41 = (uint64_t *)(v40[6] + 16 * v33);
          *v41 = v30;
          v41[1] = v29;
          *(_QWORD *)(v40[7] + 8 * v33) = v31;
          v42 = v40[2];
          v24 = __OFADD__(v42, 1);
          v43 = v42 + 1;
          if (v24)
            goto LABEL_26;
          v40[2] = v43;
        }
        if (!--v21)
          return swift_bridgeObjectRelease();
      }
      goto LABEL_25;
    }
    if ((a2 & 1) != 0)
    {
      v19 = (_QWORD *)*a3;
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_19CE18680();
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v19[6] + 16 * v12);
    *v22 = v8;
    v22[1] = v7;
    *(_QWORD *)(v19[7] + 8 * v12) = v9;
    v23 = v19[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v19[2] = v25;
    v21 = v3 - 1;
    if (v3 == 1)
      return swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_19CFDB890(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[2];
  __int128 v24;
  uint64_t v25;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + 72);
  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 32);
  v6 = *(_QWORD *)(v2 + 40);
  v25 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v24 = v5;
  *((_QWORD *)&v24 + 1) = v6;
  sub_19CD433C0(&v24, v23);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = v4;
  sub_19CD13D40(v23, 25705, 0xE200000000000000, isUniquelyReferenced_nonNull_native);
  v8 = v4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_19CFDB37C(v9);
  swift_bridgeObjectRelease();
  v11 = sub_19CFD9E08(v10);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v11 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE437178);
    v12 = sub_19CFE03B8();
  }
  else
  {
    v12 = MEMORY[0x1E0DEE9E0];
  }
  *(_QWORD *)&v24 = v12;
  sub_19CFDB5B8(v11, 1, &v24);
  v13 = swift_bridgeObjectRelease();
  v14 = v24;
  MEMORY[0x1E0C80A78](v13, v15);
  v20[2] = v2;
  v20[3] = a1;
  v16 = sub_19CFDA7C0((void (*)(uint64_t *__return_ptr, uint64_t *))sub_19CFDE6B0, (uint64_t)v20, v14);
  swift_release();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE437140);
  *(_QWORD *)&v24 = v16;
  sub_19CD433C0(&v24, v23);
  v17 = swift_isUniquelyReferenced_nonNull_native();
  v21 = v8;
  sub_19CD13D40(v23, 0xD000000000000012, 0x800000019D07B2E0, v17);
  v18 = v21;
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_19CFDBA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;

  result = _s9JetEngine19ImpressionsTrackingO14isDebugEnabledSbvgZ_0();
  if ((result & 1) != 0)
  {
    v9 = *a4;
    if (*(_QWORD *)(*a4 + 16)
      && (v10 = sub_19CD3FD1C(0x6775626564, 0xE500000000000000), (v11 & 1) != 0)
      && (sub_19CD436B0(*(_QWORD *)(v9 + 56) + 32 * v10, (uint64_t)&v17),
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B70),
          swift_dynamicCast()))
    {
      v12 = v15;
    }
    else
    {
      v12 = sub_19CD30650(MEMORY[0x1E0DEE9D8]);
    }
    sub_19CD40794(a3, (uint64_t)&v15);
    if (v16)
    {
      sub_19CD433C0(&v15, &v17);
    }
    else
    {
      v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
      v18 = sub_19CD3E52C();
      *(_QWORD *)&v17 = v13;
      sub_19CD3F190((uint64_t)&v15);
    }
    sub_19CD433C0(&v17, &v15);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_19CD13D40(&v15, a1, a2, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB2B70);
    *(_QWORD *)&v17 = v12;
    return sub_19CD13C70((uint64_t)&v17, 0x6775626564, 0xE500000000000000);
  }
  return result;
}

uint64_t sub_19CFDBC34(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *i;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v5 = 0;
    v6 = result + 40;
    v30 = -(uint64_t)v4;
    v7 = MEMORY[0x1E0DEE9D8];
    v26 = result + 40;
    v27 = *(_QWORD *)(result + 16);
    while (1)
    {
      v28 = v7;
      if (v5 <= v4)
        v8 = v4;
      else
        v8 = v5;
      v31 = -(uint64_t)v8;
      for (i = (uint64_t *)(v6 + 16 * v5++); ; i += 2)
      {
        if (v31 + v5 == 1)
        {
          __break(1u);
          return result;
        }
        v10 = (_QWORD *)*(i - 1);
        v29 = *i;
        result = swift_beginAccess();
        v11 = v10[2];
        v12 = v10[3];
        v14 = v10[4];
        v13 = v10[5];
        v15 = v10[7];
        v16 = v10[8];
        if (v14 != a2 || v13 != a3)
        {
          result = sub_19CFE06A0();
          if ((result & 1) == 0)
            goto LABEL_7;
        }
        if (v14 != a4[2] || v13 != a4[3])
        {
          result = sub_19CFE06A0();
          if ((result & 1) == 0)
            goto LABEL_35;
        }
        v19 = a4[1];
        if (v12)
        {
          if (!v19)
            goto LABEL_36;
          if (v11 != *a4 || v12 != v19)
          {
            result = sub_19CFE06A0();
            if ((result & 1) == 0)
              goto LABEL_36;
          }
        }
        else if (v19)
        {
          goto LABEL_41;
        }
        v21 = a4[6];
        if (v16)
          break;
        if (v21)
          goto LABEL_35;
LABEL_7:
        ++v5;
        if (v30 + v5 == 1)
          return v28;
      }
      if (v21)
      {
        if (v15 == a4[5] && v16 == v21)
          goto LABEL_7;
        result = sub_19CFE06A0();
        if ((result & 1) != 0)
          goto LABEL_7;
      }
LABEL_35:
      if (!v12)
        goto LABEL_41;
LABEL_36:
      if (v14 == v11 && v12 == v13)
        goto LABEL_7;
      result = sub_19CFE06A0();
      if ((result & 1) != 0)
        goto LABEL_7;
LABEL_41:
      swift_retain();
      v7 = v28;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = sub_19CE4A268(0, *(_QWORD *)(v28 + 16) + 1, 1);
        v7 = v28;
      }
      v24 = *(_QWORD *)(v7 + 16);
      v23 = *(_QWORD *)(v7 + 24);
      if (v24 >= v23 >> 1)
      {
        result = sub_19CE4A268(v23 > 1, v24 + 1, 1);
        v7 = v28;
      }
      *(_QWORD *)(v7 + 16) = v24 + 1;
      v25 = v7 + 16 * v24;
      *(_QWORD *)(v25 + 32) = v10;
      *(_QWORD *)(v25 + 40) = v29;
      v6 = v26;
      v4 = v27;
      if (!(v30 + v5))
        return v7;
    }
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_19CFDBEC0(_BYTE *a1, uint64_t a2, _QWORD *a3, double a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (*a1)
  {
    if (*a1 == 1)
    {
      v5 = sub_19CFDA3C8(a2, a4);
      if (!v5)
        return v5;
    }
    else
    {
      v5 = sub_19CFDB890(a2);
      if (!v5)
        return v5;
    }
  }
  else
  {
    v5 = sub_19CFDA054(a2, a4);
    if (!v5)
      return v5;
  }
  v12 = v5;
  if ((_s9JetEngine19ImpressionsTrackingO14isDebugEnabledSbvgZ_0() & 1) != 0)
  {
    swift_beginAccess();
    v6 = a3[3];
    if (v6)
    {
      v7 = a3[2];
      *((_QWORD *)&v11 + 1) = MEMORY[0x1E0DEA968];
      *(_QWORD *)&v10 = v7;
      *((_QWORD *)&v10 + 1) = v6;
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
    }
    swift_bridgeObjectRetain();
    sub_19CFDBA9C(0x6449746E65726170, 0xE800000000000000, (uint64_t)&v10, &v12);
    sub_19CD3F190((uint64_t)&v10);
    v8 = a3[6];
    if (v8 == -1)
    {
      v10 = 0u;
      v11 = 0u;
    }
    else
    {
      *((_QWORD *)&v11 + 1) = MEMORY[0x1E0DEB418];
      *(_QWORD *)&v10 = v8;
    }
    sub_19CFDBA9C(0xD000000000000015, 0x800000019D07B2C0, (uint64_t)&v10, &v12);
    sub_19CD3F190((uint64_t)&v10);
    return v12;
  }
  return v5;
}

uint64_t sub_19CFDBFFC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = *(_QWORD *)(a1 + 16);
  if (v16)
  {
    v2 = 0;
    v20 = a2[4];
    v3 = a2[6];
    v14 = a2[8];
    v15 = a2[3];
    v4 = (uint64_t *)(a1 + 48);
    v17 = a2[9];
    v18 = a2[5];
    v19 = v3;
    while (1)
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = v4[1];
      v7 = v4[2];
      v10 = v4[4];
      v9 = v4[5];
      if (!v3)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        sub_19CD2A71C(v6, v5, v8, v7);
        sub_19CD2A71C(0, 0, 0, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v8 != v18 || v3 != v7)
      {
        v3 = v19;
        if ((sub_19CFE06A0() & 1) == 0)
          break;
      }
      if (v5)
      {
        if (!v20)
          break;
        if (v6 != v15 || v5 != v20)
        {
          v3 = v19;
          if ((sub_19CFE06A0() & 1) == 0)
            break;
        }
      }
      else if (v20)
      {
        break;
      }
      v12 = (v9 | v17) == 0;
      if (v9 && v17)
      {
        if (v10 == v14 && v9 == v17)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          sub_19CD2A71C(v15, v20, v18, v19);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          return v2;
        }
        v12 = sub_19CFE06A0();
      }
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_19CD2A71C(v15, v20, v18, v19);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if ((v12 & 1) != 0)
        return v2;
LABEL_5:
      v4 += 8;
      ++v2;
      v3 = v19;
      if (v16 == v2)
        return 0;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_19CD2A71C(v15, v20, v18, v3);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_5;
  }
  return 0;
}

uint64_t sub_19CFDC360(unint64_t a1, unint64_t a2, uint64_t a3, char *a4, uint64_t a5, int a6, double a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  char v35;
  BOOL v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  uint64_t v45;
  char v47;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD v69[2];
  char v70;
  __int128 v71;
  uint64_t v72;

  v47 = *a4;
  v11 = sub_19CFDA9FC(a1, MEMORY[0x1E0DEE9D8]);
  v49 = v12;
  v50 = v13;
  if (a2 >> 62)
    goto LABEL_53;
  v14 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v14; v14 = sub_19CFE0394())
  {
    v15 = 0;
    v16 = 0;
    v58 = a2 & 0xC000000000000001;
    v55 = a2 & 0xFFFFFFFFFFFFFF8;
    v17 = MEMORY[0x1E0DEE9D8];
    v52 = (uint64_t *)(v11 + 40);
    v53 = a2;
    v54 = a3;
    v56 = v11;
    v57 = v14;
    v51 = a6;
    while (1)
    {
      if (v58)
      {
        v18 = MEMORY[0x1A1ADA390](v15, a2);
        v19 = __OFADD__(v15, 1);
        v20 = v15 + 1;
        if (v19)
          break;
        goto LABEL_11;
      }
      if (v15 >= *(_QWORD *)(v55 + 16))
        goto LABEL_52;
      v18 = swift_retain();
      v19 = __OFADD__(v15, 1);
      v20 = v15 + 1;
      if (v19)
        break;
LABEL_11:
      v59 = v20;
      v60 = v17;
      v21 = *(_QWORD *)(v18 + 104);
      v66 = (_QWORD *)v18;
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v21 + 20));
      sub_19CD3EA18((_BYTE *)(v21 + 16), &v71);
      v61 = v16;
      os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 20));
      swift_release();
      if ((_BYTE)v71)
        goto LABEL_40;
      v22 = *(_QWORD *)(v11 + 16);
      if (!v22)
        goto LABEL_40;
      swift_bridgeObjectRetain();
      v23 = v52;
      while (1)
      {
        v25 = (_QWORD *)*(v23 - 1);
        v24 = *v23;
        swift_beginAccess();
        v26 = v25[2];
        v27 = v25[4];
        v28 = v25[5];
        v29 = v66[6];
        if (!v29)
        {
          v38 = v25[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          sub_19CD2A71C(v26, v38, v27, v28);
          sub_19CD2A71C(0, 0, 0, 0);
          goto LABEL_16;
        }
        v62 = v24;
        v63 = v25[7];
        v65 = v25[8];
        v30 = v66[9];
        v64 = v66[8];
        v31 = v66[5];
        v67 = v66[3];
        v68 = v66[4];
        v32 = v25[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v33 = v32;
        if (v27 != v31 || v29 != v28)
        {
          v35 = sub_19CFE06A0();
          v33 = v32;
          if ((v35 & 1) == 0)
            goto LABEL_15;
        }
        if (v33)
          break;
        if (!v68)
          goto LABEL_30;
LABEL_15:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        sub_19CD2A71C(v67, v68, v31, v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_16:
        v23 += 2;
        swift_release();
        if (!--v22)
        {
          v11 = v56;
          swift_bridgeObjectRelease();
          a2 = v53;
          a3 = v54;
          a6 = v51;
          goto LABEL_39;
        }
      }
      if (!v68)
        goto LABEL_15;
      v36 = v26 == v67 && v33 == v68;
      if (!v36 && (sub_19CFE06A0() & 1) == 0)
        goto LABEL_15;
LABEL_30:
      v37 = v30 == 0;
      if (!v65)
        goto LABEL_36;
      if (!v30)
        goto LABEL_15;
      if (v63 != v64 || v65 != v30)
      {
        v37 = sub_19CFE06A0();
LABEL_36:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        sub_19CD2A71C(v67, v68, v31, v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v37 & 1) != 0)
          goto LABEL_43;
        goto LABEL_16;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_19CD2A71C(v67, v68, v31, v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_43:
      a6 = v51;
      v11 = v56;
      swift_bridgeObjectRelease();
      LOBYTE(v71) = v47;
      a2 = v53;
      a3 = v54;
      if (sub_19CFDBEC0(&v71, a5, v25, a7))
      {
        v72 = MEMORY[0x1E0DEB418];
        *(_QWORD *)&v71 = v62;
        sub_19CD433C0(&v71, v69);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_19CD13D40(v69, 0x6973736572706D69, 0xEC00000064496E6FLL, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        if (v25[3])
        {
          v41 = sub_19CFDD020((uint64_t)v25, v62, v50);
          if ((v42 & 1) == 0)
            goto LABEL_46;
LABEL_49:
          swift_release();
        }
        else
        {
          v41 = sub_19CFDDA58(v25, v62, v49);
          if ((v44 & 1) != 0)
            goto LABEL_49;
LABEL_46:
          v72 = MEMORY[0x1E0DEB418];
          *(_QWORD *)&v71 = v41;
          sub_19CD433C0(&v71, v69);
          v43 = swift_isUniquelyReferenced_nonNull_native();
          sub_19CD13D40(v69, 0xD000000000000012, 0x800000019D07B220, v43);
          swift_release();
          swift_bridgeObjectRelease();
        }
LABEL_41:
        v39 = v66[13];
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v39 + 20));
        sub_19CD3EA18((_BYTE *)(v39 + 16), &v70);
        os_unfair_lock_unlock((os_unfair_lock_t)(v39 + 20));
        swift_release();
        __asm { BR              X11 }
      }
      swift_release();
LABEL_39:
      v14 = v57;
LABEL_40:
      v17 = v60;
      if ((a6 & 1) == 0)
        goto LABEL_41;
      swift_release();
      v16 = v61;
      v15 = v59;
      if (v59 == v14)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = MEMORY[0x1E0DEE9D8];
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45 = sub_19CE03018(v17);
  swift_bridgeObjectRelease();
  return v45;
}

uint64_t sub_19CFDD020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  Swift::String v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  __int128 v47;
  __int128 v48;
  Swift::String v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  __int128 v54;
  __int128 v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  Swift::String v60;
  _QWORD *v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  __int128 v66;
  __int128 v67;
  Swift::String v68;
  uint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  __int128 v74;
  __int128 v75;
  Swift::String v76;
  _QWORD *v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  __int128 v81;
  __int128 v82;
  Swift::String v83;
  uint64_t v85;
  _QWORD *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[32];
  __int128 v94;
  __int128 v95;
  char v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  _QWORD v101[3];
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[4];
  __int128 v105;
  uint64_t v106;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 24);
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 64);
  v104[0] = v7;
  v104[1] = v6;
  v89 = a2;
  v90 = v8;
  v104[2] = v8;
  v104[3] = v9;
  v105 = *(_OWORD *)(a1 + 48);
  v106 = v10;
  v11 = *(_QWORD *)(a3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  if (!v11)
  {
    swift_bridgeObjectRetain();
LABEL_7:
    v14 = MEMORY[0x1E0DEE9D8];
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_19CD3FD1C(v7, v6);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = sub_19CFDBC34(v14, v7, v6, v104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16 < 2)
  {
    v18 = v15;
    if (v16)
      goto LABEL_48;
    goto LABEL_50;
  }
  v85 = v7;
  v86 = v9;
  v87 = v6;
  swift_retain();
  v6 = 0;
  v17 = v15 + 40;
  v7 = -(uint64_t)v16;
  v18 = MEMORY[0x1E0DEE9D8];
  do
  {
    if (v6 <= v16)
      v19 = v16;
    else
      v19 = v6;
    v20 = -(uint64_t)v19;
    v9 = (_QWORD *)(v17 + 16 * v6++);
    while (1)
    {
      if (v20 + v6 == 1)
      {
        __break(1u);
        goto LABEL_67;
      }
      v22 = *(v9 - 1);
      v21 = *v9;
      v23 = *(_QWORD *)(a1 + 96);
      v24 = *(_QWORD *)(v22 + 96);
      if (v23)
        break;
      if (!v24)
        goto LABEL_24;
LABEL_15:
      ++v6;
      v9 += 2;
      if (v6 - v16 == 1)
        goto LABEL_32;
    }
    if (!v24)
      goto LABEL_15;
    v25 = *(_QWORD *)(a1 + 88) == *(_QWORD *)(v22 + 88) && v23 == v24;
    if (!v25 && (sub_19CFE06A0() & 1) == 0)
      goto LABEL_15;
LABEL_24:
    swift_retain();
    v101[0] = v18;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_19CE4A268(0, *(_QWORD *)(v18 + 16) + 1, 1);
      v18 = v101[0];
    }
    v26 = v18;
    v27 = *(_QWORD *)(v18 + 16);
    v28 = *(_QWORD *)(v26 + 24);
    if (v27 >= v28 >> 1)
    {
      sub_19CE4A268(v28 > 1, v27 + 1, 1);
      v26 = v101[0];
    }
    *(_QWORD *)(v26 + 16) = v27 + 1;
    v29 = v26 + 16 * v27;
    *(_QWORD *)(v29 + 32) = v22;
    *(_QWORD *)(v29 + 40) = v21;
    v18 = v26;
    v17 = v15 + 40;
  }
  while (v6 != v16);
LABEL_32:
  swift_bridgeObjectRelease();
  swift_release();
  v30 = *(_QWORD *)(v18 + 16);
  if (v30 < 2)
  {
    v9 = v86;
    v6 = v87;
    v7 = v85;
    if (v30)
      goto LABEL_48;
    goto LABEL_50;
  }
  v6 = v87;
  if (qword_1EE43D060 != -1)
    swift_once();
  sub_19CFE0A6C();
  v32 = v102;
  v31 = v103;
  __swift_project_boxed_opaque_existential_1(v101, v102);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB31C0);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_19D0522A0;
  v100 = sub_19CD40918(0, 70, 0, MEMORY[0x1E0DEE9D8]);
  v34._object = (void *)0x800000019D07B280;
  v34._countAndFlagsBits = 0xD000000000000031;
  LogMessage.StringInterpolation.appendLiteral(_:)(v34);
  v99 = MEMORY[0x1E0DEB418];
  v97 = v89;
  sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
  v91 = 0u;
  v92 = 0u;
  sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
  v96 = 0;
  v94 = v91;
  v95 = v92;
  v35 = v100;
  v9 = v86;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v35 = sub_19CD40918(0, v35[2] + 1, 1, v35);
  v37 = v35[2];
  v36 = v35[3];
  if (v37 >= v36 >> 1)
    v35 = sub_19CD40918((_QWORD *)(v36 > 1), v37 + 1, 1, v35);
  v35[2] = v37 + 1;
  v38 = &v35[5 * v37];
  v39 = v94;
  v40 = v95;
  *((_BYTE *)v38 + 64) = v96;
  *((_OWORD *)v38 + 2) = v39;
  *((_OWORD *)v38 + 3) = v40;
  v100 = v35;
  sub_19CD3F190((uint64_t)&v97);
  v41._countAndFlagsBits = 0x203A6469202CLL;
  v41._object = (void *)0xE600000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v41);
  v42 = MEMORY[0x1E0DEA968];
  v99 = MEMORY[0x1E0DEA968];
  v97 = v90;
  v98 = v86;
  sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
  v91 = 0u;
  v92 = 0u;
  swift_bridgeObjectRetain();
  sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
  v96 = 0;
  v94 = v91;
  v95 = v92;
  v43 = v100;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v43 = sub_19CD40918(0, v43[2] + 1, 1, v43);
  v45 = v43[2];
  v44 = v43[3];
  if (v45 >= v44 >> 1)
    v43 = sub_19CD40918((_QWORD *)(v44 > 1), v45 + 1, 1, v43);
  v43[2] = v45 + 1;
  v46 = &v43[5 * v45];
  v47 = v94;
  v48 = v95;
  *((_BYTE *)v46 + 64) = v96;
  *((_OWORD *)v46 + 2) = v47;
  *((_OWORD *)v46 + 3) = v48;
  v100 = v43;
  sub_19CD3F190((uint64_t)&v97);
  v49._countAndFlagsBits = 0x746E65726170202CLL;
  v49._object = (void *)0xEC000000203A6449;
  LogMessage.StringInterpolation.appendLiteral(_:)(v49);
  v99 = v42;
  v7 = v85;
  v97 = v85;
  v98 = (_QWORD *)v87;
  sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
  v91 = 0u;
  v92 = 0u;
  swift_bridgeObjectRetain();
  sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
  v96 = 0;
  v94 = v91;
  v95 = v92;
  v50 = v100;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v50 = sub_19CD40918(0, v50[2] + 1, 1, v50);
  v52 = v50[2];
  v51 = v50[3];
  if (v52 >= v51 >> 1)
    v50 = sub_19CD40918((_QWORD *)(v51 > 1), v52 + 1, 1, v50);
  v50[2] = v52 + 1;
  v53 = &v50[5 * v52];
  v54 = v94;
  v55 = v95;
  *((_BYTE *)v53 + 64) = v96;
  *((_OWORD *)v53 + 2) = v54;
  *((_OWORD *)v53 + 3) = v55;
  v100 = v50;
  sub_19CD3F190((uint64_t)&v97);
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v56);
  *(_QWORD *)(v33 + 32) = v100;
  Logger.error(_:)(v33, v32, v31);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v101);
  if (!*(_QWORD *)(v18 + 16))
  {
LABEL_50:
    swift_bridgeObjectRelease();
    if (qword_1EE43D060 != -1)
LABEL_67:
      swift_once();
    sub_19CFE0A6C();
    v58 = v102;
    v88 = v103;
    __swift_project_boxed_opaque_existential_1(v101, v102);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB31C0);
    v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_19D0522A0;
    v100 = sub_19CD40918(0, 74, 0, MEMORY[0x1E0DEE9D8]);
    v60._countAndFlagsBits = 0xD000000000000035;
    v60._object = (void *)0x800000019D07B240;
    LogMessage.StringInterpolation.appendLiteral(_:)(v60);
    v99 = MEMORY[0x1E0DEB418];
    v97 = v89;
    sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
    v91 = 0u;
    v92 = 0u;
    sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
    v96 = 0;
    v94 = v91;
    v95 = v92;
    v61 = v100;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v61 = sub_19CD40918(0, v61[2] + 1, 1, v61);
    v63 = v61[2];
    v62 = v61[3];
    v64 = v7;
    if (v63 >= v62 >> 1)
      v61 = sub_19CD40918((_QWORD *)(v62 > 1), v63 + 1, 1, v61);
    v61[2] = v63 + 1;
    v65 = &v61[5 * v63];
    v66 = v94;
    v67 = v95;
    *((_BYTE *)v65 + 64) = v96;
    *((_OWORD *)v65 + 2) = v66;
    *((_OWORD *)v65 + 3) = v67;
    v100 = v61;
    sub_19CD3F190((uint64_t)&v97);
    v68._countAndFlagsBits = 0x203A6469202CLL;
    v68._object = (void *)0xE600000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v68);
    v69 = MEMORY[0x1E0DEA968];
    v99 = MEMORY[0x1E0DEA968];
    v97 = v90;
    v98 = v9;
    sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
    v91 = 0u;
    v92 = 0u;
    swift_bridgeObjectRetain();
    sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
    v96 = 0;
    v94 = v91;
    v95 = v92;
    v70 = v100;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v70 = sub_19CD40918(0, v70[2] + 1, 1, v70);
    v72 = v70[2];
    v71 = v70[3];
    if (v72 >= v71 >> 1)
      v70 = sub_19CD40918((_QWORD *)(v71 > 1), v72 + 1, 1, v70);
    v70[2] = v72 + 1;
    v73 = &v70[5 * v72];
    v74 = v94;
    v75 = v95;
    *((_BYTE *)v73 + 64) = v96;
    *((_OWORD *)v73 + 2) = v74;
    *((_OWORD *)v73 + 3) = v75;
    v100 = v70;
    sub_19CD3F190((uint64_t)&v97);
    v76._countAndFlagsBits = 0x746E65726170202CLL;
    v76._object = (void *)0xEC000000203A6449;
    LogMessage.StringInterpolation.appendLiteral(_:)(v76);
    v99 = v69;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v97 = v64;
    v98 = (_QWORD *)v6;
    sub_19CD40794((uint64_t)&v97, (uint64_t)v93);
    v91 = 0u;
    v92 = 0u;
    sub_19CD40658((uint64_t)v93, (uint64_t)&v91);
    v96 = 0;
    v94 = v91;
    v95 = v92;
    v77 = v100;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v77 = sub_19CD40918(0, v77[2] + 1, 1, v77);
    v79 = v77[2];
    v78 = v77[3];
    if (v79 >= v78 >> 1)
      v77 = sub_19CD40918((_QWORD *)(v78 > 1), v79 + 1, 1, v77);
    v77[2] = v79 + 1;
    v80 = &v77[5 * v79];
    v81 = v94;
    v82 = v95;
    *((_BYTE *)v80 + 64) = v96;
    *((_OWORD *)v80 + 2) = v81;
    *((_OWORD *)v80 + 3) = v82;
    v100 = v77;
    sub_19CD3F190((uint64_t)&v97);
    v83._countAndFlagsBits = 0;
    v83._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v83);
    *(_QWORD *)(v59 + 32) = v100;
    Logger.error(_:)(v59, v58, v88);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v101);
    return 0;
  }
LABEL_48:
  v57 = *(_QWORD *)(v18 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v57;
}

uint64_t sub_19CFDDA58(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  Swift::String v31;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[32];
  __int128 v39;
  __int128 v40;
  char v41;
  _QWORD v42[3];
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;

  swift_beginAccess();
  if (a1[3])
    return 0;
  v6 = a1[16];
  if (!v6)
    return 0;
  if (!*(_QWORD *)(a3 + 16))
  {
LABEL_7:
    if (qword_1EE43D060 != -1)
      swift_once();
    sub_19CFE0A6C();
    v11 = v46;
    v12 = v47;
    __swift_project_boxed_opaque_existential_1(v45, v46);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB31C0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_19D0522A0;
    v44 = sub_19CD40918(0, 61, 0, MEMORY[0x1E0DEE9D8]);
    v14._object = (void *)0x800000019D07B240;
    v14._countAndFlagsBits = 0xD000000000000035;
    LogMessage.StringInterpolation.appendLiteral(_:)(v14);
    v43 = MEMORY[0x1E0DEB418];
    v42[0] = a2;
    sub_19CD40794((uint64_t)v42, (uint64_t)v38);
    v36 = 0u;
    v37 = 0u;
    sub_19CD40658((uint64_t)v38, (uint64_t)&v36);
    v41 = 0;
    v39 = v36;
    v40 = v37;
    v15 = v44;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v15 = sub_19CD40918(0, v15[2] + 1, 1, v15);
    v16 = v15[2];
    v17 = v15[3];
    v18 = v16 + 1;
    if (v16 >= v17 >> 1)
    {
      v33 = v15;
      v34 = v15[2];
      v35 = sub_19CD40918((_QWORD *)(v17 > 1), v16 + 1, 1, v33);
      v16 = v34;
      v15 = v35;
    }
    v15[2] = v18;
    v19 = &v15[5 * v16];
    v20 = v39;
    v21 = v40;
    *((_BYTE *)v19 + 64) = v41;
    *((_OWORD *)v19 + 2) = v20;
    *((_OWORD *)v19 + 3) = v21;
    v44 = v15;
    sub_19CD3F190((uint64_t)v42);
    v22._countAndFlagsBits = 0x203A6469202CLL;
    v22._object = (void *)0xE600000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    v23 = a1[4];
    v24 = a1[5];
    v43 = MEMORY[0x1E0DEA968];
    v42[0] = v23;
    v42[1] = v24;
    sub_19CD40794((uint64_t)v42, (uint64_t)v38);
    v36 = 0u;
    v37 = 0u;
    swift_bridgeObjectRetain();
    sub_19CD40658((uint64_t)v38, (uint64_t)&v36);
    v41 = 0;
    v39 = v36;
    v40 = v37;
    v25 = v44;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_19CD40918(0, v25[2] + 1, 1, v25);
    v27 = v25[2];
    v26 = v25[3];
    if (v27 >= v26 >> 1)
      v25 = sub_19CD40918((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
    v25[2] = v27 + 1;
    v28 = &v25[5 * v27];
    v29 = v39;
    v30 = v40;
    *((_BYTE *)v28 + 64) = v41;
    *((_OWORD *)v28 + 2) = v29;
    *((_OWORD *)v28 + 3) = v30;
    v44 = v25;
    sub_19CD3F190((uint64_t)v42);
    v31._countAndFlagsBits = 0;
    v31._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    *(_QWORD *)(v13 + 32) = v44;
    Logger.error(_:)(v13, v11, v12);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
    return 0;
  }
  v7 = a1[15];
  swift_bridgeObjectRetain();
  v8 = sub_19CD3FD1C(v7, v6);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v8 + 8);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _s9JetEngine19ImpressionsTrackingO09serializeC02on4from6within2inAE9excludingSayypGSS_SayAC17AppearanceJournalCGSdAA0C13TrackerFormatO10Foundation4DateVSayAA17ImpressionMetricsV2IDVGtFZ_0(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, double a7)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  os_unfair_lock_s *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  int v46;
  __int128 v47;
  _OWORD v49[2];
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  *((_QWORD *)&v47 + 1) = a2;
  *(_QWORD *)&v47 = a1;
  v8 = *a4;
  v11 = sub_19CFDA9FC(a3, a6);
  v12 = *(_QWORD *)(v11 + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_51;
  }
  v45 = v10;
  v44 = v9;
  swift_bridgeObjectRetain();
  v13 = (uint64_t *)(v11 + 40);
  v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v46 = v8;
  do
  {
    v16 = *(v13 - 1);
    v15 = *v13;
    if (v8)
    {
      if (v8 == 1)
      {
        swift_retain();
        v17 = sub_19CFDA3C8(a5, a7);
        if (!v17)
          goto LABEL_3;
      }
      else
      {
        swift_retain();
        v17 = sub_19CFDB890(a5);
        if (!v17)
        {
LABEL_3:
          swift_release();
          goto LABEL_4;
        }
      }
    }
    else
    {
      swift_retain();
      v17 = sub_19CFDA054(a5, a7);
      if (!v17)
        goto LABEL_3;
    }
    *(_QWORD *)&v49[0] = v17;
    if (qword_1ECEB1958 != -1)
      swift_once();
    v18 = (char *)off_1ECEB1948 + 16;
    v19 = (os_unfair_lock_s *)((char *)off_1ECEB1948 + 20);
    swift_retain();
    os_unfair_lock_lock(v19);
    sub_19CD3EA18(v18, &v50);
    os_unfair_lock_unlock(v19);
    v20 = v50;
    swift_release();
    if (v20 == 2)
    {
      if ((os_variant_has_internal_content() & 1) == 0)
        goto LABEL_30;
    }
    else if ((v20 & 1) == 0)
    {
      goto LABEL_30;
    }
    if (qword_1ECEB2920 != -1)
      swift_once();
    if (qword_1EE43BAB0 != -1)
      swift_once();
    v21 = qword_1EE43BB88;
    v22 = *(_QWORD *)algn_1EE43BB90;
    swift_bridgeObjectRetain();
    v23 = sub_19CD1A8A8(v21, v22);
    swift_bridgeObjectRelease();
    if ((v23 & 1) != 0)
    {
      swift_beginAccess();
      v24 = *(_QWORD *)(v16 + 24);
      if (v24)
      {
        v25 = *(_QWORD *)(v16 + 16);
        *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEA968];
        *(_QWORD *)&v50 = v25;
        *((_QWORD *)&v50 + 1) = v24;
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
      }
      swift_bridgeObjectRetain();
      sub_19CFDBA9C(0x6449746E65726170, 0xE800000000000000, (uint64_t)&v50, (uint64_t *)v49);
      sub_19CD3F190((uint64_t)&v50);
      v26 = *(_QWORD *)(v16 + 48);
      if (v26 == -1)
      {
        v50 = 0u;
        v51 = 0u;
      }
      else
      {
        *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEB418];
        *(_QWORD *)&v50 = v26;
      }
      sub_19CFDBA9C(0xD000000000000015, 0x800000019D07B2C0, (uint64_t)&v50, (uint64_t *)v49);
      sub_19CD3F190((uint64_t)&v50);
      v17 = *(_QWORD *)&v49[0];
    }
LABEL_30:
    *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEA968];
    v50 = v47;
    sub_19CD433C0(&v50, v49);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v52 = v17;
    sub_19CD13D40(v49, 0xD000000000000012, 0x800000019D07B300, isUniquelyReferenced_nonNull_native);
    v28 = v52;
    swift_bridgeObjectRelease();
    *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEB418];
    *(_QWORD *)&v50 = v15;
    sub_19CD433C0(&v50, v49);
    v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_19CD13D40(v49, 0x6973736572706D69, 0xEC00000064496E6FLL, v29);
    v52 = v28;
    swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v16 + 144) & 1) == 0)
    {
      v30 = *(_QWORD *)(v16 + 136);
      if ((_s9JetEngine19ImpressionsTrackingO14isDebugEnabledSbvgZ_0() & 1) != 0)
      {
        *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEB418];
        *(_QWORD *)&v50 = v30;
        sub_19CFDBA9C(0xD000000000000015, 0x800000019D07B320, (uint64_t)&v50, &v52);
        sub_19CD3F190((uint64_t)&v50);
        v28 = v52;
      }
      if (*(_QWORD *)(v28 + 16) && (v31 = sub_19CD3FD1C(0x6973736572706D69, 0xEF7865646E496E6FLL), (v32 & 1) != 0))
      {
        sub_19CD436B0(*(_QWORD *)(v28 + 56) + 32 * v31, (uint64_t)&v50);
        sub_19CD3F190((uint64_t)&v50);
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        sub_19CD3F190((uint64_t)&v50);
        swift_beginAccess();
        if (*(_QWORD *)(v16 + 48) == -1 && (*(_BYTE *)(v16 + 144) & 1) == 0)
        {
          v33 = *(_QWORD *)(v16 + 136);
          *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEB418];
          *(_QWORD *)&v50 = v33;
          sub_19CD433C0(&v50, v49);
          v34 = swift_isUniquelyReferenced_nonNull_native();
          sub_19CD13D40(v49, 0x6973736572706D69, 0xEF7865646E496E6FLL, v34);
          v52 = v28;
          swift_bridgeObjectRelease();
        }
      }
    }
    swift_beginAccess();
    if (*(_QWORD *)(v16 + 24))
    {
      v35 = sub_19CFDD020(v16, v15, v45);
      if ((v36 & 1) != 0)
        goto LABEL_43;
    }
    else
    {
      v35 = sub_19CFDDA58((_QWORD *)v16, v15, v44);
      if ((v39 & 1) != 0)
      {
LABEL_43:
        v37 = v52;
        goto LABEL_44;
      }
    }
    *((_QWORD *)&v51 + 1) = MEMORY[0x1E0DEB418];
    *(_QWORD *)&v50 = v35;
    sub_19CD433C0(&v50, v49);
    v37 = v52;
    v38 = swift_isUniquelyReferenced_nonNull_native();
    sub_19CD13D40(v49, 0xD000000000000012, 0x800000019D07B220, v38);
    v52 = v37;
    swift_bridgeObjectRelease();
LABEL_44:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_19CED518C(0, v14[2] + 1, 1, v14);
    v41 = v14[2];
    v40 = v14[3];
    if (v41 >= v40 >> 1)
      v14 = sub_19CED518C((_QWORD *)(v40 > 1), v41 + 1, 1, v14);
    v14[2] = v41 + 1;
    v14[v41 + 4] = v37;
    swift_release();
    swift_bridgeObjectRelease();
    v8 = v46;
LABEL_4:
    v13 += 2;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_51:
  v42 = sub_19CE03018((uint64_t)v14);
  swift_bridgeObjectRelease();
  return v42;
}

uint64_t _s12ItemPositionVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s12ItemPositionVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s12ItemPositionVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12ItemPositionVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12ItemPositionVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s12ItemPositionVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionsTracking.ItemPosition()
{
  return &type metadata for ImpressionsTracking.ItemPosition;
}

_QWORD *sub_19CFDE6B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_19CFDAFBC(*a1, *(_QWORD *)(v2 + 24));
  *a2 = result;
  return result;
}

void JEPluralCategoryForNumber_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_19CCBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Could not determine plural category for locale: %@", (uint8_t *)&v2, 0xCu);

}

void InitializeProcessLaunchTimeInterval_cold_1(int a1)
{
  int v1;
  char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = strerror(a1);
  _os_log_fault_impl(&dword_19CCBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Could not get process launch time, reason: %{public}s", (uint8_t *)&v1, 0xCu);
}

void __getMTStandardIDServiceClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_19CFDE81C();
}

uint64_t sub_19CFDE81C()
{
  return MEMORY[0x1E0CADD40]();
}

uint64_t sub_19CFDE828()
{
  return MEMORY[0x1E0CADDA0]();
}

uint64_t sub_19CFDE834()
{
  return MEMORY[0x1E0CADDA8]();
}

uint64_t sub_19CFDE840()
{
  return MEMORY[0x1E0CADDB8]();
}

uint64_t sub_19CFDE84C()
{
  return MEMORY[0x1E0CADDE8]();
}

uint64_t sub_19CFDE858()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_19CFDE864()
{
  return MEMORY[0x1E0CADE48]();
}

uint64_t sub_19CFDE870()
{
  return MEMORY[0x1E0CADE70]();
}

uint64_t sub_19CFDE87C()
{
  return MEMORY[0x1E0CADE90]();
}

uint64_t sub_19CFDE888()
{
  return MEMORY[0x1E0CADEB0]();
}

uint64_t sub_19CFDE894()
{
  return MEMORY[0x1E0CADEB8]();
}

uint64_t sub_19CFDE8A0()
{
  return MEMORY[0x1E0CADED0]();
}

uint64_t sub_19CFDE8AC()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_19CFDE8B8()
{
  return MEMORY[0x1E0CADEF8]();
}

uint64_t sub_19CFDE8C4()
{
  return MEMORY[0x1E0CADF00]();
}

uint64_t sub_19CFDE8D0()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_19CFDE8DC()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_19CFDE8E8()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_19CFDE8F4()
{
  return MEMORY[0x1E0CADF40]();
}

uint64_t sub_19CFDE900()
{
  return MEMORY[0x1E0CADF48]();
}

uint64_t sub_19CFDE90C()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_19CFDE918()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_19CFDE924()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_19CFDE930()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_19CFDE93C()
{
  return MEMORY[0x1E0CAE0C8]();
}

uint64_t sub_19CFDE948()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_19CFDE954()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_19CFDE960()
{
  return MEMORY[0x1E0CAE130]();
}

uint64_t sub_19CFDE96C()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_19CFDE978()
{
  return MEMORY[0x1E0CAE170]();
}

uint64_t sub_19CFDE984()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_19CFDE990()
{
  return MEMORY[0x1E0CAE190]();
}

uint64_t sub_19CFDE99C()
{
  return MEMORY[0x1E0CAE198]();
}

uint64_t sub_19CFDE9A8()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_19CFDE9B4()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_19CFDE9C0()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_19CFDE9CC()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_19CFDE9D8()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_19CFDE9E4()
{
  return MEMORY[0x1E0CAE310]();
}

uint64_t sub_19CFDE9F0()
{
  return MEMORY[0x1E0CAE3C8]();
}

uint64_t sub_19CFDE9FC()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_19CFDEA08()
{
  return MEMORY[0x1E0CAE498]();
}

uint64_t sub_19CFDEA14()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_19CFDEA20()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_19CFDEA2C()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_19CFDEA38()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_19CFDEA44()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_19CFDEA50()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_19CFDEA5C()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_19CFDEA68()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_19CFDEA74()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_19CFDEA80()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_19CFDEA8C()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_19CFDEA98()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_19CFDEAA4()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_19CFDEAB0()
{
  return MEMORY[0x1E0CAE6B8]();
}

uint64_t sub_19CFDEABC()
{
  return MEMORY[0x1E0CAE6D0]();
}

uint64_t sub_19CFDEAC8()
{
  return MEMORY[0x1E0CAE6F8]();
}

uint64_t sub_19CFDEAD4()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_19CFDEAE0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_19CFDEAEC()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_19CFDEAF8()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_19CFDEB04()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_19CFDEB10()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_19CFDEB1C()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_19CFDEB28()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_19CFDEB34()
{
  return MEMORY[0x1E0CAE818]();
}

uint64_t sub_19CFDEB40()
{
  return MEMORY[0x1E0CAE830]();
}

uint64_t sub_19CFDEB4C()
{
  return MEMORY[0x1E0CAE838]();
}

uint64_t sub_19CFDEB58()
{
  return MEMORY[0x1E0CAE840]();
}

uint64_t sub_19CFDEB64()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_19CFDEB70()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_19CFDEB7C()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_19CFDEB88()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_19CFDEB94()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_19CFDEBA0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_19CFDEBAC()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_19CFDEBB8()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_19CFDEBC4()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_19CFDEBD0()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_19CFDEBDC()
{
  return MEMORY[0x1E0CAE940]();
}

uint64_t sub_19CFDEBE8()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_19CFDEBF4()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_19CFDEC00()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_19CFDEC0C()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_19CFDEC18()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_19CFDEC24()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_19CFDEC30()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_19CFDEC3C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_19CFDEC48()
{
  return MEMORY[0x1E0CAEB40]();
}

uint64_t sub_19CFDEC54()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_19CFDEC60()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_19CFDEC6C()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_19CFDEC78()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_19CFDEC84()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_19CFDEC90()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_19CFDEC9C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_19CFDECA8()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_19CFDECB4()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_19CFDECC0()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_19CFDECCC()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_19CFDECD8()
{
  return MEMORY[0x1E0CAFD48]();
}

uint64_t sub_19CFDECE4()
{
  return MEMORY[0x1E0CAFD50]();
}

uint64_t sub_19CFDECF0()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_19CFDECFC()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_19CFDED08()
{
  return MEMORY[0x1E0CAFDB0]();
}

uint64_t sub_19CFDED14()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_19CFDED20()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_19CFDED2C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_19CFDED38()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_19CFDED44()
{
  return MEMORY[0x1E0CAFEA0]();
}

uint64_t sub_19CFDED50()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_19CFDED5C()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_19CFDED68()
{
  return MEMORY[0x1E0CAFEE0]();
}

uint64_t sub_19CFDED74()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_19CFDED80()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_19CFDED8C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_19CFDED98()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_19CFDEDA4()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_19CFDEDB0()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_19CFDEDBC()
{
  return MEMORY[0x1E0CAFFB8]();
}

uint64_t sub_19CFDEDC8()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_19CFDEDD4()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_19CFDEDE0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19CFDEDEC()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_19CFDEDF8()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_19CFDEE04()
{
  return MEMORY[0x1E0CB00B0]();
}

uint64_t sub_19CFDEE10()
{
  return MEMORY[0x1E0CB00E8]();
}

uint64_t sub_19CFDEE1C()
{
  return MEMORY[0x1E0CB00F0]();
}

uint64_t sub_19CFDEE28()
{
  return MEMORY[0x1E0CB0128]();
}

uint64_t sub_19CFDEE34()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_19CFDEE40()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_19CFDEE4C()
{
  return MEMORY[0x1E0CB01D0]();
}

uint64_t sub_19CFDEE58()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_19CFDEE64()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_19CFDEE70()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_19CFDEE7C()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_19CFDEE88()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_19CFDEE94()
{
  return MEMORY[0x1E0CB02B0]();
}

uint64_t sub_19CFDEEA0()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_19CFDEEAC()
{
  return MEMORY[0x1E0CB02E0]();
}

uint64_t sub_19CFDEEB8()
{
  return MEMORY[0x1E0CB02F8]();
}

uint64_t sub_19CFDEEC4()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_19CFDEED0()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_19CFDEEDC()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_19CFDEEE8()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_19CFDEEF4()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_19CFDEF00()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_19CFDEF0C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_19CFDEF18()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_19CFDEF24()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_19CFDEF30()
{
  return MEMORY[0x1E0CB06F0]();
}

uint64_t sub_19CFDEF3C()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_19CFDEF48()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_19CFDEF54()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_19CFDEF60()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_19CFDEF6C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_19CFDEF78()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_19CFDEF84()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_19CFDEF90()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_19CFDEF9C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_19CFDEFA8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_19CFDEFB4()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_19CFDEFC0()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_19CFDEFCC()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_19CFDEFD8()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_19CFDEFE4()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_19CFDEFF0()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_19CFDEFFC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_19CFDF008()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_19CFDF014()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_19CFDF020()
{
  return MEMORY[0x1E0CB0DD8]();
}

uint64_t sub_19CFDF02C()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_19CFDF038()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_19CFDF044()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_19CFDF050()
{
  return MEMORY[0x1E0CB0F28]();
}

uint64_t sub_19CFDF05C()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_19CFDF068()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_19CFDF074()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_19CFDF080()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_19CFDF08C()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_19CFDF098()
{
  return MEMORY[0x1E0CB1430]();
}

uint64_t sub_19CFDF0A4()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_19CFDF0B0()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_19CFDF0BC()
{
  return MEMORY[0x1E0CB14E0]();
}

uint64_t sub_19CFDF0C8()
{
  return MEMORY[0x1E0CB14F8]();
}

uint64_t sub_19CFDF0D4()
{
  return MEMORY[0x1E0CB1520]();
}

uint64_t sub_19CFDF0E0()
{
  return MEMORY[0x1E0CB1530]();
}

uint64_t sub_19CFDF0EC()
{
  return MEMORY[0x1E0CB1540]();
}

uint64_t sub_19CFDF0F8()
{
  return MEMORY[0x1E0CB1578]();
}

uint64_t sub_19CFDF104()
{
  return MEMORY[0x1E0CB15A0]();
}

uint64_t sub_19CFDF110()
{
  return MEMORY[0x1E0CB15C0]();
}

uint64_t sub_19CFDF11C()
{
  return MEMORY[0x1E0CB1628]();
}

uint64_t sub_19CFDF128()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_19CFDF134()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_19CFDF140()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_19CFDF14C()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_19CFDF158()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_19CFDF164()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_19CFDF170()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_19CFDF17C()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_19CFDF188()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_19CFDF194()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_19CFDF1A0()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_19CFDF1AC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_19CFDF1B8()
{
  return MEMORY[0x1E0DF2128]();
}

uint64_t sub_19CFDF1C4()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_19CFDF1D0()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_19CFDF1DC()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_19CFDF1E8()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_19CFDF1F4()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_19CFDF200()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_19CFDF20C()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_19CFDF218()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_19CFDF224()
{
  return MEMORY[0x1E0DF2010]();
}

uint64_t sub_19CFDF230()
{
  return MEMORY[0x1E0DEF398]();
}

uint64_t sub_19CFDF23C()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_19CFDF248()
{
  return MEMORY[0x1E0DEF3F8]();
}

uint64_t sub_19CFDF254()
{
  return MEMORY[0x1E0DEF428]();
}

uint64_t sub_19CFDF260()
{
  return MEMORY[0x1E0DEF430]();
}

uint64_t sub_19CFDF26C()
{
  return MEMORY[0x1E0CCE188]();
}

uint64_t sub_19CFDF278()
{
  return MEMORY[0x1E0CCE1A8]();
}

uint64_t sub_19CFDF284()
{
  return MEMORY[0x1E0CCE1B8]();
}

uint64_t sub_19CFDF290()
{
  return MEMORY[0x1E0CCE1C8]();
}

uint64_t sub_19CFDF29C()
{
  return MEMORY[0x1E0CCE1D8]();
}

uint64_t sub_19CFDF2A8()
{
  return MEMORY[0x1E0CCE1E0]();
}

uint64_t sub_19CFDF2B4()
{
  return MEMORY[0x1E0CCE1E8]();
}

uint64_t sub_19CFDF2C0()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_19CFDF2CC()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_19CFDF2D8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_19CFDF2E4()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_19CFDF2F0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_19CFDF2FC()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_19CFDF308()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_19CFDF314()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_19CFDF320()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_19CFDF32C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_19CFDF338()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_19CFDF344()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_19CFDF350()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_19CFDF35C()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_19CFDF368()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_19CFDF374()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_19CFDF380()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_19CFDF38C()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_19CFDF398()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_19CFDF3A4()
{
  return MEMORY[0x1E0DE9D78]();
}

uint64_t sub_19CFDF3B0()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_19CFDF3BC()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_19CFDF3C8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_19CFDF3D4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_19CFDF3E0()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_19CFDF3EC()
{
  return MEMORY[0x1E0DE9E48]();
}

uint64_t sub_19CFDF3F8()
{
  return MEMORY[0x1E0DE9E58]();
}

uint64_t sub_19CFDF404()
{
  return MEMORY[0x1E0DE9E60]();
}

uint64_t sub_19CFDF410()
{
  return MEMORY[0x1E0DE9E68]();
}

uint64_t sub_19CFDF41C()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_19CFDF428()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_19CFDF434()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_19CFDF440()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_19CFDF44C()
{
  return MEMORY[0x1E0DEA038]();
}

uint64_t sub_19CFDF458()
{
  return MEMORY[0x1E0DEA040]();
}

uint64_t sub_19CFDF464()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_19CFDF470()
{
  return MEMORY[0x1E0DEA070]();
}

uint64_t sub_19CFDF47C()
{
  return MEMORY[0x1E0DEA078]();
}

uint64_t sub_19CFDF488()
{
  return MEMORY[0x1E0DEA088]();
}

uint64_t sub_19CFDF494()
{
  return MEMORY[0x1E0DEA090]();
}

uint64_t sub_19CFDF4A0()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_19CFDF4AC()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_19CFDF4B8()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t sub_19CFDF4C4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_19CFDF4D0()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_19CFDF4DC()
{
  return MEMORY[0x1E0DF1F68]();
}

uint64_t sub_19CFDF4E8()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_19CFDF4F4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_19CFDF500()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_19CFDF50C()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_19CFDF518()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_19CFDF524()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_19CFDF530()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_19CFDF53C()
{
  return MEMORY[0x1E0DEA518]();
}

uint64_t sub_19CFDF548()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19CFDF554()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19CFDF560()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_19CFDF56C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_19CFDF578()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19CFDF584()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_19CFDF590()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_19CFDF59C()
{
  return MEMORY[0x1E0CB1998]();
}

uint64_t sub_19CFDF5A8()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_19CFDF5B4()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_19CFDF5C0()
{
  return MEMORY[0x1E0CB1A08]();
}

uint64_t sub_19CFDF5CC()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_19CFDF5D8()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_19CFDF5E4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19CFDF5F0()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_19CFDF5FC()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_19CFDF608()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_19CFDF614()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_19CFDF620()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_19CFDF62C()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_19CFDF638()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_19CFDF644()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_19CFDF650()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19CFDF65C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_19CFDF668()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_19CFDF674()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_19CFDF680()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_19CFDF68C()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_19CFDF698()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19CFDF6A4()
{
  return MEMORY[0x1E0DEA820]();
}

uint64_t sub_19CFDF6B0()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_19CFDF6BC()
{
  return MEMORY[0x1E0DEA830]();
}

uint64_t sub_19CFDF6C8()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_19CFDF6D4()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19CFDF6E0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_19CFDF6EC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_19CFDF6F8()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_19CFDF704()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_19CFDF710()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_19CFDF71C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_19CFDF728()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_19CFDF734()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t sub_19CFDF740()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t sub_19CFDF74C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_19CFDF758()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_19CFDF764()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_19CFDF770()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_19CFDF77C()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_19CFDF788()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_19CFDF794()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_19CFDF7A0()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_19CFDF7AC()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_19CFDF7B8()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t sub_19CFDF7C4()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_19CFDF7D0()
{
  return MEMORY[0x1E0DEAB98]();
}

uint64_t sub_19CFDF7DC()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_19CFDF7E8()
{
  return MEMORY[0x1E0DEABE8]();
}

uint64_t sub_19CFDF7F4()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_19CFDF800()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_19CFDF80C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_19CFDF818()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_19CFDF824()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_19CFDF830()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_19CFDF83C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_19CFDF848()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19CFDF854()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19CFDF860()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_19CFDF86C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19CFDF878()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19CFDF884()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_19CFDF890()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_19CFDF89C()
{
  return MEMORY[0x1E0DEADD8]();
}

uint64_t sub_19CFDF8A8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19CFDF8B4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_19CFDF8C0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_19CFDF8CC()
{
  return MEMORY[0x1E0DEAE30]();
}

uint64_t sub_19CFDF8D8()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_19CFDF8E4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19CFDF8F0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_19CFDF8FC()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_19CFDF908()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_19CFDF914()
{
  return MEMORY[0x1E0DEAE90]();
}

uint64_t sub_19CFDF920()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_19CFDF92C()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_19CFDF938()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_19CFDF944()
{
  return MEMORY[0x1E0DEAED8]();
}

uint64_t sub_19CFDF950()
{
  return MEMORY[0x1E0DEAEE0]();
}

uint64_t sub_19CFDF95C()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_19CFDF968()
{
  return MEMORY[0x1E0DEAEF8]();
}

uint64_t sub_19CFDF974()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_19CFDF980()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_19CFDF98C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_19CFDF998()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_19CFDF9A4()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_19CFDF9B0()
{
  return MEMORY[0x1E0DF05F8]();
}

uint64_t sub_19CFDF9BC()
{
  return MEMORY[0x1E0DF0600]();
}

uint64_t sub_19CFDF9C8()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_19CFDF9D4()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t sub_19CFDF9E0()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_19CFDF9EC()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_19CFDF9F8()
{
  return MEMORY[0x1E0DF06B8]();
}

uint64_t sub_19CFDFA04()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_19CFDFA10()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_19CFDFA1C()
{
  return MEMORY[0x1E0DF0790]();
}

uint64_t sub_19CFDFA28()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_19CFDFA34()
{
  return MEMORY[0x1E0DF07C0]();
}

uint64_t sub_19CFDFA40()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_19CFDFA4C()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_19CFDFA58()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_19CFDFA64()
{
  return MEMORY[0x1E0DF0810]();
}

uint64_t sub_19CFDFA70()
{
  return MEMORY[0x1E0DF0820]();
}

uint64_t sub_19CFDFA7C()
{
  return MEMORY[0x1E0DF0838]();
}

uint64_t sub_19CFDFA88()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_19CFDFA94()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_19CFDFAA0()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_19CFDFAAC()
{
  return MEMORY[0x1E0DF0878]();
}

uint64_t sub_19CFDFAB8()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_19CFDFAC4()
{
  return MEMORY[0x1E0DF0928]();
}

uint64_t sub_19CFDFAD0()
{
  return MEMORY[0x1E0DF0938]();
}

uint64_t sub_19CFDFADC()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_19CFDFAE8()
{
  return MEMORY[0x1E0DF0A30]();
}

uint64_t sub_19CFDFAF4()
{
  return MEMORY[0x1E0DF0A58]();
}

uint64_t sub_19CFDFB00()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_19CFDFB0C()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_19CFDFB18()
{
  return MEMORY[0x1E0DF0A78]();
}

uint64_t sub_19CFDFB24()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_19CFDFB30()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_19CFDFB3C()
{
  return MEMORY[0x1E0DF0AA0]();
}

uint64_t sub_19CFDFB48()
{
  return MEMORY[0x1E0DF0AB0]();
}

uint64_t sub_19CFDFB54()
{
  return MEMORY[0x1E0DF0AD0]();
}

uint64_t sub_19CFDFB60()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_19CFDFB6C()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_19CFDFB78()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_19CFDFB84()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_19CFDFB90()
{
  return MEMORY[0x1E0DEB120]();
}

uint64_t sub_19CFDFB9C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_19CFDFBA8()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_19CFDFBB4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_19CFDFBC0()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_19CFDFBCC()
{
  return MEMORY[0x1E0DEB300]();
}

uint64_t sub_19CFDFBD8()
{
  return MEMORY[0x1E0DEB340]();
}

uint64_t sub_19CFDFBE4()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_19CFDFBF0()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_19CFDFBFC()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_19CFDFC08()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_19CFDFC14()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_19CFDFC20()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_19CFDFC2C()
{
  return MEMORY[0x1E0DEB618]();
}

uint64_t sub_19CFDFC38()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_19CFDFC44()
{
  return MEMORY[0x1E0DEB628]();
}

uint64_t sub_19CFDFC50()
{
  return MEMORY[0x1E0DEB630]();
}

uint64_t sub_19CFDFC5C()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_19CFDFC68()
{
  return MEMORY[0x1E0DEB668]();
}

uint64_t sub_19CFDFC74()
{
  return MEMORY[0x1E0DEB6A0]();
}

uint64_t sub_19CFDFC80()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_19CFDFC8C()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_19CFDFC98()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_19CFDFCA4()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t sub_19CFDFCB0()
{
  return MEMORY[0x1E0DEB7F8]();
}

uint64_t sub_19CFDFCBC()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t sub_19CFDFCC8()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_19CFDFCD4()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_19CFDFCE0()
{
  return MEMORY[0x1E0C9B8C8]();
}

uint64_t sub_19CFDFCEC()
{
  return MEMORY[0x1E0CB1CA0]();
}

uint64_t sub_19CFDFCF8()
{
  return MEMORY[0x1E0CB1CA8]();
}

uint64_t sub_19CFDFD04()
{
  return MEMORY[0x1E0CB1CB8]();
}

uint64_t sub_19CFDFD10()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t sub_19CFDFD1C()
{
  return MEMORY[0x1E0CB1CF8]();
}

uint64_t sub_19CFDFD28()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_19CFDFD34()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19CFDFD40()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_19CFDFD4C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_19CFDFD58()
{
  return MEMORY[0x1E0CCEC08]();
}

uint64_t sub_19CFDFD64()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_19CFDFD70()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_19CFDFD7C()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_19CFDFD88()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_19CFDFD94()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_19CFDFDA0()
{
  return MEMORY[0x1E0DEF8C8]();
}

uint64_t sub_19CFDFDAC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_19CFDFDB8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_19CFDFDC4()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_19CFDFDD0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_19CFDFDDC()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_19CFDFDE8()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_19CFDFDF4()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_19CFDFE00()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_19CFDFE0C()
{
  return MEMORY[0x1E0DEF9A0]();
}

uint64_t sub_19CFDFE18()
{
  return MEMORY[0x1E0DEF9A8]();
}

uint64_t sub_19CFDFE24()
{
  return MEMORY[0x1E0DEF9B0]();
}

uint64_t sub_19CFDFE30()
{
  return MEMORY[0x1E0DEF9D8]();
}

uint64_t sub_19CFDFE3C()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_19CFDFE48()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_19CFDFE54()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_19CFDFE60()
{
  return MEMORY[0x1E0DEFA28]();
}

uint64_t sub_19CFDFE6C()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_19CFDFE78()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_19CFDFE84()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_19CFDFE90()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_19CFDFE9C()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_19CFDFEA8()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_19CFDFEB4()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_19CFDFEC0()
{
  return MEMORY[0x1E0DEFAC0]();
}

uint64_t sub_19CFDFECC()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_19CFDFED8()
{
  return MEMORY[0x1E0CB2000]();
}

uint64_t sub_19CFDFEE4()
{
  return MEMORY[0x1E0CB20C8]();
}

uint64_t sub_19CFDFEF0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_19CFDFEFC()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_19CFDFF08()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_19CFDFF14()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_19CFDFF20()
{
  return MEMORY[0x1E0CB2200]();
}

uint64_t sub_19CFDFF2C()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_19CFDFF38()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_19CFDFF44()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_19CFDFF50()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_19CFDFF5C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_19CFDFF68()
{
  return MEMORY[0x1E0DEB950]();
}

uint64_t sub_19CFDFF74()
{
  return MEMORY[0x1E0DEB958]();
}

uint64_t sub_19CFDFF80()
{
  return MEMORY[0x1E0DEB968]();
}

uint64_t sub_19CFDFF8C()
{
  return MEMORY[0x1E0DEBA80]();
}

uint64_t sub_19CFDFF98()
{
  return MEMORY[0x1E0DEBAD8]();
}

uint64_t sub_19CFDFFA4()
{
  return MEMORY[0x1E0DEBB50]();
}

uint64_t sub_19CFDFFB0()
{
  return MEMORY[0x1E0DEBB58]();
}

uint64_t sub_19CFDFFBC()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_19CFDFFC8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19CFDFFD4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19CFDFFE0()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_19CFDFFEC()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_19CFDFFF8()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_19CFE0004()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_19CFE0010()
{
  return MEMORY[0x1E0CB24B0]();
}

uint64_t sub_19CFE001C()
{
  return MEMORY[0x1E0CB24C8]();
}

uint64_t sub_19CFE0028()
{
  return MEMORY[0x1E0CB2558]();
}

uint64_t sub_19CFE0034()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_19CFE0040()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_19CFE004C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19CFE0058()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_19CFE0064()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_19CFE0070()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_19CFE007C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_19CFE0088()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_19CFE0094()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_19CFE00A0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_19CFE00AC()
{
  return MEMORY[0x1E0DEC180]();
}

uint64_t _s9JetEngine15CodeAnyHashableV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x1E0DEC188]();
}

uint64_t sub_19CFE00C4()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_19CFE00D0()
{
  return MEMORY[0x1E0DF0B00]();
}

uint64_t sub_19CFE00DC()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_19CFE00E8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_19CFE00F4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_19CFE0100()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_19CFE010C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19CFE0118()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19CFE0124()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t sub_19CFE0130()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_19CFE013C()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_19CFE0148()
{
  return MEMORY[0x1E0DEC3A8]();
}

uint64_t sub_19CFE0154()
{
  return MEMORY[0x1E0DEC3B0]();
}

uint64_t sub_19CFE0160()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_19CFE016C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19CFE0178()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_19CFE0184()
{
  return MEMORY[0x1E0DEC430]();
}

uint64_t sub_19CFE0190()
{
  return MEMORY[0x1E0DEC440]();
}

uint64_t sub_19CFE019C()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_19CFE01A8()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_19CFE01B4()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_19CFE01C0()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_19CFE01CC()
{
  return MEMORY[0x1E0DEC4D0]();
}

uint64_t sub_19CFE01D8()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_19CFE01E4()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_19CFE01F0()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_19CFE01FC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19CFE0208()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_19CFE0214()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_19CFE0220()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_19CFE022C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_19CFE0238()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_19CFE0244()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_19CFE0250()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_19CFE025C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_19CFE0268()
{
  return MEMORY[0x1E0DEC6E8]();
}

uint64_t sub_19CFE0274()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_19CFE0280()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_19CFE028C()
{
  return MEMORY[0x1E0DEC718]();
}

uint64_t sub_19CFE0298()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_19CFE02A4()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_19CFE02B0()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_19CFE02BC()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_19CFE02C8()
{
  return MEMORY[0x1E0DEC808]();
}

uint64_t sub_19CFE02D4()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_19CFE02E0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_19CFE02EC()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_19CFE02F8()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t sub_19CFE0304()
{
  return MEMORY[0x1E0DEC988]();
}

uint64_t sub_19CFE0310()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_19CFE031C()
{
  return MEMORY[0x1E0DECAA8]();
}

uint64_t sub_19CFE0328()
{
  return MEMORY[0x1E0DECAE8]();
}

uint64_t sub_19CFE0334()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19CFE0340()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19CFE034C()
{
  return MEMORY[0x1E0DECC00]();
}

uint64_t sub_19CFE0358()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_19CFE0364()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_19CFE0370()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_19CFE037C()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_19CFE0388()
{
  return MEMORY[0x1E0DECC90]();
}

uint64_t sub_19CFE0394()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19CFE03A0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19CFE03AC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19CFE03B8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_19CFE03C4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19CFE03D0()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_19CFE03DC()
{
  return MEMORY[0x1E0DECDA0]();
}

uint64_t sub_19CFE03E8()
{
  return MEMORY[0x1E0DECDA8]();
}

uint64_t sub_19CFE03F4()
{
  return MEMORY[0x1E0DECE20]();
}

uint64_t sub_19CFE0400()
{
  return MEMORY[0x1E0DECE28]();
}

uint64_t sub_19CFE040C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_19CFE0418()
{
  return MEMORY[0x1E0DECF20]();
}

uint64_t sub_19CFE0424()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_19CFE0430()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_19CFE043C()
{
  return MEMORY[0x1E0DECF48]();
}

uint64_t sub_19CFE0448()
{
  return MEMORY[0x1E0DECF50]();
}

uint64_t sub_19CFE0454()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_19CFE0460()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_19CFE046C()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_19CFE0478()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_19CFE0484()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_19CFE0490()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_19CFE049C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_19CFE04A8()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_19CFE04B4()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_19CFE04C0()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_19CFE04CC()
{
  return MEMORY[0x1E0DED040]();
}

uint64_t sub_19CFE04D8()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_19CFE04E4()
{
  return MEMORY[0x1E0DED058]();
}

uint64_t sub_19CFE04F0()
{
  return MEMORY[0x1E0DED080]();
}

uint64_t sub_19CFE04FC()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_19CFE0508()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_19CFE0514()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_19CFE0520()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_19CFE052C()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_19CFE0538()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_19CFE0544()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_19CFE0550()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_19CFE055C()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_19CFE0568()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_19CFE0574()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_19CFE0580()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_19CFE058C()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_19CFE0598()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19CFE05A4()
{
  return MEMORY[0x1E0DED1E0]();
}

uint64_t sub_19CFE05B0()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_19CFE05BC()
{
  return MEMORY[0x1E0DED258]();
}

uint64_t sub_19CFE05C8()
{
  return MEMORY[0x1E0DED290]();
}

uint64_t sub_19CFE05D4()
{
  return MEMORY[0x1E0DED2B8]();
}

uint64_t sub_19CFE05E0()
{
  return MEMORY[0x1E0DED2C8]();
}

uint64_t sub_19CFE05EC()
{
  return MEMORY[0x1E0DED2D0]();
}

uint64_t sub_19CFE05F8()
{
  return MEMORY[0x1E0DED2D8]();
}

uint64_t sub_19CFE0604()
{
  return MEMORY[0x1E0DED2E8]();
}

uint64_t sub_19CFE0610()
{
  return MEMORY[0x1E0DED2F0]();
}

uint64_t sub_19CFE061C()
{
  return MEMORY[0x1E0DED2F8]();
}

uint64_t sub_19CFE0628()
{
  return MEMORY[0x1E0DED318]();
}

uint64_t sub_19CFE0634()
{
  return MEMORY[0x1E0DED340]();
}

uint64_t sub_19CFE0640()
{
  return MEMORY[0x1E0DED350]();
}

uint64_t sub_19CFE064C()
{
  return MEMORY[0x1E0DED358]();
}

uint64_t sub_19CFE0658()
{
  return MEMORY[0x1E0DED3D0]();
}

uint64_t sub_19CFE0664()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_19CFE0670()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_19CFE067C()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_19CFE0688()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_19CFE0694()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_19CFE06A0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19CFE06AC()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_19CFE06B8()
{
  return MEMORY[0x1E0DED630]();
}

uint64_t sub_19CFE06C4()
{
  return MEMORY[0x1E0DED638]();
}

uint64_t sub_19CFE06D0()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t sub_19CFE06DC()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_19CFE06E8()
{
  return MEMORY[0x1E0DED690]();
}

uint64_t sub_19CFE06F4()
{
  return MEMORY[0x1E0DED698]();
}

uint64_t sub_19CFE0700()
{
  return MEMORY[0x1E0DED6A0]();
}

uint64_t sub_19CFE070C()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_19CFE0718()
{
  return MEMORY[0x1E0DED6D0]();
}

uint64_t sub_19CFE0724()
{
  return MEMORY[0x1E0DED6D8]();
}

uint64_t sub_19CFE0730()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t sub_19CFE073C()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_19CFE0748()
{
  return MEMORY[0x1E0DED740]();
}

uint64_t sub_19CFE0754()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_19CFE0760()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_19CFE076C()
{
  return MEMORY[0x1E0DED7D0]();
}

uint64_t sub_19CFE0778()
{
  return MEMORY[0x1E0DED7D8]();
}

uint64_t sub_19CFE0784()
{
  return MEMORY[0x1E0DED7E0]();
}

uint64_t sub_19CFE0790()
{
  return MEMORY[0x1E0DED7F0]();
}

uint64_t sub_19CFE079C()
{
  return MEMORY[0x1E0DED7F8]();
}

uint64_t sub_19CFE07A8()
{
  return MEMORY[0x1E0DED800]();
}

uint64_t sub_19CFE07B4()
{
  return MEMORY[0x1E0DED820]();
}

uint64_t sub_19CFE07C0()
{
  return MEMORY[0x1E0DED848]();
}

uint64_t sub_19CFE07CC()
{
  return MEMORY[0x1E0DED858]();
}

uint64_t sub_19CFE07D8()
{
  return MEMORY[0x1E0DED860]();
}

uint64_t sub_19CFE07E4()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t sub_19CFE07F0()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_19CFE07FC()
{
  return MEMORY[0x1E0DED9C0]();
}

uint64_t sub_19CFE0808()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_19CFE0814()
{
  return MEMORY[0x1E0DEDAD8]();
}

uint64_t sub_19CFE0820()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_19CFE082C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19CFE0838()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_19CFE0844()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_19CFE0850()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_19CFE085C()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_19CFE0868()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_19CFE0874()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19CFE0880()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19CFE088C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19CFE0898()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19CFE08A4()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_19CFE08B0()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_19CFE08BC()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_19CFE08C8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19CFE08D4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19CFE08E0()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_19CFE08EC()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_19CFE08F8()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_19CFE0904()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_19CFE0910()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19CFE091C()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_19CFE0928()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_19CFE0934()
{
  return MEMORY[0x1E0DEDF90]();
}

uint64_t sub_19CFE0940()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_19CFE094C()
{
  return MEMORY[0x1E0DEDFE0]();
}

uint64_t sub_19CFE0958()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_19CFE0964()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_19CFE0970()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_19CFE097C()
{
  return MEMORY[0x1E0CB26E8]();
}

uint64_t sub_19CFE0988()
{
  return MEMORY[0x1E0CB26F0]();
}

uint64_t sub_19CFE0994()
{
  return MEMORY[0x1E0CB26F8]();
}

uint64_t sub_19CFE09A0()
{
  return MEMORY[0x1E0CB2700]();
}

uint64_t sub_19CFE09AC()
{
  return MEMORY[0x1E0DEE0E8]();
}

uint64_t sub_19CFE09B8()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t sub_19CFE09C4()
{
  return MEMORY[0x1E0DEE228]();
}

uint64_t sub_19CFE09D0()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_19CFE09DC()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t sub_19CFE09E8()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_19CFE09F4()
{
  return MEMORY[0x1E0DEE250]();
}

uint64_t sub_19CFE0A00()
{
  return MEMORY[0x1E0DEE258]();
}

uint64_t sub_19CFE0A0C()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_19CFE0A18()
{
  return MEMORY[0x1E0DEE268]();
}

uint64_t sub_19CFE0A24()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_19CFE0A30()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_19CFE0A3C()
{
  return MEMORY[0x1E0DEE8C8]();
}

uint64_t sub_19CFE0A48()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_19CFE0A54()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_19CFE0A60()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t sub_19CFE0A6C()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t sub_19CFE0A78()
{
  return MEMORY[0x1E0DF0F40]();
}

uint64_t sub_19CFE0A84()
{
  return MEMORY[0x1E0DF0F48]();
}

uint64_t sub_19CFE0A90()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AMSErrorIsEqual()
{
  return MEMORY[0x1E0CFD810]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x1E0CFD860]();
}

uint64_t AMSLogableURL()
{
  return MEMORY[0x1E0CFD868]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C800A8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x1E0C800D0]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x1E0C800F0]();
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1E0C80100](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D10](allocator, flags, order, block, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x1E0C98D48](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x1E0C9D7F8](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

JSContextGroupRef JSContextGetGroup(JSContextRef ctx)
{
  return (JSContextGroupRef)MEMORY[0x1E0CBDDE8](ctx);
}

JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x1E0CBDDF8](ctx, script, thisObject, sourceURL, *(_QWORD *)&startingLineNumber, exception);
}

void JSGarbageCollect(JSContextRef ctx)
{
  MEMORY[0x1E0CBDE00](ctx);
}

JSPropertyNameArrayRef JSObjectCopyPropertyNames(JSContextRef ctx, JSObjectRef object)
{
  return (JSPropertyNameArrayRef)MEMORY[0x1E0CBDE38](ctx, object);
}

size_t JSObjectGetArrayBufferByteLength(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x1E0CBDE48](ctx, object, exception);
}

void *__cdecl JSObjectGetArrayBufferBytesPtr(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return (void *)MEMORY[0x1E0CBDE50](ctx, object, exception);
}

size_t JSObjectGetTypedArrayByteLength(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x1E0CBDE78](ctx, object, exception);
}

size_t JSObjectGetTypedArrayByteOffset(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x1E0CBDE80](ctx, object, exception);
}

void *__cdecl JSObjectGetTypedArrayBytesPtr(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return (void *)MEMORY[0x1E0CBDE88](ctx, object, exception);
}

size_t JSObjectGetTypedArrayLength(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x1E0CBDE90](ctx, object, exception);
}

BOOL JSObjectIsConstructor(JSContextRef ctx, JSObjectRef object)
{
  return MEMORY[0x1E0CBDEA0](ctx, object);
}

BOOL JSObjectIsFunction(JSContextRef ctx, JSObjectRef object)
{
  return MEMORY[0x1E0CBDEA8](ctx, object);
}

JSObjectRef JSObjectMakeArrayBufferWithBytesNoCopy(JSContextRef ctx, void *bytes, size_t byteLength, JSTypedArrayBytesDeallocator bytesDeallocator, void *deallocatorContext, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBDEC0](ctx, bytes, byteLength, bytesDeallocator, deallocatorContext, exception);
}

JSObjectRef JSObjectMakeTypedArray(JSContextRef ctx, JSTypedArrayType arrayType, size_t length, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBDEE8](ctx, *(_QWORD *)&arrayType, length, exception);
}

JSObjectRef JSObjectMakeTypedArrayWithArrayBuffer(JSContextRef ctx, JSTypedArrayType arrayType, JSObjectRef buffer, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBDEF0](ctx, *(_QWORD *)&arrayType, buffer, exception);
}

JSObjectRef JSObjectMakeTypedArrayWithArrayBufferAndOffset(JSContextRef ctx, JSTypedArrayType arrayType, JSObjectRef buffer, size_t byteOffset, size_t length, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBDEF8](ctx, *(_QWORD *)&arrayType, buffer, byteOffset, length, exception);
}

JSObjectRef JSObjectMakeTypedArrayWithBytesNoCopy(JSContextRef ctx, JSTypedArrayType arrayType, void *bytes, size_t byteLength, JSTypedArrayBytesDeallocator bytesDeallocator, void *deallocatorContext, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBDF00](ctx, *(_QWORD *)&arrayType, bytes, byteLength, bytesDeallocator, deallocatorContext, exception);
}

size_t JSPropertyNameArrayGetCount(JSPropertyNameArrayRef array)
{
  return MEMORY[0x1E0CBDF48](array);
}

JSStringRef JSPropertyNameArrayGetNameAtIndex(JSPropertyNameArrayRef array, size_t index)
{
  return (JSStringRef)MEMORY[0x1E0CBDF50](array, index);
}

void JSPropertyNameArrayRelease(JSPropertyNameArrayRef array)
{
  MEMORY[0x1E0CBDF58](array);
}

uint64_t JSRemoteInspectorSetLogToSystemConsole()
{
  return MEMORY[0x1E0CBDF80]();
}

CFStringRef JSStringCopyCFString(CFAllocatorRef alloc, JSStringRef string)
{
  return (CFStringRef)MEMORY[0x1E0CBDFA0](alloc, string);
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return (JSStringRef)MEMORY[0x1E0CBDFB8](string);
}

const JSChar *__cdecl JSStringGetCharactersPtr(JSStringRef string)
{
  return (const JSChar *)MEMORY[0x1E0CBDFC0](string);
}

size_t JSStringGetLength(JSStringRef string)
{
  return MEMORY[0x1E0CBDFC8](string);
}

void JSStringRelease(JSStringRef string)
{
  MEMORY[0x1E0CBDFE8](string);
}

JSStringRef JSStringRetain(JSStringRef string)
{
  return (JSStringRef)MEMORY[0x1E0CBDFF0](string);
}

JSStringRef JSValueCreateJSONString(JSContextRef ctx, JSValueRef value, unsigned int indent, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x1E0CBDFF8](ctx, value, *(_QWORD *)&indent, exception);
}

JSType JSValueGetType(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1E0CBE000](ctx, value);
}

JSTypedArrayType JSValueGetTypedArrayType(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return MEMORY[0x1E0CBE008](ctx, value, exception);
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1E0CBE038](ctx, value);
}

JSValueRef JSValueMakeFromJSONString(JSContextRef ctx, JSStringRef string)
{
  return (JSValueRef)MEMORY[0x1E0CBE060](ctx, string);
}

JSObjectRef JSValueToObject(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x1E0CBE0A0](ctx, value, exception);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x1E0CBE0A8](ctx, value, exception);
}

uint64_t JSWeakCreate()
{
  return MEMORY[0x1E0CBE0B8]();
}

uint64_t JSWeakGetObject()
{
  return MEMORY[0x1E0CBE0C0]();
}

uint64_t JSWeakRelease()
{
  return MEMORY[0x1E0CBE0E8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x1E0CD63F0](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
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

uint64_t _CFRunLoopSetPerCalloutAutoreleasepoolEnabled()
{
  return MEMORY[0x1E0C9A488]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_sourcepath()
{
  return MEMORY[0x1E0DE3E48]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1E0DE3E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_disk_descend()
{
  return MEMORY[0x1E0DE3EA8]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x1E0DE3EB8]();
}

uint64_t archive_read_disk_open()
{
  return MEMORY[0x1E0DE3EC0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open()
{
  return MEMORY[0x1E0DE3F18]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1E0DE3F70]();
}

uint64_t archive_write_add_filter_none()
{
  return MEMORY[0x1E0DE3FB8]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1E0DE3FD0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1E0DE3FE0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open()
{
  return MEMORY[0x1E0DE4018]();
}

uint64_t archive_write_set_format_ustar()
{
  return MEMORY[0x1E0DE4060]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chdir(const char *a1)
{
  return MEMORY[0x1E0C82628](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

void clearerr(FILE *a1)
{
  MEMORY[0x1E0C82648](a1);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1E0C83388](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1E0C83648](a1, a2);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return MEMORY[0x1E0C836E0](__linep, __linecapp, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x1E0CCFD00]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x1E0C85158]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE85B8](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x1E0DEEAC8]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x1E0DEEAD0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC68]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x1E0DEEC70]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1E0DEEDC0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_job_run()
{
  return MEMORY[0x1E0DF0FD8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1E0DEEE10]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x1E0DF1030]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x1E0DF1038]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

uint64_t ucnv_close()
{
  return MEMORY[0x1E0DE5E98]();
}

uint64_t ucnv_fromUChars()
{
  return MEMORY[0x1E0DE5EC0]();
}

uint64_t ucnv_getMaxCharSize()
{
  return MEMORY[0x1E0DE5F00]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1E0DE5F20]();
}

int ungetc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C859A8](*(_QWORD *)&a1, a2);
}

uint64_t unum_close()
{
  return MEMORY[0x1E0DE6530]();
}

uint64_t unum_formatInt64()
{
  return MEMORY[0x1E0DE6560]();
}

uint64_t unum_open()
{
  return MEMORY[0x1E0DE6598]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x1E0DE65C8]();
}

uint64_t uplrules_close()
{
  return MEMORY[0x1E0DE66B8]();
}

uint64_t uplrules_open()
{
  return MEMORY[0x1E0DE66C8]();
}

uint64_t uplrules_select()
{
  return MEMORY[0x1E0DE66D8]();
}

