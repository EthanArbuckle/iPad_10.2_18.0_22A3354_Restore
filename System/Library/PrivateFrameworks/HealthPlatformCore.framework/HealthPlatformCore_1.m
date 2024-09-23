void sub_1BC06CD4C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t aBlock[6];

  v8 = sub_1BC089DE4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  sub_1BC089DA8();
  v13 = a3;
  v14 = sub_1BC089DD8();
  v15 = sub_1BC08A678();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v34 = v16;
    v18 = v17;
    v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)v18 = 136315395;
    v37 = v12;
    v19 = sub_1BC08AC9C();
    v36 = v8;
    v38 = sub_1BBFDE0F8(v19, v20, aBlock);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2081;
    v32[1] = v18 + 14;
    v21 = objc_msgSend(v13, sel_profileIdentifier);
    v22 = objc_msgSend(v21, sel_description);
    v23 = sub_1BC08A3C0();
    v33 = v9;
    v24 = a4;
    v26 = v25;

    v12 = v37;
    v38 = sub_1BBFDE0F8(v23, v26, aBlock);
    sub_1BC08A7EC();

    a4 = v24;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v14, (os_log_type_t)v34, "[%s] Pulling shared summaries for %{private}s", (uint8_t *)v18, 0x16u);
    v27 = v35;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v27, -1, -1);
    MEMORY[0x1BCCE9C40](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6B60]), sel_initWithHealthStore_, v13);
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = sub_1BC06F7EC;
  v29[3] = v12;
  v29[4] = v13;
  v29[5] = a4;
  aBlock[4] = (uint64_t)sub_1BC06F84C;
  aBlock[5] = (uint64_t)v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC06D520;
  aBlock[3] = (uint64_t)&block_descriptor_11;
  v30 = _Block_copy(aBlock);
  v31 = v13;
  swift_release();
  objc_msgSend(v28, sel_pullWithCompletion_, v30);
  _Block_release(v30);

}

uint64_t sub_1BC06D098(char a1, void *a2, uint64_t (*a3)(_QWORD), uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(_QWORD);
  uint64_t v51;
  uint64_t v52;

  v10 = sub_1BC089DE4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v45 - v15;
  if ((a1 & 1) == 0)
  {
    sub_1BC089DA8();
    v30 = a2;
    v31 = a2;
    v32 = sub_1BC089DD8();
    v33 = sub_1BC08A660();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v35 = swift_slowAlloc();
      v49 = v11;
      v36 = v35;
      v52 = v35;
      *(_DWORD *)v34 = 136315394;
      v50 = a3;
      v37 = sub_1BC08AC9C();
      v51 = sub_1BBFDE0F8(v37, v38, &v52);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2082;
      v51 = (uint64_t)a2;
      v39 = a2;
      sub_1BBFDB42C(0, &qword_1EF3EE318, (uint64_t (*)(uint64_t))sub_1BBFE24A4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      v48 = v10;
      v40 = sub_1BC08A3F0();
      v51 = sub_1BBFDE0F8(v40, v41, &v52);
      a3 = v50;
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BBFD7000, v32, v33, "[%s] Shared Summaries Pull Error: %{public}s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v36, -1, -1);
      MEMORY[0x1BCCE9C40](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v48);
      goto LABEL_9;
    }

    v42 = *(void (**)(char *, uint64_t))(v11 + 8);
    v43 = v14;
LABEL_8:
    v42(v43, v10);
    goto LABEL_9;
  }
  sub_1BC089DA8();
  v17 = a5;
  v18 = sub_1BC089DD8();
  v19 = sub_1BC08A678();
  if (!os_log_type_enabled(v18, v19))
  {

    v42 = *(void (**)(char *, uint64_t))(v11 + 8);
    v43 = v16;
    goto LABEL_8;
  }
  v20 = swift_slowAlloc();
  v46 = swift_slowAlloc();
  v52 = v46;
  *(_DWORD *)v20 = 136315395;
  v50 = a3;
  v21 = sub_1BC08AC9C();
  v47 = a4;
  v51 = sub_1BBFDE0F8(v21, v22, &v52);
  sub_1BC08A7EC();
  swift_bridgeObjectRelease();
  *(_WORD *)(v20 + 12) = 2081;
  v23 = objc_msgSend(v17, sel_profileIdentifier, v20 + 14);
  v24 = objc_msgSend(v23, sel_description);
  v25 = sub_1BC08A3C0();
  v48 = v10;
  v49 = v11;
  v26 = v25;
  v28 = v27;

  a3 = v50;
  v51 = sub_1BBFDE0F8(v26, v28, &v52);
  sub_1BC08A7EC();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1BBFD7000, v18, v19, "[%s] Successfully pulled shared summaries for %{private}s", (uint8_t *)v20, 0x16u);
  v29 = v46;
  swift_arrayDestroy();
  MEMORY[0x1BCCE9C40](v29, -1, -1);
  MEMORY[0x1BCCE9C40](v20, -1, -1);

  (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v48);
LABEL_9:
  sub_1BC08AC48();
  return a3(v52);
}

void sub_1BC06D520(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

_QWORD *FeedItemGeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v16;

  v16 = a4 & 1;
  swift_allocObject();
  return FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)(a1, a2, a3, v16, a5, a6, a7, a8, a9);
}

_QWORD *FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  char v16;
  _QWORD *v17;
  _BYTE v20[40];
  _BYTE v21[40];
  _BYTE v22[40];
  _BYTE v23[48];

  v16 = a4 & 1;
  sub_1BC089C88();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v9 + 248) = sub_1BC089C7C();
  *(_OWORD *)(v9 + 256) = xmmword_1BC08DAB0;
  *(_QWORD *)(v9 + 272) = 0;
  *(_QWORD *)(v9 + 280) = 0;
  swift_release();
  sub_1BBFE1C58(a1, (uint64_t)v23);
  sub_1BBFE1C58(a5, (uint64_t)v22);
  sub_1BBFE1C58(a8, (uint64_t)v21);
  sub_1BBFE1C58(a9, (uint64_t)v20);
  v17 = sub_1BC0282CC((uint64_t)v23, a2, a3, v16, (uint64_t)v22, a6, a7, (uint64_t)v21, (uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1(a9);
  __swift_destroy_boxed_opaque_existential_1(a8);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v17;
}

uint64_t sub_1BC06D750()
{
  uint64_t v0;

  swift_release();

  return sub_1BBFE60FC(*(_QWORD *)(v0 + 272));
}

uint64_t FeedItemGeneratorPipelineManager.deinit()
{
  uint64_t v0;

  v0 = sub_1BC033494();
  swift_release();

  sub_1BBFE60FC(*(_QWORD *)(v0 + 272));
  return v0;
}

uint64_t FeedItemGeneratorPipelineManager.__deallocating_deinit()
{
  uint64_t v0;

  v0 = sub_1BC033494();
  swift_release();

  sub_1BBFE60FC(*(_QWORD *)(v0 + 272));
  return swift_deallocClassInstance();
}

uint64_t sub_1BC06D7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    sub_1BC06F3F0();
    v2 = sub_1BC08AAB0();
    v18 = v2;
    sub_1BC08AA2C();
    v3 = sub_1BC08AA50();
    if (v3)
    {
      v4 = v3;
      sub_1BBFDF744(0, &qword_1ED69DBB0);
      do
      {
        swift_dynamicCast();
        sub_1BBFDF744(0, &qword_1ED69C938);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1BC07BF80(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1BC08A7B0();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1BC08AA50();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

void sub_1BC06DA40(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_1BC08A840();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_1BC08A7B0();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_1BC06DBF0(int64_t a1, uint64_t a2)
{
  return sub_1BC06DC18(a1, a2, &qword_1ED69D1F0, (uint64_t (*)(uint64_t))sub_1BBFDB2E4);
}

unint64_t sub_1BC06DC04(int64_t a1, uint64_t a2)
{
  return sub_1BC06DC18(a1, a2, &qword_1ED69D210, (uint64_t (*)(uint64_t))sub_1BBFDB248);
}

unint64_t sub_1BC06DC18(int64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;
  unint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  uint64_t (*v38)(uint64_t);
  void (*v39)(char *, unint64_t, uint64_t);
  unint64_t v40;
  uint64_t v41;

  v37 = a3;
  v38 = a4;
  v6 = sub_1BC089064();
  v41 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2 + 64;
  v11 = -1 << *(_BYTE *)(a2 + 32);
  v12 = (a1 + 1) & ~v11;
  if (((1 << v12) & *(_QWORD *)(a2 + 64 + 8 * (v12 >> 6))) != 0)
  {
    v13 = ~v11;
    result = sub_1BC08A840();
    if ((*(_QWORD *)(v10 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
    {
      v40 = (result + 1) & v13;
      v14 = *(_QWORD *)(v41 + 72);
      v39 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 16);
      v15 = v13;
      do
      {
        v16 = v14;
        v17 = v14 * v12;
        v39(v9, *(_QWORD *)(a2 + 48) + v14 * v12, v6);
        v18 = v15;
        sub_1BBFDA9C0(&qword_1ED69DAB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v19 = sub_1BC08A360();
        result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v9, v6);
        v20 = v19 & v18;
        v15 = v18;
        if (a1 >= (uint64_t)v40)
        {
          if (v20 >= v40 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v16 * a1 < v17
              || *(_QWORD *)(a2 + 48) + v16 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v17 + v16))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v16 * a1 != v17)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v23 = *(_QWORD *)(a2 + 56);
            sub_1BBFDB42C(0, v37, v38, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for GeneratorPipelineManagerWrapper);
            v25 = *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72);
            v26 = v25 * a1;
            result = v23 + v25 * a1;
            v27 = v25 * v12;
            v28 = v23 + v25 * v12 + v25;
            if (v26 < v27 || result >= v28)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v12;
              v15 = v18;
            }
            else
            {
              a1 = v12;
              v15 = v18;
              if (v26 != v27)
              {
                result = swift_arrayInitWithTakeBackToFront();
                a1 = v12;
              }
            }
          }
        }
        else if (v20 >= v40 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        v12 = (v12 + 1) & v15;
        v14 = v16;
      }
      while (((*(_QWORD *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
    }
    v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    v31 = *v30;
    v32 = (-1 << a1) - 1;
  }
  else
  {
    v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    v32 = *v30;
    v31 = (-1 << a1) - 1;
  }
  *v30 = v32 & v31;
  v33 = *(_QWORD *)(a2 + 16);
  v34 = __OFSUB__(v33, 1);
  v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BC06DEE8(int64_t a1, uint64_t a2)
{
  return sub_1BC06DC18(a1, a2, (unint64_t *)&qword_1ED69D1E0, (uint64_t (*)(uint64_t))sub_1BBFDAEBC);
}

unint64_t sub_1BC06DEFC(int64_t a1, uint64_t a2)
{
  return sub_1BC06DC18(a1, a2, &qword_1ED69D200, (uint64_t (*)(uint64_t))sub_1BBFDAEA0);
}

uint64_t sub_1BC06DF10(uint64_t isStackAllocationSafe, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_1BC06E090((_QWORD *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_1BC06E090((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x1BCCE9C40](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1BC06E090(unint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t j;
  unint64_t v19;
  id v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  char v32;
  uint64_t v33;
  unint64_t i;
  unint64_t v35;
  id v36;
  char v37;
  unint64_t v38;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  if (a3 >> 62)
    goto LABEL_38;
  v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v45 = v4;
  if (v5)
  {
    while (1)
    {
      v46 = a4 + 56;
      if ((v4 & 0xC000000000000001) != 0)
        break;
      v23 = 0;
      v41 = v4 + 32;
      v42 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      v43 = 0;
      while (v23 != v42)
      {
        v25 = *(id *)(v41 + 8 * v23);
        v4 = (uint64_t)v25;
        v26 = sub_1BC08A7B0();
        v27 = -1 << *(_BYTE *)(a4 + 32);
        v28 = v26 & ~v27;
        v29 = v28 >> 6;
        v30 = 1 << v28;
        if (((1 << v28) & *(_QWORD *)(v46 + 8 * (v28 >> 6))) != 0)
        {
          v4 = sub_1BBFDF744(0, &qword_1ED69DBB0);
          v31 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v28);
          v32 = sub_1BC08A7BC();

          if ((v32 & 1) != 0)
          {

          }
          else
          {
            v33 = ~v27;
            for (i = v28 + 1; ; i = v35 + 1)
            {
              v35 = i & v33;
              if (((*(_QWORD *)(v46 + (((i & v33) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v33)) & 1) == 0)
                goto LABEL_20;
              v36 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v35);
              v37 = sub_1BC08A7BC();

              if ((v37 & 1) != 0)
                break;
            }

            v29 = v35 >> 6;
            v30 = 1 << v35;
          }
          v38 = a1[v29];
          a1[v29] = v30 | v38;
          v24 = v5;
          if ((v30 & v38) == 0)
          {
            v9 = __OFADD__(v43++, 1);
            if (v9)
            {
              __break(1u);
LABEL_35:
              __break(1u);
              break;
            }
          }
        }
        else
        {
LABEL_20:

          v24 = v5;
        }
        if (++v23 == v24)
          goto LABEL_40;
      }
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      v5 = sub_1BC08AA80();
      v45 = v4;
      if (!v5)
        goto LABEL_39;
    }
    v43 = 0;
    v6 = 0;
    while (1)
    {
      v8 = MEMORY[0x1BCCE934C](v6, v45);
      v9 = __OFADD__(v6++, 1);
      if (v9)
        goto LABEL_35;
      v4 = v8;
      v10 = sub_1BC08A7B0();
      v11 = -1 << *(_BYTE *)(a4 + 32);
      v12 = v10 & ~v11;
      v13 = v12 >> 6;
      v14 = 1 << v12;
      if (((1 << v12) & *(_QWORD *)(v46 + 8 * (v12 >> 6))) == 0)
        goto LABEL_5;
      v4 = sub_1BBFDF744(0, &qword_1ED69DBB0);
      v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v12);
      v16 = sub_1BC08A7BC();

      if ((v16 & 1) == 0)
        break;
      swift_unknownObjectRelease();
LABEL_16:
      v22 = a1[v13];
      a1[v13] = v14 | v22;
      v7 = v5;
      if ((v14 & v22) == 0)
      {
        if (__OFADD__(v43, 1))
          goto LABEL_37;
        ++v43;
      }
LABEL_6:
      if (v6 == v7)
        goto LABEL_40;
    }
    v17 = ~v11;
    for (j = v12 + 1; ; j = v19 + 1)
    {
      v19 = j & v17;
      if (((*(_QWORD *)(v46 + (((j & v17) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v17)) & 1) == 0)
        break;
      v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v19);
      v21 = sub_1BC08A7BC();

      if ((v21 & 1) != 0)
      {
        swift_unknownObjectRelease();
        v13 = v19 >> 6;
        v14 = 1 << v19;
        goto LABEL_16;
      }
    }
LABEL_5:
    swift_unknownObjectRelease();
    v7 = v5;
    goto LABEL_6;
  }
LABEL_39:
  v43 = 0;
LABEL_40:
  swift_bridgeObjectRelease();
  swift_retain();
  return sub_1BC077098(a1, a2, v43, a4);
}

void sub_1BC06E448(unint64_t a1, uint64_t (*a2)(id, id))
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  void *v23;
  uint64_t v24;

  v24 = MEMORY[0x1E0DEE9D8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    v21 = 0;
    v2 = 0;
    v3 = 0;
    v4 = sub_1BC08AA2C() | 0x8000000000000000;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v2 = ~v5;
    v21 = a1 + 64;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v3 = v7 & *(_QWORD *)(a1 + 64);
    v4 = a1;
  }
  swift_bridgeObjectRetain();
  v8 = 0;
  v20 = (unint64_t)(v2 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_1BC08AA50())
      goto LABEL_36;
    sub_1BBFDF744(0, &qword_1ED69DBB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v23;
    swift_unknownObjectRelease();
    sub_1BBFDF744(0, &qword_1ED69C938);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v13 = v23;
    swift_unknownObjectRelease();
    v11 = v8;
    v9 = v3;
    if (!v23)
      goto LABEL_36;
LABEL_26:
    v18 = a2(v12, v13);

    v8 = v11;
    v3 = v9;
    if (v18)
    {
      MEMORY[0x1BCCE8E84]();
      if (*(_QWORD *)(v24 + 16) >= *(_QWORD *)(v24 + 24) >> 1)
        sub_1BC08A504();
      sub_1BC08A528();
      sub_1BC08A4E0();
      v8 = v11;
      v3 = v9;
    }
  }
  if (v3)
  {
    v9 = (v3 - 1) & v3;
    v10 = __clz(__rbit64(v3)) | (v8 << 6);
    v11 = v8;
LABEL_25:
    v16 = 8 * v10;
    v17 = *(void **)(*(_QWORD *)(v4 + 56) + v16);
    v12 = *(id *)(*(_QWORD *)(v4 + 48) + v16);
    v13 = v17;
    if (!v12)
      goto LABEL_36;
    goto LABEL_26;
  }
  v11 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v11 >= v20)
      goto LABEL_36;
    v14 = *(_QWORD *)(v21 + 8 * v11);
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v20)
        goto LABEL_36;
      v14 = *(_QWORD *)(v21 + 8 * v15);
      if (v14)
        goto LABEL_23;
      v15 = v8 + 3;
      if (v8 + 3 >= v20)
        goto LABEL_36;
      v14 = *(_QWORD *)(v21 + 8 * v15);
      if (v14)
        goto LABEL_23;
      v15 = v8 + 4;
      if (v8 + 4 >= v20)
        goto LABEL_36;
      v14 = *(_QWORD *)(v21 + 8 * v15);
      if (v14)
      {
LABEL_23:
        v11 = v15;
      }
      else
      {
        v11 = v8 + 5;
        if (v8 + 5 >= v20)
          goto LABEL_36;
        v14 = *(_QWORD *)(v21 + 8 * v11);
        if (!v14)
        {
          v19 = v8 + 6;
          while (v20 != v19)
          {
            v14 = *(_QWORD *)(v21 + 8 * v19++);
            if (v14)
            {
              v11 = v19 - 1;
              goto LABEL_24;
            }
          }
LABEL_36:
          sub_1BBFE2D28();
          return;
        }
      }
    }
LABEL_24:
    v9 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

uint64_t sub_1BC06E7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v41 = a2;
  sub_1BBFDB42C(0, (unint64_t *)&unk_1ED69DBE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v33 - v4;
  v34 = sub_1BC088F98();
  v6 = *(_QWORD *)(v34 - 8);
  v7 = MEMORY[0x1E0C80A78](v34);
  v40 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v39 = (char *)&v33 - v10;
  result = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v33 - v12;
  v44 = MEMORY[0x1E0DEE9D8];
  v38 = *(_QWORD *)(a1 + 16);
  if (v38)
  {
    v14 = 0;
    v15 = v34;
    v36 = v5;
    v37 = a1;
    while (v14 < *(_QWORD *)(a1 + 16))
    {
      v16 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v17 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v5, a1 + v16 + v17 * v14, v15);
      v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v35(v5, 0, 1, v15);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v5, 1, v15) == 1)
        goto LABEL_15;
      v42 = v17;
      v43 = v16;
      v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v18(v13, v5, v15);
      v19 = v13;
      v20 = v39;
      sub_1BC088F5C();
      v21 = v15;
      v22 = sub_1BC088F44();
      v24 = v23;
      v25 = *(void (**)(char *, uint64_t))(v6 + 8);
      v25(v20, v21);
      LOBYTE(v22) = sub_1BC04C92C(v22, v24, v41);
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
      {
        result = ((uint64_t (*)(char *, uint64_t))v25)(v19, v21);
        v5 = v36;
        v13 = v19;
        v15 = v21;
      }
      else
      {
        v18(v40, v19, v21);
        v26 = v44;
        v13 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1BBFE44F0(0, *(_QWORD *)(v26 + 16) + 1, 1);
          v26 = v44;
        }
        v5 = v36;
        v28 = v42;
        v27 = v43;
        v30 = *(_QWORD *)(v26 + 16);
        v29 = *(_QWORD *)(v26 + 24);
        v31 = v30 + 1;
        if (v30 >= v29 >> 1)
        {
          v43 = v30 + 1;
          sub_1BBFE44F0(v29 > 1, v30 + 1, 1);
          v31 = v43;
          v26 = v44;
        }
        *(_QWORD *)(v26 + 16) = v31;
        v32 = v26 + v27 + v30 * v28;
        v15 = v34;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v32, v40, v34);
        v44 = v26;
      }
      ++v14;
      a1 = v37;
      if (v38 == v14)
      {
        v35(v5, 1, 1, v15);
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, 1, 1, v34);
LABEL_15:
    swift_bridgeObjectRelease();
    sub_1BC01A8C0((uint64_t)v5);
    return v44;
  }
  return result;
}

void sub_1BC06EAD4(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  int64_t v23;
  uint64_t v24;
  void **v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  char *v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  unsigned int (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  id v59;
  uint64_t v60;

  v54 = sub_1BC089DE4();
  v2 = *(_QWORD *)(v54 - 8);
  v3 = MEMORY[0x1E0C80A78](v54);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v48 - v5;
  MEMORY[0x1E0C80A78](v4);
  v52 = (char *)&v48 - v7;
  sub_1BBFDB42C(0, (unint64_t *)&unk_1ED69DBE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v9 = MEMORY[0x1E0C80A78](v8);
  v58 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v48 - v11;
  v13 = sub_1BC088F98();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v48 - v18;
  v59 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_1BC0895A4();
  sub_1BC08958C();
  v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v57(v12, 1, v13) == 1)
  {
    sub_1BC01A8C0((uint64_t)v12);
    sub_1BC089DC0();
    v20 = sub_1BC089DD8();
    v21 = sub_1BC08A66C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1BBFD7000, v20, v21, "[Contact Photo] Could not access Health app group container directory", v22, 2u);
      MEMORY[0x1BCCE9C40](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v54);
  }
  else
  {
    v49 = v13;
    v50 = v14;
    v55 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v55(v19, v12, v13);
    v23 = *(_QWORD *)(a1 + 16);
    v24 = MEMORY[0x1E0DEE9D8];
    v51 = v2;
    v53 = v19;
    if (v23)
    {
      v60 = MEMORY[0x1E0DEE9D8];
      sub_1BBFE449C(0, v23, 0);
      v24 = v60;
      v25 = (void **)(a1 + 32);
      do
      {
        v26 = *v25++;
        v27 = v26;
        v28 = sub_1BC08937C();
        v30 = v29;

        v60 = v24;
        v32 = *(_QWORD *)(v24 + 16);
        v31 = *(_QWORD *)(v24 + 24);
        if (v32 >= v31 >> 1)
        {
          sub_1BBFE449C(v31 > 1, v32 + 1, 1);
          v24 = v60;
        }
        *(_QWORD *)(v24 + 16) = v32 + 1;
        v33 = v24 + 16 * v32;
        *(_QWORD *)(v33 + 32) = v28;
        *(_QWORD *)(v33 + 40) = v30;
        --v23;
      }
      while (v23);
    }
    v34 = sub_1BBFFA42C(v24);
    swift_bridgeObjectRelease();
    v35 = sub_1BC08A63C();
    v56 = v17;
    v36 = sub_1BC06E7B4(v35, v34);
    swift_bridgeObjectRelease();
    v37 = v49;
    v38 = *(_QWORD *)(v36 + 16);
    v39 = v50;
    if (v38)
    {
      v40 = v36 + ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80));
      v41 = *(_QWORD *)(v50 + 72);
      v42 = *(void (**)(char *, unint64_t, uint64_t))(v50 + 16);
      v49 = v36;
      swift_bridgeObjectRetain();
      while (1)
      {
        v43 = v58;
        v42(v58, v40, v37);
        v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
        v44(v43, 0, 1, v37);
        if (v57(v43, 1, v37) == 1)
          break;
        v45 = v37;
        v46 = (uint64_t)v56;
        v55(v56, v43, v45);
        sub_1BC06B908(v46, v59);
        v47 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
        v47(v46, v45);
        v40 += v41;
        --v38;
        v37 = v45;
        if (!v38)
        {
          v44(v58, 1, 1, v45);
          swift_bridgeObjectRelease_n();
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease_n();
      v47 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
LABEL_17:
      v47((uint64_t)v53, v37);

    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(char *, uint64_t))(v39 + 8))(v53, v37);
    }
  }
}

uint64_t type metadata accessor for FeedItemGeneratorPipelineManager()
{
  uint64_t result;

  result = qword_1ED69CBE0;
  if (!qword_1ED69CBE0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC06F320()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for FeedItemGeneratorPipelineManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BC06F390(uint64_t *a1)
{
  uint64_t v1;

  return sub_1BC06C574(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_1BC06F398()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED69C950;
  if (!qword_1ED69C950)
  {
    v1 = sub_1BBFDF744(255, &qword_1ED69DBB0);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED69C950);
  }
  return result;
}

void sub_1BC06F3F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69C9D0)
  {
    sub_1BBFDF744(255, &qword_1ED69DBB0);
    sub_1BBFDF744(255, &qword_1ED69C938);
    sub_1BC06F398();
    v0 = sub_1BC08AAC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69C9D0);
  }
}

uint64_t sub_1BC06F488()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC06F4AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC06F4D0()
{
  return objectdestroy_11Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1BC06F4DC(void **a1)
{
  uint64_t v1;

  return sub_1BC06BD94(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BC06F4E8()
{
  return swift_deallocObject();
}

uint64_t sub_1BC06F4F8()
{
  return sub_1BC06C210();
}

void sub_1BC06F500(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    sub_1BBFDB42C(255, a3, a4, a5);
    sub_1BBFE24A4();
    v6 = sub_1BC089FB8();
    if (!v7)
      atomic_store(v6, a2);
  }
}

unint64_t sub_1BC06F578()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED69AD50;
  if (!qword_1ED69AD50)
  {
    sub_1BC06F500(255, &qword_1ED69AD60, &qword_1ED69ADB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D848], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED69AD50);
  }
  return result;
}

void sub_1BC06F5E0()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED69A908)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC06F768(255, &qword_1ED69A9F0, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC06F678(&qword_1ED69A9E8, &qword_1ED69A9F0, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))v0, MEMORY[0x1E0C95D90]);
    v1 = sub_1BC089F40();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED69A908);
  }
}

uint64_t sub_1BC06F678(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1BC06F768(255, a2, a3);
    result = MEMORY[0x1BCCE9B68](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC06F6B8(void *a1, void *a2)
{
  uint64_t *v2;

  return sub_1BC06C864(a1, a2, v2);
}

void sub_1BC06F6C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69AA60)
  {
    sub_1BC06F768(255, &qword_1ED69A9F0, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
    v0 = sub_1BC08A534();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69AA60);
  }
}

uint64_t sub_1BC06F724()
{
  return objectdestroy_11Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1BC06F730(_BYTE *a1)
{
  uint64_t *v1;

  return sub_1BC06C964(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1BC06F73C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BC06F760(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC06CD4C(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_1BC06F768(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1BC06F7C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC06F7EC(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1 & 1;
  return v2(&v4);
}

uint64_t sub_1BC06F820()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BC06F84C(char a1, void *a2)
{
  uint64_t v2;

  return sub_1BC06D098(a1, a2, *(uint64_t (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

void sub_1BC06F858()
{
  uint64_t (*v0)(void);
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  if (!qword_1ED69B1D0)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC06F93C(255, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC06FA58();
    v1 = MEMORY[0x1E0C95D90];
    sub_1BC0708CC((unint64_t *)&unk_1ED69B288, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v0, MEMORY[0x1E0C95D90]);
    sub_1BBFDA9C0(&qword_1ED69B270, (uint64_t (*)(uint64_t))sub_1BC06FA58, v1);
    v2 = sub_1BC089EEC();
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1ED69B1D0);
  }
}

void sub_1BC06F93C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC06F9AC();
    v7 = v6;
    v8 = sub_1BBFE24A4();
    v9 = a3(a1, v7, v8, MEMORY[0x1E0DEDB38]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1BC06F9AC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  unint64_t TupleTypeMetadata2;
  uint64_t v2;

  if (!qword_1ED69B360)
  {
    v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
    sub_1BC0093BC(255, &qword_1ED69B358, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    sub_1BBFDB42C(255, (unint64_t *)&unk_1ED69DBE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], v0);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v2)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED69B360);
  }
}

void sub_1BC06FA58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B278)
  {
    sub_1BC0093BC(255, &qword_1ED69B2F0, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BBFE24A4();
    v0 = sub_1BC089FB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B278);
  }
}

uint64_t sub_1BC06FAE4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC06FB08(void *a1)
{
  uint64_t v1;

  return sub_1BC069C24(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1BC06FB10()
{
  return swift_deallocObject();
}

void sub_1BC06FB20(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BC069D14(a1, a2);
}

uint64_t sub_1BC06FB28()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BC06FB4C(uint64_t a1)
{
  uint64_t v1;

  sub_1BC069EEC(a1, *(NSObject **)(v1 + 16));
}

uint64_t sub_1BC06FB54(void *a1, uint64_t a2)
{
  return sub_1BC06A080(a1, a2);
}

uint64_t sub_1BC06FB5C(char *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, char *);
  uint64_t v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  v4 = *(_QWORD *)a1;
  sub_1BC06F9AC();
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_1BC06FBA0(unint64_t a1, uint64_t a2)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  void (*v40)(char *, uint64_t);
  id v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t (*v48)(void);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  char *v57;
  uint8_t *v58;
  uint8_t *v59;
  uint64_t v61;
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;

  v74 = a2;
  sub_1BC06F93C(0, &qword_1ED69B2E8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960C0]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v62 - v6;
  sub_1BC070368();
  v69 = *(_QWORD *)(v8 - 8);
  v70 = v8;
  MEMORY[0x1E0C80A78](v8);
  v68 = (char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC07046C();
  v72 = *(_QWORD *)(v10 - 8);
  v73 = v10;
  MEMORY[0x1E0C80A78](v10);
  v71 = (char *)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC070514();
  v76 = *(_QWORD *)(v12 - 8);
  v77 = v12;
  MEMORY[0x1E0C80A78](v12);
  v75 = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0706B0();
  v81 = v14;
  v79 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v78 = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC07078C();
  v17 = v16;
  v82 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v80 = (char *)v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC089DE4();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v19);
  v83 = (char *)v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)v62 - v23;
  sub_1BC089D90();
  swift_bridgeObjectRetain_n();
  v25 = sub_1BC089DD8();
  v26 = sub_1BC08A678();
  if (os_log_type_enabled(v25, v26))
  {
    v66 = v7;
    v27 = swift_slowAlloc();
    v67 = v5;
    v28 = (uint8_t *)v27;
    v29 = swift_slowAlloc();
    v64 = v19;
    v30 = v29;
    v85 = v29;
    v63 = v20;
    *(_DWORD *)v28 = 136380675;
    v62[1] = v28 + 4;
    v31 = v4;
    v32 = sub_1BBFDF744(0, &qword_1ED69B350);
    v33 = swift_bridgeObjectRetain();
    v34 = MEMORY[0x1BCCE8EA8](v33, v32);
    v65 = v17;
    v36 = v35;
    swift_bridgeObjectRelease();
    v37 = v34;
    v4 = v31;
    v7 = v66;
    v84 = sub_1BBFDE0F8(v37, v36, (uint64_t *)&v85);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    v17 = v65;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v25, v26, "[Contact Photo] Processing shared summary entries: %{private}s", v28, 0xCu);
    swift_arrayDestroy();
    v38 = v30;
    v19 = v64;
    MEMORY[0x1BCCE9C40](v38, -1, -1);
    v39 = v28;
    v5 = v67;
    MEMORY[0x1BCCE9C40](v39, -1, -1);

    v40 = *(void (**)(char *, uint64_t))(v63 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v40 = *(void (**)(char *, uint64_t))(v20 + 8);
  }
  v40(v24, v19);
  if (!(a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_11:
    sub_1BC06F9AC();
    sub_1BBFE24A4();
    sub_1BC08A06C();
    sub_1BC0708CC((unint64_t *)&unk_1ED69B2D8, &qword_1ED69B2E8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960C0], MEMORY[0x1E0C960D0]);
    v53 = sub_1BC08A180();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v53;
  }
  swift_bridgeObjectRetain();
  v61 = sub_1BC08AA80();
  swift_bridgeObjectRelease();
  if (!v61)
    goto LABEL_11;
LABEL_6:
  v41 = objc_msgSend((id)objc_opt_self(), sel_authorizationStatusForEntityType_, 0);
  if (v41 != (id)3)
  {
    v54 = (uint64_t)v41;
    sub_1BC089D90();
    v55 = sub_1BC089DD8();
    v56 = sub_1BC08A660();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = v7;
      v58 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v58 = 134217984;
      v85 = v54;
      sub_1BC08A7EC();
      _os_log_impl(&dword_1BBFD7000, v55, v56, "[Contact Photo] Contacts access not authorized. Current CNAuthorizationStatus: %ld", v58, 0xCu);
      v59 = v58;
      v7 = v57;
      MEMORY[0x1BCCE9C40](v59, -1, -1);
    }

    v40(v83, v19);
    goto LABEL_11;
  }
  v85 = a1;
  sub_1BC0093BC(0, &qword_1ED69B2F0, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC070404();
  v42 = v68;
  sub_1BC08A450();
  sub_1BBFE24A4();
  v43 = v70;
  v44 = v71;
  sub_1BC089F10();
  v45 = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v42, v43);
  MEMORY[0x1E0C80A78](v45);
  v62[-2] = v74;
  sub_1BC0705B4();
  v46 = v75;
  v47 = v73;
  sub_1BC089F1C();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v44, v47);
  sub_1BC06F9AC();
  v48 = MEMORY[0x1E0C95D78];
  sub_1BC06F93C(0, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BBFDA9C0(&qword_1ED69B200, (uint64_t (*)(uint64_t))sub_1BC070514, MEMORY[0x1E0C95C10]);
  sub_1BC0708CC((unint64_t *)&unk_1ED69B288, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v48, MEMORY[0x1E0C95D90]);
  v49 = v77;
  v50 = v78;
  sub_1BC08A1F8();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v46, v49);
  sub_1BBFDA9C0(&qword_1ED69B1B0, (uint64_t (*)(uint64_t))sub_1BC0706B0, MEMORY[0x1E0C95B78]);
  v52 = v80;
  v51 = v81;
  sub_1BC08A1BC();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v50, v51);
  sub_1BBFDA9C0(&qword_1EF3EE320, (uint64_t (*)(uint64_t))sub_1BC07078C, MEMORY[0x1E0C959F8]);
  v53 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v52, v17);
  return v53;
}

void sub_1BC070368()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B1F0)
  {
    sub_1BC0093BC(255, &qword_1ED69B2F0, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC070404();
    v0 = sub_1BC089F28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B1F0);
  }
}

unint64_t sub_1BC070404()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED69B2F8;
  if (!qword_1ED69B2F8)
  {
    sub_1BC0093BC(255, &qword_1ED69B2F0, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED69B2F8);
  }
  return result;
}

void sub_1BC07046C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B1E0)
  {
    sub_1BC0093BC(255, &qword_1ED69B2F0, &qword_1ED69B350, 0x1E0CB6C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BBFE24A4();
    sub_1BC070404();
    v0 = sub_1BC089F28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B1E0);
  }
}

void sub_1BC070514()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B208)
  {
    sub_1BBFDB42C(255, (unint64_t *)&unk_1ED69B300, (uint64_t (*)(uint64_t))sub_1BC0705B4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BBFE24A4();
    sub_1BC070650();
    v0 = sub_1BC089F28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B208);
  }
}

void sub_1BC0705B4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED69B368)
  {
    sub_1BBFDF744(255, &qword_1ED69B350);
    sub_1BC0093BC(255, &qword_1ED69B380, &qword_1ED69B378, 0x1E0C97200, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED69B368);
  }
}

unint64_t sub_1BC070650()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED69B310;
  if (!qword_1ED69B310)
  {
    sub_1BBFDB42C(255, (unint64_t *)&unk_1ED69B300, (uint64_t (*)(uint64_t))sub_1BC0705B4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED69B310);
  }
  return result;
}

void sub_1BC0706B0()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED69B1B8)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC06F93C(255, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC070514();
    sub_1BC0708CC((unint64_t *)&unk_1ED69B288, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v0, MEMORY[0x1E0C95D90]);
    sub_1BBFDA9C0(&qword_1ED69B200, (uint64_t (*)(uint64_t))sub_1BC070514, MEMORY[0x1E0C95C10]);
    v1 = sub_1BC089EEC();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED69B1B8);
  }
}

void sub_1BC07078C()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED69B168)
  {
    sub_1BC0706B0();
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC06F93C(255, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BBFDA9C0(&qword_1ED69B1B0, (uint64_t (*)(uint64_t))sub_1BC0706B0, MEMORY[0x1E0C95B78]);
    sub_1BC0708CC((unint64_t *)&unk_1ED69B288, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v0, MEMORY[0x1E0C95D90]);
    v1 = sub_1BC089EB0();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED69B168);
  }
}

