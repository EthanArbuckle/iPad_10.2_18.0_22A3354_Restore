uint64_t View.onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;

  swift_retain();
  swift_retain();
  sub_22983DDD8();
  v13 = v19[0];
  v14 = v20;
  v29 = 0;
  sub_22983DDD8();
  v15 = v19[0];
  v16 = v20;
  v19[0] = a1;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = 1;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  MEMORY[0x22E2D04D4](v19, a6, &type metadata for OnCameraCaptureEventModifier, a7);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t View.onCameraCaptureEvent(isEnabled:action:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _BYTE v15[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;

  swift_retain();
  sub_22983DDD8();
  v10 = v15[0];
  v11 = v16;
  v25 = 0;
  sub_22983DDD8();
  v12 = v15[0];
  v13 = v16;
  v15[0] = a1;
  v16 = a2;
  v17 = a3;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  MEMORY[0x22E2D04D4](v15, a4, &type metadata for OnCameraCaptureEventModifier, a5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22983AF8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_22983DD00();
  v4[0] = v1;
  v4[1] = sub_22983AFE0();
  return MEMORY[0x22E2D06E4](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22983AFE0()
{
  unint64_t result;

  result = qword_255A680E0;
  if (!qword_255A680E0)
  {
    result = MEMORY[0x22E2D06E4](&unk_22983E0A0, &type metadata for OnCameraCaptureEventModifier);
    atomic_store(result, (unint64_t *)&qword_255A680E0);
  }
  return result;
}

uint64_t sub_22983B024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    swift_retain();
  return swift_retain();
}

uint64_t destroy for OnCameraCaptureEventModifier(uint64_t a1)
{
  sub_22983B08C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  return swift_release();
}

uint64_t sub_22983B08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  result = swift_release();
  if ((a5 & 1) != 0)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_22983B024(v4, v5, v6, v7, v8);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_22983B024(v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_22983B08C(v9, v10, v11, v12, v13);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 40);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v4;
  sub_22983B08C(v5, v6, v7, v8, v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnCameraCaptureEventModifier(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnCameraCaptureEventModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnCameraCaptureEventModifier()
{
  return &type metadata for OnCameraCaptureEventModifier;
}

uint64_t sub_22983B3A4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22983B3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v4 = sub_22983DD0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22983B99C(a1);
  if ((v9 & 1) == 0)
  {
    v10 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
    if (v11 == *MEMORY[0x24BDF0B98])
    {
      v12 = 0;
    }
    else if (v11 == *MEMORY[0x24BDF0BA0])
    {
      v12 = 1;
    }
    else
    {
      if (v11 != *MEMORY[0x24BDF0BA8])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return;
      }
      v12 = 2;
    }
    v13 = objc_msgSend((id)objc_opt_self(), sel_eventWithSource_phase_, v10, v12);
    sub_22983B4F0(v13);

  }
}

id sub_22983B4F0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  const char *v5;
  id result;
  char v7;
  __int128 v8[2];
  _BYTE v9[40];

  sub_22983B814((__int128 *)(v1 + 8), (uint64_t)v8);
  sub_22983B814(v8, (uint64_t)v9);
  if ((v9[32] & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A680F8);
    sub_22983DDE4();
    if (v7 == 1 && objc_msgSend(a1, sel_source))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A68100);
      v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_22983E060;
      *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
      v4 = 0xD00000000000004ELL;
      v5 = "Ignoring capture event from non-primary source while primary source is active.";
LABEL_10:
      *(_QWORD *)(v3 + 32) = v4;
      *(_QWORD *)(v3 + 40) = (unint64_t)(v5 - 32) | 0x8000000000000000;
      sub_22983DE2C();
      return (id)swift_bridgeObjectRelease();
    }
    sub_22983DDE4();
    if (v7 == 1 && objc_msgSend(a1, sel_source) != (id)1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A68100);
      v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_22983E060;
      *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
      v4 = 0xD000000000000052;
      v5 = "Ignoring capture event from non-secondary source while secondary source is active.";
      goto LABEL_10;
    }
  }
  result = objc_msgSend(a1, sel_source);
  if ((unint64_t)result <= 1)
  {
    objc_msgSend(a1, sel_phase);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A680F8);
    sub_22983DDF0();
    return (id)sub_22983BACC(a1, v8);
  }
  return result;
}

