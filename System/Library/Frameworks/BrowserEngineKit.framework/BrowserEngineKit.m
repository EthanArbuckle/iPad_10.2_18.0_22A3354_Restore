void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

Swift::Bool __swiftcall WebContentExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t _s16BrowserEngineKit25RestrictedSandboxRevisionO1loiySbAC_ACtFZ_0()
{
  return 0;
}

uint64_t WebContentExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = *(_QWORD *)(a1 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_2330621E8;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_233062190()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_2330621E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 24))();
}

uint64_t WebContentExtensionConfiguration.handleConnection(_:)()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_233062240()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t dispatch thunk of WebContentExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

_QWORD *initializeBufferWithCopyOfBuffer for WebContentExtensionConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for WebContentExtensionConfiguration()
{
  return swift_release();
}

_QWORD *assignWithCopy for WebContentExtensionConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for WebContentExtensionConfiguration(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WebContentExtensionConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WebContentExtensionConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WebContentExtensionConfiguration()
{
  return &type metadata for WebContentExtensionConfiguration;
}

uint64_t sub_2330623A4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2330623E4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_233062404(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_233062488(a1, (unint64_t *)&unk_2560326C0);
}

BOOL sub_233062444(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_233062488(a1, &qword_254241738);
}

void sub_233062488(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2330624D0()
{
  uint64_t v0;

  v0 = sub_2330738C8();
  __swift_allocate_value_buffer(v0, qword_256033530);
  __swift_project_value_buffer(v0, (uint64_t)qword_256033530);
  return sub_2330738BC();
}

uint64_t NetworkingExtension._backgroundTransferManager.getter()
{
  if (qword_256032658 != -1)
    swift_once();
  return swift_retain();
}

id BackgroundTransferManager.DownloadProgress.__allocating_init(sourceURL:destinationURL:title:type:description:sourceDescription:cancellationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  objc_class *v11;
  id v18;
  id v19;

  v18 = objc_allocWithZone(v11);
  v19 = sub_233066514(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  sub_233066A24(a10);
  return v19;
}

id BackgroundTransferManager.DownloadProgress.init(sourceURL:destinationURL:title:type:description:sourceDescription:cancellationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v11;

  v11 = sub_233066514(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  sub_233066A24(a10);
  return v11;
}

id sub_2330628E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v31[15];

  v3 = v2;
  v6 = sub_233073730();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032940);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v31[-v14];
  v16 = *(void **)(v3 + OBJC_IVAR___BEDownloadProgress_progress);
  objc_msgSend(v16, sel_setCompletedUnitCount_, a1);
  objc_msgSend(v16, sel_setTotalUnitCount_, a2);
  if (a2 >= 1)
    v17 = (float)a1 / (float)a2;
  else
    v17 = -1.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256032758);
  v18 = swift_allocObject();
  v19 = MEMORY[0x24BEE14E8];
  *(_OWORD *)(v18 + 16) = xmmword_2330750E0;
  v20 = MEMORY[0x24BEE1568];
  *(_QWORD *)(v18 + 56) = v19;
  *(_QWORD *)(v18 + 64) = v20;
  *(float *)(v18 + 32) = v17;
  v21 = sub_233073988();
  v23 = v22;
  v24 = objc_msgSend(v16, sel_fileURL);
  if (v24)
  {
    v25 = v24;
    sub_233073718();

    v26 = 0;
  }
  else
  {
    v26 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v13, v26, 1, v6);
  sub_233066B54((uint64_t)v13, (uint64_t)v15, &qword_256032940);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6))
  {
    swift_bridgeObjectRelease();
    sub_23306791C((uint64_t)v15, &qword_256032940);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v9, v15, v6);
    v27 = sub_23306791C((uint64_t)v15, &qword_256032940);
    v28 = MEMORY[0x24BDAC7A8](v27);
    *(_QWORD *)&v31[-16] = v21;
    *(_QWORD *)&v31[-8] = v23;
    MEMORY[0x24BDAC7A8](v28);
    *(_QWORD *)&v31[-16] = sub_233066A74;
    *(_QWORD *)&v31[-8] = v29;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256032768);
    sub_23307370C();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
  }
  return objc_msgSend(*(id *)(v3 + OBJC_IVAR___BEDownloadProgress_backgroundTask), sel_updateProgress_, v16);
}

void sub_233062BD8(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v16[2];

  v6 = sub_2330739A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = a2;
  v16[1] = a3;
  sub_233073994();
  sub_233067890();
  v10 = sub_233073A84();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v11 = sub_2330739AC();
  LODWORD(v10) = setxattr(a1, "com.apple.progress.fractionCompleted", (const void *)(v11 + 32), v10, 0, 0);
  swift_release();
  if ((v10 & 0x80000000) != 0)
  {
    if (qword_256032650 != -1)
      swift_once();
    v12 = sub_2330738C8();
    __swift_project_value_buffer(v12, (uint64_t)qword_256033530);
    v13 = sub_2330738B0();
    v14 = sub_233073A48();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v15 = 67109120;
      LODWORD(v16[0]) = MEMORY[0x23492D874]();
      sub_233073A78();
      _os_log_impl(&dword_23305C000, v13, v14, "unable to set xattr: %{darwin.errno}d", v15, 8u);
      MEMORY[0x23492E15C](v15, -1, -1);
    }

  }
}

id sub_233062DF8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___BEDownloadProgress_progress), sel_publish);
}

id sub_233062E28()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___BEDownloadProgress_progress), sel_unpublish);
}

id sub_233062E58()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___BEDownloadProgress_progress), sel_cancel);
}

uint64_t BackgroundTransferManager.DownloadProgress.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_233062F08(&OBJC_IVAR___BEDownloadProgress_id, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t BackgroundTransferManager.DownloadProgress.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BEDownloadProgress_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.DownloadProgress.type.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_233062F08(&OBJC_IVAR___BEDownloadProgress_type, (uint64_t (*)(_QWORD))MEMORY[0x24BEE63B8], a1);
}

uint64_t BackgroundTransferManager.DownloadProgress.downloadDescription.getter()
{
  return sub_233062F54(&OBJC_IVAR___BEDownloadProgress_downloadDescription);
}

uint64_t BackgroundTransferManager.DownloadProgress.sourceURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_233062F08(&OBJC_IVAR___BEDownloadProgress_sourceURL, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t sub_233062F08@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *a1;
  v6 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t BackgroundTransferManager.DownloadProgress.sourceDescription.getter()
{
  return sub_233062F54(&OBJC_IVAR___BEDownloadProgress_sourceDescription);
}

uint64_t sub_233062F54(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_233062F88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR___BEDownloadProgress_destinationURL;
  swift_beginAccess();
  v4 = sub_233073730();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_233062FF0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_233073730();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR___BEDownloadProgress_destinationURL;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_2330630B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___BEDownloadProgress_destinationURL;
  swift_beginAccess();
  v4 = sub_233073730();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_233063118(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___BEDownloadProgress_destinationURL;
  swift_beginAccess();
  v4 = sub_233073730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_233063184())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id BackgroundTransferManager.DownloadProgress.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BackgroundTransferManager.DownloadProgress.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BackgroundTransferManager.DownloadProgress.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundTransferManager.DownloadProgress(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_233063384@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR___BEDownloadProgress_id;
  v4 = sub_233073760();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2330633CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_233073760();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_233063408()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for BackgroundTransferManager();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4B00];
  qword_256033548 = v0;
  return result;
}

uint64_t sub_23306344C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233063498;
  return sub_2330641C8(a1);
}

uint64_t sub_233063498()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330634E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t i;
  char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;

  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032780);
  v1 = MEMORY[0x24BDAC7A8](v54);
  v53 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v52 = (uint64_t)&v44 - v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v44 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)&v44 - v7;
  result = swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v9 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v58 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_233073AF0();
    v13 = sub_23306648C(v9);
    v14 = 0;
    v15 = v9 + 64;
    v16 = *(_BYTE *)(v9 + 32);
    v45 = v9 + 88;
    v46 = v12;
    v48 = (id)v10;
    v49 = v9;
    v47 = v9 + 64;
    while (1)
    {
      if (v13 < 0 || v13 >= 1 << v16)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        swift_bridgeObjectRetain();
        v40 = sub_233073B20();
        result = swift_bridgeObjectRelease();
        if (!v40)
          goto LABEL_42;
LABEL_25:
        if (v40 < 1)
        {
          __break(1u);
        }
        else
        {
          for (i = 0; i != v40; ++i)
          {
            if ((v10 & 0xC000000000000001) != 0)
              v42 = (char *)MEMORY[0x23492DA60](i, v10);
            else
              v42 = (char *)*(id *)(v10 + 8 * i + 32);
            v43 = v42;
            if ((objc_msgSend(*(id *)&v42[OBJC_IVAR___BEDownloadProgress_progress], sel_isFinished) & 1) != 0)
            {

            }
            else
            {
              sub_233073AD8();
              sub_233073AFC();
              sub_233073B08();
              sub_233073AE4();
            }
          }
          swift_bridgeObjectRelease();
          return v58;
        }
        return result;
      }
      if ((*(_QWORD *)(v15 + 8 * ((unint64_t)v13 >> 6)) & (1 << v13)) == 0)
        goto LABEL_36;
      if (*(_DWORD *)(v9 + 36) != (_DWORD)v12)
        goto LABEL_37;
      v56 = 1 << v13;
      v57 = (unint64_t)v13 >> 6;
      v55 = v14;
      v18 = v54;
      v19 = (uint64_t)v50;
      v20 = (uint64_t)&v50[*(int *)(v54 + 48)];
      v21 = *(_QWORD *)(v9 + 48);
      v22 = sub_233073760();
      v23 = *(_QWORD *)(v22 - 8);
      v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
      v24(v19, v21 + *(_QWORD *)(v23 + 72) * v13, v22);
      v25 = *(_QWORD *)(v9 + 56);
      v26 = type metadata accessor for BackgroundTransferManager._Transfer(0);
      sub_233066B10(v25 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v13, v20);
      v27 = (uint64_t)v51;
      v24((uint64_t)v51, v19, v22);
      sub_233066B10(v20, v27 + *(int *)(v18 + 48));
      v28 = v52;
      sub_233066B54(v27, v52, &qword_256032780);
      sub_23306791C(v19, &qword_256032780);
      v29 = *(int *)(v18 + 48);
      v30 = v53;
      v31 = (uint64_t)&v53[v29];
      v32 = v28 + v29;
      v24((uint64_t)v53, v28, v22);
      sub_233066B10(v32, v31);
      v10 = (unint64_t)*(id *)(v31 + *(int *)(v26 + 20));
      sub_233066B98(v31);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v30, v22);
      v33 = v28;
      v9 = v49;
      sub_23306791C(v33, &qword_256032780);
      sub_233073AD8();
      sub_233073AFC();
      sub_233073B08();
      sub_233073AE4();
      v16 = *(_BYTE *)(v9 + 32);
      v17 = 1 << v16;
      if (v13 >= 1 << v16)
        goto LABEL_38;
      v15 = v47;
      v10 = (unint64_t)v48;
      v34 = v57;
      v35 = *(_QWORD *)(v47 + 8 * v57);
      if ((v35 & v56) == 0)
        goto LABEL_39;
      LODWORD(v12) = v46;
      if (*(_DWORD *)(v9 + 36) != (_DWORD)v46)
        goto LABEL_40;
      v36 = v35 & (-2 << (v13 & 0x3F));
      if (v36)
      {
        v17 = __clz(__rbit64(v36)) | v13 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v37 = v57 + 1;
        v38 = (v17 + 63) >> 6;
        if (v57 + 1 < v38)
        {
          v39 = *(_QWORD *)(v47 + 8 * v37);
          if (!v39)
          {
            v37 = v57 + 2;
            if (v57 + 2 >= v38)
              goto LABEL_4;
            v39 = *(_QWORD *)(v47 + 8 * v37);
            if (!v39)
            {
              while (v38 - 3 != v34)
              {
                v39 = *(_QWORD *)(v45 + 8 * v34++);
                if (v39)
                {
                  v37 = v34 + 2;
                  goto LABEL_15;
                }
              }
              goto LABEL_4;
            }
          }
LABEL_15:
          v17 = __clz(__rbit64(v39)) + (v37 << 6);
        }
      }
LABEL_4:
      v14 = v55 + 1;
      v13 = v17;
      if ((id)(v55 + 1) == v48)
      {
        v10 = v58;
        result = swift_bridgeObjectRelease();
        v11 = MEMORY[0x24BEE4AF8];
        goto LABEL_23;
      }
    }
  }
  v10 = MEMORY[0x24BEE4AF8];
LABEL_23:
  v58 = v11;
  if (v10 >> 62)
    goto LABEL_41;
  v40 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v40)
    goto LABEL_25;
LABEL_42:
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2330639A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_2330639BC()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  sub_23307373C();
  v1 = objc_allocWithZone(MEMORY[0x24BDB7230]);
  v2 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithIdentifier_, v2);
  *(_QWORD *)(v0 + 88) = v3;

  swift_bridgeObjectRetain();
  v4 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setTitle_, v4);

  swift_bridgeObjectRetain();
  v5 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setReason_, v5);

  return swift_task_switch();
}

uint64_t sub_233063AE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[11];
  v2 = swift_task_alloc();
  v0[12] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = v3;
  sub_2330672E8();
  *v3 = v0;
  v3[1] = sub_233063B90;
  return sub_233073B80();
}

uint64_t sub_233063B90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233063BFC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v0 + 64);
  return swift_task_switch();
}