id sub_1BC070868@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC06A668(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_1BC070870(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BBFDB42C(0, (unint64_t *)&unk_1ED69DBE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC0708CC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1BC06F93C(255, a2, a3);
    result = MEMORY[0x1BCCE9B68](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BC07090C()
{
  uint64_t (*v0)(void);
  uint64_t (*v1)(void);
  unint64_t v2;
  uint64_t v3;

  if (!qword_1EF3EE348)
  {
    v0 = MEMORY[0x1E0C964B8];
    sub_1BC06F93C(255, &qword_1EF3EE330, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C964B8]);
    v1 = MEMORY[0x1E0C95D78];
    sub_1BC06F93C(255, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0708CC(&qword_1EF3EE338, &qword_1EF3EE330, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v0, MEMORY[0x1E0C964C8]);
    sub_1BC0708CC((unint64_t *)&unk_1ED69B288, &qword_1ED69B298, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v1, MEMORY[0x1E0C95D90]);
    v2 = sub_1BC089EB0();
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1EF3EE348);
  }
}

void sub_1BC070A04(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1BC06AFC0(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_1BC070A1C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC06B0D8(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_1BC070A24()
{
  unint64_t result;

  result = qword_1EF3EE358;
  if (!qword_1EF3EE358)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF3EE358);
  }
  return result;
}

uint64_t sub_1BC070A78()
{
  return objectdestroy_11Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t objectdestroy_11Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 24));
  return swift_deallocObject();
}

id sub_1BC070ABC()
{
  uint64_t v0;

  return sub_1BC0689F4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1BC070AC8()
{
  return swift_deallocObject();
}

uint64_t sub_1BC070AD8()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1BC070B30()
{
  return sub_1BC0674F8();
}

uint64_t sub_1BC070B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BBFDAEA0(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ModelTrainingEvent.init(feedItemURL:eventKind:isPositive:date:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;

  v9 = *a2;
  v10 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  v11 = (int *)type metadata accessor for ModelTrainingEvent();
  *(_BYTE *)(a5 + v11[5]) = v9;
  *(_BYTE *)(a5 + v11[6]) = a3;
  v12 = a5 + v11[7];
  v13 = sub_1BC089028();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a4, v13);
}

uint64_t type metadata accessor for ModelTrainingEvent()
{
  uint64_t result;

  result = qword_1ED69DC00;
  if (!qword_1ED69DC00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ModelTrainingEvent.EventKind.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C6C657764;
  else
    return 7364980;
}

HealthPlatformCore::ModelTrainingEvent::EventKind_optional __swiftcall ModelTrainingEvent.EventKind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  HealthPlatformCore::ModelTrainingEvent::EventKind_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BC08AAE0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

HealthPlatformCore::ModelTrainingEvent::EventKind_optional sub_1BC070D08(Swift::String *a1)
{
  return ModelTrainingEvent.EventKind.init(rawValue:)(*a1);
}

void sub_1BC070D14(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7364980;
  if (*v1)
    v2 = 0x6C6C657764;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1BC070D48()
{
  sub_1BC072958();
  return sub_1BC08A4A4();
}

uint64_t sub_1BC070DA4()
{
  sub_1BC072958();
  return sub_1BC08A498();
}

uint64_t sub_1BC070DF0()
{
  sub_1BC08ABF4();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  return sub_1BC08AC18();
}

uint64_t sub_1BC070E64()
{
  sub_1BC08A408();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC070EB4()
{
  sub_1BC08ABF4();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  return sub_1BC08AC18();
}

uint64_t sub_1BC070F24(char *a1, char *a2)
{
  return sub_1BC00C71C(*a1, *a2);
}

uint64_t ModelTrainingEvent.feedItemURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BC088F98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ModelTrainingEvent.eventKind.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ModelTrainingEvent();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ModelTrainingEvent.isPositive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelTrainingEvent() + 24));
}

uint64_t ModelTrainingEvent.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ModelTrainingEvent() + 28);
  v4 = sub_1BC089028();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ModelTrainingEvent.hash(into:)()
{
  sub_1BC088F98();
  sub_1BBFDA9C0(&qword_1ED69B478, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
  sub_1BC08A36C();
  type metadata accessor for ModelTrainingEvent();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  sub_1BC08AC0C();
  sub_1BC089028();
  sub_1BBFDA9C0(&qword_1ED69B490, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  return sub_1BC08A36C();
}

uint64_t sub_1BC071104()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BC07113C + 4 * byte_1BC08DB30[*v0]))(0x6D65744964656566, 0xEB000000004C5255);
}

uint64_t sub_1BC07113C()
{
  return 0x6E694B746E657665;
}

uint64_t sub_1BC071158()
{
  return 0x697469736F507369;
}

uint64_t sub_1BC071174()
{
  return 1702125924;
}

uint64_t sub_1BC071184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BC072780(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BC0711A8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1BC0711B4()
{
  sub_1BC071DA0();
  return sub_1BC08AC84();
}

uint64_t sub_1BC0711DC()
{
  sub_1BC071DA0();
  return sub_1BC08AC90();
}

uint64_t ModelTrainingEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];

  v3 = v1;
  sub_1BC071E28(0, &qword_1ED69B6E8, MEMORY[0x1E0DED170]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC071DA0();
  sub_1BC08AC78();
  v11[15] = 0;
  sub_1BC088F98();
  sub_1BBFDA9C0(&qword_1ED69B470, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0010]);
  sub_1BC08AB40();
  if (!v2)
  {
    v11[14] = *(_BYTE *)(v3 + *(int *)(type metadata accessor for ModelTrainingEvent() + 20));
    v11[13] = 1;
    sub_1BC071DE4();
    sub_1BC08AB40();
    v11[12] = 2;
    sub_1BC08AB34();
    v11[11] = 3;
    sub_1BC089028();
    sub_1BBFDA9C0(&qword_1ED69B488, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    sub_1BC08AB40();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ModelTrainingEvent.hashValue.getter()
{
  sub_1BC08ABF4();
  sub_1BC088F98();
  sub_1BBFDA9C0(&qword_1ED69B478, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
  sub_1BC08A36C();
  type metadata accessor for ModelTrainingEvent();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  sub_1BC08AC0C();
  sub_1BC089028();
  sub_1BBFDA9C0(&qword_1ED69B490, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1BC08A36C();
  return sub_1BC08AC18();
}

uint64_t ModelTrainingEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v23 = a2;
  v25 = sub_1BC089028();
  v22 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v24 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1BC088F98();
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v27 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC071E28(0, &qword_1ED69C9D8, MEMORY[0x1E0DED048]);
  v26 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - v8;
  v10 = type metadata accessor for ModelTrainingEvent();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BC071DA0();
  v29 = v9;
  v13 = v30;
  sub_1BC08AC6C();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = v10;
  v14 = v7;
  v15 = (uint64_t)v12;
  v16 = (uint64_t)a1;
  v17 = v25;
  v35 = 0;
  sub_1BBFDA9C0(&qword_1ED69BA80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0038]);
  v18 = v26;
  sub_1BC08AB28();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v15, v27, v28);
  v33 = 1;
  sub_1BC071E84();
  sub_1BC08AB28();
  v19 = v21;
  *(_BYTE *)(v15 + *(int *)(v21 + 20)) = v34;
  v32 = 2;
  *(_BYTE *)(v15 + *(int *)(v19 + 24)) = sub_1BC08AB1C() & 1;
  v31 = 3;
  sub_1BBFDA9C0(&qword_1ED69BA88, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  sub_1BC08AB28();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v29, v18);
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v15 + *(int *)(v21 + 28), v24, v17);
  sub_1BC0608CC(v15, v23);
  __swift_destroy_boxed_opaque_existential_1(v16);
  return sub_1BC060910(v15);
}

uint64_t sub_1BC07189C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ModelTrainingEvent.init(from:)(a1, a2);
}

uint64_t sub_1BC0718B0(_QWORD *a1)
{
  return ModelTrainingEvent.encode(to:)(a1);
}

uint64_t sub_1BC0718C8()
{
  sub_1BC088F98();
  sub_1BBFDA9C0(&qword_1ED69B478, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
  sub_1BC08A36C();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  sub_1BC08AC0C();
  sub_1BC089028();
  sub_1BBFDA9C0(&qword_1ED69B490, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  return sub_1BC08A36C();
}

uint64_t sub_1BC0719C8()
{
  sub_1BC08ABF4();
  sub_1BC088F98();
  sub_1BBFDA9C0(&qword_1ED69B478, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
  sub_1BC08A36C();
  sub_1BC08A408();
  swift_bridgeObjectRelease();
  sub_1BC08AC0C();
  sub_1BC089028();
  sub_1BBFDA9C0(&qword_1ED69B490, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1BC08A36C();
  return sub_1BC08AC18();
}

uint64_t ModelTrainingEvent.debugDescription.getter()
{
  uint64_t v0;
  __int128 v2;

  BYTE8(v2) = 0;
  sub_1BC08A954();
  sub_1BC08A420();
  sub_1BC088F2C();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  *(_QWORD *)&v2 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelTrainingEvent() + 20));
  sub_1BC08AA20();
  sub_1BC08A420();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC089028();
  sub_1BBFDA9C0(&qword_1ED69DAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
  sub_1BC08AB64();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  return *(_QWORD *)((char *)&v2 + 1);
}

uint64_t _s18HealthPlatformCore18ModelTrainingEventV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v13;

  if ((MEMORY[0x1BCCE7954]() & 1) == 0)
    return 0;
  v4 = type metadata accessor for ModelTrainingEvent();
  v5 = *(int *)(v4 + 20);
  v6 = *(unsigned __int8 *)(a1 + v5);
  v7 = *(unsigned __int8 *)(a2 + v5);
  if (v6)
    v8 = 0x6C6C657764;
  else
    v8 = 7364980;
  if (v6)
    v9 = 0xE500000000000000;
  else
    v9 = 0xE300000000000000;
  if (v7)
    v10 = 0x6C6C657764;
  else
    v10 = 7364980;
  if (v7)
    v11 = 0xE500000000000000;
  else
    v11 = 0xE300000000000000;
  if (v8 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = sub_1BC08AB94();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
      return 0;
  }
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 24)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 24)))
    return 0;
  return sub_1BC089004();
}

unint64_t sub_1BC071DA0()
{
  unint64_t result;

  result = qword_1ED69DAE0;
  if (!qword_1ED69DAE0)
  {
    result = MEMORY[0x1BCCE9B68](&unk_1BC08DE48, &type metadata for ModelTrainingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED69DAE0);
  }
  return result;
}

unint64_t sub_1BC071DE4()
{
  unint64_t result;

  result = qword_1ED69B588;
  if (!qword_1ED69B588)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for ModelTrainingEvent.EventKind, &type metadata for ModelTrainingEvent.EventKind);
    atomic_store(result, (unint64_t *)&qword_1ED69B588);
  }
  return result;
}

void sub_1BC071E28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BC071DA0();
    v7 = a3(a1, &type metadata for ModelTrainingEvent.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BC071E84()
{
  unint64_t result;

  result = qword_1ED69BDE8;
  if (!qword_1ED69BDE8)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for ModelTrainingEvent.EventKind, &type metadata for ModelTrainingEvent.EventKind);
    atomic_store(result, (unint64_t *)&qword_1ED69BDE8);
  }
  return result;
}

unint64_t sub_1BC071ECC()
{
  unint64_t result;

  result = qword_1EF3EE3C0;
  if (!qword_1EF3EE3C0)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for ModelTrainingEvent.EventKind, &type metadata for ModelTrainingEvent.EventKind);
    atomic_store(result, (unint64_t *)&qword_1EF3EE3C0);
  }
  return result;
}

uint64_t sub_1BC071F10()
{
  return sub_1BBFDA9C0(&qword_1ED69B590, (uint64_t (*)(uint64_t))type metadata accessor for ModelTrainingEvent, (uint64_t)&protocol conformance descriptor for ModelTrainingEvent);
}

_QWORD *initializeBufferWithCopyOfBuffer for ModelTrainingEvent(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BC088F98();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_1BC089028();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for ModelTrainingEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 28);
  v6 = sub_1BC089028();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1BC089028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BC089028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1BC089028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t assignWithTake for ModelTrainingEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_1BC088F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1BC089028();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelTrainingEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC0722A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = sub_1BC088F98();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2)
      return v9 - 1;
    else
      return 0;
  }
  else
  {
    v10 = sub_1BC089028();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ModelTrainingEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BC072350(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_1BC088F98();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
      return result;
    }
    v10 = sub_1BC089028();
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_1BC0723F0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1BC088F98();
  if (v1 <= 0x3F)
  {
    result = sub_1BC089028();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ModelTrainingEvent.EventKind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC0724CC + 4 * byte_1BC08DB39[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BC072500 + 4 * byte_1BC08DB34[v4]))();
}

uint64_t sub_1BC072500(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC072508(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC072510);
  return result;
}

uint64_t sub_1BC07251C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC072524);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BC072528(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC072530(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelTrainingEvent.EventKind()
{
  return &type metadata for ModelTrainingEvent.EventKind;
}

uint64_t getEnumTagSinglePayload for ModelTrainingEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelTrainingEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BC072628 + 4 * byte_1BC08DB43[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BC07265C + 4 * byte_1BC08DB3E[v4]))();
}

uint64_t sub_1BC07265C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC072664(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BC07266CLL);
  return result;
}

uint64_t sub_1BC072678(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BC072680);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BC072684(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BC07268C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelTrainingEvent.CodingKeys()
{
  return &type metadata for ModelTrainingEvent.CodingKeys;
}

unint64_t sub_1BC0726AC()
{
  unint64_t result;

  result = qword_1EF3EE3C8;
  if (!qword_1EF3EE3C8)
  {
    result = MEMORY[0x1BCCE9B68](&unk_1BC08DE20, &type metadata for ModelTrainingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF3EE3C8);
  }
  return result;
}

unint64_t sub_1BC0726F4()
{
  unint64_t result;

  result = qword_1ED69DAF0[0];
  if (!qword_1ED69DAF0[0])
  {
    result = MEMORY[0x1BCCE9B68]("!VA+<^", &type metadata for ModelTrainingEvent.CodingKeys);
    atomic_store(result, qword_1ED69DAF0);
  }
  return result;
}

unint64_t sub_1BC07273C()
{
  unint64_t result;

  result = qword_1ED69DAE8;
  if (!qword_1ED69DAE8)
  {
    result = MEMORY[0x1BCCE9B68](&unk_1BC08DDB8, &type metadata for ModelTrainingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED69DAE8);
  }
  return result;
}

uint64_t sub_1BC072780(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D65744964656566 && a2 == 0xEB000000004C5255;
  if (v2 || (sub_1BC08AB94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E694B746E657665 && a2 == 0xE900000000000064 || (sub_1BC08AB94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697469736F507369 && a2 == 0xEA00000000006576 || (sub_1BC08AB94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1BC08AB94();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t sub_1BC072958()
{
  unint64_t result;

  result = qword_1ED69DAD8;
  if (!qword_1ED69DAD8)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for ModelTrainingEvent.EventKind, &type metadata for ModelTrainingEvent.EventKind);
    atomic_store(result, (unint64_t *)&qword_1ED69DAD8);
  }
  return result;
}

uint64_t sub_1BC07299C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  _QWORD v3[5];

  sub_1BBFE1C58(v0 + 64, (uint64_t)v3);
  sub_1BBFDC1EC(0, &qword_1ED69A1C0);
  type metadata accessor for SummaryTabRelevanceEngineCoordinator();
  if (swift_dynamicCast())
    return v2;
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_1BC08A954();
  sub_1BC08A420();
  sub_1BC08AA20();
  result = sub_1BC08AA74();
  __break(1u);
  return result;
}

uint64_t SummaryTabFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  _BYTE v19[40];

  v3 = v2;
  sub_1BBFDB42C(0, (unint64_t *)&unk_1ED69DBE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v18 - v7;
  v9 = sub_1BC088F98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBFE1C58(a1, (uint64_t)v19);
  v13 = type metadata accessor for SummaryTabRelevanceEngineCoordinator();
  sub_1BBFE1C58(a1, (uint64_t)v18);
  static SummaryTabRelevanceEngineCoordinator.defaultModelURL.getter();
  if (qword_1ED69A218 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED69A1F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v14, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  v15 = SummaryTabRelevanceEngineCoordinator.__allocating_init(healthExperienceStore:engineName:modelURL:pretrainedModelURL:)((uint64_t)v18, 0xD000000000000016, 0x80000001BC08FFB0, (uint64_t)v12, (uint64_t)v8);
  v18[3] = v13;
  v18[4] = &protocol witness table for SummaryTabRelevanceEngineCoordinator;
  v18[0] = v15;
  v16 = (*(uint64_t (**)(_BYTE *, uint64_t, _QWORD *))(v3 + 128))(v19, a2, v18);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v16;
}

uint64_t *SummaryTabFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  swift_allocObject();
  return SummaryTabFeedPopulationManager.init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(a1, a2, a3);
}

uint64_t *SummaryTabFeedPopulationManager.init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t *v17;
  _BYTE v19[24];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v4 = v3;
  v8 = (char *)v3
     + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain;
  v9 = sub_1BC0897CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager_trainingAnalyticsCache;
  v22[0] = MEMORY[0x1E0DEE9D8];
  sub_1BBFDB42C(0, &qword_1ED69D750, (uint64_t (*)(uint64_t))sub_1BC072E2C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2E5C8]);
  swift_allocObject();
  swift_retain();
  *(uint64_t *)((char *)v4 + v10) = sub_1BC089B38();
  swift_release();
  sub_1BBFE1C58(a1, (uint64_t)v22);
  sub_1BBFE1C58(a3, (uint64_t)v19);
  v11 = v20;
  v12 = v21;
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
  MEMORY[0x1E0C80A78](v13);
  v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v16 + 16))(v15);
  v17 = sub_1BC0862EC((uint64_t)v22, a2, (uint64_t)v15, v4, v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v17;
}

void sub_1BC072E2C(uint64_t a1)
{
  sub_1BBFDB42C(a1, &qword_1ED69D880, (uint64_t (*)(uint64_t))type metadata accessor for ModelTrainingEvent, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

void sub_1BC072E48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v3 = v2;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  v6 = (void *)sub_1BC0891C0();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v6;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v10[4] = sub_1BC0781A8;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1BBFE410C;
  v10[3] = &block_descriptor_12;
  v8 = _Block_copy(v10);
  v9 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBlock_, v8);
  _Block_release(v8);

}

uint64_t sub_1BC072F4C(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
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
  char *v15;
  id v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  void (*v23)(void *, uint64_t (*)(), uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v28 = a3;
  v6 = sub_1BC08A270();
  v27 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC08A2B8();
  v25 = *(_QWORD *)(v9 - 8);
  v26 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC08A27C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(a2[7], sel_profileIdentifier);
  v17 = NSManagedObjectContext.doesFeedEligibleForDisplayExist(kind:associatedProfileIdentifier:)(2, v16);

  if ((v17 & 1) != 0)
  {
    sub_1BBFDF744(0, (unint64_t *)&qword_1ED69DCD8);
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E0DEF528], v12);
    v18 = (void *)sub_1BC08A720();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v28;
    *(_QWORD *)(v19 + 24) = a4;
    aBlock[4] = sub_1BC0786CC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBFE410C;
    aBlock[3] = &block_descriptor_45;
    v20 = _Block_copy(aBlock);
    swift_retain();
    sub_1BC08A288();
    v29 = MEMORY[0x1E0DEE9D8];
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BC01DED0(0);
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD28, (uint64_t (*)(uint64_t))sub_1BC01DED0, MEMORY[0x1E0DEAF38]);
    sub_1BC08A834();
    MEMORY[0x1BCCE90DC](0, v11, v8, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
  }
  else
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v28;
    *(_QWORD *)(v22 + 24) = a4;
    v23 = (void (*)(void *, uint64_t (*)(), uint64_t))*((_QWORD *)*a2 + 17);
    swift_retain();
    v23(&unk_1E749F558, sub_1BC0786A8, v22);
  }
  return swift_release();
}

uint64_t sub_1BC073274(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;

  v6 = v5;
  v59 = a1;
  v60 = a2;
  v61 = *v5;
  v10 = sub_1BC089DE4();
  v57 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v48 - v14;
  v58 = *(_QWORD *)(a3 + 16);
  if (v58)
  {
    v49 = a4;
    v50 = a5;
    v56 = v5 + 8;
    swift_bridgeObjectRetain();
    v16 = 0;
    *(_QWORD *)&v17 = 136315394;
    v52 = v17;
    v51 = MEMORY[0x1E0DEE9B8] + 8;
    v54 = v5;
    v55 = a3;
    v53 = v10;
    do
    {
      v18 = *(unsigned __int8 *)(a3 + v16 + 32);
      sub_1BC089D9C();
      v19 = sub_1BC089DD8();
      v20 = sub_1BC08A678();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc();
        v22 = swift_slowAlloc();
        v62 = v22;
        *(_DWORD *)v21 = v52;
        v23 = sub_1BC08AC9C();
        *(_QWORD *)(v21 + 4) = sub_1BBFDE0F8(v23, v24, &v62);
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2082;
        v25 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        *(_QWORD *)(v21 + 14) = sub_1BBFDE0F8(v25, v26, &v62);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BBFD7000, v19, v20, "******** [%s] populating feed: %{public}s *******", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        v27 = v22;
        v6 = v54;
        MEMORY[0x1BCCE9C40](v27, -1, -1);
        v28 = v21;
        v10 = v53;
        MEMORY[0x1BCCE9C40](v28, -1, -1);
      }

      v29 = *(void (**)(char *, uint64_t))(v57 + 8);
      v29(v15, v10);
      v30 = v6[11];
      v31 = v6[12];
      __swift_project_boxed_opaque_existential_1(v56, v30);
      v32 = RelevanceEngineCoordinator.sortedElements(for:)(v18, v30, v31);
      sub_1BC04D290(v18, v32, v59, v60);
      swift_bridgeObjectRelease();
      sub_1BC089D9C();
      v33 = sub_1BC089DD8();
      v34 = sub_1BC08A678();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v62 = v36;
        *(_DWORD *)v35 = v52;
        v37 = sub_1BC08AC9C();
        *(_QWORD *)(v35 + 4) = sub_1BBFDE0F8(v37, v38, &v62);
        swift_bridgeObjectRelease();
        *(_WORD *)(v35 + 12) = 2082;
        v39 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        *(_QWORD *)(v35 + 14) = sub_1BBFDE0F8(v39, v40, &v62);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BBFD7000, v33, v34, "******** [%s] feed population finished for %{public}s *******", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        v41 = v36;
        v6 = v54;
        MEMORY[0x1BCCE9C40](v41, -1, -1);
        v42 = v35;
        v10 = v53;
        MEMORY[0x1BCCE9C40](v42, -1, -1);
      }

      v29(v13, v10);
      a3 = v55;
      ++v16;
    }
    while (v58 != v16);
    swift_bridgeObjectRelease();
    a4 = v49;
    a5 = v50;
  }
  v43 = v6[11];
  v44 = v6[12];
  __swift_project_boxed_opaque_existential_1(v6 + 8, v43);
  v45 = (_QWORD *)swift_allocObject();
  v45[2] = a3;
  v45[3] = a4;
  v46 = v61;
  v45[4] = a5;
  v45[5] = v46;
  swift_bridgeObjectRetain();
  swift_retain();
  RelevanceEngineCoordinator.saveModelToDisk(completion:)((uint64_t)sub_1BC0781C4, (uint64_t)v45, v43, v44);
  return swift_release();
}

uint64_t sub_1BC073690(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;

  v6 = sub_1BC089DE4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  swift_bridgeObjectRetain_n();
  v10 = sub_1BC089DD8();
  v11 = sub_1BC08A678();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v24 = v7;
    v13 = v12;
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136315394;
    v26 = a3;
    v15 = sub_1BC08AC9C();
    v27 = sub_1BBFDE0F8(v15, v16, &v28);
    v25 = a4;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x1BCCE8EA8](v17, MEMORY[0x1E0D2E570]);
    v23 = v6;
    v20 = v19;
    swift_bridgeObjectRelease();
    v27 = sub_1BBFDE0F8(v18, v20, &v28);
    a3 = v26;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v10, v11, "[%s] Saved model and updated novelty counts after populating feeds %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v14, -1, -1);
    MEMORY[0x1BCCE9C40](v13, -1, -1);

    v21 = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v9, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v21 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return a3(v21);
}

uint64_t sub_1BC0738D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  sub_1BBFE1B28();
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v8 = &v13[-v7];
  v9 = v1
     + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain;
  swift_beginAccess();
  sub_1BBFDB550(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BBFE1B28);
  v10 = sub_1BC0897CC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(a1, v8, v10);
  sub_1BBFE1BD4((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BBFE1B28);
  sub_1BC073A50(v1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_1BBFEEDA8((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_1BC073A50(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;

  v1 = *(_QWORD *)((*(uint64_t (**)(void))(*(_QWORD *)a1 + 248))() + 16);
  if (v1)
  {
    for (i = 0; i != v1; ++i)
    {
      v3 = sub_1BC089A90();
      sub_1BC0196B4(v3);
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1ED69A1F0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_1BC08976C();
}

uint64_t sub_1BC073B38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1BC089A9C();
  v1 = sub_1BBFFD3A0(v0);
  swift_bridgeObjectRelease();
  v2 = sub_1BC089AC0();
  v3 = sub_1BBFFD3A0(v2);
  swift_bridgeObjectRelease();
  v4 = sub_1BC07733C(v3, v1, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_1BC0774C8);
  swift_bridgeObjectRelease();
  v5 = sub_1BBFF245C(v4);
  swift_release();
  return v5;
}

uint64_t sub_1BC073BC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v2 = sub_1BC0897CC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v13 - v7;
  v9 = sub_1BC0897B4();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, a1, v2);
  if ((v9 & 1) != 0)
  {
    v10 = 0;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    sub_1BC0738D8((uint64_t)v6);
    v10 = sub_1BC0897C0();
    v11 = *(void (**)(char *, uint64_t))(v3 + 8);
    v11(v6, v2);
    v11(v8, v2);
  }
  return v10 & 1;
}

uint64_t sub_1BC073CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
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
  char *v46;
  uint64_t v47;
  _QWORD aBlock[6];
  __int128 v49[3];

  v44 = a3;
  v45 = a4;
  v43 = a1;
  v6 = *v4;
  v7 = sub_1BC08A270();
  v42 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_1BC08A2B8();
  v10 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v46 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC089DE4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  v16 = sub_1BC089DD8();
  v17 = sub_1BC08A678();
  if (os_log_type_enabled(v16, v17))
  {
    v39 = v7;
    v18 = swift_slowAlloc();
    v36 = a2;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v37 = v10;
    v21 = v20;
    *(_QWORD *)&v49[0] = v20;
    v38 = v9;
    *(_DWORD *)v19 = 136315138;
    aBlock[0] = v6;
    swift_getMetatypeMetadata();
    v22 = sub_1BC08A3E4();
    v35 = v12;
    aBlock[0] = sub_1BBFDE0F8(v22, v23, (uint64_t *)v49);
    v9 = v38;
    v7 = v39;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v16, v17, "[%s]: Enqueuing submitTraining", v19, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    v10 = v37;
    MEMORY[0x1BCCE9C40](v24, -1, -1);
    v25 = v19;
    a2 = v36;
    MEMORY[0x1BCCE9C40](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  v26 = v40;
  sub_1BBFE1C58(a2, (uint64_t)v49);
  v27 = (_QWORD *)swift_allocObject();
  v28 = v43;
  v27[2] = v26;
  v27[3] = v28;
  sub_1BBFE95C8(v49, (uint64_t)(v27 + 4));
  v30 = v44;
  v29 = v45;
  v27[9] = v44;
  v27[10] = v29;
  v27[11] = v6;
  aBlock[4] = sub_1BC078214;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBFE410C;
  aBlock[3] = &block_descriptor_9;
  v31 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1BBFE6078(v30);
  v32 = v46;
  sub_1BC08A288();
  v47 = MEMORY[0x1E0DEE9D8];
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC01DED0(0);
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD28, (uint64_t (*)(uint64_t))sub_1BC01DED0, MEMORY[0x1E0DEAF38]);
  sub_1BC08A834();
  MEMORY[0x1BCCE90DC](0, v32, v9, v31);
  _Block_release(v31);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v32, v41);
  return swift_release();
}

uint64_t sub_1BC0740A0(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a3;
  v11 = sub_1BC089DE4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  v15 = sub_1BC089DD8();
  v16 = sub_1BC08A678();
  if (os_log_type_enabled(v15, v16))
  {
    v32 = a4;
    v17 = swift_slowAlloc();
    v30 = v12;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v29 = v11;
    v20 = v19;
    *(_DWORD *)v18 = 136315138;
    v28 = v18 + 4;
    v34 = v19;
    v35 = a6;
    swift_getMetatypeMetadata();
    v21 = sub_1BC08A3E4();
    v31 = a5;
    v35 = sub_1BBFDE0F8(v21, v22, &v34);
    sub_1BC08A7EC();
    a5 = v31;
    a4 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v15, v16, "[%s]: submitTraining dequeued and executing", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v20, -1, -1);
    MEMORY[0x1BCCE9C40](v18, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v14, v29);
  }
  else
  {

    v23 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  MEMORY[0x1E0C80A78](v23);
  *(&v28 - 2) = (uint8_t *)a2;
  swift_retain();
  sub_1BC089B20();
  swift_release();
  v24 = a1[11];
  v25 = a1[12];
  __swift_project_boxed_opaque_existential_1(a1 + 8, v24);
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = a4;
  v26[3] = a5;
  v26[4] = a6;
  sub_1BBFE6078(a4);
  RelevanceEngineCoordinator.submitTraining(trainingEvents:store:completion:)(a2, v33, (uint64_t)sub_1BC078620, (uint64_t)v26, v24, v25);
  return swift_release();
}

uint64_t sub_1BC074344(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t result;
  uint64_t v27;
  char *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v6 = sub_1BC08A270();
  v44 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v43 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC08A2B8();
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  MEMORY[0x1E0C80A78](v8);
  v40 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC08A27C();
  v39 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v38 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC089DE4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  v16 = sub_1BC089DD8();
  v17 = sub_1BC08A678();
  if (os_log_type_enabled(v16, v17))
  {
    v35 = a1;
    v18 = swift_slowAlloc();
    v36 = v6;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v37 = a2;
    v21 = v20;
    v45 = v20;
    aBlock[0] = a3;
    v34 = v10;
    *(_DWORD *)v19 = 136315138;
    swift_getMetatypeMetadata();
    v22 = sub_1BC08A3E4();
    aBlock[0] = sub_1BBFDE0F8(v22, v23, &v45);
    v10 = v34;
    a1 = v35;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v16, v17, "[%s]: submitTraining finished", v19, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    a2 = v37;
    MEMORY[0x1BCCE9C40](v24, -1, -1);
    v25 = v19;
    v6 = v36;
    MEMORY[0x1BCCE9C40](v25, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (a1)
  {
    sub_1BBFDF744(0, (unint64_t *)&qword_1ED69DCD8);
    v28 = v38;
    v27 = v39;
    (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v38, *MEMORY[0x1E0DEF528], v10);
    swift_retain();
    v29 = (void *)sub_1BC08A720();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v10);
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = a1;
    *(_QWORD *)(v30 + 24) = a2;
    aBlock[4] = sub_1BC047244;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBFE410C;
    aBlock[3] = &block_descriptor_36;
    v31 = _Block_copy(aBlock);
    swift_retain();
    v32 = v40;
    sub_1BC08A288();
    v45 = MEMORY[0x1E0DEE9D8];
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BC01DED0(0);
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD28, (uint64_t (*)(uint64_t))sub_1BC01DED0, MEMORY[0x1E0DEAF38]);
    v33 = v43;
    sub_1BC08A834();
    MEMORY[0x1BCCE90DC](0, v32, v33, v31);
    _Block_release(v31);

    sub_1BBFE60FC(a1);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v6);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v42);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BC074760()
{
  uint64_t v0;

  sub_1BBFE1BD4(v0 + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain, (uint64_t (*)(_QWORD))sub_1BBFE1B28);
  return swift_release();
}

uint64_t SummaryTabFeedPopulationManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  sub_1BBFE1BD4(v0 + OBJC_IVAR____TtC18HealthPlatformCore31SummaryTabFeedPopulationManager____lazy_storage___pertinentChangeDomain, (uint64_t (*)(_QWORD))sub_1BBFE1B28);
  swift_release();
  return v0;
}

uint64_t SummaryTabFeedPopulationManager.__deallocating_deinit()
{
  SummaryTabFeedPopulationManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1BC074824()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t sub_1BC074830()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t sub_1BC07483C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t SummaryTabFeedPopulationManager.collectDiagnosticLogs(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = MEMORY[0x1E0DEE9D8];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v5;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1BC0750CC((uint64_t)sub_1BC078250, (uint64_t)v6);
  swift_release();
  return swift_release();
}

uint64_t sub_1BC0748F0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t (*v23)(_QWORD);
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  void (*v35)(char *, void **, uint64_t);
  unint64_t v36;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  _QWORD v53[2];
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[3];
  uint64_t v61;

  v58 = a4;
  v59 = a5;
  v8 = sub_1BC089DE4();
  v56 = *(_QWORD *)(v8 - 8);
  v57 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v55 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v53 - v11;
  v13 = sub_1BC088F98();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v53 - v18;
  sub_1BC078370();
  MEMORY[0x1E0C80A78](v20);
  v22 = (void **)((char *)v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BBFDB550(a1, (uint64_t)v22, v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = *v22;
    sub_1BC089D9C();
    v25 = v24;
    v26 = v24;
    v27 = sub_1BC089DD8();
    v28 = sub_1BC08A660();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v60[0] = v30;
      *(_DWORD *)v29 = 136315138;
      v53[1] = v29 + 4;
      v61 = (uint64_t)v24;
      v31 = v24;
      sub_1BBFDC1EC(0, (unint64_t *)&qword_1ED69DAA0);
      v32 = sub_1BC08A3E4();
      v61 = sub_1BBFDE0F8(v32, v33, v60);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BBFD7000, v27, v28, "Unable to get database diagnostics: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v30, -1, -1);
      MEMORY[0x1BCCE9C40](v29, -1, -1);

    }
    else
    {

    }
    v41 = v56;
    v40 = v57;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v57);
  }
  else
  {
    v34 = (unint64_t *)(a2 + 16);
    v35 = *(void (**)(char *, void **, uint64_t))(v14 + 32);
    v35(v19, v22, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    swift_beginAccess();
    v36 = *(_QWORD *)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a2 + 16) = v36;
    v54 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v36 = sub_1BBFDDFD8(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
      *v34 = v36;
    }
    v39 = *(_QWORD *)(v36 + 16);
    v38 = *(_QWORD *)(v36 + 24);
    if (v39 >= v38 >> 1)
    {
      v36 = sub_1BBFDDFD8(v38 > 1, v39 + 1, 1, v36);
      *v34 = v36;
    }
    *(_QWORD *)(v36 + 16) = v39 + 1;
    v35((char *)(v36+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v39), (void **)v17, v13);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    a2 = v54;
    v41 = v56;
    v40 = v57;
  }
  v42 = v55;
  sub_1BC089D9C();
  v43 = sub_1BC089DD8();
  v44 = sub_1BC08A678();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_1BBFD7000, v43, v44, "Database logs collected. Now collecting RelevanceEngine logs", v45, 2u);
    MEMORY[0x1BCCE9C40](v45, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v40);
  v46 = a3[11];
  v47 = a3[12];
  __swift_project_boxed_opaque_existential_1(a3 + 8, v46);
  v48 = sub_1BC089A9C();
  v49 = (_QWORD *)swift_allocObject();
  v49[2] = a3;
  v49[3] = a2;
  v50 = v59;
  v49[4] = v58;
  v49[5] = v50;
  v51 = *(void (**)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v47 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  v51(v48, sub_1BC078564, v49, v46, v47);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1BC074DE8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v7 = a1[11];
  v8 = a1[12];
  __swift_project_boxed_opaque_existential_1(a1 + 8, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  swift_retain();
  swift_retain();
  RelevanceEngineCoordinator.collectDiagnosticLogs(completion:)((uint64_t)sub_1BC0785BC, (uint64_t)v9, v7, v8);
  return swift_release();
}

uint64_t sub_1BC074E8C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  unint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v28[2];
  void (*v29)(uint64_t);

  v28[1] = a4;
  v29 = a3;
  v6 = sub_1BC088F98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC089DE4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (unint64_t *)(a2 + 16);
  sub_1BC089D9C();
  v15 = sub_1BC089DD8();
  v16 = sub_1BC08A678();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v28[0] = v9;
    v18 = v6;
    v19 = a1;
    v20 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1BBFD7000, v15, v16, "RelevanceEngine logs collected", v17, 2u);
    v21 = v20;
    a1 = v19;
    v6 = v18;
    v9 = (char *)v28[0];
    MEMORY[0x1BCCE9C40](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  swift_beginAccess();
  v22 = *v14;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v14 = v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v22 = sub_1BBFDDFD8(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
    *v14 = v22;
  }
  v25 = *(_QWORD *)(v22 + 16);
  v24 = *(_QWORD *)(v22 + 24);
  if (v25 >= v24 >> 1)
  {
    v22 = sub_1BBFDDFD8(v24 > 1, v25 + 1, 1, v22);
    *v14 = v22;
  }
  *(_QWORD *)(v22 + 16) = v25 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v25, v9, v6);
  swift_endAccess();
  v26 = swift_bridgeObjectRetain();
  v29(v26);
  return swift_bridgeObjectRelease();
}

void sub_1BC0750CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v3 = v2;
  v6 = objc_msgSend(*(id *)(v2 + 56), sel_profileIdentifier);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  v7 = (void *)sub_1BC0891C0();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v3;
  v8[4] = a1;
  v8[5] = a2;
  v11[4] = sub_1BC078364;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1BBFE410C;
  v11[3] = &block_descriptor_21_0;
  v9 = _Block_copy(v11);
  v10 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_performBlock_, v9);

  _Block_release(v9);
}