uint64_t sub_22983B708()
{
  return sub_22983DCD0();
}

uint64_t sub_22983B720()
{
  __int128 *v0;
  __int128 v1;
  __int128 v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[40];
  __int128 v13;
  __int128 v14;

  v1 = v0[1];
  v7 = *v0;
  v8 = v1;
  v2 = v0[3];
  v9 = v0[2];
  v10 = v2;
  v11 = v0[4];
  sub_22983B814((__int128 *)((char *)&v7 + 8), (uint64_t)v12);
  v13 = v10;
  v14 = v11;
  v3 = (_OWORD *)swift_allocObject();
  v4 = v10;
  v3[3] = v9;
  v3[4] = v4;
  v3[5] = v11;
  v5 = v8;
  v3[1] = v7;
  v3[2] = v5;
  sub_22983B870((uint64_t)v12);
  sub_22983B8A4((uint64_t)&v13);
  sub_22983B8A4((uint64_t)&v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A680E8);
  sub_22983B90C();
  sub_22983DDC0();
  return swift_release();
}

uint64_t sub_22983B814(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22983B82C()
{
  uint64_t v0;

  sub_22983B08C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_22983B868(uint64_t a1, uint64_t a2)
{
  sub_22983B3B4(a1, a2);
}

uint64_t sub_22983B870(uint64_t a1)
{
  sub_22983B024(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_22983B8A4(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2D06CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22983B90C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A680F0;
  if (!qword_255A680F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A680E8);
    result = MEMORY[0x22E2D06E4](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_255A680F0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2D06D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22983B99C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  void (*v10)(char *, uint64_t);
  char v12;
  uint64_t v13;

  v2 = sub_22983DD30();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v13 - v7, a1, v2);
  sub_22983DD18();
  sub_22983BBB0();
  v9 = sub_22983DDFC();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if ((v9 & 1) != 0)
  {
    v10(v8, v2);
    return 0;
  }
  else
  {
    sub_22983DD24();
    v12 = sub_22983DDFC();
    v10(v6, v2);
    v10(v8, v2);
    return v12 & 1;
  }
}

uint64_t sub_22983BACC(void *a1, __int128 *a2)
{
  void (*v4)(void *);
  void (*v5)(void *);
  id v6;
  uint64_t v8;
  _QWORD v9[3];
  char v10;

  sub_22983B814(a2, (uint64_t)&v8);
  sub_22983B814(a2, (uint64_t)v9);
  v4 = (void (*)(void *))v9[0];
  if ((v10 & 1) != 0)
    v5 = (void (*)(void *))v9[2];
  else
    v5 = (void (*)(void *))v9[0];
  swift_retain();
  swift_retain();
  v6 = objc_msgSend(a1, sel_source);
  if (v6 == (id)1)
  {
    v5(a1);
  }
  else if (!v6)
  {
    v4(a1);
  }
  swift_release();
  return swift_release();
}

unint64_t sub_22983BBB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A68108[0];
  if (!qword_255A68108[0])
  {
    v1 = sub_22983DD30();
    result = MEMORY[0x22E2D06E4](MEMORY[0x24BDF0BD0], v1);
    atomic_store(result, qword_255A68108);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OnCameraCaptureEventModifier.EventHandler(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1)
{
  return sub_22983B08C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22983B024(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22983B024(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_22983B08C(v8, v9, v10, v11, v12);
  return a1;
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

uint64_t assignWithTake for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_22983B08C(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnCameraCaptureEventModifier.EventHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_22983BDF8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_22983BE04(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OnCameraCaptureEventModifier.EventHandler()
{
  return &type metadata for OnCameraCaptureEventModifier.EventHandler;
}

uint64_t sub_22983BE20()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A680E8);
  sub_22983B90C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t VideoPlayer.init(player:videoOverlay:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;

  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for VideoPlayerConfiguration(0, v12, v13, v12);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v20 - v17;
  a2(v16);
  sub_22983DC5C((uint64_t)v11, a1, a3, a4, (uint64_t)v18);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a5, v18, v14);
}

uint64_t VideoPlayer.body.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = type metadata accessor for VideoPlayerConfiguration(0, v5, v6, a4);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, v4);
  return sub_22983C6BC(v9, v5, v6);
}

uint64_t sub_22983BFFC()
{
  return sub_22983DDB4();
}

uint64_t VideoPlayer<>.init(player:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_22983C020()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22983C054()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22983C05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for VideoPlayerConfiguration(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22983C0C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = *(void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = v10;
    v11 = v10;
  }
  return v4;
}

void sub_22983C17C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();

}

uint64_t sub_22983C1BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  *v7 = v8;
  v9 = v8;
  return a1;
}

uint64_t sub_22983C21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  v9 = *v7;
  *v7 = v8;
  v10 = v8;

  return a1;
}

uint64_t sub_22983C284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22983C2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *v7;
  *v7 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_22983C344(uint64_t a1, unsigned int a2, uint64_t a3)
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
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_22983C3C0 + 4 * byte_22983E100[v10]))();
  }
}