uint64_t sub_233063C18()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  void *v10;

  v1 = (void *)v0[15];
  v2 = v0[10];
  v3 = (void *)v0[11];
  v4 = (void *)v0[9];
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClassUnconditional();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v2;
  v0[6] = sub_233067350;
  v0[7] = v6;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_233062680;
  v0[5] = &block_descriptor;
  v7 = _Block_copy(v0 + 2);
  v8 = v1;
  v9 = v4;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_setExpirationHandler_, v7);
  _Block_release(v7);

  v10 = *(void **)&v9[OBJC_IVAR___BEDownloadProgress_backgroundTask];
  *(_QWORD *)&v9[OBJC_IVAR___BEDownloadProgress_backgroundTask] = v5;

  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_233063D48()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233063D88()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233063DBC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9 = sub_233067478(&qword_2560327D8, v8, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundTransferManager, (uint64_t)&protocol conformance descriptor for BackgroundTransferManager);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a2;
  v10[3] = v9;
  v10[4] = a1;
  v10[5] = a2;
  swift_retain_n();
  v11 = a1;
  sub_233067C24((uint64_t)v6, (uint64_t)&unk_2560327E0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_233063EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327E8);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233063F40()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  char *v7;
  uint8_t *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_256032650 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = sub_2330738C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_256033530);
  v3 = v1;
  v4 = sub_2330738B0();
  v5 = sub_233073A54();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(char **)(v0 + 56);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = *(void **)&v7[OBJC_IVAR___BEDownloadProgress_backgroundTask];
    if (v10)
    {
      *(_QWORD *)(v0 + 48) = v10;
      v11 = v10;
    }
    else
    {
      *(_QWORD *)(v0 + 40) = 0;
    }
    sub_233073A78();
    v12 = *(void **)(v0 + 56);
    *v9 = v10;

    _os_log_impl(&dword_23305C000, v4, v5, "Task expired: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254241748);
    swift_arrayDestroy();
    MEMORY[0x23492E15C](v9, -1, -1);
    MEMORY[0x23492E15C](v8, -1, -1);
  }
  else
  {

  }
  v13 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 56);
  objc_msgSend(*(id *)(v14 + OBJC_IVAR___BEDownloadProgress_progress), sel_cancel);
  v15 = v14 + OBJC_IVAR___BEDownloadProgress_id;
  swift_beginAccess();
  sub_2330654E4(v15, v13);
  sub_23306791C(v13, &qword_2560327E8);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23306419C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2330641C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2[8] = a1;
  v2[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327E8);
  v2[10] = swift_task_alloc();
  v4 = sub_233073760();
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v5 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v2[17] = v6;
  *v6 = v2;
  v6[1] = sub_2330642A0;
  v6[9] = a1;
  v6[10] = v1;
  return swift_task_switch();
}

uint64_t sub_2330642A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233064334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, char *, uint64_t);
  char *v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 128);
  v27 = *(_QWORD *)(v0 + 120);
  v24 = *(_QWORD *)(v0 + 112);
  v25 = *(_QWORD *)(v0 + 104);
  v22 = *(_QWORD *)(v0 + 96);
  v23 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);
  v26 = *(_QWORD *)(v0 + 80);
  v3 = *(char **)(v0 + 64);
  v4 = *(void **)&v3[OBJC_IVAR___BEDownloadProgress_progress];
  *(_QWORD *)(v0 + 40) = v4;
  swift_getKeyPath();
  v5 = v4;
  v21 = (void *)sub_2330736C4();
  swift_release();

  *(_QWORD *)(v0 + 48) = v5;
  swift_getKeyPath();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v2;
  *(_QWORD *)(v6 + 24) = v3;
  v7 = v5;
  swift_retain();
  v8 = v3;
  v19 = (void *)sub_2330736C4();
  swift_release();
  swift_release();

  *(_QWORD *)(v0 + 56) = v7;
  swift_getKeyPath();
  swift_unownedRetainStrong();
  v9 = v7;
  swift_unownedRetain();
  swift_release();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v2;
  *(_QWORD *)(v10 + 24) = v8;
  v11 = v8;
  v20 = (void *)sub_2330736C4();
  swift_release();
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_254241760);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2330750F0;
  *(_QWORD *)(v12 + 32) = v21;
  *(_QWORD *)(v12 + 40) = v19;
  *(_QWORD *)(v12 + 48) = v20;
  v28 = v12;
  sub_2330739E8();
  v13 = *(void (**)(uint64_t, char *, uint64_t))(v22 + 16);
  v13(v1, &v11[OBJC_IVAR___BEDownloadProgress_id], v23);
  *(_QWORD *)(v1 + *(int *)(v24 + 20)) = v11;
  *(_QWORD *)(v1 + *(int *)(v24 + 24)) = v28;
  v13(v25, (char *)v1, v23);
  sub_233066B10(v1, v26);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(v26, 0, 1, v24);
  swift_beginAccess();
  v14 = v11;
  v15 = v21;
  v16 = v19;
  v17 = v20;
  sub_233064E0C(v26, v25);
  swift_endAccess();

  sub_233066B98(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_233064660(void **a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;

  v1 = *a1;
  if (qword_256032650 != -1)
    swift_once();
  v2 = sub_2330738C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_256033530);
  v6 = v1;
  v3 = sub_2330738B0();
  v4 = sub_233073A54();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    objc_msgSend(v6, sel_fractionCompleted);
    sub_233073A78();

    _os_log_impl(&dword_23305C000, v3, v4, "Progress:  %f", v5, 0xCu);
    MEMORY[0x23492E15C](v5, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2330647B0(void **a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = a3;
  v12[6] = a4;
  v13 = v10;
  swift_retain();
  v14 = a4;
  sub_233067C24((uint64_t)v9, (uint64_t)&unk_256032828, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_233064894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327E8);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330648F4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;

  if (qword_256032650 != -1)
    swift_once();
  v1 = *(void **)(v0 + 40);
  v2 = sub_2330738C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_256033530);
  v3 = v1;
  v4 = sub_2330738B0();
  v5 = sub_233073A54();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 40);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    *(_DWORD *)(v0 + 72) = objc_msgSend(v7, sel_isFinished);
    sub_233073A78();

    _os_log_impl(&dword_23305C000, v4, v5, "Finished:  %{BOOL}d", v8, 8u);
    MEMORY[0x23492E15C](v8, -1, -1);
  }
  else
  {

  }
  return swift_task_switch();
}

uint64_t sub_233064A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56) + OBJC_IVAR___BEDownloadProgress_id;
  swift_beginAccess();
  sub_2330654E4(v2, v1);
  sub_23306791C(v1, &qword_2560327E8);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233064AD0(void **a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = a3;
  v12[6] = a4;
  v13 = v10;
  swift_unownedRetain();
  v14 = a4;
  sub_233067C24((uint64_t)v9, (uint64_t)&unk_256032818, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_233064BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327E8);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233064C14()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;

  if (qword_256032650 != -1)
    swift_once();
  v1 = *(void **)(v0 + 40);
  v2 = sub_2330738C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_256033530);
  v3 = v1;
  v4 = sub_2330738B0();
  v5 = sub_233073A54();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 40);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    *(_DWORD *)(v0 + 72) = objc_msgSend(v7, sel_isCancelled);
    sub_233073A78();

    _os_log_impl(&dword_23305C000, v4, v5, "Canceled:  %{BOOL}d", v8, 8u);
    MEMORY[0x23492E15C](v8, -1, -1);
  }
  else
  {

  }
  swift_unownedRetainStrong();
  return swift_task_switch();
}

uint64_t sub_233064D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56) + OBJC_IVAR___BEDownloadProgress_id;
  swift_beginAccess();
  sub_2330654E4(v2, v1);
  sub_23306791C(v1, &qword_2560327E8);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233064E0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560327E8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_23306791C(a1, &qword_2560327E8);
    sub_2330654E4(a2, (uint64_t)v8);
    v13 = sub_233073760();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_23306791C((uint64_t)v8, &qword_2560327E8);
  }
  else
  {
    sub_233067434(a1, (uint64_t)v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_233065DBC((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_233073760();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t BackgroundTransferManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BackgroundTransferManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t BackgroundTransferManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_233064FD8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_233064FE4()
{
  return 1;
}

uint64_t sub_233064FEC()
{
  sub_233073BC8();
  sub_233073BD4();
  return sub_233073BE0();
}

uint64_t sub_23306502C()
{
  return sub_233073BD4();
}

uint64_t sub_233065050()
{
  sub_233073BC8();
  sub_233073BD4();
  return sub_233073BE0();
}

id sub_23306509C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  char *v12;
  void *v13;
  id v14;
  unsigned int v15;
  void *v17;
  id v18;
  _QWORD v19[3];
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032800);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_sharedScheduler);
  v10 = objc_msgSend(a2, sel_identifier);
  if (!v10)
  {
    sub_23307397C();
    v10 = (id)sub_233073970();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = (char *)swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], v7, v4);
  aBlock[4] = sub_23306755C;
  aBlock[5] = v12;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_233065390;
  aBlock[3] = &block_descriptor_18;
  v13 = _Block_copy(aBlock);
  swift_release();
  LODWORD(v12) = objc_msgSend(v9, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v10, 0, v13);
  _Block_release(v13);

  if ((_DWORD)v12)
  {
    v14 = objc_msgSend(v8, sel_sharedScheduler);
    aBlock[0] = 0;
    v15 = objc_msgSend(v14, sel_submitTaskRequest_error_, a2, aBlock);

    if (v15)
      return aBlock[0];
    v19[1] = aBlock[0];
    v18 = aBlock[0];
    v17 = (void *)sub_2330736B8();

  }
  else
  {
    sub_23306759C();
    v17 = (void *)swift_allocError();
  }
  swift_willThrow();
  aBlock[0] = v17;
  return (id)sub_233073A00();
}

uint64_t sub_23306534C(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256032800);
  return sub_233073A0C();
}

void sub_233065390(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2330653E0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2330653F0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_233065424(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_233065434(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_233073A78();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_2330654E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_233065618(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_233066210();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_233073760();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_233067434(v12 + *(_QWORD *)(v14 + 72) * v6, a2);
    sub_233065AE4(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

unint64_t sub_233065618(uint64_t a1)
{
  uint64_t v2;

  sub_233073760();
  sub_233067478(&qword_256032788, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_233073958();
  return sub_233065FEC(a1, v2);
}

unint64_t sub_233065688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_233073BC8();
  sub_2330739B8();
  v4 = sub_233073BE0();
  return sub_233066130(a1, a2, v4);
}

uint64_t sub_2330656EC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t i;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v3 = v2;
  v5 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_233073760();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327F0);
  v48 = a2;
  v12 = v11;
  v13 = sub_233073B38();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
    goto LABEL_41;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 64);
  v45 = (_QWORD *)(v12 + 64);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v43 = v2;
  v44 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 64;
  result = swift_retain();
  v21 = 0;
  for (i = v12; ; v12 = i)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_34;
      v27 = v45[v21];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          v3 = v43;
          if ((v48 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v21 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v21 >= v44)
              goto LABEL_34;
            v27 = v45[v21];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v21 = v28;
      }
    }
LABEL_21:
    v18 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v8 + 72);
    v30 = *(_QWORD *)(v12 + 48) + v29 * v24;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v30, v7);
      v31 = *(_QWORD *)(v12 + 56);
      v32 = *(_QWORD *)(v47 + 72);
      sub_233067434(v31 + v32 * v24, v49);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v33 = *(_QWORD *)(v12 + 56);
      v32 = *(_QWORD *)(v47 + 72);
      sub_233066B10(v33 + v32 * v24, v49);
    }
    sub_233067478(&qword_256032788, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_233073958();
    v34 = -1 << *(_BYTE *)(v14 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v14 + 48) + v22 * v29, v10, v7);
    result = sub_233067434(v49, *(_QWORD *)(v14 + 56) + v22 * v32);
    ++*(_QWORD *)(v14 + 16);
  }
  swift_release();
  v3 = v43;
  v26 = v45;
  if ((v48 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v12 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v12 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v14;
  return result;
}

unint64_t sub_233065AE4(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_233073760();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_233073A9C();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v10 * v12;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v10 * v12, v4);
        sub_233067478(&qword_256032788, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_233073958();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (a1 * v15 < v16
              || *(_QWORD *)(a2 + 48) + a1 * v15 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a1 * v15 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for BackgroundTransferManager._Transfer(0) - 8) + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_233065DBC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_233073760();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_233065618(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = type metadata accessor for BackgroundTransferManager._Transfer(0);
        return sub_2330676EC(a1, v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_233066210();
      goto LABEL_7;
    }
    sub_2330656EC(v17, a3 & 1);
    v24 = sub_233065618(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_233065F3C(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_233073B8C();
  __break(1u);
  return result;
}

uint64_t sub_233065F3C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_233073760();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  result = sub_233067434(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_233065FEC(uint64_t a1, uint64_t a2)
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
  v5 = sub_233073760();
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
      sub_233067478(&qword_2560327F8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_233073964();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_233066130(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_233073B68() & 1) == 0)
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
      while (!v14 && (sub_233073B68() & 1) == 0);
    }
  }
  return v6;
}

void *sub_233066210()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  v1 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v28 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_233073760();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327F0);
  v25 = v0;
  v8 = *v0;
  v9 = sub_233073B2C();
  v10 = v9;
  v11 = *(_QWORD *)(v8 + 16);
  if (!v11)
  {
LABEL_23:
    result = (void *)swift_release();
    *v25 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    v11 = *(_QWORD *)(v8 + 16);
  }
  v26 = v8 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = v11;
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v27 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v19 = v18 | (v14 << 6);
      goto LABEL_9;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v27)
      goto LABEL_23;
    v23 = *(_QWORD *)(v26 + 8 * v22);
    ++v14;
    if (!v23)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v27)
        goto LABEL_23;
      v23 = *(_QWORD *)(v26 + 8 * v14);
      if (!v23)
        break;
    }
