uint64_t storeEnumTagSinglePayload for FeatureFlag(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
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
  *(_BYTE *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

id sub_1CFABA430()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for BundleToken();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EFBED260 = (uint64_t)result;
  return result;
}

uint64_t sub_1CFABA484()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BundleToken()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier;
}

uint64_t sub_1CFABA4C4(unint64_t a1)
{
  char **v1;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;

  if (a1)
  {
    v3 = __clz(a1);
    v4 = *v1;
    if (v3 - 57 >= 7)
    {
      v5 = (((37 * (70 - v3)) >> 8)
          + (((70 - v3 - ((unsigned __int16)(37 * (70 - v3)) >> 8)) & 0xFE) >> 1)) >> 2;
      v6 = 7 * v5 - 7;
      v7 = v5;
      while (v7 <= v5)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_1CF9559F8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v9 = *((_QWORD *)v4 + 2);
        v8 = *((_QWORD *)v4 + 3);
        if (v9 >= v8 >> 1)
          v4 = sub_1CF9559F8((char *)(v8 > 1), v9 + 1, 1, v4);
        --v7;
        *((_QWORD *)v4 + 2) = v9 + 1;
        v4[v9 + 32] = (a1 >> v6) | 0x80;
        v6 -= 7;
        if (v7 == 1)
          goto LABEL_17;
      }
      __break(1u);
LABEL_17:
      *v1 = v4;
    }
    v14 = a1 & 0x7F;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1CF9559F8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v4 = (char *)result;
    }
    v12 = *((_QWORD *)v4 + 2);
    v15 = *((_QWORD *)v4 + 3);
    v13 = v12 + 1;
    if (v12 >= v15 >> 1)
    {
      result = (uint64_t)sub_1CF9559F8((char *)(v15 > 1), v12 + 1, 1, v4);
      v4 = (char *)result;
    }
  }
  else
  {
    v4 = *v1;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1CF9559F8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v4 = (char *)result;
    }
    v12 = *((_QWORD *)v4 + 2);
    v11 = *((_QWORD *)v4 + 3);
    v13 = v12 + 1;
    if (v12 >= v11 >> 1)
    {
      result = (uint64_t)sub_1CF9559F8((char *)(v11 > 1), v12 + 1, 1, v4);
      v4 = (char *)result;
    }
    v14 = 0;
  }
  *((_QWORD *)v4 + 2) = v13;
  v4[v12 + 32] = v14;
  *v1 = v4;
  return result;
}

void sub_1CFABA6B4()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v2 >> 1;
  if (v1 == v2 >> 1)
  {
LABEL_2:
    v4 = 0x80000001CFB32060;
    v5 = 273;
LABEL_3:
    v6 = 0xD000000000000026;
    goto LABEL_4;
  }
  if (v1 >= (uint64_t)(v2 >> 1))
    goto LABEL_21;
  v9 = v0[1];
  v10 = *(char *)(v9 + v1);
  v11 = v0[2];
  if (v10 < 0)
  {
    v11 = v1 + 1;
    if (v1 + 1 == v3)
      goto LABEL_2;
    v5 = 273;
    while (v11 < v3)
    {
      if ((*(char *)(v9 + v11) & 0x80000000) == 0)
        goto LABEL_7;
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_20;
      ++v11;
      if (v15 == v3)
      {
        v4 = 0x80000001CFB32060;
        goto LABEL_3;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_7:
  v12 = v11 + 1;
  if (v11 + 1 < v1)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v11 < -1)
  {
LABEL_23:
    __break(1u);
    return;
  }
  v6 = 0xD00000000000002DLL;
  v4 = 0x80000001CFB32090;
  v5 = 281;
  if (v10 == -128 || v1 == v12)
  {
LABEL_4:
    type metadata accessor for ASN1Error.Backing();
    v7 = swift_allocObject();
    *(_BYTE *)(v7 + 16) = 1;
    *(_QWORD *)(v7 + 24) = v6;
    *(_QWORD *)(v7 + 32) = v4;
    *(_QWORD *)(v7 + 40) = 0xD000000000000024;
    *(_QWORD *)(v7 + 48) = 0x80000001CFB32010;
    *(_QWORD *)(v7 + 56) = v5;
    sub_1CF921074();
    swift_allocError();
    *v8 = v7;
    swift_willThrow();
    return;
  }
  v13 = v0[3] & 1 | (2 * v12);
  v0[2] = v12;
  v14 = swift_unknownObjectRetain();
  sub_1CFABABDC(v14, v9, v1, v13);
}

uint64_t sub_1CFABA850(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t i;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_1CF982F2C(a1, a2, a3);
  v4 = (_QWORD *)result;
  v5 = *(_QWORD *)(result + 16);
  if (v5 < 2)
    return (uint64_t)v4;
  v6 = 0;
  v7 = v5 >> 1;
  for (i = v5 + 3; ; --i)
  {
    if (v6 == i - 4)
      goto LABEL_5;
    v9 = v4[2];
    if (v6 >= v9)
      break;
    if (i - 4 >= v9)
      goto LABEL_12;
    v10 = v4[v6 + 4];
    v11 = v4[i];
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1CFAA6048(v4);
      v4 = (_QWORD *)result;
    }
    v4[v6 + 4] = v11;
    v4[i] = v10;
LABEL_5:
    if (v7 == ++v6)
      return (uint64_t)v4;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1CFABA90C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1CFB02A90();
  v2 = *(_QWORD *)(a1 + 16);
  sub_1CFB02A9C();
  if (v2)
  {
    v3 = a1 + 32;
    do
    {
      v3 += 8;
      sub_1CFB02A9C();
      --v2;
    }
    while (v2);
  }
  return sub_1CFB02ACC();
}

uint64_t sub_1CFABA978()
{
  uint64_t *v0;

  return sub_1CFABA90C(*v0);
}

uint64_t sub_1CFABA980()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  result = sub_1CFB02A9C();
  if (v2)
  {
    v4 = v1 + 32;
    do
    {
      v4 += 8;
      result = sub_1CFB02A9C();
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1CFABA9D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1CFB02A90();
  v2 = *(_QWORD *)(v1 + 16);
  sub_1CFB02A9C();
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      v3 += 8;
      sub_1CFB02A9C();
      --v2;
    }
    while (v2);
  }
  return sub_1CFB02ACC();
}

BOOL sub_1CFABAA38(_QWORD **a1, _QWORD **a2)
{
  return sub_1CF9D71E8(*a1, *a2);
}

uint64_t sub_1CFABAA44(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1CF960FD0(0, v1, 0);
    v2 = 0;
    do
    {
      v3 = sub_1CFB027F0();
      v5 = v4;
      v7 = *(_QWORD *)(v11 + 16);
      v6 = *(_QWORD *)(v11 + 24);
      if (v7 >= v6 >> 1)
        sub_1CF960FD0(v6 > 1, v7 + 1, 1);
      ++v2;
      *(_QWORD *)(v11 + 16) = v7 + 1;
      v8 = v11 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v3;
      *(_QWORD *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF96201C();
  v9 = sub_1CFB019BC();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1CFABAB8C()
{
  uint64_t *v0;

  return sub_1CFABAA44(*v0);
}

unint64_t sub_1CFABAB98()
{
  unint64_t result;

  result = qword_1EFBC4ED8;
  if (!qword_1EFBC4ED8)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB1FD70, &type metadata for ASN1ObjectIdentifier);
    atomic_store(result, &qword_1EFBC4ED8);
  }
  return result;
}

void sub_1CFABABDC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v7 = 7 * v5;
  if ((unsigned __int128)(v5 * (__int128)7) >> 64 != (7 * v5) >> 63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFADD__(v7, 7))
  {
    if (v7 + 7 > 71)
    {
      type metadata accessor for ASN1Error.Backing();
      v8 = swift_allocObject();
      *(_BYTE *)(v8 + 16) = 1;
      *(_QWORD *)(v8 + 24) = 0xD000000000000021;
      *(_QWORD *)(v8 + 32) = 0x80000001CFB320C0;
      *(_QWORD *)(v8 + 40) = 0xD000000000000024;
      *(_QWORD *)(v8 + 48) = 0x80000001CFB32010;
      *(_QWORD *)(v8 + 56) = 296;
      sub_1CF921074();
      swift_allocError();
      *v9 = v8;
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    v11 = sub_1CFABA850(0, v7, 7);
    v12 = *(_QWORD *)(v11 + 16);
    if (!v12)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v13 = 0;
    v14 = 0;
    if (a3 <= v4)
      v15 = v4;
    else
      v15 = a3;
    v16 = v15 - a3;
    while (v16 > v12 - 1)
    {
      v18 = *(_QWORD *)(v11 + 8 * v14 + 32);
      if (v18 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        v17 = 0;
      }
      else
      {
        v19 = *(_BYTE *)(a2 + a3 + v14) & 0x7F;
        if ((v18 & 0x8000000000000000) != 0)
        {
          v21 = v19 >> -(char)v18;
          if (v18 <= 0xFFFFFFFFFFFFFFC0)
            v17 = 0;
          else
            v17 = v21;
        }
        else
        {
          v20 = v19 << v18;
          if (v18 >= 0x40)
            v17 = 0;
          else
            v17 = v20;
        }
      }
      ++v14;
      v13 |= v17;
      if (v12 == v14)
        goto LABEL_22;
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_1CFABADA8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;

  result = *(_QWORD *)a1;
  if (result != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    v16 = sub_1CF9A2A08();
    v18 = v17;
    type metadata accessor for ASN1Error.Backing();
    v19 = swift_allocObject();
    *(_BYTE *)(v19 + 16) = 0;
    *(_QWORD *)(v19 + 24) = v16;
    *(_QWORD *)(v19 + 32) = v18;
    *(_QWORD *)(v19 + 40) = 0xD000000000000024;
    *(_QWORD *)(v19 + 48) = 0x80000001CFB32010;
    *(_QWORD *)(v19 + 56) = 38;
    sub_1CF921074();
    swift_allocError();
    *v20 = v19;
    swift_willThrow();
    return sub_1CF9210B8(a1);
  }
  if (*(_BYTE *)(a1 + 56) != 1)
  {
    __break(1u);
    return result;
  }
  v10 = v4;
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(_QWORD *)(a1 + 40);
  v11 = (v34 >> 1) - v33;
  if (__OFSUB__(v34 >> 1, v33))
    goto LABEL_25;
  swift_unknownObjectRetain();
  v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v11 >= 1)
  {
    while (1)
    {
      v11 = v10;
      sub_1CFABA6B4();
      if (v10)
      {
        sub_1CF9210B8(a1);
        goto LABEL_23;
      }
      v14 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_1CF955D30(0, v12[2] + 1, 1, v12);
      v5 = v12[2];
      v15 = v12[3];
      v3 = v5 + 1;
      if (v5 >= v15 >> 1)
        v12 = sub_1CF955D30((_QWORD *)(v15 > 1), v5 + 1, 1, v12);
      v12[2] = v3;
      v12[v5 + 4] = v14;
      if (__OFSUB__(v34 >> 1, v33))
        break;
      if ((uint64_t)((v34 >> 1) - v33) <= 0)
        goto LABEL_17;
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v3 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_17:
  v21 = sub_1CF955D30(0, v3 + 1, 0, MEMORY[0x1E0DEE9D8]);
  v11 = (uint64_t)v21;
  v22 = v12[2];
  if (v22)
  {
    v6 = v12[4];
    v31 = (2 * v22) | 1;
    v32 = (uint64_t)(v12 + 4);
    v7 = v6 / 0x28;
    v5 = v21[2];
    v30 = v21[3];
    v23 = v30 >> 1;
    v3 = v5 + 1;
    swift_bridgeObjectRetain();
    if (v30 >> 1 > v5)
    {
LABEL_19:
      v24 = v6 - 40 * v7;
      *(_QWORD *)(v11 + 16) = v3;
      *(_QWORD *)(v11 + 8 * v5 + 32) = v7;
      v25 = v5 + 2;
      if (v23 < (uint64_t)(v5 + 2))
      {
        v29 = sub_1CF955D30((_QWORD *)(v30 > 1), v5 + 2, 1, (_QWORD *)v11);
        v25 = v5 + 2;
        v11 = (uint64_t)v29;
      }
      *(_QWORD *)(v11 + 16) = v25;
      *(_QWORD *)(v11 + 8 * v3 + 32) = v24;
      v26 = swift_bridgeObjectRetain();
      sub_1CF97F30C(v26, v32, 1, v31);
      swift_bridgeObjectRelease();
      sub_1CF9210B8(a1);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      return v11;
    }
LABEL_26:
    v11 = (uint64_t)sub_1CF955D30((_QWORD *)(v30 > 1), v3, 1, (_QWORD *)v11);
    v30 = *(_QWORD *)(v11 + 24);
    v23 = v30 >> 1;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for ASN1Error.Backing();
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = 1;
  *(_QWORD *)(v27 + 24) = 0xD000000000000016;
  *(_QWORD *)(v27 + 32) = 0x80000001CFB32040;
  *(_QWORD *)(v27 + 40) = 0xD000000000000024;
  *(_QWORD *)(v27 + 48) = 0x80000001CFB32010;
  *(_QWORD *)(v27 + 56) = 79;
  sub_1CF921074();
  swift_allocError();
  *v28 = v27;
  swift_willThrow();
  sub_1CF9210B8(a1);
  swift_bridgeObjectRelease();
LABEL_23:
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t AsyncQueue.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AsyncQueue.init()();
  return v0;
}

uint64_t AsyncQueue.init()()
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
  char *v38;
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
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v73 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B0);
  v10 = *(_QWORD *)(v75 - 8);
  MEMORY[0x1E0C80A78](v75, v11, v12, v13, v14, v15, v16, v17);
  v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9052C8);
  v20 = *(_QWORD *)(v72 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  v29 = MEMORY[0x1E0C80A78](v72, v22, v23, v24, v25, v26, v27, v28);
  v71 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v29, v30, v31, v32, v33, v34, v35, v36);
  v38 = (char *)&v70 - v37;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052C0);
  v47 = MEMORY[0x1E0C80A78](v39, v40, v41, v42, v43, v44, v45, v46);
  v49 = (char *)&v70 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v47, v50, v51, v52, v53, v54, v55, v56);
  v58 = (char *)&v70 - v57;
  v74 = v0;
  swift_defaultActor_initialize();
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  v60 = *(_QWORD *)(v59 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v58, 1, 1, v59);
  v76 = v58;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9050E8);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v19, *MEMORY[0x1E0DF07B8], v75);
  sub_1CFB01E18();
  sub_1CFABB538((uint64_t)v58, (uint64_t)v49);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v60 + 48))(v49, 1, v59);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v62 = v74;
    (*(void (**)(uint64_t, char *, uint64_t))(v60 + 32))(v74 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__streamContinuation, v49, v59);
    v63 = sub_1CFB01DD0();
    v64 = (uint64_t)v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v73, 1, 1, v63);
    v66 = v71;
    v65 = v72;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v71, v38, v72);
    v67 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v68 = swift_allocObject();
    *(_QWORD *)(v68 + 16) = 0;
    *(_QWORD *)(v68 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v68 + v67, v66, v65);
    v69 = sub_1CF959C4C(v64, (uint64_t)&unk_1EFBC4EE8, v68);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v38, v65);
    *(_QWORD *)(v62 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__task) = v69;
    sub_1CFABB918((uint64_t)v58);
    return v62;
  }
  return result;
}

uint64_t sub_1CFABB4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1CFABB918(a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_1CFABB530(uint64_t a1)
{
  uint64_t v1;

  return sub_1CFABB4C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1CFABB538(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CFABB580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9050D0);
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CFABB5E4()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9052C8);
  sub_1CFB01E00();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_1CFABB66C;
  return sub_1CFB01E0C();
}

uint64_t sub_1CFABB66C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFABB6C0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v5)(void);

  v1 = *(int **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 72) = v1;
  *(_QWORD *)(v0 + 80) = v2;
  if (!v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    goto LABEL_5;
  }
  if ((sub_1CFB01E30() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    sub_1CF99BC44((uint64_t)v1);
LABEL_5:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = (uint64_t (*)(void))((char *)v1 + *v1);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v4;
  *v4 = v0;
  v4[1] = sub_1CFABB77C;
  return v5();
}

uint64_t sub_1CFABB77C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  v3 = *v0;
  swift_task_dealloc();
  sub_1CF99BC44(v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 64) = v4;
  *v4 = v3;
  v4[1] = sub_1CFABB66C;
  return sub_1CFB01E0C();
}

uint64_t sub_1CFABB818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9052C8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CFABB890(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9052C8) - 8)
                          + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1CF933384;
  return sub_1CFABB580(a1, v5, v6, v7);
}

uint64_t sub_1CFABB918(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AsyncQueue.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__streamContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  sub_1CFB01DE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t AsyncQueue.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__streamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  sub_1CFB01DE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1CFABBA40()
{
  return sub_1CFB01E24();
}

uint64_t sub_1CFABBA6C(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  _QWORD v17[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a1;
  *(_QWORD *)(v15 + 24) = a2;
  v17[0] = &unk_1EFBC4EF8;
  v17[1] = v15;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  sub_1CFB01DDC();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v14, v4);
}

uint64_t sub_1CFABBB44(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_1CF933384;
  return v5();
}

uint64_t sub_1CFABBB98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFABBBBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CF933384;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFBC4EF0 + dword_1EFBC4EF0))(a1, v4);
}

uint64_t sub_1CFABBC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CFABBC4C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1CFABBCE8;
  return sub_1CFB02808();
}

uint64_t sub_1CFABBCE8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CFABBD38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char *v18;
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
  char *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char *v38;

  v35 = a3;
  v36 = a4;
  v8 = sub_1CFB01DA0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)v34 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052A8);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21, v22, v23, v24, v25, v26, v27);
  v29 = (char *)v34 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[1] = a2 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__streamContinuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v18, a1, v8);
  v30 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v31 = (char *)swift_allocObject();
  v32 = v35;
  *((_QWORD *)v31 + 2) = a5;
  *((_QWORD *)v31 + 3) = v32;
  *((_QWORD *)v31 + 4) = v36;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v31[v30], v18, v8);
  v37 = &unk_1EFBC4F38;
  v38 = v31;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  sub_1CFB01DDC();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v29, v19);
}

uint64_t sub_1CFABBEC0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CFABBD38(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1CFABBECC(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(_QWORD *)(a5 - 8);
  v5[5] = swift_task_alloc();
  v7 = swift_task_alloc();
  v5[6] = v7;
  v10 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v8 = (_QWORD *)swift_task_alloc();
  v5[7] = v8;
  *v8 = v5;
  v8[1] = sub_1CFABBF68;
  return v10(v7);
}

uint64_t sub_1CFABBF68()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFABBFBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v0 + 40), v1, v2);
  sub_1CFB01DA0();
  sub_1CFB01D94();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFABC05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CFABC07C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_1CFABC118;
  return sub_1CFB02994();
}

uint64_t sub_1CFABC118()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CFABC18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char *v18;
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
  char *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char *v38;

  v35 = a3;
  v36 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED904E60);
  v8 = sub_1CFB01DA0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)v34 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052A8);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21, v22, v23, v24, v25, v26, v27);
  v29 = (char *)v34 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[1] = a2 + OBJC_IVAR____TtC13CoreIDVShared10AsyncQueue__streamContinuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v18, a1, v8);
  v30 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v31 = (char *)swift_allocObject();
  v32 = v35;
  *((_QWORD *)v31 + 2) = a5;
  *((_QWORD *)v31 + 3) = v32;
  *((_QWORD *)v31 + 4) = v36;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v31[v30], v18, v8);
  v37 = &unk_1EFBC4F28;
  v38 = v31;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9052B8);
  sub_1CFB01DDC();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v29, v19);
}

uint64_t sub_1CFABC31C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CFABC18C(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1CFABC328(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v5[3] = a4;
  v5[4] = a5;
  v5[5] = *(_QWORD *)(a5 - 8);
  v5[6] = swift_task_alloc();
  v7 = swift_task_alloc();
  v5[7] = v7;
  v10 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v8 = (_QWORD *)swift_task_alloc();
  v5[8] = v8;
  *v8 = v5;
  v8[1] = sub_1CFABC3C4;
  return v10(v7);
}

uint64_t sub_1CFABC3C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFABC428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v0 + 48), v1, v2);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED904E60);
  sub_1CFB01DA0();
  sub_1CFB01D94();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFABC4D0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 72);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED904E60);
  sub_1CFB01DA0();
  sub_1CFB01D88();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AsyncQueue.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CFABC55C()
{
  return type metadata accessor for AsyncQueue();
}

uint64_t type metadata accessor for AsyncQueue()
{
  uint64_t result;

  result = qword_1ED905078;
  if (!qword_1ED905078)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1CFABC5A0()
{
  unint64_t v0;

  sub_1CFABC768();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AsyncQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncQueue.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AsyncQueue.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of AsyncQueue.async(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AsyncQueue.async<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 128)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 128));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1CF933384;
  return v12(a1, a2, a3, a4);
}

{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 136)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 136));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1CF92F754;
  return v12(a1, a2, a3, a4);
}

void sub_1CFABC768()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED9050A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED9050E8);
    v0 = sub_1CFB01DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED9050A0);
  }
}

uint64_t sub_1CFABC7C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED904E60);
  v1 = sub_1CFB01DA0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CFABC854(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED904E60);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1CFB01DA0() - 8) + 80);
  v6 = (int *)v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v5 + 40) & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1CF92F754;
  return sub_1CFABC328(a1, v6, v7, v8, v4);
}

uint64_t sub_1CFABC904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1CFB01DA0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CFABC98C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1CFB01DA0() - 8) + 80);
  v6 = (int *)v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v5 + 40) & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1CF933384;
  return sub_1CFABBECC(a1, v6, v7, v8, v4);
}

void sub_1CFABCA34(__int128 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  __int128 v108;
  SecCertificateRef_optional v109;
  SecCertificateRef value;
  __SecKey *v111;
  __SecKey *v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  char *v119;
  _QWORD v120[21];
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  char v138;
  uint64_t v139;

  v4 = v3;
  v122 = a2;
  v120[15] = a3;
  v139 = *MEMORY[0x1E0C80C00];
  v125 = sub_1CFB015E4();
  v124 = *(_QWORD *)(v125 - 8);
  MEMORY[0x1E0C80A78](v125, v6, v7, v8, v9, v10, v11, v12);
  v126 = (char *)v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_1CFB01638();
  v120[20] = *(_QWORD *)(v121 - 8);
  MEMORY[0x1E0C80A78](v121, v14, v15, v16, v17, v18, v19, v20);
  v129 = (char *)v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = sub_1CFB0168C();
  v128 = *(_QWORD *)(v127 - 8);
  v29 = MEMORY[0x1E0C80A78](v127, v22, v23, v24, v25, v26, v27, v28);
  v123 = (char *)v120 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v29, v31, v32, v33, v34, v35, v36, v37);
  v133 = (char *)v120 - v38;
  v39 = sub_1CFB012CC();
  v131 = *(_QWORD *)(v39 - 8);
  v47 = MEMORY[0x1E0C80A78](v39, v40, v41, v42, v43, v44, v45, v46);
  v120[19] = (char *)v120 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v47, v49, v50, v51, v52, v53, v54, v55);
  v130 = (char *)v120 - v56;
  v134 = sub_1CFB01878();
  v64 = MEMORY[0x1E0C80A78](v134, v57, v58, v59, v60, v61, v62, v63);
  v120[18] = (char *)v120 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = MEMORY[0x1E0C80A78](v64, v66, v67, v68, v69, v70, v71, v72);
  v120[17] = (char *)v120 - v74;
  MEMORY[0x1E0C80A78](v73, v75, v76, v77, v78, v79, v80, v81);
  v132 = sub_1CFB0147C();
  v89 = MEMORY[0x1E0C80A78](v132, v82, v83, v84, v85, v86, v87, v88);
  v120[16] = (char *)v120 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = MEMORY[0x1E0C80A78](v89, v91, v92, v93, v94, v95, v96, v97);
  v100 = (char *)v120 - v99;
  MEMORY[0x1E0C80A78](v98, v101, v102, v103, v104, v105, v106, v107);
  v108 = a1[1];
  v136 = *a1;
  v137 = v108;
  v138 = *((_BYTE *)a1 + 32);
  v109.value = SecTrustRef.getLeafCertificate()().value;
  if (v109.value)
  {
    value = v109.value;
    v120[13] = v39;
    v111 = SecCertificateCopyKey(v109.value);
    if (v111)
    {
      v112 = v111;
      v120[14] = copyPublicKeyDataFromSecKeyPublic(_:)(v111);
      v114 = v113;

      if (v114 >> 60 != 15)
      {
        v120[10] = sub_1CF920A48(&qword_1EFBBE568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
        sub_1CFB01470();
        v120[12] = v114;
        v120[11] = value;
        v119 = (char *)&loc_1CFABCF00 + *((int *)qword_1CFABE210 + (v114 >> 62));
        v120[3] = v100;
        v120[8] = v4;
        __asm { BR              X10 }
      }
    }
    LOWORD(v135) = 242;
    v115 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000035, 0x80000001CFB25900, (__int16 *)&v135, 0, v115, 0xD000000000000051, 0x80000001CFB25540, v116, 0xD000000000000024, 0x80000001CFB258D0, 580);
    swift_willThrow();

  }
  else
  {
    LOWORD(v135) = 261;
    v117 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000029, 0x80000001CFB258A0, (__int16 *)&v135, 0, v117, 0xD000000000000051, 0x80000001CFB25540, v118, 0xD000000000000024, 0x80000001CFB258D0, 576);
    swift_willThrow();
  }
}

void sub_1CFABE250(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v3;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  _OWORD v25[6];
  _OWORD v26[6];

  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v8 = *(_OWORD *)(a1 + 56);
  v26[2] = *(_OWORD *)(a1 + 40);
  v26[3] = v8;
  v9 = *(_OWORD *)(a1 + 88);
  v26[4] = *(_OWORD *)(a1 + 72);
  v26[5] = v9;
  v10 = *(_OWORD *)(a1 + 24);
  v26[0] = *(_OWORD *)(a1 + 8);
  v26[1] = v10;
  v11 = *(_OWORD *)(a1 + 56);
  v25[2] = *(_OWORD *)(a1 + 40);
  v25[3] = v11;
  v12 = *(_OWORD *)(a1 + 88);
  v25[4] = *(_OWORD *)(a1 + 72);
  v25[5] = v12;
  v13 = *(_OWORD *)(a1 + 24);
  v25[0] = *(_OWORD *)(a1 + 8);
  v25[1] = v13;
  sub_1CFAC073C((uint64_t *)v26, (void (*)(uint64_t, uint64_t))sub_1CF9239E0, (void (*)(uint64_t, uint64_t))sub_1CF92F5C8);
  v14 = HPKESuiteKwV1.openMessageHPKEWithoutDecoding(data:params:authenticationContext:)(v6, v7, (uint64_t *)v25, a2);
  if (v3)
  {
    sub_1CFAC073C((uint64_t *)v26, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0);
    LOWORD(v25[0]) = 0;
    v22 = v3;
    v23 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v3, 0, 0xE000000000000000, (__int16 *)v25, 0, v23, 0xD000000000000051, 0x80000001CFB25540, v24, 0xD000000000000038, 0x80000001CFB25970, 639);
    swift_willThrow();

  }
  else
  {
    v16 = (uint64_t)v14;
    v17 = v15;
    sub_1CFAC073C((uint64_t *)v26, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0);
    v18 = a3[3];
    v19 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v18);
    v20 = *(void (**)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v19 + 8);
    v21 = sub_1CFAC0984();
    v20(&type metadata for DigitalPresentmentResponseTopics, v16, v17, &type metadata for DigitalPresentmentResponseTopics, v21, v18, v19);
    sub_1CF923A24(v16, v17);
  }
}

uint64_t DigitalPresentmentResponseTopics.identity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v5 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CFABE4B8()
{
  return 0x797469746E656469;
}

uint64_t sub_1CFABE4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x797469746E656469 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1CFB028B0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1CFABE564()
{
  sub_1CFABE6D4();
  return sub_1CFB02B74();
}

uint64_t sub_1CFABE58C()
{
  sub_1CFABE6D4();
  return sub_1CFB02B80();
}

uint64_t DigitalPresentmentResponseTopics.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
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
  uint64_t v14;
  char v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC4F40);
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *v1;
  v14 = *((_QWORD *)v1 + 2);
  v13 = *((_QWORD *)v1 + 3);
  v15 = *((_BYTE *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CFABE6D4();
  sub_1CFB02B5C();
  v19 = v17;
  v20 = v14;
  v21 = v13;
  v22 = v15;
  sub_1CFABE718();
  sub_1CFB027CC();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v3);
}

unint64_t sub_1CFABE6D4()
{
  unint64_t result;

  result = qword_1EFBC4F48;
  if (!qword_1EFBC4F48)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB1FFB8, &type metadata for DigitalPresentmentResponseTopics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F48);
  }
  return result;
}

unint64_t sub_1CFABE718()
{
  unint64_t result;

  result = qword_1EFBC4F50;
  if (!qword_1EFBC4F50)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013Response, &type metadata for ISO18013Response);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F50);
  }
  return result;
}

uint64_t DigitalPresentmentResponseTopics.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char v17;
  __int128 v18;
  _QWORD v20[3];
  __int128 v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC4F58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7, v8, v9, v10, v11, v12, v13);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CFABE6D4();
  sub_1CFB02B2C();
  if (!v2)
  {
    sub_1CFABE88C();
    sub_1CFB02724();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
    v16 = v20[2];
    v17 = v22;
    v18 = v21;
    *(_QWORD *)a2 = v20[1];
    *(_QWORD *)(a2 + 8) = v16;
    *(_OWORD *)(a2 + 16) = v18;
    *(_BYTE *)(a2 + 32) = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1CFABE88C()
{
  unint64_t result;

  result = qword_1EFBC4F60;
  if (!qword_1EFBC4F60)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013Response, &type metadata for ISO18013Response);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F60);
  }
  return result;
}

uint64_t sub_1CFABE8D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DigitalPresentmentResponseTopics.init(from:)(a1, a2);
}

uint64_t sub_1CFABE8E4(_QWORD *a1)
{
  return DigitalPresentmentResponseTopics.encode(to:)(a1);
}

__n128 DigitalPresentmentResponseCryptor.init(sessionTranscript:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = v3;
  result = *(__n128 *)(a1 + 48);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

void (*DigitalPresentmentResponseCryptor.encrypt(_:to:)(uint64_t *a1, uint64_t a2))(char *, uint64_t)
{
  void (**v2)(uint64_t, uint64_t);
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
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(_QWORD *, _QWORD);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *, uint64_t);
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  _QWORD *v82;
  int *v83;
  unint64_t v84;
  unint64_t v85;
  char *v86;
  void (**v87)(char *, uint64_t);
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t, uint64_t);
  id v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  _QWORD *v113;
  void (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t, uint64_t);
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t);
  void (*v122)(char *, uint64_t);
  unint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[5];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _OWORD v137[4];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _OWORD v146[2];
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  uint64_t v151;

  v112 = a2;
  v4 = sub_1CFB01608();
  v109 = *(_QWORD *)(v4 - 8);
  v110 = v4;
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v111 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CFB015F0();
  v105 = *(_QWORD *)(v13 - 8);
  v106 = v13;
  MEMORY[0x1E0C80A78](v13, v14, v15, v16, v17, v18, v19, v20);
  v108 = (char *)&v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1CFB015FC();
  v102 = *(_QWORD *)(v22 - 8);
  v103 = v22;
  MEMORY[0x1E0C80A78](v22, v23, v24, v25, v26, v27, v28, v29);
  v104 = (char *)&v99 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = type metadata accessor for HPKESuiteKwV1();
  MEMORY[0x1E0C80A78](v107, v31, v32, v33, v34, v35, v36, v37);
  v113 = (uint64_t *)((char *)&v99 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  v125 = sub_1CFB012CC();
  v122 = *(void (**)(char *, uint64_t))(v125 - 8);
  MEMORY[0x1E0C80A78](v125, v39, v40, v41, v42, v43, v44, v45);
  v124 = (char *)&v99 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1CFB02550();
  v48 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47, v49, v50, v51, v52, v53, v54, v55);
  v57 = (char *)&v99 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = *a1;
  v59 = a1[1];
  v61 = a1[2];
  v60 = a1[3];
  v62 = *((_BYTE *)a1 + 32);
  v63 = *v2;
  v120 = (uint64_t)v2[1];
  v121 = v63;
  v64 = v2[2];
  v118 = v2[3];
  v119 = v64;
  v65 = v2[4];
  v116 = v2[5];
  v117 = v65;
  v66 = v2[6];
  v114 = v2[7];
  v115 = v66;
  *(_QWORD *)&v147 = v58;
  *((_QWORD *)&v147 + 1) = v59;
  v148 = v61;
  v149 = v60;
  v150 = v62;
  v101 = sub_1CFB0114C();
  swift_allocObject();
  v126 = v60;
  swift_bridgeObjectRetain();
  v151 = v59;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v67 = sub_1CFB01140();
  if (qword_1EFBBD448 != -1)
    swift_once();
  v127 = v61;
  v68 = __swift_project_value_buffer(v47, (uint64_t)qword_1EFBC4768);
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v57, v68, v47);
  *((_QWORD *)&v130 + 1) = &type metadata for ISO18013PresentmentType;
  LOBYTE(v129) = 1;
  v69 = v67;
  v70 = (void (*)(_QWORD *, _QWORD))sub_1CFB01134();
  sub_1CFA90C00((uint64_t)&v129, (uint64_t)v57);
  v70(v128, 0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v71 = v125;
  v72 = __swift_project_value_buffer(v125, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v73 = (uint64_t)v122;
  v74 = v124;
  v100 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v122 + 2);
  v100(v124, v72, v71);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CF9CBBB4();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v75 = *(void (**)(char *, uint64_t))(v73 + 8);
  v75(v74, v71);
  *(_QWORD *)&v129 = v121;
  *((_QWORD *)&v129 + 1) = v120;
  *(_QWORD *)&v130 = v119;
  *((_QWORD *)&v130 + 1) = v118;
  *(_QWORD *)&v131 = v117;
  *((_QWORD *)&v131 + 1) = v116;
  *(_QWORD *)&v132 = v115;
  *((_QWORD *)&v132 + 1) = v114;
  v76 = v123;
  v77 = sub_1CFABF334();
  v79 = v69;
  v80 = (void *)v76;
  if (v76)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
LABEL_10:
    LOWORD(v129) = 0;
    v93 = v80;
    v94 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v80, 0, 0xE000000000000000, (__int16 *)&v129, 0, v94, 0xD00000000000006ALL, 0x80000001CFB32130, v95, 0x2874707972636E65, 0xEE00293A6F743A5FLL, 60);
    swift_willThrow();

    return v75;
  }
  v120 = v72;
  v121 = (void (*)(uint64_t, uint64_t))v75;
  v81 = v79;
  v82 = v113;
  *v113 = &type metadata for AEADScheme_AES_128_GCM;
  v82[1] = &off_1E8CDFB60;
  v83 = (int *)v107;
  v122 = (void (*)(char *, uint64_t))((char *)v82 + *(int *)(v107 + 20));
  v123 = 0;
  v84 = v78;
  v75 = (void (*)(char *, uint64_t))v77;
  (*(void (**)(char *, _QWORD, uint64_t))(v102 + 104))(v104, *MEMORY[0x1E0CA95F0], v103);
  (*(void (**)(char *, _QWORD, uint64_t))(v105 + 104))(v108, *MEMORY[0x1E0CA95D0], v106);
  (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v111, *MEMORY[0x1E0CA9608], v110);
  sub_1CF9239E0((uint64_t)v75, v84);
  v85 = v84;
  sub_1CFB015D8();
  *(_OWORD *)((char *)v82 + v83[7]) = xmmword_1CFB05A20;
  v86 = (char *)v82 + v83[8];
  *(_QWORD *)v86 = 0;
  *((_QWORD *)v86 + 1) = 0;
  v86[16] = -1;
  v87 = (void (**)(char *, uint64_t))((char *)v82 + v83[6]);
  *v87 = v75;
  v87[1] = (void (*)(char *, uint64_t))v84;
  v128[3] = v101;
  v128[4] = &protocol witness table for CBOREncoder;
  v128[0] = v81;
  swift_retain();
  v88 = v123;
  sub_1CFABCA34(&v147, (uint64_t)v128, (uint64_t)&v129);
  v80 = (void *)v88;
  if (v88)
  {
    sub_1CF923A24((uint64_t)v75, v85);
    swift_release();
    sub_1CFAC0588((uint64_t)v82);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v122 = v75;
  v123 = v85;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v144 = v135;
  v145 = v136;
  v146[0] = v137[0];
  *(_OWORD *)((char *)v146 + 9) = *(_OWORD *)((char *)v137 + 9);
  v140 = v131;
  v141 = v132;
  v142 = v133;
  v143 = v134;
  v138 = v129;
  v139 = v130;
  v90 = (uint64_t)v124;
  v89 = v125;
  v91 = v120;
  v92 = (void (*)(uint64_t, uint64_t, uint64_t))v100;
  v100(v124, v120, v125);
  sub_1CFAC0600((uint64_t)&v138, (void (*)(uint64_t, uint64_t))sub_1CF9239E0, (void (*)(uint64_t, uint64_t))sub_1CF92F5C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC05C4);
  sub_1CF9CAFC0(v90, &v138);
  sub_1CFAC0600((uint64_t)&v138, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
  v121(v90, v89);
  v135 = v144;
  v136 = v145;
  v137[0] = v146[0];
  *(_OWORD *)((char *)v137 + 9) = *(_OWORD *)((char *)v146 + 9);
  v131 = v140;
  v132 = v141;
  v133 = v142;
  v134 = v143;
  v129 = v138;
  v130 = v139;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC0920);
  sub_1CF931BE4(&qword_1EFBC4F68, &qword_1EFBC0920, (uint64_t)&protocol conformance descriptor for HPKEEnvelope<A>);
  v75 = (void (*)(char *, uint64_t))sub_1CFB01128();
  v98 = v97;
  v92(v90, v91, v89);
  sub_1CF9239E0((uint64_t)v75, v98);
  sub_1CF9CAFE0(v90, (uint64_t)v75, v98);
  sub_1CF923A24((uint64_t)v75, v98);
  sub_1CFAC0600((uint64_t)&v138, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
  swift_release();
  sub_1CF923A24((uint64_t)v122, v123);
  v121(v90, v89);
  sub_1CFAC0588((uint64_t)v113);
  return v75;
}

uint64_t sub_1CFABF17C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1CFAC09C8();
  v0 = sub_1CFB01128();
  v2 = v1;
  sub_1CFB02388();
  sub_1CFB01B30();
  sub_1CFA72450(v0, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
  sub_1CFB019BC();
  swift_bridgeObjectRelease();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  sub_1CF923A24(v0, v2);
  return 0;
}

uint64_t sub_1CFABF334()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[8];
  uint64_t v15;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v7 = v0[6];
  v8 = v0[7];
  sub_1CFB0114C();
  swift_allocObject();
  sub_1CFB01140();
  v14[0] = v2;
  v14[1] = v1;
  v14[2] = v3;
  v14[3] = v4;
  v14[4] = v6;
  v14[5] = v5;
  v14[6] = v7;
  v14[7] = v8;
  sub_1CF9239E0(v2, v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1CF9239E0(v7, v8);
  sub_1CFA3B288();
  v9 = (void *)v15;
  v15 = sub_1CFB01128();
  sub_1CF923A24(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CF923A24(v7, v8);
  swift_release();
  if (v9)
  {
    LOWORD(v14[0]) = 0;
    v10 = v9;
    v11 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v9, 0, 0xE000000000000000, (__int16 *)v14, 0, v11, 0xD00000000000006ALL, 0x80000001CFB32130, v12, 0x286F666E49746567, 0xE900000000000029, 119);
    swift_willThrow();

  }
  return v15;
}

uint64_t sub_1CFABF520(uint64_t a1, uint64_t a2)
{
  return sub_1CFABFCE0(a1, a2);
}

__n128 DigitalPresentmentResponseCryptor.decrypt(_:with:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X8>)
{
  uint64_t *v4;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
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
  char *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(_QWORD, _QWORD, _QWORD);
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(_QWORD, _QWORD);
  void *v76;
  id v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  void *v85;
  id v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  unint64_t v91;
  unsigned __int8 v92;
  __n128 result;
  __n128 *v94;
  __n128 *v95;
  int v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  _QWORD *v106;
  char *v107;
  uint64_t v108;
  char *v109;
  void (*v110)(_QWORD, _QWORD, _QWORD);
  void (*v111)(_QWORD, _QWORD);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  _QWORD v123[2];
  __n128 v124;
  unsigned __int8 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _OWORD v134[3];
  _OWORD v135[8];
  _OWORD v136[3];
  unint64_t v137;

  v137 = a2;
  v122 = a1;
  v95 = a4;
  v6 = sub_1CFB01608();
  v103 = *(_QWORD *)(v6 - 8);
  v104 = v6;
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v105 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CFB015F0();
  v101 = *(_QWORD *)(v15 - 8);
  v102 = v15;
  MEMORY[0x1E0C80A78](v15, v16, v17, v18, v19, v20, v21, v22);
  v109 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1CFB015FC();
  v99 = *(_QWORD *)(v24 - 8);
  v100 = v24;
  MEMORY[0x1E0C80A78](v24, v25, v26, v27, v28, v29, v30, v31);
  v107 = (char *)&v95 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for HPKESuiteKwV1();
  MEMORY[0x1E0C80A78](v108, v33, v34, v35, v36, v37, v38, v39);
  v106 = (__n128 **)((char *)&v95 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = sub_1CFB02550();
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41, v43, v44, v45, v46, v47, v48, v49);
  v51 = (char *)&v95 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1CFB012CC();
  v53 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52, v54, v55, v56, v57, v58, v59, v60);
  v62 = (char *)&v95 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = *(void **)a3;
  v97 = *(id *)(a3 + 8);
  v98 = v63;
  v96 = *(unsigned __int8 *)(a3 + 16);
  v64 = *v4;
  v119 = v4[1];
  v120 = v64;
  v65 = v4[2];
  v117 = v4[3];
  v118 = v65;
  v66 = v4[4];
  v115 = v4[5];
  v116 = v66;
  v67 = v4[6];
  v113 = v4[7];
  v114 = v67;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v68 = __swift_project_value_buffer(v52, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v69 = *(void (**)(_QWORD, _QWORD, _QWORD))(v53 + 16);
  v112 = v68;
  v110 = v69;
  v69(v62, v68, v52);
  v70 = v122;
  v71 = v137;
  sub_1CF9239E0(v122, v137);
  sub_1CF9CAFEC((uint64_t)v62, v70, v71);
  sub_1CF923A24(v70, v71);
  v111 = *(void (**)(_QWORD, _QWORD))(v53 + 8);
  v111(v62, v52);
  v72 = sub_1CFB010F8();
  swift_allocObject();
  v73 = sub_1CFB010EC();
  if (qword_1EFBBD448 != -1)
    swift_once();
  v74 = __swift_project_value_buffer(v41, (uint64_t)qword_1EFBC4768);
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v51, v74, v41);
  *((_QWORD *)&v127 + 1) = &type metadata for ISO18013PresentmentType;
  LOBYTE(v126) = 1;
  v75 = (void (*)(_QWORD, _QWORD))sub_1CFB010D4();
  sub_1CFA90C00((uint64_t)&v126, (uint64_t)v51);
  v75(v123, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC0920);
  sub_1CF931BE4(&qword_1EFBC4F70, &qword_1EFBC0920, (uint64_t)&protocol conformance descriptor for HPKEEnvelope<A>);
  v76 = v121;
  sub_1CFB010C8();
  if (v76)
  {
    swift_release();
    LOWORD(v126) = 0;
    v77 = v76;
    v78 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v76, 0, 0xE000000000000000, (__int16 *)&v126, 0, v78, 0xD00000000000006ALL, 0x80000001CFB32130, v79, 0xD000000000000010, 0x80000001CFB321A0, 83);
    swift_willThrow();

  }
  else
  {
    v137 = v73;
    v135[6] = v132;
    v135[7] = v133;
    v136[0] = v134[0];
    *(_OWORD *)((char *)v136 + 9) = *(_OWORD *)((char *)v134 + 9);
    v135[2] = v128;
    v135[3] = v129;
    v135[4] = v130;
    v135[5] = v131;
    v135[0] = v126;
    v135[1] = v127;
    v110(v62, v112, v52);
    sub_1CFAC0600((uint64_t)v135, (void (*)(uint64_t, uint64_t))sub_1CF9239E0, (void (*)(uint64_t, uint64_t))sub_1CF92F5C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC05C4);
    sub_1CF9CAFF8((uint64_t)v62, v135);
    sub_1CFAC0600((uint64_t)v135, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
    v111(v62, v52);
    *(_QWORD *)&v126 = v120;
    *((_QWORD *)&v126 + 1) = v119;
    *(_QWORD *)&v127 = v118;
    *((_QWORD *)&v127 + 1) = v117;
    *(_QWORD *)&v128 = v116;
    *((_QWORD *)&v128 + 1) = v115;
    *(_QWORD *)&v129 = v114;
    *((_QWORD *)&v129 + 1) = v113;
    v80 = sub_1CFABF334();
    v82 = v81;
    v84 = (uint64_t)v106;
    v83 = v107;
    *v106 = &type metadata for AEADScheme_AES_128_GCM;
    *(_QWORD *)(v84 + 8) = &off_1E8CDFB60;
    v122 = v84 + *(int *)(v108 + 20);
    (*(void (**)(char *, _QWORD, uint64_t))(v99 + 104))(v83, *MEMORY[0x1E0CA95F0], v100);
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v109, *MEMORY[0x1E0CA95D0], v102);
    (*(void (**)(char *, _QWORD, uint64_t))(v103 + 104))(v105, *MEMORY[0x1E0CA9608], v104);
    v85 = v98;
    v121 = (void *)v72;
    v86 = v97;
    v87 = v96;
    sub_1CF9424C4(v98, v97, v96);
    sub_1CF9239E0(v80, v82);
    sub_1CFB015D8();
    v88 = v108;
    v89 = v84 + *(int *)(v108 + 32);
    *(_QWORD *)v89 = v85;
    *(_QWORD *)(v89 + 8) = v86;
    *(_BYTE *)(v89 + 16) = v87;
    *(_OWORD *)(v84 + *(int *)(v88 + 28)) = xmmword_1CFB05A10;
    v90 = (uint64_t *)(v84 + *(int *)(v88 + 24));
    *v90 = v80;
    v90[1] = v82;
    *((_QWORD *)&v127 + 1) = v121;
    *(_QWORD *)&v128 = &protocol witness table for CBORDecoder;
    *(_QWORD *)&v126 = v137;
    swift_retain();
    sub_1CFABE250((uint64_t)v135, 0, &v126);
    sub_1CF923A24(v80, v82);
    swift_release();
    sub_1CFAC0588(v84);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v126);
    sub_1CFAC0600((uint64_t)v135, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
    v91 = v123[1];
    v92 = v125;
    result = v124;
    v94 = v95;
    v95->n128_u64[0] = v123[0];
    v94->n128_u64[1] = v91;
    v94[1] = result;
    v94[2].n128_u8[0] = v92;
  }
  return result;
}

uint64_t sub_1CFABFCC0(uint64_t a1, uint64_t a2)
{
  return sub_1CFABFCE0(a1, a2);
}

uint64_t sub_1CFABFCE0(uint64_t a1, uint64_t a2)
{
  sub_1CFB02388();
  sub_1CFB01B30();
  sub_1CFA72450(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
  sub_1CFB019BC();
  swift_bridgeObjectRelease();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 0;
}

void *DigitalPresentmentResponseCryptor.decryptWithoutDecoding(_:with:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
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
  _BYTE *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void (*v70)(_BYTE *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t *, _QWORD);
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  id v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  unint64_t v88;
  id v89;
  unint64_t v90;
  uint64_t v91;
  _BYTE v93[4];
  int v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  _QWORD *v104;
  _BYTE *v105;
  uint64_t v106;
  _BYTE *v107;
  void (*v108)(_BYTE *, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _OWORD v128[2];
  uint64_t v129;
  _OWORD v130[7];
  __int128 v131;
  _OWORD v132[2];
  _OWORD v133[7];
  unint64_t v134;

  v134 = a2;
  v119 = a1;
  v5 = sub_1CFB01608();
  v101 = *(_QWORD *)(v5 - 8);
  v102 = v5;
  MEMORY[0x1E0C80A78](v5, v6, v7, v8, v9, v10, v11, v12);
  v103 = &v93[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_1CFB015F0();
  v99 = *(_QWORD *)(v14 - 8);
  v100 = v14;
  MEMORY[0x1E0C80A78](v14, v15, v16, v17, v18, v19, v20, v21);
  v107 = &v93[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = sub_1CFB015FC();
  v97 = *(_QWORD *)(v23 - 8);
  v98 = v23;
  MEMORY[0x1E0C80A78](v23, v24, v25, v26, v27, v28, v29, v30);
  v105 = &v93[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v106 = type metadata accessor for HPKESuiteKwV1();
  MEMORY[0x1E0C80A78](v106, v32, v33, v34, v35, v36, v37, v38);
  v104 = &v93[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v40 = sub_1CFB02550();
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40, v42, v43, v44, v45, v46, v47, v48);
  v50 = &v93[-((v49 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v51 = sub_1CFB012CC();
  v52 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51, v53, v54, v55, v56, v57, v58, v59);
  v61 = &v93[-((v60 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v62 = *(void **)a3;
  v95 = *(id *)(a3 + 8);
  v96 = v62;
  v94 = *(unsigned __int8 *)(a3 + 16);
  v63 = *v3;
  v116 = v3[1];
  v117 = v63;
  v64 = v3[2];
  v114 = v3[3];
  v115 = v64;
  v65 = v3[4];
  v112 = v3[5];
  v113 = v65;
  v66 = v3[6];
  v110 = v3[7];
  v111 = v66;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v67 = __swift_project_value_buffer(v51, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v108 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v52 + 16);
  v109 = v67;
  v108(v61, v67, v51);
  v68 = v119;
  v69 = v134;
  sub_1CF9239E0(v119, v134);
  sub_1CF9CAFEC((uint64_t)v61, v68, v69);
  sub_1CF923A24(v68, v69);
  v70 = *(void (**)(_BYTE *, uint64_t))(v52 + 8);
  v70(v61, v51);
  sub_1CFB010F8();
  swift_allocObject();
  v71 = sub_1CFB010EC();
  if (qword_1EFBBD448 != -1)
    swift_once();
  v72 = __swift_project_value_buffer(v40, (uint64_t)qword_1EFBC4768);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v41 + 16))(v50, v72, v40);
  *((_QWORD *)&v121 + 1) = &type metadata for ISO18013PresentmentType;
  LOBYTE(v120) = 1;
  v73 = (void (*)(uint64_t *, _QWORD))sub_1CFB010D4();
  sub_1CFA90C00((uint64_t)&v120, (uint64_t)v50);
  v73(&v129, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC0920);
  sub_1CF931BE4(&qword_1EFBC4F70, &qword_1EFBC0920, (uint64_t)&protocol conformance descriptor for HPKEEnvelope<A>);
  v74 = v118;
  sub_1CFB010C8();
  v75 = v74;
  if (v74)
  {
    swift_release();
    LOWORD(v120) = 0;
    v89 = v74;
    v90 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v74, 0, 0xE000000000000000, (__int16 *)&v120, 0, v90, 0xD00000000000006ALL, 0x80000001CFB32130, v91, 0xD00000000000001FLL, 0x80000001CFB321C0, 108);
    swift_willThrow();

  }
  else
  {
    v130[6] = v126;
    v131 = v127;
    v132[0] = v128[0];
    *(_OWORD *)((char *)v132 + 9) = *(_OWORD *)((char *)v128 + 9);
    v130[2] = v122;
    v130[3] = v123;
    v130[4] = v124;
    v130[5] = v125;
    v130[0] = v120;
    v130[1] = v121;
    v108(v61, v109, v51);
    sub_1CFAC0600((uint64_t)v130, (void (*)(uint64_t, uint64_t))sub_1CF9239E0, (void (*)(uint64_t, uint64_t))sub_1CF92F5C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC05C4);
    sub_1CF9CAFF8((uint64_t)v61, v130);
    sub_1CFAC0600((uint64_t)v130, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
    v70(v61, v51);
    *(_QWORD *)&v120 = v117;
    *((_QWORD *)&v120 + 1) = v116;
    *(_QWORD *)&v121 = v115;
    *((_QWORD *)&v121 + 1) = v114;
    *(_QWORD *)&v122 = v113;
    *((_QWORD *)&v122 + 1) = v112;
    *(_QWORD *)&v123 = v111;
    *((_QWORD *)&v123 + 1) = v110;
    v76 = sub_1CFABF334();
    v118 = (void *)v71;
    v77 = (uint64_t)v104;
    *v104 = &type metadata for AEADScheme_AES_128_GCM;
    *(_QWORD *)(v77 + 8) = &off_1E8CDFB60;
    v134 = v78;
    v119 = v77 + *(int *)(v106 + 20);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v97 + 104))(v105, *MEMORY[0x1E0CA95F0], v98);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v99 + 104))(v107, *MEMORY[0x1E0CA95D0], v100);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v101 + 104))(v103, *MEMORY[0x1E0CA9608], v102);
    v80 = v95;
    v79 = v96;
    v81 = v94;
    sub_1CF9424C4(v96, v95, v94);
    sub_1CF9239E0(v76, v134);
    sub_1CFB015D8();
    v82 = v106;
    v83 = v77 + *(int *)(v106 + 32);
    *(_QWORD *)v83 = v79;
    *(_QWORD *)(v83 + 8) = v80;
    *(_BYTE *)(v83 + 16) = v81;
    v84 = v76;
    *(_OWORD *)(v77 + *(int *)(v82 + 28)) = xmmword_1CFB05A10;
    v85 = v134;
    v86 = (uint64_t *)(v77 + *(int *)(v82 + 24));
    *v86 = v84;
    v86[1] = v85;
    v87 = *((_QWORD *)&v130[6] + 1);
    v88 = v131;
    v133[2] = *(_OWORD *)((char *)&v130[2] + 8);
    v133[3] = *(_OWORD *)((char *)&v130[3] + 8);
    v133[4] = *(_OWORD *)((char *)&v130[4] + 8);
    v133[5] = *(_OWORD *)((char *)&v130[5] + 8);
    v133[0] = *(_OWORD *)((char *)v130 + 8);
    v133[1] = *(_OWORD *)((char *)&v130[1] + 8);
    v122 = *(_OWORD *)((char *)&v130[2] + 8);
    v123 = *(_OWORD *)((char *)&v130[3] + 8);
    v124 = *(_OWORD *)((char *)&v130[4] + 8);
    v125 = *(_OWORD *)((char *)&v130[5] + 8);
    v120 = *(_OWORD *)((char *)v130 + 8);
    v121 = *(_OWORD *)((char *)&v130[1] + 8);
    sub_1CFAC073C((uint64_t *)v133, (void (*)(uint64_t, uint64_t))sub_1CF9239E0, (void (*)(uint64_t, uint64_t))sub_1CF92F5C8);
    v75 = HPKESuiteKwV1.openMessageHPKEWithoutDecoding(data:params:authenticationContext:)(v87, v88, (uint64_t *)&v120, 0);
    swift_release();
    sub_1CFAC0600((uint64_t)v130, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_1CFAC0700);
    sub_1CF923A24(v84, v85);
    sub_1CFAC073C((uint64_t *)v133, (void (*)(uint64_t, uint64_t))sub_1CF923A24, (void (*)(uint64_t, uint64_t))sub_1CF931AB0);
    sub_1CFAC0588(v77);
  }
  return v75;
}

uint64_t sub_1CFAC0588(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HPKESuiteKwV1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFAC05C4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1CFAC0600(uint64_t a1, void (*a2)(uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 96);
  v19 = *(_QWORD *)(a1 + 104);
  v17 = *(_QWORD *)(a1 + 88);
  v18 = *(_QWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 128);
  v24 = *(_QWORD *)(a1 + 120);
  v21 = *(_QWORD *)(a1 + 144);
  v22 = *(_QWORD *)(a1 + 136);
  v20 = *(unsigned __int8 *)(a1 + 152);
  a2(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  a2(v7, v8);
  a3(v9, v10);
  a3(v11, v13);
  a3(v12, v15);
  a3(v17, v16);
  a2(v19, v18);
  a4(v24, v23, v22, v21, v20);
  return a1;
}

uint64_t sub_1CFAC0700(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_1CFAC073C(uint64_t *a1, void (*a2)(uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a1[2];
  v7 = a1[3];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v16 = a1[10];
  v14 = a1[9];
  v15 = a1[11];
  a2(*a1, a1[1]);
  a2(v6, v7);
  a3(v8, v9);
  a3(v10, v11);
  a3(v12, v14);
  a3(v16, v15);
  return a1;
}

ValueMetadata *type metadata accessor for DigitalPresentmentResponseTopics()
{
  return &type metadata for DigitalPresentmentResponseTopics;
}

ValueMetadata *type metadata accessor for DigitalPresentmentResponseCryptor()
{
  return &type metadata for DigitalPresentmentResponseCryptor;
}

uint64_t storeEnumTagSinglePayload for DigitalPresentmentResponseTopics.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CFAC0850 + 4 * byte_1CFB1FE40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CFAC0870 + 4 * byte_1CFB1FE45[v4]))();
}

_BYTE *sub_1CFAC0850(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CFAC0870(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFAC0878(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFAC0880(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFAC0888(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFAC0890(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentResponseTopics.CodingKeys()
{
  return &type metadata for DigitalPresentmentResponseTopics.CodingKeys;
}

unint64_t sub_1CFAC08B0()
{
  unint64_t result;

  result = qword_1EFBC4F78;
  if (!qword_1EFBC4F78)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB1FF90, &type metadata for DigitalPresentmentResponseTopics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F78);
  }
  return result;
}

unint64_t sub_1CFAC08F8()
{
  unint64_t result;

  result = qword_1EFBC4F80;
  if (!qword_1EFBC4F80)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB1FF00, &type metadata for DigitalPresentmentResponseTopics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F80);
  }
  return result;
}

unint64_t sub_1CFAC0940()
{
  unint64_t result;

  result = qword_1EFBC4F88;
  if (!qword_1EFBC4F88)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB1FF28, &type metadata for DigitalPresentmentResponseTopics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F88);
  }
  return result;
}

unint64_t sub_1CFAC0984()
{
  unint64_t result;

  result = qword_1EFBC4F90;
  if (!qword_1EFBC4F90)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for DigitalPresentmentResponseTopics, &type metadata for DigitalPresentmentResponseTopics);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F90);
  }
  return result;
}

unint64_t sub_1CFAC09C8()
{
  unint64_t result;

  result = qword_1EFBC4F98;
  if (!qword_1EFBC4F98)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for DigitalPresentmentResponseTopics, &type metadata for DigitalPresentmentResponseTopics);
    atomic_store(result, (unint64_t *)&qword_1EFBC4F98);
  }
  return result;
}

BOOL IdentityProofingDataSharingUserConsent.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

_QWORD *sub_1CFAC0A30@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t IdentityProofingDataSharingUserConsent.debugDescription.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 0x6572616873;
  if (a1 == 1)
    return 0x68732074276E6F64;
  result = sub_1CFB029AC();
  __break(1u);
  return result;
}

unint64_t sub_1CFAC0AD4()
{
  unint64_t result;

  result = qword_1EFBC4FA0;
  if (!qword_1EFBC4FA0)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for IdentityProofingDataSharingUserConsent, &type metadata for IdentityProofingDataSharingUserConsent);
    atomic_store(result, (unint64_t *)&qword_1EFBC4FA0);
  }
  return result;
}

uint64_t sub_1CFAC0B18()
{
  _QWORD *v0;
  uint64_t result;

  if (!*v0)
    return 0x6572616873;
  if (*v0 == 1)
    return 0x68732074276E6F64;
  result = sub_1CFB029AC();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for IdentityProofingDataSharingUserConsent()
{
  return &type metadata for IdentityProofingDataSharingUserConsent;
}

uint64_t AppleIDVManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AppleIDVManager.init()();
  return v0;
}

uint64_t AppleIDVManager.init()()
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
  id v29;
  void *v30;
  unsigned __int8 v31;
  char *v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v1 = v0;
  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  v11 = MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14, v15, v16, v17, v18, v19, v20);
  v21 = sub_1CFB01A70();
  MEMORY[0x1E0C80A78](v21, v22, v23, v24, v25, v26, v27, v28);
  v29 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
    swift_once();
  if (byte_1ED907588 == 1)
  {
    v30 = (void *)sub_1CFB01A04();
    v31 = objc_msgSend(v29, sel_BOOLForKey_, v30);

    if ((v31 & 1) != 0)
    {
      v32 = sub_1CFAC1774();
      v34 = v33;
      v35 = sub_1CFB00E7C();
      v37 = v36;

      sub_1CFB01A58();
      v38 = sub_1CFB01A40();
      v40 = v39;
      sub_1CF923A24(v35, v37);
      v41 = 0x3E6C696E3CLL;
      if (v40)
        v41 = v38;
      v52 = v41;
      if (v40)
        v42 = v40;
      else
        v42 = 0xE500000000000000;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v43 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v13, v43, v2);
      swift_bridgeObjectRetain();
      v44 = sub_1CFB012B4();
      v45 = sub_1CFB01FC8();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = swift_slowAlloc();
        v50 = swift_slowAlloc();
        v53 = (uint64_t)v32;
        v54 = v50;
        *(_DWORD *)v46 = 134349314;
        sub_1CFB021C0();
        *(_WORD *)(v46 + 12) = 2082;
        v51 = v34;
        swift_bridgeObjectRetain();
        v53 = sub_1CF9C974C(v52, v42, &v54);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v44, v45, "AppleIDV status = %{public}ld, version = %{public}s", (uint8_t *)v46, 0x16u);
        v47 = v50;
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v47, -1, -1);
        MEMORY[0x1D17DA6E4](v46, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v2);
    }
  }
  else
  {

  }
  return v1;
}

Swift::tuple_status_Int_version_NSData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AppleIDVManager.getStatus()()
{
  char *v0;
  objc_class *v1;
  Swift::tuple_status_Int_version_NSData result;

  v0 = sub_1CFAC1774();
  result.version.super.isa = v1;
  result.status = (Swift::Int)v0;
  return result;
}

char *AppleIDVManager.prepareBioBindingUnboundACL()()
{
  return sub_1CFAC1C20();
}

char *AppleIDVManager.preparePasscodeBindingUnboundACL()()
{
  return sub_1CFAC20BC();
}

id AppleIDVManager.persistACLBlob(_:requiresDoublePress:)(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  id result;
  uint64_t v5;

  result = sub_1CFAC2558(a1, a2, a3);
  if (v3)
    return (id)v5;
  return result;
}

unint64_t AppleIDVManager.getUUIDsFromACL(_:)(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC2DC0(a1, a2);
}

id AppleIDVManager.requireDoublePressOnACL(_:)(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC33B0(a1, a2);
}

id AppleIDVManager.recoverPersistedACLBlob(from:)()
{
  return sub_1CFAC3830();
}

uint64_t AppleIDVManager.authorizePresentmentForSignature(aclBlob:externalizedLAContext:seSlot:payloadDigest:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  return sub_1CFAC3CF8(a1, a2, a3, a4, a5, a6, a7);
}

double AppleIDVManager.generatePrearmTrustKeyforWatchAndCopyPublicKey(nonce:prognitorPublicKey:)@<D0>(_OWORD *a1@<X8>)
{
  return sub_1CFAC10FC((void (*)(_OWORD *__return_ptr))sub_1CFAC44BC, a1);
}

double AppleIDVManager.updatePrearmTrustKeyforWatch(inKeyBlob:prognitorPublicKey:)@<D0>(_OWORD *a1@<X8>)
{
  return sub_1CFAC10FC((void (*)(_OWORD *__return_ptr))sub_1CFAC4A1C, a1);
}

double sub_1CFAC10FC@<D0>(void (*a1)(_OWORD *__return_ptr)@<X4>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[4];

  a1(v8);
  if (!v2)
  {
    result = *(double *)v8;
    v5 = v8[1];
    v6 = v8[2];
    v7 = v8[3];
    *a2 = v8[0];
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t AppleIDVManager.generatePhoneToken(withNonce:aclBlob:keyBlob:keyAttestation:casdCertificate:)(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
  return sub_1CFAC501C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

unint64_t sub_1CFAC1160(uint64_t a1, uint64_t a2)
{
  sub_1CFB02388();
  swift_bridgeObjectRelease();
  sub_1CFA72450(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF96201C();
  sub_1CFB019BC();
  swift_bridgeObjectRelease();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 0xD00000000000001FLL;
}

id AppleIDVManager.establishPrearmTrust(baaCertificate:)(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC5874(a1, a2);
}

id AppleIDVManager.generateNonceOnWatch()()
{
  return sub_1CFAC5F68();
}

uint64_t AppleIDVManager.prearmCredential(withAuthorizationToken:protectedPublicKey:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1CFAC6520(a1, a2, a3, a4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AppleIDVManager.revokeCredentialAuthorizationToken()()
{
  sub_1CFAC6B4C();
}

char *AppleIDVManager.persistModifiedACLBlob(_:referenceACLBlob:externalizedLAContext:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t), uint64_t a6)
{
  uint64_t v6;
  char *result;
  uint64_t v8;

  result = sub_1CFAC6F70(a1, a2, a3, a4, a5, a6);
  if (v6)
    return (char *)v8;
  return result;
}

uint64_t AppleIDVManager.prepareUnboundACLForWatch(withAccessibilityEnabled:)(char a1)
{
  return sub_1CFAC768C(a1);
}

id AppleIDVManager.prepareACL(aclType:aclUsage:bioUUID:)(unsigned int a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  return sub_1CFAC7CAC(a1, a2, a3, a4);
}

uint64_t sub_1CFAC12D8()
{
  uint64_t result;
  void *v1;

  result = SecAccessControlCreateFromData();
  if (result)
  {
    v1 = (void *)result;
    sub_1CFB02388();
    sub_1CFB01B30();
    type metadata accessor for SecAccessControl(0);
    sub_1CFB0252C();

    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AppleIDVManager.credentialAuthenticationTokenStatus()()
{
  sub_1CFAC885C();
}

uint64_t AppleIDVManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AppleIDVManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

char *sub_1CFAC13B8()
{
  return sub_1CFAC1774();
}

char *sub_1CFAC13CC()
{
  return sub_1CFAC1C20();
}

char *sub_1CFAC13E0()
{
  return sub_1CFAC20BC();
}

id sub_1CFAC13F4(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  id result;
  uint64_t v5;

  result = sub_1CFAC2558(a1, a2, a3);
  if (v3)
    return (id)v5;
  return result;
}

unint64_t sub_1CFAC1418(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC2DC0(a1, a2);
}

id sub_1CFAC142C(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC33B0(a1, a2);
}

id sub_1CFAC1440()
{
  return sub_1CFAC3830();
}

uint64_t sub_1CFAC1454(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  return sub_1CFAC3CF8(a1, a2, a3, a4, a5, a6, a7);
}

double sub_1CFAC1468@<D0>(_OWORD *a1@<X8>)
{
  return sub_1CFAC14A0((void (*)(_OWORD *__return_ptr))sub_1CFAC44BC, a1);
}

double sub_1CFAC1484@<D0>(_OWORD *a1@<X8>)
{
  return sub_1CFAC14A0((void (*)(_OWORD *__return_ptr))sub_1CFAC4A1C, a1);
}

double sub_1CFAC14A0@<D0>(void (*a1)(_OWORD *__return_ptr)@<X6>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[4];

  a1(v8);
  if (!v2)
  {
    result = *(double *)v8;
    v5 = v8[1];
    v6 = v8[2];
    v7 = v8[3];
    *a2 = v8[0];
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1CFAC14E0(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
  return sub_1CFAC501C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

id sub_1CFAC1504(uint64_t a1, unint64_t a2)
{
  return sub_1CFAC5874(a1, a2);
}

id sub_1CFAC1518()
{
  return sub_1CFAC5F68();
}

uint64_t sub_1CFAC152C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1CFAC6520(a1, a2, a3, a4);
}

uint64_t sub_1CFAC1540()
{
  return sub_1CFAC6B4C();
}

char *sub_1CFAC1554(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t), uint64_t a6)
{
  uint64_t v6;
  char *result;
  uint64_t v8;

  result = sub_1CFAC6F70(a1, a2, a3, a4, a5, a6);
  if (v6)
    return (char *)v8;
  return result;
}

uint64_t sub_1CFAC1578(char a1)
{
  return sub_1CFAC768C(a1);
}

id sub_1CFAC158C(unsigned int a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  return sub_1CFAC7CAC(a1, a2, a3, a4);
}

uint64_t sub_1CFAC15A0()
{
  return sub_1CFAC885C();
}

unint64_t AppleIDVACLType.description.getter(int a1)
{
  unint64_t result;

  result = 0x694220656E6F6850;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 3:
      result = 0xD000000000000013;
      break;
    case 2:
      result = 0x6942206863746157;
      break;
    default:
      result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_1CFAC1650()
{
  int *v0;

  return AppleIDVACLType.description.getter(*v0);
}

uint64_t AppleIDVACLUseCase.description.getter(int a1)
{
  unint64_t v1;
  unint64_t v2;

  v1 = 0xD000000000000015;
  v2 = 0x6E776F6E6B6E55;
  if (a1 == 1)
    v2 = 0xD000000000000013;
  if (a1 != 2)
    v1 = v2;
  if (a1)
    return v1;
  else
    return 0x6D746E6573657250;
}

uint64_t sub_1CFAC16E4()
{
  int *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = 0xD000000000000015;
  v3 = 0x6E776F6E6B6E55;
  if (*v0 == 1)
    v3 = 0xD000000000000013;
  if (v1 != 2)
    v2 = v3;
  if (v1)
    return v2;
  else
    return 0x6D746E6573657250;
}

char *sub_1CFAC1774()
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  id v39;
  unsigned int v40;
  uint64_t inited;
  id v42;
  uint64_t v43;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  id v48;
  _QWORD v49[14];

  v49[13] = *MEMORY[0x1E0C80C00];
  v0 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v0, v1, v2, v3, v4, v5, v6, v7);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CFB012CC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v22, v23, v24, v25, v26, v27, v28);
  v30 = (char *)&v47 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v20, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v30, v31, v20);
  v32 = sub_1CFB012B4();
  v33 = sub_1CFB01FC8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v47 = v9;
    v35 = v34;
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1CF917000, v32, v33, "AppleIDVManager getStatus", v34, 2u);
    v9 = v47;
    MEMORY[0x1D17DA6E4](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
  if (qword_1EFBBD308 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC30C8);
  sub_1CF94C548(v36, (uint64_t)v9);
  DIPSignpost.init(_:)((uint64_t)v9, (uint64_t)v19);
  v49[0] = 0;
  v37 = (void *)objc_opt_self();
  v48 = 0;
  v38 = objc_msgSend(v37, sel_appleIDVGetStatus_andVersion_, v49, &v48);
  v39 = v48;
  if (v38)
  {
    v40 = v38;
    LOWORD(v48) = 301;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v40;
    v42 = v39;
    v9 = (char *)sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000001CLL, 0x80000001CFB32E70, (__int16 *)&v48, 0, (uint64_t)v9, 0xD00000000000005ALL, 0x80000001CFB32470, v43, 0x7574617453746567, 0xEB00000000292873, 59);
    swift_willThrow();

  }
  else
  {
    if (v48)
    {
      v9 = (char *)v49[0];
      v48;
      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94((uint64_t)v19);
      return v9;
    }
    LOWORD(v48) = 0;
    v45 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000003DLL, 0x80000001CFB32E90, (__int16 *)&v48, 0, v45, 0xD00000000000005ALL, 0x80000001CFB32470, v46, 0x7574617453746567, 0xEB00000000292873, 62);
    swift_willThrow();
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v19);
  return v9;
}

char *sub_1CFAC1C20()
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  id v39;
  unsigned int v40;
  uint64_t inited;
  id v42;
  uint64_t v43;
  id v44;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  id v50[14];

  v50[13] = *(id *)MEMORY[0x1E0C80C00];
  v0 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v0, v1, v2, v3, v4, v5, v6, v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CFB012CC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v22, v23, v24, v25, v26, v27, v28);
  v30 = (char *)&v48 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v20, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v30, v31, v20);
  v32 = sub_1CFB012B4();
  v33 = sub_1CFB01FC8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v49 = v9;
    v35 = v34;
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1CF917000, v32, v33, "AppleIDVManager prepareBioBindingUnboundACL", v34, 2u);
    v9 = v49;
    MEMORY[0x1D17DA6E4](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
  if (qword_1EFBBD310 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC30E0);
  sub_1CF94C548(v36, (uint64_t)v9);
  DIPSignpost.init(_:)((uint64_t)v9, (uint64_t)v19);
  v37 = (void *)objc_opt_self();
  v50[0] = 0;
  v38 = objc_msgSend(v37, sel_prepareUnboundACLForBioBinding_, v50);
  v39 = v50[0];
  if (v38)
  {
    v40 = v38;
    LOWORD(v50[0]) = 305;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v40;
    v42 = v39;
    v9 = (char *)sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000029, 0x80000001CFB32DD0, (__int16 *)v50, 0, (uint64_t)v9, 0xD00000000000005ALL, 0x80000001CFB32470, v43, 0xD00000000000001DLL, 0x80000001CFB32E00, 76);
    swift_willThrow();

  }
  else
  {
    if (v50[0])
    {
      v44 = v50[0];
      v9 = (char *)sub_1CFB00E7C();

      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94((uint64_t)v19);
      return v9;
    }
    LOWORD(v50[0]) = 0;
    v46 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000047, 0x80000001CFB32E20, (__int16 *)v50, 0, v46, 0xD00000000000005ALL, 0x80000001CFB32470, v47, 0xD00000000000001DLL, 0x80000001CFB32E00, 79);
    swift_willThrow();
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v19);
  return v9;
}

char *sub_1CFAC20BC()
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  id v39;
  unsigned int v40;
  uint64_t inited;
  id v42;
  uint64_t v43;
  id v44;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  id v50[14];

  v50[13] = *(id *)MEMORY[0x1E0C80C00];
  v0 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v0, v1, v2, v3, v4, v5, v6, v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CFB012CC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v22, v23, v24, v25, v26, v27, v28);
  v30 = (char *)&v48 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v20, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v30, v31, v20);
  v32 = sub_1CFB012B4();
  v33 = sub_1CFB01FC8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v49 = v9;
    v35 = v34;
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1CF917000, v32, v33, "AppleIDVManager preparePasscodeBindingUnboundACL", v34, 2u);
    v9 = v49;
    MEMORY[0x1D17DA6E4](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
  if (qword_1EFBBD318 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC30F8);
  sub_1CF94C548(v36, (uint64_t)v9);
  DIPSignpost.init(_:)((uint64_t)v9, (uint64_t)v19);
  v37 = (void *)objc_opt_self();
  v50[0] = 0;
  v38 = objc_msgSend(v37, sel_prepareUnboundACLForPasscodeBinding_, v50);
  v39 = v50[0];
  if (v38)
  {
    v40 = v38;
    LOWORD(v50[0]) = 312;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v40;
    v42 = v39;
    v9 = (char *)sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ELL, 0x80000001CFB32D20, (__int16 *)v50, 0, (uint64_t)v9, 0xD00000000000005ALL, 0x80000001CFB32470, v43, 0xD000000000000022, 0x80000001CFB32D50, 92);
    swift_willThrow();

  }
  else
  {
    if (v50[0])
    {
      v44 = v50[0];
      v9 = (char *)sub_1CFB00E7C();

      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94((uint64_t)v19);
      return v9;
    }
    LOWORD(v50[0]) = 0;
    v46 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000004CLL, 0x80000001CFB32D80, (__int16 *)v50, 0, v46, 0xD00000000000005ALL, 0x80000001CFB32470, v47, 0xD000000000000022, 0x80000001CFB32D50, 95);
    swift_willThrow();
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v19);
  return v9;
}

id sub_1CFAC2558(uint64_t a1, unint64_t a2, int a3)
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
  char *v32;
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
  char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  id v64;
  uint64_t inited;
  id v66;
  id v67;
  unint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  char *v74;
  int64_t v75;
  unint64_t v76;
  char *v77;
  void (*v78)(char *, char *, uint64_t);
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  id v88;
  unint64_t v89;
  uint64_t v90;
  id v91;
  id v92;
  uint8_t *v94;
  uint8_t *v95;
  void *v96;
  uint64_t v97;
  unint64_t v98;
  id v99;
  char *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108[6];

  v108[4] = *(id *)MEMORY[0x1E0C80C00];
  v6 = sub_1CFB00F9C();
  v105 = *(_QWORD *)(v6 - 8);
  v106 = v6;
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v104 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = (id)type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v101, v15, v16, v17, v18, v19, v20, v21);
  v102 = (uint64_t)&v94 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v23, v24, v25, v26, v27, v28, v29, v30);
  v32 = (char *)&v94 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_1CFB012CC();
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33, v35, v36, v37, v38, v39, v40, v41);
  v43 = (char *)&v94 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v44 = __swift_project_value_buffer(v33, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v43, v44, v33);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a1, a2);
  v45 = v34;
  v46 = sub_1CFB012B4();
  v47 = sub_1CFB01FC8();
  if (os_log_type_enabled(v46, v47))
  {
    v97 = v45;
    v48 = swift_slowAlloc();
    v100 = v32;
    v49 = (uint8_t *)v48;
    v96 = (void *)swift_slowAlloc();
    v108[0] = v96;
    LODWORD(v99) = a3;
    v95 = v49;
    *(_DWORD *)v49 = 136315138;
    v94 = v49 + 4;
    v50 = v103;
    sub_1CFA72450(a1, a2);
    v98 = a2;
    v103 = v50;
    v107 = v51;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
    sub_1CF96201C();
    v52 = sub_1CFB019BC();
    v54 = v53;
    v55 = v98;
    swift_bridgeObjectRelease();
    v107 = (id)sub_1CF9C974C(v52, v54, (uint64_t *)v108);
    LOBYTE(a3) = (_BYTE)v99;
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(a1, v55);
    sub_1CF923A24(a1, v55);
    v56 = v95;
    _os_log_impl(&dword_1CF917000, v46, v47, "AppleIDVManager persistACLBlob aclBlob: %s", v95, 0xCu);
    v57 = v96;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v57, -1, -1);
    v32 = v100;
    MEMORY[0x1D17DA6E4](v56, -1, -1);

    (*(void (**)(char *, uint64_t))(v97 + 8))(v43, v33);
  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v33);
  }
  if (qword_1EFBBD320 != -1)
    swift_once();
  v58 = __swift_project_value_buffer((uint64_t)v101, (uint64_t)qword_1EFBC3110);
  v59 = v102;
  sub_1CF94C548(v58, v102);
  DIPSignpost.init(_:)(v59, (uint64_t)v32);
  v60 = (void *)sub_1CFB00E58();
  v61 = (void *)objc_opt_self();
  v108[0] = 0;
  v107 = 0;
  v62 = objc_msgSend(v61, sel_appleIDVPersistACLBlob_intoBlob_returnBioUUIDs_andRequireDoublePress_, v60, v108, &v107, a3 & 1);

  v63 = v107;
  v64 = v108[0];
  if (v62)
  {
    LOWORD(v108[0]) = 302;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v62;
    v66 = v63;
    v67 = v64;
    v68 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000021, 0x80000001CFB32C80, (__int16 *)v108, 0, v68, 0xD00000000000005ALL, 0x80000001CFB32470, v69, 0xD000000000000026, 0x80000001CFB32CB0, 110);
    swift_willThrow();

LABEL_10:
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94((uint64_t)v32);
    return v64;
  }
  if (!v108[0])
  {
    LOWORD(v108[0]) = 0;
    v88 = v107;
    v89 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000003FLL, 0x80000001CFB32CE0, (__int16 *)v108, 0, v89, 0xD00000000000005ALL, 0x80000001CFB32470, v90, 0xD000000000000026, 0x80000001CFB32CB0, 113);
    swift_willThrow();
    goto LABEL_10;
  }
  if (v107)
  {
    v108[0] = 0;
    v70 = v107;
    v71 = v64;
    v72 = v70;
    v73 = v71;
    sub_1CFB01C98();

    v74 = (char *)v108[0];
    if (v108[0])
    {
      v75 = *((_QWORD *)v108[0] + 2);
      if (v75)
      {
        v99 = v64;
        v101 = v63;
        v100 = v32;
        v108[0] = (id)MEMORY[0x1E0DEE9D8];
        sub_1CF960FD0(0, v75, 0);
        v76 = (*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
        v98 = (unint64_t)v74;
        v77 = &v74[v76];
        v102 = *(_QWORD *)(v105 + 72);
        v78 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
        do
        {
          v79 = v104;
          v80 = v106;
          v78(v104, v77, v106);
          v81 = sub_1CFB00F60();
          v83 = v82;
          (*(void (**)(char *, uint64_t))(v105 + 8))(v79, v80);
          v84 = v108[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1CF960FD0(0, v84[2] + 1, 1);
            v84 = v108[0];
          }
          v86 = v84[2];
          v85 = v84[3];
          if (v86 >= v85 >> 1)
          {
            sub_1CF960FD0(v85 > 1, v86 + 1, 1);
            v84 = v108[0];
          }
          v84[2] = v86 + 1;
          v87 = (char *)&v84[2 * v86];
          *((_QWORD *)v87 + 4) = v81;
          *((_QWORD *)v87 + 5) = v83;
          v77 += v102;
          --v75;
        }
        while (v75);
        swift_bridgeObjectRelease();
        v32 = v100;
        v63 = v101;
        v64 = v99;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    v91 = v108[0];
  }
  v92 = v64;
  v64 = (id)sub_1CFB00E7C();

  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v32);
  return v64;
}

unint64_t sub_1CFAC2DC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  os_log_t v35;
  uint8_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  uint64_t inited;
  id v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  int64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(char *, unint64_t, uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint8_t *v62;
  uint8_t *v63;
  os_log_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[6];

  v3 = v2;
  v72[4] = *MEMORY[0x1E0C80C00];
  v6 = sub_1CFB00F9C();
  v69 = *(_QWORD *)(v6 - 8);
  v70 = v6;
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v68 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CFB012CC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17, v18, v19, v20, v21, v22, v23);
  v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v26 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v25, v26, v15);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a1, a2);
  v27 = sub_1CFB012B4();
  v28 = sub_1CFB01FC8();
  v29 = v28;
  if (os_log_type_enabled(v27, v28))
  {
    LODWORD(v66) = v29;
    v30 = (uint8_t *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    v72[0] = v65;
    v64 = v27;
    v63 = v30;
    *(_DWORD *)v30 = 136315138;
    v62 = v30 + 4;
    sub_1CFA72450(a1, a2);
    v67 = v16;
    v71 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
    sub_1CF96201C();
    v32 = sub_1CFB019BC();
    v34 = v33;
    v3 = v2;
    swift_bridgeObjectRelease();
    v71 = sub_1CF9C974C(v32, v34, v72);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
    v35 = v64;
    v36 = v63;
    _os_log_impl(&dword_1CF917000, v64, (os_log_type_t)v66, "AppleIDVManager getUUIDsFromACL aclBlob: %s", v63, 0xCu);
    v37 = v65;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v37, -1, -1);
    MEMORY[0x1D17DA6E4](v36, -1, -1);

    (*(void (**)(char *, uint64_t))(v67 + 8))(v25, v15);
  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
  }
  v38 = (void *)objc_opt_self();
  v39 = (void *)sub_1CFB00E58();
  v72[0] = 0;
  v40 = objc_msgSend(v38, sel_getUUIDsFromACL_intoArray_, v39, v72);

  v41 = (void *)v72[0];
  if (v40)
  {
    LOWORD(v72[0]) = 318;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v40;
    v43 = v41;
    v44 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000001ALL, 0x80000001CFB32C40, (__int16 *)v72, 0, v44, 0xD00000000000005ALL, 0x80000001CFB32470, v45, 0xD000000000000013, 0x80000001CFB32C60, 128);
    swift_willThrow();

  }
  else
  {
    if (v72[0]
      && (v72[0] = 0, v46 = v41, sub_1CFB01C98(), v46, (v47 = v72[0]) != 0))
    {
      v48 = *(_QWORD *)(v72[0] + 16);
      if (v48)
      {
        v66 = v41;
        v67 = v3;
        v72[0] = MEMORY[0x1E0DEE9D8];
        sub_1CF960FD0(0, v48, 0);
        v49 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
        v65 = v47;
        v50 = v47 + v49;
        v51 = *(_QWORD *)(v69 + 72);
        v52 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
        do
        {
          v53 = v68;
          v54 = v70;
          v52(v68, v50, v70);
          v55 = sub_1CFB00F60();
          v57 = v56;
          (*(void (**)(char *, uint64_t))(v69 + 8))(v53, v54);
          v44 = v72[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1CF960FD0(0, *(_QWORD *)(v44 + 16) + 1, 1);
            v44 = v72[0];
          }
          v59 = *(_QWORD *)(v44 + 16);
          v58 = *(_QWORD *)(v44 + 24);
          if (v59 >= v58 >> 1)
          {
            sub_1CF960FD0(v58 > 1, v59 + 1, 1);
            v44 = v72[0];
          }
          *(_QWORD *)(v44 + 16) = v59 + 1;
          v60 = v44 + 16 * v59;
          *(_QWORD *)(v60 + 32) = v55;
          *(_QWORD *)(v60 + 40) = v57;
          v50 += v51;
          --v48;
        }
        while (v48);
        swift_bridgeObjectRelease();
        v41 = v66;
      }
      else
      {
        swift_bridgeObjectRelease();
        v44 = MEMORY[0x1E0DEE9D8];
      }
    }
    else
    {
      v44 = 0;
    }

  }
  return v44;
}

id sub_1CFAC33B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  uint64_t inited;
  id v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD v37[2];
  uint8_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = sub_1CFB012CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7, v8, v9, v10, v11, v12, v13);
  v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v16, v5);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a1, a2);
  v17 = sub_1CFB012B4();
  v18 = sub_1CFB01FC8();
  v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v40 = v19;
    v20 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    *(_QWORD *)&v43 = v39;
    v41 = v6;
    v38 = v20;
    *(_DWORD *)v20 = 136315138;
    v37[1] = v20 + 4;
    sub_1CFA72450(a1, a2);
    v37[0] = v2;
    v42 = v21;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
    sub_1CF96201C();
    v22 = sub_1CFB019BC();
    v24 = v23;
    swift_bridgeObjectRelease();
    v42 = sub_1CF9C974C(v22, v24, (uint64_t *)&v43);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
    v25 = v38;
    _os_log_impl(&dword_1CF917000, v17, (os_log_type_t)v40, "AppleIDVManager requireDoublePressOnACL aclBlob: %s", v38, 0xCu);
    v26 = v39;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v26, -1, -1);
    MEMORY[0x1D17DA6E4](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v15, v5);
  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
  }
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_1CFB00E58();
  *(_QWORD *)&v43 = 0;
  v29 = objc_msgSend(v27, sel_requireDoublePressOnACL_intoACL_, v28, &v43);

  v30 = (void *)v43;
  if (v29)
  {
    LOWORD(v43) = 319;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v29;
    v32 = v30;
    v33 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000021, 0x80000001CFB32BF0, (__int16 *)&v43, 0, v33, 0xD00000000000005ALL, 0x80000001CFB32470, v34, 0xD00000000000001BLL, 0x80000001CFB32C20, 141);
    swift_willThrow();

  }
  else if ((_QWORD)v43)
  {
    v43 = xmmword_1CFB05A20;
    v35 = v30;
    sub_1CFB00E70();

    v32 = (id)v43;
  }
  else
  {
    return 0;
  }
  return v32;
}

id sub_1CFAC3830()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint8_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t inited;
  id v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51[14];

  v51[13] = *(id *)MEMORY[0x1E0C80C00];
  v50 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v50, v0, v1, v2, v3, v4, v5, v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1CFB012CC();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21, v22, v23, v24, v25, v26, v27);
  v29 = (char *)&v48 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v19, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v29, v30, v19);
  v31 = sub_1CFB012B4();
  v32 = sub_1CFB01FC8();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v49 = v8;
    v34 = v33;
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1CF917000, v31, v32, "AppleIDVManager recovePersistedACLBlob", v33, 2u);
    v8 = v49;
    MEMORY[0x1D17DA6E4](v34, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v20 + 8))(v29, v19);
  if (qword_1EFBBD328 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v50, (uint64_t)qword_1EFBC3128);
  sub_1CF94C548(v35, (uint64_t)v8);
  DIPSignpost.init(_:)((uint64_t)v8, (uint64_t)v18);
  v36 = (void *)objc_opt_self();
  v37 = (void *)sub_1CFB00E58();
  v51[0] = 0;
  v38 = objc_msgSend(v36, sel_appleIDVRecoverPersistedACLBlob_intoBlob_, v37, v51);

  v39 = v51[0];
  if ((_DWORD)v38)
  {
    LOWORD(v51[0]) = 303;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = (_DWORD)v38;
    v41 = v39;
    v42 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB32B50, (__int16 *)v51, 0, v42, 0xD00000000000005ALL, 0x80000001CFB32470, v43, 0xD00000000000001ELL, 0x80000001CFB32B80, 155);
    swift_willThrow();

  }
  else
  {
    if (v51[0])
    {
      v44 = v51[0];
      v38 = (id)sub_1CFB00E7C();

      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94((uint64_t)v18);
      return v38;
    }
    LOWORD(v51[0]) = 0;
    v46 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000045, 0x80000001CFB32BA0, (__int16 *)v51, 0, v46, 0xD00000000000005ALL, 0x80000001CFB32470, v47, 0xD00000000000001ELL, 0x80000001CFB32B80, 158);
    swift_willThrow();
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v18);
  return v38;
}

uint64_t sub_1CFAC3CF8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
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
  void (*v40)(char *, uint64_t, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  uint64_t inited;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  unint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v93 = a5;
  v89 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v89, v13, v14, v15, v16, v17, v18, v19);
  v90 = (uint64_t)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v21, v22, v23, v24, v25, v26, v27, v28);
  v96 = (uint64_t)&v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1CFB012CC();
  v95 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30, v31, v32, v33, v34, v35, v36, v37);
  v94 = (char *)&v80 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v39 = __swift_project_value_buffer(v30, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v95 + 16);
  v88 = v30;
  v40(v94, v39, v30);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a3, a4);
  sub_1CF9239E0(a6, a7);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a3, a4);
  sub_1CF9239E0(a6, a7);
  v41 = sub_1CFB012B4();
  v42 = sub_1CFB01FC8();
  v87 = v41;
  v85 = v42;
  v43 = a3;
  if (os_log_type_enabled(v41, v42))
  {
    v44 = swift_slowAlloc();
    v81 = a6;
    v92 = a4;
    v45 = v44;
    v83 = swift_slowAlloc();
    v98 = v83;
    *(_DWORD *)v45 = 136315906;
    v46 = a1;
    v47 = v91;
    sub_1CFA72450(a1, a2);
    v86 = a7;
    v91 = v47;
    v97 = v48;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
    v49 = sub_1CF96201C();
    v84 = v43;
    v80 = v49;
    v50 = sub_1CFB019BC();
    v52 = v51;
    swift_bridgeObjectRelease();
    v97 = sub_1CF9C974C(v50, v52, &v98);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    v82 = v46;
    sub_1CF923A24(v46, a2);
    sub_1CF923A24(v46, a2);
    *(_WORD *)(v45 + 12) = 2080;
    v53 = v91;
    sub_1CFA72450(v84, v92);
    v91 = v53;
    v97 = v54;
    v55 = v84;
    v56 = sub_1CFB019BC();
    v58 = v57;
    swift_bridgeObjectRelease();
    v97 = sub_1CF9C974C(v56, v58, &v98);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(v55, v92);
    sub_1CF923A24(v55, v92);
    *(_WORD *)(v45 + 22) = 2048;
    v97 = v93;
    sub_1CFB021C0();
    *(_WORD *)(v45 + 32) = 2080;
    v59 = v81;
    v60 = v91;
    sub_1CFA72450(v81, v86);
    v91 = v60;
    v97 = v61;
    v62 = sub_1CFB019BC();
    v64 = v63;
    v65 = v86;
    swift_bridgeObjectRelease();
    v97 = sub_1CF9C974C(v62, v64, &v98);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(v59, v65);
    sub_1CF923A24(v59, v65);
    v66 = v87;
    _os_log_impl(&dword_1CF917000, v87, (os_log_type_t)v85, "AppleIDVManager authorizePresentmentForSignature aclBlob = %s externalizedLAContext = %s seSlot = %ld payloadDigest = %s", (uint8_t *)v45, 0x2Au);
    v67 = v83;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v67, -1, -1);
    MEMORY[0x1D17DA6E4](v45, -1, -1);

  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a3, a4);
    sub_1CF923A24(a3, a4);
    sub_1CF923A24(a6, a7);
    sub_1CF923A24(a6, a7);

  }
  (*(void (**)(char *, uint64_t))(v95 + 8))(v94, v88);
  if (qword_1EFBBD330 != -1)
    swift_once();
  v68 = __swift_project_value_buffer(v89, (uint64_t)qword_1EFBC3140);
  v69 = v90;
  sub_1CF94C548(v68, v90);
  DIPSignpost.init(_:)(v69, v96);
  v70 = (void *)objc_opt_self();
  v71 = (void *)sub_1CFB00E58();
  v72 = (void *)sub_1CFB00E58();
  v73 = (void *)sub_1CFB00E58();
  v74 = objc_msgSend(v70, sel_appleIDVAuthorizePresentment_withLAContextData_onSESlot_andPayloadDigest_, v71, v72, v93, v73);

  if (v74)
  {
    LOWORD(v98) = 304;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v74;
    v76 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB32AC0, (__int16 *)&v98, 0, v76, 0xD00000000000005ALL, 0x80000001CFB32470, v77, 0xD000000000000055, 0x80000001CFB32AF0, 171);
    swift_willThrow();
  }
  v78 = v96;
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  return sub_1CF960F94(v78);
}

uint64_t sub_1CFAC44BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char *a3@<X3>, uint64_t *a4@<X8>)
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
  char *v23;
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
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t *v39;
  char *v40;
  uint8_t *v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t result;
  uint64_t v74;
  uint64_t v75;
  uint64_t inited;
  id v77;
  id v78;
  id v79;
  id v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  id v90;
  void *v91;
  void *v92;
  _QWORD v93[15];

  v88 = a2;
  v89 = a3;
  v93[13] = *MEMORY[0x1E0C80C00];
  v86 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v86, v6, v7, v8, v9, v10, v11, v12);
  v87 = (uint64_t)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v14, v15, v16, v17, v18, v19, v20, v21);
  v23 = (char *)&v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1CFB012CC();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24, v26, v27, v28, v29, v30, v31, v32);
  v34 = (char *)&v83 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v24, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v34, v35, v24);
  v36 = sub_1CFB012B4();
  v37 = sub_1CFB01FC8();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v85 = a1;
    v39 = a4;
    v40 = v23;
    v41 = v38;
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_1CF917000, v36, v37, "AppleIDVManager generatePrearmTrustKeyforWatchAndCopyPublicKey", v38, 2u);
    v42 = v41;
    v23 = v40;
    a4 = v39;
    MEMORY[0x1D17DA6E4](v42, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v25 + 8))(v34, v24);
  if (qword_1EFBBD338 != -1)
    swift_once();
  v43 = __swift_project_value_buffer(v86, (uint64_t)qword_1EFBC3158);
  v44 = v87;
  sub_1CF94C548(v43, v87);
  DIPSignpost.init(_:)(v44, (uint64_t)v23);
  v45 = (void *)objc_opt_self();
  v46 = (void *)sub_1CFB00E58();
  v47 = (void *)sub_1CFB00E58();
  v92 = 0;
  v93[0] = 0;
  v90 = 0;
  v91 = 0;
  v48 = objc_msgSend(v45, sel_appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey_progenitorPublicKey_encryptedPrivateKey_attestation_publicKey_keyBlob_, v46, v47, v93, &v92, &v91, &v90);

  v49 = v90;
  v50 = v91;
  v51 = v92;
  v52 = (void *)v93[0];
  if (!v48 && v93[0] && v92 && v91 && v90)
  {
    v53 = v90;
    v54 = v50;
    v89 = v23;
    v55 = v54;
    v56 = v51;
    v57 = v52;
    v58 = v56;
    v59 = v55;
    v60 = v53;
    v61 = sub_1CFB00E7C();
    v87 = v62;
    v88 = v61;
    v63 = v58;
    v86 = sub_1CFB00E7C();
    v85 = v64;

    v65 = v59;
    v84 = sub_1CFB00E7C();
    v67 = v66;

    v68 = v60;
    v69 = sub_1CFB00E7C();
    v71 = v70;

    v72 = (uint64_t)v89;
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    result = sub_1CF960F94(v72);
    v74 = v87;
    *a4 = v88;
    a4[1] = v74;
    v75 = v85;
    a4[2] = v86;
    a4[3] = v75;
    a4[4] = v84;
    a4[5] = v67;
    a4[6] = v69;
    a4[7] = v71;
  }
  else
  {
    LOWORD(v93[0]) = 315;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v48;
    v77 = v49;
    v78 = v50;
    v79 = v51;
    v80 = v52;
    v81 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000039, 0x80000001CFB32A30, (__int16 *)v93, 0, v81, 0xD00000000000005ALL, 0x80000001CFB32470, v82, 0xD000000000000049, 0x80000001CFB32A70, 196);
    swift_willThrow();

    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    return sub_1CF960F94((uint64_t)v23);
  }
  return result;
}

uint64_t sub_1CFAC4A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
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
  char *v25;
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
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t result;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t inited;
  id v80;
  id v81;
  id v82;
  id v83;
  unint64_t v84;
  uint64_t v85;
  _QWORD v86[3];
  uint64_t v87;
  uint64_t *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96[6];

  v92 = a1;
  v88 = a5;
  v96[4] = *MEMORY[0x1E0C80C00];
  v90 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v90, v8, v9, v10, v11, v12, v13, v14);
  v91 = (uint64_t)v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  v25 = (char *)v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1CFB012CC();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26, v28, v29, v30, v31, v32, v33, v34);
  v36 = (char *)v86 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v26, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v36, v37, v26);
  v38 = sub_1CFB012B4();
  v39 = sub_1CFB01FC8();
  v40 = os_log_type_enabled(v38, v39);
  v89 = v25;
  if (v40)
  {
    v87 = a4;
    v41 = swift_slowAlloc();
    v86[2] = a3;
    v42 = (uint8_t *)v41;
    v43 = swift_slowAlloc();
    v96[0] = v43;
    v86[1] = a2;
    *(_DWORD *)v42 = 136315138;
    v95 = sub_1CF9C974C(0xD00000000000003BLL, 0x80000001CFB329A0, v96);
    sub_1CFB021C0();
    _os_log_impl(&dword_1CF917000, v38, v39, "AppleIDVManager %s", v42, 0xCu);
    swift_arrayDestroy();
    v44 = v43;
    v25 = v89;
    MEMORY[0x1D17DA6E4](v44, -1, -1);
    MEMORY[0x1D17DA6E4](v42, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v36, v26);
  if (qword_1EFBBD340 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v90, (uint64_t)qword_1EFBC3170);
  v46 = v91;
  sub_1CF94C548(v45, v91);
  DIPSignpost.init(_:)(v46, (uint64_t)v25);
  v47 = (void *)objc_opt_self();
  v48 = (void *)sub_1CFB00E58();
  v49 = (void *)sub_1CFB00E58();
  v96[0] = 0;
  v94 = 0;
  v95 = 0;
  v93 = 0;
  v50 = objc_msgSend(v47, sel_appleIDVUpdatePrearmTrustKeyForWatch_progenitorPublicKey_encryptedPrivateKey_attestation_publicKey_keyBlob_, v48, v49, v96, &v95, &v94, &v93);

  v51 = v93;
  v52 = v94;
  v53 = (void *)v95;
  v54 = (void *)v96[0];
  if (!v50 && v96[0] && v95 && v94 && v93)
  {
    v55 = v93;
    v56 = v52;
    v57 = v53;
    v58 = v54;
    v59 = v57;
    v60 = v56;
    v61 = v55;
    v62 = sub_1CFB00E7C();
    v91 = v63;
    v92 = v62;
    v64 = v59;
    v90 = sub_1CFB00E7C();
    v87 = v65;

    v66 = v60;
    v67 = sub_1CFB00E7C();
    v69 = v68;

    v70 = v61;
    v71 = sub_1CFB00E7C();
    v73 = v72;

    v74 = (uint64_t)v89;
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    result = sub_1CF960F94(v74);
    v76 = v88;
    v77 = v91;
    *v88 = v92;
    v76[1] = v77;
    v78 = v87;
    v76[2] = v90;
    v76[3] = v78;
    v76[4] = v67;
    v76[5] = v69;
    v76[6] = v71;
    v76[7] = v73;
  }
  else
  {
    LOWORD(v96[0]) = 320;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v50;
    v80 = v51;
    v81 = v52;
    v82 = v53;
    v83 = v54;
    v84 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000046, 0x80000001CFB329E0, (__int16 *)v96, 0, v84, 0xD00000000000005ALL, 0x80000001CFB32470, v85, 0xD00000000000003BLL, 0x80000001CFB329A0, 224);
    swift_willThrow();

    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    return sub_1CF960F94((uint64_t)v25);
  }
  return result;
}

uint64_t sub_1CFAC501C(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
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
  char *v43;
  uint64_t v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  NSObject *v57;
  void *v58;
  void (*v59)(char *, uint64_t);
  unint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  id v69;
  void *v70;
  char *v71;
  id v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  id v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  char *v81;
  uint64_t v82;
  uint64_t inited;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  char *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  char *v95;
  NSObject *v96;
  char *v97;
  void (*v98)(char *, uint64_t);
  unint64_t v99;
  void (*v100)(char *, uint64_t, uint64_t);
  uint8_t *v101;
  void *v102;
  uint64_t v103;
  id v104[6];

  v99 = a8;
  v94 = a7;
  v102 = a4;
  v104[4] = *(id *)MEMORY[0x1E0C80C00];
  v15 = sub_1CFB012CC();
  v16 = *(_QWORD *)(v15 - 8);
  v24 = MEMORY[0x1E0C80A78](v15, v17, v18, v19, v20, v21, v22, v23);
  v95 = (char *)&v88 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x1E0C80A78](v24, v26, v27, v28, v29, v30, v31, v32);
  v97 = (char *)&v88 - v34;
  MEMORY[0x1E0C80A78](v33, v35, v36, v37, v38, v39, v40, v41);
  v43 = (char *)&v88 - v42;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v44 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v100 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v101 = (uint8_t *)v44;
  v100(v43, v44, v15);
  sub_1CF9239E0((uint64_t)a1, a2);
  v45 = (unint64_t)v102;
  sub_1CF9239E0(a3, (unint64_t)v102);
  sub_1CF9239E0(a5, a6);
  sub_1CF9239E0((uint64_t)a1, a2);
  sub_1CF9239E0(a3, v45);
  sub_1CF9239E0(a5, a6);
  v46 = sub_1CFB012B4();
  v47 = sub_1CFB01FC8();
  v96 = v46;
  v93 = v47;
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc();
    v91 = v43;
    v49 = v48;
    v90 = (void *)swift_slowAlloc();
    v104[0] = v90;
    *(_DWORD *)v49 = 136315650;
    v50 = sub_1CFB00E64();
    v92 = v15;
    v103 = sub_1CF9C974C(v50, v51, (uint64_t *)v104);
    v89 = v16;
    v52 = (unint64_t)v102;
    v98 = a1;
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24((uint64_t)v98, a2);
    sub_1CF923A24((uint64_t)v98, a2);
    *(_WORD *)(v49 + 12) = 2080;
    v53 = sub_1CFB00E64();
    v103 = sub_1CF9C974C(v53, v54, (uint64_t *)v104);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(a3, v52);
    sub_1CF923A24(a3, v52);
    *(_WORD *)(v49 + 22) = 2080;
    v55 = sub_1CFB00E64();
    v103 = sub_1CF9C974C(v55, v56, (uint64_t *)v104);
    sub_1CFB021C0();
    v15 = v92;
    swift_bridgeObjectRelease();
    sub_1CF923A24(a5, a6);
    sub_1CF923A24(a5, a6);
    v57 = v96;
    _os_log_impl(&dword_1CF917000, v96, (os_log_type_t)v93, "AppleIDVManager generatePhoneToken nonce: %s aclBlob: %s, keyBlob: %s", (uint8_t *)v49, 0x20u);
    v58 = v90;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v58, -1, -1);
    MEMORY[0x1D17DA6E4](v49, -1, -1);

    v59 = *(void (**)(char *, uint64_t))(v89 + 8);
    v59(v91, v15);
  }
  else
  {
    sub_1CF923A24((uint64_t)a1, a2);
    sub_1CF923A24((uint64_t)a1, a2);
    v60 = (unint64_t)v102;
    sub_1CF923A24(a3, (unint64_t)v102);
    sub_1CF923A24(a3, v60);
    sub_1CF923A24(a5, a6);
    sub_1CF923A24(a5, a6);

    v59 = *(void (**)(char *, uint64_t))(v16 + 8);
    v59(v43, v15);
  }
  v61 = (uint64_t)v97;
  v100(v97, (uint64_t)v101, v15);
  sub_1CF9239E0(a5, a6);
  sub_1CF9CBDEC(v61, a5, a6);
  sub_1CF923A24(a5, a6);
  v98 = v59;
  v59((char *)v61, v15);
  v62 = (void *)sub_1CFB00E58();
  v63 = (void *)sub_1CFB00E58();
  v64 = (void *)sub_1CFB00E58();
  if (v99 >> 60 == 15)
    v65 = 0;
  else
    v65 = (void *)sub_1CFB00E58();
  if (a10 >> 60 == 15)
    v66 = 0;
  else
    v66 = (void *)sub_1CFB00E58();
  v67 = (void *)objc_opt_self();
  v104[0] = 0;
  v68 = objc_msgSend(v67, sel_appleIDVGeneratePhoneTokenWithNonce_withReferenceACLBlob_keyBlob_keyAttestation_casdCertificate_phoneToken_, v62, v63, v64, v65, v66, v104);

  v69 = v104[0];
  v70 = v69;
  if (v68 || !v69)
  {
    LOWORD(v104[0]) = 308;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v68;
    v84 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000025, 0x80000001CFB32900, (__int16 *)v104, 0, v84, 0xD00000000000005ALL, 0x80000001CFB32470, v85, 0xD00000000000004DLL, 0x80000001CFB32930, 241);
    swift_willThrow();

  }
  else
  {
    v71 = v95;
    v100(v95, (uint64_t)v101, v15);
    v72 = v70;
    v73 = sub_1CFB012B4();
    v74 = sub_1CFB01FC8();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      v102 = (void *)swift_slowAlloc();
      v104[0] = v102;
      v92 = v15;
      *(_DWORD *)v75 = 136315138;
      v101 = v75 + 4;
      v76 = objc_msgSend(v72, sel_base64EncodedStringWithOptions_, 0);
      v77 = sub_1CFB01A28();
      v79 = v78;

      v103 = sub_1CF9C974C(v77, v79, (uint64_t *)v104);
      sub_1CFB021C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF917000, v73, v74, "AppleIDVManager generatePhoneToken returned successfully, token: %s", v75, 0xCu);
      v80 = v102;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v80, -1, -1);
      MEMORY[0x1D17DA6E4](v75, -1, -1);

      v81 = v95;
      v82 = v92;
    }
    else
    {

      v81 = v71;
      v82 = v15;
    }
    v98(v81, v82);
    v86 = v72;
    v84 = sub_1CFB00E7C();

  }
  return v84;
}

id sub_1CFAC5874(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  NSObject *v46;
  os_log_type_t v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  char *v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  id v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t inited;
  id v79;
  unint64_t v80;
  uint64_t v81;
  id v82;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  uint64_t v88;
  uint8_t *v89;
  char *v90;
  uint8_t *v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95[6];

  v95[4] = *MEMORY[0x1E0C80C00];
  v92 = (void (*)(char *, uint64_t))type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v92, v5, v6, v7, v8, v9, v10, v11);
  v93 = (uint64_t)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v13, v14, v15, v16, v17, v18, v19, v20);
  v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1CFB012CC();
  v24 = *(_QWORD *)(v23 - 8);
  v32 = MEMORY[0x1E0C80A78](v23, v25, v26, v27, v28, v29, v30, v31);
  v34 = (char *)&v84 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32, v35, v36, v37, v38, v39, v40, v41);
  v43 = (char *)&v84 - v42;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v44 = __swift_project_value_buffer(v23, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v45 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  v88 = v44;
  v87 = v45;
  v45(v43, v44, v23);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a1, a2);
  v46 = sub_1CFB012B4();
  v47 = sub_1CFB01FC8();
  v91 = (uint8_t *)v24;
  v48 = v47;
  v49 = os_log_type_enabled(v46, v47);
  v86 = v2;
  v90 = v34;
  if (v49)
  {
    v89 = (uint8_t *)a2;
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = swift_slowAlloc();
    v85 = v23;
    v52 = v51;
    v95[0] = v51;
    *(_DWORD *)v50 = 136315138;
    v84 = v22;
    v53 = sub_1CFB00E64();
    v94 = sub_1CF9C974C(v53, v54, v95);
    v22 = v84;
    sub_1CFB021C0();
    v55 = (unint64_t)v89;
    swift_bridgeObjectRelease();
    sub_1CF923A24(a1, v55);
    sub_1CF923A24(a1, v55);
    _os_log_impl(&dword_1CF917000, v46, v48, "AppleIDVManager establishPrearmTrust with baaCertificate: %s", v50, 0xCu);
    swift_arrayDestroy();
    v56 = v52;
    v23 = v85;
    MEMORY[0x1D17DA6E4](v56, -1, -1);
    MEMORY[0x1D17DA6E4](v50, -1, -1);
  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
  }

  v57 = (void (*)(char *, uint64_t))*((_QWORD *)v91 + 1);
  v57(v43, v23);
  if (qword_1EFBBD348 != -1)
    swift_once();
  v58 = __swift_project_value_buffer((uint64_t)v92, (uint64_t)qword_1EFBC3188);
  v59 = v93;
  sub_1CF94C548(v58, v93);
  DIPSignpost.init(_:)(v59, (uint64_t)v22);
  v60 = (void *)objc_opt_self();
  v61 = (void *)sub_1CFB00E58();
  v95[0] = 0;
  v62 = objc_msgSend(v60, sel_appleIDVEstablishPrearmTrustWithCertificate_protectedPublicKey_, v61, v95);

  v63 = (void *)v95[0];
  if (v62 || !v95[0])
  {
    LOWORD(v95[0]) = 311;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v62;
    v79 = v63;
    v80 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB328A0, (__int16 *)v95, 0, v80, 0xD00000000000005ALL, 0x80000001CFB32470, v81, 0xD000000000000025, 0x80000001CFB328D0, 258);
    swift_willThrow();

    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94((uint64_t)v22);
  }
  else
  {
    v64 = v90;
    v87(v90, v88, v23);
    v65 = v63;
    v66 = sub_1CFB012B4();
    v67 = sub_1CFB01FC8();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v93 = swift_slowAlloc();
      v95[0] = v93;
      v85 = v23;
      v91 = v68;
      *(_DWORD *)v68 = 136315138;
      v89 = v68 + 4;
      v69 = objc_msgSend(v65, sel_base64EncodedStringWithOptions_, 0);
      v70 = sub_1CFB01A28();
      v92 = v57;
      v71 = v22;
      v72 = v70;
      v74 = v73;

      v75 = v72;
      v22 = v71;
      v94 = sub_1CF9C974C(v75, v74, v95);
      sub_1CFB021C0();

      swift_bridgeObjectRelease();
      v76 = v91;
      _os_log_impl(&dword_1CF917000, v66, v67, "AppleIDVManager establishPrearmTrust returned successfully, protected public key: %s", v91, 0xCu);
      v77 = v93;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v77, -1, -1);
      MEMORY[0x1D17DA6E4](v76, -1, -1);

      v92(v90, v85);
    }
    else
    {

      v57(v64, v23);
    }
    v82 = v65;
    v79 = (id)sub_1CFB00E7C();

    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94((uint64_t)v22);
  }
  return v79;
}

id sub_1CFAC5F68()
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
  char *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint8_t *v46;
  uint8_t *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void *v50;
  unsigned int v51;
  void *v52;
  char *v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint8_t *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  uint64_t inited;
  id v68;
  unint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  _QWORD v74[2];
  uint64_t v75;
  char *v76;
  void (*v77)(char *, uint64_t);
  void (*v78)(char *, uint64_t, uint64_t);
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82[6];

  v1 = v0;
  v82[4] = *MEMORY[0x1E0C80C00];
  v2 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v2, v3, v4, v5, v6, v7, v8, v9);
  v11 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v21 = (char *)v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1CFB012CC();
  v23 = *(_QWORD *)(v22 - 8);
  v31 = MEMORY[0x1E0C80A78](v22, v24, v25, v26, v27, v28, v29, v30);
  v80 = (char *)v74 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31, v33, v34, v35, v36, v37, v38, v39);
  v41 = (char *)v74 - v40;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v42 = __swift_project_value_buffer(v22, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v78 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v79 = v42;
  v78(v41, v42, v22);
  v43 = sub_1CFB012B4();
  v44 = sub_1CFB01FC8();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v77 = (void (*)(char *, uint64_t))v2;
    v46 = v45;
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_1CF917000, v43, v44, "AppleIDVManager generateNonceOnWatch", v45, 2u);
    v47 = v46;
    v1 = v0;
    v2 = (uint64_t)v77;
    MEMORY[0x1D17DA6E4](v47, -1, -1);
  }

  v48 = *(void (**)(char *, uint64_t))(v23 + 8);
  v48(v41, v22);
  if (qword_1EFBBD350 != -1)
    swift_once();
  v49 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFBC31A0);
  sub_1CF94C548(v49, (uint64_t)v11);
  DIPSignpost.init(_:)((uint64_t)v11, (uint64_t)v21);
  v50 = (void *)objc_opt_self();
  v82[0] = 0;
  v51 = objc_msgSend(v50, sel_appleIDVGenerateNonceOnWatch_, v82);
  v52 = (void *)v82[0];
  if (v51 || !v82[0])
  {
    LOWORD(v82[0]) = 307;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v51;
    v68 = v52;
    v69 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000020, 0x80000001CFB32850, (__int16 *)v82, 0, v69, 0xD00000000000005ALL, 0x80000001CFB32470, v70, 0xD000000000000016, 0x80000001CFB32880, 275);
    swift_willThrow();

    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94((uint64_t)v21);
  }
  else
  {
    v77 = v48;
    v53 = v80;
    v78(v80, v79, v22);
    v54 = v52;
    v55 = sub_1CFB012B4();
    v56 = sub_1CFB01FC8();
    v57 = os_log_type_enabled(v55, v56);
    v76 = v21;
    if (v57)
    {
      v58 = (uint8_t *)swift_slowAlloc();
      v78 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
      v82[0] = (uint64_t)v78;
      v79 = v1;
      *(_DWORD *)v58 = 136315138;
      v74[1] = v58 + 4;
      v59 = objc_msgSend(v54, sel_base64EncodedStringWithOptions_, 0);
      v60 = sub_1CFB01A28();
      v75 = v22;
      v61 = v60;
      v63 = v62;

      v81 = sub_1CF9C974C(v61, v63, v82);
      sub_1CFB021C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF917000, v55, v56, "AppleIDVManager generateNonceOnWatch returned successfully, nonce: %s", v58, 0xCu);
      v64 = v78;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v64, -1, -1);
      MEMORY[0x1D17DA6E4](v58, -1, -1);

      v65 = v80;
      v66 = v75;
    }
    else
    {

      v65 = v53;
      v66 = v22;
    }
    v77(v65, v66);
    v71 = v54;
    v68 = (id)sub_1CFB00E7C();

    v72 = (uint64_t)v76;
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94(v72);
  }
  return v68;
}

uint64_t sub_1CFAC6520(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
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
  void (*v46)(char *, uint64_t, uint64_t);
  NSObject *v47;
  os_log_type_t v48;
  int v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  os_log_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  uint64_t inited;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v76;
  os_log_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v8 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15);
  v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v18, v19, v20, v21, v22, v23, v24, v25);
  v89 = (uint64_t)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1CFB012CC();
  v88 = *(_QWORD *)(v27 - 8);
  v35 = MEMORY[0x1E0C80A78](v27, v28, v29, v30, v31, v32, v33, v34);
  v83 = (char *)&v76 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v35, v37, v38, v39, v40, v41, v42, v43);
  v87 = (char *)&v76 - v44;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v27, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  v82 = v45;
  v81 = v46;
  v46(v87, v45, v27);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a3, a4);
  sub_1CF9239E0(a1, a2);
  sub_1CF9239E0(a3, a4);
  v47 = sub_1CFB012B4();
  v48 = sub_1CFB01FC8();
  v49 = v48;
  v50 = os_log_type_enabled(v47, v48);
  v85 = a2;
  if (v50)
  {
    v51 = swift_slowAlloc();
    v78 = v49;
    v52 = v51;
    v79 = swift_slowAlloc();
    v91 = v79;
    *(_DWORD *)v52 = 136315394;
    v84 = a3;
    v53 = sub_1CFB00E64();
    v77 = v47;
    v90 = sub_1CF9C974C(v53, v54, &v91);
    v80 = v27;
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
    *(_WORD *)(v52 + 12) = 2080;
    v55 = sub_1CFB00E64();
    v90 = sub_1CF9C974C(v55, v56, &v91);
    v27 = v80;
    v57 = v84;
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF923A24(v57, a4);
    sub_1CF923A24(v57, a4);
    v58 = v77;
    _os_log_impl(&dword_1CF917000, v77, (os_log_type_t)v78, "AppleIDVManager prearmCredential token: %s, protectedPublicKey: %s ", (uint8_t *)v52, 0x16u);
    v59 = v79;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v59, -1, -1);
    MEMORY[0x1D17DA6E4](v52, -1, -1);

  }
  else
  {
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a1, a2);
    sub_1CF923A24(a3, a4);
    sub_1CF923A24(a3, a4);

  }
  v60 = *(void (**)(char *, uint64_t))(v88 + 8);
  v60(v87, v27);
  if (qword_1EFBBD360 != -1)
    swift_once();
  v61 = __swift_project_value_buffer(v8, (uint64_t)qword_1EFBC31D0);
  sub_1CF94C548(v61, (uint64_t)v17);
  DIPSignpost.init(_:)((uint64_t)v17, v89);
  v62 = (void *)objc_opt_self();
  v63 = (void *)sub_1CFB00E58();
  v64 = (void *)sub_1CFB00E58();
  v65 = objc_msgSend(v62, sel_appleIDVPrearmCredentialWithAuthorizationToken_protectedPublicKey_, v63, v64);

  if (v65)
  {
    LOWORD(v91) = 309;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v65;
    v67 = sub_1CF9220B4(inited);
    sub_1CF923828();
    v68 = swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000023, 0x80000001CFB327E0, (__int16 *)&v91, 0, v67, 0xD00000000000005ALL, 0x80000001CFB32470, v69, 0xD00000000000003CLL, 0x80000001CFB32810, 290);
    v86 = v68;
    swift_willThrow();
  }
  else
  {
    v70 = v83;
    v81(v83, v82, v27);
    v71 = sub_1CFB012B4();
    v72 = sub_1CFB01FC8();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_1CF917000, v71, v72, "AppleIDVManager prearmCredential returned successfully", v73, 2u);
      MEMORY[0x1D17DA6E4](v73, -1, -1);
    }

    v60(v70, v27);
  }
  v74 = v89;
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  return sub_1CF960F94(v74);
}

uint64_t sub_1CFAC6B4C()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  char *v44;
  uint8_t *v45;
  uint8_t *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t inited;
  unint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  char *v56;
  uint8_t *v57;
  uint8_t *v58;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  __int16 v64;

  v63 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v63, v0, v1, v2, v3, v4, v5, v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1CFB012CC();
  v20 = *(_QWORD *)(v19 - 8);
  v28 = MEMORY[0x1E0C80A78](v19, v21, v22, v23, v24, v25, v26, v27);
  v30 = (char *)&v60 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28, v31, v32, v33, v34, v35, v36, v37);
  v39 = (char *)&v60 - v38;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v40 = __swift_project_value_buffer(v19, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v61 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v62 = v40;
  v61(v39, v40, v19);
  v41 = sub_1CFB012B4();
  v42 = sub_1CFB01FC8();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v60 = v19;
    v44 = v18;
    v45 = v43;
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_1CF917000, v41, v42, "AppleIDVManager revokeCredentialAuthorizationToken", v43, 2u);
    v46 = v45;
    v18 = v44;
    v19 = v60;
    MEMORY[0x1D17DA6E4](v46, -1, -1);
  }

  v47 = *(void (**)(char *, uint64_t))(v20 + 8);
  v47(v39, v19);
  if (qword_1EFBBD368 != -1)
    swift_once();
  v48 = __swift_project_value_buffer(v63, (uint64_t)qword_1EFBC31E8);
  sub_1CF94C548(v48, (uint64_t)v8);
  DIPSignpost.init(_:)((uint64_t)v8, (uint64_t)v18);
  v49 = objc_msgSend((id)objc_opt_self(), sel_appleIDVRevokeCredentialAuthorizationToken);
  if (v49)
  {
    v50 = v49;
    v64 = 310;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v50;
    v52 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000035, 0x80000001CFB32770, &v64, 0, v52, 0xD00000000000005ALL, 0x80000001CFB32470, v53, 0xD000000000000024, 0x80000001CFB327B0, 304);
    swift_willThrow();
  }
  else
  {
    v61(v30, v62, v19);
    v54 = sub_1CFB012B4();
    v55 = sub_1CFB01FC8();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = v18;
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_1CF917000, v54, v55, "AppleIDVManager revokeCredentialAuthorizationToken returned successfully", v57, 2u);
      v58 = v57;
      v18 = v56;
      MEMORY[0x1D17DA6E4](v58, -1, -1);
    }

    v47(v30, v19);
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  return sub_1CF960F94((uint64_t)v18);
}

char *sub_1CFAC6F70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t), uint64_t a6)
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
  char *v16;
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
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  id v58;
  char *v59;
  uint64_t inited;
  id v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  char *v66;
  id v67;
  char *v68;
  char *v69;
  int64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  id v82;
  unint64_t v83;
  uint64_t v84;
  id v85;
  char *v86;
  _QWORD v88[2];
  uint64_t v89;
  char *v90;
  id v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98[6];

  v92 = a5;
  v93 = a6;
  v91 = a1;
  v98[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = sub_1CFB00F9C();
  v95 = *(_QWORD *)(v7 - 8);
  v96 = v7;
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v16 = (char *)v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v89, v17, v18, v19, v20, v21, v22, v23);
  v90 = (char *)v88 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v25, v26, v27, v28, v29, v30, v31, v32);
  v94 = (uint64_t)v88 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1CFB012CC();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34, v36, v37, v38, v39, v40, v41, v42);
  v44 = (char *)v88 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v34, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v44, v45, v34);
  v46 = sub_1CFB012B4();
  v47 = sub_1CFB01FC8();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v88[0] = a2;
    v49 = v48;
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_1CF917000, v46, v47, "AppleIDVManager persistModifiedACLBlob", v48, 2u);
    MEMORY[0x1D17DA6E4](v49, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v44, v34);
  if (qword_1EFBBD370 != -1)
    swift_once();
  v50 = __swift_project_value_buffer(v89, (uint64_t)qword_1EFBC3200);
  v51 = (uint64_t)v90;
  sub_1CF94C548(v50, (uint64_t)v90);
  v52 = v94;
  DIPSignpost.init(_:)(v51, v94);
  v53 = (void *)objc_opt_self();
  v54 = (void *)sub_1CFB00E58();
  v55 = (void *)sub_1CFB00E58();
  v56 = (void *)sub_1CFB00E58();
  v98[0] = 0;
  v97 = 0;
  v57 = objc_msgSend(v53, sel_appleIDVPersistModifiedACLBlob_withReferenceACLBlob_withLAContextData_intoBlob_returnBioUUIDs_, v54, v55, v56, v98, &v97);

  v58 = v97;
  v59 = (char *)v98[0];
  if (v57)
  {
    LOWORD(v98[0]) = 306;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v57;
    v61 = v58;
    v62 = v59;
    v63 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000029, 0x80000001CFB326A0, (__int16 *)v98, 0, v63, 0xD00000000000005ALL, 0x80000001CFB32470, v64, 0xD000000000000041, 0x80000001CFB326D0, 320);
    swift_willThrow();

LABEL_9:
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94(v52);
    return v59;
  }
  if (!v98[0])
  {
    LOWORD(v98[0]) = 0;
    v82 = v97;
    v83 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000047, 0x80000001CFB32720, (__int16 *)v98, 0, v83, 0xD00000000000005ALL, 0x80000001CFB32470, v84, 0xD000000000000041, 0x80000001CFB326D0, 323);
    swift_willThrow();
    goto LABEL_9;
  }
  if (v97)
  {
    v98[0] = 0;
    v65 = v97;
    v66 = v59;
    v67 = v65;
    v68 = v66;
    sub_1CFB01C98();

    v69 = (char *)v98[0];
    if (v98[0])
    {
      v70 = *((_QWORD *)v98[0] + 2);
      if (v70)
      {
        v90 = v59;
        v91 = v58;
        v98[0] = (id)MEMORY[0x1E0DEE9D8];
        sub_1CF960FD0(0, v70, 0);
        v71 = (*(unsigned __int8 *)(v95 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v95 + 80);
        v89 = (uint64_t)v69;
        v72 = &v69[v71];
        v73 = *(_QWORD *)(v95 + 72);
        v92 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
        v93 = v73;
        do
        {
          v74 = v96;
          v92(v16, v72, v96);
          v75 = sub_1CFB00F60();
          v77 = v76;
          (*(void (**)(char *, uint64_t))(v95 + 8))(v16, v74);
          v78 = v98[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1CF960FD0(0, v78[2] + 1, 1);
            v78 = v98[0];
          }
          v80 = v78[2];
          v79 = v78[3];
          if (v80 >= v79 >> 1)
          {
            sub_1CF960FD0(v79 > 1, v80 + 1, 1);
            v78 = v98[0];
          }
          v78[2] = v80 + 1;
          v81 = (char *)&v78[2 * v80];
          *((_QWORD *)v81 + 4) = v75;
          *((_QWORD *)v81 + 5) = v77;
          v72 += v93;
          --v70;
        }
        while (v70);
        swift_bridgeObjectRelease();
        v52 = v94;
        v58 = v91;
        v59 = v90;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    v85 = v98[0];
  }
  v86 = v59;
  v59 = (char *)sub_1CFB00E7C();

  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94(v52);
  return v59;
}

uint64_t sub_1CFAC768C(char a1)
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  char *v38;
  char v39;
  uint8_t *v40;
  uint8_t *v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  id v45;
  unsigned int v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t inited;
  unint64_t v52;
  uint64_t v53;
  id v54;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  id v63;
  unint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v2, v3, v4, v5, v6, v7, v8, v9);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1CFB012CC();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22, v24, v25, v26, v27, v28, v29, v30);
  v32 = (char *)&v61 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v33 = __swift_project_value_buffer(v22, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v32, v33, v22);
  v34 = sub_1CFB012B4();
  v35 = sub_1CFB01FC8();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v62 = v11;
    v37 = v2;
    v38 = v21;
    v39 = a1;
    v40 = v36;
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_1CF917000, v34, v35, "AppleIDVManager prepareUnboundACLForWatch", v36, 2u);
    v41 = v40;
    a1 = v39;
    v21 = v38;
    v2 = v37;
    v11 = v62;
    MEMORY[0x1D17DA6E4](v41, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v32, v22);
  if (qword_1EFBBD378 != -1)
    swift_once();
  v42 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFBC3218);
  sub_1CF94C548(v42, (uint64_t)v11);
  DIPSignpost.init(_:)((uint64_t)v11, (uint64_t)v21);
  v43 = (void *)objc_opt_self();
  v63 = 0;
  v44 = objc_msgSend(v43, sel_prepareUnboundACLForWatch_withAccessibilityEnabled_, &v63, a1 & 1);
  v45 = v63;
  if (v44)
  {
    v46 = v44;
    v63 = 0;
    v64 = 0xE000000000000000;
    v47 = v45;
    sub_1CFB02388();
    sub_1CFB01B30();
    if ((a1 & 1) != 0)
      v48 = 314;
    else
      v48 = 313;
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    v49 = (uint64_t)v63;
    v50 = v64;
    LOWORD(v63) = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v46;
    v52 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v49, v50, (__int16 *)&v63, 0, v52, 0xD00000000000005ALL, 0x80000001CFB32470, v53, 0xD000000000000034, 0x80000001CFB32600, 342);
    swift_willThrow();

  }
  else
  {
    if (v63)
    {
      v54 = v63;
      v50 = sub_1CFB00E7C();

      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94((uint64_t)v21);
      return v50;
    }
    v63 = 0;
    v64 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    if ((a1 & 1) != 0)
      v56 = 314;
    else
      v56 = 313;
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    v57 = (uint64_t)v63;
    v50 = v64;
    LOWORD(v63) = v56;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    v58 = swift_initStackObject();
    *(_OWORD *)(v58 + 16) = xmmword_1CFB05840;
    *(_BYTE *)(v58 + 32) = 20;
    *(_QWORD *)(v58 + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(v58 + 40) = 0;
    v59 = sub_1CF9220B4(v58);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v57, v50, (__int16 *)&v63, 0, v59, 0xD00000000000005ALL, 0x80000001CFB32470, v60, 0xD000000000000034, 0x80000001CFB32600, 345);
    swift_willThrow();
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94((uint64_t)v21);
  return v50;
}

id sub_1CFAC7CAC(unsigned int a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
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
  void (*v46)(char *, uint64_t, uint64_t);
  NSObject *v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  const char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  id v73;
  char *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t inited;
  unint64_t v80;
  uint64_t v81;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t);
  uint64_t v91;
  char *v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  char *v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  void *v102;
  unint64_t v103;
  uint64_t v104;

  v100 = a2;
  v104 = *MEMORY[0x1E0C80C00];
  v95 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v95, v8, v9, v10, v11, v12, v13, v14);
  v96 = (uint64_t)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  v98 = (char *)&v87 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1CFB012CC();
  v26 = *(_QWORD *)(v25 - 8);
  v34 = MEMORY[0x1E0C80A78](v25, v27, v28, v29, v30, v31, v32, v33);
  v92 = (char *)&v87 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v34, v36, v37, v38, v39, v40, v41, v42);
  v44 = (char *)&v87 - v43;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v25, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v91 = v45;
  v90 = v46;
  v46(v44, v45, v25);
  sub_1CF92F5C8(a3, a4);
  sub_1CF92F5C8(a3, a4);
  v47 = sub_1CFB012B4();
  v94 = sub_1CFB01FC8();
  v48 = os_log_type_enabled(v47, (os_log_type_t)v94);
  v99 = a4 >> 60;
  v93 = v4;
  v97 = a1;
  if (v48)
  {
    v89 = v26;
    v88 = v25;
    v49 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    v102 = (void *)v50;
    *(_DWORD *)v49 = 136446722;
    v51 = v50;
    v52 = a1;
    v53 = 0x694220656E6F6850;
    v54 = 0xEE00797274656D6FLL;
    switch(v52)
    {
      case 0u:
        break;
      case 1u:
        v55 = "Phone Accessibility";
        goto LABEL_10;
      case 2u:
        v53 = 0x6942206863746157;
        break;
      case 3u:
        v55 = "Watch Accessibility";
LABEL_10:
        v54 = (unint64_t)(v55 - 32) | 0x8000000000000000;
        v53 = 0xD000000000000013;
        break;
      default:
        v54 = 0xE700000000000000;
        v53 = 0x6E776F6E6B6E55;
        break;
    }
    v101 = sub_1CF9C974C(v53, v54, (uint64_t *)&v102);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 12) = 2082;
    v58 = 0xD000000000000015;
    v59 = 0x80000001CFB323D0;
    v60 = 0xE700000000000000;
    v61 = 0x6E776F6E6B6E55;
    if (v100 == 1)
    {
      v61 = 0xD000000000000013;
      v60 = 0x80000001CFB323F0;
    }
    if (v100 != 2)
    {
      v58 = v61;
      v59 = v60;
    }
    if (v100)
      v62 = v58;
    else
      v62 = 0x6D746E6573657250;
    if (v100)
      v63 = v59;
    else
      v63 = 0xEB00000000746E65;
    v101 = sub_1CF9C974C(v62, v63, (uint64_t *)&v102);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 22) = 2080;
    if (v99 <= 0xE)
    {
      v65 = sub_1CFB00E10();
      v64 = v66;
    }
    else
    {
      v64 = 0xE500000000000000;
      v65 = 0x3E6C696E3CLL;
    }
    v101 = sub_1CF9C974C(v65, v64, (uint64_t *)&v102);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF931AB0(a3, a4);
    sub_1CF931AB0(a3, a4);
    _os_log_impl(&dword_1CF917000, v47, (os_log_type_t)v94, "AppleIDVManager prepareACL, type: %{public}s, usage: %{public}s, bioUUID: %s", (uint8_t *)v49, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v51, -1, -1);
    MEMORY[0x1D17DA6E4](v49, -1, -1);

    v56 = *(void (**)(char *, uint64_t))(v89 + 8);
    v25 = v88;
    v56(v44, v88);
    v57 = (uint64_t)v98;
  }
  else
  {
    sub_1CF931AB0(a3, a4);
    sub_1CF931AB0(a3, a4);

    v56 = *(void (**)(char *, uint64_t))(v26 + 8);
    v56(v44, v25);
    v57 = (uint64_t)v98;
  }
  if (qword_1EFBBD380 != -1)
    swift_once();
  v67 = __swift_project_value_buffer(v95, (uint64_t)qword_1EFBC3230);
  v68 = v96;
  sub_1CF94C548(v67, v96);
  DIPSignpost.init(_:)(v68, v57);
  if (v99 <= 0xE)
    v69 = (void *)sub_1CFB00E58();
  else
    v69 = 0;
  v70 = (void *)objc_opt_self();
  v102 = 0;
  v71 = objc_msgSend(v70, sel_prepareACL_aclType_forAclUsage_forBioUUID_, &v102, v97, v100, v69);

  v72 = v102;
  if (v71)
  {
    v102 = 0;
    v103 = 0xE000000000000000;
    v73 = v72;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    v102 = (void *)0xD00000000000001DLL;
    v103 = 0x80000001CFB32500;
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    v77 = (uint64_t)v102;
    v78 = v103;
    LOWORD(v102) = 316;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v71;
    v80 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v77, v78, (__int16 *)&v102, 0, v80, 0xD00000000000005ALL, 0x80000001CFB32470, v81, 0xD000000000000025, 0x80000001CFB32520, 362);
    swift_willThrow();

LABEL_35:
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    sub_1CF960F94(v57);
    return v73;
  }
  if (!v102)
  {
    v102 = 0;
    v103 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    v73 = v102;
    v83 = v103;
    LOWORD(v102) = 316;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    v84 = swift_initStackObject();
    *(_OWORD *)(v84 + 16) = xmmword_1CFB05840;
    *(_BYTE *)(v84 + 32) = 20;
    *(_QWORD *)(v84 + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(v84 + 40) = 0;
    v85 = sub_1CF9220B4(v84);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, (uint64_t)v73, v83, (__int16 *)&v102, 0, v85, 0xD00000000000005ALL, 0x80000001CFB32470, v86, 0xD000000000000025, 0x80000001CFB32520, 367);
    swift_willThrow();
    goto LABEL_35;
  }
  v74 = v92;
  v90(v92, v91, v25);
  v75 = v72;
  sub_1CF9CC024();

  v56(v74, v25);
  v76 = v75;
  v73 = (id)sub_1CFB00E7C();

  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  sub_1CF960F94(v57);
  return v73;
}

uint64_t sub_1CFAC885C()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  char *v44;
  uint8_t *v45;
  uint8_t *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t inited;
  unint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  char *v56;
  uint8_t *v57;
  uint8_t *v58;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  __int16 v64;

  v63 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v63, v0, v1, v2, v3, v4, v5, v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1CFB012CC();
  v20 = *(_QWORD *)(v19 - 8);
  v28 = MEMORY[0x1E0C80A78](v19, v21, v22, v23, v24, v25, v26, v27);
  v30 = (char *)&v60 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28, v31, v32, v33, v34, v35, v36, v37);
  v39 = (char *)&v60 - v38;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v40 = __swift_project_value_buffer(v19, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  v61 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v62 = v40;
  v61(v39, v40, v19);
  v41 = sub_1CFB012B4();
  v42 = sub_1CFB01FC8();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v60 = v19;
    v44 = v18;
    v45 = v43;
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_1CF917000, v41, v42, "AppleIDVManager credentialAuthenticationTokenStatus", v43, 2u);
    v46 = v45;
    v18 = v44;
    v19 = v60;
    MEMORY[0x1D17DA6E4](v46, -1, -1);
  }

  v47 = *(void (**)(char *, uint64_t))(v20 + 8);
  v47(v39, v19);
  if (qword_1EFBBD388 != -1)
    swift_once();
  v48 = __swift_project_value_buffer(v63, (uint64_t)qword_1EFBC3248);
  sub_1CF94C548(v48, (uint64_t)v8);
  DIPSignpost.init(_:)((uint64_t)v8, (uint64_t)v18);
  v49 = objc_msgSend((id)objc_opt_self(), sel_appleIDVCredentialAuthenticationTokenStatus);
  if (v49)
  {
    v50 = v49;
    v64 = 317;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)(inited + 40) = v50;
    v52 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ELL, 0x80000001CFB32440, &v64, 0, v52, 0xD00000000000005ALL, 0x80000001CFB32470, v53, 0xD000000000000025, 0x80000001CFB324D0, 390);
    swift_willThrow();
  }
  else
  {
    v61(v30, v62, v19);
    v54 = sub_1CFB012B4();
    v55 = sub_1CFB01FC8();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = v18;
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_1CF917000, v54, v55, "AppleIDVManager credentialAuthenticationTokenStatus returned successfully", v57, 2u);
      v58 = v57;
      v18 = v56;
      MEMORY[0x1D17DA6E4](v58, -1, -1);
    }

    v47(v30, v19);
  }
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  return sub_1CF960F94((uint64_t)v18);
}

uint64_t dispatch thunk of AppleIDVManaging.getStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareBioBindingUnboundACL()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppleIDVManaging.preparePasscodeBindingUnboundACL()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppleIDVManaging.persistACLBlob(_:requiresDoublePress:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of AppleIDVManaging.getUUIDsFromACL(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of AppleIDVManaging.requireDoublePressOnACL(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of AppleIDVManaging.recoverPersistedACLBlob(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of AppleIDVManaging.authorizePresentmentForSignature(aclBlob:externalizedLAContext:seSlot:payloadDigest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 64))(a1);
}

uint64_t dispatch thunk of AppleIDVManaging.generatePrearmTrustKeyforWatchAndCopyPublicKey(nonce:prognitorPublicKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of AppleIDVManaging.updatePrearmTrustKeyforWatch(inKeyBlob:prognitorPublicKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of AppleIDVManaging.generatePhoneToken(withNonce:aclBlob:keyBlob:keyAttestation:casdCertificate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a12 + 88))(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppleIDVManaging.establishPrearmTrust(baaCertificate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of AppleIDVManaging.generateNonceOnWatch()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AppleIDVManaging.prearmCredential(withAuthorizationToken:protectedPublicKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 112))();
}

uint64_t dispatch thunk of AppleIDVManaging.revokeCredentialAuthorizationToken()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of AppleIDVManaging.persistModifiedACLBlob(_:referenceACLBlob:externalizedLAContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 128))();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareUnboundACLForWatch(withAccessibilityEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareACL(aclType:aclUsage:bioUUID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 144))();
}

uint64_t dispatch thunk of AppleIDVManaging.credentialAuthenticationTokenStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t type metadata accessor for AppleIDVManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for AppleIDVManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppleIDVManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_1CFAC8EA4()
{
  unint64_t result;

  result = qword_1EFBC4FA8;
  if (!qword_1EFBC4FA8)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB201C8, &type metadata for ASN1OctetString);
    atomic_store(result, (unint64_t *)&qword_1EFBC4FA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1OctetString()
{
  return &type metadata for ASN1OctetString;
}

uint64_t sub_1CFAC8EF8(uint64_t a1)
{
  return sub_1CFAC8F40(a1, 0x7265646165524B53, (uint64_t *)&xmmword_1EFBC4FB0, (unint64_t *)&xmmword_1EFBC4FB0 + 1, &qword_1EFBC4FC0);
}

uint64_t sub_1CFAC8F1C(uint64_t a1)
{
  return sub_1CFAC8F40(a1, 0x6563697665444B53, (uint64_t *)&xmmword_1EFBC4FC8, (unint64_t *)&xmmword_1EFBC4FC8 + 1, &qword_1EFBC4FD8);
}

uint64_t sub_1CFAC8F40(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, _QWORD *a5)
{
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
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;

  v8 = sub_1CFB01A70();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFB01A64();
  v19 = sub_1CFB01A34();
  v21 = v20;
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v18, v8);
  if (v21 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    *a3 = v19;
    *a4 = v21;
    *a5 = 32;
  }
  return result;
}

uint64_t sub_1CFAC9010(uint64_t a1)
{
  return sub_1CFAC9034(a1, 0x7265646165524B53, (uint64_t *)&xmmword_1EFBC4FE0, (unint64_t *)&xmmword_1EFBC4FE0 + 1, &qword_1EFBC4FF0);
}

uint64_t sub_1CFAC9034(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, _QWORD *a5)
{
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
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;

  v8 = sub_1CFB01A70();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFB01A64();
  v19 = sub_1CFB01A34();
  v21 = v20;
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v18, v8);
  if (v21 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    *a3 = v19;
    *a4 = v21;
    *a5 = 16;
  }
  return result;
}

uint64_t sub_1CFAC9104(uint64_t a1)
{
  return sub_1CFAC9034(a1, 0x6563697665444B53, (uint64_t *)&xmmword_1EFBC4FF8, (unint64_t *)&xmmword_1EFBC4FF8 + 1, &qword_1EFBC5008);
}

uint64_t sub_1CFAC9128()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1CF9838DC((uint64_t)&unk_1E8CDE1A8);
  qword_1EFBC5010 = result;
  *(_QWORD *)algn_1EFBC5018 = v1;
  return result;
}

uint64_t sub_1CFAC9150()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1CF9838DC((uint64_t)&unk_1E8CDE1D0);
  qword_1EFBC5020 = result;
  *(_QWORD *)algn_1EFBC5028 = v1;
  return result;
}

BOOL static ISO18013SessionCryptarch.Role.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ISO18013SessionCryptarch.Role.hash(into:)()
{
  return sub_1CFB02A9C();
}

uint64_t ISO18013SessionCryptarch.Role.hashValue.getter()
{
  sub_1CFB02A90();
  sub_1CFB02A9C();
  return sub_1CFB02ACC();
}

CoreIDVShared::ISO18013SessionCryptarch::Curve_optional __swiftcall ISO18013SessionCryptarch.Curve.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CoreIDVShared::ISO18013SessionCryptarch::Curve_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CFB02670();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static ISO18013SessionCryptarch.Curve.allCases.getter()
{
  return &unk_1E8CDE290;
}

uint64_t ISO18013SessionCryptarch.Curve.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFAC9288 + 4 * byte_1CFB20280[*v0]))(909455952, 0xE400000000000000);
}

uint64_t sub_1CFAC9288()
{
  return 876098384;
}

uint64_t sub_1CFAC9294()
{
  return 825374032;
}

uint64_t sub_1CFAC92A0()
{
  return 0x393135353258;
}

uint64_t sub_1CFAC92B4()
{
  return 942945368;
}

void sub_1CFAC92C0(char *a1)
{
  sub_1CFA27CF0(*a1);
}

void sub_1CFAC92CC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CFB02A90();
  __asm { BR              X9 }
}

uint64_t sub_1CFAC9310()
{
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

void sub_1CFAC9370()
{
  __asm { BR              X10 }
}

uint64_t sub_1CFAC93A4()
{
  sub_1CFB01ADC();
  return swift_bridgeObjectRelease();
}

void sub_1CFAC93F0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CFB02A90();
  __asm { BR              X9 }
}

uint64_t sub_1CFAC9430()
{
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

CoreIDVShared::ISO18013SessionCryptarch::Curve_optional sub_1CFAC9490(Swift::String *a1)
{
  return ISO18013SessionCryptarch.Curve.init(rawValue:)(*a1);
}

uint64_t sub_1CFAC949C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1CFAC94C4 + 4 * byte_1CFB20294[*v0]))();
}

void sub_1CFAC94C4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 876098384;
  a1[1] = v1;
}

void sub_1CFAC94D4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 825374032;
  a1[1] = v1;
}

void sub_1CFAC94E4(_QWORD *a1@<X8>)
{
  *a1 = 0x393135353258;
  a1[1] = 0xE600000000000000;
}

void sub_1CFAC94FC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 942945368;
  a1[1] = v1;
}

void sub_1CFAC950C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E8CDE2B8;
}

BOOL static ISO18013SessionCryptarch.Variant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ISO18013SessionCryptarch.Variant.hash(into:)()
{
  return sub_1CFB02A9C();
}

uint64_t ISO18013SessionCryptarch.Variant.hashValue.getter()
{
  sub_1CFB02A90();
  sub_1CFB02A9C();
  return sub_1CFB02ACC();
}

void ISO18013SessionCryptarch.PublicKey.init(curve:data:)(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
  MEMORY[0x1E0C80A78](v20, v21, v22, v23, v24, v25, v26, v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
  MEMORY[0x1E0C80A78](v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
  MEMORY[0x1E0C80A78](v36, v37, v38, v39, v40, v41, v42, v43);
  v44 = *a1;
  *a2 = v44;
  __asm { BR              X10 }
}

uint64_t sub_1CFAC9708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v4 - 96) = v3;
  *(_QWORD *)(v4 - 88) = v1;
  v5 = *(_QWORD *)(v4 - 72);
  result = sub_1CFB01674();
  if (!v5)
  {
    v7 = sub_1CFB0168C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 0, 1, v7);
    v8 = (int *)type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
    sub_1CF931BA0(v2, v0 + v8[5], &qword_1EFBC5050);
    v9 = v0 + v8[6];
    v10 = sub_1CFB0174C();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
    v11 = v0 + v8[7];
    v12 = sub_1CFB017E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = v0 + v8[8];
    v14 = sub_1CFB013EC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
    v15 = v0 + v8[9];
    v16 = sub_1CFB018B4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  }
  return result;
}

uint64_t type metadata accessor for ISO18013SessionCryptarch.PublicKey(uint64_t a1)
{
  return sub_1CF92F550(a1, (uint64_t *)&unk_1EFBC5250);
}

void ISO18013SessionCryptarch.PublicKey.publicKeyData.getter()
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

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
  MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
  MEMORY[0x1E0C80A78](v17, v18, v19, v20, v21, v22, v23, v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
  MEMORY[0x1E0C80A78](v25, v26, v27, v28, v29, v30, v31, v32);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
  MEMORY[0x1E0C80A78](v33, v34, v35, v36, v37, v38, v39, v40);
  __asm { BR              X10 }
}

uint64_t sub_1CFAC9DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  sub_1CF924468(v0 + *(int *)(v2 + 20), v1, &qword_1EFBC5050);
  v3 = sub_1CFB0168C();
  v4 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
  {
    __break(1u);
    JUMPOUT(0x1CFACA03CLL);
  }
  v5 = sub_1CFB01668();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  return v5;
}

void ISO18013SessionCryptarch.PrivateKey.curve.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void ISO18013SessionCryptarch.PrivateKey.publicKeyData.getter()
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
  _QWORD v85[12];

  v1 = sub_1CFB018B4();
  v85[9] = *(_QWORD *)(v1 - 8);
  v85[10] = v1;
  MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v85[8] = (char *)v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v85[11] = (char *)v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1CFB013EC();
  v85[6] = *(_QWORD *)(v19 - 8);
  v85[7] = v19;
  MEMORY[0x1E0C80A78](v19, v20, v21, v22, v23, v24, v25, v26);
  v85[5] = (char *)v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
  MEMORY[0x1E0C80A78](v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = sub_1CFB017E8();
  v85[3] = *(_QWORD *)(v36 - 8);
  v85[4] = v36;
  MEMORY[0x1E0C80A78](v36, v37, v38, v39, v40, v41, v42, v43);
  v85[2] = (char *)v85 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
  MEMORY[0x1E0C80A78](v45, v46, v47, v48, v49, v50, v51, v52);
  v53 = sub_1CFB0174C();
  v85[0] = *(_QWORD *)(v53 - 8);
  v85[1] = v53;
  MEMORY[0x1E0C80A78](v53, v54, v55, v56, v57, v58, v59, v60);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
  MEMORY[0x1E0C80A78](v61, v62, v63, v64, v65, v66, v67, v68);
  v69 = sub_1CFB0168C();
  MEMORY[0x1E0C80A78](v69, v70, v71, v72, v73, v74, v75, v76);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
  MEMORY[0x1E0C80A78](v77, v78, v79, v80, v81, v82, v83, v84);
  __asm { BR              X10 }
}

uint64_t sub_1CFACA2E4()
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

  v5 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
  sub_1CF924468(v3 + *(int *)(v5 + 20), v1, &qword_1EFBC5078);
  v6 = sub_1CFB016D4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v1, 1, v6) == 1)
  {
    __break(1u);
    JUMPOUT(0x1CFACA5B4);
  }
  sub_1CFB016A4();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  v8 = sub_1CFB01668();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
  return v8;
}

uint64_t type metadata accessor for ISO18013SessionCryptarch.PrivateKey(uint64_t a1)
{
  return sub_1CF92F550(a1, (uint64_t *)&unk_1EFBC5318);
}

void ISO18013SessionCryptarch.PrivateKey.init(curve:)(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  *a2 = v3;
  __asm { BR              X10 }
}

uint64_t sub_1CFACA614()
{
  uint64_t v0;
  int *v1;
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

  v1 = (int *)type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
  v2 = v0 + v1[5];
  sub_1CFB016C8();
  v3 = sub_1CFB016D4();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 0, 1, v3);
  v4 = v0 + v1[6];
  v5 = sub_1CFB01788();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = v0 + v1[7];
  v7 = sub_1CFB01824();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = v0 + v1[8];
  v9 = sub_1CFB01428();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = v0 + v1[9];
  v11 = sub_1CFB018F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
}

void ISO18013SessionCryptarch.PrivateKey.init(curve:data:)(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
  MEMORY[0x1E0C80A78](v20, v21, v22, v23, v24, v25, v26, v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
  MEMORY[0x1E0C80A78](v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
  MEMORY[0x1E0C80A78](v36, v37, v38, v39, v40, v41, v42, v43);
  v44 = *a1;
  *a2 = v44;
  __asm { BR              X10 }
}

uint64_t sub_1CFACAB24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v4 - 96) = v3;
  *(_QWORD *)(v4 - 88) = v1;
  v5 = *(_QWORD *)(v4 - 72);
  result = sub_1CFB016BC();
  if (!v5)
  {
    v7 = sub_1CFB016D4();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 0, 1, v7);
    v8 = (int *)type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
    sub_1CF931BA0(v2, v0 + v8[5], &qword_1EFBC5078);
    v9 = v0 + v8[6];
    v10 = sub_1CFB01788();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
    v11 = v0 + v8[7];
    v12 = sub_1CFB01824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = v0 + v8[8];
    v14 = sub_1CFB01428();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
    v15 = v0 + v8[9];
    v16 = sub_1CFB018F0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  }
  return result;
}

void ISO18013SessionCryptarch.PrivateKey.sharedSecretFromKeyAgreement(with:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD v130[8];
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v141 = a1;
  v140 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
  MEMORY[0x1E0C80A78](v2, v3, v4, v5, v6, v7, v8, v9);
  v130[7] = (char *)v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
  MEMORY[0x1E0C80A78](v11, v12, v13, v14, v15, v16, v17, v18);
  v137 = (char *)v130 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CFB018B4();
  v138 = *(_QWORD *)(v20 - 8);
  v139 = v20;
  MEMORY[0x1E0C80A78](v20, v21, v22, v23, v24, v25, v26, v27);
  v130[6] = (char *)v130 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
  MEMORY[0x1E0C80A78](v29, v30, v31, v32, v33, v34, v35, v36);
  v130[5] = (char *)v130 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
  MEMORY[0x1E0C80A78](v38, v39, v40, v41, v42, v43, v44, v45);
  v134 = (char *)v130 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1CFB013EC();
  v135 = *(_QWORD *)(v47 - 8);
  v136 = v47;
  MEMORY[0x1E0C80A78](v47, v48, v49, v50, v51, v52, v53, v54);
  v130[4] = (char *)v130 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
  MEMORY[0x1E0C80A78](v56, v57, v58, v59, v60, v61, v62, v63);
  v130[3] = (char *)v130 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
  MEMORY[0x1E0C80A78](v65, v66, v67, v68, v69, v70, v71, v72);
  v73 = sub_1CFB017E8();
  v132 = *(_QWORD *)(v73 - 8);
  v133 = v73;
  MEMORY[0x1E0C80A78](v73, v74, v75, v76, v77, v78, v79, v80);
  v130[2] = (char *)v130 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
  MEMORY[0x1E0C80A78](v82, v83, v84, v85, v86, v87, v88, v89);
  v130[1] = (char *)v130 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
  MEMORY[0x1E0C80A78](v91, v92, v93, v94, v95, v96, v97, v98);
  v131 = sub_1CFB0174C();
  MEMORY[0x1E0C80A78](v131, v99, v100, v101, v102, v103, v104, v105);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
  MEMORY[0x1E0C80A78](v106, v107, v108, v109, v110, v111, v112, v113);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
  MEMORY[0x1E0C80A78](v114, v115, v116, v117, v118, v119, v120, v121);
  v122 = sub_1CFB0168C();
  MEMORY[0x1E0C80A78](v122, v123, v124, v125, v126, v127, v128, v129);
  __asm { BR              X10 }
}

uint64_t sub_1CFACB46C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  sub_1CF924468(*(_QWORD *)(v5 - 104) + *(int *)(v6 + 20), v3, &qword_1EFBC5050);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 48))(v3, 1, v2) == 1)
  {
    sub_1CF931B1C(v3, &qword_1EFBC5050);
    *(_BYTE *)(v5 - 69) = 4;
    ISO18013SessionError(_:code:fromError:)(0xD00000000000001CLL, 0x80000001CFB32F50, (char *)(v5 - 69), 0);
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v4, v3, v2);
    v8 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
    sub_1CF924468(*(_QWORD *)(v5 - 96) + *(int *)(v8 + 20), v1, &qword_1EFBC5078);
    v9 = sub_1CFB016D4();
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v1, 1, v9) == 1)
    {
      __break(1u);
      JUMPOUT(0x1CFACB9DCLL);
    }
    sub_1CFB01698();
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v4, v2);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v1, v9);
  }
}

uint64_t ISO18013SessionCryptarch.localKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF924468(v1 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, a1, &qword_1EFBC5080);
}

void ISO18013SessionCryptarch.remoteKey.getter(uint64_t a1@<X8>)
{
  sub_1CFACBAA0(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey, &qword_1EFBC50B8, a1);
}

uint64_t sub_1CFACBA34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CF924468(a1, a2, &qword_1EFBC50B8);
}

void ISO18013SessionCryptarch.role.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role);
}

void ISO18013SessionCryptarch.variant.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant);
}

void ISO18013SessionCryptarch.readerSymmetricKey.getter(uint64_t a1@<X8>)
{
  sub_1CFACBAA0(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, &qword_1EFBC50B0, a1);
}

void sub_1CFACBAA0(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  v6 = *(_QWORD *)(v3 + *a1);
  v7 = v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v8);
  sub_1CF924468(v7, a3, a2);
  os_unfair_lock_unlock(v8);
}

uint64_t sub_1CFACBB18(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6, void (*a7)(uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  _BYTE v26[16];
  _BYTE *v27;

  v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v21 = &v26[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1CF924468(a1, (uint64_t)v21, a5);
  v22 = *(_QWORD *)(*a2 + *a6);
  v27 = v21;
  v23 = v22 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v22 + 16);
  v24 = (os_unfair_lock_s *)(v22 + ((*(unsigned int *)(*(_QWORD *)v22 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v24);
  a7(v23);
  os_unfair_lock_unlock(v24);
  return sub_1CF931B1C((uint64_t)v21, a5);
}

void ISO18013SessionCryptarch.deviceSymmetricKey.getter(uint64_t a1@<X8>)
{
  sub_1CFACBAA0(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, &qword_1EFBC50B0, a1);
}

void sub_1CFACBC18(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  v6 = *(_QWORD *)(*a1 + *a4);
  v7 = v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v8);
  a5(v7);
  os_unfair_lock_unlock(v8);
}

uint64_t sub_1CFACBCA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CF924468(a1, a2, &qword_1EFBC50B0);
}

uint64_t ISO18013SessionCryptarch.sentMessageCounter.getter()
{
  return sub_1CFACBCF4(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter);
}

_DWORD *sub_1CFACBCDC@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ISO18013SessionCryptarch.receivedMessageCounter.getter()
{
  return sub_1CFACBCF4(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter);
}

uint64_t sub_1CFACBCF4(_QWORD *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t os_unfair_lock_opaque;

  v2 = *(os_unfair_lock_s **)(v1 + *a1);
  v3 = v2 + 5;
  os_unfair_lock_lock(v2 + 5);
  os_unfair_lock_opaque = v2[4]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v3);
  return os_unfair_lock_opaque;
}

void sub_1CFACBD30(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void (*a3)(uint64_t *__return_ptr, os_unfair_lock_s *)@<X4>, _DWORD *a4@<X8>)
{
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;

  v6 = *(os_unfair_lock_s **)(*a1 + *a2);
  v7 = v6 + 4;
  v8 = v6 + 5;
  os_unfair_lock_lock(v6 + 5);
  a3(&v9, v7);
  os_unfair_lock_unlock(v8);
  *a4 = v9;
}

void sub_1CFACBDA8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, void (*a6)(os_unfair_lock_s *))
{
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;

  v7 = *(os_unfair_lock_s **)(*a2 + *a5);
  v8 = v7 + 4;
  v9 = v7 + 5;
  os_unfair_lock_lock(v7 + 5);
  a6(v8);
  os_unfair_lock_unlock(v9);
}

BOOL ISO18013SessionCryptarch.isReadyForDecryption.getter()
{
  return sub_1CFACBE30(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey);
}

BOOL ISO18013SessionCryptarch.isReadyForEncryption.getter()
{
  return sub_1CFACBE30(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey);
}

BOOL sub_1CFACBE30(_QWORD *a1, _QWORD *a2)
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
  _BOOL8 v15;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFACBEE8(a1, a2, (uint64_t)v13);
  v14 = sub_1CFB014E8();
  v15 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14) != 1;
  sub_1CF931B1C((uint64_t)v13, &qword_1EFBC50B0);
  return v15;
}

void sub_1CFACBEE8(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  if (!*(_BYTE *)(v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role))
    a1 = a2;
  v6 = *(_QWORD *)(v3 + *a1);
  v7 = v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v8);
  sub_1CF924468(v7, a3, &qword_1EFBC50B0);
  os_unfair_lock_unlock(v8);
}

uint64_t ISO18013SessionCryptarch.publicKey.getter()
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
  uint64_t v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5080);
  MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF924468(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, (uint64_t)v10, &qword_1EFBC5080);
  v11 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11) == 1)
  {
    sub_1CF931B1C((uint64_t)v10, &qword_1EFBC5080);
    return 0;
  }
  else
  {
    ISO18013SessionCryptarch.PrivateKey.publicKeyData.getter();
    v12 = v13;
    sub_1CF931994((uint64_t)v10, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
  }
  return v12;
}

uint64_t ISO18013SessionCryptarch.__allocating_init(role:curve:variant:localKey:)(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  ISO18013SessionCryptarch.init(role:curve:variant:localKey:)(a1, a2, a3, a4, a5);
  return v10;
}

_QWORD *ISO18013SessionCryptarch.init(role:curve:variant:localKey:)(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  void *v58;
  id v59;
  uint64_t v60;
  _QWORD v62[2];
  int v63;
  _BYTE *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  int v69;
  char v70;
  unsigned __int8 v71;

  v67 = a4;
  v68 = a5;
  v62[0] = *v5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5080);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v64 = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v18, v19, v20, v21, v22, v23, v24, v25);
  v27 = (char *)v62 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B8);
  MEMORY[0x1E0C80A78](v28, v29, v30, v31, v32, v33, v34, v35);
  v37 = (char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = *a1;
  v63 = *a2;
  LODWORD(v65) = *a3;
  v38 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey;
  v39 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v37, 1, 1, v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50C0);
  v40 = swift_allocObject();
  *(_DWORD *)(v40 + ((*(unsigned int *)(*(_QWORD *)v40 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  v41 = (_QWORD *)MEMORY[0x1E0DEC528];
  sub_1CF924468((uint64_t)v37, v40 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v40 + 16), &qword_1EFBC50B8);
  sub_1CF931B1C((uint64_t)v37, &qword_1EFBC50B8);
  v62[1] = v38;
  *(_QWORD *)((char *)v5 + v38) = v40;
  v42 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey;
  v43 = sub_1CFB014E8();
  v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
  v44(v27, 1, 1, v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50C8);
  v45 = swift_allocObject();
  *(_DWORD *)(v45 + ((*(unsigned int *)(*(_QWORD *)v45 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1CF924468((uint64_t)v27, v45 + *(_QWORD *)(*v41 + *(_QWORD *)v45 + 16), &qword_1EFBC50B0);
  sub_1CF931B1C((uint64_t)v27, &qword_1EFBC50B0);
  *(_QWORD *)((char *)v5 + v42) = v45;
  v46 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey;
  v44(v27, 1, 1, v43);
  v47 = swift_allocObject();
  *(_DWORD *)(v47 + ((*(unsigned int *)(*(_QWORD *)v47 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1CF924468((uint64_t)v27, v47 + *(_QWORD *)(*v41 + *(_QWORD *)v47 + 16), &qword_1EFBC50B0);
  sub_1CF931B1C((uint64_t)v27, &qword_1EFBC50B0);
  *(_QWORD *)((char *)v5 + v46) = v47;
  v48 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50D0);
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = 1;
  *(_QWORD *)((char *)v5 + v48) = v49;
  v50 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter;
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = 1;
  *(_QWORD *)((char *)v5 + v50) = v51;
  *((_BYTE *)v5 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role) = v69;
  v52 = v65;
  *((_BYTE *)v5 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant) = v65;
  if (v52)
  {
    sub_1CF923A24(v67, v68);
    v53 = (char *)v5 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey;
    v54 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v53, 1, 1, v54);
  }
  else
  {
    v65 = v42;
    v71 = v63;
    v56 = v67;
    v55 = v68;
    sub_1CF9239E0(v67, v68);
    v57 = v64;
    v58 = v66;
    ISO18013SessionCryptarch.PrivateKey.init(curve:data:)(&v71, v64);
    if (v58)
    {
      v70 = 3;
      v59 = v58;
      ISO18013SessionError(_:code:fromError:)(0xD000000000000024, 0x80000001CFB32F70, &v70, v58);

      swift_willThrow();
      sub_1CF923A24(v56, v55);

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_deallocPartialClassInstance();
    }
    else
    {
      sub_1CF923A24(v56, v55);
      v60 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v57, 0, 1, v60);
      sub_1CF931BA0((uint64_t)v57, (uint64_t)v5 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, &qword_1EFBC5080);
    }
  }
  return v5;
}

uint64_t ISO18013SessionCryptarch.__allocating_init(role:variant:curve:)(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  ISO18013SessionCryptarch.init(role:variant:curve:)(a1, a2, a3);
  return v6;
}

uint64_t ISO18013SessionCryptarch.init(role:variant:curve:)(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3;
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
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  _BYTE v55[12];
  int v56;
  _BYTE *v57;
  int v58;
  unsigned __int8 v59;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5080);
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v57 = &v55[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  v25 = &v55[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B8);
  MEMORY[0x1E0C80A78](v26, v27, v28, v29, v30, v31, v32, v33);
  v35 = &v55[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v58 = *a1;
  LODWORD(a1) = *a2;
  v56 = *a3;
  v36 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey;
  v37 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v35, 1, 1, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50C0);
  v38 = swift_allocObject();
  *(_DWORD *)(v38 + ((*(unsigned int *)(*(_QWORD *)v38 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  v39 = (_QWORD *)MEMORY[0x1E0DEC528];
  sub_1CF924468((uint64_t)v35, v38 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v38 + 16), &qword_1EFBC50B8);
  sub_1CF931B1C((uint64_t)v35, &qword_1EFBC50B8);
  *(_QWORD *)(v3 + v36) = v38;
  v40 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey;
  v41 = sub_1CFB014E8();
  v42 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56);
  v42(v25, 1, 1, v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50C8);
  v43 = swift_allocObject();
  *(_DWORD *)(v43 + ((*(unsigned int *)(*(_QWORD *)v43 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1CF924468((uint64_t)v25, v43 + *(_QWORD *)(*v39 + *(_QWORD *)v43 + 16), &qword_1EFBC50B0);
  sub_1CF931B1C((uint64_t)v25, &qword_1EFBC50B0);
  *(_QWORD *)(v3 + v40) = v43;
  v44 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey;
  v42(v25, 1, 1, v41);
  v45 = swift_allocObject();
  *(_DWORD *)(v45 + ((*(unsigned int *)(*(_QWORD *)v45 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1CF924468((uint64_t)v25, v45 + *(_QWORD *)(*v39 + *(_QWORD *)v45 + 16), &qword_1EFBC50B0);
  sub_1CF931B1C((uint64_t)v25, &qword_1EFBC50B0);
  *(_QWORD *)(v3 + v44) = v45;
  v46 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50D0);
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 1;
  *(_QWORD *)(v3 + v46) = v47;
  v48 = OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter;
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = 1;
  *(_QWORD *)(v3 + v48) = v49;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role) = v58;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant) = (_BYTE)a1;
  if ((_DWORD)a1)
  {
    v50 = v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey;
    v51 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v50, 1, 1, v51);
  }
  else
  {
    v59 = v56;
    v52 = v57;
    ISO18013SessionCryptarch.PrivateKey.init(curve:)(&v59, v57);
    v53 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v52, 0, 1, v53);
    sub_1CF931BA0((uint64_t)v52, v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, &qword_1EFBC5080);
  }
  return v3;
}

void ISO18013SessionCryptarch.setRemoteKey(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  unsigned __int8 *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_unfair_lock_s *v43;
  uint64_t v44;
  void *v45;
  unsigned __int8 v46;
  char v47;
  char v48;
  char v49;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B8);
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5080);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  v25 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26, v28, v29, v30, v31, v32, v33, v34);
  v36 = (unsigned __int8 *)&v44 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant))
  {
    v49 = 1;
    ISO18013SessionError(_:code:fromError:)(0xD000000000000021, 0x80000001CFB32FA0, &v49, 0);
    swift_willThrow();
    return;
  }
  v45 = v3;
  sub_1CF9239E0(a1, a2);
  sub_1CFACF5DC(a1, a2, 26, (void *)0xD000000000000018, 0x80000001CFB33480);
  sub_1CF923A24(a1, a2);
  sub_1CF924468(v2 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, (uint64_t)v25, &qword_1EFBC5080);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_1CF931B1C((uint64_t)v25, &qword_1EFBC5080);
    v48 = 4;
    v37 = ISO18013SessionError(_:code:fromError:)(0xD000000000000023, 0x80000001CFB32FD0, &v48, 0);
    swift_willThrow();
LABEL_7:
    v47 = 4;
    v39 = v37;
    ISO18013SessionError(_:code:fromError:)(0xD000000000000023, 0x80000001CFB33000, &v47, v37);

    swift_willThrow();
    return;
  }
  sub_1CF9243DC((uint64_t)v25, (uint64_t)v36, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
  v46 = *v36;
  sub_1CF9239E0(a1, a2);
  v38 = v45;
  ISO18013SessionCryptarch.PublicKey.init(curve:data:)(&v46, v15);
  if (v38)
  {
    sub_1CF931994((uint64_t)v36, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
    v37 = v38;
    goto LABEL_7;
  }
  v40 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v15, 0, 1, v40);
  v41 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey);
  v42 = v41 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v41 + 16);
  v43 = (os_unfair_lock_s *)(v41 + ((*(unsigned int *)(*(_QWORD *)v41 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v43);
  sub_1CF931B1C(v42, &qword_1EFBC50B8);
  sub_1CF924468((uint64_t)v15, v42, &qword_1EFBC50B8);
  os_unfair_lock_unlock(v43);
  sub_1CF931B1C((uint64_t)v15, &qword_1EFBC50B8);
  sub_1CF931994((uint64_t)v36, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
}

void ISO18013SessionCryptarch.deriveSessionKeys(sessionTranscript:ikm:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
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
  os_unfair_lock_s *v64;
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
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  char v84;
  char v85;

  v81 = a4;
  v78 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B8);
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v79 = (char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for ISO18013SessionCryptarch.PublicKey(0);
  v16 = *(_QWORD *)(v75 - 8);
  MEMORY[0x1E0C80A78](v75, v17, v18, v19, v20, v21, v22, v23);
  v25 = (char *)&v74 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5080);
  MEMORY[0x1E0C80A78](v26, v27, v28, v29, v30, v31, v32, v33);
  v35 = (char *)&v74 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for ISO18013SessionCryptarch.PrivateKey(0);
  v37 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36, v38, v39, v40, v41, v42, v43, v44);
  v46 = (char *)&v74 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF9239E0(a1, a2);
  sub_1CFACF5DC(a1, a2, 22, (void *)0xD000000000000014, 0x80000001CFB33460);
  v76 = a1;
  v77 = a2;
  sub_1CF923A24(a1, a2);
  if (*(_BYTE *)(v4 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant))
  {
    if (*(_BYTE *)(v4 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_variant) == 1)
    {
      v47 = v81;
      if (v81 >> 60 == 15)
      {
        v84 = 2;
        v48 = 0xD000000000000022;
        v49 = 0x80000001CFB33050;
        v50 = &v84;
LABEL_9:
        ISO18013SessionError(_:code:fromError:)(v48, v49, v50, 0);
        swift_willThrow();
        return;
      }
      v53 = v78;
      sub_1CF92F5C8(v78, v81);
      sub_1CFACF908(v53, v47, (void *)0x203A4D4B49, 0xE500000000000000);
      sub_1CF931AB0(v53, v47);
      sub_1CFACD834(v76, v77, v53, v47);
    }
    else
    {
      v52 = v81;
      if (v81 >> 60 == 15)
      {
        v85 = 2;
        v48 = 0xD000000000000018;
        v49 = 0x80000001CFB33030;
        v50 = &v85;
        goto LABEL_9;
      }
      v65 = v78;
      sub_1CF92F5C8(v78, v81);
      sub_1CFACF908(v65, v52, (void *)0x203A4D4B49, 0xE500000000000000);
      sub_1CF931AB0(v65, v52);
      sub_1CFAD0C44(v65, v52);
    }
  }
  else
  {
    v81 = v16;
    v51 = (uint64_t)v79;
    sub_1CF924468(v4 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, (uint64_t)v35, &qword_1EFBC5080);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1)
    {
      sub_1CF931B1C((uint64_t)v35, &qword_1EFBC5080);
      v83 = 4;
      v48 = 0xD000000000000023;
      v49 = 0x80000001CFB32FD0;
      v50 = &v83;
      goto LABEL_9;
    }
    v54 = sub_1CF9243DC((uint64_t)v35, (uint64_t)v46, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
    MEMORY[0x1E0C80A78](v54, v55, v56, v57, v58, v59, v60, v61);
    *(&v74 - 2) = (uint64_t)v46;
    sub_1CFAD0620(sub_1CFAD12A8);
    v62 = *(_QWORD *)(v4 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey);
    v63 = v62 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v62 + 16);
    v64 = (os_unfair_lock_s *)(v62 + ((*(unsigned int *)(*(_QWORD *)v62 + 48) + 3) & 0x1FFFFFFFCLL));
    os_unfair_lock_lock(v64);
    sub_1CF924468(v63, v51, &qword_1EFBC50B8);
    if (v80)
    {
      os_unfair_lock_unlock(v64);
      __break(1u);
    }
    else
    {
      os_unfair_lock_unlock(v64);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v51, 1, v75) == 1)
      {
        sub_1CF931B1C(v51, &qword_1EFBC50B8);
        v82 = 1;
        ISO18013SessionError(_:code:fromError:)(0xD000000000000038, 0x80000001CFB33080, &v82, 0);
        swift_willThrow();
      }
      else
      {
        v66 = sub_1CF9243DC(v51, (uint64_t)v25, type metadata accessor for ISO18013SessionCryptarch.PublicKey);
        MEMORY[0x1E0C80A78](v66, v67, v68, v69, v70, v71, v72, v73);
        *(&v74 - 2) = (uint64_t)v25;
        sub_1CFAD0620(sub_1CFAD12E4);
        sub_1CFACD388(v76, v77, (uint64_t)v46, (uint64_t)v25);
        sub_1CF931994((uint64_t)v25, type metadata accessor for ISO18013SessionCryptarch.PublicKey);
      }
      sub_1CF931994((uint64_t)v46, type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
    }
  }
}

uint64_t sub_1CFACD284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  sub_1CFB02388();
  v7 = swift_bridgeObjectRelease();
  v12 = a3;
  v8 = a5(v7);
  v10 = v9;
  sub_1CFA72450(v8, v9);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
  sub_1CFB019BC();
  swift_bridgeObjectRelease();
  sub_1CF923A24(v8, v10);
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return v12;
}

void sub_1CFACD388(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  void *v5;
  uint64_t *v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  os_unfair_lock_s *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  os_unfair_lock_s *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  __int128 v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;

  v6 = v4;
  v77 = a2;
  v72 = *v6;
  v73 = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  v16 = MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15);
  v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v19, v20, v21, v22, v23, v24, v25);
  v27 = (char *)&v66 - v26;
  v28 = sub_1CFB014B8();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28, v30, v31, v32, v33, v34, v35, v36);
  v38 = (char *)&v66 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  ISO18013SessionCryptarch.PrivateKey.sharedSecretFromKeyAgreement(with:)(a4, (uint64_t)v38);
  if (v5)
  {
    LOBYTE(v75) = 5;
    v47 = v5;
    ISO18013SessionError(_:code:fromError:)(0xD000000000000015, 0x80000001CFB333E0, (char *)&v75, v5);

    swift_willThrow();
  }
  else
  {
    v70 = v18;
    v71 = v6;
    v69 = v29;
    MEMORY[0x1E0C80A78](v39, v40, v41, v42, v43, v44, v45, v46);
    sub_1CFAD0620(sub_1CFAD49C8);
    sub_1CFAD0908(v73, v77);
    v49 = v48;
    v51 = v50;
    sub_1CF9239E0(v48, v50);
    sub_1CFACF908(v49, v51, (void *)0x203A746C6153, 0xE600000000000000);
    sub_1CF923A24(v49, v51);
    v52 = sub_1CFB01878();
    v77 = v49;
    v75 = v49;
    v76 = v51;
    v73 = v51;
    if (qword_1EFBBD460 != -1)
      swift_once();
    v74 = xmmword_1EFBC4FB0;
    v53 = sub_1CF920A48(&qword_1EFBBE568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
    sub_1CF942468();
    v72 = v52;
    v67 = v38;
    v68 = v53;
    sub_1CFB014AC();
    v54 = sub_1CFB014E8();
    v55 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56);
    v55(v27, 0, 1, v54);
    v66 = (uint64_t)&v66;
    v56 = *(uint64_t *)((char *)v71 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey);
    v57 = v56 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v56 + 16);
    v58 = (os_unfair_lock_s *)(v56 + ((*(unsigned int *)(*(_QWORD *)v56 + 48) + 3) & 0x1FFFFFFFCLL));
    os_unfair_lock_lock(v58);
    sub_1CF931B1C(v57, &qword_1EFBC50B0);
    sub_1CF924468((uint64_t)v27, v57, &qword_1EFBC50B0);
    os_unfair_lock_unlock(v58);
    sub_1CF931B1C((uint64_t)v27, &qword_1EFBC50B0);
    v75 = v77;
    v76 = v73;
    v59 = v28;
    if (qword_1EFBBD468 != -1)
      swift_once();
    v74 = xmmword_1EFBC4FC8;
    v60 = (uint64_t)v70;
    v61 = v67;
    sub_1CFB014AC();
    v55((char *)v60, 0, 1, v54);
    v62 = *(uint64_t *)((char *)v71 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey);
    v63 = v62 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v62 + 16);
    v64 = (os_unfair_lock_s *)(v62 + ((*(unsigned int *)(*(_QWORD *)v62 + 48) + 3) & 0x1FFFFFFFCLL));
    os_unfair_lock_lock(v64);
    sub_1CF931B1C(v63, &qword_1EFBC50B0);
    sub_1CF924468(v60, v63, &qword_1EFBC50B0);
    v65 = v69;
    os_unfair_lock_unlock(v64);
    sub_1CF931B1C(v60, &qword_1EFBC50B0);
    sub_1CF923A24(v77, v73);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v61, v59);
  }
}

uint64_t sub_1CFACD834(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
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
  char *v27;
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
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  void (*v64)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  os_unfair_lock_s *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_unfair_lock_s *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  _QWORD v94[2];
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  unint64_t v107;

  v103 = *v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  v17 = MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v101 = (char *)v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v19, v20, v21, v22, v23, v24, v25);
  v27 = (char *)v94 - v26;
  v28 = sub_1CFB014E8();
  v29 = *(_QWORD *)(v28 - 8);
  v37 = MEMORY[0x1E0C80A78](v28, v30, v31, v32, v33, v34, v35, v36);
  v102 = (char *)v94 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = MEMORY[0x1E0C80A78](v37, v39, v40, v41, v42, v43, v44, v45);
  v48 = (char *)v94 - v47;
  MEMORY[0x1E0C80A78](v46, v49, v50, v51, v52, v53, v54, v55);
  v57 = (char *)v94 - v56;
  v106 = a3;
  v107 = a4;
  sub_1CF9239E0(a3, a4);
  sub_1CFB014D0();
  sub_1CFAD0908(a1, a2);
  v59 = v58;
  v97 = v60;
  v106 = v60;
  v107 = v58;
  if (qword_1EFBBD470 != -1)
    swift_once();
  v105 = xmmword_1EFBC4FE0;
  v61 = sub_1CFB01878();
  v62 = sub_1CF920A48(&qword_1EFBBE568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  sub_1CF942468();
  v96 = v61;
  v94[1] = v62;
  sub_1CFB015CC();
  v99 = v57;
  v63 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v63(v27, v48, v28);
  v100 = v48;
  v64 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56);
  v64(v27, 0, 1, v28);
  v65 = *(_QWORD *)(v104 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey);
  v66 = v65 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v65 + 16);
  v67 = (os_unfair_lock_s *)(v65 + ((*(unsigned int *)(*(_QWORD *)v65 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v67);
  v98 = v29;
  sub_1CF931B1C(v66, &qword_1EFBC50B0);
  sub_1CF924468((uint64_t)v27, v66, &qword_1EFBC50B0);
  os_unfair_lock_unlock(v67);
  sub_1CF931B1C((uint64_t)v27, &qword_1EFBC50B0);
  v68 = v97;
  v106 = v97;
  v107 = v59;
  v95 = v59;
  if (qword_1EFBBD478 != -1)
    swift_once();
  v105 = xmmword_1EFBC4FF8;
  v69 = v102;
  v70 = v99;
  sub_1CFB015CC();
  v71 = (uint64_t)v101;
  v63(v101, v69, v28);
  v64((char *)v71, 0, 1, v28);
  v72 = *(_QWORD *)(v104 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey);
  v73 = v72 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v72 + 16);
  v74 = (os_unfair_lock_s *)(v72 + ((*(unsigned int *)(*(_QWORD *)v72 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v74);
  sub_1CF931B1C(v73, &qword_1EFBC50B0);
  sub_1CF924468(v71, v73, &qword_1EFBC50B0);
  os_unfair_lock_unlock(v74);
  v75 = sub_1CF931B1C(v71, &qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v75, v76, v77, v78, v79, v80, v81, v82);
  v83 = v100;
  sub_1CFAD0620(sub_1CFAD49D0);
  MEMORY[0x1E0C80A78](v84, v85, v86, v87, v88, v89, v90, v91);
  sub_1CFAD0620(sub_1CFAD49F8);
  sub_1CF923A24(v68, v95);
  v92 = *(void (**)(char *, uint64_t))(v98 + 8);
  v92(v70, v28);
  v92(v69, v28);
  return ((uint64_t (*)(char *, uint64_t))v92)(v83, v28);
}

uint64_t sub_1CFACDCD8()
{
  sub_1CFB02388();
  swift_bridgeObjectRelease();
  sub_1CFB014A0();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 0x7320646572616853;
}

uint64_t static ISO18013SessionCryptarch.getSharedSecretData(sharedSecret:)(uint64_t a1)
{
  return sub_1CFACE700(a1, (uint64_t)sub_1CFACF2CC, (void (*)(uint64_t *__return_ptr, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0CA9378]);
}

uint64_t static ISO18013SessionCryptarch.getKeyData(key:)(uint64_t a1)
{
  return sub_1CFACE700(a1, (uint64_t)sub_1CFACF2CC, (void (*)(uint64_t *__return_ptr, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0CA93A0]);
}

uint64_t sub_1CFACDDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1CFB014C4();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return a3;
}

void ISO18013SessionCryptarch.decrypt(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
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
  char *v32;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
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
  void (*v74)(unint64_t, uint64_t, uint64_t);
  char *v75;
  os_unfair_lock_s *v76;
  uint32_t os_unfair_lock_opaque;
  BOOL v78;
  uint32_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  _QWORD v94[2];
  char *v95;

  v87 = *v2;
  v5 = sub_1CFB015C0();
  v85 = *(_QWORD *)(v5 - 8);
  v86 = v5;
  MEMORY[0x1E0C80A78](v5, v6, v7, v8, v9, v10, v11, v12);
  v89 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CFB01590();
  v90 = *(_QWORD *)(v14 - 8);
  v91 = v14;
  v22 = MEMORY[0x1E0C80A78](v14, v15, v16, v17, v18, v19, v20, v21);
  v88 = (unint64_t)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v24, v25, v26, v27, v28, v29, v30);
  v32 = (char *)&v80 - v31;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v33, v34, v35, v36, v37, v38, v39, v40);
  v42 = (char *)&v80 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_1CFB014E8();
  v44 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43, v45, v46, v47, v48, v49, v50, v51);
  v53 = (char *)&v80 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFACBEE8(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, (uint64_t)v42);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43) == 1)
  {
    sub_1CF931B1C((uint64_t)v42, &qword_1EFBC50B0);
    LOBYTE(v94[0]) = 1;
    ISO18013SessionError(_:code:fromError:)(0xD00000000000002ALL, 0x80000001CFB330C0, (char *)v94, 0);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v53, v42, v43);
    sub_1CF9239E0(a1, a2);
    sub_1CFAD031C(a1, a2, 18, 0xD000000000000010);
    sub_1CF923A24(a1, a2);
    v54 = v95;
    sub_1CFACE3AC();
    if (v54)
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v53, v43);
    }
    else
    {
      v55 = (uint64_t)v32;
      sub_1CFAD1320(a1, a2);
      v57 = v56;
      v83 = v44;
      v84 = v43;
      v95 = v53;
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v64 = swift_retain();
      sub_1CFACFC7C(v64, 38, 0xD000000000000024, 0x80000001CFB33360, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter);
      v65 = swift_release();
      MEMORY[0x1E0C80A78](v65, v66, v67, v68, v69, v70, v71, v72);
      v73 = v87;
      *(&v80 - 2) = v55;
      *(&v80 - 1) = v73;
      sub_1CFAD0620((uint64_t (*)(void))sub_1CFAD14E4);
      sub_1CF9239E0(v59, v57);
      sub_1CFAD031C(v59, v57, 24, 0xD000000000000016);
      sub_1CF923A24(v59, v57);
      sub_1CF9239E0(v63, v61);
      sub_1CFACFF80(v63, v61, (void *)0x6974707972636544);
      sub_1CF923A24(v63, v61);
      v74 = *(void (**)(unint64_t, uint64_t, uint64_t))(v90 + 16);
      v87 = v55;
      v74(v88, v55, v91);
      v94[0] = v59;
      v94[1] = v57;
      v92 = v63;
      v93 = v61;
      v82 = v59;
      sub_1CF9239E0(v59, v57);
      v80 = v63;
      v81 = v61;
      sub_1CF9239E0(v63, v61);
      sub_1CF942468();
      v75 = v89;
      sub_1CFB015B4();
      v88 = v57;
      sub_1CFB0153C();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v75, v86);
      v76 = *(os_unfair_lock_s **)((char *)v2
                                 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter);
      os_unfair_lock_lock(v76 + 5);
      os_unfair_lock_opaque = v76[4]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v76 + 5);
      v78 = __CFADD__(os_unfair_lock_opaque, 1);
      v79 = os_unfair_lock_opaque + 1;
      if (v78)
      {
        __break(1u);
        os_unfair_lock_unlock(v76 + 5);
        __break(1u);
      }
      else
      {
        os_unfair_lock_lock(v76 + 5);
        v76[4]._os_unfair_lock_opaque = v79;
        os_unfair_lock_unlock(v76 + 5);
        sub_1CF923A24(v80, v81);
        sub_1CF923A24(v82, v88);
        (*(void (**)(char *, uint64_t))(v83 + 8))(v95, v84);
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v87, v91);
      }
    }
  }
}

void sub_1CFACE3AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  uint32_t os_unfair_lock_opaque;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int __src;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role) & 1) != 0)
  {
    if (qword_1EFBBD480 != -1)
      swift_once();
    v2 = &qword_1EFBC5010;
  }
  else
  {
    if (qword_1EFBBD488 != -1)
      swift_once();
    v2 = &qword_1EFBC5020;
  }
  v4 = *v2;
  v3 = v2[1];
  v5 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter);
  v6 = v5 + 5;
  sub_1CF9239E0(*v2, v3);
  os_unfair_lock_lock(v5 + 5);
  if (v1)
  {
    os_unfair_lock_unlock(v5 + 5);
    __break(1u);
  }
  else
  {
    os_unfair_lock_opaque = v5[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v5 + 5);
    if (os_unfair_lock_opaque == -1)
    {
      LOBYTE(v17) = 7;
      ISO18013SessionError(_:code:fromError:)(0xD000000000000026, 0x80000001CFB33390, (char *)&v17, 0);
      swift_willThrow();
      v13 = v4;
      v14 = v3;
    }
    else
    {
      os_unfair_lock_lock(v5 + 5);
      v8 = v5[4]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v6);
      __src = bswap32(v8);
      v9 = sub_1CFAE5690(&__src, 4);
      v11 = v10;
      v17 = xmmword_1CFB05A10;
      sub_1CFB00E94();
      sub_1CFB00E94();
      v12 = v17;
      v16 = v17;
      sub_1CF9239E0(v17, *((unint64_t *)&v17 + 1));
      sub_1CF942468();
      sub_1CFB01578();
      sub_1CF923A24(v12, *((unint64_t *)&v12 + 1));
      sub_1CF923A24(v4, v3);
      v13 = v9;
      v14 = v11;
    }
    sub_1CF923A24(v13, v14);
  }
}

unint64_t sub_1CFACE654()
{
  sub_1CFB02388();
  swift_bridgeObjectRelease();
  sub_1CFB0156C();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

uint64_t static ISO18013SessionCryptarch.getNonceData(nonce:)(uint64_t a1)
{
  return sub_1CFACE700(a1, (uint64_t)sub_1CFACF2CC, (void (*)(uint64_t *__return_ptr, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0CA94E0]);
}

uint64_t sub_1CFACE700(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t, _QWORD, _QWORD))
{
  uint64_t v4;

  a3(&v4, a2, 0, MEMORY[0x1E0DEA968]);
  return v4;
}

uint64_t sub_1CFACE750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1CFB02388();
  swift_bridgeObjectRelease();
  sub_1CFA72450(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
  sub_1CFB019BC();
  swift_bridgeObjectRelease();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return a4;
}

void ISO18013SessionCryptarch.encrypt(data:)(char *a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
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
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  os_unfair_lock_s *v99;
  unint64_t v100;
  BOOL v101;
  uint32_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint8_t *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[3];
  uint64_t v126;

  v3 = v2;
  v120 = a1;
  v121 = a2;
  v119 = *v2;
  v4 = sub_1CFB012CC();
  v5 = *(_QWORD *)(v4 - 8);
  v114 = v4;
  v115 = v5;
  MEMORY[0x1E0C80A78](v4, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBBECF0);
  MEMORY[0x1E0C80A78](v15, v16, v17, v18, v19, v20, v21, v22);
  v24 = (char *)&v110 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_1CFB015C0();
  v116 = *(_QWORD *)(v118 - 8);
  v32 = MEMORY[0x1E0C80A78](v118, v25, v26, v27, v28, v29, v30, v31);
  v122 = (uint64_t)&v110 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32, v34, v35, v36, v37, v38, v39, v40);
  v117 = (char *)&v110 - v41;
  v42 = sub_1CFB01590();
  v123 = *(_QWORD *)(v42 - 8);
  v124 = v42;
  MEMORY[0x1E0C80A78](v42, v43, v44, v45, v46, v47, v48, v49);
  v51 = (char *)&v110 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v52, v53, v54, v55, v56, v57, v58, v59);
  v61 = (char *)&v110 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_1CFB014E8();
  v63 = *(_QWORD *)(v62 - 8);
  MEMORY[0x1E0C80A78](v62, v64, v65, v66, v67, v68, v69, v70);
  v72 = (char *)&v110 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFACBEE8(&OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, (uint64_t)v61);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(v61, 1, v62) == 1)
  {
    sub_1CF931B1C((uint64_t)v61, &qword_1EFBC50B0);
    LOBYTE(v125[0]) = 1;
    ISO18013SessionError(_:code:fromError:)(0xD00000000000002ALL, 0x80000001CFB33110, (char *)v125, 0);
    swift_willThrow();
    return;
  }
  v113 = v14;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v72, v61, v62);
  v73 = v126;
  sub_1CFACEF70();
  if (v73)
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v72, v62);
    return;
  }
  v112 = v63;
  v126 = v62;
  v74 = swift_retain();
  sub_1CFACFC7C(v74, 34, 0xD000000000000020, 0x80000001CFB33290, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter);
  v75 = swift_release();
  MEMORY[0x1E0C80A78](v75, v76, v77, v78, v79, v80, v81, v82);
  v83 = v119;
  *(&v110 - 2) = (uint64_t)v51;
  *(&v110 - 1) = v83;
  sub_1CFAD0620((uint64_t (*)(void))sub_1CFAD150C);
  v125[0] = v120;
  v125[1] = v121;
  v85 = v123;
  v84 = v124;
  (*(void (**)(char *, char *, uint64_t))(v123 + 16))(v24, v51, v124);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v85 + 56))(v24, 0, 1, v84);
  sub_1CF942468();
  v86 = v122;
  sub_1CFB01560();
  v120 = v72;
  v121 = v51;
  sub_1CF931B1C((uint64_t)v24, &qword_1EFBBECF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v116 + 32))(v117, v86, v118);
  v87 = sub_1CFB0159C();
  v89 = v88;
  v90 = sub_1CFB015A8();
  v92 = v91;
  sub_1CFAD15C8(v87, v89);
  v94 = v93;
  v96 = v95;
  sub_1CF9239E0(v87, v89);
  sub_1CFAD031C(v87, v89, 24, 0xD000000000000016);
  v110 = v87;
  v111 = v89;
  v97 = v87;
  v98 = 0xD000000000000011;
  sub_1CF923A24(v97, v89);
  sub_1CF9239E0(v90, v92);
  sub_1CFACFF80(v90, v92, (void *)0x6974707972636E45);
  v122 = v90;
  sub_1CF923A24(v90, v92);
  sub_1CF9239E0(v94, v96);
  sub_1CFAD031C(v94, v96, 20, 0xD000000000000012);
  v119 = v94;
  sub_1CF923A24(v94, v96);
  v99 = *(os_unfair_lock_s **)((char *)v3 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter);
  os_unfair_lock_lock(v99 + 5);
  v100 = v92;
  LODWORD(v92) = v99[4];
  os_unfair_lock_unlock(v99 + 5);
  v101 = __CFADD__((_DWORD)v92, 1);
  v102 = v92 + 1;
  if (v101)
  {
    __break(1u);
    goto LABEL_14;
  }
  os_unfair_lock_lock(v99 + 5);
  v99[4]._os_unfair_lock_opaque = v102;
  os_unfair_lock_unlock(v99 + 5);
  if ((_sSo14NSUserDefaultsC13CoreIDVSharedE18globalInternalBool6forKeySbSS_tFZ_0(0xD00000000000002DLL, 0x80000001CFB25350) & 1) != 0)
  {
    v98 = v112;
    if (qword_1ED9054E8 == -1)
    {
LABEL_8:
      v103 = v114;
      v104 = __swift_project_value_buffer(v114, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      v105 = v115;
      (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v113, v104, v103);
      v106 = sub_1CFB012B4();
      v107 = sub_1CFB01FC8();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v108 = 0;
        _os_log_impl(&dword_1CF917000, v106, v107, "Returning random data due to user defaults setting: force improperly encrypted mdoc request", v108, 2u);
        v109 = v108;
        v105 = v115;
        MEMORY[0x1D17DA6E4](v109, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v105 + 8))(v113, v103);
      randomData(numBytes:)(0x32uLL);
      sub_1CF923A24(v110, v111);
      sub_1CF923A24(v122, v100);
      sub_1CF923A24(v119, v96);
      goto LABEL_12;
    }
LABEL_14:
    swift_once();
    goto LABEL_8;
  }
  sub_1CF923A24(v110, v111);
  sub_1CF923A24(v122, v100);
  v98 = v112;
LABEL_12:
  (*(void (**)(char *, uint64_t))(v116 + 8))(v117, v118);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v120, v126);
  (*(void (**)(char *, uint64_t))(v123 + 8))(v121, v124);
}

void sub_1CFACEF70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  uint32_t os_unfair_lock_opaque;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int __src;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_role) & 1) != 0)
  {
    if (qword_1EFBBD488 != -1)
      swift_once();
    v2 = &qword_1EFBC5020;
  }
  else
  {
    if (qword_1EFBBD480 != -1)
      swift_once();
    v2 = &qword_1EFBC5010;
  }
  v4 = *v2;
  v3 = v2[1];
  v5 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter);
  v6 = v5 + 5;
  sub_1CF9239E0(*v2, v3);
  os_unfair_lock_lock(v5 + 5);
  if (v1)
  {
    os_unfair_lock_unlock(v5 + 5);
    __break(1u);
  }
  else
  {
    os_unfair_lock_opaque = v5[4]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v5 + 5);
    if (os_unfair_lock_opaque == -1)
    {
      LOBYTE(v17) = 6;
      ISO18013SessionError(_:code:fromError:)(0xD000000000000022, 0x80000001CFB332C0, (char *)&v17, 0);
      swift_willThrow();
      v13 = v4;
      v14 = v3;
    }
    else
    {
      os_unfair_lock_lock(v5 + 5);
      v8 = v5[4]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v6);
      __src = bswap32(v8);
      v9 = sub_1CFAE5690(&__src, 4);
      v11 = v10;
      v17 = xmmword_1CFB05A10;
      sub_1CFB00E94();
      sub_1CFB00E94();
      v12 = v17;
      v16 = v17;
      sub_1CF9239E0(v17, *((unint64_t *)&v17 + 1));
      sub_1CF942468();
      sub_1CFB01578();
      sub_1CF923A24(v12, *((unint64_t *)&v12 + 1));
      sub_1CF923A24(v4, v3);
      v13 = v9;
      v14 = v11;
    }
    sub_1CF923A24(v13, v14);
  }
}

uint64_t sub_1CFACF218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  os_unfair_lock_s *v8;

  sub_1CFB02388();
  swift_bridgeObjectRelease();
  v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + *a5) + 20);
  os_unfair_lock_lock(v8);
  os_unfair_lock_unlock(v8);
  sub_1CFB027F0();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return a3;
}

uint64_t sub_1CFACF2CC@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1CFACF2E0(a1, a2, a3);
}

uint64_t sub_1CFACF2E0@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  size_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = sub_1CFACF52C(a1, a2);
  v5 = sub_1CF9838DC(v4);
  v7 = v6;
  swift_release();
  sub_1CFA72450(v5, v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
  v8 = sub_1CFB019BC();
  v10 = v9;
  swift_bridgeObjectRelease();
  result = sub_1CF923A24(v5, v7);
  *a3 = v8;
  a3[1] = v10;
  return result;
}

uint64_t ISO18013SessionCryptarch.deinit()
{
  uint64_t v0;

  sub_1CF931B1C(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, &qword_1EFBC5080);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ISO18013SessionCryptarch.__deallocating_deinit()
{
  uint64_t v0;

  sub_1CF931B1C(v0 + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch_localKey, &qword_1EFBC5080);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

_QWORD *sub_1CFACF4C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9054A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

size_t sub_1CFACF52C(size_t result, unint64_t a2)
{
  const void *v3;
  int64_t v4;
  _QWORD *v5;

  if (!result)
    return MEMORY[0x1E0DEE9D8];
  v3 = (const void *)result;
  v4 = a2 - result;
  if (a2 == result)
    return MEMORY[0x1E0DEE9D8];
  if (v4 < 1)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if (!a2)
      goto LABEL_13;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9054A0);
    v5 = (_QWORD *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2)
      goto LABEL_13;
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_1CFACF5DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5)
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
  char *v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  id v28[2];
  uint64_t v29;
  void *v30;
  unint64_t v31;

  v7 = sub_1CFB012CC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9, v10, v11, v12, v13, v14, v15);
  v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v28[0] = v18;
    swift_once();
    v18 = v28[0];
  }
  if (byte_1ED907588 == 1)
  {
    v28[0] = v18;
    v19 = (void *)sub_1CFB01A04();
    v20 = objc_msgSend(v28[0], sel_BOOLForKey_, v19);

    if ((v20 & 1) != 0)
    {
      v30 = 0;
      v31 = 0xE000000000000000;
      sub_1CFB02388();
      swift_bridgeObjectRelease();
      v30 = a4;
      v31 = a5;
      sub_1CFB00E64();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      v22 = v30;
      v21 = v31;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v23 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v17, v23, v7);
      swift_bridgeObjectRetain();
      v24 = sub_1CFB012B4();
      v25 = sub_1CFB01FC8();
      if (os_log_type_enabled(v24, v25))
      {
        v28[0] = v22;
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v29 = v27;
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        v28[1] = (id)sub_1CF9C974C((uint64_t)v28[0], v21, &v29);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v24, v25, "ISO18013SessionCryptarch: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v27, -1, -1);
        MEMORY[0x1D17DA6E4](v26, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v17, v7);
    }
  }
  else
  {

  }
}

void sub_1CFACF908(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
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
  char *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  id v30[2];
  void *v31;
  unint64_t v32;
  uint64_t v33;

  v8 = sub_1CFB012CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v30[0] = v19;
    swift_once();
    v19 = v30[0];
  }
  if (byte_1ED907588 == 1)
  {
    v30[0] = v19;
    v20 = (void *)sub_1CFB01A04();
    v21 = objc_msgSend(v30[0], sel_BOOLForKey_, v20);

    if ((v21 & 1) != 0)
    {
      v31 = a3;
      v32 = a4;
      sub_1CFA72450(a1, a2);
      v33 = v22;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
      sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
      sub_1CFB019BC();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      v24 = v31;
      v23 = v32;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v25 = __swift_project_value_buffer(v8, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v18, v25, v8);
      swift_bridgeObjectRetain();
      v26 = sub_1CFB012B4();
      v27 = sub_1CFB01FC8();
      if (os_log_type_enabled(v26, v27))
      {
        v30[0] = v24;
        v28 = (uint8_t *)swift_slowAlloc();
        v29 = swift_slowAlloc();
        v33 = v29;
        *(_DWORD *)v28 = 136315138;
        swift_bridgeObjectRetain();
        v30[1] = (id)sub_1CF9C974C((uint64_t)v30[0], v23, &v33);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v26, v27, "ISO18013SessionCryptarch: %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v29, -1, -1);
        MEMORY[0x1D17DA6E4](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
    }
  }
  else
  {

  }
}

void sub_1CFACFC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
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
  id v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32[2];
  uint64_t v33;

  v10 = sub_1CFB012CC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v32[0] = v21;
    swift_once();
    v21 = v32[0];
  }
  if (byte_1ED907588 == 1)
  {
    v32[0] = v21;
    v22 = (void *)sub_1CFB01A04();
    v23 = objc_msgSend(v32[0], sel_BOOLForKey_, v22);

    if ((v23 & 1) != 0)
    {
      v24 = (void *)sub_1CFACF218(a1, a2, a3, a4, a5);
      v26 = v25;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v27 = __swift_project_value_buffer(v10, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v20, v27, v10);
      swift_bridgeObjectRetain();
      v28 = sub_1CFB012B4();
      v29 = sub_1CFB01FC8();
      if (os_log_type_enabled(v28, v29))
      {
        v32[0] = v24;
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v33 = v31;
        *(_DWORD *)v30 = 136315138;
        swift_bridgeObjectRetain();
        v32[1] = (id)sub_1CF9C974C((uint64_t)v32[0], v26, &v33);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v28, v29, "ISO18013SessionCryptarch: %s", v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v31, -1, -1);
        MEMORY[0x1D17DA6E4](v30, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
    }
  }
  else
  {

  }
}

void sub_1CFACFF80(uint64_t a1, uint64_t a2, void *a3)
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
  char *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  id v28[2];
  void *v29;
  unint64_t v30;
  uint64_t v31;

  v6 = sub_1CFB012CC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8, v9, v10, v11, v12, v13, v14);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v28[0] = v17;
    swift_once();
    v17 = v28[0];
  }
  if (byte_1ED907588 == 1)
  {
    v28[0] = v17;
    v18 = (void *)sub_1CFB01A04();
    v19 = objc_msgSend(v28[0], sel_BOOLForKey_, v18);

    if ((v19 & 1) != 0)
    {
      v29 = 0;
      v30 = 0xE000000000000000;
      sub_1CFB02388();
      swift_bridgeObjectRelease();
      v29 = a3;
      v30 = 0xEF20676174206E6FLL;
      sub_1CFA72450(a1, a2);
      v31 = v20;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
      sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
      sub_1CFB019BC();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      v22 = v29;
      v21 = v30;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v23 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v16, v23, v6);
      swift_bridgeObjectRetain();
      v24 = sub_1CFB012B4();
      v25 = sub_1CFB01FC8();
      if (os_log_type_enabled(v24, v25))
      {
        v28[0] = v22;
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v31 = v27;
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        v28[1] = (id)sub_1CF9C974C((uint64_t)v28[0], v21, &v31);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v24, v25, "ISO18013SessionCryptarch: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v27, -1, -1);
        MEMORY[0x1D17DA6E4](v26, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    }
  }
  else
  {

  }
}

void sub_1CFAD031C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  id v30[2];
  uint64_t v31;

  v8 = sub_1CFB012CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v30[0] = v19;
    swift_once();
    v19 = v30[0];
  }
  if (byte_1ED907588 == 1)
  {
    v30[0] = v19;
    v20 = (void *)sub_1CFB01A04();
    v21 = objc_msgSend(v30[0], sel_BOOLForKey_, v20);

    if ((v21 & 1) != 0)
    {
      v22 = (void *)sub_1CFACE750(a1, a2, a3, a4);
      v24 = v23;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v25 = __swift_project_value_buffer(v8, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v18, v25, v8);
      swift_bridgeObjectRetain();
      v26 = sub_1CFB012B4();
      v27 = sub_1CFB01FC8();
      if (os_log_type_enabled(v26, v27))
      {
        v30[0] = v22;
        v28 = (uint8_t *)swift_slowAlloc();
        v29 = swift_slowAlloc();
        v31 = v29;
        *(_DWORD *)v28 = 136315138;
        swift_bridgeObjectRetain();
        v30[1] = (id)sub_1CF9C974C((uint64_t)v30[0], v24, &v31);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v26, v27, "ISO18013SessionCryptarch: %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v29, -1, -1);
        MEMORY[0x1D17DA6E4](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
    }
  }
  else
  {

  }
}

void sub_1CFAD0620(uint64_t (*a1)(void))
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
  char *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24[2];
  uint64_t v25;

  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  if (qword_1ED904DB0 != -1)
  {
    v24[0] = v13;
    swift_once();
    v13 = v24[0];
  }
  if (byte_1ED907588 == 1)
  {
    v24[0] = v13;
    v14 = (void *)sub_1CFB01A04();
    v15 = objc_msgSend(v24[0], sel_BOOLForKey_, v14);

    if ((v15 & 1) != 0)
    {
      v16 = (void *)a1();
      v18 = v17;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v19 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v19, v2);
      swift_bridgeObjectRetain();
      v20 = sub_1CFB012B4();
      v21 = sub_1CFB01FC8();
      if (os_log_type_enabled(v20, v21))
      {
        v24[0] = v16;
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v25 = v23;
        *(_DWORD *)v22 = 136315138;
        swift_bridgeObjectRetain();
        v24[1] = (id)sub_1CF9C974C((uint64_t)v24[0], v18, &v25);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v20, v21, "ISO18013SessionCryptarch: %s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v23, -1, -1);
        MEMORY[0x1D17DA6E4](v22, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    }
  }
  else
  {

  }
}

void sub_1CFAD0908(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
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

  v3 = sub_1CFB01878();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940];
  MEMORY[0x1E0C80A78](v3, v5, v6, v7, v8, v9, v10, v11);
  v12 = sub_1CFB0147C();
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  sub_1CF920A48(&qword_1EFBBE568, v4, MEMORY[0x1E0CA9930]);
  sub_1CFB01470();
  __asm { BR              X10 }
}

uint64_t sub_1CFAD0A04()
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

  *(_QWORD *)(v8 - 112) = v6;
  *(_WORD *)(v8 - 104) = v5;
  *(_BYTE *)(v8 - 102) = BYTE2(v5);
  *(_BYTE *)(v8 - 101) = BYTE3(v5);
  *(_BYTE *)(v8 - 100) = BYTE4(v5);
  *(_BYTE *)(v8 - 99) = BYTE5(v5);
  sub_1CFB01458();
  sub_1CF923A24(v6, v5);
  sub_1CFB01464();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v3);
  sub_1CF920A48(&qword_1EFBBE570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA92F0]);
  v9 = sub_1CFB0186C();
  v11 = sub_1CF982DC0(v9, v10);
  swift_bridgeObjectRelease();
  v12 = sub_1CF9838DC(v11);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v0);
  return v12;
}

void sub_1CFAD0C44(uint64_t a1, uint64_t a2)
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
  _QWORD v44[11];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC50B0);
  v11 = MEMORY[0x1E0C80A78](v3, v4, v5, v6, v7, v8, v9, v10);
  v44[10] = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v13, v14, v15, v16, v17, v18, v19);
  v20 = sub_1CFB014E8();
  v28 = MEMORY[0x1E0C80A78](v20, v21, v22, v23, v24, v25, v26, v27);
  v36 = MEMORY[0x1E0C80A78](v28, v29, v30, v31, v32, v33, v34, v35);
  MEMORY[0x1E0C80A78](v36, v37, v38, v39, v40, v41, v42, v43);
  __asm { BR              X9 }
}

uint64_t sub_1CFAD0D58(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  void (*v22)(uint64_t, _QWORD, uint64_t, uint64_t);
  __int128 v23;
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
  void (*v46)(uint64_t, uint64_t);

  if (BYTE6(v2) != 32)
  {
    *(_QWORD *)(v10 - 96) = 0;
    *(_QWORD *)(v10 - 88) = 0xE000000000000000;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v10 - 96) = 0xD000000000000019;
    *(_QWORD *)(v10 - 88) = 0x80000001CFB33440;
    __asm { BR              X11 }
  }
  *(_QWORD *)(v10 - 184) = a1;
  *(_QWORD *)(v10 - 176) = v6;
  *(_QWORD *)(v10 - 144) = v3;
  *(_QWORD *)(v10 - 136) = v1;
  *(_QWORD *)(v10 - 96) = v9;
  *(_QWORD *)(v10 - 88) = v2;
  sub_1CF9239E0(v9, v2);
  sub_1CFB014D0();
  *(_OWORD *)(v10 - 208) = xmmword_1CFB05A10;
  *(_OWORD *)(v10 - 96) = xmmword_1CFB05A10;
  if (qword_1EFBBD460 != -1)
    swift_once();
  *(_OWORD *)(v10 - 112) = xmmword_1EFBC4FB0;
  v11 = sub_1CFB01878();
  v12 = sub_1CF920A48(&qword_1EFBBE568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  v13 = (os_unfair_lock_s *)sub_1CF942468();
  v14 = *(_QWORD *)(v10 - 136);
  v15 = v7;
  *(_QWORD *)(v10 - 168) = v12;
  *(_QWORD *)(v10 - 160) = v11;
  sub_1CFB015CC();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v17 = *(_QWORD *)(v10 - 184);
  *(_QWORD *)(v10 - 192) = v16;
  v16(v8, v14, v17);
  *(_QWORD *)(v10 - 152) = v5;
  v18 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v18(v8, 0, 1, v17);
  v19 = *(_QWORD *)(*(_QWORD *)(v10 - 120)
                  + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey);
  v20 = v19 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v19 + 16);
  v21 = (os_unfair_lock_s *)(v19 + ((*(unsigned int *)(*(_QWORD *)v19 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v21);
  sub_1CF931B1C(v20, &qword_1EFBC50B0);
  sub_1CF924468(v8, v20, &qword_1EFBC50B0);
  if (*(_QWORD *)(v10 - 72))
  {
    os_unfair_lock_unlock(v21);
    __break(1u);
    goto LABEL_13;
  }
  v22 = v18;
  os_unfair_lock_unlock(v21);
  sub_1CF931B1C(v8, &qword_1EFBC50B0);
  *(_OWORD *)(v10 - 96) = *(_OWORD *)(v10 - 208);
  if (qword_1EFBBD478 != -1)
    swift_once();
  v23 = xmmword_1EFBC4FF8;
  *(_OWORD *)(v10 - 112) = xmmword_1EFBC4FF8;
  sub_1CF9239E0(v23, *((unint64_t *)&v23 + 1));
  v24 = v15;
  if (qword_1EFBBD468 != -1)
    swift_once();
  v25 = *(_QWORD *)(v10 - 176);
  sub_1CFB015CC();
  sub_1CF923A24(v23, *((unint64_t *)&v23 + 1));
  v26 = *(_QWORD *)(v10 - 128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 - 192))(v26, v25, v17);
  v22(v26, 0, 1, v17);
  v27 = *(_QWORD *)(*(_QWORD *)(v10 - 120)
                  + OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey);
  v28 = v27 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v27 + 16);
  v13 = (os_unfair_lock_s *)(v27 + ((*(unsigned int *)(*(_QWORD *)v27 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v13);
  sub_1CF931B1C(v28, &qword_1EFBC50B0);
  sub_1CF924468(v26, v28, &qword_1EFBC50B0);
  if (*(_QWORD *)(v10 - 72))
  {
LABEL_13:
    os_unfair_lock_unlock(v13);
    __break(1u);
    JUMPOUT(0x1CFAD1288);
  }
  os_unfair_lock_unlock(v13);
  v29 = sub_1CF931B1C(v26, &qword_1EFBC50B0);
  MEMORY[0x1E0C80A78](v29, v30, v31, v32, v33, v34, v35, v36);
  v37 = *(_QWORD *)(v10 - 136);
  sub_1CFAD0620(sub_1CFAD4A20);
  MEMORY[0x1E0C80A78](v38, v39, v40, v41, v42, v43, v44, v45);
  sub_1CFAD0620(sub_1CFAD4A24);
  v46 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 152) + 8);
  v46(v24, v17);
  v46(v25, v17);
  return ((uint64_t (*)(uint64_t, uint64_t))v46)(v37, v17);
}

uint64_t sub_1CFAD12A8()
{
  uint64_t v0;

  return sub_1CFACD284(*(_QWORD *)(v0 + 16), 20, 0xD000000000000012, 0x80000001CFB33420, (uint64_t (*)(uint64_t))ISO18013SessionCryptarch.PrivateKey.publicKeyData.getter);
}

uint64_t sub_1CFAD12E4()
{
  uint64_t v0;

  return sub_1CFACD284(*(_QWORD *)(v0 + 16), 21, 0xD000000000000013, 0x80000001CFB33400, (uint64_t (*)(uint64_t))ISO18013SessionCryptarch.PublicKey.publicKeyData.getter);
}

void sub_1CFAD1320(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1CFAD1360@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  if (BYTE6(v1) >= 0x10uLL)
  {
    if (a1)
    {
      if (a1 == 1)
      {
        LODWORD(v4) = HIDWORD(v2) - v2;
        if (!__OFSUB__(HIDWORD(v2), (_DWORD)v2))
        {
          v4 = (int)v4;
          goto LABEL_9;
        }
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      v7 = __OFSUB__(v5, v6);
      v4 = v5 - v6;
      if (v7)
        goto LABEL_25;
    }
    else
    {
      v4 = BYTE6(v1);
    }
LABEL_9:
    if (!__OFSUB__(v4, 16))
    {
      if (v4 - 16 < 0)
      {
LABEL_23:
        __break(1u);
        JUMPOUT(0x1CFAD14B8);
      }
      if (!a1)
        goto LABEL_19;
      if (a1 == 1)
      {
        if (!__OFSUB__(HIDWORD(v2), (_DWORD)v2))
          goto LABEL_19;
        goto LABEL_26;
      }
      v9 = *(_QWORD *)(v2 + 16);
      v8 = *(_QWORD *)(v2 + 24);
      v10 = v8 - v9;
      if (__OFSUB__(v8, v9))
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      if (__OFSUB__(v10, 16))
      {
LABEL_28:
        __break(1u);
        JUMPOUT(0x1CFAD14D4);
      }
      if (v10 >= v10 - 16)
      {
LABEL_19:
        v3 = sub_1CFB00EA0();
        sub_1CFB00EA0();
        return v3;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
  v12 = 7;
  ISO18013SessionError(_:code:fromError:)(0xD00000000000001ELL, 0x80000001CFB25B10, &v12, 0);
  swift_willThrow();
  return v3;
}

unint64_t sub_1CFAD14E4()
{
  return sub_1CFACE654();
}

unint64_t sub_1CFAD150C()
{
  return sub_1CFACE654();
}

uint64_t sub_1CFAD1534(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_1CFB00C00();
      swift_allocObject();
      sub_1CFB00BF4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1CFB00E34();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void sub_1CFAD15C8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1CFAD1610()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1CFAD1648 + *((int *)qword_1CFAD16F0 + (v0 >> 62))))();
}

uint64_t sub_1CFAD1658@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  if (__OFADD__(a1, BYTE6(v1)))
  {
    __break(1u);
    JUMPOUT(0x1CFAD16D0);
  }
  v3 = sub_1CFAD1534(a1 + BYTE6(v1));
  sub_1CFB00E94();
  sub_1CFB00E94();
  return v3;
}

unint64_t sub_1CFAD1704()
{
  unint64_t result;

  result = qword_1EFBC50D8;
  if (!qword_1EFBC50D8)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013SessionCryptarch.Role, &type metadata for ISO18013SessionCryptarch.Role);
    atomic_store(result, (unint64_t *)&qword_1EFBC50D8);
  }
  return result;
}

unint64_t sub_1CFAD174C()
{
  unint64_t result;

  result = qword_1EFBC50E0;
  if (!qword_1EFBC50E0)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013SessionCryptarch.Curve, &type metadata for ISO18013SessionCryptarch.Curve);
    atomic_store(result, (unint64_t *)&qword_1EFBC50E0);
  }
  return result;
}

uint64_t sub_1CFAD1790()
{
  return sub_1CF931BE4(&qword_1EFBC50E8, &qword_1EFBC50F0, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_1CFAD17C0()
{
  unint64_t result;

  result = qword_1EFBC50F8;
  if (!qword_1EFBC50F8)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013SessionCryptarch.Variant, &type metadata for ISO18013SessionCryptarch.Variant);
    atomic_store(result, (unint64_t *)&qword_1EFBC50F8);
  }
  return result;
}

void sub_1CFAD1804(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1CFACBC18(a1, a2, a3, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey, (void (*)(uint64_t))sub_1CFACBA34);
}

uint64_t sub_1CFAD1828(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFACBB18(a1, a2, a3, a4, &qword_1EFBC50B8, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__remoteKey, (void (*)(uint64_t))sub_1CFAD4980);
}

void sub_1CFAD1854(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1CFACBC18(a1, a2, a3, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, (void (*)(uint64_t))sub_1CFAD4A28);
}

uint64_t sub_1CFAD1878(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFACBB18(a1, a2, a3, a4, &qword_1EFBC50B0, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__readerSymmetricKey, (void (*)(uint64_t))sub_1CFAD4938);
}

void sub_1CFAD18A4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1CFACBC18(a1, a2, a3, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, (void (*)(uint64_t))sub_1CFACBCA0);
}

uint64_t sub_1CFAD18C8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFACBB18(a1, a2, a3, a4, &qword_1EFBC50B0, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__deviceSymmetricKey, (void (*)(uint64_t))sub_1CFAD4938);
}

void sub_1CFAD18F4(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  sub_1CFACBD30(a1, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_1CFACBCDC, a2);
}

void sub_1CFAD1918(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1CFACBDA8(a1, a2, a3, a4, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__sentMessageCounter, (void (*)(os_unfair_lock_s *))sub_1CFAD492C);
}

void sub_1CFAD193C(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  sub_1CFACBD30(a1, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_1CFAD4A3C, a2);
}

void sub_1CFAD1960(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1CFACBDA8(a1, a2, a3, a4, &OBJC_IVAR____TtC13CoreIDVShared24ISO18013SessionCryptarch__receivedMessageCounter, (void (*)(os_unfair_lock_s *))sub_1CFAD492C);
}

uint64_t sub_1CFAD1984()
{
  return type metadata accessor for ISO18013SessionCryptarch(0);
}

uint64_t type metadata accessor for ISO18013SessionCryptarch(uint64_t a1)
{
  return sub_1CF92F550(a1, (uint64_t *)&unk_1EFBC5128);
}

void sub_1CFAD19A0()
{
  unint64_t v0;

  sub_1CFA1C5C0(319, qword_1EFBC5138, (void (*)(uint64_t))type metadata accessor for ISO18013SessionCryptarch.PrivateKey);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ISO18013SessionCryptarch()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ISO18013SessionCryptarch.__allocating_init(role:curve:variant:localKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ISO18013SessionCryptarch.__allocating_init(role:variant:curve:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionCryptarch.Role(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAD1ABC + 4 * byte_1CFB202AD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CFAD1AF0 + 4 * byte_1CFB202A8[v4]))();
}

uint64_t sub_1CFAD1AF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1AF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAD1B00);
  return result;
}

uint64_t sub_1CFAD1B0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAD1B14);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CFAD1B18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1B20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ISO18013SessionCryptarch.Role()
{
  return &type metadata for ISO18013SessionCryptarch.Role;
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionCryptarch.Curve(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAD1B88 + 4 * byte_1CFB202B7[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1CFAD1BBC + 4 * byte_1CFB202B2[v4]))();
}

uint64_t sub_1CFAD1BBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1BC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAD1BCCLL);
  return result;
}

uint64_t sub_1CFAD1BD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAD1BE0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1CFAD1BE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1BEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ISO18013SessionCryptarch.Curve()
{
  return &type metadata for ISO18013SessionCryptarch.Curve;
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionCryptarch.Variant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAD1C54 + 4 * byte_1CFB202C1[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CFAD1C88 + 4 * byte_1CFB202BC[v4]))();
}

uint64_t sub_1CFAD1C88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1C90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAD1C98);
  return result;
}

uint64_t sub_1CFAD1CA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAD1CACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CFAD1CB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAD1CB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ISO18013SessionCryptarch.Variant()
{
  return &type metadata for ISO18013SessionCryptarch.Variant;
}

uint64_t *initializeBufferWithCopyOfBuffer for ISO18013SessionCryptarch.PublicKey(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1CFB0168C();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v14 = a3[6];
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_1CFB0174C();
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v20 = a3[7];
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    v23 = sub_1CFB017E8();
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v26 = a3[8];
    v27 = (char *)v4 + v26;
    v28 = (char *)a2 + v26;
    v29 = sub_1CFB013EC();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    v32 = a3[9];
    v33 = (char *)v4 + v32;
    v34 = (char *)a2 + v32;
    v35 = sub_1CFB018B4();
    v36 = *(_QWORD *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return v4;
}

uint64_t destroy for ISO18013SessionCryptarch.PublicKey(uint64_t a1, int *a2)
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
  uint64_t result;

  v4 = a1 + a2[5];
  v5 = sub_1CFB0168C();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[6];
  v8 = sub_1CFB0174C();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v10 = a1 + a2[7];
  v11 = sub_1CFB017E8();
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  v13 = a1 + a2[8];
  v14 = sub_1CFB013EC();
  v15 = *(_QWORD *)(v14 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  v16 = a1 + a2[9];
  v17 = sub_1CFB018B4();
  v18 = *(_QWORD *)(v17 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  return result;
}

_BYTE *initializeWithCopy for ISO18013SessionCryptarch.PublicKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB0168C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1CFB0174C();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_1CFB017E8();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB013EC();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[9];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = sub_1CFB018B4();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

_BYTE *assignWithCopy for ISO18013SessionCryptarch.PublicKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_BYTE *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_BYTE *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_BYTE *, uint64_t, uint64_t);
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_BYTE *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB0168C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_1CFB0174C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_13:
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB017E8();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(_BYTE *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_19:
  v33 = a3[8];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = sub_1CFB013EC();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48);
  v39 = v38(v34, 1, v36);
  v40 = v38(v35, 1, v36);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v34, v36);
LABEL_24:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 24))(v34, v35, v36);
LABEL_25:
  v42 = a3[9];
  v43 = &a1[v42];
  v44 = &a2[v42];
  v45 = sub_1CFB018B4();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 24))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_30;
  }
  if (v49)
  {
LABEL_30:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

_BYTE *initializeWithTake for ISO18013SessionCryptarch.PublicKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB0168C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1CFB0174C();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_1CFB017E8();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB013EC();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[9];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = sub_1CFB018B4();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

_BYTE *assignWithTake for ISO18013SessionCryptarch.PublicKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_BYTE *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_BYTE *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_BYTE *, uint64_t, uint64_t);
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_BYTE *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB0168C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_1CFB0174C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_13:
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB017E8();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(_BYTE *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 40))(v25, v26, v27);
LABEL_19:
  v33 = a3[8];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = sub_1CFB013EC();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48);
  v39 = v38(v34, 1, v36);
  v40 = v38(v35, 1, v36);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 32))(v34, v35, v36);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v34, v36);
LABEL_24:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 40))(v34, v35, v36);
LABEL_25:
  v42 = a3[9];
  v43 = &a1[v42];
  v44 = &a2[v42];
  v45 = sub_1CFB018B4();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 40))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_30;
  }
  if (v49)
  {
LABEL_30:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

uint64_t getEnumTagSinglePayload for ISO18013SessionCryptarch.PublicKey()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CFAD2F90(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  unsigned int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((_DWORD)a2 == 251)
  {
    v4 = *a1;
    if (v4 >= 5)
      return v4 - 4;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[7];
        }
        else
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
          v9 = *(_QWORD *)(v14 - 8);
          if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
          {
            v10 = v14;
            v11 = a3[8];
          }
          else
          {
            v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
            v9 = *(_QWORD *)(v10 - 8);
            v11 = a3[9];
          }
        }
      }
    }
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionCryptarch.PublicKey()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_1CFAD30B4(_BYTE *result, uint64_t a2, int a3, int *a4)
{
  _BYTE *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = result;
  if (a3 == 251)
  {
    *result = a2 + 4;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5050);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5048);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5040);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[7];
        }
        else
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5038);
          v9 = *(_QWORD *)(v14 - 8);
          if (*(_DWORD *)(v9 + 84) == a3)
          {
            v10 = v14;
            v11 = a4[8];
          }
          else
          {
            v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5030);
            v9 = *(_QWORD *)(v10 - 8);
            v11 = a4[9];
          }
        }
      }
    }
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_1CFAD31CC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_1CFA1C5C0(319, &qword_1EFBC5260, (void (*)(uint64_t))MEMORY[0x1E0CA9690]);
  if (v0 <= 0x3F)
  {
    sub_1CFA1C5C0(319, &qword_1EFBC5268, (void (*)(uint64_t))MEMORY[0x1E0CA9790]);
    if (v1 <= 0x3F)
    {
      sub_1CFA1C5C0(319, &qword_1EFBC5270, (void (*)(uint64_t))MEMORY[0x1E0CA9880]);
      if (v2 <= 0x3F)
      {
        sub_1CFA1C5C0(319, &qword_1EFBC5278, (void (*)(uint64_t))MEMORY[0x1E0CA9210]);
        if (v3 <= 0x3F)
        {
          sub_1CFA1C5C0(319, qword_1EFBC5280, (void (*)(uint64_t))MEMORY[0x1E0CA99A0]);
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ISO18013SessionCryptarch.PrivateKey(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1CFB016D4();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v14 = a3[6];
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_1CFB01788();
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v20 = a3[7];
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    v23 = sub_1CFB01824();
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v26 = a3[8];
    v27 = (char *)v4 + v26;
    v28 = (char *)a2 + v26;
    v29 = sub_1CFB01428();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    v32 = a3[9];
    v33 = (char *)v4 + v32;
    v34 = (char *)a2 + v32;
    v35 = sub_1CFB018F0();
    v36 = *(_QWORD *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return v4;
}

uint64_t destroy for ISO18013SessionCryptarch.PrivateKey(uint64_t a1, int *a2)
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
  uint64_t result;

  v4 = a1 + a2[5];
  v5 = sub_1CFB016D4();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[6];
  v8 = sub_1CFB01788();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v10 = a1 + a2[7];
  v11 = sub_1CFB01824();
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  v13 = a1 + a2[8];
  v14 = sub_1CFB01428();
  v15 = *(_QWORD *)(v14 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  v16 = a1 + a2[9];
  v17 = sub_1CFB018F0();
  v18 = *(_QWORD *)(v17 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  return result;
}

_BYTE *initializeWithCopy for ISO18013SessionCryptarch.PrivateKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB016D4();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1CFB01788();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_1CFB01824();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB01428();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[9];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = sub_1CFB018F0();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

_BYTE *assignWithCopy for ISO18013SessionCryptarch.PrivateKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_BYTE *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_BYTE *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_BYTE *, uint64_t, uint64_t);
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_BYTE *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB016D4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_1CFB01788();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_13:
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB01824();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(_BYTE *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_19:
  v33 = a3[8];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = sub_1CFB01428();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48);
  v39 = v38(v34, 1, v36);
  v40 = v38(v35, 1, v36);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v34, v36);
LABEL_24:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 24))(v34, v35, v36);
LABEL_25:
  v42 = a3[9];
  v43 = &a1[v42];
  v44 = &a2[v42];
  v45 = sub_1CFB018F0();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 24))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_30;
  }
  if (v49)
  {
LABEL_30:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

_BYTE *initializeWithTake for ISO18013SessionCryptarch.PrivateKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB016D4();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1CFB01788();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_1CFB01824();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB01428();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[9];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = sub_1CFB018F0();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

_BYTE *assignWithTake for ISO18013SessionCryptarch.PrivateKey(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_BYTE *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_BYTE *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_BYTE *, uint64_t, uint64_t);
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_BYTE *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CFB016D4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_1CFB01788();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_13:
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1CFB01824();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(_BYTE *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v28 + 40))(v25, v26, v27);
LABEL_19:
  v33 = a3[8];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = sub_1CFB01428();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48);
  v39 = v38(v34, 1, v36);
  v40 = v38(v35, 1, v36);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 32))(v34, v35, v36);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v34, v36);
LABEL_24:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 40))(v34, v35, v36);
LABEL_25:
  v42 = a3[9];
  v43 = &a1[v42];
  v44 = &a2[v42];
  v45 = sub_1CFB018F0();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 40))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_30;
  }
  if (v49)
  {
LABEL_30:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

uint64_t getEnumTagSinglePayload for ISO18013SessionCryptarch.PrivateKey()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CFAD45BC(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  unsigned int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((_DWORD)a2 == 251)
  {
    v4 = *a1;
    if (v4 >= 5)
      return v4 - 4;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[7];
        }
        else
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
          v9 = *(_QWORD *)(v14 - 8);
          if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
          {
            v10 = v14;
            v11 = a3[8];
          }
          else
          {
            v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
            v9 = *(_QWORD *)(v10 - 8);
            v11 = a3[9];
          }
        }
      }
    }
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionCryptarch.PrivateKey()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_1CFAD46E0(_BYTE *result, uint64_t a2, int a3, int *a4)
{
  _BYTE *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = result;
  if (a3 == 251)
  {
    *result = a2 + 4;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5078);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5070);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5068);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[7];
        }
        else
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5060);
          v9 = *(_QWORD *)(v14 - 8);
          if (*(_DWORD *)(v9 + 84) == a3)
          {
            v10 = v14;
            v11 = a4[8];
          }
          else
          {
            v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5058);
            v9 = *(_QWORD *)(v10 - 8);
            v11 = a4[9];
          }
        }
      }
    }
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_1CFAD47F8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_1CFA1C5C0(319, &qword_1EFBC5328, (void (*)(uint64_t))MEMORY[0x1E0CA96D8]);
  if (v0 <= 0x3F)
  {
    sub_1CFA1C5C0(319, &qword_1EFBC5330, (void (*)(uint64_t))MEMORY[0x1E0CA97C8]);
    if (v1 <= 0x3F)
    {
      sub_1CFA1C5C0(319, &qword_1EFBC5338, (void (*)(uint64_t))MEMORY[0x1E0CA98B8]);
      if (v2 <= 0x3F)
      {
        sub_1CFA1C5C0(319, &qword_1EFBC5340, (void (*)(uint64_t))MEMORY[0x1E0CA9248]);
        if (v3 <= 0x3F)
        {
          sub_1CFA1C5C0(319, qword_1EFBC5348, (void (*)(uint64_t))MEMORY[0x1E0CA99D0]);
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

_DWORD *sub_1CFAD492C(_DWORD *result)
{
  uint64_t v1;

  *result = *(_DWORD *)(v1 + 16);
  return result;
}

uint64_t sub_1CFAD4938(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  sub_1CF931B1C(a1, &qword_1EFBC50B0);
  return sub_1CF924468(v3, a1, &qword_1EFBC50B0);
}

uint64_t sub_1CFAD4980(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  sub_1CF931B1C(a1, &qword_1EFBC50B8);
  return sub_1CF924468(v3, a1, &qword_1EFBC50B8);
}

uint64_t sub_1CFAD49C8()
{
  return sub_1CFACDCD8();
}

uint64_t sub_1CFAD49D0()
{
  uint64_t v0;

  return sub_1CFACDDAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0x6B20726564616552);
}

uint64_t sub_1CFAD49F8()
{
  uint64_t v0;

  return sub_1CFACDDAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0x6B20656369766544);
}

uint64_t sub_1CFAD4A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFACBCA0(a1, a2);
}

_DWORD *sub_1CFAD4A3C@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_1CFACBCDC(a1, a2);
}

uint64_t sub_1CFAD4A54(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  result = *(_QWORD *)a1;
  if (result != a2 || *(unsigned __int8 *)(a1 + 8) != a3 || *(_BYTE *)(a1 + 56) != 1)
  {
    v11 = sub_1CF9A2A08();
    v13 = v12;
    type metadata accessor for ASN1Error.Backing();
    v14 = swift_allocObject();
    *(_BYTE *)(v14 + 16) = 0;
    *(_QWORD *)(v14 + 24) = v11;
    *(_QWORD *)(v14 + 32) = v13;
    *(_QWORD *)(v14 + 40) = 0xD00000000000001CLL;
    *(_QWORD *)(v14 + 48) = 0x80000001CFB334A0;
    *(_QWORD *)(v14 + 56) = 26;
    sub_1CF921074();
    swift_allocError();
    *v15 = v14;
    swift_willThrow();
    return sub_1CF9210B8(a1);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (!__OFSUB__(v6 >> 1, v5))
  {
    if (v6 >> 1 != v5)
    {
      v7 = *(_QWORD *)(a1 + 16);
      v16 = *(_QWORD *)(a1 + 24);
      v8 = *(_QWORD *)(a1 + 48);
      swift_unknownObjectRetain();
      sub_1CFB02388();
      swift_bridgeObjectRelease();
      sub_1CFB027F0();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      type metadata accessor for ASN1Error.Backing();
      v9 = swift_allocObject();
      *(_BYTE *)(v9 + 16) = 1;
      *(_QWORD *)(v9 + 24) = 0xD000000000000021;
      *(_QWORD *)(v9 + 32) = 0x80000001CFB334C0;
      *(_QWORD *)(v9 + 40) = 0xD00000000000001CLL;
      *(_QWORD *)(v9 + 48) = 0x80000001CFB334A0;
      *(_QWORD *)(v9 + 56) = 30;
      sub_1CF921074();
      swift_allocError();
      *v10 = v9;
      swift_willThrow();
      sub_1CF9210B8(a1);
      return j__swift_unknownObjectRelease(v7, v16, v5, v6, v8, 1);
    }
    return sub_1CF9210B8(a1);
  }
  __break(1u);
  return result;
}

uint64_t static IdentityImageQuality.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return byte_1EFBC5390;
}

uint64_t static IdentityImageQuality.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EFBC5390 = a1;
  return result;
}

uint64_t (*static IdentityImageQuality.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t IdentityImageQuality.frontScanSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.backScanSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.frontIDSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.backIDSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.selfieSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.livenessSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.passiveSettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings + 8));
  return v1;
}

uint64_t IdentityImageQuality.livenessBlockingCodes.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes + 8));
  return v1;
}

uint64_t IdentityImageQuality.exploration.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_exploration);
}

uint64_t IdentityImageQuality.bufferSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_bufferSize);
}

uint64_t IdentityImageQuality.blurWindow.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_blurWindow);
}

uint64_t IdentityImageQuality.idScanFrameRate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_idScanFrameRate);
}

uint64_t IdentityImageQuality.videoFrameRate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_videoFrameRate);
}

void *IdentityImageQuality.resizeDimensions.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_resizeDimensions);
  v2 = v1;
  return v1;
}

id IdentityImageQuality.__allocating_init(frontScanSettings:backScanSettings:frontIDSettings:backIDSettings:selfieSettings:livenessSettings:passiveSettings:livenessBlockingCodes:exploration:bufferSize:blurWindow:idScanFrameRate:videoFrameRate:resizeDimensions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23)
{
  objc_class *v23;
  id v24;

  v24 = objc_allocWithZone(v23);
  return IdentityImageQuality.init(frontScanSettings:backScanSettings:frontIDSettings:backIDSettings:selfieSettings:livenessSettings:passiveSettings:livenessBlockingCodes:exploration:bufferSize:blurWindow:idScanFrameRate:videoFrameRate:resizeDimensions:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12, a13, a14, a15, a16 & 1,
           a17,
           a18 & 1,
           a19,
           a20 & 1,
           a21,
           a22 & 1,
           a23);
}

id IdentityImageQuality.init(frontScanSettings:backScanSettings:frontIDSettings:backIDSettings:selfieSettings:livenessSettings:passiveSettings:livenessBlockingCodes:exploration:bufferSize:blurWindow:idScanFrameRate:videoFrameRate:resizeDimensions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26)
{
  _BYTE *v26;
  objc_class *ObjectType;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  objc_super v49;

  ObjectType = (objc_class *)swift_getObjectType();
  v33 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings];
  *v33 = a1;
  v33[1] = a2;
  v34 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings];
  *v34 = a3;
  v34[1] = a4;
  v35 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings];
  *v35 = a5;
  v35[1] = a6;
  v36 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings];
  *v36 = a7;
  v36[1] = a8;
  v37 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings];
  *v37 = a9;
  v37[1] = a10;
  v38 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings];
  *v38 = a11;
  v38[1] = a12;
  v39 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings];
  *v39 = a13;
  v39[1] = a14;
  v40 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes];
  *v40 = a15;
  v40[1] = a16;
  v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_exploration] = a17;
  v41 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_bufferSize];
  *(_QWORD *)v41 = a18;
  v41[8] = a19 & 1;
  v42 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_blurWindow];
  *(_QWORD *)v42 = a20;
  v42[8] = a21 & 1;
  v43 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_idScanFrameRate];
  *(_QWORD *)v43 = a22;
  v43[8] = a23 & 1;
  v44 = &v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_videoFrameRate];
  *(_QWORD *)v44 = a24;
  v44[8] = a25 & 1;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_resizeDimensions] = a26;
  v49.receiver = v26;
  v49.super_class = ObjectType;
  return objc_msgSendSuper2(&v49, sel_init);
}

id IdentityImageQuality.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1CFAD5C28(a1);

  return v4;
}

id IdentityImageQuality.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_1CFAD5C28(a1);

  return v2;
}

Swift::Void __swiftcall IdentityImageQuality.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_1CFB00E58();
  v4 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings + 8) >> 60 == 15)
    v5 = 0;
  else
    v5 = sub_1CFB00E58();
  v6 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_1CFB00E58();
  v8 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings + 8) >> 60 == 15)
    v9 = 0;
  else
    v9 = sub_1CFB00E58();
  v10 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v9, v10);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings + 8) >> 60 == 15)
    v11 = 0;
  else
    v11 = sub_1CFB00E58();
  v12 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings + 8) >> 60 == 15)
    v13 = 0;
  else
    v13 = sub_1CFB00E58();
  v14 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v13, v14);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings + 8) >> 60 == 15)
    v15 = 0;
  else
    v15 = sub_1CFB00E58();
  v16 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v15, v16);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes + 8) >> 60 == 15)
    v17 = 0;
  else
    v17 = sub_1CFB00E58();
  v18 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v17, v18);
  swift_unknownObjectRelease();

  v19 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_exploration);
  v20 = (void *)sub_1CFB01A04();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v19, v20);

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_bufferSize + 8) & 1) != 0)
    v21 = 0;
  else
    v21 = sub_1CFB01F08();
  v22 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v21, v22);
  swift_unknownObjectRelease();

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_blurWindow + 8) & 1) != 0)
    v23 = 0;
  else
    v23 = sub_1CFB01F08();
  v24 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v23, v24);
  swift_unknownObjectRelease();

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_idScanFrameRate + 8) & 1) != 0)
    v25 = 0;
  else
    v25 = sub_1CFB01F08();
  v26 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v25, v26);
  swift_unknownObjectRelease();

  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_videoFrameRate + 8) & 1) != 0)
    v27 = 0;
  else
    v27 = sub_1CFB01F08();
  v28 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v27, v28);
  swift_unknownObjectRelease();

  v29 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_resizeDimensions);
  v30 = (id)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v29, v30);

}

id IdentityImageQuality.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void IdentityImageQuality.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id IdentityImageQuality.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1CFAD5C28(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  id v57;
  char *v58;
  void *v59;
  id v60;
  char *v61;
  void *v62;
  id v63;
  char *v64;
  void *v65;
  id v66;
  char *v67;
  objc_super v69;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1CF977FC0();
  v5 = v2;
  v6 = sub_1CFB02118();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = sub_1CFB00E7C();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  v11 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontScanSettings];
  *v11 = v8;
  v11[1] = v10;
  v12 = sub_1CFB02118();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = sub_1CFB00E7C();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0xF000000000000000;
  }
  v17 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backScanSettings];
  *v17 = v14;
  v17[1] = v16;
  v18 = sub_1CFB02118();
  if (v18)
  {
    v19 = (void *)v18;
    v20 = sub_1CFB00E7C();
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = 0xF000000000000000;
  }
  v23 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_frontIDSettings];
  *v23 = v20;
  v23[1] = v22;
  v24 = sub_1CFB02118();
  if (v24)
  {
    v25 = (void *)v24;
    v26 = sub_1CFB00E7C();
    v28 = v27;

  }
  else
  {
    v26 = 0;
    v28 = 0xF000000000000000;
  }
  v29 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_backIDSettings];
  *v29 = v26;
  v29[1] = v28;
  v30 = sub_1CFB02118();
  if (v30)
  {
    v31 = (void *)v30;
    v32 = sub_1CFB00E7C();
    v34 = v33;

  }
  else
  {
    v32 = 0;
    v34 = 0xF000000000000000;
  }
  v35 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_selfieSettings];
  *v35 = v32;
  v35[1] = v34;
  v36 = sub_1CFB02118();
  if (v36)
  {
    v37 = (void *)v36;
    v38 = sub_1CFB00E7C();
    v40 = v39;

  }
  else
  {
    v38 = 0;
    v40 = 0xF000000000000000;
  }
  v41 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessSettings];
  *v41 = v38;
  v41[1] = v40;
  v42 = sub_1CFB02118();
  if (v42)
  {
    v43 = (void *)v42;
    v44 = sub_1CFB00E7C();
    v46 = v45;

  }
  else
  {
    v44 = 0;
    v46 = 0xF000000000000000;
  }
  v47 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_passiveSettings];
  *v47 = v44;
  v47[1] = v46;
  v48 = sub_1CFB02118();
  if (v48)
  {
    v49 = (void *)v48;
    v50 = sub_1CFB00E7C();
    v52 = v51;

  }
  else
  {
    v50 = 0;
    v52 = 0xF000000000000000;
  }
  v53 = (uint64_t *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_livenessBlockingCodes];
  *v53 = v50;
  v53[1] = v52;
  v54 = (void *)sub_1CFB01A04();
  v55 = objc_msgSend(a1, sel_decodeBoolForKey_, v54);

  v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_exploration] = v55;
  v56 = (void *)sub_1CFB01A04();
  v57 = objc_msgSend(a1, sel_decodeIntegerForKey_, v56);

  v58 = &v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_bufferSize];
  *(_QWORD *)v58 = v57;
  v58[8] = 0;
  v59 = (void *)sub_1CFB01A04();
  v60 = objc_msgSend(a1, sel_decodeIntegerForKey_, v59);

  v61 = &v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_blurWindow];
  *(_QWORD *)v61 = v60;
  v61[8] = 0;
  v62 = (void *)sub_1CFB01A04();
  v63 = objc_msgSend(a1, sel_decodeIntegerForKey_, v62);

  v64 = &v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_idScanFrameRate];
  *(_QWORD *)v64 = v63;
  v64[8] = 0;
  v65 = (void *)sub_1CFB01A04();
  v66 = objc_msgSend(a1, sel_decodeIntegerForKey_, v65);

  v67 = &v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_videoFrameRate];
  *(_QWORD *)v67 = v66;
  v67[8] = 0;
  type metadata accessor for IdentityProofingImageDimensions();
  *(_QWORD *)&v5[OBJC_IVAR____TtC13CoreIDVShared20IdentityImageQuality_resizeDimensions] = sub_1CFB02118();

  v69.receiver = v5;
  v69.super_class = ObjectType;
  return objc_msgSendSuper2(&v69, sel_init);
}

uint64_t type metadata accessor for IdentityImageQuality()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityImageQuality()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityImageQuality.__allocating_init(frontScanSettings:backScanSettings:frontIDSettings:backIDSettings:selfieSettings:livenessSettings:passiveSettings:livenessBlockingCodes:exploration:bufferSize:blurWindow:idScanFrameRate:videoFrameRate:resizeDimensions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 192))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t dispatch thunk of IdentityImageQuality.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t static IdentityProofingLivenessVideoURL.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t IdentityProofingLivenessVideoURL.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF9801EC(v1 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url, a1);
}

void *IdentityProofingLivenessVideoURL.fileHandle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle);
  v2 = v1;
  return v1;
}

uint64_t IdentityProofingLivenessVideoURL.auxiliaryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF9801EC(v1 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL, a1);
}

void *IdentityProofingLivenessVideoURL.auxiliaryFileHandle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle);
  v2 = v1;
  return v1;
}

_QWORD *IdentityProofingLivenessVideoURL.__allocating_init(url:auxiliary:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return IdentityProofingLivenessVideoURL.init(url:auxiliary:)(a1, a2);
}

_QWORD *IdentityProofingLivenessVideoURL.init(url:auxiliary:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
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
  _QWORD *v16;
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
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  id v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  _QWORD *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v61[2];
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  objc_class *ObjectType;
  objc_super v70;
  uint64_t v71;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5440);
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v66 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CFB00DEC();
  v16 = *(_QWORD **)(v15 - 8);
  v24 = MEMORY[0x1E0C80A78](v15, v17, v18, v19, v20, v21, v22, v23);
  v64 = (char *)v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x1E0C80A78](v24, v26, v27, v28, v29, v30, v31, v32);
  v65 = (char *)v61 - v34;
  MEMORY[0x1E0C80A78](v33, v35, v36, v37, v38, v39, v40, v41);
  v43 = (char *)v61 - v42;
  v44 = (uint64_t)&v3[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url];
  v45 = (void (*)(char *, uint64_t, uint64_t))v16[2];
  v45(&v3[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url], a1, v15);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v16[7])(v44, 0, 1, v15);
  v71 = a2;
  v67 = &v3[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL];
  sub_1CF9801EC(a2, (uint64_t)&v3[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL]);
  v46 = sub_1CF9775E8(0, &qword_1EFBC5448);
  v47 = a1;
  v45(v43, a1, v15);
  v48 = v3;
  v49 = v68;
  v50 = sub_1CFAD6654((uint64_t)v43);
  if (v49)
  {
    sub_1CF94C338(v71);
    ((void (*)(uint64_t, uint64_t))v16[1])(v47, v15);
    sub_1CF94C338(v44);
    sub_1CF94C338((uint64_t)v67);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v62 = (void (*)(char *, char *, uint64_t))v45;
    v63 = v46;
    v61[1] = v44;
    v51 = v48;
    v53 = v65;
    v52 = (uint64_t)v66;
    v68 = v47;
    v54 = v51;
    *(_QWORD *)&v51[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle] = v50;
    sub_1CF9801EC(v71, v52);
    v55 = v16;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v16[6])(v52, 1, v15) == 1)
    {
      sub_1CF94C338(v52);
      v56 = 0;
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t))v16[4])(v53, v52, v15);
      v57 = (uint64_t)v64;
      v62(v64, v53, v15);
      v56 = sub_1CFAD6654(v57);
      ((void (*)(char *, uint64_t))v16[1])(v53, v15);
    }
    v58 = v68;
    v59 = v71;
    *(_QWORD *)&v54[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle] = v56;

    v70.receiver = v54;
    v70.super_class = ObjectType;
    v16 = objc_msgSendSuper2(&v70, sel_init);
    sub_1CF94C338(v59);
    ((void (*)(uint64_t, uint64_t))v55[1])(v58, v15);
  }
  return v16;
}

id sub_1CFAD6654(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)sub_1CFB00DA4();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForUpdatingURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_1CFB00DEC();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_1CFB00D20();

    swift_willThrow();
    v9 = sub_1CFB00DEC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

Swift::Void __swiftcall IdentityProofingLivenessVideoURL.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5440);
  v12 = MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15, v16, v17, v18, v19, v20, v21);
  v23 = (char *)&v37 - v22;
  sub_1CF9801EC(v2 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url, (uint64_t)&v37 - v22);
  v24 = sub_1CFB00DEC();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v26(v23, 1, v24) != 1)
  {
    v27 = (void *)sub_1CFB00DA4();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
    v28 = v27;
    v29 = (void *)sub_1CFB01A04();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v28, v29);

  }
  v30 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle);
  v31 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v30, v31);

  sub_1CF9801EC(v2 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL, (uint64_t)v14);
  if (v26(v14, 1, v24) != 1)
  {
    v32 = (void *)sub_1CFB00DA4();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v24);
    v33 = v32;
    v34 = (void *)sub_1CFB01A04();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v33, v34);

  }
  v35 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle);
  v36 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v35, v36);

}

id IdentityProofingLivenessVideoURL.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1CFAD6BA8();

  return v4;
}

id IdentityProofingLivenessVideoURL.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_1CFAD6BA8();

  return v2;
}

id IdentityProofingLivenessVideoURL.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void IdentityProofingLivenessVideoURL.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id IdentityProofingLivenessVideoURL.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1CFAD6BA8()
{
  void *v0;
  objc_class *ObjectType;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5440);
  v10 = MEMORY[0x1E0C80A78](v2, v3, v4, v5, v6, v7, v8, v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10, v13, v14, v15, v16, v17, v18, v19);
  v21 = (char *)&v32 - v20;
  sub_1CF9775E8(0, (unint64_t *)&unk_1EFBC5490);
  v22 = v0;
  v23 = sub_1CFB02118();
  if (v23)
  {
    v24 = (void *)v23;
    sub_1CFB00DC8();

    v25 = sub_1CFB00DEC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v21, 0, 1, v25);
  }
  else
  {
    v26 = sub_1CFB00DEC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v21, 1, 1, v26);
  }
  sub_1CFA82C2C((uint64_t)v21, (uint64_t)&v22[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url]);
  sub_1CF9775E8(0, &qword_1EFBC5448);
  *(_QWORD *)&v22[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle] = sub_1CFB02118();
  v27 = sub_1CFB02118();
  if (v27)
  {
    v28 = (void *)v27;
    sub_1CFB00DC8();

    v29 = sub_1CFB00DEC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v12, 0, 1, v29);
  }
  else
  {
    v30 = sub_1CFB00DEC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v12, 1, 1, v30);
  }
  sub_1CFA82C2C((uint64_t)v12, (uint64_t)&v22[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL]);
  *(_QWORD *)&v22[OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle] = sub_1CFB02118();

  v32.receiver = v22;
  v32.super_class = ObjectType;
  return objc_msgSendSuper2(&v32, sel_init);
}

uint64_t sub_1CFAD6E0C()
{
  return type metadata accessor for IdentityProofingLivenessVideoURL();
}

uint64_t type metadata accessor for IdentityProofingLivenessVideoURL()
{
  uint64_t result;

  result = qword_1EFBC5478;
  if (!qword_1EFBC5478)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1CFAD6E50()
{
  unint64_t v0;

  sub_1CFA85F6C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for IdentityProofingLivenessVideoURL()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityProofingLivenessVideoURL.__allocating_init(url:auxiliary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of IdentityProofingLivenessVideoURL.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

SecCertificateRef_optional __swiftcall SecTrustRef.getLeafCertificate()()
{
  __SecTrust *v0;
  CFArrayRef v1;
  CFArrayRef v2;

  v1 = SecTrustCopyCertificateChain(v0);
  if (v1)
  {
    v2 = v1;
    type metadata accessor for SecCertificate(0);
    sub_1CFB01C98();

  }
  return 0;
}

__SecCertificate *Array<A>.base64EncodedStrings()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __SecCertificate *result;
  uint64_t v8;
  __SecCertificate *v9;
  CFDataRef v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __SecCertificate *v22;
  CFDataRef v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  __SecCertificate *v35;
  CFDataRef v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;
  __SecCertificate *v47;
  uint64_t v48;
  CFDataRef v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = swift_bridgeObjectRetain();
  if (MEMORY[0x1D17D8A94](v4, a2))
  {
    v59 = a1;
    v61 = a2;
    if ((sub_1CFB01D04() & 1) != 0)
    {
      v5 = 0;
      v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      while (1)
      {
        result = (__SecCertificate *)sub_1CFB01CD4();
        v8 = v5 + 1;
        if (__OFADD__(v5, 1))
          break;
        v9 = (__SecCertificate *)*(id *)(a1 + 8 * v5 + 32);
        v10 = SecCertificateCopyData(v9);
        v11 = sub_1CFB00E7C();
        v13 = v12;

        v14 = sub_1CFB00E64();
        v16 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_1CF955C18(0, v6[2] + 1, 1, v6);
        v18 = v6[2];
        v17 = v6[3];
        if (v18 >= v17 >> 1)
          v6 = sub_1CF955C18((_QWORD *)(v17 > 1), v18 + 1, 1, v6);
        v6[2] = v18 + 1;
        v19 = &v6[2 * v18];
        v19[4] = v14;
        v19[5] = v16;

        sub_1CF923A24(v11, v13);
        a1 = v59;
        ++v5;
        if (v8 == MEMORY[0x1D17D8A94](v59, v61))
          goto LABEL_41;
      }
      __break(1u);
    }
    else
    {
      if ((sub_1CFB01D04() & 1) == 0)
      {
        if ((sub_1CFB01D04() & 1) == 0)
        {
          v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
          v45 = 4;
          while (1)
          {
            v46 = sub_1CFB01D04();
            sub_1CFB01CD4();
            result = (v46 & 1) != 0
                   ? (__SecCertificate *)*(id *)(a1 + 8 * v45)
                   : (__SecCertificate *)sub_1CFB023B8();
            v47 = result;
            v48 = v45 - 3;
            if (__OFADD__(v45 - 4, 1))
              break;
            v49 = SecCertificateCopyData(result);
            v50 = sub_1CFB00E7C();
            v52 = v51;

            v53 = sub_1CFB00E64();
            v55 = v54;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v6 = sub_1CF955C18(0, v6[2] + 1, 1, v6);
            v57 = v6[2];
            v56 = v6[3];
            if (v57 >= v56 >> 1)
              v6 = sub_1CF955C18((_QWORD *)(v56 > 1), v57 + 1, 1, v6);
            v6[2] = v57 + 1;
            v58 = &v6[2 * v57];
            v58[4] = v53;
            v58[5] = v55;

            sub_1CF923A24(v50, v52);
            a1 = v59;
            ++v45;
            if (v48 == MEMORY[0x1D17D8A94](v59, v61))
            {
LABEL_41:
              swift_bridgeObjectRelease();
              return (__SecCertificate *)v6;
            }
          }
          goto LABEL_46;
        }
        v33 = 0;
        v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        while (1)
        {
          result = (__SecCertificate *)sub_1CFB01CD4();
          v34 = v33 + 1;
          if (__OFADD__(v33, 1))
            break;
          v35 = (__SecCertificate *)*(id *)(a1 + 8 * v33 + 32);
          v36 = SecCertificateCopyData(v35);
          v37 = sub_1CFB00E7C();
          v39 = v38;

          v40 = sub_1CFB00E64();
          v60 = v41;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v6 = sub_1CF955C18(0, v6[2] + 1, 1, v6);
          v43 = v6[2];
          v42 = v6[3];
          if (v43 >= v42 >> 1)
            v6 = sub_1CF955C18((_QWORD *)(v42 > 1), v43 + 1, 1, v6);
          v6[2] = v43 + 1;
          v44 = &v6[2 * v43];
          v44[4] = v40;
          v44[5] = v60;

          sub_1CF923A24(v37, v39);
          ++v33;
          if (v34 == MEMORY[0x1D17D8A94](a1, v61))
            goto LABEL_41;
        }
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
      v20 = 0;
      v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      while (1)
      {
        result = (__SecCertificate *)sub_1CFB01CD4();
        v21 = v20 + 1;
        if (__OFADD__(v20, 1))
          break;
        v22 = (__SecCertificate *)*(id *)(a1 + 8 * v20 + 32);
        v23 = SecCertificateCopyData(v22);
        v24 = sub_1CFB00E7C();
        v26 = v25;

        v27 = sub_1CFB00E64();
        v29 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_1CF955C18(0, v6[2] + 1, 1, v6);
        v31 = v6[2];
        v30 = v6[3];
        if (v31 >= v30 >> 1)
          v6 = sub_1CF955C18((_QWORD *)(v30 > 1), v31 + 1, 1, v6);
        v6[2] = v31 + 1;
        v32 = &v6[2 * v31];
        v32[4] = v27;
        v32[5] = v29;

        sub_1CF923A24(v24, v26);
        a1 = v59;
        ++v20;
        if (v21 == MEMORY[0x1D17D8A94](v59, v61))
          goto LABEL_41;
      }
    }
    __break(1u);
    goto LABEL_45;
  }
  swift_bridgeObjectRelease();
  return (__SecCertificate *)MEMORY[0x1E0DEE9D8];
}

Swift::String_optional __swiftcall SecCertificateRef.commonName()()
{
  __SecCertificate *v0;
  __SecCertificate *v1;
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
  OSStatus v13;
  CFStringRef v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  Swift::String_optional result;
  uint64_t v32[2];
  uint64_t v33;
  CFStringRef commonName[2];

  v1 = v0;
  commonName[1] = *(CFStringRef *)MEMORY[0x1E0C80C00];
  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  commonName[0] = 0;
  v13 = SecCertificateCopyCommonName(v1, commonName);
  if (v13)
  {
    v14 = SecCopyErrorMessageString(v13, 0);
    if (v14)
    {
      v15 = (__CFString *)v14;
      v16 = sub_1CFB01A28();
      v18 = v17;

    }
    else
    {
      v18 = 0xE500000000000000;
      v16 = 0x3E6C696E3CLL;
    }
    if (qword_1ED9054E8 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v23, v2);
    swift_bridgeObjectRetain();
    v24 = sub_1CFB012B4();
    v25 = sub_1CFB01FD4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v32[0] = v16;
      v27 = (uint8_t *)v26;
      v28 = swift_slowAlloc();
      v33 = v28;
      *(_DWORD *)v27 = 136446210;
      swift_bridgeObjectRetain();
      v32[1] = sub_1CF9C974C(v32[0], v18, &v33);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF917000, v24, v25, "error during SecCertificateCopyCommonName, error: %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v28, -1, -1);
      MEMORY[0x1D17DA6E4](v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);

    goto LABEL_13;
  }
  v19 = (__CFString *)commonName[0];
  if (!commonName[0])
  {
LABEL_13:
    v20 = 0;
    v22 = 0;
    goto LABEL_14;
  }
  v20 = sub_1CFB01A28();
  v22 = v21;

LABEL_14:
  v29 = v20;
  v30 = v22;
  result.value._object = v30;
  result.value._countAndFlagsBits = v29;
  return result;
}

uint64_t SecCertificateRef.serialNumber.getter()
{
  __SecCertificate *v0;
  CFDataRef v1;
  CFDataRef v2;
  uint64_t v3;

  v1 = SecCertificateCopySerialNumberData(v0, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1CFB00E7C();

  return v3;
}

uint64_t SecAccessControlRef.data.getter()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = SecAccessControlCopyData();
  if (result)
  {
    v1 = (void *)result;
    v2 = sub_1CFB00E7C();

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *static SecAccessControlRef.fromData(_:)()
{
  return sub_1CFADF2C8();
}

uint64_t sub_1CFAD7830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X8 }
  }
  return 0;
}

SecCertificateRef __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> decodeCertificate(fromBase64DER:)(Swift::String fromBase64DER)
{
  __SecCertificate *v1;
  __SecCertificate *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  const __CFData *v9;
  uint64_t v10;
  Swift::String v12;

  v12 = fromBase64DER;
  sub_1CF9B9CD8();
  sub_1CFB02214();
  v2 = v1;
  v3 = sub_1CFB00E28();
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5 >> 60 == 15)
  {
    LOWORD(v12._countAndFlagsBits) = 119;
    v6 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000022, 0x80000001CFB2FE50, (__int16 *)&v12, 0, v6, 0xD000000000000056, 0x80000001CFB2FE80, v7, 0xD000000000000021, 0x80000001CFB2FEE0, 200);
    swift_willThrow();
  }
  else
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = (const __CFData *)sub_1CFB00E58();
    v2 = SecCertificateCreateWithData(v8, v9);

    if (v2)
    {
      sub_1CF931AB0(v3, v5);
    }
    else
    {
      LOWORD(v12._countAndFlagsBits) = 152;
      v2 = (__SecCertificate *)sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB2FF10, (__int16 *)&v12, 0, (uint64_t)v2, 0xD000000000000056, 0x80000001CFB2FE80, v10, 0xD000000000000021, 0x80000001CFB2FEE0, 203);
      swift_willThrow();
      sub_1CF931AB0(v3, v5);
    }
  }
  return v2;
}

uint64_t DIPSecTrustEvaluate(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CFAD8428()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_1CFAD84D0;
  return sub_1CFB02994();
}

uint64_t sub_1CFAD84D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFAD853C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 48));
}

uint64_t sub_1CFAD854C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t decodeCertificateChain(fromBase64DER:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const __CFData *v9;
  SecCertificateRef v10;
  __SecCertificate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const __CFAllocator *allocator;
  _QWORD v20[2];
  uint64_t v21;

  result = MEMORY[0x1E0DEE9D8];
  v21 = MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    swift_bridgeObjectRetain();
    sub_1CF9B9CD8();
    v4 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v5 = *v4;
      v20[0] = *(v4 - 1);
      v20[1] = v5;
      swift_bridgeObjectRetain();
      sub_1CFB02214();
      v6 = sub_1CFB00E28();
      v8 = v7;
      swift_bridgeObjectRelease();
      if (v8 >> 60 == 15)
      {
        LOWORD(v20[0]) = 119;
        v15 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
        sub_1CF923828();
        swift_allocError();
        DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000022, 0x80000001CFB2FE50, (__int16 *)v20, 0, v15, 0xD000000000000056, 0x80000001CFB2FE80, v16, 0xD000000000000021, 0x80000001CFB2FEE0, 200);
        swift_willThrow();
        goto LABEL_11;
      }
      v9 = (const __CFData *)sub_1CFB00E58();
      v10 = SecCertificateCreateWithData(allocator, v9);

      if (!v10)
        break;
      sub_1CF931AB0(v6, v8);
      swift_bridgeObjectRelease();
      v11 = v10;
      MEMORY[0x1D17D89E0](v11, v12, v13, v14);
      if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1CFB01CE0();
      v4 += 2;
      sub_1CFB01D10();
      sub_1CFB01CBC();

      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v21;
      }
    }
    LOWORD(v20[0]) = 152;
    v17 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB2FF10, (__int16 *)v20, 0, v17, 0xD000000000000056, 0x80000001CFB2FE80, v18, 0xD000000000000021, 0x80000001CFB2FEE0, 203);
    swift_willThrow();
    sub_1CF931AB0(v6, v8);
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t DIPSecureData.__allocating_init(_:)(void *a1)
{
  uint64_t v2;
  const __CFData *v3;
  const UInt8 *BytePtr;
  size_t Length;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  v3 = a1;
  BytePtr = CFDataGetBytePtr(v3);
  Length = CFDataGetLength(v3);
  mlock(BytePtr, Length);

  return v2;
}

uint64_t DIPSecureData.init(_:)(void *a1)
{
  uint64_t v1;
  const __CFData *v2;
  const UInt8 *BytePtr;
  size_t Length;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = a1;
  BytePtr = CFDataGetBytePtr(v2);
  Length = CFDataGetLength(v2);
  mlock(BytePtr, Length);

  return v1;
}

uint64_t DIPSecureData.deinit()
{
  uint64_t v0;
  const __CFData *v1;
  UInt8 *BytePtr;
  rsize_t Length;

  v1 = *(const __CFData **)(v0 + 16);
  BytePtr = (UInt8 *)CFDataGetBytePtr(v1);
  Length = CFDataGetLength(v1);
  memset_s(BytePtr, Length, 0, Length);
  munlock(BytePtr, Length);

  return v0;
}

uint64_t DIPSecureData.__deallocating_deinit()
{
  uint64_t v0;
  const __CFData *v1;
  UInt8 *BytePtr;
  rsize_t Length;

  v1 = *(const __CFData **)(v0 + 16);
  BytePtr = (UInt8 *)CFDataGetBytePtr(v1);
  Length = CFDataGetLength(v1);
  memset_s(BytePtr, Length, 0, Length);
  munlock(BytePtr, Length);

  return swift_deallocClassInstance();
}

const UInt8 *sub_1CFAD8A48()
{
  uint64_t v0;
  const UInt8 *result;

  result = CFDataGetBytePtr(*(CFDataRef *)(v0 + 16));
  if (!result)
    __break(1u);
  return result;
}

CFIndex sub_1CFAD8A68()
{
  uint64_t v0;

  return CFDataGetLength(*(CFDataRef *)(v0 + 16));
}

SecKeyRef SecKeyRef.publicKey.getter()
{
  __SecKey *v0;

  return SecKeyCopyPublicKey(v0);
}

uint64_t SecKeyRef.publicKeyData.getter()
{
  __SecKey *v0;
  __SecKey *v1;
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
  __SecKey *v13;
  __SecKey *v14;
  CFDataRef v15;
  CFDataRef v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  CFErrorRef v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int16 v26[12];
  CFErrorRef error[2];

  v1 = v0;
  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)&v26[-4] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  error[0] = 0;
  v13 = SecKeyCopyPublicKey(v1);
  if (v13)
  {
    v14 = v13;
    v15 = SecKeyCopyExternalRepresentation(v13, error);
    if (v15)
    {
      v16 = v15;
      v17 = sub_1CFB00E7C();
      v19 = v18;

      v20 = error[0];
      if (error[0])
      {
LABEL_4:
        v26[0] = 0;
        errorFromCFError(_:_:_:)(v20, 0xD00000000000001DLL, 0x80000001CFB33710, v26);
        v22 = v21;
        if (qword_1ED9054E8 != -1)
          swift_once();
        v23 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v23, v2);
        DIPLogError(_:message:log:)(v22, 0, 0xE000000000000000);
        _s13CoreIDVShared9AnalyticsC9sendErroryys0E0_pFZ_0(v22);

        sub_1CF931AB0(v17, v19);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
        return 0;
      }
    }
    else
    {
      v17 = 0;
      v19 = 0xF000000000000000;
      v20 = error[0];
      if (error[0])
        goto LABEL_4;
    }

    return v17;
  }
  return 0;
}

uint64_t SecKeyRef.publicKeyIdentifier.getter()
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
  uint64_t result;
  unint64_t v17;
  unint64_t v18;

  v0 = sub_1CFB0192C();
  MEMORY[0x1E0C80A78](v0, v1, v2, v3, v4, v5, v6, v7);
  v8 = sub_1CFB01920();
  MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15);
  result = SecKeyRef.publicKeyData.getter();
  v18 = v17;
  if (v17 >> 60 != 15)
  {
    sub_1CF920A48(&qword_1EFBC0D90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9A30], MEMORY[0x1E0CA9A28]);
    sub_1CFB01470();
    __asm { BR              X10 }
  }
  return result;
}

uint64_t SecKeyRef.KeyClass.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  char v8;
  char v9;
  uint64_t v10;
  char v12;
  uint64_t result;

  if (sub_1CFB01A28() == a1 && v6 == a2)
  {
    v9 = 1;
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v8 = sub_1CFB028B0();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    v9 = 1;
LABEL_17:
    result = swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (sub_1CFB01A28() == a1 && v10 == a2)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v12 = sub_1CFB028B0();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    v9 = 0;
  else
    v9 = 2;
LABEL_18:
  *a3 = v9;
  return result;
}

uint64_t SecKeyRef.KeyClass.rawValue.getter()
{
  return sub_1CFB01A28();
}

uint64_t sub_1CFAD90B4()
{
  return sub_1CFA268DC();
}

uint64_t sub_1CFAD90C0()
{
  sub_1CFB02A90();
  sub_1CFB01A28();
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAD9138()
{
  sub_1CFB01A28();
  sub_1CFB01ADC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFAD9194()
{
  sub_1CFB02A90();
  sub_1CFB01A28();
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAD9208@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return SecKeyRef.KeyClass.init(rawValue:)(*a1, a1[1], a2);
}

uint64_t sub_1CFAD9214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1CFB01A28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SecKeyRef static SecKeyRef.makeECKey(from:keyClass:)()
{
  uint64_t inited;
  void **v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFData *v10;
  SecKeyRef v11;
  CFErrorRef v12;
  void *v13;
  CFErrorRef *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  __int16 v19;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  error[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC54B0);
  inited = swift_initStackObject();
  v1 = (void **)MEMORY[0x1E0CD6A38];
  *(_OWORD *)(inited + 16) = xmmword_1CFB059A0;
  v2 = *v1;
  v3 = (void *)*MEMORY[0x1E0CD6A40];
  *(_QWORD *)(inited + 32) = *v1;
  *(_QWORD *)(inited + 40) = v3;
  v4 = (void *)*MEMORY[0x1E0CD69F8];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0CD69F8];
  sub_1CFB01A28();
  v5 = v2;
  v6 = v3;
  v7 = v4;
  v8 = sub_1CFB01A04();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 56) = v8;
  sub_1CF92344C(inited);
  type metadata accessor for CFString(0);
  sub_1CF920A48((unint64_t *)&qword_1EFBBDDE8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_1CFB05310);
  v9 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v10 = (const __CFData *)sub_1CFB00E58();
  v11 = SecKeyCreateWithData(v10, v9, error);

  if (!v11)
  {
    v12 = error[0];
    if (error[0])
    {
      type metadata accessor for CFError(0);
      sub_1CF920A48((unint64_t *)&qword_1ED904C98, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x1E0CB1C60]);
      v13 = (void *)swift_allocError();
      *v14 = v12;
    }
    else
    {
      v13 = 0;
    }
    v19 = 254;
    v15 = v13;
    v16 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v13, 0xD000000000000027, 0x80000001CFB33730, &v19, 0, v16, 0xD000000000000056, 0x80000001CFB2FE80, v17, 0xD000000000000019, 0x80000001CFB33760, 121);
    swift_willThrow();

  }
  return v11;
}

char *SecKeyRef.sign(data:algorithm:)(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  __SecKey *v3;
  void *v4;
  __SecKey *v5;
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
  const __CFData *v18;
  CFDataRef Signature;
  const __CFData *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  char *v33;
  unint64_t v34;
  CFErrorRef error[2];

  v5 = v3;
  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v7 = sub_1CFB01704();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9, v10, v11, v12, v13, v14, v15);
  v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  error[0] = 0;
  if (!SecKeyIsAlgorithmSupported(v5, kSecKeyOperationTypeSign, a3))
  {
    v33 = 0;
    v34 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    v32[1] = a3;
    type metadata accessor for SecKeyAlgorithm(0);
    sub_1CFB0252C();
    sub_1CFB01B30();
    v17 = v33;
    v26 = v34;
    LOWORD(v33) = 243;
    v27 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, (uint64_t)v17, v26, (__int16 *)&v33, 0, v27, 0xD000000000000056, 0x80000001CFB2FE80, v28, 0xD000000000000015, 0x80000001CFB337F0, 131);
LABEL_7:
    swift_willThrow();
    return v17;
  }
  v18 = (const __CFData *)sub_1CFB00E58();
  Signature = SecKeyCreateSignature(v5, a3, v18, error);

  if (!Signature)
  {
    LOWORD(v33) = 245;
    errorFromCFError(_:_:_:)(error[0], 0xD000000000000021, 0x80000001CFB33780, (__int16 *)&v33);
    goto LABEL_7;
  }
  v20 = Signature;
  v21 = sub_1CFB00E7C();
  v23 = v22;

  v33 = (char *)v21;
  v34 = v23;
  sub_1CF942468();
  sub_1CFB016E0();
  if (!v4)
  {
    sub_1CFB016EC();
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v17, v7);
    __asm { BR              X10 }
  }
  LOWORD(v33) = 255;
  v24 = v4;
  v17 = (char *)sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v4, 0xD00000000000003FLL, 0x80000001CFB337B0, (__int16 *)&v33, 0, (uint64_t)v17, 0xD000000000000056, 0x80000001CFB2FE80, v25, 0xD000000000000015, 0x80000001CFB337F0, 141);
  swift_willThrow();

  return v17;
}

void SecKeyRef.signSHA256Digest(_:algorithm:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t Array<A>.derRepresentation()()
{
  uint64_t v0;

  v0 = sub_1CFB01D40();
  MEMORY[0x1D17DA600](MEMORY[0x1E0DEAF38], v0);
  return sub_1CFB01BE4();
}

uint64_t SecCertificateRef.derRepresentation()()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;

  v1 = SecCertificateCopyData(v0);
  v2 = sub_1CFB00E7C();

  return v2;
}

SecCertificateRef decodeCertificate(fromDER:)()
{
  const __CFAllocator *v0;
  const __CFData *v1;
  SecCertificateRef v2;
  unint64_t v3;
  uint64_t v4;
  __int16 v6;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = (const __CFData *)sub_1CFB00E58();
  v2 = SecCertificateCreateWithData(v0, v1);

  if (!v2)
  {
    v6 = 152;
    v3 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB2FF10, &v6, 0, v3, 0xD000000000000056, 0x80000001CFB2FE80, v4, 0xD00000000000001BLL, 0x80000001CFB33930, 211);
    swift_willThrow();
  }
  return v2;
}

uint64_t decodeCertificateChain(fromDER:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  const __CFAllocator *v4;
  unint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  const __CFData *v8;
  SecCertificateRef v9;
  __SecCertificate *v10;
  unint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  result = MEMORY[0x1E0DEE9D8];
  v14 = MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    swift_bridgeObjectRetain();
    v5 = (unint64_t *)(a1 + 40);
    while (1)
    {
      v6 = *(v5 - 1);
      v7 = *v5;
      sub_1CF9239E0(v6, *v5);
      v8 = (const __CFData *)sub_1CFB00E58();
      v9 = SecCertificateCreateWithData(v4, v8);

      if (!v9)
        break;
      v10 = v9;
      MEMORY[0x1D17D89E0]();
      if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1CFB01CE0();
      v5 += 2;
      sub_1CFB01D10();
      sub_1CFB01CBC();

      sub_1CF923A24(v6, v7);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    v13 = 152;
    v11 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB2FF10, &v13, 0, v11, 0xD000000000000056, 0x80000001CFB2FE80, v12, 0xD00000000000001BLL, 0x80000001CFB33930, 211);
    swift_willThrow();
    sub_1CF923A24(v6, v7);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1CFADA40C(uint64_t a1, void *a2)
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
  char *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
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
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  char *v64;
  uint64_t v65;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD aBlock[6];

  v71 = a2;
  v72 = a1;
  v2 = sub_1CFB01368();
  v3 = *(_QWORD *)(v2 - 8);
  v76 = v2;
  v77 = v3;
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v75 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v69 = v12;
  v70 = v14;
  MEMORY[0x1E0C80A78](v12, v15, v16, v17, v18, v19, v20, v21);
  v68 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1CFB02028();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23, v25, v26, v27, v28, v29, v30, v31);
  v33 = (char *)&v67 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1CFB0201C();
  v35 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v34, v36, v37, v38, v39, v40, v41, v42);
  v43 = sub_1CFB01398();
  v73 = *(_QWORD *)(v43 - 8);
  v74 = v43;
  MEMORY[0x1E0C80A78](v43, v44, v45, v46, v47, v48, v49, v50);
  v52 = (char *)&v67 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1CF9775E8(0, (unint64_t *)&qword_1ED9054D0);
  sub_1CFB01380();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1CF920A48((unint64_t *)&qword_1ED905500, v35, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9054F0);
  sub_1CF927944((unint64_t *)&qword_1ED9054F8, &qword_1ED9054F0);
  sub_1CFB02310();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v33, *MEMORY[0x1E0DEF8D0], v23);
  v53 = (void *)sub_1CFB02058();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904160);
  v54 = swift_allocObject();
  *(_DWORD *)(v54 + 24) = 0;
  v56 = v71;
  v55 = v72;
  *(_QWORD *)(v54 + 16) = v71;
  v58 = v68;
  v57 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v68, v55, v69);
  v59 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = v54;
  *(_QWORD *)(v60 + 24) = v53;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v60 + v59, v58, v57);
  aBlock[4] = sub_1CFAE00B0;
  aBlock[5] = v60;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFA1D3E8;
  aBlock[3] = &block_descriptor_14;
  v61 = _Block_copy(aBlock);
  v62 = v56;
  swift_retain();
  v63 = v53;
  sub_1CFB01380();
  v78 = MEMORY[0x1E0DEE9D8];
  sub_1CF920A48((unint64_t *)&qword_1ED9054B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9054B8);
  sub_1CF927944((unint64_t *)&qword_1ED9054C0, &qword_1ED9054B8);
  v64 = v75;
  v65 = v76;
  sub_1CFB02310();
  MEMORY[0x1D17D8DAC](0, v52, v64, v61);
  _Block_release(v61);
  swift_release();

  (*(void (**)(char *, uint64_t))(v77 + 8))(v64, v65);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v52, v74);
  return swift_release();
}

void sub_1CFADA804(uint64_t a1, NSObject *a2, uint64_t a3)
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
  __SecTrust *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  OSStatus v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t inited;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  OSStatus v30;
  unint64_t aBlock;
  __int128 v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t, void *);
  uint64_t v35;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6, v9, v10, v11, v12, v13, v14, v15);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v16 = (__SecTrust *)*(id *)(a1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v17 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v34 = sub_1CFAE0160;
  v35 = v18;
  aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v32 = 1107296256;
  *((_QWORD *)&v32 + 1) = sub_1CFADAB78;
  v33 = &block_descriptor_8_0;
  v19 = _Block_copy(&aBlock);
  swift_release();
  v20 = SecTrustEvaluateAsyncWithError(v16, a2, v19);
  _Block_release(v19);

  if (v20)
  {
    aBlock = 0;
    *(_QWORD *)&v32 = 0xE000000000000000;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000027;
    *(_QWORD *)&v32 = 0x80000001CFB33B40;
    v30 = v20;
    v21 = MEMORY[0x1E0DEDBC8];
    sub_1CFB027F0();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    v22 = aBlock;
    v23 = v32;
    LOWORD(v30) = 152;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = v21;
    *(_DWORD *)(inited + 40) = v20;
    v25 = sub_1CF9220B4(inited);
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v22, v23, (__int16 *)&v30, 0, v25, 0xD000000000000056, 0x80000001CFB2FE80, (uint64_t)&aBlock, 0xD000000000000017, 0x80000001CFB30180, 258);
    LOWORD(v22) = aBlock;
    v26 = v33;
    sub_1CF923828();
    v29 = v32;
    v27 = swift_allocError();
    *(_WORD *)v28 = v22;
    *(_OWORD *)(v28 + 8) = v29;
    *(_QWORD *)(v28 + 24) = v26;
    aBlock = v27;
    sub_1CFB01D88();
  }
}

uint64_t sub_1CFADAAC0(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    type metadata accessor for CFError(0);
    sub_1CF920A48((unint64_t *)&qword_1ED904C98, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x1E0CB1C60]);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
    return sub_1CFB01D88();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
    return sub_1CFB01D94();
  }
}

void sub_1CFADAB78(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (*v7)(id, uint64_t, void *);
  id v8;
  id v9;

  v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  swift_retain();
  v9 = a2;
  v8 = a4;
  v7(v9, a3, a4);
  swift_release();

}

uint64_t PublicKeyAlgorithm.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFADAC24 + 4 * byte_1CFB205E0[*v0]))(0x363532505F4345, 0xE700000000000000);
}

uint64_t sub_1CFADAC24()
{
  return 0x343833505F4345;
}

uint64_t sub_1CFADAC38()
{
  return 0x313235505F4345;
}

uint64_t sub_1CFADAC4C()
{
  return 0x39313535325F4445;
}

uint64_t sub_1CFADAC64()
{
  return 0x3834345F4445;
}

uint64_t PublicKeyAlgorithm.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFADACA8 + 4 * byte_1CFB205E5[*v0]))(0x363532505F4345, 0xE700000000000000);
}

uint64_t sub_1CFADACA8()
{
  return 0x343833505F4345;
}

uint64_t sub_1CFADACBC()
{
  return 0x313235505F4345;
}

uint64_t sub_1CFADACD0()
{
  return 0x39313535325F4445;
}

uint64_t sub_1CFADACE8()
{
  return 0x3834345F4445;
}

CoreIDVShared::PublicKeyAlgorithm_optional __swiftcall PublicKeyAlgorithm.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  CoreIDVShared::PublicKeyAlgorithm_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CFB02670();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1CFADAD54(char *a1)
{
  sub_1CFA28AF0(*a1);
}

void sub_1CFADAD60()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CFB02A90();
  __asm { BR              X9 }
}

uint64_t sub_1CFADADAC()
{
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

void sub_1CFADAE28()
{
  __asm { BR              X10 }
}

uint64_t sub_1CFADAE64()
{
  sub_1CFB01ADC();
  return swift_bridgeObjectRelease();
}

void sub_1CFADAECC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CFB02A90();
  __asm { BR              X9 }
}

uint64_t sub_1CFADAF14()
{
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

CoreIDVShared::PublicKeyAlgorithm_optional sub_1CFADAF90(Swift::String *a1)
{
  return PublicKeyAlgorithm.init(rawValue:)(*a1);
}

uint64_t sub_1CFADAF9C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1CFADAFCC + 4 * byte_1CFB205F9[*v0]))();
}

void sub_1CFADAFCC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x343833505F4345;
  a1[1] = v1;
}

void sub_1CFADAFE4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x313235505F4345;
  a1[1] = v1;
}

void sub_1CFADAFFC(_QWORD *a1@<X8>)
{
  *a1 = 0x39313535325F4445;
  a1[1] = 0xE800000000000000;
}

void sub_1CFADB018(_QWORD *a1@<X8>)
{
  *a1 = 0x3834345F4445;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_1CFADB030()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CFADB060 + 4 * byte_1CFB205FE[*v0]))(0x363532505F4345, 0xE700000000000000);
}

uint64_t sub_1CFADB060()
{
  return 0x343833505F4345;
}

uint64_t sub_1CFADB074()
{
  return 0x313235505F4345;
}

uint64_t sub_1CFADB088()
{
  return 0x39313535325F4445;
}

uint64_t sub_1CFADB0A0()
{
  return 0x3834345F4445;
}

uint64_t sub_1CFADB0B4()
{
  uint64_t result;

  result = sub_1CFADB0D0();
  qword_1EFBC54A0 = result;
  return result;
}

uint64_t sub_1CFADB0D0()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t result;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;

  v0 = sub_1CFB012CC();
  v1 = *(_QWORD *)(v0 - 8);
  v9 = MEMORY[0x1E0C80A78](v0, v2, v3, v4, v5, v6, v7, v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)&v32 - v19;
  v21 = SecCertificateCopyAppleExternalRoots();
  if (v21)
  {
    v22 = (void *)v21;
    v33 = 0;
    type metadata accessor for SecCertificate(0);
    sub_1CFB01C98();

    result = v33;
    if (v33)
      return result;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v11, v24, v0);
    v25 = sub_1CFB012B4();
    v26 = sub_1CFB01FD4();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1CF917000, v25, v26, "SecCertificate error casting hardcoded external roots from Security framework", v27, 2u);
      MEMORY[0x1D17DA6E4](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
  }
  else
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v20, v28, v0);
    v29 = sub_1CFB012B4();
    v30 = sub_1CFB01FD4();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1CF917000, v29, v30, "SecCertificate could not get hardcoded external roots from Security framework", v31, 2u);
      MEMORY[0x1D17DA6E4](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v20, v0);
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t static SecCertificateRef.appleExternalRoots.getter()
{
  if (qword_1EFBBD490 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void static SecCertificateRef.make(with:in:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
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
  uint64_t v24;
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
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void (*v43)(char *, char *, uint64_t);
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  id v68;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5440);
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1CFB00DEC();
  v18 = *(_QWORD *)(v17 - 8);
  v26 = MEMORY[0x1E0C80A78](v17, v19, v20, v21, v22, v23, v24, v25);
  v28 = (char *)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26, v29, v30, v31, v32, v33, v34, v35);
  v37 = (char *)&v62 - v36;
  v63 = v3;
  if (a3)
  {
    v38 = a3;
  }
  else
  {
    if (qword_1EFBBD458 != -1)
      swift_once();
    v38 = (id)qword_1EFBED260;
  }
  v39 = a3;
  v64 = a2;
  v65 = a1;
  v40 = (void *)sub_1CFB01A04();
  v41 = (void *)sub_1CFB01A04();
  v68 = v38;
  v42 = objc_msgSend(v38, sel_URLForResource_withExtension_, v40, v41);

  if (!v42)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_11;
  }
  sub_1CFB00DC8();

  v43 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v43(v16, v28, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
LABEL_11:
    sub_1CF931B1C((uint64_t)v16, &qword_1EFBC5440);
    v66 = 0;
    v67 = 0xE000000000000000;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    v66 = 0xD00000000000001BLL;
    v67 = 0x80000001CFB33950;
    sub_1CFB01B30();
    sub_1CFB01B30();
    v48 = v66;
    v49 = v67;
    LOWORD(v66) = 265;
    v50 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    v47 = (void *)swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v48, v49, (__int16 *)&v66, 0, v50, 0xD000000000000056, 0x80000001CFB2FE80, v51, 0x74697728656B616DLL, 0xEE00293A6E693A68, 307);
    swift_willThrow();
    goto LABEL_12;
  }
  v43(v37, v16, v17);
  v44 = v63;
  v45 = sub_1CFB00E04();
  if (v44)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v37, v17);
    v47 = v44;
LABEL_12:

    v66 = 0;
    v67 = 0xE000000000000000;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    v66 = 0xD00000000000002BLL;
    v67 = 0x80000001CFB33970;
    sub_1CFB01B30();
    sub_1CFB01B30();
    v52 = v66;
    v53 = v67;
    LOWORD(v66) = 265;
    v54 = v47;
    v55 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v47, v52, v53, (__int16 *)&v66, 0, v55, 0xD000000000000056, 0x80000001CFB2FE80, v56, 0x74697728656B616DLL, 0xEE00293A6E693A68, 313);
    swift_willThrow();

    return;
  }
  v57 = v45;
  v58 = v46;
  v59 = (void *)sub_1CFB00E58();
  v60 = (void *)SecCertificateCreateWithPEM();

  if (v60)
  {
    v61 = v60;
    sub_1CF923A24(v57, v58);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v37, v17);
  }
  else
  {
    __break(1u);
  }
}

uint64_t SecCertificateRef.rawECPublicKeyData()()
{
  __SecCertificate *v0;
  SecKeyRef v1;
  SecKeyRef v2;
  unint64_t v3;
  uint64_t v4;

  v1 = SecCertificateCopyKey(v0);
  if (!v1)
    return 0;
  v2 = v1;
  v4 = SecKeyRef.publicKeyData.getter();
  if (v3 >> 60 != 15)
    __asm { BR              X9 }

  return v4;
}

Swift::String_optional __swiftcall SecCertificateRef.base64EncodedString()()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String_optional result;

  v1 = SecCertificateCopyData(v0);
  v2 = sub_1CFB00E7C();
  v4 = v3;

  v5 = sub_1CFB00E64();
  v7 = v6;
  sub_1CF923A24(v2, v4);
  v8 = v5;
  v9 = v7;
  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  return result;
}

Swift::String_optional __swiftcall SecCertificateRef.organization()()
{
  void *v0;
  void *v1;
  Swift::String_optional result;

  v0 = sub_1CFADBA6C(MEMORY[0x1E0CD5FB0]);
  result.value._object = v1;
  result.value._countAndFlagsBits = (uint64_t)v0;
  return result;
}

Swift::String_optional __swiftcall SecCertificateRef.organizationalUnit()()
{
  void *v0;
  void *v1;
  Swift::String_optional result;

  v0 = sub_1CFADBA6C(MEMORY[0x1E0CD5FB8]);
  result.value._object = v1;
  result.value._countAndFlagsBits = (uint64_t)v0;
  return result;
}

void *sub_1CFADBA6C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  void *v2;

  v2 = (void *)a1(v1);
  if (v2)
  {
    sub_1CFB01C98();

    return 0;
  }
  return v2;
}

Swift::String_optional __swiftcall SecCertificateRef.uid()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Swift::String_optional result;

  v0 = SecCertificateCopySubjectAttributeValue();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = sub_1CFB01A28();
    v4 = v3;

  }
  else
  {
    v2 = 0;
    v4 = 0;
  }
  v5 = v2;
  v6 = v4;
  result.value._object = v6;
  result.value._countAndFlagsBits = v5;
  return result;
}

uint64_t SecCertificateRef.stateOrProvinceName.getter()
{
  return sub_1CFADBC38();
}

uint64_t SecCertificateRef.countryName.getter()
{
  return sub_1CFADBC38();
}

uint64_t sub_1CFADBC38()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v0 = SecCertificateCopySubjectAttributeValue();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  v2 = sub_1CFB01A28();

  return v2;
}

uint64_t SecCertificateRef.sha1()()
{
  void *SHA1Digest;
  uint64_t v1;
  id v2;

  SHA1Digest = (void *)SecCertificateGetSHA1Digest();
  v1 = (uint64_t)SHA1Digest;
  if (SHA1Digest)
  {
    v2 = SHA1Digest;
    v1 = sub_1CFB00E7C();

  }
  return v1;
}

uint64_t SecCertificateRef.issuerSHA1()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v0 = SecCertificateCopyIssuerSHA1Digest();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  v2 = sub_1CFB00E7C();

  return v2;
}

uint64_t SecCertificateRef.publicKeySHA256()()
{
  __SecCertificate *v0;
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
  SecKeyRef v17;
  SecKeyRef v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v1 = sub_1CFB01878();
  MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v9 = sub_1CFB0147C();
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v17 = SecCertificateCopyKey(v0);
  if (!v17)
    return 0;
  v18 = v17;
  v19 = SecKeyRef.publicKeyData.getter();
  v21 = v20;
  if (v20 >> 60 != 15)
  {
    sub_1CF920A48(&qword_1EFBBE568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
    sub_1CFB01470();
    __asm { BR              X10 }
  }

  return v19;
}

CoreIDVShared::PublicKeyAlgorithm_optional __swiftcall SecCertificateRef.publicKeyAlgorithm()()
{
  char *v0;
  __SecCertificate *v1;
  __SecCertificate *v2;
  char *v3;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  __SecKey *v55;
  __SecKey *v56;
  CFDictionaryRef v57;
  CFDictionaryRef v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  uint8_t *v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  char v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint8_t *v96;
  _QWORD v98[2];
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103[2];
  __int128 v104;
  __int128 v105;

  v2 = v1;
  v3 = v0;
  v4 = sub_1CFB012CC();
  v5 = *(_QWORD *)(v4 - 8);
  v13 = MEMORY[0x1E0C80A78](v4, v6, v7, v8, v9, v10, v11, v12);
  v15 = (char *)v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v13, v16, v17, v18, v19, v20, v21, v22);
  v25 = (char *)v98 - v24;
  v33 = MEMORY[0x1E0C80A78](v23, v26, v27, v28, v29, v30, v31, v32);
  v35 = (char *)v98 - v34;
  v43 = MEMORY[0x1E0C80A78](v33, v36, v37, v38, v39, v40, v41, v42);
  v45 = (char *)v98 - v44;
  MEMORY[0x1E0C80A78](v43, v46, v47, v48, v49, v50, v51, v52);
  v54 = (char *)v98 - v53;
  v55 = SecCertificateCopyKey(v2);
  if (!v55)
    goto LABEL_23;
  v56 = v55;
  v101 = v3;
  v57 = SecKeyCopyAttributes(v55);
  if (!v57 || (v58 = v57, *(_QWORD *)&v104 = 0, sub_1CFB01950(), v58, (v59 = v104) == 0))
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v69 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v15, v69, v4);
    v70 = sub_1CFB012B4();
    v71 = sub_1CFB01FD4();
    v72 = os_log_type_enabled(v70, v71);
    v3 = v101;
    if (v72)
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_1CF917000, v70, v71, "key attributes are unavailable", v73, 2u);
      MEMORY[0x1D17DA6E4](v73, -1, -1);
    }

    LOBYTE(v55) = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    goto LABEL_23;
  }
  v60 = sub_1CFB01A28();
  if (!*(_QWORD *)(v59 + 16) || (v62 = sub_1CFA922E4(v60, v61), (v63 & 1) == 0))
  {
    v104 = 0u;
    v105 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  sub_1CF94BBF0(*(_QWORD *)(v59 + 56) + 32 * v62, (uint64_t)&v104);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v105 + 1))
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_1CF931B1C((uint64_t)&v104, (uint64_t *)&unk_1ED904DA0);
LABEL_18:
    v3 = v101;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v74 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v25, v74, v4);
    v75 = sub_1CFB012B4();
    v76 = sub_1CFB01FD4();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v77 = 0;
      _os_log_impl(&dword_1CF917000, v75, v76, "key type is not available", v77, 2u);
      MEMORY[0x1D17DA6E4](v77, -1, -1);
    }

    LOBYTE(v55) = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v25, v4);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v64 = v103[1];
  v100 = v103[0];
  v65 = sub_1CFB01A28();
  if (*(_QWORD *)(v59 + 16) && (v67 = sub_1CFA922E4(v65, v66), (v68 & 1) != 0))
  {
    sub_1CF94BBF0(*(_QWORD *)(v59 + 56) + 32 * v67, (uint64_t)&v104);
  }
  else
  {
    v104 = 0u;
    v105 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v105 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v79 = v103[0];
      v80 = sub_1CFB01A28();
      v82 = v100;
      if (v100 == v80 && v64 == v81)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v87 = sub_1CFB028B0();
        swift_bridgeObjectRelease();
        if ((v87 & 1) == 0)
        {
          if (qword_1ED9054E8 != -1)
            swift_once();
          v88 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v45, v88, v4);
          swift_bridgeObjectRetain();
          v89 = sub_1CFB012B4();
          v90 = sub_1CFB01FD4();
          if (os_log_type_enabled(v89, v90))
          {
            v91 = (uint8_t *)swift_slowAlloc();
            v99 = swift_slowAlloc();
            v103[0] = v99;
            *(_DWORD *)v91 = 136315138;
            v98[1] = v91 + 4;
            swift_bridgeObjectRetain();
            v102 = sub_1CF9C974C(v82, v64, v103);
            sub_1CFB021C0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1CF917000, v89, v90, "unknown public key type: %s", v91, 0xCu);
            v92 = v99;
            swift_arrayDestroy();
            MEMORY[0x1D17DA6E4](v92, -1, -1);
            MEMORY[0x1D17DA6E4](v91, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }

          LOBYTE(v55) = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v45, v4);
          goto LABEL_57;
        }
      }
      swift_bridgeObjectRelease();
      switch(v79)
      {
        case 521:

          v78 = 2;
          v3 = v101;
          goto LABEL_24;
        case 384:

          v78 = 1;
          v3 = v101;
          goto LABEL_24;
        case 256:

          v78 = 0;
          v3 = v101;
          goto LABEL_24;
      }
      if (qword_1ED9054E8 != -1)
        swift_once();
      v93 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v54, v93, v4);
      v94 = sub_1CFB012B4();
      v95 = sub_1CFB01FD4();
      if (os_log_type_enabled(v94, v95))
      {
        v96 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v96 = 134217984;
        v103[0] = v79;
        sub_1CFB021C0();
        _os_log_impl(&dword_1CF917000, v94, v95, "Unknown Ec key size %ld", v96, 0xCu);
        MEMORY[0x1D17DA6E4](v96, -1, -1);
      }

      LOBYTE(v55) = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v54, v4);
LABEL_57:
      v78 = 5;
      v3 = v101;
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1CF931B1C((uint64_t)&v104, (uint64_t *)&unk_1ED904DA0);
  }
  v3 = v101;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v83 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v35, v83, v4);
  v84 = sub_1CFB012B4();
  v85 = sub_1CFB01FD4();
  if (os_log_type_enabled(v84, v85))
  {
    v86 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v86 = 0;
    _os_log_impl(&dword_1CF917000, v84, v85, "key size in bits is unavailable", v86, 2u);
    MEMORY[0x1D17DA6E4](v86, -1, -1);
  }

  LOBYTE(v55) = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v35, v4);
LABEL_23:
  v78 = 5;
LABEL_24:
  *v3 = v78;
  return (CoreIDVShared::PublicKeyAlgorithm_optional)v55;
}

uint64_t SecCertificateRef.hasOID(oid:)(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = sub_1CFB012CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = SecCertificateCopyExtendedKeyUsage();
  if (v15)
  {
    v16 = (void *)v15;
    v24 = 0;
    sub_1CFB01C98();

    if (v24)
    {
      v17 = sub_1CFAD7830(a1, a2, v24);
      swift_bridgeObjectRelease();
      return v17 & 1;
    }
  }
  else
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v19, v4);
    v20 = sub_1CFB012B4();
    v21 = sub_1CFB01FC8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CF917000, v20, v21, "Could not obtain extended key usage from certificate", v22, 2u);
      MEMORY[0x1D17DA6E4](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  }
  return 0;
}

void SecCertificateRef.logotype.getter(uint64_t a1@<X8>)
{
  void *v1;
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
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *v29;
  uint8_t *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[96];
  _BYTE v35[104];
  NSObject *v36;

  v3 = sub_1CFB012CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5, v6, v7, v8, v9, v10, v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void *)sub_1CFB01A04();
  v15 = (void *)SecCertificateCopyExtensionValue();

  v16 = xmmword_1CFB12710;
  if (v15)
  {
    v31 = xmmword_1CFB12710;
    v17 = sub_1CFB00E7C();
    v19 = v18;

    sub_1CF9239E0(v17, v19);
    sub_1CFADF160(v17, v19);
    v21 = v20;
    sub_1CF923A24(v17, v19);
    sub_1CFAA6DE0(v21, v21 + 32, 0, (2 * *(_QWORD *)(v21 + 16)) | 1, (uint64_t)v34);
    if (v1)
    {
      swift_release();

      sub_1CF9239E0(v17, v19);
      sub_1CFADF160(v17, v19);
      v23 = v22;
      sub_1CF923A24(v17, v19);
      sub_1CFAA6DE0(v23, v23 + 32, 0, (2 * *(_QWORD *)(v23 + 16)) | 1, (uint64_t)v35);
      sub_1CF9D8988((uint64_t)v35, (uint64_t *)&v32);
      swift_release();
      sub_1CF923A24(v17, v19);
      v16 = v32;
      v24 = v33;
    }
    else
    {
      sub_1CFAD4A54((uint64_t)v34, 5, 0);
      swift_release();
      if (qword_1ED9054E8 != -1)
        swift_once();
      v25 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v13, v25, v3);
      v26 = sub_1CFB012B4();
      v27 = sub_1CFB01FC8();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        v29 = v26;
        v36 = v26;
        v30 = v28;
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1CF917000, v29, v27, "Received ASN1Null for Logotype OID, returning nil", v28, 2u);
        MEMORY[0x1D17DA6E4](v30, -1, -1);

        sub_1CF923A24(v17, v19);
      }
      else
      {
        sub_1CF923A24(v17, v19);

      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
      v24 = 0;
      v16 = v31;
    }
  }
  else
  {
    v24 = 0;
  }
  *(_OWORD *)a1 = v16;
  *(_QWORD *)(a1 + 16) = v24;
}

uint64_t SecCertificateRef.privacyPolicyURL.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
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
  _BYTE *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v34;
  _BYTE v36[96];
  _BYTE v37[104];
  uint64_t v38;

  v3 = sub_1CFB012CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5, v6, v7, v8, v9, v10, v11);
  v13 = v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  v14 = (void *)sub_1CFB01A04();
  v15 = (void *)SecCertificateCopyExtensionValue();

  if (!v15)
  {
LABEL_12:
    v34 = sub_1CFB00DEC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(a1, 1, 1, v34);
  }
  v16 = sub_1CFB00E7C();
  v18 = v17;

  sub_1CF9239E0(v16, v18);
  sub_1CFADF160(v16, v18);
  v20 = v19;
  sub_1CF923A24(v16, v18);
  sub_1CFAA6DE0(v20, v20 + 32, 0, (2 * *(_QWORD *)(v20 + 16)) | 1, (uint64_t)v36);
  if (!v1)
  {
    sub_1CFAD4A54((uint64_t)v36, 5, 0);
    swift_release();
    if (qword_1ED9054E8 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v13, v28, v3);
    v29 = sub_1CFB012B4();
    v30 = sub_1CFB01FC8();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v38 = a1;
      v32 = v31;
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1CF917000, v29, v30, "Received ASN1Null for privacy policy URL, returning nil", v31, 2u);
      v33 = v32;
      a1 = v38;
      MEMORY[0x1D17DA6E4](v33, -1, -1);

      sub_1CF923A24(v16, v18);
    }
    else
    {
      sub_1CF923A24(v16, v18);

    }
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v13, v3);
    goto LABEL_12;
  }
  swift_release();

  sub_1CF9239E0(v16, v18);
  sub_1CFADF160(v16, v18);
  v22 = v21;
  sub_1CF923A24(v16, v18);
  sub_1CFAA6DE0(v22, v22 + 32, 0, (2 * *(_QWORD *)(v22 + 16)) | 1, (uint64_t)v37);
  sub_1CFAF1714((uint64_t)v37, 22, 0);
  v24 = v23;
  v26 = v25;
  result = swift_release();
  if (__OFSUB__(v26 >> 1, v24))
  {
    __break(1u);
  }
  else
  {
    swift_unknownObjectRetain();
    sub_1CFB01AC4();
    swift_unknownObjectRelease();
    sub_1CFB00DE0();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1CF923A24(v16, v18);
  }
  return result;
}

void SecCertificateRef.merchantCategoryCode.getter()
{
  void *v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[4];
  uint64_t v27;
  unint64_t v28;

  v27 = sub_1CF9838DC((uint64_t)&unk_1E8CDE378);
  v28 = v1;
  v2 = v0;
  sub_1CFADF978((uint64_t)&v27);
  v4 = v3;
  v6 = v5;

  if (!v6)
    goto LABEL_45;
  v7 = HIBYTE(v6) & 0xF;
  v8 = v4 & 0xFFFFFFFFFFFFLL;
  if (!((v6 & 0x2000000000000000) != 0 ? HIBYTE(v6) & 0xF : v4 & 0xFFFFFFFFFFFFLL))
    goto LABEL_45;
  if ((v6 & 0x1000000000000000) != 0)
  {
    sub_1CFAB92B4(v4, v6, 10);
LABEL_45:
    sub_1CF923A24(v27, v28);
    swift_bridgeObjectRelease();
    return;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
      v10 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v10 = (unsigned __int8 *)sub_1CFB0246C();
    sub_1CFAB92A0(v10, v8, 10);
    goto LABEL_45;
  }
  v26[0] = v4;
  v26[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v4 == 43)
  {
    if (v7)
    {
      if (v7 != 1 && (BYTE1(v4) - 48) <= 9u && v7 != 2 && (BYTE2(v4) - 48) <= 9u)
      {
        v11 = 10 * (BYTE1(v4) - 48) + (BYTE2(v4) - 48);
        v12 = v7 - 3;
        if (v12)
        {
          v13 = (unsigned __int8 *)v26 + 3;
          do
          {
            v14 = *v13 - 48;
            if (v14 > 9)
              break;
            v15 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
              break;
            v11 = v15 + v14;
            if (__OFADD__(v15, v14))
              break;
            ++v13;
            --v12;
          }
          while (v12);
        }
      }
      goto LABEL_45;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (v7)
      {
        if ((v4 - 48) <= 9u && v7 != 1 && (BYTE1(v4) - 48) <= 9u)
        {
          v16 = 10 * (v4 - 48) + (BYTE1(v4) - 48);
          v17 = v7 - 2;
          if (v17)
          {
            v18 = (unsigned __int8 *)v26 + 2;
            do
            {
              v19 = *v18 - 48;
              if (v19 > 9)
                break;
              v20 = 10 * v16;
              if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63)
                break;
              v16 = v20 + v19;
              if (__OFADD__(v20, v19))
                break;
              ++v18;
              --v17;
            }
            while (v17);
          }
        }
      }
      goto LABEL_45;
    }
    if (v7)
    {
      if (v7 != 1 && (BYTE1(v4) - 48) <= 9u && v7 != 2 && (BYTE2(v4) - 48) <= 9u)
      {
        v21 = -10 * (BYTE1(v4) - 48) - (BYTE2(v4) - 48);
        v22 = v7 - 3;
        if (v22)
        {
          v23 = (unsigned __int8 *)v26 + 3;
          do
          {
            v24 = *v23 - 48;
            if (v24 > 9)
              break;
            v25 = 10 * v21;
            if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63)
              break;
            v21 = v25 - v24;
            if (__OFSUB__(v25, v24))
              break;
            ++v23;
            --v22;
          }
          while (v22);
        }
      }
      goto LABEL_45;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t SecCertificateRef.pseudonym.getter()
{
  void *v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;

  v6 = sub_1CF9838DC((uint64_t)&unk_1E8CDE3A0);
  v7 = v1;
  v2 = v0;
  sub_1CFADF978((uint64_t)&v6);
  v4 = v3;

  sub_1CF923A24(v6, v7);
  return v4;
}

void sub_1CFADD588(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _BYTE v11[96];

  v3 = (void *)sub_1CFB01A04();
  v4 = (void *)SecCertificateCopyExtensionValue();

  if (v4)
  {
    v5 = sub_1CFB00E7C();
    v7 = v6;

    sub_1CF9239E0(v5, v7);
    sub_1CFADF160(v5, v7);
    v9 = v8;
    sub_1CF923A24(v5, v7);
    sub_1CFAA6DE0(v9, v9 + 32, 0, (2 * *(_QWORD *)(v9 + 16)) | 1, (uint64_t)v11);
    if (v1)
    {
      swift_release();
      sub_1CF923A24(v5, v7);
    }
    else
    {
      sub_1CFA21BAC((uint64_t)v11, (uint64_t *)&v10);
      swift_release();
      sub_1CF923A24(v5, v7);
      *(_OWORD *)a1 = v10;
    }
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void SecCertificateRef.allowableElementsForDisplayOnly.getter(uint64_t a1@<X8>)
{
  sub_1CFADD588(a1);
}

void SecCertificateRef.allowableElementsForDataTransfer.getter(uint64_t a1@<X8>)
{
  sub_1CFADD588(a1);
}

uint64_t SecCertificateRef.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  double v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  SecCertificateNotValidAfter();
  if (v2 == 0.0)
  {
    v3 = sub_1CFB00F54();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 1;
  }
  else
  {
    sub_1CFB00EC4();
    v3 = sub_1CFB00F54();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 0;
  }
  return v4(v5, v6, 1, v3);
}

uint64_t SecCertificateRef.validityPeriod.getter@<X0>(uint64_t a1@<X8>)
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  _QWORD v49[2];

  v49[1] = a1;
  v1 = sub_1CFB01008();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3, v4, v5, v6, v7, v8, v9);
  v11 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49[0] = sub_1CFB01068();
  v12 = *(_QWORD *)(v49[0] - 8);
  MEMORY[0x1E0C80A78](v49[0], v13, v14, v15, v16, v17, v18, v19);
  v21 = (char *)v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1CFB00F54();
  v23 = *(_QWORD *)(v22 - 8);
  v31 = MEMORY[0x1E0C80A78](v22, v24, v25, v26, v27, v28, v29, v30);
  v33 = (char *)v49 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31, v34, v35, v36, v37, v38, v39, v40);
  v42 = (char *)v49 - v41;
  SecCertificateNotValidBefore();
  SecCertificateNotValidAfter();
  sub_1CFB00EC4();
  sub_1CFB00EC4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v11, *MEMORY[0x1E0CB0EF8], v1);
  sub_1CFB01014();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBBF610);
  v43 = sub_1CFB0105C();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_1CFB05840;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v44 + 104))(v46 + v45, *MEMORY[0x1E0CB1130], v43);
  sub_1CF97FF94(v46);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1CFB01020();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD))(v12 + 8))(v21, v49[0]);
  v47 = *(void (**)(char *, uint64_t))(v23 + 8);
  v47(v33, v22);
  return ((uint64_t (*)(char *, uint64_t))v47)(v42, v22);
}

uint64_t SecCertificateRef.keyUsage.getter()
{
  return SecCertificateGetKeyUsage();
}

void *static SecAccessControlRef.fromConstraintsData(_:)(uint64_t a1, unint64_t a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint8_t *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  __int16 v65[12];
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = sub_1CFB012CC();
  v5 = *(_QWORD *)(v4 - 8);
  v13 = MEMORY[0x1E0C80A78](v4, v6, v7, v8, v9, v10, v11, v12);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v16, v17, v18, v19, v20, v21, v22);
  v24 = (char *)&v60 - v23;
  v66 = 0;
  v25 = (void *)SecAccessControlCreate();
  v26 = v25;
  v27 = v66;
  if (v25)
  {
    if (!v66)
    {
      v28 = v25;
      sub_1CF9239E0(a1, a2);
      v29 = (void *)sub_1CFB00E58();
      v30 = objc_msgSend((id)objc_opt_self(), sel_recordFromData_, v29);
      sub_1CF923A24(a1, a2);

      if (v30)
      {
        v31 = objc_msgSend(v30, sel_propertyList);

        if (v31)
        {
          objc_opt_self();
          if (swift_dynamicCastObjCClass())
          {
            SecAccessControlSetConstraints();

            swift_unknownObjectRelease();
            return v26;
          }
          swift_unknownObjectRelease();
        }
      }
      v65[0] = 263;
      v57 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ELL, 0x80000001CFB33A30, v65, 0, v57, 0xD000000000000056, 0x80000001CFB2FE80, v58, 0xD000000000000017, 0x80000001CFB339E0, 673);
      swift_willThrow();

      return v26;
    }
    goto LABEL_8;
  }
  if (v66)
  {
LABEL_8:
    type metadata accessor for CFError(0);
    sub_1CF920A48((unint64_t *)&qword_1ED904C98, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x1E0CB1C60]);
    v32 = (void *)swift_allocError();
    *v33 = v27;
    v34 = v32;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v24, v35, v4);
    v36 = v32;
    v37 = v32;
    v38 = sub_1CFB012B4();
    v39 = v5;
    v40 = sub_1CFB01FC8();
    if (os_log_type_enabled(v38, v40))
    {
      v41 = swift_slowAlloc();
      v61 = v39;
      v42 = (uint8_t *)v41;
      v43 = swift_slowAlloc();
      v62 = v26;
      v44 = v43;
      v64 = v43;
      *(_DWORD *)v42 = 136315138;
      v60 = v42 + 4;
      swift_getErrorValue();
      v45 = sub_1CFB02A24();
      v63 = sub_1CF9C974C(v45, v46, &v64);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CF917000, v38, v40, "Unable to create empty ACL due to error: %s", v42, 0xCu);
      swift_arrayDestroy();
      v47 = v44;
      v26 = v62;
      MEMORY[0x1D17DA6E4](v47, -1, -1);
      MEMORY[0x1D17DA6E4](v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v61 + 8))(v24, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v4);
    }
    LOWORD(v64) = 264;
    v48 = v32;
    v49 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v32, 0xD00000000000001ALL, 0x80000001CFB339C0, (__int16 *)&v64, 0, v49, 0xD000000000000056, 0x80000001CFB2FE80, v50, 0xD000000000000017, 0x80000001CFB339E0, 666);
    swift_willThrow();

    return v26;
  }
  if (qword_1ED9054E8 != -1)
    swift_once();
  v51 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v15, v51, v4);
  v52 = sub_1CFB012B4();
  v53 = sub_1CFB01FC8();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    _os_log_impl(&dword_1CF917000, v52, v53, "Unable to create empty ACL.", v54, 2u);
    MEMORY[0x1D17DA6E4](v54, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
  LOWORD(v64) = 264;
  v55 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002FLL, 0x80000001CFB33A00, (__int16 *)&v64, 0, v55, 0xD000000000000056, 0x80000001CFB2FE80, v56, 0xD000000000000017, 0x80000001CFB339E0, 660);
  swift_willThrow();
  return v26;
}

void *SecAccessControlRef.constraintsData.getter()
{
  void *result;
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  result = (void *)SecAccessControlGetConstraints();
  if (result)
  {
    v1 = (objc_class *)MEMORY[0x1E0CA9AF0];
    v2 = result;
    v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertyList_, v2);
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, sel_data);

      v4 = (void *)sub_1CFB00E7C();
    }

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SecAccessControlRef.constraintsDescription.getter()
{
  uint64_t result;
  void *v1;
  id v2;
  uint64_t v3;

  result = SecAccessControlGetConstraints();
  if (result)
  {
    v1 = (void *)result;
    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903040);
    sub_1CFADFD1C();
    v2 = v1;
    sub_1CFB0195C();

    v3 = sub_1CFB01968();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SecAccessControlRef.hasStockholmPolicy.getter()
{
  return sub_1CFADE260();
}

uint64_t sub_1CFADE260()
{
  uint64_t result;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  _OWORD v15[2];
  _OWORD v16[2];

  result = SecAccessControlGetConstraints();
  if (result)
  {
    v1 = (void *)result;
    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903040);
    sub_1CFADFD1C();
    v2 = v1;
    v3 = sub_1CFB0195C();

    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
    v4 = sub_1CFB0216C();
    v5 = (void *)v4;
    if ((v3 & 0xC000000000000001) != 0)
    {
      v6 = sub_1CFB025C8();

      swift_bridgeObjectRelease();
      if (!v6)
        goto LABEL_15;
    }
    else
    {
      if (!*(_QWORD *)(v3 + 16) || (sub_1CFA92B14(v4), (v7 & 1) == 0))
      {

        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
      swift_unknownObjectRetain();

      swift_bridgeObjectRelease();
    }
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8
      && (v9 = (void *)v8,
          v10 = (void *)sub_1CFB0216C(),
          v11 = objc_msgSend(v9, sel_objectForKeyedSubscript_, v10),
          v10,
          v11))
    {
      sub_1CFB02298();
      swift_unknownObjectRelease();
      sub_1CF923FD8(v15, v16);
      sub_1CF94BBF0((uint64_t)v16, (uint64_t)v15);
      if (swift_dynamicCast())
      {
        v12 = (void *)sub_1CFB01A04();
        v13 = sub_1CFB02154();

        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
        return v13 & 1;
      }
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    }
    else
    {
      swift_unknownObjectRelease();
    }
LABEL_15:
    v13 = 0;
    return v13 & 1;
  }
  __break(1u);
  return result;
}

uint64_t SecAccessControlRef.hasIDVPolicy.getter()
{
  return sub_1CFADE260();
}

uint64_t SecAccessControlRef.isBiometricAuth.getter()
{
  void *Constraints;
  void *v1;
  id v2;
  _OWORD v4[2];

  Constraints = (void *)SecAccessControlGetConstraints();
  v1 = Constraints;
  if (Constraints)
  {
    v2 = Constraints;
    sub_1CFB01950();

  }
  memset(v4, 0, sizeof(v4));

  sub_1CF931B1C((uint64_t)v4, (uint64_t *)&unk_1ED904DA0);
  return 0;
}

uint64_t SecAccessControlRef.hasCBTNConstraint.getter()
{
  uint64_t result;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _OWORD v14[2];
  _BYTE v15[24];
  uint64_t v16;

  result = SecAccessControlGetConstraints();
  if (result)
  {
    v1 = (void *)result;
    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903040);
    sub_1CFADFD1C();
    v2 = v1;
    v3 = sub_1CFB0195C();

    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
    v4 = sub_1CFB0216C();
    v5 = (void *)v4;
    if ((v3 & 0xC000000000000001) != 0)
    {
      v6 = sub_1CFB025C8();

      swift_bridgeObjectRelease();
      if (!v6)
        return 0;
    }
    else
    {
      if (!*(_QWORD *)(v3 + 16) || (sub_1CFA92B14(v4), (v7 & 1) == 0))
      {

        swift_bridgeObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();

      swift_bridgeObjectRelease();
    }
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)sub_1CFB0216C();
      v11 = objc_msgSend(v9, sel_objectForKeyedSubscript_, v10);

      if (v11)
      {
        sub_1CFB02298();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v14, 0, sizeof(v14));
      }
      sub_1CFADFD74((uint64_t)v14, (uint64_t)v15);
      if (!v16)
      {
        swift_unknownObjectRelease();
        sub_1CF931B1C((uint64_t)v15, (uint64_t *)&unk_1ED904DA0);
        return 0;
      }
      sub_1CF9775E8(0, (unint64_t *)&qword_1ED904AE0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v12 = objc_msgSend(v13, sel_BOOLValue);
        swift_unknownObjectRelease();

        return (uint64_t)v12;
      }
    }
    swift_unknownObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t SecAccessControlRef.osgnParentKey.getter()
{
  uint64_t result;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _OWORD v15[2];
  _BYTE v16[24];
  uint64_t v17;

  result = SecAccessControlGetConstraints();
  if (result)
  {
    v1 = (void *)result;
    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903040);
    sub_1CFADFD1C();
    v2 = v1;
    v3 = sub_1CFB0195C();

    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
    v4 = sub_1CFB0216C();
    v5 = (void *)v4;
    if ((v3 & 0xC000000000000001) != 0)
    {
      v6 = sub_1CFB025C8();

      swift_bridgeObjectRelease();
      if (!v6)
        return 0;
    }
    else
    {
      if (!*(_QWORD *)(v3 + 16) || (sub_1CFA92B14(v4), (v7 & 1) == 0))
      {

        swift_bridgeObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();

      swift_bridgeObjectRelease();
    }
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)sub_1CFB0216C();
      v11 = objc_msgSend(v9, sel_objectForKeyedSubscript_, v10);

      if (v11)
      {
        sub_1CFB02298();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v15, 0, sizeof(v15));
      }
      sub_1CFADFD74((uint64_t)v15, (uint64_t)v16);
      if (!v17)
      {
        swift_unknownObjectRelease();
        sub_1CF931B1C((uint64_t)v16, (uint64_t *)&unk_1ED904DA0);
        return 0;
      }
      sub_1CF9775E8(0, (unint64_t *)&qword_1EFBC5430);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v12 = v14;
        v13 = sub_1CFB00E7C();
        swift_unknownObjectRelease();

        return v13;
      }
    }
    swift_unknownObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

BOOL SecAccessControlRef.isOSGNChild.getter()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  v0 = SecAccessControlRef.osgnParentKey.getter();
  v2 = v1 >> 60;
  if (v1 >> 60 != 15)
    sub_1CF931AB0(v0, v1);
  return v2 < 0xF;
}

uint64_t SecTrustRef.certificateChain.getter()
{
  __SecTrust *v0;
  CFArrayRef v1;
  uint64_t v2;
  CFArrayRef v3;

  v1 = SecTrustCopyCertificateChain(v0);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v3 = v1;
    type metadata accessor for SecCertificate(0);
    sub_1CFB01C98();

  }
  return v2;
}

SecTrustRef static SecTrustRef.newFromUnverifiedCertificate(_:)(const void *a1)
{
  OSStatus v1;
  SecTrustRef v2;
  CFStringRef v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SecTrustRef trust[2];

  trust[1] = *(SecTrustRef *)MEMORY[0x1E0C80C00];
  trust[0] = 0;
  v1 = SecTrustCreateWithCertificates(a1, 0, trust);
  v2 = trust[0];
  if (v1 || !trust[0])
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    v3 = SecCopyErrorMessageString(v1, 0);
    if (v3)
    {
      v4 = (__CFString *)v3;
      v5 = sub_1CFB01A28();
      v7 = v6;

    }
    else
    {
      v5 = 0;
      v7 = 0;
    }
    v16 = v5;
    v17 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBBFC88);
    sub_1CFB0252C();
    swift_bridgeObjectRelease();
    v8 = v14;
    v9 = v15;
    LOWORD(v14) = 152;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0DEDBC8];
    *(_DWORD *)(inited + 40) = v1;
    v11 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v8, v9, (__int16 *)&v14, 0, v11, 0xD000000000000056, 0x80000001CFB2FE80, v12, 0xD000000000000020, 0x80000001CFB33A70, 827);
    swift_willThrow();

  }
  return v2;
}

void sub_1CFADEE88(uint64_t a1@<X8>)
{
  sub_1CFADD588(a1);
}

void sub_1CFADEEC0(uint64_t a1@<X8>)
{
  sub_1CFADD588(a1);
}

void sub_1CFADEEF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1CFADEF58(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x1CFADF13CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_1CFADF160(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_1CFB00EAC();
  MEMORY[0x1E0C80A78](v3, v4, v5, v6, v7, v8, v9, v10);
  __asm { BR              X10 }
}

_QWORD *sub_1CFADF1DC()
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED9054A0);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_1CF9239E0(v2, v0);
    v7 = sub_1CFB00E1C();
    sub_1CF923A24(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x1CFADF2B0);
    }
  }
  return v4;
}

void *sub_1CFADF2C8()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v0 = sub_1CFB012CC();
  v1 = *(_QWORD *)(v0 - 8);
  v9 = MEMORY[0x1E0C80A78](v0, v2, v3, v4, v5, v6, v7, v8);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)&v47 - v19;
  v52 = 0;
  v21 = (void *)sub_1CFB00E58();
  v22 = (void *)SecAccessControlCreateFromData();

  v23 = v52;
  if (v22)
  {
    if (!v52)
      return v22;
    goto LABEL_5;
  }
  if (v52)
  {
LABEL_5:
    type metadata accessor for CFError(0);
    sub_1CF920A48((unint64_t *)&qword_1ED904C98, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x1E0CB1C60]);
    v24 = (void *)swift_allocError();
    *v25 = v23;
    v26 = v24;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v20, v27, v0);
    v28 = v24;
    v29 = v24;
    v30 = sub_1CFB012B4();
    v31 = sub_1CFB01FC8();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v48 = v1;
      v34 = v33;
      v51 = v33;
      v49 = v22;
      *(_DWORD *)v32 = 136315138;
      v47 = v32 + 4;
      swift_getErrorValue();
      v35 = sub_1CFB02A24();
      v50 = sub_1CF9C974C(v35, v36, &v51);
      v22 = v49;
      sub_1CFB021C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CF917000, v30, v31, "Unable to deserialize ACL due to error: %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v34, -1, -1);
      MEMORY[0x1D17DA6E4](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v0);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v1 + 8))(v20, v0);
    }
    LOWORD(v51) = 262;
    v37 = v24;
    v38 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v24, 0xD000000000000019, 0x80000001CFB33B70, (__int16 *)&v51, 0, v38, 0xD000000000000056, 0x80000001CFB2FE80, v39, 0x617461446D6F7266, 0xEC000000293A5F28, 645);
    swift_willThrow();

    return v22;
  }
  if (qword_1ED9054E8 != -1)
    swift_once();
  v41 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v11, v41, v0);
  v42 = sub_1CFB012B4();
  v43 = sub_1CFB01FC8();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_1CF917000, v42, v43, "Unable to deserialize ACL.", v44, 2u);
    MEMORY[0x1D17DA6E4](v44, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
  LOWORD(v51) = 262;
  v45 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002FLL, 0x80000001CFB33A00, (__int16 *)&v51, 0, v45, 0xD000000000000056, 0x80000001CFB2FE80, v46, 0x617461446D6F7266, 0xEC000000293A5F28, 639);
  swift_willThrow();
  return v22;
}

void sub_1CFADF87C(SecCertificateRef *a1@<X0>, uint64_t *a2@<X8>)
{
  CFDataRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = SecCertificateCopyData(*a1);
  v4 = sub_1CFB00E7C();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_1CFADF8D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v0 = SecCertificateCopySubjectAttributeValue();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  v2 = sub_1CFB01A28();

  return v2;
}

void sub_1CFADF978(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1CFADF9D4@<X0>(uint64_t a1@<X8>)
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
  result = sub_1CFADF8D0();
  *v1 = v2;
  v1[1] = v4 | ((unint64_t)v5 << 32) | ((unint64_t)v6 << 40) | ((unint64_t)v7 << 48);
  return result;
}

unint64_t sub_1CFADFD1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBC54B8;
  if (!qword_1EFBC54B8)
  {
    v1 = sub_1CF9775E8(255, (unint64_t *)&qword_1ED903040);
    result = MEMORY[0x1D17DA600](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBC54B8);
  }
  return result;
}

uint64_t sub_1CFADFD74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED904DA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1CFADFDC0()
{
  unint64_t result;

  result = qword_1EFBC54C0;
  if (!qword_1EFBC54C0)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for SecKeyRef.KeyClass, &type metadata for SecKeyRef.KeyClass);
    atomic_store(result, (unint64_t *)&qword_1EFBC54C0);
  }
  return result;
}

unint64_t sub_1CFADFE08()
{
  unint64_t result;

  result = qword_1EFBC54C8;
  if (!qword_1EFBC54C8)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for PublicKeyAlgorithm, &type metadata for PublicKeyAlgorithm);
    atomic_store(result, (unint64_t *)&qword_1EFBC54C8);
  }
  return result;
}

uint64_t type metadata accessor for DIPSecureData()
{
  return objc_opt_self();
}

uint64_t method lookup function for DIPSecureData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DIPSecureData.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DIPSecureData.bytes()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of DIPSecureData.length()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t _s8KeyClassOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFADFEE4 + 4 * byte_1CFB20608[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CFADFF18 + 4 * byte_1CFB20603[v4]))();
}

uint64_t sub_1CFADFF18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFADFF20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFADFF28);
  return result;
}

uint64_t sub_1CFADFF34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFADFF3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CFADFF40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFADFF48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SecKeyRef.KeyClass()
{
  return &type metadata for SecKeyRef.KeyClass;
}

uint64_t storeEnumTagSinglePayload for PublicKeyAlgorithm(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFADFFB0 + 4 * byte_1CFB20612[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1CFADFFE4 + 4 * byte_1CFB2060D[v4]))();
}

uint64_t sub_1CFADFFE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFADFFEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFADFFF4);
  return result;
}

uint64_t sub_1CFAE0000(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAE0008);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1CFAE000C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE0014(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PublicKeyAlgorithm()
{
  return &type metadata for PublicKeyAlgorithm;
}

uint64_t sub_1CFAE0030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1CFAE00B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150) - 8) + 80);
  sub_1CFADA804(*(_QWORD *)(v0 + 16), *(NSObject **)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_1CFAE00FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CFAE0160(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904150);
  return sub_1CFADAAC0(a1, a2, a3);
}

uint64_t IdentityType.init(rawValue:)()
{
  return 0;
}

_QWORD *sub_1CFAE01D4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 0;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

CoreIDVShared::IdentityProofingIDType_optional __swiftcall IdentityProofingIDType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  BOOL v3;
  void *object;
  uint64_t countAndFlagsBits;
  CoreIDVShared::IdentityProofingIDType_optional result;
  char v7;
  char v8;

  v2 = v1;
  v3 = rawValue._countAndFlagsBits == 25705 && rawValue._object == (void *)0xE200000000000000;
  if (v3 || (object = rawValue._object, countAndFlagsBits = rawValue._countAndFlagsBits, (sub_1CFB028B0() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else if (countAndFlagsBits == 27748 && object == (void *)0xE200000000000000)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 1;
  }
  else
  {
    v8 = sub_1CFB028B0();
    result.value = swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      v7 = 1;
    else
      v7 = 2;
  }
  *v2 = v7;
  return result;
}

uint64_t static IdentityProofingIDType.proofingIDTypeFrom(identityPassType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  char v7;

  if (result == 0x44496574617473 && a2 == 0xE700000000000000)
  {
    v7 = 0;
  }
  else
  {
    v6 = result;
    result = sub_1CFB028B0();
    v7 = 0;
    if ((result & 1) == 0)
    {
      v7 = 1;
      if (v6 != 27748 || a2 != 0xE200000000000000)
      {
        result = sub_1CFB028B0();
        if ((result & 1) != 0)
          v7 = 1;
        else
          v7 = 2;
      }
    }
  }
  *a3 = v7;
  return result;
}

uint64_t IdentityProofingIDType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 27748;
  if (*v0 != 1)
    v1 = 0x636972656E6567;
  if (*v0)
    return v1;
  else
    return 0x44496574617473;
}

uint64_t sub_1CFAE03CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1CFA28384(*a1, *a2);
}

uint64_t sub_1CFAE03D8()
{
  sub_1CFB02A90();
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAE046C()
{
  sub_1CFB01ADC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFAE04DC()
{
  sub_1CFB02A90();
  sub_1CFB01ADC();
  swift_bridgeObjectRelease();
  return sub_1CFB02ACC();
}

CoreIDVShared::IdentityProofingIDType_optional sub_1CFAE056C(Swift::String *a1)
{
  return IdentityProofingIDType.init(rawValue:)(*a1);
}

void sub_1CFAE0578(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE200000000000000;
  v5 = 27748;
  if (v2 != 1)
  {
    v5 = 0x636972656E6567;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x44496574617473;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t IdentityProofingTextReplacementProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IdentityProofingTextReplacementProvider.init()()
{
  uint64_t v0;

  return v0;
}

char *sub_1CFAE05E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *result;
  char *v17;
  char wapiCapability;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = (char *)(id)MobileGestalt_get_current_device();
  if (result)
  {
    v17 = result;
    wapiCapability = MobileGestalt_get_wapiCapability();

    type metadata accessor for IdentityProofingTextReplacementHelper();
    result = (char *)swift_allocObject();
    *((_QWORD *)result + 2) = 0xD000000000000010;
    *((_QWORD *)result + 3) = 0x80000001CFB33B90;
    strcpy(result + 32, "id.subregion");
    result[45] = 0;
    *((_WORD *)result + 23) = -5120;
    strcpy(result + 48, "idtype.proper");
    *((_WORD *)result + 31) = -4864;
    strcpy(result + 64, "idtype.lower");
    result[77] = 0;
    *((_WORD *)result + 39) = -5120;
    *((_QWORD *)result + 10) = 0x6E2E726575737369;
    *((_QWORD *)result + 11) = 0xEB00000000656D61;
    *((_QWORD *)result + 12) = 0xD000000000000011;
    *((_QWORD *)result + 13) = 0x80000001CFB33BB0;
    *((_QWORD *)result + 14) = a1;
    *((_QWORD *)result + 15) = a2;
    *((_QWORD *)result + 16) = a3;
    *((_QWORD *)result + 17) = a4;
    *((_QWORD *)result + 18) = a5;
    *((_QWORD *)result + 19) = a6;
    *((_QWORD *)result + 20) = a7;
    *((_QWORD *)result + 21) = a8;
    result[176] = wapiCapability;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *IdentityProofingTextReplacementHelper.__allocating_init(attributeMessages:messageReplacements:state:country:idType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *result;
  char *v17;
  char wapiCapability;

  result = (char *)(id)MobileGestalt_get_current_device();
  if (result)
  {
    v17 = result;
    wapiCapability = MobileGestalt_get_wapiCapability();

    type metadata accessor for IdentityProofingTextReplacementHelper();
    result = (char *)swift_allocObject();
    *((_QWORD *)result + 2) = 0xD000000000000010;
    *((_QWORD *)result + 3) = 0x80000001CFB33B90;
    strcpy(result + 32, "id.subregion");
    result[45] = 0;
    *((_WORD *)result + 23) = -5120;
    strcpy(result + 48, "idtype.proper");
    *((_WORD *)result + 31) = -4864;
    strcpy(result + 64, "idtype.lower");
    result[77] = 0;
    *((_WORD *)result + 39) = -5120;
    *((_QWORD *)result + 10) = 0x6E2E726575737369;
    *((_QWORD *)result + 11) = 0xEB00000000656D61;
    *((_QWORD *)result + 12) = 0xD000000000000011;
    *((_QWORD *)result + 13) = 0x80000001CFB33BB0;
    *((_QWORD *)result + 14) = a1;
    *((_QWORD *)result + 15) = a2;
    *((_QWORD *)result + 16) = a3;
    *((_QWORD *)result + 17) = a4;
    *((_QWORD *)result + 18) = a5;
    *((_QWORD *)result + 19) = a6;
    *((_QWORD *)result + 20) = a7;
    *((_QWORD *)result + 21) = a8;
    result[176] = wapiCapability;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t IdentityProofingTextReplacementProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t IdentityProofingTextReplacementProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t IdentityProofingTextReplacementHelper.__allocating_init(attributeMessages:messageReplacements:state:country:idType:isWapi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0xD000000000000010;
  *(_QWORD *)(result + 24) = 0x80000001CFB33B90;
  strcpy((char *)(result + 32), "id.subregion");
  *(_BYTE *)(result + 45) = 0;
  *(_WORD *)(result + 46) = -5120;
  strcpy((char *)(result + 48), "idtype.proper");
  *(_WORD *)(result + 62) = -4864;
  strcpy((char *)(result + 64), "idtype.lower");
  *(_BYTE *)(result + 77) = 0;
  *(_WORD *)(result + 78) = -5120;
  *(_QWORD *)(result + 80) = 0x6E2E726575737369;
  *(_QWORD *)(result + 88) = 0xEB00000000656D61;
  *(_QWORD *)(result + 96) = 0xD000000000000011;
  *(_QWORD *)(result + 104) = 0x80000001CFB33BB0;
  *(_QWORD *)(result + 112) = a1;
  *(_QWORD *)(result + 120) = a2;
  *(_QWORD *)(result + 128) = a3;
  *(_QWORD *)(result + 136) = a4;
  *(_QWORD *)(result + 144) = a5;
  *(_QWORD *)(result + 152) = a6;
  *(_QWORD *)(result + 160) = a7;
  *(_QWORD *)(result + 168) = a8;
  *(_BYTE *)(result + 176) = a9;
  return result;
}

uint64_t type metadata accessor for IdentityProofingTextReplacementHelper()
{
  return objc_opt_self();
}

uint64_t IdentityProofingTextReplacementHelper.init(attributeMessages:messageReplacements:state:country:idType:isWapi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;

  *(_QWORD *)(v9 + 16) = 0xD000000000000010;
  *(_QWORD *)(v9 + 24) = 0x80000001CFB33B90;
  strcpy((char *)(v9 + 32), "id.subregion");
  *(_BYTE *)(v9 + 45) = 0;
  *(_WORD *)(v9 + 46) = -5120;
  strcpy((char *)(v9 + 48), "idtype.proper");
  *(_WORD *)(v9 + 62) = -4864;
  strcpy((char *)(v9 + 64), "idtype.lower");
  *(_BYTE *)(v9 + 77) = 0;
  *(_WORD *)(v9 + 78) = -5120;
  *(_QWORD *)(v9 + 80) = 0x6E2E726575737369;
  *(_QWORD *)(v9 + 88) = 0xEB00000000656D61;
  *(_QWORD *)(v9 + 96) = 0xD000000000000011;
  *(_QWORD *)(v9 + 104) = 0x80000001CFB33BB0;
  *(_QWORD *)(v9 + 112) = a1;
  *(_QWORD *)(v9 + 120) = a2;
  *(_QWORD *)(v9 + 128) = a3;
  *(_QWORD *)(v9 + 136) = a4;
  *(_QWORD *)(v9 + 144) = a5;
  *(_QWORD *)(v9 + 152) = a6;
  *(_QWORD *)(v9 + 160) = a7;
  *(_QWORD *)(v9 + 168) = a8;
  *(_BYTE *)(v9 + 176) = a9;
  return v9;
}

uint64_t sub_1CFAE0B00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  char *v16;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
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
  char v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  char *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  BOOL v79;
  int v80;
  uint64_t v81;
  unsigned __int128 v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD v123[2];
  void (*v124)(char *, uint64_t);
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  __int128 v130;
  char *v131;
  void (*v132)(char *, unint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unsigned __int128 v149;
  uint64_t v150;
  uint64_t v151;
  unsigned __int128 v152;

  v3 = v2;
  v140 = sub_1CFB012CC();
  v6 = *(_QWORD *)(v140 - 8);
  v14 = MEMORY[0x1E0C80A78](v140, v7, v8, v9, v10, v11, v12, v13);
  v16 = (char *)v123 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v14, v17, v18, v19, v20, v21, v22, v23);
  v131 = (char *)v123 - v25;
  MEMORY[0x1E0C80A78](v24, v26, v27, v28, v29, v30, v31, v32);
  v135 = (char *)v123 - v33;
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC54D0);
  v134 = *(_QWORD *)(v139 - 8);
  MEMORY[0x1E0C80A78](v139, v34, v35, v36, v37, v38, v39, v40);
  v138 = (char *)v123 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC54D8);
  v43 = *(_QWORD *)(v42 - 8);
  v51 = MEMORY[0x1E0C80A78](v42, v44, v45, v46, v47, v48, v49, v50);
  v53 = (char *)v123 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = MEMORY[0x1E0C80A78](v51, v54, v55, v56, v57, v58, v59, v60);
  v63 = *(_QWORD *)(v2 + 112);
  if (!*(_QWORD *)(v63 + 16))
    goto LABEL_51;
  v125 = (char *)v123 - v62;
  v126 = v61;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v64 = sub_1CFA922E4(a1, a2);
  if ((v65 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_51:
    if (qword_1ED9054E8 != -1)
      swift_once();
    v115 = v140;
    v116 = __swift_project_value_buffer(v140, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v16, v116, v115);
    swift_bridgeObjectRetain_n();
    v117 = sub_1CFB012B4();
    v118 = sub_1CFB01FC8();
    if (os_log_type_enabled(v117, v118))
    {
      v119 = (uint8_t *)swift_slowAlloc();
      v120 = a1;
      v121 = swift_slowAlloc();
      *(_QWORD *)&v143 = v121;
      v136 = v6;
      *(_DWORD *)v119 = 136315138;
      swift_bridgeObjectRetain();
      v148 = sub_1CF9C974C(v120, a2, (uint64_t *)&v143);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF917000, v117, v118, "Attribute config is always expected to have a value for the messageId %s", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v121, -1, -1);
      MEMORY[0x1D17DA6E4](v119, -1, -1);

      (*(void (**)(char *, uint64_t))(v136 + 8))(v16, v140);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v140);
    }
    return 0;
  }
  v66 = (uint64_t *)(*(_QWORD *)(v63 + 56) + 16 * v64);
  v67 = v66[1];
  v129 = *v66;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC54E0);
  sub_1CFB011F4();
  v68 = v126;
  sub_1CFB01200();
  v124 = *(void (**)(char *, uint64_t))(v43 + 8);
  v124(v53, v68);
  *(_QWORD *)&v149 = v129;
  *((_QWORD *)&v149 + 1) = v67;
  v128 = v67;
  sub_1CF9CFF34();
  sub_1CFAE1828();
  v69 = sub_1CFB019B0();
  v71 = *(_QWORD *)(v69 + 16);
  if (v71)
  {
    v72 = v135;
    v73 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
    v123[1] = v69;
    v74 = v69 + v73;
    v75 = *(_QWORD *)(v134 + 72);
    v132 = *(void (**)(char *, unint64_t, uint64_t))(v134 + 16);
    v133 = v75;
    *(_QWORD *)&v70 = 136315138;
    v130 = v70;
    v127 = MEMORY[0x1E0DEE9B8] + 8;
    v136 = v6;
    do
    {
      v137 = v71;
      v132(v138, v74, v139);
      swift_getKeyPath();
      sub_1CFB0120C();
      swift_release();
      v76 = MEMORY[0x1D17D8818](v149, *((_QWORD *)&v149 + 1), v150, v151);
      v78 = v77;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v152 = v76;
      *((_QWORD *)&v152 + 1) = v78;
      v79 = v76 == *(_QWORD *)(v3 + 16) && v78 == *(_QWORD *)(v3 + 24);
      if (v79 || (sub_1CFB028B0() & 1) != 0)
      {
        *(_QWORD *)&v149 = v76;
        *((_QWORD *)&v149 + 1) = v78;
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRelease();
        sub_1CFB01B30();
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRelease();
        v78 = *((_QWORD *)&v149 + 1);
        v76 = v149;
        v80 = 1;
        swift_beginAccess();
        v152 = __PAIR128__(v78, v76);
        swift_bridgeObjectRelease();
        v81 = *(_QWORD *)(v3 + 40);
        if (v76 != *(_QWORD *)(v3 + 32))
          goto LABEL_17;
      }
      else
      {
        v80 = 0;
        v81 = *(_QWORD *)(v3 + 40);
        if (v76 != *(_QWORD *)(v3 + 32))
          goto LABEL_17;
      }
      if (v78 != v81)
      {
LABEL_17:
        if ((sub_1CFB028B0() & 1) == 0)
          goto LABEL_19;
      }
      *(_QWORD *)&v149 = v76;
      *((_QWORD *)&v149 + 1) = v78;
      swift_bridgeObjectRetain();
      sub_1CFB01B30();
      swift_bridgeObjectRetain();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      v78 = *((_QWORD *)&v149 + 1);
      v76 = v149;
      v80 = 1;
      swift_beginAccess();
      v152 = __PAIR128__(v78, v76);
      swift_bridgeObjectRelease();
LABEL_19:
      if (v76 == *(_QWORD *)(v3 + 48) && v78 == *(_QWORD *)(v3 + 56)
        || (sub_1CFB028B0() & 1) != 0
        || v76 == *(_QWORD *)(v3 + 64) && v78 == *(_QWORD *)(v3 + 72)
        || (sub_1CFB028B0() & 1) != 0)
      {
        *(_QWORD *)&v149 = v76;
        *((_QWORD *)&v149 + 1) = v78;
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        sub_1CFB01A88();
        sub_1CFB01B30();
        swift_bridgeObjectRelease();
        v82 = v149;
        swift_beginAccess();
        v152 = v82;
        swift_bridgeObjectRelease();
        if (qword_1ED9054E8 != -1)
          swift_once();
        v83 = v140;
        v84 = __swift_project_value_buffer(v140, (uint64_t)qword_1ED907590);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v72, v84, v83);
        v85 = sub_1CFB012B4();
        v86 = sub_1CFB01FC8();
        if (os_log_type_enabled(v85, v86))
        {
          v87 = swift_slowAlloc();
          v88 = swift_slowAlloc();
          *(_QWORD *)&v149 = v88;
          *(_DWORD *)v87 = v130;
          v89 = v72;
          v91 = *((_QWORD *)&v152 + 1);
          v90 = v152;
          swift_bridgeObjectRetain();
          v92 = v90;
          v6 = v136;
          *(_QWORD *)(v87 + 4) = sub_1CF9C974C(v92, v91, (uint64_t *)&v149);
          v72 = v89;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CF917000, v85, v86, "attributeID is %s", (uint8_t *)v87, 0xCu);
          v80 = 1;
          swift_arrayDestroy();
          MEMORY[0x1D17DA6E4](v88, -1, -1);
          MEMORY[0x1D17DA6E4](v87, -1, -1);

          (*(void (**)(char *, uint64_t))(v6 + 8))(v89, v140);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v6 + 8))(v72, v140);
          v80 = 1;
        }
      }
      swift_beginAccess();
      v94 = *((_QWORD *)&v152 + 1);
      v93 = v152;
      if (v152 == *(_OWORD *)(v3 + 80) || (sub_1CFB028B0() & 1) != 0)
      {
        *(_QWORD *)&v149 = v93;
        *((_QWORD *)&v149 + 1) = v94;
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRelease();
        sub_1CFB01B30();
        swift_bridgeObjectRetain();
        sub_1CFB01B30();
        swift_bridgeObjectRelease();
        v94 = *((_QWORD *)&v149 + 1);
        v93 = v149;
        v152 = v149;
        swift_bridgeObjectRelease();
        if (__PAIR128__(v94, v93) == *(_OWORD *)(v3 + 96) || (sub_1CFB028B0() & 1) != 0)
          goto LABEL_38;
      }
      else
      {
        if (v93 == *(_QWORD *)(v3 + 96) && v94 == *(_QWORD *)(v3 + 104) || (sub_1CFB028B0() & 1) != 0)
        {
LABEL_38:
          *(_QWORD *)&v149 = v93;
          *((_QWORD *)&v149 + 1) = v94;
          swift_bridgeObjectRetain();
          sub_1CFB01B30();
          sub_1CFB01B30();
          swift_bridgeObjectRelease();
          v152 = v149;
          swift_bridgeObjectRelease();
          if (qword_1ED9054E8 != -1)
            swift_once();
          v95 = v140;
          v96 = __swift_project_value_buffer(v140, (uint64_t)qword_1ED907590);
          swift_beginAccess();
          v97 = v131;
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v131, v96, v95);
          v98 = sub_1CFB012B4();
          v99 = sub_1CFB01FC8();
          if (os_log_type_enabled(v98, v99))
          {
            v100 = swift_slowAlloc();
            v101 = swift_slowAlloc();
            *(_QWORD *)&v149 = v101;
            *(_DWORD *)v100 = v130;
            v103 = *((_QWORD *)&v152 + 1);
            v102 = v152;
            swift_bridgeObjectRetain();
            v104 = v102;
            v6 = v136;
            *(_QWORD *)(v100 + 4) = sub_1CF9C974C(v104, v103, (uint64_t *)&v149);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF917000, v98, v99, "attributeID is %s", (uint8_t *)v100, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1D17DA6E4](v101, -1, -1);
            MEMORY[0x1D17DA6E4](v100, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v6 + 8))(v97, v140);
          v72 = v135;
          goto LABEL_43;
        }
        if (!v80)
        {
          v105 = *(_QWORD *)(v3 + 112);
          if (!*(_QWORD *)(v105 + 16))
            goto LABEL_6;
          goto LABEL_45;
        }
      }
LABEL_43:
      v105 = *(_QWORD *)(v3 + 120);
      if (!*(_QWORD *)(v105 + 16))
        goto LABEL_6;
      v94 = *((_QWORD *)&v152 + 1);
      v93 = v152;
LABEL_45:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v106 = sub_1CFA922E4(v93, v94);
      if ((v107 & 1) != 0)
      {
        v108 = (uint64_t *)(*(_QWORD *)(v105 + 56) + 16 * v106);
        v110 = *v108;
        v109 = v108[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v146 = v129;
        v147 = v128;
        swift_getKeyPath();
        v112 = v138;
        v111 = v139;
        sub_1CFB0120C();
        swift_release();
        v143 = v149;
        v144 = v150;
        v145 = v151;
        v141 = v110;
        v142 = v109;
        sub_1CF9B9CD8();
        sub_1CFAE1874();
        v113 = sub_1CFB02214();
        v128 = v114;
        v129 = v113;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v134 + 8))(v112, v111);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v72 = v135;
        v6 = v136;
        goto LABEL_7;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_6:
      (*(void (**)(char *, uint64_t))(v134 + 8))(v138, v139);
      swift_bridgeObjectRelease();
LABEL_7:
      v74 += v133;
      v71 = v137 - 1;
    }
    while (v137 != 1);
  }
  swift_bridgeObjectRelease();
  v124(v125, v126);
  return v129;
}

uint64_t IdentityProofingTextReplacementHelper.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t IdentityProofingTextReplacementHelper.__deallocating_deinit()
{
  IdentityProofingTextReplacementHelper.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_1CFAE1828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBC54E8;
  if (!qword_1EFBC54E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBC54D8);
    result = MEMORY[0x1D17DA600](MEMORY[0x1E0DF1F60], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBC54E8);
  }
  return result;
}

unint64_t sub_1CFAE1874()
{
  unint64_t result;

  result = qword_1EFBC54F0;
  if (!qword_1EFBC54F0)
  {
    result = MEMORY[0x1D17DA600](MEMORY[0x1E0DEBB28], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1EFBC54F0);
  }
  return result;
}

unint64_t sub_1CFAE18BC()
{
  unint64_t result;

  result = qword_1EFBC54F8;
  if (!qword_1EFBC54F8)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for IdentityType, &type metadata for IdentityType);
    atomic_store(result, (unint64_t *)&qword_1EFBC54F8);
  }
  return result;
}

unint64_t sub_1CFAE1904()
{
  unint64_t result;

  result = qword_1EFBC5500;
  if (!qword_1EFBC5500)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for IdentityProofingIDType, &type metadata for IdentityProofingIDType);
    atomic_store(result, (unint64_t *)&qword_1EFBC5500);
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityType()
{
  return &type metadata for IdentityType;
}

uint64_t storeEnumTagSinglePayload for IdentityProofingIDType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAE19A4 + 4 * byte_1CFB20815[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CFAE19D8 + 4 * byte_1CFB20810[v4]))();
}

uint64_t sub_1CFAE19D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE19E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAE19E8);
  return result;
}

uint64_t sub_1CFAE19F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAE19FCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CFAE1A00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE1A08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IdentityProofingIDType()
{
  return &type metadata for IdentityProofingIDType;
}

uint64_t type metadata accessor for IdentityProofingTextReplacementProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityProofingTextReplacementProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityProofingTextReplacementProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of IdentityProofingTextReplacementProvider.makeTextReplacementHelper(attributeMessages:messageReplacements:state:country:idType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t method lookup function for IdentityProofingTextReplacementHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityProofingTextReplacementHelper.__allocating_init(attributeMessages:messageReplacements:state:country:idType:isWapi:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of IdentityProofingTextReplacementHelper.replaceText(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

id ISO18013SessionError(_:code:fromError:)(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_0;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v7 = *a3;
  sub_1CF9226B8(MEMORY[0x1E0DEE9D8]);
  if (a2)
  {
    v8 = sub_1CFB01A28();
    v10 = v9;
    v30 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v29 = a1;
    *((_QWORD *)&v29 + 1) = a2;
    sub_1CF923FD8(&v29, v26);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1CF957EC8(v26, v8, v10, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a4)
  {
    v12 = sub_1CFB01A28();
    v14 = v13;
    swift_getErrorValue();
    v15 = v27;
    v16 = v28;
    v30 = v28;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v29);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(boxed_opaque_existential_0, v15, v16);
    sub_1CF923FD8(&v29, v26);
    v18 = a4;
    v19 = swift_isUniquelyReferenced_nonNull_native();
    sub_1CF957EC8(v26, v12, v14, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v20 = qword_1CFB20BC0[v7];
  v21 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v22 = (void *)sub_1CFB01A04();
  v23 = (void *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v21, sel_initWithDomain_code_userInfo_, v22, v20, v23);

  return v24;
}

uint64_t iso18013SessionErrorDomain.getter()
{
  return 0x33313038314F5349;
}

CoreIDVShared::ISO18013SessionErrorCode_optional __swiftcall ISO18013SessionErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;

  if (rawValue > -2002)
  {
    if (rawValue > -1002)
    {
      if (rawValue == -1001)
      {
        *v1 = 1;
        return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
      }
      if (rawValue == -1000)
      {
        *v1 = 0;
        return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
      }
    }
    else
    {
      if (rawValue == -2001)
      {
        *v1 = 3;
        return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
      }
      if (rawValue == -1002)
      {
        *v1 = 2;
        return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
      }
    }
LABEL_20:
    *v1 = 8;
    return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
  }
  if (rawValue > -3001)
  {
    if (rawValue == -3000)
    {
      *v1 = 5;
      return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
    }
    if (rawValue == -2002)
    {
      *v1 = 4;
      return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
    }
    goto LABEL_20;
  }
  if (rawValue == -6000)
  {
    *v1 = 7;
    return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
  }
  if (rawValue != -5000)
    goto LABEL_20;
  *v1 = 6;
  return (CoreIDVShared::ISO18013SessionErrorCode_optional)rawValue;
}

uint64_t ISO18013SessionErrorCode.rawValue.getter()
{
  char *v0;

  return qword_1CFB20BC0[*v0];
}

BOOL sub_1CFAE1DA0(char *a1, char *a2)
{
  return qword_1CFB20BC0[*a1] == qword_1CFB20BC0[*a2];
}

uint64_t sub_1CFAE1DC4()
{
  sub_1CFB02A90();
  sub_1CFB02A9C();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAE1E10()
{
  return sub_1CFB02A9C();
}

uint64_t sub_1CFAE1E44()
{
  sub_1CFB02A90();
  sub_1CFB02A9C();
  return sub_1CFB02ACC();
}

CoreIDVShared::ISO18013SessionErrorCode_optional sub_1CFAE1E8C(Swift::Int *a1)
{
  return ISO18013SessionErrorCode.init(rawValue:)(*a1);
}

void sub_1CFAE1E94(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_1CFB20BC0[*v1];
}

unint64_t sub_1CFAE1EB0()
{
  unint64_t result;

  result = qword_1EFBC5698;
  if (!qword_1EFBC5698)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ISO18013SessionErrorCode, &type metadata for ISO18013SessionErrorCode);
    atomic_store(result, (unint64_t *)&qword_1EFBC5698);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ISO18013SessionErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAE1F40 + 4 * byte_1CFB20AD5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1CFAE1F74 + 4 * byte_1CFB20AD0[v4]))();
}

uint64_t sub_1CFAE1F74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE1F7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAE1F84);
  return result;
}

uint64_t sub_1CFAE1F90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAE1F98);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1CFAE1F9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE1FA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ISO18013SessionErrorCode()
{
  return &type metadata for ISO18013SessionErrorCode;
}

uint64_t dispatch thunk of ReaderAuthenticationAllowableElementsProviding.allowableElementsForDisplayOnly.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReaderAuthenticationAllowableElementsProviding.allowableElementsForDataTransfer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t DIPECIESSessionV3SecKey.__allocating_init(_:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DIPECIESSessionV3SecKey.init(_:)(a1);
  return v2;
}

BOOL static ECIESOption.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ECIESOption.hash(into:)()
{
  return sub_1CFB02A9C();
}

uint64_t DIPECIESSessionECV1.__allocating_init(_:)(void *a1)
{

  return swift_allocObject();
}

uint64_t DIPECIESSessionECV1.init(_:)(void *a1)
{
  uint64_t v1;

  return v1;
}

uint64_t sub_1CFAE20DC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1CFAE55B0();
  if (v0)
    return v2;
  return result;
}

void sub_1CFAE2104(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1CFAE69FC(a1, a2, a3);
}

uint64_t sub_1CFAE212C()
{
  return sub_1CFAE5910();
}

uint64_t sub_1CFAE2140()
{
  return sub_1CFAE573C();
}

uint64_t DIPECIESSessionECV1.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DIPECIESSessionECV1.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1CFAE216C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  type metadata accessor for DIPECIESSessionECV1();
  result = swift_allocObject();
  *a2 = result;
  return result;
}

id DIPECIESSessionECV3.ePrivateKey.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

id DIPECIESSessionECV3.ePublicKey.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t DIPECIESSessionECV3.ePublicKeyData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_1CF9239E0(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t DIPECIESSessionECV3.__allocating_init(_:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DIPECIESSessionECV3.init(_:)(a1);
  return v2;
}

uint64_t DIPECIESSessionECV3.init(_:)(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
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
  __SecKey *v16;
  __SecKey *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __CFError *v21;
  __CFError *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  CFDataRef v33;
  CFDataRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  CFErrorRef error[4];

  v3 = v1;
  error[3] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v5 = sub_1CFB012CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7, v8, v9, v10, v11, v12, v13);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    *(_QWORD *)(v3 + 16) = a1;
    v16 = a1;
    v17 = SecKeyCopyPublicKey(v16);
    if (!v17)
    {
      LOWORD(error[0]) = 152;
      v18 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000001BLL, 0x80000001CFB33DB0, (__int16 *)error, 0, v18, 0xD000000000000058, 0x80000001CFB33D20, v19, 0x293A5F2874696E69, 0xE800000000000000, 126);
      swift_willThrow();

      v20 = *(void **)(v3 + 16);
LABEL_13:

LABEL_16:
      type metadata accessor for DIPECIESSessionECV3();
      swift_deallocPartialClassInstance();
      return v3;
    }
  }
  else
  {
    LOBYTE(v46[0]) = 0;
    sub_1CFAF09B4(v46, 0, 0);
    if (v2)
    {
      if (qword_1ED9054E8 != -1)
        swift_once();
      v23 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v23, v5);
      v24 = v2;
      v25 = v2;
      v26 = sub_1CFB012B4();
      v27 = sub_1CFB01FD4();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v46[0] = v44;
        v43 = v28;
        *(_DWORD *)v28 = 136446210;
        v42 = v28 + 4;
        swift_getErrorValue();
        v29 = sub_1CFB02A24();
        v45 = sub_1CF9C974C(v29, v30, v46);
        sub_1CFB021C0();
        swift_bridgeObjectRelease();

        v31 = v43;
        _os_log_impl(&dword_1CF917000, v26, v27, "failed to create key pair for ECIES. %{public}s", v43, 0xCu);
        v32 = v44;
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v32, -1, -1);
        MEMORY[0x1D17DA6E4](v31, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
      LOWORD(v46[0]) = 0;
      v38 = v2;
      v39 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v2, 0xD000000000000024, 0x80000001CFB33CF0, (__int16 *)v46, 0, v39, 0xD000000000000058, 0x80000001CFB33D20, v40, 0x293A5F2874696E69, 0xE800000000000000, 136);
      swift_willThrow();

      goto LABEL_16;
    }
    error[0] = v21;
    error[1] = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039B0);
    swift_dynamicCast();
    v17 = (__SecKey *)v46[1];
    *(_QWORD *)(v3 + 16) = v46[0];
  }
  *(_QWORD *)(v3 + 24) = v17;
  error[0] = 0;
  v33 = SecKeyCopyExternalRepresentation(v17, error);
  if (!v33)
  {
    LOWORD(v46[0]) = 152;
    errorFromCFError(_:_:_:)(error[0], 0xD000000000000021, 0x80000001CFB33D80, (__int16 *)v46);
    swift_willThrow();

    v20 = *(void **)(v3 + 24);
    goto LABEL_13;
  }
  v34 = v33;
  v35 = sub_1CFB00E7C();
  v37 = v36;

  *(_QWORD *)(v3 + 32) = v35;
  *(_QWORD *)(v3 + 40) = v37;
  return v3;
}

unint64_t sub_1CFAE2754(uint64_t a1, uint64_t a2, __SecCertificate *a3, uint64_t a4)
{
  return sub_1CFAE4D90(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, SecKeyRef, uint64_t))sub_1CFAE278C, 0xD000000000000040, 0x80000001CFB33DD0, 160);
}

uint64_t sub_1CFAE278C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  __int16 v11[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (*(_QWORD *)(a4 + 16))
    {
      sub_1CFA92AB8(0);
      if ((v6 & 1) != 0)
      {
        if (*(_QWORD *)(a4 + 16))
        {
          sub_1CFA92AB8(1);
          if ((v7 & 1) != 0)
            __asm { BR              X9 }
        }
      }
    }
  }
  v11[0] = 105;
  v8 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000053, 0x80000001CFB33E20, v11, 0, v8, 0xD000000000000058, 0x80000001CFB33D20, v9, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 179);
  return swift_willThrow();
}

uint64_t sub_1CFAE2F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t *a6@<X8>)
{
  const __CFData *v11;
  uint64_t result;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t inited;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v30[2];
  int v31;

  v11 = *(const __CFData **)(a3 + 16);
  result = (uint64_t)CFDataGetBytePtr(v11);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  result = (uint64_t)CFDataGetBytePtr(v11);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a1)
    v13 = a2 - a1;
  else
    v13 = 0;
  v14 = objc_retainAutorelease(a4);
  v15 = objc_msgSend(v14, sel_mutableBytes);
  v16 = objc_retainAutorelease(a5);
  v29 = objc_msgSend(v16, sel_mutableBytes);
  v17 = CCCryptorGCMOneshotEncrypt();
  if (v17)
  {
    v18 = v17;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    v30[0] = 0xD000000000000099;
    v30[1] = 0x80000001CFB344F0;
    v31 = v18;
    v19 = MEMORY[0x1E0DEDBC8];
    sub_1CFB027F0();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = v19;
    *(_DWORD *)(inited + 40) = v18;
    v21 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB344F0, (__int16 *)v30, 0, v21, 0xD000000000000058, 0x80000001CFB33D20, v22, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 209);
    return swift_willThrow();
  }
  objc_msgSend(v14, sel_appendData_, v16, v13, v15, v29, 16);
  result = (uint64_t)CFDataGetBytePtr(v11);
  if (result)
  {
    v23 = sub_1CFAE5690((_BYTE *)(result + 16), 16);
    v25 = v24;
    *a6 = v23;
    a6[1] = v24;
    sub_1CF9239E0(v23, v24);
    v26 = sub_1CFB00E7C();
    v28 = v27;
    result = sub_1CF923A24(v23, v25);
    a6[2] = v26;
    a6[3] = v28;
    return result;
  }
LABEL_12:
  __break(1u);
  return result;
}

const __CFDictionary *sub_1CFAE3200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1CFAE601C(a3, a4, a5, a6, a7);
}

uint64_t sub_1CFAE3228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t *a4@<X8>)
{
  const __CFData *v6;
  uint64_t result;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t inited;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  int v19;

  if (!a1)
  {
    LOWORD(v18[0]) = 153;
    v15 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000003CLL, 0x80000001CFB34480, (__int16 *)v18, 0, v15, 0xD000000000000058, 0x80000001CFB33D20, v16, 0xD000000000000011, 0x80000001CFB34300, 257);
    return swift_willThrow();
  }
  v6 = *(const __CFData **)(a2 + 16);
  result = (uint64_t)CFDataGetBytePtr(v6);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  result = (uint64_t)CFDataGetBytePtr(v6);
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  objc_msgSend(a3, sel_length);
  v8 = objc_retainAutorelease(a3);
  objc_msgSend(v8, sel_mutableBytes);
  objc_msgSend(v8, sel_length);
  v9 = CCCryptorGCMOneshotDecrypt();
  if (v9)
  {
    v10 = v9;
    sub_1CFB02388();
    swift_bridgeObjectRelease();
    v18[0] = 0xD000000000000099;
    v18[1] = 0x80000001CFB344C0;
    v19 = v10;
    v11 = MEMORY[0x1E0DEDBC8];
    sub_1CFB027F0();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = v11;
    *(_DWORD *)(inited + 40) = v10;
    v13 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB344C0, (__int16 *)v18, 0, v13, 0xD000000000000058, 0x80000001CFB33D20, v14, 0xD000000000000011, 0x80000001CFB34300, 268);
    return swift_willThrow();
  }
  result = sub_1CFB00E7C();
  *a4 = result;
  a4[1] = v17;
  return result;
}

uint64_t sub_1CFAE350C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_1CF9239E0(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

void sub_1CFAE354C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

void sub_1CFAE35B4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, CFErrorRef error, __int128 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v34;

  if (BYTE6(v34) == 65)
    __asm { BR              X9 }
  sub_1CFB02388();
  sub_1CFB01B30();
  __asm { BR              X11 }
}

#error "1CFAE39E0: call analysis failed (funcsize=48)"

void sub_1CFAE3900()
{
  sub_1CFB027F0();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  JUMPOUT(0x1CFAE39BCLL);
}

uint64_t DIPECIESSessionECV3.deinit()
{
  uint64_t v0;

  sub_1CF923A24(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t DIPECIESSessionECV3.__deallocating_deinit()
{
  uint64_t v0;

  sub_1CF923A24(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance();
}

uint64_t sub_1CFAE3B2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_1CFAE3B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CFAE3B90(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1CFAE278C);
}

uint64_t sub_1CFAE3B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CFAE3B90(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1CFAE2754);
}

uint64_t sub_1CFAE3B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  result = a7();
  if (v7)
    return v9;
  return result;
}

const __CFDictionary *sub_1CFAE3BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1CFAE601C(a3, a4, a5, a6, a7);
}

uint64_t sub_1CFAE3BF8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 32);
  sub_1CF9239E0(v2, *(_QWORD *)(v1 + 40));
  return v2;
}

__SecKey *sub_1CFAE3C3C(char *a1, SecKeyRef key)
{
  _QWORD *v2;
  _QWORD *v3;
  __SecKey *v4;
  char v5;
  CFDataRef v6;
  CFDataRef v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __SecKey *v17;
  const __CFString *v18;
  __int128 v20;
  CFErrorRef error[2];

  v3 = v2;
  v4 = key;
  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v5 = *a1;
  error[0] = 0;
  v6 = SecKeyCopyExternalRepresentation(key, error);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1CFB00E7C();
    v10 = v9;

    v11 = v3[4];
    v12 = v3[5];
    v13 = v11;
    v14 = v12;
    v15 = v8;
    v16 = v10;
    if ((v5 & 1) == 0)
    {
      v13 = v8;
      v14 = v10;
      v15 = v3[4];
      v16 = v3[5];
    }
    v20 = xmmword_1CFB05A10;
    sub_1CF9239E0(v11, v12);
    sub_1CF9239E0(v8, v10);
    sub_1CFB00E94();
    sub_1CFB00E94();
    v17 = (__SecKey *)v3[2];
    v18 = (const __CFString *)*MEMORY[0x1E0CD6D88];
    sub_1CF9239E0(0, 0xC000000000000000);
    v4 = (__SecKey *)sub_1CFAF0678(v17, v4, v18, 32, 0, 0xC000000000000000);
    sub_1CF923A24(0, 0xC000000000000000);
    sub_1CF923A24(v15, v16);
    sub_1CF923A24(v13, v14);
    sub_1CF923A24(v8, v10);
    sub_1CF923A24(0, 0xC000000000000000);
  }
  else
  {
    LOWORD(v20) = 152;
    errorFromCFError(_:_:_:)(error[0], 0xD000000000000029, 0x80000001CFB341C0, (__int16 *)&v20);
    swift_willThrow();
  }
  return v4;
}

uint64_t DIPECIESSessionECV3SH.__allocating_init(_:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DIPECIESSessionECV3.init(_:)(a1);
  return v2;
}

uint64_t DIPECIESSessionECV3SH.init(_:)(void *a1)
{
  uint64_t v1;

  DIPECIESSessionECV3.init(_:)(a1);
  return v1;
}

uint64_t DIPECIESSessionECV3SH.deinit()
{
  uint64_t v0;

  sub_1CF923A24(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t DIPECIESSessionECV3SH.__deallocating_deinit()
{
  uint64_t v0;

  sub_1CF923A24(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance();
}

uint64_t sub_1CFAE3ED8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  sub_1CF92F5C8(v2, v3);
  return sub_1CF931AB0(v5, v6);
}

uint64_t sub_1CFAE3F44()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_1CFAE3F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return sub_1CF931AB0(v5, v6);
}

uint64_t (*sub_1CFAE3FE0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1CFAE401C(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;
  v5 = v2;

}

void *sub_1CFAE4070()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void sub_1CFAE40B0(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

uint64_t (*sub_1CFAE40F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t DIPECIESSessionV3SecKey.init(_:)(void *a1)
{
  uint64_t v1;
  void **v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  __SecKey *v8;
  __SecKey *v9;
  __SecKey *v10;
  CFDataRef v11;
  const __CFData *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int16 v21;
  CFErrorRef error[8];

  error[7] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  *(_OWORD *)(v1 + 16) = xmmword_1CFB05A20;
  *(_QWORD *)(v1 + 32) = 0;
  v3 = (void **)(v1 + 32);
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  *(_OWORD *)(v1 + 16) = xmmword_1CFB05A20;
  sub_1CF931AB0(v4, v5);
  swift_beginAccess();
  v6 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

  if (a1)
  {
    v7 = *v3;
    *v3 = a1;
    v8 = a1;

    error[0] = 0;
    v9 = SecKeyCopyPublicKey(v8);
    if (v9)
    {
      v10 = v9;
      v11 = SecKeyCopyExternalRepresentation(v9, error);
      if (v11)
      {
        v12 = v11;
        v13 = sub_1CFB00E7C();
        v15 = v14;

        v16 = *(_QWORD *)(v1 + 16);
        v17 = *(_QWORD *)(v1 + 24);
        *(_QWORD *)(v1 + 16) = v13;
        *(_QWORD *)(v1 + 24) = v15;
        sub_1CF931AB0(v16, v17);
        return v1;
      }
      swift_release();
      v21 = 242;
      errorFromCFError(_:_:_:)(error[0], 0xD00000000000003FLL, 0x80000001CFB33F20, &v21);
      swift_willThrow();

    }
    else
    {
      swift_release();
      v21 = 242;
      v18 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000003BLL, 0x80000001CFB33EE0, &v21, 0, v18, 0xD000000000000058, 0x80000001CFB33D20, v19, 0x293A5F2874696E69, 0xE800000000000000, 347);
      swift_willThrow();
    }

  }
  return v1;
}

uint64_t sub_1CFAE4384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  __int16 v12[48];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (*(_QWORD *)(a4 + 16))
    {
      v5 = sub_1CFA92AB8(0);
      if ((v6 & 1) != 0)
      {
        if (*(_QWORD *)(a4 + 16))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 16 * v5 + 8);
          sub_1CFA92AB8(1);
          if ((v8 & 1) != 0)
            __asm { BR              X9 }
        }
      }
    }
  }
  v12[0] = 105;
  v9 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000053, 0x80000001CFB33E20, v12, 0, v9, 0xD000000000000058, 0x80000001CFB33D20, v10, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 358);
  return swift_willThrow();
}

unint64_t sub_1CFAE4D58(uint64_t a1, uint64_t a2, __SecCertificate *a3, uint64_t a4)
{
  return sub_1CFAE4D90(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, SecKeyRef, uint64_t))sub_1CFAE4384, 0xD000000000000032, 0x80000001CFB340A0, 392);
}

unint64_t sub_1CFAE4D90(uint64_t a1, uint64_t a2, SecCertificateRef certificate, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, SecKeyRef, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  SecKeyRef v14;
  SecKeyRef v15;
  unint64_t v16;
  uint64_t v17;
  __int16 v20;

  v14 = SecCertificateCopyKey(certificate);
  if (v14)
  {
    v15 = v14;
    v16 = a5(a1, a2, v14, a4);

  }
  else
  {
    v20 = 152;
    v16 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, a6, a7, &v20, 0, v16, 0xD000000000000058, 0x80000001CFB33D20, v17, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, a8);
    swift_willThrow();
  }
  return v16;
}

id sub_1CFAE4EE8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1CFAE6320(a3, a4, a5, a6, a7);
}

uint64_t sub_1CFAE4F10()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = sub_1CFAE5808();
  v3 = v1;
  if (!v0)
    sub_1CF9239E0(v1, v2);
  return v3;
}

uint64_t DIPECIESSessionV3SecKey.deinit()
{
  uint64_t v0;

  sub_1CF931AB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return v0;
}

uint64_t DIPECIESSessionV3SecKey.__deallocating_deinit()
{
  uint64_t v0;

  sub_1CF931AB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocClassInstance();
}

uint64_t sub_1CFAE4FAC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for DIPECIESSessionV3SecKey();
  v5 = swift_allocObject();
  result = DIPECIESSessionV3SecKey.init(_:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_1CFAE5000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CFAE3B90(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1CFAE4384);
}

uint64_t sub_1CFAE501C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1CFAE3B90(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))sub_1CFAE4D58);
}

id sub_1CFAE5038(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1CFAE6320(a3, a4, a5, a6, a7);
}

uint64_t sub_1CFAE506C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = sub_1CFAE5808();
  v3 = v1;
  if (!v0)
    sub_1CF9239E0(v1, v2);
  return v3;
}

uint64_t sub_1CFAE50BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1CFB00BD0();
  if (!result || (result = sub_1CFB00BE8(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1CFB00BDC();
      return sub_1CFB00E40();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CFAE514C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, void *a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t result;
  uint64_t v11;

  result = sub_1CFB00BD0();
  v11 = result;
  if (result)
  {
    result = sub_1CFB00BE8();
    if (__OFSUB__(a1, result))
      goto LABEL_7;
    v11 += a1 - result;
  }
  if (!__OFSUB__(a2, a1))
  {
    sub_1CFB00BDC();
    sub_1CFAE3228(v11, a3, a4, a5);

    return swift_release();
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1CFAE5208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, void *a4@<X4>, void *a5@<X5>, uint64_t *a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = sub_1CFB00BD0();
  v13 = result;
  if (result)
  {
    result = sub_1CFB00BE8();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v13 += a1 - result;
  }
  v14 = __OFSUB__(a2, a1);
  v15 = a2 - a1;
  if (v14)
  {
    __break(1u);
    goto LABEL_13;
  }
  v16 = sub_1CFB00BDC();
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  v18 = v13 + v17;
  if (v13)
    v19 = v18;
  else
    v19 = 0;
  sub_1CFAE2F50(v13, v19, a3, a4, a5, a6);

  return swift_release();
}

void sub_1CFAE52D8(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_1CFAE533C
     + *((int *)qword_1CFAE54E0 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x1E0CB0338])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_1CFAE534C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_1CF9239E0(v1, v0);
  sub_1CFB00E40();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

uint64_t sub_1CFAE54F0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
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

uint64_t sub_1CFAE55B0()
{
  unint64_t v0;
  uint64_t v1;
  __int16 v3;

  v3 = 106;
  v0 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000003DLL, 0x80000001CFB345F0, &v3, 0, v0, 0xD000000000000058, 0x80000001CFB33D20, v1, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 74);
  return swift_willThrow();
}

uint64_t sub_1CFAE5690(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_1CFAE54F0(__src, &__src[a2]);
  sub_1CFB00C00();
  swift_allocObject();
  sub_1CFB00BC4();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_1CFB00E34();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1CFAE573C()
{
  unint64_t v0;
  uint64_t v1;
  __int16 v3;

  v3 = 106;
  v0 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002FLL, 0x80000001CFB34520, &v3, 0, v0, 0xD000000000000058, 0x80000001CFB33D20, v1, 0xD000000000000013, 0x80000001CFB342C0, 101);
  return swift_willThrow();
}

uint64_t sub_1CFAE5808()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  __int16 v4;

  swift_beginAccess();
  if (*(_QWORD *)(v0 + 24) >> 60 != 15)
    return *(_QWORD *)(v0 + 16);
  v4 = 104;
  v1 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000020, 0x80000001CFB34290, &v4, 0, v1, 0xD000000000000058, 0x80000001CFB33D20, v2, 0xD000000000000013, 0x80000001CFB342C0, 429);
  return swift_willThrow();
}

uint64_t sub_1CFAE5910()
{
  unint64_t v0;
  uint64_t v1;
  __int16 v3;

  v3 = 106;
  v0 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000024, 0x80000001CFB34550, &v3, 0, v0, 0xD000000000000058, 0x80000001CFB33D20, v1, 0xD000000000000011, 0x80000001CFB34300, 97);
  return swift_willThrow();
}

uint64_t sub_1CFAE59DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  __int16 v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (*(_QWORD *)(a4 + 16))
    {
      sub_1CFA92AB8(0);
      if ((v6 & 1) != 0)
      {
        if (*(_QWORD *)(a4 + 16))
        {
          sub_1CFA92AB8(1);
          if ((v7 & 1) != 0)
            __asm { BR              X10 }
        }
      }
    }
  }
  v11[0] = 105;
  v8 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000053, 0x80000001CFB33E20, v11, 0, v8, 0xD000000000000058, 0x80000001CFB33D20, v9, 0xD000000000000011, 0x80000001CFB34300, 247);
  return swift_willThrow();
}

const __CFDictionary *sub_1CFAE601C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t inited;
  void **v17;
  void *v18;
  void *v19;
  void **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  const __CFData *v31;
  SecKeyRef v32;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;
  CFErrorRef error[3];

  v6 = v5;
  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v10 = sub_1CFB00E28();
  if (v11 >> 60 == 15)
  {
    LOWORD(error[0]) = 119;
    v12 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000030, 0x80000001CFB34320, (__int16 *)error, 0, v12, 0xD000000000000058, 0x80000001CFB33D20, v13, 0xD000000000000011, 0x80000001CFB34300, 231);
    swift_willThrow();
  }
  else
  {
    v14 = v10;
    v15 = v11;
    v34 = a2;
    v35 = a5;
    error[0] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039F0);
    inited = swift_initStackObject();
    v17 = (void **)MEMORY[0x1E0CD6A38];
    *(_OWORD *)(inited + 16) = xmmword_1CFB0DD90;
    v18 = *v17;
    *(_QWORD *)(inited + 32) = *v17;
    v19 = (void *)*MEMORY[0x1E0CD6A50];
    type metadata accessor for CFString(0);
    v20 = (void **)MEMORY[0x1E0CD6A20];
    *(_QWORD *)(inited + 40) = v19;
    v21 = *v20;
    *(_QWORD *)(inited + 64) = v22;
    *(_QWORD *)(inited + 72) = v21;
    v23 = MEMORY[0x1E0DEB418];
    *(_QWORD *)(inited + 80) = 256;
    v24 = (void *)*MEMORY[0x1E0CD69F8];
    *(_QWORD *)(inited + 104) = v23;
    *(_QWORD *)(inited + 112) = v24;
    v25 = (void *)*MEMORY[0x1E0CD6A10];
    *(_QWORD *)(inited + 144) = v22;
    *(_QWORD *)(inited + 120) = v25;
    v26 = v18;
    v27 = v19;
    v28 = v21;
    v29 = v24;
    v30 = v25;
    sub_1CF923308(inited);
    v31 = (const __CFData *)sub_1CFB00E58();
    sub_1CFAE6DF8();
    sub_1CFAE6E34();
    v6 = (const __CFDictionary *)sub_1CFB01944();
    swift_bridgeObjectRelease();
    v32 = SecKeyCreateWithData(v31, v6, error);

    if (v32)
    {
      v6 = (const __CFDictionary *)sub_1CFAE59DC(a1, v34, (uint64_t)v32, v35);
      sub_1CF931AB0(v14, v15);

    }
    else
    {
      v36 = 152;
      errorFromCFError(_:_:_:)(error[0], 0xD000000000000040, 0x80000001CFB34400, &v36);
      swift_willThrow();
      sub_1CF931AB0(v14, v15);
    }
  }
  return v6;
}

id sub_1CFAE6320(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  id v6;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t inited;
  void *v33;
  __int128 v34;
  id v35;
  id v36;
  void *v37;
  void *DecryptedDataWithParameters;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  unint64_t v50;
  __int128 v51;
  __int16 v52[12];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  swift_beginAccess();
  v10 = (void *)v5[4];
  if (v10)
  {
    v6 = v10;
    v11 = sub_1CFB00E28();
    if (v12 >> 60 == 15)
    {
      v52[0] = 119;
      v13 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000030, 0x80000001CFB34320, v52, 0, v13, 0xD000000000000058, 0x80000001CFB33D20, v14, 0xD000000000000011, 0x80000001CFB34300, 402);
      swift_willThrow();
LABEL_16:

      return v6;
    }
    v17 = v11;
    v18 = v12;
    swift_beginAccess();
    v19 = v5[3];
    if (v19 >> 60 == 15)
    {
      LOWORD(v51) = 105;
      v20 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000058, 0x80000001CFB34360, (__int16 *)&v51, 0, v20, 0xD000000000000058, 0x80000001CFB33D20, v21, 0xD000000000000011, 0x80000001CFB34300, 405);
      swift_willThrow();
      v22 = v17;
LABEL_15:
      sub_1CF931AB0(v22, v18);
      goto LABEL_16;
    }
    v47 = v17;
    v23 = v5[2];
    if (!a5)
      goto LABEL_14;
    if (!*(_QWORD *)(a5 + 16))
      goto LABEL_14;
    v24 = v5[2];
    v25 = sub_1CFA92AB8(0);
    v23 = v24;
    if ((v26 & 1) == 0
      || !*(_QWORD *)(a5 + 16)
      || (v27 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * v25),
          v44 = *v27,
          v45 = v27[1],
          v28 = sub_1CFA92AB8(1),
          v23 = v24,
          (v29 & 1) == 0))
    {
LABEL_14:
      LOWORD(v51) = 105;
      v39 = v23;
      sub_1CF9239E0(v23, v19);
      v40 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000053, 0x80000001CFB33E20, (__int16 *)&v51, 0, v40, 0xD000000000000058, 0x80000001CFB33D20, v41, 0xD000000000000011, 0x80000001CFB34300, 408);
      swift_willThrow();
      sub_1CF931AB0(v39, v19);
      v22 = v47;
      goto LABEL_15;
    }
    v30 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * v28);
    v31 = *v30;
    v43 = *v30;
    v46 = v30[1];
    v51 = xmmword_1CFB05A10;
    sub_1CF92F5C8(v24, v19);
    sub_1CF9239E0(v44, v45);
    sub_1CF9239E0(v31, v46);
    sub_1CFB00E94();
    sub_1CFB00E94();
    sub_1CFB00E94();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039F0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    v33 = (void *)*MEMORY[0x1E0CD6F00];
    v34 = v51;
    *(_QWORD *)(inited + 64) = MEMORY[0x1E0CB0338];
    *(_QWORD *)(inited + 32) = v33;
    *(_OWORD *)(inited + 40) = v34;
    v35 = v33;
    sub_1CF9239E0(v34, *((unint64_t *)&v34 + 1));
    sub_1CF923308(inited);
    v50 = v18;
    sub_1CF92F5C8(v47, v18);
    sub_1CF9239E0(a1, a2);
    sub_1CFAE52D8(a1, a2);
    sub_1CF923A24(a1, a2);
    v49 = 0;
    v36 = v6;
    v6 = (id)sub_1CFB00E58();
    sub_1CFAE6DF8();
    sub_1CFAE6E34();
    v37 = (void *)sub_1CFB01944();
    swift_bridgeObjectRelease();
    DecryptedDataWithParameters = (void *)SecKeyCreateDecryptedDataWithParameters();

    if (DecryptedDataWithParameters)
    {
      v6 = (id)sub_1CFB00E7C();
      sub_1CF923A24(v44, v45);
      sub_1CF923A24(v47, v18);
      sub_1CF923A24(v43, v46);
      sub_1CF931AB0(v24, v19);
      sub_1CF931AB0(v47, v18);

      sub_1CF923A24(v34, *((unint64_t *)&v34 + 1));
    }
    else
    {
      v48 = 152;
      errorFromCFError(_:_:_:)(v49, 0xD00000000000003DLL, 0x80000001CFB343C0, &v48);
      swift_willThrow();
      sub_1CF923A24(v44, v45);
      sub_1CF923A24(v47, v18);
      sub_1CF923A24(v43, v46);
      sub_1CF931AB0(v24, v19);
      sub_1CF931AB0(v47, v18);

      sub_1CF923A24(v34, *((unint64_t *)&v34 + 1));
    }
  }
  else
  {
    v52[0] = 119;
    v15 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000017, 0x80000001CFB342E0, v52, 0, v15, 0xD000000000000058, 0x80000001CFB33D20, v16, 0xD000000000000011, 0x80000001CFB34300, 399);
    swift_willThrow();
  }
  return v6;
}

void sub_1CFAE69FC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *ApplePinned;
  uint64_t v8;
  id v9;
  void *v10;
  OSStatus v11;
  __SecTrust *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  OSStatus v21;
  _QWORD v22[2];
  SecTrustRef trust[2];

  trust[1] = *(SecTrustRef *)MEMORY[0x1E0C80C00];
  v4 = (void *)sub_1CFB01A04();
  v5 = (void *)sub_1CFB01A04();
  v6 = (void *)sub_1CFB01A04();
  ApplePinned = (void *)DIPSecPolicyCreateApplePinned(v4, v5, v6);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9050E0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1CFB10370;
  *(_QWORD *)(v8 + 32) = a3;
  v22[0] = v8;
  sub_1CFB01CBC();
  trust[0] = 0;
  type metadata accessor for SecCertificate(0);
  v9 = a3;
  v10 = (void *)sub_1CFB01C8C();
  swift_bridgeObjectRelease();
  v11 = SecTrustCreateWithCertificates(v10, ApplePinned, trust);

  if (v11 || !trust[0])
  {
    v22[0] = 152;
    v22[1] = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    v21 = v11;
    v15 = MEMORY[0x1E0DEDBC8];
    sub_1CFB027F0();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903D98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB05840;
    *(_BYTE *)(inited + 32) = 20;
    *(_QWORD *)(inited + 64) = v15;
    *(_DWORD *)(inited + 40) = v11;
    v17 = sub_1CF9220B4(inited);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0, 0xE000000000000000, (__int16 *)v22, 0, v17, 0xD000000000000058, 0x80000001CFB33D20, v18, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 85);
  }
  else
  {
    v22[0] = 0;
    v12 = trust[0];
    v13 = (void *)sub_1CFB00E58();
    v14 = (void *)DIPSecCopyEncryptedToServer(v12, v13, v22);

    if (v14)
    {
      sub_1CFB00E7C();

      return;
    }
    LOWORD(v21) = 152;
    v19 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000028, 0x80000001CFB345C0, (__int16 *)&v21, 0, v19, 0xD000000000000058, 0x80000001CFB33D20, v20, 0x2874707972636E65, 0xEF293A5F3A5F3A5FLL, 91);
  }
  swift_willThrow();

}

uint64_t type metadata accessor for DIPECIESSessionECV3()
{
  return objc_opt_self();
}

unint64_t sub_1CFAE6DF8()
{
  unint64_t result;

  result = qword_1ED903980;
  if (!qword_1ED903980)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED903980);
  }
  return result;
}

unint64_t sub_1CFAE6E34()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1ED903988;
  if (!qword_1ED903988)
  {
    v1 = sub_1CFAE6DF8();
    result = MEMORY[0x1D17DA600](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED903988);
  }
  return result;
}

unint64_t sub_1CFAE6E80()
{
  unint64_t result;

  result = qword_1ED903430;
  if (!qword_1ED903430)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for ECIESOption, &type metadata for ECIESOption);
    atomic_store(result, (unint64_t *)&qword_1ED903430);
  }
  return result;
}

unint64_t sub_1CFAE6EC8()
{
  unint64_t result;

  result = qword_1EFBC56A0;
  if (!qword_1EFBC56A0)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for DIPECIESSessionECV3.KDFMode, &type metadata for DIPECIESSessionECV3.KDFMode);
    atomic_store(result, (unint64_t *)&qword_1EFBC56A0);
  }
  return result;
}

uint64_t sub_1CFAE6F0C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_1CF92F5C8(v4, v5);
}

id sub_1CFAE6F58@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 32);
  *a2 = v4;
  return v4;
}

ValueMetadata *type metadata accessor for ECIESOption()
{
  return &type metadata for ECIESOption;
}

uint64_t dispatch thunk of DIPECIESSessionProtocol.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DIPECIESSessionProtocol.encrypt(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of DIPECIESSessionProtocol.decrypt(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 32))(a1);
}

uint64_t dispatch thunk of DIPECIESSessionProtocol.getLocalPublicKey()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata accessor for DIPECIESSessionECV1()
{
  return objc_opt_self();
}

uint64_t method lookup function for DIPECIESSessionECV1()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DIPECIESSessionECV1.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of DIPECIESSessionECV1.encrypt(_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of DIPECIESSessionECV1.decrypt(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of DIPECIESSessionECV1.getLocalPublicKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t method lookup function for DIPECIESSessionECV3()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DIPECIESSessionECV3.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of DIPECIESSessionECV3.encrypt(_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DIPECIESSessionECV3.decrypt(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DIPECIESSessionECV3.getLocalPublicKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t _s13CoreIDVShared11ECIESOptionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CFAE71D0 + 4 * byte_1CFB20C45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CFAE7204 + 4 * byte_1CFB20C40[v4]))();
}

uint64_t sub_1CFAE7204(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE720C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFAE7214);
  return result;
}

uint64_t sub_1CFAE7220(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFAE7228);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CFAE722C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFAE7234(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DIPECIESSessionECV3.KDFMode()
{
  return &type metadata for DIPECIESSessionECV3.KDFMode;
}

uint64_t type metadata accessor for DIPECIESSessionECV3SH()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DIPECIESSessionV3SecKey()
{
  return objc_opt_self();
}

uint64_t method lookup function for DIPECIESSessionV3SecKey()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePublicKeyData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePublicKeyData.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePublicKeyData.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePrivateKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePrivateKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.ePrivateKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.encrypt(_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.decrypt(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of DIPECIESSessionV3SecKey.getLocalPublicKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t static IdentityProofingFeatureEnablementConfig.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t IdentityProofingFeatureEnablementConfig.isFedStatsOptinEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled);
}

id IdentityProofingFeatureEnablementConfig.__allocating_init(isFedStatsOptinEnabled:)(char a1)
{
  objc_class *v1;
  _BYTE *v3;
  objc_super v5;

  v3 = objc_allocWithZone(v1);
  v3[OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id IdentityProofingFeatureEnablementConfig.init(isFedStatsOptinEnabled:)(char a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v1[OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id IdentityProofingFeatureEnablementConfig.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  _BYTE *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  objc_super v8;

  v3 = objc_allocWithZone(v1);
  v4 = (void *)sub_1CFB01A04();
  v5 = objc_msgSend(a1, sel_decodeBoolForKey_, v4);

  v3[OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled] = v5;
  v8.receiver = v3;
  v8.super_class = v1;
  v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

id IdentityProofingFeatureEnablementConfig.init(coder:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  _BYTE *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = v1;
  v5 = (void *)sub_1CFB01A04();
  v6 = objc_msgSend(a1, sel_decodeBoolForKey_, v5);

  v4[OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled] = v6;
  v9.receiver = v4;
  v9.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

Swift::Void __swiftcall IdentityProofingFeatureEnablementConfig.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(v1
                          + OBJC_IVAR____TtC13CoreIDVShared39IdentityProofingFeatureEnablementConfig_isFedStatsOptinEnabled);
  v4 = (id)sub_1CFB01A04();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v3, v4);

}

void IdentityProofingFeatureEnablementConfig.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t static IdentityProofingDisplayInfo.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t IdentityProofingDisplayInfo.proofingUI.getter()
{
  return swift_bridgeObjectRetain();
}

void *IdentityProofingDisplayInfo.docScan.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_docScan);
  v2 = v1;
  return v1;
}

uint64_t IdentityProofingDisplayInfo.attributeConfig.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig);
  sub_1CF92F5C8(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig + 8));
  return v1;
}

uint64_t IdentityProofingDisplayInfo.learnMoreURL.getter()
{
  return sub_1CF991E7C(&OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_learnMoreURL);
}

uint64_t IdentityProofingDisplayInfo.waitingForWiFiAlertDataThresholdInBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_waitingForWiFiAlertDataThresholdInBytes);
}

uint64_t IdentityProofingDisplayInfo.lowDataModeAlertDataThresholdInBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_lowDataModeAlertDataThresholdInBytes);
}

uint64_t IdentityProofingDisplayInfo.idType.getter()
{
  return sub_1CF991E7C(&OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_idType);
}

void *IdentityProofingDisplayInfo.featureEnablementConfig.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig);
  v2 = v1;
  return v1;
}

uint64_t IdentityProofingDisplayInfo.supportedRegions.getter()
{
  return swift_bridgeObjectRetain();
}

void *IdentityProofingDisplayInfo.livenessStepUpConfig.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig);
  v2 = v1;
  return v1;
}

void *IdentityProofingDisplayInfo.livenessStepUpIQSettings.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings);
  v2 = v1;
  return v1;
}

uint64_t IdentityProofingDisplayInfo.shouldPreFetchLivenessConfig.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_shouldPreFetchLivenessConfig);
}

id IdentityProofingDisplayInfo.__allocating_init(proofingUI:docScan:attributeConfig:learnMoreURL:waitingForWiFiAlertDataThresholdInBytes:lowDataModeAlertDataThresholdInBytes:idType:featureEnablementConfig:supportedRegions:livenessStepUpConfig:livenessStepUpIQSettings:shouldPreFetchLivenessConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, __int128 a11, __int128 a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_class *v15;
  char v19;
  id v20;

  v19 = a8 & 1;
  v20 = objc_allocWithZone(v15);
  return IdentityProofingDisplayInfo.init(proofingUI:docScan:attributeConfig:learnMoreURL:waitingForWiFiAlertDataThresholdInBytes:lowDataModeAlertDataThresholdInBytes:idType:featureEnablementConfig:supportedRegions:livenessStepUpConfig:livenessStepUpIQSettings:shouldPreFetchLivenessConfig:)(a1, a2, a3, a4, a5, a6, a7, v19, a9, a10 & 1, a11, *((uint64_t *)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13, a14, a15);
}

id IdentityProofingDisplayInfo.init(proofingUI:docScan:attributeConfig:learnMoreURL:waitingForWiFiAlertDataThresholdInBytes:lowDataModeAlertDataThresholdInBytes:idType:featureEnablementConfig:supportedRegions:livenessStepUpConfig:livenessStepUpIQSettings:shouldPreFetchLivenessConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _BYTE *v17;
  objc_class *ObjectType;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  char *v28;
  _QWORD *v29;
  objc_super v33;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_proofingUI] = a1;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_docScan] = a2;
  v25 = &v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig];
  *v25 = a3;
  v25[1] = a4;
  v26 = &v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_learnMoreURL];
  *v26 = a5;
  v26[1] = a6;
  v27 = &v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_waitingForWiFiAlertDataThresholdInBytes];
  *(_QWORD *)v27 = a7;
  v27[8] = a8 & 1;
  v28 = &v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_lowDataModeAlertDataThresholdInBytes];
  *(_QWORD *)v28 = a9;
  v28[8] = a10 & 1;
  v29 = &v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_idType];
  *v29 = a11;
  v29[1] = a12;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig] = a13;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_supportedRegions] = a14;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig] = a15;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings] = a16;
  v17[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_shouldPreFetchLivenessConfig] = a17;
  v33.receiver = v17;
  v33.super_class = ObjectType;
  return objc_msgSendSuper2(&v33, sel_init);
}

id IdentityProofingDisplayInfo.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1CFAE81FC(a1);

  return v4;
}

id IdentityProofingDisplayInfo.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_1CFAE81FC(a1);

  return v2;
}

Swift::Void __swiftcall IdentityProofingDisplayInfo.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_proofingUI);
  if (v3)
  {
    type metadata accessor for IdentityProofingUIConfig();
    v3 = sub_1CFB01C8C();
  }
  v4 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();

  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_docScan);
  v6 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_1CFB00E58();
  v8 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_learnMoreURL + 8))
    v9 = sub_1CFB01A04();
  else
    v9 = 0;
  v10 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v9, v10);
  swift_unknownObjectRelease();

  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_waitingForWiFiAlertDataThresholdInBytes
                 + 8) & 1) != 0)
    v11 = 0;
  else
    v11 = sub_1CFB01F08();
  v12 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);
  swift_unknownObjectRelease();

  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_lowDataModeAlertDataThresholdInBytes
                 + 8) & 1) != 0)
    v13 = 0;
  else
    v13 = sub_1CFB01F08();
  v14 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v13, v14);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_idType + 8))
    v15 = sub_1CFB01A04();
  else
    v15 = 0;
  v16 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v15, v16);
  swift_unknownObjectRelease();

  v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig);
  v18 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v17, v18);

  v19 = (void *)sub_1CFB01C8C();
  v20 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v19, v20);

  v21 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig);
  v22 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v21, v22);

  v23 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings);
  v24 = (void *)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v23, v24);

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_shouldPreFetchLivenessConfig) == 2)
    v25 = 0;
  else
    v25 = sub_1CFB01D64();
  v26 = (id)sub_1CFB01A04();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v25, v26);
  swift_unknownObjectRelease();

}

id IdentityProofingDisplayInfo.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void IdentityProofingDisplayInfo.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1CFAE81FC(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  void *v23;
  id v24;
  char *v25;
  void *v26;
  id v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v40;
  objc_super v41;
  _BYTE v42[24];
  uint64_t v43;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBBFA60);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1CFB059A0;
  v6 = sub_1CF9775E8(0, (unint64_t *)&qword_1ED904800);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = type metadata accessor for IdentityProofingUIConfig();
  v7 = v2;
  sub_1CFB02124();
  swift_bridgeObjectRelease();
  if (v43)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5918);
    v8 = swift_dynamicCast();
    v9 = v40;
    if (!v8)
      v9 = 0;
  }
  else
  {
    sub_1CF929418((uint64_t)v42);
    v9 = 0;
  }
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_proofingUI] = v9;
  type metadata accessor for IdentityDocScanConfig();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_docScan] = sub_1CFB02118();
  sub_1CF9775E8(0, (unint64_t *)&qword_1EFBC5430);
  v10 = sub_1CFB02118();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = sub_1CFB00E7C();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  v15 = (uint64_t *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_attributeConfig];
  *v15 = v12;
  v15[1] = v14;
  v16 = sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
  v17 = sub_1CFB02118();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = sub_1CFB01A28();
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  v22 = (uint64_t *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_learnMoreURL];
  *v22 = v19;
  v22[1] = v21;
  v23 = (void *)sub_1CFB01A04();
  v24 = objc_msgSend(a1, sel_decodeIntegerForKey_, v23);

  v25 = &v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_waitingForWiFiAlertDataThresholdInBytes];
  *(_QWORD *)v25 = v24;
  v25[8] = 0;
  v26 = (void *)sub_1CFB01A04();
  v27 = objc_msgSend(a1, sel_decodeIntegerForKey_, v26);

  v28 = &v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_lowDataModeAlertDataThresholdInBytes];
  *(_QWORD *)v28 = v27;
  v28[8] = 0;
  v29 = sub_1CFB02118();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = sub_1CFB01A28();
    v33 = v32;

  }
  else
  {
    v31 = 0;
    v33 = 0;
  }
  v34 = (uint64_t *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_idType];
  *v34 = v31;
  v34[1] = v33;
  type metadata accessor for IdentityProofingFeatureEnablementConfig();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_featureEnablementConfig] = sub_1CFB02118();
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_1CFB059A0;
  *(_QWORD *)(v35 + 32) = v6;
  *(_QWORD *)(v35 + 40) = v16;
  sub_1CFB02124();
  swift_bridgeObjectRelease();
  if (!v43)
  {
    sub_1CF929418((uint64_t)v42);
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
  if (!swift_dynamicCast())
  {
LABEL_19:
    v36 = MEMORY[0x1E0DEE9D8];
    goto LABEL_20;
  }
  v36 = v40;
LABEL_20:
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_supportedRegions] = v36;
  type metadata accessor for IdentityLivenessConfig();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpConfig] = sub_1CFB02118();
  type metadata accessor for IdentityImageQuality();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_livenessStepUpIQSettings] = sub_1CFB02118();
  v37 = (void *)sub_1CFB01A04();
  v38 = objc_msgSend(a1, sel_decodeBoolForKey_, v37);

  v7[OBJC_IVAR____TtC13CoreIDVShared27IdentityProofingDisplayInfo_shouldPreFetchLivenessConfig] = v38;
  v41.receiver = v7;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

uint64_t type metadata accessor for IdentityProofingFeatureEnablementConfig()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityProofingFeatureEnablementConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityProofingFeatureEnablementConfig.__allocating_init(isFedStatsOptinEnabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of IdentityProofingFeatureEnablementConfig.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for IdentityProofingDisplayInfo()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityProofingDisplayInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityProofingDisplayInfo.__allocating_init(proofingUI:docScan:attributeConfig:learnMoreURL:waitingForWiFiAlertDataThresholdInBytes:lowDataModeAlertDataThresholdInBytes:idType:featureEnablementConfig:supportedRegions:livenessStepUpConfig:livenessStepUpIQSettings:shouldPreFetchLivenessConfig:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(v9 + 176))(a1, a2, a3, a4, a5, a6, a7, a8 & 1, a9);
}

uint64_t dispatch thunk of IdentityProofingDisplayInfo.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t copyPublicKeyDataFromCertificate(_:)(__SecCertificate *a1)
{
  __SecKey *v1;
  __SecKey *v2;
  uint64_t v3;

  v1 = SecCertificateCopyKey(a1);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = copyPublicKeyDataFromSecKeyPublic(_:)(v1);

  return v3;
}

__n128 errorFromCFError(_:_:_:)(void *a1, uint64_t a2, uint64_t a3, __int16 *a4)
{
  __int16 v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  __n128 result;
  __n128 v16;
  void *v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;

  v6 = *a4;
  if (a1)
  {
    sub_1CFB02388();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v18 = a2;
    v19.n128_u64[0] = a3;
    sub_1CFB01B30();
    v17 = a1;
    type metadata accessor for CFError(0);
    sub_1CF920A48((unint64_t *)&qword_1ED904C98, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x1E0CB1C60]);
    sub_1CFB02A24();

    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    v8 = a2;
    v9 = a3;
    LOWORD(v17) = v6;
    v10 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    v11 = 728;
  }
  else
  {
    sub_1CFB02388();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v18 = a2;
    v19.n128_u64[0] = a3;
    sub_1CFB01B30();
    v8 = a2;
    v9 = a3;
    LOWORD(v17) = v6;
    v10 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    v11 = 725;
  }
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v8, v9, (__int16 *)&v17, 0, v10, 0xD00000000000005ALL, 0x80000001CFB34890, (uint64_t)&v18, 0xD000000000000018, 0x80000001CFB348F0, v11);
  v12 = v18;
  v16 = v19;
  v13 = v20;
  sub_1CF923828();
  swift_allocError();
  *(_WORD *)v14 = v12;
  result = v16;
  *(__n128 *)(v14 + 8) = v16;
  *(_QWORD *)(v14 + 24) = v13;
  return result;
}

uint64_t sub_1CFAE89F4(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  return static DIPKeystoreKeychain.storeKeychainCertificate(_:label:failIfDuplicate:)(a1, a2, a3, a4);
}

uint64_t static DIPKeystoreKeychain.storeKeychainCertificate(_:label:failIfDuplicate:)(void *a1, uint64_t a2, unint64_t a3, int a4)
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
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t inited;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  __SecCertificate *v45;
  char *v46;
  const __CFDictionary *v47;
  OSStatus v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  CFStringRef v67;
  __CFString *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  CFDataRef v72;
  CFDataRef v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  os_log_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_t v103;
  SecCertificateRef v104;
  int v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;

  v105 = a4;
  v7 = sub_1CFB012CC();
  v111 = *(_QWORD *)(v7 - 8);
  v112 = v7;
  v15 = MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v108 = (char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v15, v17, v18, v19, v20, v21, v22, v23);
  v26 = (char *)&v101 - v25;
  MEMORY[0x1E0C80A78](v24, v27, v28, v29, v30, v31, v32, v33);
  v106 = (char *)&v101 - v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB0DDA0;
  *(_QWORD *)(inited + 32) = sub_1CFB01A28();
  *(_QWORD *)(inited + 40) = v36;
  type metadata accessor for SecCertificate(0);
  *(_QWORD *)(inited + 72) = v37;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 80) = sub_1CFB01A28();
  *(_QWORD *)(inited + 88) = v38;
  *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEA968];
  v109 = a2;
  *(_QWORD *)(inited + 96) = a2;
  *(_QWORD *)(inited + 104) = a3;
  *(_QWORD *)(inited + 128) = sub_1CFB01A28();
  *(_QWORD *)(inited + 136) = v39;
  v40 = (void *)*MEMORY[0x1E0CD6CA0];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 168) = v41;
  *(_QWORD *)(inited + 144) = v40;
  *(_QWORD *)(inited + 176) = sub_1CFB01A28();
  *(_QWORD *)(inited + 184) = v42;
  v43 = (void *)*MEMORY[0x1E0CD68D0];
  *(_QWORD *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903958);
  *(_QWORD *)(inited + 192) = v43;
  v44 = v43;
  v45 = a1;
  v110 = a3;
  swift_bridgeObjectRetain();
  v46 = v40;
  sub_1CF9226B8(inited);
  v47 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v48 = SecItemAdd(v47, 0);

  if (v48 != -25299)
  {
    if (!v48)
    {
      if (qword_1ED9054E8 != -1)
        swift_once();
      v49 = v112;
      v50 = __swift_project_value_buffer(v112, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      v51 = v111;
      v52 = v106;
      (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v106, v50, v49);
      v53 = v110;
      swift_bridgeObjectRetain_n();
      v54 = sub_1CFB012B4();
      v55 = sub_1CFB01FC8();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        v57 = swift_slowAlloc();
        v113 = v57;
        *(_DWORD *)v56 = 136315138;
        swift_bridgeObjectRetain();
        v115 = sub_1CF9C974C(v109, v53, &v113);
        sub_1CFB021C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1CF917000, v54, v55, "certificate %s is stored in the keychain", v56, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v57, -1, -1);
        MEMORY[0x1D17DA6E4](v56, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v111 + 8))(v52, v112);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v52, v49);
      }
    }
    goto LABEL_8;
  }
  v104 = v45;
  v106 = v26;
  if ((v105 & 1) != 0)
  {
LABEL_8:
    if (qword_1ED9054E8 != -1)
      swift_once();
    v59 = v112;
    v60 = __swift_project_value_buffer(v112, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v61 = v111;
    v62 = v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v108, v60, v59);
    v63 = v110;
    swift_bridgeObjectRetain_n();
    v64 = sub_1CFB012B4();
    v65 = sub_1CFB01FD4();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = swift_slowAlloc();
      v107 = swift_slowAlloc();
      v113 = v107;
      *(_DWORD *)v66 = 136315394;
      swift_bridgeObjectRetain();
      v115 = sub_1CF9C974C(v109, v63, &v113);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v66 + 12) = 2082;
      v67 = SecCopyErrorMessageString(v48, 0);
      if (v67)
      {
        v68 = (__CFString *)v67;
        v69 = sub_1CFB01A28();
        v71 = v70;

      }
      else
      {
        v69 = 0;
        v71 = 0xE000000000000000;
      }
      v77 = v108;
      v115 = sub_1CF9C974C(v69, v71, &v113);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF917000, v64, v65, "failed to add certificate to key chain item: label = %s, error = %{public}s", (uint8_t *)v66, 0x16u);
      v78 = v107;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v78, -1, -1);
      MEMORY[0x1D17DA6E4](v66, -1, -1);

      (*(void (**)(char *, uint64_t))(v111 + 8))(v77, v112);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v59);
    }
    v113 = 0;
    v114 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    sub_1CFB01B30();
    v79 = v113;
    v80 = v114;
    LOWORD(v113) = 234;
    v81 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v79, v80, (__int16 *)&v113, 0, v81, 0xD00000000000005ALL, 0x80000001CFB34890, v82, 0xD000000000000032, 0x80000001CFB34950, 410);
    return swift_willThrow();
  }
  v108 = v46;
  v72 = SecCertificateCopySerialNumberData(v104, 0);
  if (v72)
  {
    v73 = v72;
    v74 = sub_1CFB00E7C();
    v76 = v75;

  }
  else
  {
    v74 = 0;
    v76 = 0xF000000000000000;
  }
  v84 = v111;
  v83 = v112;
  v85 = v106;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v86 = __swift_project_value_buffer(v83, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v85, v86, v83);
  v87 = v110;
  swift_bridgeObjectRetain();
  v88 = v74;
  sub_1CF92F5C8(v74, v76);
  swift_bridgeObjectRetain();
  sub_1CF92F5C8(v74, v76);
  v89 = sub_1CFB012B4();
  v105 = sub_1CFB01FC8();
  if (os_log_type_enabled(v89, (os_log_type_t)v105))
  {
    v103 = v89;
    v90 = swift_slowAlloc();
    v102 = swift_slowAlloc();
    v113 = v102;
    *(_DWORD *)v90 = 136315394;
    swift_bridgeObjectRetain();
    v115 = sub_1CF9C974C(v109, v87, &v113);
    sub_1CFB021C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v90 + 12) = 2082;
    if (v76 >> 60 == 15)
    {
      v91 = 0xEB00000000656C62;
      v92 = 0x616C696176616E75;
      v88 = v74;
      v93 = v107;
    }
    else
    {
      v88 = v74;
      v94 = v107;
      sub_1CFA72450(v74, v76);
      v93 = v94;
      v115 = v95;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED903020);
      sub_1CF931BE4((unint64_t *)&qword_1ED903030, (uint64_t *)&unk_1ED903020, MEMORY[0x1E0DEAF20]);
      v92 = sub_1CFB019BC();
      v91 = v96;
      swift_bridgeObjectRelease();
    }
    v115 = sub_1CF9C974C(v92, v91, &v113);
    sub_1CFB021C0();
    swift_bridgeObjectRelease();
    sub_1CF931AB0(v88, v76);
    sub_1CF931AB0(v88, v76);
    v97 = v103;
    _os_log_impl(&dword_1CF917000, v103, (os_log_type_t)v105, "certificate %s already exists in the keychain, serial# = %{public}s", (uint8_t *)v90, 0x16u);
    v98 = v102;
    swift_arrayDestroy();
    MEMORY[0x1D17DA6E4](v98, -1, -1);
    MEMORY[0x1D17DA6E4](v90, -1, -1);

    (*(void (**)(char *, uint64_t))(v111 + 8))(v106, v112);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1CF931AB0(v74, v76);
    sub_1CF931AB0(v74, v76);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v83);
    v93 = v107;
  }
  v99 = sub_1CFB01A28();
  sub_1CFAEFA38(0, 0, v88, v76, v99, v100);
  swift_bridgeObjectRelease();
  if (!v93)
    static DIPKeystoreKeychain.storeKeychainCertificate(_:label:failIfDuplicate:)(v104, v109, v110, 1);
  return sub_1CF931AB0(v88, v76);
}

void sub_1CFAE9498(void *a1, uint64_t a2, unint64_t a3)
{
  sub_1CFAF0010(a1, a2, a3);
}

void static DIPKeystoreKeychain.storeKeychainKey(_:label:)(void *a1, uint64_t a2, unint64_t a3)
{
  sub_1CFAF0010(a1, a2, a3);
}

void sub_1CFAE94C0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  sub_1CFAEFA38(a1, a2, a3, a4, a5, a6);
}

void static DIPKeystoreKeychain.deleteKeychainItem(label:serialNumber:secClass:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  sub_1CFAEFA38(a1, a2, a3, a4, a5, a6);
}

void sub_1CFAE94E8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, CFTypeRef *a5)
{
  sub_1CFAEE6BC(a1, a2, a3, a4, a5);
}

void static DIPKeystoreKeychain.queryKeychainItem(label:secClass:item:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, CFTypeRef *a5)
{
  sub_1CFAEE6BC(a1, a2, a3, a4, a5);
}

unint64_t BAA_INTERMEDIATE_CERT_KEYCHAIN_LABEL.getter()
{
  return 0xD000000000000017;
}

unint64_t IDV_INTERMEDIATE_CERT_KEYCHAIN_LABEL.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t SIGNATURE_ALLOWED_PER_USER_AUTH.getter()
{
  return 7;
}

uint64_t sub_1CFAE9550()
{
  unint64_t v0;
  uint64_t v1;
  __int16 v3;

  v3 = 106;
  v0 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000036, 0x80000001CFB349D0, &v3, 0, v0, 0xD00000000000005ALL, 0x80000001CFB34890, v1, 0xD000000000000014, 0x80000001CFB34A10, 38);
  return swift_willThrow();
}

void sub_1CFAE9620(char *a1, __SecAccessControl *a2)
{
  char v2;

  v2 = *a1;
  sub_1CFAF09B4(&v2, a2, 0);
}

void sub_1CFAE964C(_BYTE *a1, __SecAccessControl *a2, char a3)
{
  sub_1CFAF09B4(a1, a2, a3);
}

void *sub_1CFAE9660(int a1, int a2, SecKeyRef key, SecKeyAlgorithm algorithm)
{
  const __CFData *v6;
  void *Signature;
  id v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  error[0] = 0;
  if (!SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeSign, algorithm))
  {
    v12[0] = 243;
    v12[1] = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    type metadata accessor for SecKeyAlgorithm(0);
    sub_1CFB0252C();
    sub_1CFB01B30();
    Signature = 0;
    v9 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0, 0xE000000000000000, (__int16 *)v12, 0, v9, 0xD00000000000005ALL, 0x80000001CFB34890, v10, 0xD00000000000001ALL, 0x80000001CFB34A30, 90);
LABEL_6:
    swift_willThrow();
    return Signature;
  }
  v6 = (const __CFData *)sub_1CFB00E58();
  Signature = SecKeyCreateSignature(key, algorithm, v6, error);

  if (!Signature)
  {
    LOWORD(v12[0]) = 245;
    errorFromCFError(_:_:_:)(error[0], 0xD000000000000021, 0x80000001CFB33780, (__int16 *)v12);
    goto LABEL_6;
  }
  v8 = Signature;
  Signature = (void *)sub_1CFB00E7C();

  return Signature;
}

void sub_1CFAE98A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __SecKey *a5, const __CFString *a6)
{
  sub_1CFAF0580(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1CFAE98B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFAE9928(a1, a2, a3, a4, 0x80000001CFB34A50, 0x80000001CFB34A80, 107);
}

uint64_t sub_1CFAE98F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CFAE9928(a1, a2, a3, a4, 0x80000001CFB34AA0, 0x80000001CFB34AD0, 111);
}

uint64_t sub_1CFAE9928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v10;
  uint64_t v11;
  __int16 v13;

  v13 = 106;
  v10 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002FLL, a5, &v13, 0, v10, 0xD00000000000005ALL, 0x80000001CFB34890, v11, 0xD00000000000001DLL, a6, a7);
  return swift_willThrow();
}

unint64_t sub_1CFAE99EC(__SecKey *a1, __SecKey *a2, const __CFString *a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_1CFAF0678(a1, a2, a3, a4, a5, a6);
}

uint64_t DIPCryptoKeychain.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DIPCryptoKeychain.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id DIPKeystoreKeychain.laContext.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t DIPKeystoreKeychain.__allocating_init(requireUserAuth:externalizedLAContext:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  swift_allocObject();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1CFA8FEB4;
  return DIPKeystoreKeychain.init(requireUserAuth:externalizedLAContext:)(a1, a2, a3);
}

uint64_t DIPKeystoreKeychain.init(requireUserAuth:externalizedLAContext:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 56) = v3;
  *(_QWORD *)(v4 + 40) = a2;
  *(_BYTE *)(v4 + 96) = a1;
  v5 = sub_1CFB012CC();
  *(_QWORD *)(v4 + 64) = v5;
  *(_QWORD *)(v4 + 72) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 80) = swift_task_alloc();
  return swift_task_switch();
}

void sub_1CFAE9B00()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = v1 >> 60;
  if (v1 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 40);
    sub_1CF9239E0(v4, *(_QWORD *)(v0 + 48));
    v3 = (void *)sub_1CFB00E58();
    sub_1CF931AB0(v4, v1);
  }
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CC12A0]), sel_initWithExternalizedContext_, v3);

  if (v5)
  {
    v6 = *(_QWORD *)(v0 + 56);
    v7 = *(_BYTE *)(v0 + 96);
    *(_QWORD *)(v6 + 16) = v5;
    *(_BYTE *)(v6 + 24) = v7;
    if (v2 <= 0xE)
    {
      sub_1CF931AB0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
      swift_task_dealloc();
      (*(void (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
    }
    else
    {
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v8;
      *v8 = v0;
      v8[1] = sub_1CFAE9C08;
      sub_1CFAE9E88();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1CFAE9C08(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 97) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFAE9C64()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int16 v14[5];

  if ((*(_BYTE *)(v0 + 97) & 1) != 0)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
  }
  else
  {
    swift_release();
    if (qword_1ED9054E8 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 72);
    v2 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 64);
    v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    v6 = sub_1CFB012B4();
    v7 = sub_1CFB01FD4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CF917000, v6, v7, "coreidvd: DIPCryptoKeychain.init failed to acquire user authentication", v8, 2u);
      MEMORY[0x1D17DA6E4](v8, -1, -1);
    }
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    v14[0] = 248;
    v12 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000025, 0x80000001CFB34AF0, v14, 0, v12, 0xD00000000000005ALL, 0x80000001CFB34890, v13, 0xD00000000000002CLL, 0x80000001CFB34B20, 145);
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CFAE9E88()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[41] = v0;
  v2 = sub_1CFB012CC();
  v1[42] = v2;
  v1[43] = *(_QWORD *)(v2 - 8);
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CFAE9F3C()
{
  uint64_t v0;
  uint64_t v1;
  SecAccessControlCreateFlags v2;
  SecAccessControlRef v3;
  void *v4;
  __SecAccessControl *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 328);
  *(_BYTE *)(v0 + 412) = 0;
  *(_QWORD *)(v0 + 320) = 0;
  if (*(_BYTE *)(v1 + 24))
    v2 = 1073741825;
  else
    v2 = 0x40000000;
  v3 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68F0], v2, (CFErrorRef *)(v0 + 320));
  *(_QWORD *)(v0 + 384) = v3;
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(v0 + 328) + 16);
    v5 = v3;
    sub_1CF9230AC(MEMORY[0x1E0DEE9D8]);
    v6 = sub_1CFB01944();
    *(_QWORD *)(v0 + 392) = v6;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 56) = v0 + 288;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1CFAEA1E0;
    v7 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v8 = (_QWORD *)(v0 + 80);
    v8[1] = 0x40000000;
    v8[2] = sub_1CFAEAB68;
    v8[3] = &block_descriptor_24;
    v8[4] = v7;
    objc_msgSend(v4, sel_evaluateAccessControl_operation_options_reply_, v5, 3, v6, v8);
    return swift_continuation_await();
  }
  else
  {
    v10 = *(void **)(v0 + 320);
    v17 = 0;
    errorFromCFError(_:_:_:)(v10, 0xD000000000000040, 0x80000001CFB35200, &v17);
    v12 = v11;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v13 = *(_QWORD *)(v0 + 360);
    v14 = *(_QWORD *)(v0 + 336);
    v15 = *(_QWORD *)(v0 + 344);
    v16 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    DIPLogError(_:message:log:)(v12, 0, 0xE000000000000000);
    _s13CoreIDVShared9AnalyticsC9sendErroryys0E0_pFZ_0(v12);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_1CFAEA1E0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 400) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CFAEA284()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  NSObject *v22;
  uint8_t *v23;
  NSObject *v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 288);

  if (v2)
  {
    swift_bridgeObjectRelease();
    if (qword_1ED9054E8 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 376);
    v4 = *(_QWORD *)(v0 + 336);
    v5 = *(_QWORD *)(v0 + 344);
    v6 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    v7 = sub_1CFB012B4();
    v8 = sub_1CFB01FBC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CF917000, v7, v8, "coreidvd: acquireUserAuthentication evaluateAccessControl success", v9, 2u);
      MEMORY[0x1D17DA6E4](v9, -1, -1);
    }
    v10 = *(_QWORD *)(v0 + 376);
    v11 = *(_QWORD *)(v0 + 336);
    v12 = *(_QWORD *)(v0 + 344);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    *(_BYTE *)(v0 + 412) = 1;
  }
  v13 = (unsigned __int8 *)(v0 + 412);
  if (qword_1ED9054E8 != -1)
    swift_once();
  v14 = *(_QWORD *)(v0 + 368);
  v15 = *(_QWORD *)(v0 + 336);
  v16 = *(_QWORD *)(v0 + 344);
  v17 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
  v18 = *v13;
  v19 = sub_1CFB012B4();
  v20 = sub_1CFB01FBC();
  v21 = os_log_type_enabled(v19, v20);
  v22 = *(NSObject **)(v0 + 384);
  if (v21)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 67240192;
    *(_DWORD *)(v0 + 408) = v18;
    sub_1CFB021C0();
    _os_log_impl(&dword_1CF917000, v19, v20, "coreidvd: acquireUserAuthentication evaluateAccessControl result = %{BOOL,public}d", v23, 8u);
    MEMORY[0x1D17DA6E4](v23, -1, -1);
    v24 = v19;
  }
  else
  {
    v24 = *(NSObject **)(v0 + 384);
    v22 = v19;
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 336));
  swift_beginAccess();
  v25 = *v13;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
}

uint64_t sub_1CFAEA580()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  NSObject *v48;
  uint8_t *v49;
  NSObject *v50;
  uint64_t v52;
  __int16 v53[5];
  uint64_t v54[5];

  v54[4] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(v0 + 392);
  v1 = *(void **)(v0 + 400);
  v3 = *(void **)(v0 + 384);
  swift_willThrow();

  *(_QWORD *)(v0 + 304) = v1;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED904E60);
  if ((swift_dynamicCast() & 1) != 0)
  {

    v53[0] = 291;
    v5 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000021, 0x80000001CFB35280, v53, 0, v5, 0xD00000000000005ALL, 0x80000001CFB34890, (uint64_t)v54, 0xD00000000000001BLL, 0x80000001CFB352B0, 167);
    v6 = v54[0];
    v8 = v54[1];
    v7 = v54[2];
    v9 = (void *)v54[3];
    sub_1CF923828();
    v10 = (void *)swift_allocError();
    *(_WORD *)v11 = v6;
    *(_QWORD *)(v11 + 8) = v8;
    *(_QWORD *)(v11 + 16) = v7;
    *(_QWORD *)(v11 + 24) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = v9;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v13 = *(void **)(v0 + 384);
    v14 = *(_QWORD *)(v0 + 360);
    v16 = *(_QWORD *)(v0 + 336);
    v15 = *(_QWORD *)(v0 + 344);
    v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
    DIPLogError(_:message:log:)(v10, 0, 0xE000000000000000);
    _s13CoreIDVShared9AnalyticsC9sendErroryys0E0_pFZ_0(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    v18 = 0;
  }
  else
  {

    v19 = &unk_1ED905000;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v20 = *(void **)(v0 + 400);
    v21 = *(_QWORD *)(v0 + 344);
    v22 = *(_QWORD *)(v0 + 352);
    v23 = *(_QWORD *)(v0 + 336);
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v22, v24, v23);
    v25 = v20;
    v26 = v20;
    v27 = sub_1CFB012B4();
    v28 = sub_1CFB01FBC();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void **)(v0 + 400);
    v32 = *(_QWORD *)(v0 + 344);
    v31 = *(_QWORD *)(v0 + 352);
    v33 = *(_QWORD *)(v0 + 336);
    if (v29)
    {
      v52 = *(_QWORD *)(v0 + 336);
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v54[0] = v35;
      *(_DWORD *)v34 = 136446210;
      swift_getErrorValue();
      v36 = sub_1CFB02A24();
      *(_QWORD *)(v0 + 312) = sub_1CF9C974C(v36, v37, v54);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CF917000, v27, v28, "coreidvd: acquireUserAuthentication evaluateAccessControl fail %{public}s ", v34, 0xCu);
      swift_arrayDestroy();
      v38 = v35;
      v19 = (_QWORD *)&unk_1ED905000;
      MEMORY[0x1D17DA6E4](v38, -1, -1);
      MEMORY[0x1D17DA6E4](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v52);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    }
    v39 = (unsigned __int8 *)(v0 + 412);
    if (v19[157] != -1)
      swift_once();
    v40 = *(_QWORD *)(v0 + 368);
    v42 = *(_QWORD *)(v0 + 336);
    v41 = *(_QWORD *)(v0 + 344);
    v43 = __swift_project_value_buffer(v42, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v43, v42);
    v44 = *v39;
    v45 = sub_1CFB012B4();
    v46 = sub_1CFB01FBC();
    v47 = os_log_type_enabled(v45, v46);
    v48 = *(NSObject **)(v0 + 384);
    if (v47)
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v49 = 67240192;
      *(_DWORD *)(v0 + 408) = v44;
      sub_1CFB021C0();
      _os_log_impl(&dword_1CF917000, v45, v46, "coreidvd: acquireUserAuthentication evaluateAccessControl result = %{BOOL,public}d", v49, 8u);
      MEMORY[0x1D17DA6E4](v49, -1, -1);
      v50 = v45;
    }
    else
    {
      v50 = *(NSObject **)(v0 + 384);
      v48 = v45;
    }

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 336));
    swift_beginAccess();
    v18 = *v39;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
}

uint64_t sub_1CFAEAB68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED904E60);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
      v8 = sub_1CFB0195C();
    else
      v8 = 0;
    v9 = v8;
    sub_1CF931BA0((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_1EFBC5CD0);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1CFAEAC3C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned __int8 *a5)
{
  return sub_1CFAEE474(a1, a2, a3, a4, a5);
}

uint64_t sub_1CFAEAC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 + 80) = a5;
  *(_QWORD *)(v8 + 88) = v7;
  *(_BYTE *)(v8 + 137) = a7;
  *(_BYTE *)(v8 + 136) = a6;
  *(_QWORD *)(v8 + 64) = a2;
  *(_QWORD *)(v8 + 72) = a3;
  *(_QWORD *)(v8 + 56) = a1;
  *(_QWORD *)(v8 + 96) = type metadata accessor for DIPSignpost.Config(0);
  *(_QWORD *)(v8 + 104) = swift_task_alloc();
  type metadata accessor for DIPSignpost(0);
  *(_QWORD *)(v8 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CFAEACDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  if (qword_1EFBBD610 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 96), (uint64_t)qword_1EFBC61D0);
  sub_1CF94C548(v3, v1);
  DIPSignpost.init(_:)(v1, v2);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v4;
  *(_QWORD *)v4 = v0;
  *(_QWORD *)(v4 + 8) = sub_1CFAEAD9C;
  v6 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v7 = *(_OWORD *)(v0 + 64);
  *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 136);
  *(_QWORD *)(v4 + 96) = v6;
  *(_QWORD *)(v4 + 104) = v5;
  *(_OWORD *)(v4 + 80) = v7;
  return swift_task_switch();
}

uint64_t sub_1CFAEAD9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CFAEAE00()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  __int16 v12[5];

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(unsigned __int8 *)(v0 + 137);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v11 = 0;
  sub_1CFAEB780(v4, v5, v3, &v11, v2, (uint64_t *)(v0 + 16));
  if (!v1)
  {
    if (*(_QWORD *)(v0 + 40))
    {
      v7 = *(_QWORD *)(v0 + 112);
      sub_1CFA31488((__int128 *)(v0 + 16), *(_QWORD *)(v0 + 56));
      DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
      sub_1CF960F94(v7);
      swift_task_dealloc();
      swift_task_dealloc();
      v6 = *(uint64_t (**)(void))(v0 + 8);
      return v6();
    }
    sub_1CF931B1C(v0 + 16, &qword_1EFBC2E50);
    v12[0] = 104;
    v9 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000046, 0x80000001CFB34B50, v12, 0, v9, 0xD00000000000005ALL, 0x80000001CFB34890, v10, 0xD000000000000049, 0x80000001CFB34BA0, 211);
    swift_willThrow();
  }
  sub_1CF960F94(*(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1CFAEAF88()
{
  uint64_t v0;

  sub_1CF960F94(*(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFAEAFD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 144) = a4;
  *(_QWORD *)(v5 + 96) = a3;
  *(_QWORD *)(v5 + 104) = v4;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  return swift_task_switch();
}

uint64_t sub_1CFAEAFF8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  _QWORD *v4;
  char v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  ValueMetadata *v10;
  _UNKNOWN **v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 96);
  if (v1 && *(_QWORD *)(v1 + 16) && (v2 = sub_1CFA92744(5u), (v3 & 1) != 0))
  {
    v4 = (_QWORD *)(*(_QWORD *)(v1 + 56) + 16 * v2);
    if (*v4 == 1702195828 && v4[1] == 0xE400000000000000)
      v6 = 1;
    else
      v6 = sub_1CFB028B0();
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(v0 + 145) = v6 & 1;
  v7 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + 16);
  swift_beginAccess();
  v8 = (void (*)(uint64_t))off_1EFBBFEF8;
  if (off_1EFBBFEF8)
  {
    v9 = swift_retain();
    v8(v9);
    sub_1CF99BC44((uint64_t)v8);
    v10 = *(ValueMetadata **)(v0 + 40);
    v11 = *(_UNKNOWN ***)(v0 + 48);
  }
  else
  {
    v10 = &type metadata for DeviceIdentityCommon;
    v11 = &protocol witness table for DeviceIdentityCommon;
    *(_QWORD *)(v0 + 40) = &type metadata for DeviceIdentityCommon;
    *(_QWORD *)(v0 + 48) = &protocol witness table for DeviceIdentityCommon;
    v12 = swift_allocObject();
    *(_QWORD *)(v0 + 16) = v12;
    *(_QWORD *)(v12 + 40) = &type metadata for DeviceInformationProvider;
    *(_QWORD *)(v12 + 48) = &protocol witness table for DeviceInformationProvider;
  }
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), (uint64_t)v10);
  v15 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))((char *)v11[1] + *(int *)v11[1]);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v13;
  *v13 = v0;
  v13[1] = sub_1CFAEB194;
  return v15(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), v7, *(_QWORD *)(v0 + 96), *(unsigned __int8 *)(v0 + 144), v10, v11);
}

uint64_t sub_1CFAEB194(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_1CFAEB204()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  void *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  __int16 v32;
  __int16 v33;
  __int16 v34[5];

  v1 = *(_QWORD *)(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1CFB02604();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2 != 2)
  {
    v12 = *(void **)(v0 + 120);
    swift_bridgeObjectRelease();
    v33 = 228;
    v17 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    v15 = (void *)swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000030, 0x80000001CFB35110, &v33, 0, v17, 0xD00000000000005ALL, 0x80000001CFB34890, v18, 0xD00000000000003ELL, 0x80000001CFB350D0, 227);
    swift_willThrow();
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(void **)(v0 + 136);
  if ((*(_BYTE *)(v0 + 145) & 1) == 0)
  {
    v5 = *(_QWORD *)(v0 + 80);
    v6 = sub_1CFB01A28();
    sub_1CFAEFA38(v5, v3, 0, 0xF000000000000000, v6, v7);
    if (v4)
    {
LABEL_8:
      v11 = v4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = *(void **)(v0 + 120);
      v34[0] = 0;
      v13 = v4;
      v14 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      v15 = (void *)swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v11, 0xD000000000000021, 0x80000001CFB35150, v34, 0, v14, 0xD00000000000005ALL, 0x80000001CFB34890, v16, 0xD00000000000003ELL, 0x80000001CFB350D0, 243);
      swift_willThrow();

LABEL_10:
      v32 = 0;
      v19 = v15;
      v20 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v15, 0xD000000000000029, 0x80000001CFB350A0, &v32, 0, v20, 0xD00000000000005ALL, 0x80000001CFB34890, v21, 0xD00000000000003ELL, 0x80000001CFB350D0, 246);
      swift_willThrow();

      v22 = *(void (**)(void))(v0 + 8);
LABEL_11:
      v22();
      return;
    }
    swift_bridgeObjectRelease();
  }
  v8 = *(_QWORD *)(v0 + 80);
  v9 = sub_1CFB01A28();
  sub_1CFAEFA38(v8, v3, 0, 0xF000000000000000, v9, v10);
  if (v4)
    goto LABEL_8;
  v23 = *(void **)(v0 + 120);
  v25 = *(_QWORD *)(v0 + 80);
  v24 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRelease();
  sub_1CFAF0010(v23, v25, v24);
  if ((v1 & 0xC000000000000001) != 0)
  {
    v26 = (id)MEMORY[0x1D17D9124](0, *(_QWORD *)(v0 + 128));
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    v26 = *(id *)(*(_QWORD *)(v0 + 128) + 32);
  }
  v27 = v26;
  v29 = *(_QWORD *)(v0 + 80);
  v28 = *(_QWORD *)(v0 + 88);
  type metadata accessor for DIPKeystoreKeychain();
  static DIPKeystoreKeychain.storeKeychainCertificate(_:label:failIfDuplicate:)(v27, v29, v28, 0);

  if ((v1 & 0xC000000000000001) != 0)
  {
    v30 = (id)MEMORY[0x1D17D9124](1, *(_QWORD *)(v0 + 128));
LABEL_19:
    swift_bridgeObjectRelease();
    static DIPKeystoreKeychain.storeKeychainCertificate(_:label:failIfDuplicate:)(v30, 0xD000000000000017, 0x80000001CFB34990, 0);
    v31 = *(void **)(v0 + 120);

    v22 = *(void (**)(void))(v0 + 8);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v30 = *(id *)(*(_QWORD *)(v0 + 128) + 40);
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1CFAEB67C()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  __int16 v6[5];

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = *(void **)(v0 + 136);
  v6[0] = 0;
  v2 = v1;
  v3 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v1, 0xD000000000000029, 0x80000001CFB350A0, v6, 0, v3, 0xD00000000000005ALL, 0x80000001CFB34890, v4, 0xD00000000000003ELL, 0x80000001CFB350D0, 246);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFAEB780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, int a5@<W4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
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
  char *v31;
  uint64_t inited;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  const __CFDictionary *v42;
  OSStatus v43;
  CFTypeRef v44;
  const void *v45;
  CFTypeID v46;
  void *v47;
  unint64_t v48;
  char v49;
  uint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  unsigned __int8 *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t *v76;
  uint64_t v77;
  unsigned __int8 *v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  unsigned int v83;
  uint64_t v84;
  char v85;
  char v86;
  CFTypeRef v87;
  id v88;
  int v89;
  int v90;
  uint64_t *v91;
  uint64_t v92;
  OSStatus v93;
  uint64_t v94;
  uint64_t v95;
  CFTypeRef v96[31];

  v91 = a6;
  v7 = v6;
  v90 = a5;
  v96[29] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v12 = type metadata accessor for DIPSignpost.Config(0);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  v21 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for DIPSignpost(0);
  MEMORY[0x1E0C80A78](v22, v23, v24, v25, v26, v27, v28, v29);
  v31 = (char *)&v87 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB0DDA0;
  *(_QWORD *)(inited + 32) = sub_1CFB01A28();
  *(_QWORD *)(inited + 40) = v33;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  v92 = a1;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 80) = sub_1CFB01A28();
  *(_QWORD *)(inited + 88) = v34;
  v35 = *(void **)(v7 + 16);
  *(_QWORD *)(inited + 120) = sub_1CF9775E8(0, &qword_1EFBC5CC8);
  *(_QWORD *)(inited + 96) = v35;
  *(_QWORD *)(inited + 128) = sub_1CFB01A28();
  *(_QWORD *)(inited + 136) = v36;
  v37 = (void *)*MEMORY[0x1E0CD6CC0];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 168) = v38;
  *(_QWORD *)(inited + 144) = v37;
  *(_QWORD *)(inited + 176) = sub_1CFB01A28();
  *(_QWORD *)(inited + 184) = v39;
  *(_QWORD *)(inited + 216) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 192) = 1;
  swift_bridgeObjectRetain();
  v88 = v35;
  v40 = v37;
  sub_1CF9226B8(inited);
  v96[0] = 0;
  if (qword_1EFBBD638 != -1)
    swift_once();
  v41 = __swift_project_value_buffer(v12, (uint64_t)qword_1EFBC6230);
  sub_1CF94C548(v41, (uint64_t)v21);
  DIPSignpost.init(_:)((uint64_t)v21, (uint64_t)v31);
  v42 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v43 = SecItemCopyMatching(v42, v96);

  v44 = v96[0];
  DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
  if (v43 != -25300)
  {
    if (v43)
    {
      v94 = 0;
      v95 = 0xE000000000000000;
      sub_1CFB02388();
      sub_1CFB01B30();
      sub_1CFB01B30();
      sub_1CFB01B30();
      v93 = v43;
      sub_1CFB027F0();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      v54 = v94;
      v55 = v95;
      LOWORD(v94) = 235;
      v56 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      v58 = 265;
    }
    else
    {
      if (v44)
      {
        v45 = (const void *)swift_unknownObjectRetain();
        v46 = CFGetTypeID(v45);
        if (v46 == SecKeyGetTypeID())
        {
          type metadata accessor for SecKey(0);
          swift_unknownObjectRetain();
          v47 = (void *)swift_dynamicCastUnknownClassUnconditional();
          if (a3 && *(_QWORD *)(a3 + 16) && (v48 = sub_1CFA92744(1u), (v49 & 1) != 0))
          {
            v50 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v48);
            v52 = *v50;
            v51 = v50[1];
            swift_bridgeObjectRetain();
          }
          else
          {
            v52 = 0;
            v51 = 0xE000000000000000;
          }
          v60 = HIBYTE(v51) & 0xF;
          v61 = v52 & 0xFFFFFFFFFFFFLL;
          if ((v51 & 0x2000000000000000) != 0)
            v62 = HIBYTE(v51) & 0xF;
          else
            v62 = v52 & 0xFFFFFFFFFFFFLL;
          v87 = v44;
          if (!v62)
          {
            swift_bridgeObjectRelease();
            goto LABEL_53;
          }
          if ((v51 & 0x1000000000000000) != 0)
          {
            v64 = (uint64_t)sub_1CFAB92B4(v52, v51, 10);
            v86 = v85;
            swift_bridgeObjectRelease();
            if ((v86 & 1) == 0)
              goto LABEL_54;
            goto LABEL_53;
          }
          if ((v51 & 0x2000000000000000) == 0)
          {
            if ((v52 & 0x1000000000000000) != 0)
              v63 = (unsigned __int8 *)((v51 & 0xFFFFFFFFFFFFFFFLL) + 32);
            else
              v63 = (unsigned __int8 *)sub_1CFB0246C();
            v64 = (uint64_t)sub_1CFAB92A0(v63, v61, 10);
            v66 = v65 & 1;
LABEL_52:
            swift_bridgeObjectRelease();
            if ((v66 & 1) == 0)
            {
LABEL_54:
              LOBYTE(v94) = v89;
              v71 = type metadata accessor for IdentityKeyWithKeychain();
              v72 = swift_allocObject();
              swift_bridgeObjectRetain();
              v73 = (uint64_t)v88;
              v74 = v88;
              v75 = v47;
              IdentityKeyWithKeychain.init(label:privateKey:attestationType:laContext:validity:isTemporary:)(v92, a2, v75, (unsigned __int8 *)&v94, v73, v64, 0, v90 & 1);
              v76 = v91;
              v91[3] = v71;
              v76[4] = (uint64_t)&protocol witness table for IdentityKeyWithKeychain;
              swift_unknownObjectRelease();

              *v76 = v72;
              goto LABEL_16;
            }
LABEL_53:
            v64 = 15;
            goto LABEL_54;
          }
          v94 = v52;
          v95 = v51 & 0xFFFFFFFFFFFFFFLL;
          if (v52 == 43)
          {
            if (!v60)
              goto LABEL_77;
            if (v60 != 1 && (BYTE1(v52) - 48) <= 9u)
            {
              v64 = (BYTE1(v52) - 48);
              if (v60 == 2)
                goto LABEL_51;
              if ((BYTE2(v52) - 48) <= 9u)
              {
                v64 = 10 * (BYTE1(v52) - 48) + (BYTE2(v52) - 48);
                v67 = v60 - 3;
                if (v67)
                {
                  v68 = (unsigned __int8 *)&v94 + 3;
                  while (1)
                  {
                    v69 = *v68 - 48;
                    if (v69 > 9)
                      goto LABEL_49;
                    v70 = 10 * v64;
                    if ((unsigned __int128)(v64 * (__int128)10) >> 64 != (10 * v64) >> 63)
                      goto LABEL_49;
                    v64 = v70 + v69;
                    if (__OFADD__(v70, v69))
                      goto LABEL_49;
                    v66 = 0;
                    ++v68;
                    if (!--v67)
                      goto LABEL_52;
                  }
                }
                goto LABEL_51;
              }
            }
          }
          else
          {
            if (v52 == 45)
            {
              if (v60)
              {
                if (v60 == 1 || (BYTE1(v52) - 48) > 9u)
                  goto LABEL_49;
                if (v60 == 2)
                {
                  v66 = 0;
                  v64 = -(uint64_t)(BYTE1(v52) - 48);
                  goto LABEL_52;
                }
                if ((BYTE2(v52) - 48) > 9u)
                  goto LABEL_49;
                v64 = -10 * (BYTE1(v52) - 48) - (BYTE2(v52) - 48);
                v81 = v60 - 3;
                if (v81)
                {
                  v82 = (unsigned __int8 *)&v94 + 3;
                  while (1)
                  {
                    v83 = *v82 - 48;
                    if (v83 > 9)
                      goto LABEL_49;
                    v84 = 10 * v64;
                    if ((unsigned __int128)(v64 * (__int128)10) >> 64 != (10 * v64) >> 63)
                      goto LABEL_49;
                    v64 = v84 - v83;
                    if (__OFSUB__(v84, v83))
                      goto LABEL_49;
                    v66 = 0;
                    ++v82;
                    if (!--v81)
                      goto LABEL_52;
                  }
                }
LABEL_51:
                v66 = 0;
                goto LABEL_52;
              }
              __break(1u);
LABEL_77:
              __break(1u);
            }
            if (v60 && (v52 - 48) <= 9u)
            {
              v64 = (v52 - 48);
              if (v60 == 1)
                goto LABEL_51;
              if ((BYTE1(v52) - 48) <= 9u)
              {
                v64 = 10 * (v52 - 48) + (BYTE1(v52) - 48);
                v77 = v60 - 2;
                if (v77)
                {
                  v78 = (unsigned __int8 *)&v94 + 2;
                  while (1)
                  {
                    v79 = *v78 - 48;
                    if (v79 > 9)
                      goto LABEL_49;
                    v80 = 10 * v64;
                    if ((unsigned __int128)(v64 * (__int128)10) >> 64 != (10 * v64) >> 63)
                      goto LABEL_49;
                    v64 = v80 + v79;
                    if (__OFADD__(v80, v79))
                      goto LABEL_49;
                    v66 = 0;
                    ++v78;
                    if (!--v77)
                      goto LABEL_52;
                  }
                }
                goto LABEL_51;
              }
            }
          }
LABEL_49:
          v64 = 0;
          v66 = 1;
          goto LABEL_52;
        }
        swift_unknownObjectRelease();
      }
      v94 = 0;
      v95 = 0xE000000000000000;
      sub_1CFB02388();
      sub_1CFB01B30();
      sub_1CFB01B30();
      sub_1CFB01B30();
      v54 = v94;
      v55 = v95;
      LOWORD(v94) = 235;
      v56 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      v58 = 270;
    }
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v54, v55, (__int16 *)&v94, 0, v56, 0xD00000000000005ALL, 0x80000001CFB34890, v57, 0xD000000000000041, 0x80000001CFB34FF0, v58);
    swift_willThrow();
LABEL_16:
    sub_1CF960F94((uint64_t)v31);
    return swift_unknownObjectRelease();
  }
  sub_1CF960F94((uint64_t)v31);
  v53 = v91;
  *(_OWORD *)v91 = 0u;
  *((_OWORD *)v53 + 1) = 0u;
  v53[4] = 0;
  return swift_unknownObjectRelease();
}

uint64_t IdentityKeyWithKeychain.__allocating_init(label:privateKey:attestationType:laContext:validity:isTemporary:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, char a7, int a8)
{
  int v15;
  uint64_t v16;

  v15 = a7 & 1;
  v16 = swift_allocObject();
  IdentityKeyWithKeychain.init(label:privateKey:attestationType:laContext:validity:isTemporary:)(a1, a2, a3, a4, a5, a6, v15, a8);
  return v16;
}

uint64_t sub_1CFAEC0DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t *a5@<X8>)
{
  unsigned __int8 v6;

  v6 = *a4;
  return sub_1CFAEB780(a1, a2, a3, &v6, 0, a5);
}

uint64_t sub_1CFAEC108(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = sub_1CFB01A28();
  sub_1CFAEFA38(a1, a2, 0, 0xF000000000000000, v5, v6);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    v7 = sub_1CFB01A28();
    sub_1CFAEFA38(a1, a2, 0, 0xF000000000000000, v7, v8);
  }
  return swift_bridgeObjectRelease();
}

unint64_t static DIPKeystoreKeychain.deleteAll()()
{
  uint64_t inited;
  void *v1;
  void *v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t result;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  id v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  const __CFDictionary *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9050E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB10340;
  v1 = (void *)*MEMORY[0x1E0CD6CA8];
  v2 = (void *)*MEMORY[0x1E0CD6CB8];
  v3 = (void **)MEMORY[0x1E0CD6CA0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CD6CA8];
  *(_QWORD *)(inited + 40) = v2;
  v4 = *v3;
  v5 = (void *)*MEMORY[0x1E0CD6CC0];
  *(_QWORD *)(inited + 48) = *v3;
  *(_QWORD *)(inited + 56) = v5;
  v6 = (void *)*MEMORY[0x1E0CD6CB0];
  *(_QWORD *)(inited + 64) = *MEMORY[0x1E0CD6CB0];
  v29 = inited;
  result = sub_1CFB01CBC();
  v8 = v29;
  if ((v29 & 0xC000000000000001) != 0 || *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10) >= 5uLL)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903388);
    v9 = v1;
    v10 = v2;
    v11 = v4;
    v12 = v5;
    v13 = v6;
    v14 = 0;
    while (1)
    {
      v15 = (v29 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x1D17D9124](v14, v8)
          : *(id *)(v8 + 8 * v14 + 32);
      v16 = v15;
      v27 = sub_1CFB01A28();
      v28 = v17;
      v18 = (_QWORD *)sub_1CFB02628();
      v19 = v16;
      swift_bridgeObjectRetain();
      v20 = v16;
      result = sub_1CFA922E4(v27, v28);
      if ((v21 & 1) != 0)
        break;
      v18[(result >> 6) + 8] |= 1 << result;
      v22 = (uint64_t *)(v18[6] + 16 * result);
      *v22 = v27;
      v22[1] = v28;
      *(_QWORD *)(v18[7] + 8 * result) = v20;
      v23 = v18[2];
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_12;
      ++v14;
      v18[2] = v25;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBC5950);
      swift_arrayDestroy();
      type metadata accessor for CFString(0);
      v26 = (const __CFDictionary *)sub_1CFB01944();
      swift_release();
      SecItemDelete(v26);

      v8 = v29;
      if (v14 == 5)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t DIPKeystoreKeychain.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DIPKeystoreKeychain.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1CFAEC44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(**(_QWORD **)v7 + 120)
                                                                                              + *(_QWORD *)(**(_QWORD **)v7 + 120));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_1CF92F754;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1CFAEC500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t *a5@<X8>)
{
  unsigned __int8 v6;

  v6 = *a4;
  return sub_1CFAEB780(a1, a2, a3, &v6, 0, a5);
}

void IdentityKeyWithKeychain.init(label:privateKey:attestationType:laContext:validity:isTemporary:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
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
  CFDictionaryRef v72;
  CFDictionaryRef v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  void *v79;
  void *Constraints;
  id v81;
  id v82;
  _QWORD *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  _QWORD *v97;
  uint64_t v98;
  char v99;
  char v100;
  uint64_t v101;
  id v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  SecKeyRef v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  __int128 aBlock;
  __int128 v124;
  __int128 v125;
  __int128 v126;

  v9 = v8;
  v119 = a8;
  v116 = a7;
  v117 = a6;
  v121 = a5;
  v108 = sub_1CFB01368();
  v107 = *(_QWORD *)(v108 - 8);
  MEMORY[0x1E0C80A78](v108, v14, v15, v16, v17, v18, v19, v20);
  v106 = (char *)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_1CFB01398();
  v104 = *(_QWORD *)(v105 - 8);
  MEMORY[0x1E0C80A78](v105, v22, v23, v24, v25, v26, v27, v28);
  v103 = (char *)&v101 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_1CFB01344();
  v111 = *(_QWORD *)(v113 - 8);
  v37 = MEMORY[0x1E0C80A78](v113, v30, v31, v32, v33, v34, v35, v36);
  v109 = (char *)&v101 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v37, v39, v40, v41, v42, v43, v44, v45);
  v110 = (char *)&v101 - v46;
  v120 = sub_1CFB013BC();
  v112 = *(_QWORD *)(v120 - 8);
  v54 = MEMORY[0x1E0C80A78](v120, v47, v48, v49, v50, v51, v52, v53);
  MEMORY[0x1E0C80A78](v54, v55, v56, v57, v58, v59, v60, v61);
  v114 = (char *)&v101 - v62;
  v63 = sub_1CFB0207C();
  v115 = *(_QWORD *)(v63 - 8);
  MEMORY[0x1E0C80A78](v63, v64, v65, v66, v67, v68, v69, v70);
  v71 = *a4;
  *(_OWORD *)(v9 + 56) = xmmword_1CFB05A20;
  *(_BYTE *)(v9 + 72) = 0;
  *(_WORD *)(v9 + 74) = 0;
  *(_BYTE *)(v9 + 76) = 0;
  *(_BYTE *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  *(_QWORD *)(v9 + 32) = a3;
  v118 = a3;
  v72 = SecKeyCopyAttributes(v118);
  if (!v72)
  {
    *(_QWORD *)(v9 + 40) = 0;
    v75 = (uint64_t *)(v9 + 40);
    v76 = v121;
    goto LABEL_11;
  }
  v73 = v72;
  *(_QWORD *)&aBlock = 0;
  sub_1CFB01950();

  v74 = aBlock;
  *(_QWORD *)(v9 + 40) = aBlock;
  v75 = (uint64_t *)(v9 + 40);
  v76 = v121;
  if (!v74 || !*(_QWORD *)(v74 + 16) || (v77 = sub_1CFA922E4(1667457889, 0xE400000000000000), (v78 & 1) == 0))
  {
LABEL_11:
    v86 = *v75;
    if (*v75)
    {
      v87 = sub_1CFB01A28();
      if (*(_QWORD *)(v86 + 16) && (v89 = sub_1CFA922E4(v87, v88), (v90 & 1) != 0))
      {
        sub_1CF94BBF0(*(_QWORD *)(v86 + 56) + 32 * v89, (uint64_t)&aBlock);
      }
      else
      {
        aBlock = 0u;
        v124 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v124 + 1))
      {
        v91 = swift_dynamicCast();
        if (v91)
          v92 = v125;
        else
          v92 = 0;
        if (v91)
          v93 = *((_QWORD *)&v125 + 1);
        else
          v93 = 0;
LABEL_25:
        if (*MEMORY[0x1E0CD6BA8])
        {
          v94 = sub_1CFB01A28();
          if (v93)
          {
            if (v92 == v94 && v93 == v95)
              v96 = 1;
            else
              v96 = sub_1CFB028B0();
            swift_bridgeObjectRelease();
          }
          else
          {
            v96 = 0;
          }
          swift_bridgeObjectRelease();
          *(_BYTE *)(v9 + 75) = v96 & 1;
          *(_QWORD *)(v9 + 48) = v76;
          *(_BYTE *)(v9 + 73) = v119 & 1;
          __asm { BR              X9 }
        }
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x1CFAECF94);
      }
    }
    else
    {
      aBlock = 0u;
      v124 = 0u;
    }
    sub_1CF931B1C((uint64_t)&aBlock, (uint64_t *)&unk_1ED904DA0);
    v92 = 0;
    v93 = 0;
    goto LABEL_25;
  }
  sub_1CF94BBF0(*(_QWORD *)(v74 + 56) + 32 * v77, (uint64_t)&v125);
  sub_1CF923FD8(&v125, &aBlock);
  sub_1CF94BBF0((uint64_t)&aBlock, (uint64_t)&v125);
  type metadata accessor for SecAccessControl(0);
  swift_dynamicCast();
  v79 = v122;
  Constraints = (void *)SecAccessControlGetConstraints();
  if (!Constraints)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);

    goto LABEL_11;
  }
  v102 = v79;
  v81 = Constraints;
  v122 = 0;
  v82 = v81;
  sub_1CFB01950();

  v83 = v122;
  if (v122)
  {
    if (v122[2] && (v84 = sub_1CFA922E4(1852273519, 0xE400000000000000), (v85 & 1) != 0))
    {
      sub_1CF94BBF0(v83[7] + 32 * v84, (uint64_t)&v125);
    }
    else
    {
      v125 = 0u;
      v126 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v126 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC0100);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v97 = v122;
        if (v122[2] && (v98 = sub_1CFA922E4(1953525616, 0xE400000000000000), (v99 & 1) != 0))
        {
          sub_1CF94BBF0(v97[7] + 32 * v98, (uint64_t)&v125);
        }
        else
        {
          v125 = 0u;
          v126 = 0u;
        }

        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
        if (*((_QWORD *)&v126 + 1))
        {
          if (swift_dynamicCast())
          {
            v100 = (char)v122;
LABEL_51:
            *(_BYTE *)(v9 + 74) = v100;
            goto LABEL_11;
          }
        }
        else
        {
          sub_1CF931B1C((uint64_t)&v125, (uint64_t *)&unk_1ED904DA0);
        }
        v100 = 0;
        goto LABEL_51;
      }

LABEL_44:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      goto LABEL_11;
    }
  }
  else
  {
    v125 = 0u;
    v126 = 0u;
  }

  sub_1CF931B1C((uint64_t)&v125, (uint64_t *)&unk_1ED904DA0);
  goto LABEL_44;
}

uint64_t sub_1CFAECFA4()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + 76) = 1;
    return swift_release();
  }
  return result;
}

uint64_t sub_1CFAECFF4()
{
  sub_1CFB01368();
  sub_1CF920A48((unint64_t *)&qword_1ED9054B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9054B8);
  sub_1CF931BE4((unint64_t *)&qword_1ED9054C0, &qword_1ED9054B8, MEMORY[0x1E0DEAF38]);
  return sub_1CFB02310();
}

uint64_t IdentityKeyWithKeychain.deinit()
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1CFB01368();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CFB01398();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15, v16, v17, v18, v19, v20, v21);
  v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v0 + 73) == 1)
  {
    v38 = v13;
    v39 = v2;
    v25 = *(_QWORD *)(v0 + 16);
    v24 = *(_QWORD *)(v0 + 24);
    v26 = sub_1CFB01A28();
    v28 = v27;
    swift_bridgeObjectRetain();
    sub_1CFAEFA38(v25, v24, 0, 0xF000000000000000, v26, v28);
    v29 = v3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)(v1 + 16);
    v30 = *(_QWORD *)(v1 + 24);
    v32 = sub_1CFB01A28();
    v34 = v33;
    swift_bridgeObjectRetain();
    sub_1CFAEFA38(v31, v30, 0, 0xF000000000000000, v32, v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = v29;
    v13 = v38;
    v2 = v39;
  }
  if (*(_BYTE *)(v1 + 88) == 1)
  {
    if (*(_QWORD *)(v1 + 80))
    {
      swift_getObjectType();
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CFA1D3E8;
      aBlock[3] = &block_descriptor_9_0;
      v35 = _Block_copy(aBlock);
      sub_1CFB01380();
      sub_1CFAECFF4();
      sub_1CFB02094();
      _Block_release(v35);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v13);
      if (*(_QWORD *)(v1 + 80))
      {
        swift_getObjectType();
        sub_1CFB020A0();
      }
    }
    *(_BYTE *)(v1 + 88) = 0;
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1CF931AB0(*(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
  swift_unknownObjectRelease();
  return v1;
}

uint64_t IdentityKeyWithKeychain.__deallocating_deinit()
{
  IdentityKeyWithKeychain.deinit();
  return swift_deallocClassInstance();
}

id sub_1CFAED358()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

SecKeyRef sub_1CFAED380()
{
  uint64_t v0;
  SecKeyRef v1;
  unint64_t v2;
  uint64_t v3;
  __int16 v5;

  v1 = SecKeyCopyPublicKey(*(SecKeyRef *)(v0 + 32));
  if (!v1)
  {
    v5 = 242;
    v2 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB34BF0, &v5, 0, v2, 0xD00000000000005ALL, 0x80000001CFB34890, v3, 0xD000000000000016, 0x80000001CFB34C20, 541);
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_1CFAED46C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __SecKey *v4;
  __SecKey *v5;
  CFDataRef v6;
  CFDataRef v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int16 v15;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = v2;
  if (v1 >> 60 != 15)
    goto LABEL_10;
  error[0] = 0;
  v4 = SecKeyCopyPublicKey(*(SecKeyRef *)(v0 + 32));
  if (v4)
  {
    v5 = v4;
    v6 = SecKeyCopyExternalRepresentation(v4, error);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1CFB00E7C();
      v3 = v9;

    }
    else
    {
      v8 = 0;
      v3 = 0xF000000000000000;
    }
    v12 = *(_QWORD *)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 56) = v8;
    *(_QWORD *)(v0 + 64) = v3;
    sub_1CF931AB0(v12, v13);
    if (*(_QWORD *)(v0 + 64) >> 60 == 15)
    {
      v15 = 242;
      errorFromCFError(_:_:_:)(error[0], 0xD000000000000041, 0x80000001CFB34C60, &v15);
      swift_willThrow();

      return v3;
    }
    v3 = *(_QWORD *)(v0 + 56);
    sub_1CF92F5C8(v3, *(_QWORD *)(v0 + 64));

LABEL_10:
    sub_1CF92F5C8(v2, v1);
    return v3;
  }
  v15 = 242;
  v10 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB34BF0, &v15, 0, v10, 0xD00000000000005ALL, 0x80000001CFB34890, v11, 0xD00000000000001ALL, 0x80000001CFB34C40, 561);
  swift_willThrow();
  return v3;
}

uint64_t sub_1CFAED664(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  __int16 v14;

  v6 = (id *)MEMORY[0x1E0CD6DF8];
  if (!*(_BYTE *)(v2 + 75))
    v6 = (id *)MEMORY[0x1E0CD6DB0];
  v7 = *v6;
  SecKeyRef.signSHA256Digest(_:algorithm:)(a1, a2);
  v9 = v8;

  if (v3)
  {
    v14 = 0;
    v10 = v3;
    v11 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v3, 0, 0xE000000000000000, &v14, 0, v11, 0xD00000000000005ALL, 0x80000001CFB34890, v12, 0x293A5F286E676973, 0xE800000000000000, 584);
    swift_willThrow();

  }
  return v9;
}

uint64_t sub_1CFAED7B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v5 = sub_1CFB01A28();
  v7 = v6;
  swift_bridgeObjectRetain();
  sub_1CFAEFA38(v4, v3, 0, 0xF000000000000000, v5, v7);
  if (v2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(v0 + 73) == 1)
    {
      v10 = *(_QWORD *)(v0 + 16);
      v9 = *(_QWORD *)(v0 + 24);
      v11 = sub_1CFB01A28();
      v13 = v12;
      swift_bridgeObjectRetain();
      sub_1CFAEFA38(v10, v9, 0, 0xF000000000000000, v11, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v14 = sub_1CFAED920();
    v16 = v15;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v14;
    *(_QWORD *)(v0 + 24) = v16;
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)(v0 + 24);
    v17 = *(void **)(v0 + 32);
    v19 = *(_QWORD *)(v0 + 16);
    swift_bridgeObjectRetain();
    sub_1CFAF0010(v17, v19, v18);
    result = swift_bridgeObjectRelease();
    *(_WORD *)(v0 + 72) = 2;
  }
  return result;
}

uint64_t sub_1CFAED920()
{
  uint64_t v0;

  sub_1CF9B9CD8();
  sub_1CFB021F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBC5CB0);
  sub_1CF931BE4((unint64_t *)&unk_1EFBC5CB8, &qword_1EFBC5CB0, MEMORY[0x1E0DEBF68]);
  v0 = sub_1CFB019BC();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_1CFAEDA00(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 72);
}

uint64_t sub_1CFAEDA0C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t sub_1CFAEDA14()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = v0;
  return swift_task_switch();
}

uint64_t sub_1CFAEDA2C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v5;
  uint64_t v6;
  __int16 v7[5];

  v1 = *(void **)(*(_QWORD *)(v0 + 136) + 48);
  *(_QWORD *)(v0 + 144) = v1;
  if (v1)
  {
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1CFAEDBA8;
    v2 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v3 = (_QWORD *)(v0 + 80);
    v3[1] = 0x40000000;
    v3[2] = sub_1CFAEDD54;
    v3[3] = &block_descriptor_10;
    v3[4] = v2;
    objc_msgSend(v1, sel_authMethodWithReply_, v3);
    return swift_continuation_await();
  }
  else
  {
    v7[0] = 105;
    v5 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000028, 0x80000001CFB34CB0, v7, 0, v5, 0xD00000000000005ALL, 0x80000001CFB34890, v6, 0x6874654D68747561, 0xEC0000002928646FLL, 634);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CFAEDBA8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CFAEDC08()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
}

uint64_t sub_1CFAEDC40()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  __int16 v7[5];

  v2 = *(void **)(v0 + 144);
  v1 = *(void **)(v0 + 152);
  swift_willThrow();
  v7[0] = 249;
  v3 = v1;
  v4 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(v1, 0xD000000000000032, 0x80000001CFB34D00, v7, 0, v4, 0xD00000000000005ALL, 0x80000001CFB34890, v5, 0x6874654D68747561, 0xEC0000002928646FLL, 639);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CFAEDD54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED904E60);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
    {
      v8 = a2;
      v9 = sub_1CFB00E7C();
      v11 = v10;

    }
    else
    {
      v9 = 0;
      v11 = 0xF000000000000000;
    }
    v12[0] = v9;
    v12[1] = v11;
    sub_1CF931BA0((uint64_t)v12, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_1EFBBE6B8);
    return swift_continuation_throwingResume();
  }
}

void sub_1CFAEDE24()
{
  sub_1CFAEF0CC();
}

void sub_1CFAEDE38(char *a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;

  if (*(_BYTE *)(v1 + 74))
    v2 = 1;
  else
    v2 = 2;
  if (*(_BYTE *)(v1 + 75))
    v3 = v2;
  else
    v3 = *(_BYTE *)(v1 + 74);
  *a1 = v3;
}

id sub_1CFAEDE5C()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 32);
}

SecKeyRef sub_1CFAEDE88()
{
  return sub_1CFAED380();
}

uint64_t sub_1CFAEDEA8()
{
  return sub_1CFAED46C();
}

uint64_t sub_1CFAEDEC8(uint64_t a1, uint64_t a2)
{
  return sub_1CFAED664(a1, a2);
}

void sub_1CFAEDEE8()
{
  sub_1CFAEF0CC();
}

void sub_1CFAEDF08(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)v1 + 72);
}

uint64_t sub_1CFAEDF18()
{
  return sub_1CFAED7B0();
}

uint64_t sub_1CFAEDF38()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 74);
}

uint64_t sub_1CFAEDF44()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CF9A0420;
  v3[17] = v2;
  return swift_task_switch();
}

void sub_1CFAEDFA4(char *a1@<X8>)
{
  sub_1CFAEDE38(a1);
}

uint64_t copyPublicKeyDataFromCertificateString(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __SecCertificate *v3;
  uint64_t v4;
  __SecCertificate *v5;
  __SecKey *v6;
  __SecKey *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int16 v12;

  v3 = createCertificateFromString(_:)(*(Swift::String *)&a1);
  if (!v4)
  {
    v5 = v3;
    v6 = SecCertificateCopyKey(v3);
    if (v6 && (v7 = v6, v2 = copyPublicKeyDataFromSecKeyPublic(_:)(v6), v9 = v8, v7, v9 >> 60 != 15))
    {

    }
    else
    {
      v12 = 0;
      v2 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB34D40, &v12, 0, v2, 0xD00000000000005ALL, 0x80000001CFB34890, v10, 0xD00000000000002ALL, 0x80000001CFB34D70, 735);
      swift_willThrow();

    }
  }
  return v2;
}

SecCertificateRef __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> createCertificateFromString(_:)(Swift::String a1)
{
  __SecCertificate *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const __CFAllocator *v8;
  const __CFData *v9;
  uint64_t v10;
  __int16 v12;
  __int16 v13;

  v2 = sub_1CFB00E28();
  if (v3 >> 60 == 15)
  {
    v13 = 119;
    v4 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000023, 0x80000001CFB34DA0, &v13, 0, v4, 0xD00000000000005ALL, 0x80000001CFB34890, v5, 0xD00000000000001FLL, 0x80000001CFB34DD0, 742);
    swift_willThrow();
  }
  else
  {
    v6 = v2;
    v7 = v3;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = (const __CFData *)sub_1CFB00E58();
    v1 = SecCertificateCreateWithData(v8, v9);

    if (v1)
    {
      sub_1CF931AB0(v6, v7);
    }
    else
    {
      v12 = 121;
      v1 = (__SecCertificate *)sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000027, 0x80000001CFB34DF0, &v12, 0, (uint64_t)v1, 0xD00000000000005ALL, 0x80000001CFB34890, v10, 0xD00000000000001FLL, 0x80000001CFB34DD0, 745);
      swift_willThrow();
      sub_1CF931AB0(v6, v7);
    }
  }
  return v1;
}

uint64_t copyPublicKeyDataFromSecKeyPublic(_:)(__SecKey *a1)
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
  char *v12;
  CFDataRef v13;
  CFDataRef v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int16 v21[12];
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)&v21[-4] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  error[0] = 0;
  v13 = SecKeyCopyExternalRepresentation(a1, error);
  if (v13)
  {
    v14 = v13;
    v15 = sub_1CFB00E7C();

  }
  else
  {
    v21[0] = 0;
    errorFromCFError(_:_:_:)(error[0], 0xD00000000000002DLL, 0x80000001CFB34E20, v21);
    v17 = v16;
    if (qword_1ED9054E8 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v18, v2);
    DIPLogError(_:message:log:)(v17, 0, 0xE000000000000000);
    _s13CoreIDVShared9AnalyticsC9sendErroryys0E0_pFZ_0(v17);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    return 0;
  }
  return v15;
}

uint64_t sub_1CFAEE474(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned __int8 *a5)
{
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
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[2];

  v10 = sub_1CFB00F9C();
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v18 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v18 = a1 & 0xFFFFFFFFFFFFLL;
  if (v18)
  {
    v19 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v19 = a3 & 0xFFFFFFFFFFFFLL;
    if (v19)
    {
      v20 = *a5;
      v24[0] = a1;
      v24[1] = a2;
      swift_bridgeObjectRetain();
      sub_1CFB01B30();
      sub_1CFB01B30();
      __asm { BR              X9 }
    }
  }
  LOWORD(v24[0]) = 105;
  v21 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
  sub_1CF923828();
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD000000000000041, 0x80000001CFB35180, (__int16 *)v24, 0, v21, 0xD00000000000005ALL, 0x80000001CFB34890, v22, 0xD000000000000024, 0x80000001CFB351D0, 179);
  return swift_willThrow();
}

void sub_1CFAEE6BC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, CFTypeRef *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  OSStatus v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  CFStringRef v34;
  __CFString *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v10 = sub_1CFB012CC();
  v51 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17);
  v50 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB0DD90;
  *(_QWORD *)(inited + 32) = sub_1CFB01A28();
  *(_QWORD *)(inited + 40) = v20;
  v21 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  v52 = a1;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 80) = sub_1CFB01A28();
  *(_QWORD *)(inited + 88) = v22;
  *(_QWORD *)(inited + 120) = v21;
  *(_QWORD *)(inited + 96) = a3;
  *(_QWORD *)(inited + 104) = a4;
  *(_QWORD *)(inited + 128) = sub_1CFB01A28();
  *(_QWORD *)(inited + 136) = v23;
  *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 144) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1CF9226B8(inited);
  v24 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v25 = SecItemCopyMatching(v24, a5);

  if (v25 != -25300 && v25)
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v26 = v10;
    v27 = __swift_project_value_buffer(v10, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v28 = v51;
    v29 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v27, v26);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v30 = sub_1CFB012B4();
    v31 = sub_1CFB01FD4();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v46 = v31;
      v48 = v30;
      v32 = a3;
      v33 = swift_slowAlloc();
      v47 = swift_slowAlloc();
      v53 = v47;
      *(_DWORD *)v33 = 136315650;
      swift_bridgeObjectRetain();
      v55 = sub_1CF9C974C(v52, a2, &v53);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2082;
      swift_bridgeObjectRetain();
      v49 = v32;
      v55 = sub_1CF9C974C(v32, a4, &v53);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2082;
      v34 = SecCopyErrorMessageString(v25, 0);
      if (v34)
      {
        v35 = (__CFString *)v34;
        v36 = sub_1CFB01A28();
        v38 = v37;

      }
      else
      {
        v36 = 0;
        v38 = 0xE000000000000000;
      }
      v55 = sub_1CF9C974C(v36, v38, &v53);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();
      v39 = v48;
      _os_log_impl(&dword_1CF917000, v48, (os_log_type_t)v46, "coreidvd: failed to query the key chain item: label = %s, class = %{public}s, error = %{public}s", (uint8_t *)v33, 0x20u);
      v40 = v47;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v40, -1, -1);
      MEMORY[0x1D17DA6E4](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v26);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v26);
    }
    v53 = 0;
    v54 = 0xE000000000000000;
    sub_1CFB02388();
    sub_1CFB01B30();
    sub_1CFB01B30();
    sub_1CFB01B30();
    sub_1CFB01B30();
    v41 = v53;
    v42 = v54;
    LOWORD(v53) = 235;
    v43 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
    sub_1CF923828();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v41, v42, (__int16 *)&v53, 0, v43, 0xD00000000000005ALL, 0x80000001CFB34890, v44, 0xD000000000000027, 0x80000001CFB35420, 319);
    swift_willThrow();
  }
}

CFDataRef _s13CoreIDVShared19DIPKeystoreKeychainC20getIssuerCertificateySo03SecG3RefaSgAFFZ_0(__SecCertificate *a1)
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
  char *v12;
  CFDataRef result;
  CFDataRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  id v30;
  const __CFDictionary *v31;
  OSStatus v32;
  const void *v33;
  CFTypeID v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  CFStringRef v42;
  __CFString *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54[4];
  CFTypeRef v55[31];

  v55[29] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v2 = sub_1CFB012CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4, v5, v6, v7, v8, v9, v10);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = SecCertificateCopyNormalizedIssuerSequence(a1);
  if (result)
  {
    v14 = result;
    v52 = v12;
    v15 = sub_1CFB00E7C();
    sub_1CFAA34C8(2, v15, v16);
    v17 = v54[1];
    v18 = v54[2];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CFB0DDA0;
    *(_QWORD *)(inited + 32) = sub_1CFB01A28();
    *(_QWORD *)(inited + 40) = v20;
    *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEAFA0];
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = sub_1CFB01A28();
    *(_QWORD *)(inited + 88) = v21;
    v22 = (void *)*MEMORY[0x1E0CD6F40];
    type metadata accessor for CFString(0);
    v24 = v23;
    *(_QWORD *)(inited + 120) = v23;
    *(_QWORD *)(inited + 96) = v22;
    *(_QWORD *)(inited + 128) = sub_1CFB01A28();
    *(_QWORD *)(inited + 136) = v25;
    v26 = (void *)*MEMORY[0x1E0CD6CA0];
    *(_QWORD *)(inited + 168) = v24;
    *(_QWORD *)(inited + 144) = v26;
    *(_QWORD *)(inited + 176) = sub_1CFB01A28();
    *(_QWORD *)(inited + 184) = v27;
    *(_QWORD *)(inited + 216) = MEMORY[0x1E0CB0338];
    *(_QWORD *)(inited + 192) = v17;
    *(_QWORD *)(inited + 200) = v18;
    v28 = v22;
    v29 = v18;
    v30 = v26;
    v51 = v17;
    sub_1CF9239E0(v17, v18);
    sub_1CF9226B8(inited);
    v55[0] = 0;
    v31 = (const __CFDictionary *)sub_1CFB01944();
    swift_bridgeObjectRelease();
    v32 = SecItemCopyMatching(v31, v55);

    if (!v32 && v55[0])
    {
      v33 = (const void *)swift_unknownObjectRetain();
      v34 = CFGetTypeID(v33);
      if (v34 == SecCertificateGetTypeID())
      {

        sub_1CF923A24(v51, v29);
        swift_unknownObjectRelease();
        type metadata accessor for SecCertificate(0);
        return (CFDataRef)swift_dynamicCastUnknownClassUnconditional();
      }
      swift_unknownObjectRelease();
    }
    if (qword_1ED9054E8 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v36 = v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v52, v35, v2);
    v37 = sub_1CFB012B4();
    v38 = v3;
    v39 = sub_1CFB01FD4();
    if (os_log_type_enabled(v37, v39))
    {
      v48 = v29;
      v49 = v38;
      v50 = v2;
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v54[0] = v41;
      *(_DWORD *)v40 = 136446210;
      v42 = SecCopyErrorMessageString(v32, 0);
      if (v42)
      {
        v43 = (__CFString *)v42;
        v44 = sub_1CFB01A28();
        v46 = v45;

      }
      else
      {
        v44 = 0;
        v46 = 0xE000000000000000;
      }
      v53 = sub_1CF9C974C(v44, v46, v54);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF917000, v37, v39, "coreidvd: failed to query the key chain item with getting issuer certificate:  error = %{public}s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v41, -1, -1);
      MEMORY[0x1D17DA6E4](v40, -1, -1);

      sub_1CF923A24(v51, v48);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v52, v50);
    }
    else
    {

      sub_1CF923A24(v51, v29);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v2);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  return result;
}

void sub_1CFAEF0CC()
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

  v1 = sub_1CFB012CC();
  v9 = MEMORY[0x1E0C80A78](v1, v2, v3, v4, v5, v6, v7, v8);
  v17 = MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  MEMORY[0x1E0C80A78](v17, v18, v19, v20, v21, v22, v23, v24);
  __asm { BR              X11 }
}

_QWORD *sub_1CFAEF19C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const void *v19;
  CFTypeID v20;
  __SecCertificate *v21;
  CFDataRef v22;
  uint64_t v23;
  const __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __SecCertificate *v39;
  CFDataRef v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  id *v50;
  __SecCertificate *v51;
  CFDataRef v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;

  v7 = sub_1CFB028B0();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
    __asm { BR              X11 }
  if (*(_BYTE *)(v0 + 76) == 1)
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v8 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v9 = *(_QWORD *)(v6 - 152);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v9 + 16))(v2, v8, v1);
    v10 = sub_1CFB012B4();
    v11 = sub_1CFB01FC8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1CF917000, v10, v11, "SE/SEP attestation is about to expire; returning no attestations",
        v12,
        2u);
      MEMORY[0x1D17DA6E4](v12, -1, -1);
    }

    (*(void (**)(uint64_t, _QWORD *))(v9 + 8))(v2, v1);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v14 = *(_QWORD *)(v0 + 16);
  v13 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v6 - 96) = 0;
  *(_QWORD *)(v6 - 136) = MEMORY[0x1E0DEE9D8];
  v15 = sub_1CFB01A28();
  v17 = v16;
  swift_bridgeObjectRetain();
  sub_1CFAEE6BC(v14, v13, v15, v17, (CFTypeRef *)(v6 - 96));
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return v1;
  }
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v6 - 96);
  if (!v18)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    if (qword_1ED9054E8 != -1)
      swift_once();
    v25 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v26 = *(_QWORD *)(v6 - 152);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v26 + 16))(v4, v25, v1);
    swift_bridgeObjectRetain();
    v27 = sub_1CFB012B4();
    v28 = sub_1CFB01FD4();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      *(_QWORD *)(v6 - 128) = v30;
      *(_QWORD *)(v6 - 168) = 0;
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)(v6 - 160) = v29 + 4;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v6 - 144) = sub_1CF9C974C(v14, v13, (uint64_t *)(v6 - 128));
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF917000, v27, v28, "coreidvd: no certificate was found for label %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v30, -1, -1);
      MEMORY[0x1D17DA6E4](v29, -1, -1);

      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(v6 - 152) + 8))(v4, v1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, _QWORD *))(v26 + 8))(v4, v1);
    }
    swift_unknownObjectRelease();
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v19 = (const void *)swift_unknownObjectRetain();
  v20 = CFGetTypeID(v19);
  if (v20 != SecCertificateGetTypeID())
  {
    swift_unknownObjectRelease();
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  type metadata accessor for SecCertificate(0);
  swift_unknownObjectRetain();
  v21 = (__SecCertificate *)(id)swift_dynamicCastUnknownClassUnconditional();
  MEMORY[0x1D17D89E0]();
  if (*(_QWORD *)((*(_QWORD *)(v6 - 136) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v6 - 136) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_1CFB01CE0();
  sub_1CFB01D10();
  sub_1CFB01CBC();
  *(_QWORD *)(v6 - 184) = v21;
  v22 = _s13CoreIDVShared19DIPKeystoreKeychainC20getIssuerCertificateySo03SecG3RefaSgAFFZ_0(v21);
  v23 = *(_QWORD *)(v6 - 152);
  *(_QWORD *)(v6 - 176) = v18;
  *(_QWORD *)(v6 - 192) = v22;
  if (!v22)
  {
    if (qword_1ED9054E8 == -1)
      goto LABEL_30;
    goto LABEL_55;
  }
  v24 = v22;
  MEMORY[0x1D17D89E0]();
  v1 = *(_QWORD **)((*(_QWORD *)(v6 - 136) & 0xFFFFFFFFFFFFFF8) + 0x10);
  if ((unint64_t)v1 >= *(_QWORD *)((*(_QWORD *)(v6 - 136) & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CFB01CE0();
  sub_1CFB01D10();
  sub_1CFB01CBC();
  while (1)
  {
    v36 = *(_QWORD *)(v6 - 136);
    *(_QWORD *)(v6 - 168) = 0;
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      v37 = sub_1CFB02604();
      *(_QWORD *)(v6 - 160) = v36;
      if (!v37)
      {
LABEL_52:
        v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        goto LABEL_53;
      }
    }
    else
    {
      v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v6 - 160) = v36;
      if (!v37)
        goto LABEL_52;
    }
    if (v37 >= 1)
      break;
    __break(1u);
LABEL_55:
    swift_once();
LABEL_30:
    v32 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v23 + 16))(v3, v32, v1);
    v33 = sub_1CFB012B4();
    v34 = sub_1CFB01FBC();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1CF917000, v33, v34, "coreidvd: no certificate was found for intermediate certificate", v35, 2u);
      MEMORY[0x1D17DA6E4](v35, -1, -1);
    }

    (*(void (**)(uint64_t, _QWORD *))(v23 + 8))(v3, v1);
  }
  if ((v36 & 0xC000000000000001) != 0)
  {
    v38 = 0;
    v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v6 - 152) = v37;
    do
    {
      v39 = (__SecCertificate *)MEMORY[0x1D17D9124](v38, *(_QWORD *)(v6 - 160));
      v40 = SecCertificateCopyData(v39);
      v41 = sub_1CFB00E7C();
      v43 = v42;

      v44 = sub_1CFB00E64();
      v46 = v45;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = sub_1CF955C18(0, v1[2] + 1, 1, v1);
      v48 = v1[2];
      v47 = v1[3];
      if (v48 >= v47 >> 1)
        v1 = sub_1CF955C18((_QWORD *)(v47 > 1), v48 + 1, 1, v1);
      ++v38;
      v1[2] = v48 + 1;
      v49 = &v1[2 * v48];
      v49[4] = v44;
      v49[5] = v46;
      swift_unknownObjectRelease();
      sub_1CF923A24(v41, v43);
    }
    while (*(_QWORD *)(v6 - 152) != v38);
  }
  else
  {
    v50 = (id *)(v36 + 32);
    v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      *(_QWORD *)(v6 - 152) = v37;
      v51 = (__SecCertificate *)*v50;
      v52 = SecCertificateCopyData(v51);
      v53 = sub_1CFB00E7C();
      v55 = v54;

      v56 = sub_1CFB00E64();
      v58 = v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = sub_1CF955C18(0, v1[2] + 1, 1, v1);
      v60 = v1[2];
      v59 = v1[3];
      if (v60 >= v59 >> 1)
        v1 = sub_1CF955C18((_QWORD *)(v59 > 1), v60 + 1, 1, v1);
      v1[2] = v60 + 1;
      v61 = &v1[2 * v60];
      v61[4] = v56;
      v61[5] = v58;

      sub_1CF923A24(v53, v55);
      ++v50;
      v37 = *(_QWORD *)(v6 - 152) - 1;
    }
    while (*(_QWORD *)(v6 - 152) != 1);
  }
LABEL_53:
  swift_bridgeObjectRelease_n();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

void sub_1CFAEFA38(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
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
  unint64_t v32;
  int v33;
  __int128 v34;
  uint64_t inited;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint8_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFDictionary *v48;
  OSStatus v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  CFStringRef v55;
  __CFString *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD v60[2];
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;

  v79 = a5;
  v61 = a3;
  v10 = sub_1CFB012CC();
  v11 = *(_QWORD *)(v10 - 8);
  v19 = MEMORY[0x1E0C80A78](v10, v12, v13, v14, v15, v16, v17, v18);
  v21 = (char *)v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v19, v22, v23, v24, v25, v26, v27, v28);
  v69 = (char *)v60 - v30;
  if (a2)
    v31 = a1;
  else
    v31 = 0;
  v65 = v31;
  v32 = 0xE000000000000000;
  if (a2)
    v32 = a2;
  v64 = v32;
  v33 = 1;
  v74 = *MEMORY[0x1E0CD6A90];
  v75 = a1;
  v77 = *MEMORY[0x1E0CD6C98];
  v60[1] = *MEMORY[0x1E0CD6B48];
  v62 = a4;
  v68 = a4 >> 60;
  *((_QWORD *)&v34 + 1) = 4;
  v76 = xmmword_1CFB059A0;
  v78 = MEMORY[0x1E0DEE9B8] + 8;
  *(_QWORD *)&v34 = 136315650;
  v63 = v34;
  v66 = a2;
  v67 = a6;
  v71 = v11;
  v72 = v29;
  v70 = v21;
  while (1)
  {
    v80 = v33;
    sub_1CF9226B8(MEMORY[0x1E0DEE9D8]);
    if (a2)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v76;
      *(_QWORD *)(inited + 32) = sub_1CFB01A28();
      *(_QWORD *)(inited + 40) = v36;
      v37 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(inited + 48) = v75;
      *(_QWORD *)(inited + 56) = a2;
      *(_QWORD *)(inited + 80) = sub_1CFB01A28();
      *(_QWORD *)(inited + 88) = v38;
LABEL_18:
      *(_QWORD *)(inited + 120) = v37;
      *(_QWORD *)(inited + 96) = v79;
      *(_QWORD *)(inited + 104) = a6;
      swift_bridgeObjectRetain();
      sub_1CF9226B8(inited);
      goto LABEL_19;
    }
    if (v68 <= 0xE)
    {
      v45 = v61;
      v44 = v62;
      sub_1CF9239E0(v61, v62);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v76;
      *(_QWORD *)(inited + 32) = sub_1CFB01A28();
      *(_QWORD *)(inited + 40) = v46;
      *(_QWORD *)(inited + 72) = MEMORY[0x1E0CB0338];
      *(_QWORD *)(inited + 48) = v45;
      *(_QWORD *)(inited + 56) = v44;
      v21 = v70;
      v11 = v71;
      v10 = v72;
      *(_QWORD *)(inited + 80) = sub_1CFB01A28();
      *(_QWORD *)(inited + 88) = v47;
      v37 = MEMORY[0x1E0DEA968];
      goto LABEL_18;
    }
    if (qword_1ED9054E8 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v10, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v69, v39, v10);
    v40 = sub_1CFB012B4();
    v41 = sub_1CFB01FD4();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_1CF917000, v40, v41, "failed to delete key chain item: either label or serialNumber should be non-empty. ignore and continue.", v42, 2u);
      v43 = v42;
      a6 = v67;
      MEMORY[0x1D17DA6E4](v43, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v69, v10);
LABEL_19:
    v48 = (const __CFDictionary *)sub_1CFB01944();
    swift_bridgeObjectRelease();
    v49 = SecItemDelete(v48);

    v33 = 0;
    if (v49)
    {
      if (v49 == -25300)
        break;
      if (qword_1ED9054E8 != -1)
        swift_once();
      v50 = __swift_project_value_buffer(v10, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v21, v50, v10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v51 = sub_1CFB012B4();
      v52 = sub_1CFB01FD4();
      if (os_log_type_enabled(v51, (os_log_type_t)v52))
      {
        v73 = v52;
        v53 = swift_slowAlloc();
        v54 = swift_slowAlloc();
        v81 = v54;
        *(_DWORD *)v53 = v63;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v53 + 4) = sub_1CF9C974C(v65, v64, &v81);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2082;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v53 + 14) = sub_1CF9C974C(v79, a6, &v81);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v53 + 22) = 2082;
        v55 = SecCopyErrorMessageString(v49, 0);
        if (v55)
        {
          v56 = (__CFString *)v55;
          v57 = sub_1CFB01A28();
          v59 = v58;

        }
        else
        {
          v57 = 0;
          v59 = 0xE000000000000000;
        }
        a6 = v67;
        *(_QWORD *)(v53 + 24) = sub_1CF9C974C(v57, v59, &v81);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CF917000, v51, (os_log_type_t)v73, "failed to delete the key chain item: label = %s, class = %{public}s, error = %{public}s", (uint8_t *)v53, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v54, -1, -1);
        MEMORY[0x1D17DA6E4](v53, -1, -1);

        v21 = v70;
        v11 = v71;
        v10 = v72;
        (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v72);
        a2 = v66;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v10);
      }
      v33 = 0;
      if ((v80 & 1) != 0)
        break;
    }
  }
}

void sub_1CFAF0010(void *a1, uint64_t a2, unint64_t a3)
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
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  const __CFDictionary *v27;
  OSStatus v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  CFStringRef v36;
  __CFString *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v6 = sub_1CFB012CC();
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13);
  v50 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB0DDA0;
  *(_QWORD *)(inited + 32) = sub_1CFB01A28();
  *(_QWORD *)(inited + 40) = v16;
  type metadata accessor for SecKey(0);
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 80) = sub_1CFB01A28();
  *(_QWORD *)(inited + 88) = v18;
  *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 96) = a2;
  *(_QWORD *)(inited + 104) = a3;
  *(_QWORD *)(inited + 128) = sub_1CFB01A28();
  *(_QWORD *)(inited + 136) = v19;
  v20 = (void *)*MEMORY[0x1E0CD6CC0];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 168) = v21;
  *(_QWORD *)(inited + 144) = v20;
  *(_QWORD *)(inited + 176) = sub_1CFB01A28();
  *(_QWORD *)(inited + 184) = v22;
  v23 = (void *)*MEMORY[0x1E0CD68D0];
  *(_QWORD *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903958);
  *(_QWORD *)(inited + 192) = v23;
  v24 = v23;
  v25 = a1;
  swift_bridgeObjectRetain();
  v26 = v20;
  sub_1CF9226B8(inited);
  v27 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v28 = SecItemAdd(v27, 0);

  if (v28)
  {
    if (qword_1ED9054E8 != -1)
      swift_once();
    v29 = v52;
    v30 = __swift_project_value_buffer(v52, (uint64_t)qword_1ED907590);
    swift_beginAccess();
    v32 = v50;
    v31 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v30, v29);
    swift_bridgeObjectRetain_n();
    v33 = sub_1CFB012B4();
    v34 = sub_1CFB01FD4();
    if (os_log_type_enabled(v33, (os_log_type_t)v34))
    {
      v48 = v34;
      v35 = swift_slowAlloc();
      v47 = swift_slowAlloc();
      v53 = v47;
      *(_DWORD *)v35 = 136315394;
      swift_bridgeObjectRetain();
      v49 = a2;
      v55 = sub_1CF9C974C(a2, a3, &v53);
      sub_1CFB021C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2082;
      v36 = SecCopyErrorMessageString(v28, 0);
      if (v36)
      {
        v37 = (__CFString *)v36;
        v38 = sub_1CFB01A28();
        v40 = v39;

      }
      else
      {
        v38 = 0;
        v40 = 0xE000000000000000;
      }
      v55 = sub_1CF9C974C(v38, v40, &v53);
      sub_1CFB021C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF917000, v33, (os_log_type_t)v48, "failed to add item to key chain: label = %s, error = %{public}s", (uint8_t *)v35, 0x16u);
      v41 = v47;
      swift_arrayDestroy();
      MEMORY[0x1D17DA6E4](v41, -1, -1);
      MEMORY[0x1D17DA6E4](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v29);
    }
    v53 = 0;
    v54 = 0xE000000000000000;
    sub_1CFB02388();
    if (v28 == -25299)
    {
      sub_1CFB01B30();
      sub_1CFB01B30();
      v42 = v53;
      v43 = v54;
      LOWORD(v53) = 252;
      v44 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      v46 = 378;
    }
    else
    {
      swift_bridgeObjectRelease();
      v53 = 0xD00000000000002BLL;
      v54 = 0x80000001CFB35450;
      sub_1CFB01B30();
      v42 = v53;
      v43 = v54;
      LOWORD(v53) = 233;
      v44 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      v46 = 380;
    }
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v42, v43, (__int16 *)&v53, 0, v44, 0xD00000000000005ALL, 0x80000001CFB34890, v45, 0xD00000000000001ALL, 0x80000001CFB35480, v46);
    swift_willThrow();
  }
}

void sub_1CFAF0580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __SecKey *a5, const __CFString *a6)
{
  const __CFData *v8;
  const __CFData *v9;
  __int16 v10;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  error[0] = 0;
  v8 = (const __CFData *)sub_1CFB00E58();
  v9 = (const __CFData *)sub_1CFB00E58();
  LODWORD(a6) = SecKeyVerifySignature(a5, a6, v8, v9, error);

  if (!(_DWORD)a6)
  {
    v10 = 246;
    errorFromCFError(_:_:_:)(error[0], 0xD000000000000023, 0x80000001CFB353C0, &v10);
    swift_willThrow();
  }
}

unint64_t sub_1CFAF0678(__SecKey *a1, __SecKey *a2, const __CFString *a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
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
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t inited;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  unint64_t v30;
  const __CFDictionary *v31;
  CFDataRef v32;
  const __CFData *v33;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v37;
  uint64_t v38;
  SecKeyRef v39;
  SecKeyAlgorithm v40;
  SecKeyRef v41;
  __int16 v42;
  CFErrorRef error[3];

  v38 = a4;
  v40 = a3;
  v41 = a2;
  v39 = a1;
  error[1] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v8 = sub_1CFB012CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  error[0] = 0;
  if (qword_1ED9054E8 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v8, (uint64_t)qword_1ED907590);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v18, v19, v8);
  v20 = sub_1CFB012B4();
  v21 = sub_1CFB01FC8();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1CF917000, v20, v21, "coreidvd: derive shared secret", v22, 2u);
    MEMORY[0x1D17DA6E4](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB059A0;
  v24 = (void *)*MEMORY[0x1E0CD6EF8];
  v25 = MEMORY[0x1E0DEB418];
  v26 = v38;
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CD6EF8];
  *(_QWORD *)(inited + 40) = v26;
  v27 = (void *)*MEMORY[0x1E0CD6F00];
  *(_QWORD *)(inited + 64) = v25;
  *(_QWORD *)(inited + 72) = v27;
  *(_QWORD *)(inited + 104) = MEMORY[0x1E0CB0338];
  *(_QWORD *)(inited + 80) = a5;
  *(_QWORD *)(inited + 88) = a6;
  v28 = v24;
  v29 = v27;
  sub_1CF9239E0(a5, a6);
  v30 = sub_1CF923308(inited);
  sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
  sub_1CFAE6E34();
  v31 = (const __CFDictionary *)sub_1CFB01944();
  swift_bridgeObjectRelease();
  v32 = SecKeyCopyKeyExchangeResult(v39, v40, v41, v31, error);

  if (v32)
  {
    type metadata accessor for DIPSecureData();
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v32;
    v33 = v32;
    BytePtr = CFDataGetBytePtr(v33);
    Length = CFDataGetLength(v33);
    mlock(BytePtr, Length);

  }
  else
  {
    v42 = 247;
    errorFromCFError(_:_:_:)(error[0], 0xD00000000000001DLL, 0x80000001CFB352D0, &v42);
    swift_willThrow();
  }
  return v30;
}

void sub_1CFAF09B4(_BYTE *a1, __SecAccessControl *a2, char a3)
{
  uint64_t v3;
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
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  __SecAccessControl *v31;
  uint64_t v32;
  unint64_t v33;
  __SecAccessControl *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  SecAccessControlRef v39;
  char v40;
  uint64_t inited;
  uint64_t v42;
  void **v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void **v50;
  void **v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  SecAccessControlRef v56;
  id v57;
  __SecAccessControl *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __SecAccessControl *v64;
  id v65;
  const __CFDictionary *v66;
  SecKeyRef RandomKey;
  __int128 v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  unint64_t v78;
  uint64_t v79;
  __SecAccessControl *v80;
  id v81;
  id v82;
  _QWORD v83[2];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  SecAccessControlRef v88;
  __SecAccessControl *v89;
  uint64_t v90[35];
  __int128 error;
  __int16 v92[12];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = sub_1CFB012CC();
  v8 = *(_QWORD *)(v7 - 8);
  v16 = MEMORY[0x1E0C80A78](v7, v9, v10, v11, v12, v13, v14, v15);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  v26 = (char *)v83 - v25;
  if (*a1)
  {
    if (*a1 == 1)
    {
      if (qword_1ED9054E8 != -1)
        swift_once();
      v27 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED907590);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v26, v27, v7);
      v28 = sub_1CFB012B4();
      v29 = sub_1CFB01FD4();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = swift_slowAlloc();
        v31 = (__SecAccessControl *)swift_slowAlloc();
        v85 = v7;
        v89 = v31;
        *(_QWORD *)&error = v31;
        *(_DWORD *)v30 = 136446466;
        v32 = sub_1CFB01A28();
        v86 = v8;
        v90[0] = sub_1CF9C974C(v32, v33, (uint64_t *)&error);
        sub_1CFB021C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2050;
        v90[0] = 2048;
        sub_1CFB021C0();
        _os_log_impl(&dword_1CF917000, v28, v29, "coreidvd: generateKeyAsym key algorithm %{public}s-%{public}ld not supported", (uint8_t *)v30, 0x16u);
        v34 = v89;
        swift_arrayDestroy();
        MEMORY[0x1D17DA6E4](v34, -1, -1);
        MEMORY[0x1D17DA6E4](v30, -1, -1);

        (*(void (**)(char *, uint64_t))(v86 + 8))(v26, v85);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v26, v7);
      }
      *(_QWORD *)&error = 0;
      *((_QWORD *)&error + 1) = 0xE000000000000000;
      sub_1CFB02388();
      swift_bridgeObjectRelease();
      strcpy((char *)&error, "key algorithm ");
      HIBYTE(error) = -18;
      sub_1CFB01A28();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      v90[0] = 2048;
      sub_1CFB027F0();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      v68 = error;
      LOWORD(error) = 243;
      v69 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
      sub_1CF923828();
      swift_allocError();
      DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, v68, *((uint64_t *)&v68 + 1), (__int16 *)&error, 0, v69, 0xD00000000000005ALL, 0x80000001CFB34890, v70, 0xD000000000000026, 0x80000001CFB352F0, 56);
      goto LABEL_26;
    }
    v84 = v24;
    v86 = v8;
    v35 = 1;
  }
  else
  {
    v84 = v24;
    v86 = v8;
    v35 = 0;
  }
  v36 = sub_1CFB01A28();
  v38 = v37;
  *(_QWORD *)&error = 0;
  v39 = a2;
  if (!a2)
  {
    v39 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x40000000uLL, (CFErrorRef *)&error);
    if (!v39)
    {
      swift_bridgeObjectRelease();
      v92[0] = 244;
      errorFromCFError(_:_:_:)((void *)error, 0xD000000000000036, 0x80000001CFB35380, v92);
LABEL_26:
      swift_willThrow();
      return;
    }
  }
  v88 = v39;
  v89 = a2;
  v40 = a3;
  v83[1] = v3;
  v85 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9039F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFB0DDC0;
  v87 = (id)*MEMORY[0x1E0CD69D8];
  *(_QWORD *)(inited + 32) = v87;
  v42 = MEMORY[0x1E0DEAFA0];
  v43 = (void **)MEMORY[0x1E0CD6A38];
  *(_BYTE *)(inited + 40) = 0;
  v44 = *v43;
  *(_QWORD *)(inited + 64) = v42;
  *(_QWORD *)(inited + 72) = v44;
  *(_QWORD *)(inited + 104) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 80) = v36;
  *(_QWORD *)(inited + 88) = v38;
  v45 = (void *)*MEMORY[0x1E0CD6ED0];
  if (*MEMORY[0x1E0CD6ED0])
  {
    v46 = (_QWORD *)inited;
    *(_QWORD *)(inited + 112) = v45;
    *(_BYTE *)(inited + 120) = v35;
    v47 = (void *)*MEMORY[0x1E0CD6A20];
    *(_QWORD *)(inited + 144) = v42;
    *(_QWORD *)(inited + 152) = v47;
    v48 = MEMORY[0x1E0DEB418];
    *(_QWORD *)(inited + 160) = 256;
    v49 = (void *)*MEMORY[0x1E0CD6B98];
    v50 = (void **)MEMORY[0x1E0CD6BA0];
    *(_QWORD *)(inited + 184) = v48;
    *(_QWORD *)(inited + 192) = v49;
    v51 = (void **)MEMORY[0x1E0CD6BA8];
    if ((v40 & 1) == 0)
      v51 = v50;
    v52 = *v51;
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED903958);
    v46[25] = v52;
    v54 = (void *)*MEMORY[0x1E0CD6890];
    v46[28] = v53;
    v46[29] = v54;
    type metadata accessor for SecAccessControl(0);
    v46[33] = v55;
    v56 = v88;
    v46[30] = v88;
    v57 = v52;
    v58 = v89;
    v59 = v87;
    v60 = v44;
    v61 = v47;
    v62 = v49;
    v63 = v54;
    v64 = v56;
    v65 = v45;
    sub_1CF923308((uint64_t)v46);
    sub_1CF9775E8(0, (unint64_t *)&qword_1ED903980);
    sub_1CFAE6E34();
    v66 = (const __CFDictionary *)sub_1CFB01944();
    swift_bridgeObjectRelease();
    RandomKey = SecKeyCreateRandomKey(v66, (CFErrorRef *)&error);

    if (RandomKey)
    {
      if (!SecKeyCopyPublicKey(RandomKey))
      {
        if (qword_1ED9054E8 != -1)
          swift_once();
        v71 = v85;
        v72 = __swift_project_value_buffer(v85, (uint64_t)qword_1ED907590);
        swift_beginAccess();
        v73 = v86;
        v74 = v84;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v84, v72, v71);
        v75 = sub_1CFB012B4();
        v76 = sub_1CFB01FD4();
        if (os_log_type_enabled(v75, v76))
        {
          v77 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v77 = 0;
          _os_log_impl(&dword_1CF917000, v75, v76, "coreidvd: generateKeyAsym SecKeyCopyPublicKey failed.", v77, 2u);
          MEMORY[0x1D17DA6E4](v77, -1, -1);
        }

        (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v71);
        LOWORD(v90[0]) = 242;
        v78 = sub_1CF921F90(MEMORY[0x1E0DEE9D8]);
        sub_1CF923828();
        swift_allocError();
        DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)(0, 0xD00000000000002ALL, 0x80000001CFB35350, (__int16 *)v90, 0, v78, 0xD00000000000005ALL, 0x80000001CFB34890, v79, 0xD000000000000026, 0x80000001CFB352F0, 81);
        swift_willThrow();

      }
    }
    else
    {
      v92[0] = 241;
      errorFromCFError(_:_:_:)((void *)error, 0xD00000000000002CLL, 0x80000001CFB35320, v92);
      swift_willThrow();
    }

  }
  else
  {
    v80 = v89;
    v81 = v87;
    v82 = v44;

    __break(1u);
  }
}

uint64_t sub_1CFAF1240()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CFAF1264()
{
  return sub_1CFAECFA4();
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t type metadata accessor for DIPCryptoKeychain()
{
  return objc_opt_self();
}

uint64_t method lookup function for DIPCryptoKeychain()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.generateKeySym(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.generateKeyAsym(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.generateKeyAsym(_:_:useSecureElement:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.sign(_:withKey:algorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.verify(_:input:withKey:algorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.encrypt(_:withKey:algorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.decrypt(_:withKey:algorithm:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static DIPCryptoKeychain.dh(privateKey:publicKey:algorithm:keySize:otherInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t type metadata accessor for DIPKeystoreKeychain()
{
  return objc_opt_self();
}

uint64_t method lookup function for DIPKeystoreKeychain()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DIPKeystoreKeychain.__allocating_init(requireUserAuth:externalizedLAContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v3 + 96) + *(_QWORD *)(v3 + 96));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_1CFA450E8;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of DIPKeystoreKeychain.identityKeyLabel(for:userInfo:type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of DIPKeystoreKeychain.generateIdentityKeyPair(label:algorithm:constraints:enableUAM:temporary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v7 + 120)
                                                                                              + *(_QWORD *)(*(_QWORD *)v7 + 120));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_1CF92F754;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of DIPKeystoreKeychain.retrieveIdentityKey(label:constraints:attestationType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DIPKeystoreKeychain.deleteIdentityKey(label:constraints:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t type metadata accessor for IdentityKeyWithKeychain()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityKeyWithKeychain()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.__allocating_init(label:privateKey:attestationType:laContext:validity:isTemporary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 368))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.getIdentityPrivateKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.getIdentityPublicKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.getIdentityPublicKeyData()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.sign(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.persist()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.attestationType()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.supportAuthMethod()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.authMethod()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 432) + *(_QWORD *)(*(_QWORD *)v0 + 432));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CF92F824;
  return v4();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.attestation(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of IdentityKeyWithKeychain.signatureAlgorithm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t sub_1CFAF1674()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1CFAF16A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  v3 = sub_1CF9C9A68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v4 = (2 * *(_QWORD *)(v3 + 16)) | 1;
  result = sub_1CFAF1A70(v3 + 32, 0, v4);
  if ((result & 1) != 0)
  {
    *a2 = v3;
    a2[1] = v3 + 32;
    a2[2] = 0;
    a2[3] = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CFAF1714(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  _BYTE v13[48];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;

  if (*(_QWORD *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    v8 = sub_1CF9A2A08();
    v5 = v9;
    type metadata accessor for ASN1Error.Backing();
    v10 = swift_allocObject();
    *(_BYTE *)(v10 + 16) = 0;
    *(_QWORD *)(v10 + 24) = v8;
    *(_QWORD *)(v10 + 32) = v5;
    *(_QWORD *)(v10 + 40) = 0xD000000000000023;
    *(_QWORD *)(v10 + 48) = 0x80000001CFB27DE0;
    *(_QWORD *)(v10 + 56) = 26;
    sub_1CF921074();
    swift_allocError();
    *v11 = v10;
    swift_willThrow();
    sub_1CF9210B8(a1);
    return v5;
  }
  sub_1CF9210FC(a1 + 16, (uint64_t)v13);
  result = sub_1CF9210FC((uint64_t)v13, (uint64_t)&v14);
  if (v18 == 1)
  {
    v5 = v14;
    v6 = v17 >> 1;
    if (v16 != v17 >> 1)
    {
      if (v16 >= (uint64_t)(v17 >> 1))
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (*(char *)(v15 + v16) < 0)
        goto LABEL_16;
      if (v16 + 1 != v6)
      {
        if (v16 + 1 >= v6)
        {
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
        if ((*(char *)(v15 + v16 + 1) & 0x80000000) == 0)
        {
          v7 = v16 + 2;
          if (v16 + 2 != v6)
          {
            while (v7 < v6)
            {
              if (*(char *)(v15 + v7) < 0)
                goto LABEL_16;
              if (v6 == ++v7)
                goto LABEL_14;
            }
            __break(1u);
            goto LABEL_19;
          }
          goto LABEL_14;
        }
LABEL_16:
        type metadata accessor for ASN1Error.Backing();
        v5 = swift_allocObject();
        *(_BYTE *)(v5 + 16) = 6;
        *(_QWORD *)(v5 + 24) = 0xD00000000000001FLL;
        *(_QWORD *)(v5 + 32) = 0x80000001CFB354E0;
        *(_QWORD *)(v5 + 40) = 0xD00000000000001FLL;
        *(_QWORD *)(v5 + 48) = 0x80000001CFB35500;
        *(_QWORD *)(v5 + 56) = 253;
        sub_1CF921074();
        swift_allocError();
        *v12 = v5;
        sub_1CF9211C4((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))j__swift_unknownObjectRetain);
        swift_willThrow();
        sub_1CF9210B8(a1);
        sub_1CF9211C4((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))j__swift_unknownObjectRelease);
        return v5;
      }
    }
LABEL_14:
    sub_1CF9211C4((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))j__swift_unknownObjectRetain);
    sub_1CF9210B8(a1);
    return v5;
  }
LABEL_21:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ASN1IA5String()
{
  return &type metadata for ASN1IA5String;
}

uint64_t sub_1CFAF1974()
{
  return MEMORY[0x1E0DEA9F8];
}

unint64_t sub_1CFAF1984()
{
  unint64_t result;

  result = qword_1EFBC5CD8;
  if (!qword_1EFBC5CD8)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB21050, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_1EFBC5CD8);
  }
  return result;
}

uint64_t sub_1CFAF19C8()
{
  return MEMORY[0x1E0DEAA00];
}

unint64_t sub_1CFAF19D8()
{
  unint64_t result;

  result = qword_1EFBC5CE0;
  if (!qword_1EFBC5CE0)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB21088, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_1EFBC5CE0);
  }
  return result;
}

uint64_t sub_1CFAF1A1C()
{
  return MEMORY[0x1E0DEA9F0];
}

unint64_t sub_1CFAF1A2C()
{
  unint64_t result;

  result = qword_1EFBC5CE8;
  if (!qword_1EFBC5CE8)
  {
    result = MEMORY[0x1D17DA600](&unk_1CFB210C8, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_1EFBC5CE8);
  }
  return result;
}

uint64_t sub_1CFAF1A70(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  int v5;

  v3 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    if ((uint64_t)(a3 >> 1) > a2)
    {
      if (*(char *)(result + a2) < 0)
        return 0;
      if (a2 + 1 == v3)
        return 1;
      v4 = result + 1;
      while (a2 + 1 < v3)
      {
        v5 = *(char *)(v4 + a2);
        result = v5 >= 0;
        if ((v5 & 0x80000000) == 0 && v3 - 2 != a2++)
          continue;
        return result;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  return 1;
}

unint64_t IQACode.toString.getter()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v2;

  v1 = v0[1];
  v2 = 1936941424;
  switch(v1)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 2uLL:
      v2 = 0x656E697272756C62;
      break;
    case 3uLL:
      v2 = 0x657275736F707865;
      break;
    case 4uLL:
      v2 = 0x657275736F707865;
      break;
    case 5uLL:
      v2 = 0xD000000000000011;
      break;
    case 6uLL:
      v2 = 0xD000000000000012;
      break;
    case 7uLL:
      v2 = 0xD000000000000013;
      break;
    case 8uLL:
      v2 = 0xD000000000000014;
      break;
    case 9uLL:
      v2 = 0xD000000000000014;
      break;
    case 0xAuLL:
    case 0x11uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1BuLL:
      v2 = 0xD000000000000015;
      break;
    case 0xBuLL:
    case 0xCuLL:
      v2 = 0x6374695064616568;
      break;
    case 0xDuLL:
      v2 = 0x6C6C6F5264616568;
      break;
    case 0xEuLL:
      v2 = 0x6C6C6F5264616568;
      break;
    case 0xFuLL:
      v2 = 0x4C77615964616568;
      break;
    case 0x10uLL:
      v2 = 0x4877615964616568;
      break;
    case 0x12uLL:
      v2 = 0xD000000000000016;
      break;
    case 0x13uLL:
      v2 = 0xD000000000000019;
      break;
    case 0x14uLL:
      v2 = 0xD00000000000001ALL;
      break;
    case 0x15uLL:
      v2 = 0xD000000000000017;
      break;
    case 0x16uLL:
      v2 = 0xD000000000000018;
      break;
    case 0x18uLL:
      v2 = 0xD000000000000016;
      break;
    case 0x1AuLL:
      v2 = 0xD000000000000016;
      break;
    case 0x1CuLL:
      v2 = 0xD000000000000016;
      break;
    case 0x1DuLL:
    case 0x21uLL:
      v2 = 0x746E656D75636F64;
      break;
    case 0x1EuLL:
      v2 = 0xD000000000000010;
      break;
    case 0x1FuLL:
      v2 = 0xD000000000000013;
      break;
    case 0x20uLL:
      v2 = 0xD000000000000014;
      break;
    case 0x22uLL:
      v2 = 0xD000000000000010;
      break;
    case 0x23uLL:
      v2 = 0xD000000000000011;
      break;
    case 0x24uLL:
      v2 = 0x6F54746567726174;
      break;
    case 0x25uLL:
      v2 = 0xD000000000000010;
      break;
    case 0x26uLL:
      v2 = 0x73656361466D756ELL;
      break;
    case 0x27uLL:
      v2 = 0x73656361466D756ELL;
      break;
    case 0x28uLL:
      v2 = 0x6C6576654C78756CLL;
      break;
    case 0x29uLL:
      v2 = 0x6C6576654C78756CLL;
      break;
    case 0x2AuLL:
      v2 = 0x6F4E373134666470;
      break;
    case 0x2BuLL:
      v2 = 0x6F46373134666470;
      break;
    case 0x2CuLL:
      v2 = 0xD000000000000011;
      break;
    case 0x2DuLL:
      v2 = 0xD000000000000010;
      break;
    case 0x2EuLL:
      v2 = 0x73694D6574617473;
      break;
    case 0x2FuLL:
      v2 = 0x756C636E6F636E69;
      break;
    default:
      v2 = *v0;
      break;
  }
  sub_1CF9243C8(*v0, v1);
  return v2;
}

uint64_t IQCType.toMetricsFlags.getter()
{
  uint64_t v0;
  uint64_t result;

  if (*(_BYTE *)(v0 + 16) != 2)
    return 0;
  result = 0;
  if (*(_QWORD *)v0 <= 0x19uLL)
  {
    type metadata accessor for MetricsFlags();
    return swift_initStaticObject();
  }
  return result;
}

uint64_t sub_1CFAF202C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
    do
    {
      v4 = *v3;
      sub_1CFB02388();
      swift_bridgeObjectRelease();
      IQACode.toString.getter();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      sub_1CFB027F0();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      sub_1CFAF2640(v4);
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      sub_1CFB01B30();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      if (v2 < v1 - 1)
        sub_1CFB01B30();
      ++v2;
      v3 += 4;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 91;
}

uint64_t sub_1CFAF2244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = swift_bridgeObjectRetain() + 48;
    do
    {
      IQCType.toString.getter();
      sub_1CFB01B30();
      swift_bridgeObjectRelease();
      if (v2 < v1 - 1)
        sub_1CFB01B30();
      ++v2;
      v3 += 24;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_1CFB01B30();
  swift_bridgeObjectRelease();
  return 91;
}

uint64_t IQCType.toString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) != 1)
      __asm { BR              X10 }
    v1 = 0x286E776F6E6B6E75;
  }
  else
  {
    v1 = 0x2878656C706D6F63;
  }
  v3 = v1;
  sub_1CFB01B30();
  sub_1CFB01B30();
  return v3;
}

void sub_1CFAF23E4()
{
  JUMPOUT(0x1CFAF23A4);
}

void sub_1CFAF23FC()
{
  JUMPOUT(0x1CFAF23A4);
}

void sub_1CFAF2420()
{
  JUMPOUT(0x1CFAF23A4);
}

void sub_1CFAF2620()
{
  JUMPOUT(0x1CFAF23A4);
}

uint64_t sub_1CFAF2640(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 16))
  {
    v1 = *(unsigned __int8 *)(swift_bridgeObjectRetain() + 49);
    sub_1CFB01B30();
    IQCType.toString.getter();
    sub_1CFB01B30();
    swift_bridgeObjectRelease();
    sub_1CFB01B30();
    __asm { BR              X8 }
  }
  return 0;
}

id static IdentityManagementInterface.interface()()
{
  return sub_1CFAF2898(&protocolRef__TtP13CoreIDVShared28IdentityManagementUIProtocol_);
}

id static IdentityManagementDaemonToClientUIInterface.interface()()
{
  return sub_1CFAF2898(&protocolRef__TtP13CoreIDVShared40IdentityManagementExportedClientProtocol_);
}

id sub_1CFAF2898(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a1);
}

unint64_t machServiceIdentityManagementUI.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t IdentityManagementInterface.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t IdentityManagementInterface.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t IdentityManagementDaemonToClientUIInterface.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for IdentityManagementInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityManagementInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for IdentityManagementDaemonToClientUIInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for IdentityManagementDaemonToClientUIInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t IDVUIServiceConfigurationIdentifier.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CFB02670();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t IDVUIServiceConfigurationIdentifier.rawValue.getter()
{
  return 0x746C7561666564;
}

unint64_t sub_1CFAF29DC()
{
  unint64_t result;

  result = qword_1EFBC5E20;
  if (!qword_1EFBC5E20)
  {
    result = MEMORY[0x1D17DA600](&protocol conformance descriptor for IDVUIServiceConfigurationIdentifier, &type metadata for IDVUIServiceConfigurationIdentifier);
    atomic_store(result, (unint64_t *)&qword_1EFBC5E20);
  }
  return result;
}

uint64_t sub_1CFAF2A20()
{
  sub_1CFB02A90();
  sub_1CFB01ADC();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAF2A70()
{
  return sub_1CFB01ADC();
}

uint64_t sub_1CFAF2A88()
{
  sub_1CFB02A90();
  sub_1CFB01ADC();
  return sub_1CFB02ACC();
}

uint64_t sub_1CFAF2AD4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CFB02670();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1CFAF2B24(_QWORD *a1@<X8>)
{
  *a1 = 0x746C7561666564;
  a1[1] = 0xE700000000000000;
}

uint64_t storeEnumTagSinglePayload for IDVUIServiceConfigurationIdentifier(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CFAF2B80 + 4 * byte_1CFB212A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CFAF2BA0 + 4 * byte_1CFB212A5[v4]))();
}

_BYTE *sub_1CFAF2B80(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CFAF2BA0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFAF2BA8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFAF2BB0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CFAF2BB8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CFAF2BC0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for IDVUIServiceConfigurationIdentifier()
{
  return &type metadata for IDVUIServiceConfigurationIdentifier;
}

uint64_t dispatch thunk of XPCValueContainer.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of XPCValueContainer.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_1CFAF2BEC(uint64_t a1)
{
  return sub_1CF94C3F0(a1, qword_1ED907558);
}

uint64_t sub_1CFAF2C04(uint64_t a1)
{
  return sub_1CF94C3F0(a1, qword_1ED907540);
}

uint64_t sub_1CFAF2C24(uint64_t a1)
{
  return sub_1CF94C3F0(a1, qword_1ED907528);
}

uint64_t sub_1CFAF2C44(uint64_t a1)
{
  return sub_1CF94C3F0(a1, qword_1EFBED2A0);
}

uint64_t sub_1CFAF2C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904BF8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904BF8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.total";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.configureTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED904C18, (uint64_t)qword_1ED904BF8, a1);
}

uint64_t sub_1CFAF2D40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904C20);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904C20);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.loadConfig";
  *(_QWORD *)(v1 + 8) = 20;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureLoadConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED904C40, (uint64_t)qword_1ED904C20, a1);
}

uint64_t sub_1CFAF2E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902F10);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902F10);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.loadBootstrapConfig";
  *(_QWORD *)(v1 + 8) = 29;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureLoadBootstrapConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1ED903258, (uint64_t)qword_1ED902F10, a1);
}

uint64_t sub_1CFAF2F08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5E28);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5E28);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.loadAttributeConfig";
  *(_QWORD *)(v1 + 8) = 29;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureLoadAttributeConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4B0, (uint64_t)qword_1EFBC5E28, a1);
}

uint64_t sub_1CFAF2FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5E40);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5E40);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.workflow.fetch";
  *(_QWORD *)(v1 + 8) = 24;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureFetchWorkflow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4B8, (uint64_t)qword_1EFBC5E40, a1);
}

uint64_t sub_1CFAF30D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5E58);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5E58);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.workflow.perso";
  *(_QWORD *)(v1 + 8) = 24;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureDecodePersoWorkflow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4C0, (uint64_t)qword_1EFBC5E58, a1);
}

uint64_t sub_1CFAF31B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5E70);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5E70);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.loadClaimsAndPrefill";
  *(_QWORD *)(v1 + 8) = 30;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureLoadClaimsAndPrefill.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1EFBBD4C8, (uint64_t)qword_1EFBC5E70, a1);
}

uint64_t sub_1CFAF3298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904C48);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904C48);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.verifyAccountStatus";
  *(_QWORD *)(v1 + 8) = 29;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureVerifyAccountStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED904C60, (uint64_t)qword_1ED904C48, a1);
}

uint64_t sub_1CFAF337C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5E88);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5E88);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.loadPregeneratedAssessment";
  *(_QWORD *)(v1 + 8) = 36;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureLoadPregeneratedAssessment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4D8, (uint64_t)qword_1EFBC5E88, a1);
}

uint64_t sub_1CFAF3460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5EA0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5EA0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "performVerification.total";
  *(_QWORD *)(v1 + 8) = 25;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.performVerificationTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4E0, (uint64_t)qword_1EFBC5EA0, a1);
}

uint64_t sub_1CFAF3548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5EB8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5EB8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "performVerification.waitForBAA";
  *(_QWORD *)(v1 + 8) = 30;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.performVerificationWaitForBAA.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4E8, (uint64_t)qword_1EFBC5EB8, a1);
}

uint64_t sub_1CFAF362C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5ED0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5ED0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "shareVerificationResult.total";
  *(_QWORD *)(v1 + 8) = 29;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.shareVerificationResultTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4F0, (uint64_t)qword_1EFBC5ED0, a1);
}

uint64_t sub_1CFAF3714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5EE8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5EE8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.total";
  *(_QWORD *)(v1 + 8) = 27;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD4F8, (uint64_t)qword_1EFBC5EE8, a1);
}

uint64_t sub_1CFAF37FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F00);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.prepareSharingRequest";
  *(_QWORD *)(v1 + 8) = 43;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultPrepare.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD500, (uint64_t)qword_1EFBC5F00, a1);
}

uint64_t sub_1CFAF38E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F18);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F18);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.keysAndCertificates";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultKeysAndCertificates.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD508, (uint64_t)qword_1EFBC5F18, a1);
}

uint64_t sub_1CFAF39C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F30);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F30);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.waitForSetup";
  *(_QWORD *)(v1 + 8) = 34;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultWaitForSetup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD510, (uint64_t)qword_1EFBC5F30, a1);
}

uint64_t sub_1CFAF3AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F48);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F48);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.waitForBAA";
  *(_QWORD *)(v1 + 8) = 32;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultWaitForBAA.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD518, (uint64_t)qword_1EFBC5F48, a1);
}

uint64_t sub_1CFAF3B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F60);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F60);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.fetchAssessment";
  *(_QWORD *)(v1 + 8) = 37;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultFetchAssesssment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD520, (uint64_t)qword_1EFBC5F60, a1);
}

uint64_t sub_1CFAF3C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F78);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F78);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.fetchAssessmentProofing";
  *(_QWORD *)(v1 + 8) = 45;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultFetchAssesssmentProofing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD528, (uint64_t)qword_1EFBC5F78, a1);
}

uint64_t sub_1CFAF3D54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5F90);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5F90);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityProofing.fetchAssessment";
  *(_QWORD *)(v1 + 8) = 32;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getIdentityProofingAssessment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD530, (uint64_t)qword_1EFBC5F90, a1);
}

uint64_t sub_1CFAF3E38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5FA8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5FA8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.sharingRegistration";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultSharingRegistration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD538, (uint64_t)qword_1EFBC5FA8, a1);
}

uint64_t sub_1CFAF3F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5FC0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5FC0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.buildSharingRequest";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getVerificationResultBuildSharingRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD540, (uint64_t)qword_1EFBC5FC0, a1);
}

uint64_t sub_1CFAF4000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5FD8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5FD8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "concludeVerification.total";
  *(_QWORD *)(v1 + 8) = 26;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.concludeVerificationTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1EFBBD548, (uint64_t)qword_1EFBC5FD8, a1);
}

uint64_t sub_1CFAF40E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902EC8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902EC8);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configuration";
  *(_QWORD *)(v1 + 8) = 13;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.configurationRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1ED9030C0, (uint64_t)qword_1ED902EC8, a1);
}

uint64_t sub_1CFAF41D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC5FF0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC5FF0);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "attributeConfig";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.attributeConfigRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD558, (uint64_t)qword_1EFBC5FF0, a1);
}

uint64_t sub_1CFAF42B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6008);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6008);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "workflowRecommendation";
  *(_QWORD *)(v1 + 8) = 22;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.workflowRecommendationRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD560, (uint64_t)qword_1EFBC6008, a1);
}

uint64_t sub_1CFAF439C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6020);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6020);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityProofing";
  *(_QWORD *)(v1 + 8) = 16;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.identityProofingRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD568, (uint64_t)qword_1EFBC6020, a1);
}

uint64_t sub_1CFAF4484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6038);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6038);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "sharingRegistration";
  *(_QWORD *)(v1 + 8) = 19;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.sharingRegistrationRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD570, (uint64_t)qword_1EFBC6038, a1);
}

uint64_t sub_1CFAF456C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6050);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6050);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identitySharing";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.identitySharingRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD578, (uint64_t)qword_1EFBC6050, a1);
}

uint64_t sub_1CFAF4654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6068);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6068);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityProofingAndSharing";
  *(_QWORD *)(v1 + 8) = 26;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.identityProofingAndRegistrationRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD580, (uint64_t)qword_1EFBC6068, a1);
}

uint64_t sub_1CFAF4738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6080);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6080);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "inputValidation";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.inputValidationRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD588, (uint64_t)qword_1EFBC6080, a1);
}

uint64_t sub_1CFAF4820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6098);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6098);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "topekaNonce";
  *(_QWORD *)(v1 + 8) = 11;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.topekaNonceRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD590, (uint64_t)qword_1EFBC6098, a1);
}

uint64_t sub_1CFAF4908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC60B0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC60B0);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "spNonce";
  *(_QWORD *)(v1 + 8) = 7;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.spNonceRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD598, (uint64_t)qword_1EFBC60B0, a1);
}

uint64_t sub_1CFAF49F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E08);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E08);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "ord";
  *(_QWORD *)(v1 + 8) = 3;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.ordRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5A0, (uint64_t)qword_1ED902E08, a1);
}

uint64_t sub_1CFAF4AD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E20);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E20);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "otd";
  *(_QWORD *)(v1 + 8) = 3;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.otdRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5A8, (uint64_t)qword_1ED902E20, a1);
}

uint64_t sub_1CFAF4BC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC60C8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC60C8);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "old";
  *(_QWORD *)(v1 + 8) = 3;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.oldRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5B0, (uint64_t)qword_1EFBC60C8, a1);
}

uint64_t sub_1CFAF4CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC60E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC60E0);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "pag";
  *(_QWORD *)(v1 + 8) = 3;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.pagRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5B8, (uint64_t)qword_1EFBC60E0, a1);
}

uint64_t sub_1CFAF4D8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E98);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E98);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getProfile";
  *(_QWORD *)(v1 + 8) = 10;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getProfileRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1ED903230, (uint64_t)qword_1ED902E98, a1);
}

uint64_t sub_1CFAF4E70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E50);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E50);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getSTS";
  *(_QWORD *)(v1 + 8) = 6;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getSTSRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903218, (uint64_t)qword_1ED902E50, a1);
}

uint64_t sub_1CFAF4F54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904190);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904190);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getStaticWorkflow";
  *(_QWORD *)(v1 + 8) = 17;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getStaticWorkflowRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED9041B0, (uint64_t)qword_1ED904190, a1);
}

uint64_t sub_1CFAF5038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904168);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904168);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getStaticAssets";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getStaticAssetRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED904188, (uint64_t)qword_1ED904168, a1);
}

uint64_t sub_1CFAF511C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC60F8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC60F8);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getStaticTC";
  *(_QWORD *)(v1 + 8) = 11;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getStaticTCRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5C0, (uint64_t)qword_1EFBC60F8, a1);
}

uint64_t sub_1CFAF5200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6110);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6110);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityProofingV2";
  *(_QWORD *)(v1 + 8) = 18;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.identityProofingRequestV2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5C8, (uint64_t)qword_1EFBC6110, a1);
}

uint64_t sub_1CFAF52E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6128);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6128);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityPendingAction";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.identityPendingActionRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5D0, (uint64_t)qword_1EFBC6128, a1);
}

uint64_t sub_1CFAF53C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6140);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6140);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityLivenessConfig";
  *(_QWORD *)(v1 + 8) = 22;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.identityLivenessConfigRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5D8, (uint64_t)qword_1EFBC6140, a1);
}

uint64_t sub_1CFAF54AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6158);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6158);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getRPEncryptionCertificate";
  *(_QWORD *)(v1 + 8) = 26;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.getRPEncryptionCertificateRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5E0, (uint64_t)qword_1EFBC6158, a1);
}

uint64_t sub_1CFAF5590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6170);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6170);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "claimValidity";
  *(_QWORD *)(v1 + 8) = 13;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.claimValidityRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5E8, (uint64_t)qword_1EFBC6170, a1);
}

uint64_t sub_1CFAF5674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6188);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6188);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "uploadAssets.request";
  *(_QWORD *)(v1 + 8) = 20;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.uploadAssetsCloudKitRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD5F0, (uint64_t)qword_1EFBC6188, a1);
}

uint64_t sub_1CFAF575C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC61A0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC61A0);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "identityReportConcern";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.identityReportConcernRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1EFBBD5F8, (uint64_t)qword_1EFBC61A0, a1);
}

uint64_t sub_1CFAF5840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E38);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E38);
  if (qword_1ED904040 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907540);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "webRequest";
  *(_QWORD *)(v1 + 8) = 10;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.webRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1ED9030B0, (uint64_t)qword_1ED902E38, a1);
}

uint64_t sub_1CFAF5924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC61B8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC61B8);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "loadInternalBundle";
  *(_QWORD *)(v1 + 8) = 18;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.loadInternalBundle.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD608, (uint64_t)qword_1EFBC61B8, a1);
}

uint64_t sub_1CFAF5A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC61D0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC61D0);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchBAACert";
  *(_QWORD *)(v1 + 8) = 12;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchBAACert.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD610, (uint64_t)qword_1EFBC61D0, a1);
}

uint64_t sub_1CFAF5AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC61E8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC61E8);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchSEABAASCert";
  *(_QWORD *)(v1 + 8) = 16;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchSEABAASCert.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD618, (uint64_t)qword_1EFBC61E8, a1);
}

uint64_t sub_1CFAF5BDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E68);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E68);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchAssessment";
  *(_QWORD *)(v1 + 8) = 15;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchAssessment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903220, (uint64_t)qword_1ED902E68, a1);
}

uint64_t sub_1CFAF5CC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902F28);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902F28);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "odnMypg";
  *(_QWORD *)(v1 + 8) = 7;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.odnMypg.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1ED903268, (uint64_t)qword_1ED902F28, a1);
}

uint64_t sub_1CFAF5DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6200);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6200);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "passkitRegistration";
  *(_QWORD *)(v1 + 8) = 19;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.passkitRegistration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD620, (uint64_t)qword_1EFBC6200, a1);
}

uint64_t sub_1CFAF5E94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6218);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6218);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "decodeVerifiedClaim";
  *(_QWORD *)(v1 + 8) = 19;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.decodeVerifiedClaim.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1EFBBD628, (uint64_t)qword_1EFBC6218, a1);
}

uint64_t sub_1CFAF5F78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902DF0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902DF0);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "checkTrust";
  *(_QWORD *)(v1 + 8) = 10;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.checkTrust.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903210, (uint64_t)qword_1ED902DF0, a1);
}

uint64_t sub_1CFAF605C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902F40);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902F40);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "checkHSA2";
  *(_QWORD *)(v1 + 8) = 9;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.checkHSA2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903278, (uint64_t)qword_1ED902F40, a1);
}

uint64_t sub_1CFAF6140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902EF8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902EF8);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "checkHSA2.getAuthKitAccount";
  *(_QWORD *)(v1 + 8) = 27;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.checkHSA2GetAuthKitAccount.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903250, (uint64_t)qword_1ED902EF8, a1);
}

uint64_t sub_1CFAF6224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6230);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6230);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "secItemCopyMatching";
  *(_QWORD *)(v1 + 8) = 19;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.secItemCopyMatching.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD638, (uint64_t)qword_1EFBC6230, a1);
}

uint64_t sub_1CFAF6308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6248);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6248);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "createClientGUIDFactory";
  *(_QWORD *)(v1 + 8) = 23;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.createClientGUIDFactory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD640, (uint64_t)qword_1EFBC6248, a1);
}

uint64_t sub_1CFAF63EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6260);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6260);
  if (qword_1ED904038 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907528);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "performVisionRequests";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.performVisionRequests.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD648, (uint64_t)qword_1EFBC6260, a1);
}

uint64_t sub_1CFAF64D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902EB0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902EB0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "warmup.deviceLocked";
  *(_QWORD *)(v1 + 8) = 19;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.warmupDeviceLocked.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903240, (uint64_t)qword_1ED902EB0, a1);
}

uint64_t sub_1CFAF65B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902EE0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902EE0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "warmup.deviceUnlocked";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.warmupDeviceUnlocked.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903248, (uint64_t)qword_1ED902EE0, a1);
}

uint64_t sub_1CFAF6698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED9033E8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED9033E8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "warmup.buddyFlow";
  *(_QWORD *)(v1 + 8) = 16;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.warmupBuddyFlow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903640, (uint64_t)qword_1ED9033E8, a1);
}

uint64_t sub_1CFAF677C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED902E80);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED902E80);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "warmup.assessment";
  *(_QWORD *)(v1 + 8) = 17;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.warmupAssessment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED903228, (uint64_t)qword_1ED902E80, a1);
}

uint64_t sub_1CFAF6860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6278);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6278);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "warmup.baa";
  *(_QWORD *)(v1 + 8) = 10;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.warmupBAA.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(qword_1EFBBD650, (uint64_t)qword_1EFBC6278, a1);
}

uint64_t sub_1CFAF6944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1ED904C68);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED904C68);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.tiberius.beforeConfigure";
  *(_QWORD *)(v1 + 8) = 34;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureTiberiusBeforeConfigure.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1ED904C88, (uint64_t)qword_1ED904C68, a1);
}

uint64_t sub_1CFAF6A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6290);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6290);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "configure.tiberius.configure";
  *(_QWORD *)(v1 + 8) = 28;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.configureTiberiusCofigure.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD660, (uint64_t)qword_1EFBC6290, a1);
}

uint64_t sub_1CFAF6B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC62A8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC62A8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.tiberius.fetchAssessment";
  *(_QWORD *)(v1 + 8) = 46;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.tiberiusGetVerificationResultFetchAssessment.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD668, (uint64_t)qword_1EFBC62A8, a1);
}

uint64_t sub_1CFAF6BF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC62C0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC62C0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.tiberius.callTopeka";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.tiberiusGetVerificationResultCallTopeka.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD670, (uint64_t)qword_1EFBC62C0, a1);
}

uint64_t sub_1CFAF6CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC62D8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC62D8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "getVerificationResult.tiberius.topekaTimeout";
  *(_QWORD *)(v1 + 8) = 44;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 0;
  return result;
}

uint64_t static DaemonSignposts.tiberiusGetVerificationResultTopekaTimeout.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD678, (uint64_t)qword_1EFBC62D8, a1);
}

uint64_t sub_1CFAF6DB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC62F0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC62F0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityDynamicWorkflow.total";
  *(_QWORD *)(v1 + 8) = 34;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityDynamicWorkflowTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD680, (uint64_t)qword_1EFBC62F0, a1);
}

uint64_t sub_1CFAF6EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6308);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6308);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityDynamicWorkflow.request";
  *(_QWORD *)(v1 + 8) = 36;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityDynamicWorkflowRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD688, (uint64_t)qword_1EFBC6308, a1);
}

uint64_t sub_1CFAF6F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6320);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6320);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticWorkflow.total";
  *(_QWORD *)(v1 + 8) = 33;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticWorkflowTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD690, (uint64_t)qword_1EFBC6320, a1);
}

uint64_t sub_1CFAF7070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6338);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6338);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticWorkflow.request";
  *(_QWORD *)(v1 + 8) = 35;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticWorkflowRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD698, (uint64_t)qword_1EFBC6338, a1);
}

uint64_t sub_1CFAF7158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6350);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6350);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticAsset.total";
  *(_QWORD *)(v1 + 8) = 30;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticAssetTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6A0, (uint64_t)qword_1EFBC6350, a1);
}

uint64_t sub_1CFAF7240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6368);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6368);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticAsset.request";
  *(_QWORD *)(v1 + 8) = 32;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticAssetRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6A8, (uint64_t)qword_1EFBC6368, a1);
}

uint64_t sub_1CFAF7328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6380);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6380);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticTC.total";
  *(_QWORD *)(v1 + 8) = 27;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticTCTotal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6B0, (uint64_t)qword_1EFBC6380, a1);
}

uint64_t sub_1CFAF7410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6398);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6398);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "fetchIdentityStaticTC.request";
  *(_QWORD *)(v1 + 8) = 29;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.fetchIdentityStaticTCRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6B8, (uint64_t)qword_1EFBC6398, a1);
}

uint64_t sub_1CFAF74F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC63B0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC63B0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "canRequestDocument.total";
  *(_QWORD *)(v1 + 8) = 24;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.canRequestDocument.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6C0, (uint64_t)qword_1EFBC63B0, a1);
}

uint64_t sub_1CFAF75E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC63C8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC63C8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.total";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocument.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6C8, (uint64_t)qword_1EFBC63C8, a1);
}

uint64_t sub_1CFAF76C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC63E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC63E0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.preAuthorization";
  *(_QWORD *)(v1 + 8) = 32;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentPreAuthorization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6D0, (uint64_t)qword_1EFBC63E0, a1);
}

uint64_t sub_1CFAF77B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC63F8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC63F8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.preAuthorization.createProposal";
  *(_QWORD *)(v1 + 8) = 47;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentCreateProposal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6D8, (uint64_t)qword_1EFBC63F8, a1);
}

uint64_t sub_1CFAF7898()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6410);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6410);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.preAuthorization.initializeLA";
  *(_QWORD *)(v1 + 8) = 45;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentLocalAuthentication.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6E0, (uint64_t)qword_1EFBC6410, a1);
}

uint64_t sub_1CFAF7980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6428);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6428);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.preAuthorization.buildUIConfiguration";
  *(_QWORD *)(v1 + 8) = 53;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentBuildUIConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6E8, (uint64_t)qword_1EFBC6428, a1);
}

uint64_t sub_1CFAF7A68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6440);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6440);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.preAuthorization.checkBiometricsStatus";
  *(_QWORD *)(v1 + 8) = 54;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentCheckBiometricsStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6F0, (uint64_t)qword_1EFBC6440, a1);
}

uint64_t sub_1CFAF7B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6458);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6458);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.postAuthorization";
  *(_QWORD *)(v1 + 8) = 33;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentPostAuthorization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD6F8, (uint64_t)qword_1EFBC6458, a1);
}

uint64_t sub_1CFAF7C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6470);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6470);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.postAuthorization.buildResponse";
  *(_QWORD *)(v1 + 8) = 47;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentBuildResponse.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD700, (uint64_t)qword_1EFBC6470, a1);
}

uint64_t sub_1CFAF7D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6488);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6488);
  if (qword_1EFBBD4A0 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFBED2A0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.UI";
  *(_QWORD *)(v1 + 8) = 18;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentUI.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD708, (uint64_t)qword_1EFBC6488, a1);
}

uint64_t sub_1CFAF7E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC64A0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC64A0);
  if (qword_1EFBBD4A0 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFBED2A0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "requestDocument.sheet";
  *(_QWORD *)(v1 + 8) = 21;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.requestDocumentSheet.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD710, (uint64_t)qword_1EFBC64A0, a1);
}

uint64_t sub_1CFAF7EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC64B8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC64B8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "uploadAssets.total";
  *(_QWORD *)(v1 + 8) = 18;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.uploadAssetsAPI.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD718, (uint64_t)qword_1EFBC64B8, a1);
}

uint64_t sub_1CFAF7FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC64D0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC64D0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.identityKey.secureElementStatus";
  *(_QWORD *)(v1 + 8) = 52;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.identityKeySecureElementStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD720, (uint64_t)qword_1EFBC64D0, a1);
}

uint64_t sub_1CFAF80C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC64E8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC64E8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.identityKey.status";
  *(_QWORD *)(v1 + 8) = 39;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.identityKeyStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD728, (uint64_t)qword_1EFBC64E8, a1);
}

uint64_t sub_1CFAF81A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6500);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6500);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.identityKey.generate";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.generateIdentityKey.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD730, (uint64_t)qword_1EFBC6500, a1);
}

uint64_t sub_1CFAF8290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6518);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6518);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.identityKey.store";
  *(_QWORD *)(v1 + 8) = 38;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.storeIdentityKey.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD738, (uint64_t)qword_1EFBC6518, a1);
}

uint64_t sub_1CFAF8378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6530);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6530);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.session.status";
  *(_QWORD *)(v1 + 8) = 35;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.sessionStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD740, (uint64_t)qword_1EFBC6530, a1);
}

uint64_t sub_1CFAF8460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6548);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6548);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.session.identityKeyStatus";
  *(_QWORD *)(v1 + 8) = 46;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.sessionIdentityKeyStatus.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD748, (uint64_t)qword_1EFBC6548, a1);
}

uint64_t sub_1CFAF8548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6560);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6560);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.session.terminalRegistration";
  *(_QWORD *)(v1 + 8) = 49;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.sessionTerminalRegistration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD750, (uint64_t)qword_1EFBC6560, a1);
}

uint64_t sub_1CFAF8630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6578);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6578);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.session.fetchLogo";
  *(_QWORD *)(v1 + 8) = 38;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.sessionFetchLogo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD758, (uint64_t)qword_1EFBC6578, a1);
}

uint64_t sub_1CFAF8718()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6590);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6590);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.session.store";
  *(_QWORD *)(v1 + 8) = 34;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.storeSession.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD760, (uint64_t)qword_1EFBC6590, a1);
}

uint64_t sub_1CFAF8800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC65A8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC65A8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.canRead";
  *(_QWORD *)(v1 + 8) = 41;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.canReadDocument.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD768, (uint64_t)qword_1EFBC65A8, a1);
}

uint64_t sub_1CFAF88E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC65C0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC65C0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.start";
  *(_QWORD *)(v1 + 8) = 39;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.startReadDocument.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD770, (uint64_t)qword_1EFBC65C0, a1);
}

uint64_t sub_1CFAF89D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC65D8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC65D8);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.buildRequest";
  *(_QWORD *)(v1 + 8) = 46;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.buildRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD778, (uint64_t)qword_1EFBC65D8, a1);
}

uint64_t sub_1CFAF8AB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC65F0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC65F0);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.signRequest";
  *(_QWORD *)(v1 + 8) = 45;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.signRequest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD780, (uint64_t)qword_1EFBC65F0, a1);
}

uint64_t sub_1CFAF8BA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6608);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6608);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.validateResponse";
  *(_QWORD *)(v1 + 8) = 50;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.validateResponse.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD788, (uint64_t)qword_1EFBC6608, a1);
}

uint64_t sub_1CFAF8C88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6620);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6620);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "mobileDocumentReader.readDocument.parseResponse";
  *(_QWORD *)(v1 + 8) = 47;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.MobileDocumentReader.parseResponse.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD790, (uint64_t)qword_1EFBC6620, a1);
}

uint64_t sub_1CFAF8D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6638);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6638);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "vical.loadDocument";
  *(_QWORD *)(v1 + 8) = 18;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.VICAL.loadDocument.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD798, (uint64_t)qword_1EFBC6638, a1);
}

uint64_t sub_1CFAF8E58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6650);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6650);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "krl.fetch";
  *(_QWORD *)(v1 + 8) = 9;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.KRL.fetchRevocationList.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD7A0, (uint64_t)qword_1EFBC6650, a1);
}

uint64_t sub_1CFAF8F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = type metadata accessor for DIPSignpost.Config(0);
  __swift_allocate_value_buffer(v0, qword_1EFBC6668);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EFBC6668);
  if (qword_1ED904048 != -1)
    swift_once();
  v2 = sub_1CFB012CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED907558);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1 + *(int *)(v0 + 20), v3, v2);
  *(_QWORD *)v1 = "krl.process";
  *(_QWORD *)(v1 + 8) = 11;
  *(_BYTE *)(v1 + 16) = 2;
  *(_BYTE *)(v1 + *(int *)(v0 + 24)) = 1;
  return result;
}

uint64_t static DaemonSignposts.KRL.processResponse.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF94F2F8(&qword_1EFBBD7A8, (uint64_t)qword_1EFBC6668, a1);
}

ValueMetadata *type metadata accessor for DaemonSignposts()
{
  return &type metadata for DaemonSignposts;
}

ValueMetadata *type metadata accessor for DaemonSignposts.MobileDocumentReader()
{
  return &type metadata for DaemonSignposts.MobileDocumentReader;
}

ValueMetadata *type metadata accessor for DaemonSignposts.VICAL()
{
  return &type metadata for DaemonSignposts.VICAL;
}

ValueMetadata *type metadata accessor for DaemonSignposts.KRL()
{
  return &type metadata for DaemonSignposts.KRL;
}

id StoredBiomeMetadata.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredBiomeMetadata.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredBiomeMetadata();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredBiomeMetadata()
{
  return objc_opt_self();
}

id StoredBiomeMetadata.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredBiomeMetadata();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredBiomeMetadata.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAF9230()
{
  return MEMORY[0x1E0DEA528];
}

void sub_1CFAF923C(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1CFB01A28();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_1CFAF929C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = sub_1CFB01A04();
  else
    v7 = 0;
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_1CFAF92F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredBiomeMetadata();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_axSettings()
{
  return sel_axSettings;
}

id sub_1CFAF9344@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_axSettings);
  *a2 = result;
  return result;
}

id sub_1CFAF937C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAxSettings_, *a1);
}

char *keypath_get_selector_deviceLanguage()
{
  return sel_deviceLanguage;
}

void sub_1CFAF939C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_deviceLanguage, a2);
}

void sub_1CFAF93B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setDeviceLanguage_);
}

char *keypath_get_selector_didStepUp()
{
  return sel_didStepUp;
}

id sub_1CFAF93E0@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_didStepUp);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAF9410(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDidStepUp_, *a1);
}

char *keypath_get_selector_dob()
{
  return sel_dob;
}

void sub_1CFAF9430(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_dob, a2);
}

void sub_1CFAF944C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setDob_);
}

char *keypath_get_selector_ethnicity()
{
  return sel_ethnicity;
}

void sub_1CFAF9474(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_ethnicity, a2);
}

void sub_1CFAF9490(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setEthnicity_);
}

char *keypath_get_selector_facePoseVersion()
{
  return sel_facePoseVersion;
}

void sub_1CFAF94B8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_facePoseVersion, a2);
}

void sub_1CFAF94D4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setFacePoseVersion_);
}

char *keypath_get_selector_facVersion()
{
  return sel_facVersion;
}

void sub_1CFAF94FC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_facVersion, a2);
}

void sub_1CFAF9518(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setFacVersion_);
}

char *keypath_get_selector_gender()
{
  return sel_gender;
}

void sub_1CFAF9540(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_gender, a2);
}

void sub_1CFAF955C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setGender_);
}

char *keypath_get_selector_gestureAssessment()
{
  return sel_gestureAssessment;
}

id sub_1CFAF9584@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_gestureAssessment);
  *a2 = result;
  return result;
}

id sub_1CFAF95B4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGestureAssessment_, *a1);
}

char *keypath_get_selector_issuer()
{
  return sel_issuer;
}

void sub_1CFAF95D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_issuer, a2);
}

void sub_1CFAF95F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setIssuer_);
}

char *keypath_get_selector_livenessAssessment()
{
  return sel_livenessAssessment;
}

id sub_1CFAF9618@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_livenessAssessment);
  *a2 = result;
  return result;
}

id sub_1CFAF9648(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLivenessAssessment_, *a1);
}

char *keypath_get_selector_padtoolVersion()
{
  return sel_padtoolVersion;
}

void sub_1CFAF9668(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_padtoolVersion, a2);
}

void sub_1CFAF9684(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPadtoolVersion_);
}

char *keypath_get_selector_passiveGestureAssessment()
{
  return sel_passiveGestureAssessment;
}

id sub_1CFAF96AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_passiveGestureAssessment);
  *a2 = result;
  return result;
}

id sub_1CFAF96DC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPassiveGestureAssessment_, *a1);
}

char *keypath_get_selector_passiveLivenessAssessment()
{
  return sel_passiveLivenessAssessment;
}

id sub_1CFAF96FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_passiveLivenessAssessment);
  *a2 = result;
  return result;
}

id sub_1CFAF972C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPassiveLivenessAssessment_, *a1);
}

char *keypath_get_selector_passiveLivenessFacePoseVersion()
{
  return sel_passiveLivenessFacePoseVersion;
}

void sub_1CFAF974C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_passiveLivenessFacePoseVersion, a2);
}

void sub_1CFAF9768(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPassiveLivenessFacePoseVersion_);
}

char *keypath_get_selector_passiveLivenessFacVersion()
{
  return sel_passiveLivenessFacVersion;
}

void sub_1CFAF9790(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_passiveLivenessFacVersion, a2);
}

void sub_1CFAF97AC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPassiveLivenessFacVersion_);
}

char *keypath_get_selector_passiveLivenessPadtoolVersion()
{
  return sel_passiveLivenessPadtoolVersion;
}

void sub_1CFAF97D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_passiveLivenessPadtoolVersion, a2);
}

void sub_1CFAF97F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPassiveLivenessPadtoolVersion_);
}

char *keypath_get_selector_passiveLivenessPrdVersion()
{
  return sel_passiveLivenessPrdVersion;
}

void sub_1CFAF9818(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_passiveLivenessPrdVersion, a2);
}

void sub_1CFAF9834(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPassiveLivenessPrdVersion_);
}

char *keypath_get_selector_prdVersion()
{
  return sel_prdVersion;
}

void sub_1CFAF985C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_prdVersion, a2);
}

void sub_1CFAF9878(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPrdVersion_);
}

char *keypath_get_selector_proofingSessionID()
{
  return sel_proofingSessionID;
}

void sub_1CFAF98A0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_proofingSessionID, a2);
}

void sub_1CFAF98BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProofingSessionID_);
}

char *keypath_get_selector_shouldDonateProofingDecision()
{
  return sel_shouldDonateProofingDecision;
}

id sub_1CFAF98E4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldDonateProofingDecision);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAF9914(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldDonateProofingDecision_, *a1);
}

char *keypath_get_selector_skinTone()
{
  return sel_skinTone;
}

id sub_1CFAF9934@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_skinTone);
  *a2 = result;
  return result;
}

id sub_1CFAF9964(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSkinTone_, *a1);
}

id StoredAuthACL.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredAuthACL.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredAuthACL();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredAuthACL()
{
  return objc_opt_self();
}

id StoredAuthACL.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredAuthACL();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredAuthACL.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAF9B34(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1CFB00E7C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_1CFAF9B94(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_1CFB00E58();
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

void sub_1CFAF9BF8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB01A28();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAF9C5C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1CFB01A04();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setIdentifier_);

}

uint64_t sub_1CFAF9CB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredAuthACL();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_aclType()
{
  return sel_aclType;
}

id sub_1CFAF9D04@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_aclType);
  *a2 = result;
  return result;
}

id sub_1CFAF9D34(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAclType_, *a1);
}

char *keypath_get_selector_credentialUUIDs()
{
  return sel_credentialUUIDs;
}

void sub_1CFAF9D54(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_credentialUUIDs, a2);
}

void sub_1CFAF9D70(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setCredentialUUIDs_);
}

char *keypath_get_selector_designationStatus()
{
  return sel_designationStatus;
}

id sub_1CFAF9D98@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_designationStatus);
  *a2 = (_WORD)result;
  return result;
}

id sub_1CFAF9DC8(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDesignationStatus_, *a1);
}

char *keypath_get_selector_encryptedACL()
{
  return sel_encryptedACL;
}

void sub_1CFAF9DE8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_encryptedACL, a2);
}

void sub_1CFAF9E04(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setEncryptedACL_);
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

char *keypath_get_selector_version()
{
  return sel_version;
}

id sub_1CFAF9E40@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_version);
  *a2 = (_WORD)result;
  return result;
}

id sub_1CFAF9E70(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVersion_, *a1);
}

char *keypath_get_selector_progenitorKey()
{
  return sel_progenitorKey;
}

id sub_1CFAF9E90@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_progenitorKey);
  *a2 = result;
  return result;
}

id sub_1CFAF9EC8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProgenitorKey_, *a1);
}

id StoredCredential.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredCredential.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredCredential();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredCredential()
{
  return objc_opt_self();
}

id StoredCredential.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredCredential();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredCredential.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFA09C@<X0>(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    sub_1CFB00F30();

    v6 = sub_1CFB00F54();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 0;
  }
  else
  {
    v6 = sub_1CFB00F54();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

void sub_1CFAFA11C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
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
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904838);
  MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF9C1B08(a1, (uint64_t)v17);
  v18 = *a2;
  v19 = sub_1CFB00F54();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19) != 1)
  {
    v21 = (void *)sub_1CFB00EF4();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
  }
  objc_msgSend(v18, *a5, v21);

}

uint64_t sub_1CFAFA1F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredCredential();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_createdAt()
{
  return sel_createdAt;
}

uint64_t sub_1CFAFA244@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_createdAt, a2);
}

void sub_1CFAFA260(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setCreatedAt_);
}

char *keypath_get_selector_credentialIdentifier()
{
  return sel_credentialIdentifier;
}

void sub_1CFAFA288(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_credentialIdentifier, a2);
}

void sub_1CFAFA2A4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setCredentialIdentifier_);
}

char *keypath_get_selector_partition()
{
  return sel_partition;
}

void sub_1CFAFA2CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_partition, a2);
}

void sub_1CFAFA2E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPartition_);
}

char *keypath_get_selector_state()
{
  return sel_state;
}

id sub_1CFAFA310@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_state);
  *a2 = result;
  return result;
}

id sub_1CFAFA340(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setState_, *a1);
}

char *keypath_get_selector_updatedAt()
{
  return sel_updatedAt;
}

uint64_t sub_1CFAFA360@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_updatedAt, a2);
}

void sub_1CFAFA37C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setUpdatedAt_);
}

char *keypath_get_selector_cryptoKeys()
{
  return sel_cryptoKeys;
}

id sub_1CFAFA3A4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_cryptoKeys);
  *a2 = result;
  return result;
}

id sub_1CFAFA3DC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCryptoKeys_, *a1);
}

char *keypath_get_selector_options()
{
  return sel_options;
}

id sub_1CFAFA3FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_options);
  *a2 = result;
  return result;
}

id sub_1CFAFA434(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOptions_, *a1);
}

char *keypath_get_selector_payloads()
{
  return sel_payloads;
}

id sub_1CFAFA454@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_payloads);
  *a2 = result;
  return result;
}

id sub_1CFAFA48C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPayloads_, *a1);
}

id StoredCredentialOptions.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredCredentialOptions.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredCredentialOptions();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredCredentialOptions()
{
  return objc_opt_self();
}

id StoredCredentialOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredCredentialOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredCredentialOptions.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFA660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredCredentialOptions();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_deleteInactiveKeysAfterDays()
{
  return sel_deleteInactiveKeysAfterDays;
}

id sub_1CFAFA6AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_deleteInactiveKeysAfterDays);
  *a2 = result;
  return result;
}

id sub_1CFAFA6DC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeleteInactiveKeysAfterDays_, *a1);
}

char *keypath_get_selector_deleteIncompleteCredentialAfterDays()
{
  return sel_deleteIncompleteCredentialAfterDays;
}

id sub_1CFAFA6FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_deleteIncompleteCredentialAfterDays);
  *a2 = result;
  return result;
}

id sub_1CFAFA72C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeleteIncompleteCredentialAfterDays_, *a1);
}

char *keypath_get_selector_payloadProtectionPolicy()
{
  return sel_payloadProtectionPolicy;
}

id sub_1CFAFA74C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_payloadProtectionPolicy);
  *a2 = result;
  return result;
}

id sub_1CFAFA77C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPayloadProtectionPolicy_, *a1);
}

char *keypath_get_selector_presentmentAuthPolicy()
{
  return sel_presentmentAuthPolicy;
}

id sub_1CFAFA79C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_presentmentAuthPolicy);
  *a2 = result;
  return result;
}

id sub_1CFAFA7CC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentmentAuthPolicy_, *a1);
}

char *keypath_get_selector_readerAuthenticationPolicy()
{
  return sel_readerAuthenticationPolicy;
}

id sub_1CFAFA7EC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_readerAuthenticationPolicy);
  *a2 = result;
  return result;
}

id sub_1CFAFA81C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setReaderAuthenticationPolicy_, *a1);
}

char *keypath_get_selector_credential()
{
  return sel_credential;
}

id sub_1CFAFA83C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_credential);
  *a2 = result;
  return result;
}

id sub_1CFAFA874(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCredential_, *a1);
}

id StoredCryptoKey.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredCryptoKey.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredCryptoKey();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredCryptoKey()
{
  return objc_opt_self();
}

id StoredCryptoKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredCryptoKey();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredCryptoKey.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFAA48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredCryptoKey();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_attestation()
{
  return sel_attestation;
}

void sub_1CFAFAA94(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_attestation, a2);
}

void sub_1CFAFAAB0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setAttestation_);
}

char *keypath_get_selector_attestationSignature()
{
  return sel_attestationSignature;
}

void sub_1CFAFAAD8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_attestationSignature, a2);
}

void sub_1CFAFAAF4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setAttestationSignature_);
}

uint64_t sub_1CFAFAB10@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_createdAt, a2);
}

void sub_1CFAFAB2C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setCreatedAt_);
}

void sub_1CFAFAB48(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_identifier, a2);
}

void sub_1CFAFAB64(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setIdentifier_);
}

char *keypath_get_selector_keyBlob()
{
  return sel_keyBlob;
}

void sub_1CFAFAB8C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_keyBlob, a2);
}

void sub_1CFAFABA8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setKeyBlob_);
}

char *keypath_get_selector_keySlot()
{
  return sel_keySlot;
}

id sub_1CFAFABD0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_keySlot);
  *a2 = result;
  return result;
}

id sub_1CFAFAC00(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeySlot_, *a1);
}

char *keypath_get_selector_keyType()
{
  return sel_keyType;
}

void sub_1CFAFAC20(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_keyType, a2);
}

void sub_1CFAFAC3C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setKeyType_);
}

char *keypath_get_selector_publicKey()
{
  return sel_publicKey;
}

void sub_1CFAFAC64(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_publicKey, a2);
}

void sub_1CFAFAC80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setPublicKey_);
}

char *keypath_get_selector_publicKeyIdentifier()
{
  return sel_publicKeyIdentifier;
}

void sub_1CFAFACA8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_publicKeyIdentifier, a2);
}

void sub_1CFAFACC4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setPublicKeyIdentifier_);
}

char *keypath_get_selector_timesUsed()
{
  return sel_timesUsed;
}

id sub_1CFAFACEC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_timesUsed);
  *a2 = result;
  return result;
}

id sub_1CFAFAD1C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTimesUsed_, *a1);
}

uint64_t sub_1CFAFAD30@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_updatedAt, a2);
}

void sub_1CFAFAD4C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setUpdatedAt_);
}

char *keypath_get_selector_usage()
{
  return sel_usage;
}

void sub_1CFAFAD74(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_usage, a2);
}

void sub_1CFAFAD90(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setUsage_);
}

id sub_1CFAFADAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_credential);
  *a2 = result;
  return result;
}

id sub_1CFAFADE4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCredential_, *a1);
}

char *keypath_get_selector_payload()
{
  return sel_payload;
}

id sub_1CFAFAE04@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_payload);
  *a2 = result;
  return result;
}

id sub_1CFAFAE3C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPayload_, *a1);
}

char *keypath_get_selector_progenitorAuthACL()
{
  return sel_progenitorAuthACL;
}

id sub_1CFAFAE5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_progenitorAuthACL);
  *a2 = result;
  return result;
}

id sub_1CFAFAE94(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProgenitorAuthACL_, *a1);
}

char *keypath_get_selector_protectedPayload()
{
  return sel_protectedPayload;
}

id sub_1CFAFAEB4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_protectedPayload);
  *a2 = result;
  return result;
}

id sub_1CFAFAEEC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProtectedPayload_, *a1);
}

char *keypath_get_selector_relyingParties()
{
  return sel_relyingParties;
}

id sub_1CFAFAF0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_relyingParties);
  *a2 = result;
  return result;
}

id sub_1CFAFAF44(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRelyingParties_, *a1);
}

id StoredPayload.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredPayload.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredPayload();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredPayload()
{
  return objc_opt_self();
}

id StoredPayload.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredPayload();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredPayload.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFB114@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredPayload();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

uint64_t sub_1CFAFB154@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_createdAt, a2);
}

void sub_1CFAFB170(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setCreatedAt_);
}

char *keypath_get_selector_docType()
{
  return sel_docType;
}

void sub_1CFAFB198(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_docType, a2);
}

void sub_1CFAFB1B4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setDocType_);
}

char *keypath_get_selector_elementIdentifiersByNamespace()
{
  return sel_elementIdentifiersByNamespace;
}

void sub_1CFAFB1DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_elementIdentifiersByNamespace, a2);
}

void sub_1CFAFB1F8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setElementIdentifiersByNamespace_);
}

char *keypath_get_selector_format()
{
  return sel_format;
}

id sub_1CFAFB220@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_format);
  *a2 = result;
  return result;
}

id sub_1CFAFB250(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFormat_, *a1);
}

char *keypath_get_selector_ingestionHash()
{
  return sel_ingestionHash;
}

void sub_1CFAFB270(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_ingestionHash, a2);
}

void sub_1CFAFB28C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setIngestionHash_);
}

char *keypath_get_selector_issuingJurisdiction()
{
  return sel_issuingJurisdiction;
}

void sub_1CFAFB2B4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_issuingJurisdiction, a2);
}

void sub_1CFAFB2D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setIssuingJurisdiction_);
}

char *keypath_get_selector_payloadData()
{
  return sel_payloadData;
}

void sub_1CFAFB2F8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_payloadData, a2);
}

void sub_1CFAFB314(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setPayloadData_);
}

char *keypath_get_selector_protectionType()
{
  return sel_protectionType;
}

id sub_1CFAFB33C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_protectionType);
  *a2 = result;
  return result;
}

id sub_1CFAFB36C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProtectionType_, *a1);
}

char *keypath_get_selector_region()
{
  return sel_region;
}

void sub_1CFAFB38C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_region, a2);
}

void sub_1CFAFB3A8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setRegion_);
}

uint64_t sub_1CFAFB3C4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_updatedAt, a2);
}

void sub_1CFAFB3E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setUpdatedAt_);
}

char *keypath_get_selector_validFrom()
{
  return sel_validFrom;
}

uint64_t sub_1CFAFB408@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_validFrom, a2);
}

void sub_1CFAFB424(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setValidFrom_);
}

char *keypath_get_selector_validUntil()
{
  return sel_validUntil;
}

uint64_t sub_1CFAFB44C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_validUntil, a2);
}

void sub_1CFAFB468(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setValidUntil_);
}

id sub_1CFAFB484@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_credential);
  *a2 = result;
  return result;
}

id sub_1CFAFB4BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCredential_, *a1);
}

char *keypath_get_selector_payloadProtectionKey()
{
  return sel_payloadProtectionKey;
}

id sub_1CFAFB4DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_payloadProtectionKey);
  *a2 = result;
  return result;
}

id sub_1CFAFB514(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPayloadProtectionKey_, *a1);
}

char *keypath_get_selector_presentmentKey()
{
  return sel_presentmentKey;
}

id sub_1CFAFB534@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_presentmentKey);
  *a2 = result;
  return result;
}

id sub_1CFAFB56C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentmentKey_, *a1);
}

id StoredTrustKey.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredTrustKey.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredTrustKey();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredTrustKey()
{
  return objc_opt_self();
}

id StoredTrustKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredTrustKey();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredTrustKey.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFB748(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_pairingID);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB01A28();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFB7AC(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1CFB01A04();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setPairingID_);

}

void sub_1CFAFB808(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_protectedPublicKey);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB00E7C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFB86C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_1CFB00E58();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setProtectedPublicKey_);

}

uint64_t sub_1CFAFB8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredTrustKey();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_pairingID()
{
  return sel_pairingID;
}

char *keypath_get_selector_protectedPublicKey()
{
  return sel_protectedPublicKey;
}

id StoredRelyingParty.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredRelyingParty.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredRelyingParty();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredRelyingParty()
{
  return objc_opt_self();
}

id StoredRelyingParty.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredRelyingParty();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredRelyingParty.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFBAFC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_relyingPartyIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB01A28();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFBB60(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1CFB01A04();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setRelyingPartyIdentifier_);

}

uint64_t sub_1CFAFBBBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredRelyingParty();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_relyingPartyIdentifier()
{
  return sel_relyingPartyIdentifier;
}

char *keypath_get_selector_presentmentKeys()
{
  return sel_presentmentKeys;
}

id sub_1CFAFBC1C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_presentmentKeys);
  *a2 = result;
  return result;
}

id sub_1CFAFBC54(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentmentKeys_, *a1);
}

id StoredMobileDocumentReaderApplicationInstallation.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredMobileDocumentReaderApplicationInstallation.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderApplicationInstallation();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredMobileDocumentReaderApplicationInstallation()
{
  return objc_opt_self();
}

id StoredMobileDocumentReaderApplicationInstallation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderApplicationInstallation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredMobileDocumentReaderApplicationInstallation.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFBE28(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_applicationIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB01A28();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFBE8C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1CFB01A04();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setApplicationIdentifier_);

}

uint64_t sub_1CFAFBEE8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_installationIdentifier);
  if (v3)
  {
    v4 = v3;
    sub_1CFB00F78();

    v5 = sub_1CFB00F9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_1CFB00F9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_1CFAFBF6C(uint64_t a1, void **a2)
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBC6680);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFAFC1B8(a1, (uint64_t)v13);
  v14 = *a2;
  v15 = sub_1CFB00F9C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    v17 = (void *)sub_1CFB00F6C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }
  objc_msgSend(v14, sel_setInstallationIdentifier_, v17);

}

uint64_t sub_1CFAFC048@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredMobileDocumentReaderApplicationInstallation();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_applicationIdentifier()
{
  return sel_applicationIdentifier;
}

char *keypath_get_selector_installationIdentifier()
{
  return sel_installationIdentifier;
}

char *keypath_get_selector_attestationCertificate()
{
  return sel_attestationCertificate;
}

id sub_1CFAFC0BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_attestationCertificate);
  *a2 = result;
  return result;
}

id sub_1CFAFC0F4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAttestationCertificate_, *a1);
}

char *keypath_get_selector_authenticationCertificates()
{
  return sel_authenticationCertificates;
}

id sub_1CFAFC114@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_authenticationCertificates);
  *a2 = result;
  return result;
}

id sub_1CFAFC14C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAuthenticationCertificates_, *a1);
}

char *keypath_get_selector_signingKeys()
{
  return sel_signingKeys;
}

id sub_1CFAFC16C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_signingKeys);
  *a2 = result;
  return result;
}

id sub_1CFAFC1A4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSigningKeys_, *a1);
}

uint64_t sub_1CFAFC1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBC6680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id StoredMobileDocumentReaderAttestationCertificate.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredMobileDocumentReaderAttestationCertificate.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderAttestationCertificate();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredMobileDocumentReaderAttestationCertificate()
{
  return objc_opt_self();
}

id StoredMobileDocumentReaderAttestationCertificate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderAttestationCertificate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredMobileDocumentReaderAttestationCertificate.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFC3C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_certificateData);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB00E7C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFC424(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_1CFB00E58();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setCertificateData_);

}

uint64_t sub_1CFAFC488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredMobileDocumentReaderAttestationCertificate();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_certificateData()
{
  return sel_certificateData;
}

char *keypath_get_selector_applicationInstallation()
{
  return sel_applicationInstallation;
}

id sub_1CFAFC4E8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_applicationInstallation);
  *a2 = result;
  return result;
}

id sub_1CFAFC520(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setApplicationInstallation_, *a1);
}

char *keypath_get_selector_signingKey()
{
  return sel_signingKey;
}

id sub_1CFAFC540@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_signingKey);
  *a2 = result;
  return result;
}

id sub_1CFAFC578(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSigningKey_, *a1);
}

id StoredMobileDocumentReaderAuthenticationCertificate.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredMobileDocumentReaderAuthenticationCertificate.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderAuthenticationCertificate();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredMobileDocumentReaderAuthenticationCertificate()
{
  return objc_opt_self();
}

id StoredMobileDocumentReaderAuthenticationCertificate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderAuthenticationCertificate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredMobileDocumentReaderAuthenticationCertificate.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFC74C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_merchantLogo);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB00E7C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFC7B0(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_1CFB00E58();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setMerchantLogo_);

}

void sub_1CFAFC814(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_sessionIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB01A28();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFC878(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1CFB01A04();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setSessionIdentifier_);

}

uint64_t sub_1CFAFC8D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredMobileDocumentReaderAuthenticationCertificate();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_certificateChain()
{
  return sel_certificateChain;
}

id sub_1CFAFC920@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_certificateChain);
  *a2 = result;
  return result;
}

id sub_1CFAFC958(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCertificateChain_, *a1);
}

char *keypath_get_selector_merchantLogo()
{
  return sel_merchantLogo;
}

char *keypath_get_selector_sessionIdentifier()
{
  return sel_sessionIdentifier;
}

id sub_1CFAFC994@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_applicationInstallation);
  *a2 = result;
  return result;
}

id sub_1CFAFC9CC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setApplicationInstallation_, *a1);
}

id sub_1CFAFC9E0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_signingKey);
  *a2 = result;
  return result;
}

id sub_1CFAFCA18(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSigningKey_, *a1);
}

id StoredMobileDocumentReaderSigningKey.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredMobileDocumentReaderSigningKey.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderSigningKey();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredMobileDocumentReaderSigningKey()
{
  return objc_opt_self();
}

id StoredMobileDocumentReaderSigningKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredMobileDocumentReaderSigningKey();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredMobileDocumentReaderSigningKey.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_1CFAFCBEC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_keyBlob);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1CFB00E7C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1CFAFCC50(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_1CFB00E58();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setKeyBlob_);

}

uint64_t sub_1CFAFCCB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredMobileDocumentReaderSigningKey();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

id sub_1CFAFCCFC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_applicationInstallation);
  *a2 = result;
  return result;
}

id sub_1CFAFCD34(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setApplicationInstallation_, *a1);
}

char *keypath_get_selector_attestationCertificates()
{
  return sel_attestationCertificates;
}

id sub_1CFAFCD54@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_attestationCertificates);
  *a2 = result;
  return result;
}

id sub_1CFAFCD8C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAttestationCertificates_, *a1);
}

id sub_1CFAFCDA0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_authenticationCertificates);
  *a2 = result;
  return result;
}

id sub_1CFAFCDD8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAuthenticationCertificates_, *a1);
}

id StoredPrearmTrust.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredPrearmTrust.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredPrearmTrust();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredPrearmTrust()
{
  return objc_opt_self();
}

id StoredPrearmTrust.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredPrearmTrust();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredPrearmTrust.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFCFB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredPrearmTrust();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_baaCertificate()
{
  return sel_baaCertificate;
}

void sub_1CFAFCFFC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_baaCertificate, a2);
}

void sub_1CFAFD018(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setBaaCertificate_);
}

void sub_1CFAFD034(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_keyBlob, a2);
}

void sub_1CFAFD050(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setKeyBlob_);
}

char *keypath_get_selector_requiresDeletion()
{
  return sel_requiresDeletion;
}

id sub_1CFAFD080@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_requiresDeletion);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFD0B0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRequiresDeletion_, *a1);
}

id sub_1CFAFD0C4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_version);
  *a2 = (_WORD)result;
  return result;
}

id sub_1CFAFD0F4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVersion_, *a1);
}

id StoredProofingBiomeData.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredProofingBiomeData.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredProofingBiomeData();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredProofingBiomeData()
{
  return objc_opt_self();
}

id StoredProofingBiomeData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredProofingBiomeData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredProofingBiomeData.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFD2C8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_optInDate);
  if (v3)
  {
    v4 = v3;
    sub_1CFB00F30();

    v5 = sub_1CFB00F54();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_1CFB00F54();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_1CFAFD34C(uint64_t a1, void **a2)
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904838);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF9C1B08(a1, (uint64_t)v13);
  v14 = *a2;
  v15 = sub_1CFB00F54();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    v17 = (void *)sub_1CFB00EF4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }
  objc_msgSend(v14, sel_setOptInDate_, v17);

}

uint64_t sub_1CFAFD428@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredProofingBiomeData();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

void sub_1CFAFD468(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_credentialIdentifier, a2);
}

void sub_1CFAFD484(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setCredentialIdentifier_);
}

char *keypath_get_selector_isDonated()
{
  return sel_isDonated;
}

id sub_1CFAFD4AC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isDonated);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFD4DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDonated_, *a1);
}

char *keypath_get_selector_optInDate()
{
  return sel_optInDate;
}

char *keypath_get_selector_optInStatus()
{
  return sel_optInStatus;
}

id sub_1CFAFD510@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_optInStatus);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFD540(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOptInStatus_, *a1);
}

char *keypath_get_selector_proofingDecision()
{
  return sel_proofingDecision;
}

void sub_1CFAFD560(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_proofingDecision, a2);
}

void sub_1CFAFD57C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProofingDecision_);
}

void sub_1CFAFD598(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_proofingSessionID, a2);
}

void sub_1CFAFD5B4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProofingSessionID_);
}

id StoredProofingSession.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredProofingSession.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredProofingSession();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredProofingSession()
{
  return objc_opt_self();
}

id StoredProofingSession.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredProofingSession();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredProofingSession.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFD798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredProofingSession();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_canUploadOnExpensiveNetwork()
{
  return sel_canUploadOnExpensiveNetwork;
}

id sub_1CFAFD7E4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_canUploadOnExpensiveNetwork);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFD814(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCanUploadOnExpensiveNetwork_, *a1);
}

char *keypath_get_selector_cloudKitUploadsMaxRetryCount()
{
  return sel_cloudKitUploadsMaxRetryCount;
}

id sub_1CFAFD834@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_cloudKitUploadsMaxRetryCount);
  *a2 = result;
  return result;
}

id sub_1CFAFD864(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCloudKitUploadsMaxRetryCount_, *a1);
}

char *keypath_get_selector_connectToWifiReminderInDays()
{
  return sel_connectToWifiReminderInDays;
}

id sub_1CFAFD884@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_connectToWifiReminderInDays);
  *a2 = result;
  return result;
}

id sub_1CFAFD8B4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setConnectToWifiReminderInDays_, *a1);
}

char *keypath_get_selector_country()
{
  return sel_country;
}

void sub_1CFAFD8D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_country, a2);
}

void sub_1CFAFD8F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setCountry_);
}

uint64_t sub_1CFAFD90C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_createdAt, a2);
}

void sub_1CFAFD928(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setCreatedAt_);
}

void sub_1CFAFD944(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_credentialIdentifier, a2);
}

void sub_1CFAFD960(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setCredentialIdentifier_);
}

char *keypath_get_selector_didAttemptComboProofing()
{
  return sel_didAttemptComboProofing;
}

id sub_1CFAFD988@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_didAttemptComboProofing);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFD9B8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDidAttemptComboProofing_, *a1);
}

char *keypath_get_selector_didNotifyOnUploadsCompletion()
{
  return sel_didNotifyOnUploadsCompletion;
}

id sub_1CFAFD9D8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_didNotifyOnUploadsCompletion);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFDA08(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDidNotifyOnUploadsCompletion_, *a1);
}

char *keypath_get_selector_didShowWifiReminderAlert()
{
  return sel_didShowWifiReminderAlert;
}

id sub_1CFAFDA28@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_didShowWifiReminderAlert);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFDA58(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDidShowWifiReminderAlert_, *a1);
}

char *keypath_get_selector_extendedReviewURLString()
{
  return sel_extendedReviewURLString;
}

void sub_1CFAFDA78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_extendedReviewURLString, a2);
}

void sub_1CFAFDA94(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setExtendedReviewURLString_);
}

char *keypath_get_selector_hasUserConsentToShareBiomeData()
{
  return sel_hasUserConsentToShareBiomeData;
}

id sub_1CFAFDABC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_hasUserConsentToShareBiomeData);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFDAEC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasUserConsentToShareBiomeData_, *a1);
}

char *keypath_get_selector_idType()
{
  return sel_idType;
}

void sub_1CFAFDB0C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_idType, a2);
}

void sub_1CFAFDB28(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setIdType_);
}

char *keypath_get_selector_issuerCurrentCredentialCapacity()
{
  return sel_issuerCurrentCredentialCapacity;
}

id sub_1CFAFDB50@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_issuerCurrentCredentialCapacity);
  *a2 = result;
  return result;
}

id sub_1CFAFDB80(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIssuerCurrentCredentialCapacity_, *a1);
}

char *keypath_get_selector_lastExecutedActionIdentifier()
{
  return sel_lastExecutedActionIdentifier;
}

void sub_1CFAFDBA0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_lastExecutedActionIdentifier, a2);
}

void sub_1CFAFDBBC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setLastExecutedActionIdentifier_);
}

char *keypath_get_selector_learnMoreURLString()
{
  return sel_learnMoreURLString;
}

void sub_1CFAFDBE4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_learnMoreURLString, a2);
}

void sub_1CFAFDC00(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setLearnMoreURLString_);
}

char *keypath_get_selector_manualCheckInterval()
{
  return sel_manualCheckInterval;
}

id sub_1CFAFDC28@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_manualCheckInterval);
  *a2 = result;
  return result;
}

id sub_1CFAFDC58(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setManualCheckInterval_, *a1);
}

void sub_1CFAFDC6C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_pairingID, a2);
}

void sub_1CFAFDC88(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPairingID_);
}

char *keypath_get_selector_partnerSchemeID()
{
  return sel_partnerSchemeID;
}

void sub_1CFAFDCB0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_partnerSchemeID, a2);
}

void sub_1CFAFDCCC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPartnerSchemeID_);
}

char *keypath_get_selector_productIdentifier()
{
  return sel_productIdentifier;
}

void sub_1CFAFDCF4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_productIdentifier, a2);
}

void sub_1CFAFDD10(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProductIdentifier_);
}

char *keypath_get_selector_proofingActionStatus()
{
  return sel_proofingActionStatus;
}

id sub_1CFAFDD38@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_proofingActionStatus);
  *a2 = result;
  return result;
}

id sub_1CFAFDD68(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProofingActionStatus_, *a1);
}

void sub_1CFAFDD7C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_proofingSessionID, a2);
}

void sub_1CFAFDD98(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProofingSessionID_);
}

char *keypath_get_selector_provisioningAttemptDate()
{
  return sel_provisioningAttemptDate;
}

uint64_t sub_1CFAFDDC0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_provisioningAttemptDate, a2);
}

void sub_1CFAFDDDC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setProvisioningAttemptDate_);
}

char *keypath_get_selector_provisioningCredentialID()
{
  return sel_provisioningCredentialID;
}

void sub_1CFAFDE04(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_provisioningCredentialID, a2);
}

void sub_1CFAFDE20(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProvisioningCredentialID_);
}

char *keypath_get_selector_provisioningRetryTimeout()
{
  return sel_provisioningRetryTimeout;
}

id sub_1CFAFDE48@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_provisioningRetryTimeout);
  *a2 = result;
  return result;
}

id sub_1CFAFDE78(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProvisioningRetryTimeout_, *a1);
}

char *keypath_get_selector_provisioningTargetInstanceID()
{
  return sel_provisioningTargetInstanceID;
}

void sub_1CFAFDE98(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_provisioningTargetInstanceID, a2);
}

void sub_1CFAFDEB4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setProvisioningTargetInstanceID_);
}

char *keypath_get_selector_serverAttestedProvisioningData()
{
  return sel_serverAttestedProvisioningData;
}

void sub_1CFAFDEDC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_serverAttestedProvisioningData, a2);
}

void sub_1CFAFDEF8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setServerAttestedProvisioningData_);
}

char *keypath_get_selector_shouldScheduleUploads()
{
  return sel_shouldScheduleUploads;
}

id sub_1CFAFDF20@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldScheduleUploads);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFDF50(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldScheduleUploads_, *a1);
}

char *keypath_get_selector_shouldShowNotificationOnWatch()
{
  return sel_shouldShowNotificationOnWatch;
}

id sub_1CFAFDF70@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldShowNotificationOnWatch);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1CFAFDFA0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldShowNotificationOnWatch_, *a1);
}

void sub_1CFAFDFB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_state, a2);
}

void sub_1CFAFDFD0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setState_);
}

char *keypath_get_selector_supplementalProvisioningData()
{
  return sel_supplementalProvisioningData;
}

void sub_1CFAFDFF8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF9B34(a1, (SEL *)&selRef_supplementalProvisioningData, a2);
}

void sub_1CFAFE014(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF9B94(a1, a2, a3, a4, (SEL *)&selRef_setSupplementalProvisioningData_);
}

char *keypath_get_selector_target()
{
  return sel_target;
}

id sub_1CFAFE03C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_target);
  *a2 = result;
  return result;
}

id sub_1CFAFE06C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTarget_, *a1);
}

char *keypath_get_selector_totalUploadAssetsFileSizeInBytes()
{
  return sel_totalUploadAssetsFileSizeInBytes;
}

id sub_1CFAFE08C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_totalUploadAssetsFileSizeInBytes);
  *a2 = result;
  return result;
}

id sub_1CFAFE0BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalUploadAssetsFileSizeInBytes_, *a1);
}

char *keypath_get_selector_workflowID()
{
  return sel_workflowID;
}

void sub_1CFAFE0DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_workflowID, a2);
}

void sub_1CFAFE0F8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setWorkflowID_);
}

char *keypath_get_selector_uploadAssets()
{
  return sel_uploadAssets;
}

id sub_1CFAFE120@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_uploadAssets);
  *a2 = result;
  return result;
}

id sub_1CFAFE158(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUploadAssets_, *a1);
}

id StoredRACCredential.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredRACCredential.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredRACCredential();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredRACCredential()
{
  return objc_opt_self();
}

id StoredRACCredential.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredRACCredential();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredRACCredential.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFE334@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_lastReportTime);
  if (v3)
  {
    v4 = v3;
    sub_1CFB00F30();

    v5 = sub_1CFB00F54();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_1CFB00F54();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_1CFAFE3B8(uint64_t a1, void **a2)
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED904838);
  MEMORY[0x1E0C80A78](v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF9C1B08(a1, (uint64_t)v13);
  v14 = *a2;
  v15 = sub_1CFB00F54();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    v17 = (void *)sub_1CFB00EF4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }
  objc_msgSend(v14, sel_setLastReportTime_, v17);

}

uint64_t sub_1CFAFE494@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredRACCredential();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_analyticsID()
{
  return sel_analyticsID;
}

void sub_1CFAFE4E0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_analyticsID, a2);
}

void sub_1CFAFE4FC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setAnalyticsID_);
}

void sub_1CFAFE518(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_credentialIdentifier, a2);
}

void sub_1CFAFE534(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setCredentialIdentifier_);
}

char *keypath_get_selector_lastReportTime()
{
  return sel_lastReportTime;
}

char *keypath_get_selector_presentments()
{
  return sel_presentments;
}

id sub_1CFAFE570@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_presentments);
  *a2 = result;
  return result;
}

id sub_1CFAFE5A8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentments_, *a1);
}

id StoredRACPresentment.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredRACPresentment.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredRACPresentment();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredRACPresentment()
{
  return objc_opt_self();
}

id StoredRACPresentment.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredRACPresentment();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredRACPresentment.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFE784@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredRACPresentment();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

void sub_1CFAFE7C4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_analyticsID, a2);
}

void sub_1CFAFE7E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setAnalyticsID_);
}

char *keypath_get_selector_presentmentID()
{
  return sel_presentmentID;
}

void sub_1CFAFE808(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_presentmentID, a2);
}

void sub_1CFAFE824(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setPresentmentID_);
}

id sub_1CFAFE840@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_credential);
  *a2 = result;
  return result;
}

id sub_1CFAFE878(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCredential_, *a1);
}

id StoredRandomizedBackgroundActivity.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredRandomizedBackgroundActivity.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredRandomizedBackgroundActivity();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredRandomizedBackgroundActivity()
{
  return objc_opt_self();
}

id StoredRandomizedBackgroundActivity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredRandomizedBackgroundActivity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredRandomizedBackgroundActivity.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFEA4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredRandomizedBackgroundActivity();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_lastAttemptAt()
{
  return sel_lastAttemptAt;
}

uint64_t sub_1CFAFEAA0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_lastAttemptAt, a2);
}

void sub_1CFAFEABC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setLastAttemptAt_);
}

char *keypath_get_selector_lastSuccessfulAttemptAt()
{
  return sel_lastSuccessfulAttemptAt;
}

uint64_t sub_1CFAFEAE4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_lastSuccessfulAttemptAt, a2);
}

void sub_1CFAFEB00(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setLastSuccessfulAttemptAt_);
}

char *keypath_get_selector_nextAttemptAt()
{
  return sel_nextAttemptAt;
}

uint64_t sub_1CFAFEB28@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CFAFA09C(a1, (SEL *)&selRef_nextAttemptAt, a2);
}

void sub_1CFAFEB44(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAFA11C(a1, a2, a3, a4, (SEL *)&selRef_setNextAttemptAt_);
}

id StoredUploadAsset.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StoredUploadAsset.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StoredUploadAsset();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StoredUploadAsset()
{
  return objc_opt_self();
}

id StoredUploadAsset.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoredUploadAsset();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StoredUploadAsset.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v1 = (void *)sub_1CFB01A04();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_1CFAFED24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StoredUploadAsset();
  result = sub_1CFB023A0();
  *a1 = result;
  return result;
}

char *keypath_get_selector_assetFileURL()
{
  return sel_assetFileURL;
}

void sub_1CFAFED70(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_assetFileURL, a2);
}

void sub_1CFAFED8C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setAssetFileURL_);
}

char *keypath_get_selector_assetType()
{
  return sel_assetType;
}

void sub_1CFAFEDB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_assetType, a2);
}

void sub_1CFAFEDD0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setAssetType_);
}

char *keypath_get_selector_recordUUID()
{
  return sel_recordUUID;
}

void sub_1CFAFEDF8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1CFAF923C(a1, (SEL *)&selRef_recordUUID, a2);
}

void sub_1CFAFEE14(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1CFAF929C(a1, a2, a3, a4, (SEL *)&selRef_setRecordUUID_);
}

char *keypath_get_selector_proofingSession()
{
  return sel_proofingSession;
}

id sub_1CFAFEE3C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_proofingSession);
  *a2 = result;
  return result;
}

id sub_1CFAFEE74(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProofingSession_, *a1);
}

void AuthorizePresentmentFromAppleIDV_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void AuthorizePresentmentFromAppleIDV_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_18(&dword_1CF917000, a3, v5, "input Buffer: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_11();
}

uint64_t sub_1CFB00B40()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1CFB00B4C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1CFB00B58()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1CFB00B64()
{
  return MEMORY[0x1E0CAE190]();
}

uint64_t sub_1CFB00B70()
{
  return MEMORY[0x1E0CAE198]();
}

uint64_t sub_1CFB00B7C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1CFB00B88()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1CFB00B94()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1CFB00BA0()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1CFB00BAC()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1CFB00BB8()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1CFB00BC4()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1CFB00BD0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1CFB00BDC()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1CFB00BE8()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1CFB00BF4()
{
  return MEMORY[0x1E0CAE908]();
}

uint64_t sub_1CFB00C00()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1CFB00C0C()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_1CFB00C18()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1CFB00C24()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1CFB00C30()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1CFB00C3C()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1CFB00C48()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1CFB00C54()
{
  return MEMORY[0x1E0CAF330]();
}

uint64_t sub_1CFB00C60()
{
  return MEMORY[0x1E0CAF388]();
}

uint64_t sub_1CFB00C6C()
{
  return MEMORY[0x1E0CAF3D0]();
}

uint64_t sub_1CFB00C78()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1CFB00C84()
{
  return MEMORY[0x1E0CAF488]();
}

uint64_t sub_1CFB00C90()
{
  return MEMORY[0x1E0CAF4B8]();
}

uint64_t sub_1CFB00C9C()
{
  return MEMORY[0x1E0CAF548]();
}

uint64_t sub_1CFB00CA8()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1CFB00CB4()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1CFB00CC0()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1CFB00CCC()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1CFB00CD8()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1CFB00CE4()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1CFB00CF0()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1CFB00CFC()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1CFB00D08()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1CFB00D14()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CFB00D20()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CFB00D2C()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1CFB00D38()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1CFB00D44()
{
  return MEMORY[0x1E0CAFC98]();
}

uint64_t sub_1CFB00D50()
{
  return MEMORY[0x1E0CAFCC0]();
}

uint64_t sub_1CFB00D5C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1CFB00D68()
{
  return MEMORY[0x1E0CAFDC0]();
}

uint64_t sub_1CFB00D74()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1CFB00D80()
{
  return MEMORY[0x1E0CAFE00]();
}

uint64_t sub_1CFB00D8C()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1CFB00D98()
{
  return MEMORY[0x1E0CAFE18]();
}

uint64_t sub_1CFB00DA4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CFB00DB0()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1CFB00DBC()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1CFB00DC8()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1CFB00DD4()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1CFB00DE0()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1CFB00DEC()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CFB00DF8()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1CFB00E04()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1CFB00E10()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1CFB00E1C()
{
  return MEMORY[0x1E0CB0128]();
}

uint64_t sub_1CFB00E28()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1CFB00E34()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1CFB00E40()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1CFB00E4C()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1CFB00E58()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CFB00E64()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1CFB00E70()
{
  return MEMORY[0x1E0CB0220]();
}

uint64_t sub_1CFB00E7C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CFB00E88()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_1CFB00E94()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1CFB00EA0()
{
  return MEMORY[0x1E0CB02B0]();
}

uint64_t sub_1CFB00EAC()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_1CFB00EB8()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_1CFB00EC4()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1CFB00ED0()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1CFB00EDC()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1CFB00EE8()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1CFB00EF4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CFB00F00()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1CFB00F0C()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1CFB00F18()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1CFB00F24()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1CFB00F30()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CFB00F3C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1CFB00F48()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1CFB00F54()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CFB00F60()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CFB00F6C()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1CFB00F78()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CFB00F84()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t sub_1CFB00F90()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CFB00F9C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CFB00FA8()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1CFB00FB4()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1CFB00FC0()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1CFB00FCC()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1CFB00FD8()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1CFB00FE4()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1CFB00FF0()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1CFB00FFC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1CFB01008()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1CFB01014()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1CFB01020()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1CFB0102C()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1CFB01038()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1CFB01044()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1CFB01050()
{
  return MEMORY[0x1E0CB10E0]();
}

uint64_t sub_1CFB0105C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1CFB01068()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CFB01074()
{
  return MEMORY[0x1E0CB1400]();
}

uint64_t sub_1CFB01080()
{
  return MEMORY[0x1E0CB1420]();
}

uint64_t sub_1CFB0108C()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1CFB01098()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1CFB010A4()
{
  return MEMORY[0x1E0CB15C0]();
}

uint64_t sub_1CFB010B0()
{
  return MEMORY[0x1E0D03790]();
}

uint64_t sub_1CFB010BC()
{
  return MEMORY[0x1E0D03798]();
}

uint64_t sub_1CFB010C8()
{
  return MEMORY[0x1E0D037B8]();
}

uint64_t sub_1CFB010D4()
{
  return MEMORY[0x1E0D037C0]();
}

uint64_t sub_1CFB010E0()
{
  return MEMORY[0x1E0D037D0]();
}

uint64_t sub_1CFB010EC()
{
  return MEMORY[0x1E0D037D8]();
}

uint64_t sub_1CFB010F8()
{
  return MEMORY[0x1E0D037E0]();
}

uint64_t sub_1CFB01104()
{
  return MEMORY[0x1E0D037F8]();
}

uint64_t sub_1CFB01110()
{
  return MEMORY[0x1E0D03800]();
}

uint64_t sub_1CFB0111C()
{
  return MEMORY[0x1E0D03808]();
}

uint64_t sub_1CFB01128()
{
  return MEMORY[0x1E0D03810]();
}

uint64_t sub_1CFB01134()
{
  return MEMORY[0x1E0D03818]();
}

uint64_t sub_1CFB01140()
{
  return MEMORY[0x1E0D03828]();
}

uint64_t sub_1CFB0114C()
{
  return MEMORY[0x1E0D03830]();
}

uint64_t sub_1CFB01158()
{
  return MEMORY[0x1E0D03840]();
}

uint64_t sub_1CFB01164()
{
  return MEMORY[0x1E0D03848]();
}

uint64_t sub_1CFB01170()
{
  return MEMORY[0x1E0D03858]();
}

uint64_t sub_1CFB0117C()
{
  return MEMORY[0x1E0D03860]();
}

uint64_t sub_1CFB01188()
{
  return MEMORY[0x1E0D03868]();
}

uint64_t sub_1CFB01194()
{
  return MEMORY[0x1E0D03870]();
}

uint64_t sub_1CFB011A0()
{
  return MEMORY[0x1E0D03890]();
}

uint64_t sub_1CFB011AC()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1CFB011B8()
{
  return MEMORY[0x1E0D83840]();
}

uint64_t sub_1CFB011C4()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1CFB011D0()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1CFB011DC()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1CFB011E8()
{
  return MEMORY[0x1E0DF1E50]();
}

uint64_t sub_1CFB011F4()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_1CFB01200()
{
  return MEMORY[0x1E0DF1ED8]();
}

uint64_t sub_1CFB0120C()
{
  return MEMORY[0x1E0DF1F18]();
}

uint64_t sub_1CFB01218()
{
  return MEMORY[0x1E0DF1F20]();
}

uint64_t sub_1CFB01224()
{
  return MEMORY[0x1E0DF1F48]();
}

uint64_t sub_1CFB01230()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1CFB0123C()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1CFB01248()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1CFB01254()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1CFB01260()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1CFB0126C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1CFB01278()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1CFB01284()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1CFB01290()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1CFB0129C()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1CFB012A8()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1CFB012B4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CFB012C0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CFB012CC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CFB012D8()
{
  return MEMORY[0x1E0CCE388]();
}

uint64_t sub_1CFB012E4()
{
  return MEMORY[0x1E0CCE6F0]();
}

uint64_t sub_1CFB012F0()
{
  return MEMORY[0x1E0CCE6F8]();
}

uint64_t sub_1CFB012FC()
{
  return MEMORY[0x1E0CCE700]();
}

uint64_t sub_1CFB01308()
{
  return MEMORY[0x1E0CCE728]();
}

uint64_t sub_1CFB01314()
{
  return MEMORY[0x1E0CCE730]();
}

uint64_t sub_1CFB01320()
{
  return MEMORY[0x1E0CCEA28]();
}

uint64_t sub_1CFB0132C()
{
  return MEMORY[0x1E0CCEA88]();
}

uint64_t sub_1CFB01338()
{
  return MEMORY[0x1E0CCEAD8]();
}

uint64_t sub_1CFB01344()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1CFB01350()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1CFB0135C()
{
  return MEMORY[0x1E0DEF4E0]();
}

uint64_t sub_1CFB01368()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CFB01374()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1CFB01380()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CFB0138C()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1CFB01398()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CFB013A4()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1CFB013B0()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1CFB013BC()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1CFB013C8()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1CFB013D4()
{
  return MEMORY[0x1E0CA91F8]();
}

uint64_t sub_1CFB013E0()
{
  return MEMORY[0x1E0CA9200]();
}

uint64_t sub_1CFB013EC()
{
  return MEMORY[0x1E0CA9210]();
}

uint64_t sub_1CFB013F8()
{
  return MEMORY[0x1E0CA9220]();
}

uint64_t sub_1CFB01404()
{
  return MEMORY[0x1E0CA9228]();
}

uint64_t sub_1CFB01410()
{
  return MEMORY[0x1E0CA9230]();
}

uint64_t sub_1CFB0141C()
{
  return MEMORY[0x1E0CA9240]();
}

uint64_t sub_1CFB01428()
{
  return MEMORY[0x1E0CA9248]();
}

uint64_t sub_1CFB01434()
{
  return MEMORY[0x1E0CA9258]();
}

uint64_t sub_1CFB01440()
{
  return MEMORY[0x1E0CA9260]();
}

uint64_t sub_1CFB0144C()
{
  return MEMORY[0x1E0CA9268]();
}

uint64_t sub_1CFB01458()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1CFB01464()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1CFB01470()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1CFB0147C()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1CFB01488()
{
  return MEMORY[0x1E0CA9328]();
}

uint64_t sub_1CFB01494()
{
  return MEMORY[0x1E0CA9348]();
}

uint64_t sub_1CFB014A0()
{
  return MEMORY[0x1E0CA9378]();
}

uint64_t sub_1CFB014AC()
{
  return MEMORY[0x1E0CA9380]();
}

uint64_t sub_1CFB014B8()
{
  return MEMORY[0x1E0CA9388]();
}

uint64_t sub_1CFB014C4()
{
  return MEMORY[0x1E0CA93A0]();
}

uint64_t sub_1CFB014D0()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t sub_1CFB014DC()
{
  return MEMORY[0x1E0CA93B8]();
}

uint64_t sub_1CFB014E8()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t sub_1CFB014F4()
{
  return MEMORY[0x1E0D1BE80]();
}

uint64_t sub_1CFB01500()
{
  return MEMORY[0x1E0CA9400]();
}

uint64_t sub_1CFB0150C()
{
  return MEMORY[0x1E0CA9410]();
}

uint64_t sub_1CFB01518()
{
  return MEMORY[0x1E0CA9420]();
}

uint64_t sub_1CFB01524()
{
  return MEMORY[0x1E0CA9440]();
}

uint64_t sub_1CFB01530()
{
  return MEMORY[0x1E0CA9458]();
}

uint64_t sub_1CFB0153C()
{
  return MEMORY[0x1E0CA94B8]();
}

uint64_t sub_1CFB01548()
{
  return MEMORY[0x1E0CA94C0]();
}

uint64_t sub_1CFB01554()
{
  return MEMORY[0x1E0CA94C8]();
}

uint64_t sub_1CFB01560()
{
  return MEMORY[0x1E0CA94D0]();
}

uint64_t sub_1CFB0156C()
{
  return MEMORY[0x1E0CA94E0]();
}

uint64_t sub_1CFB01578()
{
  return MEMORY[0x1E0CA94E8]();
}

uint64_t sub_1CFB01584()
{
  return MEMORY[0x1E0CA94F0]();
}

uint64_t sub_1CFB01590()
{
  return MEMORY[0x1E0CA94F8]();
}

uint64_t sub_1CFB0159C()
{
  return MEMORY[0x1E0CA9508]();
}

uint64_t sub_1CFB015A8()
{
  return MEMORY[0x1E0CA9510]();
}

uint64_t sub_1CFB015B4()
{
  return MEMORY[0x1E0CA9518]();
}

uint64_t sub_1CFB015C0()
{
  return MEMORY[0x1E0CA9538]();
}

uint64_t sub_1CFB015CC()
{
  return MEMORY[0x1E0CA9580]();
}

uint64_t sub_1CFB015D8()
{
  return MEMORY[0x1E0CA95B8]();
}

uint64_t sub_1CFB015E4()
{
  return MEMORY[0x1E0CA95C0]();
}

uint64_t sub_1CFB015F0()
{
  return MEMORY[0x1E0CA95E8]();
}

uint64_t sub_1CFB015FC()
{
  return MEMORY[0x1E0CA9600]();
}

uint64_t sub_1CFB01608()
{
  return MEMORY[0x1E0CA9618]();
}

uint64_t sub_1CFB01614()
{
  return MEMORY[0x1E0CA9628]();
}

uint64_t sub_1CFB01620()
{
  return MEMORY[0x1E0CA9630]();
}

uint64_t sub_1CFB0162C()
{
  return MEMORY[0x1E0CA9638]();
}

uint64_t sub_1CFB01638()
{
  return MEMORY[0x1E0CA9640]();
}

uint64_t sub_1CFB01644()
{
  return MEMORY[0x1E0CA9650]();
}

uint64_t sub_1CFB01650()
{
  return MEMORY[0x1E0CA9658]();
}

uint64_t sub_1CFB0165C()
{
  return MEMORY[0x1E0CA9660]();
}

uint64_t sub_1CFB01668()
{
  return MEMORY[0x1E0CA9668]();
}

uint64_t sub_1CFB01674()
{
  return MEMORY[0x1E0CA9670]();
}

uint64_t sub_1CFB01680()
{
  return MEMORY[0x1E0CA9680]();
}

uint64_t sub_1CFB0168C()
{
  return MEMORY[0x1E0CA9690]();
}

uint64_t sub_1CFB01698()
{
  return MEMORY[0x1E0CA96A0]();
}

uint64_t sub_1CFB016A4()
{
  return MEMORY[0x1E0CA96A8]();
}

uint64_t sub_1CFB016B0()
{
  return MEMORY[0x1E0CA96B0]();
}

uint64_t sub_1CFB016BC()
{
  return MEMORY[0x1E0CA96B8]();
}

uint64_t sub_1CFB016C8()
{
  return MEMORY[0x1E0CA96D0]();
}

uint64_t sub_1CFB016D4()
{
  return MEMORY[0x1E0CA96D8]();
}

uint64_t sub_1CFB016E0()
{
  return MEMORY[0x1E0CA9700]();
}

uint64_t sub_1CFB016EC()
{
  return MEMORY[0x1E0CA9708]();
}

uint64_t sub_1CFB016F8()
{
  return MEMORY[0x1E0CA9710]();
}

uint64_t sub_1CFB01704()
{
  return MEMORY[0x1E0CA9718]();
}

uint64_t sub_1CFB01710()
{
  return MEMORY[0x1E0CA9728]();
}

uint64_t sub_1CFB0171C()
{
  return MEMORY[0x1E0CA9740]();
}

uint64_t sub_1CFB01728()
{
  return MEMORY[0x1E0CA9758]();
}

uint64_t sub_1CFB01734()
{
  return MEMORY[0x1E0CA9768]();
}

uint64_t sub_1CFB01740()
{
  return MEMORY[0x1E0CA9770]();
}

uint64_t sub_1CFB0174C()
{
  return MEMORY[0x1E0CA9790]();
}

uint64_t sub_1CFB01758()
{
  return MEMORY[0x1E0CA97A0]();
}

uint64_t sub_1CFB01764()
{
  return MEMORY[0x1E0CA97A8]();
}

uint64_t sub_1CFB01770()
{
  return MEMORY[0x1E0CA97B0]();
}

uint64_t sub_1CFB0177C()
{
  return MEMORY[0x1E0CA97C0]();
}

uint64_t sub_1CFB01788()
{
  return MEMORY[0x1E0CA97C8]();
}

uint64_t sub_1CFB01794()
{
  return MEMORY[0x1E0CA97F8]();
}

uint64_t sub_1CFB017A0()
{
  return MEMORY[0x1E0CA9800]();
}

uint64_t sub_1CFB017AC()
{
  return MEMORY[0x1E0CA9818]();
}

uint64_t sub_1CFB017B8()
{
  return MEMORY[0x1E0CA9820]();
}

uint64_t sub_1CFB017C4()
{
  return MEMORY[0x1E0CA9848]();
}

uint64_t sub_1CFB017D0()
{
  return MEMORY[0x1E0CA9870]();
}

uint64_t sub_1CFB017DC()
{
  return MEMORY[0x1E0CA9878]();
}

uint64_t sub_1CFB017E8()
{
  return MEMORY[0x1E0CA9880]();
}

uint64_t sub_1CFB017F4()
{
  return MEMORY[0x1E0CA9890]();
}

uint64_t sub_1CFB01800()
{
  return MEMORY[0x1E0CA9898]();
}

uint64_t sub_1CFB0180C()
{
  return MEMORY[0x1E0CA98A0]();
}

uint64_t sub_1CFB01818()
{
  return MEMORY[0x1E0CA98B0]();
}

uint64_t sub_1CFB01824()
{
  return MEMORY[0x1E0CA98B8]();
}

uint64_t sub_1CFB01830()
{
  return MEMORY[0x1E0CA98C8]();
}

uint64_t sub_1CFB0183C()
{
  return MEMORY[0x1E0CA98D0]();
}

uint64_t sub_1CFB01848()
{
  return MEMORY[0x1E0CA98E0]();
}

uint64_t sub_1CFB01854()
{
  return MEMORY[0x1E0CA98E8]();
}

uint64_t sub_1CFB01860()
{
  return MEMORY[0x1E0CA98F8]();
}

uint64_t sub_1CFB0186C()
{
  return MEMORY[0x1E0CA9908]();
}

uint64_t sub_1CFB01878()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1CFB01884()
{
  return MEMORY[0x1E0CA9958]();
}

uint64_t sub_1CFB01890()
{
  return MEMORY[0x1E0CA9988]();
}

uint64_t sub_1CFB0189C()
{
  return MEMORY[0x1E0CA9990]();
}

uint64_t sub_1CFB018A8()
{
  return MEMORY[0x1E0CA9998]();
}

uint64_t sub_1CFB018B4()
{
  return MEMORY[0x1E0CA99A0]();
}

uint64_t sub_1CFB018C0()
{
  return MEMORY[0x1E0CA99B0]();
}

uint64_t sub_1CFB018CC()
{
  return MEMORY[0x1E0CA99B8]();
}

uint64_t sub_1CFB018D8()
{
  return MEMORY[0x1E0CA99C0]();
}

uint64_t sub_1CFB018E4()
{
  return MEMORY[0x1E0CA99C8]();
}

uint64_t sub_1CFB018F0()
{
  return MEMORY[0x1E0CA99D0]();
}

uint64_t sub_1CFB018FC()
{
  return MEMORY[0x1E0CA99E0]();
}

uint64_t sub_1CFB01908()
{
  return MEMORY[0x1E0CA99E8]();
}

uint64_t sub_1CFB01914()
{
  return MEMORY[0x1E0CA99F0]();
}

uint64_t sub_1CFB01920()
{
  return MEMORY[0x1E0CA9A08]();
}

uint64_t sub_1CFB0192C()
{
  return MEMORY[0x1E0CA9A30]();
}

uint64_t sub_1CFB01938()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1CFB01944()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CFB01950()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1CFB0195C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CFB01968()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CFB01974()
{
  return MEMORY[0x1E0DE9F18]();
}

uint64_t sub_1CFB01980()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1CFB0198C()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CFB01998()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CFB019A4()
{
  return MEMORY[0x1E0DF1F70]();
}

uint64_t sub_1CFB019B0()
{
  return MEMORY[0x1E0DF1FA8]();
}

uint64_t sub_1CFB019BC()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CFB019C8()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1CFB019D4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1CFB019E0()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1CFB019EC()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1CFB019F8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CFB01A04()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CFB01A10()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CFB01A1C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CFB01A28()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CFB01A34()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1CFB01A40()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1CFB01A4C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1CFB01A58()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1CFB01A64()
{
  return MEMORY[0x1E0CB19F0]();
}

uint64_t sub_1CFB01A70()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1CFB01A7C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CFB01A88()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1CFB01A94()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1CFB01AA0()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_1CFB01AAC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1CFB01AB8()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1CFB01AC4()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_1CFB01AD0()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1CFB01ADC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CFB01AE8()
{
  return MEMORY[0x1E0DEA768]();
}

uint64_t sub_1CFB01AF4()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1CFB01B00()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1CFB01B0C()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1CFB01B18()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1CFB01B24()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1CFB01B30()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CFB01B3C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1CFB01B48()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CFB01B54()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1CFB01B60()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1CFB01B6C()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1CFB01B78()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1CFB01B84()
{
  return MEMORY[0x1E0DEA8C0]();
}

uint64_t sub_1CFB01B90()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1CFB01B9C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1CFB01BA8()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1CFB01BB4()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1CFB01BC0()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1CFB01BCC()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1CFB01BD8()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_1CFB01BE4()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1CFB01BF0()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1CFB01BFC()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1CFB01C08()
{
  return MEMORY[0x1E0DEAAE0]();
}

uint64_t sub_1CFB01C14()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1CFB01C20()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1CFB01C2C()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1CFB01C38()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1CFB01C44()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1CFB01C50()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1CFB01C5C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1CFB01C68()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1CFB01C74()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1CFB01C80()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CFB01C8C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CFB01C98()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1CFB01CA4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CFB01CB0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CFB01CBC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CFB01CC8()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1CFB01CD4()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1CFB01CE0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CFB01CEC()
{
  return MEMORY[0x1E0DEADF0]();
}

uint64_t sub_1CFB01CF8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CFB01D04()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1CFB01D10()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CFB01D1C()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1CFB01D28()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1CFB01D34()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1CFB01D40()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1CFB01D4C()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1CFB01D58()
{
  return MEMORY[0x1E0DEAF08]();
}

uint64_t sub_1CFB01D64()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1CFB01D70()
{
  return MEMORY[0x1E0CB1B38]();
}

uint64_t sub_1CFB01D7C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CFB01D88()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1CFB01D94()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CFB01DA0()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1CFB01DAC()
{
  return MEMORY[0x1E0DF0620]();
}

uint64_t sub_1CFB01DB8()
{
  return MEMORY[0x1E0DF0668]();
}

uint64_t sub_1CFB01DC4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CFB01DD0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CFB01DDC()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1CFB01DE8()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1CFB01DF4()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1CFB01E00()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1CFB01E0C()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1CFB01E18()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1CFB01E24()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1CFB01E30()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1CFB01E3C()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1CFB01E48()
{
  return MEMORY[0x1E0DF0940]();
}

uint64_t sub_1CFB01E54()
{
  return MEMORY[0x1E0DF09A8]();
}

uint64_t sub_1CFB01E60()
{
  return MEMORY[0x1E0DF09B0]();
}

uint64_t sub_1CFB01E6C()
{
  return MEMORY[0x1E0DF0AF0]();
}

uint64_t sub_1CFB01E78()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1CFB01E84()
{
  return MEMORY[0x1E0CB1B68]();
}

uint64_t sub_1CFB01E90()
{
  return MEMORY[0x1E0DEB000]();
}

uint64_t sub_1CFB01E9C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1CFB01EA8()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1CFB01EB4()
{
  return MEMORY[0x1E0DEB130]();
}

uint64_t sub_1CFB01EC0()
{
  return MEMORY[0x1E0DEB138]();
}

uint64_t sub_1CFB01ECC()
{
  return MEMORY[0x1E0DEB140]();
}

uint64_t sub_1CFB01ED8()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1CFB01EE4()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1CFB01EF0()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1CFB01EFC()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CFB01F08()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CFB01F14()
{
  return MEMORY[0x1E0CB1C20]();
}

uint64_t sub_1CFB01F20()
{
  return MEMORY[0x1E0DEB4F8]();
}

uint64_t sub_1CFB01F2C()
{
  return MEMORY[0x1E0DEB510]();
}

uint64_t sub_1CFB01F38()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1CFB01F44()
{
  return MEMORY[0x1E0DEB520]();
}

uint64_t sub_1CFB01F50()
{
  return MEMORY[0x1E0DEB598]();
}

uint64_t sub_1CFB01F5C()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1CFB01F68()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1CFB01F74()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_1CFB01F80()
{
  return MEMORY[0x1E0DF2000]();
}

uint64_t sub_1CFB01F8C()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1CFB01F98()
{
  return MEMORY[0x1E0CB1CA8]();
}

uint64_t sub_1CFB01FA4()
{
  return MEMORY[0x1E0CB1CB8]();
}

uint64_t sub_1CFB01FB0()
{
  return MEMORY[0x1E0CB1CF0]();
}

uint64_t sub_1CFB01FBC()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CFB01FC8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CFB01FD4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CFB01FE0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CFB01FEC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CFB01FF8()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1CFB02004()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1CFB02010()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1CFB0201C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CFB02028()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CFB02034()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CFB02040()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1CFB0204C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CFB02058()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CFB02064()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1CFB02070()
{
  return MEMORY[0x1E0CEDD68]();
}

uint64_t sub_1CFB0207C()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1CFB02088()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1CFB02094()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1CFB020A0()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1CFB020AC()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1CFB020B8()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1CFB020C4()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1CFB020D0()
{
  return MEMORY[0x1E0DEFA60]();
}

uint64_t sub_1CFB020DC()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1CFB020E8()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1CFB020F4()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1CFB02100()
{
  return MEMORY[0x1E0D038B0]();
}

uint64_t sub_1CFB0210C()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1CFB02118()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1CFB02124()
{
  return MEMORY[0x1E0CB2028]();
}

uint64_t sub_1CFB02130()
{
  return MEMORY[0x1E0CB2050]();
}

uint64_t sub_1CFB0213C()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1CFB02148()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CFB02154()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CFB02160()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1CFB0216C()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1CFB02178()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1CFB02184()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1CFB02190()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CFB0219C()
{
  return MEMORY[0x1E0DEBB50]();
}

uint64_t sub_1CFB021A8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1CFB021B4()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_1CFB021C0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CFB021CC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CFB021D8()
{
  return MEMORY[0x1E0DEBCC8]();
}

uint64_t sub_1CFB021E4()
{
  return MEMORY[0x1E0DEBCD0]();
}

uint64_t sub_1CFB021F0()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1CFB021FC()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_1CFB02208()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1CFB02214()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1CFB02220()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1CFB0222C()
{
  return MEMORY[0x1E0CB25A0]();
}

uint64_t sub_1CFB02238()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t sub_1CFB02244()
{
  return MEMORY[0x1E0DEBD78]();
}

uint64_t sub_1CFB02250()
{
  return MEMORY[0x1E0DEBDC0]();
}

uint64_t sub_1CFB0225C()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t sub_1CFB02268()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t sub_1CFB02274()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t sub_1CFB02280()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1CFB0228C()
{
  return MEMORY[0x1E0DEBE48]();
}

uint64_t sub_1CFB02298()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CFB022A4()
{
  return MEMORY[0x1E0DEBEB0]();
}

uint64_t sub_1CFB022B0()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1CFB022BC()
{
  return MEMORY[0x1E0DEC020]();
}

uint64_t sub_1CFB022C8()
{
  return MEMORY[0x1E0DEC028]();
}

uint64_t sub_1CFB022D4()
{
  return MEMORY[0x1E0DEC030]();
}

uint64_t sub_1CFB022E0()
{
  return MEMORY[0x1E0DEC038]();
}

uint64_t sub_1CFB022EC()
{
  return MEMORY[0x1E0DEC040]();
}

uint64_t sub_1CFB022F8()
{
  return MEMORY[0x1E0DEC048]();
}

uint64_t sub_1CFB02304()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CFB02310()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CFB0231C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CFB02328()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1CFB02334()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CFB02340()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CFB0234C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CFB02358()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CFB02364()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CFB02370()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CFB0237C()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1CFB02388()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CFB02394()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CFB023A0()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_1CFB023AC()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1CFB023B8()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1CFB023C4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CFB023D0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CFB023DC()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1CFB023E8()
{
  return MEMORY[0x1E0DEC478]();
}

uint64_t sub_1CFB023F4()
{
  return MEMORY[0x1E0DEC480]();
}

uint64_t sub_1CFB02400()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1CFB0240C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1CFB02418()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_1CFB02424()
{
  return MEMORY[0x1E0DEC4C0]();
}

uint64_t sub_1CFB02430()
{
  return MEMORY[0x1E0DEC4C8]();
}

uint64_t sub_1CFB0243C()
{
  return MEMORY[0x1E0DEC4D0]();
}

uint64_t sub_1CFB02448()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_1CFB02454()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_1CFB02460()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1CFB0246C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CFB02478()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1CFB02484()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CFB02490()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CFB0249C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1CFB024A8()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CFB024B4()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CFB024C0()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CFB024CC()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1CFB024D8()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1CFB024E4()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1CFB024F0()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1CFB024FC()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1CFB02508()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1CFB02514()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1CFB02520()
{
  return MEMORY[0x1E0DEC808]();
}

uint64_t sub_1CFB0252C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CFB02538()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1CFB02544()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t sub_1CFB02550()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_1CFB0255C()
{
  return MEMORY[0x1E0DECA08]();
}

uint64_t sub_1CFB02568()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t sub_1CFB02574()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t sub_1CFB02580()
{
  return MEMORY[0x1E0DECB58]();
}

uint64_t sub_1CFB0258C()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t sub_1CFB02598()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t sub_1CFB025A4()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1CFB025B0()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t sub_1CFB025BC()
{
  return MEMORY[0x1E0DECBA0]();
}

uint64_t sub_1CFB025C8()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1CFB025D4()
{
  return MEMORY[0x1E0DECBD8]();
}

uint64_t sub_1CFB025E0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CFB025EC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CFB025F8()
{
  return MEMORY[0x1E0DECC90]();
}

uint64_t sub_1CFB02604()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CFB02610()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CFB0261C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CFB02628()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CFB02634()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CFB02640()
{
  return MEMORY[0x1E0DECDA0]();
}

uint64_t sub_1CFB0264C()
{
  return MEMORY[0x1E0DECDA8]();
}

uint64_t sub_1CFB02658()
{
  return MEMORY[0x1E0DECE20]();
}

uint64_t sub_1CFB02664()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CFB02670()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CFB0267C()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1CFB02688()
{
  return MEMORY[0x1E0DF0D48]();
}

uint64_t sub_1CFB02694()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1CFB026A0()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1CFB026AC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1CFB026B8()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1CFB026C4()
{
  return MEMORY[0x1E0DECF70]();
}

uint64_t sub_1CFB026D0()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1CFB026DC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1CFB026E8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1CFB026F4()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1CFB02700()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1CFB0270C()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1CFB02718()
{
  return MEMORY[0x1E0DECFE8]();
}

uint64_t sub_1CFB02724()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CFB02730()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1CFB0273C()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1CFB02748()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1CFB02754()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1CFB02760()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1CFB0276C()
{
  return MEMORY[0x1E0DED0A8]();
}

uint64_t sub_1CFB02778()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1CFB02784()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1CFB02790()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1CFB0279C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1CFB027A8()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1CFB027B4()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1CFB027C0()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_1CFB027CC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CFB027D8()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1CFB027E4()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CFB027F0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CFB027FC()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1CFB02808()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1CFB02814()
{
  return MEMORY[0x1E0DED250]();
}

uint64_t sub_1CFB02820()
{
  return MEMORY[0x1E0DED258]();
}

uint64_t sub_1CFB0282C()
{
  return MEMORY[0x1E0DED260]();
}

uint64_t sub_1CFB02838()
{
  return MEMORY[0x1E0DED290]();
}

uint64_t sub_1CFB02844()
{
  return MEMORY[0x1E0DED2B8]();
}

uint64_t sub_1CFB02850()
{
  return MEMORY[0x1E0DED2C0]();
}

uint64_t sub_1CFB0285C()
{
  return MEMORY[0x1E0DED3A0]();
}

uint64_t sub_1CFB02868()
{
  return MEMORY[0x1E0DED3D0]();
}

uint64_t sub_1CFB02874()
{
  return MEMORY[0x1E0DED3F8]();
}

uint64_t sub_1CFB02880()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1CFB0288C()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1CFB02898()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1CFB028A4()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CFB028B0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CFB028BC()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_1CFB028C8()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1CFB028D4()
{
  return MEMORY[0x1E0DED630]();
}

uint64_t sub_1CFB028E0()
{
  return MEMORY[0x1E0DED638]();
}

uint64_t sub_1CFB028EC()
{
  return MEMORY[0x1E0DED640]();
}

uint64_t sub_1CFB028F8()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t sub_1CFB02904()
{
  return MEMORY[0x1E0DED650]();
}

uint64_t sub_1CFB02910()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1CFB0291C()
{
  return MEMORY[0x1E0DED690]();
}

uint64_t sub_1CFB02928()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_1CFB02934()
{
  return MEMORY[0x1E0DED6D0]();
}

uint64_t sub_1CFB02940()
{
  return MEMORY[0x1E0DED6D8]();
}

uint64_t sub_1CFB0294C()
{
  return MEMORY[0x1E0DED6E0]();
}

uint64_t sub_1CFB02958()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t sub_1CFB02964()
{
  return MEMORY[0x1E0DED6F0]();
}

uint64_t sub_1CFB02970()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1CFB0297C()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1CFB02988()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1CFB02994()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CFB029A0()
{
  return MEMORY[0x1E0DED9C0]();
}

uint64_t sub_1CFB029AC()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1CFB029B8()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1CFB029C4()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1CFB029D0()
{
  return MEMORY[0x1E0DEDA10]();
}

uint64_t sub_1CFB029DC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CFB029E8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CFB029F4()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1CFB02A00()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1CFB02A0C()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1CFB02A18()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1CFB02A24()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1CFB02A30()
{
  return MEMORY[0x1E0DEDAF8]();
}

uint64_t sub_1CFB02A3C()
{
  return MEMORY[0x1E0DEDB00]();
}

uint64_t sub_1CFB02A48()
{
  return MEMORY[0x1E0DEDB08]();
}

uint64_t sub_1CFB02A54()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CFB02A60()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CFB02A6C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CFB02A78()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CFB02A84()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1CFB02A90()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CFB02A9C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CFB02AA8()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1CFB02AB4()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1CFB02AC0()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1CFB02ACC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CFB02AD8()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1CFB02AE4()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_1CFB02AF0()
{
  return MEMORY[0x1E0CB2720]();
}

uint64_t sub_1CFB02AFC()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t sub_1CFB02B08()
{
  return MEMORY[0x1E0DEE228]();
}

uint64_t sub_1CFB02B14()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1CFB02B20()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t sub_1CFB02B2C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CFB02B38()
{
  return MEMORY[0x1E0DEE250]();
}

uint64_t sub_1CFB02B44()
{
  return MEMORY[0x1E0DEE258]();
}

uint64_t sub_1CFB02B50()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1CFB02B5C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CFB02B68()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1CFB02B74()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CFB02B80()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1CFB02B8C()
{
  return MEMORY[0x1E0DEE920]();
}

uint64_t sub_1CFB02B98()
{
  return MEMORY[0x1E0DEE938]();
}

uint64_t sub_1CFB02BA4()
{
  return MEMORY[0x1E0DEE950]();
}

uint64_t sub_1CFB02BB0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t AnalyticsSendExplodingEventLazy()
{
  return MEMORY[0x1E0D15438]();
}

uint64_t CCCryptorAddParameter()
{
  return MEMORY[0x1E0C80090]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x1E0C800D0]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1E0C800D8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1E0C800E0]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x1E0D1D0F8]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1E0CBB1D0]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x1E0CBB1D8]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1E0CBB1E8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x1E0CBB260]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1E0CBB268]();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return MEMORY[0x1E0CBB498]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t LevenshteinDistance()
{
  return MEMORY[0x1E0D1B030]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x1E0DE2C08]();
}

uint64_t MobileGestalt_get_secureElement()
{
  return MEMORY[0x1E0DE2C60]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1E0DE2C80]();
}

uint64_t SESKeyAttestWithSEBAA()
{
  return MEMORY[0x1E0D89698]();
}

uint64_t SESKeyCreate()
{
  return MEMORY[0x1E0D896A0]();
}

uint64_t SESKeyCreatePTAttestation()
{
  return MEMORY[0x1E0D896A8]();
}

uint64_t SESKeyDelete()
{
  return MEMORY[0x1E0D896B8]();
}

uint64_t SESKeyDesignate()
{
  return MEMORY[0x1E0D896C8]();
}

uint64_t SESKeyGetAccessControlConstraints()
{
  return MEMORY[0x1E0D896E0]();
}

uint64_t SESKeyGetDesignatedKeys()
{
  return MEMORY[0x1E0D896E8]();
}

uint64_t SESKeyGetPTAttestationCASD()
{
  return MEMORY[0x1E0D896F0]();
}

uint64_t SESKeyPublicKey()
{
  return MEMORY[0x1E0D896F8]();
}

uint64_t SESKeyRemoveDesignation()
{
  return MEMORY[0x1E0D89700]();
}

uint64_t SESKeySignPrecomputedDigest()
{
  return MEMORY[0x1E0D89708]();
}

uint64_t SESKeySignPrecomputedDigestWithListenerEndpoint()
{
  return MEMORY[0x1E0D89710]();
}

uint64_t SESKeyUpdateACL()
{
  return MEMORY[0x1E0D89718]();
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x1E0CD5E90]();
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x1E0CD5E98]();
}

uint64_t SecAccessControlCreateFromData()
{
  return MEMORY[0x1E0CD5EA0]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x1E0CD5EB8]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x1E0CD5EE8]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x1E0CD5EF0]();
}

uint64_t SecCertificateCopyAppleExternalRoots()
{
  return MEMORY[0x1E0CD5F38]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1E0CD5F48](certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

uint64_t SecCertificateCopyExtendedKeyUsage()
{
  return MEMORY[0x1E0CD5F70]();
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x1E0CD5F78]();
}

uint64_t SecCertificateCopyIssuerSHA1Digest()
{
  return MEMORY[0x1E0CD5F80]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFDataRef SecCertificateCopyNormalizedIssuerSequence(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5FA0](certificate);
}

CFDataRef SecCertificateCopyNormalizedSubjectSequence(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5FA8](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD5FD8](certificate, error);
}

uint64_t SecCertificateCopySubjectAttributeValue()
{
  return MEMORY[0x1E0CD5FE0]();
}

uint64_t SecCertificateCopySubjectPublicKeyInfoSHA256Digest()
{
  return MEMORY[0x1E0CD5FF0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x1E0CD6018]();
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1E0CD6028]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1E0CD6038]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1E0CD6050]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1E0CD6078]();
}

uint64_t SecCopyEncryptedToServer()
{
  return MEMORY[0x1E0CD6210]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x1E0CD6268]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD62F0](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6300](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x1E0CD6330]();
}

uint64_t SecKeyCreateAttestation()
{
  return MEMORY[0x1E0CD6338]();
}

uint64_t SecKeyCreateDecryptedDataWithParameters()
{
  return MEMORY[0x1E0CD6348]();
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x1E0CD6360]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1E0CD63E8]();
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x1E0CD63F0](key, operation, algorithm);
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x1E0CD6408]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePayModelSigning()
{
  return MEMORY[0x1E0CD64B0]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x1E0CD64D8]();
}

uint64_t SecPolicyCreateMDLTerminalAuth()
{
  return MEMORY[0x1E0CD64E8]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6510](revocationFlags);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66E8](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1E0CD6710](trust, anchorCertificates);
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1E0DEEA58]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1E0C81A58]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1E0C81A70]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1E0C81AA0]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1E0C81AC8]();
}

uint64_t ccder_encode_integer()
{
  return MEMORY[0x1E0C81AE8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1E0C81B18]();
}

uint64_t ccder_sizeof_integer()
{
  return MEMORY[0x1E0C81B30]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
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

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