void sub_22983C44C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
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
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_22983C540()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x22983C5C4);
}

void sub_22983C548(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x22983C550);
  JUMPOUT(0x22983C5C4);
}

void sub_22983C598()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983C5C4);
}

void sub_22983C5A0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983C5C4);
}

uint64_t sub_22983C5A8(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x22983C5B4);
    *(_QWORD *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
LABEL_6:
    JUMPOUT(0x22983C5C4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for VideoPlayer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VideoPlayer);
}

void sub_22983C5E8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for VideoPlayerBody(255, *a1, a1[1], a4);
  JUMPOUT(0x22E2D06E4);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2D06A8](a1, v6, a5);
}

uint64_t sub_22983C640()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22983DE20();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_22983C6C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, char *a3@<X8>)
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
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  uint64_t v23;

  v4 = v3;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = type metadata accessor for VideoPlayerConfiguration(0, v6, v7, a2);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - v10;
  v13 = type metadata accessor for AVPlayerViewControllerView(0, v6, v7, v12);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v23 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v17, v11, v8);
  MEMORY[0x22E2D06E4](&unk_22983E318, v13);
  v20 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v20(v19, v17, v13);
  v21 = *(void (**)(char *, uint64_t))(v14 + 8);
  v21(v17, v13);
  v20(a3, v19, v13);
  return ((uint64_t (*)(char *, uint64_t))v21)(v19, v13);
}

uint64_t sub_22983C818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;

  v7 = type metadata accessor for VideoPlayerConfiguration(0, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a5, a1, v7);
}

id sub_22983C858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22983D3E4(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_22983C860(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_22983D4D8(a1, a3);
}

id sub_22983C870(void *a1)
{
  return objc_msgSend(a1, sel_setPlayer_, 0);
}

uint64_t sub_22983C884()
{
  return sub_22983DD48();
}

uint64_t sub_22983C8BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2D06E4](&unk_22983E2A0, a3);
  return sub_22983DD84();
}

uint64_t sub_22983C918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2D06E4](&unk_22983E2A0, a3);
  return sub_22983DD54();
}

void sub_22983C974(uint64_t a1)
{
  MEMORY[0x22E2D06E4](&unk_22983E2A0, a1);
  sub_22983DD78();
  __break(1u);
}

void sub_22983C9A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t sub_22983C9C8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v17;
  id v18;
  uint64_t v19;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = *MEMORY[0x24BEE4EA0] & *v0;
  v3 = *(_QWORD *)(v2 + 0x50);
  v4 = sub_22983DE20();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v19 - v13;
  v15 = (char *)v0 + *(_QWORD *)(v2 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v15, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v8, v3);
  if (objc_msgSend(v0, sel_isViewLoaded))
    sub_22983CC7C();
  v17 = *(void **)((char *)v0 + *(_QWORD *)((*v1 & *v0) + 0x60));
  if (v17)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v3);
    v18 = v17;
    sub_22983DCE8();

  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v3);
}

