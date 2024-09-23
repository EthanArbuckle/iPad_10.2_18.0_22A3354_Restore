void type metadata accessor for Status(uint64_t a1)
{
  sub_237620728(a1, &qword_256800658);
}

uint64_t sub_237620194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, _QWORD, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_237620210;
  return v9(a1, 0, a2, a3);
}

uint64_t sub_237620210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *v4;
  v9 = swift_task_dealloc();
  if (!v3)
  {
    v9 = a1;
    v10 = a2;
    v11 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(v9, v10, v11);
}

uint64_t sub_23762027C(uint64_t a1, uint64_t a2)
{
  return sub_2376203C4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_237620288(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23764A390();
  *a2 = 0;
  return result;
}

uint64_t sub_2376202FC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23764A39C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_237620378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23764A3A8();
  v2 = sub_23764A384();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2376203B8(uint64_t a1, uint64_t a2)
{
  return sub_2376203C4(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2376203C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23764A3A8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_237620400()
{
  sub_23764A3A8();
  sub_23764A408();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237620440()
{
  uint64_t v0;

  sub_23764A3A8();
  sub_23764A7EC();
  sub_23764A408();
  v0 = sub_23764A804();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_2376204B0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_2376204C4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2376204D4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2376204E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23764A3A8();
  v2 = v1;
  if (v0 == sub_23764A3A8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23764A780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_237620568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23764A384();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2376205AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23764A3A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for AuthChallengeDisposition(uint64_t a1)
{
  sub_237620728(a1, &qword_256800668);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_237620728(a1, &qword_256800670);
}

uint64_t sub_2376205FC()
{
  sub_2376206B0(&qword_256800690, (uint64_t)&unk_23764D2C0);
  sub_2376206B0(&qword_256800698, (uint64_t)&unk_23764D260);
  return sub_23764A708();
}

uint64_t sub_237620668()
{
  return sub_2376206B0(&qword_256800678, (uint64_t)&unk_23764D224);
}

uint64_t sub_23762068C()
{
  return sub_2376206B0(&qword_256800680, (uint64_t)&unk_23764D1F8);
}

uint64_t sub_2376206B0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    result = MEMORY[0x23B8170FC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2376206F0()
{
  return sub_2376206B0(&qword_256800688, (uint64_t)&unk_23764D294);
}

void type metadata accessor for tls_ciphersuite_t(uint64_t a1)
{
  sub_237620728(a1, &qword_2568006A0);
}

void sub_237620728(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23762076C()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_2568006A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568006A8);
  return sub_23764A264();
}

uint64_t static FileDownloader.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t FileDownloader.Error.hash(into:)()
{
  return sub_23764A7F8();
}

uint64_t FileDownloader.Error.hashValue.getter()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t sub_237620858()
{
  return 1;
}

uint64_t sub_237620860()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t sub_2376208A0()
{
  return sub_23764A7F8();
}

uint64_t sub_2376208C4()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t FileDownloader.data(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_237649FD0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237620970()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD **)(v0 + 24);
  if (v1[2])
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 16))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 32));
    swift_bridgeObjectRetain();
    sub_237649FC4();
    swift_bridgeObjectRelease();
    sub_237649FC4();
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_237620B6C;
    return sub_23764864C(*(_QWORD *)(v0 + 48));
  }
  else
  {
    if (qword_256800610 != -1)
      swift_once();
    v4 = sub_23764A270();
    __swift_project_value_buffer(v4, (uint64_t)qword_2568006A8);
    v5 = sub_23764A258();
    v6 = sub_23764A594();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23761E000, v5, v6, "Failed to retrieve IMPU", v7, 2u);
      MEMORY[0x23B817198](v7, -1, -1);
    }

    sub_237620CA0();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_237620B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v8 = *(_QWORD **)v4;
  *(_QWORD *)(*(_QWORD *)v4 + 64) = v3;
  swift_task_dealloc();
  if (!v3)
  {
    v8[9] = a3;
    v8[10] = a2;
    v8[11] = a1;
  }
  return swift_task_switch();
}

uint64_t sub_237620BF4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 72));
}

uint64_t sub_237620C44()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_237620CA0()
{
  unint64_t result;

  result = qword_2568006C8;
  if (!qword_2568006C8)
  {
    result = MEMORY[0x23B8170FC](&protocol conformance descriptor for FileDownloader.Error, &type metadata for FileDownloader.Error);
    atomic_store(result, (unint64_t *)&qword_2568006C8);
  }
  return result;
}

uint64_t FileDownloader.download(for:destinationFileURL:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_237649FD0();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237620D48()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD **)(v0 + 32);
  if (v1[2])
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 16))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    swift_bridgeObjectRetain();
    sub_237649FC4();
    swift_bridgeObjectRelease();
    sub_237649FC4();
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_237620F48;
    return sub_237647190(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 24));
  }
  else
  {
    if (qword_256800610 != -1)
      swift_once();
    v4 = sub_23764A270();
    __swift_project_value_buffer(v4, (uint64_t)qword_2568006A8);
    v5 = sub_23764A258();
    v6 = sub_23764A594();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23761E000, v5, v6, "Failed to retrieve IMPU", v7, 2u);
      MEMORY[0x23B817198](v7, -1, -1);
    }

    sub_237620CA0();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_237620F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_237620FBC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

uint64_t sub_237621008()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)@<X0>(char *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  ValueMetadata *v21;
  char **v22;
  _OWORD v23[7];
  __int128 v24;
  unint64_t v25;
  _UNKNOWN **v26;
  __int128 v27;
  ValueMetadata *v28;
  _UNKNOWN **v29;
  _BYTE v30[112];

  v7 = *a1;
  LOBYTE(v23[0]) = *a1;
  v25 = sub_237621550();
  v26 = &off_2508EAEE8;
  *(_QWORD *)&v24 = a3;
  v8 = a2;
  v9 = a3;
  sub_237644A68(v8, (char *)v23, &v24, (uint64_t)v30);
  v10 = objc_msgSend(v8, sel_identity);
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, sel_impus);

    v13 = (_QWORD *)sub_23764A4EC();
    if (v13[2])
    {
      v14 = v13[4];
      v11 = (void *)v13[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v14 = 0;
      v11 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  sub_23762158C((uint64_t)v30, (uint64_t)&v24);
  v28 = &type metadata for URLSessionAuthenticator;
  v29 = &off_2508EBA08;
  v15 = (_OWORD *)swift_allocObject();
  *(_QWORD *)&v27 = v15;
  sub_23762158C((uint64_t)&v24, (uint64_t)v23);
  v21 = &type metadata for URLSessionAuthenticator.DefaultFactory;
  v22 = &off_2508EB9F0;
  sub_23762162C((uint64_t)&v24);
  v16 = v23[5];
  v15[5] = v23[4];
  v15[6] = v16;
  v15[7] = v23[6];
  v17 = v23[1];
  v15[1] = v23[0];
  v15[2] = v17;
  v18 = v23[3];
  v15[3] = v23[2];
  v15[4] = v18;
  sub_237621660(&v20, (uint64_t)(v15 + 8));

  sub_23762162C((uint64_t)v30);
  *(_BYTE *)a4 = v7;
  *(_QWORD *)(a4 + 8) = v14;
  *(_QWORD *)(a4 + 16) = v11;
  return sub_237621660(&v27, a4 + 24);
}

uint64_t FileDownloader.init(subscriptionID:systemConfiguration:)@<X0>(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  void *v6;
  id v7;
  char v9;

  v9 = *a1;
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v6 = (void *)sub_23764A384();
  objc_msgSend(v5, sel_set_sourceApplicationBundleIdentifier_, v6);

  v7 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v5);
  return FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)(&v9, a2, v7, a3);
}

uint64_t static FileDownloader.makeDownloader(subscriptionID:)(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_BYTE *)(v2 + 57) = *a2;
  return swift_task_switch();
}

uint64_t sub_237621318()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;

  v1 = *(_BYTE *)(v0 + 57);
  *(_QWORD *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2810]), sel_initWithQueue_, 0);
  *(_BYTE *)(v0 + 56) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = sub_237621398;
  return sub_23762D7C4((_BYTE *)(v0 + 56));
}

uint64_t sub_237621398(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_23762140C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  char v8;

  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v8 = *(_BYTE *)(v0 + 57);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v5 = (void *)sub_23764A384();
  objc_msgSend(v4, sel_set_sourceApplicationBundleIdentifier_, v5);

  v6 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v4);
  FileDownloader.init(subscriptionID:systemConfiguration:urlSession:)(&v8, v1, v6, v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376214F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_237621550()
{
  unint64_t result;

  result = qword_2568006D8;
  if (!qword_2568006D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568006D8);
  }
  return result;
}

uint64_t sub_23762158C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for URLSessionAuthenticator.Configuration(a2, a1);
  return a2;
}

uint64_t sub_2376215C8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  return swift_deallocObject();
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

uint64_t sub_23762162C(uint64_t a1)
{
  destroy for URLSessionAuthenticator.Configuration(a1);
  return a1;
}

uint64_t sub_237621660(__int128 *a1, uint64_t a2)
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

unint64_t sub_23762167C()
{
  unint64_t result;

  result = qword_2568006E8;
  if (!qword_2568006E8)
  {
    result = MEMORY[0x23B8170FC](&protocol conformance descriptor for FileDownloader.Error, &type metadata for FileDownloader.Error);
    atomic_store(result, (unint64_t *)&qword_2568006E8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FileDownloader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FileDownloader(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for FileDownloader(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = a2 + 24;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 24, v4, v6);
  return a1;
}

uint64_t assignWithCopy for FileDownloader(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
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

uint64_t assignWithTake for FileDownloader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloader(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FileDownloader(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FileDownloader()
{
  return &type metadata for FileDownloader;
}

uint64_t getEnumTagSinglePayload for FileDownloader.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FileDownloader.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237621B00 + 4 * asc_23764D364[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237621B20 + 4 * byte_23764D369[v4]))();
}

_BYTE *sub_237621B00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237621B20(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237621B28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237621B30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237621B38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237621B40(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_237621B4C()
{
  return 0;
}

ValueMetadata *type metadata accessor for FileDownloader.Error()
{
  return &type metadata for FileDownloader.Error;
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

uint64_t sub_237621BA8()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_2568006F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568006F0);
  return sub_23764A264();
}

BOOL static FileTransferController.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FileTransferController.Error.hash(into:)()
{
  return sub_23764A7F8();
}

uint64_t FileTransferController.Error.hashValue.getter()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

BOOL sub_237621CA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237621CB8()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t sub_237621CFC()
{
  return sub_23764A7F8();
}

uint64_t sub_237621D24()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t sub_237621D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for FileUploadRequest();
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237621DC4()
{
  uint64_t *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v9;

  v2 = (int *)v0[6];
  v1 = v0[7];
  v4 = v0[3];
  v3 = v0[4];
  v5 = sub_23764A120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v1, v4, v5);
  v6 = v1 + v2[5];
  v7 = sub_23764A228();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  sub_23762651C(v3, v1 + v2[6], &qword_256800710);
  v8(v1 + v2[7], 1, 1, v7);
  v9 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_237621EB0;
  return sub_237621FB4(v0[2], v0[7]);
}

uint64_t sub_237621EB0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 56);
  v3 = *v1;
  *(_QWORD *)(v3 + 72) = v0;
  swift_task_dealloc();
  sub_2376288F4(v2, (uint64_t (*)(_QWORD))type metadata accessor for FileUploadRequest);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_237621F40()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8170E4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_237621FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[23] = a2;
  v3[24] = v2;
  v3[22] = a1;
  v4 = sub_23764A1F8();
  v3[25] = v4;
  v3[26] = *(_QWORD *)(v4 - 8);
  v3[27] = swift_task_alloc();
  sub_23764A3D8();
  v3[28] = swift_task_alloc();
  v5 = sub_237649FE8();
  v3[29] = v5;
  v3[30] = *(_QWORD *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v6 = sub_23764A1C8();
  v3[32] = v6;
  v3[33] = *(_QWORD *)(v6 - 8);
  v3[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v7 = sub_23764A120();
  v3[38] = v7;
  v3[39] = *(_QWORD *)(v7 - 8);
  v3[40] = swift_task_alloc();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v8 = sub_237649FD0();
  v3[43] = v8;
  v3[44] = *(_QWORD *)(v8 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237622144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  __int128 v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  NSObject *log;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 368);
  v3 = *(_QWORD *)(v0 + 336);
  v47 = *(_QWORD *)(v0 + 352);
  v49 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 312);
  v52 = *(_QWORD *)(v0 + 328);
  v54 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 192) + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration;
  type metadata accessor for FileTransferController.Configuration(0);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v3, v7, v4);
  sub_237649FAC();
  sub_237649F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v2, v1, v49);
  swift_bridgeObjectRetain();
  sub_237649FC4();
  swift_bridgeObjectRelease();
  v9 = v8;
  sub_237649FC4();
  v10 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  *(_QWORD *)(v0 + 376) = v10;
  v10(v1, v49);
  v8(v52, v6, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
  v11 = swift_task_alloc();
  *(_QWORD *)(v0 + 384) = v11;
  v12 = (int *)type metadata accessor for FileUploadRequest();
  sub_23762651C(v6 + v12[5], v11, &qword_256800728);
  sub_23762651C(v6 + v12[6], v54, &qword_256800710);
  v13 = swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v13;
  v55 = v13;
  sub_23762651C(v6 + v12[7], v13, &qword_256800728);
  if (qword_256800618 != -1)
    swift_once();
  v14 = *(_QWORD *)(v0 + 320);
  v15 = *(_QWORD *)(v0 + 328);
  v17 = *(_QWORD *)(v0 + 296);
  v16 = *(_QWORD *)(v0 + 304);
  v18 = *(_QWORD *)(v0 + 288);
  v19 = sub_23764A270();
  *(_QWORD *)(v0 + 400) = __swift_project_value_buffer(v19, (uint64_t)qword_2568006F0);
  v9(v14, v15, v16);
  sub_23762651C(v17, v18, &qword_256800710);
  v20 = sub_23764A258();
  v21 = sub_23764A57C();
  v22 = os_log_type_enabled(v20, v21);
  v24 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 320);
  v25 = *(_QWORD *)(v0 + 304);
  v26 = *(_QWORD *)(v0 + 288);
  if (v22)
  {
    v50 = v21;
    log = v20;
    v53 = v11;
    v27 = *(_QWORD *)(v0 + 280);
    v28 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v56 = v48;
    *(_DWORD *)v28 = 136315394;
    sub_2376298AC((unint64_t *)&qword_256800748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v29 = sub_23764A774();
    *(_QWORD *)(v0 + 160) = sub_237626560(v29, v30, &v56);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v31 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v31(v23, v25);
    *(_WORD *)(v28 + 12) = 2080;
    sub_23762651C(v26, v27, &qword_256800710);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v27, 1, v25) == 1)
    {
      sub_237626E98(*(_QWORD *)(v0 + 280), &qword_256800710);
      v32 = 0xE400000000000000;
      v33 = 1701736302;
    }
    else
    {
      v34 = *(_QWORD *)(v0 + 304);
      v35 = *(_QWORD *)(v0 + 280);
      v33 = sub_23764A09C();
      v32 = v36;
      v31(v35, v34);
    }
    v37 = *(_QWORD *)(v0 + 288);
    *(_QWORD *)(v0 + 168) = sub_237626560(v33, v32, &v56);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_237626E98(v37, &qword_256800710);
    _os_log_impl(&dword_23761E000, log, v50, "Attempting to upload file: %s, with thumbnail: %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v48, -1, -1);
    MEMORY[0x23B817198](v28, -1, -1);

    v11 = v53;
  }
  else
  {
    v31 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v31(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 304));
    sub_237626E98(v26, &qword_256800710);

  }
  *(_QWORD *)(v0 + 408) = v31;
  v38 = *(_QWORD *)(v0 + 328);
  v39 = *(_QWORD *)(v0 + 296);
  v40 = *(_QWORD *)(v0 + 272);
  v41 = *(_QWORD *)(v0 + 192);
  sub_23763BCDC((_QWORD *)(v0 + 16));
  *(_QWORD *)(v0 + 88) = &type metadata for HTTPMultipartFormDataBuilder;
  *(_QWORD *)(v0 + 96) = &off_2508EB2F0;
  v42 = (_OWORD *)swift_allocObject();
  *(_QWORD *)(v0 + 64) = v42;
  v43 = *(_OWORD *)(v0 + 32);
  v42[1] = *(_OWORD *)(v0 + 16);
  v42[2] = v43;
  v42[3] = *(_OWORD *)(v0 + 48);
  sub_23764A1BC();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v41 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator), *(_QWORD *)(v41 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator + 24));
  v44 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 416) = v44;
  v44[2] = v0 + 64;
  v44[3] = v40;
  v44[4] = v39;
  v44[5] = v55;
  v44[6] = v38;
  v44[7] = v11;
  v45 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v45;
  *v45 = v0;
  v45[1] = sub_2376226D4;
  return sub_237644CD8(*(_QWORD *)(v0 + 368), (uint64_t)sub_237626E78, (uint64_t)v44);
}

uint64_t sub_2376226D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[54] = a1;
  v5[55] = a2;
  v5[56] = a3;
  v5[57] = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23762274C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  unint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(void);
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
  uint64_t *v71;
  uint64_t (*v72)(void);
  unint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void (*v94)(uint64_t, uint64_t);
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
  void (*v107)(uint64_t, uint64_t);
  uint64_t v108;
  _QWORD *v109;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v106 = v0 + 64;
  if (!v1)
    goto LABEL_13;
  v2 = (void *)v1;
  v3 = *(id *)(v0 + 448);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_13:
    v26 = *(_QWORD *)(v0 + 440);
    v93 = *(void **)(v0 + 448);
    v27 = *(_QWORD *)(v0 + 432);
    v107 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v97 = *(_QWORD *)(v0 + 392);
    v99 = *(_QWORD *)(v0 + 384);
    v29 = *(_QWORD *)(v0 + 368);
    v30 = *(_QWORD *)(v0 + 344);
    v101 = *(_QWORD *)(v0 + 304);
    v104 = *(_QWORD *)(v0 + 328);
    v95 = *(_QWORD *)(v0 + 296);
    v32 = *(_QWORD *)(v0 + 264);
    v31 = *(_QWORD *)(v0 + 272);
    v33 = *(_QWORD *)(v0 + 256);
    sub_237626ED4();
    swift_allocError();
    *v34 = 0;
    swift_willThrow();
    sub_237626F18(v27, v26);

    v28(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    sub_237626E98(v97, &qword_256800728);
    sub_237626E98(v95, &qword_256800710);
    v35 = v99;
LABEL_38:
    sub_237626E98(v35, &qword_256800728);
    v65 = v101;
    v64 = v104;
    goto LABEL_39;
  }
  v4 = (void *)sub_23764A384();
  v5 = objc_msgSend(v2, sel_valueForHTTPHeaderField_, v4);

  if (!v5)
  {
LABEL_37:
    v73 = *(_QWORD *)(v0 + 440);
    v74 = *(void **)(v0 + 448);
    v75 = *(_QWORD *)(v0 + 432);
    v107 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    v98 = *(_QWORD *)(v0 + 392);
    v100 = *(_QWORD *)(v0 + 384);
    v76 = *(_QWORD *)(v0 + 368);
    v77 = *(_QWORD *)(v0 + 344);
    v101 = *(_QWORD *)(v0 + 304);
    v104 = *(_QWORD *)(v0 + 328);
    v94 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v96 = *(_QWORD *)(v0 + 296);
    v78 = *(_QWORD *)(v0 + 264);
    v79 = *(_QWORD *)(v0 + 272);
    v80 = *(_QWORD *)(v0 + 256);
    sub_237626ED4();
    swift_allocError();
    *v81 = 2;
    swift_willThrow();

    sub_237626F18(v75, v73);
    v94(v76, v77);
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v79, v80);
    sub_237626E98(v98, &qword_256800728);
    sub_237626E98(v96, &qword_256800710);
    v35 = v100;
    goto LABEL_38;
  }
  v6 = *(_QWORD *)(v0 + 456);
  v7 = sub_23764A3A8();
  v9 = v8;

  *(_QWORD *)(v0 + 136) = 59;
  *(_QWORD *)(v0 + 144) = 0xE100000000000000;
  v10 = swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v0 + 136;
  swift_bridgeObjectRetain();
  v11 = sub_237625CA8(0x7FFFFFFFFFFFFFFFLL, 1, sub_237626F5C, v10, v7, v9);
  v103 = v6;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v13 = *(_QWORD *)(v0 + 240);
    v109 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_237626B58(0, v12, 0);
    v14 = (uint64_t *)(v11 + 56);
    do
    {
      v15 = *(_QWORD *)(v0 + 248);
      v16 = *(_QWORD *)(v0 + 232);
      v17 = *(v14 - 1);
      v18 = *v14;
      *(_OWORD *)(v0 + 104) = *(_OWORD *)(v14 - 3);
      *(_QWORD *)(v0 + 120) = v17;
      *(_QWORD *)(v0 + 128) = v18;
      swift_bridgeObjectRetain();
      sub_237649FDC();
      sub_237626FB0();
      v19 = sub_23764A618();
      v21 = v20;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v16);
      swift_bridgeObjectRelease();
      v22 = v109;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237626B58(0, v109[2] + 1, 1);
        v22 = v109;
      }
      v24 = v22[2];
      v23 = v22[3];
      if (v24 >= v23 >> 1)
      {
        sub_237626B58(v23 > 1, v24 + 1, 1);
        v22 = v109;
      }
      v22[2] = v24 + 1;
      v25 = &v22[2 * v24];
      v25[4] = v19;
      v25[5] = v21;
      v14 += 4;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    v36 = v22[2];
    if (!v36)
      goto LABEL_36;
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v36 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (!v36)
    {
LABEL_36:
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
  }
  v37 = v22[4];
  v38 = v22[5];
  if (v37 == 0x746163696C707061 && v38 == 0xEF6C6D782F6E6F69
    || (sub_23764A780() & 1) != 0
    || v37 == 0xD000000000000024 && v38 == 0x800000023764AF50
    || (sub_23764A780() & 1) != 0
    || v37 == 0x6D74682F74786574 && v38 == 0xE90000000000006CLL
    || (result = sub_23764A780(), (result & 1) != 0))
  {
LABEL_26:
    swift_bridgeObjectRelease();
    v40 = *(_QWORD *)(v0 + 432);
    v41 = *(_QWORD *)(v0 + 440);
    sub_237626FF4(v40, v41);
    sub_237626FF4(v40, v41);
    v42 = sub_23764A258();
    v43 = sub_23764A57C();
    v44 = os_log_type_enabled(v42, v43);
    v46 = *(_QWORD *)(v0 + 432);
    v45 = *(_QWORD *)(v0 + 440);
    if (v44)
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v109 = (_QWORD *)v48;
      *(_DWORD *)v47 = 136315138;
      sub_23764A3CC();
      v49 = sub_23764A3B4();
      if (v50)
      {
        v51 = v50;
      }
      else
      {
        v49 = 0;
        v51 = 0xE000000000000000;
      }
      *(_QWORD *)(v0 + 152) = sub_237626560(v49, v51, (uint64_t *)&v109);
      sub_23764A600();
      swift_bridgeObjectRelease();
      sub_237626F18(v46, v45);
      sub_237626F18(v46, v45);
      _os_log_impl(&dword_23761E000, v42, v43, "Response body: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v48, -1, -1);
      MEMORY[0x23B817198](v47, -1, -1);
    }
    else
    {
      sub_237626F18(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 440));
      sub_237626F18(v46, v45);
    }

    v52 = v103;
    sub_2376236A0(*(char **)(v0 + 432), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 216));
    v54 = *(_QWORD *)(v0 + 440);
    v53 = *(void **)(v0 + 448);
    v55 = *(_QWORD *)(v0 + 432);
    v107 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    v56 = *(_QWORD *)(v0 + 384);
    v105 = *(_QWORD *)(v0 + 392);
    v57 = *(void (**)(void))(v0 + 376);
    if (!v52)
    {
      v91 = *(_QWORD *)(v0 + 304);
      v92 = *(_QWORD *)(v0 + 328);
      v66 = *(_QWORD *)(v0 + 272);
      v67 = *(_QWORD *)(v0 + 256);
      v68 = *(_QWORD *)(v0 + 264);
      v89 = *(_QWORD *)(v0 + 216);
      v90 = *(_QWORD *)(v0 + 296);
      v87 = *(_QWORD *)(v0 + 208);
      v88 = *(_QWORD *)(v0 + 200);
      v69 = *(_QWORD *)(v0 + 176);
      v57();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v69, v66, v67);
      v70 = type metadata accessor for FileUploadResult();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 32))(v69 + *(int *)(v70 + 20), v89, v88);
      v71 = (uint64_t *)(v69 + *(int *)(v70 + 24));
      *v71 = v55;
      v71[1] = v54;
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v66, v67);
      sub_237626E98(v105, &qword_256800728);
      sub_237626E98(v90, &qword_256800710);
      sub_237626E98(v56, &qword_256800728);
      v107(v92, v91);
      __swift_destroy_boxed_opaque_existential_1(v106);
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
      v72 = *(uint64_t (**)(void))(v0 + 8);
      return v72();
    }
    v102 = *(_QWORD *)(v0 + 328);
    v59 = *(_QWORD *)(v0 + 296);
    v58 = *(_QWORD *)(v0 + 304);
    v60 = *(_QWORD *)(v0 + 384);
    v61 = *(_QWORD *)(v0 + 264);
    v62 = *(_QWORD *)(v0 + 272);
    v63 = *(_QWORD *)(v0 + 256);
    ((void (*)(_QWORD, _QWORD))v57)(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 344));

    sub_237626F18(v55, v54);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v63);
    sub_237626E98(v105, &qword_256800728);
    sub_237626E98(v59, &qword_256800710);
    sub_237626E98(v60, &qword_256800728);
    v64 = v102;
    v65 = v58;
LABEL_39:
    v107(v64, v65);
    __swift_destroy_boxed_opaque_existential_1(v106);
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
    v72 = *(uint64_t (**)(void))(v0 + 8);
    return v72();
  }
  if (v36 == 1)
    goto LABEL_36;
  v82 = v22 + 7;
  v83 = 1;
  while (1)
  {
    v108 = v83 + 1;
    if (__OFADD__(v83, 1))
      break;
    v84 = *(v82 - 1);
    v85 = *v82;
    v86 = v84 == 0x746163696C707061 && v85 == 0xEF6C6D782F6E6F69;
    if (v86 || (sub_23764A780() & 1) != 0 || v84 == 0xD000000000000024 && v85 == 0x800000023764AF50)
      goto LABEL_26;
    if ((sub_23764A780() & 1) != 0 || v84 == 0x6D74682F74786574 && v85 == 0xE90000000000006CLL)
      goto LABEL_26;
    result = sub_23764A780();
    if ((result & 1) != 0)
      goto LABEL_26;
    ++v83;
    v82 += 2;
    if (v108 == v36)
      goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_237623234()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  v3 = *(_QWORD *)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 392);
  v4 = *(_QWORD *)(v0 + 328);
  v6 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 304);
  v8 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 272);
  v9 = *(_QWORD *)(v0 + 256);
  (*(void (**)(_QWORD, _QWORD))(v0 + 376))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 344));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  sub_237626E98(v2, &qword_256800728);
  sub_237626E98(v6, &qword_256800710);
  sub_237626E98(v3, &qword_256800728);
  v1(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376233AC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a7;
  v33 = a5;
  v34 = a6;
  v32[1] = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23764A120();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a2[3];
  v17 = a2[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v18);
  (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v17 + 16))(a3, 6580596, 0xE300000000000000, v18, v17);
  sub_23762651C(a4, (uint64_t)v12, &qword_256800710);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_237626E98((uint64_t)v12, &qword_256800710);
    v19 = v36;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v20 = a2[3];
    v21 = a2[4];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v20);
    v22 = v36;
    (*(void (**)(char *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v21 + 24))(v16, 0x69616E626D756854, 0xE90000000000006CLL, v33, v20, v21);
    v19 = v22;
    if (v22)
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  v24 = a2[3];
  v25 = a2[4];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v24);
  result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v25 + 24))(v34, 1701603654, 0xE400000000000000, v35, v24, v25);
  if (!v19)
  {
    v26 = a2[3];
    v27 = a2[4];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v26);
    v28 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 32))(v26, v27);
    v30 = v29;
    v31 = v28;
    sub_237649F7C();
    v37 = v30;
    sub_23764A774();
    sub_237649FC4();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    swift_bridgeObjectRetain();
    sub_237649FC4();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2376236A0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  _QWORD v40[5];
  uint64_t v41;

  v37 = a2;
  v36 = a1;
  v33 = a3;
  v3 = sub_23764A1F8();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v32 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v32 - v10;
  v12 = sub_23764A24C();
  swift_allocObject();
  v13 = sub_23764A240();
  v40[3] = v12;
  v40[4] = &off_2508EB598;
  v40[0] = v13;
  __swift_project_boxed_opaque_existential_1(v40, v12);
  v14 = sub_23764A2B8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_23762992C();
  v18 = v38;
  v19 = sub_23764A234();
  if (v18)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  v36 = v6;
  v37 = 0;
  MEMORY[0x24BDAC7A8](v19);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))((char *)v32 - v17, (char *)v32 - v17, v14);
  sub_23764A1EC();
  (*(void (**)(char *, uint64_t))(v15 + 8))((char *)v32 - v17, v14);
  if (qword_256800618 != -1)
    swift_once();
  v21 = sub_23764A270();
  __swift_project_value_buffer(v21, (uint64_t)qword_2568006F0);
  v22 = v34;
  v23 = v35;
  v24 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v25 = v9;
  v38 = v11;
  v24(v9, v11, v35);
  v26 = sub_23764A258();
  v27 = sub_23764A588();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v41 = v29;
    *(_DWORD *)v28 = 136315138;
    v23 = v35;
    v32[1] = v28 + 4;
    v24(v36, v25, v35);
    v30 = sub_23764A3E4();
    v39 = sub_237626560(v30, v31, &v41);
    v22 = v34;
    sub_23764A600();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v23);
    _os_log_impl(&dword_23761E000, v26, v27, "%s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v29, -1, -1);
    MEMORY[0x23B817198](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v23);
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v33, v38, v23);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

uint64_t sub_237623A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = type metadata accessor for FileDownloadResult.Output(0);
  v3[6] = swift_task_alloc();
  v4 = sub_23764A120();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v5 = sub_237649FD0();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237623AE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;
  uint64_t v11;

  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[11];
  v5 = v0[8];
  v4 = v0[9];
  v6 = v0[7];
  v7 = v0[3];
  v11 = v0[10];
  type metadata accessor for FileTransferController.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_237649FAC();
  sub_237649F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v11);
  swift_bridgeObjectRetain();
  sub_237649FC4();
  swift_bridgeObjectRelease();
  sub_237649FC4();
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[14] = v8;
  v8(v2, v11);
  sub_237649F70();
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  v0[15] = v9;
  *v9 = v0;
  v9[1] = sub_237623C7C;
  return sub_237627128(v0[4], v0[13]);
}

uint64_t sub_237623C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[16] = a1;
  v5[17] = a2;
  v5[18] = a3;
  v5[19] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237623CEC()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v26;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(void **)(v0 + 144);
  if (v1 >> 60 == 15)
  {
    sub_237626ED4();
    swift_allocError();
    *v3 = 0;
    swift_willThrow();

    (*(void (**)(_QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 128);
    v6 = *(uint64_t **)(v0 + 48);
    *v6 = v5;
    v6[1] = v1;
    swift_storeEnumTagMultiPayload();
    sub_237626FF4(v5, v1);
    sub_237626FF4(v5, v1);
    v7 = objc_msgSend(v2, sel_suggestedFilename);
    if (v7)
    {
      v8 = v7;
      v26 = sub_23764A3A8();
      v10 = v9;

    }
    else
    {
      v26 = 0;
      v10 = 0;
    }
    v11 = *(void **)(v0 + 144);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    v12 = swift_task_alloc();
    v13 = objc_msgSend(v11, sel_MIMEType);
    v14 = *(_QWORD *)(v0 + 136);
    v15 = *(void **)(v0 + 144);
    v16 = *(_QWORD *)(v0 + 128);
    if (v13)
    {
      v17 = v13;
      sub_23764A3A8();

      sub_23764A228();
      swift_task_alloc();
      sub_23764A21C();
      sub_23764A204();
      sub_237627D84(v16, v14);
      sub_237627D84(v16, v14);

      swift_task_dealloc();
    }
    else
    {
      v18 = sub_23764A228();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
      sub_237627D84(v16, v14);
      sub_237627D84(v16, v14);

    }
    v20 = *(_QWORD *)(v0 + 104);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 112);
    v21 = *(_QWORD *)(v0 + 80);
    v22 = *(_QWORD *)(v0 + 16);
    sub_237627D98(*(_QWORD *)(v0 + 48), v22);
    v23 = type metadata accessor for FileDownloadResult(0);
    v24 = (uint64_t *)(v22 + *(int *)(v23 + 20));
    *v24 = v26;
    v24[1] = v10;
    sub_237629868(v12, v22 + *(int *)(v23 + 24), &qword_256800728);
    swift_task_dealloc();
    v19(v20, v21);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_237623FA8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23762401C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for FileDownloadResult.Output(0);
  v4[7] = swift_task_alloc();
  v5 = sub_23764A120();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v6 = sub_237649FD0();
  v4[11] = v6;
  v4[12] = *(_QWORD *)(v6 - 8);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376240DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t);
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = v0[13];
  v1 = v0[14];
  v3 = v0[12];
  v5 = v0[9];
  v4 = v0[10];
  v6 = v0[8];
  v13 = v0[11];
  v14 = v0[5];
  v7 = v0[3];
  v15 = v0[4];
  type metadata accessor for FileTransferController.Configuration(0);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[15] = v8;
  v8(v4, v7, v6);
  sub_237649FAC();
  sub_237649F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  swift_bridgeObjectRetain();
  sub_237649FC4();
  swift_bridgeObjectRelease();
  sub_237649FC4();
  v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[16] = v9;
  v9(v2, v13);
  v10 = (_QWORD *)swift_task_alloc();
  v0[17] = v10;
  v10[2] = v14;
  v10[3] = v1;
  v10[4] = v15;
  v11 = (_QWORD *)swift_task_alloc();
  v0[18] = v11;
  *v11 = v0;
  v11[1] = sub_237624294;
  return sub_237627EAC(dword_256800770, (uint64_t)v10);
}

uint64_t sub_237624294(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;

  v7 = *v4;
  *(_QWORD *)(v7 + 152) = a3;
  *(_QWORD *)(v7 + 160) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  if (!v3)
    sub_237627D84(a1, a2);
  return swift_task_switch();
}

uint64_t sub_23762431C()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v19;

  v1 = *(void **)(v0 + 152);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 64));
  swift_storeEnumTagMultiPayload();
  v2 = objc_msgSend(v1, sel_suggestedFilename);
  if (v2)
  {
    v3 = v2;
    v19 = sub_23764A3A8();
    v5 = v4;

  }
  else
  {
    v19 = 0;
    v5 = 0;
  }
  v6 = *(void **)(v0 + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
  v7 = swift_task_alloc();
  v8 = objc_msgSend(v6, sel_MIMEType);
  v9 = *(void **)(v0 + 152);
  if (v8)
  {
    v10 = v8;
    sub_23764A3A8();

    sub_23764A228();
    swift_task_alloc();
    sub_23764A21C();
    sub_23764A204();

    swift_task_dealloc();
  }
  else
  {
    v11 = sub_23764A228();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);

  }
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 16);
  sub_237627D98(*(_QWORD *)(v0 + 56), v15);
  v16 = type metadata accessor for FileDownloadResult(0);
  v17 = (uint64_t *)(v15 + *(int *)(v16 + 20));
  *v17 = v19;
  v17[1] = v5;
  sub_237629868(v7, v15 + *(int *)(v16 + 24), &qword_256800728);
  v12(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237624520()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 128))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23762458C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2376245A8()
{
  _QWORD *v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[2] + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator), *(_QWORD *)(v0[2] + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator + 24));
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_237624610;
  return sub_237647190(v0[3], v0[4]);
}

uint64_t sub_237624610(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
  {
    v5 = 0;
    v6 = 0xF000000000000000;
    v7 = a1;
  }
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v4 + 8))(v5, v6, v7);
}

uint64_t FileTransferController.deinit()
{
  uint64_t v0;

  sub_2376288F4(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration, type metadata accessor for FileTransferController.Configuration);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator);
  return v0;
}

uint64_t FileTransferController.__deallocating_deinit()
{
  uint64_t v0;

  sub_2376288F4(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration, type metadata accessor for FileTransferController.Configuration);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator);
  return swift_deallocClassInstance();
}

uint64_t sub_2376246F0@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  id v27;
  void *v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _BYTE *v41;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  _BYTE *v48;
  _OWORD *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  int *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, char *, uint64_t);
  char *v61;
  int v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  ValueMetadata *v67;
  char **v68;
  _OWORD v69[7];
  __int128 v70;
  ValueMetadata *v71;
  _UNKNOWN **v72;
  __int128 v73;
  ValueMetadata *v74;
  _UNKNOWN **v75;
  _BYTE v76[120];
  char *v77;

  v63 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v61 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v57 - v10;
  v12 = sub_23764A120();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v64 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v77 = (char *)&v57 - v19;
  v62 = *a1;
  v20 = objc_msgSend(a2, sel_fileTransferCapabilities);
  if (!v20)
    goto LABEL_10;
  v21 = v20;
  v65 = a3;
  v22 = objc_msgSend(v20, sel_contentServerUploadUrl);
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_9;
  }
  v23 = v22;
  sub_23764A0CC();

  v24 = v18;
  v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v25(v11, v24, v12);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_9:

    sub_237626E98((uint64_t)v11, &qword_256800710);
    a3 = v65;
