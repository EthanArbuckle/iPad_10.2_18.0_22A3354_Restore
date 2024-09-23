uint64_t sub_100002A64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 320) = a1;
  return swift_task_switch(sub_100002A7C, 0, 0);
}

uint64_t sub_100002A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;

  v37 = *(_QWORD *)(v0 + 320);
  v1 = sub_100003110(&qword_100008518);
  inited = swift_initStackObject(v1, v0 + 96);
  *(_OWORD *)(inited + 16) = xmmword_100003800;
  strcpy((char *)(inited + 32), "json-payload");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  v3 = sub_100003110(&qword_100008520);
  v4 = (__n128 *)swift_initStackObject(v3, v0 + 152);
  sub_10000367C(v4, v5, v6, v7, v8, v9, v10, v11, v0 + 264, v37, v12);
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = 0xE800000000000000;
  v15 = sub_100003110(&qword_100008528);
  v16 = swift_initStackObject(v15, v0 + 16);
  *(_OWORD *)(v16 + 16) = xmmword_100003810;
  *(_QWORD *)(v16 + 32) = 0xD000000000000020;
  *(_QWORD *)(v16 + 40) = 0x80000001000038D0;
  v17 = sub_100003110(&qword_100008530);
  v18 = swift_initStackObject(v17, v0 + 208);
  *(_OWORD *)(v18 + 16) = xmmword_100003800;
  *(_QWORD *)(v18 + 32) = 0x65736E6F70736572;
  *(_QWORD *)(v18 + 40) = 0xE800000000000000;
  *(_QWORD *)(v18 + 48) = sub_100003668((uint64_t)&off_100004100, (uint64_t)&type metadata for String, (uint64_t)&type metadata for Int);
  v19 = sub_100003110(&qword_100008538);
  *(_QWORD *)(v16 + 48) = sub_100003668(v18, (uint64_t)&type metadata for String, v19);
  *(_QWORD *)(v16 + 56) = 0xD000000000000020;
  *(_QWORD *)(v16 + 64) = 0x8000000100003900;
  v20 = (__n128 *)swift_initStackObject(v17, v36);
  sub_10000367C(v20, v21, v22, v23, v24, v25, v26, v27, v36, v38, v28);
  *(_QWORD *)(v29 + 32) = v30;
  *(_QWORD *)(v29 + 40) = 0xE800000000000000;
  v20[3].n128_u64[0] = sub_100003668((uint64_t)&off_100004138, (uint64_t)&type metadata for String, (uint64_t)&type metadata for Int);
  *(_QWORD *)(v16 + 72) = sub_100003668((uint64_t)v20, (uint64_t)&type metadata for String, v19);
  v31 = sub_100003110(&qword_100008540);
  v4[3].n128_u64[0] = sub_100003668(v16, (uint64_t)&type metadata for String, v31);
  v32 = sub_100003110(&qword_100008548);
  *(_QWORD *)(inited + 48) = sub_100003668((uint64_t)v4, (uint64_t)&type metadata for String, v32);
  v33 = sub_100003110(&qword_100008550);
  v34 = sub_100003668(inited, (uint64_t)&type metadata for String, v33);
  v39[3] = sub_100003110(&qword_100008558);
  *v39 = v34;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002D68(uint64_t a1, void *aBlock)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v2 + 80) = _Block_copy(aBlock);
  v4 = swift_unknownObjectRetain(a1);
  _bridgeAnyObjectToAny(_:)(v4);
  swift_unknownObjectRelease(a1);
  v5 = (_QWORD *)swift_task_alloc(dword_100008514);
  *(_QWORD *)(v2 + 88) = v5;
  *v5 = v2;
  v5[1] = sub_100002DEC;
  return sub_100002A64(v2 + 16);
}

uint64_t sub_100002DEC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v2 = v0;
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *v1;
  swift_task_dealloc(v3);
  sub_100003600((_QWORD *)(v4 + 48));
  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(v4 + 80);
  if (v2)
  {
    v6 = (void *)_convertErrorToNSError(_:)(v2);
    swift_errorRelease(v2);
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

    _Block_release(v5);
  }
  else
  {
    v7 = *(_QWORD *)(v4 + 40);
    v8 = sub_100003620((_QWORD *)(v4 + 16), v7);
    v9 = _bridgeAnythingToObjectiveC<A>(_:)(v8, v7);
    v5[2](v5, v9, 0);
    _Block_release(v5);
    swift_unknownObjectRelease(v9);
    sub_100003600((_QWORD *)(v4 + 16));
  }
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100002ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  sub_100003110(&qword_1000084E8);
  __chkstk_darwin();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  sub_100003150((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject(&unk_100004248, 48, 7);
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)swift_allocObject(&unk_100004270, 48, 7);
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_1000085C0;
  v8[5] = v7;
  v9 = sub_100003334((uint64_t)v5, (uint64_t)&unk_1000085C8, (uint64_t)v8);
  return swift_release(v9);
}

id sub_100002FAC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosEngagementExtension();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100002FFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosEngagementExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PhotosEngagementExtension()
{
  return objc_opt_self(_TtC25PhotosEngagementExtension25PhotosEngagementExtension);
}

uint64_t sub_10000304C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100003078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_1000084DC);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1000030E4;
  return ((uint64_t (*)(uint64_t, void *))((char *)&dword_1000084D8 + dword_1000084D8))(v2, v3);
}

uint64_t sub_1000030E4()
{
  uint64_t v0;

  sub_100003648();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003110(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10000315C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_100003644;
  return v6();
}

uint64_t sub_1000031B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000084F4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100003644;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000084F0 + dword_1000084F0))(v2, v3, v4);
}

uint64_t sub_10000322C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_100003644;
  return v7();
}

uint64_t sub_100003284()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000032B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000084FC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100003644;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000084F8 + dword_1000084F8))(a1, v4, v5, v6);
}

uint64_t sub_100003334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[4];

  v6 = type metadata accessor for TaskPriority(0);
  if (sub_100003470(a1, 1, v6) == 1)
  {
    sub_10000347C(a1);
    v7 = 7168;
  }
  else
  {
    v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    v7 = v8 | 0x1C00;
  }
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(a3 + 24);
    ObjectType = swift_getObjectType(*(_QWORD *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    v14 = v13;
    swift_unknownObjectRelease(v9);
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = swift_allocObject(&unk_100004298, 32, 7);
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0;
    v18[1] = 0;
    v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }
  else
  {
    v16 = 0;
  }
  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_100008508, v15);
}

uint64_t sub_100003470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10000347C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003110(&qword_1000084E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000034BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100003520;
  return v6(a1);
}

uint64_t sub_100003520()
{
  uint64_t v0;

  sub_100003648();
  return sub_100003670(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100003548()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000356C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100008504);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000035DC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100008500 + dword_100008500))(a1, v4);
}

uint64_t sub_1000035DC()
{
  uint64_t v0;

  sub_100003648();
  return sub_100003670(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100003600(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_100003620(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003648()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100003668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return Dictionary.init(dictionaryLiteral:)(a1, a2, a3, v3);
}

uint64_t sub_100003670(uint64_t (*a1)(void))
{
  return a1();
}

__n128 sub_10000367C(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result;

  result = a11;
  a1[1] = a11;
  return result;
}