uint64_t sub_22983CB78@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_22983DE20();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_22983CBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for VideoPlayerViewController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  return sub_22983CC7C();
}

void sub_22983CC48(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = a1;
  sub_22983CBF8((uint64_t)v4, v1, v2, v3);

}

uint64_t sub_22983CC7C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v1 = v0;
  v2 = *MEMORY[0x24BEE4EA0] & *v0;
  v3 = *(_QWORD *)(v2 + 0x50);
  v4 = sub_22983DE20();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v34 - v14;
  if (!*(_QWORD *)((char *)v0 + *(_QWORD *)(v2 + 96)))
  {
    sub_22983CB78((uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v15, v8, v3);
      v16 = objc_msgSend(v0, sel_contentOverlayView);
      if (v16)
      {
        v17 = v16;
        sub_22983DCF4();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v15, v3);
        v18 = (void *)sub_22983DCDC();
        v19 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
        objc_msgSend(v18, sel_setBackgroundColor_, v19);

        objc_msgSend(v17, sel_addSubview_, v18);
        objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        v20 = objc_msgSend(v18, sel_centerXAnchor);
        v21 = objc_msgSend(v17, sel_centerXAnchor);
        v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

        objc_msgSend(v22, sel_setActive_, 1);
        v23 = objc_msgSend(v18, sel_centerYAnchor);
        v24 = objc_msgSend(v17, sel_centerYAnchor);
        v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

        objc_msgSend(v25, sel_setActive_, 1);
        v26 = objc_msgSend(v18, sel_widthAnchor);
        v27 = objc_msgSend(v17, sel_widthAnchor);
        v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

        objc_msgSend(v28, sel_setActive_, 1);
        v29 = objc_msgSend(v18, sel_heightAnchor);
        v30 = objc_msgSend(v17, sel_heightAnchor);
        v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

        objc_msgSend(v31, sel_setActive_, 1);
        v32 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
        v33 = *(void **)((char *)v1 + v32);
        *(_QWORD *)((char *)v1 + v32) = v18;

      }
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v3);
    }
  }
  return result;
}

id sub_22983D060(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  objc_super v14;

  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v7 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v3);
  *(_QWORD *)&v3[v7[12]] = 0;
  v8 = v7[10];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(&v3[*(_QWORD *)((*v6 & *(_QWORD *)v3) + 0x68)], 1, 1, v8);
  if (a2)
  {
    v10 = (void *)sub_22983DE08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = (objc_class *)type metadata accessor for VideoPlayerViewController(0, v8, v7[11], v9);
  v14.receiver = v3;
  v14.super_class = v11;
  v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v10, a3);

  return v12;
}

id sub_22983D148(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22983DE14();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return sub_22983D060(v5, v7, a4);
}

id sub_22983D1A4(void *a1)
{
  char *v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  objc_super v10;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1);
  *(_QWORD *)&v1[v4[12]] = 0;
  v5 = v4[10];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(&v1[*(_QWORD *)((*v3 & *(_QWORD *)v1) + 0x68)], 1, 1, v5);
  v7 = (objc_class *)type metadata accessor for VideoPlayerViewController(0, v5, v4[11], v6);
  v10.receiver = v1;
  v10.super_class = v7;
  v8 = objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);

  return v8;
}

id sub_22983D250(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22983D1A4(a3);
}

id sub_22983D274(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_22983D5C4((uint64_t)v3);

  return v4;
}

id sub_22983D2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for VideoPlayerViewController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_22983D2F4(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];

  v3 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x68);
  v4 = sub_22983DE20();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t type metadata accessor for VideoPlayerViewController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VideoPlayerViewController);
}

uint64_t type metadata accessor for VideoPlayerBody(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VideoPlayerBody);
}

uint64_t sub_22983D3A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for AVPlayerViewControllerView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVPlayerViewControllerView);
}

id sub_22983D3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;

  type metadata accessor for VideoPlayerViewController(0, a1, a2, a4);
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v4, sel_setAllowsEnteringFullScreen_, 0);
  objc_msgSend(v4, sel_setAllowsPictureInPicturePlayback_, 0);
  return v4;
}