LABEL_10:
    if (qword_256800618 != -1)
      swift_once();
    v37 = sub_23764A270();
    __swift_project_value_buffer(v37, (uint64_t)qword_2568006F0);
    v38 = sub_23764A258();
    v39 = sub_23764A594();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_23761E000, v38, v39, "Failed to retrieve file transfer capabilities", v40, 2u);
      MEMORY[0x23B817198](v40, -1, -1);
    }

    sub_237626ED4();
    swift_allocError();
    *v41 = 4;
    swift_willThrow();

    return __swift_destroy_boxed_opaque_existential_1(a3);
  }
  v25(v77, v11, v12);
  v27 = objc_msgSend(a2, sel_identity);
  if (v27)
  {
    v28 = v27;
    v60 = (void (*)(uint64_t, char *, uint64_t))v25;
    v29 = objc_msgSend(v27, sel_impus);

    v30 = (_QWORD *)sub_23764A4EC();
    if (v30[2])
    {
      v31 = v30[5];
      v58 = v30[4];
      v59 = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      LOBYTE(v69[0]) = v62;
      sub_2376297E0(v65, (uint64_t)&v70);
      v32 = a2;
      sub_237644A68(v32, (char *)v69, &v70, (uint64_t)v76);
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v64, v77, v12);
      v33 = objc_msgSend(v21, sel_contentServerDownloadUrl);
      if (v33)
      {
        v34 = v33;
        v35 = (uint64_t)v61;
        sub_23764A0CC();

        v36 = 0;
      }
      else
      {
        v36 = 1;
        v35 = (uint64_t)v61;
      }
      v26((char *)v35, v36, 1, v12);
      sub_23762158C((uint64_t)v76, (uint64_t)&v70);
      v74 = &type metadata for URLSessionAuthenticator;
      v75 = &off_2508EBA08;
      v49 = (_OWORD *)swift_allocObject();
      *(_QWORD *)&v73 = v49;
      sub_23762158C((uint64_t)&v70, (uint64_t)v69);
      v67 = &type metadata for URLSessionAuthenticator.DefaultFactory;
      v68 = &off_2508EB9F0;
      sub_23762162C((uint64_t)&v70);
      v50 = v69[5];
      v49[5] = v69[4];
      v49[6] = v50;
      v49[7] = v69[6];
      v51 = v69[1];
      v49[1] = v69[0];
      v49[2] = v51;
      v52 = v69[3];
      v49[3] = v69[2];
      v49[4] = v52;
      sub_237621660(&v66, (uint64_t)(v49 + 8));
      v71 = &type metadata for FileTransferController.DefaultFactory;
      v72 = &off_2508EA7E8;

      __swift_destroy_boxed_opaque_existential_1(v65);
      sub_23762162C((uint64_t)v76);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v77, v12);
      v53 = v63;
      v60(v63, v64, v12);
      v54 = (int *)type metadata accessor for FileTransferController.Configuration(0);
      sub_237629868(v35, v53 + v54[5], &qword_256800710);
      v55 = (_QWORD *)(v53 + v54[6]);
      v56 = v59;
      *v55 = v58;
      v55[1] = v56;
      sub_237621660(&v73, v53 + v54[7]);
      return sub_237621660(&v70, v53 + v54[8]);
    }
    swift_bridgeObjectRelease();
  }
  v43 = v65;
  if (qword_256800618 != -1)
    swift_once();
  v44 = sub_23764A270();
  __swift_project_value_buffer(v44, (uint64_t)qword_2568006F0);
  v45 = sub_23764A258();
  v46 = sub_23764A594();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_23761E000, v45, v46, "Failed to retrieve IMPU", v47, 2u);
    MEMORY[0x23B817198](v47, -1, -1);
  }

  sub_237626ED4();
  swift_allocError();
  *v48 = 4;
  swift_willThrow();

  __swift_destroy_boxed_opaque_existential_1(v43);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v77, v12);
}

uint64_t sub_237624D34(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = a3;
  *(_BYTE *)(v3 + 105) = *a2;
  return swift_task_switch();
}

uint64_t sub_237624D54()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;

  v1 = *(_BYTE *)(v0 + 105);
  *(_QWORD *)(v0 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2810]), sel_initWithQueue_, 0);
  *(_BYTE *)(v0 + 104) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_237624DD4;
  return sub_23762D7C4((_BYTE *)(v0 + 104));
}

uint64_t sub_237624DD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_237624E48()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v5[9];

  v1 = *(void **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v5[0] = *(_BYTE *)(v0 + 105);
  sub_2376297E0(v2, v0 + 16);
  sub_2376246F0(v5, v1, v0 + 16, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237624EC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static FileTransferController.makeController(for:urlSession:)(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 104) = v2;
  *(_QWORD *)(v3 + 112) = type metadata accessor for FileTransferController.Configuration(0);
  *(_QWORD *)(v3 + 120) = swift_task_alloc();
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  *(_BYTE *)(v3 + 153) = *a1;
  return swift_task_switch();
}

uint64_t sub_237624F74()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 96);
  *(_BYTE *)(v0 + 152) = *(_BYTE *)(v0 + 153);
  *(_QWORD *)(v0 + 40) = sub_237621550();
  *(_QWORD *)(v0 + 48) = &off_2508EAEE8;
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v3;
  *(_QWORD *)v3 = v0;
  *(_QWORD *)(v3 + 8) = sub_237625014;
  *(_QWORD *)(v3 + 56) = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v3 + 64) = v0 + 16;
  *(_BYTE *)(v3 + 105) = *(_BYTE *)(v0 + 152);
  return swift_task_switch();
}

uint64_t sub_237625014()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_237625080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  sub_237628930(v1, v2);
  type metadata accessor for FileTransferController(0);
  v4 = swift_allocObject();
  sub_237628930(v2, v4 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration);
  sub_2376297E0(v2 + *(int *)(v3 + 28), v0 + 56);
  sub_2376288F4(v2, type metadata accessor for FileTransferController.Configuration);
  sub_237621660((__int128 *)(v0 + 56), v4 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator);
  sub_2376288F4(v1, type metadata accessor for FileTransferController.Configuration);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_237625158()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static FileTransferController.makeController(for:)(_BYTE *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 41) = *a1;
  return swift_task_switch();
}

uint64_t sub_2376251BC()
{
  uint64_t v0;
  char v1;
  id v2;
  void *v3;
  id v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 41);
  type metadata accessor for FileTransferController(0);
  *(_BYTE *)(v0 + 40) = v1;
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultSessionConfiguration);
  v3 = (void *)sub_23764A384();
  objc_msgSend(v2, sel_set_sourceApplicationBundleIdentifier_, v3);

  v4 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v2);
  *(_QWORD *)(v0 + 16) = v4;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v5;
  *v5 = v0;
  v5[1] = sub_2376252B4;
  return static FileTransferController.makeController(for:urlSession:)((_BYTE *)(v0 + 40), (uint64_t)v4);
}

uint64_t sub_2376252B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();

  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23762533C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id static FileTransferController.makeController(for:systemConfiguration:)(unsigned __int8 *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  _UNKNOWN **v20;
  unsigned __int8 v21;

  v5 = type metadata accessor for FileTransferController.Configuration(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v21 = *a1;
  v11 = (void *)objc_opt_self();
  v12 = a2;
  v13 = objc_msgSend(v11, sel_defaultSessionConfiguration);
  v14 = (void *)sub_23764A384();
  objc_msgSend(v13, sel_set_sourceApplicationBundleIdentifier_, v14);

  v15 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v13);
  v19 = sub_237621550();
  v20 = &off_2508EAEE8;
  *(_QWORD *)&v18 = v15;
  sub_2376246F0(&v21, v12, (uint64_t)&v18, (uint64_t)v10);
  if (!v2)
  {
    sub_237628930((uint64_t)v10, (uint64_t)v8);
    type metadata accessor for FileTransferController(0);
    v12 = (id)swift_allocObject();
    sub_237628930((uint64_t)v8, (uint64_t)v12 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_configuration);
    sub_2376297E0((uint64_t)&v8[*(int *)(v5 + 28)], (uint64_t)&v18);
    sub_2376288F4((uint64_t)v8, type metadata accessor for FileTransferController.Configuration);
    sub_237621660(&v18, (uint64_t)v12 + OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator);
    sub_2376288F4((uint64_t)v10, type metadata accessor for FileTransferController.Configuration);
  }
  return v12;
}

uint64_t sub_237625568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_23764A6A8();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_23762560C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_23764A6C0();
  sub_2376298AC(&qword_256800950, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_23764A7A4();
  sub_2376298AC(&qword_256800958, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23764A6CC();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_237625724;
  return sub_23764A7B0();
}

uint64_t sub_237625724()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2376257D0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23762580C(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD v47[4];

  v47[3] = a4;
  if (a1 < 0)
    goto LABEL_35;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = a5;
  if (!a1 || (v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_237626144(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  v35 = a1;
  v36 = v10;
  v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = a5;
  v13 = a5;
  v40 = a5;
  while (1)
  {
    v47[0] = sub_23764A5E8();
    v47[1] = v14;
    v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      break;
    v12 = sub_23764A5DC();
LABEL_9:
    if (v45 == v12 >> 14)
      goto LABEL_24;
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    v12 = sub_23764A5DC();
    *(_QWORD *)(v44 + 16) = v12;
    v13 = v12;
    v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14)
    goto LABEL_34;
  v17 = sub_23764A5F4();
  v39 = v18;
  v41 = v17;
  v37 = v20;
  v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v43 = sub_2376263FC(0, v43[2] + 1, 1, v43);
  v22 = v43[2];
  v21 = v43[3];
  if (v22 >= v21 >> 1)
    v43 = sub_2376263FC((_QWORD *)(v21 > 1), v22 + 1, 1, v43);
  v43[2] = v22 + 1;
  v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(_QWORD *)(v36 + 16) = v43;
  v24 = sub_23764A5DC();
  v12 = v24;
  *(_QWORD *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    v13 = v24;
    v40 = v24;
    goto LABEL_9;
  }
  v40 = v24;
  v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    v25 = sub_23764A5F4();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a6 = (unint64_t)sub_2376263FC(0, v43[2] + 1, 1, v43);
    v33 = *(_QWORD *)(a6 + 16);
    v32 = *(_QWORD *)(a6 + 24);
    if (v33 >= v32 >> 1)
      a6 = (unint64_t)sub_2376263FC((_QWORD *)(v32 > 1), v33 + 1, 1, (_QWORD *)a6);
    *(_QWORD *)(a6 + 16) = v33 + 1;
    v34 = (_QWORD *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(_QWORD *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_23764A6D8();
  __break(1u);
LABEL_35:
  result = sub_23764A6D8();
  __break(1u);
  return result;
}

uint64_t sub_237625CA8(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_2376262A4(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_23764A498();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_23764A420();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_23764A420();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_23764A4BC();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_2376263FC(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_2376263FC((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_23764A420();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_23764A4BC();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_2376263FC(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_2376263FC((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_23764A6D8();
  __break(1u);
LABEL_42:
  result = sub_23764A6D8();
  __break(1u);
  return result;
}

uint64_t sub_237626144(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_23764A5F4();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_2376263FC(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_2376263FC((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_23764A6D8();
  __break(1u);
  return result;
}

uint64_t sub_2376262A4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_23764A4BC();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_2376263FC(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_2376263FC((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_23764A6D8();
  __break(1u);
  return result;
}

_QWORD *sub_2376263FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800978);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_237627038(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FileTransferController.Configuration(uint64_t a1)
{
  return sub_237628988(a1, (uint64_t *)&unk_2568008F0);
}

uint64_t sub_23762651C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237626560(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_237626630(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2376298EC((uint64_t)v12, *a3);
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
      sub_2376298EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_237626630(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23764A60C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2376267E8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_23764A69C();
  if (!v8)
  {
    sub_23764A6D8();
    __break(1u);
LABEL_17:
    result = sub_23764A6FC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2376267E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23762687C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2376269F0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2376269F0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23762687C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_237630768(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23764A66C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23764A6D8();
      __break(1u);
LABEL_10:
      v2 = sub_23764A444();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23764A6FC();
    __break(1u);
LABEL_14:
    result = sub_23764A6D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_2376269F0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800960);
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
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23764A6FC();
  __break(1u);
  return result;
}

uint64_t sub_237626B3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_237626B74(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_237626B58(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_237626CDC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_237626B74(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800980);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23764A6FC();
  __break(1u);
  return result;
}

uint64_t sub_237626CDC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800970);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23764A6FC();
  __break(1u);
  return result;
}

uint64_t sub_237626E44()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237626E78(uint64_t a1)
{
  uint64_t v1;

  return sub_2376233AC(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_237626E98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_237626ED4()
{
  unint64_t result;

  result = qword_256800738;
  if (!qword_256800738)
  {
    result = MEMORY[0x23B8170FC](&protocol conformance descriptor for FileTransferController.Error, &type metadata for FileTransferController.Error);
    atomic_store(result, (unint64_t *)&qword_256800738);
  }
  return result;
}

uint64_t sub_237626F18(uint64_t a1, unint64_t a2)
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

uint64_t sub_237626F5C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_23764A780() & 1;
}

unint64_t sub_237626FB0()
{
  unint64_t result;

  result = qword_256800740;
  if (!qword_256800740)
  {
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_256800740);
  }
  return result;
}

uint64_t sub_237626FF4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_237627038(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23764A6FC();
  __break(1u);
  return result;
}

uint64_t sub_237627128(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[5] = a1;
  v2[6] = a2;
  v3 = sub_23764A6C0();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v4 = sub_237649FD0();
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376271C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  _QWORD *v8;

  v1 = v0[13];
  v2 = v0[10];
  v3 = v0[11];
  v4 = v0[5];
  v5 = v0[6];
  v6 = OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator;
  v0[14] = OBJC_IVAR____TtC15CTLazuliSupport22FileTransferController_urlSessionAuthenticator;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + v6), *(_QWORD *)(v4 + v6 + 24));
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[15] = v7;
  v7(v1, v5, v2);
  v8 = (_QWORD *)swift_task_alloc();
  v0[16] = v8;
  *v8 = v0;
  v8[1] = sub_237627260;
  return sub_23764864C(v0[13]);
}

uint64_t sub_237627260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)*v4;
  v5[17] = a1;
  v5[18] = a2;
  v5[19] = a3;
  v5[20] = v3;
  swift_task_dealloc();
  v6 = v5[13];
  v7 = v5[10];
  v8 = *(void (**)(uint64_t, uint64_t))(v5[11] + 8);
  if (!v3)
    v5[21] = v8;
  v8(v6, v7);
  return swift_task_switch();
}

uint64_t sub_2376272E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  void *v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v37;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = *(void **)(v0 + 152);
  if (!v1)
  {
    v17 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 144);
    sub_237626ED4();
    swift_allocError();
    *v18 = 0;
    swift_willThrow();
LABEL_14:

    sub_237626F18(v17, v16);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = (void *)v1;
  v4 = qword_256800618;
  v5 = v2;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    swift_once();
    v6 = *(void **)(v0 + 152);
  }
  v7 = sub_23764A270();
  *(_QWORD *)(v0 + 176) = __swift_project_value_buffer(v7, (uint64_t)qword_2568006F0);
  v8 = v6;
  v9 = sub_23764A258();
  v10 = sub_23764A588();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 152);
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)(v0 + 32) = v3;
    v15 = v12;
    sub_23764A600();
    *v14 = v3;

    _os_log_impl(&dword_23761E000, v9, v10, "%@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v14, -1, -1);
    MEMORY[0x23B817198](v13, -1, -1);
  }
  else
  {

  }
  if (objc_msgSend(v3, sel_statusCode) == (id)200)
  {
    v19 = *(void **)(v0 + 152);
    swift_release();

    v20 = *(_QWORD *)(v0 + 136);
    v21 = *(_QWORD *)(v0 + 144);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8))(v20, v21, v3);
  }
  if (objc_msgSend(v3, sel_statusCode) != (id)503
    || (sub_237630404(), (v25 & 1) != 0)
    || (v26 = v23, v27 = v24, (sub_23764A834() & 1) != 0))
  {
    v16 = *(_QWORD *)(v0 + 144);
    v2 = *(void **)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 136);
    sub_237626ED4();
    swift_allocError();
    *v28 = 0;
    swift_willThrow();

    goto LABEL_14;
  }
  v29 = sub_23764A258();
  v30 = sub_23764A5A0();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v37 = v32;
    *(_DWORD *)v31 = 136315138;
    v33 = sub_23764A828();
    *(_QWORD *)(v0 + 24) = sub_237626560(v33, v34, &v37);
    sub_23764A600();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23761E000, v29, v30, "Received 503 with Retry-After, will retry in %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v32, -1, -1);
    MEMORY[0x23B817198](v31, -1, -1);
  }

  sub_23764A6B4();
  v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256800940 + dword_256800940);
  v35 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v35;
  *v35 = v0;
  v35[1] = sub_2376277F0;
  return v36(v26, v27, 0, 0, 1);
}

uint64_t sub_237627798()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376277F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[8] + 8))(v2[9], v2[7]);
  return swift_task_switch();
}

uint64_t sub_237627864()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = sub_23764A258();
  v2 = sub_23764A5A0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23761E000, v1, v2, "Retrying download after Retry-After duration elapsed", v3, 2u);
    MEMORY[0x23B817198](v3, -1, -1);
  }
  v5 = v0[14];
  v4 = (void (*)(uint64_t, uint64_t, uint64_t))v0[15];
  v6 = v0[12];
  v7 = v0[10];
  v9 = v0[5];
  v8 = v0[6];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v9 + v5), *(_QWORD *)(v9 + v5 + 24));
  v4(v6, v8, v7);
  v10 = (_QWORD *)swift_task_alloc();
  v0[25] = v10;
  *v10 = v0;
  v10[1] = sub_2376279E0;
  return sub_23764864C(v0[12]);
}

uint64_t sub_237627968()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);

  sub_237626F18(v3, v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376279E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 208) = a1;
  *(_QWORD *)(v5 + 216) = a2;
  *(_QWORD *)(v5 + 224) = a3;
  *(_QWORD *)(v5 + 232) = v3;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v5 + 168))(*(_QWORD *)(v5 + 96), *(_QWORD *)(v5 + 80));
  return swift_task_switch();
}

uint64_t sub_237627A60()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  _BYTE *v22;
  _QWORD *v23;

  v1 = *(id *)(v0 + 224);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 224);
    v5 = (uint8_t *)swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 16) = v4;
    v6 = v4;
    sub_23764A600();
    *v23 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "Response after retry: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v23, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {
    v7 = *(void **)(v0 + 224);

    v2 = *(NSObject **)(v0 + 224);
  }

  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  if (v8 && (v9 = v8, objc_msgSend(v8, sel_statusCode) == (id)200))
  {
    v10 = *(_QWORD *)(v0 + 144);
    v11 = *(void **)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 136);

    sub_237626F18(v12, v10);
    swift_release();
    v14 = *(_QWORD *)(v0 + 208);
    v13 = *(_QWORD *)(v0 + 216);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8))(v14, v13, v9);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(void **)(v0 + 224);
    v18 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 144);
    v20 = *(void **)(v0 + 152);
    v21 = *(_QWORD *)(v0 + 136);
    sub_237626ED4();
    swift_allocError();
    *v22 = 0;
    swift_willThrow();

    sub_237626F18(v18, v16);
    sub_237626F18(v21, v19);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_237627D0C()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);

  sub_237626F18(v3, v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237627D84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_237626F18(a1, a2);
  return a1;
}

uint64_t sub_237627D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237627DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_237627E44;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return swift_task_switch();
}

uint64_t sub_237627E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  v8 = *v3;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3);
}

uint64_t sub_237627EAC(int *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v2[5] = a1;
  v2[6] = a2;
  v4 = sub_23764A6C0();
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = swift_task_alloc();
  v7 = (uint64_t (*)(void))((char *)a1 + *a1);
  v5 = (_QWORD *)swift_task_alloc();
  v2[10] = v5;
  *v5 = v2;
  v5[1] = sub_237627F34;
  return v7();
}

uint64_t sub_237627F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 88) = a1;
  *(_QWORD *)(v5 + 96) = a2;
  *(_QWORD *)(v5 + 104) = a3;
  swift_task_dealloc();
  if (!v3)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_237627FB4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v36;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = *(void **)(v0 + 104);
  if (!v1)
  {
    v17 = *(_QWORD *)(v0 + 88);
    v16 = *(_QWORD *)(v0 + 96);
    sub_237626ED4();
    swift_allocError();
    *v18 = 0;
    swift_willThrow();
LABEL_14:

    sub_237627D84(v17, v16);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = (void *)v1;
  v4 = qword_256800618;
  v5 = v2;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    swift_once();
    v6 = *(void **)(v0 + 104);
  }
  v7 = sub_23764A270();
  *(_QWORD *)(v0 + 112) = __swift_project_value_buffer(v7, (uint64_t)qword_2568006F0);
  v8 = v6;
  v9 = sub_23764A258();
  v10 = sub_23764A588();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 104);
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)(v0 + 32) = v3;
    v15 = v12;
    sub_23764A600();
    *v14 = v3;

    _os_log_impl(&dword_23761E000, v9, v10, "%@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v14, -1, -1);
    MEMORY[0x23B817198](v13, -1, -1);
  }
  else
  {

  }
  if (objc_msgSend(v3, sel_statusCode) == (id)200)
  {

    v19 = *(_QWORD *)(v0 + 88);
    v20 = *(_QWORD *)(v0 + 96);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8))(v19, v20, v3);
  }
  if (objc_msgSend(v3, sel_statusCode) != (id)503
    || (sub_237630404(), (v24 & 1) != 0)
    || (v25 = v22, v26 = v23, (sub_23764A834() & 1) != 0))
  {
    v16 = *(_QWORD *)(v0 + 96);
    v2 = *(void **)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 88);
    sub_237626ED4();
    swift_allocError();
    *v27 = 0;
    swift_willThrow();

    goto LABEL_14;
  }
  v28 = sub_23764A258();
  v29 = sub_23764A5A0();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v36 = v31;
    *(_DWORD *)v30 = 136315138;
    v32 = sub_23764A828();
    *(_QWORD *)(v0 + 24) = sub_237626560(v32, v33, &v36);
    sub_23764A600();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23761E000, v28, v29, "Received 503 with Retry-After, will retry in %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v31, -1, -1);
    MEMORY[0x23B817198](v30, -1, -1);
  }

  sub_23764A6B4();
  v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256800940 + dword_256800940);
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v34;
  *v34 = v0;
  v34[1] = sub_237628424;
  return v35(v25, v26, 0, 0, 1);
}

uint64_t sub_237628424()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[8] + 8))(v2[9], v2[7]);
  return swift_task_switch();
}

uint64_t sub_237628498()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v1 = sub_23764A258();
  v2 = sub_23764A5A0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23761E000, v1, v2, "Retrying download after Retry-After duration elapsed", v3, 2u);
    MEMORY[0x23B817198](v3, -1, -1);
  }
  v4 = *(int **)(v0 + 40);

  v7 = (uint64_t (*)(void))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v5;
  *v5 = v0;
  v5[1] = sub_2376285C0;
  return v7();
}

uint64_t sub_237628568()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void **)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);

  sub_237627D84(v3, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376285C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[18] = a1;
  v5[19] = a2;
  v5[20] = a3;
  v5[21] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237628630()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  _BYTE *v22;
  _QWORD *v23;

  v1 = *(id *)(v0 + 160);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 160);
    v5 = (uint8_t *)swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 16) = v4;
    v6 = v4;
    sub_23764A600();
    *v23 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "Response after retry: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v23, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {
    v7 = *(void **)(v0 + 160);

    v2 = *(NSObject **)(v0 + 160);
  }

  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  if (v8 && (v9 = v8, objc_msgSend(v8, sel_statusCode) == (id)200))
  {
    v10 = *(_QWORD *)(v0 + 96);
    v11 = *(void **)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 88);

    sub_237627D84(v12, v10);
    v14 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 152);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v0 + 8))(v14, v13, v9);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 152);
    v17 = *(void **)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 144);
    v19 = *(_QWORD *)(v0 + 96);
    v20 = *(void **)(v0 + 104);
    v21 = *(_QWORD *)(v0 + 88);
    sub_237626ED4();
    swift_allocError();
    *v22 = 0;
    swift_willThrow();

    sub_237627D84(v18, v16);
    sub_237627D84(v21, v19);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23762889C()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void **)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);

  sub_237627D84(v3, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376288F4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237628930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FileTransferController.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FileTransferController(uint64_t a1)
{
  return sub_237628988(a1, (uint64_t *)&unk_2568007C8);
}

uint64_t sub_237628988(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2376289C0()
{
  unint64_t result;

  result = qword_256800798;
  if (!qword_256800798)
  {
    result = MEMORY[0x23B8170FC](&protocol conformance descriptor for FileTransferController.Error, &type metadata for FileTransferController.Error);
    atomic_store(result, (unint64_t *)&qword_256800798);
  }
  return result;
}

uint64_t sub_237628A04()
{
  return type metadata accessor for FileTransferController(0);
}

uint64_t sub_237628A0C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FileTransferController.Configuration(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FileTransferController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FileTransferController.uploadFile(at:thumbnailURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 104)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 104));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_237628B0C;
  return v10(a1, a2, a3);
}

uint64_t sub_237628B0C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of FileTransferController.upload(fileRequest:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 112) + *(_QWORD *)(*(_QWORD *)v2 + 112));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2376299E0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FileTransferController.downloadFile(at:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 120) + *(_QWORD *)(*(_QWORD *)v2 + 120));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2376299E0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FileTransferController.downloadFile(at:destinationFileURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 128)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 128));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_2376299E0;
  return v10(a1, a2, a3);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FileTransferController.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FileTransferController.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237628DA4 + 4 * byte_23764D455[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_237628DD8 + 4 * byte_23764D450[v4]))();
}

uint64_t sub_237628DD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237628DE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237628DE8);
  return result;
}

uint64_t sub_237628DF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237628DFCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_237628E00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237628E08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237628E14(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_237628E1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FileTransferController.Error()
{
  return &type metadata for FileTransferController.Error;
}

char *sub_237628E34(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  __int128 v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23764A120();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    v15 = a3[6];
    v16 = a3[7];
    v17 = &a1[v15];
    v18 = &a2[v15];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v20 = &a1[v16];
    v21 = &a2[v16];
    v22 = *(_OWORD *)&a2[v16 + 24];
    *(_OWORD *)&a1[v16 + 24] = v22;
    v23 = v22;
    v24 = **(void (***)(char *, char *, uint64_t))(v22 - 8);
    swift_bridgeObjectRetain();
    v24(v20, v21, v23);
    v25 = a3[8];
    v26 = *(_OWORD *)&a2[v25 + 24];
    *(_OWORD *)&a1[v25 + 24] = v26;
    (**(void (***)(void))(v26 - 8))();
  }
  return a1;
}

uint64_t sub_237628F9C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = sub_23764A120();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = a1 + a2[5];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
}

char *sub_237629040(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  __int128 v24;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = &a1[v14];
  v19 = &a2[v14];
  v20 = *(_OWORD *)&a2[v14 + 24];
  *(_OWORD *)&a1[v14 + 24] = v20;
  v21 = v20;
  v22 = **(void (***)(char *, char *, uint64_t))(v20 - 8);
  swift_bridgeObjectRetain();
  v22(v18, v19, v21);
  v23 = a3[8];
  v24 = *(_OWORD *)&a2[v23 + 24];
  *(_OWORD *)&a1[v23 + 24] = v24;
  (**(void (***)(void))(v24 - 8))();
  return a1;
}

char *sub_23762917C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[a3[7]], (uint64_t *)&a2[a3[7]]);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[a3[8]], (uint64_t *)&a2[a3[8]]);
  return a1;
}

char *sub_2376292E8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *((_OWORD *)v19 + 1);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v18 + 4) = *((_QWORD *)v19 + 4);
  return a1;
}

char *sub_2376293FC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = (uint64_t *)&a2[v16];
  v20 = *v18;
  v19 = v18[1];
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v21]);
  v24 = *((_OWORD *)v23 + 1);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v24;
  *((_QWORD *)v22 + 4) = *((_QWORD *)v23 + 4);
  v25 = a3[8];
  v26 = &a1[v25];
  v27 = &a2[v25];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v25]);
  v28 = *((_OWORD *)v27 + 1);
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *((_OWORD *)v26 + 1) = v28;
  *((_QWORD *)v26 + 4) = *((_QWORD *)v27 + 4);
  return a1;
}

uint64_t sub_237629580()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23762958C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_23762963C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237629648(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23764A120();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

void sub_2376296F4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23764A120();
  if (v0 <= 0x3F)
  {
    sub_23762978C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23762978C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256800900)
  {
    sub_23764A120();
    v0 = sub_23764A5D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256800900);
  }
}

uint64_t sub_2376297E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237629824()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  return swift_deallocObject();
}

uint64_t sub_237629868(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2376298AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8170FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2376298EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23762992C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256800968;
  if (!qword_256800968)
  {
    v1 = sub_23764A2B8();
    result = MEMORY[0x23B8170FC](MEMORY[0x24BE0D998], v1);
    atomic_store(result, (unint64_t *)&qword_256800968);
  }
  return result;
}

uint64_t sub_237629974()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237629998()
{
  return swift_deallocObject();
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

ValueMetadata *type metadata accessor for FileTransferController.DefaultFactory()
{
  return &type metadata for FileTransferController.DefaultFactory;
}

uint64_t sub_2376299EC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for HTTPAuthenticationScheme(uint64_t a1)
{
  return sub_237629A14(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_237629A14(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s15CTLazuliSupport24HTTPAuthenticationSchemeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2376299EC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for HTTPAuthenticationScheme(uint64_t a1, uint64_t a2)
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
  sub_2376299EC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_237629A14(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HTTPAuthenticationScheme(uint64_t a1, uint64_t a2)
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
  sub_237629A14(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPAuthenticationScheme(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPAuthenticationScheme(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_237629BAC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_237629BC4(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme()
{
  return &type metadata for HTTPAuthenticationScheme;
}

uint64_t sub_237629BEC()
{
  return 0;
}

uint64_t sub_237629BF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_237629C24()
{
  return 0;
}

void sub_237629C30(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_237629C3C()
{
  sub_23762AF4C();
  return sub_23764A840();
}

uint64_t sub_237629C64()
{
  sub_23762AF4C();
  return sub_23764A84C();
}

uint64_t sub_237629C8C(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  char v32;
  char v33;

  v30 = a4;
  v27 = a2;
  v28 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009D0);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v24 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009D8);
  v22 = *(_QWORD *)(v7 - 8);
  v23 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009E0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009E8);
  v29 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23762AE80();
  sub_23764A81C();
  if (!(_BYTE)v30)
  {
    v32 = 1;
    sub_23762AF08();
    sub_23764A750();
    v19 = v23;
    sub_23764A75C();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v14);
  }
  if (v30 == 1)
  {
    v33 = 2;
    sub_23762AEC4();
    v17 = v24;
    sub_23764A750();
    v18 = v26;
    sub_23764A75C();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v14);
  }
  v31 = 0;
  sub_23762AF4C();
  sub_23764A750();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v14);
}

uint64_t sub_237629F5C()
{
  return 0x6D6C616572;
}

uint64_t sub_237629F74()
{
  sub_23762AEC4();
  return sub_23764A840();
}

uint64_t sub_237629F9C()
{
  sub_23762AEC4();
  return sub_23764A84C();
}

uint64_t sub_237629FC4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x747365676964;
  if (*v0 != 1)
    v1 = 0x61727473746F6F62;
  if (*v0)
    return v1;
  else
    return 0x6369736162;
}

uint64_t sub_23762A01C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23762A848(a1, a2);
  *a3 = result;
  return result;
}

void sub_23762A040(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23762A04C()
{
  sub_23762AE80();
  return sub_23764A840();
}

uint64_t sub_23762A074()
{
  sub_23762AE80();
  return sub_23764A84C();
}

uint64_t sub_23762A09C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6D6C616572 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23764A780();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23762A128()
{
  sub_23762AF08();
  return sub_23764A840();
}

uint64_t sub_23762A150()
{
  sub_23762AF08();
  return sub_23764A84C();
}

uint64_t sub_23762A178@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  char v6;

  result = sub_23762A998(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_23762A1A4(_QWORD *a1)
{
  uint64_t v1;

  return sub_237629C8C(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_23762A1C0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = 0x61727473746F6F42;
  if (*(_BYTE *)(v0 + 16) != 1)
    v1 = 0x6369736142;
  if (*(_BYTE *)(v0 + 16))
    return v1;
  else
    return 0x747365676944;
}

uint64_t sub_23762A218(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;

  if ((a2 & 0x2000000000000000) != 0)
    v7 = HIBYTE(a2) & 0xF;
  else
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (a1 == a5 && a2 == a6 && !(a3 >> 16) && v7 == a4 >> 16)
    return 1;
  else
    return sub_23764A768() & 1;
}

uint64_t sub_23762A280(void *a1)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  id v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009F0);
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009F8);
  MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800A00);
  v48 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800A08);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800A10);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800A18);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v49 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (void *)sub_23764A384();
  v19 = objc_msgSend(a1, sel_valueForHTTPHeaderField_, v18);

  if (v19)
  {
    v41 = v6;
    v43 = a1;
    v20 = sub_23764A3A8();
    v22 = v21;

    v54 = v20;
    v55 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800A20);
    sub_23764A1D4();
    sub_23762B14C();
    sub_23762B1D4(&qword_256800A30, &qword_256800A08);
    sub_23764A36C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    {
      swift_bridgeObjectRelease();

      sub_237626E98((uint64_t)v14, &qword_256800A10);
      return 0;
    }
    v24 = v49;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v49, v14, v15);
    v54 = v20;
    v55 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800A38);
    v25 = v44;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256800A40, &qword_2568009F0);
    v26 = (uint64_t)v47;
    v27 = v46;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v25, v27);
    swift_bridgeObjectRelease();
    v28 = v48;
    v29 = v41;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v26, 1, v41) == 1)
    {

      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v15);
      sub_237626E98(v26, &qword_2568009F8);
      return 0;
    }
    v46 = v16;
    v30 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v42, v26, v29);
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v31 = v54;
    v32 = v55;
    v33 = v24;
    v35 = v56;
    v34 = v57;
    v36 = sub_23762A218(0x6369736142, 0xE500000000000000, v54, v55, v56, v57);
    v37 = v43;
    if ((v36 & 1) != 0)
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v15);
      return 0;
    }
    else
    {
      v38 = sub_23762A218(0x747365676944, 0xE600000000000000, v31, v32, v35, v34);
      swift_bridgeObjectRelease();
      if ((v38 & 1) == 0)
      {

        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v15);
        return 0;
      }
      swift_getKeyPath();
      sub_23764A1E0();
      swift_release();
      v23 = MEMORY[0x23B816910](v50, v51, v52, v53);
      swift_bridgeObjectRelease();
      sub_23764A48C();

      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v15);
    }
  }
  else
  {

    return 0;
  }
  return v23;
}

uint64_t sub_23762A848(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6369736162 && a2 == 0xE500000000000000;
  if (v2 || (sub_23764A780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747365676964 && a2 == 0xE600000000000000 || (sub_23764A780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61727473746F6F62 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23764A780();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23762A998(_QWORD *a1)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800988);
  v3 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  v35 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v38 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800990);
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800998);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009A0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v39 = a1;
  v15 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, v14);
  sub_23762AE80();
  v16 = v40;
  sub_23764A810();
  if (!v16)
  {
    v32 = v6;
    v17 = v37;
    v18 = v38;
    v40 = v11;
    v19 = sub_23764A744();
    v20 = (char *)v19;
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      if (*(_BYTE *)(v19 + 32))
      {
        if (*(_BYTE *)(v19 + 32) == 1)
        {
          v42 = 1;
          sub_23762AF08();
          sub_23764A720();
          v21 = v10;
          v22 = v33;
          v15 = sub_23764A738();
          v23 = v40;
          (*(void (**)(char *, uint64_t))(v36 + 8))(v17, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v21);
        }
        else
        {
          v43 = 2;
          sub_23762AEC4();
          sub_23764A720();
          v36 = v10;
          v37 = v20;
          v27 = v34;
          v28 = sub_23764A738();
          v29 = v40;
          v15 = v28;
          (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v27);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v36);
        }
      }
      else
      {
        v41 = 0;
        sub_23762AF4C();
        sub_23764A720();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v32);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v10);
        v15 = 0;
      }
    }
    else
    {
      v24 = sub_23764A690();
      swift_allocError();
      v26 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568009B0);
      v15 = (uint64_t)v13;
      *v26 = &type metadata for HTTPAuthenticationScheme;
      sub_23764A72C();
      sub_23764A684();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v10);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  return v15;
}

unint64_t sub_23762AE80()
{
  unint64_t result;

  result = qword_2568009A8;
  if (!qword_2568009A8)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DA8C, &type metadata for HTTPAuthenticationScheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568009A8);
  }
  return result;
}

unint64_t sub_23762AEC4()
{
  unint64_t result;

  result = qword_2568009B8;
  if (!qword_2568009B8)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DA3C, &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568009B8);
  }
  return result;
}

unint64_t sub_23762AF08()
{
  unint64_t result;

  result = qword_2568009C0;
  if (!qword_2568009C0)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D9EC, &type metadata for HTTPAuthenticationScheme.DigestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568009C0);
  }
  return result;
}

unint64_t sub_23762AF4C()
{
  unint64_t result;

  result = qword_2568009C8;
  if (!qword_2568009C8)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D99C, &type metadata for HTTPAuthenticationScheme.BasicCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568009C8);
  }
  return result;
}