uint64_t sub_1BC0751F8(void *a1, unint64_t a2, void (*a3)(uint64_t), uint64_t a4)
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  char *v52;
  BOOL v53;
  unint64_t v54;
  id v55;
  void *v56;
  id v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t result;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  void (*v87)(id *, _QWORD);
  void *v88;
  void *v89;
  char *v90;
  void *v91;
  char *v92;
  void *v93;
  id v94;
  char *v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t);
  _QWORD *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  unint64_t v138;
  unint64_t v139;
  void *v140;
  unint64_t v141;
  id v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unsigned __int8 v146;
  _QWORD *v147;
  id v148;
  unint64_t v149;
  id v150;
  unint64_t v151;

  v110 = a4;
  v111 = a3;
  sub_1BC078370();
  v109 = v6;
  MEMORY[0x1E0C80A78](v6);
  v112 = (uint64_t *)((char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v108 = sub_1BC08A3D8();
  v107 = *(_QWORD *)(v108 - 8);
  MEMORY[0x1E0C80A78](v108);
  v136 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = sub_1BC088F98();
  v135 = *(_QWORD *)(v117 - 8);
  v9 = MEMORY[0x1E0C80A78](v117);
  v116 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v137 = (char *)&v102 - v11;
  v115 = sub_1BC0890D0();
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x1E0C80A78](v115);
  v113 = (char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBFDB42C(0, (unint64_t *)&qword_1ED69BB18, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v131 = v13;
  MEMORY[0x1E0C80A78](v13);
  v130 = (char *)&v102 - v14;
  v134 = sub_1BC089028();
  v133 = *(_QWORD *)(v134 - 8);
  MEMORY[0x1E0C80A78](v134);
  v132 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = 0;
  v143 = 0xE000000000000000;
  sub_1BC08A954();
  swift_bridgeObjectRelease();
  v142 = (id)0xD000000000000016;
  v143 = 0x80000001BC091C80;
  v140 = a1;
  v16 = objc_msgSend(a1, sel_description);
  sub_1BC08A3C0();

  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  v150 = v142;
  v151 = v143;
  v17 = *(_QWORD *)(sub_1BC089AA8() + 16);
  v141 = a2;
  if (v17)
  {
    sub_1BC089AFC();
    v18 = 0;
    v19 = (_QWORD *)(a2 + 16);
    v138 = 0x80000001BC091CC0;
    v139 = 0x80000001BC091CA0;
    do
    {
      __swift_project_boxed_opaque_existential_1(v19, *(_QWORD *)(a2 + 40));
      v21 = (void *)sub_1BC0891C0();
      v22 = (void *)sub_1BC089AF0();
      v23 = (void *)sub_1BC089898();

      if (v23)
      {
        v142 = (id)sub_1BC089A78();
        v143 = v20;
        swift_bridgeObjectRetain();
        sub_1BC08A420();
        swift_bridgeObjectRelease();
        sub_1BC08A420();

      }
      else
      {
        v142 = 0;
        v143 = 0xE000000000000000;
        sub_1BC08A954();
        swift_bridgeObjectRelease();
        v142 = (id)0xD000000000000010;
        v143 = v139;
        sub_1BC089A84();
        sub_1BC08A420();
        swift_bridgeObjectRelease();
        sub_1BC08A420();
        sub_1BC08A420();
      }
      ++v18;
      swift_bridgeObjectRelease();
      a2 = v141;
    }
    while (v17 != v18);
  }
  swift_bridgeObjectRelease();
  sub_1BBFDF744(0, (unint64_t *)&qword_1ED69DB88);
  sub_1BC00A718();
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1BC08B950;
  *(_QWORD *)(v24 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v24 + 64) = sub_1BBFDF700();
  *(_QWORD *)(v24 + 32) = 0x7463655364656566;
  *(_QWORD *)(v24 + 40) = 0xEB000000006E6F69;
  v25 = (void *)sub_1BC08A5E8();
  sub_1BC089C4C();
  v26 = MEMORY[0x1E0DED1E8];
  sub_1BBFDA924(0, (unint64_t *)&qword_1ED69DBD0, MEMORY[0x1E0D2D700], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1BC08B960;
  v28 = v140;
  *(_QWORD *)(v27 + 32) = v140;
  *(_QWORD *)(v27 + 40) = 0;
  v29 = v28;
  v30 = (void *)MEMORY[0x1BCCE8614](v27);
  v31 = swift_bridgeObjectRelease();
  v32 = (void *)MEMORY[0x1BCCE8578](v31);
  sub_1BBFDA924(0, (unint64_t *)&qword_1ED69BA48, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))v26);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1BC08B940;
  *(_QWORD *)(v33 + 32) = v25;
  *(_QWORD *)(v33 + 40) = v30;
  v142 = (id)v33;
  sub_1BC08A4E0();
  v104 = v25;
  v105 = v30;
  v34 = (void *)sub_1BC08A4BC();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v34);

  objc_msgSend(v32, sel_setPredicate_, v35);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1BC08B600;
  v37 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  v38 = (void *)sub_1BC08A3B4();
  v39 = objc_msgSend(v37, sel_initWithKey_ascending_, v38, 1);

  *(_QWORD *)(v36 + 32) = v39;
  v142 = (id)v36;
  sub_1BC08A4E0();
  sub_1BBFDF744(0, &qword_1ED69DBA8);
  v40 = (void *)sub_1BC08A4BC();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setSortDescriptors_, v40);

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v141 + 16), *(_QWORD *)(v141 + 40));
  v41 = (void *)sub_1BC0891C0();
  v106 = v32;
  v42 = sub_1BC08A78C();
  v103 = 0;
  v120 = v42;

  v142 = 0;
  v143 = 0xE000000000000000;
  sub_1BC08A954();
  sub_1BC08A420();
  v43 = v120 >> 62;
  v45 = v136;
  v44 = v137;
  v46 = v135;
  if (v120 >> 62)
  {
LABEL_49:
    swift_bridgeObjectRetain();
    v47 = sub_1BC08AA80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v47 = *(_QWORD *)((v120 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v144 = v47;
  sub_1BC08AB64();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  if (v43)
  {
    swift_bridgeObjectRetain();
    v48 = sub_1BC08AA80();
    swift_bridgeObjectRelease();
    if (!v48)
      goto LABEL_43;
  }
  else
  {
    v48 = *(_QWORD *)((v120 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v48)
    {
LABEL_43:
      swift_bridgeObjectRelease();
      v88 = v103;
      v89 = (void *)objc_opt_self();
      v90 = v132;
      sub_1BC08901C();
      v91 = (void *)sub_1BC088FEC();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v90, v134);
      v92 = v113;
      sub_1BC0890C4();
      v93 = (void *)sub_1BC0890B8();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v92, v115);
      v94 = objc_msgSend(v89, sel_stringFromDate_timeZone_formatOptions_, v91, v93, 1907);

      sub_1BC08A3C0();
      v142 = 0;
      v143 = 0xE000000000000000;
      sub_1BC08A954();
      sub_1BC08A420();
      sub_1BC08A420();
      swift_bridgeObjectRelease();
      sub_1BC08A420();
      sub_1BC0895A4();
      v95 = v116;
      sub_1BC089580();
      sub_1BC088F74();
      swift_bridgeObjectRelease();
      v96 = *(void (**)(char *, uint64_t))(v46 + 8);
      v97 = v95;
      v98 = v117;
      v96(v97, v117);
      v142 = v150;
      v143 = v151;
      sub_1BC08A3CC();
      sub_1BC00BC4C();
      sub_1BC08A810();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v45, v108);
      swift_bridgeObjectRelease();
      if (v88)
      {
        v96(v44, v98);
        v99 = (uint64_t)v112;
        *v112 = v88;
        swift_storeEnumTagMultiPayload();
        v100 = v88;
        v111(v99);

        return sub_1BBFE1BD4(v99, (uint64_t (*)(_QWORD))sub_1BC078370);
      }
      else
      {
        v101 = (uint64_t)v112;
        (*(void (**)(_QWORD *, char *, uint64_t))(v46 + 16))(v112, v44, v98);
        swift_storeEnumTagMultiPayload();
        v111(v101);

        sub_1BBFE1BD4(v101, (uint64_t (*)(_QWORD))sub_1BC078370);
        return ((uint64_t (*)(char *, uint64_t))v96)(v44, v98);
      }
    }
  }
  v49 = 0;
  v129 = v120 & 0xC000000000000001;
  v119 = v120 & 0xFFFFFFFFFFFFFF8;
  v118 = v120 + 32;
  v128 = 0x80000001BC091D90;
  v127 = 0x80000001BC091DB0;
  v126 = 0x80000001BC091DD0;
  v125 = 0x80000001BC091DF0;
  v124 = 0x80000001BC091E10;
  v123 = 0x80000001BC091E30;
  v121 = 0x80000001BC091E50;
  v122 = v48;
  while (1)
  {
    if (v129)
    {
      v52 = (char *)MEMORY[0x1BCCE934C](v49, v120);
    }
    else
    {
      if (v49 >= *(_QWORD *)(v119 + 16))
        goto LABEL_48;
      v52 = (char *)*(id *)(v118 + 8 * v49);
    }
    v44 = v52;
    v53 = __OFADD__(v49, 1);
    v54 = v49 + 1;
    if (v53)
    {
      __break(1u);
      goto LABEL_47;
    }
    v139 = v54;
    v142 = 0;
    v143 = 0xE000000000000000;
    sub_1BC08A954();
    v148 = v142;
    v149 = v143;
    sub_1BC08A420();
    v55 = objc_msgSend(v44, sel_uniqueIdentifier);
    sub_1BC08A3C0();

    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v142 = (id)sub_1BC089BF8();
    sub_1BC019144();
    sub_1BBFDA9C0(&qword_1ED69ABA8, (uint64_t (*)(uint64_t))sub_1BC019144, MEMORY[0x1E0DEB3E0]);
    v56 = (void *)sub_1BC08A5AC();
    swift_bridgeObjectRelease();
    sub_1BC0893A0();

    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v57 = objc_msgSend(v44, sel_dateSubmitted);
    v58 = v132;
    sub_1BC089010();

    sub_1BBFDA9C0(&qword_1ED69DAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
    v59 = v134;
    sub_1BC08AB64();
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v133 + 8))(v58, v59);
    sub_1BC08A420();
    objc_msgSend(v44, sel_hideInDiscover);
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v142 = objc_msgSend(v44, sel_sortOrder);
    sub_1BC08AB64();
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v60 = (uint64_t)v130;
    sub_1BC089C04();
    sub_1BC08A7C8();
    sub_1BC0783EC(v60);
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v138 = (unint64_t)v44;
    v61 = sub_1BC089BC8();
    v43 = v61;
    v141 = v61 & 0xC000000000000001;
    if ((v61 & 0xC000000000000001) == 0)
      break;
    v62 = sub_1BC08A8A0();
    if (v62)
      goto LABEL_23;
LABEL_26:
    swift_bridgeObjectRelease();
    v50 = (void *)MEMORY[0x1E0DEE9D8];
LABEL_15:
    v142 = v50;
    sub_1BBFDA924(0, (unint64_t *)&qword_1ED69DCA8, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BBFE6088();
    sub_1BC08A384();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    v51 = (void *)v138;
    v142 = (id)sub_1BC089BE0();
    sub_1BC0787F8(0, &qword_1ED69B318, (uint64_t (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEB388]);
    sub_1BC0784D4();
    sub_1BC00BC4C();
    v43 = sub_1BC08A480();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    sub_1BC08A420();
    sub_1BC08A420();

    swift_bridgeObjectRelease();
    v49 = v139;
    v45 = v136;
    v44 = v137;
    v46 = v135;
    if (v139 == v122)
      goto LABEL_43;
  }
  v62 = *(_QWORD *)(v61 + 16);
  if (!v62)
    goto LABEL_26;
LABEL_23:
  v147 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1BBFE449C(0, v62 & ~(v62 >> 63), 0);
  if (v141)
  {
    v63 = sub_1BC08A858();
    v65 = 1;
  }
  else
  {
    v63 = sub_1BC08082C(v43);
    v65 = v66 & 1;
  }
  v144 = v63;
  v145 = v64;
  v146 = v65;
  if (v62 < 0)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v67 = v43 & 0xFFFFFFFFFFFFFF8;
  if (v43 < 0)
    v67 = v43;
  v140 = (void *)v67;
  while (1)
  {
    while (1)
    {
      v73 = v144;
      v74 = v145;
      v75 = v146;
      sub_1BC0805C8(v144, v145, v146, v43);
      v77 = v76;
      v78 = objc_msgSend(v76, sel_identifier);
      v79 = sub_1BC08A3C0();
      v81 = v80;

      v82 = v147;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = sub_1BBFE449C(0, v82[2] + 1, 1);
        v82 = v147;
      }
      v85 = v82[2];
      v84 = v82[3];
      if (v85 >= v84 >> 1)
      {
        result = sub_1BBFE449C(v84 > 1, v85 + 1, 1);
        v82 = v147;
      }
      v82[2] = v85 + 1;
      v86 = &v82[2 * v85];
      v86[4] = v79;
      v86[5] = v81;
      if (v141)
        break;
      v68 = sub_1BBFE76F8(v73, v74, v75, v43);
      v70 = v69;
      v72 = v71;
      sub_1BBFE9178(v73, v74, v75);
      v144 = v68;
      v145 = v70;
      v146 = v72 & 1;
      if (!--v62)
        goto LABEL_14;
    }
    if ((v75 & 1) == 0)
      break;
    if (sub_1BC08A870())
      swift_isUniquelyReferenced_nonNull_native();
    sub_1BC078440(0, (unint64_t *)&qword_1EF3EDDB0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DEB2B0]);
    v87 = (void (*)(id *, _QWORD))sub_1BC08A570();
    sub_1BC08A8E8();
    v87(&v142, 0);
    if (!--v62)
    {
LABEL_14:
      sub_1BBFE9178(v144, v145, v146);
      swift_bridgeObjectRelease();
      v50 = v147;
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC076614(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_1BC078650();
  result = sub_1BC08A93C();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_BYTE *)(*(_QWORD *)(v4 + 48) + v14);
    sub_1BC08ABF4();
    _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
    sub_1BC08A408();
    swift_bridgeObjectRelease();
    result = sub_1BC08AC18();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_BYTE *)(*(_QWORD *)(v9 + 48) + v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1BC076894(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_1BC0787F8(0, (unint64_t *)&qword_1ED69D8F8, (uint64_t (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEC268]);
  result = sub_1BC08A93C();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_1BC08ABF4();
    swift_bridgeObjectRetain();
    sub_1BC08A408();
    result = sub_1BC08AC18();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1BC076B34(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = sub_1BC0892A4();
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v38 = v9;
  sub_1BC078780();
  result = sub_1BC08A93C();
  v12 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v38;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v20 >= v37)
      {
LABEL_37:
        swift_release();
        return v12;
      }
      v21 = v36[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v37)
          goto LABEL_37;
        v21 = v36[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v37)
            goto LABEL_37;
          v21 = v36[v15];
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v37)
              goto LABEL_37;
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v15 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v15 >= v37)
                  goto LABEL_37;
                v21 = v36[v15];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v15 = v22;
          }
        }
      }
LABEL_24:
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    sub_1BBFDA9C0(&qword_1ED69BAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C0]);
    result = sub_1BC08A360();
    v26 = -1 << *(_BYTE *)(v12 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      v17 = v38;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      v17 = v38;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v16 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v16 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v29 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1BC076E30(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_1BC078440(0, (unint64_t *)&qword_1ED69C9B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DEC268]);
  result = sub_1BC08A93C();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_1BC08A7B0();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1BC077098(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_1BC0786F0();
  result = sub_1BC08A93C();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_1BC08A7B0();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1BC0772F0(uint64_t a1, uint64_t a2)
{
  return sub_1BC07733C(a1, a2, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_1BC077AEC);
}

uint64_t sub_1BC07733C(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t (*a3)(char *, unint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  char v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v5 = isStackAllocationSafe;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_BYTE *)(a2 + 32);
  v7 = (unint64_t)((1 << v6) + 63) >> 6;
  v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = a3((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a2, v5);
    swift_release();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    v9 = a3((char *)v10, v7, a2, v5);
    swift_release();
    MEMORY[0x1BCCE9C40](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_1BC0774C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  uint64_t v57;
  uint64_t v59;
  unint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  int64_t v65;
  int64_t v66;

  v4 = a4;
  v5 = a3;
  v60 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v4 = a4 + 56;
    v61 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v63 = (unint64_t)(v7 + 63) >> 6;
    v65 = 0;
    v10 = a3 + 56;
    while (1)
    {
      do
      {
LABEL_6:
        if (v9)
        {
          v9 &= v9 - 1;
        }
        else
        {
          v11 = v65 + 1;
          if (__OFADD__(v65, 1))
          {
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v11 >= v63)
            goto LABEL_78;
          v12 = *(_QWORD *)(v61 + 8 * v11);
          v13 = v65 + 1;
          if (!v12)
          {
            v13 = v65 + 2;
            if (v65 + 2 >= v63)
              goto LABEL_78;
            v12 = *(_QWORD *)(v61 + 8 * v13);
            if (!v12)
            {
              v13 = v65 + 3;
              if (v65 + 3 >= v63)
                goto LABEL_78;
              v12 = *(_QWORD *)(v61 + 8 * v13);
              if (!v12)
              {
                v14 = v65 + 4;
                if (v65 + 4 >= v63)
                {
LABEL_78:
                  v57 = a2;
LABEL_80:
                  swift_retain();
                  return sub_1BC076614(v60, v57, v6, v5);
                }
                v12 = *(_QWORD *)(v61 + 8 * v14);
                if (!v12)
                {
                  while (1)
                  {
                    v13 = v14 + 1;
                    if (__OFADD__(v14, 1))
                      break;
                    if (v13 >= v63)
                      goto LABEL_78;
                    v12 = *(_QWORD *)(v61 + 8 * v13);
                    ++v14;
                    if (v12)
                      goto LABEL_21;
                  }
LABEL_84:
                  __break(1u);
                  goto LABEL_85;
                }
                v13 = v65 + 4;
              }
            }
          }
LABEL_21:
          v9 = (v12 - 1) & v12;
          v65 = v13;
        }
        sub_1BC08ABF4();
        _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        sub_1BC08A408();
        swift_bridgeObjectRelease();
        result = sub_1BC08AC18();
        v5 = a3;
        v15 = -1 << *(_BYTE *)(a3 + 32);
        v16 = result & ~v15;
      }
      while (((*(_QWORD *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0);
      v17 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
      v19 = v18;
      if (v17 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v19 == v20)
        goto LABEL_36;
      v4 = v20;
      v22 = sub_1BC08AB94();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v5 = a3;
      if ((v22 & 1) != 0)
      {
LABEL_38:
        *(unint64_t *)((char *)v60 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        if (__OFADD__(v6++, 1))
        {
          __break(1u);
          break;
        }
      }
      else
      {
        v23 = ~v15;
        v16 = (v16 + 1) & v23;
        if (((*(_QWORD *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
        {
          while (1)
          {
            v24 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
            v26 = v25;
            if (v24 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v26 == v27)
              break;
            v4 = v27;
            v29 = sub_1BC08AB94();
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease();
            if ((v29 & 1) != 0)
              goto LABEL_37;
            v16 = (v16 + 1) & v23;
            v5 = a3;
            if (((*(_QWORD *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
              goto LABEL_6;
          }
LABEL_36:
          result = swift_bridgeObjectRelease_n();
LABEL_37:
          v5 = a3;
          goto LABEL_38;
        }
      }
    }
  }
  v31 = 0;
  v62 = v5 + 56;
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 < 64)
    v33 = ~(-1 << v32);
  else
    v33 = -1;
  v34 = v33 & *(_QWORD *)(v5 + 56);
  v64 = (unint64_t)(v32 + 63) >> 6;
  v66 = 0;
  v35 = v4 + 56;
LABEL_47:
  v59 = v31;
  while (v34)
  {
    v36 = __clz(__rbit64(v34));
    v34 &= v34 - 1;
    v37 = v36 | (v66 << 6);
LABEL_64:
    sub_1BC08ABF4();
    _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
    sub_1BC08A408();
    swift_bridgeObjectRelease();
    result = sub_1BC08AC18();
    v42 = -1 << *(_BYTE *)(v4 + 32);
    v43 = result & ~v42;
    if (((*(_QWORD *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) != 0)
    {
      v44 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
      v46 = v45;
      if (v44 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v46 == v47)
      {
LABEL_45:
        v4 = a4;
        result = swift_bridgeObjectRelease_n();
LABEL_46:
        *(unint64_t *)((char *)v60 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
        v31 = v59 + 1;
        if (__OFADD__(v59, 1))
          goto LABEL_83;
        goto LABEL_47;
      }
      v49 = sub_1BC08AB94();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v4 = a4;
      if ((v49 & 1) != 0)
        goto LABEL_46;
      v50 = ~v42;
      while (1)
      {
        v43 = (v43 + 1) & v50;
        if (((*(_QWORD *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFF8)) >> v43) & 1) == 0)
          break;
        v51 = _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
        v53 = v52;
        if (v51 == _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0() && v53 == v54)
          goto LABEL_45;
        v56 = sub_1BC08AB94();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v4 = a4;
        if ((v56 & 1) != 0)
          goto LABEL_46;
      }
    }
  }
  v38 = v66 + 1;
  v5 = a3;
  if (__OFADD__(v66, 1))
    goto LABEL_82;
  if (v38 >= v64)
  {
LABEL_79:
    v57 = a2;
    v6 = v59;
    goto LABEL_80;
  }
  v39 = *(_QWORD *)(v62 + 8 * v38);
  v40 = v66 + 1;
  if (v39)
    goto LABEL_63;
  v40 = v66 + 2;
  if (v66 + 2 >= v64)
    goto LABEL_79;
  v39 = *(_QWORD *)(v62 + 8 * v40);
  if (v39)
    goto LABEL_63;
  v40 = v66 + 3;
  if (v66 + 3 >= v64)
    goto LABEL_79;
  v39 = *(_QWORD *)(v62 + 8 * v40);
  if (v39)
  {
LABEL_63:
    v34 = (v39 - 1) & v39;
    v66 = v40;
    v37 = __clz(__rbit64(v39)) + (v40 << 6);
    goto LABEL_64;
  }
  v41 = v66 + 4;
  if (v66 + 4 >= v64)
    goto LABEL_79;
  v39 = *(_QWORD *)(v62 + 8 * v41);
  if (v39)
  {
    v40 = v66 + 4;
    goto LABEL_63;
  }
  while (1)
  {
    v40 = v41 + 1;
    if (__OFADD__(v41, 1))
      break;
    if (v40 >= v64)
      goto LABEL_79;
    v39 = *(_QWORD *)(v62 + 8 * v40);
    ++v41;
    if (v39)
      goto LABEL_63;
  }
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_1BC077AEC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(unint64_t, unint64_t, uint64_t);
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t (*v42)(char *, uint64_t);
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t i;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, unint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int64_t v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v66 = a2;
  v69 = a1;
  v6 = sub_1BC0892A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v66 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v66 - v15;
  result = MEMORY[0x1E0C80A78](v14);
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(a4 + 16);
  v75 = a4;
  v76 = a3;
  v77 = v7;
  if (v20 >= v19)
  {
    v71 = 0;
    v43 = 0;
    v44 = *(_QWORD *)(a3 + 56);
    v67 = a3 + 56;
    v45 = 1 << *(_BYTE *)(a3 + 32);
    if (v45 < 64)
      v46 = ~(-1 << v45);
    else
      v46 = -1;
    v47 = v46 & v44;
    v68 = (unint64_t)(v45 + 63) >> 6;
    v74 = a4 + 56;
    if (v47)
      goto LABEL_38;
LABEL_39:
    v49 = v43 + 1;
    if (__OFADD__(v43, 1))
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v49 < v68)
    {
      v50 = *(_QWORD *)(v67 + 8 * v49);
      v51 = v43 + 1;
      if (v50)
        goto LABEL_52;
      v51 = v43 + 2;
      if (v43 + 2 < v68)
      {
        v50 = *(_QWORD *)(v67 + 8 * v51);
        if (v50)
          goto LABEL_52;
        v51 = v43 + 3;
        if (v43 + 3 < v68)
        {
          v50 = *(_QWORD *)(v67 + 8 * v51);
          if (v50)
            goto LABEL_52;
          v52 = v43 + 4;
          if (v43 + 4 < v68)
          {
            v50 = *(_QWORD *)(v67 + 8 * v52);
            if (!v50)
            {
              while (1)
              {
                v51 = v52 + 1;
                if (__OFADD__(v52, 1))
                  goto LABEL_67;
                if (v51 >= v68)
                  goto LABEL_61;
                v50 = *(_QWORD *)(v67 + 8 * v51);
                ++v52;
                if (v50)
                  goto LABEL_52;
              }
            }
            v51 = v43 + 4;
LABEL_52:
            v72 = (v50 - 1) & v50;
            v73 = v51;
            for (i = __clz(__rbit64(v50)) + (v51 << 6); ; i = __clz(__rbit64(v47)) | (v43 << 6))
            {
              v53 = *(_QWORD *)(a3 + 48);
              v54 = *(_QWORD *)(v7 + 72);
              v70 = i;
              v55 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
              v55(v10, v53 + v54 * i, v6);
              sub_1BBFDA9C0(&qword_1ED69BAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C0]);
              v56 = v7;
              v57 = v10;
              v58 = sub_1BC08A360();
              v59 = -1 << *(_BYTE *)(a4 + 32);
              v60 = v58 & ~v59;
              if (((*(_QWORD *)(v74 + ((v60 >> 3) & 0xFFFFFFFFFFFFF8)) >> v60) & 1) != 0)
              {
                v61 = ~v59;
                while (1)
                {
                  v55(v13, *(_QWORD *)(v75 + 48) + v60 * v54, v6);
                  sub_1BBFDA9C0(&qword_1ED69BAB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C8]);
                  v62 = sub_1BC08A3A8();
                  v63 = *(void (**)(char *, uint64_t))(v77 + 8);
                  v63(v13, v6);
                  if ((v62 & 1) != 0)
                    break;
                  v60 = (v60 + 1) & v61;
                  if (((*(_QWORD *)(v74 + ((v60 >> 3) & 0xFFFFFFFFFFFFF8)) >> v60) & 1) == 0)
                    goto LABEL_59;
                }
                v10 = v57;
                result = ((uint64_t (*)(char *, uint64_t))v63)(v57, v6);
                *(unint64_t *)((char *)v69 + ((v70 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v70;
                v47 = v72;
                v26 = __OFADD__(v71++, 1);
                a4 = v75;
                a3 = v76;
                v7 = v77;
                v43 = v73;
                if (v26)
                  goto LABEL_65;
                if (!v72)
                  goto LABEL_39;
              }
              else
              {
                v63 = *(void (**)(char *, uint64_t))(v56 + 8);
LABEL_59:
                v10 = v57;
                result = ((uint64_t (*)(char *, uint64_t))v63)(v57, v6);
                a4 = v75;
                a3 = v76;
                v7 = v77;
                v47 = v72;
                v43 = v73;
                if (!v72)
                  goto LABEL_39;
              }
LABEL_38:
              v72 = (v47 - 1) & v47;
              v73 = v43;
            }
          }
        }
      }
    }
LABEL_61:
    v64 = v66;
    v65 = v71;
    swift_retain();
    return sub_1BC076B34(v69, v64, v65, a3);
  }
  v70 = (unint64_t)&v66 - v18;
  v71 = 0;
  v21 = 0;
  v22 = *(_QWORD *)(a4 + 56);
  v67 = a4 + 56;
  v23 = 1 << *(_BYTE *)(a4 + 32);
  if (v23 < 64)
    v24 = ~(-1 << v23);
  else
    v24 = -1;
  v25 = v24 & v22;
  v68 = (unint64_t)(v23 + 63) >> 6;
  v74 = a3 + 56;
  do
  {
    v27 = v70;
    if (v25)
    {
LABEL_8:
      v72 = (v25 - 1) & v25;
      v73 = v21;
      v28 = __clz(__rbit64(v25)) | (v21 << 6);
      goto LABEL_23;
    }
    while (1)
    {
      v29 = v21 + 1;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
        goto LABEL_63;
      }
      if (v29 >= v68)
        goto LABEL_61;
      v30 = *(_QWORD *)(v67 + 8 * v29);
      v31 = v21 + 1;
      if (!v30)
      {
        v31 = v21 + 2;
        if (v21 + 2 >= v68)
          goto LABEL_61;
        v30 = *(_QWORD *)(v67 + 8 * v31);
        if (!v30)
        {
          v31 = v21 + 3;
          if (v21 + 3 >= v68)
            goto LABEL_61;
          v30 = *(_QWORD *)(v67 + 8 * v31);
          if (!v30)
          {
            v32 = v21 + 4;
            if (v21 + 4 >= v68)
              goto LABEL_61;
            v30 = *(_QWORD *)(v67 + 8 * v32);
            if (!v30)
            {
              while (1)
              {
                v31 = v32 + 1;
                if (__OFADD__(v32, 1))
                  goto LABEL_66;
                if (v31 >= v68)
                  goto LABEL_61;
                v30 = *(_QWORD *)(v67 + 8 * v31);
                ++v32;
                if (v30)
                  goto LABEL_22;
              }
            }
            v31 = v21 + 4;
          }
        }
      }
LABEL_22:
      v72 = (v30 - 1) & v30;
      v73 = v31;
      v28 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_23:
      v33 = *(_QWORD *)(v7 + 72);
      v34 = *(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16);
      v34(v27, *(_QWORD *)(a4 + 48) + v33 * v28, v6);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v16, v27, v6);
      sub_1BBFDA9C0(&qword_1ED69BAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C0]);
      v35 = v7;
      v36 = v16;
      v37 = sub_1BC08A360();
      a3 = v76;
      v38 = -1 << *(_BYTE *)(v76 + 32);
      v39 = v37 & ~v38;
      if (((*(_QWORD *)(v74 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) != 0)
        break;
      v42 = *(uint64_t (**)(char *, uint64_t))(v35 + 8);
LABEL_29:
      v16 = v36;
      result = v42(v36, v6);
      a4 = v75;
      v7 = v77;
      v27 = v70;
      v25 = v72;
      v21 = v73;
      if (v72)
        goto LABEL_8;
    }
    v40 = ~v38;
    while (1)
    {
      v34((unint64_t)v13, *(_QWORD *)(a3 + 48) + v39 * v33, v6);
      sub_1BBFDA9C0(&qword_1ED69BAB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C8]);
      v41 = sub_1BC08A3A8();
      v42 = *(uint64_t (**)(char *, uint64_t))(v77 + 8);
      v42(v13, v6);
      if ((v41 & 1) != 0)
        break;
      v39 = (v39 + 1) & v40;
      a3 = v76;
      if (((*(_QWORD *)(v74 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) == 0)
        goto LABEL_29;
    }
    v16 = v36;
    result = v42(v36, v6);
    *(unint64_t *)((char *)v69 + ((v39 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v39;
    v25 = v72;
    v26 = __OFADD__(v71++, 1);
    a4 = v75;
    a3 = v76;
    v7 = v77;
    v21 = v73;
  }
  while (!v26);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
  return result;
}

uint64_t sub_1BC0781A8()
{
  uint64_t v0;

  return sub_1BC072F4C(*(_QWORD *)(v0 + 16), *(id **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1BC0781B4()
{
  return objectdestroy_2Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_1BC0781C4(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC073690(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1BC0781D0()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  if (*(_QWORD *)(v0 + 72))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC078214()
{
  uint64_t v0;

  return sub_1BC0740A0(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), (_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
}

uint64_t sub_1BC078228()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC078250(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC0748F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1BC07825C()
{
  return type metadata accessor for SummaryTabFeedPopulationManager();
}

uint64_t type metadata accessor for SummaryTabFeedPopulationManager()
{
  uint64_t result;

  result = qword_1ED69B9F8;
  if (!qword_1ED69B9F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0782A0()
{
  unint64_t v0;

  sub_1BBFE1B28();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SummaryTabFeedPopulationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.generateHighlightsFeedIfAppropriate(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.managedFeedKinds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.managedLiveFeedKinds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.isChangeDomainPertinentForLiveUpdate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.submitTraining(trainingEvents:store:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t sub_1BC078364()
{
  uint64_t v0;

  return sub_1BC0751F8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_1BC078370()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3EE3D0)
  {
    sub_1BC088F98();
    sub_1BBFDC1EC(255, (unint64_t *)&qword_1ED69DAA0);
    v0 = sub_1BC08AC60();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3EE3D0);
  }
}

uint64_t sub_1BC0783EC(uint64_t a1)
{
  uint64_t v2;

  sub_1BBFDB42C(0, (unint64_t *)&qword_1ED69BB18, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E068], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BC078440(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = sub_1BBFDF744(255, (unint64_t *)&qword_1ED69D890);
    v7 = sub_1BBFFD9C0(&qword_1ED69D898, (unint64_t *)&qword_1ED69D890);
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

unint64_t sub_1BC0784D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EE3D8;
  if (!qword_1EF3EE3D8)
  {
    sub_1BC0787F8(255, &qword_1ED69B318, (uint64_t (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEB388]);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0DEB3D0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EE3D8);
  }
  return result;
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC078564()
{
  uint64_t v0;

  return sub_1BC074DE8(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1BC078570()
{
  return objectdestroy_2Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_2Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0785BC(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC074E8C(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1BC0785C8()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_1BC019E08(v0);
}

uint64_t sub_1BC0785F4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC078620()
{
  uint64_t *v0;

  return sub_1BC074344(v0[2], v0[3], v0[4]);
}

uint64_t sub_1BC07862C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BC078650()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69ADE8)
  {
    sub_1BBFFDB58();
    v0 = sub_1BC08A948();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69ADE8);
  }
}

uint64_t sub_1BC0786A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(1);
}

uint64_t sub_1BC0786CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

void sub_1BC0786F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69C9B8)
  {
    sub_1BBFDF744(255, &qword_1ED69DBB0);
    sub_1BBFFD9C0((unint64_t *)&qword_1ED69C950, &qword_1ED69DBB0);
    v0 = sub_1BC08A948();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69C9B8);
  }
}

void sub_1BC078780()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69C9A8)
  {
    sub_1BC0892A4();
    sub_1BBFDA9C0(&qword_1ED69BAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C0]);
    v0 = sub_1BC08A948();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69C9A8);
  }
}

void sub_1BC0787F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA978]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1BC078870()
{
  void *v0;
  id v1;

  sub_1BC089754();
  sub_1BC089724();
  v0 = (void *)sub_1BC08A3B4();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)objc_opt_self(), sel_featureWithName_featureType_, v0, 1);

  qword_1ED6A0640 = (uint64_t)v1;
}

uint64_t sub_1BC0788EC()
{
  uint64_t v0;
  uint64_t result;

  if (qword_1ED69DA30 != -1)
    swift_once();
  v0 = *(_QWORD *)(sub_1BC0895BC() + 16);
  swift_bridgeObjectRelease();
  result = sub_1BC05E094(v0);
  qword_1ED6A0638 = result;
  return result;
}

uint64_t HealthExperienceStoreFeedItemContext.fetchPluginStorage(havingUniqueIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v4 = v3;
  v25 = a3;
  v26 = a1;
  v27 = *v3;
  sub_1BC078C28();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC013CC4();
  sub_1BC00A718();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1BC08C9E0;
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEA968];
  v11 = sub_1BBFDF700();
  *(_QWORD *)(v9 + 64) = v11;
  strcpy((char *)(v9 + 32), "plugin.package");
  *(_BYTE *)(v9 + 47) = -18;
  __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)v3 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo), *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo + 24));
  v12 = sub_1BC089220();
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = v11;
  *(_QWORD *)(v9 + 72) = v12;
  *(_QWORD *)(v9 + 80) = v13;
  *(_QWORD *)(v9 + 136) = v10;
  *(_QWORD *)(v9 + 144) = v11;
  *(_QWORD *)(v9 + 112) = 0xD000000000000010;
  *(_QWORD *)(v9 + 120) = 0x80000001BC08E540;
  *(_QWORD *)(v9 + 176) = v10;
  *(_QWORD *)(v9 + 184) = v11;
  v14 = v26;
  *(_QWORD *)(v9 + 152) = v26;
  *(_QWORD *)(v9 + 160) = a2;
  swift_bridgeObjectRetain();
  v15 = (void *)sub_1BC08A5E8();
  v16 = sub_1BC08934C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v8, 1, 1, v16);
  v17 = *(void **)((char *)v3 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_storageContext);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v4;
  v18[3] = v15;
  v18[4] = v14;
  v18[5] = a2;
  v19 = v27;
  v18[6] = v8;
  v18[7] = v19;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_1BC079108;
  *(_QWORD *)(v20 + 24) = v18;
  aBlock[4] = sub_1BC047244;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC00FE14;
  aBlock[3] = &block_descriptor_13;
  v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  v22 = v15;
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_performBlockAndWait_, v21);

  _Block_release(v21);
  LOBYTE(v21) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v21 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_1BC079128((uint64_t)v8, v25);
    return swift_release();
  }
  return result;
}

void sub_1BC078C28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69BAC0)
  {
    sub_1BC08934C();
    v0 = sub_1BC08A7D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69BAC0);
  }
}

uint64_t HealthExperienceStoreFeedItemContext.fetchAllPluginStorage()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  sub_1BC013CC4();
  sub_1BC00A718();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BC08B960;
  v2 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  v3 = sub_1BBFDF700();
  *(_QWORD *)(v1 + 64) = v3;
  strcpy((char *)(v1 + 32), "plugin.package");
  *(_BYTE *)(v1 + 47) = -18;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo), *(_QWORD *)(v0 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_pluginInfo + 24));
  v4 = sub_1BC089220();
  *(_QWORD *)(v1 + 96) = v2;
  *(_QWORD *)(v1 + 104) = v3;
  *(_QWORD *)(v1 + 72) = v4;
  *(_QWORD *)(v1 + 80) = v5;
  v6 = (void *)sub_1BC08A5E8();
  v7 = sub_1BC07916C((uint64_t)v6);

  return v7;
}

uint64_t sub_1BC078D88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_1BC078C28();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BC089DE4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089214();
  if (sub_1BC089898())
  {
    sub_1BC089358();
    v17 = sub_1BC08934C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 0, 1, v17);
    return sub_1BC079678((uint64_t)v12, a5);
  }
  else
  {
    sub_1BC089D90();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v19 = sub_1BC089DD8();
    v20 = sub_1BC08A678();
    v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v22 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      v34 = v33;
      *(_DWORD *)v22 = 136446722;
      v32 = v19;
      v35 = a6;
      swift_getMetatypeMetadata();
      v30 = a3;
      v23 = sub_1BC08A3E4();
      v31 = v21;
      v35 = sub_1BBFDE0F8(v23, v24, &v34);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      swift_retain();
      v25 = HealthExperienceStoreFeedItemContext.description.getter();
      v27 = v26;
      swift_release();
      v35 = sub_1BBFDE0F8(v25, v27, &v34);
      sub_1BC08A7EC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 22) = 2082;
      swift_bridgeObjectRetain();
      v35 = sub_1BBFDE0F8(v30, a4, &v34);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease_n();
      v28 = v32;
      _os_log_impl(&dword_1BBFD7000, v32, (os_log_type_t)v31, "[%{public}s]: No plugin storage found in context %{public}s, identifier %{public}s", (uint8_t *)v22, 0x20u);
      v29 = v33;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v29, -1, -1);
      MEMORY[0x1BCCE9C40](v22, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t sub_1BC0790D4()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC079108()
{
  uint64_t v0;

  return sub_1BC078D88(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_1BC079118()
{
  return swift_deallocObject();
}

uint64_t sub_1BC079128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC078C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC07916C(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  sub_1BC089214();
  v3 = (void *)sub_1BC0891FC();
  objc_msgSend(v3, sel_setPredicate_, a1);
  v12 = MEMORY[0x1E0DEE9D8];
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18HealthPlatformCore36HealthExperienceStoreFeedItemContext_storageContext);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = &v12;
  v5[3] = v1;
  v5[4] = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1BC07965C;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_1BC0796BC;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC00FE14;
  aBlock[3] = &block_descriptor_13;
  v7 = _Block_copy(aBlock);
  swift_retain();
  v8 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_performBlockAndWait_, v7);

  _Block_release(v7);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v8 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_1BC079300(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  unint64_t v14;
  uint64_t j;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2 = sub_1BC08934C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v20 - v7;
  sub_1BC089214();
  v9 = sub_1BC08A78C();
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x1E0DEE9D8];
LABEL_17:
    *a1 = v11;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v10 = sub_1BC08AA80();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_16;
LABEL_3:
  v21 = MEMORY[0x1E0DEE9D8];
  sub_1BBFE4760(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v11 = v21;
    if ((v9 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v10; ++i)
      {
        MEMORY[0x1BCCE934C](i, v9);
        sub_1BC089358();
        v21 = v11;
        v14 = *(_QWORD *)(v11 + 16);
        v13 = *(_QWORD *)(v11 + 24);
        if (v14 >= v13 >> 1)
        {
          sub_1BBFE4760(v13 > 1, v14 + 1, 1);
          v11 = v21;
        }
        *(_QWORD *)(v11 + 16) = v14 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v11+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v14, v8, v2);
      }
    }
    else
    {
      for (j = 0; j != v10; ++j)
      {
        v16 = *(id *)(v9 + 8 * j + 32);
        sub_1BC089358();
        v21 = v11;
        v18 = *(_QWORD *)(v11 + 16);
        v17 = *(_QWORD *)(v11 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_1BBFE4760(v17 > 1, v18 + 1, 1);
          v11 = v21;
        }
        *(_QWORD *)(v11 + 16) = v18 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v11+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v18, v6, v2);
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  __break(1u);
  v21 = 0;
  v22 = 0xE000000000000000;
  sub_1BC08A954();
  sub_1BC08A420();
  v20 = v10;
  sub_1BBFDC1EC(0, (unint64_t *)&qword_1ED69DAA0);
  sub_1BC08AA20();
  result = sub_1BC08AA74();
  __break(1u);
  return result;
}

uint64_t sub_1BC079630()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BC07965C()
{
  uint64_t v0;

  return sub_1BC079300(*(_QWORD **)(v0 + 16));
}

uint64_t sub_1BC079668()
{
  return swift_deallocObject();
}

uint64_t sub_1BC079678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC078C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:)(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_queue) = a1;
  v9 = v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v10 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a3, v10);
  v11 = v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  v12 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a4, v12);
  sub_1BBFE95C8(a2, v8 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  return v8;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v4 = sub_1BC08952C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BC0797D4()
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
  void *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  _BYTE v16[40];
  _QWORD v17[6];

  v1 = sub_1BC08952C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x1E0C80A78](v1);
  sub_1BC079B00();
  v5 = v4;
  v15 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  sub_1BC089538();
  sub_1BBFE1C58(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo, (uint64_t)v17);
  v9 = *(void **)(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_queue);
  v17[5] = v9;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(&v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v8, v1);
  v10 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v2 + 32))(v11 + v10, &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v1);
  sub_1BC079B68();
  sub_1BBFE95E0();
  v12 = v9;
  sub_1BC08A1A4();
  swift_release();
  sub_1BBFE9624((uint64_t)v16);
  sub_1BC079C68();
  v13 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
  return v13;
}

uint64_t sub_1BC0799A0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_1BC08952C();
  MEMORY[0x1E0C80A78](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v7 = sub_1BC0893F4();
  v8 = MEMORY[0x1E0D2D758];
  a2[3] = v7;
  a2[4] = v8;
  __swift_allocate_boxed_opaque_existential_0(a2);
  swift_bridgeObjectRetain();
  return sub_1BC0893DC();
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.init(queue:pluginInfo:domain:context:)(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v4 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_queue) = a1;
  v8 = v4 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v9 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a3, v9);
  v10 = v4 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  v11 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a4, v11);
  sub_1BBFE95C8(a2, v4 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  return v4;
}

void sub_1BC079B00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B158)
  {
    sub_1BC079B68();
    sub_1BBFE95E0();
    v0 = sub_1BC089EA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B158);
  }
}