uint64_t sub_22983D44C(uint64_t a1)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_22983DE20();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(v3, a1, v4);
  swift_endAccess();
  return sub_22983C9C8();
}

uint64_t sub_22983D4D8(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = sub_22983DE20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - v8;
  objc_msgSend(a1, sel_setPlayer_, *(_QWORD *)(v2+ *(int *)(type metadata accessor for VideoPlayerConfiguration(0, v5, *(_QWORD *)(a2 + 24), v10) + 36)));
  v11 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, v2, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v5);
  sub_22983D44C((uint64_t)v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_22983D5C4(uint64_t a1)
{
  char *v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  objc_super v9;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1);
  *(_QWORD *)&v1[v4[12]] = 0;
  v5 = v4[10];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(&v1[*(_QWORD *)((*v3 & *(_QWORD *)v1) + 0x68)], 1, 1, v5);
  v7 = (objc_class *)type metadata accessor for VideoPlayerViewController(0, v5, v4[11], v6);
  v9.receiver = v1;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_initWithPlayerLayerView_, a1);
}

uint64_t sub_22983D664(uint64_t a1, unsigned int a2, uint64_t a3)
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
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_22983D6E0 + 4 * byte_22983E190[v10]))();
  }
}

void sub_22983D76C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
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
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_22983D860()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x22983D8E4);
}

void sub_22983D868(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x22983D870);
  JUMPOUT(0x22983D8E4);
}

void sub_22983D8B8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983D8E4);
}

void sub_22983D8C0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983D8E4);
}

uint64_t sub_22983D8C8(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x22983D8D4);
    *(_QWORD *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
LABEL_6:
    JUMPOUT(0x22983D8E4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

void sub_22983D8FC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AVPlayerViewControllerView(255, *a1, a1[1], a4);
  JUMPOUT(0x22E2D06E4);
}

void sub_22983D924()
{
  JUMPOUT(0x22E2D06E4);
}

uint64_t sub_22983D934()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_22983D944()
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

uint64_t sub_22983D9B8(uint64_t a1, unsigned int a2, uint64_t a3)
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
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_22983DA34 + 4 * byte_22983E370[v10]))();
  }
}

void sub_22983DAC0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
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
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_22983DBB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x22983DC38);
}

void sub_22983DBBC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x22983DBC4);
  JUMPOUT(0x22983DC38);
}

void sub_22983DC0C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983DC38);
}

void sub_22983DC14()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x22983DC38);
}

uint64_t sub_22983DC1C(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x22983DC28);
    *(_QWORD *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
LABEL_6:
    JUMPOUT(0x22983DC38);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for VideoPlayerConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VideoPlayerConfiguration);
}

uint64_t sub_22983DC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  result = type metadata accessor for VideoPlayerConfiguration(0, a3, a4, v9);
  *(_QWORD *)(a5 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t sub_22983DCB8()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22983DCC4()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22983DCD0()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22983DCDC()
{
  return MEMORY[0x24BDECC98]();
}

uint64_t sub_22983DCE8()
{
  return MEMORY[0x24BDECCB0]();
}

uint64_t sub_22983DCF4()
{
  return MEMORY[0x24BDECCD0]();
}

uint64_t sub_22983DD00()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22983DD0C()
{
  return MEMORY[0x24BDF0BB0]();
}

uint64_t sub_22983DD18()
{
  return MEMORY[0x24BDF0BB8]();
}

uint64_t sub_22983DD24()
{
  return MEMORY[0x24BDF0BC0]();
}

uint64_t sub_22983DD30()
{
  return MEMORY[0x24BDF0BC8]();
}

uint64_t sub_22983DD3C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22983DD48()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22983DD54()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22983DD60()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22983DD6C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22983DD78()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22983DD84()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22983DD90()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_22983DD9C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22983DDA8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22983DDB4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22983DDC0()
{
  return MEMORY[0x24BDF32A0]();
}

uint64_t sub_22983DDCC()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_22983DDD8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22983DDE4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22983DDF0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22983DDFC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22983DE08()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22983DE14()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22983DE20()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22983DE2C()
{
  return MEMORY[0x24BEE42C0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