uint64_t sub_23762AF90(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v12;
  char v14;
  id v15;
  void *v16;

  v2 = objc_msgSend(a1, sel_protectionSpace);
  v3 = objc_msgSend(v2, sel_authenticationMethod);
  v4 = sub_23764A3A8();
  v6 = v5;

  if (sub_23764A3A8() == v4 && v7 == v6)
  {

    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v9 = sub_23764A780();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    if (sub_23764A3A8() == v4 && v12 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v14 = sub_23764A780();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        goto LABEL_19;
    }
    v15 = objc_msgSend(v2, sel_realm);
    if (v15)
    {
      v16 = v15;
      v10 = sub_23764A3A8();

      sub_23764A48C();
      return v10;
    }
LABEL_19:

    return 0;
  }

LABEL_8:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_23762B14C()
{
  unint64_t result;

  result = qword_256800A28;
  if (!qword_256800A28)
  {
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256800A28);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8170F0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23762B1D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE7460], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HTTPAuthenticationScheme.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPAuthenticationScheme.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23762B2F0 + 4 * byte_23764D5E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23762B324 + 4 * byte_23764D5E0[v4]))();
}

uint64_t sub_23762B324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23762B32C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23762B334);
  return result;
}

uint64_t sub_23762B340(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23762B348);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23762B34C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23762B354(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.CodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.CodingKeys;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.BasicCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.BasicCodingKeys;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.DigestCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.DigestCodingKeys;
}

uint64_t _s15CTLazuliSupport24HTTPAuthenticationSchemeO16DigestCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23762B3D8 + 4 * byte_23764D5EA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23762B3F8 + 4 * byte_23764D5EF[v4]))();
}

_BYTE *sub_23762B3D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23762B3F8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23762B400(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23762B408(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23762B410(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23762B418(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HTTPAuthenticationScheme.BootstrapCodingKeys()
{
  return &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys;
}

unint64_t sub_23762B438()
{
  unint64_t result;

  result = qword_256800A48;
  if (!qword_256800A48)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D7B4, &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A48);
  }
  return result;
}

unint64_t sub_23762B480()
{
  unint64_t result;

  result = qword_256800A50;
  if (!qword_256800A50)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D86C, &type metadata for HTTPAuthenticationScheme.DigestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A50);
  }
  return result;
}

unint64_t sub_23762B4C8()
{
  unint64_t result;

  result = qword_256800A58;
  if (!qword_256800A58)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D974, &type metadata for HTTPAuthenticationScheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A58);
  }
  return result;
}

unint64_t sub_23762B510()
{
  unint64_t result;

  result = qword_256800A60;
  if (!qword_256800A60)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D894, &type metadata for HTTPAuthenticationScheme.BasicCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A60);
  }
  return result;
}

unint64_t sub_23762B558()
{
  unint64_t result;

  result = qword_256800A68;
  if (!qword_256800A68)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D8BC, &type metadata for HTTPAuthenticationScheme.BasicCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A68);
  }
  return result;
}

unint64_t sub_23762B5A0()
{
  unint64_t result;

  result = qword_256800A70;
  if (!qword_256800A70)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D7DC, &type metadata for HTTPAuthenticationScheme.DigestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A70);
  }
  return result;
}

unint64_t sub_23762B5E8()
{
  unint64_t result;

  result = qword_256800A78;
  if (!qword_256800A78)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D804, &type metadata for HTTPAuthenticationScheme.DigestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A78);
  }
  return result;
}

unint64_t sub_23762B630()
{
  unint64_t result;

  result = qword_256800A80;
  if (!qword_256800A80)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D724, &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A80);
  }
  return result;
}

unint64_t sub_23762B678()
{
  unint64_t result;

  result = qword_256800A88;
  if (!qword_256800A88)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D74C, &type metadata for HTTPAuthenticationScheme.BootstrapCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A88);
  }
  return result;
}

unint64_t sub_23762B6C0()
{
  unint64_t result;

  result = qword_256800A90;
  if (!qword_256800A90)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D8E4, &type metadata for HTTPAuthenticationScheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A90);
  }
  return result;
}

unint64_t sub_23762B708()
{
  unint64_t result;

  result = qword_256800A98;
  if (!qword_256800A98)
  {
    result = MEMORY[0x23B8170FC](&unk_23764D90C, &type metadata for HTTPAuthenticationScheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800A98);
  }
  return result;
}

void sub_23762B750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];
  unint64_t v7;
  unint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  sub_23764A660();
  swift_bridgeObjectRelease();
  v7 = 0xD000000000000011;
  v8 = 0x800000023764B390;
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  strcpy((char *)v6, ", realm=\"");
  WORD1(v6[1]) = 0;
  HIDWORD(v6[1]) = -385875968;
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  sub_23764A438();
  swift_bridgeObjectRelease();
  strcpy((char *)v6, ", uri=\"");
  v6[1] = 0xE700000000000000;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 128));
  sub_237649FB8();
  v4 = sub_23764A120();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
  {
    sub_237630FE8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    sub_23764A438();
    swift_bridgeObjectRelease();
    sub_23764A438();
    sub_23764A438();
    swift_bridgeObjectRelease();
    strcpy((char *)v6, ", response=\"");
    BYTE5(v6[1]) = 0;
    HIWORD(v6[1]) = -5120;
    sub_23762BC98();
    sub_23764A438();
    swift_bridgeObjectRelease();
    sub_23764A438();
    sub_23764A438();
    swift_bridgeObjectRelease();
    strcpy((char *)v6, ", algorithm=");
    BYTE5(v6[1]) = 0;
    HIWORD(v6[1]) = -5120;
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x23762BC88);
}

uint64_t sub_23762BC98()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = sub_23762BF28();
  v3 = v2;
  sub_23762C108();
  swift_bridgeObjectRetain();
  sub_23764A438();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23764DAE0;
  v5 = *(_QWORD *)(v0 + 144);
  v6 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = v5;
  sub_23764A3C0();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23764A438();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23764A438();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23764A438();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23764A438();
    sub_23764A438();
    swift_bridgeObjectRelease();
    v8 = sub_237639794(v1, v3);
    v10 = v9;
    v11 = sub_23762C024(v8, v9);
    sub_237626F18(v8, v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23762BF28()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = v0[9];
  v8 = v0[10];
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  v7 = sub_237639794(v6, v8);
  v9 = v1;
  v2 = v0[11];
  v3 = v0[12];
  sub_237626FF4(v2, v3);
  sub_23763678C(v2, v3);
  sub_237626F18(v2, v3);
  sub_237626FF4(v7, v9);
  v4 = sub_23762C024(v7, v9);
  sub_237626F18(v7, v9);
  sub_237626F18(v7, v9);
  return v4;
}

uint64_t sub_23762C024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = *(unsigned __int8 *)(v2 + 32);
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      sub_2376415B4(a1, a2);
    }
    else
    {
      sub_237641948(a1, a2);
      sub_23762C288(32, v6, v7);
      sub_2376394EC(v12, v13);
    }
  }
  else
  {
    sub_237641CDC(a1, a2);
  }
  v8 = v4;
  v9 = v5;
  sub_2376310A8(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA8);
  sub_23762C554();
  v10 = sub_23764A378();
  swift_bridgeObjectRelease();
  sub_237626F18(v8, v9);
  return v10;
}

uint64_t sub_23762C108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v12 = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 128));
  sub_237649F58();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 128));
  sub_237649FB8();
  v4 = sub_23764A120();
  v5 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_237630FE8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    sub_23764A438();
    swift_bridgeObjectRelease();
    v7 = sub_237639794(v11, v12);
    v9 = v8;
    v10 = sub_23762C024(v7, v8);
    sub_237626F18(v7, v9);
    return v10;
  }
  return result;
}

void sub_23762C288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x23762C3D8);
}

uint64_t sub_23762C408(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x23762C468);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_23762C420 + dword_23762C46C[a4 >> 62]))(v5);
}

uint64_t sub_23762C47C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_23762C48C + dword_23762C534[a4 >> 62]))();
}

uint64_t sub_23762C4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x23762C52CLL);
  }
  return ((uint64_t (*)(void))((char *)&loc_23762C4DC + dword_23762C544[a3]))();
}

unint64_t sub_23762C554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256800AB0;
  if (!qword_256800AB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256800AA8);
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_256800AB0);
  }
  return result;
}

uint64_t destroy for HTTPDigestAuthenticateResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237626F18(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  v9 = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237626FF4(v8, v9);
  *(_QWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 96) = v9;
  v10 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 104, a2 + 104);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 88);
  v5 = *(_QWORD *)(a2 + 96);
  sub_237626FF4(v4, v5);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 88) = v4;
  *(_QWORD *)(a1 + 96) = v5;
  sub_237626F18(v6, v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for HTTPDigestAuthenticateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  sub_237626F18(v8, v9);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAuthenticateResponse(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 168))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPDigestAuthenticateResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 168) = 1;
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
    *(_BYTE *)(result + 168) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAuthenticateResponse()
{
  return &type metadata for HTTPDigestAuthenticateResponse;
}

BOOL static SubscriptionID.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SubscriptionID.hash(into:)()
{
  return sub_23764A7F8();
}

BOOL sub_23762CA04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23762CA24()
{
  _BYTE *v0;

  if (*v0)
    return 7305076;
  else
    return 6647407;
}

uint64_t sub_23762CA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23762D6E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_23762CA6C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23762CA78()
{
  sub_23762CD3C();
  return sub_23764A840();
}

uint64_t sub_23762CAA0()
{
  sub_23762CD3C();
  return sub_23764A84C();
}

uint64_t sub_23762CAC8()
{
  sub_23762CDC4();
  return sub_23764A840();
}

uint64_t sub_23762CAF0()
{
  sub_23762CDC4();
  return sub_23764A84C();
}

uint64_t sub_23762CB18()
{
  sub_23762CD80();
  return sub_23764A840();
}

uint64_t sub_23762CB40()
{
  sub_23762CD80();
  return sub_23764A84C();
}

uint64_t SubscriptionID.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AB8);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AC0);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AC8);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23762CD3C();
  sub_23764A81C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23762CD80();
    sub_23764A750();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23762CDC4();
    sub_23764A750();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23762CD3C()
{
  unint64_t result;

  result = qword_256800AD0;
  if (!qword_256800AD0)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DE4C, &type metadata for SubscriptionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800AD0);
  }
  return result;
}

unint64_t sub_23762CD80()
{
  unint64_t result;

  result = qword_256800AD8;
  if (!qword_256800AD8)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DDFC, &type metadata for SubscriptionID.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800AD8);
  }
  return result;
}

unint64_t sub_23762CDC4()
{
  unint64_t result;

  result = qword_256800AE0;
  if (!qword_256800AE0)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DDAC, &type metadata for SubscriptionID.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800AE0);
  }
  return result;
}

uint64_t SubscriptionID.hashValue.getter()
{
  sub_23764A7EC();
  sub_23764A7F8();
  return sub_23764A804();
}

uint64_t SubscriptionID.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AE8);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AF0);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800AF8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23762CD3C();
  v11 = v33;
  sub_23764A810();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23764A744();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23764A690();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568009B0);
    *v21 = &type metadata for SubscriptionID;
    sub_23764A72C();
    sub_23764A684();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23762CD80();
    sub_23764A720();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23762CDC4();
    v22 = v6;
    sub_23764A720();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_23762D1A4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SubscriptionID.init(from:)(a1, a2);
}

uint64_t sub_23762D1B8(_QWORD *a1)
{
  return SubscriptionID.encode(to:)(a1);
}

uint64_t SubscriptionID.init(ctSubscriptionSlot:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  if (result == 2)
    v2 = 1;
  else
    v2 = 2;
  if (result == 1)
    v2 = 0;
  *a2 = v2;
  return result;
}

void SubscriptionID.init(ctServiceDescriptor:)(void *a1@<X0>, char *a2@<X8>)
{
  id v4;
  id v5;
  char v6;

  if (objc_msgSend(a1, sel_domain) == (id)1)
  {
    v4 = objc_msgSend(a1, sel_instance);
    v5 = objc_msgSend(v4, sel_integerValue);

    if (v5 == (id)2)
      v6 = 1;
    else
      v6 = 2;
    if (v5 == (id)1)
      v6 = 0;
  }
  else
  {

    v6 = 2;
  }
  *a2 = v6;
}

void SubscriptionID.init(ctSubscriptionContext:)(void *a1@<X0>, char *a2@<X8>)
{
  id v4;
  char v5;

  v4 = objc_msgSend(a1, sel_slotID);

  if (v4 == (id)2)
  {
    v5 = 1;
  }
  else if (v4 == (id)1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 2;
  }
  *a2 = v5;
}

uint64_t SubscriptionID.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 7305076;
  else
    return 6647407;
}

unint64_t sub_23762D308()
{
  unint64_t result;

  result = qword_256800B00;
  if (!qword_256800B00)
  {
    result = MEMORY[0x23B8170FC](&protocol conformance descriptor for SubscriptionID, &type metadata for SubscriptionID);
    atomic_store(result, (unint64_t *)&qword_256800B00);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionID()
{
  return &type metadata for SubscriptionID;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s15CTLazuliSupport14SubscriptionIDOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23762D440 + 4 * byte_23764DB29[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23762D474 + 4 * byte_23764DB24[v4]))();
}

uint64_t sub_23762D474(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23762D47C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23762D484);
  return result;
}

uint64_t sub_23762D490(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23762D498);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23762D49C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23762D4A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23762D4B0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionID.CodingKeys()
{
  return &type metadata for SubscriptionID.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionID.OneCodingKeys()
{
  return &type metadata for SubscriptionID.OneCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionID.TwoCodingKeys()
{
  return &type metadata for SubscriptionID.TwoCodingKeys;
}

unint64_t sub_23762D4F0()
{
  unint64_t result;

  result = qword_256800B08;
  if (!qword_256800B08)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DD84, &type metadata for SubscriptionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B08);
  }
  return result;
}

unint64_t sub_23762D538()
{
  unint64_t result;

  result = qword_256800B10;
  if (!qword_256800B10)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DCA4, &type metadata for SubscriptionID.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B10);
  }
  return result;
}

unint64_t sub_23762D580()
{
  unint64_t result;

  result = qword_256800B18;
  if (!qword_256800B18)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DCCC, &type metadata for SubscriptionID.OneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B18);
  }
  return result;
}

unint64_t sub_23762D5C8()
{
  unint64_t result;

  result = qword_256800B20;
  if (!qword_256800B20)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DC54, &type metadata for SubscriptionID.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B20);
  }
  return result;
}

unint64_t sub_23762D610()
{
  unint64_t result;

  result = qword_256800B28;
  if (!qword_256800B28)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DC7C, &type metadata for SubscriptionID.TwoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B28);
  }
  return result;
}

unint64_t sub_23762D658()
{
  unint64_t result;

  result = qword_256800B30;
  if (!qword_256800B30)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DCF4, &type metadata for SubscriptionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B30);
  }
  return result;
}

unint64_t sub_23762D6A0()
{
  unint64_t result;

  result = qword_256800B38;
  if (!qword_256800B38)
  {
    result = MEMORY[0x23B8170FC](&unk_23764DD1C, &type metadata for SubscriptionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256800B38);
  }
  return result;
}

uint64_t sub_23762D6E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 6647407 && a2 == 0xE300000000000000;
  if (v2 || (sub_23764A780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7305076 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23764A780();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23762D7C4(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)(v2 + 152) = v1;
  v4 = sub_237649F4C();
  *(_QWORD *)(v2 + 160) = v4;
  *(_QWORD *)(v2 + 168) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  *(_BYTE *)(v2 + 196) = *a1;
  return swift_task_switch();
}

uint64_t sub_23762D864()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[19];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23762D92C;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_23762DFF8;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_getSubscriptionInfo_, v3);
  return swift_continuation_await();
}

uint64_t sub_23762D92C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23762D9D0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend(v1, sel_subscriptions);
  if (!v2)
    goto LABEL_27;
  v3 = v2;
  sub_23762E39C();
  v4 = sub_23764A4EC();

  if (v4 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v5 = sub_23764A6E4();
    if (v5)
      goto LABEL_4;
    goto LABEL_26;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v5)
  {
LABEL_26:
    swift_bridgeObjectRelease_n();
LABEL_27:
    if (qword_256800620 != -1)
      swift_once();
    v25 = sub_23764A270();
    __swift_project_value_buffer(v25, (uint64_t)qword_256800B40);
    v26 = sub_23764A258();
    v27 = sub_23764A594();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = *(unsigned __int8 *)(v0 + 196);
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      *(_DWORD *)v29 = 136315138;
      v35[0] = v30;
      if (v28)
        v31 = 7305076;
      else
        v31 = 6647407;
      *(_QWORD *)(v0 + 136) = sub_237626560(v31, 0xE300000000000000, v35);
      sub_23764A600();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23761E000, v26, v27, "Failed to fetch subscription: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v30, -1, -1);
      MEMORY[0x23B817198](v29, -1, -1);
    }

    v33 = *(_QWORD *)(v0 + 168);
    v32 = *(_QWORD *)(v0 + 176);
    v34 = *(_QWORD *)(v0 + 160);
    *(_DWORD *)(v0 + 192) = 22;
    sub_23762E084(MEMORY[0x24BEE4AF8]);
    sub_23762E354();
    sub_23764A078();
    sub_237649F40();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    swift_willThrow();
    goto LABEL_35;
  }
LABEL_4:
  v6 = 0;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0)
      v7 = (id)MEMORY[0x23B816B98](v6, v4);
    else
      v7 = *(id *)(v4 + 8 * v6 + 32);
    v8 = v7;
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    v10 = objc_msgSend(v7, sel_slotID);
    if (v10 != (id)2)
      break;
    if ((*(_BYTE *)(v0 + 196) & 1) != 0)
      goto LABEL_14;
LABEL_6:

    ++v6;
    if (v9 == v5)
      goto LABEL_26;
  }
  if (v10 != (id)1 || (*(_BYTE *)(v0 + 196) & 1) != 0)
    goto LABEL_6;
LABEL_14:
  swift_bridgeObjectRelease_n();
  if (qword_256800620 != -1)
    swift_once();
  v11 = sub_23764A270();
  __swift_project_value_buffer(v11, (uint64_t)qword_256800B40);
  v12 = sub_23764A258();
  v13 = sub_23764A57C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = *(unsigned __int8 *)(v0 + 196);
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_DWORD *)v15 = 136315138;
    v35[0] = v16;
    if (v14)
      v17 = 7305076;
    else
      v17 = 6647407;
    *(_QWORD *)(v0 + 128) = sub_237626560(v17, 0xE300000000000000, v35);
    sub_23764A600();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23761E000, v12, v13, "Fetching system configuration for subscription %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v16, -1, -1);
    MEMORY[0x23B817198](v15, -1, -1);
  }

  v18 = *(void **)(v0 + 152);
  *(_QWORD *)(v0 + 144) = 0;
  v19 = objc_msgSend(v18, sel_getSystemConfiguration_withError_, v8, v0 + 144);
  v20 = *(void **)(v0 + 144);
  if (v19)
  {
    v21 = v19;
    v22 = v20;

    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v21);
  }
  v24 = v20;
  sub_23764A090();

  swift_willThrow();
LABEL_35:

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23762DF18()
{
  uint64_t v0;

  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23762DF84()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256800B40);
  __swift_project_value_buffer(v0, (uint64_t)qword_256800B40);
  return sub_23764A264();
}

uint64_t sub_23762DFF8(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256800B80);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_23762E084(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800B70);
  v2 = sub_23764A6F0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23762E3D8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23762E1AC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23762E420(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23762E1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23764A7EC();
  sub_23764A408();
  v4 = sub_23764A804();
  return sub_23762E210(a1, a2, v4);
}

unint64_t sub_23762E210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_23764A780() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_23764A780() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_23764A780() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_23762E354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256800B60;
  if (!qword_256800B60)
  {
    v1 = sub_237649F4C();
    result = MEMORY[0x23B8170FC](MEMORY[0x24BDCAFD8], v1);
    atomic_store(result, (unint64_t *)&qword_256800B60);
  }
  return result;
}

unint64_t sub_23762E39C()
{
  unint64_t result;

  result = qword_256800B68;
  if (!qword_256800B68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256800B68);
  }
  return result;
}

uint64_t sub_23762E3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23762E420(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23762E430()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256800B90);
  __swift_project_value_buffer(v0, (uint64_t)qword_256800B90);
  return sub_23764A264();
}

uint64_t sub_23762E5F8(void *a1, void *a2, void *a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t);

  v5[4] = a3;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = _Block_copy(aBlock);
  v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256800C20 + dword_256800C20);
  v10 = a1;
  v11 = a2;
  v12 = a3;
  a5;
  v13 = (_QWORD *)swift_task_alloc();
  v5[7] = v13;
  *v13 = v5;
  v13[1] = sub_23762E6AC;
  return v15((uint64_t)v11, (uint64_t)v12);
}

uint64_t sub_23762E6AC(uint64_t a1, void *a2)
{
  uint64_t *v2;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v2 + 48);
  v7 = *(void **)(*v2 + 32);
  v6 = *(void **)(*v2 + 40);
  v9 = *(void **)(*v2 + 16);
  v8 = *(void **)(*v2 + 24);
  v11 = *v2;
  swift_task_dealloc();

  ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  return (*(uint64_t (**)(void))(v11 + 8))();
}

id sub_23762E778()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthTaskDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthTaskDelegate()
{
  return objc_opt_self();
}

uint64_t sub_23762E7DC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_23762E820()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_237628B0C;
  return ((uint64_t (*)(void *, void *, void *, void *, void *))((char *)&dword_256800BE0 + dword_256800BE0))(v2, v3, v4, v5, v6);
}

uint64_t sub_23762E8A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2376299E0;
  return v6();
}

uint64_t sub_23762E8F8()
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
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2376299E0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256800BF0 + dword_256800BF0))(v2, v3, v4);
}

uint64_t sub_23762E970(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2376299E0;
  return v7();
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23762E9F4(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2376299E0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256800C00 + dword_256800C00))(a1, v4, v5, v6);
}

uint64_t sub_23762EA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23764A558();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23764A54C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23762EBBC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23764A51C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23762EBBC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800BD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23762EBFC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23762EC60;
  return v6(a1);
}

uint64_t sub_23762EC60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23762ECAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23762ECD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_237628B0C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256800C10 + dword_256800C10))(a1, v4);
}

uint64_t sub_23762ED40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_23762ED5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t (*v10)(_QWORD, uint64_t, uint64_t, uint64_t);

  v1 = sub_23762AF90(*(id *)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = v2;
  *(_BYTE *)(v0 + 80) = v3;
  if ((_BYTE)v3 == 0xFF)
  {
    v7 = 1;
    return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v7, 0);
  }
  v4 = v1;
  v5 = v2;
  v6 = v3;
  if (objc_msgSend(*(id *)(v0 + 32), sel_previousFailureCount))
  {
    sub_23762F0C0(v4, v5, v6);
    v7 = 2;
    return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v7, 0);
  }
  v10 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)(v0 + 40)
                                                                             + OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler)
                                                                  + *(_QWORD *)(*(_QWORD *)(v0 + 40)
                                                                              + OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v9;
  *v9 = v0;
  v9[1] = sub_23762EE5C;
  return v10(*(_QWORD *)(v0 + 24), v4, v5, v6);
}

uint64_t sub_23762EE5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 72) = v1;
  swift_task_dealloc();
  sub_23762F0C0(*(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56), *(_BYTE *)(v4 + 80));
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(_QWORD, uint64_t))(v4 + 8))(0, a1);
}

uint64_t sub_23762EEEC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  if (qword_256800628 != -1)
    swift_once();
  v1 = *(void **)(v0 + 72);
  v2 = sub_23764A270();
  __swift_project_value_buffer(v2, (uint64_t)qword_256800B90);
  v3 = v1;
  v4 = v1;
  v5 = sub_23764A258();
  v6 = sub_23764A594();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 72);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_23764A600();
    *v10 = v12;

    _os_log_impl(&dword_23761E000, v5, v6, "Failed to perform authentication: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v10, -1, -1);
    MEMORY[0x23B817198](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(2, 0);
}

uint64_t sub_23762F0C0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_237629A14(a1, a2, a3);
  return a1;
}

uint64_t sub_23762F0D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_237620210;
  return sub_23764A570();
}

id sub_23762F138()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)sub_237649F88();
  v3 = objc_msgSend(v1, sel_downloadTaskWithRequest_, v2);

  return v3;
}

uint64_t sub_23762F188(unsigned int a1)
{
  char v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = a1 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23764DF30;
  *(_BYTE *)(v3 + 32) = v2;
  *(_BYTE *)(v3 + 33) = v1;
  v4 = sub_23763C164(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t FileDownloadResult.output.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23762F208(v1, a1);
}

uint64_t sub_23762F208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for FileDownloadResult.Output(uint64_t a1)
{
  return sub_237628988(a1, qword_256800E08);
}

uint64_t FileDownloadResult.suggestedFileName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for FileDownloadResult(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for FileDownloadResult(uint64_t a1)
{
  return sub_237628988(a1, (uint64_t *)&unk_256800D50);
}

uint64_t FileDownloadResult.utType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for FileDownloadResult(0) + 24);
  return sub_23762F2E0(v3, a1);
}

uint64_t sub_23762F2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FileDownloadResult.outputFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23762F208(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23764A120();
    v8 = *(_QWORD *)(v7 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v6, v7);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  else
  {
    sub_23762F414((uint64_t)v6);
    v10 = sub_23764A120();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
}

uint64_t sub_23762F414(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FileDownloadResult.Output(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FileDownloadResult.outputData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v1 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23762F208(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() != 1)
    return *(_QWORD *)v3;
  sub_23762F414((uint64_t)v3);
  return 0;
}

uint64_t FileDownloadResult.fileData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v1 = type metadata accessor for FileDownloadResult.Output(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23762F208(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() != 1)
    return *(_QWORD *)v3;
  sub_23762F414((uint64_t)v3);
  return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;

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
    type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23764A120();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      v9 = *a2;
      v10 = a2[1];
      sub_237626FF4(*a2, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    swift_storeEnumTagMultiPayload();
    v11 = *(int *)(a3 + 20);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = (char *)a1 + v12;
    v17 = (char *)a2 + v12;
    v18 = sub_23764A228();
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    swift_bridgeObjectRetain();
    if (v20(v17, 1, v18))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for FileDownloadResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23764A120();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    sub_237626F18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  }
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_23764A228();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t *initializeWithCopy for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;

  type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23764A120();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_237626FF4(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
  }
  swift_storeEnumTagMultiPayload();
  v9 = *(int *)(a3 + 20);
  v10 = *(int *)(a3 + 24);
  v11 = (uint64_t *)((char *)a1 + v9);
  v12 = (uint64_t *)((char *)a2 + v9);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = (char *)a1 + v10;
  v15 = (char *)a2 + v10;
  v16 = sub_23764A228();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  if (v18(v15, 1, v16))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t *assignWithCopy for FileDownloadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_23762F414((uint64_t)a1);
    type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23764A120();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v7 = *a2;
      v8 = a2[1];
      sub_237626FF4(*a2, v8);
      *a1 = v7;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = *(int *)(a3 + 20);
  v10 = (uint64_t *)((char *)a1 + v9);
  v11 = (uint64_t *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_23764A228();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *initializeWithTake for FileDownloadResult(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for FileDownloadResult.Output(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23764A120();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23764A228();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithTake for FileDownloadResult(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;

  if (a1 != a2)
  {
    sub_23762F414((uint64_t)a1);
    v6 = type metadata accessor for FileDownloadResult.Output(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23764A120();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_23764A228();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_10;
  }
  if (v20)
  {
LABEL_10:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloadResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23762FD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;

  v6 = type metadata accessor for FileDownloadResult.Output(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 2147483646)
  {
    v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF)
      LODWORD(v9) = -1;
    v10 = v9 - 1;
    if (v10 < 0)
      v10 = -1;
    return (v10 + 1);
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for FileDownloadResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23762FE60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for FileDownloadResult.Output(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23762FF0C()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for FileDownloadResult.Output(319);
  if (v0 <= 0x3F)
  {
    sub_23762FF98();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23762FF98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256800D60)
  {
    sub_23764A228();
    v0 = sub_23764A5D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256800D60);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23764A120();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v9 = *a2;
      v8 = a2[1];
      sub_237626FF4(v9, v8);
      *a1 = v9;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for FileDownloadResult.Output(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() != 1)
    return sub_237626F18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  v2 = sub_23764A120();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t *initializeWithCopy for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23764A120();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v6 = *a2;
    v5 = a2[1];
    sub_237626FF4(v6, v5);
    *a1 = v6;
    a1[1] = v5;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for FileDownloadResult.Output(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23762F414((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_23764A120();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      v6 = *a2;
      v5 = a2[1];
      sub_237626FF4(v6, v5);
      *a1 = v6;
      a1[1] = v5;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for FileDownloadResult.Output(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23764A120();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for FileDownloadResult.Output(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23762F414((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23764A120();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDownloadResult.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for FileDownloadResult.Output(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_237630384()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_237630394()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23764A120();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void sub_237630404()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  _QWORD v25[3];

  v1 = (void *)sub_23764A384();
  v2 = objc_msgSend(v0, sel_valueForHTTPHeaderField_, v1);

  if (v2)
  {
    v3 = sub_23764A3A8();
    v5 = v4;

    v6 = HIBYTE(v5) & 0xF;
    v7 = v3 & 0xFFFFFFFFFFFFLL;
    if ((v5 & 0x2000000000000000) != 0)
      v8 = HIBYTE(v5) & 0xF;
    else
      v8 = v3 & 0xFFFFFFFFFFFFLL;
    if (v8)
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        sub_2376307CC(v3, v5, 10);
LABEL_44:
        swift_bridgeObjectRelease();
        return;
      }
      if ((v5 & 0x2000000000000000) == 0)
      {
        if ((v3 & 0x1000000000000000) != 0)
          v9 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v9 = (unsigned __int8 *)sub_23764A69C();
        sub_2376308B0(v9, v7, 10);
        goto LABEL_44;
      }
      v25[0] = v3;
      v25[1] = v5 & 0xFFFFFFFFFFFFFFLL;
      if (v3 == 43)
      {
        if (v6)
        {
          if (v6 != 1 && (BYTE1(v3) - 48) <= 9u && v6 != 2 && (BYTE2(v3) - 48) <= 9u)
          {
            v10 = 10 * (BYTE1(v3) - 48) + (BYTE2(v3) - 48);
            v11 = v6 - 3;
            if (v11)
            {
              v12 = (unsigned __int8 *)v25 + 3;
              do
              {
                v13 = *v12 - 48;
                if (v13 > 9)
                  break;
                v14 = 10 * v10;
                if ((unsigned __int128)(v10 * (__int128)10) >> 64 != (10 * v10) >> 63)
                  break;
                v10 = v14 + v13;
                if (__OFADD__(v14, v13))
                  break;
                ++v12;
                --v11;
              }
              while (v11);
            }
          }
          goto LABEL_44;
        }
      }
      else
      {
        if (v3 != 45)
        {
          if (v6)
          {
            if ((v3 - 48) <= 9u && v6 != 1 && (BYTE1(v3) - 48) <= 9u)
            {
              v15 = 10 * (v3 - 48) + (BYTE1(v3) - 48);
              v16 = v6 - 2;
              if (v16)
              {
                v17 = (unsigned __int8 *)v25 + 2;
                do
                {
                  v18 = *v17 - 48;
                  if (v18 > 9)
                    break;
                  v19 = 10 * v15;
                  if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63)
                    break;
                  v15 = v19 + v18;
                  if (__OFADD__(v19, v18))
                    break;
                  ++v17;
                  --v16;
                }
                while (v16);
              }
            }
          }
          goto LABEL_44;
        }
        if (v6)
        {
          if (v6 != 1 && (BYTE1(v3) - 48) <= 9u && v6 != 2 && (BYTE2(v3) - 48) <= 9u)
          {
            v20 = -10 * (BYTE1(v3) - 48) - (BYTE2(v3) - 48);
            v21 = v6 - 3;
            if (v21)
            {
              v22 = (unsigned __int8 *)v25 + 3;
              do
              {
                v23 = *v22 - 48;
                if (v23 > 9)
                  break;
                v24 = 10 * v20;
                if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63)
                  break;
                v20 = v24 - v23;
                if (__OFSUB__(v24, v23))
                  break;
                ++v22;
                --v21;
              }
              while (v21);
            }
          }
          goto LABEL_44;
        }
        __break(1u);
      }
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

_QWORD *sub_237630768(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800960);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unsigned __int8 *sub_2376307CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_23764A4B0();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_237630B2C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_23764A69C();
  }
LABEL_7:
  v11 = sub_2376308B0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2376308B0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
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
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_237630B2C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23764A4BC();
  v4 = sub_237630BA8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_237630BA8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_237630CEC(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_237630768(v9, 0);
      v12 = sub_237630DD8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x23B81691C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23B81691CLL);
LABEL_9:
      sub_23764A69C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23B81691C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_237630CEC(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_23763B5A4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_23763B5A4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_23764A468();
  }
  __break(1u);
  return result;
}

unint64_t sub_237630DD8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_23763B5A4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_23764A474();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_23764A69C();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_23763B5A4(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_23764A450();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_237630FE8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = 47;
  v7 = 47;
  v1 = sub_23764A0F0();
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    v0 = sub_23764A0F0();
    v7 = v0;
  }
  sub_23764A108();
  if (v5)
  {
    sub_23764A438();
    swift_bridgeObjectRelease();
    sub_23764A438();
    swift_bridgeObjectRelease();
    return v7;
  }
  return v0;
}

void sub_2376310A8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_237631100(uint64_t a1)
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v4 = BYTE6(v22);
  if (BYTE6(v22))
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = BYTE6(v22);
    sub_237626B58(0, BYTE6(v22), 0);
    v2 = *(_QWORD *)(v3 - 104);
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)a1;
      else
        v6 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(v3 - 136) = v22 & 0x3FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v3 - 128) = v1;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < (int)a1 || v6 >= a1 >> 32)
            goto LABEL_29;
          v7 = sub_23764A00C();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_23764A030();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(a1 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(a1 + 24))
            goto LABEL_33;
          v12 = sub_23764A00C();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_23764A030();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= BYTE6(v22))
          goto LABEL_30;
        *(_QWORD *)(v3 - 118) = a1;
        *(_WORD *)(v3 - 110) = v22;
        *(_BYTE *)(v3 - 108) = BYTE2(v22);
        *(_BYTE *)(v3 - 107) = BYTE3(v22);
        *(_BYTE *)(v3 - 106) = BYTE4(v22);
        *(_BYTE *)(v3 - 105) = BYTE5(v22);
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA0);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_23764DAE0;
      *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v14 + 32) = v11;
      v15 = sub_23764A3C0();
      v17 = v16;
      *(_QWORD *)(v3 - 104) = v2;
      v19 = *(_QWORD *)(v2 + 16);
      v18 = *(_QWORD *)(v2 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_237626B58(v18 > 1, v19 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v19 + 1;
      v20 = v2 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x237631418);
  }
  return v2;
}

void sub_237631440(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_237631480(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2376314F0 + 4 * byte_23764DFD4[a2]))(0x444D2D3176414B41);
}

uint64_t sub_2376314F0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x444D2D3176414B41 && v1 == 0xE900000000000035)
    v2 = 1;
  else
    v2 = sub_23764A780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2376315A4(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_2376315F0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2376316E0 + 4 * byte_23764DFE0[a2]))(0x6567412D72657355);
}

uint64_t sub_2376316E0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6567412D72657355 && v1 == 0xEA0000000000746ELL)
    v2 = 1;
  else
    v2 = sub_23764A780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void *sub_23763182C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_23764A6E4())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B816B98](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23763194C()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256800E40);
  __swift_project_value_buffer(v0, (uint64_t)qword_256800E40);
  return sub_23764A264();
}

unint64_t sub_2376319B8()
{
  sub_23764A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  sub_23764A438();
  sub_23764A438();
  return 0xD000000000000011;
}