unint64_t sub_1BC079B68()
{
  unint64_t result;

  result = qword_1ED69BB68;
  if (!qword_1ED69BB68)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED69BB68);
  }
  return result;
}

uint64_t sub_1BC079BBC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BC08952C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1BC079C1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BC08952C() - 8) + 80);
  return sub_1BC0799A0(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t sub_1BC079C68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED69B150;
  if (!qword_1ED69B150)
  {
    sub_1BC079B00();
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0C95950], v1);
    atomic_store(result, (unint64_t *)&qword_1ED69B150);
  }
  return result;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v2 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  v4 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t GenerationOperationToGeneratorPipelineAdaptor.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v2 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_pluginInfo);
  v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_context;
  v4 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_1BC079DD4()
{
  return sub_1BC0797D4();
}

uint64_t sub_1BC079DF4@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18HealthPlatformCore45GenerationOperationToGeneratorPipelineAdaptor_domain;
  v4 = sub_1BC08952C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BC079E3C()
{
  return type metadata accessor for GenerationOperationToGeneratorPipelineAdaptor();
}

uint64_t type metadata accessor for GenerationOperationToGeneratorPipelineAdaptor()
{
  uint64_t result;

  result = qword_1ED69AFF8;
  if (!qword_1ED69AFF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC079E80()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1BC08952C();
  if (v1 <= 0x3F)
  {
    result = sub_1BC089574();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GenerationOperationToGeneratorPipelineAdaptor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GenerationOperationToGeneratorPipelineAdaptor.publisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of GenerationOperationToGeneratorPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1BC079F40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t (*v13)(uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = MEMORY[0x1E0DEE9D8];
  v19 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    v16 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v5)
      goto LABEL_23;
    v17 = *(_QWORD *)(v19 + 8 * v16);
    ++v7;
    if (!v17)
    {
      v7 = v16 + 1;
      if (v16 + 1 >= v5)
        goto LABEL_23;
      v17 = *(_QWORD *)(v19 + 8 * v7);
      if (!v17)
      {
        v7 = v16 + 2;
        if (v16 + 2 >= v5)
          goto LABEL_23;
        v17 = *(_QWORD *)(v19 + 8 * v7);
        if (!v17)
        {
          v7 = v16 + 3;
          if (v16 + 3 >= v5)
            goto LABEL_23;
          v17 = *(_QWORD *)(v19 + 8 * v7);
          if (!v17)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v17 - 1) & v17;
    v9 = __clz(__rbit64(v17)) + (v7 << 6);
LABEL_5:
    v10 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16 * v9 + 8);
    ObjectType = swift_getObjectType();
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 24);
    v14 = v10;
    swift_unknownObjectRetain();
    v15 = v13(ObjectType, v11);
    swift_unknownObjectRelease();

    result = sub_1BC019F94(v15);
  }
  v18 = v16 + 4;
  if (v18 >= v5)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  v17 = *(_QWORD *)(v19 + 8 * v18);
  if (v17)
  {
    v7 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v5)
      goto LABEL_23;
    v17 = *(_QWORD *)(v19 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

_QWORD *ProfileDashboardsFeedPopulationListener.__allocating_init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  swift_allocObject();
  v10 = sub_1BC07D4B0(a1, a2, a3, a4, a5);
  v12 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration(0, a4, a5, v11);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a3, v12);
  return v10;
}

_QWORD *ProfileDashboardsFeedPopulationListener.init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_1BC07D4B0(a1, a2, a3, a4, a5);
  v10 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration(0, a4, a5, v9);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a3, v10);
  return v8;
}

uint64_t sub_1BC07A208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  static FeedPopulationListenerSupport.makeThrottledFeedItemSubmissionPublisher<A>(config:)(a1, a3, a4, (uint64_t)&protocol witness table for ProfileDashboardsFeedPopulationListener, a5);
  swift_allocObject();
  swift_weakInit();
  sub_1BC07DB30();
  sub_1BBFDA9C0(&qword_1ED69AD30, (uint64_t (*)(uint64_t))sub_1BC07DB30, MEMORY[0x1E0C95D90]);
  v5 = sub_1BC08A24C();
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_1BC07A2D4(uint64_t a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_1BC089238();
    swift_release();
    sub_1BC07B84C(a1);
    swift_retain();
    sub_1BC089244();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BC07A36C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)result;
  v4 = *(_QWORD *)(*(_QWORD *)result + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = 0;
    v6 = MEMORY[0x1E0DEE9D8];
    do
    {
      v9 = *(void **)(v3 + 8 * v5 + 32);
      if (v9)
      {
        v10 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1BBFE4600(0, *(_QWORD *)(v6 + 16) + 1, 1);
        v8 = *(_QWORD *)(v6 + 16);
        v7 = *(_QWORD *)(v6 + 24);
        if (v8 >= v7 >> 1)
          sub_1BBFE4600(v7 > 1, v8 + 1, 1);
        *(_QWORD *)(v6 + 16) = v8 + 1;
        *(_QWORD *)(v6 + 8 * v8 + 32) = v9;
      }
      ++v5;
    }
    while (v4 != v5);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v6 = MEMORY[0x1E0DEE9D8];
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1BC07A46C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = sub_1BC089DE4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    sub_1BC089238();
    swift_release();
    sub_1BC089D9C();
    swift_bridgeObjectRetain_n();
    v11 = sub_1BC089DD8();
    v12 = sub_1BC08A678();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v24 = v6;
      v14 = v13;
      v22 = swift_slowAlloc();
      v25 = v22;
      *(_DWORD *)v14 = 136315394;
      v26 = a3;
      swift_getMetatypeMetadata();
      v23 = v5;
      v15 = sub_1BC08A3E4();
      v26 = sub_1BBFDE0F8(v15, v16, &v25);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      v17 = swift_bridgeObjectRetain();
      v18 = MEMORY[0x1BCCE8EA8](v17, MEMORY[0x1E0D2D700]);
      v20 = v19;
      swift_bridgeObjectRelease();
      v26 = sub_1BBFDE0F8(v18, v20, &v25);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBFD7000, v11, v12, "[%s]: Received new source profiles, creating new feed population managers for %s", (uint8_t *)v14, 0x16u);
      v21 = v22;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v21, -1, -1);
      MEMORY[0x1BCCE9C40](v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v23);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    sub_1BC07B0CC(v9);
    swift_retain();
    sub_1BC089244();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1BC07A720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  if (!*(_QWORD *)(v0 + 64))
  {
    v1 = v0;
    v2 = *(uint64_t (**)(uint64_t))(v0 + 72);
    if (v2)
    {
      v3 = swift_retain();
      v4 = v2(v3);
      sub_1BBFE60FC((uint64_t)v2);
    }
    else
    {
      v4 = 0;
    }
    *(_QWORD *)(v1 + 64) = v4;
    swift_release();
  }
}

uint64_t sub_1BC07A79C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = 0;
  return swift_release();
}

uint64_t sub_1BC07A7A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1BC089238();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  sub_1BC089244();
  v2 = sub_1BC079F40(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1BC07A81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v23 = a2;
  v24 = a3;
  v22 = *v3;
  v5 = sub_1BC08A270();
  v27 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC08A2B8();
  v25 = *(_QWORD *)(v8 - 8);
  v26 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BC08A27C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089238();
  swift_beginAccess();
  v15 = v3[12];
  swift_bridgeObjectRetain();
  sub_1BC089244();
  v16 = sub_1BBFF29D8(v15);
  swift_bridgeObjectRelease();
  sub_1BBFDF744(0, (unint64_t *)&qword_1ED69DCD8);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF528], v11);
  v17 = (void *)sub_1BC08A720();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = a1;
  v19 = v24;
  v18[4] = v23;
  v18[5] = v19;
  v18[6] = v22;
  aBlock[4] = sub_1BC07D7CC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBFE410C;
  aBlock[3] = &block_descriptor_14;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC08A288();
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC01DED0(0);
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD28, (uint64_t (*)(uint64_t))sub_1BC01DED0, MEMORY[0x1E0DEAF38]);
  sub_1BC08A834();
  MEMORY[0x1BCCE90DC](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  return swift_release();
}

void sub_1BC07AAF8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  __int128 v18;
  uint64_t v19;
  dispatch_group_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t);
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  int v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t ObjectType;
  void *v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  void (*v61)(_QWORD);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  os_log_t v72;
  uint64_t v73;
  uint64_t v74;
  dispatch_group_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v70 = a5;
  v62 = a4;
  v8 = sub_1BC089064();
  v68 = *(_QWORD *)(v8 - 8);
  v69 = v8;
  MEMORY[0x1E0C80A78](v8);
  v67 = (char *)v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC089DE4();
  v74 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v60 - v14;
  v75 = dispatch_group_create();
  v16 = *(_QWORD *)(a1 + 16);
  v63 = v15;
  if (v16)
  {
    v61 = a3;
    swift_bridgeObjectRetain();
    v60[1] = a1;
    v17 = (uint64_t *)(a1 + 40);
    *(_QWORD *)&v18 = 136315650;
    v65 = v18;
    v64 = MEMORY[0x1E0DEE9B8] + 8;
    v66 = v10;
    do
    {
      v25 = *v17;
      swift_unknownObjectRetain();
      sub_1BC089D9C();
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v26 = sub_1BC089DD8();
      v27 = sub_1BC08A678();
      v28 = a2;
      v29 = v27;
      v30 = os_log_type_enabled(v26, v27);
      v76 = v16;
      if (v30)
      {
        v31 = swift_slowAlloc();
        v73 = swift_slowAlloc();
        v77 = v73;
        *(_DWORD *)v31 = v65;
        v78 = v70;
        swift_getMetatypeMetadata();
        v32 = sub_1BC08A3E4();
        v72 = v26;
        *(_QWORD *)(v31 + 4) = sub_1BBFDE0F8(v32, v33, &v77);
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        ObjectType = swift_getObjectType();
        v35 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(ObjectType, v25);
        v36 = objc_msgSend(v35, sel_profileIdentifier);
        v71 = v29;
        v37 = v36;

        v38 = objc_msgSend(v37, sel_identifier);
        v19 = v25;
        v39 = v13;
        v40 = v67;
        sub_1BC08904C();

        sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
        v41 = v69;
        v42 = sub_1BC08AB64();
        v44 = v43;
        v45 = v40;
        v13 = v39;
        (*(void (**)(char *, uint64_t))(v68 + 8))(v45, v41);
        *(_QWORD *)(v31 + 14) = sub_1BBFDE0F8(v42, v44, &v77);
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 22) = 2080;
        v46 = swift_bridgeObjectRetain();
        v47 = MEMORY[0x1BCCE8EA8](v46, MEMORY[0x1E0D2E570]);
        v49 = v48;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v31 + 24) = sub_1BBFDE0F8(v47, v49, &v77);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        v50 = v72;
        _os_log_impl(&dword_1BBFD7000, v72, (os_log_type_t)v71, "[%s]: Sending population request to populationManager for profile %s and kinds: %s", (uint8_t *)v31, 0x20u);
        v51 = v73;
        swift_arrayDestroy();
        MEMORY[0x1BCCE9C40](v51, -1, -1);
        v52 = v31;
        v10 = v66;
        MEMORY[0x1BCCE9C40](v52, -1, -1);

        (*(void (**)(char *, uint64_t))(v74 + 8))(v13, v10);
        a2 = v28;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v74 + 8))(v13, v10);
        v19 = v25;
      }
      v20 = v75;
      dispatch_group_enter(v75);
      v21 = swift_getObjectType();
      v22 = swift_allocObject();
      *(_QWORD *)(v22 + 16) = v20;
      v23 = *(void (**)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t))(v19 + 40);
      v24 = v20;
      v23(a2, sub_1BC066DBC, v22, v21, v19);
      swift_unknownObjectRelease();
      swift_release();
      v17 += 2;
      v16 = v76 - 1;
    }
    while (v76 != 1);
    swift_bridgeObjectRelease();
    a3 = v61;
    v15 = v63;
  }
  sub_1BC08A6C0();
  sub_1BC089DC0();
  v53 = sub_1BC089DD8();
  v54 = sub_1BC08A678();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v77 = v56;
    *(_DWORD *)v55 = 136315138;
    v78 = v70;
    swift_getMetatypeMetadata();
    v57 = sub_1BC08A3E4();
    v78 = sub_1BBFDE0F8(v57, v58, &v77);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v53, v54, "[%s]: All population complete!", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v56, -1, -1);
    MEMORY[0x1BCCE9C40](v55, -1, -1);

    v59 = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v63, v10);
  }
  else
  {

    v59 = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v15, v10);
  }
  a3(v59);

}

uint64_t sub_1BC07B0CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t (*v49)(void *);
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  char v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  id v69;
  uint64_t *v70;
  id v71;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  _BOOL8 v77;
  uint64_t v78;
  char v79;
  unint64_t v80;
  char v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t result;
  _QWORD v88[2];
  char *v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  id v101;
  uint64_t *v102;
  _QWORD *v103;
  uint64_t v104;

  v92 = *v1;
  v3 = sub_1BC089DE4();
  v97 = *(_QWORD *)(v3 - 8);
  v98 = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v88 - v7;
  v102 = v1 + 12;
  swift_beginAccess();
  v9 = v1[12];
  v94 = v1;
  v1[12] = MEMORY[0x1E0DEE9E0];
  v100 = a1;
  v96 = *(_QWORD *)(a1 + 16);
  if (!v96)
    return swift_bridgeObjectRelease();
  v89 = v8;
  v99 = v6;
  swift_bridgeObjectRetain();
  v10 = 0;
  *(_QWORD *)&v11 = 136315394;
  v91 = v11;
  v90 = MEMORY[0x1E0DEE9B8] + 8;
  v95 = v9;
  while (1)
  {
    v13 = *(void **)(v100 + 8 * v10 + 32);
    v14 = *(_QWORD *)(v9 + 16);
    v15 = v13;
    v16 = v15;
    v101 = v15;
    if (v14)
    {
      v17 = v15;
      v18 = sub_1BC025B40((uint64_t)v13);
      if ((v19 & 1) != 0)
      {
        v93 = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v18);
        v20 = v93;
        swift_unknownObjectRetain();

        v21 = v89;
        sub_1BC089D9C();
        v22 = v17;
        v23 = sub_1BC089DD8();
        v24 = sub_1BC08A678();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = swift_slowAlloc();
          v26 = swift_slowAlloc();
          v88[1] = v20;
          v88[0] = v26;
          v103 = (_QWORD *)v26;
          *(_DWORD *)v25 = v91;
          v104 = v92;
          swift_getMetatypeMetadata();
          v27 = sub_1BC08A3E4();
          *(_QWORD *)(v25 + 4) = sub_1BBFDE0F8(v27, v28, (uint64_t *)&v103);
          swift_bridgeObjectRelease();
          *(_WORD *)(v25 + 12) = 2080;
          v29 = v22;
          v30 = sub_1BC089388();
          v31 = v22;
          v33 = v32;

          v34 = v30;
          v9 = v95;
          *(_QWORD *)(v25 + 14) = sub_1BBFDE0F8(v34, v33, (uint64_t *)&v103);

          v22 = v31;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1BBFD7000, v23, v24, "[%s]: Reusing existing population manager for sourceProfile %s", (uint8_t *)v25, 0x16u);
          v35 = v88[0];
          swift_arrayDestroy();
          MEMORY[0x1BCCE9C40](v35, -1, -1);
          MEMORY[0x1BCCE9C40](v25, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v97 + 8))(v21, v98);
        v70 = v102;
        swift_beginAccess();
        v71 = v22;
        swift_unknownObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v103 = (_QWORD *)*v70;
        v73 = (uint64_t)v103;
        *v70 = 0x8000000000000000;
        v75 = sub_1BC025B40((uint64_t)v13);
        v76 = *(_QWORD *)(v73 + 16);
        v77 = (v74 & 1) == 0;
        v78 = v76 + v77;
        if (__OFADD__(v76, v77))
          goto LABEL_42;
        v79 = v74;
        if (*(_QWORD *)(v73 + 24) < v78)
        {
          sub_1BC07C9A4(v78, isUniquelyReferenced_nonNull_native);
          v80 = sub_1BC025B40((uint64_t)v13);
          if ((v79 & 1) != (v81 & 1))
            goto LABEL_44;
          v75 = v80;
          v82 = v103;
          if ((v79 & 1) == 0)
            goto LABEL_35;
LABEL_31:
          v83 = v82[7];
          swift_unknownObjectRelease();
          *(_OWORD *)(v83 + 16 * v75) = v93;
LABEL_37:
          *v102 = (uint64_t)v82;

          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_unknownObjectRelease();
          goto LABEL_5;
        }
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v82 = v103;
          if ((v74 & 1) != 0)
            goto LABEL_31;
        }
        else
        {
          sub_1BC07D2F8();
          v82 = v103;
          if ((v79 & 1) != 0)
            goto LABEL_31;
        }
LABEL_35:
        v82[(v75 >> 6) + 8] |= 1 << v75;
        *(_QWORD *)(v82[6] + 8 * v75) = v13;
        *(_OWORD *)(v82[7] + 16 * v75) = v93;
        v84 = v82[2];
        v67 = __OFADD__(v84, 1);
        v85 = v84 + 1;
        if (v67)
          goto LABEL_43;
        v82[2] = v85;
        v86 = v71;
        goto LABEL_37;
      }

    }
    v36 = v99;
    sub_1BC089D9C();
    v37 = v16;
    v38 = sub_1BC089DD8();
    v39 = sub_1BC08A678();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v103 = (_QWORD *)v41;
      *(_DWORD *)v40 = v91;
      v104 = v92;
      swift_getMetatypeMetadata();
      v42 = sub_1BC08A3E4();
      *(_QWORD *)(v40 + 4) = sub_1BBFDE0F8(v42, v43, (uint64_t *)&v103);
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      v44 = v37;
      v45 = sub_1BC089388();
      v47 = v46;

      *(_QWORD *)(v40 + 14) = sub_1BBFDE0F8(v45, v47, (uint64_t *)&v103);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBFD7000, v38, v39, "[%s]: Creating new population manager for sourceProfile %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v41, -1, -1);
      MEMORY[0x1BCCE9C40](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v99, v98);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v97 + 8))(v36, v98);
    }
    v48 = v94;
    v49 = *(uint64_t (**)(void *))(*v94 + 288);
    v50 = v37;
    v51 = v49(v13);
    v53 = v52;
    swift_beginAccess();
    v54 = swift_isUniquelyReferenced_nonNull_native();
    v103 = (_QWORD *)v48[12];
    v55 = (uint64_t)v103;
    v48[12] = 0x8000000000000000;
    v57 = sub_1BC025B40((uint64_t)v13);
    v58 = *(_QWORD *)(v55 + 16);
    v59 = (v56 & 1) == 0;
    v60 = v58 + v59;
    if (__OFADD__(v58, v59))
      break;
    v61 = v56;
    if (*(_QWORD *)(v55 + 24) >= v60)
    {
      if ((v54 & 1) != 0)
      {
        v64 = v103;
        if ((v56 & 1) == 0)
          goto LABEL_21;
      }
      else
      {
        sub_1BC07D2F8();
        v64 = v103;
        if ((v61 & 1) == 0)
          goto LABEL_21;
      }
    }
    else
    {
      sub_1BC07C9A4(v60, v54);
      v62 = sub_1BC025B40((uint64_t)v13);
      if ((v61 & 1) != (v63 & 1))
        goto LABEL_44;
      v57 = v62;
      v64 = v103;
      if ((v61 & 1) == 0)
      {
LABEL_21:
        v64[(v57 >> 6) + 8] |= 1 << v57;
        *(_QWORD *)(v64[6] + 8 * v57) = v13;
        v65 = (uint64_t *)(v64[7] + 16 * v57);
        *v65 = v51;
        v65[1] = v53;
        v66 = v64[2];
        v67 = __OFADD__(v66, 1);
        v68 = v66 + 1;
        if (v67)
          goto LABEL_41;
        v64[2] = v68;
        v69 = v50;
        goto LABEL_4;
      }
    }
    v12 = (uint64_t *)(v64[7] + 16 * v57);
    swift_unknownObjectRelease();
    *v12 = v51;
    v12[1] = v53;
LABEL_4:
    *v102 = (uint64_t)v64;

    swift_bridgeObjectRelease();
    swift_endAccess();
    v9 = v95;
LABEL_5:
    ++v10;

    if (v96 == v10)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_1BC08ABB8();
  __break(1u);
  return result;
}

uint64_t sub_1BC07B84C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t ObjectType;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62[5];

  v2 = v1;
  v4 = v2 + 12;
  v54 = *v2;
  v5 = sub_1BC089DE4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[0] = a1;
  v9 = sub_1BC08979C();
  v10 = *(_QWORD *)(v9 + 56);
  v57 = v9 + 56;
  v59 = v9;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  result = swift_beginAccess();
  v15 = 0;
  v58 = (unint64_t)(v11 + 63) >> 6;
  *(_QWORD *)&v16 = 136315650;
  v52 = v16;
  v51[1] = MEMORY[0x1E0DEE9B8] + 8;
  v53 = v5;
  while (1)
  {
    if (v13)
    {
      v60 = (v13 - 1) & v13;
      v61 = v15;
      v17 = __clz(__rbit64(v13)) | (v15 << 6);
      goto LABEL_23;
    }
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v18 >= v58)
      return swift_release();
    v19 = *(_QWORD *)(v57 + 8 * v18);
    v20 = v15 + 1;
    if (!v19)
    {
      v20 = v15 + 2;
      if (v15 + 2 >= v58)
        return swift_release();
      v19 = *(_QWORD *)(v57 + 8 * v20);
      if (!v19)
      {
        v20 = v15 + 3;
        if (v15 + 3 >= v58)
          return swift_release();
        v19 = *(_QWORD *)(v57 + 8 * v20);
        if (!v19)
          break;
      }
    }
LABEL_22:
    v60 = (v19 - 1) & v19;
    v61 = v20;
    v17 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_23:
    v22 = *(void **)(*(_QWORD *)(v59 + 48) + 8 * v17);
    v23 = *v4;
    v24 = *(_QWORD *)(*v4 + 16);
    v25 = v22;
    if (v24)
    {
      swift_bridgeObjectRetain();
      v26 = sub_1BC025B40((uint64_t)v22);
      if ((v27 & 1) != 0)
      {
        v28 = *(_QWORD *)(*(_QWORD *)(v23 + 56) + 16 * v26 + 8);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        ObjectType = swift_getObjectType();
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v28 + 48))(v51[0], ObjectType, v28);

        result = swift_unknownObjectRelease();
        goto LABEL_6;
      }
      swift_bridgeObjectRelease();
    }
    sub_1BC089DC0();
    v30 = v25;
    swift_retain_n();
    v31 = v30;
    v32 = sub_1BC089DD8();
    v33 = sub_1BC08A660();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      v56 = swift_slowAlloc();
      v62[0] = v56;
      *(_DWORD *)v35 = v52;
      v62[4] = v54;
      swift_getMetatypeMetadata();
      v36 = sub_1BC08A3E4();
      *(_QWORD *)(v35 + 4) = sub_1BBFDE0F8(v36, v37, v62);
      swift_bridgeObjectRelease();
      v55 = v34;
      *(_WORD *)(v35 + 12) = 2080;
      v38 = v31;
      v39 = sub_1BC089388();
      v41 = v40;

      *(_QWORD *)(v35 + 14) = sub_1BBFDE0F8(v39, v41, v62);
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2080;
      sub_1BBFFDB08();
      sub_1BBFFDA00();
      v42 = v8;
      v43 = v6;
      v44 = v4;
      v45 = v2;
      swift_bridgeObjectRetain();
      v46 = sub_1BC08A30C();
      v48 = v47;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v35 + 24) = sub_1BBFDE0F8(v46, v48, v62);
      swift_release_n();
      v2 = v45;
      v4 = v44;
      v6 = v43;
      v8 = v42;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBFD7000, v32, (os_log_type_t)v55, "[%s]: Population manager missing for sourceProfile %s: populationManagers %s", (uint8_t *)v35, 0x20u);
      v49 = v56;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v49, -1, -1);
      v50 = v35;
      v5 = v53;
      MEMORY[0x1BCCE9C40](v50, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_6:
    v13 = v60;
    v15 = v61;
  }
  v21 = v15 + 4;
  if (v15 + 4 >= v58)
    return swift_release();
  v19 = *(_QWORD *)(v57 + 8 * v21);
  if (v19)
  {
    v20 = v15 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    v20 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v20 >= v58)
      return swift_release();
    v19 = *(_QWORD *)(v57 + 8 * v20);
    ++v21;
    if (v19)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1BC07BCE4(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  id v5;
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t result;
  _BYTE v13[40];
  uint64_t v14;

  if (a1)
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB6780]);
    v4 = a1;
    v5 = objc_msgSend(v3, sel_init);
    objc_msgSend(v5, sel_setProfileIdentifier_, v4);
    objc_msgSend(v5, sel_resume);
    sub_1BBFE1C58(v1 + 16, (uint64_t)&v14);
    type metadata accessor for ProfileDashboardFeedPopulationManager();
    v6 = (uint64_t *)swift_allocObject();
    v7 = (char *)v6
       + OBJC_IVAR____TtC18HealthPlatformCore37ProfileDashboardFeedPopulationManager____lazy_storage___pertinentChangeDomain;
    v8 = sub_1BC0897CC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
    sub_1BBFE1C58((uint64_t)&v14, (uint64_t)v13);
    type metadata accessor for ProfileDashboardRelevanceEngineCoordinator();
    swift_allocObject();
    v9 = v5;
    v10 = sub_1BC0224CC((uint64_t)v13, v9);

    sub_1BBFE1C58((uint64_t)&v14, (uint64_t)v13);
    v11 = sub_1BBFEE34C((uint64_t)v13, v9, (uint64_t)v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);

    return (uint64_t)v11;
  }
  else
  {
    sub_1BC08A954();
    sub_1BC08A420();
    sub_1BC089388();
    sub_1BC08A420();
    swift_bridgeObjectRelease();
    result = sub_1BC08AA74();
    __break(1u);
  }
  return result;
}

uint64_t ProfileDashboardsFeedPopulationListener.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  sub_1BBFE60FC(*(_QWORD *)(v0 + 72));
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ProfileDashboardsFeedPopulationListener.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  sub_1BBFE60FC(*(_QWORD *)(v0 + 72));
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1BC07BF50()
{
  sub_1BC07A720();
}

uint64_t sub_1BC07BF70()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 64) = 0;
  return swift_release();
}

uint64_t sub_1BC07BF80(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  sub_1BC06F3F0();
  v6 = sub_1BC08AAA4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_1BC08A7B0();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BC07C24C(uint64_t a1, int a2)
{
  return sub_1BC07C274(a1, a2, (uint64_t (*)(_QWORD))sub_1BC03EA04, &qword_1ED69D6E8);
}

uint64_t sub_1BC07C260(uint64_t a1, int a2)
{
  return sub_1BC07C274(a1, a2, (uint64_t (*)(_QWORD))sub_1BC03E9BC, (unint64_t *)&qword_1ED69D6F8);
}

uint64_t sub_1BC07C274(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), unint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
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
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  _QWORD *v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int64_t v46;
  _QWORD *v47;
  uint64_t i;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD);

  v7 = v4;
  v9 = a3(0);
  v49 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v51 = (uint64_t)&v45 - v10;
  v11 = sub_1BC089064();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v4;
  v52 = a3;
  sub_1BC07DB94(0, a4, (void (*)(uint64_t))a3);
  v50 = a2;
  v16 = sub_1BC08AAA4();
  v17 = v16;
  if (!*(_QWORD *)(v15 + 16))
    goto LABEL_41;
  v18 = 1 << *(_BYTE *)(v15 + 32);
  v19 = *(_QWORD *)(v15 + 64);
  v47 = (_QWORD *)(v15 + 64);
  if (v18 < 64)
    v20 = ~(-1 << v18);
  else
    v20 = -1;
  v21 = v20 & v19;
  v45 = v4;
  v46 = (unint64_t)(v18 + 63) >> 6;
  v22 = v16 + 64;
  result = swift_retain();
  v24 = 0;
  for (i = v15; ; v15 = i)
  {
    if (v21)
    {
      v26 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v27 = v26 | (v24 << 6);
      goto LABEL_22;
    }
    v28 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v28 >= v46)
      break;
    v29 = v47;
    v30 = v47[v28];
    ++v24;
    if (!v30)
    {
      v24 = v28 + 1;
      if (v28 + 1 >= v46)
        goto LABEL_34;
      v30 = v47[v24];
      if (!v30)
      {
        v31 = v28 + 2;
        if (v31 >= v46)
        {
LABEL_34:
          swift_release();
          v7 = v45;
          if ((v50 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v30 = v47[v31];
        if (!v30)
        {
          while (1)
          {
            v24 = v31 + 1;
            if (__OFADD__(v31, 1))
              goto LABEL_43;
            if (v24 >= v46)
              goto LABEL_34;
            v30 = v47[v24];
            ++v31;
            if (v30)
              goto LABEL_21;
          }
        }
        v24 = v31;
      }
    }
LABEL_21:
    v21 = (v30 - 1) & v30;
    v27 = __clz(__rbit64(v30)) + (v24 << 6);
LABEL_22:
    v32 = *(_QWORD *)(v12 + 72);
    v33 = *(_QWORD *)(v15 + 48) + v32 * v27;
    if ((v50 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v12 + 32))(v14, v33, v11);
      v34 = *(_QWORD *)(v15 + 56);
      v35 = *(_QWORD *)(v49 + 72);
      sub_1BC00D664(v34 + v35 * v27, v51, v52);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v14, v33, v11);
      v36 = *(_QWORD *)(v15 + 56);
      v35 = *(_QWORD *)(v49 + 72);
      sub_1BBFDB550(v36 + v35 * v27, v51, v52);
    }
    sub_1BBFDA9C0(&qword_1ED69DAB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_1BC08A360();
    v37 = -1 << *(_BYTE *)(v17 + 32);
    v38 = result & ~v37;
    v39 = v38 >> 6;
    if (((-1 << v38) & ~*(_QWORD *)(v22 + 8 * (v38 >> 6))) != 0)
    {
      v25 = __clz(__rbit64((-1 << v38) & ~*(_QWORD *)(v22 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v40 = 0;
      v41 = (unint64_t)(63 - v37) >> 6;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v42 = v39 == v41;
        if (v39 == v41)
          v39 = 0;
        v40 |= v42;
        v43 = *(_QWORD *)(v22 + 8 * v39);
      }
      while (v43 == -1);
      v25 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(_QWORD *)(v22 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(*(_QWORD *)(v17 + 48) + v32 * v25, v14, v11);
    result = sub_1BC00D664(v51, *(_QWORD *)(v17 + 56) + v35 * v25, v52);
    ++*(_QWORD *)(v17 + 16);
  }
  swift_release();
  v7 = v45;
  v29 = v47;
  if ((v50 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v44 = 1 << *(_BYTE *)(v15 + 32);
  if (v44 >= 64)
    bzero(v29, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v29 = -1 << v44;
  *(_QWORD *)(v15 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v7 = v17;
  return result;
}

uint64_t sub_1BC07C674(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  sub_1BC047C6C();
  v38 = a2;
  v6 = sub_1BC08AAA4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1BC08ABF4();
    sub_1BC08A408();
    result = sub_1BC08AC18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BC07C97C(uint64_t a1, int a2)
{
  return sub_1BC07C274(a1, a2, (uint64_t (*)(_QWORD))sub_1BC03BD4C, &qword_1ED69D6E0);
}

uint64_t sub_1BC07C990(uint64_t a1, int a2)
{
  return sub_1BC07C274(a1, a2, (uint64_t (*)(_QWORD))sub_1BC03BC90, (unint64_t *)&qword_1ED69D6F0);
}

uint64_t sub_1BC07C9A4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  __int128 v34;

  v3 = v2;
  v5 = *v2;
  sub_1BC07D84C();
  v6 = sub_1BC08AAA4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v32 = v2;
  v33 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v33 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_33;
      v23 = *(_QWORD *)(v33 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v32;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v33 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v23 = *(_QWORD *)(v33 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v34 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      v30 = v29;
      swift_unknownObjectRetain();
    }
    sub_1BC08ABF4();
    sub_1BC0893B8();
    result = sub_1BC08AC18();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v29;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v18) = v34;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v32;
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v31 = 1 << *(_BYTE *)(v5 + 32);
  if (v31 >= 64)
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v31;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

id sub_1BC07CC90()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1BC06F3F0();
  v2 = *v0;
  v3 = sub_1BC08AA98();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BC07CE30()
{
  return sub_1BC07CE58((uint64_t (*)(_QWORD))sub_1BC03EA04, &qword_1ED69D6E8);
}

void *sub_1BC07CE44()
{
  return sub_1BC07CE58((uint64_t (*)(_QWORD))sub_1BC03E9BC, (unint64_t *)&qword_1ED69D6F8);
}

void *sub_1BC07CE58(uint64_t (*a1)(_QWORD), unint64_t *a2)
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
  void *result;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t i;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD);
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t (*v42)(_QWORD);
  uint64_t v43;
  uint64_t v44;

  v5 = a1(0);
  v41 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v40 = (char *)&v35 - v6;
  v39 = sub_1BC089064();
  v7 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v38 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  sub_1BC07DB94(0, a2, (void (*)(uint64_t))a1);
  v35 = v2;
  v9 = *v2;
  v10 = sub_1BC08AA98();
  v11 = *(_QWORD *)(v9 + 16);
  v44 = v10;
  if (!v11)
  {
    result = (void *)swift_release();
    v34 = v44;
    v33 = v35;
LABEL_25:
    *v33 = v34;
    return result;
  }
  v12 = v10;
  result = (void *)(v10 + 64);
  v14 = (unint64_t)((1 << *(_BYTE *)(v12 + 32)) + 63) >> 6;
  if (v12 != v9 || (unint64_t)result >= v9 + 64 + 8 * v14)
  {
    result = memmove(result, (const void *)(v9 + 64), 8 * v14);
    v12 = v44;
  }
  v15 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v9 + 16);
  v16 = 1 << *(_BYTE *)(v9 + 32);
  v43 = v9;
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(v9 + 64);
  v36 = v9 + 64;
  v37 = (unint64_t)(v16 + 63) >> 6;
  v20 = v38;
  v19 = v39;
  v21 = (uint64_t)v40;
  for (i = v44; ; result = (void *)sub_1BC00D664(v21, *(_QWORD *)(i + 56) + v29, v28))
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v15 << 6);
      v25 = v43;
      goto LABEL_9;
    }
    v30 = v15 + 1;
    v25 = v43;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v30 >= v37)
      goto LABEL_23;
    v31 = *(_QWORD *)(v36 + 8 * v30);
    ++v15;
    if (!v31)
    {
      v15 = v30 + 1;
      if (v30 + 1 >= v37)
        goto LABEL_23;
      v31 = *(_QWORD *)(v36 + 8 * v15);
      if (!v31)
        break;
    }
LABEL_22:
    v18 = (v31 - 1) & v31;
    v24 = __clz(__rbit64(v31)) + (v15 << 6);
LABEL_9:
    v26 = *(_QWORD *)(v7 + 72) * v24;
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v20, *(_QWORD *)(v25 + 48) + v26, v19);
    v27 = *(_QWORD *)(v25 + 56);
    v28 = v42;
    v29 = *(_QWORD *)(v41 + 72) * v24;
    sub_1BBFDB550(v27 + v29, v21, v42);
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(i + 48) + v26, v20, v19);
  }
  v32 = v30 + 2;
  if (v32 >= v37)
  {
LABEL_23:
    result = (void *)swift_release();
    v33 = v35;
    v34 = v44;
    goto LABEL_25;
  }
  v31 = *(_QWORD *)(v36 + 8 * v32);
  if (v31)
  {
    v15 = v32;
    goto LABEL_22;
  }
  while (1)
  {
    v15 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v15 >= v37)
      goto LABEL_23;
    v31 = *(_QWORD *)(v36 + 8 * v15);
    ++v32;
    if (v31)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_1BC07D124()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1BC047C6C();
  v2 = *v0;
  v3 = sub_1BC08AA98();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BC07D2D0()
{
  return sub_1BC07CE58((uint64_t (*)(_QWORD))sub_1BC03BD4C, &qword_1ED69D6E0);
}

void *sub_1BC07D2E4()
{
  return sub_1BC07CE58((uint64_t (*)(_QWORD))sub_1BC03BC90, (unint64_t *)&qword_1ED69D6F0);
}

void *sub_1BC07D2F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  sub_1BC07D84C();
  v2 = *v0;
  v3 = sub_1BC08AA98();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    v20 = v17;
    result = (void *)swift_unknownObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_1BC07D4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  _QWORD *v6;
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
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v6 = v5;
  v37 = a2;
  v34 = *v5;
  v35 = a1;
  sub_1BC036230();
  v12 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  v39 = v12;
  MEMORY[0x1E0C80A78](v11);
  v36 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration(0, a4, a5, v14);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v33 - v18;
  sub_1BC08925C();
  *(_OWORD *)(v5 + 7) = 0u;
  *(_OWORD *)(v5 + 9) = 0u;
  swift_allocObject();
  v20 = sub_1BC089250();
  v21 = MEMORY[0x1E0DEE9E0];
  v5[11] = v20;
  v5[12] = v21;
  sub_1BBFE1C58(a2, (uint64_t)(v5 + 2));
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, a3, v15);
  v22 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v23 = (v17 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = a4;
  *(_QWORD *)(v24 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v24 + v22, v19, v15);
  *(_QWORD *)(v24 + v23) = v6;
  v25 = v34;
  *(_QWORD *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8)) = v34;
  v26 = v6[9];
  v6[9] = sub_1BC07DA68;
  v6[10] = v24;
  swift_retain();
  sub_1BBFE60FC(v26);
  v40 = v35;
  sub_1BC03B9B4(0, (unint64_t *)&qword_1ED69C870, &qword_1ED69C8E8, MEMORY[0x1E0D2D700], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC00BC08(0, &qword_1ED69C8E8);
  sub_1BC008CC4();
  v27 = v36;
  sub_1BC08A1A4();
  v28 = swift_allocObject();
  swift_weakInit();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v28;
  *(_QWORD *)(v29 + 24) = v25;
  sub_1BBFDA9C0(&qword_1ED69A758, (uint64_t (*)(uint64_t))sub_1BC036230, MEMORY[0x1E0C95950]);
  v30 = v38;
  v31 = sub_1BC08A24C();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v37);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v30);
  v6[7] = v31;
  swift_release();
  return v6;
}