LABEL_22:
    v17 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_9:
    v20 = *(_QWORD *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v20, v4);
    v21 = *(_QWORD *)(v28 + 72) * v19;
    sub_233066B10(*(_QWORD *)(v8 + 56) + v21, (uint64_t)v3);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v20, v7, v4);
    result = (void *)sub_233067434((uint64_t)v3, *(_QWORD *)(v10 + 56) + v21);
  }
  v24 = v22 + 2;
  if (v24 >= v27)
    goto LABEL_23;
  v23 = *(_QWORD *)(v26 + 8 * v24);
  if (v23)
  {
    v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v14 >= v27)
      goto LABEL_23;
    v23 = *(_QWORD *)(v26 + 8 * v14);
    ++v24;
    if (v23)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23306648C(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
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

id sub_233066514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t (*v39)(char *, uint64_t, uint64_t);
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, uint64_t, uint64_t);
  char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  objc_class *v66;
  id v67;
  void (*v68)(uint64_t, uint64_t);
  char *v70;
  char *v71;
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
  _QWORD aBlock[6];
  objc_super v84;

  v77 = a8;
  v78 = a1;
  v74 = a6;
  v75 = a7;
  v82 = a5;
  v73 = a3;
  v79 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560327C0);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v72 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v70 - v15;
  v17 = sub_2330738A4();
  v80 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v70 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v71 = (char *)&v70 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v70 - v22;
  v24 = sub_233073730();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v11;
  sub_233073754();
  v29 = OBJC_IVAR___BEDownloadProgress_progress;
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1768]), sel_init);
  v76 = v29;
  *(_QWORD *)&v28[v29] = v30;
  *(_QWORD *)&v28[OBJC_IVAR___BEDownloadProgress_backgroundTask] = 0;
  v81 = v25;
  if (a4)
  {
    v31 = v24;
    v33 = v79;
    v32 = v80;
    v34 = v73;
  }
  else
  {
    v35 = v24;
    v33 = v79;
    sub_233073700();
    v34 = sub_2330736E8();
    a4 = v36;
    v37 = v27;
    v31 = v35;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v37, v35);
    v32 = v80;
  }
  v73 = a10;
  v38 = (uint64_t *)&v28[OBJC_IVAR___BEDownloadProgress_title];
  *v38 = v34;
  v38[1] = a4;
  sub_2330678D4(v82, (uint64_t)v16);
  v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v40 = v39(v16, 1, v17);
  v79 = a9;
  if (v40 == 1)
  {
    sub_23306791C((uint64_t)v16, &qword_2560327C0);
    v41 = v33;
    sub_2330736D0();
    sub_233073898();
    v42 = (uint64_t)v72;
    v43 = v80;
    sub_233073880();
    v44 = v39((char *)v42, 1, v17);
    v45 = v31;
    v46 = v81;
    v47 = v77;
    v48 = v71;
    if (v44 == 1)
    {
      sub_233073898();
      sub_23306791C(v42, &qword_2560327C0);
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(&v28[OBJC_IVAR___BEDownloadProgress_type], v48, v17);
    }
    else
    {
      v51 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 32);
      v51(v71, v42, v17);
      v51(&v28[OBJC_IVAR___BEDownloadProgress_type], (uint64_t)v48, v17);
    }
    v50 = v78;
  }
  else
  {
    v49 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v49(v23, v16, v17);
    v49(&v28[OBJC_IVAR___BEDownloadProgress_type], v23, v17);
    v47 = v77;
    v50 = v78;
    v41 = v33;
    v45 = v31;
    v46 = v81;
  }
  v52 = v75;
  v53 = v76;
  v54 = v73;
  v55 = &v28[OBJC_IVAR___BEDownloadProgress_downloadDescription];
  *(_QWORD *)v55 = v74;
  *((_QWORD *)v55 + 1) = v52;
  v56 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  v56(&v28[OBJC_IVAR___BEDownloadProgress_sourceURL], v50, v45);
  v57 = &v28[OBJC_IVAR___BEDownloadProgress_sourceDescription];
  v58 = v79;
  *(_QWORD *)v57 = v47;
  *((_QWORD *)v57 + 1) = v58;
  v56(&v28[OBJC_IVAR___BEDownloadProgress_destinationURL], v41, v45);
  v59 = *(void **)&v28[v53];
  objc_msgSend(v59, sel_setCancellable_, 1);
  if (v54)
  {
    aBlock[4] = v54;
    aBlock[5] = a11;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_233062680;
    aBlock[3] = &block_descriptor_44;
    v60 = _Block_copy(aBlock);
    v61 = v59;
    sub_233067958(v54);
    swift_release();
  }
  else
  {
    v62 = v59;
    v60 = 0;
  }
  objc_msgSend(v59, sel_setCancellationHandler_, v60);
  _Block_release(v60);

  v63 = *(void **)&v28[v53];
  objc_msgSend(v63, sel_setKind_, *MEMORY[0x24BDD11B0]);
  objc_msgSend(v63, sel_setFileOperationKind_, *MEMORY[0x24BDD1188]);
  v64 = v63;
  v65 = (void *)sub_2330736F4();
  objc_msgSend(v64, sel_setFileURL_, v65);

  v66 = (objc_class *)type metadata accessor for BackgroundTransferManager.DownloadProgress(0);
  v84.receiver = v28;
  v84.super_class = v66;
  v67 = objc_msgSendSuper2(&v84, sel_init);
  sub_23306791C(v82, &qword_2560327C0);
  v68 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
  v68(v41, v45);
  v68(v50, v45);
  return v67;
}

uint64_t sub_233066A24(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492E0C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_233066A74(const char *a1)
{
  uint64_t v1;

  sub_233062BD8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_233066A7C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = 0;
  return result;
}

uint64_t type metadata accessor for BackgroundTransferManager.DownloadProgress(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2560327A0);
}

uint64_t type metadata accessor for BackgroundTransferManager._Transfer(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2560327B0);
}

uint64_t sub_233066ADC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233066B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233066B54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_233066B98(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233066BD4()
{
  return sub_233067478(&qword_256032788, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t type metadata accessor for BackgroundTransferManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BackgroundTransferManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BackgroundTransferManager.register(download:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_233063498;
  return v6(a1);
}

uint64_t dispatch thunk of BackgroundTransferManager.transfers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_233066CA8()
{
  return type metadata accessor for BackgroundTransferManager.DownloadProgress(0);
}

uint64_t sub_233066CB0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_233073760();
  if (v1 <= 0x3F)
  {
    result = sub_2330738A4();
    if (v2 <= 0x3F)
    {
      result = sub_233073730();
      if (v3 <= 0x3F)
        return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for BackgroundTransferManager.DownloadProgress()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.__allocating_init(sourceURL:destinationURL:title:type:description:sourceDescription:cancellationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.updateProgress(bytesReceived:bytesTotal:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.publish()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.unpublish()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.cancel()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.destinationURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.destinationURL.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of BackgroundTransferManager.DownloadProgress.destinationURL.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t *sub_233066E64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
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
    v7 = sub_233073760();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    v11 = v10;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_233066F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233073760();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_233066F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = sub_233073760();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v10 = v9;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_233066FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_233073760();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233067044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_233073760();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_2330670A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_233073760();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233067120()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23306712C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_233073760();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2330671A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2330671B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_233073760();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23306722C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233073760();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2330672B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2330672D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_2330672E0(uint64_t a1)
{
  uint64_t v1;

  return sub_23306509C(a1, *(void **)(v1 + 16));
}

unint64_t sub_2330672E8()
{
  unint64_t result;

  result = qword_2560327C8;
  if (!qword_2560327C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2560327C8);
  }
  return result;
}

uint64_t sub_233067324()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233067350()
{
  uint64_t v0;

  return sub_233063DBC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
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

uint64_t sub_233067370()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330673A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_233063498;
  return sub_233063EB4(a1, v4, v5, v7, v6);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_233067434(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233067478(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23492E0D8](a4, v7);
    atomic_store(result, a1);
  }
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

uint64_t sub_2330674F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032800);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23306755C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256032800);
  return sub_23306534C(a1);
}

unint64_t sub_23306759C()
{
  unint64_t result;

  result = qword_256032808;
  if (!qword_256032808)
  {
    result = MEMORY[0x23492E0D8](&unk_2330753F0, &type metadata for TaskRegistrationError);
    atomic_store(result, &qword_256032808);
  }
  return result;
}

char *keypath_get_selector_fractionCompleted()
{
  return sel_fractionCompleted;
}

id sub_2330675EC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fractionCompleted);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_isFinished()
{
  return sel_isFinished;
}

id sub_233067628@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isFinished);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_233067658()
{
  return objectdestroy_25Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_233067664(void **a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2330647B0(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

char *keypath_get_selector_isCancelled()
{
  return sel_isCancelled;
}

id sub_233067678@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isCancelled);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_2330676A8()
{
  return objectdestroy_25Tm(MEMORY[0x24BEE4FF0]);
}

uint64_t objectdestroy_25Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));

  return swift_deallocObject();
}

uint64_t sub_2330676E4(void **a1, uint64_t a2)
{
  uint64_t v2;

  return sub_233064AD0(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_2330676EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_233067730()
{
  return objectdestroy_35Tm(MEMORY[0x24BEE4FF0]);
}

uint64_t sub_23306773C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_233067AA4;
  return sub_233064BB4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2330677BC()
{
  return objectdestroy_35Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_35Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_unknownObjectRelease();

  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject();
}

uint64_t sub_233067810(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_233067AA4;
  return sub_233064894(a1, v4, v5, v6, v7, v8);
}

unint64_t sub_233067890()
{
  unint64_t result;

  result = qword_256032830;
  if (!qword_256032830)
  {
    result = MEMORY[0x23492E0D8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256032830);
  }
  return result;
}

uint64_t sub_2330678D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560327C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23306791C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233067958(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t getEnumTagSinglePayload for TaskRegistrationError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TaskRegistrationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2330679FC + 4 * byte_233075120[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233067A1C + 4 * byte_233075125[v4]))();
}

_BYTE *sub_2330679FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233067A1C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233067A24(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233067A2C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233067A34(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233067A3C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TaskRegistrationError()
{
  return &type metadata for TaskRegistrationError;
}

unint64_t sub_233067A60()
{
  unint64_t result;

  result = qword_256032838;
  if (!qword_256032838)
  {
    result = MEMORY[0x23492E0D8](&unk_2330753C8, &type metadata for TaskRegistrationError);
    atomic_store(result, (unint64_t *)&qword_256032838);
  }
  return result;
}

Swift::Bool __swiftcall RenderingExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t RenderingExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = *(_QWORD *)(a1 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_2330621E8;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_233067B88()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t RenderingExtensionConfiguration.handleConnection(_:)()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t dispatch thunk of RenderingExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for RenderingExtensionConfiguration()
{
  return &type metadata for RenderingExtensionConfiguration;
}

uint64_t dispatch thunk of _RenderingExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_233067C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_233073A24();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_233073A18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23306DBC4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2330739F4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_233067D68()
{
  return sub_233073838();
}

uint64_t NetworkingProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_2330738F8();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v7 = sub_233073844();
  v5[10] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_233073814();
  v5[15] = swift_task_alloc();
  v9 = sub_2330737F0();
  v5[16] = v9;
  v5[17] = *(_QWORD *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v10 = sub_233073850();
  v5[20] = v10;
  v5[21] = *(_QWORD *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v11 = sub_233073868();
  v5[24] = v11;
  v5[25] = *(_QWORD *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330680B0()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (*(_QWORD *)(v0 + 32))
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    swift_bridgeObjectRetain();
    v8 = sub_23306BEB4();
    v9 = objc_msgSend(v8, sel_extensionPointRecord);
    v10 = objc_msgSend(v9, sel_identifier);

    v11 = sub_23307397C();
    v13 = v12;

    if (v11 == 0xD000000000000027 && v13 == 0x80000002330760C0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    v14 = sub_233073B68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      goto LABEL_11;
    goto LABEL_12;
  }
  sub_23306DCA0(0, &qword_256032848);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v2)
  {
    v8 = v2;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)
    {
LABEL_12:

      goto LABEL_13;
    }
    v4 = *(_QWORD *)(v0 + 24);
    v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    v6 = sub_233073A30();

    sub_23306C02C(v6, v4, 0);
    v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_11:
      v15 = v8;
      *(_QWORD *)(v0 + 224) = v15;
      v17 = *(_QWORD *)(v0 + 208);
      v16 = *(_QWORD *)(v0 + 216);
      v18 = *(_QWORD *)(v0 + 200);
      v19 = *(_QWORD *)(v0 + 176);
      v20 = *(_QWORD *)(v0 + 184);
      v26 = *(_QWORD *)(v0 + 192);
      v27 = *(_QWORD *)(v0 + 168);
      v21 = *(_QWORD *)(v0 + 152);
      v29 = *(_QWORD *)(v0 + 136);
      v30 = *(_QWORD *)(v0 + 128);
      v31 = *(_QWORD *)(v0 + 144);
      v28 = *(_QWORD *)(v0 + 160);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC79C0]), sel_initWithApplicationExtensionRecord_, v15);
      sub_233073874();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v16, v26);
      sub_23307385C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v19, v20, v28);
      swift_retain();
      sub_2330737D8();
      sub_233073808();
      sub_2330737E4();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v31, v21, v30);
      v22 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 232) = v22;
      *v22 = v0;
      v22[1] = sub_2330684E0;
      return sub_2330737FC();
    }
  }
LABEL_13:
  v24 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v25 = (void *)sub_233073970();
  objc_msgSend(v24, sel_initWithDomain_code_userInfo_, v25, 1, 0);

  swift_willThrow();
  swift_release();
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

uint64_t sub_2330684E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233068544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v13;
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

  v13 = *(void **)(v0 + 224);
  v23 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 152);
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD **)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 56);
  v17 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(void))(v3 + 16);
  v8();
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v2, v1, v4);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v2, v4);
  *v5 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BEE5420], v7);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_23306C474((uint64_t)sub_23306C450, v10, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  *(_QWORD *)(v17 + *(int *)(type metadata accessor for NetworkingProcess(0) + 20)) = v11;
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

uint64_t sub_233068780()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(void **)(v0 + 224);
  v11 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 136);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v11, v2);
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

uint64_t sub_233068894(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2330688CC + 4 * byte_233075530[a1]))(0xD000000000000027, 0x80000002330760C0);
}

uint64_t sub_2330688CC(uint64_t a1)
{
  return a1 - 1;
}

unint64_t sub_233068910()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256032858;
  if (!qword_256032858)
  {
    v1 = sub_23306DCA0(255, &qword_256032850);
    result = MEMORY[0x23492E0D8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256032858);
  }
  return result;
}