uint64_t sub_237631B38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[24] = a1;
  v2[25] = v1;
  sub_23764A3D8();
  v2[26] = swift_task_alloc();
  v2[27] = type metadata accessor for GBAResult(0);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v3 = sub_237649FD0();
  v2[32] = v3;
  v2[33] = *(_QWORD *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v4 = sub_23764A120();
  v2[38] = v4;
  v2[39] = *(_QWORD *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800E60);
  v2[46] = v5;
  v2[47] = *(_QWORD *)(v5 - 8);
  v2[48] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800E68);
  v2[49] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800E70);
  v2[50] = v6;
  v2[51] = *(_QWORD *)(v6 - 8);
  v2[52] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237631D2C()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v0 + 400);
  v4 = *(_QWORD *)(v0 + 408);
  v6 = *(_QWORD *)(v0 + 384);
  v5 = *(_QWORD *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 368);
  v8 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 136) = v2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800E78);
  sub_23764A1D4();
  sub_23762B14C();
  sub_2376372E4(&qword_256800E80, &qword_256800E60, MEMORY[0x24BEE7460]);
  sub_23764A360();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
  {
    sub_237626E98(*(_QWORD *)(v0 + 392), &qword_256800E68);
    sub_237636618();
    swift_allocError();
    *v9 = 0;
    swift_willThrow();
LABEL_12:
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
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = *(_QWORD *)(v0 + 200);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 408) + 32))(*(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 400));
  sub_23764A660();
  swift_bridgeObjectRelease();
  v67 = 0x636E6D2E667362;
  v68 = 0xE700000000000000;
  swift_getKeyPath();
  sub_23764A1E0();
  swift_release();
  MEMORY[0x23B816910](*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  sub_23764A438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23764A438();
  swift_getKeyPath();
  sub_23764A1E0();
  swift_release();
  MEMORY[0x23B816910](*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  sub_23764A438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23764A438();
  v11 = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v12 = 0x7370747468;
  if (!*(_BYTE *)(v10 + *(int *)(v11 + 36)))
    v12 = 1886680168;
  v13 = 0xE500000000000000;
  if (!*(_BYTE *)(v10 + *(int *)(v11 + 36)))
    v13 = 0xE400000000000000;
  v14 = (uint64_t *)(v10 + *(int *)(v11 + 32));
  if ((v14[1] & 1) != 0)
  {
    v67 = v12;
    v68 = v13;
    sub_23764A438();
    sub_23764A438();
  }
  else
  {
    v15 = *v14;
    v67 = v12;
    v68 = v13;
    sub_23764A438();
    sub_23764A438();
    sub_23764A438();
    *(_QWORD *)(v0 + 184) = v15;
    sub_23764A774();
    sub_23764A438();
    swift_bridgeObjectRelease();
  }
  sub_23764A114();
  v17 = *(_QWORD *)(v0 + 352);
  v16 = *(_QWORD *)(v0 + 360);
  v19 = *(_QWORD *)(v0 + 304);
  v18 = *(_QWORD *)(v0 + 312);
  swift_bridgeObjectRelease();
  sub_237636670(v16, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v17, 1, v19) == 1)
  {
    v21 = *(_QWORD *)(v0 + 408);
    v20 = *(_QWORD *)(v0 + 416);
    v22 = *(_QWORD *)(v0 + 400);
    v23 = *(_QWORD *)(v0 + 352);
    v24 = *(_QWORD *)(v0 + 360);
    swift_bridgeObjectRelease();
    sub_237626E98(v23, &qword_256800710);
    sub_237636618();
    swift_allocError();
    *v25 = 1;
    swift_willThrow();
    sub_237626E98(v24, &qword_256800710);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    goto LABEL_12;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 32))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 304));
  if (qword_256800630 != -1)
    swift_once();
  v28 = *(_QWORD *)(v0 + 336);
  v27 = *(_QWORD *)(v0 + 344);
  v30 = *(_QWORD *)(v0 + 304);
  v29 = *(_QWORD *)(v0 + 312);
  v31 = sub_23764A270();
  *(_QWORD *)(v0 + 424) = __swift_project_value_buffer(v31, (uint64_t)qword_256800E40);
  v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
  v65(v28, v27, v30);
  v32 = sub_23764A258();
  v33 = sub_23764A57C();
  v34 = os_log_type_enabled(v32, v33);
  v35 = *(_QWORD *)(v0 + 336);
  v36 = *(_QWORD *)(v0 + 304);
  if (v34)
  {
    v63 = *(_QWORD *)(v0 + 312);
    v37 = (uint8_t *)swift_slowAlloc();
    v64 = swift_slowAlloc();
    v67 = v64;
    *(_DWORD *)v37 = 136315138;
    sub_2376298AC((unint64_t *)&qword_256800748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v38 = sub_23764A774();
    *(_QWORD *)(v0 + 176) = sub_237626560(v38, v39, &v67);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v40 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v40(v35, v36);
    _os_log_impl(&dword_23761E000, v32, v33, "BSF URL: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v64, -1, -1);
    MEMORY[0x23B817198](v37, -1, -1);
  }
  else
  {
    v40 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 312) + 8);
    v40(v35, v36);
  }

  *(_QWORD *)(v0 + 432) = v40;
  v41 = *(_QWORD *)(v0 + 320);
  v42 = *(_QWORD *)(v0 + 328);
  v43 = *(_QWORD *)(v0 + 296);
  v44 = *(_QWORD *)(v0 + 304);
  v45 = *(_QWORD *)(v0 + 288);
  v46 = *(_QWORD *)(v0 + 264);
  v66 = *(_QWORD *)(v0 + 256);
  v65(v42, *(_QWORD *)(v0 + 344), v44);
  v65(v41, v42, v44);
  sub_237649FAC();
  sub_23763CC88(v43);
  v40(v42, v44);
  v47 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  *(_QWORD *)(v0 + 440) = v47;
  v47(v45, v66);
  sub_237649F70();
  swift_bridgeObjectRetain();
  sub_2376319B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237649FC4();
  swift_bridgeObjectRelease();
  sub_237649FC4();
  v48 = sub_23764A258();
  v49 = sub_23764A588();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = swift_slowAlloc();
    v67 = v51;
    *(_DWORD *)v50 = 136315138;
    swift_beginAccess();
    sub_2376298AC(&qword_256800E98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
    v52 = sub_23764A774();
    *(_QWORD *)(v0 + 168) = sub_237626560(v52, v53, &v67);
    sub_23764A600();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23761E000, v48, v49, "%s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v51, -1, -1);
    MEMORY[0x23B817198](v50, -1, -1);
  }

  v54 = *(_QWORD *)(v0 + 296);
  v55 = *(_QWORD *)(v0 + 280);
  v56 = *(_QWORD *)(v0 + 256);
  v57 = *(_QWORD *)(v0 + 264);
  v58 = *(_QWORD **)(v0 + 200);
  v59 = v58[4];
  v60 = v58[5];
  __swift_project_boxed_opaque_existential_1(v58 + 1, v59);
  swift_beginAccess();
  v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  *(_QWORD *)(v0 + 448) = v61;
  v61(v55, v54, v56);
  v62 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 456) = v62;
  *v62 = v0;
  v62[1] = sub_237632748;
  return sub_237620194(*(_QWORD *)(v0 + 280), v59, v60);
}

uint64_t sub_237632748(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;

  v7 = *v4;
  *(_QWORD *)(v7 + 464) = a3;
  *(_QWORD *)(v7 + 472) = v3;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v7 + 440))(*(_QWORD *)(v7 + 280), *(_QWORD *)(v7 + 256));
  if (!v3)
    sub_237626F18(a1, a2);
  return swift_task_switch();
}

uint64_t sub_2376327D8()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(uint64_t, uint64_t);

  v1 = *(id *)(v0 + 464);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 464);
    v5 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 152) = v4;
    v6 = v4;
    sub_23764A600();
    *v24 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "%@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v24, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {

    v2 = *(NSObject **)(v0 + 464);
  }

  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();
  v8 = *(void **)(v0 + 464);
  if (v7)
  {
    v9 = (void *)v7;
    v10 = v8;
    if (objc_msgSend(v9, sel_statusCode) == (id)401)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 448))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 256));
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 480) = v11;
      *v11 = v0;
      v11[1] = sub_237632BB4;
      return sub_2376333E8(*(_QWORD *)(v0 + 248), (uint64_t)v9, *(_QWORD *)(v0 + 272));
    }
    v8 = *(void **)(v0 + 464);
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
    v14 = *(_QWORD *)(v0 + 408);
    v23 = *(_QWORD *)(v0 + 416);
    v25 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
    v22 = *(_QWORD *)(v0 + 400);
    v15 = *(_QWORD *)(v0 + 360);
    v16 = *(_QWORD *)(v0 + 344);
    v18 = *(_QWORD *)(v0 + 296);
    v17 = *(_QWORD *)(v0 + 304);
    v19 = *(_QWORD *)(v0 + 256);
    sub_237636618();
    swift_allocError();
    *v21 = 2;
    swift_willThrow();

  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
    v14 = *(_QWORD *)(v0 + 408);
    v23 = *(_QWORD *)(v0 + 416);
    v25 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
    v22 = *(_QWORD *)(v0 + 400);
    v15 = *(_QWORD *)(v0 + 360);
    v16 = *(_QWORD *)(v0 + 344);
    v18 = *(_QWORD *)(v0 + 296);
    v17 = *(_QWORD *)(v0 + 304);
    v19 = *(_QWORD *)(v0 + 256);
    sub_237636618();
    swift_allocError();
    *v20 = 2;
    swift_willThrow();
  }

  v13(v16, v17);
  sub_237626E98(v15, &qword_256800710);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v23, v22);
  v25(v18, v19);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237632BB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 488) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2 + 440))(*(_QWORD *)(v2 + 272), *(_QWORD *)(v2 + 256));
  return swift_task_switch();
}

uint64_t sub_237632C28()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t type;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  sub_237637268(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 240), type metadata accessor for GBAResult);
  v1 = sub_23764A258();
  v2 = sub_23764A588();
  if (os_log_type_enabled(v1, v2))
  {
    v4 = *(_QWORD *)(v0 + 232);
    v3 = *(_QWORD *)(v0 + 240);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v40 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_237637268(v3, v4, type metadata accessor for GBAResult);
    v7 = sub_23764A3E4();
    *(_QWORD *)(v0 + 144) = sub_237626560(v7, v8, &v40);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_2376288F4(v3, type metadata accessor for GBAResult);
    _os_log_impl(&dword_23761E000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v6, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {
    sub_2376288F4(*(_QWORD *)(v0 + 240), type metadata accessor for GBAResult);
  }

  sub_237637268(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 224), type metadata accessor for GBAResult);
  v9 = sub_23764A258();
  type = sub_23764A588();
  v10 = os_log_type_enabled(v9, type);
  v11 = *(void **)(v0 + 464);
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  v14 = *(_QWORD *)(v0 + 408);
  v13 = *(_QWORD *)(v0 + 416);
  v15 = *(_QWORD *)(v0 + 400);
  v16 = *(_QWORD *)(v0 + 360);
  v38 = *(_QWORD *)(v0 + 304);
  v39 = *(_QWORD *)(v0 + 344);
  v17 = *(_QWORD *)(v0 + 224);
  if (v10)
  {
    v36 = *(_QWORD *)(v0 + 408);
    v34 = *(_QWORD *)(v0 + 360);
    v35 = *(_QWORD *)(v0 + 400);
    v18 = (uint8_t *)swift_slowAlloc();
    v33 = v13;
    v19 = swift_slowAlloc();
    *(_DWORD *)v18 = 136315138;
    v40 = v19;
    v20 = sub_23764A12C();
    v22 = v21;
    sub_23764A3CC();
    v23 = sub_23764A3B4();
    v32 = v12;
    v25 = v24;
    sub_237626F18(v20, v22);
    if (v25)
      v26 = v23;
    else
      v26 = 0;
    if (v25)
      v27 = v25;
    else
      v27 = 0xE000000000000000;
    *(_QWORD *)(v0 + 160) = sub_237626560(v26, v27, &v40);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_2376288F4(v17, type metadata accessor for GBAResult);
    _os_log_impl(&dword_23761E000, v9, type, "Base64 KS_NAF: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v19, -1, -1);
    MEMORY[0x23B817198](v18, -1, -1);

    v32(v39, v38);
    sub_237626E98(v34, &qword_256800710);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v35);
  }
  else
  {

    sub_2376288F4(v17, type metadata accessor for GBAResult);
    v12(v39, v38);
    sub_237626E98(v16, &qword_256800710);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  v28 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
  v29 = *(_QWORD *)(v0 + 296);
  v30 = *(_QWORD *)(v0 + 256);
  sub_2376366B8(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 192));
  v28(v29, v30);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376330EC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
  v3 = *(_QWORD *)(v0 + 408);
  v2 = *(_QWORD *)(v0 + 416);
  v4 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 296);
  v7 = *(_QWORD *)(v0 + 256);
  (*(void (**)(_QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 304));
  sub_237626E98(v5, &qword_256800710);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v1(v6, v7);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23763325C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 464);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  v3 = *(_QWORD *)(v0 + 408);
  v11 = *(_QWORD *)(v0 + 416);
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
  v4 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 296);
  v7 = *(_QWORD *)(v0 + 304);
  v9 = *(_QWORD *)(v0 + 256);

  v2(v6, v7);
  sub_237626E98(v5, &qword_256800710);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v11, v4);
  v12(v8, v9);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376333E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[161] = v3;
  v4[160] = a3;
  v4[159] = a2;
  v4[158] = a1;
  v5 = sub_23764A1A4();
  v4[162] = v5;
  v4[163] = *(_QWORD *)(v5 - 8);
  v4[164] = swift_task_alloc();
  v6 = sub_237649FD0();
  v4[165] = v6;
  v4[166] = *(_QWORD *)(v6 - 8);
  v4[167] = swift_task_alloc();
  v4[168] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23763348C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  unint64_t v3;
  _BYTE *v4;

  sub_23763F140(*(id *)(v0 + 1272), v0 + 664);
  sub_237629868(v0 + 664, v0 + 592, &qword_256800EA0);
  if (*(_QWORD *)(v0 + 600))
  {
    *(_OWORD *)(v0 + 1184) = *(_OWORD *)(v0 + 592);
    *(_QWORD *)(v0 + 1352) = *(_QWORD *)(v0 + 608);
    *(_QWORD *)(v0 + 1360) = *(_QWORD *)(v0 + 616);
    v1 = *(unsigned __int8 *)(v0 + 624);
    *(_BYTE *)(v0 + 585) = v1;
    v2 = *(_OWORD *)(v0 + 641);
    *(_OWORD *)(v0 + 1104) = *(_OWORD *)(v0 + 625);
    *(_OWORD *)(v0 + 1120) = v2;
    *(_QWORD *)(v0 + 1368) = sub_23764A144();
    *(_QWORD *)(v0 + 1376) = v3;
    if (v3 >> 60 != 15)
      __asm { BR              X9 }
    sub_2376369F4(v0 + 664, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2376369A4);
  }
  sub_237636618();
  swift_allocError();
  *v4 = 2;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237633C30(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 1400) = a1;
  *(_QWORD *)(v3 + 1408) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237633CA0()
{
  uint64_t v0;
  __int128 *v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  __int128 v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  void (*v51)(uint64_t *, uint64_t, uint64_t);
  uint64_t v52[2];

  v1 = (__int128 *)(v0 + 784);
  sub_237636E70(*(id *)(v0 + 1400), (uint64_t *)(v0 + 832));
  sub_237629868(v0 + 832, v0 + 784, &qword_256800EB8);
  if (*(_QWORD *)(v0 + 792) >> 60 == 15)
  {
    v2 = *(void **)(v0 + 1400);
    v3 = *(_QWORD *)(v0 + 1376);
    v4 = *(_QWORD *)(v0 + 1368);
    sub_2376369F4(v0 + 664, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2376369A4);
    sub_237636618();
    swift_allocError();
    *v5 = 4;
    swift_willThrow();

    sub_2376370BC(v0 + 736, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
    sub_237627D84(v4, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v50 = *(_BYTE *)(v0 + 585);
    v49 = *(_QWORD *)(v0 + 1360);
    v7 = *(_QWORD *)(v0 + 1352);
    v8 = *(_QWORD *)(v0 + 1328);
    v9 = *(_QWORD *)(v0 + 1320);
    v10 = *(_QWORD *)(v0 + 1288);
    v11 = *(_QWORD *)(v0 + 1280);
    v12 = *v1;
    v13 = *(_OWORD *)(v0 + 800);
    *(_OWORD *)(v0 + 976) = *v1;
    *(_OWORD *)(v0 + 992) = v13;
    *(_OWORD *)(v0 + 1008) = *(_OWORD *)(v0 + 816);
    v14 = *(_QWORD *)(v10 + 56);
    v47 = *(_QWORD *)(v10 + 48);
    v48 = v7;
    *(_OWORD *)(v0 + 1200) = v12;
    *(_QWORD *)(v0 + 1088) = v9;
    *(_QWORD *)(v0 + 1096) = &off_2508EB568;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 1064));
    v51 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16);
    v51(boxed_opaque_existential_1, v11, v9);
    *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 1184);
    *(_QWORD *)(v0 + 200) = v48;
    *(_QWORD *)(v0 + 208) = v49;
    *(_BYTE *)(v0 + 216) = v50;
    v16 = *(_OWORD *)(v0 + 1120);
    *(_OWORD *)(v0 + 217) = *(_OWORD *)(v0 + 1104);
    *(_OWORD *)(v0 + 233) = v16;
    *(_QWORD *)(v0 + 256) = v47;
    *(_QWORD *)(v0 + 264) = v14;
    *(_OWORD *)(v0 + 272) = *(_OWORD *)(v0 + 1200);
    sub_2376297E0(v0 + 1064, v0 + 288);
    *(_QWORD *)(v0 + 328) = 1;
    sub_237636FF4(v0 + 1200);
    sub_237636FF4(v0 + 1200);
    swift_bridgeObjectRetain();
    v17 = sub_237640A80(8, 0);
    v19 = v18;
    sub_237637020(v0 + 1200);
    __swift_destroy_boxed_opaque_existential_1(v0 + 1064);
    *(_QWORD *)(v0 + 336) = v17;
    *(_QWORD *)(v0 + 344) = v19;
    *(_QWORD *)(v0 + 512) = v19;
    v20 = *(_OWORD *)(v0 + 296);
    v21 = *(_OWORD *)(v0 + 312);
    v22 = *(_OWORD *)(v0 + 264);
    v23 = *(_OWORD *)(v0 + 280);
    *(_OWORD *)(v0 + 416) = *(_OWORD *)(v0 + 248);
    *(_OWORD *)(v0 + 432) = v22;
    v24 = *(_OWORD *)(v0 + 232);
    *(_OWORD *)(v0 + 448) = v23;
    *(_OWORD *)(v0 + 464) = v20;
    v25 = *(_OWORD *)(v0 + 200);
    *(_OWORD *)(v0 + 352) = *(_OWORD *)(v0 + 184);
    *(_OWORD *)(v0 + 368) = v25;
    *(_OWORD *)(v0 + 384) = *(_OWORD *)(v0 + 216);
    *(_OWORD *)(v0 + 400) = v24;
    v26 = *(_OWORD *)(v0 + 328);
    *(_OWORD *)(v0 + 480) = v21;
    *(_OWORD *)(v0 + 496) = v26;
    v27 = v0 + 16;
    sub_23763704C(v0 + 352, v0 + 16);
    v28 = sub_23764A258();
    v29 = sub_23764A588();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v52[0] = v31;
      *(_DWORD *)v30 = 136315138;
      sub_23762B750();
      *(_QWORD *)(v0 + 1240) = sub_237626560(v32, v33, v52);
      sub_23764A600();
      swift_bridgeObjectRelease();
      sub_237637088(v27);
      _os_log_impl(&dword_23761E000, v28, v29, "Auth Response: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v31, -1, -1);
      MEMORY[0x23B817198](v30, -1, -1);
    }
    else
    {
      sub_237637088(v27);
    }

    v51(*(uint64_t **)(v0 + 1344), *(_QWORD *)(v0 + 1280), *(_QWORD *)(v0 + 1320));
    sub_23762B750();
    sub_237649FC4();
    swift_bridgeObjectRelease();
    v34 = sub_23764A258();
    v35 = sub_23764A588();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v52[0] = v37;
      *(_DWORD *)v36 = 136315138;
      swift_beginAccess();
      sub_2376298AC(&qword_256800E98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
      v38 = sub_23764A774();
      *(_QWORD *)(v0 + 1232) = sub_237626560(v38, v39, v52);
      sub_23764A600();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23761E000, v34, v35, "%s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v37, -1, -1);
      MEMORY[0x23B817198](v36, -1, -1);
    }

    v40 = *(_QWORD *)(v0 + 1344);
    v41 = *(uint64_t **)(v0 + 1336);
    v42 = *(_QWORD *)(v0 + 1320);
    v43 = *(_QWORD **)(v0 + 1288);
    v44 = v43[4];
    v45 = v43[5];
    __swift_project_boxed_opaque_existential_1(v43 + 1, v44);
    swift_beginAccess();
    v51(v41, v40, v42);
    v46 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1416) = v46;
    *v46 = v0;
    v46[1] = sub_237634270;
    return sub_237620194(*(_QWORD *)(v0 + 1336), v44, v45);
  }
}

uint64_t sub_237634270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)*v4;
  v5[178] = a1;
  v5[179] = a2;
  v5[180] = a3;
  v5[181] = v3;
  swift_task_dealloc();
  v6 = v5[167];
  v7 = v5[165];
  v8 = *(void (**)(uint64_t, uint64_t))(v5[166] + 8);
  if (v3)
    v5[183] = v8;
  else
    v5[182] = v8;
  v8(v6, v7);
  return swift_task_switch();
}

uint64_t sub_237634308()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t (*v31)(void);
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v56 = v0 + 352;
  v57 = v0 + 736;
  v58 = v0 + 832;
  v1 = *(id *)(v0 + 1440);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 1440);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 1216) = v4;
    v7 = v4;
    sub_23764A600();
    *v6 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "%@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v6, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {

    v2 = *(NSObject **)(v0 + 1440);
  }

  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (!v8)
    goto LABEL_9;
  v9 = (void *)v8;
  v10 = *(id *)(v0 + 1440);
  if (objc_msgSend(v9, sel_statusCode) != (id)200)
  {

LABEL_9:
    v23 = *(void **)(v0 + 1440);
    v24 = *(_QWORD *)(v0 + 1432);
    v25 = *(_QWORD *)(v0 + 1424);
    v26 = *(void **)(v0 + 1400);
    v27 = *(_QWORD *)(v0 + 1376);
    v28 = *(_QWORD *)(v0 + 1368);
    v52 = *(_QWORD *)(v0 + 1344);
    v54 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    v29 = *(_QWORD *)(v0 + 1320);
    sub_237636618();
    swift_allocError();
    *v30 = 2;
    swift_willThrow();
    sub_237626F18(v25, v24);
    sub_2376370BC(v57, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
    sub_2376370BC(v58, (uint64_t (*)(uint64_t, uint64_t))sub_237626F18);

    sub_237627D84(v28, v27);
    sub_237637088(v56);
    v54(v52, v29);
    goto LABEL_10;
  }
  v11 = *(_QWORD *)(v0 + 1448);
  v12 = sub_237635060(v0 + 976, v0 + 928);
  if (!v11)
  {
    v33 = v12;
    v53 = v13;
    sub_2376360F8(*(_QWORD *)(v0 + 1424), *(_QWORD *)(v0 + 1432));
    v55 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    v34 = *(void **)(v0 + 1440);
    v50 = *(_QWORD *)(v0 + 1424);
    v51 = *(_QWORD *)(v0 + 1432);
    v35 = *(void **)(v0 + 1400);
    v36 = *(_QWORD *)(v0 + 1368);
    v37 = *(_QWORD *)(v0 + 1344);
    v49 = *(_QWORD *)(v0 + 1320);
    v38 = *(_QWORD *)(v0 + 1312);
    v47 = *(_QWORD *)(v0 + 1304);
    v48 = *(_QWORD *)(v0 + 1296);
    v46 = *(_QWORD *)(v0 + 1376);
    v39 = *(char **)(v0 + 1264);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 1024), *(_QWORD *)(v0 + 1048));
    v40 = sub_23764A294();
    v44 = v41;
    v45 = v40;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 1024), *(_QWORD *)(v0 + 1048));
    sub_23764A2A0();

    sub_237626F18(v50, v51);
    sub_2376370BC(v57, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
    sub_2376370BC(v58, (uint64_t (*)(uint64_t, uint64_t))sub_237626F18);

    sub_237627D84(v36, v46);
    sub_237637088(v56);
    *(_QWORD *)v39 = v45;
    *((_QWORD *)v39 + 1) = v44;
    v42 = type metadata accessor for GBAResult(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(&v39[*(int *)(v42 + 20)], v38, v48);
    v43 = (uint64_t *)&v39[*(int *)(v42 + 24)];
    *v43 = v33;
    v43[1] = v53;
    __swift_destroy_boxed_opaque_existential_1(v0 + 1024);
    v55(v37, v49);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  v14 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
  v15 = *(void **)(v0 + 1440);
  v16 = *(_QWORD *)(v0 + 1432);
  v17 = *(_QWORD *)(v0 + 1424);
  v18 = *(void **)(v0 + 1400);
  v19 = *(_QWORD *)(v0 + 1376);
  v20 = *(_QWORD *)(v0 + 1368);
  v21 = *(_QWORD *)(v0 + 1344);
  v22 = *(_QWORD *)(v0 + 1320);
  sub_237637088(v56);
  sub_237627D84(v20, v19);

  sub_237626F18(v17, v16);
  sub_2376370BC(v57, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
  sub_2376370BC(v58, (uint64_t (*)(uint64_t, uint64_t))sub_237626F18);
  v14(v21, v22);
LABEL_10:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_237634828()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 1376);
  v2 = *(_QWORD *)(v0 + 1368);
  sub_2376370BC(v0 + 736, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
  sub_237627D84(v2, v1);
  sub_2376369F4(v0 + 664, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2376369A4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376348B4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1464);
  v2 = *(void **)(v0 + 1400);
  v3 = *(_QWORD *)(v0 + 1376);
  v4 = *(_QWORD *)(v0 + 1368);
  v5 = *(_QWORD *)(v0 + 1344);
  v6 = *(_QWORD *)(v0 + 1320);
  sub_2376370BC(v0 + 736, (uint64_t (*)(uint64_t, uint64_t))sub_237627D84);
  sub_2376370BC(v0 + 832, (uint64_t (*)(uint64_t, uint64_t))sub_237626F18);

  sub_237627D84(v4, v3);
  sub_237637088(v0 + 352);
  v1(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23763497C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[18] = a1;
  v2[19] = v1;
  type metadata accessor for HTTPGBAAuthenticator(0);
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237634A00()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  _BYTE *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  id v23;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v1 = sub_237636C78();
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 168) = v1;
  v2 = objc_msgSend(v1, sel_getDescriptorsForDomain_error_, 1, v0 + 120);
  *(_QWORD *)(v0 + 176) = v2;
  v3 = *(void **)(v0 + 120);
  if (!v2)
  {
    v23 = v3;
    sub_23764A090();

    swift_willThrow();
    goto LABEL_13;
  }
  v4 = v2;
  v5 = v3;
  v6 = objc_msgSend(v4, sel_descriptors);
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  v8 = *(_QWORD *)(v0 + 152);
  sub_2376372AC(0, &qword_256800EC8);
  v9 = sub_23764A4EC();

  v10 = swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = sub_23763182C(sub_23763724C, v10, v9);
  *(_QWORD *)(v0 + 184) = v11;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (!v11)
  {
LABEL_11:
    sub_237636618();
    swift_allocError();
    *v22 = 5;
    swift_willThrow();

LABEL_13:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_256800630 != -1)
    swift_once();
  v13 = *(_QWORD *)(v0 + 152);
  v12 = *(_QWORD *)(v0 + 160);
  v14 = sub_23764A270();
  __swift_project_value_buffer(v14, (uint64_t)qword_256800E40);
  sub_237637268(v13, v12, type metadata accessor for HTTPGBAAuthenticator);
  v15 = sub_23764A258();
  v16 = sub_23764A57C();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(_BYTE **)(v0 + 160);
  if (v17)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v31[0] = v20;
    *(_DWORD *)v19 = 136315138;
    if (*v18)
      v21 = 7305076;
    else
      v21 = 6647407;
    *(_QWORD *)(v0 + 136) = sub_237626560(v21, 0xE300000000000000, v31);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_2376288F4((uint64_t)v18, type metadata accessor for HTTPGBAAuthenticator);
    _os_log_impl(&dword_23761E000, v15, v16, "Performing AKA authentication for subscriptionID %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v20, -1, -1);
    MEMORY[0x23B817198](v19, -1, -1);
  }
  else
  {
    sub_2376288F4(*(_QWORD *)(v0 + 160), type metadata accessor for HTTPGBAAuthenticator);
  }

  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC27D8]), sel_init);
  *(_QWORD *)(v0 + 192) = v25;
  v26 = (void *)sub_23764A180();
  objc_msgSend(v25, sel_setRand_, v26);

  v27 = (void *)sub_23764A180();
  objc_msgSend(v25, sel_setAutn_, v27);

  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC27E8]), sel_init);
  *(_QWORD *)(v0 + 200) = v28;
  objc_msgSend(v28, sel_setAlgorithm_, v25);
  *(_QWORD *)(v0 + 56) = v0 + 128;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_237634E88;
  v29 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v30 = (_QWORD *)(v0 + 80);
  v30[1] = 0x40000000;
  v30[2] = sub_23762DFF8;
  v30[3] = &block_descriptor_0;
  v30[4] = v29;
  objc_msgSend(v1, sel_authenticate_request_completion_, v11, v28, v30);
  return swift_continuation_await();
}

uint64_t sub_237634E88()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_237634F2C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 192);
  v3 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 184);
  v4 = *(void **)(v0 + 168);

  v5 = *(_QWORD *)(v0 + 128);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t sub_237634FC4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(v0 + 200);
  v3 = *(void **)(v0 + 184);
  v2 = *(void **)(v0 + 192);
  v5 = *(void **)(v0 + 168);
  v4 = *(void **)(v0 + 176);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237635060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int16 *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v56[20];
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  _OWORD v64[3];
  uint64_t v65;
  __int128 v66;

  v4 = v2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  sub_237649FB8();
  v11 = sub_23764A120();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) == 1)
  {
    sub_237626E98((uint64_t)v9, &qword_256800710);
  }
  else
  {
    v60 = a2;
    v13 = sub_23764A0D8();
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    if (v15)
    {
      v57 = v3;
      v16 = (__int16 *)(v4 + *(int *)(v10 + 40));
      if ((v16[1] & 1) != 0)
      {
        v17 = sub_237639794(v13, v15);
        v19 = v18;
        v20 = sub_23763C164((uint64_t)&unk_2508EA138);
        v22 = v21;
      }
      else
      {
        v25 = *v16;
        v17 = sub_237639794(v13, v15);
        v19 = v26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256800960);
        v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_23764DFC0;
        *(_WORD *)(v27 + 32) = 1;
        *(_BYTE *)(v27 + 34) = 1;
        *(_BYTE *)(v27 + 35) = HIBYTE(v25);
        *(_BYTE *)(v27 + 36) = v25;
        v20 = sub_23763C164(v27);
        v22 = v28;
        swift_bridgeObjectRelease();
      }
      *(_QWORD *)&v64[0] = v17;
      *((_QWORD *)&v64[0] + 1) = v19;
      sub_237626FF4(v17, v19);
      sub_23763678C(v20, v22);
      sub_237626F18(v20, v22);
      sub_237626F18(v17, v19);
      v29 = *((_QWORD *)&v64[0] + 1);
      v63 = *(_QWORD *)&v64[0];
      v59 = v4;
      if (qword_256800630 != -1)
        swift_once();
      v30 = sub_23764A270();
      v31 = __swift_project_value_buffer(v30, (uint64_t)qword_256800E40);
      v32 = v63;
      sub_237626FF4(v63, v29);
      sub_237626FF4(v32, v29);
      v33 = sub_23764A258();
      v34 = sub_23764A588();
      v35 = os_log_type_enabled(v33, v34);
      v62 = v29;
      v56[19] = v31;
      if (v35)
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        *(_QWORD *)&v64[0] = v61;
        *(_DWORD *)v36 = 136315138;
        v58 = v36 + 4;
        v37 = v57;
        sub_2376310A8(v63, v62);
        v57 = v37;
        v65 = v38;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA8);
        sub_2376372E4((unint64_t *)&qword_256800AB0, &qword_256800AA8, MEMORY[0x24BEE12B0]);
        v39 = sub_23764A378();
        v41 = v40;
        v42 = v63;
        swift_bridgeObjectRelease();
        v65 = sub_237626560(v39, v41, (uint64_t *)v64);
        sub_23764A600();
        swift_bridgeObjectRelease();
        sub_237626F18(v42, v62);
        v63 = v42;
        sub_237626F18(v42, v62);
        _os_log_impl(&dword_23761E000, v33, v34, "NAF ID: %s", v36, 0xCu);
        v43 = v61;
        swift_arrayDestroy();
        v29 = v62;
        MEMORY[0x23B817198](v43, -1, -1);
        MEMORY[0x23B817198](v36, -1, -1);
      }
      else
      {
        v44 = v63;
        sub_237626F18(v63, v29);
        sub_237626F18(v44, v29);
      }

      sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626FF4);
      sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626FF4);
      v45 = sub_23764A258();
      v46 = sub_23764A588();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = swift_slowAlloc();
        v61 = v29 >> 62;
        v49 = v48;
        v65 = v48;
        *(_DWORD *)v47 = 136315138;
        v50 = *(_OWORD *)(a1 + 16);
        v64[0] = *(_OWORD *)a1;
        v64[1] = v50;
        v64[2] = *(_OWORD *)(a1 + 32);
        sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626FF4);
        v51 = sub_23764A3E4();
        *(_QWORD *)&v64[0] = sub_237626560(v51, v52, &v65);
        sub_23764A600();
        swift_bridgeObjectRelease();
        sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626F18);
        sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626F18);
        _os_log_impl(&dword_23761E000, v45, v46, "%s", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B817198](v49, -1, -1);
        MEMORY[0x23B817198](v47, -1, -1);
      }
      else
      {
        sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626F18);
        sub_2376371D8((uint64_t *)a1, (void (*)(uint64_t, uint64_t))sub_237626F18);
      }

      v66 = *(_OWORD *)(a1 + 32);
      v53 = *(_QWORD *)(a1 + 16);
      v54 = *(_QWORD *)(a1 + 24);
      v64[0] = v66;
      sub_237636FF4((uint64_t)&v66);
      sub_237636FF4((uint64_t)&v66);
      sub_237626FF4(v53, v54);
      sub_23763678C(v53, v54);
      sub_237626F18(v53, v54);
      sub_237637020((uint64_t)&v66);
      v56[13] = *((_QWORD *)&v64[0] + 1);
      v56[18] = *(_QWORD *)&v64[0];
      sub_23763C164((uint64_t)&unk_2508EA160);
      sub_237639794(0x656D2D616267, 0xE600000000000000);
      __asm { BR              X10 }
    }
  }
  sub_237636618();
  swift_allocError();
  *v23 = 8;
  return swift_willThrow();
}

void sub_2376360F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_23764A3D8();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

uint64_t sub_23763617C()
{
  uint64_t *v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  if (!BYTE6(v2))
  {
    sub_237636618();
    swift_allocError();
    v12 = 6;
LABEL_16:
    *v11 = v12;
    return swift_willThrow();
  }
  v6 = (void *)sub_23764A384();
  v7 = objc_msgSend(v1, sel_valueForHTTPHeaderField_, v6);

  if (!v7)
  {
LABEL_15:
    sub_237636618();
    swift_allocError();
    v12 = 7;
    goto LABEL_16;
  }
  v8 = sub_23764A3A8();
  v10 = v9;

  if (v8 != 0xD00000000000001CLL || v10 != 0x800000023764B500)
  {
    v13 = sub_23764A780();
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_8:
  if (qword_256800630 != -1)
    swift_once();
  v14 = sub_23764A270();
  __swift_project_value_buffer(v14, (uint64_t)qword_256800E40);
  sub_237626FF4(v3, v2);
  sub_237626FF4(v3, v2);
  v15 = sub_23764A258();
  v16 = sub_23764A588();
  if (os_log_type_enabled(v15, v16))
  {
    *(_QWORD *)(v5 - 128) = v4;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    *(_QWORD *)(v5 - 136) = v18;
    *(_QWORD *)(v5 - 120) = v18;
    *(_DWORD *)v17 = 136315138;
    sub_23764A3CC();
    v19 = sub_23764A3B4();
    if (v20)
    {
      v21 = v20;
    }
    else
    {
      v19 = 0;
      v21 = 0xE000000000000000;
    }
    *(_QWORD *)(v5 - 72) = sub_237626560(v19, v21, (uint64_t *)(v5 - 120));
    v4 = *(_QWORD *)(v5 - 128);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_237626F18(v3, v2);
    sub_237626F18(v3, v2);
    _os_log_impl(&dword_23761E000, v15, v16, "%s", v17, 0xCu);
    v22 = *(_QWORD *)(v5 - 136);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v22, -1, -1);
    MEMORY[0x23B817198](v17, -1, -1);
  }
  else
  {
    sub_237626F18(v3, v2);
    sub_237626F18(v3, v2);
  }

  v24 = sub_23764A24C();
  swift_allocObject();
  v25 = sub_23764A240();
  *(_QWORD *)(v5 - 96) = v24;
  *(_QWORD *)(v5 - 88) = &off_2508EB598;
  *(_QWORD *)(v5 - 120) = v25;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 - 120), v24);
  v0[3] = sub_23764A2AC();
  v0[4] = (uint64_t)&off_2508EB580;
  __swift_allocate_boxed_opaque_existential_1(v0);
  sub_23763715C();
  sub_23764A234();
  if (v4)
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)v0);
  return __swift_destroy_boxed_opaque_existential_1(v5 - 120);
}

uint64_t sub_237636550(id *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;

  v2 = *a2;
  v3 = *a1;
  if (objc_msgSend(v3, sel_domain) == (id)1)
  {
    v4 = objc_msgSend(v3, sel_instance);
    v5 = objc_msgSend(v4, sel_integerValue);

    if (v5 == (id)1)
    {
      return v2 ^ 1;
    }
    else if (v5 != (id)2)
    {
      return 0;
    }
  }
  else
  {

    return 0;
  }
  return v2;
}

uint64_t type metadata accessor for GBAResult(uint64_t a1)
{
  return sub_237628988(a1, qword_256800F48);
}

unint64_t sub_237636618()
{
  unint64_t result;

  result = qword_256800E88;
  if (!qword_256800E88)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E1F8, &type metadata for HTTPGBAAuthenticator.Error);
    atomic_store(result, &qword_256800E88);
  }
  return result;
}

uint64_t type metadata accessor for HTTPGBAAuthenticator.Configuration(uint64_t a1)
{
  return sub_237628988(a1, qword_256801070);
}