uint64_t sub_1BC07D798()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1BC07D7CC()
{
  uint64_t v0;

  sub_1BC07AAF8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t type metadata accessor for ProfileDashboardsFeedPopulationListener()
{
  return objc_opt_self();
}

uint64_t method lookup function for ProfileDashboardsFeedPopulationListener()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.__allocating_init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.startListening()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.stopListening()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.managedFeedKinds.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.populateAllFeeds(feedKinds:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.makePopulationManager(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

void sub_1BC07D84C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69AAA8)
  {
    sub_1BBFFDB08();
    sub_1BBFFDA00();
    v0 = sub_1BC08AAC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69AAA8);
  }
}

uint64_t sub_1BC07D8B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC07D8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = v4
     + ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v7, v5);
  v8 = v7 + *(int *)(v6 + 36);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v8, AssociatedTypeWitness);
  v10 = v7 + *(int *)(v6 + 40);
  v11 = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC07DA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(_QWORD *)(type metadata accessor for FeedPopulationListenerSchedulerConfiguration(0, v5, v6, a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BC07A208(v4 + v8, *(_QWORD *)(v4 + v9), *(_QWORD *)(v4 + ((v9 + 15) & 0xFFFFFFFFFFFFF8)), v5, v6);
}

uint64_t sub_1BC07DAD8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC07DAFC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC07DB20(uint64_t *a1)
{
  uint64_t v1;

  return sub_1BC07A46C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BC07DB28(uint64_t a1)
{
  return sub_1BC07A2D4(a1);
}

void sub_1BC07DB30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69AD38)
  {
    sub_1BC0897CC();
    v0 = sub_1BC089FB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69AD38);
  }
}

void sub_1BC07DB94(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t (*v5)(uint64_t);
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    sub_1BC089064();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
    a3(255);
    sub_1BBFDA9C0(&qword_1ED69DAB8, v5, MEMORY[0x1E0CB09C8]);
    v6 = sub_1BC08AAC8();
    if (!v7)
      atomic_store(v6, a2);
  }
}

HealthPlatformCore::AppSessionAnalyticsEvent::DemographicAnalytics __swiftcall AppSessionAnalyticsEvent.DemographicAnalytics.init()()
{
  HealthPlatformCore::AppSessionAnalyticsEvent::DemographicAnalytics *v0;
  HealthPlatformCore::AppSessionAnalyticsEvent::DemographicAnalytics *v1;
  HealthPlatformCore::AppSessionAnalyticsEvent::DemographicAnalytics result;

  v1 = v0;
  result.hasPairedWatch.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, objc_msgSend((id)objc_opt_self(), sel_hasPairedWatch));
  v1->hasPairedWatch.super.super.isa = result.hasPairedWatch.super.super.isa;
  return result;
}

HealthPlatformCore::AppSessionAnalyticsEvent::ImproveHealthAnalytics __swiftcall AppSessionAnalyticsEvent.ImproveHealthAnalytics.init()()
{
  HealthPlatformCore::AppSessionAnalyticsEvent::ImproveHealthAnalytics *v0;
  HealthPlatformCore::AppSessionAnalyticsEvent::ImproveHealthAnalytics *v1;
  HealthPlatformCore::AppSessionAnalyticsEvent::ImproveHealthAnalytics result;

  v1 = v0;
  result.isImproveHealthAndActivityAllowed.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, HKImproveHealthAndActivityAnalyticsAllowed());
  v1->isImproveHealthAndActivityAllowed.super.super.isa = result.isImproveHealthAndActivityAllowed.super.super.isa;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(feedItem:)(uint64_t a1)
{
  return sub_1BC07DCE0(a1, (void (*)(uint64_t))AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(feedItem:));
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(feedItem:)(uint64_t a1)
{
  return sub_1BC07DCE0(a1, (void (*)(uint64_t))AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:));
}

uint64_t sub_1BC07DCE0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4;

  v4 = swift_allocObject();
  a2(a1);
  return v4;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.init(ageOfFeed:feedItemsGeneratedTypes:feedItemsShownTypes:feedType:minutesElapsed:spinnerDisplayed:)@<X0>(char a1@<W1>, unint64_t a2@<X2>, uint32_t *a3@<X3>, char a4@<W6>, char a5@<W7>, _QWORD *a6@<X8>)
{
  uint32_t *v6;
  uint64_t v7;
  unint64_t v9;
  uint32_t *p_align;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id result;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v40;
  uint64_t v41;

  LOBYTE(v7) = a4;
  v9 = 0x1E0CB3000uLL;
  p_align = &stru_1E74A5FE8.align;
  if ((a1 & 1) != 0)
  {
    v36 = 0;
    if ((a4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_4;
  }
  v6 = &stru_1E74A5FE8.align;
  if (qword_1ED69D090 != -1)
    goto LABEL_45;
  while (1)
  {
    sub_1BC07FBF8();
    p_align = v6;
    v36 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2024)), (SEL)v6 + 94, sub_1BC089C94());
    if ((v7 & 1) != 0)
    {
LABEL_4:
      v7 = 0;
    }
    else
    {
LABEL_6:
      if (qword_1ED69A070 != -1)
        swift_once();
      sub_1BC07FBF8();
      v7 = (uint64_t)objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2024)), *((SEL *)p_align + 347), sub_1BC089C94());
    }
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_1BC08AA80();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (qword_1ED69D098 != -1)
      swift_once();
    sub_1BC07FBF8();
    v34 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2024)), *((SEL *)p_align + 347), sub_1BC089C94());
    v35 = v7;
    if (v11)
    {
      v40 = MEMORY[0x1E0DEE9D8];
      sub_1BBFE449C(0, v11 & ~(v11 >> 63), 0);
      if (v11 < 0)
      {
        __break(1u);
        goto LABEL_44;
      }
      v12 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
        {
          v13 = MEMORY[0x1BCCE934C](v12, a2);
        }
        else
        {
          v13 = *(_QWORD *)(a2 + 8 * v12 + 32);
          swift_retain();
        }
        v14 = (*(uint64_t (**)(void))(*(_QWORD *)v13 + 120))();
        v16 = v15;
        swift_release();
        v18 = *(_QWORD *)(v40 + 16);
        v17 = *(_QWORD *)(v40 + 24);
        if (v18 >= v17 >> 1)
          sub_1BBFE449C(v17 > 1, v18 + 1, 1);
        ++v12;
        *(_QWORD *)(v40 + 16) = v18 + 1;
        v19 = v40 + 16 * v18;
        *(_QWORD *)(v19 + 32) = v14;
        *(_QWORD *)(v19 + 40) = v16;
      }
      while (v11 != v12);
      swift_bridgeObjectRelease();
      v9 = 0x1E0CB3000;
      p_align = (_DWORD *)(&stru_1E74A5FE8 + 24);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v20 = sub_1BC089CC4();
    swift_bridgeObjectRelease();
    v6 = a3;
    if ((unint64_t)a3 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_1BC08AA80();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)(((unint64_t)a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v7 >= 9)
      v21 = 9;
    else
      v21 = v7;
    v22 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2024)), *((SEL *)p_align + 347), v21);
    if (!v7)
    {
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
    v41 = MEMORY[0x1E0DEE9D8];
    sub_1BBFE449C(0, v7 & ~(v7 >> 63), 0);
    if ((v7 & 0x8000000000000000) == 0)
      break;
LABEL_44:
    __break(1u);
LABEL_45:
    swift_once();
  }
  v33 = v22;
  v23 = 0;
  do
  {
    if (((unint64_t)a3 & 0xC000000000000001) != 0)
      MEMORY[0x1BCCE934C](v23, v6);
    else
      swift_retain();
    v24 = sub_1BC07FC3C();
    v26 = v25;
    swift_release();
    v28 = *(_QWORD *)(v41 + 16);
    v27 = *(_QWORD *)(v41 + 24);
    if (v28 >= v27 >> 1)
      sub_1BBFE449C(v27 > 1, v28 + 1, 1);
    ++v23;
    *(_QWORD *)(v41 + 16) = v28 + 1;
    v29 = v41 + 16 * v28;
    *(_QWORD *)(v29 + 32) = v24;
    *(_QWORD *)(v29 + 40) = v26;
    v6 = a3;
  }
  while (v7 != v23);
  swift_bridgeObjectRelease();
  v22 = v33;
LABEL_40:
  v30 = sub_1BC089CC4();
  swift_bridgeObjectRelease();
  _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0();
  v31 = sub_1BC08A3B4();
  swift_bridgeObjectRelease();
  result = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 2024)), sel_initWithBool_, a5 & 1);
  *a6 = v36;
  a6[1] = v34;
  a6[2] = v20;
  a6[3] = v22;
  a6[4] = v30;
  a6[5] = v31;
  a6[6] = v35;
  a6[7] = result;
  return result;
}

void AppSessionAnalyticsEvent.ModelAnalytics.init(relevanceEngineMetrics:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  id v37;
  uint64_t v38;

  v4 = sub_1BC08A3C0();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_1BC0258D8(v4, v5), (v7 & 1) != 0))
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v6);
    v9 = v8;
  }
  else
  {
    v8 = 0;
  }
  swift_bridgeObjectRelease();
  sub_1BC080584();
  v10 = sub_1BC089CA0();

  v11 = sub_1BC08A3C0();
  if (*(_QWORD *)(a1 + 16) && (v13 = sub_1BC0258D8(v11, v12), (v14 & 1) != 0))
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v13);
    v16 = v15;
  }
  else
  {
    v15 = 0;
  }
  swift_bridgeObjectRelease();
  v17 = sub_1BC089CA0();

  v18 = sub_1BC08A3C0();
  if (*(_QWORD *)(a1 + 16) && (v20 = sub_1BC0258D8(v18, v19), (v21 & 1) != 0))
  {
    v22 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v20);
    v23 = v22;
  }
  else
  {
    v22 = 0;
  }
  swift_bridgeObjectRelease();
  v24 = sub_1BC089CA0();

  v25 = sub_1BC08A3C0();
  if (*(_QWORD *)(a1 + 16) && (v27 = sub_1BC0258D8(v25, v26), (v28 & 1) != 0))
  {
    v29 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v27);
    v30 = v29;
  }
  else
  {
    v29 = 0;
  }
  swift_bridgeObjectRelease();
  v31 = sub_1BC089CA0();

  v32 = sub_1BC08A3C0();
  if (*(_QWORD *)(a1 + 16) && (v34 = sub_1BC0258D8(v32, v33), (v35 & 1) != 0))
  {
    v36 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v34);
    v37 = v36;
  }
  else
  {
    v36 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v38 = sub_1BC089CA0();

  *a2 = v10;
  a2[1] = v17;
  a2[2] = v24;
  a2[3] = v31;
  a2[4] = v38;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:modelTrainingEvent:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v4 = swift_allocObject();
  sub_1BC0608CC(a2, v4+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent);
  swift_retain();
  v5 = objc_msgSend(a1, sel_sectionSortOrder);
  *(_QWORD *)(v4
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank) = v5;
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  sub_1BBFE1BD4(a2, (uint64_t (*)(_QWORD))type metadata accessor for ModelTrainingEvent);
  return v4;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.init(averageProbabilityOfPositiveInteractionForThisSession:interactedFeedItems:)@<X0>(unint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1BC080990();
  v4 = sub_1BC089CAC();
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v13 = sub_1BC089CC4();
    result = swift_bridgeObjectRelease();
    *a2 = v4;
    a2[1] = v13;
    return result;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1BC08AA80();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_13;
LABEL_3:
  v17 = MEMORY[0x1E0DEE9D8];
  result = sub_1BBFE449C(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v14 = a1 & 0xC000000000000001;
    v8 = a1;
    do
    {
      if (v14)
        MEMORY[0x1BCCE934C](v7, a1);
      else
        swift_retain();
      sub_1BC07F168();
      sub_1BC08AB64();
      sub_1BC08A420();
      swift_bridgeObjectRelease();
      sub_1BC08A420();
      type metadata accessor for ModelTrainingEvent();
      sub_1BC08A420();
      swift_bridgeObjectRelease();
      sub_1BC08A420();
      sub_1BC08A420();
      swift_bridgeObjectRelease();
      sub_1BC08A420();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v15 = sub_1BC08A438();
      v16 = v9;
      sub_1BC08A414();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = *(_QWORD *)(v17 + 16);
      v10 = *(_QWORD *)(v17 + 24);
      if (v11 >= v10 >> 1)
        sub_1BBFE449C(v10 > 1, v11 + 1, 1);
      ++v7;
      *(_QWORD *)(v17 + 16) = v11 + 1;
      v12 = v17 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v15;
      *(_QWORD *)(v12 + 40) = v16;
      a1 = v8;
    }
    while (v5 != v7);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id AppSessionAnalyticsEvent.ModelAnalytics.averageModelPrediction.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.averageModelEntropy.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.cumulativeAverageProbabilityOfPositiveInteraction.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.modelTotalTrainingEvents.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void *AppSessionAnalyticsEvent.ModelAnalytics.normalizedAverageModelEntropy.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

uint64_t AppSessionAnalyticsEvent.ModelAnalytics.init(averageModelPrediction:averageModelEntropy:cumulativeAverageProbabilityOfPositiveInteraction:modelTotalTrainingEvents:normalizedAverageModelEntropy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void sub_1BC07E980()
{
  qword_1ED6A05B8 = (uint64_t)&unk_1E749F210;
}

void sub_1BC07E994()
{
  qword_1ED6A05D0 = (uint64_t)&unk_1E749F310;
}

void sub_1BC07E9A8()
{
  qword_1ED6A04C0 = (uint64_t)&unk_1E749F2A0;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ageOfFeed.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedCount.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsGeneratedTypes.modify())()
{
  return nullsub_1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsShownCount.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedItemsShownTypes.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.feedType.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

void *AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.minutesElapsed.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

id AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.spinnerDisplayed.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 56);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.init(ageOfFeed:feedItemsGeneratedCount:feedItemsGeneratedTypes:feedItemsShownCount:feedItemsShownTypes:feedType:minutesElapsed:spinnerDisplayed:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.dataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.dataVisualizationKind.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0809D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, a1, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.timeScope.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0809D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, a1, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  sub_1BC080A20(a2, v6+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC080A20(a3, v6+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return v6;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  sub_1BC080A20(a2, v3+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC080A20(a3, v3+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return v3;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(void *a1)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(char *, _QWORD);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
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
  char *v52;
  char *v53;
  void *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char v58[32];
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 v61;
  uint64_t v62;

  sub_1BC00CD90(0, &qword_1ED69BB08, (void (*)(uint64_t))MEMORY[0x1E0D2DF68]);
  MEMORY[0x1E0C80A78](v2);
  v53 = (char *)&v50 - v3;
  sub_1BC00CD90(0, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  MEMORY[0x1E0C80A78](v4);
  v55 = (char *)&v50 - v5;
  sub_1BC00CD90(0, &qword_1ED69BB58, (void (*)(uint64_t))MEMORY[0x1E0D2E4B8]);
  MEMORY[0x1E0C80A78](v6);
  v51 = (char *)&v50 - v7;
  sub_1BC00CD90(0, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  MEMORY[0x1E0C80A78](v8);
  v52 = (char *)&v50 - v9;
  v54 = a1;
  v10 = sub_1BC089BC8();
  v11 = v10;
  v12 = v10 & 0xC000000000000001;
  if ((v10 & 0xC000000000000001) != 0)
  {
    v13 = sub_1BC08A8A0();
    if (v13)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x1E0DEE9D8];
LABEL_23:
    v35 = v56;
    *(_QWORD *)(v56 + 16) = v17;
    v36 = sub_1BC089A0C();
    v37 = (uint64_t)v51;
    v38 = v54;
    sub_1BC089B8C();
    v39 = *(_QWORD *)(v36 - 8);
    v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v37, 1, v36);
    v41 = (uint64_t)v55;
    v43 = (uint64_t)v52;
    v42 = (uint64_t)v53;
    if (v40 == 1)
    {
      sub_1BC00CE18(v37, &qword_1ED69BB58, (void (*)(uint64_t))MEMORY[0x1E0D2E4B8]);
      v44 = sub_1BC089880();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v43, 1, 1, v44);
    }
    else
    {
      sub_1BC089A00();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v36);
      v45 = sub_1BC089880();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v43, 0, 1, v45);
    }
    sub_1BC080A20(v43, v35+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
    v46 = sub_1BC089754();
    sub_1BC089B8C();
    v47 = *(_QWORD *)(v46 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v42, 1, v46) == 1)
    {

      sub_1BC00CE18(v42, &qword_1ED69BB08, (void (*)(uint64_t))MEMORY[0x1E0D2DF68]);
      v48 = sub_1BC0895D4();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v41, 1, 1, v48);
    }
    else
    {
      sub_1BC089748();

      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v42, v46);
      v49 = sub_1BC0895D4();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v41, 0, 1, v49);
    }
    sub_1BC080A20(v41, v35+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
    return v35;
  }
  v13 = *(_QWORD *)(v10 + 16);
  if (!v13)
    goto LABEL_6;
LABEL_3:
  v62 = MEMORY[0x1E0DEE9D8];
  sub_1BBFE4654(0, v13 & ~(v13 >> 63), 0);
  if (v12)
  {
    result = sub_1BC08A858();
    v16 = 1;
  }
  else
  {
    result = sub_1BC080830(v11);
    v16 = v18 & 1;
  }
  v59 = result;
  v60 = v15;
  v61 = v16;
  if ((v13 & 0x8000000000000000) == 0)
  {
    v19 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v11 < 0)
      v19 = v11;
    v57 = v19;
    do
    {
      while (1)
      {
        v26 = v59;
        v25 = v60;
        v27 = v61;
        sub_1BC0805E0(v59, v60, v61, v11, (void (*)(_QWORD))sub_1BBFEC1E0);
        v29 = v28;
        v30 = objc_msgSend(v28, sel_code);

        v31 = v62;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_1BBFE4654(0, *(_QWORD *)(v31 + 16) + 1, 1);
          v31 = v62;
        }
        v33 = *(_QWORD *)(v31 + 16);
        v32 = *(_QWORD *)(v31 + 24);
        if (v33 >= v32 >> 1)
        {
          result = sub_1BBFE4654(v32 > 1, v33 + 1, 1);
          v31 = v62;
        }
        *(_QWORD *)(v31 + 16) = v33 + 1;
        *(_QWORD *)(v31 + 8 * v33 + 32) = v30;
        if (v12)
          break;
        v20 = sub_1BBFE76F8(v26, v25, v27, v11);
        v22 = v21;
        v24 = v23;
        sub_1BBFE9178(v26, v25, v27);
        v59 = v20;
        v60 = v22;
        v61 = v24 & 1;
        if (!--v13)
          goto LABEL_22;
      }
      if ((v27 & 1) == 0)
        goto LABEL_31;
      if (sub_1BC08A870())
        swift_isUniquelyReferenced_nonNull_native();
      sub_1BBFEC168();
      v34 = (void (*)(char *, _QWORD))sub_1BC08A570();
      sub_1BC08A8E8();
      v34(v58, 0);
      --v13;
    }
    while (v13);
LABEL_22:
    sub_1BBFE9178(v59, v60, v61);
    swift_bridgeObjectRelease();
    v17 = v62;
    goto LABEL_23;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1BC07F168()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;

  v1 = v0;
  v2 = *v0;
  sub_1BC00CD90(0, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v27 - v4;
  sub_1BC00CD90(0, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v27 - v7;
  v30 = 0;
  v31 = 0xE000000000000000;
  v9 = v0[2];
  v10 = *(_QWORD *)(v9 + 16);
  v11 = MEMORY[0x1E0DEE9D8];
  if (v10)
  {
    v27[0] = v0;
    v27[1] = v2;
    *(_QWORD *)&v28 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1BBFE44B8(0, v10, 0);
    v12 = 0;
    v11 = v28;
    v13 = *(_QWORD *)(v28 + 16);
    do
    {
      v14 = *(_QWORD *)(v9 + 8 * v12 + 32);
      *(_QWORD *)&v28 = v11;
      v15 = *(_QWORD *)(v11 + 24);
      if (v13 >= v15 >> 1)
      {
        sub_1BBFE44B8(v15 > 1, v13 + 1, 1);
        v11 = v28;
      }
      ++v12;
      *(_QWORD *)(v11 + 16) = v13 + 1;
      *(_QWORD *)(v11 + 8 * v13++ + 32) = v14;
    }
    while (v10 != v12);
    swift_bridgeObjectRelease();
    v1 = (_QWORD *)v27[0];
  }
  MEMORY[0x1BCCE8EA8](v11, MEMORY[0x1E0DEB418]);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC0809D4((uint64_t)v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, (uint64_t)v8, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  v16 = sub_1BC089880();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, v16);
  v19 = MEMORY[0x1E0DEA968];
  if (v18 == 1)
  {
    sub_1BC00CE18((uint64_t)v8, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
    v28 = 0u;
    v29 = 0u;
  }
  else
  {
    v20 = sub_1BC089874();
    *((_QWORD *)&v29 + 1) = v19;
    *(_QWORD *)&v28 = v20;
    *((_QWORD *)&v28 + 1) = v21;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v16);
  }
  sub_1BBFDA9C0(&qword_1ED69C008, type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem, (uint64_t)&protocol conformance descriptor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem);
  sub_1BC089CB8();
  sub_1BBFE1BD4((uint64_t)&v28, (uint64_t (*)(_QWORD))sub_1BBFE1B7C);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC0809D4((uint64_t)v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, (uint64_t)v5, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  v22 = sub_1BC0895D4();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v22) == 1)
  {
    sub_1BC00CE18((uint64_t)v5, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
    v28 = 0u;
    v29 = 0u;
  }
  else
  {
    v24 = sub_1BC0895C8();
    *((_QWORD *)&v29 + 1) = v19;
    *(_QWORD *)&v28 = v24;
    *((_QWORD *)&v28 + 1) = v25;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
  }
  sub_1BC089CB8();
  sub_1BBFE1BD4((uint64_t)&v28, (uint64_t (*)(_QWORD))sub_1BBFE1B7C);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return swift_deallocClassInstance();
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.rank.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.magnitude.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.completeness.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.prominence.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0809D4(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, a1, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = swift_allocObject();
  *(_QWORD *)(v17
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = a4;
  v18 = v17
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(_QWORD *)v18 = a5;
  *(_BYTE *)(v18 + 8) = a6 & 1;
  v19 = v17
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(_QWORD *)v19 = a7;
  *(_BYTE *)(v19 + 8) = a8 & 1;
  sub_1BC080A20(a9, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  *(_QWORD *)(v17 + 16) = a1;
  sub_1BC080A20(a2, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC080A20(a3, v17+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return v17;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(v9
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = a4;
  v13 = v9
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(_QWORD *)v13 = a5;
  *(_BYTE *)(v13 + 8) = a6 & 1;
  v14 = v9
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(_QWORD *)v14 = a7;
  *(_BYTE *)(v14 + 8) = a8 & 1;
  sub_1BC080A20(a9, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  *(_QWORD *)(v9 + 16) = a1;
  sub_1BC080A20(a2, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC080A20(a3, v9+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  return v9;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(feedItem:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;

  sub_1BC00CD90(0, &qword_1ED69BB10, (void (*)(uint64_t))MEMORY[0x1E0D2E018]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v33 - v4;
  sub_1BC00CD90(0, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v33 - v7;
  sub_1BC00CD90(0, &qword_1ED69BB50, (void (*)(uint64_t))MEMORY[0x1E0D2E420]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v33 - v10;
  sub_1BC00CD90(0, &qword_1ED69BB48, (void (*)(uint64_t))MEMORY[0x1E0D2E380]);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v33 - v13;
  swift_retain();
  v15 = objc_msgSend(a1, sel_sectionSortOrder);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank) = v15;
  v16 = sub_1BC089940();
  sub_1BC089B8C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16);
  if (v18 == 1)
  {
    sub_1BC00CE18((uint64_t)v14, &qword_1ED69BB48, (void (*)(uint64_t))MEMORY[0x1E0D2E380]);
    v19 = 0;
  }
  else
  {
    sub_1BC089934();
    v19 = v20;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
  }
  v21 = v1
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude;
  *(_QWORD *)v21 = v19;
  *(_BYTE *)(v21 + 8) = v18 == 1;
  v22 = sub_1BC0899B8();
  sub_1BC089B8C();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v11, 1, v22);
  if (v24 == 1)
  {
    sub_1BC00CE18((uint64_t)v11, &qword_1ED69BB50, (void (*)(uint64_t))MEMORY[0x1E0D2E420]);
    v25 = 0;
  }
  else
  {
    sub_1BC0899AC();
    v25 = v26;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v22);
  }
  v27 = v1
      + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness;
  *(_QWORD *)v27 = v25;
  *(_BYTE *)(v27 + 8) = v24 == 1;
  v28 = sub_1BC0897E4();
  sub_1BC089B8C();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v5, 1, v28) == 1)
  {
    sub_1BC00CE18((uint64_t)v5, &qword_1ED69BB10, (void (*)(uint64_t))MEMORY[0x1E0D2E018]);
    v30 = sub_1BC0896A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v8, 1, 1, v30);
  }
  else
  {
    sub_1BC0897D8();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v28);
    v31 = sub_1BC0896A0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v8, 0, 1, v31);
  }
  sub_1BC080A20((uint64_t)v8, v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  return v1;
}

unint64_t sub_1BC07FBF8()
{
  unint64_t result;

  result = qword_1ED69C0E0;
  if (!qword_1ED69C0E0)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics, &type metadata for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics);
    atomic_store(result, (unint64_t *)&qword_1ED69C0E0);
  }
  return result;
}

uint64_t sub_1BC07FC3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  sub_1BC00CD90(0, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v15 - v2;
  v4 = sub_1BC07F168();
  v6 = v5;
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v15 + 1) = 0xE000000000000000;
  sub_1BC08A954();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v17 = 8236;
  *((_QWORD *)&v17 + 1) = 0xE200000000000000;
  *(_QWORD *)&v15 = *(_QWORD *)(v0
                              + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_rank);
  sub_1BC08AB64();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  v7 = MEMORY[0x1E0DEB070];
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude
                 + 8) & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
  }
  else
  {
    v8 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_magnitude);
    *((_QWORD *)&v16 + 1) = MEMORY[0x1E0DEB070];
    *(_QWORD *)&v15 = v8;
  }
  sub_1BBFDA9C0(&qword_1ED69BF08, type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem, (uint64_t)&protocol conformance descriptor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem);
  sub_1BC089CB8();
  sub_1BBFE1BD4((uint64_t)&v15, (uint64_t (*)(_QWORD))sub_1BBFE1B7C);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness
                 + 8) & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
  }
  else
  {
    v9 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_completeness);
    *((_QWORD *)&v16 + 1) = v7;
    *(_QWORD *)&v15 = v9;
  }
  sub_1BC089CB8();
  sub_1BBFE1BD4((uint64_t)&v15, (uint64_t (*)(_QWORD))sub_1BBFE1B7C);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC0809D4(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, (uint64_t)v3, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  v10 = sub_1BC0896A0();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v3, 1, v10) == 1)
  {
    sub_1BC00CE18((uint64_t)v3, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
    v15 = 0u;
    v16 = 0u;
  }
  else
  {
    *((_QWORD *)&v16 + 1) = v10;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v15);
    (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 32))(boxed_opaque_existential_0, v3, v10);
  }
  sub_1BC089CB8();
  sub_1BBFE1BD4((uint64_t)&v15, (uint64_t (*)(_QWORD))sub_1BBFE1B7C);
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  v15 = v17;
  *(_QWORD *)&v17 = v4;
  *((_QWORD *)&v17 + 1) = v6;
  swift_bridgeObjectRetain();
  *(_QWORD *)&v17 = sub_1BC08A438();
  *((_QWORD *)&v17 + 1) = v13;
  sub_1BC08A414();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
  sub_1BC080380();
}

void AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)()
{
  sub_1BC080380();
}

uint64_t sub_1BC07FFC4()
{
  uint64_t v0;

  return sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics13ShownFeedItem_prominence, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  return swift_deallocClassInstance();
}

id AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.averageProbabilityOfPositiveInteractionForThisSession.modify())()
{
  return nullsub_1;
}

id AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.feedItemsInteractionKind.modify())()
{
  return nullsub_1;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.init(averageProbabilityOfPositiveInteractionForThisSession:feedItemsInteractionKind:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.modelTrainingEvent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0608CC(v1+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, a1);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.rank.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(feedItem:modelTrainingEvent:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  id v5;

  sub_1BC0608CC(a2, v2+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent);
  swift_retain();
  v5 = objc_msgSend(a1, sel_sectionSortOrder);
  *(_QWORD *)(v2
            + OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_rank) = v5;
  swift_release();
  AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.init(feedItem:)(a1);
  sub_1BBFE1BD4(a2, (uint64_t (*)(_QWORD))type metadata accessor for ModelTrainingEvent);
  return v2;
}

uint64_t sub_1BC080244()
{
  uint64_t v1;

  sub_1BC07F168();
  sub_1BC08AB64();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC0808B8();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v1 = sub_1BC08A438();
  sub_1BC08A414();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
  sub_1BC080380();
}

void sub_1BC080380()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(dataTypes:dataVisualizationKind:timeScope:)()
{
  sub_1BC080380();
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.init(feedItem:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC080418()
{
  uint64_t v0;

  return sub_1BBFE1BD4(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(_QWORD))type metadata accessor for ModelTrainingEvent);
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  sub_1BBFE1BD4(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(_QWORD))type metadata accessor for ModelTrainingEvent);
  return v0;
}

uint64_t AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_dataVisualizationKind, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  sub_1BC00CE18(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent35HighlightsFeedPresentationAnalytics17GeneratedFeedItem_timeScope, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
  sub_1BBFE1BD4(v0+ OBJC_IVAR____TtCVV18HealthPlatformCore24AppSessionAnalyticsEvent34HighlightsFeedInteractionAnalytics18InteractedFeedItem_modelTrainingEvent, (uint64_t (*)(_QWORD))type metadata accessor for ModelTrainingEvent);
  return swift_deallocClassInstance();
}

id AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.getter()
{
  id *v0;

  return *v0;
}

void AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*AppSessionAnalyticsEvent.DemographicAnalytics.hasPairedWatch.modify())()
{
  return nullsub_1;
}

uint64_t (*AppSessionAnalyticsEvent.ImproveHealthAnalytics.isImproveHealthAndActivityAllowed.modify())()
{
  return nullsub_1;
}

unint64_t sub_1BC080584()
{
  unint64_t result;

  result = qword_1ED69C0F0;
  if (!qword_1ED69C0F0)
  {
    result = MEMORY[0x1BCCE9B68]("-\\A+p]", &type metadata for AppSessionAnalyticsEvent.ModelAnalytics);
    atomic_store(result, (unint64_t *)&qword_1ED69C0F0);
  }
  return result;
}

void sub_1BC0805C8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1BC0805E0(a1, a2, a3, a4, (void (*)(_QWORD))sub_1BBFEC1E0);
}

void sub_1BC0805D4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1BC0805E0(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0D2E638]);
}