void sub_233068968(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  void *v30;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_233073AA8();
    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    sub_233073A3C();
    v1 = v25;
    v24 = v26;
    v2 = v27;
    v3 = v28;
    v4 = v29;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v24 = a1 + 56;
    v6 = ~v5;
    v7 = -v5;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v4 = v8 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v2 = v6;
    v3 = 0;
  }
  v22 = v2;
  v23 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_10;
LABEL_8:
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    goto LABEL_29;
  }
  v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 < v23)
    {
      v13 = v3;
      v14 = *(_QWORD *)(v24 + 8 * v12);
      ++v3;
      if (v14)
        goto LABEL_28;
      v3 = v12 + 1;
      if (v12 + 1 >= v23)
        goto LABEL_36;
      v14 = *(_QWORD *)(v24 + 8 * v3);
      if (v14)
        goto LABEL_28;
      v3 = v12 + 2;
      if (v12 + 2 >= v23)
        goto LABEL_36;
      v14 = *(_QWORD *)(v24 + 8 * v3);
      if (v14)
        goto LABEL_28;
      v3 = v12 + 3;
      if (v12 + 3 >= v23)
        goto LABEL_36;
      v14 = *(_QWORD *)(v24 + 8 * v3);
      if (v14)
      {
LABEL_28:
        v9 = (v14 - 1) & v14;
        v10 = __clz(__rbit64(v14)) + (v3 << 6);
LABEL_29:
        v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
        if (v11)
        {
          while (1)
          {
            v16 = objc_msgSend(v11, sel_extensionPointRecord, v22);
            v17 = objc_msgSend(v16, sel_identifier);

            v18 = sub_23307397C();
            v20 = v19;

            if (v18 == 0xD000000000000020 && v20 == 0x80000002330762E0)
              break;
            v21 = sub_233073B68();
            swift_bridgeObjectRelease();
            if ((v21 & 1) != 0)
              goto LABEL_36;

            v4 = v9;
            if ((v1 & 0x8000000000000000) == 0)
              goto LABEL_8;
LABEL_10:
            if (sub_233073AB4())
            {
              sub_23306DCA0(0, &qword_256032850);
              swift_unknownObjectRetain();
              swift_dynamicCast();
              v11 = v30;
              swift_unknownObjectRelease();
              v9 = v4;
              if (v30)
                continue;
            }
            goto LABEL_36;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_36;
      }
      v3 = v12 + 4;
      if (v12 + 4 < v23)
      {
        v14 = *(_QWORD *)(v24 + 8 * v3);
        if (!v14)
        {
          v15 = v13 + 6;
          while (v23 != v15)
          {
            v14 = *(_QWORD *)(v24 + 8 * v15++);
            if (v14)
            {
              v3 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_28;
      }
    }
LABEL_36:
    sub_23306DC98();
    return;
  }
  __break(1u);
}

uint64_t NetworkingProcess.makeLibXPCConnection()()
{
  return sub_23306A11C();
}

Swift::Void __swiftcall NetworkingProcess.invalidate()()
{
  sub_233069678(type metadata accessor for NetworkingProcess);
}

uint64_t WebContentProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_2330738F8();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v7 = sub_233073844();
  v5[10] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_233073814();
  v5[15] = swift_task_alloc();
  v9 = sub_2330737F0();
  v5[16] = v9;
  v5[17] = *(_QWORD *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v10 = sub_233073850();
  v5[20] = v10;
  v5[21] = *(_QWORD *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v11 = sub_233073868();
  v5[24] = v11;
  v5[25] = *(_QWORD *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233068E98()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (*(_QWORD *)(v0 + 32))
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    swift_bridgeObjectRetain();
    v8 = sub_23306BEB4();
    v9 = sub_2330694C4();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      goto LABEL_8;
    goto LABEL_9;
  }
  sub_23306DCA0(0, &qword_256032848);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v2)
  {
    v8 = v2;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)
    {
LABEL_9:

      goto LABEL_10;
    }
    v4 = *(_QWORD *)(v0 + 24);
    v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    v6 = sub_233073A30();

    sub_23306C6FC(v6, v4, 0);
    v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_8:
      v10 = v8;
      *(_QWORD *)(v0 + 224) = v10;
      v12 = *(_QWORD *)(v0 + 208);
      v11 = *(_QWORD *)(v0 + 216);
      v13 = *(_QWORD *)(v0 + 200);
      v14 = *(_QWORD *)(v0 + 176);
      v15 = *(_QWORD *)(v0 + 184);
      v21 = *(_QWORD *)(v0 + 192);
      v22 = *(_QWORD *)(v0 + 168);
      v16 = *(_QWORD *)(v0 + 152);
      v24 = *(_QWORD *)(v0 + 136);
      v25 = *(_QWORD *)(v0 + 128);
      v26 = *(_QWORD *)(v0 + 144);
      v23 = *(_QWORD *)(v0 + 160);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC79C0]), sel_initWithApplicationExtensionRecord_, v10);
      sub_233073874();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v21);
      sub_23307385C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v14, v15, v23);
      swift_retain();
      sub_2330737CC();
      sub_233073808();
      sub_2330737E4();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v26, v16, v25);
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 232) = v17;
      *v17 = v0;
      v17[1] = sub_233069224;
      return sub_2330737FC();
    }
  }
LABEL_10:
  v19 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v20 = (void *)sub_233073970();
  objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, 1, 0);

  swift_willThrow();
  swift_release();
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

uint64_t sub_233069224()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233069288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v13;
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

  v13 = *(void **)(v0 + 224);
  v23 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 152);
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD **)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 56);
  v17 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(void))(v3 + 16);
  v8();
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v2, v1, v4);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v2, v4);
  *v5 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BEE5420], v7);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_23306C474((uint64_t)sub_23306C450, v10, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  *(_QWORD *)(v17 + *(int *)(type metadata accessor for WebContentProcess(0) + 20)) = v11;
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

uint64_t sub_2330694C4()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v1 = objc_msgSend(v0, sel_extensionPointRecord);
  v2 = objc_msgSend(v1, sel_identifier);

  v3 = sub_23307397C();
  v5 = v4;

  if (v3 == 0xD000000000000024 && v5 == 0x8000000233076310)
    goto LABEL_3;
  v6 = sub_233073B68();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 1;
  v8 = objc_msgSend(v0, sel_extensionPointRecord);
  v9 = objc_msgSend(v8, sel_identifier);

  v10 = sub_23307397C();
  v12 = v11;

  if (v10 == 0xD000000000000027 && v12 == 0x8000000233076340)
  {
LABEL_3:
    swift_bridgeObjectRelease();
    return 1;
  }
  v13 = sub_233073B68();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

uint64_t WebContentProcess.makeLibXPCConnection()()
{
  return sub_23306A11C();
}

id WebContentProcess.createVisibilityPropagationInteraction()()
{
  return sub_23306A1E0();
}

Swift::Void __swiftcall WebContentProcess.invalidate()()
{
  sub_233069678(type metadata accessor for WebContentProcess);
}

uint64_t sub_233069678(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  _QWORD *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v2 = *(_QWORD **)(v1 + *(int *)(a1(0) + 20));
  v3 = (os_unfair_lock_s *)(v2[4] + 16);
  os_unfair_lock_lock(v3);
  v4 = v2[2];
  if (v4)
  {
    v2[2] = 0;
    v2[3] = 0;
    sub_233066A24(v4);
  }
  os_unfair_lock_unlock(v3);
  sub_2330737B4();
  return sub_233067D68();
}

uint64_t RenderingProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_2330738F8();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v7 = sub_233073844();
  v5[10] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_233073814();
  v5[15] = swift_task_alloc();
  v9 = sub_2330737F0();
  v5[16] = v9;
  v5[17] = *(_QWORD *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v10 = sub_233073850();
  v5[20] = v10;
  v5[21] = *(_QWORD *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v11 = sub_233073868();
  v5[24] = v11;
  v5[25] = *(_QWORD *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233069850()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (*(_QWORD *)(v0 + 32))
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    swift_bridgeObjectRetain();
    v8 = sub_23306BEB4();
    v9 = objc_msgSend(v8, sel_extensionPointRecord);
    v10 = objc_msgSend(v9, sel_identifier);

    v11 = sub_23307397C();
    v13 = v12;

    if (v11 == 0xD000000000000026 && v13 == 0x8000000233076110)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    v14 = sub_233073B68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      goto LABEL_15;
LABEL_11:

    goto LABEL_12;
  }
  sub_23306DCA0(0, &qword_256032848);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (!v2)
    goto LABEL_12;
  v8 = v2;
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)
    goto LABEL_11;
  v4 = *(_QWORD *)(v0 + 24);
  v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

  sub_23306DCA0(0, &qword_256032850);
  sub_233068910();
  v6 = sub_233073A30();

  sub_23306CC7C(v6, v4, 0);
  v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_15:
    v21 = v8;
    *(_QWORD *)(v0 + 224) = v21;
    *(_QWORD *)(v0 + 232) = v8;
    v23 = *(_QWORD *)(v0 + 208);
    v22 = *(_QWORD *)(v0 + 216);
    v24 = *(_QWORD *)(v0 + 200);
    v25 = *(_QWORD *)(v0 + 176);
    v26 = *(_QWORD *)(v0 + 184);
    v32 = *(_QWORD *)(v0 + 192);
    v33 = *(_QWORD *)(v0 + 168);
    v27 = *(_QWORD *)(v0 + 152);
    v35 = *(_QWORD *)(v0 + 136);
    v36 = *(_QWORD *)(v0 + 128);
    v37 = *(_QWORD *)(v0 + 144);
    v34 = *(_QWORD *)(v0 + 160);
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC79C0]), sel_initWithApplicationExtensionRecord_, v21);
    sub_233073874();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v22, v32);
    sub_23307385C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v25, v26, v34);
    swift_retain();
    sub_2330737D8();
    sub_233073808();
    sub_2330737E4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v37, v27, v36);
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v28;
    *v28 = v0;
    v28[1] = sub_233069D48;
    return sub_2330737FC();
  }
LABEL_12:
  sub_23306DCA0(0, &qword_256032848);
  v15 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v15)
  {
    v16 = v15;
    objc_opt_self();
    v17 = (void *)swift_dynamicCastObjCClass();
    if (v17)
    {
      v18 = objc_msgSend(v17, sel_applicationExtensionRecords);

      sub_23306DCA0(0, &qword_256032850);
      sub_233068910();
      v19 = sub_233073A30();

      sub_233068968(v19);
      v8 = v20;
      swift_bridgeObjectRelease();
      if (v8)
        goto LABEL_15;
    }
    else
    {

    }
  }
  v30 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v31 = (void *)sub_233073970();
  objc_msgSend(v30, sel_initWithDomain_code_userInfo_, v31, 1, 0);

  swift_willThrow();
  swift_release();
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

uint64_t sub_233069D48()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233069DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = *(void **)(v0 + 232);
  v13 = *(void **)(v0 + 224);
  v24 = *(_QWORD *)(v0 + 216);
  v22 = *(_QWORD *)(v0 + 200);
  v23 = *(_QWORD *)(v0 + 192);
  v21 = *(_QWORD *)(v0 + 184);
  v19 = *(_QWORD *)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 152);
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD **)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 56);
  v18 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(void))(v3 + 16);
  v8();
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v2, v1, v4);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v2, v4);
  *v5 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BEE5420], v7);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_23306C474((uint64_t)sub_23306C450, v10, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  *(_QWORD *)(v18 + *(int *)(type metadata accessor for RenderingProcess(0) + 20)) = v11;
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

uint64_t sub_233069FF4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v2 = *(void **)(v0 + 224);
  v1 = *(void **)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 200);
  v11 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 136);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v11);
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

uint64_t RenderingProcess.makeLibXPCConnection()()
{
  return sub_23306A11C();
}

uint64_t sub_23306A11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_233073844();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = sub_233073820();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

id RenderingProcess.createVisibilityPropagationInteraction()()
{
  return sub_23306A1E0();
}

id sub_23306A1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v9;

  v0 = sub_23307379C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x23492D754](v2);
  sub_2330737A8();
  v5 = sub_233073778();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v6 = (void *)sub_233073970();
  v7 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v5, v6);

  return v7;
}

Swift::Void __swiftcall RenderingProcess.invalidate()()
{
  sub_233069678(type metadata accessor for RenderingProcess);
}

uint64_t _s16BrowserEngineKit17WebContentProcessV10auditToken0aB4Core05AuditH0Vvg_0()
{
  MEMORY[0x23492D754]();
  return sub_2330737A8();
}

uint64_t _s16BrowserEngineKit17NetworkingProcessV17processIdentifiers5Int32Vvg_0()
{
  unsigned int v0;
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  audit_token_t v7;

  *(_QWORD *)v7.val = MEMORY[0x23492D754]();
  v7.val[2] = v0;
  v7.val[3] = v1;
  v7.val[4] = v2;
  v7.val[5] = v3;
  v7.val[6] = v4;
  v7.val[7] = v5;
  return audit_token_to_pid(&v7);
}

uint64_t static __BEWebContentProcess.webContentProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23306B414(a1, a2, a3, a4, (uint64_t)&unk_250449AE0, (uint64_t)&unk_256032878);
}

uint64_t sub_23306A354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v10;
  _QWORD *v11;

  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for WebContentProcess(0);
  v7[6] = swift_task_alloc();
  v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v7[8] = v11;
  *v11 = v7;
  v11[1] = sub_23306A404;
  return WebContentProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_23306A404()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306A5AC()
{
  return sub_23306AD08(&OBJC_IVAR___BEWebContentProcess_inner, type metadata accessor for WebContentProcess);
}

uint64_t sub_23306A5F4()
{
  return sub_233073820();
}

void __BEWebContentProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id __BEWebContentProcess.__deallocating_deinit()
{
  return sub_23306AF84(type metadata accessor for __BEWebContentProcess);
}

uint64_t static __BEWebContentProcess.webContentProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_23306B900(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_250449B08, (uint64_t)&unk_256032888);
}