uint64_t sub_237636670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376366B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GBAResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376366FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23764A00C();
  if (!result || (result = sub_23764A030(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23764A024();
      return sub_23764A168();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_23763678C(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_2376367F0
     + dword_237636994[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_237636800()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_237626FF4(v1, v0);
  sub_23764A168();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

uint64_t sub_2376369A4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2376369F4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 64);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  return a1;
}

uint64_t sub_237636A40(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_237636A90(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_237636AE8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;

  if (BYTE6(v1) >= 0x20uLL)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        v10 = (int)v2;
        v11 = v2 >> 32;
      }
      else
      {
        v10 = *(_QWORD *)(v2 + 16);
        v11 = *(_QWORD *)(v2 + 24);
      }
    }
    else
    {
      v10 = 0;
      v11 = BYTE6(v1);
    }
    if (v11 < v10 || v10 > 16)
    {
      __break(1u);
      JUMPOUT(0x237636C54);
    }
    v5 = sub_23764A174();
    v3 = v12;
    v6 = sub_23764A174();
    v7 = v13;
    if (v4)
    {
      if (v4 == 1)
      {
        LODWORD(v14) = HIDWORD(v2) - v2;
        if (!__OFSUB__(HIDWORD(v2), (_DWORD)v2))
        {
          v14 = (int)v14;
LABEL_16:
          if (v14 < 33)
          {
            result = 0;
            v9 = 0xF000000000000000;
            goto LABEL_26;
          }
          if (v4)
          {
            if (v4 == 1)
            {
              v18 = (int)v2;
              v19 = v2 >> 32;
            }
            else
            {
              v18 = *(_QWORD *)(v2 + 16);
              v19 = *(_QWORD *)(v2 + 24);
            }
          }
          else
          {
            v18 = 0;
            v19 = BYTE6(v1);
          }
          if (v19 >= 32 && v19 >= v18)
          {
            result = sub_23764A174();
            goto LABEL_26;
          }
LABEL_30:
          __break(1u);
          JUMPOUT(0x237636C68);
        }
        __break(1u);
      }
      else
      {
        v16 = *(_QWORD *)(v2 + 16);
        v15 = *(_QWORD *)(v2 + 24);
        v17 = __OFSUB__(v15, v16);
        v14 = v15 - v16;
        if (!v17)
          goto LABEL_16;
      }
      __break(1u);
      goto LABEL_30;
    }
    v14 = BYTE6(v1);
    goto LABEL_16;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  result = 0;
  v9 = 0;
LABEL_26:
  *v0 = v5;
  v0[1] = v3;
  v0[2] = v6;
  v0[3] = v7;
  v0[4] = result;
  v0[5] = v9;
  return result;
}

id sub_237636C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[2];

  v0 = sub_23764A5B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23764A5AC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23764A288();
  MEMORY[0x24BDAC7A8](v6);
  sub_2376372AC(0, &qword_256800ED0);
  sub_23764A27C();
  v10[1] = MEMORY[0x24BEE4AF8];
  sub_2376298AC(&qword_256800ED8, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800EE0);
  sub_2376372E4(qword_256800EE8, &qword_256800EE0, MEMORY[0x24BEE12C8]);
  sub_23764A630();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  v7 = (void *)sub_23764A5C4();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2810]), sel_initWithQueue_, v7);

  return v8;
}

void sub_237636E70(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = objc_msgSend(a1, sel_res);
  if (!v4)
  {

    v5 = 0;
LABEL_8:
    v10 = 0;
    v8 = 0;
    goto LABEL_9;
  }
  v5 = sub_23764A198();
  v7 = v6;

  v8 = objc_msgSend(a1, sel_ik);
  if (!v8)
  {

    sub_237626F18(v5, v7);
    v5 = 0;
    v4 = 0;
    v10 = 0;
LABEL_9:
    v14 = 0;
    v7 = 0xF000000000000000;
    goto LABEL_10;
  }
  v4 = (id)sub_23764A198();
  v10 = v9;

  v11 = objc_msgSend(a1, sel_ck);
  if (!v11)
  {

    sub_237626F18((uint64_t)v4, v10);
    sub_237626F18(v5, v7);
    v5 = 0;
    v4 = 0;
    goto LABEL_8;
  }
  v12 = v11;
  v8 = (id)sub_23764A198();
  v14 = v13;

LABEL_10:
  *a2 = v5;
  a2[1] = v7;
  a2[2] = (uint64_t)v4;
  a2[3] = v10;
  a2[4] = (uint64_t)v8;
  a2[5] = v14;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t sub_237636FF4(uint64_t a1)
{
  sub_237626FF4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_237637020(uint64_t a1)
{
  sub_237626F18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_23763704C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for HTTPDigestAuthenticateResponse(a2, a1);
  return a2;
}

uint64_t sub_237637088(uint64_t a1)
{
  destroy for HTTPDigestAuthenticateResponse(a1);
  return a1;
}

uint64_t sub_2376370BC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  sub_2376370F4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  return a1;
}

uint64_t sub_2376370F4(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t))
{
  if (a2 >> 60 != 15)
  {
    sub_237626F18(result, a2);
    sub_237626F18(a3, a4);
    return a7(a5, a6);
  }
  return result;
}

unint64_t sub_23763715C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256800EC0;
  if (!qword_256800EC0)
  {
    v1 = sub_23764A2AC();
    result = MEMORY[0x23B8170FC](MEMORY[0x24BE0D570], v1);
    atomic_store(result, (unint64_t *)&qword_256800EC0);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x23B817198);
  return result;
}

uint64_t *sub_2376371D8(uint64_t *a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[2];
  v5 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  a2(*a1, a1[1]);
  a2(v4, v5);
  a2(v6, v7);
  return a1;
}

uint64_t type metadata accessor for HTTPGBAAuthenticator(uint64_t a1)
{
  return sub_237628988(a1, qword_256800FE0);
}

uint64_t sub_23763724C(id *a1)
{
  uint64_t v1;

  return sub_237636550(a1, *(unsigned __int8 **)(v1 + 16)) & 1;
}

uint64_t sub_237637268(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2376372AC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2376372E4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B8170FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for AKAResult(uint64_t a1)
{
  sub_237626F18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_237626F18(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return sub_237626F18(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t *initializeWithCopy for AKAResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  sub_237626FF4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v6 = a2[2];
  v7 = a2[3];
  sub_237626FF4(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  v9 = a2[4];
  v8 = a2[5];
  sub_237626FF4(v9, v8);
  a1[4] = v9;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for AKAResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v4 = *a2;
  v5 = a2[1];
  sub_237626FF4(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_237626F18(v6, v7);
  v8 = a2[2];
  v9 = a2[3];
  sub_237626FF4(v8, v9);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_237626F18(v10, v11);
  v13 = a2[4];
  v12 = a2[5];
  sub_237626FF4(v13, v12);
  v14 = a1[4];
  v15 = a1[5];
  a1[4] = v13;
  a1[5] = v12;
  sub_237626F18(v14, v15);
  return a1;
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

uint64_t *assignWithTake for AKAResult(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_237626F18(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_237626F18(v6, v7);
  v8 = a1[4];
  v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_237626F18(v8, v9);
  return a1;
}

ValueMetadata *type metadata accessor for AKAResult()
{
  return &type metadata for AKAResult;
}

uint64_t destroy for HTTPAKANonce(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;

  sub_237626F18(*a1, a1[1]);
  result = sub_237626F18(a1[2], a1[3]);
  v3 = a1[5];
  if (v3 >> 60 != 15)
    return sub_237626F18(a1[4], v3);
  return result;
}

uint64_t initializeWithCopy for HTTPAKANonce(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;

  v4 = *a2;
  v5 = a2[1];
  sub_237626FF4(*a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = a2[2];
  v7 = a2[3];
  sub_237626FF4(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = a2 + 4;
  v9 = a2[5];
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v8;
  }
  else
  {
    v10 = *v8;
    sub_237626FF4(*v8, v9);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v9;
  }
  return a1;
}

uint64_t *assignWithCopy for HTTPAKANonce(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v4 = *a2;
  v5 = a2[1];
  sub_237626FF4(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_237626F18(v6, v7);
  v8 = a2[2];
  v9 = a2[3];
  sub_237626FF4(v8, v9);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_237626F18(v10, v11);
  v12 = a2 + 4;
  v13 = a2[5];
  if ((unint64_t)a1[5] >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      v15 = *v12;
      sub_237626FF4(*v12, v13);
      v16 = a1[4];
      v17 = a1[5];
      a1[4] = v15;
      a1[5] = v13;
      sub_237626F18(v16, v17);
      return a1;
    }
    sub_237637680((uint64_t)(a1 + 4));
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v12;
    return a1;
  }
  v14 = *v12;
  sub_237626FF4(*v12, v13);
  a1[4] = v14;
  a1[5] = v13;
  return a1;
}

uint64_t sub_237637680(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t *assignWithTake for HTTPAKANonce(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_237626F18(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_237626F18(v6, v7);
  v8 = (uint64_t *)(a2 + 32);
  v9 = a1[5];
  if (v9 >> 60 != 15)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (v10 >> 60 != 15)
    {
      v11 = a1[4];
      a1[4] = *v8;
      a1[5] = v10;
      sub_237626F18(v11, v9);
      return a1;
    }
    sub_237637680((uint64_t)(a1 + 4));
  }
  *((_OWORD *)a1 + 2) = *(_OWORD *)v8;
  return a1;
}

uint64_t _s15CTLazuliSupport9AKAResultVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s15CTLazuliSupport9AKAResultVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPAKANonce()
{
  return &type metadata for HTTPAKANonce;
}

uint64_t getEnumTagSinglePayload for HTTPGBAAuthenticator.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPGBAAuthenticator.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_2376378EC + 4 * byte_23764DFF5[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_237637920 + 4 * byte_23764DFF0[v4]))();
}

uint64_t sub_237637920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237637928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237637930);
  return result;
}

uint64_t sub_23763793C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237637944);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_237637948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237637950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPGBAAuthenticator.Error()
{
  return &type metadata for HTTPGBAAuthenticator.Error;
}

ValueMetadata *type metadata accessor for HTTPGBAAuthenticator.DefaultFactory()
{
  return &type metadata for HTTPGBAAuthenticator.DefaultFactory;
}

uint64_t *sub_23763797C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23764A1A4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    sub_237626FF4(*v15, v17);
    *v14 = v16;
    v14[1] = v17;
  }
  return v4;
}

uint64_t sub_237637A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23764A1A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return sub_237626F18(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

_QWORD *sub_237637AA8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23764A1A4();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  sub_237626FF4(*v14, v16);
  *v13 = v15;
  v13[1] = v16;
  return a1;
}

_QWORD *sub_237637B48(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23764A1A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *v12;
  v14 = v12[1];
  sub_237626FF4(*v12, v14);
  v15 = *v11;
  v16 = v11[1];
  *v11 = v13;
  v11[1] = v14;
  sub_237626F18(v15, v16);
  return a1;
}

_OWORD *sub_237637BF4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23764A1A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_237637C6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23764A1A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)((char *)a1 + v11);
  v13 = *(_QWORD *)((char *)a1 + v11 + 8);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  sub_237626F18(v12, v13);
  return a1;
}

uint64_t sub_237637CF8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237637D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23764A1A4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_237637D80()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237637D8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_23764A1A4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_237637E00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23764A1A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_237637E7C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 8, (uint64_t)(a2 + 1));
    v8 = a2[7];
    v4[6] = a2[6];
    v4[7] = v8;
    v9 = (int *)type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
    v10 = v9[7];
    v11 = (char *)v4 + v10;
    v12 = (uint64_t)a2 + v10;
    v13 = sub_237649FD0();
    v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = v9[8];
    v16 = (char *)v4 + v15;
    v17 = (uint64_t)a2 + v15;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v16[8] = *(_BYTE *)(v17 + 8);
    *((_BYTE *)v4 + v9[9]) = *((_BYTE *)a2 + v9[9]);
    v18 = v9[10];
    v19 = (char *)v4 + v18;
    v20 = (uint64_t)a2 + v18;
    v19[2] = *(_BYTE *)(v20 + 2);
    *(_WORD *)v19 = *(_WORD *)v20;
    v21 = *(int *)(a3 + 20);
    v22 = *(_OWORD *)((char *)a2 + v21 + 24);
    *(_OWORD *)((char *)v4 + v21 + 24) = v22;
    (**(void (***)(void))(v22 - 8))();
  }
  return v4;
}

uint64_t sub_237637FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for HTTPGBAAuthenticator.Configuration(0) + 28);
  v5 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 20));
}

uint64_t sub_237638038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = (int *)type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v9 = v8[7];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_237649FD0();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = v8[8];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_BYTE *)(a1 + v8[9]) = *(_BYTE *)(a2 + v8[9]);
  v17 = v8[10];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_BYTE *)(v18 + 2) = *(_BYTE *)(v19 + 2);
  *(_WORD *)v18 = *(_WORD *)v19;
  v20 = *(int *)(a3 + 20);
  v21 = *(_OWORD *)(a2 + v20 + 24);
  *(_OWORD *)(a1 + v20 + 24) = v21;
  (**(void (***)(void))(v21 - 8))();
  return a1;
}

uint64_t sub_237638154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v7 = v6[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = v6[8];
  v12 = a1 + v11;
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  *(_BYTE *)(v12 + 8) = *((_BYTE *)v13 + 8);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v15 = v6[10];
  v16 = a1 + v15;
  v17 = a2 + v15;
  LOBYTE(v14) = *(_BYTE *)(v17 + 2);
  *(_WORD *)v16 = *(_WORD *)v17;
  *(_BYTE *)(v16 + 2) = v14;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  return a1;
}

uint64_t sub_237638244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
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
  __int128 v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = (int *)type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v7 = v6[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = v6[8];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v14 = v6[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)(v15 + 2) = *(_BYTE *)(v16 + 2);
  *(_WORD *)v15 = *(_WORD *)v16;
  v17 = *(int *)(a3 + 20);
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
  v20 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v20;
  return a1;
}

uint64_t sub_23763833C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
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
  __int128 v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v6 = (int *)type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v7 = v6[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = v6[8];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v14 = v6[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_WORD *)v15 = *(_WORD *)v16;
  *(_BYTE *)(v15 + 2) = *(_BYTE *)(v16 + 2);
  v17 = *(int *)(a3 + 20);
  v18 = a1 + v17;
  v19 = a2 + v17;
  __swift_destroy_boxed_opaque_existential_1(a1 + v17);
  v20 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v20;
  *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
  return a1;
}

uint64_t sub_237638448()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237638454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2376384D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376384E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_23763855C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for HTTPGBAAuthenticator.Configuration(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_2376385CC(uint64_t a1, uint64_t *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 8, (uint64_t)(a2 + 1));
    v8 = a2[7];
    v4[6] = a2[6];
    v4[7] = v8;
    v9 = a3[7];
    v10 = (char *)v4 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = sub_237649FD0();
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[8];
    v15 = a3[9];
    v16 = (char *)v4 + v14;
    v17 = (uint64_t)a2 + v14;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v16[8] = *(_BYTE *)(v17 + 8);
    *((_BYTE *)v4 + v15) = *((_BYTE *)a2 + v15);
    v18 = a3[10];
    v19 = (char *)v4 + v18;
    v20 = (uint64_t)a2 + v18;
    *(_WORD *)v19 = *(_WORD *)v20;
    v19[2] = *(_BYTE *)(v20 + 2);
  }
  return v4;
}

uint64_t sub_2376386E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_237649FD0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_237638730(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_237649FD0();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[8];
  v14 = a3[9];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v17 = a3[10];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_WORD *)v18 = *(_WORD *)v19;
  *(_BYTE *)(v18 + 2) = *(_BYTE *)(v19 + 2);
  return a1;
}

uint64_t sub_237638810(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[8];
  v11 = a1 + v10;
  v12 = (uint64_t *)(a2 + v10);
  v13 = *v12;
  *(_BYTE *)(v11 + 8) = *((_BYTE *)v12 + 8);
  *(_QWORD *)v11 = v13;
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v14 = a3[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  LOBYTE(v13) = *(_BYTE *)(v16 + 2);
  *(_WORD *)v15 = *(_WORD *)v16;
  *(_BYTE *)(v15 + 2) = v13;
  return a1;
}

uint64_t sub_2376388E4(uint64_t a1, uint64_t a2, int *a3)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  v11 = a3[9];
  v12 = a1 + v10;
  v13 = a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v14 = a3[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_WORD *)v15 = *(_WORD *)v16;
  *(_BYTE *)(v15 + 2) = *(_BYTE *)(v16 + 2);
  return a1;
}

uint64_t sub_2376389B0(uint64_t a1, uint64_t a2, int *a3)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[8];
  v11 = a3[9];
  v12 = a1 + v10;
  v13 = a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v14 = a3[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_WORD *)v15 = *(_WORD *)v16;
  *(_BYTE *)(v15 + 2) = *(_BYTE *)(v16 + 2);
  return a1;
}

uint64_t sub_237638A88()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237638A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_237649FD0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_237638B10()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237638B1C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    v7 = sub_237649FD0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_237638B90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237649FD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_237638C30()
{
  unint64_t result;

  result = qword_2568010C0;
  if (!qword_2568010C0)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E1D0, &type metadata for HTTPGBAAuthenticator.Error);
    atomic_store(result, (unint64_t *)&qword_2568010C0);
  }
  return result;
}

uint64_t sub_237638C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568010C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568010D0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568010D8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1;
  v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568010E0);
  sub_23764A1D4();
  sub_23762B14C();
  sub_237638EEC();
  sub_23764A360();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_237638F38((uint64_t)v10);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v15 = MEMORY[0x23B816910](v17, v18, v19, v20);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    MEMORY[0x23B816910](v17, v18, v19, v20);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

unint64_t sub_237638EEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568010E8;
  if (!qword_2568010E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568010C8);
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE7460], v1);
    atomic_store(result, (unint64_t *)&qword_2568010E8);
  }
  return result;
}

uint64_t sub_237638F38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568010D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237638F78(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_237638FB4 + 4 * byte_23764E294[a1]))(0xD000000000000018, 0x800000023764AE60);
}

uint64_t sub_237638FB4()
{
  return 0x6567412D72657355;
}

uint64_t sub_237638FD0()
{
  return 0x2D746E65746E6F43;
}

uint64_t sub_237639004()
{
  return 0x7A69726F68747541;
}

unint64_t sub_237639028()
{
  return 0xD000000000000010;
}

uint64_t sub_237639044()
{
  return 1953722184;
}

uint64_t sub_237639054()
{
  return 0x66412D7972746552;
}

void sub_237639074(char *a1)
{
  sub_2376315A4(*a1);
}

void sub_237639080()
{
  char *v0;

  sub_23763CB4C(0, *v0);
}

void sub_23763908C(uint64_t a1)
{
  char *v1;

  sub_23763CA30(a1, *v1);
}

void sub_237639094(uint64_t a1)
{
  char *v1;

  sub_23763CB4C(a1, *v1);
}

uint64_t sub_23763909C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237639294();
  *a1 = result;
  return result;
}

uint64_t sub_2376390C8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_237638F78(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for HTTPHeader(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPHeader(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376391CC + 4 * byte_23764E2A1[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_237639200 + 4 * byte_23764E29C[v4]))();
}

uint64_t sub_237639200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237639208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237639210);
  return result;
}

uint64_t sub_23763921C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237639224);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_237639228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237639230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPHeader()
{
  return &type metadata for HTTPHeader;
}

unint64_t sub_237639250()
{
  unint64_t result;

  result = qword_2568010F0;
  if (!qword_2568010F0)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E2EC, &type metadata for HTTPHeader);
    atomic_store(result, (unint64_t *)&qword_2568010F0);
  }
  return result;
}

uint64_t sub_237639294()
{
  unint64_t v0;

  v0 = sub_23764A714();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t destroy for HTTPMultipartFormDataBuilder()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for HTTPMultipartFormDataBuilder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HTTPMultipartFormDataBuilder(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for HTTPMultipartFormDataBuilder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder()
{
  return &type metadata for HTTPMultipartFormDataBuilder;
}

void sub_2376394EC(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_237639550
     + dword_237639784[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_237639560()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_237626FF4(v1, v0);
  sub_23763B90C(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_237626F18(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

uint64_t sub_237639794(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801110);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_237626E98((uint64_t)v14, &qword_256801118);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_23764A69C();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_23763BFEC(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_23764A444();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_23763C050(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_23763B61C();
    __asm { BR              X12 }
  }
  sub_237621660(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_23764A048();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t sub_237639C98()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_2568010F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568010F8);
  return sub_23764A264();
}

unint64_t sub_237639D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  sub_23764A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  result = 0xD000000000000026;
  if (a4)
  {
    sub_23764A438();
    sub_23764A438();
    sub_23764A438();
    swift_bridgeObjectRelease();
    return 0xD000000000000026;
  }
  return result;
}

unint64_t sub_237639E14()
{
  uint64_t *v0;

  return sub_237639D04(*v0, v0[1], v0[2], v0[3]);
}

uint64_t sub_237639E20()
{
  _QWORD v1[2];

  sub_23764A660();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Content-Type: ");
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t sub_237639EB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_23764A6E4();
    swift_bridgeObjectRelease();
    if (v4)
      goto LABEL_3;
LABEL_5:
    v2 = 11565;
    v3 = 0xE200000000000000;
    goto LABEL_6;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  v2 = 757926413;
  v3 = 0xE400000000000000;
LABEL_6:
  v6 = v2;
  v7 = v3;
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  sub_237639F84(v6, v7);
  return swift_bridgeObjectRelease();
}

void sub_237639F84(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_237639794(a1, a2);
  __asm { BR              X11 }
}

uint64_t sub_237639FE0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(_QWORD *)(v2 + 40);
  if (__OFADD__(v3, BYTE6(v0)))
  {
    __break(1u);
    goto LABEL_5;
  }
  *(_QWORD *)(v2 + 40) = v3 + BYTE6(v0);
  v4 = objc_allocWithZone(MEMORY[0x24BDBCE90]);
  v5 = (void *)sub_23764A180();
  objc_msgSend(v4, sel_initWithData_, v5);

  MEMORY[0x23B816A00]();
  if (*(_QWORD *)((*(_QWORD *)(v2 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v2 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
LABEL_5:
    sub_23764A504();
  sub_23764A510();
  sub_23764A4F8();
  return sub_237626F18(v1, v0);
}

uint64_t sub_23763A0D0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_237626B58(0, v1, 0);
    v4 = a1 + 32;
    v2 = v21;
    do
    {
      sub_2376297E0(v4, (uint64_t)&v17);
      v5 = v19;
      v6 = v20;
      __swift_project_boxed_opaque_existential_1(&v17, v19);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      v9 = v8;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237626B58(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v21;
      }
      v11 = *(_QWORD *)(v2 + 16);
      v10 = *(_QWORD *)(v2 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_237626B58(v10 > 1, v11 + 1, 1);
        v2 = v21;
      }
      *(_QWORD *)(v2 + 16) = v11 + 1;
      v12 = v2 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  v17 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA8);
  sub_2376372E4((unint64_t *)&qword_256800AB0, &qword_256800AA8, MEMORY[0x24BEE12B0]);
  v13 = sub_23764A378();
  v15 = v14;
  swift_bridgeObjectRelease();
  v17 = v13;
  v18 = v15;
  sub_23764A438();
  sub_237639F84(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23763A284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;

  sub_237639EB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801130);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23764DF30;
  *(_QWORD *)(inited + 56) = &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
  *(_QWORD *)(inited + 64) = &off_2508EB4E0;
  v6 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = 0;
  v6[5] = 0;
  *(_QWORD *)(inited + 96) = &type metadata for HTTPMultipartFormDataBuilder.ContentType;
  *(_QWORD *)(inited + 104) = &off_2508EB4D0;
  *(_QWORD *)(inited + 72) = 0x616C702F74786574;
  *(_QWORD *)(inited + 80) = 0xEA00000000006E69;
  swift_bridgeObjectRetain();
  sub_23763A0D0(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801138);
  swift_arrayDestroy();
  v7 = sub_23764A1B0();
  sub_237639F84(v7, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23763A3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t inited;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, char *, uint64_t);
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  char *v96;
  uint8_t *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  void (**v102)(char *, uint64_t);
  _BYTE *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE *v112;
  _QWORD v113[2];
  _QWORD *v114;
  void (*v115)(char *, char *, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t (*v118)(char *, uint64_t, uint64_t);
  _QWORD *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  char *v123;
  _QWORD *v124;
  uint64_t v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;

  v132 = a4;
  v128 = a3;
  v127 = a2;
  v133 = sub_23764A120();
  v134 = *(_QWORD *)(v133 - 8);
  v5 = MEMORY[0x24BDAC7A8](v133);
  v131 = (char *)v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v113 - v7;
  v9 = sub_23764A06C();
  v10 = *(char **)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801120);
  inited = swift_initStackObject();
  v126 = xmmword_23764DF30;
  *(_OWORD *)(inited + 16) = xmmword_23764DF30;
  v14 = (void *)*MEMORY[0x24BDBCC48];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC48];
  v15 = (void *)*MEMORY[0x24BDBCBE8];
  *(_QWORD *)(inited + 40) = *MEMORY[0x24BDBCBE8];
  v16 = v14;
  v17 = v15;
  sub_23763C214(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  v18 = v135;
  sub_23764A0A8();
  result = swift_bridgeObjectRelease();
  if (!v18)
  {
    v122 = v8;
    v125 = a1;
    v117 = 0;
    v135 = v12;
    v120 = v10;
    v121 = v9;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    v119 = v113;
    v21 = *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64);
    MEMORY[0x24BDAC7A8](v20);
    v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
    v130 = (char *)v113 - v22;
    v23 = sub_23764A228();
    v124 = v113;
    v24 = *(_QWORD *)(v23 - 8);
    v25 = *(_QWORD *)(v24 + 64);
    v26 = MEMORY[0x24BDAC7A8](v23);
    v27 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
    v123 = (char *)v113;
    MEMORY[0x24BDAC7A8](v26);
    sub_23762F2E0(v132, (uint64_t)v113 - v22);
    v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
    v29 = v28((char *)v113 - v22, 1, v23);
    v132 = v25;
    if (v29 == 1)
    {
      v116 = v24;
      v30 = sub_237626E98((uint64_t)v113 - v22, &qword_256800728);
      v31 = MEMORY[0x24BDAC7A8](v30);
      v32 = (char *)v113 - v27;
      MEMORY[0x24BDAC7A8](v31);
      sub_23764A054();
      if (v28((char *)v113 - v22, 1, v23) == 1)
      {
        sub_237626E98((uint64_t)v113 - v22, &qword_256800728);
        v24 = v116;
        v33 = (uint64_t)v130;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v130, 1, 1, v23);
        v34 = v122;
      }
      else
      {
        v118 = v28;
        v24 = v116;
        v115 = *(void (**)(char *, char *, uint64_t))(v116 + 32);
        v115(v32, (char *)v113 - v22, v23);
        if (qword_256800638 != -1)
          swift_once();
        v124 = v113;
        v46 = sub_23764A270();
        v47 = __swift_project_value_buffer(v46, (uint64_t)qword_2568010F8);
        v114 = v113;
        MEMORY[0x24BDAC7A8](v47);
        v48 = (char *)v113 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
        v49 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
        v123 = v32;
        v49(v48, v32, v23);
        v50 = sub_23764A258();
        v51 = sub_23764A57C();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          v53 = swift_slowAlloc();
          v137 = v53;
          *(_DWORD *)v52 = 136315138;
          v113[1] = v52 + 4;
          sub_23763C4F8();
          v54 = sub_23764A774();
          v136 = sub_237626560(v54, v55, &v137);
          sub_23764A600();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v48, v23);
          _os_log_impl(&dword_23761E000, v50, v51, "Using deduced content type: %s", v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B817198](v53, -1, -1);
          MEMORY[0x23B817198](v52, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v24 + 8))((char *)v113 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
        }

        v33 = (uint64_t)v130;
        v34 = v122;
        v28 = v118;
        v115(v130, v123, v23);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v33, 0, 1, v23);
      }
    }
    else
    {
      v118 = v28;
      v116 = *(_QWORD *)(v24 + 32);
      ((void (*)(char *, char *, uint64_t))v116)((char *)v113 - v27, (char *)v113 - v22, v23);
      if (qword_256800638 != -1)
        swift_once();
      v35 = sub_23764A270();
      v36 = __swift_project_value_buffer(v35, (uint64_t)qword_2568010F8);
      v115 = (void (*)(char *, char *, uint64_t))v113;
      MEMORY[0x24BDAC7A8](v36);
      v38 = (char *)v113 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
      v39 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
      v123 = (char *)v113 - v27;
      v39(v38, (char *)v113 - v27, v23);
      v40 = sub_23764A258();
      v41 = sub_23764A57C();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v43 = swift_slowAlloc();
        v137 = v43;
        *(_DWORD *)v42 = 136315138;
        v114 = v42 + 4;
        sub_23763C4F8();
        v44 = sub_23764A774();
        v136 = sub_237626560(v44, v45, &v137);
        sub_23764A600();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v38, v23);
        _os_log_impl(&dword_23761E000, v40, v41, "Using client-provided content type: %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B817198](v43, -1, -1);
        MEMORY[0x23B817198](v42, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v24 + 8))(v38, v23);
      }

      v33 = (uint64_t)v130;
      v34 = v122;
      v28 = v118;
      ((void (*)(char *, char *, uint64_t))v116)(v130, v123, v23);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v33, 0, 1, v23);
    }
    v56 = v28((char *)v33, 1, v23);
    v57 = v125;
    if ((_DWORD)v56
      || (MEMORY[0x24BDAC7A8](v56),
          v70 = (char *)v113 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0),
          (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v70, v33, v23),
          v132 = sub_23764A210(),
          v68 = v71,
          (*(void (**)(char *, uint64_t))(v24 + 8))(v70, v23),
          !v68))
    {
      if (qword_256800638 != -1)
        swift_once();
      v132 = 0xD000000000000018;
      v58 = sub_23764A270();
      __swift_project_value_buffer(v58, (uint64_t)qword_2568010F8);
      v59 = v134;
      v60 = v133;
      (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v34, v57, v133);
      v61 = sub_23764A258();
      v62 = sub_23764A594();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc();
        v64 = swift_slowAlloc();
        v137 = v64;
        *(_DWORD *)v63 = 136315138;
        sub_23763C484();
        v65 = sub_23764A774();
        v136 = sub_237626560(v65, v66, &v137);
        v57 = v125;
        v33 = (uint64_t)v130;
        sub_23764A600();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v134 + 8))(v34, v60);
        _os_log_impl(&dword_23761E000, v61, v62, "Unable to determine MIME type for file URL: %s, falling back to default", v63, 0xCu);
        swift_arrayDestroy();
        v67 = v64;
        v59 = v134;
        MEMORY[0x23B817198](v67, -1, -1);
        MEMORY[0x23B817198](v63, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v60);
      }

      v68 = 0x800000023764B4E0;
    }
    else
    {
      v59 = v134;
    }
    v72 = sub_23764A060();
    if ((v73 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (qword_256800638 != -1)
        swift_once();
      v91 = sub_23764A270();
      __swift_project_value_buffer(v91, (uint64_t)qword_2568010F8);
      v92 = v131;
      v93 = v133;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v131, v57, v133);
      v94 = sub_23764A258();
      v95 = sub_23764A594();
      if (os_log_type_enabled(v94, v95))
      {
        v96 = v92;
        v97 = (uint8_t *)swift_slowAlloc();
        v98 = swift_slowAlloc();
        v137 = v98;
        *(_DWORD *)v97 = 136315138;
        sub_23763C484();
        v99 = sub_23764A774();
        v136 = sub_237626560(v99, v100, &v137);
        v33 = (uint64_t)v130;
        sub_23764A600();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v134 + 8))(v96, v93);
        _os_log_impl(&dword_23761E000, v94, v95, "Unable to determine size of file at: %s", v97, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B817198](v98, -1, -1);
        MEMORY[0x23B817198](v97, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v59 + 8))(v92, v93);
      }

      v101 = v121;
      v102 = (void (**)(char *, uint64_t))v120;
      sub_23763C440();
      swift_allocError();
      *v103 = 1;
      swift_willThrow();
      v102[1](v135, v101);
      v104 = v33;
    }
    else
    {
      v74 = v72;
      v75 = sub_23764A0E4();
      v77 = v76;
      v78 = objc_allocWithZone(MEMORY[0x24BDBCE90]);
      swift_bridgeObjectRetain();
      v79 = (void *)sub_23764A384();
      swift_bridgeObjectRelease();
      v80 = objc_msgSend(v78, sel_initWithFileAtPath_, v79);

      if (v80)
      {
        swift_bridgeObjectRelease();
        v81 = v129;
        v82 = *(_QWORD *)(v129 + 40);
        v83 = __OFADD__(v82, v74);
        v84 = v82 + v74;
        if (v83)
        {
          __break(1u);
        }
        else
        {
          *(_QWORD *)(v129 + 40) = v84;
          sub_237639EB0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256801130);
          v85 = swift_initStackObject();
          *(_OWORD *)(v85 + 16) = v126;
          v86 = v128;
          swift_bridgeObjectRetain();
          v87 = sub_23764A0B4();
          v89 = v88;
          *(_QWORD *)(v85 + 56) = &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
          *(_QWORD *)(v85 + 64) = &off_2508EB4E0;
          v90 = (_QWORD *)swift_allocObject();
          *(_QWORD *)(v85 + 32) = v90;
          v90[2] = v127;
          v90[3] = v86;
          v90[4] = v87;
          v90[5] = v89;
          *(_QWORD *)(v85 + 96) = &type metadata for HTTPMultipartFormDataBuilder.ContentType;
          *(_QWORD *)(v85 + 104) = &off_2508EB4D0;
          *(_QWORD *)(v85 + 72) = v132;
          *(_QWORD *)(v85 + 80) = v68;
          sub_23763A0D0(v85);
          swift_setDeallocating();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256801138);
          swift_arrayDestroy();
          v77 = v80;
          MEMORY[0x23B816A00]();
          v34 = v120;
          if (*(_QWORD *)((*(_QWORD *)(v81 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*(_QWORD *)(v81 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                             + 0x18) >> 1)
          {
LABEL_30:
            sub_23764A510();
            sub_23764A4F8();

            (*((void (**)(char *, uint64_t))v34 + 1))(v135, v121);
            return sub_237626E98((uint64_t)v130, &qword_256800728);
          }
        }
        sub_23764A504();
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
      if (qword_256800638 != -1)
        swift_once();
      v105 = sub_23764A270();
      __swift_project_value_buffer(v105, (uint64_t)qword_2568010F8);
      swift_bridgeObjectRetain();
      v106 = sub_23764A258();
      v107 = sub_23764A594();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = (uint8_t *)swift_slowAlloc();
        v109 = swift_slowAlloc();
        v137 = v109;
        *(_DWORD *)v108 = 136315138;
        swift_bridgeObjectRetain();
        v136 = sub_237626560(v75, (unint64_t)v77, &v137);
        sub_23764A600();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23761E000, v106, v107, "Unable to open file at: %s", v108, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B817198](v109, -1, -1);
        MEMORY[0x23B817198](v108, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v110 = v121;
      v111 = (uint64_t)v130;
      sub_23763C440();
      swift_allocError();
      *v112 = 1;
      swift_willThrow();
      (*((void (**)(char *, uint64_t))v120 + 1))(v135, v110);
      v104 = v111;
    }
    return sub_237626E98(v104, &qword_256800728);
  }
  return result;
}

id sub_23763B484()
{
  uint64_t v0;
  uint64_t v1;
  objc_class *v2;
  char *v3;
  char *v4;
  objc_super v6;
  uint64_t v7;
  unint64_t v8;

  v7 = 757926413;
  v8 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A438();
  sub_237639F84(757926413, 0xE400000000000000);
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 32);
  v2 = (objc_class *)type metadata accessor for AggregateInputStream();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streams] = v1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status] = 0;
  v4 = &v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator];
  *(_QWORD *)v4 = v1;
  *((_QWORD *)v4 + 1) = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  swift_bridgeObjectRetain_n();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_23763B58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23763A3AC(a1, a2, a3, a4);
}

uint64_t sub_23763B5A4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_23764A480();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B81697C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_23763B61C()
{
  __asm { BR              X11 }
}