void sub_1BC0805E0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(_QWORD))
{
  void *v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  void *v18;

  v8 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_1BC08A888() == *(_DWORD *)(a4 + 36))
      {
        sub_1BC08A894();
        a5(0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v5 = v18;
        swift_unknownObjectRelease();
        v10 = sub_1BC08A7B0();
        v11 = -1 << *(_BYTE *)(a4 + 32);
        v8 = v10 & ~v11;
        if (((*(_QWORD *)(a4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
        {
          v12 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v8);
          v13 = sub_1BC08A7BC();

          if ((v13 & 1) == 0)
          {
            v14 = ~v11;
            do
            {
              v8 = (v8 + 1) & v14;
              if (((*(_QWORD *)(a4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
                goto LABEL_24;
              v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v8);
              v16 = sub_1BC08A7BC();

            }
            while ((v16 & 1) == 0);
          }

LABEL_20:
          v17 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v8);
          return;
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
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v9 = a4;
  else
    v9 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x1BCCE928C](a1, a2, v9);
  a5(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1BC080830(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
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

uint64_t sub_1BC0808B8()
{
  type metadata accessor for ModelTrainingEvent();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A420();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1BC080990()
{
  unint64_t result;

  result = qword_1ED69BEF8;
  if (!qword_1ED69BEF8)
  {
    result = MEMORY[0x1BCCE9B68](&protocol conformance descriptor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics, &type metadata for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics);
    atomic_store(result, (unint64_t *)&qword_1ED69BEF8);
  }
  return result;
}

uint64_t sub_1BC0809D4(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1BC00CD90(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1BC080A20(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1BC00CD90(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem(uint64_t a1)
{
  return sub_1BBFEF770(a1, (uint64_t *)&unk_1ED69C010);
}

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem(uint64_t a1)
{
  return sub_1BBFEF770(a1, (uint64_t *)&unk_1ED69BF10);
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent()
{
  return &type metadata for AppSessionAnalyticsEvent;
}

void destroy for AppSessionAnalyticsEvent.ModelAnalytics(id *a1)
{

}

_QWORD *initializeWithCopy for AppSessionAnalyticsEvent.ModelAnalytics(_QWORD *a1, uint64_t a2)
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

uint64_t assignWithCopy for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t a1, uint64_t a2)
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

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  v16 = *(void **)(a1 + 32);
  v17 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v17;
  v18 = v17;

  return a1;
}

uint64_t assignWithTake for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.ModelAnalytics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.ModelAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.ModelAnalytics;
}

void destroy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(id *a1)
{

}

_QWORD *initializeWithCopy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a2 + 40);
  a1[4] = v7;
  a1[5] = v8;
  v9 = *(void **)(a2 + 48);
  v10 = *(void **)(a2 + 56);
  a1[6] = v9;
  a1[7] = v10;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  return a1;
}

uint64_t assignWithCopy for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, uint64_t a2)
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
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

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

  v16 = *(void **)(a2 + 32);
  v17 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v16;
  v18 = v16;

  v19 = *(void **)(a2 + 40);
  v20 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v19;
  v21 = v19;

  v22 = *(void **)(a1 + 48);
  v23 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v23;
  v24 = v23;

  v25 = *(void **)(a2 + 56);
  v26 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v25;
  v27 = v25;

  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, _OWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  v7 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics;
}

uint64_t sub_1BC080FD8()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem(0);
}

void sub_1BC080FE0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1BC00CD90(319, &qword_1ED69BB38, (void (*)(uint64_t))MEMORY[0x1E0D2E180]);
  if (v0 <= 0x3F)
  {
    sub_1BC00CD90(319, &qword_1ED69BAE0, (void (*)(uint64_t))MEMORY[0x1E0D2DB50]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.__allocating_init(feedItem:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.GeneratedFeedItem.stringRepresentation.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_1BC0810C0()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem(0);
}

void sub_1BC0810C8()
{
  unint64_t v0;

  sub_1BC00CD90(319, &qword_1ED69BB00, (void (*)(uint64_t))MEMORY[0x1E0D2DE38]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedPresentationAnalytics.ShownFeedItem.__allocating_init(dataTypes:dataVisualizationKind:timeScope:rank:magnitude:completeness:prominence:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(v8 + 160))(a1, a2, a3, a4, a5, a6 & 1, a7, a8 & 1);
}

_QWORD *initializeBufferWithCopyOfBuffer for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(id *a1)
{

}

uint64_t assignWithCopy for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics;
}

uint64_t sub_1BC08127C()
{
  return type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(0);
}

uint64_t type metadata accessor for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem(uint64_t a1)
{
  return sub_1BBFEF770(a1, (uint64_t *)&unk_1ED69BE08);
}

uint64_t sub_1BC081298()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ModelTrainingEvent();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSessionAnalyticsEvent.HighlightsFeedInteractionAnalytics.InteractedFeedItem.__allocating_init(feedItem:modelTrainingEvent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.DemographicAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.DemographicAnalytics;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.ImproveHealthAnalytics()
{
  return &type metadata for AppSessionAnalyticsEvent.ImproveHealthAnalytics;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppSessionAnalyticsEvent.Failure(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for AppSessionAnalyticsEvent.Failure(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for AppSessionAnalyticsEvent.Failure(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
      v7 = v4;
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    v5 = v4;
    v6 = *a1;
    *a1 = v4;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for AppSessionAnalyticsEvent.Failure(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSessionAnalyticsEvent.Failure(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AppSessionAnalyticsEvent.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_1BC081540(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1BC081558(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AppSessionAnalyticsEvent.Failure()
{
  return &type metadata for AppSessionAnalyticsEvent.Failure;
}

uint64_t *BaseFeedPopulationManager.init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v15;

  v7 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = sub_1BC0862EC(a1, a2, (uint64_t)v11, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v13;
}

uint64_t BaseFeedPopulationManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1BC08169C()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC089FD0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0816FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  char *v41;
  uint64_t (*v42)(uint64_t);
  char *v43;
  uint64_t v45;
  int v46;
  uint64_t v47;
  void *v48;
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD aBlock[7];

  v4 = v3;
  v53 = a2;
  v54 = a3;
  v60 = *v3;
  v6 = sub_1BC08A270();
  v59 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v58 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC08A2B8();
  v56 = *(_QWORD *)(v8 - 8);
  v57 = v8;
  MEMORY[0x1E0C80A78](v8);
  v55 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC089064();
  v50 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BC089DE4();
  v51 = *(_QWORD *)(v13 - 8);
  v52 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
  v16 = (void *)sub_1BC0891C0();
  sub_1BC089D9C();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v17 = sub_1BC089DD8();
  v18 = sub_1BC08A678();
  v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v20 = swift_slowAlloc();
    v49 = v6;
    v21 = v20;
    v47 = swift_slowAlloc();
    v61 = v47;
    *(_DWORD *)v21 = 136315650;
    v46 = v19;
    aBlock[0] = v60;
    swift_getMetatypeMetadata();
    v22 = sub_1BC08A3E4();
    v48 = v16;
    aBlock[0] = sub_1BBFDE0F8(v22, v23, &v61);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    v45 = v21 + 14;
    v24 = objc_msgSend((id)v4[7], sel_profileIdentifier, v21 + 14);
    v25 = objc_msgSend(v24, sel_identifier);

    sub_1BC08904C();
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v26 = sub_1BC08AB64();
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v12, v10);
    aBlock[0] = sub_1BBFDE0F8(v26, v28, &v61);
    sub_1BC08A7EC();
    swift_release_n();
    v16 = v48;
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    v29 = swift_bridgeObjectRetain();
    v30 = MEMORY[0x1BCCE8EA8](v29, MEMORY[0x1E0D2E570]);
    v32 = v31;
    swift_bridgeObjectRelease();
    aBlock[0] = sub_1BBFDE0F8(v30, v32, &v61);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v17, (os_log_type_t)v46, "[%s]_%s: Enqueuing deleteFeed of kinds: %s", (uint8_t *)v21, 0x20u);
    v33 = v47;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v33, -1, -1);
    v34 = v21;
    v6 = v49;
    MEMORY[0x1BCCE9C40](v34, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  v35 = (_QWORD *)swift_allocObject();
  v35[2] = v4;
  v35[3] = a1;
  v36 = v53;
  v37 = v54;
  v35[4] = v16;
  v35[5] = v36;
  v38 = v60;
  v35[6] = v37;
  v35[7] = v38;
  aBlock[4] = sub_1BC086C70;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBFE410C;
  aBlock[3] = &block_descriptor_15;
  v39 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  v40 = v16;
  swift_retain();
  v41 = v55;
  sub_1BC08A288();
  v61 = MEMORY[0x1E0DEE9D8];
  v42 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BBFDB42C(0, &qword_1ED69DD20, v42, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC086C7C((unint64_t *)&qword_1ED69DD28, &qword_1ED69DD20, v42);
  v43 = v58;
  sub_1BC08A834();
  MEMORY[0x1BCCE90DC](0, v41, v43, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v43, v6);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v57);
  return swift_release();
}

uint64_t BaseFeedPopulationManager.healthExperienceStore.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BBFE1C58(v1 + 16, a1);
}

id BaseFeedPopulationManager.healthStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 56);
}

uint64_t FeedPopulationManaging<>.handleUpdatedFeedItems(_:)(uint64_t a1, uint64_t a2, char *a3)
{
  id *v3;
  id *v4;
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
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t (*v24)(uint64_t, uint64_t, char *);
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  _BOOL4 v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  os_log_t v67;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  id v78;
  id v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char *v90;
  NSObject *v91;
  os_log_type_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  id v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  void (*v105)(char *, uint64_t);
  id v106;
  id v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  os_log_t v113;
  uint64_t v114;
  _QWORD *v115;
  char *v116;
  void (*v117)(uint64_t, uint64_t (*)(), _QWORD *);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  os_log_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  os_log_t v134;

  v4 = v3;
  v126 = sub_1BC089064();
  v124 = *(_QWORD *)(v126 - 8);
  MEMORY[0x1E0C80A78](v126);
  v125 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC0897CC();
  v132 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v128 = (char *)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v127 = (os_log_t)((char *)&v118 - v12);
  v131 = sub_1BC089DE4();
  v13 = *(_QWORD *)(v131 - 8);
  v14 = MEMORY[0x1E0C80A78](v131);
  v129 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v118 - v17;
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v118 - v20;
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v118 - v22;
  v24 = (uint64_t (*)(uint64_t, uint64_t, char *))*((_QWORD *)a3 + 8);
  v130 = a2;
  if ((v24(a1, a2, a3) & 1) != 0)
  {
    v121 = v18;
    v122 = v21;
    v129 = a3;
    sub_1BC089D9C();
    v25 = v9;
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v132 + 16))(v127, a1, v9);
    swift_retain_n();
    v26 = sub_1BC089DD8();
    v27 = sub_1BC08A678();
    v28 = v27;
    v29 = os_log_type_enabled(v26, v27);
    v30 = v4;
    v31 = a1;
    v123 = v13;
    if (v29)
    {
      v32 = swift_slowAlloc();
      v119 = v25;
      v33 = v32;
      v128 = (char *)swift_slowAlloc();
      v134 = (os_log_t)v128;
      *(_DWORD *)v33 = 136446722;
      LODWORD(v120) = v28;
      v133 = v130;
      swift_getMetatypeMetadata();
      v34 = sub_1BC08A3E4();
      v133 = sub_1BBFDE0F8(v34, v35, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      v118 = v33 + 14;
      v36 = objc_msgSend(v30[7], sel_profileIdentifier, v33 + 14);
      v37 = objc_msgSend(v36, sel_identifier);

      v38 = v125;
      sub_1BC08904C();
      swift_release();

      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v39 = v126;
      v40 = sub_1BC08AB64();
      v42 = v41;
      (*(void (**)(char *, uint64_t))(v124 + 8))(v38, v39);
      v31 = a1;
      v133 = sub_1BBFDE0F8(v40, v42, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 22) = 2080;
      sub_1BBFDA9C0(&qword_1ED69AC78, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2DFC0], MEMORY[0x1E0D2DFD0]);
      v43 = v127;
      v44 = v119;
      v45 = sub_1BC08AB64();
      v133 = sub_1BBFDE0F8(v45, v46, (uint64_t *)&v134);
      v47 = v123;
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      (*(void (**)(os_log_t, uint64_t))(v132 + 8))(v43, v44);
      _os_log_impl(&dword_1BBFD7000, v26, (os_log_type_t)v120, "[%{public}s]_%s: received notice of change domain: %s", (uint8_t *)v33, 0x20u);
      v48 = v128;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v48, -1, -1);
      MEMORY[0x1BCCE9C40](v33, -1, -1);

      v49 = v130;
      v50 = *(void (**)(char *, uint64_t))(v47 + 8);
      v50(v23, v131);
    }
    else
    {
      swift_release_n();
      (*(void (**)(os_log_t, uint64_t))(v132 + 8))(v127, v25);

      v50 = *(void (**)(char *, uint64_t))(v13 + 8);
      v50(v23, v131);
      v49 = v130;
    }
    v69 = v122;
    v70 = (*((uint64_t (**)(uint64_t))v129 + 4))(v49);
    MEMORY[0x1E0C80A78](v70);
    *(&v118 - 2) = v31;
    v72 = sub_1BC082B38((uint64_t)sub_1BC086CC4, (uint64_t)(&v118 - 4), v71);
    sub_1BC089D9C();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v73 = sub_1BC089DD8();
    v74 = sub_1BC08A678();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = swift_slowAlloc();
      v132 = swift_slowAlloc();
      v133 = v49;
      v134 = (os_log_t)v132;
      *(_DWORD *)v75 = 136446722;
      swift_getMetatypeMetadata();
      v76 = sub_1BC08A3E4();
      v133 = sub_1BBFDE0F8(v76, v77, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v75 + 12) = 2080;
      v127 = (os_log_t)(v75 + 14);
      v78 = objc_msgSend(v30[7], sel_profileIdentifier);
      v79 = objc_msgSend(v78, sel_identifier);

      v80 = v125;
      sub_1BC08904C();
      swift_release();

      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v128 = (char *)v50;
      v81 = v126;
      v82 = sub_1BC08AB64();
      v84 = v83;
      (*(void (**)(char *, uint64_t))(v124 + 8))(v80, v81);
      v133 = sub_1BBFDE0F8(v82, v84, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v75 + 22) = 2080;
      v85 = swift_bridgeObjectRetain();
      v86 = MEMORY[0x1BCCE8EA8](v85, MEMORY[0x1E0D2E570]);
      v88 = v87;
      swift_bridgeObjectRelease();
      v133 = sub_1BBFDE0F8(v86, v88, (uint64_t *)&v134);
      v49 = v130;
      sub_1BC08A7EC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BBFD7000, v73, v74, "[%{public}s]_%s: Mapped contentKinds to these FeedKinds: %s", (uint8_t *)v75, 0x20u);
      v89 = v132;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v89, -1, -1);
      MEMORY[0x1BCCE9C40](v75, -1, -1);

      ((void (*)(char *, uint64_t))v128)(v122, v131);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      v50(v69, v131);
    }
    v90 = v121;
    if (*(_QWORD *)(v72 + 16))
    {
      sub_1BC089D9C();
      swift_retain_n();
      v91 = sub_1BC089DD8();
      v92 = sub_1BC08A678();
      v93 = v92;
      if (os_log_type_enabled(v91, v92))
      {
        v94 = swift_slowAlloc();
        LODWORD(v128) = v93;
        v95 = v94;
        v132 = swift_slowAlloc();
        v133 = v49;
        v134 = (os_log_t)v132;
        *(_DWORD *)v95 = 136446978;
        v127 = v91;
        swift_getMetatypeMetadata();
        v96 = sub_1BC08A3E4();
        v133 = sub_1BBFDE0F8(v96, v97, (uint64_t *)&v134);
        sub_1BC08A7EC();
        swift_bridgeObjectRelease();
        *(_WORD *)(v95 + 12) = 2080;
        v120 = v95 + 14;
        v122 = (char *)v30[7];
        v98 = objc_msgSend(v122, sel_profileIdentifier);
        v99 = objc_msgSend(v98, sel_identifier);

        v100 = v125;
        sub_1BC08904C();
        swift_release();

        sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
        v101 = v126;
        v102 = sub_1BC08AB64();
        v104 = v103;
        v105 = *(void (**)(char *, uint64_t))(v124 + 8);
        v105(v100, v101);
        v133 = sub_1BBFDE0F8(v102, v104, (uint64_t *)&v134);
        sub_1BC08A7EC();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v95 + 22) = 2080;
        v124 = v95 + 24;
        v106 = objc_msgSend(v122, sel_profileIdentifier);
        v107 = objc_msgSend(v106, sel_identifier);

        sub_1BC08904C();
        swift_release();

        v108 = sub_1BC08AB64();
        v110 = v109;
        v105(v100, v101);
        v133 = sub_1BBFDE0F8(v108, v110, (uint64_t *)&v134);
        v49 = v130;
        sub_1BC08A7EC();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v95 + 32) = 2082;
        v133 = (uint64_t)v30;
        swift_retain();
        v111 = sub_1BC08A3E4();
        v133 = sub_1BBFDE0F8(v111, v112, (uint64_t *)&v134);
        sub_1BC08A7EC();
        swift_release_n();
        swift_bridgeObjectRelease();
        v113 = v127;
        _os_log_impl(&dword_1BBFD7000, v127, (os_log_type_t)v128, "[%{public}s]_%s: Beginning repopulation of live feeds for profile %s; %{public}s",
          (uint8_t *)v95,
          0x2Au);
        v114 = v132;
        swift_arrayDestroy();
        MEMORY[0x1BCCE9C40](v114, -1, -1);
        MEMORY[0x1BCCE9C40](v95, -1, -1);

        (*(void (**)(char *, uint64_t))(v123 + 8))(v121, v131);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v123 + 8))(v90, v131);
      }
      v115 = (_QWORD *)swift_allocObject();
      v116 = v129;
      v115[2] = v49;
      v115[3] = v116;
      v115[4] = v30;
      v117 = (void (*)(uint64_t, uint64_t (*)(), _QWORD *))*((_QWORD *)*v30 + 17);
      swift_retain();
      v117(v72, sub_1BC086D04, v115);
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC089D9C();
    v51 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))(v128, a1, v9);
    swift_retain_n();
    v52 = sub_1BC089DD8();
    v53 = sub_1BC08A648();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = swift_slowAlloc();
      v127 = (os_log_t)swift_slowAlloc();
      v134 = v127;
      *(_DWORD *)v54 = 136446722;
      v133 = v130;
      swift_getMetatypeMetadata();
      v123 = v13;
      v55 = sub_1BC08A3E4();
      v133 = sub_1BBFDE0F8(v55, v56, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2080;
      v130 = v54 + 14;
      v57 = objc_msgSend(v3[7], sel_profileIdentifier);
      v58 = objc_msgSend(v57, sel_identifier);

      v59 = v125;
      sub_1BC08904C();
      swift_release();

      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v60 = v126;
      v61 = sub_1BC08AB64();
      v63 = v62;
      (*(void (**)(char *, uint64_t))(v124 + 8))(v59, v60);
      v133 = sub_1BBFDE0F8(v61, v63, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 22) = 2080;
      sub_1BBFDA9C0(&qword_1ED69AC78, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2DFC0], MEMORY[0x1E0D2DFD0]);
      v64 = v128;
      v65 = sub_1BC08AB64();
      v133 = sub_1BBFDE0F8(v65, v66, (uint64_t *)&v134);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v132 + 8))(v64, v51);
      _os_log_impl(&dword_1BBFD7000, v52, v53, "[%{public}s]_%s: change domain does not contain pertinent changes; ignoring: %s",
        (uint8_t *)v54,
        0x20u);
      v67 = v127;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v67, -1, -1);
      MEMORY[0x1BCCE9C40](v54, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v123 + 8))(v129, v131);
    }
    else
    {
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v132 + 8))(v128, v51);

      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v129, v131);
    }
  }
}

uint64_t sub_1BC082B38(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(char *);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t (*v12)(char *);
  char v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 + 16);
  if (v5)
  {
    v6 = (uint64_t (*)(char *))result;
    v7 = 0;
    v8 = MEMORY[0x1E0DEE9D8];
    v12 = (uint64_t (*)(char *))result;
    while (v7 < *(_QWORD *)(a3 + 16))
    {
      v11 = *(_BYTE *)(a3 + v7 + 32);
      v13 = v11;
      result = v6(&v13);
      if (v3)
      {
        swift_release();
        goto LABEL_14;
      }
      if ((result & 1) != 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        v14 = v8;
        if ((result & 1) == 0)
        {
          result = sub_1BBFE44D4(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v14;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          result = sub_1BBFE44D4(v9 > 1, v10 + 1, 1);
          v8 = v14;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        *(_BYTE *)(v8 + v10 + 32) = v11;
        v6 = v12;
      }
      if (v5 == ++v7)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    v8 = MEMORY[0x1E0DEE9D8];
LABEL_14:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t sub_1BC082C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BBFE1C58(v1 + 16, a1);
}

id sub_1BC082C94()
{
  uint64_t v0;

  return *(id *)(v0 + 56);
}

uint64_t sub_1BC082C9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t *BaseFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v15;

  v6 = (uint64_t *)swift_allocObject();
  v7 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v7);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = sub_1BC0862EC(a1, a2, (uint64_t)v11, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v13;
}

uint64_t sub_1BC082D78@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
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
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD v55[2];
  os_log_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v10 = sub_1BC089064();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC089DE4();
  v15 = MEMORY[0x1E0C80A78](v14);
  v65 = (char *)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v20 = *a2;
  v19 = a2[1];
  v21 = a2[2];
  if (*a1)
  {
    v59 = v11;
    v60 = v16;
    v61 = v15;
    v63 = v19;
    v22 = a1[2];
    v64 = a1[1];
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1BC089D9C();
    v23 = a3;
    swift_bridgeObjectRetain_n();
    v62 = v22;
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v24 = v23;
    v25 = sub_1BC089DD8();
    v26 = sub_1BC08A678();
    v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v28 = swift_slowAlloc();
      v58 = a5;
      v29 = v28;
      v57 = swift_slowAlloc();
      v69 = v57;
      *(_DWORD *)v29 = 136315906;
      v56 = v25;
      v66 = a4;
      swift_getMetatypeMetadata();
      v30 = sub_1BC08A3E4();
      v66 = sub_1BBFDE0F8(v30, v31, &v69);
      v55[1] = &v67;
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      v32 = objc_msgSend(v24, sel_profileIdentifier, v29 + 14);
      v33 = objc_msgSend(v32, sel_identifier);

      sub_1BC08904C();
      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v34 = sub_1BC08AB64();
      v36 = v35;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v13, v10);
      v66 = sub_1BBFDE0F8(v34, v36, &v69);
      sub_1BC08A7EC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      v66 = v18;
      v67 = v64;
      LODWORD(v59) = v27;
      v37 = v62;
      v68 = v62;
      swift_bridgeObjectRetain();
      swift_retain();
      v38 = sub_1BC08A3E4();
      v66 = sub_1BBFDE0F8(v38, v39, &v69);
      sub_1BC08A7EC();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 32) = 2080;
      v40 = v63;
      v66 = v20;
      v67 = v63;
      v68 = v21;
      swift_bridgeObjectRetain();
      swift_retain();
      v41 = sub_1BC08A3E4();
      v66 = sub_1BBFDE0F8(v41, v42, &v69);
      sub_1BC08A7EC();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v43 = v56;
      _os_log_impl(&dword_1BBFD7000, v56, (os_log_type_t)v59, "[%s]_%s: Consolidating requests to populate %s with %s", (uint8_t *)v29, 0x2Au);
      v44 = v57;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v44, -1, -1);
      v45 = v29;
      a5 = v58;
      MEMORY[0x1BCCE9C40](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      v37 = v62;
      swift_release_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
      v40 = v63;
    }
    v47 = v64;
    v48 = swift_bridgeObjectRetain();
    v49 = sub_1BBFFD3A0(v48);
    swift_bridgeObjectRelease();
    v50 = swift_bridgeObjectRetain();
    v51 = sub_1BBFFD3A0(v50);
    swift_bridgeObjectRelease();
    v52 = sub_1BC084E18(v51, v49);
    v53 = sub_1BBFF245C(v52);
    swift_bridgeObjectRelease();
    v54 = (_QWORD *)swift_allocObject();
    v54[2] = v18;
    v54[3] = v47;
    v54[4] = v37;
    v54[5] = v20;
    v54[6] = v40;
    v54[7] = v21;
    *a5 = v53;
    a5[1] = (uint64_t)sub_1BC0875C8;
    a5[2] = (uint64_t)v54;
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  else
  {
    *a5 = v20;
    a5[1] = v19;
    a5[2] = v21;
    swift_bridgeObjectRetain();
    return swift_retain();
  }
}

uint64_t sub_1BC0832DC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
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
  void *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t (*v41)(void);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  __int128 v59;
  uint64_t v60;

  v50 = a6;
  v44 = a3;
  v56 = a7;
  sub_1BBFDB42C(0, &qword_1ED69B0C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v12 = MEMORY[0x1E0C80A78](v11);
  v53 = (uint64_t)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v51 = (char *)&v43 - v14;
  v15 = sub_1BC0892D4();
  v48 = *(_QWORD *)(v15 - 8);
  v49 = v15;
  MEMORY[0x1E0C80A78](v15);
  v46 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC087220();
  v18 = *(_QWORD *)(v17 - 8);
  v54 = v17;
  v55 = v18;
  MEMORY[0x1E0C80A78](v17);
  v52 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1BC089064();
  v47 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *a1;
  v45 = a1[1];
  v23 = v45;
  v25 = a1[2];
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v26 = (void *)sub_1BC0891C0();
  sub_1BBFE1C58(v44, (uint64_t)&v59);
  v27 = (_QWORD *)swift_allocObject();
  sub_1BBFE95C8(&v59, (uint64_t)(v27 + 2));
  v27[7] = v24;
  v27[8] = v23;
  v27[9] = v25;
  v27[10] = v26;
  v27[11] = a4;
  v27[12] = a5;
  v27[13] = v50;
  sub_1BC0872B8(0, &qword_1ED69AD88, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v50 = v26;
  swift_retain();
  v28 = a5;
  v29 = sub_1BC08A090();
  *(_QWORD *)&v59 = 0;
  *((_QWORD *)&v59 + 1) = 0xE000000000000000;
  sub_1BC08A954();
  swift_bridgeObjectRelease();
  v57 = 0x3A656C69666F7270;
  v58 = 0xE900000000000020;
  v30 = objc_msgSend(v28, sel_profileIdentifier);
  v31 = objc_msgSend(v30, sel_identifier);

  sub_1BC08904C();
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
  sub_1BC08AB64();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v20);
  sub_1BC08A420();
  *(_QWORD *)&v59 = v24;
  *((_QWORD *)&v59 + 1) = v45;
  v60 = v25;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BC08A3E4();
  sub_1BC08A420();
  swift_bridgeObjectRelease();
  v33 = v48;
  v32 = v49;
  v34 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v46, *MEMORY[0x1E0D2D600], v49);
  sub_1BC0892C8();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
  v35 = sub_1BC089D6C();
  v36 = (uint64_t)v51;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v51, 1, 1, v35);
  *(_QWORD *)&v59 = v29;
  sub_1BC00A9C8(v36, v53);
  sub_1BC08715C(&qword_1ED69AD80, &qword_1ED69AD88, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C960D8], MEMORY[0x1E0C96108]);
  swift_retain();
  v37 = v52;
  sub_1BC089E50();
  sub_1BBFEF208(v36, &qword_1ED69B0C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118]);
  sub_1BBFDA9C0(&qword_1ED69ACE8, (uint64_t (*)(uint64_t))sub_1BC087220, MEMORY[0x1E0D2E7F8]);
  v38 = v54;
  v39 = v37;
  v40 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v38);
  *(_QWORD *)&v59 = v40;
  v41 = MEMORY[0x1E0C95D78];
  sub_1BC0872B8(0, (unint64_t *)&qword_1ED69AD70, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC08715C(&qword_1ED69AD68, (unint64_t *)&qword_1ED69AD70, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v41, MEMORY[0x1E0C95D90]);
  sub_1BC08A144();
  swift_release();

  return swift_release();
}

uint64_t sub_1BC08384C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void (*v21)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  id v22;
  id v23;

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  v18 = a3[3];
  v19 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v18);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a7;
  v20[3] = a8;
  v20[4] = a9;
  v20[5] = a4;
  v20[6] = a5;
  v20[7] = a6;
  v20[8] = sub_1BC0873A0;
  v20[9] = v17;
  v20[10] = a10;
  v21 = *(void (**)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v19 + 24);
  swift_retain();
  v22 = a7;
  swift_retain();
  v23 = a9;
  swift_bridgeObjectRetain();
  swift_retain();
  v21(a4, sub_1BC087424, v20, v18, v19);
  return swift_release();
}

void sub_1BC083974(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[6];

  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a2;
  v17[3] = a3;
  v17[4] = a4;
  v17[5] = a5;
  v17[6] = a6;
  v17[7] = a7;
  v17[8] = a8;
  v17[9] = a1;
  v17[10] = a9;
  v21[4] = sub_1BC08747C;
  v21[5] = v17;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1107296256;
  v21[2] = sub_1BBFE410C;
  v21[3] = &block_descriptor_45_0;
  v18 = _Block_copy(v21);
  swift_retain();
  v19 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v20 = a1;
  swift_release();
  objc_msgSend(v20, sel_performBlock_, v18);
  _Block_release(v18);
}

uint64_t sub_1BC083A98(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t Strong;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(id, id, uint64_t, uint64_t (*)(), _QWORD *);
  id v36;
  id v37;
  uint64_t v38;
  char *v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  _BOOL4 v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  id v50;
  char *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  os_log_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  char *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t (*v73)(uint64_t);
  char *v74;
  char *v75;
  _QWORD v77[2];
  os_log_t v78;
  int v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  _QWORD aBlock[6];

  v95 = a6;
  v96 = a7;
  v97 = a5;
  v98 = a3;
  v93 = a2;
  v94 = a4;
  v91 = a8;
  v92 = a9;
  v9 = sub_1BC08A270();
  v89 = *(_QWORD *)(v9 - 8);
  v90 = v9;
  MEMORY[0x1E0C80A78](v9);
  v88 = (char *)v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_1BC08A2B8();
  v87 = *(_QWORD *)(v86 - 8);
  MEMORY[0x1E0C80A78](v86);
  v85 = (char *)v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC08A27C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BC089064();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1BC089DE4();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)v77 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v25 = Strong;
    v26 = (_QWORD *)swift_allocObject();
    v27 = v91;
    v29 = v93;
    v28 = v94;
    v26[2] = v91;
    v26[3] = v29;
    v31 = v97;
    v30 = v98;
    v26[4] = v98;
    v26[5] = v28;
    v32 = v95;
    v33 = v96;
    v26[6] = v31;
    v26[7] = v32;
    v34 = v92;
    v26[8] = v33;
    v26[9] = v34;
    v35 = *(void (**)(id, id, uint64_t, uint64_t (*)(), _QWORD *))(*(_QWORD *)v25 + 168);
    v36 = v29;
    v37 = v27;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v35(v37, v36, v30, sub_1BC0874CC, v26);
    swift_release();
  }
  else
  {
    v38 = v92;
    v80 = v19;
    v81 = v17;
    v82 = v16;
    v83 = v15;
    v84 = v13;
    v91 = (void *)v12;
    v39 = v23;
    sub_1BC089DC0();
    v40 = v93;
    v41 = sub_1BC089DD8();
    v42 = sub_1BC08A660();
    v43 = v42;
    v44 = os_log_type_enabled(v41, v42);
    v45 = v85;
    if (v44)
    {
      v46 = swift_slowAlloc();
      v93 = (id)swift_slowAlloc();
      v99 = v93;
      aBlock[0] = v38;
      *(_DWORD *)v46 = 136315394;
      v78 = v41;
      v79 = v43;
      swift_getMetatypeMetadata();
      v47 = sub_1BC08A3E4();
      aBlock[0] = sub_1BBFDE0F8(v47, v48, (uint64_t *)&v99);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      v77[1] = v46 + 14;
      v49 = objc_msgSend(v40, sel_profileIdentifier);
      v50 = objc_msgSend(v49, sel_identifier);

      v51 = v80;
      sub_1BC08904C();

      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v92 = v20;
      v52 = v45;
      v53 = v40;
      v54 = v82;
      v55 = sub_1BC08AB64();
      v57 = v56;
      (*(void (**)(char *, uint64_t))(v81 + 8))(v51, v54);
      aBlock[0] = sub_1BBFDE0F8(v55, v57, (uint64_t *)&v99);
      sub_1BC08A7EC();

      v45 = v52;
      swift_bridgeObjectRelease();
      v58 = v78;
      _os_log_impl(&dword_1BBFD7000, v78, (os_log_type_t)v79, "[%s]_%s: Self deallocated during picking", (uint8_t *)v46, 0x16u);
      v59 = v93;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v59, -1, -1);
      MEMORY[0x1BCCE9C40](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v21 + 8))(v39, v92);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v21 + 8))(v39, v20);
    }
    v60 = v90;
    v62 = v97;
    v61 = v98;
    v63 = v95;
    v64 = v96;
    v65 = v94;
    v66 = (_QWORD *)swift_allocObject();
    v66[2] = v61;
    v66[3] = v65;
    v66[4] = v62;
    v66[5] = v63;
    v66[6] = v64;
    sub_1BBFE0910();
    v67 = v84;
    v68 = v83;
    v69 = v91;
    (*(void (**)(char *, _QWORD, void *))(v84 + 104))(v83, *MEMORY[0x1E0DEF528], v91);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v70 = (void *)sub_1BC08A720();
    (*(void (**)(char *, void *))(v67 + 8))(v68, v69);
    v71 = swift_allocObject();
    *(_QWORD *)(v71 + 16) = sub_1BC0874C4;
    *(_QWORD *)(v71 + 24) = v66;
    aBlock[4] = sub_1BC040164;
    aBlock[5] = v71;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BBFE410C;
    aBlock[3] = &block_descriptor_55;
    v72 = _Block_copy(aBlock);
    swift_retain();
    sub_1BC08A288();
    v99 = (id)MEMORY[0x1E0DEE9D8];
    v73 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    v74 = v45;
    sub_1BBFDB42C(0, &qword_1ED69DD20, v73, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC086C7C((unint64_t *)&qword_1ED69DD28, &qword_1ED69DD20, v73);
    v75 = v88;
    sub_1BC08A834();
    MEMORY[0x1BCCE90DC](0, v74, v75, v72);
    _Block_release(v72);
    swift_release();

    (*(void (**)(char *, uint64_t))(v89 + 8))(v75, v60);
    (*(void (**)(char *, uint64_t))(v87 + 8))(v74, v86);
    swift_release();
  }
  return swift_release();
}

void sub_1BC0841A8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[6];

  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a6;
  v16[8] = a7;
  v16[9] = a8;
  v20[4] = sub_1BC087520;
  v20[5] = v16;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = sub_1BBFE410C;
  v20[3] = &block_descriptor_64;
  v17 = _Block_copy(v20);
  v18 = a1;
  v19 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
}

uint64_t sub_1BC0842B4(void *a1, void *a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t a1), uint64_t a6, uint64_t a7, void *a8)
{
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
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  os_log_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  char *v59;
  uint64_t (*v60)(uint64_t);
  char *v61;
  _QWORD v63[2];
  os_log_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  id aBlock;
  uint64_t v83;
  uint64_t (*v84)(uint64_t);
  void *v85;
  uint64_t (*v86)();
  uint64_t v87;
  uint64_t v88[3];

  v69 = a8;
  v76 = a4;
  v88[1] = *MEMORY[0x1E0C80C00];
  v14 = sub_1BC089DE4();
  v71 = *(_QWORD *)(v14 - 8);
  v72 = v14;
  MEMORY[0x1E0C80A78](v14);
  v73 = (char *)v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BC089064();
  v70 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC08A270();
  v81 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v80 = (char *)v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1BC08A2B8();
  v78 = *(_QWORD *)(v21 - 8);
  v79 = v21;
  MEMORY[0x1E0C80A78](v21);
  v77 = (char *)v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1BC08A27C();
  v74 = *(_QWORD *)(v23 - 8);
  v75 = v23;
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = 0;
  if (objc_msgSend(a1, sel_save_, &aBlock))
  {
    v26 = aBlock;
LABEL_6:
    v45 = v76;
    goto LABEL_7;
  }
  v67 = a6;
  v68 = a7;
  v27 = aBlock;
  v28 = (void *)sub_1BC088F08();

  swift_willThrow();
  sub_1BC089DC0();
  swift_bridgeObjectRetain();
  swift_retain();
  v29 = v28;
  v30 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  v31 = v28;
  v32 = v30;
  v33 = sub_1BC089DD8();
  v34 = sub_1BC08A660();
  v35 = v34;
  if (!os_log_type_enabled(v33, v34))
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v72);
    a7 = v68;
    a6 = v67;
    goto LABEL_6;
  }
  v36 = swift_slowAlloc();
  v65 = v35;
  v37 = v36;
  v66 = swift_slowAlloc();
  v88[0] = v66;
  *(_DWORD *)v37 = 136315906;
  v64 = v33;
  aBlock = v69;
  swift_getMetatypeMetadata();
  v38 = sub_1BC08A3E4();
  v69 = (void *)v19;
  aBlock = (id)sub_1BBFDE0F8(v38, v39, v88);
  v63[1] = &v83;
  sub_1BC08A7EC();
  swift_bridgeObjectRelease();
  *(_WORD *)(v37 + 12) = 2080;
  v40 = objc_msgSend(v32, sel_profileIdentifier, v37 + 14);
  v41 = objc_msgSend(v40, sel_identifier);

  sub_1BC08904C();
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
  v42 = sub_1BC08AB64();
  v44 = v43;
  (*(void (**)(char *, uint64_t))(v70 + 8))(v18, v16);
  aBlock = (id)sub_1BBFDE0F8(v42, v44, v88);
  sub_1BC08A7EC();

  v19 = (uint64_t)v69;
  swift_bridgeObjectRelease();
  *(_WORD *)(v37 + 22) = 2080;
  v45 = v76;
  aBlock = a3;
  v83 = v76;
  v84 = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  v46 = sub_1BC08A3E4();
  aBlock = (id)sub_1BBFDE0F8(v46, v47, v88);
  sub_1BC08A7EC();
  swift_release_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v37 + 32) = 2080;
  aBlock = v28;
  v48 = v28;
  sub_1BBFE24A4();
  v49 = sub_1BC08A3E4();
  aBlock = (id)sub_1BBFDE0F8(v49, v50, v88);
  sub_1BC08A7EC();
  swift_bridgeObjectRelease();

  v51 = v64;
  _os_log_impl(&dword_1BBFD7000, v64, (os_log_type_t)v65, "[%s]_%s: Unable to save after picking feeds of kinds %s: %s", (uint8_t *)v37, 0x2Au);
  v52 = v66;
  swift_arrayDestroy();
  MEMORY[0x1BCCE9C40](v52, -1, -1);
  MEMORY[0x1BCCE9C40](v37, -1, -1);

  (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v72);
  a7 = v68;
  a6 = v67;
LABEL_7:
  v53 = (_QWORD *)swift_allocObject();
  v53[2] = a3;
  v53[3] = v45;
  v53[4] = a5;
  v53[5] = a6;
  v53[6] = a7;
  sub_1BBFE0910();
  v55 = v74;
  v54 = v75;
  (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v25, *MEMORY[0x1E0DEF528], v75);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v56 = (void *)sub_1BC08A720();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v25, v54);
  v57 = swift_allocObject();
  *(_QWORD *)(v57 + 16) = sub_1BC0874C4;
  *(_QWORD *)(v57 + 24) = v53;
  v86 = sub_1BC040164;
  v87 = v57;
  aBlock = (id)MEMORY[0x1E0C809B0];
  v83 = 1107296256;
  v84 = sub_1BBFE410C;
  v85 = &block_descriptor_74;
  v58 = _Block_copy(&aBlock);
  swift_retain();
  v59 = v77;
  sub_1BC08A288();
  v88[0] = MEMORY[0x1E0DEE9D8];
  v60 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BBFDB42C(0, &qword_1ED69DD20, v60, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC086C7C((unint64_t *)&qword_1ED69DD28, &qword_1ED69DD20, v60);
  v61 = v80;
  sub_1BC08A834();
  MEMORY[0x1BCCE90DC](0, v59, v61, v58);
  _Block_release(v58);
  swift_release();

  (*(void (**)(char *, uint64_t))(v81 + 8))(v61, v19);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v59, v79);
  swift_release();
  return swift_release();
}