uint64_t sub_23306A6EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v8[4] = a8;
  v8[5] = v16;
  type metadata accessor for WebContentProcess(0);
  v8[6] = swift_task_alloc();
  v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (_QWORD *)swift_task_alloc();
  v8[8] = v14;
  *v14 = v8;
  v14[1] = sub_23306A7BC;
  return WebContentProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_23306A7BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306A820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(void (**)(id, _QWORD))(v0 + 32);
  sub_23306DB80(v1, v2, type metadata accessor for WebContentProcess);
  v4 = (objc_class *)type metadata accessor for __BEWebContentProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_23306DB80(v2, (uint64_t)v5 + OBJC_IVAR___BEWebContentProcess_inner, type metadata accessor for WebContentProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_23306DAA8(v2, type metadata accessor for WebContentProcess);
  v3(v6, 0);

  sub_23306DAA8(v1, type metadata accessor for WebContentProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static __BERenderingProcess.renderingProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23306B414(a1, a2, a3, a4, (uint64_t)&unk_250449B30, (uint64_t)&unk_256032898);
}

uint64_t sub_23306AA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v10;
  _QWORD *v11;

  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for RenderingProcess(0);
  v7[6] = swift_task_alloc();
  v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v7[8] = v11;
  *v11 = v7;
  v11[1] = sub_23306AB4C;
  return RenderingProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_23306AB4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306ACF4()
{
  return sub_23306AD08(&OBJC_IVAR___BERenderingProcess_inner, type metadata accessor for RenderingProcess);
}

uint64_t sub_23306AD08(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v3 = v2 + *a1;
  v4 = *(_QWORD **)(v3 + *(int *)(a2(0) + 20));
  v5 = (os_unfair_lock_s *)(v4[4] + 16);
  os_unfair_lock_lock(v5);
  v6 = v4[2];
  if (v6)
  {
    v4[2] = 0;
    v4[3] = 0;
    sub_233066A24(v6);
  }
  os_unfair_lock_unlock(v5);
  sub_2330737B4();
  return sub_233067D68();
}

uint64_t sub_23306ADAC()
{
  return sub_233073820();
}

id sub_23306AE04(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v11;

  v2 = sub_23307379C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1;
  MEMORY[0x23492D754]();
  sub_2330737A8();
  v7 = sub_233073778();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = (void *)sub_233073970();
  v9 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v7, v8);

  return v9;
}

id __BERenderingProcess.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void __BERenderingProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id __BERenderingProcess.__deallocating_deinit()
{
  return sub_23306AF84(type metadata accessor for __BERenderingProcess);
}

id sub_23306AF84(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t static __BERenderingProcess.renderingProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_23306B900(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_250449B58, (uint64_t)&unk_2560328A8);
}

uint64_t sub_23306AFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v8[4] = a8;
  v8[5] = v16;
  type metadata accessor for RenderingProcess(0);
  v8[6] = swift_task_alloc();
  v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (_QWORD *)swift_task_alloc();
  v8[8] = v14;
  *v14 = v8;
  v14[1] = sub_23306B0C8;
  return RenderingProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_23306B0C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306B12C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(void (**)(id, _QWORD))(v0 + 32);
  sub_23306DB80(v1, v2, type metadata accessor for RenderingProcess);
  v4 = (objc_class *)type metadata accessor for __BERenderingProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_23306DB80(v2, (uint64_t)v5 + OBJC_IVAR___BERenderingProcess_inner, type metadata accessor for RenderingProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_23306DAA8(v2, type metadata accessor for RenderingProcess);
  v3(v6, 0);

  sub_23306DAA8(v1, type metadata accessor for RenderingProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23306B20C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, void *);
  void *v3;

  v1 = *(void **)(v0 + 72);
  v2 = *(void (**)(_QWORD, void *))(v0 + 32);
  v3 = (void *)sub_2330736AC();
  v2(0, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static __BENetworkingProcess.networkProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23306B414(a1, a2, a3, a4, (uint64_t)&unk_250449B80, (uint64_t)&unk_2560328B8);
}

uint64_t sub_23306B414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = a1;
  v15[5] = a2;
  v15[6] = a3;
  v15[7] = a4;
  swift_retain();
  swift_retain();
  sub_233067C24((uint64_t)v13, a6, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_23306B500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v10;
  _QWORD *v11;

  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for NetworkingProcess(0);
  v7[6] = swift_task_alloc();
  v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v7[8] = v11;
  *v11 = v7;
  v11[1] = sub_23306B5B0;
  return NetworkingProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_23306B5B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306B758()
{
  return sub_23306AD08(&OBJC_IVAR___BENetworkingProcess_inner, type metadata accessor for NetworkingProcess);
}

uint64_t sub_23306B7A0()
{
  return sub_233073820();
}

id sub_23306B7D4(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)sub_233073820();

  return v2;
}

void __BENetworkingProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id __BENetworkingProcess.__deallocating_deinit()
{
  return sub_23306AF84(type metadata accessor for __BENetworkingProcess);
}

uint64_t static __BENetworkingProcess.networkProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_23306B900(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_250449BA8, (uint64_t)&unk_2560328C8);
}

uint64_t sub_23306B900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_233073A24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = a1;
  v19[5] = a2;
  v19[6] = a3;
  v19[7] = a4;
  v19[8] = a5;
  v19[9] = a6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_233067C24((uint64_t)v17, a8, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23306BA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v8[4] = a8;
  v8[5] = v16;
  type metadata accessor for NetworkingProcess(0);
  v8[6] = swift_task_alloc();
  v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (_QWORD *)swift_task_alloc();
  v8[8] = v14;
  *v14 = v8;
  v14[1] = sub_23306BAD8;
  return NetworkingProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_23306BAD8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23306BB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(void (**)(id, _QWORD))(v0 + 32);
  sub_23306DB80(v1, v2, type metadata accessor for NetworkingProcess);
  v4 = (objc_class *)type metadata accessor for __BENetworkingProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_23306DB80(v2, (uint64_t)v5 + OBJC_IVAR___BENetworkingProcess_inner, type metadata accessor for NetworkingProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_23306DAA8(v2, type metadata accessor for NetworkingProcess);
  v3(v6, 0);

  sub_23306DAA8(v1, type metadata accessor for NetworkingProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23306BDA4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  os_unfair_lock_s *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_233073844();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (os_unfair_lock_s *)(a1[4] + 16);
  os_unfair_lock_lock(v6);
  v7 = (void (*)(uint64_t))a1[2];
  if (v7)
  {
    v8 = swift_retain();
    v7(v8);
    sub_23307382C();
    sub_233066A24((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v9 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    sub_233066A24(v9);
  }
  os_unfair_lock_unlock(v6);
}

uint64_t sub_23306BE88()
{
  uint64_t v0;

  sub_233066A24(*(_QWORD *)(v0 + 16));
  swift_release();
  return swift_deallocClassInstance();
}

id sub_23306BEB4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_2330736B8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_23306BF7C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23306BFE0;
  return v6(a1);
}

uint64_t sub_23306BFE0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23306C02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_233073AA8();
    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    sub_233073A3C();
    v3 = v35;
    v32 = v36;
    v4 = v37;
    v5 = v38;
    v6 = v39;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v32 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = v8;
    v5 = 0;
  }
  v30 = v4;
  v31 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_233073AB4())
      goto LABEL_42;
    sub_23306DCA0(0, &qword_256032850);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v40;
    swift_unknownObjectRelease();
    v14 = v5;
    v12 = v6;
    if (!v40)
      goto LABEL_42;
LABEL_33:
    v19 = objc_msgSend(v15, sel_extensionPointRecord, v30);
    v20 = objc_msgSend(v19, sel_identifier);

    v21 = sub_23307397C();
    v23 = v22;

    if (v21 == 0xD000000000000027 && v23 == 0x80000002330760C0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = sub_233073B68();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
        goto LABEL_9;
    }
    if (!a3)
      goto LABEL_42;
    v25 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v25)
    {
      v26 = v25;
      v27 = sub_23307397C();
      v29 = v28;

      if (v27 == a2 && v29 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_42:
        sub_23306DC98();
        return;
      }
      v11 = sub_233073B68();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_42;
    }
LABEL_9:

    v5 = v14;
    v6 = v12;
  }
  if (v6)
  {
    v12 = (v6 - 1) & v6;
    v13 = __clz(__rbit64(v6)) | (v5 << 6);
    v14 = v5;
LABEL_32:
    v15 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    if (!v15)
      goto LABEL_42;
    goto LABEL_33;
  }
  v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v31)
      goto LABEL_42;
    v17 = *(_QWORD *)(v32 + 8 * v16);
    v14 = v5 + 1;
    if (!v17)
    {
      v14 = v5 + 2;
      if (v5 + 2 >= v31)
        goto LABEL_42;
      v17 = *(_QWORD *)(v32 + 8 * v14);
      if (!v17)
      {
        v14 = v5 + 3;
        if (v5 + 3 >= v31)
          goto LABEL_42;
        v17 = *(_QWORD *)(v32 + 8 * v14);
        if (!v17)
        {
          v14 = v5 + 4;
          if (v5 + 4 >= v31)
            goto LABEL_42;
          v17 = *(_QWORD *)(v32 + 8 * v14);
          if (!v17)
          {
            v14 = v5 + 5;
            if (v5 + 5 >= v31)
              goto LABEL_42;
            v17 = *(_QWORD *)(v32 + 8 * v14);
            if (!v17)
            {
              v18 = v5 + 6;
              while (v31 != v18)
              {
                v17 = *(_QWORD *)(v32 + 8 * v18++);
                if (v17)
                {
                  v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t type metadata accessor for LaunchAssertionInvalidator()
{
  return objc_opt_self();
}

_QWORD *sub_23306C474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = v3;
  v21[0] = a3;
  v8 = sub_233073904();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_23307391C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v21 - v14;
  v4[2] = 0;
  v4[3] = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254241750);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  v4[3] = a2;
  v4[4] = v16;
  v4[2] = a1;
  swift_retain();
  sub_233066A24(0);
  sub_23306DCA0(0, &qword_254241740);
  v17 = (void *)sub_233073A6C();
  sub_233073910();
  MEMORY[0x23492D8D4](v13, a3);
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  aBlock[4] = sub_23306DCD8;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_233062680;
  aBlock[3] = &block_descriptor_0;
  _Block_copy(aBlock);
  v21[1] = MEMORY[0x24BEE4AF8];
  sub_23306DCF8();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254241710);
  sub_23306DD40();
  sub_233073A90();
  sub_233073934();
  swift_allocObject();
  sub_233073928();
  swift_release();
  sub_233073A60();

  swift_release();
  v19 = sub_2330738F8();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v21[0], v19);
  v18(v15, v9);
  return v4;
}

uint64_t type metadata accessor for NetworkingProcess(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241668);
}

void sub_23306C6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_233073AA8();
    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    sub_233073A3C();
    v3 = v41;
    v38 = v42;
    v4 = v43;
    v5 = v44;
    v6 = v45;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v38 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = v8;
    v5 = 0;
  }
  v36 = v4;
  v37 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_233073AB4())
      goto LABEL_45;
    sub_23306DCA0(0, &qword_256032850);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v46;
    swift_unknownObjectRelease();
    v14 = v5;
    v12 = v6;
    if (!v46)
      goto LABEL_45;
LABEL_33:
    v19 = objc_msgSend(v15, sel_extensionPointRecord, v36);
    v20 = objc_msgSend(v19, sel_identifier);

    v21 = sub_23307397C();
    v23 = v22;

    if (v21 == 0xD000000000000024 && v23 == 0x8000000233076310)
      goto LABEL_35;
    v24 = sub_233073B68();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      v25 = objc_msgSend(v15, sel_extensionPointRecord);
      v26 = objc_msgSend(v25, sel_identifier);

      v27 = sub_23307397C();
      v29 = v28;

      if (v27 != 0xD000000000000027 || v29 != 0x8000000233076340)
      {
        v30 = sub_233073B68();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
          goto LABEL_9;
        goto LABEL_40;
      }
LABEL_35:
      swift_bridgeObjectRelease();
    }
LABEL_40:
    if (!a3)
      goto LABEL_45;
    v31 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v31)
    {
      v32 = v31;
      v33 = sub_23307397C();
      v35 = v34;

      if (v33 == a2 && v35 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_45:
        sub_23306DC98();
        return;
      }
      v11 = sub_233073B68();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_45;
    }
LABEL_9:

    v5 = v14;
    v6 = v12;
  }
  if (v6)
  {
    v12 = (v6 - 1) & v6;
    v13 = __clz(__rbit64(v6)) | (v5 << 6);
    v14 = v5;
LABEL_32:
    v15 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    if (!v15)
      goto LABEL_45;
    goto LABEL_33;
  }
  v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v37)
      goto LABEL_45;
    v17 = *(_QWORD *)(v38 + 8 * v16);
    v14 = v5 + 1;
    if (!v17)
    {
      v14 = v5 + 2;
      if (v5 + 2 >= v37)
        goto LABEL_45;
      v17 = *(_QWORD *)(v38 + 8 * v14);
      if (!v17)
      {
        v14 = v5 + 3;
        if (v5 + 3 >= v37)
          goto LABEL_45;
        v17 = *(_QWORD *)(v38 + 8 * v14);
        if (!v17)
        {
          v14 = v5 + 4;
          if (v5 + 4 >= v37)
            goto LABEL_45;
          v17 = *(_QWORD *)(v38 + 8 * v14);
          if (!v17)
          {
            v14 = v5 + 5;
            if (v5 + 5 >= v37)
              goto LABEL_45;
            v17 = *(_QWORD *)(v38 + 8 * v14);
            if (!v17)
            {
              v18 = v5 + 6;
              while (v37 != v18)
              {
                v17 = *(_QWORD *)(v38 + 8 * v18++);
                if (v17)
                {
                  v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_45;
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t type metadata accessor for WebContentProcess(uint64_t a1)
{
  return sub_233066ADC(a1, qword_254241698);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_233073844();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23306CC24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_233073844();
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), v3);
}

uint64_t type metadata accessor for RenderingProcess(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241658);
}

void sub_23306CC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_233073AA8();
    sub_23306DCA0(0, &qword_256032850);
    sub_233068910();
    sub_233073A3C();
    v3 = v35;
    v32 = v36;
    v4 = v37;
    v5 = v38;
    v6 = v39;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v32 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = v8;
    v5 = 0;
  }
  v30 = v4;
  v31 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_233073AB4())
      goto LABEL_42;
    sub_23306DCA0(0, &qword_256032850);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v40;
    swift_unknownObjectRelease();
    v14 = v5;
    v12 = v6;
    if (!v40)
      goto LABEL_42;
LABEL_33:
    v19 = objc_msgSend(v15, sel_extensionPointRecord, v30);
    v20 = objc_msgSend(v19, sel_identifier);

    v21 = sub_23307397C();
    v23 = v22;

    if (v21 == 0xD000000000000026 && v23 == 0x8000000233076110)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = sub_233073B68();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
        goto LABEL_9;
    }
    if (!a3)
      goto LABEL_42;
    v25 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v25)
    {
      v26 = v25;
      v27 = sub_23307397C();
      v29 = v28;

      if (v27 == a2 && v29 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_42:
        sub_23306DC98();
        return;
      }
      v11 = sub_233073B68();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_42;
    }