_QWORD *sub_23763B67C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_23763B90C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23763BE34(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23763BEF4((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23763BF6C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_23763B980(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_23763B9E4(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_23764A00C();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_23764A030();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_23764A024();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_23763BA90@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_23764A66C();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23763BB18(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v9 = result;
  v22 = MEMORY[0x24BEE4AF8];
  result = sub_237626B3C(0, v4 & ~(v4 >> 63), 0);
  if (a2 >= v9 && (v4 & 0x8000000000000000) == 0)
  {
    v10 = 0;
    v5 = v22;
    v11 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v11 = a3 & 0xFFFFFFFFFFFFLL;
    v20 = v11;
    while (v10 != v4)
    {
      if (!v20)
        goto LABEL_20;
      result = sub_23764A414();
      if (result < 0)
        goto LABEL_21;
      v12 = result;
      if (!result)
        goto LABEL_22;
      v21 = 0;
      MEMORY[0x23B8171A4](&v21, 8);
      if (v12 > v21 * v12)
      {
        v13 = -(uint64_t)v12 % v12;
        while (v13 > v21 * v12)
        {
          v21 = 0;
          MEMORY[0x23B8171A4](&v21, 8);
        }
      }
      sub_23764A42C();
      result = sub_23764A498();
      v14 = result;
      v16 = v15;
      v22 = v5;
      v18 = *(_QWORD *)(v5 + 16);
      v17 = *(_QWORD *)(v5 + 24);
      if (v18 >= v17 >> 1)
      {
        result = sub_237626B3C(v17 > 1, v18 + 1, 1);
        v5 = v22;
      }
      ++v10;
      *(_QWORD *)(v5 + 16) = v18 + 1;
      v19 = v5 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v14;
      *(_QWORD *)(v19 + 40) = v16;
      if (v10 == v4)
        return v5;
    }
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
  return result;
}

uint64_t sub_23763BCDC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  sub_23764A660();
  swift_bridgeObjectRelease();
  sub_23763BB18(0, 20, 0xD00000000000003ELL, 0x800000023764B6C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801160);
  sub_2376372E4(&qword_256801168, &qword_256801160, MEMORY[0x24BEE12C8]);
  sub_23764A4A4();
  sub_23764A438();
  swift_bridgeObjectRelease();
  sub_23764A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23764A438();
  result = swift_bridgeObjectRelease();
  *a1 = 0xD000000000000018;
  a1[1] = 0x800000023764B6A0;
  a1[2] = 0xD00000000000001ELL;
  a1[3] = 0x800000023764B700;
  a1[4] = MEMORY[0x24BEE4AF8];
  a1[5] = 0;
  return result;
}

uint64_t sub_23763BE34(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
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

uint64_t sub_23763BEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23764A03C();
  swift_allocObject();
  result = sub_23764A000();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23764A150();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_23763BF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23764A03C();
  swift_allocObject();
  result = sub_23764A000();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_23763BFEC(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_23763BE34(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_23763BEF4((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_23763BF6C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_23763C050(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_23764A03C();
      swift_allocObject();
      sub_23764A018();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23764A150();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_23763C0EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_23763B980((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_23763C148, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_23763C148@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23763BA90(a1, a2);
}

uint64_t sub_23763C164(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801150);
  v10 = sub_2376372E4(&qword_256801158, &qword_256801150, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_23763B90C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_23763C214(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801148);
    v3 = sub_23764A654();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_23764A3A8();
      sub_23764A7EC();
      v7 = v6;
      sub_23764A408();
      v8 = sub_23764A804();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_23764A3A8();
        v17 = v16;
        if (v15 == sub_23764A3A8() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_23764A780();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_23764A3A8();
          v24 = v23;
          if (v22 == sub_23764A3A8() && v24 == v25)
            goto LABEL_3;
          v27 = sub_23764A780();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

unint64_t sub_23763C440()
{
  unint64_t result;

  result = qword_256801128;
  if (!qword_256801128)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E494, &type metadata for HTTPMultipartFormDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_256801128);
  }
  return result;
}

unint64_t sub_23763C484()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256800748;
  if (!qword_256800748)
  {
    v1 = sub_23764A120();
    result = MEMORY[0x23B8170FC](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_256800748);
  }
  return result;
}

uint64_t sub_23763C4CC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_23763C4F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256801140;
  if (!qword_256801140)
  {
    v1 = sub_23764A228();
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE6400], v1);
    atomic_store(result, (unint64_t *)&qword_256801140);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for HTTPMultipartFormDataBuilder.ContentType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HTTPMultipartFormDataBuilder.ContentType()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for HTTPMultipartFormDataBuilder.ContentType(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HTTPMultipartFormDataBuilder.ContentType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentType(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentType(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.ContentType()
{
  return &type metadata for HTTPMultipartFormDataBuilder.ContentType;
}

uint64_t destroy for HTTPMultipartFormDataBuilder.ContentDisposition()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for HTTPMultipartFormDataBuilder.ContentDisposition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HTTPMultipartFormDataBuilder.ContentDisposition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

_QWORD *assignWithTake for HTTPMultipartFormDataBuilder.ContentDisposition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentDisposition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.ContentDisposition(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.ContentDisposition()
{
  return &type metadata for HTTPMultipartFormDataBuilder.ContentDisposition;
}

uint64_t storeEnumTagSinglePayload for HTTPMultipartFormDataBuilder.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23763C888 + 4 * byte_23764E375[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23763C8BC + 4 * byte_23764E370[v4]))();
}

uint64_t sub_23763C8BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23763C8C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23763C8CCLL);
  return result;
}

uint64_t sub_23763C8D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23763C8E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23763C8E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23763C8EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPMultipartFormDataBuilder.Error()
{
  return &type metadata for HTTPMultipartFormDataBuilder.Error;
}

unint64_t sub_23763C90C()
{
  unint64_t result;

  result = qword_256801170;
  if (!qword_256801170)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E44C, &type metadata for HTTPMultipartFormDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_256801170);
  }
  return result;
}

id sub_23763C9D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TaskDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TaskDelegate()
{
  return objc_opt_self();
}

void sub_23763CA30(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23763CA78()
{
  sub_23764A408();
  return swift_bridgeObjectRelease();
}

void sub_23763CB4C(uint64_t a1, char a2)
{
  sub_23764A7EC();
  __asm { BR              X10 }
}

uint64_t sub_23763CBA0()
{
  sub_23764A408();
  swift_bridgeObjectRelease();
  return sub_23764A804();
}

uint64_t sub_23763CC88@<X0>(uint64_t a1@<X8>)
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
  uint64_t result;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = sub_23764A120();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v37 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237649FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, v1, v8);
  v9 = swift_bridgeObjectRetain();
  v10 = sub_23763E06C(v9);
  result = swift_bridgeObjectRelease();
  v12 = 0;
  v13 = v10 + 56;
  v14 = 1 << *(_BYTE *)(v10 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v10 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  v34 = v3;
  v35 = v17;
  v36 = v10 + 56;
  while (v16)
  {
    v18 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v19 = v18 | (v12 << 6);
LABEL_26:
    if (*(_BYTE *)(*(_QWORD *)(v10 + 48) + v19) == 6)
    {
      sub_237649FB8();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3))
      {
        result = sub_23763E0DC((uint64_t)v7);
      }
      else
      {
        v23 = v37;
        (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v37, v7, v3);
        sub_23763E0DC((uint64_t)v7);
        v24 = sub_23764A0D8();
        if (v25)
        {
          v26 = v24;
          v27 = v25;
          v28 = v4;
          v29 = a1;
          v30 = sub_23764A0FC();
          if ((v31 & 1) == 0)
          {
            v32 = v30;
            v39 = v26;
            v40 = v27;
            sub_23764A438();
            v38 = v32;
            sub_23764A774();
            sub_23764A438();
            swift_bridgeObjectRelease();
          }
          a1 = v29;
          v4 = v28;
          v3 = v34;
          (*(void (**)(char *, uint64_t))(v4 + 8))(v37, v34);
          sub_237649FC4();
          result = swift_bridgeObjectRelease();
        }
        else
        {
          result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v23, v3);
        }
        v17 = v35;
        v13 = v36;
      }
    }
  }
  v20 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v20 >= v17)
    return swift_release();
  v21 = *(_QWORD *)(v13 + 8 * v20);
  ++v12;
  if (v21)
    goto LABEL_25;
  v12 = v20 + 1;
  if (v20 + 1 >= v17)
    return swift_release();
  v21 = *(_QWORD *)(v13 + 8 * v12);
  if (v21)
    goto LABEL_25;
  v12 = v20 + 2;
  if (v20 + 2 >= v17)
    return swift_release();
  v21 = *(_QWORD *)(v13 + 8 * v12);
  if (v21)
  {
LABEL_25:
    v16 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v12 << 6);
    goto LABEL_26;
  }
  v22 = v20 + 3;
  if (v22 >= v17)
    return swift_release();
  v21 = *(_QWORD *)(v13 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v17)
      return swift_release();
    v21 = *(_QWORD *)(v13 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23763CFA8(char *a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v10;
  uint64_t v12;

  v4 = *v2;
  v5 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain();
  sub_23763CB4C(v5, a2);
  v7 = v6 & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v10;
  *v10 = 0x8000000000000000;
  sub_23763D740(a2, v7, isUniquelyReferenced_nonNull_native);
  *v10 = v12;
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

uint64_t sub_23763D34C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801218);
  v2 = sub_23764A648();
  if (!*(_QWORD *)(v1 + 16))
    goto LABEL_25;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v14 = (_QWORD *)(v1 + 56);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_retain();
  if (v5)
  {
    v7 = __clz(__rbit64(v5));
    goto LABEL_20;
  }
  if (v6 > 1)
  {
    v8 = *(_QWORD *)(v1 + 64);
    v9 = 1;
    if (v8)
      goto LABEL_19;
    v9 = 2;
    if (v6 > 2)
    {
      v8 = *(_QWORD *)(v1 + 72);
      if (v8)
        goto LABEL_19;
      v9 = 3;
      if (v6 > 3)
      {
        v8 = *(_QWORD *)(v1 + 80);
        if (!v8)
        {
          v10 = 4;
          if (v6 > 4)
          {
            v8 = *(_QWORD *)(v1 + 88);
            if (v8)
            {
              v9 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v9 = v10 + 1;
              if (__OFADD__(v10, 1))
              {
                __break(1u);
                JUMPOUT(0x23763D720);
              }
              if (v9 >= v6)
                break;
              v8 = v14[v9];
              ++v10;
              if (v8)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v7 = __clz(__rbit64(v8)) + (v9 << 6);
LABEL_20:
        v11 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 48) + v7);
        sub_23764A7EC();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v12 = 1 << *(_BYTE *)(v1 + 32);
  if (v12 > 63)
    bzero(v14, ((unint64_t)(v12 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v14 = -1 << v12;
  *(_QWORD *)(v1 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v0 = v2;
  return result;
}

void sub_23763D740(char a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  char v15;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_23763D34C();
    }
    else
    {
      if (v7 > v6)
      {
        sub_23763DB20();
        goto LABEL_10;
      }
      sub_23763DCB0();
    }
    v8 = *v3;
    sub_23763CB4C(*(_QWORD *)(*v3 + 40), a1);
    a2 = v9 & ~(-1 << *(_BYTE *)(v8 + 32));
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
      __asm { BR              X9 }
  }
LABEL_10:
  v10 = *v14;
  *(_QWORD *)(*v14 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v10 + 48) + a2) = v15;
  v11 = *(_QWORD *)(v10 + 16);
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
    JUMPOUT(0x23763DAC4);
  }
  *(_QWORD *)(v10 + 16) = v13;
}

void *sub_23763DB20()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801218);
  v2 = *v0;
  v3 = sub_23764A63C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23763DCB0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256801218);
  v2 = sub_23764A648();
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v3 = 1 << *(_BYTE *)(v1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v12 = (unint64_t)(v3 + 63) >> 6;
  swift_retain();
  if (v5)
  {
    v6 = __clz(__rbit64(v5));
    goto LABEL_20;
  }
  if (v12 > 1)
  {
    v7 = *(_QWORD *)(v1 + 64);
    v8 = 1;
    if (v7)
      goto LABEL_19;
    v8 = 2;
    if (v12 > 2)
    {
      v7 = *(_QWORD *)(v1 + 72);
      if (v7)
        goto LABEL_19;
      v8 = 3;
      if (v12 > 3)
      {
        v7 = *(_QWORD *)(v1 + 80);
        if (!v7)
        {
          v9 = 4;
          if (v12 > 4)
          {
            v7 = *(_QWORD *)(v1 + 88);
            if (v7)
            {
              v8 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v8 = v9 + 1;
              if (__OFADD__(v9, 1))
              {
                __break(1u);
                JUMPOUT(0x23763E04CLL);
              }
              if (v8 >= v12)
                break;
              v7 = *(_QWORD *)(v1 + 56 + 8 * v8);
              ++v9;
              if (v7)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
LABEL_20:
        v10 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 48) + v6);
        sub_23764A7EC();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
LABEL_23:
  *v0 = v2;
  return result;
}

uint64_t sub_23763E06C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23763E11C();
  result = sub_23764A564();
  v7 = result;
  if (v2)
  {
    v4 = (char *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_23763CFA8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_23763E0DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23763E11C()
{
  unint64_t result;

  result = qword_256801210;
  if (!qword_256801210)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E314, &type metadata for HTTPHeader);
    atomic_store(result, (unint64_t *)&qword_256801210);
  }
  return result;
}

uint64_t sub_23763E160()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256801220);
  __swift_project_value_buffer(v0, (uint64_t)qword_256801220);
  return sub_23764A264();
}

uint64_t sub_23763E1DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801288);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

id sub_23763E21C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncTaskDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23763E290()
{
  return type metadata accessor for AsyncTaskDelegate();
}

uint64_t type metadata accessor for AsyncTaskDelegate()
{
  uint64_t result;

  result = qword_256801268;
  if (!qword_256801268)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23763E2D4()
{
  unint64_t v0;

  sub_23763E340();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23763E340()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256801278)
  {
    sub_23763E3B0();
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_256800B80);
    v0 = sub_23764A540();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256801278);
  }
}

unint64_t sub_23763E3B0()
{
  unint64_t result;

  result = qword_256801280;
  if (!qword_256801280)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256801280);
  }
  return result;
}

void sub_23763E464(void *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD *v34;
  NSObject *v35;
  uint64_t v36;
  os_log_t v37;
  NSObject *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;

  v3 = v2;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801288);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256800640 != -1)
    swift_once();
  v10 = sub_23764A270();
  __swift_project_value_buffer(v10, (uint64_t)qword_256801220);
  v11 = a1;
  v12 = a2;
  v13 = v11;
  v14 = a2;
  v15 = sub_23764A258();
  v16 = sub_23764A57C();
  if (!os_log_type_enabled(v15, v16))
  {

    if (!a2)
      goto LABEL_10;
LABEL_7:
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v6);
    v43 = a2;
    v22 = a2;
    sub_23764A528();
LABEL_12:
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return;
  }
  v37 = v15;
  v39 = v9;
  v40 = v2;
  v41 = v7;
  v42 = v6;
  v17 = swift_slowAlloc();
  v18 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v17 = 138412546;
  v43 = v13;
  v19 = v13;
  sub_23764A600();
  v38 = v13;
  *v18 = v13;

  *(_WORD *)(v17 + 12) = 2112;
  if (a2)
  {
    v20 = a2;
    v21 = _swift_stdlib_bridgeErrorToNSError();
    v43 = v21;
    sub_23764A600();
  }
  else
  {
    v43 = 0;
    sub_23764A600();
    v21 = 0;
  }
  v18[1] = v21;

  v23 = v37;
  _os_log_impl(&dword_23761E000, v37, v16, "Task [%@] completed with error: %@", (uint8_t *)v17, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
  swift_arrayDestroy();
  MEMORY[0x23B817198](v18, -1, -1);
  MEMORY[0x23B817198](v17, -1, -1);

  v7 = v41;
  v6 = v42;
  v9 = v39;
  v3 = v40;
  v13 = v38;
  if (a2)
    goto LABEL_7;
LABEL_10:
  v24 = -[NSObject response](v13, sel_response);
  if (v24)
  {
    v25 = v24;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v6);
    v43 = v25;
    sub_23764A534();
    goto LABEL_12;
  }
  v26 = v13;
  v27 = sub_23764A258();
  v28 = sub_23764A594();
  if (os_log_type_enabled(v27, v28))
  {
    v41 = v7;
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    v42 = v6;
    v43 = v26;
    *(_DWORD *)v29 = 138412290;
    v31 = v26;
    v40 = v3;
    v32 = v31;
    v7 = v41;
    v6 = v42;
    sub_23764A600();
    *v30 = v26;

    v3 = v40;
    _os_log_impl(&dword_23761E000, v27, v28, "No response set for task [%@]", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v30, -1, -1);
    MEMORY[0x23B817198](v29, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  sub_23763E958();
  v33 = swift_allocError();
  *v34 = 0;
  v34[1] = 0;
  swift_willThrow();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3 + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation, v6);
  v43 = v33;
  v35 = v33;
  sub_23764A528();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

unint64_t sub_23763E958()
{
  unint64_t result;

  result = qword_256801290;
  if (!qword_256801290)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E5C8, &type metadata for FileTransfer.Error);
    atomic_store(result, (unint64_t *)&qword_256801290);
  }
  return result;
}

id sub_23763E99C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  char *v14;
  objc_class *v15;
  id v16;
  objc_super v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801288);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a1, v8);
  v13 = (char *)objc_allocWithZone((Class)type metadata accessor for AsyncTaskDelegate());
  v12(&v13[OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation], (uint64_t)v11, v8);
  v14 = &v13[OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler];
  *(_QWORD *)v14 = a3;
  *((_QWORD *)v14 + 1) = a4;
  v15 = (objc_class *)type metadata accessor for AuthTaskDelegate();
  v18.receiver = v13;
  v18.super_class = v15;
  swift_retain();
  v16 = objc_msgSendSuper2(&v18, sel_init);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  objc_msgSend(a2, sel_setDelegate_, v16);

  return objc_msgSend(a2, sel_resume);
}

unint64_t destroy for FileTransfer.Error(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s15CTLazuliSupport12FileTransferO5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for FileTransfer.Error(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FileTransfer.Error(uint64_t a1, uint64_t a2)
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
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileTransfer.Error(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
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

uint64_t storeEnumTagSinglePayload for FileTransfer.Error(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2 + 3;
  }
  return result;
}

uint64_t sub_23763ECE4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23763ECFC(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FileTransfer.Error()
{
  return &type metadata for FileTransfer.Error;
}

void sub_23763ED2C(char *a1)
{
  sub_237631440(*a1);
}

void sub_23763ED38()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23764A7EC();
  __asm { BR              X9 }
}

uint64_t sub_23763ED7C()
{
  sub_23764A408();
  swift_bridgeObjectRelease();
  return sub_23764A804();
}

void sub_23763EDF8()
{
  __asm { BR              X10 }
}

uint64_t sub_23763EE2C()
{
  sub_23764A408();
  return swift_bridgeObjectRelease();
}

void sub_23763EE94()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23764A7EC();
  __asm { BR              X9 }
}

uint64_t sub_23763EED4()
{
  sub_23764A408();
  swift_bridgeObjectRelease();
  return sub_23764A804();
}

uint64_t sub_23763EF50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23763F0F8();
  *a1 = result;
  return result;
}

uint64_t sub_23763EF7C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23763EFA4 + 4 * byte_23764E61C[*v0]))();
}

void sub_23763EFA4(_QWORD *a1@<X8>)
{
  *a1 = 0x444D2D3176414B41;
  a1[1] = 0xE900000000000035;
}

void sub_23763EFC4(_QWORD *a1@<X8>)
{
  *a1 = 0x3635322D414853;
  a1[1] = 0xE700000000000000;
}

void sub_23763EFE0(_QWORD *a1@<X8>)
{
  *a1 = 0x2D3231352D414853;
  a1[1] = 0xEB00000000363532;
}

uint64_t sub_23763F004()
{
  sub_237640A3C();
  return sub_23764A4D4();
}

uint64_t sub_23763F060()
{
  sub_237640A3C();
  return sub_23764A4C8();
}

unint64_t sub_23763F0AC(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_23764A4BC();
  __break(1u);
  return result;
}

uint64_t sub_23763F0F8()
{
  unint64_t v0;

  v0 = sub_23764A714();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

void sub_23763F140(void *a1@<X0>, uint64_t a2@<X8>)
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  void (**v71)(_QWORD, _QWORD);
  void (**v72)(_QWORD, _QWORD);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  char v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  id v177;
  uint64_t v178;
  char *v179;
  void (**v180)(_QWORD, _QWORD);
  uint64_t v181;
  char *v182;
  char *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  char *v190;
  uint64_t v191;

  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801298);
  v158 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v157 = (char *)&v152 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012A0);
  MEMORY[0x24BDAC7A8](v5);
  v160 = (char *)&v152 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012A8);
  v162 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163);
  v161 = (char *)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012B0);
  MEMORY[0x24BDAC7A8](v8);
  v164 = (char *)&v152 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237649FE8();
  v185 = *(_QWORD *)(v10 - 8);
  v186 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v184 = (char *)&v152 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012B8);
  v166 = *(_QWORD *)(v167 - 8);
  MEMORY[0x24BDAC7A8](v167);
  v165 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012C0);
  MEMORY[0x24BDAC7A8](v13);
  v168 = (char *)&v152 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012C8);
  v170 = *(_QWORD *)(v171 - 8);
  MEMORY[0x24BDAC7A8](v171);
  v169 = (char *)&v152 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012D0);
  MEMORY[0x24BDAC7A8](v16);
  v172 = (char *)&v152 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012D8);
  v174 = *(_QWORD *)(v18 - 8);
  v175 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v173 = (char *)&v152 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012E0);
  MEMORY[0x24BDAC7A8](v20);
  v176 = (char *)&v152 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009F0);
  v180 = *(void (***)(_QWORD, _QWORD))(v22 - 8);
  v181 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v179 = (char *)&v152 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568009F8);
  MEMORY[0x24BDAC7A8](v24);
  v182 = (char *)&v152 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012E8);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v152 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012F0);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v152 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568012F8);
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v183 = (char *)&v152 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = (void *)sub_23764A384();
  v37 = objc_msgSend(a1, sel_valueForHTTPHeaderField_, v36);

  if (v37)
  {
    v177 = a1;
    v178 = a2;
    v38 = sub_23764A3A8();
    v40 = v39;

    v188 = v38;
    v189 = v40;
    sub_23764A1D4();
    sub_23762B14C();
    sub_23762B1D4(&qword_256801300, &qword_2568012E8);
    sub_23764A36C();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) == 1)
    {
      swift_bridgeObjectRelease();

      sub_237626E98((uint64_t)v32, &qword_2568012F0);
LABEL_13:
      v41 = 0;
      v37 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      a2 = v178;
      goto LABEL_14;
    }
    v49 = v183;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v183, v32, v33);
    swift_getKeyPath();
    v156 = v34;
    v155 = v33;
    sub_23764A1E0();
    swift_release();
    v50 = sub_23763F0AC(v188, v38, v40);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    swift_bridgeObjectRelease();
    v188 = v50;
    v189 = v52;
    v190 = v54;
    v191 = v56;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800A38);
    v57 = v179;
    sub_23764A1D4();
    v58 = sub_23764056C();
    sub_23762B1D4(&qword_256800A40, &qword_2568009F0);
    v59 = v182;
    v60 = v181;
    v154 = v58;
    sub_23764A354();
    v61 = (uint64_t)v59;
    ((void (**)(char *, uint64_t))v180)[1](v57, v60);
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800A00);
    v63 = *(_QWORD *)(v62 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v61, 1, v62) == 1)
    {

      swift_bridgeObjectRelease();
      sub_237626E98(v61, &qword_2568009F8);
      (*(void (**)(char *, uint64_t))(v156 + 8))(v49, v155);
      goto LABEL_13;
    }
    swift_getKeyPath();
    v64 = v52;
    v65 = v54;
    v66 = v50;
    sub_23764A1E0();
    swift_release();
    v67 = v188;
    v68 = v189;
    v181 = v56;
    v69 = v190;
    v70 = v191;
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v62);
    v182 = (char *)MEMORY[0x23B816910](v67, v68, v69, v70);
    v72 = v71;
    v73 = v181;
    swift_bridgeObjectRelease();
    v188 = v66;
    v189 = v64;
    v190 = v65;
    v191 = v73;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801310);
    v74 = v173;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256801318, &qword_2568012D8);
    v75 = (uint64_t)v176;
    v76 = v175;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v174 + 8))(v74, v76);
    v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801320);
    v78 = *(_QWORD *)(v77 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v75, 1, v77) == 1)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_237626E98(v75, &qword_2568012E0);
      (*(void (**)(char *, uint64_t))(v156 + 8))(v183, v155);
LABEL_12:
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    v180 = v72;
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v79 = v188;
    v80 = v189;
    v81 = v190;
    v82 = v191;
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v75, v77);
    v175 = MEMORY[0x23B816910](v79, v80, v81, v82);
    v84 = v83;
    v85 = v181;
    swift_bridgeObjectRelease();
    v179 = (char *)v66;
    v188 = v66;
    v189 = v64;
    v190 = v65;
    v191 = v85;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801328);
    v86 = v169;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256801330, &qword_2568012C8);
    v87 = v64;
    v88 = (uint64_t)v172;
    v89 = v171;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v170 + 8))(v86, v89);
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801338);
    v91 = *(_QWORD *)(v90 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v88, 1, v90) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_237626E98(v88, &qword_2568012D0);
      (*(void (**)(char *, uint64_t))(v156 + 8))(v183, v155);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    v176 = v65;
    v153 = v87;
    v174 = v84;
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v92 = v188;
    v93 = v189;
    v94 = (*(uint64_t (**)(uint64_t, uint64_t))(v91 + 8))(v88, v90);
    v188 = 44;
    v189 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v94);
    *(&v152 - 2) = (uint64_t)&v188;
    swift_bridgeObjectRetain();
    v95 = sub_23762580C(0x7FFFFFFFFFFFFFFFLL, 1, sub_237626F5C, (uint64_t)(&v152 - 4), v92, v93);
    swift_bridgeObjectRelease();
    v96 = *(_QWORD *)(v95 + 16);
    if (v96)
    {
      v187 = MEMORY[0x24BEE4AF8];
      sub_237626B58(0, v96, 0);
      v97 = (uint64_t *)(v95 + 56);
      do
      {
        v98 = *(v97 - 3);
        v99 = *(v97 - 2);
        v100 = *(v97 - 1);
        v101 = *v97;
        swift_bridgeObjectRetain();
        v188 = MEMORY[0x23B816910](v98, v99, v100, v101);
        v189 = v102;
        v103 = v184;
        sub_237649FDC();
        sub_2376405B0();
        v104 = sub_23764A618();
        v106 = v105;
        (*(void (**)(char *, uint64_t))(v185 + 8))(v103, v186);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v45 = v187;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_237626B58(0, *(_QWORD *)(v45 + 16) + 1, 1);
          v45 = v187;
        }
        v108 = *(_QWORD *)(v45 + 16);
        v107 = *(_QWORD *)(v45 + 24);
        if (v108 >= v107 >> 1)
        {
          sub_237626B58(v107 > 1, v108 + 1, 1);
          v45 = v187;
        }
        *(_QWORD *)(v45 + 16) = v108 + 1;
        v109 = v45 + 16 * v108;
        *(_QWORD *)(v109 + 32) = v104;
        *(_QWORD *)(v109 + 40) = v106;
        v97 += 4;
        --v96;
      }
      while (v96);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v45 = MEMORY[0x24BEE4AF8];
    }
    v110 = v156;
    v111 = (unint64_t)v179;
    v188 = (uint64_t)v179;
    v189 = v153;
    v112 = v181;
    v190 = v176;
    v191 = v181;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801348);
    v113 = v165;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256801350, &qword_2568012B8);
    v114 = (uint64_t)v168;
    v115 = v167;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v166 + 8))(v113, v115);
    v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801358);
    v117 = *(_QWORD *)(v116 - 8);
    LODWORD(v186) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v117 + 48))(v114, 1, v116);
    if ((_DWORD)v186 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_237626E98(v114, &qword_2568012C0);
      (*(void (**)(char *, uint64_t))(v110 + 8))(v183, v155);
LABEL_31:
      a2 = v178;
LABEL_32:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((_DWORD)v186 != 1)
        swift_bridgeObjectRelease();
      v41 = 0;
      v37 = 0;
      goto LABEL_5;
    }
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v118 = v188;
    v119 = v189;
    v120 = v112;
    v121 = v190;
    v122 = v191;
    (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v114, v116);
    v46 = MEMORY[0x23B816910](v118, v119, v121, v122);
    v47 = v123;
    swift_bridgeObjectRelease();
    v188 = v111;
    v189 = v153;
    v190 = v176;
    v191 = v120;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801360);
    v124 = v161;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256801368, &qword_2568012A8);
    v125 = (uint64_t)v164;
    v126 = v163;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v162 + 8))(v124, v126);
    v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801370);
    v128 = *(_QWORD *)(v127 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v128 + 48))(v125, 1, v127) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_237626E98(v125, &qword_2568012B0);
LABEL_30:
      (*(void (**)(char *, uint64_t))(v156 + 8))(v183, v155);
      goto LABEL_31;
    }
    swift_getKeyPath();
    sub_23764A1E0();
    swift_release();
    v129 = v188;
    v130 = v189;
    v131 = v125;
    v132 = v190;
    v133 = v191;
    (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v131, v127);
    MEMORY[0x23B816910](v129, v130, v132, v133);
    swift_bridgeObjectRelease();
    v134 = sub_23763F0F8();
    if (v134 == 4)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    v185 = v134;
    v188 = (uint64_t)v179;
    v189 = v153;
    v190 = v176;
    v191 = v181;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256801378);
    v135 = v157;
    sub_23764A1D4();
    sub_23762B1D4(&qword_256801380, &qword_256801298);
    v136 = (uint64_t)v160;
    v137 = v159;
    sub_23764A354();
    (*(void (**)(char *, uint64_t))(v158 + 8))(v135, v137);
    swift_bridgeObjectRelease();
    v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801388);
    v139 = *(_QWORD *)(v138 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v136, 1, v138) == 1)
    {

      sub_237626E98(v136, &qword_2568012A0);
      v48 = 2;
    }
    else
    {
      swift_getKeyPath();
      sub_23764A1E0();
      swift_release();
      v140 = v188;
      v141 = v189;
      v142 = v136;
      v144 = v190;
      v143 = v191;
      (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v142, v138);
      v145 = MEMORY[0x23B816910](v140, v141, v144, v143);
      v147 = v146;
      swift_bridgeObjectRelease();
      if (v145 != 1702195828 || v147 != 0xE400000000000000)
      {
        v150 = sub_23764A780();
        a2 = v178;
        v148 = v155;
        v149 = v156;
        if ((v150 & 1) != 0)
        {

          swift_bridgeObjectRelease();
          v48 = 1;
        }
        else if (v145 == 0x65736C6166 && v147 == 0xE500000000000000)
        {

          swift_bridgeObjectRelease();
          v48 = 0;
        }
        else
        {
          v151 = sub_23764A780();

          swift_bridgeObjectRelease();
          v48 = 0;
          if ((v151 & 1) == 0)
          {
            (*(void (**)(char *, uint64_t))(v149 + 8))(v183, v148);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_32;
          }
        }
LABEL_41:
        (*(void (**)(char *, uint64_t))(v149 + 8))(v183, v148);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v43 = v174;
        swift_bridgeObjectRelease();
        v37 = v180;
        swift_bridgeObjectRelease();
        v44 = v185;
        v41 = v182;
        v42 = v175;
        goto LABEL_14;
      }

      swift_bridgeObjectRelease();
      v48 = 1;
    }
    a2 = v178;
    v148 = v155;
    v149 = v156;
    goto LABEL_41;
  }

  v41 = 0;
LABEL_5:
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
LABEL_14:
  *(_QWORD *)a2 = v41;
  *(_QWORD *)(a2 + 8) = v37;
  *(_QWORD *)(a2 + 16) = v42;
  *(_QWORD *)(a2 + 24) = v43;
  *(_QWORD *)(a2 + 32) = v44;
  *(_QWORD *)(a2 + 40) = v45;
  *(_QWORD *)(a2 + 48) = v46;
  *(_QWORD *)(a2 + 56) = v47;
  *(_BYTE *)(a2 + 64) = v48;
}

uint64_t sub_237640560@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 8);
  return result;
}

unint64_t sub_23764056C()
{
  unint64_t result;

  result = qword_256801308;
  if (!qword_256801308)
  {
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE1E18], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_256801308);
  }
  return result;
}

unint64_t sub_2376405B0()
{
  unint64_t result;

  result = qword_256801340;
  if (!qword_256801340)
  {
    result = MEMORY[0x23B8170FC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256801340);
  }
  return result;
}

uint64_t destroy for HTTPDigestAuthenticateInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HTTPDigestAuthenticateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAuthenticateInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPDigestAuthenticateInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAuthenticateInfo()
{
  return &type metadata for HTTPDigestAuthenticateInfo;
}

uint64_t getEnumTagSinglePayload for HTTPDigestAlgorithm(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HTTPDigestAlgorithm(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237640974 + 4 * byte_23764E625[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2376409A8 + 4 * byte_23764E620[v4]))();
}

uint64_t sub_2376409A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376409B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376409B8);
  return result;
}

uint64_t sub_2376409C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376409CCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2376409D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376409D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPDigestAlgorithm()
{
  return &type metadata for HTTPDigestAlgorithm;
}

unint64_t sub_2376409F8()
{
  unint64_t result;

  result = qword_256801390;
  if (!qword_256801390)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E81C, &type metadata for HTTPDigestAlgorithm);
    atomic_store(result, (unint64_t *)&qword_256801390);
  }
  return result;
}

unint64_t sub_237640A3C()
{
  unint64_t result;

  result = qword_256801398;
  if (!qword_256801398)
  {
    result = MEMORY[0x23B8170FC](&unk_23764E7A4, &type metadata for HTTPDigestAlgorithm);
    atomic_store(result, (unint64_t *)&qword_256801398);
  }
  return result;
}

int64_t sub_237640A80(int64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    if (result)
    {
      v14 = MEMORY[0x24BEE4AF8];
      sub_237626B58(0, result, 0);
      v4 = MEMORY[0x24BEE4260];
      v5 = MEMORY[0x24BEE42B0];
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA0);
        v6 = swift_allocObject();
        *(_OWORD *)(v6 + 16) = xmmword_23764DAE0;
        *(_QWORD *)(v6 + 56) = v4;
        *(_QWORD *)(v6 + 64) = v5;
        v15 = 0;
        MEMORY[0x23B8171A4](&v15, 8);
        *(_BYTE *)(v6 + 32) = v15;
        v7 = sub_23764A3C0();
        v9 = v8;
        v11 = *(_QWORD *)(v14 + 16);
        v10 = *(_QWORD *)(v14 + 24);
        if (v11 >= v10 >> 1)
          sub_237626B58(v10 > 1, v11 + 1, 1);
        *(_QWORD *)(v14 + 16) = v11 + 1;
        v12 = v14 + 16 * v11;
        *(_QWORD *)(v12 + 32) = v7;
        *(_QWORD *)(v12 + 40) = v9;
        --v3;
      }
      while (v3);
      v2 = a2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800AA8);
    sub_23762C554();
    sub_23764A378();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23764A438();
    swift_bridgeObjectRelease();
    return v2;
  }
  return result;
}

uint64_t FileUploadResult.transactionID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23764A1C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FileUploadResult.fileTransferInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FileUploadResult() + 20);
  v4 = sub_23764A1F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for FileUploadResult()
{
  uint64_t result;

  result = qword_2568013F8;
  if (!qword_2568013F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FileUploadResult.responseData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for FileUploadResult() + 24);
  v2 = *(_QWORD *)v1;
  sub_237626FF4(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileUploadResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23764A1C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23764A1F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = *v14;
    v16 = v14[1];
    sub_237626FF4(*v14, v16);
    *v13 = v15;
    v13[1] = v16;
  }
  return a1;
}

uint64_t destroy for FileUploadResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23764A1C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23764A1F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return sub_237626F18(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t initializeWithCopy for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;

  v6 = sub_23764A1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23764A1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_237626FF4(*v13, v15);
  *v12 = v14;
  v12[1] = v15;
  return a1;
}

uint64_t assignWithCopy for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v6 = sub_23764A1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23764A1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_237626FF4(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_237626F18(v16, v17);
  return a1;
}

uint64_t initializeWithTake for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23764A1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23764A1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for FileUploadResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v6 = sub_23764A1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23764A1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  sub_237626F18(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileUploadResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237641100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_23764A1C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23764A1F8();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  if (((4 * (_DWORD)v14) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v14) & 0xC | (v14 >> 2));
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FileUploadResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376411C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;

  v8 = sub_23764A1C8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23764A1F8();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  v15 = (_QWORD *)(a1 + *(int *)(a4 + 24));
  *v15 = 0;
  v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_23764127C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23764A1C8();
  if (v1 <= 0x3F)
  {
    result = sub_23764A1F8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t destroy for HTTPBasicAuthenticateResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for HTTPBasicAuthenticateResponse(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HTTPBasicAuthenticateResponse(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for HTTPBasicAuthenticateResponse(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HTTPBasicAuthenticateResponse()
{
  return &type metadata for HTTPBasicAuthenticateResponse;
}

uint64_t sub_23764147C()
{
  swift_bridgeObjectRetain();
  sub_23764A438();
  swift_bridgeObjectRelease();
  return 0x206369736142;
}

uint64_t sub_2376414E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t result;

  result = sub_23764A00C();
  if (!result || (result = sub_23764A030(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23764A024();
      a5(0);
      sub_2376298AC(a6, a5, a7);
      return sub_23764A2C4();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2376415B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;

  v3 = sub_23764A324();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8];
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23764A2E8();
  MEMORY[0x24BDAC7A8](v5);
  sub_2376298AC(&qword_256801440, v4, MEMORY[0x24BDC6AE8]);
  sub_23764A2DC();
  __asm { BR              X10 }
}

uint64_t sub_2376416B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;

  *(_QWORD *)(v7 - 128) = v5;
  *(_WORD *)(v7 - 120) = v4;
  *(_BYTE *)(v7 - 118) = BYTE2(v4);
  *(_BYTE *)(v7 - 117) = BYTE3(v4);
  *(_BYTE *)(v7 - 116) = BYTE4(v4);
  *(_BYTE *)(v7 - 115) = BYTE5(v4);
  sub_23764A2C4();
  sub_237626F18(v5, v4);
  sub_23764A2D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 160) + 8))(v3, v2);
  *(_QWORD *)(v7 - 104) = v0;
  *(_QWORD *)(v7 - 96) = sub_2376298AC(&qword_256801468, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC62D8]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 - 128));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v1, v0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 - 128), *(_QWORD *)(v7 - 104));
  sub_23764A048();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  v9 = *(_QWORD *)(v7 - 144);
  __swift_destroy_boxed_opaque_existential_1(v7 - 128);
  return v9;
}

void sub_237641948(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;

  v3 = sub_23764A330();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B38];
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23764A2F4();
  MEMORY[0x24BDAC7A8](v5);
  sub_2376298AC(&qword_256801470, v4, MEMORY[0x24BDC6B30]);
  sub_23764A2DC();
  __asm { BR              X10 }
}