uint64_t sub_1BC084AA4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = sub_1BC089064();
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC089DE4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  v12 = a2;
  swift_bridgeObjectRetain_n();
  v13 = v12;
  v14 = sub_1BC089DD8();
  v15 = sub_1BC08A678();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v36 = v8;
    v18 = v17;
    v34 = swift_slowAlloc();
    v38 = v34;
    v39 = a3;
    *(_DWORD *)v18 = 136315650;
    v33 = v16;
    swift_getMetatypeMetadata();
    v19 = sub_1BC08A3E4();
    v35 = v9;
    v39 = sub_1BBFDE0F8(v19, v20, &v38);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    v21 = objc_msgSend(v13, sel_profileIdentifier, v18 + 14);
    v22 = objc_msgSend(v21, sel_identifier);

    sub_1BC08904C();
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v23 = sub_1BC08AB64();
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v5);
    v39 = sub_1BBFDE0F8(v23, v25, &v38);
    sub_1BC08A7EC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2080;
    v26 = swift_bridgeObjectRetain();
    v27 = MEMORY[0x1BCCE8EA8](v26, MEMORY[0x1E0D2E570]);
    v29 = v28;
    swift_bridgeObjectRelease();
    v39 = sub_1BBFDE0F8(v27, v29, &v38);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v14, (os_log_type_t)v33, "[%s]_%s: Population complete for kinds %s", (uint8_t *)v18, 0x20u);
    v30 = v34;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v30, -1, -1);
    MEMORY[0x1BCCE9C40](v18, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v11, v36);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1BC084E18(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;

  v2 = result;
  v3 = 0;
  v15 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_1BBFF2DCC(&v14, *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BC084F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_1BC084F90(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t result;
  _QWORD v43[2];
  uint64_t v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD aBlock[6];

  v52 = a4;
  v11 = sub_1BC089064();
  v49 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC089DE4();
  v50 = *(_QWORD *)(v14 - 8);
  v51 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v17 = sub_1BC089DD8();
  v18 = sub_1BC08A678();
  v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v20 = swift_slowAlloc();
    v48 = a5;
    v21 = v20;
    v46 = swift_slowAlloc();
    v53 = v46;
    aBlock[0] = a6;
    *(_DWORD *)v21 = 136315650;
    v45 = v19;
    swift_getMetatypeMetadata();
    v47 = a3;
    v22 = sub_1BC08A3E4();
    v44 = a6;
    aBlock[0] = sub_1BBFDE0F8(v22, v23, &v53);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    v43[1] = v21 + 14;
    v24 = objc_msgSend(*(id *)(a1 + 56), sel_profileIdentifier);
    v25 = objc_msgSend(v24, sel_identifier);

    sub_1BC08904C();
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v26 = sub_1BC08AB64();
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v11);
    aBlock[0] = sub_1BBFDE0F8(v26, v28, &v53);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    v29 = swift_bridgeObjectRetain();
    v30 = MEMORY[0x1BCCE8EA8](v29, MEMORY[0x1E0D2E570]);
    v32 = v31;
    swift_bridgeObjectRelease();
    v33 = v30;
    v34 = v44;
    aBlock[0] = sub_1BBFDE0F8(v33, v32, &v53);
    a3 = v47;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v17, (os_log_type_t)v45, "[%s]_%s: Deleting feeds of kinds: %s", (uint8_t *)v21, 0x20u);
    v35 = v46;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v35, -1, -1);
    v36 = v21;
    a5 = v48;
    MEMORY[0x1BCCE9C40](v36, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v51);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v51);
    v34 = a6;
  }
  v37 = (_QWORD *)swift_allocObject();
  v37[2] = a2;
  v37[3] = a3;
  v38 = v52;
  v37[4] = a1;
  v37[5] = v38;
  v37[6] = a5;
  v37[7] = v34;
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = sub_1BC086F5C;
  *(_QWORD *)(v39 + 24) = v37;
  aBlock[4] = sub_1BC047244;
  aBlock[5] = v39;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC00FE14;
  aBlock[3] = &block_descriptor_12_0;
  v40 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  v41 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v41, sel_performBlockAndWait_, v40);
  _Block_release(v40);
  LOBYTE(v40) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v40 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1BC085444(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
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
  uint64_t v18;
  char *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  char *v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  char *v56;
  uint64_t (*v57)(uint64_t);
  char *v58;
  uint64_t v59;
  _QWORD v61[2];
  uint64_t v62;
  os_log_t v63;
  void *v64;
  char *v65;
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
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id aBlock[7];
  uint64_t v81[3];

  v64 = a6;
  v79 = a5;
  v73 = a4;
  v81[1] = *MEMORY[0x1E0C80C00];
  v9 = sub_1BC089DE4();
  v68 = *(_QWORD *)(v9 - 8);
  v69 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1BC089064();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x1E0C80A78](v67);
  v65 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BC08A270();
  v77 = *(_QWORD *)(v13 - 8);
  v78 = v13;
  MEMORY[0x1E0C80A78](v13);
  v76 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BC08A2B8();
  v74 = *(_QWORD *)(v15 - 8);
  v75 = v15;
  MEMORY[0x1E0C80A78](v15);
  v72 = (char *)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1BC08A27C();
  v70 = *(_QWORD *)(v17 - 8);
  v71 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a2;
  swift_retain();
  v21 = sub_1BC086F8C(a1, (uint64_t)v20, a3);

  swift_release();
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_1BC08AA80();
    if (!v22)
      goto LABEL_10;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v22)
      goto LABEL_10;
  }
  if (v22 < 1)
    __break(1u);
  for (i = 0; i != v22; ++i)
  {
    if ((v21 & 0xC000000000000001) != 0)
      v24 = (id)MEMORY[0x1BCCE934C](i, v21);
    else
      v24 = *(id *)(v21 + 8 * i + 32);
    v25 = v24;
    objc_msgSend(v20, sel_deleteObject_, v24);

  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  aBlock[0] = 0;
  if ((objc_msgSend(v20, sel_save_, aBlock) & 1) != 0)
  {
    v26 = aBlock[0];
  }
  else
  {
    v27 = aBlock[0];
    v28 = (void *)sub_1BC088F08();

    swift_willThrow();
    v29 = v11;
    sub_1BC089D9C();
    swift_retain();
    v30 = v28;
    swift_retain();
    v31 = v28;
    v32 = sub_1BC089DD8();
    v33 = sub_1BC08A660();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v81[0] = v62;
      *(_DWORD *)v35 = 136315650;
      v63 = v32;
      aBlock[0] = v64;
      swift_getMetatypeMetadata();
      v36 = sub_1BC08A3E4();
      LODWORD(v64) = v34;
      aBlock[0] = (id)sub_1BBFDE0F8(v36, v37, v81);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      v61[1] = v35 + 14;
      v38 = objc_msgSend(*(id *)(a3 + 56), sel_profileIdentifier);
      v39 = objc_msgSend(v38, sel_identifier);

      v40 = v65;
      sub_1BC08904C();

      sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v41 = v67;
      v42 = sub_1BC08AB64();
      v44 = v43;
      (*(void (**)(char *, uint64_t))(v66 + 8))(v40, v41);
      aBlock[0] = (id)sub_1BBFDE0F8(v42, v44, v81);
      sub_1BC08A7EC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2080;
      aBlock[0] = v28;
      v45 = v28;
      sub_1BBFE24A4();
      v46 = sub_1BC08A3E4();
      aBlock[0] = (id)sub_1BBFDE0F8(v46, v47, v81);
      sub_1BC08A7EC();
      swift_bridgeObjectRelease();

      v48 = v63;
      _os_log_impl(&dword_1BBFD7000, v63, (os_log_type_t)v64, "[%s]_%s: Failed to save MOC with error: %s", (uint8_t *)v35, 0x20u);
      v49 = v62;
      swift_arrayDestroy();
      MEMORY[0x1BCCE9C40](v49, -1, -1);
      MEMORY[0x1BCCE9C40](v35, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v68 + 8))(v29, v69);
  }
  sub_1BBFE0910();
  v51 = v70;
  v50 = v71;
  (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v19, *MEMORY[0x1E0DEF528], v71);
  v52 = v79;
  swift_retain();
  v53 = (void *)sub_1BC08A720();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v50);
  v54 = (_QWORD *)swift_allocObject();
  v54[2] = v73;
  v54[3] = v52;
  aBlock[4] = sub_1BC00D644;
  aBlock[5] = v54;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1BBFE410C;
  aBlock[3] = &block_descriptor_18;
  v55 = _Block_copy(aBlock);
  swift_retain();
  v56 = v72;
  sub_1BC08A288();
  v81[0] = MEMORY[0x1E0DEE9D8];
  v57 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69DD18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BBFDB42C(0, &qword_1ED69DD20, v57, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC086C7C((unint64_t *)&qword_1ED69DD28, &qword_1ED69DD20, v57);
  v58 = v76;
  v59 = v78;
  sub_1BC08A834();
  MEMORY[0x1BCCE90DC](0, v56, v58, v55);
  _Block_release(v55);
  swift_release();

  (*(void (**)(char *, uint64_t))(v77 + 8))(v58, v59);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v56, v75);
  return swift_release();
}

uint64_t BaseFeedPopulationManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

BOOL sub_1BC085C28()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v0 = sub_1BC089784();
  v1 = sub_1BC089A90();
  v2 = sub_1BC0860A0(v1, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

uint64_t sub_1BC085C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint64_t);
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  os_log_t v33;
  uint64_t v34;
  _QWORD v36[4];
  char *v37;
  os_log_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v4 = sub_1BC089064();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC089DE4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC089D9C();
  swift_retain_n();
  v12 = sub_1BC089DD8();
  v13 = sub_1BC08A678();
  v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc();
    v39 = v14;
    v16 = v15;
    v40 = swift_slowAlloc();
    v43 = a2;
    v44 = v40;
    *(_DWORD *)v16 = 136446978;
    v42 = v8;
    swift_getMetatypeMetadata();
    v41 = v9;
    v17 = sub_1BC08A3E4();
    v38 = v12;
    v43 = sub_1BBFDE0F8(v17, v18, &v44);
    v36[2] = &v44;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    v36[1] = v16 + 14;
    v19 = *(void **)(a1 + 56);
    v20 = objc_msgSend(v19, sel_profileIdentifier);
    v21 = objc_msgSend(v20, sel_identifier);

    sub_1BC08904C();
    sub_1BBFDA9C0((unint64_t *)&qword_1ED69BAA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v36[3] = a2;
    v22 = sub_1BC08AB64();
    v24 = v23;
    v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v7, v4);
    v43 = sub_1BBFDE0F8(v22, v24, &v44);
    v37 = v11;
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 22) = 2080;
    v26 = objc_msgSend(v19, sel_profileIdentifier);
    v27 = objc_msgSend(v26, sel_identifier);

    sub_1BC08904C();
    v28 = sub_1BC08AB64();
    v30 = v29;
    v25(v7, v4);
    v43 = sub_1BBFDE0F8(v28, v30, &v44);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 32) = 2082;
    v43 = a1;
    swift_retain();
    v31 = sub_1BC08A3E4();
    v43 = sub_1BBFDE0F8(v31, v32, &v44);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    v33 = v38;
    _os_log_impl(&dword_1BBFD7000, v38, (os_log_type_t)v39, "[%{public}s]_%s: Live feeds for profile %s repopulated after save detected; %{public}s",
      (uint8_t *)v16,
      0x2Au);
    v34 = v40;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v34, -1, -1);
    MEMORY[0x1BCCE9C40](v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v37, v42);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1BC0860A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = sub_1BC0892A4();
  v26 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v21 - v8;
  if (!*(_QWORD *)(a2 + 16))
    return 1;
  v22 = *(_QWORD *)(a1 + 16);
  if (!v22)
    return 1;
  v23 = a1 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
  v10 = *(_QWORD *)(v26 + 72);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v25 = a2 + 56;
  v21 = a1;
  swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    v24 = v12;
    v11(v9, v23 + v10 * v12, v4);
    if (*(_QWORD *)(a2 + 16))
    {
      sub_1BBFDA9C0(&qword_1ED69BAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C0]);
      v13 = sub_1BC08A360();
      v14 = -1 << *(_BYTE *)(a2 + 32);
      v15 = v13 & ~v14;
      if (((*(_QWORD *)(v25 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
        break;
    }
LABEL_4:
    v12 = v24 + 1;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v4);
    if (v12 == v22)
    {
      v19 = 1;
      goto LABEL_13;
    }
  }
  v16 = ~v14;
  while (1)
  {
    v11(v7, *(_QWORD *)(a2 + 48) + v15 * v10, v4);
    sub_1BBFDA9C0(&qword_1ED69BAB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D5B0], MEMORY[0x1E0D2D5C8]);
    v17 = sub_1BC08A3A8();
    v18 = *(void (**)(char *, uint64_t))(v26 + 8);
    v18(v7, v4);
    if ((v17 & 1) != 0)
      break;
    v15 = (v15 + 1) & v16;
    if (((*(_QWORD *)(v25 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      goto LABEL_4;
  }
  v18(v9, v4);
  v19 = 0;
LABEL_13:
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t *sub_1BC0862EC(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
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
  void (**v21)(_QWORD, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *boxed_opaque_existential_0;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD v63[3];
  id v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**v78)(_QWORD, _QWORD);
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83[2];
  __int128 v84[2];
  uint64_t v85[5];

  v82 = a1;
  v68 = *a4;
  v12 = sub_1BC089DE4();
  v80 = *(_QWORD *)(v12 - 8);
  v81 = v12;
  MEMORY[0x1E0C80A78](v12);
  v79 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBFDB42C(0, &qword_1ED69D8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v69 = (char *)v63 - v15;
  sub_1BBFEEE04();
  v72 = v16;
  v73 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v70 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBFEEF74();
  v75 = v18;
  v76 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v71 = (char *)v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BBFEEFEC();
  v21 = *(void (***)(_QWORD, _QWORD))(v20 - 8);
  v77 = v20;
  v78 = v21;
  MEMORY[0x1E0C80A78](v20);
  v74 = (char *)v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1BC08A6FC();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x1E0C80A78](v67);
  v65 = (char *)v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1BC08A6CC();
  v25 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v24);
  v63[2] = (char *)v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1BC08A2B8();
  MEMORY[0x1E0C80A78](v27);
  v85[3] = a5;
  v85[4] = a6;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v85);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_0, a3, a5);
  sub_1BBFEEEB8();
  swift_allocObject();
  a4[14] = sub_1BC089FDC();
  a4[15] = 0;
  sub_1BBFE1C58(a1, (uint64_t)(a4 + 2));
  a4[7] = (uint64_t)a2;
  v63[1] = sub_1BBFE0910();
  v29 = a2;
  v64 = v29;
  *(_QWORD *)&v84[0] = sub_1BC08AC9C();
  *((_QWORD *)&v84[0] + 1) = v30;
  sub_1BC08A420();
  v31 = objc_msgSend(v29, sel_profileIdentifier);
  v32 = objc_msgSend(v31, sel_description);
  sub_1BC08A3C0();

  sub_1BC08A420();
  swift_bridgeObjectRelease();
  sub_1BC08A288();
  *(_QWORD *)&v84[0] = MEMORY[0x1E0DEE9D8];
  sub_1BBFDA9C0(&qword_1ED69DCD0, v25, MEMORY[0x1E0DEF828]);
  sub_1BBFDB42C(0, &qword_1ED69DCB8, v25, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC086C7C((unint64_t *)&qword_1ED69DCC0, &qword_1ED69DCB8, v25);
  sub_1BC08A834();
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v65, *MEMORY[0x1E0DEF8D0], v67);
  a4[13] = sub_1BC08A714();
  sub_1BBFE1C58((uint64_t)v85, (uint64_t)(a4 + 8));
  v33 = (void *)a4[13];
  *(_QWORD *)&v84[0] = a4[14];
  *(_QWORD *)&v83[0] = v33;
  v34 = sub_1BC08A6D8();
  v35 = (uint64_t)v69;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v69, 1, 1, v34);
  sub_1BBFDA9C0(&qword_1ED69A9F8, (uint64_t (*)(uint64_t))sub_1BBFEEEB8, MEMORY[0x1E0C95F48]);
  sub_1BBFDA9C0((unint64_t *)&qword_1ED69D8A8, (uint64_t (*)(uint64_t))sub_1BBFE0910, MEMORY[0x1E0DEF7F8]);
  swift_retain();
  v36 = v33;
  v37 = v70;
  sub_1BC08A204();
  sub_1BBFEF208(v35, &qword_1ED69D8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868]);

  swift_release();
  v38 = swift_allocObject();
  v39 = v64;
  v40 = v68;
  *(_QWORD *)(v38 + 16) = v64;
  *(_QWORD *)(v38 + 24) = v40;
  sub_1BBFDA9C0(&qword_1ED69A910, (uint64_t (*)(uint64_t))sub_1BBFEEE04, MEMORY[0x1E0C95CB8]);
  v41 = v39;
  v42 = v71;
  v43 = v72;
  sub_1BC08A168();
  swift_release();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v37, v43);
  v44 = swift_allocObject();
  swift_weakInit();
  sub_1BBFE1C58(v82, (uint64_t)v84);
  sub_1BBFE1C58((uint64_t)v85, (uint64_t)v83);
  v45 = (_QWORD *)swift_allocObject();
  sub_1BBFE95C8(v84, (uint64_t)(v45 + 2));
  sub_1BBFE95C8(v83, (uint64_t)(v45 + 7));
  v45[12] = v44;
  v45[13] = v41;
  v45[14] = v40;
  sub_1BBFEF0B4();
  sub_1BBFDA9C0(&qword_1ED69A6F0, (uint64_t (*)(uint64_t))sub_1BBFEEF74, MEMORY[0x1E0D2A5B0]);
  sub_1BBFDA9C0(&qword_1ED69ACF8, (uint64_t (*)(uint64_t))sub_1BBFEF0B4, MEMORY[0x1E0D2A5C0]);
  v46 = v41;
  v47 = v74;
  v48 = v75;
  sub_1BC08A264();
  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v42, v48);
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v46;
  *(_QWORD *)(v49 + 24) = v40;
  sub_1BBFDA9C0(&qword_1ED69AD20, (uint64_t (*)(uint64_t))sub_1BBFEEFEC, MEMORY[0x1E0C95B78]);
  v50 = v46;
  v51 = v77;
  v52 = sub_1BC08A24C();
  swift_release();
  ((void (**)(char *, uint64_t))v78)[1](v47, v51);
  a4[15] = v52;
  swift_release();
  v53 = v79;
  sub_1BC089D9C();
  swift_retain_n();
  v54 = v53;
  v55 = sub_1BC089DD8();
  v56 = sub_1BC08A678();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    v58 = swift_slowAlloc();
    v78 = (void (**)(_QWORD, _QWORD))v50;
    v59 = v58;
    *(_QWORD *)&v84[0] = v58;
    *(_DWORD *)v57 = 136446210;
    *(_QWORD *)&v83[0] = a4;
    type metadata accessor for BaseFeedPopulationManager();
    swift_retain();
    v60 = sub_1BC08A3E4();
    *(_QWORD *)&v83[0] = sub_1BBFDE0F8(v60, v61, (uint64_t *)v84);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v55, v56, "Ready: %{public}s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v59, -1, -1);
    MEMORY[0x1BCCE9C40](v57, -1, -1);

  }
  else
  {
    swift_release_n();

  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
  __swift_destroy_boxed_opaque_existential_1(v82);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v54, v81);
  return a4;
}

uint64_t sub_1BC086C34()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC086C70()
{
  return sub_1BC086F68((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC084F90);
}

uint64_t sub_1BC086C7C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BBFDB42C(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCE9B68](MEMORY[0x1E0DEAF38], v5);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_1BC086CC4()
{
  return sub_1BC085C28();
}

uint64_t sub_1BC086CE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC086D04()
{
  uint64_t v0;

  return sub_1BC085C90(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 16));
}

uint64_t type metadata accessor for BaseFeedPopulationManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BaseFeedPopulationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:relevanceEngineCoordinator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.populateFeed(feedKinds:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.moc_queue_executeFeedPopulation(managedObjectContext:healthStore:feedKinds:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.deleteFeed(feedKinds:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t destroy for BaseFeedPopulationManager.Request()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s18HealthPlatformCore25BaseFeedPopulationManagerC7RequestVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for BaseFeedPopulationManager.Request(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BaseFeedPopulationManager.Request(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseFeedPopulationManager.Request(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BaseFeedPopulationManager.Request(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseFeedPopulationManager.Request()
{
  return &type metadata for BaseFeedPopulationManager.Request;
}

uint64_t sub_1BC086F20()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC086F5C()
{
  return sub_1BC086F68((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC085444);
}

uint64_t sub_1BC086F68(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1BC086F7C()
{
  return swift_deallocObject();
}

uint64_t sub_1BC086F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  void *v7;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  result = MEMORY[0x1E0DEE9D8];
  v12 = MEMORY[0x1E0DEE9D8];
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    sub_1BC089AFC();
    v7 = *(void **)(a3 + 56);
    swift_bridgeObjectRetain();
    for (i = 0; i != v5; ++i)
    {
      v9 = objc_msgSend(v7, sel_profileIdentifier);
      v10 = (void *)sub_1BC089AF0();

      v11 = sub_1BC089898();
      if (v11)
      {
        MEMORY[0x1BCCE8E84]();
        if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1BC08A504();
        sub_1BC08A528();
        sub_1BC08A4E0();
      }
    }
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_1BC0870E4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BC087108()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69AB30)
  {
    v0 = sub_1BC08A534();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69AB30);
  }
}

uint64_t sub_1BC08715C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1BC0872B8(255, a2, a3);
    result = MEMORY[0x1BCCE9B68](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC08719C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0871C0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC0871E4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();

  return swift_deallocObject();
}

void sub_1BC087220()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED69ACF0)
  {
    v0 = MEMORY[0x1E0C960D8];
    sub_1BC0872B8(255, &qword_1ED69AD88, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C960D8]);
    sub_1BC08715C(&qword_1ED69AD80, &qword_1ED69AD88, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v0, MEMORY[0x1E0C96108]);
    v1 = sub_1BC089E44();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED69ACF0);
  }
}

void sub_1BC0872B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1BC087108();
    v7 = a3(a1, v6, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BC087320()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC08736C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1BC08384C(a1, a2, (_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72), *(void **)(v2 + 80), *(_QWORD *)(v2 + 88), *(void **)(v2 + 96), *(_QWORD *)(v2 + 104));
}

uint64_t sub_1BC0873A0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1BC0873D8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC087424()
{
  return sub_1BC087488((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC083974);
}

uint64_t sub_1BC087430()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BC08747C()
{
  return sub_1BC087488((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC083A98);
}

uint64_t sub_1BC087488(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_1BC0874CC()
{
  return sub_1BC08752C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC0841A8);
}

uint64_t objectdestroy_57Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC087520()
{
  return sub_1BC08752C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BC0842B4);
}

uint64_t sub_1BC08752C(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_1BC087548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(uint64_t (**)(uint64_t, _QWORD))(v0 + 40);
  (*(void (**)(void))(v0 + 24))();
  return v2(v1, 0);
}

uint64_t sub_1BC08758C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0875C8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 48);
  v2 = (*(uint64_t (**)(void))(v0 + 24))();
  return v1(v2);
}

uint64_t InteractiveGeneratorToPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:commitImmediately:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  InteractiveGeneratorToPipelineAdaptor.init(queue:pluginInfo:domain:context:commitImmediately:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t InteractiveGeneratorToPipelineAdaptor.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  v4 = sub_1BC08952C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BC0876FC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1BC087764()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1BC0877AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1BC0877FC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id *InteractiveGeneratorToPipelineAdaptor.init(queue:pluginInfo:domain:context:commitImmediately:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  uint64_t v21;
  void *v22;
  void (*v23)(uint64_t, char *, uint64_t);
  void (*v24)(uint64_t, char *, uint64_t);
  id *v25;
  id v26;
  id v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56[3];

  v52 = a5;
  v54 = a2;
  v43 = (uint64_t)a1;
  v45 = *v5;
  v9 = sub_1BC089DE4();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x1E0C80A78](v9);
  v53 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BC089574();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v42 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC08952C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(id *)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_finishObservation) = 0;
  *(id *)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_queue) = a1;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v18((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain, a3, v14);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v19((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context, a4, v11);
  sub_1BBFE1C58(v54, (uint64_t)v56);
  v49 = a3;
  v18(v17, a3, v14);
  v20 = v42;
  v48 = a4;
  v19(v42, a4, v11);
  type metadata accessor for GenerationOperationToGeneratorAdaptor();
  v21 = swift_allocObject();
  v22 = (void *)v43;
  *(_QWORD *)(v21 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue) = v43;
  v46 = v15;
  v23 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  v44 = v14;
  v23(v21 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_domain, v17, v14);
  v47 = v12;
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
  v25 = v5;
  v24(v21 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v20, v11);
  sub_1BBFE95C8(v56, v21 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo);
  *(id *)((char *)v5 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor) = (id)v21;
  v26 = v22;
  swift_retain();
  if ((v52 & 1) != 0)
  {
    v27 = v45;
    v28 = sub_1BC087D58(v21);
  }
  else
  {
    v28 = sub_1BC0888D4(v21);
    v27 = v45;
  }
  swift_release();
  *(id *)((char *)v25 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher) = (id)v28;
  v29 = v53;
  sub_1BC089D90();
  swift_retain_n();
  v30 = sub_1BC089DD8();
  v31 = sub_1BC08A678();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v45 = v26;
    v33 = v32;
    v43 = swift_slowAlloc();
    v55 = v43;
    *(_QWORD *)&v56[0] = v27;
    *(_DWORD *)v33 = 136446722;
    swift_getMetatypeMetadata();
    v34 = sub_1BC08A3E4();
    *(_QWORD *)&v56[0] = sub_1BBFDE0F8(v34, v35, &v55);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    __swift_project_boxed_opaque_existential_1(*(char **)((char *)v25 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor)+ OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, *(_QWORD *)(*(char **)((char *)v25+ OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_adaptor)+ OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo+ 24));
    v36 = sub_1BC089220();
    *(_QWORD *)&v56[0] = sub_1BBFDE0F8(v36, v37, &v55);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2082;
    if ((v52 & 1) != 0)
      v38 = 1702195828;
    else
      v38 = 0x65736C6166;
    if ((v52 & 1) != 0)
      v39 = 0xE400000000000000;
    else
      v39 = 0xE500000000000000;
    *(_QWORD *)&v56[0] = sub_1BBFDE0F8(v38, v39, &v55);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v30, v31, "[%{public}s]: Initialized for plugin %{public}s with commitImmediately=%{public}s", (uint8_t *)v33, 0x20u);
    v40 = v43;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v40, -1, -1);
    MEMORY[0x1BCCE9C40](v33, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v11);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v49, v44);
    __swift_destroy_boxed_opaque_existential_1(v54);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v51);
  }
  else
  {
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v11);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v49, v44);
    __swift_destroy_boxed_opaque_existential_1(v54);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v29, v51);
  }
  return v25;
}

uint64_t sub_1BC087D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19[2];
  _QWORD v20[5];
  _QWORD v21[6];

  v2 = v1;
  v4 = sub_1BC089574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC088C7C();
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v4);
  sub_1BC089538();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1BBFE1C58(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, (uint64_t)v21);
  v13 = *(void **)(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue);
  sub_1BBFE95C8(v19, (uint64_t)v20);
  v21[5] = v13;
  sub_1BBFE95E0();
  v14 = v13;
  v15 = sub_1BC08A180();
  sub_1BBFE9624((uint64_t)v20);
  v20[0] = v15;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = v2;
  sub_1BC088D20();
  sub_1BBFDC1EC(0, (unint64_t *)&qword_1ED69BB68);
  sub_1BBFDA9C0(&qword_1ED69C878, (uint64_t (*)(uint64_t))sub_1BC088D20, MEMORY[0x1E0C95D90]);
  swift_retain();
  sub_1BC08A1A4();
  swift_release();
  swift_release();
  sub_1BBFDA9C0(&qword_1ED69C798, (uint64_t (*)(uint64_t))sub_1BC088C7C, MEMORY[0x1E0C95950]);
  v17 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

uint64_t sub_1BC087F9C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[12];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];
  _QWORD v40[4];

  v8 = sub_1BC089DE4();
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  MEMORY[0x1E0C80A78](v9);
  v11 = &v34[-v10];
  v12 = sub_1BC089574();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = &v34[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = *a1;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(v15, a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v12);
  sub_1BC089538();
  (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
  __swift_project_boxed_opaque_existential_1(v40, v40[3]);
  sub_1BC0894B4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  sub_1BC089D90();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v17 = sub_1BC089DD8();
  v18 = sub_1BC08A678();
  v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v20 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v39[0] = v36;
    *(_DWORD *)v20 = 136446978;
    v35 = v19;
    v40[0] = a3;
    swift_getMetatypeMetadata();
    v21 = sub_1BC08A3E4();
    v40[0] = sub_1BBFDE0F8(v21, v22, v39);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2050;
    v23 = *(_QWORD *)(v16 + 16);
    swift_bridgeObjectRelease();
    v40[0] = v23;
    sub_1BC08A7EC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2082;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo), *(_QWORD *)(a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo + 24));
    v24 = sub_1BC089220();
    v40[0] = sub_1BBFDE0F8(v24, v25, v39);
    sub_1BC08A7EC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 32) = 2080;
    v26 = swift_bridgeObjectRetain();
    v27 = MEMORY[0x1BCCE8EA8](v26, MEMORY[0x1E0D2E1B0]);
    v29 = v28;
    swift_bridgeObjectRelease();
    v40[0] = sub_1BBFDE0F8(v27, v29, v39);
    sub_1BC08A7EC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BBFD7000, v17, (os_log_type_t)v35, "[%{public}s]: %{public}ld changes for plugin %{public}s have been committed immediately; emitting empty generator. Changes: %s",
      (uint8_t *)v20,
      0x2Au);
    v30 = v36;
    swift_arrayDestroy();
    MEMORY[0x1BCCE9C40](v30, -1, -1);
    MEMORY[0x1BCCE9C40](v20, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v11, v38);
  v31 = sub_1BC0893F4();
  v32 = MEMORY[0x1E0D2D758];
  a4[3] = v31;
  a4[4] = v32;
  __swift_allocate_boxed_opaque_existential_0(a4);
  return sub_1BC0893D0();
}

uint64_t sub_1BC088550@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];

  v6 = sub_1BC08952C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC088DB8();
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *a1;
  sub_1BBFDAED0();
  swift_bridgeObjectRetain();
  sub_1BC08A060();
  sub_1BBFDA9C0(&qword_1ED69B778, (uint64_t (*)(uint64_t))sub_1BC088DB8, MEMORY[0x1E0C960B0]);
  v15 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v16 = a2 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_domain;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  v17 = sub_1BC0893F4();
  v18 = MEMORY[0x1E0D2D758];
  a3[3] = v17;
  a3[4] = v18;
  __swift_allocate_boxed_opaque_existential_0(a3);
  return MEMORY[0x1BCCE7DBC](v15, v9);
}

uint64_t InteractiveGeneratorToPipelineAdaptor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  v2 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context;
  v4 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  return v0;
}

uint64_t InteractiveGeneratorToPipelineAdaptor.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  v2 = sub_1BC08952C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_context;
  v4 = sub_1BC089574();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BC088840()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1BC08888C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_domain;
  v4 = sub_1BC08952C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1BC0888D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16[2];
  _QWORD v17[5];
  _QWORD v18[6];

  v2 = sub_1BC089574();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC088C7C();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_context, v2);
  sub_1BC089538();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1BBFE1C58(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_pluginInfo, (uint64_t)v18);
  v11 = *(void **)(a1 + OBJC_IVAR____TtC18HealthPlatformCore37GenerationOperationToGeneratorAdaptor_queue);
  sub_1BBFE95C8(v16, (uint64_t)v17);
  v18[5] = v11;
  sub_1BBFE95E0();
  v12 = v11;
  v13 = sub_1BC08A180();
  sub_1BBFE9624((uint64_t)v17);
  v17[0] = v13;
  sub_1BC088D20();
  sub_1BBFDC1EC(0, (unint64_t *)&qword_1ED69BB68);
  sub_1BBFDA9C0(&qword_1ED69C878, (uint64_t (*)(uint64_t))sub_1BC088D20, MEMORY[0x1E0C95D90]);
  swift_retain();
  sub_1BC08A1A4();
  swift_release();
  swift_release();
  sub_1BBFDA9C0(&qword_1ED69C798, (uint64_t (*)(uint64_t))sub_1BC088C7C, MEMORY[0x1E0C95950]);
  v14 = sub_1BC08A180();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

uint64_t sub_1BC088AF8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18HealthPlatformCore37InteractiveGeneratorToPipelineAdaptor_publisher);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_1BC088B50()
{
  return type metadata accessor for InteractiveGeneratorToPipelineAdaptor();
}

uint64_t type metadata accessor for InteractiveGeneratorToPipelineAdaptor()
{
  uint64_t result;

  result = qword_1ED69C5C8;
  if (!qword_1ED69C5C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC088B94()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1BC08952C();
  if (v1 <= 0x3F)
  {
    result = sub_1BC089574();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for InteractiveGeneratorToPipelineAdaptor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.publisher.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of InteractiveGeneratorToPipelineAdaptor.__allocating_init(queue:pluginInfo:domain:context:commitImmediately:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

void sub_1BC088C7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69C7A0)
  {
    sub_1BC088D20();
    sub_1BBFDC1EC(255, (unint64_t *)&qword_1ED69BB68);
    sub_1BBFDA9C0(&qword_1ED69C878, (uint64_t (*)(uint64_t))sub_1BC088D20, MEMORY[0x1E0C95D90]);
    v0 = sub_1BC089EA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69C7A0);
  }
}

void sub_1BC088D20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69C880)
  {
    sub_1BBFDAED0();
    v0 = sub_1BC089FB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69C880);
  }
}

uint64_t sub_1BC088D84()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC088DA8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC087F9C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1BC088DB0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC088550(a1, v2, a2);
}

void sub_1BC088DB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED69B780)
  {
    sub_1BBFDAED0();
    v0 = sub_1BC08A054();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED69B780);
  }
}

uint64_t sub_1BC088E0C()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1BC088E18()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1BC088E24()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1BC088E30()
{
  return MEMORY[0x1E0D29970]();
}

uint64_t sub_1BC088E3C()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_1BC088E48()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1BC088E54()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1BC088E60()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t sub_1BC088E6C()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1BC088E78()
{
  return MEMORY[0x1E0CAE5B0]();
}

uint64_t sub_1BC088E84()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1BC088E90()
{
  return MEMORY[0x1E0CAE610]();
}

uint64_t sub_1BC088E9C()
{
  return MEMORY[0x1E0CAE620]();
}

uint64_t sub_1BC088EA8()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1BC088EB4()
{
  return MEMORY[0x1E0CAE640]();
}

uint64_t sub_1BC088EC0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1BC088ECC()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1BC088ED8()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1BC088EE4()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1BC088EF0()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BC088EFC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BC088F08()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BC088F14()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1BC088F20()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1BC088F2C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1BC088F38()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1BC088F44()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1BC088F50()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BC088F5C()
{
  return MEMORY[0x1E0CAFE68]();
}

uint64_t sub_1BC088F68()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1BC088F74()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1BC088F80()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1BC088F8C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BC088F98()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BC088FA4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BC088FB0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BC088FBC()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1BC088FC8()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1BC088FD4()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1BC088FE0()
{
  return MEMORY[0x1E0D29980]();
}

uint64_t sub_1BC088FEC()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BC088FF8()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BC089004()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1BC089010()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BC08901C()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BC089028()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BC089034()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BC089040()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1BC08904C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1BC089058()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BC089064()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BC089070()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1BC08907C()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1BC089088()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1BC089094()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1BC0890A0()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1BC0890AC()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1BC0890B8()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1BC0890C4()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1BC0890D0()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1BC0890DC()
{
  return MEMORY[0x1E0D2D2D0]();
}

uint64_t sub_1BC0890E8()
{
  return MEMORY[0x1E0D2D2D8]();
}

uint64_t sub_1BC0890F4()
{
  return MEMORY[0x1E0D2D2E0]();
}

uint64_t sub_1BC089100()
{
  return MEMORY[0x1E0D2D2E8]();
}

uint64_t sub_1BC08910C()
{
  return MEMORY[0x1E0D2D2F0]();
}

uint64_t sub_1BC089118()
{
  return MEMORY[0x1E0D2D300]();
}

uint64_t sub_1BC089124()
{
  return MEMORY[0x1E0D2D308]();
}

uint64_t sub_1BC089130()
{
  return MEMORY[0x1E0D2D310]();
}

uint64_t sub_1BC08913C()
{
  return MEMORY[0x1E0D2D318]();
}

uint64_t sub_1BC089148()
{
  return MEMORY[0x1E0D2D320]();
}

uint64_t sub_1BC089154()
{
  return MEMORY[0x1E0D2D328]();
}

uint64_t sub_1BC089160()
{
  return MEMORY[0x1E0D2D330]();
}

uint64_t sub_1BC08916C()
{
  return MEMORY[0x1E0D2D338]();
}

uint64_t sub_1BC089178()
{
  return MEMORY[0x1E0D2D340]();
}

uint64_t sub_1BC089184()
{
  return MEMORY[0x1E0D2D358]();
}

uint64_t sub_1BC089190()
{
  return MEMORY[0x1E0D2D360]();
}

uint64_t sub_1BC08919C()
{
  return MEMORY[0x1E0D2D370]();
}

uint64_t sub_1BC0891A8()
{
  return MEMORY[0x1E0D2D378]();
}

uint64_t sub_1BC0891B4()
{
  return MEMORY[0x1E0D2D388]();
}

uint64_t sub_1BC0891C0()
{
  return MEMORY[0x1E0D2D390]();
}

uint64_t sub_1BC0891CC()
{
  return MEMORY[0x1E0D2D3A0]();
}

uint64_t sub_1BC0891D8()
{
  return MEMORY[0x1E0D2D3E0]();
}

uint64_t sub_1BC0891E4()
{
  return MEMORY[0x1E0D2D400]();
}

uint64_t sub_1BC0891F0()
{
  return MEMORY[0x1E0D2D410]();
}

uint64_t sub_1BC0891FC()
{
  return MEMORY[0x1E0D2D438]();
}

uint64_t sub_1BC089208()
{
  return MEMORY[0x1E0D2D440]();
}

uint64_t sub_1BC089214()
{
  return MEMORY[0x1E0D2D450]();
}

uint64_t sub_1BC089220()
{
  return MEMORY[0x1E0D2D468]();
}

uint64_t sub_1BC08922C()
{
  return MEMORY[0x1E0D2D470]();
}

uint64_t sub_1BC089238()
{
  return MEMORY[0x1E0D2D490]();
}

uint64_t sub_1BC089244()
{
  return MEMORY[0x1E0D2D498]();
}

uint64_t sub_1BC089250()
{
  return MEMORY[0x1E0D2D4A0]();
}

uint64_t sub_1BC08925C()
{
  return MEMORY[0x1E0D2D4A8]();
}

uint64_t sub_1BC089268()
{
  return MEMORY[0x1E0D2D520]();
}

uint64_t sub_1BC089274()
{
  return MEMORY[0x1E0D2D530]();
}

uint64_t sub_1BC089280()
{
  return MEMORY[0x1E0D2D548]();
}