LABEL_9:

    v5 = v14;
    v6 = v12;
  }
  if (v6)
  {
    v12 = (v6 - 1) & v6;
    v13 = __clz(__rbit64(v6)) | (v5 << 6);
    v14 = v5;
LABEL_32:
    v15 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    if (!v15)
      goto LABEL_42;
    goto LABEL_33;
  }
  v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v31)
      goto LABEL_42;
    v17 = *(_QWORD *)(v32 + 8 * v16);
    v14 = v5 + 1;
    if (!v17)
    {
      v14 = v5 + 2;
      if (v5 + 2 >= v31)
        goto LABEL_42;
      v17 = *(_QWORD *)(v32 + 8 * v14);
      if (!v17)
      {
        v14 = v5 + 3;
        if (v5 + 3 >= v31)
          goto LABEL_42;
        v17 = *(_QWORD *)(v32 + 8 * v14);
        if (!v17)
        {
          v14 = v5 + 4;
          if (v5 + 4 >= v31)
            goto LABEL_42;
          v17 = *(_QWORD *)(v32 + 8 * v14);
          if (!v17)
          {
            v14 = v5 + 5;
            if (v5 + 5 >= v31)
              goto LABEL_42;
            v17 = *(_QWORD *)(v32 + 8 * v14);
            if (!v17)
            {
              v18 = v5 + 6;
              while (v31 != v18)
              {
                v17 = *(_QWORD *)(v32 + 8 * v18++);
                if (v17)
                {
                  v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_23306D0A0(uint64_t a1)
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
  v10[1] = sub_233067AA4;
  return sub_23306A354(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t type metadata accessor for __BEWebContentProcess(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241768);
}

uint64_t sub_23306D144(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233067AA4;
  return sub_23306A6EC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23306D1E8(uint64_t a1)
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
  v10[1] = sub_233067AA4;
  return sub_23306AA9C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t type metadata accessor for __BERenderingProcess(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2542416D8);
}

uint64_t sub_23306D28C(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233067AA4;
  return sub_23306AFF8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23306D330(uint64_t a1)
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
  v10[1] = sub_233067AA4;
  return sub_23306B500(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t type metadata accessor for __BENetworkingProcess(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241618);
}

uint64_t sub_23306D3D4(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233067AA4;
  return sub_23306BA08(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t getEnumTagSinglePayload for NetworkingProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for NetworkingProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for WebContentProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WebContentProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s16BrowserEngineKit17NetworkingProcessVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  }
  else
  {
    v7 = sub_233073844();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RenderingProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_233073844();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for RenderingProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_233073844();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23306D83C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233073844();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23306D8B0()
{
  return type metadata accessor for __BEWebContentProcess(0);
}

uint64_t sub_23306D8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23306D8E4(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t method lookup function for __BEWebContentProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23306D8D0()
{
  return type metadata accessor for __BERenderingProcess(0);
}

uint64_t sub_23306D8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23306D8E4(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_23306D8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v5;

  result = a4(319);
  if (v5 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for __BERenderingProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of __BERenderingProcess.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of __BERenderingProcess.makeLibXPCConnection()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t sub_23306D9A4()
{
  return type metadata accessor for __BENetworkingProcess(0);
}

uint64_t sub_23306D9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23306D8E4(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t method lookup function for __BENetworkingProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23306D9C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23306D9CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23306D9D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23306D9DC()
{
  uint64_t v0;

  return sub_23306E35C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23306D9EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23306DA04(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233063498;
  return sub_23306AFF8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23306DAA8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_18Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23306DB24()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23306DB80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23306DBC4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254241720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23306DC04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23306DC28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233063498;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256032900 + dword_256032900))(a1, v4);
}

uint64_t sub_23306DC98()
{
  return swift_release();
}

uint64_t sub_23306DCA0(uint64_t a1, unint64_t *a2)
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

void sub_23306DCD8()
{
  _QWORD *v0;

  sub_23306BDA4(v0);
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

unint64_t sub_23306DCF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254241708;
  if (!qword_254241708)
  {
    v1 = sub_233073904();
    result = MEMORY[0x23492E0D8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254241708);
  }
  return result;
}

unint64_t sub_23306DD40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254241718;
  if (!qword_254241718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254241710);
    result = MEMORY[0x23492E0D8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254241718);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492E0CC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t dispatch thunk of __BEWebContentProcess.makeLibXPCConnection()()
{
  return dispatch thunk of __BERenderingProcess.makeLibXPCConnection()();
}

uint64_t dispatch thunk of __BENetworkingProcess.makeLibXPCConnection()()
{
  return dispatch thunk of __BERenderingProcess.makeLibXPCConnection()();
}

uint64_t _RenderingExtension._lockdown(version:)()
{
  return sub_23306DF20();
}

uint64_t static RestrictedSandboxRevision.== infix(_:_:)()
{
  return 1;
}

uint64_t RestrictedSandboxRevision.hash(into:)()
{
  return sub_233073BD4();
}

void *static RestrictedSandboxRevision.allCases.getter()
{
  return &unk_250449178;
}

uint64_t RestrictedSandboxRevision.hashValue.getter()
{
  sub_233073BC8();
  sub_233073BD4();
  return sub_233073BE0();
}

void sub_23306DEE0(_QWORD *a1@<X8>)
{
  *a1 = &unk_250449230;
}

uint64_t sub_23306DEF8()
{
  return sub_23306DF20();
}

uint64_t RestrictedSandboxAppliable.applyRestrictedSandbox(revision:)()
{
  return sub_23306DF20();
}

uint64_t sub_23306DF20()
{
  sub_233073AC0();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t RestrictedSandboxAppliable<>.applyRestrictedSandbox(revision:)()
{
  sub_23306DF20();
  return sandbox_enable_local_state_flag();
}

uint64_t _LockdownVersion.rawValue.getter()
{
  return 3157553;
}

uint64_t _LockdownVersion.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_233073B50();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static _LockdownVersion.allCases.getter()
{
  return &unk_250448E78;
}

uint64_t sub_23306E000@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_233073B50();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_23306E050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _LockdownVersion.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23306E074(_QWORD *a1@<X8>)
{
  *a1 = &unk_250448FA0;
}

uint64_t sub_23306E08C()
{
  sub_233073BC8();
  sub_2330739B8();
  return sub_233073BE0();
}

uint64_t sub_23306E0D4()
{
  sub_233073BC8();
  sub_2330739B8();
  return sub_233073BE0();
}

uint64_t sub_23306E11C()
{
  return sub_2330739B8();
}

uint64_t _s16BrowserEngineKit20_WebContentExtensionPAAE9_lockdown7versionyAA16_LockdownVersionO_tF_0()
{
  sub_233073AC0();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();
  return sandbox_enable_local_state_flag();
}

unint64_t sub_23306E180()
{
  unint64_t result;

  result = qword_256032910;
  if (!qword_256032910)
  {
    result = MEMORY[0x23492E0D8](&protocol conformance descriptor for RestrictedSandboxRevision, &type metadata for RestrictedSandboxRevision);
    atomic_store(result, (unint64_t *)&qword_256032910);
  }
  return result;
}

uint64_t sub_23306E1C4()
{
  return sub_23306E254(&qword_256032918, &qword_256032920);
}

unint64_t sub_23306E1EC()
{
  unint64_t result;

  result = qword_256032928;
  if (!qword_256032928)
  {
    result = MEMORY[0x23492E0D8](&protocol conformance descriptor for _LockdownVersion, &type metadata for _LockdownVersion);
    atomic_store(result, (unint64_t *)&qword_256032928);
  }
  return result;
}

uint64_t sub_23306E230()
{
  return sub_23306E254(&qword_256032930, &qword_256032938);
}

uint64_t sub_23306E254(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23492E0D8](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RestrictedSandboxRevision()
{
  return &type metadata for RestrictedSandboxRevision;
}

uint64_t dispatch thunk of RestrictedSandboxAppliable.applyRestrictedSandbox(revision:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t _s16BrowserEngineKit25RestrictedSandboxRevisionOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23306E2F4 + 4 * asc_233075690[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23306E314 + 4 * byte_233075695[v4]))();
}

_BYTE *sub_23306E2F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23306E314(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23306E31C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23306E324(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23306E32C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23306E334(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for _LockdownVersion()
{
  return &type metadata for _LockdownVersion;
}

uint64_t dispatch thunk of _WebContentExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_23306E35C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

unint64_t sub_23306E364(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542415F8);
  v2 = sub_233073B44();
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
    sub_2330725C0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_233065688(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_233072608(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_23306E48C()
{
  uint64_t v0;

  v0 = sub_2330738C8();
  __swift_allocate_value_buffer(v0, qword_254241C28);
  __swift_project_value_buffer(v0, (uint64_t)qword_254241C28);
  return sub_2330738BC();
}

void sub_23306E500(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;

  if (a2)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = a3;
    v9 = (objc_class *)type metadata accessor for ProcessCapability.AssertionObserver();
    v10 = (char *)objc_allocWithZone(v9);
    v11 = (uint64_t *)&v10[OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate];
    *v11 = 0;
    v11[1] = 0;
    v12 = OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver_invalidationLock;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254241750);
    v13 = swift_allocObject();
    *(_DWORD *)(v13 + 16) = 0;
    *(_QWORD *)&v10[v12] = v13;
    v14 = *v11;
    *v11 = (uint64_t)sub_23307257C;
    v11[1] = v8;
    sub_233067958(a2);
    v15 = a1;
    sub_233067958(a2);
    swift_retain();
    sub_233066A24(v14);
    v19.receiver = v10;
    v19.super_class = v9;
    v16 = objc_msgSendSuper2(&v19, sel_init);
    swift_release();
    v17 = v16;
    objc_msgSend(v15, sel_addObserver_, v17);
    sub_233066A24(a2);

    sub_233066A24(a2);
  }
  else
  {
    v18 = a1;
    v16 = 0;
  }
  *a4 = a1;
  a4[1] = v16;

}

Swift::Void __swiftcall ProcessCapability.Grant.invalidate()()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;

  v2 = *(id *)v0;
  v1 = *(void **)(v0 + 8);
  if (v1)
  {
    v3 = v1;
    objc_msgSend(v2, sel_removeObserver_, v3);
    objc_msgSend(v2, sel_invalidate);
    v4 = v3;
    sub_233070DE0((uint64_t)v2);

  }
  else
  {
    objc_msgSend(*(id *)v0, sel_invalidate);
  }
}

id ProcessCapability.Grant.isValid.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isValid);
}

uint64_t sub_23306E728()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254241750);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_254241640 = result;
  return result;
}

uint64_t MediaEnvironment.init(webPage:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  os_unfair_lock_s *v9;
  uint64_t result;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (char *)a2 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v5 = sub_233073730();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v7 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    sub_23307397C();

  }
  getpid();
  if (qword_254241628 != -1)
    swift_once();
  v9 = (os_unfair_lock_s *)(qword_254241640 + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  result = swift_release();
  if (__OFADD__(qword_254241608, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_254241608;
    v13 = sub_233073B5C();
    v14 = v11;
    sub_2330739C4();
    sub_233073B5C();
    sub_2330739C4();
    swift_bridgeObjectRelease();
    sub_2330739C4();
    sub_2330739C4();
    swift_bridgeObjectRelease();
    v12 = (os_unfair_lock_s *)qword_254241640;
    swift_retain();
    os_unfair_lock_unlock(v12 + 4);
    swift_release();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    *a2 = v13;
    a2[1] = v14;
  }
  return result;
}

uint64_t MediaEnvironment.init(xpcRepresentation:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_233073730();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x23492E24C](a1);
  if (v11 != sub_2330738D4() || !xpc_dictionary_get_string(a1, "identifier"))
  {
    sub_23307397C();
    v12 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v13 = (void *)sub_233073970();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, -50, 0);

    swift_willThrow();
    return swift_unknownObjectRelease();
  }
  *a2 = sub_2330739D0();
  a2[1] = v15;
  if (!xpc_dictionary_get_string(a1, "url"))
  {
    sub_23307397C();
    v18 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v19 = (void *)sub_233073970();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_initWithDomain_code_userInfo_, v19, -50, 0);

    swift_willThrow();
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  sub_2330739D0();
  sub_233073724();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_233071044((uint64_t)v6);
    sub_23307397C();
    v16 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v17 = (void *)sub_233073970();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_initWithDomain_code_userInfo_, v17, -50, 0);

    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v20(v10, v6, v7);
    v21 = type metadata accessor for MediaEnvironment(0);
    return ((uint64_t (*)(char *, char *, uint64_t))v20)((char *)a2 + *(int *)(v21 + 20), v10, v7);
  }
}

xpc_object_t MediaEnvironment.createXPCRepresentation()()
{
  xpc_object_t empty;
  uint64_t v1;
  uint64_t v2;

  empty = xpc_dictionary_create_empty();
  v1 = sub_2330739AC();
  xpc_dictionary_set_string(empty, "identifier", (const char *)(v1 + 32));
  swift_release();
  type metadata accessor for MediaEnvironment(0);
  sub_2330736DC();
  v2 = sub_2330739AC();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_string(empty, "url", (const char *)(v2 + 32));
  swift_release();
  return empty;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.activate()()
{
  id v0;
  void *v1;
  void *v2;
  signed int v3;
  id v4;
  void *v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)sub_233073970();
    v3 = objc_msgSend(v1, sel_grantMediaEndowmentWithEnvironmentID_endowmentPayload_, v2, 0);

    if (v3 != sub_2330738EC())
    {
      sub_23307397C();
      v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v5 = (void *)sub_233073970();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.suspend()()
{
  id v0;
  void *v1;
  void *v2;
  signed int v3;
  id v4;
  void *v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)sub_233073970();
    v3 = objc_msgSend(v1, sel_revokeMediaEndowmentWithEnvironmentID_, v2);

    if (v3 != sub_2330738EC())
    {
      sub_23307397C();
      v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v5 = (void *)sub_233073970();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

AVCaptureSession __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.makeCaptureSession()()
{
  id v0;
  void *v1;
  objc_class *v2;
  AVCaptureSessionInternal *v3;
  objc_class *v4;
  AVCaptureSession result;

  v0 = objc_allocWithZone(MEMORY[0x24BDB24D0]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v2 = (objc_class *)objc_msgSend(v0, sel_initWithMediaEnvironment_, v1);

  v4 = v2;
  result._internal = v3;
  result.super.isa = v4;
  return result;
}

uint64_t ProcessCapability.request()@<X0>(_QWORD *a1@<X8>)
{
  return sub_23306F7F0(a1);
}

uint64_t sub_23306EF84@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(_QWORD);
  char *v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a2;
  v28 = a3;
  v7 = type metadata accessor for ProcessCapability.MediaPlaybackCapability(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MediaEnvironment(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ProcessCapability(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (unint64_t *)((char *)&v25 - v18);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v25 - v20;
  sub_23306DB80(v4, (uint64_t)&v25 - v20, v22);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23306DB80(v4, (uint64_t)v19, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = *v19;
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23306DAA8((uint64_t)v19, type metadata accessor for ProcessCapability);
      v26 = 0xD00000000000001ALL;
    }
    sub_23306DB80(v4, (uint64_t)v16, type metadata accessor for ProcessCapability);
    v23 = (char *)&loc_23306F1C4 + 4 * byte_233075950[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  sub_233072070((uint64_t)v21, (uint64_t)v12);
  sub_23306DB80((uint64_t)v12, (uint64_t)v9, type metadata accessor for MediaEnvironment);
  sub_2330708DC(a1, a4);
  sub_23306DAA8((uint64_t)v9, type metadata accessor for ProcessCapability.MediaPlaybackCapability);
  return sub_23306DAA8((uint64_t)v12, type metadata accessor for MediaEnvironment);
}

void NetworkingProcess.grantCapability(_:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_23306F384(a1, _s15_ProcessAdaptorVMa_1, (uint64_t)&off_250448FC8, type metadata accessor for NetworkingProcess, a2);
}

void NetworkingProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_23306F5C4(a1, a2, a3, _s15_ProcessAdaptorVMa_1, (uint64_t)&off_250448FC8, type metadata accessor for NetworkingProcess, a4);
}

void WebContentProcess.grantCapability(_:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_23306F384(a1, _s15_ProcessAdaptorVMa_0, (uint64_t)&off_250449068, type metadata accessor for WebContentProcess, a2);
}

void WebContentProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_23306F5C4(a1, a2, a3, _s15_ProcessAdaptorVMa_0, (uint64_t)&off_250449068, type metadata accessor for WebContentProcess, a4);
}

void RenderingProcess.grantCapability(_:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_23306F384(a1, _s15_ProcessAdaptorVMa, (uint64_t)&off_250448E58, type metadata accessor for RenderingProcess, a2);
}

void sub_23306F384(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(_QWORD)@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  os_unfair_lock_s *v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35[5];
  _QWORD v36[2];
  uint64_t v37;

  v9 = v5;
  v34 = a5;
  v33 = sub_233073844();
  v11 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = a2(0);
  v35[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
  sub_23306DB80(v9, (uint64_t)boxed_opaque_existential_1, a4);
  v18 = v37;
  sub_23306EF84(v35, 0, 0, v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  if (!v18)
  {
    v32 = v13;
    v37 = v11;
    v19 = v36[0];
    v20 = v36[1];
    sub_23306DB80(a1, (uint64_t)v16, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v31 = v20;
      v21 = *(_QWORD **)(v9 + *(int *)(a4(0) + 20));
      v22 = (os_unfair_lock_s *)(v21[4] + 16);
      os_unfair_lock_lock(v22);
      v23 = (void (*)(uint64_t))v21[2];
      if (v23)
      {
        v24 = swift_retain();
        v25 = v19;
        v26 = v32;
        v23(v24);
        sub_23307382C();
        sub_233066A24((uint64_t)v23);
        v27 = v26;
        v19 = v25;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v27, v33);
        v28 = v21[2];
        v21[2] = 0;
        v21[3] = 0;
        sub_233066A24(v28);
      }
      os_unfair_lock_unlock(v22);
      v29 = v34;
      v20 = v31;
    }
    else
    {
      sub_23306DAA8((uint64_t)v16, type metadata accessor for ProcessCapability);
      v29 = v34;
    }
    *v29 = v19;
    v29[1] = v20;
  }
}

void RenderingProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_23306F5C4(a1, a2, a3, _s15_ProcessAdaptorVMa, (uint64_t)&off_250448E58, type metadata accessor for RenderingProcess, a4);
}

void sub_23306F5C4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(_QWORD)@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(_QWORD)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v20)(_QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  os_unfair_lock_s *v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[5];
  _QWORD v40[2];
  uint64_t v41;

  v11 = v7;
  v37 = a2;
  v38 = a3;
  v36 = a7;
  v35 = sub_233073844();
  v13 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39[3] = a4(0);
  v39[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  v20 = a6;
  sub_23306DB80(v11, (uint64_t)boxed_opaque_existential_1, a6);
  v21 = a1;
  v22 = v41;
  sub_23306EF84(v39, v37, v38, v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  if (!v22)
  {
    v23 = v20;
    v24 = v11;
    v25 = v15;
    v41 = v13;
    v26 = v40[0];
    v27 = v40[1];
    sub_23306DB80(v21, (uint64_t)v18, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v38 = v27;
      v28 = *(_QWORD **)(v24 + *(int *)(v23(0) + 20));
      v29 = (os_unfair_lock_s *)(v28[4] + 16);
      os_unfair_lock_lock(v29);
      v30 = (void (*)(uint64_t))v28[2];
      if (v30)
      {
        v37 = v26;
        v31 = swift_retain();
        v30(v31);
        sub_23307382C();
        v26 = v37;
        sub_233066A24((uint64_t)v30);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v35);
        v32 = v28[2];
        v28[2] = 0;
        v28[3] = 0;
        sub_233066A24(v32);
      }
      os_unfair_lock_unlock(v29);
      v33 = v36;
      v27 = v38;
    }
    else
    {
      sub_23306DAA8((uint64_t)v18, type metadata accessor for ProcessCapability);
      v33 = v36;
    }
    *v33 = v26;
    v33[1] = v27;
  }
}

uint64_t ProcessCapability._request()@<X0>(_QWORD *a1@<X8>)
{
  return sub_23306F7F0(a1);
}

uint64_t sub_23306F7F0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD v2[4];

  v2[3] = &type metadata for Process;
  sub_23306EF84(v2, 0, 0, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t sub_23306FBA8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v5;

  v5 = a1;
  a4();

  return 1;
}

id BEMediaEnvironment.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BEMediaEnvironment.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BEMediaEnvironment.__deallocating_deinit()
{
  return sub_23306AF84(type metadata accessor for BEMediaEnvironment);
}

id sub_23306FE90()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  objc_class *v3;
  id v4;
  id v5;
  objc_super v7;

  v0 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  v3 = (objc_class *)type metadata accessor for BEProcessCapability(0);
  v4 = objc_allocWithZone(v3);
  sub_23306DB80((uint64_t)v2, (uint64_t)v4 + OBJC_IVAR___BEProcessCapability_inner, type metadata accessor for ProcessCapability);
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_23306DAA8((uint64_t)v2, type metadata accessor for ProcessCapability);
  return v5;
}

void BEProcessCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BEProcessCapability.__deallocating_deinit()
{
  return sub_23306AF84(type metadata accessor for BEProcessCapability);
}

uint64_t sub_2330700C4(uint64_t a1)
{
  return sub_2330704EC(a1, &OBJC_IVAR___BEWebContentProcess_inner, _s15_ProcessAdaptorVMa_2, (uint64_t)&off_250449158, type metadata accessor for WebContentProcess);
}

uint64_t sub_23307011C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233070604(a1, a2, a3, &OBJC_IVAR___BEWebContentProcess_inner, _s15_ProcessAdaptorVMa_2, (uint64_t)&off_250449158, type metadata accessor for WebContentProcess);
}

uint64_t sub_233070254(uint64_t a1)
{
  return sub_2330704EC(a1, &OBJC_IVAR___BENetworkingProcess_inner, _s15_ProcessAdaptorVMa_3, (uint64_t)&off_250449138, type metadata accessor for NetworkingProcess);
}

id sub_2330702AC(void *a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD), uint64_t a7, uint64_t (*a8)(_QWORD))
{
  id v13;
  id v14;
  void *v15;

  v13 = a3;
  v14 = a1;
  v15 = (void *)sub_2330704EC((uint64_t)v13, a5, a6, a7, a8);

  return v15;
}

uint64_t sub_233070380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233070604(a1, a2, a3, &OBJC_IVAR___BENetworkingProcess_inner, _s15_ProcessAdaptorVMa_3, (uint64_t)&off_250449138, type metadata accessor for NetworkingProcess);
}

uint64_t sub_2330704B8(uint64_t a1)
{
  return sub_2330704EC(a1, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_250449088, type metadata accessor for RenderingProcess);
}

uint64_t sub_2330704EC(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD), uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[5];
  _QWORD v15[2];

  v9 = v5 + *a2;
  v14[3] = a3(0);
  v14[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  sub_23306DB80(v9, (uint64_t)boxed_opaque_existential_1, a5);
  sub_23306EF84(v14, 0, 0, v15);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  if (!v6)
  {
    v12 = v15[0];
    v13 = v15[1];
    type metadata accessor for _BEProcessCapabilityGrant();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v12;
    *(_QWORD *)(result + 24) = v13;
  }
  return result;
}

uint64_t sub_2330705D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233070604(a1, a2, a3, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_250449088, type metadata accessor for RenderingProcess);
}

uint64_t sub_233070604(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(_QWORD), uint64_t a6, uint64_t (*a7)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[5];
  _QWORD v19[2];

  v13 = v7 + *a4;
  v18[3] = a5(0);
  v18[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  sub_23306DB80(v13, (uint64_t)boxed_opaque_existential_1, a7);
  sub_23306EF84(v18, a2, a3, v19);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  if (!v8)
  {
    v16 = v19[0];
    v17 = v19[1];
    type metadata accessor for _BEProcessCapabilityGrant();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v16;
    *(_QWORD *)(result + 24) = v17;
  }
  return result;
}

uint64_t sub_2330707D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    objc_msgSend(v3, sel_removeObserver_, v4);
    objc_msgSend(v3, sel_invalidate);
    v5 = v4;
    sub_233070DE0((uint64_t)v3);

  }
  else
  {
    v5 = v1;
    objc_msgSend(v5, sel_invalidate);
  }

  return 1;
}

uint64_t sub_2330708AC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);

  return swift_deallocClassInstance();
}

void sub_2330708DC(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254241760);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_233075B40;
  *(_QWORD *)(v5 + 32) = objc_msgSend((id)objc_opt_self(), sel_attributeWithCompletionPolicy_, 1);
  sub_2330739E8();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_233075B40;
  v7 = *v3;
  v8 = v3[1];
  if (v5 >> 62)
  {
    sub_23306DCA0(0, (unint64_t *)&unk_254241728);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_233073B14();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_233073B74();
    sub_23306DCA0(0, (unint64_t *)&unk_254241728);
  }
  swift_bridgeObjectRelease();
  v9 = (void *)sub_233073970();
  v10 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  sub_23306DCA0(0, (unint64_t *)&unk_254241728);
  v11 = (void *)sub_2330739DC();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_grantWithNamespace_sourceEnvironment_attributes_, v9, v10, v11);

  *(_QWORD *)(v6 + 32) = v12;
  sub_2330739E8();
  swift_bridgeObjectRetain();
  if (v6 >> 62)
  {
    sub_233073B14();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_233073B74();
  }
  swift_bridgeObjectRelease();
  v13 = sub_233072264(a1, v7, v8);
  swift_bridgeObjectRelease();
  if (!v15)
    sub_23306E500(v13, (uint64_t)nullsub_1, 0, a2);
}

void sub_233070BA0(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = *(_QWORD *)(v4 + 32);
  v8 = *(_QWORD *)(v4 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254241760);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_233075B40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v10, v11);

  *(_QWORD *)(v9 + 32) = v12;
  sub_2330739E8();
  if (v9 >> 62)
  {
    sub_23306DCA0(0, (unint64_t *)&unk_254241728);
    swift_bridgeObjectRetain();
    sub_233073B14();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_233073B74();
    sub_23306DCA0(0, (unint64_t *)&unk_254241728);
  }
  swift_bridgeObjectRelease();
  v13 = sub_233072264(a1, v7, v8);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    sub_233067958(a2);
    sub_23306E500(v13, a2, a3, a4);
  }
}

void sub_233070DE0(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  void (*v5)(uint64_t);

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1
                                      + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver_invalidationLock)
                          + 16);
  os_unfair_lock_lock(v3);
  v4 = (_QWORD *)(v1
                + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate);
  v5 = *(void (**)(uint64_t))(v1
                                      + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate);
  if (v5)
  {
    *v4 = 0;
    v4[1] = 0;
    swift_retain();
    sub_233066A24((uint64_t)v5);
    v5(a1);
    sub_233066A24((uint64_t)v5);
  }
  os_unfair_lock_unlock(v3);
}