uint64_t sub_237641A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;

  *(_QWORD *)(v7 - 128) = v5;
  *(_WORD *)(v7 - 120) = v4;
  *(_BYTE *)(v7 - 118) = BYTE2(v4);
  *(_BYTE *)(v7 - 117) = BYTE3(v4);
  *(_BYTE *)(v7 - 116) = BYTE4(v4);
  *(_BYTE *)(v7 - 115) = BYTE5(v4);
  sub_23764A2C4();
  sub_237626F18(v5, v4);
  sub_23764A2D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 160) + 8))(v3, v2);
  *(_QWORD *)(v7 - 104) = v0;
  *(_QWORD *)(v7 - 96) = sub_2376298AC(&qword_256801478, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6348], MEMORY[0x24BDC6338]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 - 128));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v1, v0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 - 128), *(_QWORD *)(v7 - 104));
  sub_23764A048();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  v9 = *(_QWORD *)(v7 - 144);
  __swift_destroy_boxed_opaque_existential_1(v7 - 128);
  return v9;
}

void sub_237641CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;

  v3 = sub_23764A33C();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B80];
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23764A348();
  MEMORY[0x24BDAC7A8](v5);
  sub_2376298AC(&qword_256801458, v4, MEMORY[0x24BDC6B70]);
  sub_23764A2DC();
  __asm { BR              X10 }
}

uint64_t sub_237641DE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;

  *(_QWORD *)(v7 - 128) = v5;
  *(_WORD *)(v7 - 120) = v4;
  *(_BYTE *)(v7 - 118) = BYTE2(v4);
  *(_BYTE *)(v7 - 117) = BYTE3(v4);
  *(_BYTE *)(v7 - 116) = BYTE4(v4);
  *(_BYTE *)(v7 - 115) = BYTE5(v4);
  sub_23764A2C4();
  sub_237626F18(v5, v4);
  sub_23764A2D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 160) + 8))(v3, v2);
  *(_QWORD *)(v7 - 104) = v0;
  *(_QWORD *)(v7 - 96) = sub_2376298AC(&qword_256801460, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6BA8], MEMORY[0x24BDC6B98]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 - 128));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v1, v0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 - 128), *(_QWORD *)(v7 - 104));
  sub_23764A048();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  v9 = *(_QWORD *)(v7 - 144);
  __swift_destroy_boxed_opaque_existential_1(v7 - 128);
  return v9;
}

uint64_t sub_237642070(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17;
  uint64_t v20[3];
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v8 = sub_23764A30C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801438);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = a1;
  v20[1] = a2;
  v23 = a3;
  v24 = a4;
  sub_237626FF4(a3, a4);
  sub_23764A300();
  sub_23764A324();
  sub_2376298AC(&qword_256801440, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
  sub_23764224C();
  sub_23764A318();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v21 = v12;
  v22 = sub_237642290();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(boxed_opaque_existential_1, v15, v12);
  __swift_project_boxed_opaque_existential_1(v20, v21);
  sub_23764A048();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v17 = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v17;
}

unint64_t sub_23764224C()
{
  unint64_t result;

  result = qword_256801448;
  if (!qword_256801448)
  {
    result = MEMORY[0x23B8170FC](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256801448);
  }
  return result;
}

unint64_t sub_237642290()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256801450;
  if (!qword_256801450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256801438);
    result = MEMORY[0x23B8170FC](MEMORY[0x24BDC6538], v1);
    atomic_store(result, (unint64_t *)&qword_256801450);
  }
  return result;
}

uint64_t FileUploadRequest.init(fileURL:fileContentType:thumbnailURL:thumbnailContentType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  int *v11;

  v10 = sub_23764A120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  v11 = (int *)type metadata accessor for FileUploadRequest();
  sub_237629868(a2, a5 + v11[5], &qword_256800728);
  sub_237629868(a3, a5 + v11[6], &qword_256800710);
  return sub_237629868(a4, a5 + v11[7], &qword_256800728);
}

uint64_t type metadata accessor for FileUploadRequest()
{
  uint64_t result;

  result = qword_2568014D8;
  if (!qword_2568014D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FileUploadRequest.fileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23764A120();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FileUploadRequest.fileContentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FileUploadRequest();
  return sub_23762651C(v1 + *(int *)(v3 + 20), a1, &qword_256800728);
}

uint64_t FileUploadRequest.thumbnailURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FileUploadRequest();
  return sub_23762651C(v1 + *(int *)(v3 + 24), a1, &qword_256800710);
}

uint64_t FileUploadRequest.thumbnailContentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for FileUploadRequest();
  return sub_23762651C(v1 + *(int *)(v3 + 28), a1, &qword_256800728);
}

char *initializeBufferWithCopyOfBuffer for FileUploadRequest(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v26)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23764A120();
    v8 = *(_QWORD *)(v7 - 8);
    v26 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v26(a1, a2, v7);
    v9 = a3[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_23764A228();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[6];
    v18 = &a1[v17];
    v19 = &a2[v17];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v17], 1, v7))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v26(v18, v19, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v18, 0, 1, v7);
    }
    v21 = a3[7];
    v22 = &a1[v21];
    v23 = &a2[v21];
    if (v14(v23, 1, v12))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v22, v23, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v22, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for FileUploadRequest(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = sub_23764A120();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = a1 + a2[5];
  v8 = sub_23764A228();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = a1 + a2[6];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4))
    v6(v11, v4);
  v12 = a1 + a2[7];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v10)(v12, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  return result;
}

char *initializeWithCopy for FileUploadRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v24)(void *, const void *, uint64_t);

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v24 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v24(a1, a2, v6);
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23764A228();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v15], 1, v6))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v24(v16, v17, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  if (v13(v21, 1, v11))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v20, v21, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v31(a1, a2, v6);
  v33 = a3;
  v8 = *(int *)(a3 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_23764A228();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  v32 = v12;
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(v33 + 24);
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v21 = v20(a1 + v17, 1, v6);
  v22 = v20((uint64_t)v19, 1, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v18, v19, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v18, v6);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  v31((uint64_t)v18, (uint64_t)v19, v6);
LABEL_13:
  v24 = *(int *)(v33 + 28);
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = v13((void *)(a1 + v24), 1, v11);
  v28 = v13(v26, 1, v11);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v32 + 24))(v25, v26, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v25, v11);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v32 + 16))(v25, v26, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v25, 0, 1, v11);
  return a1;
}

char *initializeWithTake for FileUploadRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v24)(void *, const void *, uint64_t);

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v24 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v24(a1, a2, v6);
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23764A228();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v15], 1, v6))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v24(v16, v17, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  if (v13(v21, 1, v11))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v21, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for FileUploadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v31(a1, a2, v6);
  v33 = a3;
  v8 = *(int *)(a3 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_23764A228();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  v32 = v12;
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(v33 + 24);
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v21 = v20(a1 + v17, 1, v6);
  v22 = v20((uint64_t)v19, 1, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v18, v19, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v18, v6);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  v31((uint64_t)v18, (uint64_t)v19, v6);
LABEL_13:
  v24 = *(int *)(v33 + 28);
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = v13((void *)(a1 + v24), 1, v11);
  v28 = v13(v26, 1, v11);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v32 + 40))(v25, v26, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v25, v11);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v32 + 32))(v25, v26, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v25, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileUploadRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23764312C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_23764A120();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for FileUploadRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376431D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23764A120();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800728);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_237643280()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23764A120();
  if (v0 <= 0x3F)
  {
    sub_237643340(319, (unint64_t *)&qword_256800D60, (void (*)(uint64_t))MEMORY[0x24BEE63C0]);
    if (v1 <= 0x3F)
    {
      sub_237643340(319, (unint64_t *)&qword_256800900, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_237643340(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23764A5D0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23764338C()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256801518);
  __swift_project_value_buffer(v0, (uint64_t)qword_256801518);
  return sub_23764A264();
}

uint64_t sub_2376433FC(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69[3];
  uint64_t v70;

  if (*(_QWORD *)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status] == 2)
  {
    v3 = v2;
    v6 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream;
    v7 = *(void **)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream];
    v8 = 0x256800000uLL;
    v67 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream;
    if (v7)
    {
LABEL_6:
      v12 = v7;
      if (!objc_msgSend(v12, sel_streamStatus))
      {
        if (*(_QWORD *)(v8 + 1608) != -1)
          swift_once();
        v13 = sub_23764A270();
        __swift_project_value_buffer(v13, (uint64_t)qword_256801518);
        v14 = v12;
        v15 = sub_23764A258();
        v16 = sub_23764A588();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          v18 = swift_slowAlloc();
          v69[0] = v18;
          *(_DWORD *)v17 = 136315138;
          v70 = (uint64_t)v14;
          sub_23764439C();
          v19 = v14;
          v20 = sub_23764A3E4();
          v70 = sub_237626560(v20, v21, v69);
          sub_23764A600();

          v8 = 0x256800000;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23761E000, v15, v16, "Opening stream: %s", v17, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B817198](v18, -1, -1);
          MEMORY[0x23B817198](v17, -1, -1);

          objc_msgSend(v14, sel_open, a1);
        }
        else
        {

          objc_msgSend(v14, sel_open, v64);
        }
      }
      if (*(_QWORD *)(v8 + 1608) != -1)
        swift_once();
      v23 = sub_23764A270();
      v24 = __swift_project_value_buffer(v23, (uint64_t)qword_256801518);
      v25 = v12;
      v26 = sub_23764A258();
      v27 = sub_23764A588();
      if (os_log_type_enabled(v26, v27))
      {
        v66 = v3;
        v28 = (uint8_t *)swift_slowAlloc();
        v64 = v24;
        v29 = swift_slowAlloc();
        v69[0] = v29;
        *(_DWORD *)v28 = 136315138;
        v70 = (uint64_t)v25;
        sub_23764439C();
        v30 = v25;
        v31 = sub_23764A3E4();
        v70 = sub_237626560(v31, v32, v69);
        sub_23764A600();

        v3 = v66;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23761E000, v26, v27, "Reading from stream %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B817198](v29, -1, -1);
        MEMORY[0x23B817198](v28, -1, -1);

      }
      else
      {

      }
      v33 = (uint64_t)-[NSObject read:maxLength:](v25, sel_read_maxLength_, a1, a2, v64);
      v22 = (id)v33;
      if (v33 < 1)
      {
        if (v33)
        {
          v37 = -[NSObject streamError](v25, sel_streamError);
          v38 = *(void **)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError];
          *(_QWORD *)&v3[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError] = v37;

          v34 = v25;
        }
        else
        {
          v34 = v25;
          v39 = sub_23764A258();
          v40 = sub_23764A588();
          if (os_log_type_enabled(v39, (os_log_type_t)v40))
          {
            v41 = (uint8_t *)swift_slowAlloc();
            v42 = swift_slowAlloc();
            v69[0] = v42;
            *(_DWORD *)v41 = 136315138;
            v70 = (uint64_t)v34;
            sub_23764439C();
            v65 = a1;
            v43 = v34;
            v44 = sub_23764A3E4();
            v70 = sub_237626560(v44, v45, v69);
            sub_23764A600();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23761E000, v39, (os_log_type_t)v40, "Closing stream: %s", v41, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B817198](v42, -1, -1);
            MEMORY[0x23B817198](v41, -1, -1);

          }
          else
          {

          }
          -[NSObject close](v34, sel_close, v65);
          v46 = *(void **)&v3[v67];
          *(_QWORD *)&v3[v67] = 0;

          v22 = objc_msgSend(v3, sel_read_maxLength_, a1, a2);
        }
      }
      else
      {
        v34 = sub_23764A258();
        v35 = sub_23764A588();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v36 = 134217984;
          v69[0] = (uint64_t)v22;
          sub_23764A600();
          _os_log_impl(&dword_23761E000, v34, v35, "Read %ld bytes", v36, 0xCu);
          MEMORY[0x23B817198](v36, -1, -1);

        }
        else
        {

          v34 = v25;
        }
      }
LABEL_44:

      return (uint64_t)v22;
    }
    v9 = (unint64_t *)&v2[OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator];
    swift_beginAccess();
    v11 = *v9;
    v10 = v9[1];
    if (*v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v47 = sub_23764A6E4();
      swift_bridgeObjectRelease();
      if (v10 == v47)
      {
LABEL_5:
        swift_endAccess();
        v7 = *(void **)&v3[v6];
        if (v7)
          goto LABEL_6;
LABEL_39:
        if (*(_QWORD *)(v8 + 1608) != -1)
          swift_once();
        v60 = sub_23764A270();
        __swift_project_value_buffer(v60, (uint64_t)qword_256801518);
        v34 = sub_23764A258();
        v61 = sub_23764A57C();
        if (os_log_type_enabled(v34, v61))
        {
          v62 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v62 = 0;
          _os_log_impl(&dword_23761E000, v34, v61, "No more streams to read from", v62, 2u);
          MEMORY[0x23B817198](v62, -1, -1);
        }
        v22 = 0;
        goto LABEL_44;
      }
    }
    else if (v10 == *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    v48 = *v9;
    if ((*v9 & 0xC000000000000001) == 0)
    {
      if ((v10 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v10 < *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v49 = *(id *)(v48 + 8 * v10 + 32);
        goto LABEL_33;
      }
      __break(1u);
      goto LABEL_49;
    }
    v49 = (id)MEMORY[0x23B816B98](v10);
LABEL_33:
    v11 = (unint64_t)v49;
    if (!__OFADD__(v10, 1))
    {
      v9[1] = v10 + 1;
      swift_endAccess();
      if (qword_256800648 == -1)
        goto LABEL_35;
      goto LABEL_50;
    }
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
LABEL_35:
    v50 = sub_23764A270();
    __swift_project_value_buffer(v50, (uint64_t)qword_256801518);
    v51 = (id)v11;
    v52 = sub_23764A258();
    v53 = sub_23764A588();
    if (os_log_type_enabled(v52, v53))
    {
      v68 = a2;
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v69[0] = v55;
      *(_DWORD *)v54 = 136315138;
      v70 = (uint64_t)v51;
      sub_23764439C();
      v56 = v51;
      v57 = sub_23764A3E4();
      v70 = sub_237626560(v57, v58, v69);
      v6 = v67;
      sub_23764A600();

      a2 = v68;
      v8 = 0x256800000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23761E000, v52, v53, "Advancing to next stream %s", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v55, -1, -1);
      MEMORY[0x23B817198](v54, -1, -1);

    }
    else
    {

    }
    v59 = *(void **)&v3[v6];
    *(_QWORD *)&v3[v6] = v51;

    v7 = *(void **)&v3[v6];
    if (v7)
      goto LABEL_6;
    goto LABEL_39;
  }
  return -1;
}

void sub_237643DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v1 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) != 2)
  {
    v2 = v0;
    if (qword_256800648 != -1)
      swift_once();
    v3 = sub_23764A270();
    __swift_project_value_buffer(v3, (uint64_t)qword_256801518);
    v4 = sub_23764A258();
    v5 = sub_23764A588();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23761E000, v4, v5, "Opening stream", v6, 2u);
      MEMORY[0x23B817198](v6, -1, -1);
    }

    v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_streamIterator);
    swift_beginAccess();
    v8 = v7[1];
    if ((unint64_t)*v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_23764A6E4();
      swift_bridgeObjectRelease();
      if (v8 == v10)
        goto LABEL_8;
    }
    else if (v8 == *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_8:
      v9 = 0;
LABEL_16:
      swift_endAccess();
      v13 = *(void **)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream);
      *(_QWORD *)(v2 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream) = v9;

      *(_QWORD *)(v2 + v1) = 2;
      return;
    }
    v11 = *v7;
    if ((*v7 & 0xC000000000000001) == 0)
    {
      if ((v8 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v8 < *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v12 = *(id *)(v11 + 8 * v8 + 32);
        goto LABEL_14;
      }
      __break(1u);
      goto LABEL_21;
    }
    v12 = (id)MEMORY[0x23B816B98](v8);
LABEL_14:
    v9 = v12;
    if (!__OFADD__(v8, 1))
    {
      v7[1] = v8 + 1;
      goto LABEL_16;
    }
LABEL_21:
    __break(1u);
  }
}

void sub_237643FE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) != 6)
  {
    v2 = v0;
    if (qword_256800648 != -1)
      swift_once();
    v3 = sub_23764A270();
    __swift_project_value_buffer(v3, (uint64_t)qword_256801518);
    v4 = sub_23764A258();
    v5 = sub_23764A588();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23761E000, v4, v5, "Closing stream", v6, 2u);
      MEMORY[0x23B817198](v6, -1, -1);
    }

    *(_QWORD *)(v2 + v1) = 6;
  }
}

id sub_2376442B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AggregateInputStream();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AggregateInputStream()
{
  return objc_opt_self();
}

uint64_t sub_23764435C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256801580);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23764439C()
{
  unint64_t result;

  result = qword_256801588;
  if (!qword_256801588)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256801588);
  }
  return result;
}

ValueMetadata *type metadata accessor for URLSessionAuthenticator.DefaultFactory()
{
  return &type metadata for URLSessionAuthenticator.DefaultFactory;
}

uint64_t destroy for URLSessionAuthenticator(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 112);
}

uint64_t initializeWithCopy for URLSessionAuthenticator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  __int128 v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v7 = a2 + 72;
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 96) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(a1 + 72, v7, v9);
  v11 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 136) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 112, a2 + 112);
  return a1;
}

uint64_t assignWithCopy for URLSessionAuthenticator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 112), (uint64_t *)(a2 + 112));
  return a1;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for URLSessionAuthenticator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 112);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLSessionAuthenticator(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 152))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 96);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for URLSessionAuthenticator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 152) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 96) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 152) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for URLSessionAuthenticator()
{
  return &type metadata for URLSessionAuthenticator;
}

uint64_t destroy for URLSessionAuthenticator.Configuration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 72);
}

uint64_t initializeWithCopy for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v6 = a2 + 72;
  v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 96) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 72, v6, v8);
  return a1;
}

uint64_t assignWithCopy for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for URLSessionAuthenticator.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLSessionAuthenticator.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 96);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for URLSessionAuthenticator.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 96) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for URLSessionAuthenticator.Configuration()
{
  return &type metadata for URLSessionAuthenticator.Configuration;
}

uint64_t sub_237644A68@<X0>(id a1@<X1>, char *a2@<X0>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  __int128 *v26;
  id v27;
  BOOL v28;
  unsigned __int8 v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v7 = *a2;
  v8 = objc_msgSend(a1, sel_identity);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_impi);

    v11 = sub_23764A3A8();
    v32 = v12;
    v33 = v11;

  }
  else
  {
    v32 = 0;
    v33 = 0;
  }
  v13 = objc_msgSend(a1, sel_fileTransferCapabilities);
  if (v13
    && (v14 = v13, v15 = objc_msgSend(v13, sel_userName), v14, v15))
  {
    v31 = sub_23764A3A8();
    v17 = v16;

  }
  else
  {
    v31 = 0;
    v17 = 0;
  }
  v18 = objc_msgSend(a1, sel_fileTransferCapabilities);
  if (v18
    && (v19 = v18, v20 = objc_msgSend(v18, sel_password), v19, v20))
  {
    v21 = sub_23764A3A8();
    v23 = v22;

  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  v24 = objc_msgSend(a1, sel_bsfPort);
  v25 = v24;
  v26 = a3;
  if (v24)
  {
    v27 = objc_msgSend(v24, sel_integerValue);

  }
  else
  {
    v27 = 0;
  }
  v28 = v25 == 0;
  v29 = objc_msgSend(a1, sel_bsfUsesSecureTransport);

  *(_BYTE *)a4 = v7;
  *(_QWORD *)(a4 + 8) = v33;
  *(_QWORD *)(a4 + 16) = v32;
  *(_QWORD *)(a4 + 24) = v31;
  *(_QWORD *)(a4 + 32) = v17;
  *(_QWORD *)(a4 + 40) = v21;
  *(_QWORD *)(a4 + 48) = v23;
  *(_QWORD *)(a4 + 56) = v27;
  *(_BYTE *)(a4 + 64) = v28;
  *(_BYTE *)(a4 + 65) = v29;
  return sub_237621660(v26, a4 + 72);
}

uint64_t sub_237644C5C()
{
  uint64_t v0;

  v0 = sub_23764A270();
  __swift_allocate_value_buffer(v0, qword_256801590);
  __swift_project_value_buffer(v0, (uint64_t)qword_256801590);
  return sub_23764A264();
}

uint64_t sub_237644CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  v5 = sub_237649FD0();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237644D70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v36;
  NSObject *log;
  os_log_t loga;
  uint64_t v39;

  sub_23763CC88(v0[24]);
  if (qword_256800650 != -1)
    swift_once();
  v1 = v0[23];
  v2 = v0[24];
  v4 = v0[21];
  v3 = v0[22];
  v5 = v0[18];
  v6 = v0[19];
  v7 = sub_23764A270();
  v0[25] = __swift_project_value_buffer(v7, (uint64_t)qword_256801590);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v0[26] = v8;
  v8(v1, v2, v5);
  v8(v3, v2, v5);
  v8(v4, v2, v5);
  v9 = sub_23764A258();
  v10 = sub_23764A57C();
  v11 = os_log_type_enabled(v9, v10);
  v13 = v0[22];
  v12 = v0[23];
  v14 = v0[21];
  v16 = v0[18];
  v15 = v0[19];
  if (v11)
  {
    log = v9;
    v17 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v39 = v36;
    *(_DWORD *)v17 = 136315650;
    v18 = sub_237649F58();
    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v18 = 5522759;
      v20 = 0xE300000000000000;
    }
    v0[10] = sub_237626560(v18, v20, &v39);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v21(v12, v16);
    *(_WORD *)(v17 + 12) = 2080;
    sub_2376298AC(&qword_256800E98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
    v22 = sub_23764A774();
    v0[11] = sub_237626560(v22, v23, &v39);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21(v13, v16);
    *(_WORD *)(v17 + 22) = 2080;
    v24 = sub_237649F94();
    if (!v24)
      v24 = sub_237645D44(MEMORY[0x24BEE4AF8]);
    v25 = v0[21];
    v26 = v0[18];
    v0[12] = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568015B8);
    v27 = sub_23764A3E4();
    v0[13] = sub_237626560(v27, v28, &v39);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21(v25, v26);
    _os_log_impl(&dword_23761E000, log, v10, "Sending upload: %s %s: %s ", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v36, -1, -1);
    MEMORY[0x23B817198](v17, -1, -1);

  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v21(v0[23], v0[18]);
    v21(v13, v16);
    v21(v14, v16);

  }
  v0[27] = v21;
  v29 = (_QWORD *)v0[17];
  v30 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TaskDelegate()), sel_init);
  v0[28] = v30;
  v31 = v29 + 9;
  v32 = v29[12];
  v33 = v29[13];
  __swift_project_boxed_opaque_existential_1(v31, v32);
  loga = (os_log_t)(**(int **)(v33 + 8) + *(_QWORD *)(v33 + 8));
  v34 = (_QWORD *)swift_task_alloc();
  v0[29] = v34;
  *v34 = v0;
  v34[1] = sub_23764514C;
  return ((uint64_t (*)(_QWORD, id, uint64_t, uint64_t))loga)(v0[24], v30, v32, v33);
}

uint64_t sub_23764514C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;

  v7 = *v4;
  *(_QWORD *)(v7 + 240) = a3;
  *(_QWORD *)(v7 + 248) = v3;
  swift_task_dealloc();
  if (!v3)
    sub_237626F18(a1, a2);
  return swift_task_switch();
}

uint64_t sub_2376451CC()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  void *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _QWORD *v24;

  v1 = *(id *)(v0 + 240);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 240);
    v5 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 72) = v4;
    v6 = v4;
    sub_23764A600();
    *v24 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "%@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v24, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
  }
  else
  {

    v2 = *(NSObject **)(v0 + 240);
  }
  v7 = *(_QWORD *)(v0 + 224);

  v8 = *(void **)(v7 + OBJC_IVAR____TtC15CTLazuliSupport12TaskDelegate_task);
  *(_QWORD *)(v0 + 256) = v8;
  if (v8)
  {
    v9 = v8;
    v10 = sub_23764A258();
    v11 = sub_23764A57C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23761E000, v10, v11, "Processing initial upload response", v12, 2u);
      MEMORY[0x23B817198](v12, -1, -1);
    }

    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v13;
    *v13 = v0;
    v13[1] = sub_237645510;
    return sub_237645EA0(v0 + 16, (uint64_t)v9);
  }
  else
  {
    v15 = sub_23764A258();
    v16 = sub_23764A594();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_23761E000, v15, v16, "Initial upload request completed, but task was never set", v17, 2u);
      MEMORY[0x23B817198](v17, -1, -1);
    }
    v18 = *(void **)(v0 + 240);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
    v19 = *(void **)(v0 + 224);
    v21 = *(_QWORD *)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 144);

    sub_23763E958();
    swift_allocError();
    *v23 = xmmword_23764E940;
    swift_willThrow();

    v20(v21, v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_237645510()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237645574()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;

  v1 = sub_23764A258();
  v2 = sub_23764A57C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23761E000, v1, v2, "Proceeding with upload after processing initial response", v3, 2u);
    MEMORY[0x23B817198](v3, -1, -1);
  }
  v4 = *(void **)(v0 + 272);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 208);
  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 144);
  v9 = *(void (**)(uint64_t))(v0 + 120);

  v5(v7, v6, v8);
  v9(v7);
  if (v4)
  {
    v10 = v4;
    v11 = v4;
    v12 = v4;
    v13 = sub_23764A258();
    v14 = sub_23764A594();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138412290;
      v17 = v10;
      v18 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 56) = v18;
      sub_23764A600();
      *v16 = v18;

      _os_log_impl(&dword_23761E000, v13, v14, "Unable to construct final request: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v16, -1, -1);
      MEMORY[0x23B817198](v15, -1, -1);
    }
    else
    {

    }
    v28 = v13;
    v29 = *(void **)(v0 + 256);
    v30 = *(void **)(v0 + 240);
    v31 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
    v32 = *(void **)(v0 + 224);
    v33 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 160);
    v35 = *(_QWORD *)(v0 + 144);

    swift_willThrow();
    v31(v34, v35);
    v31(v33, v35);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 40);
    v20 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v19);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
    v23 = v22;
    swift_bridgeObjectRetain();
    sub_237649FC4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v24 = sub_23764A258();
    v25 = sub_23764A588();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v41 = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = sub_237626560(v21, v23, &v41);
      sub_23764A600();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23761E000, v24, v25, "Auth Response: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v27, -1, -1);
      MEMORY[0x23B817198](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v37 = *(_QWORD **)(v0 + 136);
    v39 = v37[12];
    v38 = v37[13];
    __swift_project_boxed_opaque_existential_1(v37 + 9, v39);
    v40 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v40;
    *v40 = v0;
    v40[1] = sub_237645A14;
    return sub_237620194(*(_QWORD *)(v0 + 160), v39, v38);
  }
}

uint64_t sub_237645A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v8 = *(_QWORD **)v4;
  *(_QWORD *)(*(_QWORD *)v4 + 288) = v3;
  swift_task_dealloc();
  if (!v3)
  {
    v8[37] = a3;
    v8[38] = a2;
    v8[39] = a1;
  }
  return swift_task_switch();
}

uint64_t sub_237645A9C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 256);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
  v3 = *(void **)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 144);

  v2(v5, v6);
  v2(v4, v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 296));
}

uint64_t sub_237645B68()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 144);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237645BF0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 256);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
  v2 = *(void **)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 144);

  v3(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237645C88()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 256);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 216);
  v2 = *(void **)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 144);

  v3(v5, v6);
  v3(v4, v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_237645D44(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568015C0);
  v2 = (_QWORD *)sub_23764A6F0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  result = swift_retain();
  v5 = 0;
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    v8 = *(v6 - 2);
    v9 = *v6;
    if (!v8)
    {
      swift_bridgeObjectRetain();
LABEL_12:
      swift_release();
      goto LABEL_13;
    }
    v10 = *(v6 - 3);
    v11 = *(v6 - 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_237649A40(v10, v8);
    if ((v12 & 1) != 0)
      goto LABEL_15;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v2[6] + 16 * result);
    *v13 = v10;
    v13[1] = v8;
    v14 = (_QWORD *)(v2[7] + 16 * result);
    *v14 = v11;
    v14[1] = v9;
    v15 = v2[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_16;
    v6 += 4;
    v2[2] = v17;
    ++v5;
    if (v7 == v3)
      goto LABEL_12;
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_237645EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[71] = v2;
  v3[70] = a2;
  v3[69] = a1;
  v3[72] = type metadata accessor for GBAResult(0);
  v3[73] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568015C8);
  v3[74] = swift_task_alloc();
  v4 = sub_237649FD0();
  v3[75] = v4;
  v3[76] = *(_QWORD *)(v4 - 8);
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237645F8C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  void *v31;
  uint8_t *v32;
  _QWORD *v33;
  id v34;
  _OWORD *v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  void *v42;
  uint8_t *v43;
  _QWORD *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t (*v52)(void);
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  _QWORD *v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _OWORD *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  uint8_t *buf;
  uint64_t v102;
  NSObject *log;
  os_log_type_t type[8];
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109[3];

  v109[2] = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(v0 + 560), sel_originalRequest);
  if (!v1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 608) + 56))(*(_QWORD *)(v0 + 592), 1, 1, *(_QWORD *)(v0 + 600));
    goto LABEL_13;
  }
  v2 = v1;
  v3 = *(_QWORD *)(v0 + 616);
  v4 = *(_QWORD *)(v0 + 608);
  v5 = *(_QWORD *)(v0 + 600);
  v6 = *(_QWORD *)(v0 + 592);
  sub_237649FA0();

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v7(v6, v3, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) == 1)
  {
LABEL_13:
    sub_237626E98(*(_QWORD *)(v0 + 592), &qword_2568015C8);
    if (qword_256800650 != -1)
      swift_once();
    v25 = *(void **)(v0 + 560);
    v26 = sub_23764A270();
    __swift_project_value_buffer(v26, (uint64_t)qword_256801590);
    v27 = v25;
    v28 = sub_23764A258();
    v29 = sub_23764A594();
    v30 = os_log_type_enabled(v28, v29);
    v31 = *(void **)(v0 + 560);
    if (v30)
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v32 = 138412290;
      *(_QWORD *)(v0 + 536) = v31;
      v34 = v31;
      sub_23764A600();
      *v33 = v31;

      _os_log_impl(&dword_23761E000, v28, v29, "Unable to retrieve original request when attempting to authenticate: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v33, -1, -1);
      MEMORY[0x23B817198](v32, -1, -1);
    }
    else
    {

    }
    sub_23763E958();
    swift_allocError();
    *v35 = xmmword_23764E940;
    swift_willThrow();
    goto LABEL_30;
  }
  v8 = *(void **)(v0 + 560);
  v7(*(_QWORD *)(v0 + 624), *(_QWORD *)(v0 + 592), *(_QWORD *)(v0 + 600));
  v9 = objc_msgSend(v8, sel_response);
  *(_QWORD *)(v0 + 632) = v9;
  if (!v9)
  {
LABEL_20:
    if (qword_256800650 != -1)
      swift_once();
    v36 = *(void **)(v0 + 560);
    v37 = sub_23764A270();
    __swift_project_value_buffer(v37, (uint64_t)qword_256801590);
    v38 = v36;
    v39 = sub_23764A258();
    v40 = sub_23764A594();
    v41 = os_log_type_enabled(v39, v40);
    v42 = *(void **)(v0 + 560);
    if (v41)
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v43 = 138412290;
      v45 = objc_msgSend(v42, (SEL)0x2508EC7C8);
      v46 = v45;
      if (v45)
        *(_QWORD *)(v0 + 520) = v45;
      else
        *(_QWORD *)(v0 + 528) = 0;
      sub_23764A600();
      v47 = *(void **)(v0 + 560);
      *v44 = v46;

      _os_log_impl(&dword_23761E000, v39, v40, "Unexpected response when attempting to authenticate: %@", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v44, -1, -1);
      MEMORY[0x23B817198](v43, -1, -1);
    }
    else
    {

    }
    v48 = *(_QWORD *)(v0 + 624);
    v49 = *(_QWORD *)(v0 + 608);
    v50 = *(_QWORD *)(v0 + 600);
    sub_23763E958();
    swift_allocError();
    *v51 = 0;
    v51[1] = 0;
    swift_willThrow();
LABEL_29:
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
LABEL_30:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v52 = *(uint64_t (**)(void))(v0 + 8);
    return v52();
  }
  v10 = v9;
  objc_opt_self();
  v11 = (void *)swift_dynamicCastObjCClass();
  if (!v11 || (v12 = v11, objc_msgSend(v11, sel_statusCode) != (id)401))
  {

    goto LABEL_20;
  }
  v13 = v10;
  v14 = sub_23762A280(v12);
  *(_QWORD *)(v0 + 640) = v14;
  *(_QWORD *)(v0 + 648) = v15;
  if (v16 > 1u)
  {
    if (v16 == 2)
    {
      v54 = *(_QWORD **)(v0 + 568);
      v55 = v54[4];
      if (v55)
      {
        v56 = v54[6];
        if (v56)
        {
          v105 = *(_QWORD *)(v0 + 608);
          v106 = *(_QWORD *)(v0 + 600);
          v108 = *(_QWORD *)(v0 + 624);
          v57 = *(_QWORD **)(v0 + 552);
          v58 = v54[5];
          v109[0] = v54[3];
          *(_QWORD *)type = v109[0];
          v109[1] = v55;
          swift_bridgeObjectRetain();
          sub_23764A438();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_23764A438();
          swift_bridgeObjectRelease();
          v59 = sub_237639794(v109[0], v55);
          v61 = v60;
          v62 = sub_23764A18C();
          v64 = v63;
          sub_237626F18(v59, v61);
          v57[3] = &type metadata for HTTPBasicAuthenticateResponse;
          v57[4] = &off_2508EB8A0;
          v65 = (_QWORD *)swift_allocObject();
          *v57 = v65;

          v65[2] = v62;
          v65[3] = v64;
          v65[4] = *(_QWORD *)type;
          v65[5] = v55;
          v65[6] = v58;
          v65[7] = v56;
          (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v108, v106);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          v52 = *(uint64_t (**)(void))(v0 + 8);
          return v52();
        }
      }
      if (qword_256800650 != -1)
        swift_once();
      v82 = sub_23764A270();
      __swift_project_value_buffer(v82, (uint64_t)qword_256801590);
      v83 = sub_23764A258();
      v84 = sub_23764A594();
      if (os_log_type_enabled(v83, v84))
      {
        v85 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v85 = 0;
        _os_log_impl(&dword_23761E000, v83, v84, "Missing username or password for Basic HTTP authentication", v85, 2u);
        MEMORY[0x23B817198](v85, -1, -1);
      }
      v48 = *(_QWORD *)(v0 + 624);
      v49 = *(_QWORD *)(v0 + 608);
      v50 = *(_QWORD *)(v0 + 600);

      sub_23763E958();
      swift_allocError();
      *v86 = 0xD000000000000011;
      v86[1] = 0x800000023764BA50;
    }
    else
    {
      if (qword_256800650 != -1)
        swift_once();
      v77 = sub_23764A270();
      __swift_project_value_buffer(v77, (uint64_t)qword_256801590);
      v78 = sub_23764A258();
      v79 = sub_23764A594();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_23761E000, v78, v79, "Unable to retrieve auth scheme from HTTP response", v80, 2u);
        MEMORY[0x23B817198](v80, -1, -1);
      }
      v48 = *(_QWORD *)(v0 + 624);
      v49 = *(_QWORD *)(v0 + 608);
      v50 = *(_QWORD *)(v0 + 600);

      sub_23763E958();
      swift_allocError();
      *v81 = 0;
      v81[1] = 0;
    }
    swift_willThrow();

    goto LABEL_29;
  }
  v17 = v14;
  v18 = v15;
  if (!v16)
  {
    if (qword_256800650 != -1)
      swift_once();
    v19 = sub_23764A270();
    __swift_project_value_buffer(v19, (uint64_t)qword_256801590);
    sub_2376299EC(v17, v18, 0);
    v20 = sub_23764A258();
    v21 = sub_23764A594();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v107 = v13;
      v23 = swift_slowAlloc();
      v109[0] = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v0 + 512) = sub_237626560(0x747365676944, 0xE600000000000000, v109);
      sub_23764A600();
      sub_23762F0C0(v17, v18, 0);
      _os_log_impl(&dword_23761E000, v20, v21, "Unsupported authentication scheme: %s", v22, 0xCu);
      swift_arrayDestroy();
      v24 = v23;
      v13 = v107;
      MEMORY[0x23B817198](v24, -1, -1);
      MEMORY[0x23B817198](v22, -1, -1);
    }
    else
    {
      sub_23762F0C0(v17, v18, 0);
    }

    v87 = *(_QWORD *)(v0 + 624);
    v88 = *(_QWORD *)(v0 + 608);
    v89 = *(_QWORD *)(v0 + 600);
    sub_23763E958();
    swift_allocError();
    *v90 = xmmword_23764E950;
    swift_willThrow();
    sub_23762F0C0(v17, v18, 0);

    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
    goto LABEL_30;
  }
  v66 = v13;
  sub_23763F140(v12, v0 + 328);
  sub_237649BB8(v0 + 328, v0 + 256);
  if (!*(_QWORD *)(v0 + 264))
  {
    if (qword_256800650 != -1)
      swift_once();
    v91 = v66;
    v92 = sub_23764A270();
    __swift_project_value_buffer(v92, (uint64_t)qword_256801590);
    v93 = sub_23764A258();
    v94 = sub_23764A594();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v95 = 0;
      _os_log_impl(&dword_23761E000, v93, v94, "Unable to parse authenticate header", v95, 2u);
      MEMORY[0x23B817198](v95, -1, -1);
    }
    v96 = *(_QWORD *)(v0 + 624);
    v97 = *(_QWORD *)(v0 + 608);
    v98 = *(_QWORD *)(v0 + 600);

    sub_23763E958();
    swift_allocError();
    *v99 = 0;
    v99[1] = 0;
    swift_willThrow();
    sub_23762F0C0(v17, v18, 1u);

    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v96, v98);
    goto LABEL_30;
  }
  v67 = *(_OWORD *)(v0 + 304);
  *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 232) = v67;
  *(_BYTE *)(v0 + 248) = *(_BYTE *)(v0 + 320);
  v68 = *(_OWORD *)(v0 + 272);
  *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 200) = v68;
  if (qword_256800650 != -1)
    swift_once();
  v69 = sub_23764A270();
  __swift_project_value_buffer(v69, (uint64_t)qword_256801590);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v70 = sub_23764A258();
  v71 = sub_23764A588();
  if (os_log_type_enabled(v70, v71))
  {
    log = v70;
    v72 = (uint8_t *)swift_slowAlloc();
    v102 = swift_slowAlloc();
    buf = v72;
    *(_DWORD *)v72 = 136315138;
    v109[0] = v102;
    v73 = *(_OWORD *)(v0 + 232);
    *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 216);
    *(_OWORD *)(v0 + 448) = v73;
    *(_BYTE *)(v0 + 464) = *(_BYTE *)(v0 + 248);
    v74 = *(_OWORD *)(v0 + 200);
    *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 184);
    *(_OWORD *)(v0 + 416) = v74;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v75 = sub_23764A3E4();
    *(_QWORD *)(v0 + 544) = sub_237626560(v75, v76, v109);
    sub_23764A600();
    swift_bridgeObjectRelease();
    sub_237649C00((uint64_t *)(v0 + 328));
    sub_237649C00((uint64_t *)(v0 + 328));
    v70 = log;
    _os_log_impl(&dword_23761E000, log, v71, "Auth Info: %s", buf, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v102, -1, -1);
    MEMORY[0x23B817198](buf, -1, -1);
  }
  else
  {
    sub_237649C00((uint64_t *)(v0 + 328));
    sub_237649C00((uint64_t *)(v0 + 328));
  }

  v100 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 656) = v100;
  *v100 = v0;
  v100[1] = sub_237646DB0;
  return sub_237648E9C(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 560), v17, v18);
}