uint64_t sub_1BC08928C()
{
  return MEMORY[0x1E0D2D580]();
}

uint64_t sub_1BC089298()
{
  return MEMORY[0x1E0D2D590]();
}

uint64_t sub_1BC0892A4()
{
  return MEMORY[0x1E0D2D5B0]();
}

uint64_t sub_1BC0892B0()
{
  return MEMORY[0x1E0D2D5E0]();
}

uint64_t sub_1BC0892BC()
{
  return MEMORY[0x1E0D2D5F0]();
}

uint64_t sub_1BC0892C8()
{
  return MEMORY[0x1E0D2D618]();
}

uint64_t sub_1BC0892D4()
{
  return MEMORY[0x1E0D2D620]();
}

uint64_t sub_1BC0892E0()
{
  return MEMORY[0x1E0D2D628]();
}

uint64_t sub_1BC0892EC()
{
  return MEMORY[0x1E0D2D630]();
}

uint64_t sub_1BC0892F8()
{
  return MEMORY[0x1E0D2D638]();
}

uint64_t sub_1BC089304()
{
  return MEMORY[0x1E0D2D640]();
}

uint64_t sub_1BC089310()
{
  return MEMORY[0x1E0D2D650]();
}

uint64_t sub_1BC08931C()
{
  return MEMORY[0x1E0D2D668]();
}

uint64_t sub_1BC089328()
{
  return MEMORY[0x1E0D2D678]();
}

uint64_t sub_1BC089334()
{
  return MEMORY[0x1E0D2D680]();
}

uint64_t sub_1BC089340()
{
  return MEMORY[0x1E0D2D688]();
}

uint64_t sub_1BC08934C()
{
  return MEMORY[0x1E0D2D690]();
}

uint64_t sub_1BC089358()
{
  return MEMORY[0x1E0D2D6A0]();
}

uint64_t sub_1BC089364()
{
  return MEMORY[0x1E0D2D6A8]();
}

uint64_t sub_1BC089370()
{
  return MEMORY[0x1E0D2D6B8]();
}

uint64_t sub_1BC08937C()
{
  return MEMORY[0x1E0D2D6C0]();
}

uint64_t sub_1BC089388()
{
  return MEMORY[0x1E0D2D6C8]();
}

uint64_t sub_1BC089394()
{
  return MEMORY[0x1E0D2D6D0]();
}

uint64_t sub_1BC0893A0()
{
  return MEMORY[0x1E0D2D6D8]();
}

uint64_t sub_1BC0893AC()
{
  return MEMORY[0x1E0D2D6E0]();
}

uint64_t sub_1BC0893B8()
{
  return MEMORY[0x1E0D2D6E8]();
}

uint64_t sub_1BC0893C4()
{
  return MEMORY[0x1E0D2D6F0]();
}

uint64_t sub_1BC0893D0()
{
  return MEMORY[0x1E0D2D740]();
}

uint64_t sub_1BC0893DC()
{
  return MEMORY[0x1E0D2D748]();
}

uint64_t sub_1BC0893E8()
{
  return MEMORY[0x1E0D2D750]();
}

uint64_t sub_1BC0893F4()
{
  return MEMORY[0x1E0D2D760]();
}

uint64_t sub_1BC089400()
{
  return MEMORY[0x1E0D2D768]();
}

uint64_t sub_1BC08940C()
{
  return MEMORY[0x1E0D2D780]();
}

uint64_t sub_1BC089418()
{
  return MEMORY[0x1E0D2D788]();
}

uint64_t sub_1BC089424()
{
  return MEMORY[0x1E0D2D7C0]();
}

uint64_t sub_1BC089430()
{
  return MEMORY[0x1E0D2D800]();
}

uint64_t sub_1BC08943C()
{
  return MEMORY[0x1E0D2D848]();
}

uint64_t sub_1BC089448()
{
  return MEMORY[0x1E0D2D8C8]();
}

uint64_t sub_1BC089454()
{
  return MEMORY[0x1E0D2D920]();
}

uint64_t sub_1BC089460()
{
  return MEMORY[0x1E0D299B0]();
}

uint64_t sub_1BC08946C()
{
  return MEMORY[0x1E0D2D928]();
}

uint64_t sub_1BC089478()
{
  return MEMORY[0x1E0D2D938]();
}

uint64_t sub_1BC089484()
{
  return MEMORY[0x1E0D2D940]();
}

uint64_t sub_1BC089490()
{
  return MEMORY[0x1E0D2D948]();
}

uint64_t sub_1BC08949C()
{
  return MEMORY[0x1E0D2D958]();
}

uint64_t sub_1BC0894A8()
{
  return MEMORY[0x1E0D2D970]();
}

uint64_t sub_1BC0894B4()
{
  return MEMORY[0x1E0D2D978]();
}

uint64_t sub_1BC0894C0()
{
  return MEMORY[0x1E0D2D9A8]();
}

uint64_t sub_1BC0894CC()
{
  return MEMORY[0x1E0D2D9F0]();
}

uint64_t sub_1BC0894D8()
{
  return MEMORY[0x1E0D2D9F8]();
}

uint64_t sub_1BC0894E4()
{
  return MEMORY[0x1E0D2DA00]();
}

uint64_t sub_1BC0894F0()
{
  return MEMORY[0x1E0D2DA08]();
}

uint64_t sub_1BC0894FC()
{
  return MEMORY[0x1E0D2DA10]();
}

uint64_t sub_1BC089508()
{
  return MEMORY[0x1E0D2DA18]();
}

uint64_t sub_1BC089514()
{
  return MEMORY[0x1E0D2DA20]();
}

uint64_t sub_1BC089520()
{
  return MEMORY[0x1E0D2DA28]();
}

uint64_t sub_1BC08952C()
{
  return MEMORY[0x1E0D2DA30]();
}

uint64_t sub_1BC089538()
{
  return MEMORY[0x1E0D2DA48]();
}

uint64_t sub_1BC089544()
{
  return MEMORY[0x1E0D2DA58]();
}

uint64_t sub_1BC089550()
{
  return MEMORY[0x1E0D2DA60]();
}

uint64_t sub_1BC08955C()
{
  return MEMORY[0x1E0D2DA68]();
}

uint64_t sub_1BC089568()
{
  return MEMORY[0x1E0D2DA70]();
}

uint64_t sub_1BC089574()
{
  return MEMORY[0x1E0D2DA80]();
}

uint64_t sub_1BC089580()
{
  return MEMORY[0x1E0D299B8]();
}

uint64_t sub_1BC08958C()
{
  return MEMORY[0x1E0D299C0]();
}

uint64_t sub_1BC089598()
{
  return MEMORY[0x1E0D2DA98]();
}

uint64_t sub_1BC0895A4()
{
  return MEMORY[0x1E0D2DAA8]();
}

uint64_t sub_1BC0895B0()
{
  return MEMORY[0x1E0D2DB08]();
}

uint64_t sub_1BC0895BC()
{
  return MEMORY[0x1E0D2DB40]();
}

uint64_t sub_1BC0895C8()
{
  return MEMORY[0x1E0D2DB48]();
}

uint64_t sub_1BC0895D4()
{
  return MEMORY[0x1E0D2DB50]();
}

uint64_t sub_1BC0895E0()
{
  return MEMORY[0x1E0D2DB70]();
}

uint64_t sub_1BC0895EC()
{
  return MEMORY[0x1E0D2DB78]();
}

uint64_t sub_1BC0895F8()
{
  return MEMORY[0x1E0D2DB80]();
}

uint64_t sub_1BC089604()
{
  return MEMORY[0x1E0D2DB90]();
}

uint64_t sub_1BC089610()
{
  return MEMORY[0x1E0D2DB98]();
}

uint64_t sub_1BC08961C()
{
  return MEMORY[0x1E0D2DBA0]();
}

uint64_t sub_1BC089628()
{
  return MEMORY[0x1E0D2DBB0]();
}

uint64_t _s14HealthPlatform7KeywordC0aB4CoreE11identifiers3forSaySSGSo12HKObjectTypeC_tFZ_0()
{
  return MEMORY[0x1E0D299C8]();
}

uint64_t sub_1BC089640()
{
  return MEMORY[0x1E0D2DC20]();
}

uint64_t sub_1BC08964C()
{
  return MEMORY[0x1E0D2DC40]();
}

uint64_t sub_1BC089658()
{
  return MEMORY[0x1E0D2DC88]();
}

uint64_t sub_1BC089664()
{
  return MEMORY[0x1E0D2DC98]();
}

uint64_t sub_1BC089670()
{
  return MEMORY[0x1E0D2DDE8]();
}

uint64_t sub_1BC08967C()
{
  return MEMORY[0x1E0D2DDF8]();
}

uint64_t sub_1BC089688()
{
  return MEMORY[0x1E0D2DE00]();
}

uint64_t sub_1BC089694()
{
  return MEMORY[0x1E0D2DE18]();
}

uint64_t sub_1BC0896A0()
{
  return MEMORY[0x1E0D2DE38]();
}

uint64_t sub_1BC0896AC()
{
  return MEMORY[0x1E0D2DE58]();
}

uint64_t sub_1BC0896B8()
{
  return MEMORY[0x1E0D2DE60]();
}

uint64_t sub_1BC0896C4()
{
  return MEMORY[0x1E0D2DE70]();
}

uint64_t sub_1BC0896D0()
{
  return MEMORY[0x1E0D2DE78]();
}

uint64_t sub_1BC0896DC()
{
  return MEMORY[0x1E0D2DE88]();
}

uint64_t sub_1BC0896E8()
{
  return MEMORY[0x1E0D2DEA0]();
}

uint64_t sub_1BC0896F4()
{
  return MEMORY[0x1E0D2DF08]();
}

uint64_t sub_1BC089700()
{
  return MEMORY[0x1E0D2DF10]();
}

uint64_t sub_1BC08970C()
{
  return MEMORY[0x1E0D2DF18]();
}

uint64_t sub_1BC089718()
{
  return MEMORY[0x1E0D2DF20]();
}

uint64_t sub_1BC089724()
{
  return MEMORY[0x1E0D2DF30]();
}

uint64_t sub_1BC089730()
{
  return MEMORY[0x1E0D2DF38]();
}

uint64_t sub_1BC08973C()
{
  return MEMORY[0x1E0D2DF40]();
}

uint64_t sub_1BC089748()
{
  return MEMORY[0x1E0D2DF48]();
}

uint64_t sub_1BC089754()
{
  return MEMORY[0x1E0D2DF68]();
}

uint64_t sub_1BC089760()
{
  return MEMORY[0x1E0D2DF78]();
}

uint64_t sub_1BC08976C()
{
  return MEMORY[0x1E0D2DF80]();
}

uint64_t sub_1BC089778()
{
  return MEMORY[0x1E0D2DF88]();
}

uint64_t sub_1BC089784()
{
  return MEMORY[0x1E0D2DF90]();
}

uint64_t sub_1BC089790()
{
  return MEMORY[0x1E0D2DF98]();
}

uint64_t sub_1BC08979C()
{
  return MEMORY[0x1E0D2DFA0]();
}

uint64_t sub_1BC0897A8()
{
  return MEMORY[0x1E0D2DFA8]();
}

uint64_t sub_1BC0897B4()
{
  return MEMORY[0x1E0D2DFB0]();
}

uint64_t sub_1BC0897C0()
{
  return MEMORY[0x1E0D2DFB8]();
}

uint64_t sub_1BC0897CC()
{
  return MEMORY[0x1E0D2DFC0]();
}

uint64_t sub_1BC0897D8()
{
  return MEMORY[0x1E0D2DFF8]();
}

uint64_t sub_1BC0897E4()
{
  return MEMORY[0x1E0D2E018]();
}

uint64_t sub_1BC0897F0()
{
  return MEMORY[0x1E0D2E028]();
}

uint64_t sub_1BC0897FC()
{
  return MEMORY[0x1E0D2E040]();
}

uint64_t sub_1BC089808()
{
  return MEMORY[0x1E0D2E048]();
}

uint64_t sub_1BC089814()
{
  return MEMORY[0x1E0D2E050]();
}

uint64_t sub_1BC089820()
{
  return MEMORY[0x1E0D2E058]();
}

uint64_t sub_1BC08982C()
{
  return MEMORY[0x1E0D2E060]();
}

uint64_t sub_1BC089838()
{
  return MEMORY[0x1E0D2E068]();
}

uint64_t sub_1BC089844()
{
  return MEMORY[0x1E0D2E118]();
}

uint64_t sub_1BC089850()
{
  return MEMORY[0x1E0D2E130]();
}

uint64_t sub_1BC08985C()
{
  return MEMORY[0x1E0D2E150]();
}

uint64_t sub_1BC089868()
{
  return MEMORY[0x1E0D2E170]();
}

uint64_t sub_1BC089874()
{
  return MEMORY[0x1E0D2E178]();
}

uint64_t sub_1BC089880()
{
  return MEMORY[0x1E0D2E180]();
}

uint64_t sub_1BC08988C()
{
  return MEMORY[0x1E0D2E1B8]();
}

uint64_t sub_1BC089898()
{
  return MEMORY[0x1E0D2E1C0]();
}

uint64_t sub_1BC0898A4()
{
  return MEMORY[0x1E0D2E200]();
}

uint64_t sub_1BC0898B0()
{
  return MEMORY[0x1E0D2E208]();
}

uint64_t sub_1BC0898BC()
{
  return MEMORY[0x1E0D2E210]();
}

uint64_t sub_1BC0898C8()
{
  return MEMORY[0x1E0D2E218]();
}

uint64_t sub_1BC0898D4()
{
  return MEMORY[0x1E0D2E228]();
}

uint64_t sub_1BC0898E0()
{
  return MEMORY[0x1E0D2E238]();
}

uint64_t sub_1BC0898EC()
{
  return MEMORY[0x1E0D2E258]();
}

uint64_t sub_1BC0898F8()
{
  return MEMORY[0x1E0D2E298]();
}

uint64_t sub_1BC089904()
{
  return MEMORY[0x1E0D2E2B0]();
}

uint64_t sub_1BC089910()
{
  return MEMORY[0x1E0D2E310]();
}

uint64_t sub_1BC08991C()
{
  return MEMORY[0x1E0D2E318]();
}

uint64_t sub_1BC089928()
{
  return MEMORY[0x1E0D2E350]();
}

uint64_t sub_1BC089934()
{
  return MEMORY[0x1E0D2E360]();
}

uint64_t sub_1BC089940()
{
  return MEMORY[0x1E0D2E380]();
}

uint64_t sub_1BC08994C()
{
  return MEMORY[0x1E0D2E390]();
}

uint64_t sub_1BC089958()
{
  return MEMORY[0x1E0D2E3A0]();
}

uint64_t sub_1BC089964()
{
  return MEMORY[0x1E0D2E3B0]();
}

uint64_t sub_1BC089970()
{
  return MEMORY[0x1E0D2E3B8]();
}

uint64_t sub_1BC08997C()
{
  return MEMORY[0x1E0D2E3E0]();
}

uint64_t sub_1BC089988()
{
  return MEMORY[0x1E0D2E3E8]();
}

uint64_t sub_1BC089994()
{
  return MEMORY[0x1E0D2E3F0]();
}

uint64_t sub_1BC0899A0()
{
  return MEMORY[0x1E0D2E3F8]();
}

uint64_t sub_1BC0899AC()
{
  return MEMORY[0x1E0D2E400]();
}

uint64_t sub_1BC0899B8()
{
  return MEMORY[0x1E0D2E420]();
}

uint64_t sub_1BC0899C4()
{
  return MEMORY[0x1E0D2E430]();
}

uint64_t sub_1BC0899D0()
{
  return MEMORY[0x1E0D2E458]();
}

uint64_t sub_1BC0899DC()
{
  return MEMORY[0x1E0D2E460]();
}

uint64_t sub_1BC0899E8()
{
  return MEMORY[0x1E0D2E488]();
}

uint64_t sub_1BC0899F4()
{
  return MEMORY[0x1E0D2E490]();
}

uint64_t sub_1BC089A00()
{
  return MEMORY[0x1E0D2E498]();
}

uint64_t sub_1BC089A0C()
{
  return MEMORY[0x1E0D2E4B8]();
}

uint64_t sub_1BC089A18()
{
  return MEMORY[0x1E0D2E4C8]();
}

uint64_t sub_1BC089A24()
{
  return MEMORY[0x1E0D2E4D8]();
}

uint64_t sub_1BC089A30()
{
  return MEMORY[0x1E0D2E4E0]();
}

uint64_t sub_1BC089A3C()
{
  return MEMORY[0x1E0D2E4E8]();
}

uint64_t sub_1BC089A48()
{
  return MEMORY[0x1E0D2E4F0]();
}

uint64_t sub_1BC089A54()
{
  return MEMORY[0x1E0D2E4F8]();
}

uint64_t sub_1BC089A60()
{
  return MEMORY[0x1E0D2E518]();
}

uint64_t sub_1BC089A6C()
{
  return MEMORY[0x1E0D2E528]();
}

uint64_t sub_1BC089A78()
{
  return MEMORY[0x1E0D2E530]();
}

uint64_t sub_1BC089A84()
{
  return MEMORY[0x1E0D2E538]();
}

uint64_t sub_1BC089A90()
{
  return MEMORY[0x1E0D2E540]();
}

uint64_t sub_1BC089A9C()
{
  return MEMORY[0x1E0D2E548]();
}

uint64_t sub_1BC089AA8()
{
  return MEMORY[0x1E0D2E550]();
}

uint64_t _s14HealthPlatform4FeedC4KindO0aB4CoreE13reSectionNameSSvg_0()
{
  return MEMORY[0x1E0D2E558]();
}

uint64_t sub_1BC089AC0()
{
  return MEMORY[0x1E0D2E560]();
}

uint64_t sub_1BC089ACC()
{
  return MEMORY[0x1E0D2E580]();
}

uint64_t sub_1BC089AD8()
{
  return MEMORY[0x1E0D2E588]();
}

uint64_t sub_1BC089AE4()
{
  return MEMORY[0x1E0D2E590]();
}

uint64_t sub_1BC089AF0()
{
  return MEMORY[0x1E0D2E598]();
}

uint64_t sub_1BC089AFC()
{
  return MEMORY[0x1E0D2E5A8]();
}

uint64_t sub_1BC089B08()
{
  return MEMORY[0x1E0D2E5B0]();
}

uint64_t sub_1BC089B14()
{
  return MEMORY[0x1E0D2E5B8]();
}

uint64_t sub_1BC089B20()
{
  return MEMORY[0x1E0D2E5C0]();
}

uint64_t sub_1BC089B2C()
{
  return MEMORY[0x1E0D2E5C8]();
}

uint64_t sub_1BC089B38()
{
  return MEMORY[0x1E0D2E5E0]();
}

uint64_t sub_1BC089B44()
{
  return MEMORY[0x1E0D2E5E8]();
}

uint64_t sub_1BC089B50()
{
  return MEMORY[0x1E0D2E5F0]();
}

uint64_t sub_1BC089B5C()
{
  return MEMORY[0x1E0D2E5F8]();
}

uint64_t sub_1BC089B68()
{
  return MEMORY[0x1E0D2E608]();
}

uint64_t sub_1BC089B74()
{
  return MEMORY[0x1E0D2E610]();
}

uint64_t sub_1BC089B80()
{
  return MEMORY[0x1E0D2E638]();
}

uint64_t sub_1BC089B8C()
{
  return MEMORY[0x1E0D2E658]();
}

uint64_t sub_1BC089B98()
{
  return MEMORY[0x1E0D2E660]();
}

uint64_t sub_1BC089BA4()
{
  return MEMORY[0x1E0D2E670]();
}

uint64_t sub_1BC089BB0()
{
  return MEMORY[0x1E0D2E678]();
}

uint64_t sub_1BC089BBC()
{
  return MEMORY[0x1E0D2E6B8]();
}

uint64_t sub_1BC089BC8()
{
  return MEMORY[0x1E0D2E6C0]();
}

uint64_t sub_1BC089BD4()
{
  return MEMORY[0x1E0D2E6C8]();
}

uint64_t sub_1BC089BE0()
{
  return MEMORY[0x1E0D2E6D0]();
}

uint64_t sub_1BC089BEC()
{
  return MEMORY[0x1E0D2E6D8]();
}

uint64_t sub_1BC089BF8()
{
  return MEMORY[0x1E0D2E6E0]();
}

uint64_t sub_1BC089C04()
{
  return MEMORY[0x1E0D2E6E8]();
}

uint64_t sub_1BC089C10()
{
  return MEMORY[0x1E0D2E6F0]();
}

uint64_t sub_1BC089C1C()
{
  return MEMORY[0x1E0D2E6F8]();
}

uint64_t sub_1BC089C28()
{
  return MEMORY[0x1E0D2E700]();
}

uint64_t sub_1BC089C34()
{
  return MEMORY[0x1E0D2E708]();
}

uint64_t sub_1BC089C40()
{
  return MEMORY[0x1E0D2E710]();
}

uint64_t sub_1BC089C4C()
{
  return MEMORY[0x1E0D2E718]();
}

uint64_t sub_1BC089C58()
{
  return MEMORY[0x1E0D2E730]();
}

uint64_t sub_1BC089C64()
{
  return MEMORY[0x1E0D29CA0]();
}

uint64_t sub_1BC089C70()
{
  return MEMORY[0x1E0D29CA8]();
}

uint64_t sub_1BC089C7C()
{
  return MEMORY[0x1E0D29CB8]();
}

uint64_t sub_1BC089C88()
{
  return MEMORY[0x1E0D29CC0]();
}

uint64_t sub_1BC089C94()
{
  return MEMORY[0x1E0D29EA0]();
}

uint64_t sub_1BC089CA0()
{
  return MEMORY[0x1E0D29EC0]();
}

uint64_t sub_1BC089CAC()
{
  return MEMORY[0x1E0D29EC8]();
}

uint64_t sub_1BC089CB8()
{
  return MEMORY[0x1E0D29ED0]();
}

uint64_t sub_1BC089CC4()
{
  return MEMORY[0x1E0D29ED8]();
}

uint64_t sub_1BC089CD0()
{
  return MEMORY[0x1E0D29F18]();
}

uint64_t sub_1BC089CDC()
{
  return MEMORY[0x1E0D2A140]();
}

uint64_t sub_1BC089CE8()
{
  return MEMORY[0x1E0D2A148]();
}

uint64_t sub_1BC089CF4()
{
  return MEMORY[0x1E0D2A158]();
}

uint64_t sub_1BC089D00()
{
  return MEMORY[0x1E0D2A2B8]();
}

uint64_t sub_1BC089D0C()
{
  return MEMORY[0x1E0D2A2C0]();
}

uint64_t sub_1BC089D18()
{
  return MEMORY[0x1E0D2BD78]();
}

uint64_t sub_1BC089D24()
{
  return MEMORY[0x1E0D2BDF0]();
}

uint64_t sub_1BC089D30()
{
  return MEMORY[0x1E0D2BE40]();
}

uint64_t sub_1BC089D3C()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BC089D48()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1BC089D54()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_1BC089D60()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1BC089D6C()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1BC089D78()
{
  return MEMORY[0x1E0DF2128]();
}

uint64_t sub_1BC089D84()
{
  return MEMORY[0x1E0D2E740]();
}

uint64_t sub_1BC089D90()
{
  return MEMORY[0x1E0D2E748]();
}

uint64_t sub_1BC089D9C()
{
  return MEMORY[0x1E0D2E770]();
}

uint64_t sub_1BC089DA8()
{
  return MEMORY[0x1E0D2E7A0]();
}

uint64_t sub_1BC089DB4()
{
  return MEMORY[0x1E0D2E7A8]();
}

uint64_t sub_1BC089DC0()
{
  return MEMORY[0x1E0D2E7B8]();
}

uint64_t sub_1BC089DCC()
{
  return MEMORY[0x1E0D2E7C8]();
}

uint64_t sub_1BC089DD8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BC089DE4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BC089DF0()
{
  return MEMORY[0x1E0C95640]();
}

uint64_t sub_1BC089DFC()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1BC089E08()
{
  return MEMORY[0x1E0C95758]();
}

uint64_t sub_1BC089E14()
{
  return MEMORY[0x1E0C95790]();
}

uint64_t sub_1BC089E20()
{
  return MEMORY[0x1E0C957B0]();
}

uint64_t sub_1BC089E2C()
{
  return MEMORY[0x1E0C957F0]();
}

uint64_t sub_1BC089E38()
{
  return MEMORY[0x1E0D2E7D8]();
}

uint64_t sub_1BC089E44()
{
  return MEMORY[0x1E0D2E7E8]();
}

uint64_t sub_1BC089E50()
{
  return MEMORY[0x1E0D2E7F0]();
}

uint64_t sub_1BC089E5C()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t sub_1BC089E68()
{
  return MEMORY[0x1E0C95860]();
}

uint64_t sub_1BC089E74()
{
  return MEMORY[0x1E0D2A5A8]();
}

uint64_t sub_1BC089E80()
{
  return MEMORY[0x1E0D2A5B8]();
}

uint64_t sub_1BC089E8C()
{
  return MEMORY[0x1E0D2A5C8]();
}

uint64_t sub_1BC089E98()
{
  return MEMORY[0x1E0C95918]();
}

uint64_t sub_1BC089EA4()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1BC089EB0()
{
  return MEMORY[0x1E0C959E8]();
}

uint64_t sub_1BC089EBC()
{
  return MEMORY[0x1E0C95A28]();
}

uint64_t sub_1BC089EC8()
{
  return MEMORY[0x1E0C95A48]();
}

uint64_t sub_1BC089ED4()
{
  return MEMORY[0x1E0C95A58]();
}

uint64_t sub_1BC089EE0()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t sub_1BC089EEC()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t sub_1BC089EF8()
{
  return MEMORY[0x1E0C95B80]();
}

uint64_t sub_1BC089F04()
{
  return MEMORY[0x1E0C95BB8]();
}

uint64_t sub_1BC089F10()
{
  return MEMORY[0x1E0C95BD0]();
}

uint64_t sub_1BC089F1C()
{
  return MEMORY[0x1E0C95BD8]();
}

uint64_t sub_1BC089F28()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t sub_1BC089F34()
{
  return MEMORY[0x1E0C95C18]();
}

uint64_t sub_1BC089F40()
{
  return MEMORY[0x1E0C95C60]();
}

uint64_t sub_1BC089F4C()
{
  return MEMORY[0x1E0C95C70]();
}

uint64_t sub_1BC089F58()
{
  return MEMORY[0x1E0C95C88]();
}

uint64_t sub_1BC089F64()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1BC089F70()
{
  return MEMORY[0x1E0C95CD8]();
}

uint64_t sub_1BC089F7C()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t sub_1BC089F88()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t sub_1BC089F94()
{
  return MEMORY[0x1E0C95D40]();
}

uint64_t sub_1BC089FA0()
{
  return MEMORY[0x1E0C95D48]();
}

uint64_t sub_1BC089FAC()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1BC089FB8()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BC089FC4()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1BC089FD0()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t sub_1BC089FDC()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1BC089FE8()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1BC089FF4()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1BC08A000()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1BC08A00C()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1BC08A018()
{
  return MEMORY[0x1E0C95FA0]();
}

uint64_t sub_1BC08A024()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1BC08A030()
{
  return MEMORY[0x1E0C96050]();
}

uint64_t sub_1BC08A03C()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1BC08A048()
{
  return MEMORY[0x1E0C96090]();
}

uint64_t sub_1BC08A054()
{
  return MEMORY[0x1E0C96098]();
}

uint64_t sub_1BC08A060()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1BC08A06C()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1BC08A078()
{
  return MEMORY[0x1E0C960C0]();
}

uint64_t sub_1BC08A084()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1BC08A090()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1BC08A09C()
{
  return MEMORY[0x1E0D2E820]();
}

uint64_t sub_1BC08A0A8()
{
  return MEMORY[0x1E0D2E828]();
}

uint64_t sub_1BC08A0B4()
{
  return MEMORY[0x1E0D2E840]();
}

uint64_t sub_1BC08A0C0()
{
  return MEMORY[0x1E0D2E850]();
}

uint64_t sub_1BC08A0CC()
{
  return MEMORY[0x1E0D2E858]();
}

uint64_t sub_1BC08A0D8()
{
  return MEMORY[0x1E0D2E860]();
}

uint64_t sub_1BC08A0E4()
{
  return MEMORY[0x1E0D2E868]();
}

uint64_t sub_1BC08A0F0()
{
  return MEMORY[0x1E0D2E870]();
}

uint64_t sub_1BC08A0FC()
{
  return MEMORY[0x1E0D2E878]();
}

uint64_t sub_1BC08A108()
{
  return MEMORY[0x1E0D2E880]();
}

uint64_t sub_1BC08A114()
{
  return MEMORY[0x1E0D2E888]();
}

uint64_t sub_1BC08A120()
{
  return MEMORY[0x1E0D2E890]();
}

uint64_t sub_1BC08A12C()
{
  return MEMORY[0x1E0D2E898]();
}

uint64_t sub_1BC08A138()
{
  return MEMORY[0x1E0D2E8A0]();
}

uint64_t sub_1BC08A144()
{
  return MEMORY[0x1E0D2A5E0]();
}

uint64_t sub_1BC08A150()
{
  return MEMORY[0x1E0D2A5E8]();
}

uint64_t sub_1BC08A15C()
{
  return MEMORY[0x1E0D2A5F0]();
}

uint64_t sub_1BC08A168()
{
  return MEMORY[0x1E0D2A5F8]();
}

uint64_t sub_1BC08A174()
{
  return MEMORY[0x1E0C961C8]();
}

uint64_t sub_1BC08A180()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BC08A18C()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1BC08A198()
{
  return MEMORY[0x1E0C961E0]();
}

uint64_t sub_1BC08A1A4()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1BC08A1B0()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1BC08A1BC()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1BC08A1C8()
{
  return MEMORY[0x1E0C962B8]();
}

uint64_t sub_1BC08A1D4()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1BC08A1E0()
{
  return MEMORY[0x1E0C96338]();
}

uint64_t sub_1BC08A1EC()
{
  return MEMORY[0x1E0C96340]();
}

uint64_t sub_1BC08A1F8()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1BC08A204()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1BC08A210()
{
  return MEMORY[0x1E0C96380]();
}

uint64_t sub_1BC08A21C()
{
  return MEMORY[0x1E0C96390]();
}

uint64_t sub_1BC08A228()
{
  return MEMORY[0x1E0C96398]();
}

uint64_t sub_1BC08A234()
{
  return MEMORY[0x1E0C963C8]();
}

uint64_t sub_1BC08A240()
{
  return MEMORY[0x1E0C96400]();
}

uint64_t sub_1BC08A24C()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BC08A258()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t sub_1BC08A264()
{
  return MEMORY[0x1E0C96438]();
}

uint64_t sub_1BC08A270()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC08A27C()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BC08A288()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC08A294()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1BC08A2A0()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1BC08A2AC()
{
  return MEMORY[0x1E0DEF5A0]();
}

uint64_t sub_1BC08A2B8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC08A2C4()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BC08A2D0()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BC08A2DC()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1BC08A2E8()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1BC08A2F4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BC08A300()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BC08A30C()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1BC08A318()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1BC08A324()
{
  return MEMORY[0x1E0DE9E80]();
}

uint64_t sub_1BC08A330()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_1BC08A33C()
{
  return MEMORY[0x1E0DE9F50]();
}

uint64_t sub_1BC08A348()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BC08A354()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1BC08A360()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BC08A36C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1BC08A378()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t sub_1BC08A384()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BC08A390()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1BC08A39C()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1BC08A3A8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BC08A3B4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC08A3C0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC08A3CC()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1BC08A3D8()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1BC08A3E4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC08A3F0()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BC08A3FC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1BC08A408()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BC08A414()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1BC08A420()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC08A42C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC08A438()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1BC08A444()
{
  return MEMORY[0x1E0D2E8B8]();
}

uint64_t sub_1BC08A450()
{
  return MEMORY[0x1E0C96490]();
}

uint64_t sub_1BC08A45C()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1BC08A468()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1BC08A474()
{
  return MEMORY[0x1E0DEAB38]();
}

uint64_t sub_1BC08A480()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1BC08A48C()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1BC08A498()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1BC08A4A4()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1BC08A4B0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC08A4BC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC08A4C8()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC08A4D4()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1BC08A4E0()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC08A4EC()
{
  return MEMORY[0x1E0D2E8C0]();
}

uint64_t sub_1BC08A4F8()
{
  return MEMORY[0x1E0D2E8C8]();
}

uint64_t sub_1BC08A504()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC08A510()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BC08A51C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1BC08A528()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC08A534()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC08A540()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1BC08A54C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1BC08A558()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1BC08A564()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BC08A570()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1BC08A57C()
{
  return MEMORY[0x1E0DEB2B0]();
}

uint64_t sub_1BC08A588()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1BC08A594()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1BC08A5A0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BC08A5AC()
{
  return MEMORY[0x1E0D2E8D8]();
}

uint64_t sub_1BC08A5B8()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BC08A5C4()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BC08A5D0()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BC08A5DC()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1BC08A5E8()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1BC08A5F4()
{
  return MEMORY[0x1E0CB1D20]();
}

uint64_t sub_1BC08A600()
{
  return MEMORY[0x1E0D2E8E0]();
}

uint64_t sub_1BC08A60C()
{
  return MEMORY[0x1E0D2E8E8]();
}

uint64_t sub_1BC08A618()
{
  return MEMORY[0x1E0D2E8F0]();
}

uint64_t sub_1BC08A624()
{
  return MEMORY[0x1E0D2C050]();
}

uint64_t sub_1BC08A630()
{
  return MEMORY[0x1E0D2C080]();
}

uint64_t sub_1BC08A63C()
{
  return MEMORY[0x1E0D2A660]();
}

uint64_t sub_1BC08A648()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BC08A654()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BC08A660()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC08A66C()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BC08A678()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC08A684()
{
  return MEMORY[0x1E0D2A670]();
}

uint64_t sub_1BC08A690()
{
  return MEMORY[0x1E0D2A6B8]();
}

uint64_t sub_1BC08A69C()
{
  return MEMORY[0x1E0D2E8F8]();
}

uint64_t sub_1BC08A6A8()
{
  return MEMORY[0x1E0D2E920]();
}

uint64_t sub_1BC08A6B4()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1BC08A6C0()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1BC08A6CC()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BC08A6D8()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1BC08A6E4()
{
  return MEMORY[0x1E0DEF898]();
}

uint64_t sub_1BC08A6F0()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1BC08A6FC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BC08A708()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BC08A714()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BC08A720()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BC08A72C()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1BC08A738()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1BC08A744()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1BC08A750()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1BC08A75C()
{
  return MEMORY[0x1E0D2A738]();
}

uint64_t sub_1BC08A768()
{
  return MEMORY[0x1E0D2E938]();
}

uint64_t sub_1BC08A774()
{
  return MEMORY[0x1E0D2E940]();
}

uint64_t sub_1BC08A780()
{
  return MEMORY[0x1E0D2E948]();
}

uint64_t sub_1BC08A78C()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1BC08A798()
{
  return MEMORY[0x1E0D2A760]();
}

uint64_t sub_1BC08A7A4()
{
  return MEMORY[0x1E0D2A770]();
}

uint64_t sub_1BC08A7B0()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BC08A7BC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BC08A7C8()
{
  return MEMORY[0x1E0D2E958]();
}

uint64_t sub_1BC08A7D4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC08A7E0()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1BC08A7EC()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC08A7F8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC08A804()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1BC08A810()
{
  return MEMORY[0x1E0CB2550]();
}

uint64_t sub_1BC08A81C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1BC08A828()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BC08A834()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC08A840()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BC08A84C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1BC08A858()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BC08A864()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BC08A870()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1BC08A87C()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1BC08A888()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BC08A894()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BC08A8A0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BC08A8AC()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1BC08A8B8()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BC08A8C4()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BC08A8D0()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1BC08A8DC()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1BC08A8E8()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1BC08A8F4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1BC08A900()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1BC08A90C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1BC08A918()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BC08A924()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BC08A930()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1BC08A93C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BC08A948()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BC08A954()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC08A960()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC08A96C()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1BC08A978()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC08A984()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BC08A990()
{
  return MEMORY[0x1E0DEC408]();
}

uint64_t sub_1BC08A99C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC08A9A8()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BC08A9B4()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BC08A9C0()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1BC08A9CC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BC08A9D8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BC08A9E4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BC08A9F0()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1BC08A9FC()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1BC08AA08()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1BC08AA14()
{
  return MEMORY[0x1E0DEC7F8]();
}

uint64_t sub_1BC08AA20()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BC08AA2C()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1BC08AA38()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1BC08AA44()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1BC08AA50()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1BC08AA5C()
{
  return MEMORY[0x1E0DECBC0]();
}

uint64_t sub_1BC08AA68()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC08AA74()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC08AA80()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC08AA8C()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1BC08AA98()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BC08AAA4()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BC08AAB0()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1BC08AABC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BC08AAC8()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BC08AAD4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC08AAE0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BC08AAEC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1BC08AAF8()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1BC08AB04()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BC08AB10()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BC08AB1C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1BC08AB28()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BC08AB34()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1BC08AB40()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BC08AB4C()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1BC08AB58()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1BC08AB64()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BC08AB70()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC08AB7C()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1BC08AB88()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1BC08AB94()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BC08ABA0()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1BC08ABAC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BC08ABB8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BC08ABC4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BC08ABD0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BC08ABDC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BC08ABE8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BC08ABF4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BC08AC00()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BC08AC0C()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1BC08AC18()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BC08AC24()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_1BC08AC30()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t sub_1BC08AC3C()
{
  return MEMORY[0x1E0DEE020]();
}

uint64_t sub_1BC08AC48()
{
  return MEMORY[0x1E0D2C220]();
}

uint64_t sub_1BC08AC54()
{
  return MEMORY[0x1E0C964B8]();
}

uint64_t sub_1BC08AC60()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1BC08AC6C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BC08AC78()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BC08AC84()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BC08AC90()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1BC08AC9C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t HKDisplayCategoryIdentifierFromString()
{
  return MEMORY[0x1E0D2F418]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

uint64_t REPercentThroughRange()
{
  return MEMORY[0x1E0D843E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x1E0CB71B0]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x1E0CB71B8]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t health_dispatch_workloop_create()
{
  return MEMORY[0x1E0D2A7E0]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
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

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x1E0DEEDF8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