uint64_t type metadata accessor for MediaEnvironment(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241648);
}

uint64_t sub_233071044(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256032940);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t type metadata accessor for ProcessCapability(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241688);
}

uint64_t _s15_ProcessAdaptorVMa_1(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2560329E8);
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

uint64_t _s15_ProcessAdaptorVMa_0(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2560329D8);
}

uint64_t _s15_ProcessAdaptorVMa(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2560329C8);
}

uint64_t type metadata accessor for BEMediaEnvironment(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241630);
}

uint64_t type metadata accessor for BEProcessCapability(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2542416B8);
}

uint64_t *initializeBufferWithCopyOfBuffer for ProcessCapability(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      v16 = a2[2];
      v17 = a2[3];
      a1[2] = v16;
      a1[3] = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      v9 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_233073730();
      v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for ProcessCapability(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v3 = a1 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    v4 = sub_233073730();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return result;
}

_QWORD *initializeWithCopy for ProcessCapability(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    v14 = a2[2];
    v15 = a2[3];
    a1[2] = v14;
    a1[3] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_233073730();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for ProcessCapability(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  if (a1 != a2)
  {
    sub_23306DAA8((uint64_t)a1, type metadata accessor for ProcessCapability);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      v7 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_233073730();
      v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
      swift_bridgeObjectRetain();
      v11(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *initializeWithTake for ProcessCapability(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_233073730();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for ProcessCapability(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_23306DAA8((uint64_t)a1, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_233073730();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessCapability(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ProcessCapability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_233071694()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2330716A4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MediaEnvironment(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProcessCapability.Grant(_QWORD *a1, uint64_t a2)
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

void destroy for ProcessCapability.Grant(id *a1)
{

}

uint64_t assignWithCopy for ProcessCapability.Grant(uint64_t a1, uint64_t a2)
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

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  return a1;
}

uint64_t assignWithTake for ProcessCapability.Grant(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for ProcessCapability.Grant()
{
  return &type metadata for ProcessCapability.Grant;
}

uint64_t *initializeBufferWithCopyOfBuffer for MediaEnvironment(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_233073730();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for MediaEnvironment(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_233073730();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for MediaEnvironment(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_233073730();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for MediaEnvironment(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for MediaEnvironment(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for MediaEnvironment(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaEnvironment()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071AAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_233073730();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MediaEnvironment()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071B34(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_233073730();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_233071BA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233073730();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_233071C1C()
{
  return type metadata accessor for BEMediaEnvironment(0);
}

uint64_t sub_233071C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23306D8E4(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t method lookup function for BEMediaEnvironment()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_233071C3C()
{
  return type metadata accessor for BEProcessCapability(0);
}

uint64_t sub_233071C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23306D8E4(a1, a2, a3, type metadata accessor for ProcessCapability);
}

uint64_t method lookup function for BEProcessCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for _BEProcessCapabilityGrant()
{
  return objc_opt_self();
}

id sub_233071CA8()
{
  return sub_23306AF84((uint64_t (*)(_QWORD))type metadata accessor for ProcessCapability.AssertionObserver);
}

uint64_t type metadata accessor for ProcessCapability.AssertionObserver()
{
  return objc_opt_self();
}

uint64_t *sub_233071D10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23307297C(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D1C(uint64_t a1, uint64_t a2)
{
  return sub_233072A0C(a1, a2, (void (*)(_QWORD))type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072A58(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072AC0(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B34(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B98(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D58()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D70()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for RenderingProcess);
}

uint64_t sub_233071D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233071E94(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t *sub_233071D94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23307297C(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DA0(uint64_t a1, uint64_t a2)
{
  return sub_233072A0C(a1, a2, (void (*)(_QWORD))type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072A58(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072AC0(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B34(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B98(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071DDC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t __swift_get_extra_inhabitant_index_3Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t sub_233071E30()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for WebContentProcess);
}

uint64_t __swift_store_extra_inhabitant_index_4Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v7;

  v7 = a5(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

uint64_t sub_233071E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233071E94(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233071E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
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

uint64_t *sub_233071EFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23307297C(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F08(uint64_t a1, uint64_t a2)
{
  return sub_233072A0C(a1, a2, (void (*)(_QWORD))type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072A58(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072AC0(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B34(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233072B98(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F44()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F5C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233071F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233071F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233071E94(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

ValueMetadata *type metadata accessor for Process()
{
  return &type metadata for Process;
}

uint64_t sub_233071F90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_23307379C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233073790();
  v4 = sub_233073778();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_233072010()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t _s15_ProcessAdaptorVMa_4(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2542416C8);
}

uint64_t _s15_ProcessAdaptorVMa_3(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2542416E8);
}

uint64_t _s15_ProcessAdaptorVMa_2(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_2542416F8);
}

uint64_t sub_233072070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MediaEnvironment(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ProcessCapability.MediaPlaybackCapability(uint64_t a1)
{
  return sub_233066ADC(a1, (uint64_t *)&unk_254241678);
}

uint64_t sub_2330720C8(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_2330720E8(uint64_t (*a1)(void))
{
  return a1();
}

id sub_233072108(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542415D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_233075B50;
  v3 = sub_23307397C();
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = v4;
  *(_QWORD *)(inited + 48) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 56) = 0x8000000233076660;
  *(_QWORD *)(inited + 80) = sub_23307397C();
  *(_QWORD *)(inited + 88) = v6;
  *(_QWORD *)(inited + 120) = sub_23306DCA0(0, &qword_2542415F0);
  *(_QWORD *)(inited + 96) = a1;
  v7 = a1;
  sub_23306E364(inited);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v9 = (void *)sub_233073970();
  v10 = (void *)sub_23307394C();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 2, v10);

  return v11;
}

id sub_233072264(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22[3];

  v22[2] = *(id *)MEMORY[0x24BDAC8D0];
  sub_233073AC0();
  swift_bridgeObjectRelease();
  v22[0] = (id)0xD00000000000002ELL;
  v22[1] = (id)0x8000000233076600;
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v5, v6);
  sub_233073B5C();
  sub_2330739C4();
  swift_bridgeObjectRelease();
  if (a3)
  {
    swift_bridgeObjectRetain();
    v8 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v6);
    v9 = (void *)sub_233073970();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend((id)objc_opt_self(), sel_targetWithPid_environmentIdentifier_, v8, v9);

    if (v10)
      goto LABEL_3;
LABEL_8:
    __break(1u);
  }
  v21 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v6);
  v10 = objc_msgSend((id)objc_opt_self(), sel_targetWithPid_, v21);
  if (!v10)
    goto LABEL_8;
LABEL_3:
  v11 = objc_allocWithZone(MEMORY[0x24BE80B10]);
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_233073970();
  swift_bridgeObjectRelease();
  sub_23306DCA0(0, (unint64_t *)&unk_254241728);
  v14 = (void *)sub_2330739DC();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v11, sel_initWithExplanation_target_attributes_, v13, v12, v14);

  v22[0] = 0;
  if ((objc_msgSend(v15, sel_acquireWithError_, v22) & 1) != 0)
  {
    v16 = v22[0];

  }
  else
  {
    v17 = v22[0];
    v18 = (void *)sub_2330736B8();

    swift_willThrow();
    objc_msgSend(v15, sel_invalidate);
    v19 = (void *)sub_2330736AC();
    sub_233072108(v19);

    swift_willThrow();
  }
  return v15;
}

uint64_t sub_233072558()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23307257C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2330725C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542415E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_233072608(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_233072618(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v4 = type metadata accessor for MediaEnvironment(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = *(int *)(v4 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_233073730();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_2330726C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v3 = sub_233073730();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_23307270C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_233073730();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_233072788(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_233072808(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_233072870(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_233073730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_2330728E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2330728EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t sub_2330728F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for MediaEnvironment);
}

uint64_t sub_233072910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233071E94(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t sub_23307291C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_233072934()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for WebContentProcess);
}

uint64_t sub_23307294C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_233072964()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for NetworkingProcess);
}

uint64_t *sub_23307297C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a4(0);
  v7 = *(_DWORD *)(*(_QWORD *)(v6 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~(unint64_t)v7));
  }
  else
  {
    v8 = v6;
    v9 = sub_233073844();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_233072A0C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  a3(0);
  return swift_release();
}

uint64_t sub_233072A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  v8 = a4(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_233072AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(a1, a2, v7);
  v8 = a4(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_233072B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  v8 = a4(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  return a1;
}

uint64_t sub_233072B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_233073844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(a1, a2, v7);
  v8 = a4(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  swift_release();
  return a1;
}

uint64_t sub_233072C04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_233072C1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233072C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, type metadata accessor for RenderingProcess);
}

Swift::Bool __swiftcall BrowserEngineEntitlement.check(auditToken:)(audit_token_t_optional *auditToken)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[36];

  sub_233072D54((uint64_t)auditToken, (uint64_t)&v9);
  v2 = sub_23307379C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233072D54((uint64_t)auditToken, (uint64_t)v10);
  if (v10[32] == 1)
  {
    sub_233073790();
    sub_233073784();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2330737A8();
  v6 = sub_23307376C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6 & 1;
}

uint64_t sub_233072D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560329F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Bool __swiftcall NetworkingExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t NetworkingExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = *(_QWORD *)(a1 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_2330621E8;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_233072E6C()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t NetworkingExtensionConfiguration.handleConnection(_:)()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_233072EE4@<X0>(_QWORD *a1@<X8>)
{
  return _NetworkingExtension._request(capability:)(a1);
}

uint64_t _NetworkingExtension._request(capability:)@<X0>(_QWORD *a1@<X8>)
{
  _QWORD v2[5];

  v2[3] = &type metadata for Process;
  v2[4] = &off_2504493D8;
  sub_23306EF84(v2, 0, 0, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t dispatch thunk of NetworkingExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for NetworkingExtensionConfiguration()
{
  return &type metadata for NetworkingExtensionConfiguration;
}

uint64_t dispatch thunk of _NetworkingExtension._request(capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of _NetworkingExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_2330736AC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2330736B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2330736C4()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_2330736D0()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_2330736DC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2330736E8()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_2330736F4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_233073700()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_23307370C()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_233073718()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_233073724()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_233073730()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23307373C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_233073748()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_233073754()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_233073760()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23307376C()
{
  return MEMORY[0x24BDB7248]();
}

uint64_t sub_233073778()
{
  return MEMORY[0x24BDB7250]();
}

uint64_t sub_233073784()
{
  return MEMORY[0x24BDB7258]();
}

uint64_t sub_233073790()
{
  return MEMORY[0x24BDB7260]();
}

uint64_t sub_23307379C()
{
  return MEMORY[0x24BDB7268]();
}

uint64_t sub_2330737A8()
{
  return MEMORY[0x24BDB7270]();
}

uint64_t sub_2330737B4()
{
  return MEMORY[0x24BDC7710]();
}

uint64_t sub_2330737C0()
{
  return MEMORY[0x24BDC7718]();
}

uint64_t sub_2330737CC()
{
  return MEMORY[0x24BDC7720]();
}

uint64_t sub_2330737D8()
{
  return MEMORY[0x24BDC7728]();
}

uint64_t sub_2330737E4()
{
  return MEMORY[0x24BDC7730]();
}

uint64_t sub_2330737F0()
{
  return MEMORY[0x24BDC7740]();
}

uint64_t sub_2330737FC()
{
  return MEMORY[0x24BDC7748]();
}

uint64_t sub_233073808()
{
  return MEMORY[0x24BDC7758]();
}

uint64_t sub_233073814()
{
  return MEMORY[0x24BDC7760]();
}

uint64_t sub_233073820()
{
  return MEMORY[0x24BDC7768]();
}

uint64_t sub_23307382C()
{
  return MEMORY[0x24BDC7770]();
}

uint64_t sub_233073838()
{
  return MEMORY[0x24BDC7780]();
}

uint64_t sub_233073844()
{
  return MEMORY[0x24BDC7788]();
}

uint64_t sub_233073850()
{
  return MEMORY[0x24BDC77B8]();
}

uint64_t sub_23307385C()
{
  return MEMORY[0x24BDC77C8]();
}

uint64_t sub_233073868()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_233073874()
{
  return MEMORY[0x24BDC7940]();
}

uint64_t sub_233073880()
{
  return MEMORY[0x24BEE6210]();
}

uint64_t sub_23307388C()
{
  return MEMORY[0x24BEE6260]();
}

uint64_t sub_233073898()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t sub_2330738A4()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2330738B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2330738BC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2330738C8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2330738D4()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_2330738E0()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_2330738EC()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_2330738F8()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_233073904()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_233073910()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23307391C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_233073928()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_233073934()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_233073940()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_23307394C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_233073958()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_233073964()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_233073970()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23307397C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_233073988()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_233073994()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2330739A0()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2330739AC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2330739B8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2330739C4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2330739D0()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2330739DC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2330739E8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2330739F4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_233073A00()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_233073A0C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_233073A18()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_233073A24()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_233073A30()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_233073A3C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_233073A48()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_233073A54()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_233073A60()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_233073A6C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_233073A78()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_233073A84()
{
  return MEMORY[0x24BDD04F8]();
}

uint64_t sub_233073A90()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_233073A9C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_233073AA8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_233073AB4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_233073AC0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_233073ACC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_233073AD8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_233073AE4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_233073AF0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_233073AFC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_233073B08()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_233073B14()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_233073B20()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_233073B2C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_233073B38()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_233073B44()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_233073B50()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_233073B5C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_233073B68()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_233073B74()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_233073B80()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_233073B8C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_233073B98()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_233073BA4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_233073BB0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_233073BBC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_233073BC8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_233073BD4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_233073BE0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t sandbox_enable_local_state_flag()
{
  return MEMORY[0x24BDAFBF8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