uint64_t sub_237646DB0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 664) = v0;
  swift_task_dealloc();
  if (v0)
    sub_237649C00((uint64_t *)(v2 + 328));
  return swift_task_switch();
}

uint64_t sub_237646E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v27 = *(_QWORD *)(v0 + 640);
  v28 = *(_QWORD *)(v0 + 648);
  v29 = *(void **)(v0 + 632);
  v1 = *(_QWORD *)(v0 + 624);
  v2 = *(_QWORD *)(v0 + 608);
  v3 = *(_QWORD *)(v0 + 600);
  v26 = *(uint64_t **)(v0 + 584);
  v4 = *(uint64_t **)(v0 + 552);
  v5 = v26[1];
  v25 = *v26;
  v6 = (uint64_t *)((char *)v26 + *(int *)(*(_QWORD *)(v0 + 576) + 24));
  v8 = *v6;
  v7 = v6[1];
  swift_bridgeObjectRetain();
  sub_237626FF4(v8, v7);
  v9 = sub_23764A12C();
  v11 = v10;
  sub_237626F18(v8, v7);
  *(_QWORD *)(v0 + 496) = v3;
  *(_QWORD *)(v0 + 504) = &off_2508EB568;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 472));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 16))(boxed_opaque_existential_1, v1, v3);
  v4[3] = (uint64_t)&type metadata for HTTPDigestAuthenticateResponse;
  v4[4] = (uint64_t)&off_2508EAC00;
  v13 = swift_allocObject();
  *v4 = v13;
  v14 = *(_OWORD *)(v0 + 200);
  v15 = *(_OWORD *)(v0 + 232);
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 216);
  *(_OWORD *)(v0 + 64) = v15;
  *(_BYTE *)(v0 + 80) = *(_BYTE *)(v0 + 248);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 184);
  *(_OWORD *)(v0 + 32) = v14;
  *(_QWORD *)(v0 + 88) = v25;
  *(_QWORD *)(v0 + 96) = v5;
  *(_QWORD *)(v0 + 104) = v9;
  *(_QWORD *)(v0 + 112) = v11;
  sub_2376297E0(v0 + 472, v0 + 120);
  *(_QWORD *)(v0 + 160) = 1;
  sub_237626FF4(v9, v11);
  v16 = sub_237640A80(8, 0);
  v18 = v17;
  sub_237626F18(v9, v11);
  __swift_destroy_boxed_opaque_existential_1(v0 + 472);
  *(_QWORD *)(v0 + 168) = v16;
  *(_QWORD *)(v0 + 176) = v18;
  *(_QWORD *)(v13 + 176) = v18;
  v19 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v13 + 96) = v19;
  v20 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v13 + 128) = v20;
  v21 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v13 + 32) = v21;
  v22 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v13 + 64) = v22;
  v23 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v13 + 144) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v13 + 160) = v23;
  sub_23762F0C0(v27, v28, 1u);

  sub_2376288F4((uint64_t)v26, type metadata accessor for GBAResult);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376470C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 632);
  v2 = *(_QWORD *)(v0 + 624);
  v3 = *(_QWORD *)(v0 + 608);
  v4 = *(_QWORD *)(v0 + 600);
  sub_23762F0C0(*(_QWORD *)(v0 + 640), *(_QWORD *)(v0 + 648), 1u);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237647190(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[32] = a2;
  v3[33] = v2;
  v3[31] = a1;
  v4 = sub_23764A120();
  v3[34] = v4;
  v3[35] = *(_QWORD *)(v4 - 8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v5 = sub_237649FD0();
  v3[39] = v5;
  v3[40] = *(_QWORD *)(v5 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  v3[44] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23764728C()
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
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
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
  unint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  void *v53;
  unsigned int v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t v85;
  uint64_t v86;
  NSObject *log;
  NSObject *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t);
  void (*type)(uint64_t, uint64_t, uint64_t);
  os_log_type_t typea;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97[2];

  v97[1] = *MEMORY[0x24BDAC8D0];
  sub_23763CC88(*(_QWORD *)(v0 + 352));
  if (qword_256800650 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  v90 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 320);
  v95 = *(_QWORD *)(v0 + 328);
  v5 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 312);
  v7 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 256);
  v9 = sub_23764A270();
  __swift_project_value_buffer(v9, (uint64_t)qword_256801590);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v10(v1, v2, v4);
  type = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  type(v5, v8, v7);
  v10(v90, v2, v4);
  v10(v95, v2, v4);
  v11 = sub_23764A258();
  v12 = sub_23764A57C();
  v13 = os_log_type_enabled(v11, v12);
  v15 = *(_QWORD *)(v0 + 336);
  v14 = *(_QWORD *)(v0 + 344);
  v16 = *(_QWORD *)(v0 + 320);
  v17 = *(_QWORD *)(v0 + 328);
  v19 = *(_QWORD *)(v0 + 304);
  v18 = *(_QWORD *)(v0 + 312);
  v20 = *(_QWORD *)(v0 + 272);
  v91 = *(_QWORD *)(v0 + 280);
  if (v13)
  {
    log = v11;
    v85 = *(_QWORD *)(v0 + 336);
    v21 = swift_slowAlloc();
    v86 = swift_slowAlloc();
    v97[0] = v86;
    *(_DWORD *)v21 = 136315906;
    v22 = sub_237649F58();
    if (v23)
    {
      v24 = v23;
    }
    else
    {
      v22 = 5522759;
      v24 = 0xE300000000000000;
    }
    *(_QWORD *)(v0 + 208) = sub_237626560(v22, v24, v97);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v25(v14, v18);
    *(_WORD *)(v21 + 12) = 2080;
    sub_2376298AC((unint64_t *)&qword_256800748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v26 = sub_23764A774();
    *(_QWORD *)(v0 + 216) = sub_237626560(v26, v27, v97);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v92 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
    v92(v19, v20);
    *(_WORD *)(v21 + 22) = 2080;
    sub_2376298AC(&qword_256800E98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
    v28 = sub_23764A774();
    *(_QWORD *)(v0 + 224) = sub_237626560(v28, v29, v97);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v25(v85, v18);
    *(_WORD *)(v21 + 32) = 2080;
    v30 = sub_237649F94();
    if (!v30)
      v30 = sub_237645D44(MEMORY[0x24BEE4AF8]);
    v31 = *(_QWORD *)(v0 + 328);
    v32 = *(_QWORD *)(v0 + 312);
    *(_QWORD *)(v0 + 232) = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568015B8);
    v33 = sub_23764A3E4();
    *(_QWORD *)(v0 + 240) = sub_237626560(v33, v34, v97);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v25(v31, v32);
    _os_log_impl(&dword_23761E000, log, v12, "Downloading file: %s [dest: %s] %s: %s ", (uint8_t *)v21, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v86, -1, -1);
    MEMORY[0x23B817198](v21, -1, -1);

  }
  else
  {
    v25 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v25(v14, v18);
    v92 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
    v92(v19, v20);
    v25(v15, v18);
    v25(v17, v18);

  }
  *(_QWORD *)(v0 + 360) = v25;
  v35 = *(_QWORD *)(v0 + 352);
  v36 = *(_QWORD *)(v0 + 296);
  v37 = *(_QWORD **)(v0 + 264);
  v38 = *(_QWORD *)(v0 + 272);
  v39 = *(_QWORD *)(v0 + 256);
  v40 = v37[12];
  v41 = v37[13];
  __swift_project_boxed_opaque_existential_1(v37 + 9, v40);
  v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 24))(v35, v40, v41);
  *(_QWORD *)(v0 + 368) = v42;
  type(v36, v39, v38);
  v43 = sub_23764A258();
  v44 = sub_23764A588();
  v45 = os_log_type_enabled(v43, v44);
  v46 = *(_QWORD *)(v0 + 296);
  v47 = *(_QWORD *)(v0 + 272);
  if (v45)
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v97[0] = v49;
    *(_DWORD *)v48 = 136315138;
    sub_2376298AC((unint64_t *)&qword_256800748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v50 = sub_23764A774();
    *(_QWORD *)(v0 + 200) = sub_237626560(v50, v51, v97);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v92(v46, v47);
    _os_log_impl(&dword_23761E000, v43, v44, "Attempting to remove pre-existing destination file: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v49, -1, -1);
    MEMORY[0x23B817198](v48, -1, -1);
  }
  else
  {
    v92(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 272));
  }

  v52 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v53 = (void *)sub_23764A0C0();
  *(_QWORD *)(v0 + 168) = 0;
  v54 = objc_msgSend(v52, sel_removeItemAtURL_error_, v53, v0 + 168);

  v55 = *(void **)(v0 + 168);
  if (v54)
  {
    v56 = v55;

  }
  else
  {
    v57 = *(_QWORD *)(v0 + 288);
    v58 = *(_QWORD *)(v0 + 272);
    v59 = *(_QWORD *)(v0 + 256);
    v60 = v55;
    v61 = (void *)sub_23764A090();

    swift_willThrow();
    type(v57, v59, v58);
    v62 = v61;
    v63 = v61;
    v64 = sub_23764A258();
    v65 = sub_23764A588();
    v66 = os_log_type_enabled(v64, v65);
    v67 = *(_QWORD *)(v0 + 288);
    v68 = *(_QWORD *)(v0 + 272);
    if (v66)
    {
      typea = v65;
      v69 = swift_slowAlloc();
      v89 = (_QWORD *)swift_slowAlloc();
      v96 = swift_slowAlloc();
      v97[0] = v96;
      *(_DWORD *)v69 = 136315394;
      sub_2376298AC((unint64_t *)&qword_256800748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v70 = sub_23764A774();
      v88 = v64;
      *(_QWORD *)(v0 + 184) = sub_237626560(v70, v71, v97);
      sub_23764A600();
      swift_bridgeObjectRelease();
      v92(v67, v68);
      *(_WORD *)(v69 + 12) = 2112;
      v72 = v61;
      v73 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 192) = v73;
      sub_23764A600();
      *v89 = v73;

      _os_log_impl(&dword_23761E000, v88, typea, "Failed to remove pre-exisiting destination file %s: %@", (uint8_t *)v69, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v89, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v96, -1, -1);
      MEMORY[0x23B817198](v69, -1, -1);

    }
    else
    {

      v92(v67, v68);
    }
  }
  v74 = *(_QWORD *)(v0 + 264);
  v75 = v42;
  sub_23764A0F0();
  v76 = (void *)sub_23764A384();
  swift_bridgeObjectRelease();
  objc_msgSend(v75, sel_set_pathToDownloadTaskFile_, v76);

  sub_237649D2C(v74, v0 + 16);
  v77 = swift_allocObject();
  *(_QWORD *)(v0 + 376) = v77;
  v78 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v77 + 112) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v77 + 128) = v78;
  *(_OWORD *)(v77 + 144) = *(_OWORD *)(v0 + 144);
  *(_QWORD *)(v77 + 160) = *(_QWORD *)(v0 + 160);
  v79 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v77 + 48) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v77 + 64) = v79;
  v80 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v77 + 80) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v77 + 96) = v80;
  v81 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v77 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v77 + 32) = v81;
  v82 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 384) = v82;
  v82[2] = v75;
  v82[3] = &unk_2568015E8;
  v82[4] = v77;
  v83 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v83;
  sub_23763E3B0();
  *v83 = v0;
  v83[1] = sub_237647C90;
  return sub_23764A78C();
}

uint64_t sub_237647C90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237647D48()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v6;

  v1 = *(void **)(v0 + 368);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  v4 = *(_QWORD *)(v0 + 312);
  swift_release();
  v6 = *(_QWORD *)(v0 + 176);

  v3(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_237647E34()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  v2 = *(void **)(v0 + 368);
  v3 = *(_QWORD *)(v0 + 352);
  v4 = *(_QWORD *)(v0 + 312);
  swift_release();
  swift_task_dealloc();

  v1(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237647F20(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_237649F38;
  return sub_237647F98(a1, a2, a3, a4);
}

uint64_t sub_237647F98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 88) = a4;
  *(_QWORD *)(v5 + 40) = a3;
  *(_QWORD *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 56) = type metadata accessor for GBAResult(0);
  *(_QWORD *)(v5 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237647FFC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27[3];

  if (*(_BYTE *)(v0 + 88))
  {
    if (*(_BYTE *)(v0 + 88) == 1)
    {
      v1 = *(_QWORD *)(v0 + 40);
      v2 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v2;
      *v2 = v0;
      v2[1] = sub_2376484A0;
      return sub_237648E9C(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), v1);
    }
    v12 = *(_QWORD **)(v0 + 48);
    v13 = v12[4];
    if (v13 && v12[6])
    {
      v27[0] = v12[3];
      v27[1] = v13;
      swift_bridgeObjectRetain();
      sub_23764A438();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23764A438();
      swift_bridgeObjectRelease();
      v14 = sub_237639794(v27[0], v13);
      v16 = v15;
      sub_23764A18C();
      sub_237626F18(v14, v16);
      v17 = objc_allocWithZone(MEMORY[0x24BDD1818]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = (void *)sub_23764A384();
      swift_bridgeObjectRelease();
      v19 = (void *)sub_23764A384();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v17, sel_initWithUser_password_persistence_, v18, v19, 0);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      return (*(uint64_t (**)(id))(v0 + 8))(v20);
    }
    if (qword_256800650 != -1)
      swift_once();
    v21 = sub_23764A270();
    __swift_project_value_buffer(v21, (uint64_t)qword_256801590);
    v22 = sub_23764A258();
    v23 = sub_23764A594();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23761E000, v22, v23, "Missing username or password for Basic HTTP authentication", v24, 2u);
      MEMORY[0x23B817198](v24, -1, -1);
    }

    sub_23763E958();
    swift_allocError();
    *v25 = 0xD000000000000011;
    v26 = 0x800000023764BA50;
  }
  else
  {
    if (qword_256800650 != -1)
      swift_once();
    v4 = sub_23764A270();
    __swift_project_value_buffer(v4, (uint64_t)qword_256801590);
    swift_bridgeObjectRetain();
    v5 = sub_23764A258();
    v6 = sub_23764A594();
    v7 = os_log_type_enabled(v5, v6);
    v9 = *(_QWORD *)(v0 + 32);
    v8 = *(_QWORD *)(v0 + 40);
    if (v7)
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v27[0] = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_237626560(0x747365676944, 0xE600000000000000, v27);
      sub_23764A600();
      sub_237629A14(v9, v8, 0);
      _os_log_impl(&dword_23761E000, v5, v6, "Unsupported authentication scheme: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v11, -1, -1);
      MEMORY[0x23B817198](v10, -1, -1);
    }
    else
    {
      sub_237629A14(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), 0);
    }

    sub_23763E958();
    swift_allocError();
    *v25 = 0;
    v26 = 2;
  }
  v25[1] = v26;
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376484A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237648504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = (uint64_t *)(v1 + *(int *)(*(_QWORD *)(v0 + 56) + 24));
  v3 = *v2;
  v4 = v2[1];
  swift_bridgeObjectRetain();
  sub_237626FF4(v3, v4);
  sub_23764A18C();
  sub_237626F18(v3, v4);
  v5 = objc_allocWithZone(MEMORY[0x24BDD1818]);
  v6 = (void *)sub_23764A384();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_23764A384();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithUser_password_persistence_, v6, v7, 0);

  sub_2376288F4(v1, type metadata accessor for GBAResult);
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v8);
}

uint64_t sub_237648618()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23764864C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[33] = a1;
  v2[34] = v1;
  v3 = sub_237649FD0();
  v2[35] = v3;
  v2[36] = *(_QWORD *)(v3 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376486D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_class *v35;
  char *v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  os_log_type_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t (*v46)(_QWORD, id, uint64_t, uint64_t);
  uint64_t v47;

  sub_23763CC88(*(_QWORD *)(v0 + 320));
  if (qword_256800650 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 288);
  v7 = sub_23764A270();
  *(_QWORD *)(v0 + 328) = __swift_project_value_buffer(v7, (uint64_t)qword_256801590);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8(v1, v2, v5);
  v8(v3, v2, v5);
  v8(v4, v2, v5);
  v9 = sub_23764A258();
  v10 = sub_23764A57C();
  v11 = os_log_type_enabled(v9, v10);
  v13 = *(_QWORD *)(v0 + 304);
  v12 = *(_QWORD *)(v0 + 312);
  v14 = *(_QWORD *)(v0 + 288);
  v15 = *(_QWORD *)(v0 + 296);
  v16 = *(_QWORD *)(v0 + 280);
  if (v11)
  {
    v43 = v10;
    v44 = v9;
    v17 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v47 = v45;
    *(_DWORD *)v17 = 136315650;
    v18 = sub_237649F58();
    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v18 = 5522759;
      v20 = 0xE300000000000000;
    }
    *(_QWORD *)(v0 + 232) = sub_237626560(v18, v20, &v47);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v16);
    *(_WORD *)(v17 + 12) = 2080;
    sub_2376298AC(&qword_256800E98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
    v22 = sub_23764A774();
    *(_QWORD *)(v0 + 240) = sub_237626560(v22, v23, &v47);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21(v13, v16);
    *(_WORD *)(v17 + 22) = 2080;
    v24 = sub_237649F94();
    if (!v24)
      v24 = sub_237645D44(MEMORY[0x24BEE4AF8]);
    v25 = *(_QWORD *)(v0 + 296);
    v26 = *(_QWORD *)(v0 + 280);
    *(_QWORD *)(v0 + 248) = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568015B8);
    v27 = sub_23764A3E4();
    *(_QWORD *)(v0 + 256) = sub_237626560(v27, v28, &v47);
    sub_23764A600();
    swift_bridgeObjectRelease();
    v21(v25, v26);
    _os_log_impl(&dword_23761E000, v44, v43, "Sending request: %s %s: %s ", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v45, -1, -1);
    MEMORY[0x23B817198](v17, -1, -1);

  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 280));
    v21(v13, v16);
    v21(v15, v16);

  }
  *(_QWORD *)(v0 + 336) = v21;
  v29 = *(_QWORD **)(v0 + 272);
  sub_237649D2C((uint64_t)v29, v0 + 16);
  v30 = swift_allocObject();
  v31 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v30 + 112) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v30 + 128) = v31;
  *(_OWORD *)(v30 + 144) = *(_OWORD *)(v0 + 144);
  *(_QWORD *)(v30 + 160) = *(_QWORD *)(v0 + 160);
  v32 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v30 + 64) = v32;
  v33 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v30 + 80) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v30 + 96) = v33;
  v34 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v30 + 32) = v34;
  v35 = (objc_class *)type metadata accessor for AuthTaskDelegate();
  v36 = (char *)objc_allocWithZone(v35);
  v37 = &v36[OBJC_IVAR____TtC15CTLazuliSupport16AuthTaskDelegate_challengeHandler];
  *(_QWORD *)v37 = &unk_256801608;
  *((_QWORD *)v37 + 1) = v30;
  *(_QWORD *)(v0 + 208) = v36;
  *(_QWORD *)(v0 + 216) = v35;
  v38 = objc_msgSendSuper2((objc_super *)(v0 + 208), sel_init);
  *(_QWORD *)(v0 + 344) = v38;
  v39 = v29[12];
  v40 = v29[13];
  __swift_project_boxed_opaque_existential_1(v29 + 9, v39);
  v46 = (uint64_t (*)(_QWORD, id, uint64_t, uint64_t))(**(int **)(v40 + 8) + *(_QWORD *)(v40 + 8));
  v41 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v41;
  *v41 = v0;
  v41[1] = sub_237648B14;
  return v46(*(_QWORD *)(v0 + 320), v38, v39, v40);
}

uint64_t sub_237648B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[21] = v4;
  v5[22] = a1;
  v5[23] = a2;
  v5[24] = a3;
  v5[25] = v3;
  v5[45] = a3;
  v5[46] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237648B84()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  NSObject *v8;
  void **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v1 = *(id *)(v0 + 360);
  v2 = sub_23764A258();
  v3 = sub_23764A588();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 360);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    *(_QWORD *)(v0 + 224) = v4;
    v7 = v4;
    sub_23764A600();
    *v6 = v4;

    _os_log_impl(&dword_23761E000, v2, v3, "%@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256800948);
    swift_arrayDestroy();
    MEMORY[0x23B817198](v6, -1, -1);
    MEMORY[0x23B817198](v5, -1, -1);
    v8 = v2;
    v9 = (void **)(v0 + 344);
  }
  else
  {
    v9 = (void **)(v0 + 360);
    v10 = *(void **)(v0 + 344);

    v8 = v2;
  }
  v11 = *v9;
  v12 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 184);
  v14 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  v15 = *(_QWORD *)(v0 + 320);
  v16 = *(_QWORD *)(v0 + 280);

  v14(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v0 + 8))(v12, v13, *(_QWORD *)(v0 + 360));
}

uint64_t sub_237648D54()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 280);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237648DD0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_237648E48;
  return sub_237647F98(a1, a2, a3, a4);
}

uint64_t sub_237648E48(uint64_t a1)
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

uint64_t sub_237648E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[17] = a4;
  v5[18] = v4;
  v5[15] = a2;
  v5[16] = a3;
  v5[14] = a1;
  v5[19] = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256800710);
  v5[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568015C8);
  v5[24] = swift_task_alloc();
  v6 = sub_237649FD0();
  v5[25] = v6;
  v5[26] = *(_QWORD *)(v6 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237648F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  __int128 *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  int *v47;
  char *v48;
  void *v49;
  unsigned __int16 v50;
  char v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  unint64_t v64;
  _OWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73[2];

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
  {
    if (qword_256800650 != -1)
      swift_once();
    v25 = sub_23764A270();
    __swift_project_value_buffer(v25, (uint64_t)qword_256801590);
    v26 = sub_23764A258();
    v27 = sub_23764A594();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_23761E000, v26, v27, "Missing IMPI, unable to perform bootstrap authentication", v28, 2u);
      MEMORY[0x23B817198](v28, -1, -1);
    }

    sub_23763E958();
    swift_allocError();
    v30 = xmmword_23764E970;
    goto LABEL_18;
  }
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(void **)(v0 + 120);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, sel_originalRequest);
  if (!v5)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 208) + 56))(*(_QWORD *)(v0 + 192), 1, 1, *(_QWORD *)(v0 + 200));
    goto LABEL_13;
  }
  v6 = v5;
  v8 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 216);
  v10 = *(_QWORD *)(v0 + 192);
  v9 = *(_QWORD *)(v0 + 200);
  sub_237649FA0();

  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  v11(v10, v7, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v9) == 1)
  {
LABEL_13:
    v31 = *(_QWORD *)(v0 + 192);
    swift_bridgeObjectRelease();
    sub_237626E98(v31, &qword_2568015C8);
    if (qword_256800650 != -1)
      swift_once();
    v32 = sub_23764A270();
    __swift_project_value_buffer(v32, (uint64_t)qword_256801590);
    v33 = sub_23764A258();
    v34 = sub_23764A594();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_23761E000, v33, v34, "Unable to get original request", v35, 2u);
      MEMORY[0x23B817198](v35, -1, -1);
    }

    sub_23763E958();
    swift_allocError();
    v30 = xmmword_23764E940;
LABEL_18:
    *v29 = v30;
    swift_willThrow();
LABEL_19:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v12 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 136);
  v11(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200));
  swift_bridgeObjectRetain();
  sub_237638C78(v12, v13);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    if (qword_256800650 != -1)
      swift_once();
    v37 = sub_23764A270();
    __swift_project_value_buffer(v37, (uint64_t)qword_256801590);
    v38 = sub_23764A258();
    v39 = sub_23764A594();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_23761E000, v38, v39, "Invalid realm parameter", v40, 2u);
      MEMORY[0x23B817198](v40, -1, -1);
    }
    v41 = *(_QWORD *)(v0 + 224);
    v42 = *(_QWORD *)(v0 + 200);
    v43 = *(_QWORD *)(v0 + 208);

    sub_23763E958();
    swift_allocError();
    *v44 = 0;
    v44[1] = 0;
    goto LABEL_39;
  }
  v17 = v15;
  v72 = v14;
  v18 = *(_QWORD *)(v0 + 184);
  sub_237649FB8();
  v19 = sub_23764A120();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19);
  v22 = *(_QWORD *)(v0 + 184);
  if (v21 == 1)
  {
    sub_237626E98(*(_QWORD *)(v0 + 184), &qword_256800710);
    v23 = 0;
    v24 = 0;
LABEL_30:
    swift_bridgeObjectRelease();
    if (qword_256800650 != -1)
      swift_once();
    v60 = sub_23764A270();
    __swift_project_value_buffer(v60, (uint64_t)qword_256801590);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v61 = sub_23764A258();
    v62 = sub_23764A594();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = swift_slowAlloc();
      v71 = swift_slowAlloc();
      v73[0] = v71;
      *(_DWORD *)v63 = 136315394;
      if (v24)
      {
        v64 = v24;
      }
      else
      {
        v23 = 0;
        v64 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 96) = sub_237626560(v23, v64, v73);
      sub_23764A600();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v63 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 104) = sub_237626560(v72, v17, v73);
      sub_23764A600();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23761E000, v61, v62, "Request FQDN (%s) does not match realm FQDN (%s)", (uint8_t *)v63, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B817198](v71, -1, -1);
      MEMORY[0x23B817198](v63, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v41 = *(_QWORD *)(v0 + 224);
    v42 = *(_QWORD *)(v0 + 200);
    v43 = *(_QWORD *)(v0 + 208);
    sub_23763E958();
    swift_allocError();
    *v65 = xmmword_23764E960;
LABEL_39:
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
    goto LABEL_19;
  }
  v23 = sub_23764A0D8();
  v24 = v45;
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v19);
  if (!v24 || (v23 != v72 || v24 != v17) && (sub_23764A780() & 1) == 0)
    goto LABEL_30;
  v66 = *(_QWORD *)(v0 + 208);
  v67 = *(_QWORD *)(v0 + 200);
  v68 = *(_QWORD *)(v0 + 224);
  v46 = *(_QWORD *)(v0 + 176);
  v47 = *(int **)(v0 + 152);
  v69 = *(_QWORD *)(v0 + 168);
  v70 = *(_QWORD *)(v0 + 160);
  v48 = *(char **)(v0 + 144);
  v49 = *(void **)(v0 + 120);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v50 = (unsigned __int16)objc_msgSend(v49, sel__TLSNegotiatedCipherSuite);
  v51 = *v48;
  sub_2376297E0((uint64_t)(v48 + 72), v46 + 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v46 + v47[7], v68, v67);
  v52 = *((_QWORD *)v48 + 7);
  v53 = v48[64];
  v54 = v48[65];
  *(_BYTE *)v46 = v51;
  *(_QWORD *)(v46 + 48) = v3;
  *(_QWORD *)(v46 + 56) = v2;
  v55 = v46 + v47[8];
  *(_QWORD *)v55 = v52;
  *(_BYTE *)(v55 + 8) = v53;
  *(_BYTE *)(v46 + v47[9]) = v54;
  v56 = v46 + v47[10];
  *(_WORD *)v56 = v50;
  *(_BYTE *)(v56 + 2) = 0;
  sub_237649CA4(v46, v69);
  v57 = type metadata accessor for HTTPGBAAuthenticator(0);
  *(_QWORD *)(v0 + 40) = v57;
  *(_QWORD *)(v0 + 48) = &off_2508EB108;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  sub_237649CA4(v69, v70);
  *(_QWORD *)(v0 + 80) = &type metadata for HTTPGBAAuthenticator.DefaultFactory;
  *(_QWORD *)(v0 + 88) = &off_2508EB0F0;
  sub_2376288F4(v69, type metadata accessor for HTTPGBAAuthenticator.Configuration);
  sub_237649CE8(v70, (uint64_t)boxed_opaque_existential_1);
  sub_237621660((__int128 *)(v0 + 56), (uint64_t)boxed_opaque_existential_1 + *(int *)(v57 + 20));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v59 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v59;
  *v59 = v0;
  v59[1] = sub_237649858;
  return sub_237631B38(*(_QWORD *)(v0 + 112));
}

uint64_t sub_237649858()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2376498BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  sub_2376288F4(*(_QWORD *)(v0 + 176), type metadata accessor for HTTPGBAAuthenticator.Configuration);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237649984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  sub_2376288F4(*(_QWORD *)(v0 + 176), type metadata accessor for HTTPGBAAuthenticator.Configuration);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_237649A40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23764A7EC();
  sub_23764A408();
  v4 = sub_23764A804();
  return sub_237649AA4(a1, a2, v4);
}

unint64_t sub_237649AA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23764A780() & 1) == 0)
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
      while (!v14 && (sub_23764A780() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_237649B84()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237649BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256800EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_237649C00(uint64_t *a1)
{
  sub_2376369A4(*a1, a1[1]);
  return a1;
}

uint64_t sub_237649C48()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237626F18(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_237649CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237649CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HTTPGBAAuthenticator.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237649D2C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for URLSessionAuthenticator(a2, a1);
  return a2;
}

uint64_t sub_237649D64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v9;
  _QWORD *v10;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_237649F3C;
  v10 = (_QWORD *)swift_task_alloc();
  v9[2] = v10;
  *v10 = v9;
  v10[1] = sub_237649F38;
  return sub_237647F98(a1, a2, a3, a4);
}

id sub_237649DFC(uint64_t a1)
{
  uint64_t v1;

  return sub_23763E99C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t objectdestroy_16Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  return swift_deallocObject();
}

uint64_t sub_237649E50(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v9;
  _QWORD *v10;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_237649EE8;
  v10 = (_QWORD *)swift_task_alloc();
  v9[2] = v10;
  *v10 = v9;
  v10[1] = sub_237648E48;
  return sub_237647F98(a1, a2, a3, a4);
}

uint64_t sub_237649EE8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_237649F40()
{
  return MEMORY[0x24BDCAFC8]();
}

uint64_t sub_237649F4C()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_237649F58()
{
  return MEMORY[0x24BDCAFF0]();
}

uint64_t sub_237649F64()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_237649F70()
{
  return MEMORY[0x24BDCB008]();
}

uint64_t sub_237649F7C()
{
  return MEMORY[0x24BDCB010]();
}

uint64_t sub_237649F88()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_237649F94()
{
  return MEMORY[0x24BDCB040]();
}

uint64_t sub_237649FA0()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_237649FAC()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_237649FB8()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_237649FC4()
{
  return MEMORY[0x24BDCB0B0]();
}

uint64_t sub_237649FD0()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_237649FDC()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_237649FE8()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_237649FF4()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23764A000()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23764A00C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23764A018()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23764A024()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23764A030()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23764A03C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23764A048()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23764A054()
{
  return MEMORY[0x24BEE6110]();
}

uint64_t sub_23764A060()
{
  return MEMORY[0x24BDCC7E8]();
}

uint64_t sub_23764A06C()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23764A078()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_23764A084()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23764A090()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23764A09C()
{
  return MEMORY[0x24BDCD760]();
}

uint64_t sub_23764A0A8()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_23764A0B4()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_23764A0C0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23764A0CC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23764A0D8()
{
  return MEMORY[0x24BDCD9D0]();
}

uint64_t sub_23764A0E4()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23764A0F0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23764A0FC()
{
  return MEMORY[0x24BDCDA08]();
}

uint64_t sub_23764A108()
{
  return MEMORY[0x24BDCDA18]();
}

uint64_t sub_23764A114()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23764A120()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23764A12C()
{
  return MEMORY[0x24BDCDB50]();
}

uint64_t sub_23764A138()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23764A144()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_23764A150()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23764A15C()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23764A168()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23764A174()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_23764A180()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23764A18C()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_23764A198()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23764A1A4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23764A1B0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23764A1BC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23764A1C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23764A1D4()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_23764A1E0()
{
  return MEMORY[0x24BEE7408]();
}

uint64_t sub_23764A1EC()
{
  return MEMORY[0x24BE121E0]();
}

uint64_t sub_23764A1F8()
{
  return MEMORY[0x24BE121F8]();
}

uint64_t sub_23764A204()
{
  return MEMORY[0x24BEE6170]();
}

uint64_t sub_23764A210()
{
  return MEMORY[0x24BEE6228]();
}

uint64_t sub_23764A21C()
{
  return MEMORY[0x24BEE62B0]();
}

uint64_t sub_23764A228()
{
  return MEMORY[0x24BEE63C0]();
}

uint64_t sub_23764A234()
{
  return MEMORY[0x24BEB48F8]();
}

uint64_t sub_23764A240()
{
  return MEMORY[0x24BEB4900]();
}

uint64_t sub_23764A24C()
{
  return MEMORY[0x24BEB4908]();
}

uint64_t sub_23764A258()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23764A264()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23764A270()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23764A27C()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_23764A288()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23764A294()
{
  return MEMORY[0x24BE0D550]();
}

uint64_t sub_23764A2A0()
{
  return MEMORY[0x24BE0D560]();
}

uint64_t sub_23764A2AC()
{
  return MEMORY[0x24BE0D578]();
}

uint64_t sub_23764A2B8()
{
  return MEMORY[0x24BE0D9A8]();
}

uint64_t sub_23764A2C4()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23764A2D0()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23764A2DC()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23764A2E8()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_23764A2F4()
{
  return MEMORY[0x24BDC6348]();
}

uint64_t sub_23764A300()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_23764A30C()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_23764A318()
{
  return MEMORY[0x24BDC66E0]();
}

uint64_t sub_23764A324()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_23764A330()
{
  return MEMORY[0x24BDC6B38]();
}

uint64_t sub_23764A33C()
{
  return MEMORY[0x24BDC6B80]();
}

uint64_t sub_23764A348()
{
  return MEMORY[0x24BDC6BA8]();
}

uint64_t sub_23764A354()
{
  return MEMORY[0x24BEE75B8]();
}

uint64_t sub_23764A360()
{
  return MEMORY[0x24BEE75C8]();
}

uint64_t sub_23764A36C()
{
  return MEMORY[0x24BEE75D0]();
}

uint64_t sub_23764A378()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23764A384()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23764A390()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23764A39C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23764A3A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23764A3B4()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23764A3C0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23764A3CC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23764A3D8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23764A3E4()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23764A3F0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23764A3FC()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23764A408()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23764A414()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23764A420()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23764A42C()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_23764A438()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23764A444()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23764A450()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23764A45C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23764A468()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23764A474()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23764A480()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23764A48C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23764A498()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23764A4A4()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23764A4B0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23764A4BC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23764A4C8()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23764A4D4()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23764A4E0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23764A4EC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23764A4F8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23764A504()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23764A510()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23764A51C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23764A528()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23764A534()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23764A540()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23764A54C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23764A558()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23764A564()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23764A570()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_23764A57C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23764A588()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23764A594()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23764A5A0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23764A5AC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23764A5B8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23764A5C4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23764A5D0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23764A5DC()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_23764A5E8()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_23764A5F4()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_23764A600()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23764A60C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23764A618()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23764A624()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23764A630()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23764A63C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23764A648()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23764A654()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23764A660()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23764A66C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23764A678()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23764A684()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23764A690()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23764A69C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23764A6A8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23764A6B4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23764A6C0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23764A6CC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23764A6D8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23764A6E4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23764A6F0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23764A6FC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23764A708()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23764A714()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23764A720()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23764A72C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23764A738()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23764A744()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23764A750()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23764A75C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23764A768()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_23764A774()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23764A780()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23764A78C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23764A798()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23764A7A4()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23764A7B0()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23764A7BC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23764A7C8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23764A7D4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23764A7E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23764A7EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23764A7F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23764A804()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23764A810()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23764A81C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23764A828()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_23764A834()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_23764A840()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23764A84C()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

